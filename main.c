#include "stm8l.h"
#include "stm8l_gpio.h"
#include "stm8l_clk.h"
#include "stm8l_tim4.h"
#include "stm8l_usart.h"
#include "stdio.h"

#define PWR_BTN_PORT GPIOA
#define PWR_BTN_PIN GPIO_Pin_2

#define LED_GOOD_PORT GPIOA
#define LED_GOOD_PIN GPIO_Pin_3

#define WDOG_IN_PORT GPIOB
#define WDOG_IN_PIN GPIO_Pin_0

#define WDOG_OUT_PORT GPIOC
#define WDOG_OUT_PIN GPIO_Pin_4

#define ENABLE_DCDC_PORT GPIOB
#define ENABLE_DCDC_PIN GPIO_Pin_1

#define ENABLE_5V_PORT GPIOB
#define ENABLE_5V_PIN GPIO_Pin_2

#define PG_SMARC_PORT GPIOB
#define PG_SMARC_PIN GPIO_Pin_3

#define PG_5V_PORT GPIOB
#define PG_5V_PIN GPIO_Pin_4

#define CARRIER_PWR_ON_PORT GPIOB
#define CARRIER_PWR_ON_PIN GPIO_Pin_5

#define POWER_CPU_PORT GPIOB
#define POWER_CPU_PIN GPIO_Pin_6

#define RESET_CPU_PORT GPIOB
#define RESET_CPU_PIN GPIO_Pin_7



#define TIM4_PERIOD 124

#define PUTCHAR_PROTOTYPE int putchar (int c)

void set_bit_in_state(uint8_t bit_num, BitStatus status, uint8_t *state);
volatile uint16_t count;
uint8_t i;

INTERRUPT_HANDLER(IRQ_Handler_TIM4, 25)
{
	if (count)
		count--;

	TIM4_ClearITPendingBit(TIM4_IT_Update);
}

void delay_ms(uint16_t ms)
{
        TIM4_Cmd(DISABLE);       // stop

        TIM4_TimeBaseInit(TIM4_Prescaler_128, TIM4_PERIOD);
        TIM4_ClearFlag(TIM4_FLAG_Update);
        TIM4_ITConfig(TIM4_IT_Update, ENABLE);

        count = ms;

        TIM4_Cmd(ENABLE);       // let's go

 	while(count);
}

int main( void )
{
	uint8_t state_byte = 0,rcv_byte;
	BitStatus pin_status;
	// ---------   GPIO Config ---------------------------
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);

	GPIO_Init(LED_GOOD_PORT, LED_GOOD_PIN, GPIO_Mode_Out_PP_Low_Fast);

	GPIO_Init(ENABLE_5V_PORT, ENABLE_5V_PIN, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(ENABLE_DCDC_PORT, ENABLE_DCDC_PIN, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(POWER_CPU_PORT, POWER_CPU_PIN, GPIO_Mode_Out_PP_Low_Fast);

	GPIO_Init(PG_5V_PORT, PG_5V_PIN, GPIO_Mode_In_PU_No_IT);

//	GPIO_ResetBits(LED_GOOD_PORT, LED_GOOD_PIN); // enable led
	GPIO_SetBits(LED_GOOD_PORT, LED_GOOD_PIN); // enable led


	// ---------- CLK Config -----------------------
	CLK_DeInit();
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);


//	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	// ---------- TIM4 Init -----------------------------
	TIM4_DeInit();

	// ---------- USART Init ---------------------------
//	USART_DeInit(USART1);
//
//  	USART_Init(USART1, (uint32_t)9600, USART_WordLength_8b, USART_StopBits_1,
//                   USART_Parity_No, (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
//
	enableInterrupts();

	/* reset -> power -> */
	GPIO_SetBits(RESET_CPU_PORT, RESET_CPU_PIN); // cpu in reset
	delay_ms(10);
	GPIO_SetBits(ENABLE_5V_PORT, ENABLE_5V_PIN); // en
	delay_ms(10);
	GPIO_SetBits(ENABLE_DCDC_PORT, ENABLE_DCDC_PIN); // en
	delay_ms(10);
	GPIO_SetBits(POWER_CPU_PORT, POWER_CPU_PIN); // en
	delay_ms(10);
	GPIO_ResetBits(RESET_CPU_PORT, RESET_CPU_PIN); // cpu no reset



	while(1) {
		GPIO_ResetBits(LED_GOOD_PORT, LED_GOOD_PIN);
		delay_ms(500);
		GPIO_SetBits(LED_GOOD_PORT, LED_GOOD_PIN);
		delay_ms(500);
	}

#if 0
	while(1)
  	{
//    	if (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == SET){
//			rcv_byte = USART_ReceiveData8(USART1);
//			state_byte = rcv_byte;
//		}
//
//		if( ((state_byte>>7)&1) ){
//			GPIO_ResetBits(LED_GOOD_PORT, LED_GOOD_PIN);
//		}
//		else{
//			GPIO_SetBits(LED_GOOD_PORT, LED_GOOD_PIN);
//		}
//		if( (state_byte>>6)&1 ){
//			GPIO_ResetBits(LED_BAD_PORT, LED_BAD_PIN);
//		}
//		else{
//			GPIO_SetBits(LED_BAD_PORT, LED_BAD_PIN);
//		}
//		if( ((state_byte>>5)&1) ){
//			GPIO_SetBits(PRSNT_PORT, PRSNT_PIN);
//		}
//		else{
//			GPIO_ResetBits(PRSNT_PORT, PRSNT_PIN);
//		}

		pin_status = GPIO_ReadInputDataBit(PG5V_PORT, PG5V_PIN);
		//printf("IDLED: %x\r\n", pin_status);
		set_bit_in_state(0,pin_status, &state_byte);
		
		pin_status = GPIO_ReadInputDataBit(RESET_MOD_PORT, RESET_MOD_PIN);
		//printf("RESET: %x\r\n", pin_status);
		set_bit_in_state(1, pin_status, &state_byte);
		
		pin_status = GPIO_ReadInputDataBit(BOOT0_PORT, BOOT0_PIN);
		//printf("BOOT0: %x\r\n", pin_status);
		set_bit_in_state(2, pin_status, &state_byte);
		
		pin_status = GPIO_ReadInputDataBit(BOOT1_PORT, BOOT1_PIN);
		//printf("BOOT1: %x\r\n", pin_status);
		set_bit_in_state(3, pin_status, &state_byte);

		pin_status = GPIO_ReadInputDataBit(PRSNT_PORT, PRSNT_PIN);
		set_bit_in_state(5, pin_status, &state_byte);
		pin_status = GPIO_ReadInputDataBit(LED_BAD_PORT, LED_BAD_PIN);
		set_bit_in_state(6, pin_status?0:1, &state_byte);
		pin_status = GPIO_ReadInputDataBit(LED_GOOD_PORT, LED_GOOD_PIN);
		set_bit_in_state(7, pin_status?0:1, &state_byte);

		//printf("State: %x/%c\r\n", state_byte);

		if (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == SET) {
			USART_SendData8(USART1, state_byte);
			/* Loop until the end of transmission */
			while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
		}
	}
#endif

}

void set_bit_in_state(uint8_t bit_num, BitStatus status, uint8_t *state){
	if (status){
		(*state) |= (1<<bit_num); 
	}else{
		(*state) &= ~(1<<bit_num);
	}
}
//
//PUTCHAR_PROTOTYPE
//{
//	/* Write a character to the USART */
//	USART_SendData8(USART1, c);
//	/* Loop until the end of transmission */
//  	while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
//
//  	//return (c);
//}
