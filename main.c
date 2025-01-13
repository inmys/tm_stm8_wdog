#include "stm8l.h"
#include "stm8l_gpio.h"
#include "stm8l_clk.h"
#include "stm8l_tim4.h"
#include "stm8l_usart.h"
#include "stdio.h"

#include "general.h"


#define PUTCHAR_PROTOTYPE int putchar (int c)

enum state_t { WAIT_PWR_BTN,  POWER_ON_5V, WAIT_PGOOD, WAIT_CARRIER_ON, PWR_ERROR, CPU_START, CPU_NO_RST, CHECK_BOOTMODE, WORK_STATE };
enum event_t { start, timer_0, timer_1, timer_2, pwrbtn_on, pwrbtn_off, pgood_5v, carrier, cpu_bootrom };

volatile unsigned char bMainTimer;
struct SysCntrl_t {
	unsigned int Timer_0;
	unsigned int Timer_1;
	unsigned int Timer_2;
	unsigned int Timer;

	enum state_t state;

	uint8_t btn_state_prev;
	uint8_t btn_state;
	unsigned int btn_last_change;
	unsigned int btn_change_time;
	unsigned int btn_press_time;
	uint8_t btn_is_released;
	uint8_t bootmode;

	uint8_t InputReg;
	uint8_t fwstate; 
	uint8_t motoren;

} SysCntrl;

void SetTimer(uint8_t tmr, unsigned int value)
{
	switch (tmr) {
	case 0:
		SysCntrl.Timer_0 = value;
		break;
	case 1:
		SysCntrl.Timer_1 = value;
		break;
	case 2:
		SysCntrl.Timer_2 = value;
		break;
	}
}

void tick(enum event_t ev)
{
	switch (SysCntrl.state) {
	case WAIT_PWR_BTN:
		if (ev == start) {
			SetTimer(1, TIMER_1_SEC);
		}

		if ( ev == timer_1){
			GPIO_ToggleBits(LED_PWR);
			SetTimer(1, TIMER_1_SEC);
		}
		if (ev == cpu_bootrom){
			GPIO_SetBits(SMARC_BOOTMODE);
			SysCntrl.bootmode = 1;

			SetTimer(2, TIMER_1_SEC);
		}
		if( ev == timer_2){
			tick(pwrbtn_on);
		}
		if (ev == pwrbtn_on) {
			GPIO_SetBits(LED_PWR);
			GPIO_SetBits(ENABLE_5V); // delay between ENABLE_5V and POWER_CPU should be < 200ms
			GPIO_SetBits(RESET_CPU);

			SetTimer(0, TIMER_500_MS);
			
			SetTimer(2, TIMER_50_MS);
			SysCntrl.state = WAIT_PGOOD;
		}
		break;
	case WAIT_PGOOD:

		if( ev == timer_2){
			GPIO_ResetBits(LED_GOOD);
			GPIO_SetBits(PG_SMARC);
			SetTimer(2, TIMER_50_MS);
			SysCntrl.state = WAIT_CARRIER_ON;
		}
		
		break;
	case WAIT_CARRIER_ON:

		if( ev == timer_2){
			GPIO_SetBits(ENABLE_DCDC);
			SetTimer(2, TIMER_50_MS);
			SysCntrl.state = CPU_START;
		}
		break;
	case CPU_START:
		if (ev == timer_2){
			GPIO_SetBits(POWER_CPU); // delay between ENABLE_5V and POWER_CPU should be < 200ms
			GPIO_SetBits(LED_PWR);
			SetTimer(2, TIMER_50_MS); 
			SysCntrl.state = CPU_NO_RST;
		}
		break;
	case CPU_NO_RST:
		if (ev == timer_2){
			GPIO_ResetBits(RESET_CPU);
			GPIO_SetBits(LED_PWR);
			SetTimer(2, TIMER_50_MS);
			SysCntrl.state = WORK_STATE;
		}
		break;
	case CHECK_BOOTMODE:
		if (ev == timer_2){
			if(SysCntrl.bootmode == 1){
				GPIO_ResetBits(SMARC_BOOTMODE);
				SysCntrl.bootmode = 0;
			}

			SetTimer(0, TIMER_50_MS);
			SysCntrl.state = WORK_STATE;
		}


	
	case WORK_STATE:
		if (ev == timer_0){
			GPIO_ToggleBits(LED_GOOD);
			SetTimer(0, TIMER_1_SEC);
		}	

		if (ev == pwrbtn_off){
			GPIO_ResetBits(POWER_CPU);
			GPIO_ResetBits(ENABLE_DCDC);
			GPIO_ResetBits(ENABLE_5V);
			GPIO_ResetBits(PG_SMARC);
			GPIO_ResetBits(SMARC_BOOTMODE);
			GPIO_SetBits(LED_GOOD);
			SysCntrl.state = WAIT_PWR_BTN;
			tick(start);
		}
		break;
	case PWR_ERROR:
		if ( ev == timer_0){
			GPIO_ToggleBits(LED_PWR);
			SetTimer(0, TIMER_100_MS);
		}
		break;
	}
}
void BtnAction(unsigned int press_time){
	if(SysCntrl.state == WAIT_PWR_BTN){
	    if (SysCntrl.btn_press_time >= TIMER_2_SEC){
			tick(cpu_bootrom);
			return;
		}
		if (SysCntrl.btn_press_time >= TIMER_50_MS){
			tick(pwrbtn_on);
			return;
		}
	}
	if(SysCntrl.state == WORK_STATE){
		if (SysCntrl.btn_press_time >= TIMER_2_SEC){
			tick(pwrbtn_off);
			return;
		}
	}	
}

void ReadInputGpio() {
  	uint8_t bt = 0;
	SysCntrl.btn_state = GPIO_ReadInputDataBit(PWR_BTN);
	SysCntrl.btn_change_time = SysCntrl.Timer;

	if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
		SysCntrl.btn_state_prev = SysCntrl.btn_state;
		if(SysCntrl.btn_state != RESET){
			SysCntrl.btn_is_released = 1;
			SysCntrl.btn_press_time = SysCntrl.btn_change_time - SysCntrl.btn_last_change;
		}
		SysCntrl.btn_last_change = SysCntrl.btn_change_time;
	}

	if (SysCntrl.btn_is_released == 1){
		BtnAction(SysCntrl.btn_press_time);
		SysCntrl.btn_is_released = 0;
	}

	if( GPIO_ReadInputDataBit(PG_5V) ){
		tick(pgood_5v);
	}

	if( GPIO_ReadInputDataBit(CARRIER_PWR_ON) ){
		tick(carrier);
	}

}

void TimerMatch()
{
	if (!bMainTimer) {
		return;
	}
	bMainTimer = 0;
	SysCntrl.Timer++;

	//LED_PWR
	if (SysCntrl.Timer_0) { 
		SysCntrl.Timer_0--;
		if (!SysCntrl.Timer_0) {
			tick(timer_0);
		}
	}

	//PWR_BTN
	if (SysCntrl.Timer_1) { 
		SysCntrl.Timer_1--;
		if (!SysCntrl.Timer_1) {
			tick(timer_1);
		}
	}

	//system start
	if (SysCntrl.Timer_2) {
		SysCntrl.Timer_2--;
		if (!SysCntrl.Timer_2) {
			tick(timer_2);
		}
	}
}



INTERRUPT_HANDLER(IRQ_Handler_TIM4, 25)
{
	bMainTimer = 1;
	TIM4_ClearITPendingBit(TIM4_IT_Update);
}

int main( void )
{
	disableInterrupts();
	// ---------   GPIO Config ---------------------------
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);

	GPIO_Init(LED_GOOD, GPIO_Mode_Out_PP_High_Fast);
	GPIO_Init(LED_PWR, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(ENABLE_DCDC, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(ENABLE_5V, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(PG_SMARC, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(POWER_CPU, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(RESET_CPU, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(WDOG_OUT, GPIO_Mode_Out_PP_Low_Fast);

	GPIO_Init(PWR_BTN, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(PG_5V, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(CARRIER_PWR_ON, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(WDOG_IN, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(SMARC_BOOTMODE, GPIO_Mode_Out_PP_Low_Fast);


	
	// ---------- CLK Config -----------------------
	CLK_DeInit();
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	// ---------- TIM4 Init -----------------------------
	TIM4_DeInit();

	TIM4_Cmd(DISABLE); 
	TIM4_TimeBaseInit(TIM4_Prescaler_1024, 156);
    TIM4_ClearFlag(TIM4_FLAG_Update);
	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
    TIM4_Cmd(ENABLE);       // let's go
	enableInterrupts();

	//timers
	bMainTimer = 0;
	SysCntrl.btn_state = SET;
	SysCntrl.btn_state_prev = SET;
	SysCntrl.btn_change_time = 0;
	SysCntrl.btn_last_change = 0;

	tick(pwrbtn_on);
	while (1) {
		ReadInputGpio();
		TimerMatch();

	}

}


