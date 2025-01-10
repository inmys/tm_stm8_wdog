;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _IRQ_Handler_TIM4
	.globl _TimerMatch
	.globl _ReadInputGpio
	.globl _BtnAction
	.globl _tick
	.globl _SetTimer
	.globl _TIM4_ClearITPendingBit
	.globl _TIM4_ClearFlag
	.globl _TIM4_ITConfig
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _TIM4_DeInit
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_SYSCLKDivConfig
	.globl _CLK_DeInit
	.globl _GPIO_ReadInputDataBit
	.globl _GPIO_ToggleBits
	.globl _GPIO_ResetBits
	.globl _GPIO_SetBits
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _SysCntrl
	.globl _bMainTimer
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_bMainTimer::
	.ds 1
_SysCntrl::
	.ds 22
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int 0x000000 ; trap
	int 0x000000 ; int0
	int 0x000000 ; int1
	int 0x000000 ; int2
	int 0x000000 ; int3
	int 0x000000 ; int4
	int 0x000000 ; int5
	int 0x000000 ; int6
	int 0x000000 ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int 0x000000 ; int10
	int 0x000000 ; int11
	int 0x000000 ; int12
	int 0x000000 ; int13
	int 0x000000 ; int14
	int 0x000000 ; int15
	int 0x000000 ; int16
	int 0x000000 ; int17
	int 0x000000 ; int18
	int 0x000000 ; int19
	int 0x000000 ; int20
	int 0x000000 ; int21
	int 0x000000 ; int22
	int 0x000000 ; int23
	int 0x000000 ; int24
	int _IRQ_Handler_TIM4 ; int25
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 39: void SetTimer(uint8_t tmr, unsigned int value)
;	-----------------------------------------
;	 function SetTimer
;	-----------------------------------------
_SetTimer:
;	main.c: 41: switch (tmr) {
	cp	a, #0x00
	jreq	00101$
	cp	a, #0x01
	jreq	00102$
	cp	a, #0x02
	jreq	00103$
	ret
;	main.c: 42: case 0:
00101$:
;	main.c: 43: SysCntrl.Timer_0 = value;
	ldw	_SysCntrl+0, x
;	main.c: 44: break;
	ret
;	main.c: 45: case 1:
00102$:
;	main.c: 46: SysCntrl.Timer_1 = value;
	ldw	_SysCntrl+2, x
;	main.c: 47: break;
	ret
;	main.c: 48: case 2:
00103$:
;	main.c: 49: SysCntrl.Timer_2 = value;
	ldw	_SysCntrl+4, x
;	main.c: 51: }
;	main.c: 52: }
	ret
;	main.c: 54: void tick(enum event_t ev)
;	-----------------------------------------
;	 function tick
;	-----------------------------------------
_tick:
	sub	sp, #3
	ld	(0x03, sp), a
;	main.c: 56: switch (SysCntrl.state) {
	ld	a, _SysCntrl+8
	ld	xl, a
	cp	a, #0x08
	jrule	00215$
	jp	00138$
00215$:
;	main.c: 68: SysCntrl.bootmode = 1;
;	main.c: 72: if( ev == timer_2){
	ld	a, (0x03, sp)
	sub	a, #0x03
	jrne	00217$
	inc	a
	ld	(0x01, sp), a
	.byte 0xc5
00217$:
	clr	(0x01, sp)
00218$:
;	main.c: 134: if (ev == timer_0){
	ld	a, (0x03, sp)
	dec	a
	jrne	00220$
	ld	a, #0x01
	ld	(0x02, sp), a
	.byte 0xc5
00220$:
	clr	(0x02, sp)
00221$:
;	main.c: 56: switch (SysCntrl.state) {
	clr	a
	ld	xh, a
	sllw	x
	ldw	x, (#00222$, x)
	jp	(x)
00222$:
	.dw	#00101$
	.dw	#00138$
	.dw	#00112$
	.dw	#00115$
	.dw	#00134$
	.dw	#00118$
	.dw	#00121$
	.dw	#00124$
	.dw	#00129$
;	main.c: 57: case WAIT_PWR_BTN:
00101$:
;	main.c: 58: if (ev == start) {
	tnz	(0x03, sp)
	jrne	00103$
;	main.c: 59: SetTimer(1, TIMER_1_SEC);
	ldw	x, #0x0064
	ld	a, #0x01
	call	_SetTimer
00103$:
;	main.c: 62: if ( ev == timer_1){
	ld	a, (0x03, sp)
;	main.c: 63: GPIO_ToggleBits(LED_PWR);
	sub	a, #0x02
	jrne	00105$
	inc	a
	ldw	x, #0x500f
	call	_GPIO_ToggleBits
;	main.c: 64: SetTimer(1, TIMER_1_SEC);
	ldw	x, #0x0064
	ld	a, #0x01
	call	_SetTimer
00105$:
;	main.c: 66: if (ev == cpu_bootrom){
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrne	00107$
;	main.c: 67: GPIO_SetBits(SMARC_BOOTMODE);
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_SetBits
;	main.c: 68: SysCntrl.bootmode = 1;
	mov	_SysCntrl+18, #0x01
;	main.c: 70: SetTimer(2, TIMER_1_SEC);
	ldw	x, #0x0064
	ld	a, #0x02
	call	_SetTimer
00107$:
;	main.c: 72: if( ev == timer_2){
	tnz	(0x01, sp)
	jreq	00109$
;	main.c: 73: tick(pwrbtn_on);
	ld	a, #0x04
	call	_tick
00109$:
;	main.c: 75: if (ev == pwrbtn_on) {
	ld	a, (0x03, sp)
	cp	a, #0x04
	jreq	00233$
	jp	00138$
00233$:
;	main.c: 76: GPIO_SetBits(LED_PWR);
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_SetBits
;	main.c: 77: GPIO_SetBits(ENABLE_5V); // delay between ENABLE_5V and POWER_CPU should be < 200ms
	ld	a, #0x04
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 78: GPIO_SetBits(RESET_CPU);
	ld	a, #0x80
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 80: SetTimer(0, TIMER_500_MS);
	ldw	x, #0x0032
	clr	a
	call	_SetTimer
;	main.c: 82: SetTimer(2, TIMER_50_MS);
	ldw	x, #0x0005
	ld	a, #0x02
	call	_SetTimer
;	main.c: 83: SysCntrl.state = WAIT_PGOOD;
	mov	_SysCntrl+8, #0x02
;	main.c: 85: break;
	jp	00138$
;	main.c: 86: case WAIT_PGOOD:
00112$:
;	main.c: 88: if( ev == timer_2){
	tnz	(0x01, sp)
	jrne	00234$
	jp	00138$
00234$:
;	main.c: 89: GPIO_ResetBits(LED_GOOD);
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ResetBits
;	main.c: 90: GPIO_SetBits(PG_SMARC);
	ld	a, #0x08
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 91: SetTimer(2, TIMER_50_MS);
	ldw	x, #0x0005
	ld	a, #0x02
	call	_SetTimer
;	main.c: 92: SysCntrl.state = WAIT_CARRIER_ON;
	mov	_SysCntrl+8, #0x03
;	main.c: 95: break;
	jp	00138$
;	main.c: 96: case WAIT_CARRIER_ON:
00115$:
;	main.c: 98: if( ev == timer_2){
	tnz	(0x01, sp)
	jrne	00235$
	jp	00138$
00235$:
;	main.c: 99: GPIO_SetBits(ENABLE_DCDC);
	ld	a, #0x02
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 100: SetTimer(2, TIMER_50_MS);
	ldw	x, #0x0005
	ld	a, #0x02
	call	_SetTimer
;	main.c: 101: SysCntrl.state = CPU_START;
	mov	_SysCntrl+8, #0x05
;	main.c: 103: break;
	jp	00138$
;	main.c: 104: case CPU_START:
00118$:
;	main.c: 105: if (ev == timer_2){
	tnz	(0x01, sp)
	jrne	00236$
	jp	00138$
00236$:
;	main.c: 106: GPIO_SetBits(POWER_CPU); // delay between ENABLE_5V and POWER_CPU should be < 200ms
	ld	a, #0x40
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 107: GPIO_SetBits(LED_PWR);
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_SetBits
;	main.c: 108: SetTimer(2, TIMER_50_MS); 
	ldw	x, #0x0005
	ld	a, #0x02
	call	_SetTimer
;	main.c: 109: SysCntrl.state = CPU_NO_RST;
	mov	_SysCntrl+8, #0x06
;	main.c: 111: break;
	jp	00138$
;	main.c: 112: case CPU_NO_RST:
00121$:
;	main.c: 113: if (ev == timer_2){
	tnz	(0x01, sp)
	jrne	00237$
	jp	00138$
00237$:
;	main.c: 114: GPIO_ResetBits(RESET_CPU);
	ld	a, #0x80
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 115: GPIO_SetBits(LED_PWR);
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_SetBits
;	main.c: 116: SetTimer(2, TIMER_50_MS);
	ldw	x, #0x0005
	ld	a, #0x02
	call	_SetTimer
;	main.c: 117: SysCntrl.state = WORK_STATE;
	mov	_SysCntrl+8, #0x08
;	main.c: 119: break;
	jp	00138$
;	main.c: 120: case CHECK_BOOTMODE:
00124$:
;	main.c: 121: if (ev == timer_2){
	tnz	(0x01, sp)
	jreq	00129$
;	main.c: 122: if(SysCntrl.bootmode == 1){
	ld	a, _SysCntrl+18
	dec	a
	jrne	00126$
;	main.c: 123: GPIO_ResetBits(SMARC_BOOTMODE);
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_ResetBits
;	main.c: 124: SysCntrl.bootmode = 0;
	mov	_SysCntrl+18, #0x00
00126$:
;	main.c: 127: SetTimer(0, TIMER_50_MS);
	ldw	x, #0x0005
	clr	a
	call	_SetTimer
;	main.c: 128: SysCntrl.state = WORK_STATE;
	mov	_SysCntrl+8, #0x08
;	main.c: 133: case WORK_STATE:
00129$:
;	main.c: 134: if (ev == timer_0){
	tnz	(0x02, sp)
	jreq	00131$
;	main.c: 135: GPIO_ToggleBits(LED_GOOD);
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ToggleBits
;	main.c: 136: SetTimer(0, TIMER_1_SEC);
	ldw	x, #0x0064
	clr	a
	call	_SetTimer
00131$:
;	main.c: 139: if (ev == pwrbtn_off){
	ld	a, (0x03, sp)
	cp	a, #0x05
	jrne	00138$
;	main.c: 140: GPIO_ResetBits(POWER_CPU);
	ld	a, #0x40
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 141: GPIO_ResetBits(ENABLE_DCDC);
	ld	a, #0x02
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 142: GPIO_ResetBits(ENABLE_5V);
	ld	a, #0x04
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 143: GPIO_ResetBits(PG_SMARC);
	ld	a, #0x08
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 144: GPIO_ResetBits(SMARC_BOOTMODE);
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_ResetBits
;	main.c: 145: GPIO_SetBits(LED_GOOD);
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_SetBits
;	main.c: 146: SysCntrl.state = WAIT_PWR_BTN;
	mov	_SysCntrl+8, #0x00
;	main.c: 147: tick(start);
	clr	a
	addw	sp, #3
;	main.c: 149: break;
	jp	_tick
;	main.c: 150: case PWR_ERROR:
00134$:
;	main.c: 151: if ( ev == timer_0){
	tnz	(0x02, sp)
	jreq	00138$
;	main.c: 152: GPIO_ToggleBits(LED_PWR);
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_ToggleBits
;	main.c: 153: SetTimer(0, TIMER_100_MS);
	ldw	x, #0x000a
	clr	a
	addw	sp, #3
	jp	_SetTimer
;	main.c: 156: }
00138$:
;	main.c: 157: }
	addw	sp, #3
	ret
;	main.c: 158: void BtnAction(unsigned int press_time){
;	-----------------------------------------
;	 function BtnAction
;	-----------------------------------------
_BtnAction:
;	main.c: 159: if(SysCntrl.state == WAIT_PWR_BTN){
;	main.c: 160: if (SysCntrl.btn_press_time >= TIMER_2_SEC){
;	main.c: 159: if(SysCntrl.state == WAIT_PWR_BTN){
	ld	a, _SysCntrl+8
	jrne	00106$
;	main.c: 160: if (SysCntrl.btn_press_time >= TIMER_2_SEC){
	ldw	x, _SysCntrl+15
	cpw	x, #0x00c8
	jrc	00102$
;	main.c: 161: tick(cpu_bootrom);
	ld	a, #0x08
;	main.c: 162: return;
	jp	_tick
00102$:
;	main.c: 164: if (SysCntrl.btn_press_time >= TIMER_50_MS){
	cpw	x, #0x0005
	jrc	00106$
;	main.c: 165: tick(pwrbtn_on);
	ld	a, #0x04
;	main.c: 166: return;
	jp	_tick
00106$:
;	main.c: 169: if(SysCntrl.state == WORK_STATE){
	cp	a, #0x08
	jreq	00143$
	ret
00143$:
;	main.c: 170: if (SysCntrl.btn_press_time >= TIMER_2_SEC){
	ldw	x, _SysCntrl+15
	cpw	x, #0x00c8
	jrnc	00144$
	ret
00144$:
;	main.c: 171: tick(pwrbtn_off);
	ld	a, #0x05
;	main.c: 172: return;
;	main.c: 175: }
	jp	_tick
;	main.c: 177: void ReadInputGpio() {
;	-----------------------------------------
;	 function ReadInputGpio
;	-----------------------------------------
_ReadInputGpio:
	sub	sp, #2
;	main.c: 179: SysCntrl.btn_state = GPIO_ReadInputDataBit(PWR_BTN);
	ld	a, #0x04
	ldw	x, #0x5000
	call	_GPIO_ReadInputDataBit
	ld	(0x02, sp), a
	ldw	x, #(_SysCntrl+10)
	ld	a, (0x02, sp)
	ld	(x), a
;	main.c: 180: SysCntrl.btn_change_time = SysCntrl.Timer;
	ldw	x, _SysCntrl+6
	ldw	_SysCntrl+13, x
;	main.c: 182: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
	ld	a, _SysCntrl+10
	ld	xl, a
	ld	a, _SysCntrl+9
;	main.c: 185: SysCntrl.btn_is_released = 1;
;	main.c: 186: SysCntrl.btn_press_time = SysCntrl.btn_change_time - SysCntrl.btn_last_change;
;	main.c: 182: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
	cp	a, (0x02, sp)
	jreq	00104$
;	main.c: 183: SysCntrl.btn_state_prev = SysCntrl.btn_state;
	ldw	y, #(_SysCntrl+9)
	ld	a, xl
	ld	(y), a
;	main.c: 184: if(SysCntrl.btn_state != RESET){
;	main.c: 186: SysCntrl.btn_press_time = SysCntrl.btn_change_time - SysCntrl.btn_last_change;
;	main.c: 184: if(SysCntrl.btn_state != RESET){
	ld	a, _SysCntrl+10
	jreq	00102$
;	main.c: 185: SysCntrl.btn_is_released = 1;
	mov	_SysCntrl+17, #0x01
;	main.c: 186: SysCntrl.btn_press_time = SysCntrl.btn_change_time - SysCntrl.btn_last_change;
	ldw	y, _SysCntrl+13
	ldw	x, _SysCntrl+11
	ldw	(0x01, sp), x
	subw	y, (0x01, sp)
	ldw	_SysCntrl+15, y
00102$:
;	main.c: 188: SysCntrl.btn_last_change = SysCntrl.btn_change_time;
	ldw	x, _SysCntrl+13
	ldw	_SysCntrl+11, x
00104$:
;	main.c: 191: if (SysCntrl.btn_is_released == 1){
	ld	a, _SysCntrl+17
	dec	a
	jrne	00106$
;	main.c: 192: BtnAction(SysCntrl.btn_press_time);
	ldw	x, _SysCntrl+15
	call	_BtnAction
;	main.c: 193: SysCntrl.btn_is_released = 0;
	mov	_SysCntrl+17, #0x00
00106$:
;	main.c: 196: if( GPIO_ReadInputDataBit(PG_5V) ){
	ld	a, #0x10
	ldw	x, #0x5005
	call	_GPIO_ReadInputDataBit
	tnz	a
	jreq	00108$
;	main.c: 197: tick(pgood_5v);
	ld	a, #0x06
	call	_tick
00108$:
;	main.c: 200: if( GPIO_ReadInputDataBit(CARRIER_PWR_ON) ){
	ld	a, #0x20
	ldw	x, #0x5005
	call	_GPIO_ReadInputDataBit
	tnz	a
	jreq	00111$
;	main.c: 201: tick(carrier);
	ld	a, #0x07
	addw	sp, #2
	jp	_tick
00111$:
;	main.c: 204: }
	addw	sp, #2
	ret
;	main.c: 206: void TimerMatch()
;	-----------------------------------------
;	 function TimerMatch
;	-----------------------------------------
_TimerMatch:
;	main.c: 208: if (!bMainTimer) {
	ld	a, _bMainTimer+0
	jrne	00102$
;	main.c: 209: return;
	ret
00102$:
;	main.c: 211: bMainTimer = 0;
	clr	_bMainTimer+0
;	main.c: 212: SysCntrl.Timer++;
	ldw	x, _SysCntrl+6
	incw	x
	ldw	_SysCntrl+6, x
;	main.c: 215: if (SysCntrl.Timer_0) { 
	ldw	x, _SysCntrl+0
	tnzw	x
	jreq	00106$
;	main.c: 216: SysCntrl.Timer_0--;
	decw	x
	ldw	_SysCntrl+0, x
;	main.c: 217: if (!SysCntrl.Timer_0) {
	tnzw	x
	jrne	00106$
;	main.c: 218: tick(timer_0);
	ld	a, #0x01
	call	_tick
00106$:
;	main.c: 223: if (SysCntrl.Timer_1) { 
	ldw	x, _SysCntrl+2
	tnzw	x
	jreq	00110$
;	main.c: 224: SysCntrl.Timer_1--;
	decw	x
	ldw	_SysCntrl+2, x
;	main.c: 225: if (!SysCntrl.Timer_1) {
	tnzw	x
	jrne	00110$
;	main.c: 226: tick(timer_1);
	ld	a, #0x02
	call	_tick
00110$:
;	main.c: 231: if (SysCntrl.Timer_2) {
	ldw	x, _SysCntrl+4
	tnzw	x
	jrne	00157$
	ret
00157$:
;	main.c: 232: SysCntrl.Timer_2--;
	decw	x
	ldw	_SysCntrl+4, x
;	main.c: 233: if (!SysCntrl.Timer_2) {
	tnzw	x
	jreq	00158$
	ret
00158$:
;	main.c: 234: tick(timer_2);
	ld	a, #0x03
;	main.c: 237: }
	jp	_tick
;	main.c: 241: INTERRUPT_HANDLER(IRQ_Handler_TIM4, 25)
;	-----------------------------------------
;	 function IRQ_Handler_TIM4
;	-----------------------------------------
_IRQ_Handler_TIM4:
	clr	a
	div	x, a
;	main.c: 243: bMainTimer = 1;
	mov	_bMainTimer+0, #0x01
;	main.c: 244: TIM4_ClearITPendingBit(TIM4_IT_Update);
	ld	a, #0x01
	call	_TIM4_ClearITPendingBit
;	main.c: 245: }
	iret
;	main.c: 247: int main( void )
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 249: disableInterrupts();
	sim;	
;	main.c: 251: GPIO_DeInit(GPIOA);
	ldw	x, #0x5000
	call	_GPIO_DeInit
;	main.c: 252: GPIO_DeInit(GPIOB);
	ldw	x, #0x5005
	call	_GPIO_DeInit
;	main.c: 253: GPIO_DeInit(GPIOC);
	ldw	x, #0x500a
	call	_GPIO_DeInit
;	main.c: 254: GPIO_DeInit(GPIOD);
	ldw	x, #0x500f
	call	_GPIO_DeInit
;	main.c: 256: GPIO_Init(LED_GOOD, GPIO_Mode_Out_PP_High_Fast);
	push	#0xf0
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_Init
;	main.c: 257: GPIO_Init(LED_PWR, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_Init
;	main.c: 258: GPIO_Init(ENABLE_DCDC, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x02
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 259: GPIO_Init(ENABLE_5V, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x04
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 260: GPIO_Init(PG_SMARC, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x08
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 261: GPIO_Init(POWER_CPU, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x40
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 262: GPIO_Init(RESET_CPU, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x80
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 263: GPIO_Init(WDOG_OUT, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x10
	ldw	x, #0x500a
	call	_GPIO_Init
;	main.c: 265: GPIO_Init(PWR_BTN, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	ld	a, #0x04
	ldw	x, #0x5000
	call	_GPIO_Init
;	main.c: 266: GPIO_Init(PG_5V, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	ld	a, #0x10
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 267: GPIO_Init(CARRIER_PWR_ON, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	ld	a, #0x20
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 268: GPIO_Init(WDOG_IN, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	ld	a, #0x01
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 269: GPIO_Init(SMARC_BOOTMODE, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x20
	ldw	x, #0x500a
	call	_GPIO_Init
;	main.c: 274: CLK_DeInit();
	call	_CLK_DeInit
;	main.c: 275: CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	clr	a
	call	_CLK_SYSCLKDivConfig
;	main.c: 276: CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
	push	#0x01
	ld	a, #0x02
	call	_CLK_PeripheralClockConfig
;	main.c: 277: CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	push	#0x01
	ld	a, #0x05
	call	_CLK_PeripheralClockConfig
;	main.c: 279: TIM4_DeInit();
	call	_TIM4_DeInit
;	main.c: 281: TIM4_Cmd(DISABLE); 
	clr	a
	call	_TIM4_Cmd
;	main.c: 282: TIM4_TimeBaseInit(TIM4_Prescaler_1024, 156);
	push	#0x9c
	ld	a, #0x0a
	call	_TIM4_TimeBaseInit
;	main.c: 283: TIM4_ClearFlag(TIM4_FLAG_Update);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	main.c: 284: TIM4_ITConfig(TIM4_IT_Update, ENABLE);
	push	#0x01
	ld	a, #0x01
	call	_TIM4_ITConfig
;	main.c: 285: TIM4_Cmd(ENABLE);       // let's go
	ld	a, #0x01
	call	_TIM4_Cmd
;	main.c: 286: enableInterrupts();
	rim;	
;	main.c: 289: bMainTimer = 0;
	clr	_bMainTimer+0
;	main.c: 290: SysCntrl.btn_state = SET;
	mov	_SysCntrl+10, #0x01
;	main.c: 291: SysCntrl.btn_state_prev = SET;
	mov	_SysCntrl+9, #0x01
;	main.c: 292: SysCntrl.btn_change_time = 0;
	ldw	x, #(_SysCntrl+13)
	clr	(0x1, x)
	clr	(x)
;	main.c: 293: SysCntrl.btn_last_change = 0;
	ldw	x, #(_SysCntrl+11)
	clr	(0x1, x)
	clr	(x)
;	main.c: 295: tick(start);
	clr	a
	call	_tick
;	main.c: 296: while (1) {
00102$:
;	main.c: 297: ReadInputGpio();
	call	_ReadInputGpio
;	main.c: 298: TimerMatch();
	call	_TimerMatch
	jra	00102$
;	main.c: 302: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
