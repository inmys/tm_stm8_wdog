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
                                     15 	.globl _BtnAction
                                     16 	.globl _tick
                                     17 	.globl _SetTimer
                                     18 	.globl _TIM4_ClearITPendingBit
                                     19 	.globl _TIM4_ClearFlag
                                     20 	.globl _TIM4_ITConfig
                                     21 	.globl _TIM4_Cmd
                                     22 	.globl _TIM4_TimeBaseInit
                                     23 	.globl _TIM4_DeInit
                                     24 	.globl _CLK_PeripheralClockConfig
                                     25 	.globl _CLK_SYSCLKDivConfig
                                     26 	.globl _CLK_DeInit
                                     27 	.globl _GPIO_ReadInputDataBit
                                     28 	.globl _GPIO_ToggleBits
                                     29 	.globl _GPIO_ResetBits
                                     30 	.globl _GPIO_SetBits
                                     31 	.globl _GPIO_Init
                                     32 	.globl _GPIO_DeInit
                                     33 	.globl _SysCntrl
                                     34 	.globl _bMainTimer
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DATA
      000001                         39 _bMainTimer::
      000001                         40 	.ds 1
      000002                         41 _SysCntrl::
      000002                         42 	.ds 22
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area INITIALIZED
                                     47 ;--------------------------------------------------------
                                     48 ; Stack segment in internal ram
                                     49 ;--------------------------------------------------------
                                     50 	.area	SSEG
      000018                         51 __start__stack:
      000018                         52 	.ds	1
                                     53 
                                     54 ;--------------------------------------------------------
                                     55 ; absolute external ram data
                                     56 ;--------------------------------------------------------
                                     57 	.area DABS (ABS)
                                     58 
                                     59 ; default segment ordering for linker
                                     60 	.area HOME
                                     61 	.area GSINIT
                                     62 	.area GSFINAL
                                     63 	.area CONST
                                     64 	.area INITIALIZER
                                     65 	.area CODE
                                     66 
                                     67 ;--------------------------------------------------------
                                     68 ; interrupt vector
                                     69 ;--------------------------------------------------------
                                     70 	.area HOME
      008000                         71 __interrupt_vect:
      008000 82 00 80 73             72 	int s_GSINIT ; reset
      008004 82 00 00 00             73 	int 0x000000 ; trap
      008008 82 00 00 00             74 	int 0x000000 ; int0
      00800C 82 00 00 00             75 	int 0x000000 ; int1
      008010 82 00 00 00             76 	int 0x000000 ; int2
      008014 82 00 00 00             77 	int 0x000000 ; int3
      008018 82 00 00 00             78 	int 0x000000 ; int4
      00801C 82 00 00 00             79 	int 0x000000 ; int5
      008020 82 00 00 00             80 	int 0x000000 ; int6
      008024 82 00 00 00             81 	int 0x000000 ; int7
      008028 82 00 00 00             82 	int 0x000000 ; int8
      00802C 82 00 00 00             83 	int 0x000000 ; int9
      008030 82 00 00 00             84 	int 0x000000 ; int10
      008034 82 00 00 00             85 	int 0x000000 ; int11
      008038 82 00 00 00             86 	int 0x000000 ; int12
      00803C 82 00 00 00             87 	int 0x000000 ; int13
      008040 82 00 00 00             88 	int 0x000000 ; int14
      008044 82 00 00 00             89 	int 0x000000 ; int15
      008048 82 00 00 00             90 	int 0x000000 ; int16
      00804C 82 00 00 00             91 	int 0x000000 ; int17
      008050 82 00 00 00             92 	int 0x000000 ; int18
      008054 82 00 00 00             93 	int 0x000000 ; int19
      008058 82 00 00 00             94 	int 0x000000 ; int20
      00805C 82 00 00 00             95 	int 0x000000 ; int21
      008060 82 00 00 00             96 	int 0x000000 ; int22
      008064 82 00 00 00             97 	int 0x000000 ; int23
      008068 82 00 00 00             98 	int 0x000000 ; int24
      00806C 82 00 83 7B             99 	int _IRQ_Handler_TIM4 ; int25
                                    100 ;--------------------------------------------------------
                                    101 ; global & static initialisations
                                    102 ;--------------------------------------------------------
                                    103 	.area HOME
                                    104 	.area GSINIT
                                    105 	.area GSFINAL
                                    106 	.area GSINIT
      008073                        107 __sdcc_init_data:
                                    108 ; stm8_genXINIT() start
      008073 AE 00 17         [ 2]  109 	ldw x, #l_DATA
      008076 27 07            [ 1]  110 	jreq	00002$
      008078                        111 00001$:
      008078 72 4F 00 00      [ 1]  112 	clr (s_DATA - 1, x)
      00807C 5A               [ 2]  113 	decw x
      00807D 26 F9            [ 1]  114 	jrne	00001$
      00807F                        115 00002$:
      00807F AE 00 00         [ 2]  116 	ldw	x, #l_INITIALIZER
      008082 27 09            [ 1]  117 	jreq	00004$
      008084                        118 00003$:
      008084 D6 80 94         [ 1]  119 	ld	a, (s_INITIALIZER - 1, x)
      008087 D7 00 17         [ 1]  120 	ld	(s_INITIALIZED - 1, x), a
      00808A 5A               [ 2]  121 	decw	x
      00808B 26 F7            [ 1]  122 	jrne	00003$
      00808D                        123 00004$:
                                    124 ; stm8_genXINIT() end
                                    125 	.area GSFINAL
      00808D CC 80 70         [ 2]  126 	jp	__sdcc_program_startup
                                    127 ;--------------------------------------------------------
                                    128 ; Home
                                    129 ;--------------------------------------------------------
                                    130 	.area HOME
                                    131 	.area HOME
      008070                        132 __sdcc_program_startup:
      008070 CC 83 87         [ 2]  133 	jp	_main
                                    134 ;	return from main will return to caller
                                    135 ;--------------------------------------------------------
                                    136 ; code
                                    137 ;--------------------------------------------------------
                                    138 	.area CODE
                                    139 ;	main.c: 39: void SetTimer(uint8_t tmr, unsigned int value)
                                    140 ;	-----------------------------------------
                                    141 ;	 function SetTimer
                                    142 ;	-----------------------------------------
      008095                        143 _SetTimer:
                                    144 ;	main.c: 41: switch (tmr) {
      008095 A1 00            [ 1]  145 	cp	a, #0x00
      008097 27 09            [ 1]  146 	jreq	00101$
      008099 A1 01            [ 1]  147 	cp	a, #0x01
      00809B 27 09            [ 1]  148 	jreq	00102$
      00809D A1 02            [ 1]  149 	cp	a, #0x02
      00809F 27 09            [ 1]  150 	jreq	00103$
      0080A1 81               [ 4]  151 	ret
                                    152 ;	main.c: 42: case 0:
      0080A2                        153 00101$:
                                    154 ;	main.c: 43: SysCntrl.Timer_0 = value;
      0080A2 CF 00 02         [ 2]  155 	ldw	_SysCntrl+0, x
                                    156 ;	main.c: 44: break;
      0080A5 81               [ 4]  157 	ret
                                    158 ;	main.c: 45: case 1:
      0080A6                        159 00102$:
                                    160 ;	main.c: 46: SysCntrl.Timer_1 = value;
      0080A6 CF 00 04         [ 2]  161 	ldw	_SysCntrl+2, x
                                    162 ;	main.c: 47: break;
      0080A9 81               [ 4]  163 	ret
                                    164 ;	main.c: 48: case 2:
      0080AA                        165 00103$:
                                    166 ;	main.c: 49: SysCntrl.Timer_2 = value;
      0080AA CF 00 06         [ 2]  167 	ldw	_SysCntrl+4, x
                                    168 ;	main.c: 51: }
                                    169 ;	main.c: 52: }
      0080AD 81               [ 4]  170 	ret
                                    171 ;	main.c: 54: void tick(enum event_t ev)
                                    172 ;	-----------------------------------------
                                    173 ;	 function tick
                                    174 ;	-----------------------------------------
      0080AE                        175 _tick:
      0080AE 52 03            [ 2]  176 	sub	sp, #3
      0080B0 6B 03            [ 1]  177 	ld	(0x03, sp), a
                                    178 ;	main.c: 56: switch (SysCntrl.state) {
      0080B2 C6 00 0A         [ 1]  179 	ld	a, _SysCntrl+8
      0080B5 97               [ 1]  180 	ld	xl, a
      0080B6 A1 08            [ 1]  181 	cp	a, #0x08
      0080B8 23 03            [ 2]  182 	jrule	00215$
      0080BA CC 82 82         [ 2]  183 	jp	00138$
      0080BD                        184 00215$:
                                    185 ;	main.c: 68: SysCntrl.bootmode = 1;
                                    186 ;	main.c: 72: if( ev == timer_2){
      0080BD 7B 03            [ 1]  187 	ld	a, (0x03, sp)
      0080BF A0 03            [ 1]  188 	sub	a, #0x03
      0080C1 26 04            [ 1]  189 	jrne	00217$
      0080C3 4C               [ 1]  190 	inc	a
      0080C4 6B 01            [ 1]  191 	ld	(0x01, sp), a
      0080C6 C5                     192 	.byte 0xc5
      0080C7                        193 00217$:
      0080C7 0F 01            [ 1]  194 	clr	(0x01, sp)
      0080C9                        195 00218$:
                                    196 ;	main.c: 134: if (ev == timer_0){
      0080C9 7B 03            [ 1]  197 	ld	a, (0x03, sp)
      0080CB 4A               [ 1]  198 	dec	a
      0080CC 26 05            [ 1]  199 	jrne	00220$
      0080CE A6 01            [ 1]  200 	ld	a, #0x01
      0080D0 6B 02            [ 1]  201 	ld	(0x02, sp), a
      0080D2 C5                     202 	.byte 0xc5
      0080D3                        203 00220$:
      0080D3 0F 02            [ 1]  204 	clr	(0x02, sp)
      0080D5                        205 00221$:
                                    206 ;	main.c: 56: switch (SysCntrl.state) {
      0080D5 4F               [ 1]  207 	clr	a
      0080D6 95               [ 1]  208 	ld	xh, a
      0080D7 58               [ 2]  209 	sllw	x
      0080D8 DE 80 DC         [ 2]  210 	ldw	x, (#00222$, x)
      0080DB FC               [ 2]  211 	jp	(x)
      0080DC                        212 00222$:
      0080DC 80 EE                  213 	.dw	#00101$
      0080DE 82 82                  214 	.dw	#00138$
      0080E0 81 69                  215 	.dw	#00112$
      0080E2 81 8F                  216 	.dw	#00115$
      0080E4 82 6D                  217 	.dw	#00134$
      0080E6 81 AD                  218 	.dw	#00118$
      0080E8 81 D3                  219 	.dw	#00121$
      0080EA 81 F9                  220 	.dw	#00124$
      0080EC 82 1A                  221 	.dw	#00129$
                                    222 ;	main.c: 57: case WAIT_PWR_BTN:
      0080EE                        223 00101$:
                                    224 ;	main.c: 58: if (ev == start) {
      0080EE 0D 03            [ 1]  225 	tnz	(0x03, sp)
      0080F0 26 08            [ 1]  226 	jrne	00103$
                                    227 ;	main.c: 59: SetTimer(1, TIMER_1_SEC);
      0080F2 AE 00 64         [ 2]  228 	ldw	x, #0x0064
      0080F5 A6 01            [ 1]  229 	ld	a, #0x01
      0080F7 CD 80 95         [ 4]  230 	call	_SetTimer
      0080FA                        231 00103$:
                                    232 ;	main.c: 62: if ( ev == timer_1){
      0080FA 7B 03            [ 1]  233 	ld	a, (0x03, sp)
                                    234 ;	main.c: 63: GPIO_ToggleBits(LED_PWR);
      0080FC A0 02            [ 1]  235 	sub	a, #0x02
      0080FE 26 0F            [ 1]  236 	jrne	00105$
      008100 4C               [ 1]  237 	inc	a
      008101 AE 50 0F         [ 2]  238 	ldw	x, #0x500f
      008104 CD 85 4A         [ 4]  239 	call	_GPIO_ToggleBits
                                    240 ;	main.c: 64: SetTimer(1, TIMER_1_SEC);
      008107 AE 00 64         [ 2]  241 	ldw	x, #0x0064
      00810A A6 01            [ 1]  242 	ld	a, #0x01
      00810C CD 80 95         [ 4]  243 	call	_SetTimer
      00810F                        244 00105$:
                                    245 ;	main.c: 66: if (ev == cpu_bootrom){
      00810F 7B 03            [ 1]  246 	ld	a, (0x03, sp)
      008111 A1 08            [ 1]  247 	cp	a, #0x08
      008113 26 14            [ 1]  248 	jrne	00107$
                                    249 ;	main.c: 67: GPIO_SetBits(SMARC_BOOTMODE);
      008115 A6 20            [ 1]  250 	ld	a, #0x20
      008117 AE 50 0A         [ 2]  251 	ldw	x, #0x500a
      00811A CD 85 35         [ 4]  252 	call	_GPIO_SetBits
                                    253 ;	main.c: 68: SysCntrl.bootmode = 1;
      00811D 35 01 00 14      [ 1]  254 	mov	_SysCntrl+18, #0x01
                                    255 ;	main.c: 70: SetTimer(2, TIMER_1_SEC);
      008121 AE 00 64         [ 2]  256 	ldw	x, #0x0064
      008124 A6 02            [ 1]  257 	ld	a, #0x02
      008126 CD 80 95         [ 4]  258 	call	_SetTimer
      008129                        259 00107$:
                                    260 ;	main.c: 72: if( ev == timer_2){
      008129 0D 01            [ 1]  261 	tnz	(0x01, sp)
      00812B 27 05            [ 1]  262 	jreq	00109$
                                    263 ;	main.c: 73: tick(pwrbtn_on);
      00812D A6 04            [ 1]  264 	ld	a, #0x04
      00812F CD 80 AE         [ 4]  265 	call	_tick
      008132                        266 00109$:
                                    267 ;	main.c: 75: if (ev == pwrbtn_on) {
      008132 7B 03            [ 1]  268 	ld	a, (0x03, sp)
      008134 A1 04            [ 1]  269 	cp	a, #0x04
      008136 27 03            [ 1]  270 	jreq	00233$
      008138 CC 82 82         [ 2]  271 	jp	00138$
      00813B                        272 00233$:
                                    273 ;	main.c: 76: GPIO_SetBits(LED_PWR);
      00813B A6 01            [ 1]  274 	ld	a, #0x01
      00813D AE 50 0F         [ 2]  275 	ldw	x, #0x500f
      008140 CD 85 35         [ 4]  276 	call	_GPIO_SetBits
                                    277 ;	main.c: 77: GPIO_SetBits(ENABLE_5V); // delay between ENABLE_5V and POWER_CPU should be < 200ms
      008143 A6 04            [ 1]  278 	ld	a, #0x04
      008145 AE 50 05         [ 2]  279 	ldw	x, #0x5005
      008148 CD 85 35         [ 4]  280 	call	_GPIO_SetBits
                                    281 ;	main.c: 78: GPIO_SetBits(RESET_CPU);
      00814B A6 80            [ 1]  282 	ld	a, #0x80
      00814D AE 50 05         [ 2]  283 	ldw	x, #0x5005
      008150 CD 85 35         [ 4]  284 	call	_GPIO_SetBits
                                    285 ;	main.c: 80: SetTimer(0, TIMER_500_MS);
      008153 AE 00 32         [ 2]  286 	ldw	x, #0x0032
      008156 4F               [ 1]  287 	clr	a
      008157 CD 80 95         [ 4]  288 	call	_SetTimer
                                    289 ;	main.c: 82: SetTimer(2, TIMER_50_MS);
      00815A AE 00 05         [ 2]  290 	ldw	x, #0x0005
      00815D A6 02            [ 1]  291 	ld	a, #0x02
      00815F CD 80 95         [ 4]  292 	call	_SetTimer
                                    293 ;	main.c: 83: SysCntrl.state = WAIT_PGOOD;
      008162 35 02 00 0A      [ 1]  294 	mov	_SysCntrl+8, #0x02
                                    295 ;	main.c: 85: break;
      008166 CC 82 82         [ 2]  296 	jp	00138$
                                    297 ;	main.c: 86: case WAIT_PGOOD:
      008169                        298 00112$:
                                    299 ;	main.c: 88: if( ev == timer_2){
      008169 0D 01            [ 1]  300 	tnz	(0x01, sp)
      00816B 26 03            [ 1]  301 	jrne	00234$
      00816D CC 82 82         [ 2]  302 	jp	00138$
      008170                        303 00234$:
                                    304 ;	main.c: 89: GPIO_ResetBits(LED_GOOD);
      008170 A6 08            [ 1]  305 	ld	a, #0x08
      008172 AE 50 00         [ 2]  306 	ldw	x, #0x5000
      008175 CD 85 3E         [ 4]  307 	call	_GPIO_ResetBits
                                    308 ;	main.c: 90: GPIO_SetBits(PG_SMARC);
      008178 A6 08            [ 1]  309 	ld	a, #0x08
      00817A AE 50 05         [ 2]  310 	ldw	x, #0x5005
      00817D CD 85 35         [ 4]  311 	call	_GPIO_SetBits
                                    312 ;	main.c: 91: SetTimer(2, TIMER_50_MS);
      008180 AE 00 05         [ 2]  313 	ldw	x, #0x0005
      008183 A6 02            [ 1]  314 	ld	a, #0x02
      008185 CD 80 95         [ 4]  315 	call	_SetTimer
                                    316 ;	main.c: 92: SysCntrl.state = WAIT_CARRIER_ON;
      008188 35 03 00 0A      [ 1]  317 	mov	_SysCntrl+8, #0x03
                                    318 ;	main.c: 95: break;
      00818C CC 82 82         [ 2]  319 	jp	00138$
                                    320 ;	main.c: 96: case WAIT_CARRIER_ON:
      00818F                        321 00115$:
                                    322 ;	main.c: 98: if( ev == timer_2){
      00818F 0D 01            [ 1]  323 	tnz	(0x01, sp)
      008191 26 03            [ 1]  324 	jrne	00235$
      008193 CC 82 82         [ 2]  325 	jp	00138$
      008196                        326 00235$:
                                    327 ;	main.c: 99: GPIO_SetBits(ENABLE_DCDC);
      008196 A6 02            [ 1]  328 	ld	a, #0x02
      008198 AE 50 05         [ 2]  329 	ldw	x, #0x5005
      00819B CD 85 35         [ 4]  330 	call	_GPIO_SetBits
                                    331 ;	main.c: 100: SetTimer(2, TIMER_50_MS);
      00819E AE 00 05         [ 2]  332 	ldw	x, #0x0005
      0081A1 A6 02            [ 1]  333 	ld	a, #0x02
      0081A3 CD 80 95         [ 4]  334 	call	_SetTimer
                                    335 ;	main.c: 101: SysCntrl.state = CPU_START;
      0081A6 35 05 00 0A      [ 1]  336 	mov	_SysCntrl+8, #0x05
                                    337 ;	main.c: 103: break;
      0081AA CC 82 82         [ 2]  338 	jp	00138$
                                    339 ;	main.c: 104: case CPU_START:
      0081AD                        340 00118$:
                                    341 ;	main.c: 105: if (ev == timer_2){
      0081AD 0D 01            [ 1]  342 	tnz	(0x01, sp)
      0081AF 26 03            [ 1]  343 	jrne	00236$
      0081B1 CC 82 82         [ 2]  344 	jp	00138$
      0081B4                        345 00236$:
                                    346 ;	main.c: 106: GPIO_SetBits(POWER_CPU); // delay between ENABLE_5V and POWER_CPU should be < 200ms
      0081B4 A6 40            [ 1]  347 	ld	a, #0x40
      0081B6 AE 50 05         [ 2]  348 	ldw	x, #0x5005
      0081B9 CD 85 35         [ 4]  349 	call	_GPIO_SetBits
                                    350 ;	main.c: 107: GPIO_SetBits(LED_PWR);
      0081BC A6 01            [ 1]  351 	ld	a, #0x01
      0081BE AE 50 0F         [ 2]  352 	ldw	x, #0x500f
      0081C1 CD 85 35         [ 4]  353 	call	_GPIO_SetBits
                                    354 ;	main.c: 108: SetTimer(2, TIMER_50_MS); 
      0081C4 AE 00 05         [ 2]  355 	ldw	x, #0x0005
      0081C7 A6 02            [ 1]  356 	ld	a, #0x02
      0081C9 CD 80 95         [ 4]  357 	call	_SetTimer
                                    358 ;	main.c: 109: SysCntrl.state = CPU_NO_RST;
      0081CC 35 06 00 0A      [ 1]  359 	mov	_SysCntrl+8, #0x06
                                    360 ;	main.c: 111: break;
      0081D0 CC 82 82         [ 2]  361 	jp	00138$
                                    362 ;	main.c: 112: case CPU_NO_RST:
      0081D3                        363 00121$:
                                    364 ;	main.c: 113: if (ev == timer_2){
      0081D3 0D 01            [ 1]  365 	tnz	(0x01, sp)
      0081D5 26 03            [ 1]  366 	jrne	00237$
      0081D7 CC 82 82         [ 2]  367 	jp	00138$
      0081DA                        368 00237$:
                                    369 ;	main.c: 114: GPIO_ResetBits(RESET_CPU);
      0081DA A6 80            [ 1]  370 	ld	a, #0x80
      0081DC AE 50 05         [ 2]  371 	ldw	x, #0x5005
      0081DF CD 85 3E         [ 4]  372 	call	_GPIO_ResetBits
                                    373 ;	main.c: 115: GPIO_SetBits(LED_PWR);
      0081E2 A6 01            [ 1]  374 	ld	a, #0x01
      0081E4 AE 50 0F         [ 2]  375 	ldw	x, #0x500f
      0081E7 CD 85 35         [ 4]  376 	call	_GPIO_SetBits
                                    377 ;	main.c: 116: SetTimer(2, TIMER_50_MS);
      0081EA AE 00 05         [ 2]  378 	ldw	x, #0x0005
      0081ED A6 02            [ 1]  379 	ld	a, #0x02
      0081EF CD 80 95         [ 4]  380 	call	_SetTimer
                                    381 ;	main.c: 117: SysCntrl.state = WORK_STATE;
      0081F2 35 08 00 0A      [ 1]  382 	mov	_SysCntrl+8, #0x08
                                    383 ;	main.c: 119: break;
      0081F6 CC 82 82         [ 2]  384 	jp	00138$
                                    385 ;	main.c: 120: case CHECK_BOOTMODE:
      0081F9                        386 00124$:
                                    387 ;	main.c: 121: if (ev == timer_2){
      0081F9 0D 01            [ 1]  388 	tnz	(0x01, sp)
      0081FB 27 1D            [ 1]  389 	jreq	00129$
                                    390 ;	main.c: 122: if(SysCntrl.bootmode == 1){
      0081FD C6 00 14         [ 1]  391 	ld	a, _SysCntrl+18
      008200 4A               [ 1]  392 	dec	a
      008201 26 0C            [ 1]  393 	jrne	00126$
                                    394 ;	main.c: 123: GPIO_ResetBits(SMARC_BOOTMODE);
      008203 A6 20            [ 1]  395 	ld	a, #0x20
      008205 AE 50 0A         [ 2]  396 	ldw	x, #0x500a
      008208 CD 85 3E         [ 4]  397 	call	_GPIO_ResetBits
                                    398 ;	main.c: 124: SysCntrl.bootmode = 0;
      00820B 35 00 00 14      [ 1]  399 	mov	_SysCntrl+18, #0x00
      00820F                        400 00126$:
                                    401 ;	main.c: 127: SetTimer(0, TIMER_50_MS);
      00820F AE 00 05         [ 2]  402 	ldw	x, #0x0005
      008212 4F               [ 1]  403 	clr	a
      008213 CD 80 95         [ 4]  404 	call	_SetTimer
                                    405 ;	main.c: 128: SysCntrl.state = WORK_STATE;
      008216 35 08 00 0A      [ 1]  406 	mov	_SysCntrl+8, #0x08
                                    407 ;	main.c: 133: case WORK_STATE:
      00821A                        408 00129$:
                                    409 ;	main.c: 134: if (ev == timer_0){
      00821A 0D 02            [ 1]  410 	tnz	(0x02, sp)
      00821C 27 0F            [ 1]  411 	jreq	00131$
                                    412 ;	main.c: 135: GPIO_ToggleBits(LED_GOOD);
      00821E A6 08            [ 1]  413 	ld	a, #0x08
      008220 AE 50 00         [ 2]  414 	ldw	x, #0x5000
      008223 CD 85 4A         [ 4]  415 	call	_GPIO_ToggleBits
                                    416 ;	main.c: 136: SetTimer(0, TIMER_1_SEC);
      008226 AE 00 64         [ 2]  417 	ldw	x, #0x0064
      008229 4F               [ 1]  418 	clr	a
      00822A CD 80 95         [ 4]  419 	call	_SetTimer
      00822D                        420 00131$:
                                    421 ;	main.c: 139: if (ev == pwrbtn_off){
      00822D 7B 03            [ 1]  422 	ld	a, (0x03, sp)
      00822F A1 05            [ 1]  423 	cp	a, #0x05
      008231 26 4F            [ 1]  424 	jrne	00138$
                                    425 ;	main.c: 140: GPIO_ResetBits(POWER_CPU);
      008233 A6 40            [ 1]  426 	ld	a, #0x40
      008235 AE 50 05         [ 2]  427 	ldw	x, #0x5005
      008238 CD 85 3E         [ 4]  428 	call	_GPIO_ResetBits
                                    429 ;	main.c: 141: GPIO_ResetBits(ENABLE_DCDC);
      00823B A6 02            [ 1]  430 	ld	a, #0x02
      00823D AE 50 05         [ 2]  431 	ldw	x, #0x5005
      008240 CD 85 3E         [ 4]  432 	call	_GPIO_ResetBits
                                    433 ;	main.c: 142: GPIO_ResetBits(ENABLE_5V);
      008243 A6 04            [ 1]  434 	ld	a, #0x04
      008245 AE 50 05         [ 2]  435 	ldw	x, #0x5005
      008248 CD 85 3E         [ 4]  436 	call	_GPIO_ResetBits
                                    437 ;	main.c: 143: GPIO_ResetBits(PG_SMARC);
      00824B A6 08            [ 1]  438 	ld	a, #0x08
      00824D AE 50 05         [ 2]  439 	ldw	x, #0x5005
      008250 CD 85 3E         [ 4]  440 	call	_GPIO_ResetBits
                                    441 ;	main.c: 144: GPIO_ResetBits(SMARC_BOOTMODE);
      008253 A6 20            [ 1]  442 	ld	a, #0x20
      008255 AE 50 0A         [ 2]  443 	ldw	x, #0x500a
      008258 CD 85 3E         [ 4]  444 	call	_GPIO_ResetBits
                                    445 ;	main.c: 145: GPIO_SetBits(LED_GOOD);
      00825B A6 08            [ 1]  446 	ld	a, #0x08
      00825D AE 50 00         [ 2]  447 	ldw	x, #0x5000
      008260 CD 85 35         [ 4]  448 	call	_GPIO_SetBits
                                    449 ;	main.c: 146: SysCntrl.state = WAIT_PWR_BTN;
      008263 35 00 00 0A      [ 1]  450 	mov	_SysCntrl+8, #0x00
                                    451 ;	main.c: 147: tick(start);
      008267 4F               [ 1]  452 	clr	a
      008268 5B 03            [ 2]  453 	addw	sp, #3
                                    454 ;	main.c: 149: break;
      00826A CC 80 AE         [ 2]  455 	jp	_tick
                                    456 ;	main.c: 150: case PWR_ERROR:
      00826D                        457 00134$:
                                    458 ;	main.c: 151: if ( ev == timer_0){
      00826D 0D 02            [ 1]  459 	tnz	(0x02, sp)
      00826F 27 11            [ 1]  460 	jreq	00138$
                                    461 ;	main.c: 152: GPIO_ToggleBits(LED_PWR);
      008271 A6 01            [ 1]  462 	ld	a, #0x01
      008273 AE 50 0F         [ 2]  463 	ldw	x, #0x500f
      008276 CD 85 4A         [ 4]  464 	call	_GPIO_ToggleBits
                                    465 ;	main.c: 153: SetTimer(0, TIMER_100_MS);
      008279 AE 00 0A         [ 2]  466 	ldw	x, #0x000a
      00827C 4F               [ 1]  467 	clr	a
      00827D 5B 03            [ 2]  468 	addw	sp, #3
      00827F CC 80 95         [ 2]  469 	jp	_SetTimer
                                    470 ;	main.c: 156: }
      008282                        471 00138$:
                                    472 ;	main.c: 157: }
      008282 5B 03            [ 2]  473 	addw	sp, #3
      008284 81               [ 4]  474 	ret
                                    475 ;	main.c: 158: void BtnAction(unsigned int press_time){
                                    476 ;	-----------------------------------------
                                    477 ;	 function BtnAction
                                    478 ;	-----------------------------------------
      008285                        479 _BtnAction:
                                    480 ;	main.c: 159: if(SysCntrl.state == WAIT_PWR_BTN){
                                    481 ;	main.c: 160: if (SysCntrl.btn_press_time >= TIMER_2_SEC){
                                    482 ;	main.c: 159: if(SysCntrl.state == WAIT_PWR_BTN){
      008285 C6 00 0A         [ 1]  483 	ld	a, _SysCntrl+8
      008288 26 17            [ 1]  484 	jrne	00106$
                                    485 ;	main.c: 160: if (SysCntrl.btn_press_time >= TIMER_2_SEC){
      00828A CE 00 11         [ 2]  486 	ldw	x, _SysCntrl+15
      00828D A3 00 C8         [ 2]  487 	cpw	x, #0x00c8
      008290 25 05            [ 1]  488 	jrc	00102$
                                    489 ;	main.c: 161: tick(cpu_bootrom);
      008292 A6 08            [ 1]  490 	ld	a, #0x08
                                    491 ;	main.c: 162: return;
      008294 CC 80 AE         [ 2]  492 	jp	_tick
      008297                        493 00102$:
                                    494 ;	main.c: 164: if (SysCntrl.btn_press_time >= TIMER_50_MS){
      008297 A3 00 05         [ 2]  495 	cpw	x, #0x0005
      00829A 25 05            [ 1]  496 	jrc	00106$
                                    497 ;	main.c: 165: tick(pwrbtn_on);
      00829C A6 04            [ 1]  498 	ld	a, #0x04
                                    499 ;	main.c: 166: return;
      00829E CC 80 AE         [ 2]  500 	jp	_tick
      0082A1                        501 00106$:
                                    502 ;	main.c: 169: if(SysCntrl.state == WORK_STATE){
      0082A1 A1 08            [ 1]  503 	cp	a, #0x08
      0082A3 27 01            [ 1]  504 	jreq	00143$
      0082A5 81               [ 4]  505 	ret
      0082A6                        506 00143$:
                                    507 ;	main.c: 170: if (SysCntrl.btn_press_time >= TIMER_2_SEC){
      0082A6 CE 00 11         [ 2]  508 	ldw	x, _SysCntrl+15
      0082A9 A3 00 C8         [ 2]  509 	cpw	x, #0x00c8
      0082AC 24 01            [ 1]  510 	jrnc	00144$
      0082AE 81               [ 4]  511 	ret
      0082AF                        512 00144$:
                                    513 ;	main.c: 171: tick(pwrbtn_off);
      0082AF A6 05            [ 1]  514 	ld	a, #0x05
                                    515 ;	main.c: 172: return;
                                    516 ;	main.c: 175: }
      0082B1 CC 80 AE         [ 2]  517 	jp	_tick
                                    518 ;	main.c: 177: void ReadInputGpio() {
                                    519 ;	-----------------------------------------
                                    520 ;	 function ReadInputGpio
                                    521 ;	-----------------------------------------
      0082B4                        522 _ReadInputGpio:
      0082B4 52 02            [ 2]  523 	sub	sp, #2
                                    524 ;	main.c: 179: SysCntrl.btn_state = GPIO_ReadInputDataBit(PWR_BTN);
      0082B6 A6 04            [ 1]  525 	ld	a, #0x04
      0082B8 AE 50 00         [ 2]  526 	ldw	x, #0x5000
      0082BB CD 85 56         [ 4]  527 	call	_GPIO_ReadInputDataBit
      0082BE 6B 02            [ 1]  528 	ld	(0x02, sp), a
      0082C0 AE 00 0C         [ 2]  529 	ldw	x, #(_SysCntrl+10)
      0082C3 7B 02            [ 1]  530 	ld	a, (0x02, sp)
      0082C5 F7               [ 1]  531 	ld	(x), a
                                    532 ;	main.c: 180: SysCntrl.btn_change_time = SysCntrl.Timer;
      0082C6 CE 00 08         [ 2]  533 	ldw	x, _SysCntrl+6
      0082C9 CF 00 0F         [ 2]  534 	ldw	_SysCntrl+13, x
                                    535 ;	main.c: 182: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
      0082CC C6 00 0C         [ 1]  536 	ld	a, _SysCntrl+10
      0082CF 97               [ 1]  537 	ld	xl, a
      0082D0 C6 00 0B         [ 1]  538 	ld	a, _SysCntrl+9
                                    539 ;	main.c: 185: SysCntrl.btn_is_released = 1;
                                    540 ;	main.c: 186: SysCntrl.btn_press_time = SysCntrl.btn_change_time - SysCntrl.btn_last_change;
                                    541 ;	main.c: 182: if (SysCntrl.btn_state != SysCntrl.btn_state_prev){
      0082D3 11 02            [ 1]  542 	cp	a, (0x02, sp)
      0082D5 27 26            [ 1]  543 	jreq	00104$
                                    544 ;	main.c: 183: SysCntrl.btn_state_prev = SysCntrl.btn_state;
      0082D7 90 AE 00 0B      [ 2]  545 	ldw	y, #(_SysCntrl+9)
      0082DB 9F               [ 1]  546 	ld	a, xl
      0082DC 90 F7            [ 1]  547 	ld	(y), a
                                    548 ;	main.c: 184: if(SysCntrl.btn_state != RESET){
                                    549 ;	main.c: 186: SysCntrl.btn_press_time = SysCntrl.btn_change_time - SysCntrl.btn_last_change;
                                    550 ;	main.c: 184: if(SysCntrl.btn_state != RESET){
      0082DE C6 00 0C         [ 1]  551 	ld	a, _SysCntrl+10
      0082E1 27 14            [ 1]  552 	jreq	00102$
                                    553 ;	main.c: 185: SysCntrl.btn_is_released = 1;
      0082E3 35 01 00 13      [ 1]  554 	mov	_SysCntrl+17, #0x01
                                    555 ;	main.c: 186: SysCntrl.btn_press_time = SysCntrl.btn_change_time - SysCntrl.btn_last_change;
      0082E7 90 CE 00 0F      [ 2]  556 	ldw	y, _SysCntrl+13
      0082EB CE 00 0D         [ 2]  557 	ldw	x, _SysCntrl+11
      0082EE 1F 01            [ 2]  558 	ldw	(0x01, sp), x
      0082F0 72 F2 01         [ 2]  559 	subw	y, (0x01, sp)
      0082F3 90 CF 00 11      [ 2]  560 	ldw	_SysCntrl+15, y
      0082F7                        561 00102$:
                                    562 ;	main.c: 188: SysCntrl.btn_last_change = SysCntrl.btn_change_time;
      0082F7 CE 00 0F         [ 2]  563 	ldw	x, _SysCntrl+13
      0082FA CF 00 0D         [ 2]  564 	ldw	_SysCntrl+11, x
      0082FD                        565 00104$:
                                    566 ;	main.c: 191: if (SysCntrl.btn_is_released == 1){
      0082FD C6 00 13         [ 1]  567 	ld	a, _SysCntrl+17
      008300 4A               [ 1]  568 	dec	a
      008301 26 0A            [ 1]  569 	jrne	00106$
                                    570 ;	main.c: 192: BtnAction(SysCntrl.btn_press_time);
      008303 CE 00 11         [ 2]  571 	ldw	x, _SysCntrl+15
      008306 CD 82 85         [ 4]  572 	call	_BtnAction
                                    573 ;	main.c: 193: SysCntrl.btn_is_released = 0;
      008309 35 00 00 13      [ 1]  574 	mov	_SysCntrl+17, #0x00
      00830D                        575 00106$:
                                    576 ;	main.c: 196: if( GPIO_ReadInputDataBit(PG_5V) ){
      00830D A6 10            [ 1]  577 	ld	a, #0x10
      00830F AE 50 05         [ 2]  578 	ldw	x, #0x5005
      008312 CD 85 56         [ 4]  579 	call	_GPIO_ReadInputDataBit
      008315 4D               [ 1]  580 	tnz	a
      008316 27 05            [ 1]  581 	jreq	00108$
                                    582 ;	main.c: 197: tick(pgood_5v);
      008318 A6 06            [ 1]  583 	ld	a, #0x06
      00831A CD 80 AE         [ 4]  584 	call	_tick
      00831D                        585 00108$:
                                    586 ;	main.c: 200: if( GPIO_ReadInputDataBit(CARRIER_PWR_ON) ){
      00831D A6 20            [ 1]  587 	ld	a, #0x20
      00831F AE 50 05         [ 2]  588 	ldw	x, #0x5005
      008322 CD 85 56         [ 4]  589 	call	_GPIO_ReadInputDataBit
      008325 4D               [ 1]  590 	tnz	a
      008326 27 07            [ 1]  591 	jreq	00111$
                                    592 ;	main.c: 201: tick(carrier);
      008328 A6 07            [ 1]  593 	ld	a, #0x07
      00832A 5B 02            [ 2]  594 	addw	sp, #2
      00832C CC 80 AE         [ 2]  595 	jp	_tick
      00832F                        596 00111$:
                                    597 ;	main.c: 204: }
      00832F 5B 02            [ 2]  598 	addw	sp, #2
      008331 81               [ 4]  599 	ret
                                    600 ;	main.c: 206: void TimerMatch()
                                    601 ;	-----------------------------------------
                                    602 ;	 function TimerMatch
                                    603 ;	-----------------------------------------
      008332                        604 _TimerMatch:
                                    605 ;	main.c: 208: if (!bMainTimer) {
      008332 C6 00 01         [ 1]  606 	ld	a, _bMainTimer+0
      008335 26 01            [ 1]  607 	jrne	00102$
                                    608 ;	main.c: 209: return;
      008337 81               [ 4]  609 	ret
      008338                        610 00102$:
                                    611 ;	main.c: 211: bMainTimer = 0;
      008338 72 5F 00 01      [ 1]  612 	clr	_bMainTimer+0
                                    613 ;	main.c: 212: SysCntrl.Timer++;
      00833C CE 00 08         [ 2]  614 	ldw	x, _SysCntrl+6
      00833F 5C               [ 1]  615 	incw	x
      008340 CF 00 08         [ 2]  616 	ldw	_SysCntrl+6, x
                                    617 ;	main.c: 215: if (SysCntrl.Timer_0) { 
      008343 CE 00 02         [ 2]  618 	ldw	x, _SysCntrl+0
      008346 5D               [ 2]  619 	tnzw	x
      008347 27 0C            [ 1]  620 	jreq	00106$
                                    621 ;	main.c: 216: SysCntrl.Timer_0--;
      008349 5A               [ 2]  622 	decw	x
      00834A CF 00 02         [ 2]  623 	ldw	_SysCntrl+0, x
                                    624 ;	main.c: 217: if (!SysCntrl.Timer_0) {
      00834D 5D               [ 2]  625 	tnzw	x
      00834E 26 05            [ 1]  626 	jrne	00106$
                                    627 ;	main.c: 218: tick(timer_0);
      008350 A6 01            [ 1]  628 	ld	a, #0x01
      008352 CD 80 AE         [ 4]  629 	call	_tick
      008355                        630 00106$:
                                    631 ;	main.c: 223: if (SysCntrl.Timer_1) { 
      008355 CE 00 04         [ 2]  632 	ldw	x, _SysCntrl+2
      008358 5D               [ 2]  633 	tnzw	x
      008359 27 0C            [ 1]  634 	jreq	00110$
                                    635 ;	main.c: 224: SysCntrl.Timer_1--;
      00835B 5A               [ 2]  636 	decw	x
      00835C CF 00 04         [ 2]  637 	ldw	_SysCntrl+2, x
                                    638 ;	main.c: 225: if (!SysCntrl.Timer_1) {
      00835F 5D               [ 2]  639 	tnzw	x
      008360 26 05            [ 1]  640 	jrne	00110$
                                    641 ;	main.c: 226: tick(timer_1);
      008362 A6 02            [ 1]  642 	ld	a, #0x02
      008364 CD 80 AE         [ 4]  643 	call	_tick
      008367                        644 00110$:
                                    645 ;	main.c: 231: if (SysCntrl.Timer_2) {
      008367 CE 00 06         [ 2]  646 	ldw	x, _SysCntrl+4
      00836A 5D               [ 2]  647 	tnzw	x
      00836B 26 01            [ 1]  648 	jrne	00157$
      00836D 81               [ 4]  649 	ret
      00836E                        650 00157$:
                                    651 ;	main.c: 232: SysCntrl.Timer_2--;
      00836E 5A               [ 2]  652 	decw	x
      00836F CF 00 06         [ 2]  653 	ldw	_SysCntrl+4, x
                                    654 ;	main.c: 233: if (!SysCntrl.Timer_2) {
      008372 5D               [ 2]  655 	tnzw	x
      008373 27 01            [ 1]  656 	jreq	00158$
      008375 81               [ 4]  657 	ret
      008376                        658 00158$:
                                    659 ;	main.c: 234: tick(timer_2);
      008376 A6 03            [ 1]  660 	ld	a, #0x03
                                    661 ;	main.c: 237: }
      008378 CC 80 AE         [ 2]  662 	jp	_tick
                                    663 ;	main.c: 241: INTERRUPT_HANDLER(IRQ_Handler_TIM4, 25)
                                    664 ;	-----------------------------------------
                                    665 ;	 function IRQ_Handler_TIM4
                                    666 ;	-----------------------------------------
      00837B                        667 _IRQ_Handler_TIM4:
      00837B 4F               [ 1]  668 	clr	a
      00837C 62               [ 2]  669 	div	x, a
                                    670 ;	main.c: 243: bMainTimer = 1;
      00837D 35 01 00 01      [ 1]  671 	mov	_bMainTimer+0, #0x01
                                    672 ;	main.c: 244: TIM4_ClearITPendingBit(TIM4_IT_Update);
      008381 A6 01            [ 1]  673 	ld	a, #0x01
      008383 CD 89 B6         [ 4]  674 	call	_TIM4_ClearITPendingBit
                                    675 ;	main.c: 245: }
      008386 80               [11]  676 	iret
                                    677 ;	main.c: 247: int main( void )
                                    678 ;	-----------------------------------------
                                    679 ;	 function main
                                    680 ;	-----------------------------------------
      008387                        681 _main:
                                    682 ;	main.c: 249: disableInterrupts();
      008387 9B               [ 1]  683 	sim;	
                                    684 ;	main.c: 251: GPIO_DeInit(GPIOA);
      008388 AE 50 00         [ 2]  685 	ldw	x, #0x5000
      00838B CD 84 7C         [ 4]  686 	call	_GPIO_DeInit
                                    687 ;	main.c: 252: GPIO_DeInit(GPIOB);
      00838E AE 50 05         [ 2]  688 	ldw	x, #0x5005
      008391 CD 84 7C         [ 4]  689 	call	_GPIO_DeInit
                                    690 ;	main.c: 253: GPIO_DeInit(GPIOC);
      008394 AE 50 0A         [ 2]  691 	ldw	x, #0x500a
      008397 CD 84 7C         [ 4]  692 	call	_GPIO_DeInit
                                    693 ;	main.c: 254: GPIO_DeInit(GPIOD);
      00839A AE 50 0F         [ 2]  694 	ldw	x, #0x500f
      00839D CD 84 7C         [ 4]  695 	call	_GPIO_DeInit
                                    696 ;	main.c: 256: GPIO_Init(LED_GOOD, GPIO_Mode_Out_PP_High_Fast);
      0083A0 4B F0            [ 1]  697 	push	#0xf0
      0083A2 A6 08            [ 1]  698 	ld	a, #0x08
      0083A4 AE 50 00         [ 2]  699 	ldw	x, #0x5000
      0083A7 CD 84 8A         [ 4]  700 	call	_GPIO_Init
                                    701 ;	main.c: 257: GPIO_Init(LED_PWR, GPIO_Mode_Out_PP_Low_Fast);
      0083AA 4B E0            [ 1]  702 	push	#0xe0
      0083AC A6 01            [ 1]  703 	ld	a, #0x01
      0083AE AE 50 0F         [ 2]  704 	ldw	x, #0x500f
      0083B1 CD 84 8A         [ 4]  705 	call	_GPIO_Init
                                    706 ;	main.c: 258: GPIO_Init(ENABLE_DCDC, GPIO_Mode_Out_PP_Low_Fast);
      0083B4 4B E0            [ 1]  707 	push	#0xe0
      0083B6 A6 02            [ 1]  708 	ld	a, #0x02
      0083B8 AE 50 05         [ 2]  709 	ldw	x, #0x5005
      0083BB CD 84 8A         [ 4]  710 	call	_GPIO_Init
                                    711 ;	main.c: 259: GPIO_Init(ENABLE_5V, GPIO_Mode_Out_PP_Low_Fast);
      0083BE 4B E0            [ 1]  712 	push	#0xe0
      0083C0 A6 04            [ 1]  713 	ld	a, #0x04
      0083C2 AE 50 05         [ 2]  714 	ldw	x, #0x5005
      0083C5 CD 84 8A         [ 4]  715 	call	_GPIO_Init
                                    716 ;	main.c: 260: GPIO_Init(PG_SMARC, GPIO_Mode_Out_PP_Low_Fast);
      0083C8 4B E0            [ 1]  717 	push	#0xe0
      0083CA A6 08            [ 1]  718 	ld	a, #0x08
      0083CC AE 50 05         [ 2]  719 	ldw	x, #0x5005
      0083CF CD 84 8A         [ 4]  720 	call	_GPIO_Init
                                    721 ;	main.c: 261: GPIO_Init(POWER_CPU, GPIO_Mode_Out_PP_Low_Fast);
      0083D2 4B E0            [ 1]  722 	push	#0xe0
      0083D4 A6 40            [ 1]  723 	ld	a, #0x40
      0083D6 AE 50 05         [ 2]  724 	ldw	x, #0x5005
      0083D9 CD 84 8A         [ 4]  725 	call	_GPIO_Init
                                    726 ;	main.c: 262: GPIO_Init(RESET_CPU, GPIO_Mode_Out_PP_Low_Fast);
      0083DC 4B E0            [ 1]  727 	push	#0xe0
      0083DE A6 80            [ 1]  728 	ld	a, #0x80
      0083E0 AE 50 05         [ 2]  729 	ldw	x, #0x5005
      0083E3 CD 84 8A         [ 4]  730 	call	_GPIO_Init
                                    731 ;	main.c: 263: GPIO_Init(WDOG_OUT, GPIO_Mode_Out_PP_Low_Fast);
      0083E6 4B E0            [ 1]  732 	push	#0xe0
      0083E8 A6 10            [ 1]  733 	ld	a, #0x10
      0083EA AE 50 0A         [ 2]  734 	ldw	x, #0x500a
      0083ED CD 84 8A         [ 4]  735 	call	_GPIO_Init
                                    736 ;	main.c: 265: GPIO_Init(PWR_BTN, GPIO_Mode_In_PU_No_IT);
      0083F0 4B 40            [ 1]  737 	push	#0x40
      0083F2 A6 04            [ 1]  738 	ld	a, #0x04
      0083F4 AE 50 00         [ 2]  739 	ldw	x, #0x5000
      0083F7 CD 84 8A         [ 4]  740 	call	_GPIO_Init
                                    741 ;	main.c: 266: GPIO_Init(PG_5V, GPIO_Mode_In_PU_No_IT);
      0083FA 4B 40            [ 1]  742 	push	#0x40
      0083FC A6 10            [ 1]  743 	ld	a, #0x10
      0083FE AE 50 05         [ 2]  744 	ldw	x, #0x5005
      008401 CD 84 8A         [ 4]  745 	call	_GPIO_Init
                                    746 ;	main.c: 267: GPIO_Init(CARRIER_PWR_ON, GPIO_Mode_In_PU_No_IT);
      008404 4B 40            [ 1]  747 	push	#0x40
      008406 A6 20            [ 1]  748 	ld	a, #0x20
      008408 AE 50 05         [ 2]  749 	ldw	x, #0x5005
      00840B CD 84 8A         [ 4]  750 	call	_GPIO_Init
                                    751 ;	main.c: 268: GPIO_Init(WDOG_IN, GPIO_Mode_In_PU_No_IT);
      00840E 4B 40            [ 1]  752 	push	#0x40
      008410 A6 01            [ 1]  753 	ld	a, #0x01
      008412 AE 50 05         [ 2]  754 	ldw	x, #0x5005
      008415 CD 84 8A         [ 4]  755 	call	_GPIO_Init
                                    756 ;	main.c: 269: GPIO_Init(SMARC_BOOTMODE, GPIO_Mode_Out_PP_Low_Fast);
      008418 4B E0            [ 1]  757 	push	#0xe0
      00841A A6 20            [ 1]  758 	ld	a, #0x20
      00841C AE 50 0A         [ 2]  759 	ldw	x, #0x500a
      00841F CD 84 8A         [ 4]  760 	call	_GPIO_Init
                                    761 ;	main.c: 274: CLK_DeInit();
      008422 CD 85 69         [ 4]  762 	call	_CLK_DeInit
                                    763 ;	main.c: 275: CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
      008425 4F               [ 1]  764 	clr	a
      008426 CD 86 90         [ 4]  765 	call	_CLK_SYSCLKDivConfig
                                    766 ;	main.c: 276: CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
      008429 4B 01            [ 1]  767 	push	#0x01
      00842B A6 02            [ 1]  768 	ld	a, #0x02
      00842D CD 86 B8         [ 4]  769 	call	_CLK_PeripheralClockConfig
                                    770 ;	main.c: 277: CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
      008430 4B 01            [ 1]  771 	push	#0x01
      008432 A6 05            [ 1]  772 	ld	a, #0x05
      008434 CD 86 B8         [ 4]  773 	call	_CLK_PeripheralClockConfig
                                    774 ;	main.c: 279: TIM4_DeInit();
      008437 CD 88 84         [ 4]  775 	call	_TIM4_DeInit
                                    776 ;	main.c: 281: TIM4_Cmd(DISABLE); 
      00843A 4F               [ 1]  777 	clr	a
      00843B CD 89 3F         [ 4]  778 	call	_TIM4_Cmd
                                    779 ;	main.c: 282: TIM4_TimeBaseInit(TIM4_Prescaler_1024, 156);
      00843E 4B 9C            [ 1]  780 	push	#0x9c
      008440 A6 0A            [ 1]  781 	ld	a, #0x0a
      008442 CD 88 A5         [ 4]  782 	call	_TIM4_TimeBaseInit
                                    783 ;	main.c: 283: TIM4_ClearFlag(TIM4_FLAG_Update);
      008445 A6 01            [ 1]  784 	ld	a, #0x01
      008447 CD 89 93         [ 4]  785 	call	_TIM4_ClearFlag
                                    786 ;	main.c: 284: TIM4_ITConfig(TIM4_IT_Update, ENABLE);
      00844A 4B 01            [ 1]  787 	push	#0x01
      00844C A6 01            [ 1]  788 	ld	a, #0x01
      00844E CD 89 57         [ 4]  789 	call	_TIM4_ITConfig
                                    790 ;	main.c: 285: TIM4_Cmd(ENABLE);       // let's go
      008451 A6 01            [ 1]  791 	ld	a, #0x01
      008453 CD 89 3F         [ 4]  792 	call	_TIM4_Cmd
                                    793 ;	main.c: 286: enableInterrupts();
      008456 9A               [ 1]  794 	rim;	
                                    795 ;	main.c: 289: bMainTimer = 0;
      008457 72 5F 00 01      [ 1]  796 	clr	_bMainTimer+0
                                    797 ;	main.c: 290: SysCntrl.btn_state = SET;
      00845B 35 01 00 0C      [ 1]  798 	mov	_SysCntrl+10, #0x01
                                    799 ;	main.c: 291: SysCntrl.btn_state_prev = SET;
      00845F 35 01 00 0B      [ 1]  800 	mov	_SysCntrl+9, #0x01
                                    801 ;	main.c: 292: SysCntrl.btn_change_time = 0;
      008463 AE 00 0F         [ 2]  802 	ldw	x, #(_SysCntrl+13)
      008466 6F 01            [ 1]  803 	clr	(0x1, x)
      008468 7F               [ 1]  804 	clr	(x)
                                    805 ;	main.c: 293: SysCntrl.btn_last_change = 0;
      008469 AE 00 0D         [ 2]  806 	ldw	x, #(_SysCntrl+11)
      00846C 6F 01            [ 1]  807 	clr	(0x1, x)
      00846E 7F               [ 1]  808 	clr	(x)
                                    809 ;	main.c: 295: tick(start);
      00846F 4F               [ 1]  810 	clr	a
      008470 CD 80 AE         [ 4]  811 	call	_tick
                                    812 ;	main.c: 296: while (1) {
      008473                        813 00102$:
                                    814 ;	main.c: 297: ReadInputGpio();
      008473 CD 82 B4         [ 4]  815 	call	_ReadInputGpio
                                    816 ;	main.c: 298: TimerMatch();
      008476 CD 83 32         [ 4]  817 	call	_TimerMatch
      008479 20 F8            [ 2]  818 	jra	00102$
                                    819 ;	main.c: 302: }
      00847B 81               [ 4]  820 	ret
                                    821 	.area CODE
                                    822 	.area CONST
                                    823 	.area INITIALIZER
                                    824 	.area CABS (ABS)
