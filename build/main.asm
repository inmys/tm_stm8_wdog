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
	.ds 20
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
;	main.c: 38: void SetTimer(uint8_t tmr, unsigned int value)
;	-----------------------------------------
;	 function SetTimer
;	-----------------------------------------
_SetTimer:
;	main.c: 40: switch (tmr) {
	cp	a, #0x00
	jreq	00101$
	cp	a, #0x01
	jreq	00102$
	cp	a, #0x02
	jreq	00103$
	ret
;	main.c: 41: case 0:
00101$:
;	main.c: 42: SysCntrl.Timer_0 = value;
	ldw	_SysCntrl+0, x
;	main.c: 43: break;
	ret
;	main.c: 44: case 1:
00102$:
;	main.c: 45: SysCntrl.Timer_1 = value;
	ldw	_SysCntrl+2, x
;	main.c: 46: break;
	ret
;	main.c: 47: case 2:
00103$:
;	main.c: 48: SysCntrl.Timer_2 = value;
	ldw	_SysCntrl+4, x
;	main.c: 50: }
;	main.c: 51: }
	ret
;	main.c: 53: void tick(enum event_t ev)
;	-----------------------------------------
;	 function tick
;	-----------------------------------------
_tick:
	sub	sp, #2
	ld	(0x02, sp), a
;	main.c: 55: switch (SysCntrl.state) {
	ld	a, _SysCntrl+8
	ld	xl, a
	cp	a, #0x07
	jrule	00186$
	jp	00129$
00186$:
;	main.c: 77: if( ev == timer_2){
	ld	a, (0x02, sp)
	sub	a, #0x03
	jrne	00188$
	inc	a
	ld	(0x01, sp), a
	.byte 0xc5
00188$:
	clr	(0x01, sp)
00189$:
;	main.c: 110: if (ev == timer_0){
	ld	a, (0x02, sp)
	dec	a
	jrne	00191$
	ld	a, #0x01
	.byte 0x21
00191$:
	clr	a
00192$:
;	main.c: 55: switch (SysCntrl.state) {
	rlwa	x
	clr	a
	rrwa	x
	sllw	x
	ldw	x, (#00193$, x)
	jp	(x)
00193$:
	.dw	#00101$
	.dw	#00129$
	.dw	#00108$
	.dw	#00111$
	.dw	#00125$
	.dw	#00114$
	.dw	#00117$
	.dw	#00120$
;	main.c: 56: case WAIT_PWR_BTN:
00101$:
;	main.c: 57: if (ev == start) {
	tnz	(0x02, sp)
	jrne	00103$
;	main.c: 58: SetTimer(1, TIMER_1_SEC);
	ldw	x, #0x0064
	ld	a, #0x01
	call	_SetTimer
00103$:
;	main.c: 61: if ( ev == timer_1){
	ld	a, (0x02, sp)
;	main.c: 62: GPIO_ToggleBits(LED_PWR);
	sub	a, #0x02
	jrne	00105$
	inc	a
	ldw	x, #0x500f
	call	_GPIO_ToggleBits
;	main.c: 63: SetTimer(1, TIMER_1_SEC);
	ldw	x, #0x0064
	ld	a, #0x01
	call	_SetTimer
00105$:
;	main.c: 65: if (ev == pwrbtn_on) {
	ld	a, (0x02, sp)
	cp	a, #0x04
	jreq	00200$
	jp	00129$
00200$:
;	main.c: 66: GPIO_SetBits(LED_PWR);
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_SetBits
;	main.c: 67: GPIO_SetBits(ENABLE_5V);
	ld	a, #0x04
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 68: GPIO_SetBits(RESET_CPU);
	ld	a, #0x80
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 69: SetTimer(0, TIMER_500_MS);
	ldw	x, #0x0032
	clr	a
	call	_SetTimer
;	main.c: 71: SetTimer(2, TIMER_50_MS);
	ldw	x, #0x0005
	ld	a, #0x02
	call	_SetTimer
;	main.c: 72: SysCntrl.state = WAIT_PGOOD;
	mov	_SysCntrl+8, #0x02
;	main.c: 74: break;
	jp	00129$
;	main.c: 75: case WAIT_PGOOD:
00108$:
;	main.c: 77: if( ev == timer_2){
	tnz	(0x01, sp)
	jrne	00201$
	jp	00129$
00201$:
;	main.c: 78: GPIO_ResetBits(LED_GOOD);
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ResetBits
;	main.c: 79: GPIO_SetBits(PG_SMARC);
	ld	a, #0x08
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 80: SetTimer(2, TIMER_50_MS);
	ldw	x, #0x0005
	ld	a, #0x02
	call	_SetTimer
;	main.c: 81: SysCntrl.state = WAIT_CARRIER_ON;
	mov	_SysCntrl+8, #0x03
;	main.c: 84: break;
	jp	00129$
;	main.c: 85: case WAIT_CARRIER_ON:
00111$:
;	main.c: 87: if( ev == timer_2){
	tnz	(0x01, sp)
	jrne	00202$
	jp	00129$
00202$:
;	main.c: 88: GPIO_SetBits(ENABLE_DCDC);
	ld	a, #0x02
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 89: SetTimer(2, TIMER_50_MS);
	ldw	x, #0x0005
	ld	a, #0x02
	call	_SetTimer
;	main.c: 90: SysCntrl.state = CPU_START;
	mov	_SysCntrl+8, #0x05
;	main.c: 92: break;
	jp	00129$
;	main.c: 93: case CPU_START:
00114$:
;	main.c: 94: if (ev == timer_2){
	tnz	(0x01, sp)
	jrne	00203$
	jp	00129$
00203$:
;	main.c: 95: GPIO_SetBits(POWER_CPU);
	ld	a, #0x40
	ldw	x, #0x5005
	call	_GPIO_SetBits
;	main.c: 96: GPIO_SetBits(LED_PWR);
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_SetBits
;	main.c: 97: SetTimer(2, TIMER_50_MS);
	ldw	x, #0x0005
	ld	a, #0x02
	call	_SetTimer
;	main.c: 98: SysCntrl.state = CPU_NO_RST;
	mov	_SysCntrl+8, #0x06
;	main.c: 100: break;
	jp	00129$
;	main.c: 101: case CPU_NO_RST:
00117$:
;	main.c: 102: if (ev == timer_2){
	tnz	(0x01, sp)
	jreq	00129$
;	main.c: 103: GPIO_ResetBits(RESET_CPU);
	ld	a, #0x80
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 104: GPIO_SetBits(LED_PWR);
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_SetBits
;	main.c: 105: SetTimer(0, TIMER_1_SEC);
	ldw	x, #0x0064
	clr	a
	call	_SetTimer
;	main.c: 106: SysCntrl.state = WORK_STATE;
	mov	_SysCntrl+8, #0x07
;	main.c: 108: break;
	jra	00129$
;	main.c: 109: case WORK_STATE:
00120$:
;	main.c: 110: if (ev == timer_0){
	tnz	a
	jreq	00122$
;	main.c: 111: GPIO_ToggleBits(LED_GOOD);
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_ToggleBits
;	main.c: 112: SetTimer(0, TIMER_1_SEC);
	ldw	x, #0x0064
	clr	a
	call	_SetTimer
00122$:
;	main.c: 115: if (ev == pwrbtn_off){
	ld	a, (0x02, sp)
	cp	a, #0x05
	jrne	00129$
;	main.c: 116: GPIO_ResetBits(POWER_CPU);
	ld	a, #0x40
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 117: GPIO_ResetBits(ENABLE_DCDC);
	ld	a, #0x02
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 118: GPIO_ResetBits(ENABLE_5V);
	ld	a, #0x04
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 119: GPIO_ResetBits(PG_SMARC);
	ld	a, #0x08
	ldw	x, #0x5005
	call	_GPIO_ResetBits
;	main.c: 120: GPIO_SetBits(LED_GOOD);
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_SetBits
;	main.c: 121: SysCntrl.state = WAIT_PWR_BTN;
	mov	_SysCntrl+8, #0x00
;	main.c: 122: tick(start);
	clr	a
	addw	sp, #2
;	main.c: 124: break;
	jp	_tick
;	main.c: 125: case PWR_ERROR:
00125$:
;	main.c: 126: if ( ev == timer_0){
	tnz	a
	jreq	00129$
;	main.c: 127: GPIO_ToggleBits(LED_PWR);
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_ToggleBits
;	main.c: 128: SetTimer(0, TIMER_100_MS);
	ldw	x, #0x000a
	clr	a
	addw	sp, #2
	jp	_SetTimer
;	main.c: 131: }
00129$:
;	main.c: 132: }
	addw	sp, #2
	ret
;	main.c: 134: void ReadInputGpio() {
;	-----------------------------------------
;	 function ReadInputGpio
;	-----------------------------------------
_ReadInputGpio:
	sub	sp, #2
;	main.c: 136: SysCntrl.btn_state = GPIO_ReadInputDataBit(PWR_BTN);
	ld	a, #0x04
	ldw	x, #0x5000
	call	_GPIO_ReadInputDataBit
	ld	(0x02, sp), a
	ldw	x, #(_SysCntrl+10)
	ld	a, (0x02, sp)
	ld	(x), a
;	main.c: 137: SysCntrl.btn_change_time = SysCntrl.Timer;
	ldw	x, _SysCntrl+6
	ldw	_SysCntrl+13, x
;	main.c: 139: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
	ld	a, _SysCntrl+10
	ld	yl, a
	ldw	x, #(_SysCntrl+0)+9
	ld	a, (x)
;	main.c: 141: SysCntrl.btn_last_change = SysCntrl.btn_change_time;
;	main.c: 139: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
	cp	a, (0x02, sp)
	jreq	00102$
;	main.c: 140: SysCntrl.btn_state_prev = SysCntrl.btn_state;
	ld	a, yl
	ld	(x), a
;	main.c: 141: SysCntrl.btn_last_change = SysCntrl.btn_change_time;
	ldw	x, _SysCntrl+13
	ldw	_SysCntrl+11, x
00102$:
	ldw	y, _SysCntrl+13
;	main.c: 144: if (SysCntrl.btn_change_time - SysCntrl.btn_last_change >= TIMER_2_SEC){
	ldw	x, _SysCntrl+11
	ldw	(0x01, sp), x
	ldw	x, y
	subw	x, (0x01, sp)
	cpw	x, #0x00c8
	jrc	00110$
;	main.c: 145: if (SysCntrl.btn_state == RESET){
	ld	a, _SysCntrl+10
	jrne	00111$
;	main.c: 146: tick(pwrbtn_off);
	ld	a, #0x05
	call	_tick
	jra	00111$
00110$:
;	main.c: 150: if (SysCntrl.btn_change_time - SysCntrl.btn_last_change >= TIMER_50_MS)
	cpw	x, #0x0005
	jrc	00111$
;	main.c: 152: if (SysCntrl.btn_state == RESET){
	ld	a, _SysCntrl+10
	jrne	00111$
;	main.c: 153: tick(pwrbtn_on);
	ld	a, #0x04
	call	_tick
00111$:
;	main.c: 159: if( GPIO_ReadInputDataBit(PG_5V) ){
	ld	a, #0x10
	ldw	x, #0x5005
	call	_GPIO_ReadInputDataBit
	tnz	a
	jreq	00113$
;	main.c: 160: tick(pgood_5v);
	ld	a, #0x06
	call	_tick
00113$:
;	main.c: 163: if( GPIO_ReadInputDataBit(CARRIER_PWR_ON) ){
	ld	a, #0x20
	ldw	x, #0x5005
	call	_GPIO_ReadInputDataBit
	tnz	a
	jreq	00116$
;	main.c: 164: tick(carrier);
	ld	a, #0x07
	addw	sp, #2
	jp	_tick
00116$:
;	main.c: 167: }
	addw	sp, #2
	ret
;	main.c: 170: void TimerMatch()
;	-----------------------------------------
;	 function TimerMatch
;	-----------------------------------------
_TimerMatch:
;	main.c: 172: if (!bMainTimer) {
	ld	a, _bMainTimer+0
	jrne	00102$
;	main.c: 173: return;
	ret
00102$:
;	main.c: 175: bMainTimer = 0;
	clr	_bMainTimer+0
;	main.c: 176: SysCntrl.Timer++;
	ldw	x, _SysCntrl+6
	incw	x
	ldw	_SysCntrl+6, x
;	main.c: 179: if (SysCntrl.Timer_0) { 
	ldw	x, _SysCntrl+0
	tnzw	x
	jreq	00106$
;	main.c: 180: SysCntrl.Timer_0--;
	decw	x
	ldw	_SysCntrl+0, x
;	main.c: 181: if (!SysCntrl.Timer_0) {
	tnzw	x
	jrne	00106$
;	main.c: 182: tick(timer_0);
	ld	a, #0x01
	call	_tick
00106$:
;	main.c: 187: if (SysCntrl.Timer_1) { 
	ldw	x, _SysCntrl+2
	tnzw	x
	jreq	00110$
;	main.c: 188: SysCntrl.Timer_1--;
	decw	x
	ldw	_SysCntrl+2, x
;	main.c: 189: if (!SysCntrl.Timer_1) {
	tnzw	x
	jrne	00110$
;	main.c: 190: tick(timer_1);
	ld	a, #0x02
	call	_tick
00110$:
;	main.c: 195: if (SysCntrl.Timer_2) {
	ldw	x, _SysCntrl+4
	tnzw	x
	jrne	00157$
	ret
00157$:
;	main.c: 196: SysCntrl.Timer_2--;
	decw	x
	ldw	_SysCntrl+4, x
;	main.c: 197: if (!SysCntrl.Timer_2) {
	tnzw	x
	jreq	00158$
	ret
00158$:
;	main.c: 198: tick(timer_2);
	ld	a, #0x03
;	main.c: 201: }
	jp	_tick
;	main.c: 205: INTERRUPT_HANDLER(IRQ_Handler_TIM4, 25)
;	-----------------------------------------
;	 function IRQ_Handler_TIM4
;	-----------------------------------------
_IRQ_Handler_TIM4:
	clr	a
	div	x, a
;	main.c: 207: bMainTimer = 1;
	mov	_bMainTimer+0, #0x01
;	main.c: 208: TIM4_ClearITPendingBit(TIM4_IT_Update);
	ld	a, #0x01
	call	_TIM4_ClearITPendingBit
;	main.c: 209: }
	iret
;	main.c: 211: int main( void )
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 213: disableInterrupts();
	sim;	
;	main.c: 215: GPIO_DeInit(GPIOA);
	ldw	x, #0x5000
	call	_GPIO_DeInit
;	main.c: 216: GPIO_DeInit(GPIOB);
	ldw	x, #0x5005
	call	_GPIO_DeInit
;	main.c: 217: GPIO_DeInit(GPIOC);
	ldw	x, #0x500a
	call	_GPIO_DeInit
;	main.c: 218: GPIO_DeInit(GPIOD);
	ldw	x, #0x500f
	call	_GPIO_DeInit
;	main.c: 220: GPIO_Init(LED_GOOD, GPIO_Mode_Out_PP_High_Fast);
	push	#0xf0
	ld	a, #0x08
	ldw	x, #0x5000
	call	_GPIO_Init
;	main.c: 221: GPIO_Init(LED_PWR, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x01
	ldw	x, #0x500f
	call	_GPIO_Init
;	main.c: 222: GPIO_Init(ENABLE_DCDC, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x02
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 223: GPIO_Init(ENABLE_5V, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x04
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 224: GPIO_Init(PG_SMARC, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x08
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 225: GPIO_Init(POWER_CPU, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x40
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 226: GPIO_Init(RESET_CPU, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x80
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 227: GPIO_Init(WDOG_OUT, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	ld	a, #0x10
	ldw	x, #0x500a
	call	_GPIO_Init
;	main.c: 229: GPIO_Init(PWR_BTN, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	ld	a, #0x04
	ldw	x, #0x5000
	call	_GPIO_Init
;	main.c: 230: GPIO_Init(PG_5V, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	ld	a, #0x10
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 231: GPIO_Init(CARRIER_PWR_ON, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	ld	a, #0x20
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 232: GPIO_Init(WDOG_IN, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	ld	a, #0x01
	ldw	x, #0x5005
	call	_GPIO_Init
;	main.c: 236: CLK_DeInit();
	call	_CLK_DeInit
;	main.c: 237: CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	clr	a
	call	_CLK_SYSCLKDivConfig
;	main.c: 238: CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
	push	#0x01
	ld	a, #0x02
	call	_CLK_PeripheralClockConfig
;	main.c: 239: CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	push	#0x01
	ld	a, #0x05
	call	_CLK_PeripheralClockConfig
;	main.c: 241: TIM4_DeInit();
	call	_TIM4_DeInit
;	main.c: 243: TIM4_Cmd(DISABLE); 
	clr	a
	call	_TIM4_Cmd
;	main.c: 244: TIM4_TimeBaseInit(TIM4_Prescaler_1024, 156);
	push	#0x9c
	ld	a, #0x0a
	call	_TIM4_TimeBaseInit
;	main.c: 245: TIM4_ClearFlag(TIM4_FLAG_Update);
	ld	a, #0x01
	call	_TIM4_ClearFlag
;	main.c: 246: TIM4_ITConfig(TIM4_IT_Update, ENABLE);
	push	#0x01
	ld	a, #0x01
	call	_TIM4_ITConfig
;	main.c: 247: TIM4_Cmd(ENABLE);       // let's go
	ld	a, #0x01
	call	_TIM4_Cmd
;	main.c: 248: enableInterrupts();
	rim;	
;	main.c: 251: bMainTimer = 0;
	clr	_bMainTimer+0
;	main.c: 252: SysCntrl.btn_state = SET;
	mov	_SysCntrl+10, #0x01
;	main.c: 253: SysCntrl.btn_state_prev = SET;
	mov	_SysCntrl+9, #0x01
;	main.c: 254: SysCntrl.btn_change_time = 0;
	ldw	x, #(_SysCntrl+13)
	clr	(0x1, x)
	clr	(x)
;	main.c: 255: SysCntrl.btn_last_change = 0;
	ldw	x, #(_SysCntrl+11)
	clr	(0x1, x)
	clr	(x)
;	main.c: 257: tick(start);
	clr	a
	call	_tick
;	main.c: 258: while (1) {
00102$:
;	main.c: 259: ReadInputGpio();
	call	_ReadInputGpio
;	main.c: 260: TimerMatch();
	call	_TimerMatch
	jra	00102$
;	main.c: 264: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
