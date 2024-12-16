                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _IRQ_Handler_TIM4
                                     13 	.globl _TimerMatch
                                     14 	.globl _ReadInputGpio
                                     15 	.globl _tick
                                     16 	.globl _SetTimer
                                     17 	.globl _TIM4_ClearITPendingBit
                                     18 	.globl _TIM4_ClearFlag
                                     19 	.globl _TIM4_ITConfig
                                     20 	.globl _TIM4_Cmd
                                     21 	.globl _TIM4_TimeBaseInit
                                     22 	.globl _TIM4_DeInit
                                     23 	.globl _CLK_PeripheralClockConfig
                                     24 	.globl _CLK_SYSCLKDivConfig
                                     25 	.globl _CLK_DeInit
                                     26 	.globl _GPIO_ReadInputDataBit
                                     27 	.globl _GPIO_ToggleBits
                                     28 	.globl _GPIO_ResetBits
                                     29 	.globl _GPIO_SetBits
                                     30 	.globl _GPIO_Init
                                     31 	.globl _GPIO_DeInit
                                     32 	.globl _SysCntrl
                                     33 	.globl _bMainTimer
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DATA
      000001                         38 _bMainTimer::
      000001                         39 	.ds 1
      000002                         40 _SysCntrl::
      000002                         41 	.ds 20
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area INITIALIZED
                                     46 ;--------------------------------------------------------
                                     47 ; Stack segment in internal ram
                                     48 ;--------------------------------------------------------
                                     49 	.area	SSEG
      000016                         50 __start__stack:
      000016                         51 	.ds	1
                                     52 
                                     53 ;--------------------------------------------------------
                                     54 ; absolute external ram data
                                     55 ;--------------------------------------------------------
                                     56 	.area DABS (ABS)
                                     57 
                                     58 ; default segment ordering for linker
                                     59 	.area HOME
                                     60 	.area GSINIT
                                     61 	.area GSFINAL
                                     62 	.area CONST
                                     63 	.area INITIALIZER
                                     64 	.area CODE
                                     65 
                                     66 ;--------------------------------------------------------
                                     67 ; interrupt vector
                                     68 ;--------------------------------------------------------
                                     69 	.area HOME
      008000                         70 __interrupt_vect:
      008000 82 00 80 73             71 	int s_GSINIT ; reset
      008004 82 00 00 00             72 	int 0x000000 ; trap
      008008 82 00 00 00             73 	int 0x000000 ; int0
      00800C 82 00 00 00             74 	int 0x000000 ; int1
      008010 82 00 00 00             75 	int 0x000000 ; int2
      008014 82 00 00 00             76 	int 0x000000 ; int3
      008018 82 00 00 00             77 	int 0x000000 ; int4
      00801C 82 00 00 00             78 	int 0x000000 ; int5
      008020 82 00 00 00             79 	int 0x000000 ; int6
      008024 82 00 00 00             80 	int 0x000000 ; int7
      008028 82 00 00 00             81 	int 0x000000 ; int8
      00802C 82 00 00 00             82 	int 0x000000 ; int9
      008030 82 00 00 00             83 	int 0x000000 ; int10
      008034 82 00 00 00             84 	int 0x000000 ; int11
      008038 82 00 00 00             85 	int 0x000000 ; int12
      00803C 82 00 00 00             86 	int 0x000000 ; int13
      008040 82 00 00 00             87 	int 0x000000 ; int14
      008044 82 00 00 00             88 	int 0x000000 ; int15
      008048 82 00 00 00             89 	int 0x000000 ; int16
      00804C 82 00 00 00             90 	int 0x000000 ; int17
      008050 82 00 00 00             91 	int 0x000000 ; int18
      008054 82 00 00 00             92 	int 0x000000 ; int19
      008058 82 00 00 00             93 	int 0x000000 ; int20
      00805C 82 00 00 00             94 	int 0x000000 ; int21
      008060 82 00 00 00             95 	int 0x000000 ; int22
      008064 82 00 00 00             96 	int 0x000000 ; int23
      008068 82 00 00 00             97 	int 0x000000 ; int24
      00806C 82 00 82 F7             98 	int _IRQ_Handler_TIM4 ; int25
                                     99 ;--------------------------------------------------------
                                    100 ; global & static initialisations
                                    101 ;--------------------------------------------------------
                                    102 	.area HOME
                                    103 	.area GSINIT
                                    104 	.area GSFINAL
                                    105 	.area GSINIT
      008073                        106 __sdcc_init_data:
                                    107 ; stm8_genXINIT() start
      008073 AE 00 15         [ 2]  108 	ldw x, #l_DATA
      008076 27 07            [ 1]  109 	jreq	00002$
      008078                        110 00001$:
      008078 72 4F 00 00      [ 1]  111 	clr (s_DATA - 1, x)
      00807C 5A               [ 2]  112 	decw x
      00807D 26 F9            [ 1]  113 	jrne	00001$
      00807F                        114 00002$:
      00807F AE 00 00         [ 2]  115 	ldw	x, #l_INITIALIZER
      008082 27 09            [ 1]  116 	jreq	00004$
      008084                        117 00003$:
      008084 D6 80 94         [ 1]  118 	ld	a, (s_INITIALIZER - 1, x)
      008087 D7 00 15         [ 1]  119 	ld	(s_INITIALIZED - 1, x), a
      00808A 5A               [ 2]  120 	decw	x
      00808B 26 F7            [ 1]  121 	jrne	00003$
      00808D                        122 00004$:
                                    123 ; stm8_genXINIT() end
                                    124 	.area GSFINAL
      00808D CC 80 70         [ 2]  125 	jp	__sdcc_program_startup
                                    126 ;--------------------------------------------------------
                                    127 ; Home
                                    128 ;--------------------------------------------------------
                                    129 	.area HOME
                                    130 	.area HOME
      008070                        131 __sdcc_program_startup:
      008070 CC 83 03         [ 2]  132 	jp	_main
                                    133 ;	return from main will return to caller
                                    134 ;--------------------------------------------------------
                                    135 ; code
                                    136 ;--------------------------------------------------------
                                    137 	.area CODE
                                    138 ;	main.c: 38: void SetTimer(uint8_t tmr, unsigned int value)
                                    139 ;	-----------------------------------------
                                    140 ;	 function SetTimer
                                    141 ;	-----------------------------------------
      008095                        142 _SetTimer:
                                    143 ;	main.c: 40: switch (tmr) {
      008095 A1 00            [ 1]  144 	cp	a, #0x00
      008097 27 09            [ 1]  145 	jreq	00101$
      008099 A1 01            [ 1]  146 	cp	a, #0x01
      00809B 27 09            [ 1]  147 	jreq	00102$
      00809D A1 02            [ 1]  148 	cp	a, #0x02
      00809F 27 09            [ 1]  149 	jreq	00103$
      0080A1 81               [ 4]  150 	ret
                                    151 ;	main.c: 41: case 0:
      0080A2                        152 00101$:
                                    153 ;	main.c: 42: SysCntrl.Timer_0 = value;
      0080A2 CF 00 02         [ 2]  154 	ldw	_SysCntrl+0, x
                                    155 ;	main.c: 43: break;
      0080A5 81               [ 4]  156 	ret
                                    157 ;	main.c: 44: case 1:
      0080A6                        158 00102$:
                                    159 ;	main.c: 45: SysCntrl.Timer_1 = value;
      0080A6 CF 00 04         [ 2]  160 	ldw	_SysCntrl+2, x
                                    161 ;	main.c: 46: break;
      0080A9 81               [ 4]  162 	ret
                                    163 ;	main.c: 47: case 2:
      0080AA                        164 00103$:
                                    165 ;	main.c: 48: SysCntrl.Timer_2 = value;
      0080AA CF 00 06         [ 2]  166 	ldw	_SysCntrl+4, x
                                    167 ;	main.c: 50: }
                                    168 ;	main.c: 51: }
      0080AD 81               [ 4]  169 	ret
                                    170 ;	main.c: 53: void tick(enum event_t ev)
                                    171 ;	-----------------------------------------
                                    172 ;	 function tick
                                    173 ;	-----------------------------------------
      0080AE                        174 _tick:
      0080AE 52 02            [ 2]  175 	sub	sp, #2
      0080B0 6B 02            [ 1]  176 	ld	(0x02, sp), a
                                    177 ;	main.c: 55: switch (SysCntrl.state) {
      0080B2 C6 00 0A         [ 1]  178 	ld	a, _SysCntrl+8
      0080B5 97               [ 1]  179 	ld	xl, a
      0080B6 A1 07            [ 1]  180 	cp	a, #0x07
      0080B8 23 03            [ 2]  181 	jrule	00186$
      0080BA CC 82 2B         [ 2]  182 	jp	00129$
      0080BD                        183 00186$:
                                    184 ;	main.c: 77: if( ev == timer_2){
      0080BD 7B 02            [ 1]  185 	ld	a, (0x02, sp)
      0080BF A0 03            [ 1]  186 	sub	a, #0x03
      0080C1 26 04            [ 1]  187 	jrne	00188$
      0080C3 4C               [ 1]  188 	inc	a
      0080C4 6B 01            [ 1]  189 	ld	(0x01, sp), a
      0080C6 C5                     190 	.byte 0xc5
      0080C7                        191 00188$:
      0080C7 0F 01            [ 1]  192 	clr	(0x01, sp)
      0080C9                        193 00189$:
                                    194 ;	main.c: 110: if (ev == timer_0){
      0080C9 7B 02            [ 1]  195 	ld	a, (0x02, sp)
      0080CB 4A               [ 1]  196 	dec	a
      0080CC 26 03            [ 1]  197 	jrne	00191$
      0080CE A6 01            [ 1]  198 	ld	a, #0x01
      0080D0 21                     199 	.byte 0x21
      0080D1                        200 00191$:
      0080D1 4F               [ 1]  201 	clr	a
      0080D2                        202 00192$:
                                    203 ;	main.c: 55: switch (SysCntrl.state) {
      0080D2 02               [ 1]  204 	rlwa	x
      0080D3 4F               [ 1]  205 	clr	a
      0080D4 01               [ 1]  206 	rrwa	x
      0080D5 58               [ 2]  207 	sllw	x
      0080D6 DE 80 DA         [ 2]  208 	ldw	x, (#00193$, x)
      0080D9 FC               [ 2]  209 	jp	(x)
      0080DA                        210 00193$:
      0080DA 80 EA                  211 	.dw	#00101$
      0080DC 82 2B                  212 	.dw	#00129$
      0080DE 81 42                  213 	.dw	#00108$
      0080E0 81 68                  214 	.dw	#00111$
      0080E2 82 17                  215 	.dw	#00125$
      0080E4 81 86                  216 	.dw	#00114$
      0080E6 81 AC                  217 	.dw	#00117$
      0080E8 81 CD                  218 	.dw	#00120$
                                    219 ;	main.c: 56: case WAIT_PWR_BTN:
      0080EA                        220 00101$:
                                    221 ;	main.c: 57: if (ev == start) {
      0080EA 0D 02            [ 1]  222 	tnz	(0x02, sp)
      0080EC 26 08            [ 1]  223 	jrne	00103$
                                    224 ;	main.c: 58: SetTimer(1, TIMER_1_SEC);
      0080EE AE 00 64         [ 2]  225 	ldw	x, #0x0064
      0080F1 A6 01            [ 1]  226 	ld	a, #0x01
      0080F3 CD 80 95         [ 4]  227 	call	_SetTimer
      0080F6                        228 00103$:
                                    229 ;	main.c: 61: if ( ev == timer_1){
      0080F6 7B 02            [ 1]  230 	ld	a, (0x02, sp)
                                    231 ;	main.c: 62: GPIO_ToggleBits(LED_PWR);
      0080F8 A0 02            [ 1]  232 	sub	a, #0x02
      0080FA 26 0F            [ 1]  233 	jrne	00105$
      0080FC 4C               [ 1]  234 	inc	a
      0080FD AE 50 0F         [ 2]  235 	ldw	x, #0x500f
      008100 CD 84 BC         [ 4]  236 	call	_GPIO_ToggleBits
                                    237 ;	main.c: 63: SetTimer(1, TIMER_1_SEC);
      008103 AE 00 64         [ 2]  238 	ldw	x, #0x0064
      008106 A6 01            [ 1]  239 	ld	a, #0x01
      008108 CD 80 95         [ 4]  240 	call	_SetTimer
      00810B                        241 00105$:
                                    242 ;	main.c: 65: if (ev == pwrbtn_on) {
      00810B 7B 02            [ 1]  243 	ld	a, (0x02, sp)
      00810D A1 04            [ 1]  244 	cp	a, #0x04
      00810F 27 03            [ 1]  245 	jreq	00200$
      008111 CC 82 2B         [ 2]  246 	jp	00129$
      008114                        247 00200$:
                                    248 ;	main.c: 66: GPIO_SetBits(LED_PWR);
      008114 A6 01            [ 1]  249 	ld	a, #0x01
      008116 AE 50 0F         [ 2]  250 	ldw	x, #0x500f
      008119 CD 84 A7         [ 4]  251 	call	_GPIO_SetBits
                                    252 ;	main.c: 67: GPIO_SetBits(ENABLE_5V);
      00811C A6 04            [ 1]  253 	ld	a, #0x04
      00811E AE 50 05         [ 2]  254 	ldw	x, #0x5005
      008121 CD 84 A7         [ 4]  255 	call	_GPIO_SetBits
                                    256 ;	main.c: 68: GPIO_SetBits(RESET_CPU);
      008124 A6 80            [ 1]  257 	ld	a, #0x80
      008126 AE 50 05         [ 2]  258 	ldw	x, #0x5005
      008129 CD 84 A7         [ 4]  259 	call	_GPIO_SetBits
                                    260 ;	main.c: 69: SetTimer(0, TIMER_500_MS);
      00812C AE 00 32         [ 2]  261 	ldw	x, #0x0032
      00812F 4F               [ 1]  262 	clr	a
      008130 CD 80 95         [ 4]  263 	call	_SetTimer
                                    264 ;	main.c: 71: SetTimer(2, TIMER_50_MS);
      008133 AE 00 05         [ 2]  265 	ldw	x, #0x0005
      008136 A6 02            [ 1]  266 	ld	a, #0x02
      008138 CD 80 95         [ 4]  267 	call	_SetTimer
                                    268 ;	main.c: 72: SysCntrl.state = WAIT_PGOOD;
      00813B 35 02 00 0A      [ 1]  269 	mov	_SysCntrl+8, #0x02
                                    270 ;	main.c: 74: break;
      00813F CC 82 2B         [ 2]  271 	jp	00129$
                                    272 ;	main.c: 75: case WAIT_PGOOD:
      008142                        273 00108$:
                                    274 ;	main.c: 77: if( ev == timer_2){
      008142 0D 01            [ 1]  275 	tnz	(0x01, sp)
      008144 26 03            [ 1]  276 	jrne	00201$
      008146 CC 82 2B         [ 2]  277 	jp	00129$
      008149                        278 00201$:
                                    279 ;	main.c: 78: GPIO_ResetBits(LED_GOOD);
      008149 A6 08            [ 1]  280 	ld	a, #0x08
      00814B AE 50 00         [ 2]  281 	ldw	x, #0x5000
      00814E CD 84 B0         [ 4]  282 	call	_GPIO_ResetBits
                                    283 ;	main.c: 79: GPIO_SetBits(PG_SMARC);
      008151 A6 08            [ 1]  284 	ld	a, #0x08
      008153 AE 50 05         [ 2]  285 	ldw	x, #0x5005
      008156 CD 84 A7         [ 4]  286 	call	_GPIO_SetBits
                                    287 ;	main.c: 80: SetTimer(2, TIMER_50_MS);
      008159 AE 00 05         [ 2]  288 	ldw	x, #0x0005
      00815C A6 02            [ 1]  289 	ld	a, #0x02
      00815E CD 80 95         [ 4]  290 	call	_SetTimer
                                    291 ;	main.c: 81: SysCntrl.state = WAIT_CARRIER_ON;
      008161 35 03 00 0A      [ 1]  292 	mov	_SysCntrl+8, #0x03
                                    293 ;	main.c: 84: break;
      008165 CC 82 2B         [ 2]  294 	jp	00129$
                                    295 ;	main.c: 85: case WAIT_CARRIER_ON:
      008168                        296 00111$:
                                    297 ;	main.c: 87: if( ev == timer_2){
      008168 0D 01            [ 1]  298 	tnz	(0x01, sp)
      00816A 26 03            [ 1]  299 	jrne	00202$
      00816C CC 82 2B         [ 2]  300 	jp	00129$
      00816F                        301 00202$:
                                    302 ;	main.c: 88: GPIO_SetBits(ENABLE_DCDC);
      00816F A6 02            [ 1]  303 	ld	a, #0x02
      008171 AE 50 05         [ 2]  304 	ldw	x, #0x5005
      008174 CD 84 A7         [ 4]  305 	call	_GPIO_SetBits
                                    306 ;	main.c: 89: SetTimer(2, TIMER_50_MS);
      008177 AE 00 05         [ 2]  307 	ldw	x, #0x0005
      00817A A6 02            [ 1]  308 	ld	a, #0x02
      00817C CD 80 95         [ 4]  309 	call	_SetTimer
                                    310 ;	main.c: 90: SysCntrl.state = CPU_START;
      00817F 35 05 00 0A      [ 1]  311 	mov	_SysCntrl+8, #0x05
                                    312 ;	main.c: 92: break;
      008183 CC 82 2B         [ 2]  313 	jp	00129$
                                    314 ;	main.c: 93: case CPU_START:
      008186                        315 00114$:
                                    316 ;	main.c: 94: if (ev == timer_2){
      008186 0D 01            [ 1]  317 	tnz	(0x01, sp)
      008188 26 03            [ 1]  318 	jrne	00203$
      00818A CC 82 2B         [ 2]  319 	jp	00129$
      00818D                        320 00203$:
                                    321 ;	main.c: 95: GPIO_SetBits(POWER_CPU);
      00818D A6 40            [ 1]  322 	ld	a, #0x40
      00818F AE 50 05         [ 2]  323 	ldw	x, #0x5005
      008192 CD 84 A7         [ 4]  324 	call	_GPIO_SetBits
                                    325 ;	main.c: 96: GPIO_SetBits(LED_PWR);
      008195 A6 01            [ 1]  326 	ld	a, #0x01
      008197 AE 50 0F         [ 2]  327 	ldw	x, #0x500f
      00819A CD 84 A7         [ 4]  328 	call	_GPIO_SetBits
                                    329 ;	main.c: 97: SetTimer(2, TIMER_50_MS);
      00819D AE 00 05         [ 2]  330 	ldw	x, #0x0005
      0081A0 A6 02            [ 1]  331 	ld	a, #0x02
      0081A2 CD 80 95         [ 4]  332 	call	_SetTimer
                                    333 ;	main.c: 98: SysCntrl.state = CPU_NO_RST;
      0081A5 35 06 00 0A      [ 1]  334 	mov	_SysCntrl+8, #0x06
                                    335 ;	main.c: 100: break;
      0081A9 CC 82 2B         [ 2]  336 	jp	00129$
                                    337 ;	main.c: 101: case CPU_NO_RST:
      0081AC                        338 00117$:
                                    339 ;	main.c: 102: if (ev == timer_2){
      0081AC 0D 01            [ 1]  340 	tnz	(0x01, sp)
      0081AE 27 7B            [ 1]  341 	jreq	00129$
                                    342 ;	main.c: 103: GPIO_ResetBits(RESET_CPU);
      0081B0 A6 80            [ 1]  343 	ld	a, #0x80
      0081B2 AE 50 05         [ 2]  344 	ldw	x, #0x5005
      0081B5 CD 84 B0         [ 4]  345 	call	_GPIO_ResetBits
                                    346 ;	main.c: 104: GPIO_SetBits(LED_PWR);
      0081B8 A6 01            [ 1]  347 	ld	a, #0x01
      0081BA AE 50 0F         [ 2]  348 	ldw	x, #0x500f
      0081BD CD 84 A7         [ 4]  349 	call	_GPIO_SetBits
                                    350 ;	main.c: 105: SetTimer(0, TIMER_1_SEC);
      0081C0 AE 00 64         [ 2]  351 	ldw	x, #0x0064
      0081C3 4F               [ 1]  352 	clr	a
      0081C4 CD 80 95         [ 4]  353 	call	_SetTimer
                                    354 ;	main.c: 106: SysCntrl.state = WORK_STATE;
      0081C7 35 07 00 0A      [ 1]  355 	mov	_SysCntrl+8, #0x07
                                    356 ;	main.c: 108: break;
      0081CB 20 5E            [ 2]  357 	jra	00129$
                                    358 ;	main.c: 109: case WORK_STATE:
      0081CD                        359 00120$:
                                    360 ;	main.c: 110: if (ev == timer_0){
      0081CD 4D               [ 1]  361 	tnz	a
      0081CE 27 0F            [ 1]  362 	jreq	00122$
                                    363 ;	main.c: 111: GPIO_ToggleBits(LED_GOOD);
      0081D0 A6 08            [ 1]  364 	ld	a, #0x08
      0081D2 AE 50 00         [ 2]  365 	ldw	x, #0x5000
      0081D5 CD 84 BC         [ 4]  366 	call	_GPIO_ToggleBits
                                    367 ;	main.c: 112: SetTimer(0, TIMER_1_SEC);
      0081D8 AE 00 64         [ 2]  368 	ldw	x, #0x0064
      0081DB 4F               [ 1]  369 	clr	a
      0081DC CD 80 95         [ 4]  370 	call	_SetTimer
      0081DF                        371 00122$:
                                    372 ;	main.c: 115: if (ev == pwrbtn_off){
      0081DF 7B 02            [ 1]  373 	ld	a, (0x02, sp)
      0081E1 A1 05            [ 1]  374 	cp	a, #0x05
      0081E3 26 46            [ 1]  375 	jrne	00129$
                                    376 ;	main.c: 116: GPIO_ResetBits(POWER_CPU);
      0081E5 A6 40            [ 1]  377 	ld	a, #0x40
      0081E7 AE 50 05         [ 2]  378 	ldw	x, #0x5005
      0081EA CD 84 B0         [ 4]  379 	call	_GPIO_ResetBits
                                    380 ;	main.c: 117: GPIO_ResetBits(ENABLE_DCDC);
      0081ED A6 02            [ 1]  381 	ld	a, #0x02
      0081EF AE 50 05         [ 2]  382 	ldw	x, #0x5005
      0081F2 CD 84 B0         [ 4]  383 	call	_GPIO_ResetBits
                                    384 ;	main.c: 118: GPIO_ResetBits(ENABLE_5V);
      0081F5 A6 04            [ 1]  385 	ld	a, #0x04
      0081F7 AE 50 05         [ 2]  386 	ldw	x, #0x5005
      0081FA CD 84 B0         [ 4]  387 	call	_GPIO_ResetBits
                                    388 ;	main.c: 119: GPIO_ResetBits(PG_SMARC);
      0081FD A6 08            [ 1]  389 	ld	a, #0x08
      0081FF AE 50 05         [ 2]  390 	ldw	x, #0x5005
      008202 CD 84 B0         [ 4]  391 	call	_GPIO_ResetBits
                                    392 ;	main.c: 120: GPIO_SetBits(LED_GOOD);
      008205 A6 08            [ 1]  393 	ld	a, #0x08
      008207 AE 50 00         [ 2]  394 	ldw	x, #0x5000
      00820A CD 84 A7         [ 4]  395 	call	_GPIO_SetBits
                                    396 ;	main.c: 121: SysCntrl.state = WAIT_PWR_BTN;
      00820D 35 00 00 0A      [ 1]  397 	mov	_SysCntrl+8, #0x00
                                    398 ;	main.c: 122: tick(start);
      008211 4F               [ 1]  399 	clr	a
      008212 5B 02            [ 2]  400 	addw	sp, #2
                                    401 ;	main.c: 124: break;
      008214 CC 80 AE         [ 2]  402 	jp	_tick
                                    403 ;	main.c: 125: case PWR_ERROR:
      008217                        404 00125$:
                                    405 ;	main.c: 126: if ( ev == timer_0){
      008217 4D               [ 1]  406 	tnz	a
      008218 27 11            [ 1]  407 	jreq	00129$
                                    408 ;	main.c: 127: GPIO_ToggleBits(LED_PWR);
      00821A A6 01            [ 1]  409 	ld	a, #0x01
      00821C AE 50 0F         [ 2]  410 	ldw	x, #0x500f
      00821F CD 84 BC         [ 4]  411 	call	_GPIO_ToggleBits
                                    412 ;	main.c: 128: SetTimer(0, TIMER_100_MS);
      008222 AE 00 0A         [ 2]  413 	ldw	x, #0x000a
      008225 4F               [ 1]  414 	clr	a
      008226 5B 02            [ 2]  415 	addw	sp, #2
      008228 CC 80 95         [ 2]  416 	jp	_SetTimer
                                    417 ;	main.c: 131: }
      00822B                        418 00129$:
                                    419 ;	main.c: 132: }
      00822B 5B 02            [ 2]  420 	addw	sp, #2
      00822D 81               [ 4]  421 	ret
                                    422 ;	main.c: 134: void ReadInputGpio() {
                                    423 ;	-----------------------------------------
                                    424 ;	 function ReadInputGpio
                                    425 ;	-----------------------------------------
      00822E                        426 _ReadInputGpio:
      00822E 52 02            [ 2]  427 	sub	sp, #2
                                    428 ;	main.c: 136: SysCntrl.btn_state = GPIO_ReadInputDataBit(PWR_BTN);
      008230 A6 04            [ 1]  429 	ld	a, #0x04
      008232 AE 50 00         [ 2]  430 	ldw	x, #0x5000
      008235 CD 84 C8         [ 4]  431 	call	_GPIO_ReadInputDataBit
      008238 6B 02            [ 1]  432 	ld	(0x02, sp), a
      00823A AE 00 0C         [ 2]  433 	ldw	x, #(_SysCntrl+10)
      00823D 7B 02            [ 1]  434 	ld	a, (0x02, sp)
      00823F F7               [ 1]  435 	ld	(x), a
                                    436 ;	main.c: 137: SysCntrl.btn_change_time = SysCntrl.Timer;
      008240 CE 00 08         [ 2]  437 	ldw	x, _SysCntrl+6
      008243 CF 00 0F         [ 2]  438 	ldw	_SysCntrl+13, x
                                    439 ;	main.c: 139: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
      008246 C6 00 0C         [ 1]  440 	ld	a, _SysCntrl+10
      008249 90 97            [ 1]  441 	ld	yl, a
      00824B AE 00 0B         [ 2]  442 	ldw	x, #(_SysCntrl+0)+9
      00824E F6               [ 1]  443 	ld	a, (x)
                                    444 ;	main.c: 141: SysCntrl.btn_last_change = SysCntrl.btn_change_time;
                                    445 ;	main.c: 139: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
      00824F 11 02            [ 1]  446 	cp	a, (0x02, sp)
      008251 27 09            [ 1]  447 	jreq	00102$
                                    448 ;	main.c: 140: SysCntrl.btn_state_prev = SysCntrl.btn_state;
      008253 90 9F            [ 1]  449 	ld	a, yl
      008255 F7               [ 1]  450 	ld	(x), a
                                    451 ;	main.c: 141: SysCntrl.btn_last_change = SysCntrl.btn_change_time;
      008256 CE 00 0F         [ 2]  452 	ldw	x, _SysCntrl+13
      008259 CF 00 0D         [ 2]  453 	ldw	_SysCntrl+11, x
      00825C                        454 00102$:
      00825C 90 CE 00 0F      [ 2]  455 	ldw	y, _SysCntrl+13
                                    456 ;	main.c: 144: if (SysCntrl.btn_change_time - SysCntrl.btn_last_change >= TIMER_2_SEC){
      008260 CE 00 0D         [ 2]  457 	ldw	x, _SysCntrl+11
      008263 1F 01            [ 2]  458 	ldw	(0x01, sp), x
      008265 93               [ 1]  459 	ldw	x, y
      008266 72 F0 01         [ 2]  460 	subw	x, (0x01, sp)
      008269 A3 00 C8         [ 2]  461 	cpw	x, #0x00c8
      00826C 25 0C            [ 1]  462 	jrc	00110$
                                    463 ;	main.c: 145: if (SysCntrl.btn_state == RESET){
      00826E C6 00 0C         [ 1]  464 	ld	a, _SysCntrl+10
      008271 26 16            [ 1]  465 	jrne	00111$
                                    466 ;	main.c: 146: tick(pwrbtn_off);
      008273 A6 05            [ 1]  467 	ld	a, #0x05
      008275 CD 80 AE         [ 4]  468 	call	_tick
      008278 20 0F            [ 2]  469 	jra	00111$
      00827A                        470 00110$:
                                    471 ;	main.c: 150: if (SysCntrl.btn_change_time - SysCntrl.btn_last_change >= TIMER_50_MS)
      00827A A3 00 05         [ 2]  472 	cpw	x, #0x0005
      00827D 25 0A            [ 1]  473 	jrc	00111$
                                    474 ;	main.c: 152: if (SysCntrl.btn_state == RESET){
      00827F C6 00 0C         [ 1]  475 	ld	a, _SysCntrl+10
      008282 26 05            [ 1]  476 	jrne	00111$
                                    477 ;	main.c: 153: tick(pwrbtn_on);
      008284 A6 04            [ 1]  478 	ld	a, #0x04
      008286 CD 80 AE         [ 4]  479 	call	_tick
      008289                        480 00111$:
                                    481 ;	main.c: 159: if( GPIO_ReadInputDataBit(PG_5V) ){
      008289 A6 10            [ 1]  482 	ld	a, #0x10
      00828B AE 50 05         [ 2]  483 	ldw	x, #0x5005
      00828E CD 84 C8         [ 4]  484 	call	_GPIO_ReadInputDataBit
      008291 4D               [ 1]  485 	tnz	a
      008292 27 05            [ 1]  486 	jreq	00113$
                                    487 ;	main.c: 160: tick(pgood_5v);
      008294 A6 06            [ 1]  488 	ld	a, #0x06
      008296 CD 80 AE         [ 4]  489 	call	_tick
      008299                        490 00113$:
                                    491 ;	main.c: 163: if( GPIO_ReadInputDataBit(CARRIER_PWR_ON) ){
      008299 A6 20            [ 1]  492 	ld	a, #0x20
      00829B AE 50 05         [ 2]  493 	ldw	x, #0x5005
      00829E CD 84 C8         [ 4]  494 	call	_GPIO_ReadInputDataBit
      0082A1 4D               [ 1]  495 	tnz	a
      0082A2 27 07            [ 1]  496 	jreq	00116$
                                    497 ;	main.c: 164: tick(carrier);
      0082A4 A6 07            [ 1]  498 	ld	a, #0x07
      0082A6 5B 02            [ 2]  499 	addw	sp, #2
      0082A8 CC 80 AE         [ 2]  500 	jp	_tick
      0082AB                        501 00116$:
                                    502 ;	main.c: 167: }
      0082AB 5B 02            [ 2]  503 	addw	sp, #2
      0082AD 81               [ 4]  504 	ret
                                    505 ;	main.c: 170: void TimerMatch()
                                    506 ;	-----------------------------------------
                                    507 ;	 function TimerMatch
                                    508 ;	-----------------------------------------
      0082AE                        509 _TimerMatch:
                                    510 ;	main.c: 172: if (!bMainTimer) {
      0082AE C6 00 01         [ 1]  511 	ld	a, _bMainTimer+0
      0082B1 26 01            [ 1]  512 	jrne	00102$
                                    513 ;	main.c: 173: return;
      0082B3 81               [ 4]  514 	ret
      0082B4                        515 00102$:
                                    516 ;	main.c: 175: bMainTimer = 0;
      0082B4 72 5F 00 01      [ 1]  517 	clr	_bMainTimer+0
                                    518 ;	main.c: 176: SysCntrl.Timer++;
      0082B8 CE 00 08         [ 2]  519 	ldw	x, _SysCntrl+6
      0082BB 5C               [ 1]  520 	incw	x
      0082BC CF 00 08         [ 2]  521 	ldw	_SysCntrl+6, x
                                    522 ;	main.c: 179: if (SysCntrl.Timer_0) { 
      0082BF CE 00 02         [ 2]  523 	ldw	x, _SysCntrl+0
      0082C2 5D               [ 2]  524 	tnzw	x
      0082C3 27 0C            [ 1]  525 	jreq	00106$
                                    526 ;	main.c: 180: SysCntrl.Timer_0--;
      0082C5 5A               [ 2]  527 	decw	x
      0082C6 CF 00 02         [ 2]  528 	ldw	_SysCntrl+0, x
                                    529 ;	main.c: 181: if (!SysCntrl.Timer_0) {
      0082C9 5D               [ 2]  530 	tnzw	x
      0082CA 26 05            [ 1]  531 	jrne	00106$
                                    532 ;	main.c: 182: tick(timer_0);
      0082CC A6 01            [ 1]  533 	ld	a, #0x01
      0082CE CD 80 AE         [ 4]  534 	call	_tick
      0082D1                        535 00106$:
                                    536 ;	main.c: 187: if (SysCntrl.Timer_1) { 
      0082D1 CE 00 04         [ 2]  537 	ldw	x, _SysCntrl+2
      0082D4 5D               [ 2]  538 	tnzw	x
      0082D5 27 0C            [ 1]  539 	jreq	00110$
                                    540 ;	main.c: 188: SysCntrl.Timer_1--;
      0082D7 5A               [ 2]  541 	decw	x
      0082D8 CF 00 04         [ 2]  542 	ldw	_SysCntrl+2, x
                                    543 ;	main.c: 189: if (!SysCntrl.Timer_1) {
      0082DB 5D               [ 2]  544 	tnzw	x
      0082DC 26 05            [ 1]  545 	jrne	00110$
                                    546 ;	main.c: 190: tick(timer_1);
      0082DE A6 02            [ 1]  547 	ld	a, #0x02
      0082E0 CD 80 AE         [ 4]  548 	call	_tick
      0082E3                        549 00110$:
                                    550 ;	main.c: 195: if (SysCntrl.Timer_2) {
      0082E3 CE 00 06         [ 2]  551 	ldw	x, _SysCntrl+4
      0082E6 5D               [ 2]  552 	tnzw	x
      0082E7 26 01            [ 1]  553 	jrne	00157$
      0082E9 81               [ 4]  554 	ret
      0082EA                        555 00157$:
                                    556 ;	main.c: 196: SysCntrl.Timer_2--;
      0082EA 5A               [ 2]  557 	decw	x
      0082EB CF 00 06         [ 2]  558 	ldw	_SysCntrl+4, x
                                    559 ;	main.c: 197: if (!SysCntrl.Timer_2) {
      0082EE 5D               [ 2]  560 	tnzw	x
      0082EF 27 01            [ 1]  561 	jreq	00158$
      0082F1 81               [ 4]  562 	ret
      0082F2                        563 00158$:
                                    564 ;	main.c: 198: tick(timer_2);
      0082F2 A6 03            [ 1]  565 	ld	a, #0x03
                                    566 ;	main.c: 201: }
      0082F4 CC 80 AE         [ 2]  567 	jp	_tick
                                    568 ;	main.c: 205: INTERRUPT_HANDLER(IRQ_Handler_TIM4, 25)
                                    569 ;	-----------------------------------------
                                    570 ;	 function IRQ_Handler_TIM4
                                    571 ;	-----------------------------------------
      0082F7                        572 _IRQ_Handler_TIM4:
      0082F7 4F               [ 1]  573 	clr	a
      0082F8 62               [ 2]  574 	div	x, a
                                    575 ;	main.c: 207: bMainTimer = 1;
      0082F9 35 01 00 01      [ 1]  576 	mov	_bMainTimer+0, #0x01
                                    577 ;	main.c: 208: TIM4_ClearITPendingBit(TIM4_IT_Update);
      0082FD A6 01            [ 1]  578 	ld	a, #0x01
      0082FF CD 89 28         [ 4]  579 	call	_TIM4_ClearITPendingBit
                                    580 ;	main.c: 209: }
      008302 80               [11]  581 	iret
                                    582 ;	main.c: 211: int main( void )
                                    583 ;	-----------------------------------------
                                    584 ;	 function main
                                    585 ;	-----------------------------------------
      008303                        586 _main:
                                    587 ;	main.c: 213: disableInterrupts();
      008303 9B               [ 1]  588 	sim;	
                                    589 ;	main.c: 215: GPIO_DeInit(GPIOA);
      008304 AE 50 00         [ 2]  590 	ldw	x, #0x5000
      008307 CD 83 EE         [ 4]  591 	call	_GPIO_DeInit
                                    592 ;	main.c: 216: GPIO_DeInit(GPIOB);
      00830A AE 50 05         [ 2]  593 	ldw	x, #0x5005
      00830D CD 83 EE         [ 4]  594 	call	_GPIO_DeInit
                                    595 ;	main.c: 217: GPIO_DeInit(GPIOC);
      008310 AE 50 0A         [ 2]  596 	ldw	x, #0x500a
      008313 CD 83 EE         [ 4]  597 	call	_GPIO_DeInit
                                    598 ;	main.c: 218: GPIO_DeInit(GPIOD);
      008316 AE 50 0F         [ 2]  599 	ldw	x, #0x500f
      008319 CD 83 EE         [ 4]  600 	call	_GPIO_DeInit
                                    601 ;	main.c: 220: GPIO_Init(LED_GOOD, GPIO_Mode_Out_PP_High_Fast);
      00831C 4B F0            [ 1]  602 	push	#0xf0
      00831E A6 08            [ 1]  603 	ld	a, #0x08
      008320 AE 50 00         [ 2]  604 	ldw	x, #0x5000
      008323 CD 83 FC         [ 4]  605 	call	_GPIO_Init
                                    606 ;	main.c: 221: GPIO_Init(LED_PWR, GPIO_Mode_Out_PP_Low_Fast);
      008326 4B E0            [ 1]  607 	push	#0xe0
      008328 A6 01            [ 1]  608 	ld	a, #0x01
      00832A AE 50 0F         [ 2]  609 	ldw	x, #0x500f
      00832D CD 83 FC         [ 4]  610 	call	_GPIO_Init
                                    611 ;	main.c: 222: GPIO_Init(ENABLE_DCDC, GPIO_Mode_Out_PP_Low_Fast);
      008330 4B E0            [ 1]  612 	push	#0xe0
      008332 A6 02            [ 1]  613 	ld	a, #0x02
      008334 AE 50 05         [ 2]  614 	ldw	x, #0x5005
      008337 CD 83 FC         [ 4]  615 	call	_GPIO_Init
                                    616 ;	main.c: 223: GPIO_Init(ENABLE_5V, GPIO_Mode_Out_PP_Low_Fast);
      00833A 4B E0            [ 1]  617 	push	#0xe0
      00833C A6 04            [ 1]  618 	ld	a, #0x04
      00833E AE 50 05         [ 2]  619 	ldw	x, #0x5005
      008341 CD 83 FC         [ 4]  620 	call	_GPIO_Init
                                    621 ;	main.c: 224: GPIO_Init(PG_SMARC, GPIO_Mode_Out_PP_Low_Fast);
      008344 4B E0            [ 1]  622 	push	#0xe0
      008346 A6 08            [ 1]  623 	ld	a, #0x08
      008348 AE 50 05         [ 2]  624 	ldw	x, #0x5005
      00834B CD 83 FC         [ 4]  625 	call	_GPIO_Init
                                    626 ;	main.c: 225: GPIO_Init(POWER_CPU, GPIO_Mode_Out_PP_Low_Fast);
      00834E 4B E0            [ 1]  627 	push	#0xe0
      008350 A6 40            [ 1]  628 	ld	a, #0x40
      008352 AE 50 05         [ 2]  629 	ldw	x, #0x5005
      008355 CD 83 FC         [ 4]  630 	call	_GPIO_Init
                                    631 ;	main.c: 226: GPIO_Init(RESET_CPU, GPIO_Mode_Out_PP_Low_Fast);
      008358 4B E0            [ 1]  632 	push	#0xe0
      00835A A6 80            [ 1]  633 	ld	a, #0x80
      00835C AE 50 05         [ 2]  634 	ldw	x, #0x5005
      00835F CD 83 FC         [ 4]  635 	call	_GPIO_Init
                                    636 ;	main.c: 227: GPIO_Init(WDOG_OUT, GPIO_Mode_Out_PP_Low_Fast);
      008362 4B E0            [ 1]  637 	push	#0xe0
      008364 A6 10            [ 1]  638 	ld	a, #0x10
      008366 AE 50 0A         [ 2]  639 	ldw	x, #0x500a
      008369 CD 83 FC         [ 4]  640 	call	_GPIO_Init
                                    641 ;	main.c: 229: GPIO_Init(PWR_BTN, GPIO_Mode_In_PU_No_IT);
      00836C 4B 40            [ 1]  642 	push	#0x40
      00836E A6 04            [ 1]  643 	ld	a, #0x04
      008370 AE 50 00         [ 2]  644 	ldw	x, #0x5000
      008373 CD 83 FC         [ 4]  645 	call	_GPIO_Init
                                    646 ;	main.c: 230: GPIO_Init(PG_5V, GPIO_Mode_In_PU_No_IT);
      008376 4B 40            [ 1]  647 	push	#0x40
      008378 A6 10            [ 1]  648 	ld	a, #0x10
      00837A AE 50 05         [ 2]  649 	ldw	x, #0x5005
      00837D CD 83 FC         [ 4]  650 	call	_GPIO_Init
                                    651 ;	main.c: 231: GPIO_Init(CARRIER_PWR_ON, GPIO_Mode_In_PU_No_IT);
      008380 4B 40            [ 1]  652 	push	#0x40
      008382 A6 20            [ 1]  653 	ld	a, #0x20
      008384 AE 50 05         [ 2]  654 	ldw	x, #0x5005
      008387 CD 83 FC         [ 4]  655 	call	_GPIO_Init
                                    656 ;	main.c: 232: GPIO_Init(WDOG_IN, GPIO_Mode_In_PU_No_IT);
      00838A 4B 40            [ 1]  657 	push	#0x40
      00838C A6 01            [ 1]  658 	ld	a, #0x01
      00838E AE 50 05         [ 2]  659 	ldw	x, #0x5005
      008391 CD 83 FC         [ 4]  660 	call	_GPIO_Init
                                    661 ;	main.c: 236: CLK_DeInit();
      008394 CD 84 DB         [ 4]  662 	call	_CLK_DeInit
                                    663 ;	main.c: 237: CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
      008397 4F               [ 1]  664 	clr	a
      008398 CD 86 02         [ 4]  665 	call	_CLK_SYSCLKDivConfig
                                    666 ;	main.c: 238: CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
      00839B 4B 01            [ 1]  667 	push	#0x01
      00839D A6 02            [ 1]  668 	ld	a, #0x02
      00839F CD 86 2A         [ 4]  669 	call	_CLK_PeripheralClockConfig
                                    670 ;	main.c: 239: CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
      0083A2 4B 01            [ 1]  671 	push	#0x01
      0083A4 A6 05            [ 1]  672 	ld	a, #0x05
      0083A6 CD 86 2A         [ 4]  673 	call	_CLK_PeripheralClockConfig
                                    674 ;	main.c: 241: TIM4_DeInit();
      0083A9 CD 87 F6         [ 4]  675 	call	_TIM4_DeInit
                                    676 ;	main.c: 243: TIM4_Cmd(DISABLE); 
      0083AC 4F               [ 1]  677 	clr	a
      0083AD CD 88 B1         [ 4]  678 	call	_TIM4_Cmd
                                    679 ;	main.c: 244: TIM4_TimeBaseInit(TIM4_Prescaler_1024, 156);
      0083B0 4B 9C            [ 1]  680 	push	#0x9c
      0083B2 A6 0A            [ 1]  681 	ld	a, #0x0a
      0083B4 CD 88 17         [ 4]  682 	call	_TIM4_TimeBaseInit
                                    683 ;	main.c: 245: TIM4_ClearFlag(TIM4_FLAG_Update);
      0083B7 A6 01            [ 1]  684 	ld	a, #0x01
      0083B9 CD 89 05         [ 4]  685 	call	_TIM4_ClearFlag
                                    686 ;	main.c: 246: TIM4_ITConfig(TIM4_IT_Update, ENABLE);
      0083BC 4B 01            [ 1]  687 	push	#0x01
      0083BE A6 01            [ 1]  688 	ld	a, #0x01
      0083C0 CD 88 C9         [ 4]  689 	call	_TIM4_ITConfig
                                    690 ;	main.c: 247: TIM4_Cmd(ENABLE);       // let's go
      0083C3 A6 01            [ 1]  691 	ld	a, #0x01
      0083C5 CD 88 B1         [ 4]  692 	call	_TIM4_Cmd
                                    693 ;	main.c: 248: enableInterrupts();
      0083C8 9A               [ 1]  694 	rim;	
                                    695 ;	main.c: 251: bMainTimer = 0;
      0083C9 72 5F 00 01      [ 1]  696 	clr	_bMainTimer+0
                                    697 ;	main.c: 252: SysCntrl.btn_state = SET;
      0083CD 35 01 00 0C      [ 1]  698 	mov	_SysCntrl+10, #0x01
                                    699 ;	main.c: 253: SysCntrl.btn_state_prev = SET;
      0083D1 35 01 00 0B      [ 1]  700 	mov	_SysCntrl+9, #0x01
                                    701 ;	main.c: 254: SysCntrl.btn_change_time = 0;
      0083D5 AE 00 0F         [ 2]  702 	ldw	x, #(_SysCntrl+13)
      0083D8 6F 01            [ 1]  703 	clr	(0x1, x)
      0083DA 7F               [ 1]  704 	clr	(x)
                                    705 ;	main.c: 255: SysCntrl.btn_last_change = 0;
      0083DB AE 00 0D         [ 2]  706 	ldw	x, #(_SysCntrl+11)
      0083DE 6F 01            [ 1]  707 	clr	(0x1, x)
      0083E0 7F               [ 1]  708 	clr	(x)
                                    709 ;	main.c: 257: tick(start);
      0083E1 4F               [ 1]  710 	clr	a
      0083E2 CD 80 AE         [ 4]  711 	call	_tick
                                    712 ;	main.c: 258: while (1) {
      0083E5                        713 00102$:
                                    714 ;	main.c: 259: ReadInputGpio();
      0083E5 CD 82 2E         [ 4]  715 	call	_ReadInputGpio
                                    716 ;	main.c: 260: TimerMatch();
      0083E8 CD 82 AE         [ 4]  717 	call	_TimerMatch
      0083EB 20 F8            [ 2]  718 	jra	00102$
                                    719 ;	main.c: 264: }
      0083ED 81               [ 4]  720 	ret
                                    721 	.area CODE
                                    722 	.area CONST
                                    723 	.area INITIALIZER
                                    724 	.area CABS (ABS)
