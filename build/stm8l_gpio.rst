                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8l_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_DeInit
                                     12 	.globl _GPIO_Init
                                     13 	.globl _GPIO_ExternalPullUpConfig
                                     14 	.globl _GPIO_Write
                                     15 	.globl _GPIO_WriteBit
                                     16 	.globl _GPIO_SetBits
                                     17 	.globl _GPIO_ResetBits
                                     18 	.globl _GPIO_ToggleBits
                                     19 	.globl _GPIO_ReadInputData
                                     20 	.globl _GPIO_ReadInputDataBit
                                     21 	.globl _GPIO_ReadOutputDataBit
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; absolute external ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DABS (ABS)
                                     34 
                                     35 ; default segment ordering for linker
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area CONST
                                     40 	.area INITIALIZER
                                     41 	.area CODE
                                     42 
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area GSINIT
                                     50 ;--------------------------------------------------------
                                     51 ; Home
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area HOME
                                     55 ;--------------------------------------------------------
                                     56 ; code
                                     57 ;--------------------------------------------------------
                                     58 	.area CODE
                                     59 ;	libs/stm8l_gpio.c: 3: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
                                     60 ;	-----------------------------------------
                                     61 ;	 function GPIO_DeInit
                                     62 ;	-----------------------------------------
      0084EB                         63 _GPIO_DeInit:
                                     64 ;	libs/stm8l_gpio.c: 5: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0084EB 16 03            [ 2]   65 	ldw	y, (0x03, sp)
      0084ED 93               [ 1]   66 	ldw	x, y
      0084EE 6F 04            [ 1]   67 	clr	(0x0004, x)
                                     68 ;	libs/stm8l_gpio.c: 6: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0084F0 90 7F            [ 1]   69 	clr	(y)
                                     70 ;	libs/stm8l_gpio.c: 7: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0084F2 93               [ 1]   71 	ldw	x, y
      0084F3 5C               [ 1]   72 	incw	x
      0084F4 5C               [ 1]   73 	incw	x
      0084F5 7F               [ 1]   74 	clr	(x)
                                     75 ;	libs/stm8l_gpio.c: 8: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0084F6 93               [ 1]   76 	ldw	x, y
      0084F7 6F 03            [ 1]   77 	clr	(0x0003, x)
                                     78 ;	libs/stm8l_gpio.c: 9: }
      0084F9 81               [ 4]   79 	ret
                                     80 ;	libs/stm8l_gpio.c: 12: void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     81 ;	-----------------------------------------
                                     82 ;	 function GPIO_Init
                                     83 ;	-----------------------------------------
      0084FA                         84 _GPIO_Init:
      0084FA 52 05            [ 2]   85 	sub	sp, #5
                                     86 ;	libs/stm8l_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0084FC 16 08            [ 2]   87 	ldw	y, (0x08, sp)
      0084FE 93               [ 1]   88 	ldw	x, y
      0084FF 1C 00 04         [ 2]   89 	addw	x, #0x0004
      008502 1F 01            [ 2]   90 	ldw	(0x01, sp), x
      008504 F6               [ 1]   91 	ld	a, (x)
      008505 88               [ 1]   92 	push	a
      008506 7B 0B            [ 1]   93 	ld	a, (0x0b, sp)
      008508 43               [ 1]   94 	cpl	a
      008509 6B 04            [ 1]   95 	ld	(0x04, sp), a
      00850B 84               [ 1]   96 	pop	a
      00850C 14 03            [ 1]   97 	and	a, (0x03, sp)
      00850E 1E 01            [ 2]   98 	ldw	x, (0x01, sp)
      008510 F7               [ 1]   99 	ld	(x), a
                                    100 ;	libs/stm8l_gpio.c: 38: GPIOx->DDR |= GPIO_Pin;
      008511 93               [ 1]  101 	ldw	x, y
      008512 5C               [ 1]  102 	incw	x
      008513 5C               [ 1]  103 	incw	x
      008514 1F 04            [ 2]  104 	ldw	(0x04, sp), x
                                    105 ;	libs/stm8l_gpio.c: 28: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      008516 0D 0B            [ 1]  106 	tnz	(0x0b, sp)
      008518 2A 1E            [ 1]  107 	jrpl	00105$
                                    108 ;	libs/stm8l_gpio.c: 32: GPIOx->ODR |= GPIO_Pin;
      00851A 90 F6            [ 1]  109 	ld	a, (y)
                                    110 ;	libs/stm8l_gpio.c: 30: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      00851C 88               [ 1]  111 	push	a
      00851D 7B 0C            [ 1]  112 	ld	a, (0x0c, sp)
      00851F A5 10            [ 1]  113 	bcp	a, #0x10
      008521 84               [ 1]  114 	pop	a
      008522 27 06            [ 1]  115 	jreq	00102$
                                    116 ;	libs/stm8l_gpio.c: 32: GPIOx->ODR |= GPIO_Pin;
      008524 1A 0A            [ 1]  117 	or	a, (0x0a, sp)
      008526 90 F7            [ 1]  118 	ld	(y), a
      008528 20 04            [ 2]  119 	jra	00103$
      00852A                        120 00102$:
                                    121 ;	libs/stm8l_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      00852A 14 03            [ 1]  122 	and	a, (0x03, sp)
      00852C 90 F7            [ 1]  123 	ld	(y), a
      00852E                        124 00103$:
                                    125 ;	libs/stm8l_gpio.c: 38: GPIOx->DDR |= GPIO_Pin;
      00852E 1E 04            [ 2]  126 	ldw	x, (0x04, sp)
      008530 F6               [ 1]  127 	ld	a, (x)
      008531 1A 0A            [ 1]  128 	or	a, (0x0a, sp)
      008533 1E 04            [ 2]  129 	ldw	x, (0x04, sp)
      008535 F7               [ 1]  130 	ld	(x), a
      008536 20 08            [ 2]  131 	jra	00106$
      008538                        132 00105$:
                                    133 ;	libs/stm8l_gpio.c: 42: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      008538 1E 04            [ 2]  134 	ldw	x, (0x04, sp)
      00853A F6               [ 1]  135 	ld	a, (x)
      00853B 14 03            [ 1]  136 	and	a, (0x03, sp)
      00853D 1E 04            [ 2]  137 	ldw	x, (0x04, sp)
      00853F F7               [ 1]  138 	ld	(x), a
      008540                        139 00106$:
                                    140 ;	libs/stm8l_gpio.c: 51: GPIOx->CR1 |= GPIO_Pin;
      008540 93               [ 1]  141 	ldw	x, y
      008541 1C 00 03         [ 2]  142 	addw	x, #0x0003
      008544 F6               [ 1]  143 	ld	a, (x)
                                    144 ;	libs/stm8l_gpio.c: 49: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      008545 88               [ 1]  145 	push	a
      008546 7B 0C            [ 1]  146 	ld	a, (0x0c, sp)
      008548 A5 40            [ 1]  147 	bcp	a, #0x40
      00854A 84               [ 1]  148 	pop	a
      00854B 27 05            [ 1]  149 	jreq	00108$
                                    150 ;	libs/stm8l_gpio.c: 51: GPIOx->CR1 |= GPIO_Pin;
      00854D 1A 0A            [ 1]  151 	or	a, (0x0a, sp)
      00854F F7               [ 1]  152 	ld	(x), a
      008550 20 03            [ 2]  153 	jra	00109$
      008552                        154 00108$:
                                    155 ;	libs/stm8l_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008552 14 03            [ 1]  156 	and	a, (0x03, sp)
      008554 F7               [ 1]  157 	ld	(x), a
      008555                        158 00109$:
                                    159 ;	libs/stm8l_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008555 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      008557 F6               [ 1]  161 	ld	a, (x)
                                    162 ;	libs/stm8l_gpio.c: 61: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      008558 88               [ 1]  163 	push	a
      008559 7B 0C            [ 1]  164 	ld	a, (0x0c, sp)
      00855B A5 20            [ 1]  165 	bcp	a, #0x20
      00855D 84               [ 1]  166 	pop	a
      00855E 27 07            [ 1]  167 	jreq	00111$
                                    168 ;	libs/stm8l_gpio.c: 63: GPIOx->CR2 |= GPIO_Pin;
      008560 1A 0A            [ 1]  169 	or	a, (0x0a, sp)
      008562 1E 01            [ 2]  170 	ldw	x, (0x01, sp)
      008564 F7               [ 1]  171 	ld	(x), a
      008565 20 05            [ 2]  172 	jra	00113$
      008567                        173 00111$:
                                    174 ;	libs/stm8l_gpio.c: 66: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008567 14 03            [ 1]  175 	and	a, (0x03, sp)
      008569 1E 01            [ 2]  176 	ldw	x, (0x01, sp)
      00856B F7               [ 1]  177 	ld	(x), a
      00856C                        178 00113$:
                                    179 ;	libs/stm8l_gpio.c: 69: }
      00856C 5B 05            [ 2]  180 	addw	sp, #5
      00856E 81               [ 4]  181 	ret
                                    182 ;	libs/stm8l_gpio.c: 71: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
                                    183 ;	-----------------------------------------
                                    184 ;	 function GPIO_ExternalPullUpConfig
                                    185 ;	-----------------------------------------
      00856F                        186 _GPIO_ExternalPullUpConfig:
      00856F 88               [ 1]  187 	push	a
                                    188 ;	libs/stm8l_gpio.c: 79: GPIOx->CR1 |= GPIO_Pin;
      008570 1E 04            [ 2]  189 	ldw	x, (0x04, sp)
      008572 1C 00 03         [ 2]  190 	addw	x, #0x0003
      008575 F6               [ 1]  191 	ld	a, (x)
                                    192 ;	libs/stm8l_gpio.c: 77: if (NewState != DISABLE) /* External Pull-Up Set*/
      008576 0D 07            [ 1]  193 	tnz	(0x07, sp)
      008578 27 05            [ 1]  194 	jreq	00102$
                                    195 ;	libs/stm8l_gpio.c: 79: GPIOx->CR1 |= GPIO_Pin;
      00857A 1A 06            [ 1]  196 	or	a, (0x06, sp)
      00857C F7               [ 1]  197 	ld	(x), a
      00857D 20 0A            [ 2]  198 	jra	00104$
      00857F                        199 00102$:
                                    200 ;	libs/stm8l_gpio.c: 82: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      00857F 88               [ 1]  201 	push	a
      008580 7B 07            [ 1]  202 	ld	a, (0x07, sp)
      008582 43               [ 1]  203 	cpl	a
      008583 6B 02            [ 1]  204 	ld	(0x02, sp), a
      008585 84               [ 1]  205 	pop	a
      008586 14 01            [ 1]  206 	and	a, (0x01, sp)
      008588 F7               [ 1]  207 	ld	(x), a
      008589                        208 00104$:
                                    209 ;	libs/stm8l_gpio.c: 84: }
      008589 84               [ 1]  210 	pop	a
      00858A 81               [ 4]  211 	ret
                                    212 ;	libs/stm8l_gpio.c: 87: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
                                    213 ;	-----------------------------------------
                                    214 ;	 function GPIO_Write
                                    215 ;	-----------------------------------------
      00858B                        216 _GPIO_Write:
                                    217 ;	libs/stm8l_gpio.c: 89: GPIOx->ODR = GPIO_PortVal;
      00858B 1E 03            [ 2]  218 	ldw	x, (0x03, sp)
      00858D 7B 05            [ 1]  219 	ld	a, (0x05, sp)
      00858F F7               [ 1]  220 	ld	(x), a
                                    221 ;	libs/stm8l_gpio.c: 90: }
      008590 81               [ 4]  222 	ret
                                    223 ;	libs/stm8l_gpio.c: 92: void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
                                    224 ;	-----------------------------------------
                                    225 ;	 function GPIO_WriteBit
                                    226 ;	-----------------------------------------
      008591                        227 _GPIO_WriteBit:
      008591 88               [ 1]  228 	push	a
                                    229 ;	libs/stm8l_gpio.c: 100: GPIOx->ODR |= GPIO_Pin;
      008592 1E 04            [ 2]  230 	ldw	x, (0x04, sp)
      008594 F6               [ 1]  231 	ld	a, (x)
                                    232 ;	libs/stm8l_gpio.c: 98: if (GPIO_BitVal != RESET)
      008595 0D 07            [ 1]  233 	tnz	(0x07, sp)
      008597 27 05            [ 1]  234 	jreq	00102$
                                    235 ;	libs/stm8l_gpio.c: 100: GPIOx->ODR |= GPIO_Pin;
      008599 1A 06            [ 1]  236 	or	a, (0x06, sp)
      00859B F7               [ 1]  237 	ld	(x), a
      00859C 20 0A            [ 2]  238 	jra	00104$
      00859E                        239 00102$:
                                    240 ;	libs/stm8l_gpio.c: 105: GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
      00859E 88               [ 1]  241 	push	a
      00859F 7B 07            [ 1]  242 	ld	a, (0x07, sp)
      0085A1 43               [ 1]  243 	cpl	a
      0085A2 6B 02            [ 1]  244 	ld	(0x02, sp), a
      0085A4 84               [ 1]  245 	pop	a
      0085A5 14 01            [ 1]  246 	and	a, (0x01, sp)
      0085A7 F7               [ 1]  247 	ld	(x), a
      0085A8                        248 00104$:
                                    249 ;	libs/stm8l_gpio.c: 107: }
      0085A8 84               [ 1]  250 	pop	a
      0085A9 81               [ 4]  251 	ret
                                    252 ;	libs/stm8l_gpio.c: 109: void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
                                    253 ;	-----------------------------------------
                                    254 ;	 function GPIO_SetBits
                                    255 ;	-----------------------------------------
      0085AA                        256 _GPIO_SetBits:
                                    257 ;	libs/stm8l_gpio.c: 111: GPIOx->ODR |= GPIO_Pin;
      0085AA 1E 03            [ 2]  258 	ldw	x, (0x03, sp)
      0085AC F6               [ 1]  259 	ld	a, (x)
      0085AD 1A 05            [ 1]  260 	or	a, (0x05, sp)
      0085AF F7               [ 1]  261 	ld	(x), a
                                    262 ;	libs/stm8l_gpio.c: 112: }
      0085B0 81               [ 4]  263 	ret
                                    264 ;	libs/stm8l_gpio.c: 114: void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
                                    265 ;	-----------------------------------------
                                    266 ;	 function GPIO_ResetBits
                                    267 ;	-----------------------------------------
      0085B1                        268 _GPIO_ResetBits:
      0085B1 88               [ 1]  269 	push	a
                                    270 ;	libs/stm8l_gpio.c: 116: GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
      0085B2 1E 04            [ 2]  271 	ldw	x, (0x04, sp)
      0085B4 F6               [ 1]  272 	ld	a, (x)
      0085B5 6B 01            [ 1]  273 	ld	(0x01, sp), a
      0085B7 7B 06            [ 1]  274 	ld	a, (0x06, sp)
      0085B9 43               [ 1]  275 	cpl	a
      0085BA 14 01            [ 1]  276 	and	a, (0x01, sp)
      0085BC F7               [ 1]  277 	ld	(x), a
                                    278 ;	libs/stm8l_gpio.c: 117: }
      0085BD 84               [ 1]  279 	pop	a
      0085BE 81               [ 4]  280 	ret
                                    281 ;	libs/stm8l_gpio.c: 119: void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
                                    282 ;	-----------------------------------------
                                    283 ;	 function GPIO_ToggleBits
                                    284 ;	-----------------------------------------
      0085BF                        285 _GPIO_ToggleBits:
                                    286 ;	libs/stm8l_gpio.c: 121: GPIOx->ODR ^= GPIO_Pin;
      0085BF 1E 03            [ 2]  287 	ldw	x, (0x03, sp)
      0085C1 F6               [ 1]  288 	ld	a, (x)
      0085C2 18 05            [ 1]  289 	xor	a, (0x05, sp)
      0085C4 F7               [ 1]  290 	ld	(x), a
                                    291 ;	libs/stm8l_gpio.c: 122: }
      0085C5 81               [ 4]  292 	ret
                                    293 ;	libs/stm8l_gpio.c: 124: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    294 ;	-----------------------------------------
                                    295 ;	 function GPIO_ReadInputData
                                    296 ;	-----------------------------------------
      0085C6                        297 _GPIO_ReadInputData:
                                    298 ;	libs/stm8l_gpio.c: 126: return ((uint8_t)GPIOx->IDR);
      0085C6 1E 03            [ 2]  299 	ldw	x, (0x03, sp)
      0085C8 E6 01            [ 1]  300 	ld	a, (0x1, x)
                                    301 ;	libs/stm8l_gpio.c: 127: }
      0085CA 81               [ 4]  302 	ret
                                    303 ;	libs/stm8l_gpio.c: 129: BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    304 ;	-----------------------------------------
                                    305 ;	 function GPIO_ReadInputDataBit
                                    306 ;	-----------------------------------------
      0085CB                        307 _GPIO_ReadInputDataBit:
                                    308 ;	libs/stm8l_gpio.c: 131: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      0085CB 1E 03            [ 2]  309 	ldw	x, (0x03, sp)
      0085CD E6 01            [ 1]  310 	ld	a, (0x1, x)
      0085CF 14 05            [ 1]  311 	and	a, (0x05, sp)
                                    312 ;	libs/stm8l_gpio.c: 132: }
      0085D1 81               [ 4]  313 	ret
                                    314 ;	libs/stm8l_gpio.c: 134: BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    315 ;	-----------------------------------------
                                    316 ;	 function GPIO_ReadOutputDataBit
                                    317 ;	-----------------------------------------
      0085D2                        318 _GPIO_ReadOutputDataBit:
                                    319 ;	libs/stm8l_gpio.c: 136: return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
      0085D2 1E 03            [ 2]  320 	ldw	x, (0x03, sp)
      0085D4 F6               [ 1]  321 	ld	a, (x)
      0085D5 14 05            [ 1]  322 	and	a, (0x05, sp)
                                    323 ;	libs/stm8l_gpio.c: 137: }
      0085D7 81               [ 4]  324 	ret
                                    325 	.area CODE
                                    326 	.area CONST
                                    327 	.area INITIALIZER
                                    328 	.area CABS (ABS)
