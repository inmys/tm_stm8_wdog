;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
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
__sdcc_gs_init_startup:
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
;	main.c: 41: switch (tmr) {
	ld	a, (0x03, sp)
	cp	a, #0x00
	jreq	00101$
	ld	a, (0x03, sp)
	dec	a
	jreq	00102$
	ld	a, (0x03, sp)
	cp	a, #0x02
	jreq	00103$
	ld	a, (0x03, sp)
	cp	a, #0x03
	jreq	00104$
	ret
;	main.c: 42: case 0:
00101$:
;	main.c: 43: SysCntrl.Timer_0 = value;
	ldw	x, #(_SysCntrl + 0)
	ldw	y, (0x04, sp)
	ldw	(x), y
;	main.c: 44: break;
	ret
;	main.c: 45: case 1:
00102$:
;	main.c: 46: SysCntrl.Timer_1 = value;
	ldw	x, #(_SysCntrl + 2)
	ldw	y, (0x04, sp)
	ldw	(x), y
;	main.c: 47: break;
	ret
;	main.c: 48: case 2:
00103$:
;	main.c: 49: SysCntrl.Timer_2 = value;
	ldw	x, #(_SysCntrl + 4)
	ldw	y, (0x04, sp)
	ldw	(x), y
;	main.c: 50: break;
	ret
;	main.c: 51: case 3:
00104$:
;	main.c: 52: SysCntrl.Timer_3 = value;
	ldw	x, #(_SysCntrl + 6)
	ldw	y, (0x04, sp)
	ldw	(x), y
;	main.c: 54: }
;	main.c: 56: }
	ret
;	main.c: 58: void tick(enum event_t ev)
;	-----------------------------------------
;	 function tick
;	-----------------------------------------
_tick:
	push	a
;	main.c: 61: switch (SysCntrl.state) {
	ld	a, _SysCntrl+10
	ld	xl, a
	cp	a, #0x07
	jrule	00186$
	jp	00129$
00186$:
;	main.c: 93: if( ev == timer_2){
	ld	a, (0x04, sp)
	sub	a, #0x03
	jrne	00188$
	inc	a
	ld	(0x01, sp), a
	.byte 0xc5
00188$:
	clr	(0x01, sp)
00189$:
;	main.c: 137: if (ev == timer_0){
	ld	a, (0x04, sp)
	dec	a
	jrne	00191$
	ld	a, #0x01
	.byte 0x21
00191$:
	clr	a
00192$:
;	main.c: 61: switch (SysCntrl.state) {
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
;	main.c: 62: case WAIT_PWR_BTN:
00101$:
;	main.c: 63: if (ev == start) {
	tnz	(0x04, sp)
	jrne	00103$
;	main.c: 65: SetTimer(3, TIMER_1_SEC);
	push	#0x64
	push	#0x00
	push	#0x03
	call	_SetTimer
	addw	sp, #3
00103$:
;	main.c: 68: if ( ev == timer_3){
	ld	a, (0x04, sp)
	cp	a, #0x04
	jrne	00105$
;	main.c: 69: GPIO_ToggleBits(LED_PWR);
	push	#0x01
	push	#0x0f
	push	#0x50
	call	_GPIO_ToggleBits
	addw	sp, #3
;	main.c: 70: SetTimer(3, TIMER_1_SEC);
	push	#0x64
	push	#0x00
	push	#0x03
	call	_SetTimer
	addw	sp, #3
00105$:
;	main.c: 72: if (ev == pwrbtn_on) {
	ld	a, (0x04, sp)
	cp	a, #0x05
	jreq	00200$
	jp	00129$
00200$:
;	main.c: 73: GPIO_SetBits(LED_PWR);
	push	#0x01
	push	#0x0f
	push	#0x50
	call	_GPIO_SetBits
	addw	sp, #3
;	main.c: 75: GPIO_SetBits(ENABLE_5V);
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_SetBits
	addw	sp, #3
;	main.c: 76: GPIO_SetBits(RESET_CPU);
	push	#0x80
	push	#0x05
	push	#0x50
	call	_GPIO_SetBits
	addw	sp, #3
;	main.c: 77: SetTimer(1, TIMER_500_MS);
	push	#0x32
	push	#0x00
	push	#0x01
	call	_SetTimer
	addw	sp, #3
;	main.c: 78: SetTimer(0, TIMER_500_MS);
	push	#0x32
	push	#0x00
	push	#0x00
	call	_SetTimer
	addw	sp, #3
;	main.c: 80: SetTimer(2, TIMER_100_MS);
	push	#0x0a
	push	#0x00
	push	#0x02
	call	_SetTimer
	addw	sp, #3
;	main.c: 81: SysCntrl.state = WAIT_PGOOD;
	mov	_SysCntrl+10, #0x02
;	main.c: 83: break;
	jp	00129$
;	main.c: 84: case WAIT_PGOOD:
00108$:
;	main.c: 93: if( ev == timer_2){
	tnz	(0x01, sp)
	jrne	00201$
	jp	00129$
00201$:
;	main.c: 94: GPIO_ResetBits(LED_GOOD);
	push	#0x08
	push	#0x00
	push	#0x50
	call	_GPIO_ResetBits
	addw	sp, #3
;	main.c: 95: GPIO_SetBits(PG_SMARC);
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_SetBits
	addw	sp, #3
;	main.c: 96: SetTimer(2, TIMER_100_MS);
	push	#0x0a
	push	#0x00
	push	#0x02
	call	_SetTimer
	addw	sp, #3
;	main.c: 97: SysCntrl.state = WAIT_CARRIER_ON;
	mov	_SysCntrl+10, #0x03
;	main.c: 106: break;
	jp	00129$
;	main.c: 107: case WAIT_CARRIER_ON:
00111$:
;	main.c: 114: if( ev == timer_2){
	tnz	(0x01, sp)
	jrne	00202$
	jp	00129$
00202$:
;	main.c: 115: GPIO_SetBits(ENABLE_DCDC);
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_SetBits
	addw	sp, #3
;	main.c: 116: SetTimer(2, TIMER_100_MS);
	push	#0x0a
	push	#0x00
	push	#0x02
	call	_SetTimer
	addw	sp, #3
;	main.c: 117: SysCntrl.state = CPU_START;
	mov	_SysCntrl+10, #0x05
;	main.c: 119: break;
	jp	00129$
;	main.c: 120: case CPU_START:
00114$:
;	main.c: 121: if (ev == timer_2){
	tnz	(0x01, sp)
	jrne	00203$
	jp	00129$
00203$:
;	main.c: 122: GPIO_SetBits(POWER_CPU);
	push	#0x40
	push	#0x05
	push	#0x50
	call	_GPIO_SetBits
	addw	sp, #3
;	main.c: 123: GPIO_SetBits(LED_PWR);
	push	#0x01
	push	#0x0f
	push	#0x50
	call	_GPIO_SetBits
	addw	sp, #3
;	main.c: 124: SetTimer(2, TIMER_100_MS);
	push	#0x0a
	push	#0x00
	push	#0x02
	call	_SetTimer
	addw	sp, #3
;	main.c: 125: SysCntrl.state = CPU_NO_RST;
	mov	_SysCntrl+10, #0x06
;	main.c: 127: break;
	jp	00129$
;	main.c: 128: case CPU_NO_RST:
00117$:
;	main.c: 129: if (ev == timer_2){
	tnz	(0x01, sp)
	jrne	00204$
	jp	00129$
00204$:
;	main.c: 130: GPIO_ResetBits(RESET_CPU);
	push	#0x80
	push	#0x05
	push	#0x50
	call	_GPIO_ResetBits
	addw	sp, #3
;	main.c: 131: GPIO_SetBits(LED_PWR);
	push	#0x01
	push	#0x0f
	push	#0x50
	call	_GPIO_SetBits
	addw	sp, #3
;	main.c: 132: SetTimer(0, TIMER_1_SEC);
	push	#0x64
	push	#0x00
	push	#0x00
	call	_SetTimer
	addw	sp, #3
;	main.c: 133: SysCntrl.state = WORK_STATE;
	mov	_SysCntrl+10, #0x07
;	main.c: 135: break;
	jra	00129$
;	main.c: 136: case WORK_STATE:
00120$:
;	main.c: 137: if (ev == timer_0){
	tnz	a
	jreq	00122$
;	main.c: 138: GPIO_ToggleBits(LED_GOOD);
	push	#0x08
	push	#0x00
	push	#0x50
	call	_GPIO_ToggleBits
	addw	sp, #3
;	main.c: 139: SetTimer(0, TIMER_1_SEC);
	push	#0x64
	push	#0x00
	push	#0x00
	call	_SetTimer
	addw	sp, #3
00122$:
;	main.c: 142: if (ev == pwrbtn_off){
	ld	a, (0x04, sp)
	cp	a, #0x06
	jrne	00129$
;	main.c: 143: GPIO_ResetBits(POWER_CPU);
	push	#0x40
	push	#0x05
	push	#0x50
	call	_GPIO_ResetBits
	addw	sp, #3
;	main.c: 144: GPIO_ResetBits(ENABLE_DCDC);
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_ResetBits
	addw	sp, #3
;	main.c: 145: GPIO_ResetBits(ENABLE_5V);
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_ResetBits
	addw	sp, #3
;	main.c: 146: GPIO_ResetBits(PG_SMARC);
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_ResetBits
	addw	sp, #3
;	main.c: 147: GPIO_SetBits(LED_GOOD);
	push	#0x08
	push	#0x00
	push	#0x50
	call	_GPIO_SetBits
	addw	sp, #3
;	main.c: 148: SysCntrl.state = WAIT_PWR_BTN;
	mov	_SysCntrl+10, #0x00
;	main.c: 149: tick(start);
	push	#0x00
	call	_tick
	pop	a
;	main.c: 151: break;
	jra	00129$
;	main.c: 152: case PWR_ERROR:
00125$:
;	main.c: 153: if ( ev == timer_0){
	tnz	a
	jreq	00129$
;	main.c: 154: GPIO_ToggleBits(LED_PWR);
	push	#0x01
	push	#0x0f
	push	#0x50
	call	_GPIO_ToggleBits
	addw	sp, #3
;	main.c: 155: SetTimer(0, TIMER_100_MS);
	push	#0x0a
	push	#0x00
	push	#0x00
	call	_SetTimer
	addw	sp, #3
;	main.c: 158: }
00129$:
;	main.c: 159: }
	pop	a
	ret
;	main.c: 161: void ReadInputGpio() {
;	-----------------------------------------
;	 function ReadInputGpio
;	-----------------------------------------
_ReadInputGpio:
	sub	sp, #6
;	main.c: 163: SysCntrl.btn_state = GPIO_ReadInputDataBit(PWR_BTN);
	ldw	x, #(_SysCntrl + 0)+12
	ldw	(0x01, sp), x
	push	#0x04
	push	#0x00
	push	#0x50
	call	_GPIO_ReadInputDataBit
	addw	sp, #3
	ld	(0x03, sp), a
	ldw	x, (0x01, sp)
	ld	a, (0x03, sp)
	ld	(x), a
;	main.c: 164: SysCntrl.btn_change_time = SysCntrl.Timer;
	ldw	x, #(_SysCntrl + 0)+15
	ldw	(0x04, sp), x
	ldw	x, _SysCntrl+8
	ldw	y, (0x04, sp)
	ldw	(y), x
;	main.c: 166: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
	ldw	x, (0x01, sp)
	ld	a, (x)
	ld	(0x06, sp), a
	ldw	x, #(_SysCntrl + 0)+11
	ld	a, (x)
;	main.c: 168: SysCntrl.btn_last_change = SysCntrl.btn_change_time;
	ldw	y, #(_SysCntrl + 0)+13
;	main.c: 166: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
	cp	a, (0x03, sp)
	jreq	00102$
;	main.c: 167: SysCntrl.btn_state_prev = SysCntrl.btn_state;
	ld	a, (0x06, sp)
	ld	(x), a
;	main.c: 168: SysCntrl.btn_last_change = SysCntrl.btn_change_time;
	ldw	x, (0x04, sp)
	ldw	x, (x)
	ldw	(y), x
00102$:
	ldw	x, (0x04, sp)
	ldw	x, (x)
;	main.c: 171: if (SysCntrl.btn_change_time - SysCntrl.btn_last_change >= TIMER_2_SEC){
	ldw	y, (y)
	ldw	(0x05, sp), y
	subw	x, (0x05, sp)
	cpw	x, #0x00c8
	jrc	00110$
;	main.c: 172: if (SysCntrl.btn_state == RESET){
	ldw	x, (0x01, sp)
	ld	a, (x)
	jrne	00111$
;	main.c: 173: tick(pwrbtn_off);
	push	#0x06
	call	_tick
	pop	a
	jra	00111$
00110$:
;	main.c: 177: if (SysCntrl.btn_change_time - SysCntrl.btn_last_change >= TIMER_50_MS)
	cpw	x, #0x0005
	jrc	00111$
;	main.c: 179: if (SysCntrl.btn_state == RESET){
	ldw	x, (0x01, sp)
	ld	a, (x)
	jrne	00111$
;	main.c: 180: tick(pwrbtn_on);
	push	#0x05
	call	_tick
	pop	a
00111$:
;	main.c: 186: if( GPIO_ReadInputDataBit(PG_5V) ){
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_ReadInputDataBit
	addw	sp, #3
	tnz	a
	jreq	00113$
;	main.c: 187: tick(pgood_5v);
	push	#0x07
	call	_tick
	pop	a
00113$:
;	main.c: 190: if( GPIO_ReadInputDataBit(CARRIER_PWR_ON) ){
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_ReadInputDataBit
	addw	sp, #3
	tnz	a
	jreq	00116$
;	main.c: 191: tick(carrier);
	push	#0x08
	call	_tick
	pop	a
00116$:
;	main.c: 214: }
	addw	sp, #6
	ret
;	main.c: 217: void TimerMatch()
;	-----------------------------------------
;	 function TimerMatch
;	-----------------------------------------
_TimerMatch:
	sub	sp, #2
;	main.c: 219: if (!bMainTimer) {
	tnz	_bMainTimer+0
;	main.c: 220: return;
	jreq	00119$
;	main.c: 222: bMainTimer = 0;
	clr	_bMainTimer+0
;	main.c: 223: SysCntrl.Timer++;
	ldw	y, #(_SysCntrl + 0)+8
	ldw	x, y
	ldw	x, (x)
	incw	x
	ldw	(y), x
;	main.c: 225: if (SysCntrl.Timer_0) {
	ldw	x, _SysCntrl+0
	tnzw	x
	jreq	00106$
;	main.c: 226: SysCntrl.Timer_0--;
	decw	x
	ldw	_SysCntrl+0, x
;	main.c: 227: if (!SysCntrl.Timer_0) {
	tnzw	x
	jrne	00106$
;	main.c: 228: tick(timer_0);
	push	#0x01
	call	_tick
	pop	a
00106$:
;	main.c: 231: if (SysCntrl.Timer_1) {
	ldw	x, #(_SysCntrl + 0)+2
	ldw	(0x01, sp), x
	ldw	x, (x)
	jreq	00110$
;	main.c: 232: SysCntrl.Timer_1--;
	decw	x
	ldw	y, (0x01, sp)
	ldw	(y), x
;	main.c: 233: if (!SysCntrl.Timer_1) {
	tnzw	x
	jrne	00110$
;	main.c: 234: tick(timer_1);
	push	#0x02
	call	_tick
	pop	a
00110$:
;	main.c: 237: if (SysCntrl.Timer_2) {
	ldw	y, #(_SysCntrl + 0)+4
	ldw	x, y
	ldw	x, (x)
	jreq	00114$
;	main.c: 238: SysCntrl.Timer_2--;
	decw	x
	ldw	(y), x
;	main.c: 239: if (!SysCntrl.Timer_2) {
	tnzw	x
	jrne	00114$
;	main.c: 240: tick(timer_2);
	push	#0x03
	call	_tick
	pop	a
00114$:
;	main.c: 243: if (SysCntrl.Timer_3) {
	ldw	y, #(_SysCntrl + 0)+6
	ldw	x, y
	ldw	x, (x)
	jreq	00119$
;	main.c: 244: SysCntrl.Timer_3--;
	decw	x
	ldw	(0x01, sp), x
	ldw	x, y
	ldw	y, (0x01, sp)
	ldw	(x), y
;	main.c: 245: if (!SysCntrl.Timer_3) {
	ldw	x, (0x01, sp)
	jrne	00119$
;	main.c: 246: tick(timer_3);
	push	#0x04
	call	_tick
	pop	a
00119$:
;	main.c: 249: }
	addw	sp, #2
	ret
;	main.c: 261: INTERRUPT_HANDLER(IRQ_Handler_TIM4, 25)
;	-----------------------------------------
;	 function IRQ_Handler_TIM4
;	-----------------------------------------
_IRQ_Handler_TIM4:
	clr	a
	div	x, a
;	main.c: 263: bMainTimer = 1;
	mov	_bMainTimer+0, #0x01
;	main.c: 265: TIM4_ClearITPendingBit(TIM4_IT_Update);
	push	#0x01
	call	_TIM4_ClearITPendingBit
	pop	a
;	main.c: 266: }
	iret
;	main.c: 268: int main( void )
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 270: disableInterrupts();
	sim;	
;	main.c: 272: GPIO_DeInit(GPIOA);
	push	#0x00
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	main.c: 273: GPIO_DeInit(GPIOB);
	push	#0x05
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	main.c: 274: GPIO_DeInit(GPIOC);
	push	#0x0a
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	main.c: 275: GPIO_DeInit(GPIOD);
	push	#0x0f
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	main.c: 277: GPIO_Init(LED_GOOD, GPIO_Mode_Out_PP_High_Fast);
	push	#0xf0
	push	#0x08
	push	#0x00
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 278: GPIO_Init(LED_PWR, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	push	#0x01
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 279: GPIO_Init(ENABLE_DCDC, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	push	#0x02
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 280: GPIO_Init(ENABLE_5V, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	push	#0x04
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 281: GPIO_Init(PG_SMARC, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	push	#0x08
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 282: GPIO_Init(POWER_CPU, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	push	#0x40
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 283: GPIO_Init(RESET_CPU, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	push	#0x80
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 284: GPIO_Init(WDOG_OUT, GPIO_Mode_Out_PP_Low_Fast);
	push	#0xe0
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 286: GPIO_Init(PWR_BTN, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	push	#0x04
	push	#0x00
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 287: GPIO_Init(PG_5V, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	push	#0x10
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 288: GPIO_Init(CARRIER_PWR_ON, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	push	#0x20
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 289: GPIO_Init(WDOG_IN, GPIO_Mode_In_PU_No_IT);
	push	#0x40
	push	#0x01
	push	#0x05
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 293: CLK_DeInit();
	call	_CLK_DeInit
;	main.c: 294: CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	push	#0x00
	call	_CLK_SYSCLKDivConfig
	pop	a
;	main.c: 295: CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
	push	#0x01
	push	#0x02
	call	_CLK_PeripheralClockConfig
	addw	sp, #2
;	main.c: 296: CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	push	#0x01
	push	#0x05
	call	_CLK_PeripheralClockConfig
	addw	sp, #2
;	main.c: 298: TIM4_DeInit();
	call	_TIM4_DeInit
;	main.c: 304: TIM4_Cmd(DISABLE); 
	push	#0x00
	call	_TIM4_Cmd
	pop	a
;	main.c: 305: TIM4_TimeBaseInit(TIM4_Prescaler_1024, 156);
	push	#0x9c
	push	#0x0a
	call	_TIM4_TimeBaseInit
	addw	sp, #2
;	main.c: 306: TIM4_ClearFlag(TIM4_FLAG_Update);
	push	#0x01
	call	_TIM4_ClearFlag
	pop	a
;	main.c: 307: TIM4_ITConfig(TIM4_IT_Update, ENABLE);
	push	#0x01
	push	#0x01
	call	_TIM4_ITConfig
	addw	sp, #2
;	main.c: 308: TIM4_Cmd(ENABLE);       // let's go
	push	#0x01
	call	_TIM4_Cmd
	pop	a
;	main.c: 309: enableInterrupts();
	rim;	
;	main.c: 312: bMainTimer = 0;
	clr	_bMainTimer+0
;	main.c: 314: SysCntrl.btn_state = SET;
	ldw	x, #(_SysCntrl + 0)+12
	ld	a, #0x01
	ld	(x), a
;	main.c: 315: SysCntrl.btn_state_prev = SET;
	ldw	x, #(_SysCntrl + 0)+11
	ld	a, #0x01
	ld	(x), a
;	main.c: 316: SysCntrl.btn_change_time = 0;
	ldw	x, #(_SysCntrl + 0)+15
	clr	(0x1, x)
	clr	(x)
;	main.c: 317: SysCntrl.btn_last_change = 0;
	ldw	x, #(_SysCntrl + 0)+13
	clr	(0x1, x)
	clr	(x)
;	main.c: 319: tick(start);
	push	#0x00
	call	_tick
	pop	a
;	main.c: 320: while (1) {
00102$:
;	main.c: 321: ReadInputGpio();
	call	_ReadInputGpio
;	main.c: 322: TimerMatch();
	call	_TimerMatch
	jra	00102$
;	main.c: 326: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
