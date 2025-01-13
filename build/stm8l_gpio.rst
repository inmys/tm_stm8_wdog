                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
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
      00847D                         63 _GPIO_DeInit:
                                     64 ;	libs/stm8l_gpio.c: 5: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      00847D 90 93            [ 1]   65 	ldw	y, x
      00847F 6F 04            [ 1]   66 	clr	(0x0004, x)
                                     67 ;	libs/stm8l_gpio.c: 6: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008481 90 7F            [ 1]   68 	clr	(y)
                                     69 ;	libs/stm8l_gpio.c: 7: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      008483 93               [ 1]   70 	ldw	x, y
      008484 5C               [ 1]   71 	incw	x
      008485 5C               [ 1]   72 	incw	x
      008486 7F               [ 1]   73 	clr	(x)
                                     74 ;	libs/stm8l_gpio.c: 8: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      008487 93               [ 1]   75 	ldw	x, y
      008488 6F 03            [ 1]   76 	clr	(0x0003, x)
                                     77 ;	libs/stm8l_gpio.c: 9: }
      00848A 81               [ 4]   78 	ret
                                     79 ;	libs/stm8l_gpio.c: 12: void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     80 ;	-----------------------------------------
                                     81 ;	 function GPIO_Init
                                     82 ;	-----------------------------------------
      00848B                         83 _GPIO_Init:
      00848B 52 06            [ 2]   84 	sub	sp, #6
      00848D 51               [ 1]   85 	exgw	x, y
      00848E 6B 06            [ 1]   86 	ld	(0x06, sp), a
                                     87 ;	libs/stm8l_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008490 93               [ 1]   88 	ldw	x, y
      008491 1C 00 04         [ 2]   89 	addw	x, #0x0004
      008494 1F 01            [ 2]   90 	ldw	(0x01, sp), x
      008496 F6               [ 1]   91 	ld	a, (x)
      008497 88               [ 1]   92 	push	a
      008498 7B 07            [ 1]   93 	ld	a, (0x07, sp)
      00849A 43               [ 1]   94 	cpl	a
      00849B 6B 04            [ 1]   95 	ld	(0x04, sp), a
      00849D 84               [ 1]   96 	pop	a
      00849E 14 03            [ 1]   97 	and	a, (0x03, sp)
      0084A0 1E 01            [ 2]   98 	ldw	x, (0x01, sp)
      0084A2 F7               [ 1]   99 	ld	(x), a
                                    100 ;	libs/stm8l_gpio.c: 38: GPIOx->DDR |= GPIO_Pin;
      0084A3 93               [ 1]  101 	ldw	x, y
      0084A4 5C               [ 1]  102 	incw	x
      0084A5 5C               [ 1]  103 	incw	x
      0084A6 1F 04            [ 2]  104 	ldw	(0x04, sp), x
                                    105 ;	libs/stm8l_gpio.c: 28: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      0084A8 0D 09            [ 1]  106 	tnz	(0x09, sp)
      0084AA 2A 1E            [ 1]  107 	jrpl	00105$
                                    108 ;	libs/stm8l_gpio.c: 32: GPIOx->ODR |= GPIO_Pin;
      0084AC 90 F6            [ 1]  109 	ld	a, (y)
                                    110 ;	libs/stm8l_gpio.c: 30: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      0084AE 88               [ 1]  111 	push	a
      0084AF 7B 0A            [ 1]  112 	ld	a, (0x0a, sp)
      0084B1 A5 10            [ 1]  113 	bcp	a, #0x10
      0084B3 84               [ 1]  114 	pop	a
      0084B4 27 06            [ 1]  115 	jreq	00102$
                                    116 ;	libs/stm8l_gpio.c: 32: GPIOx->ODR |= GPIO_Pin;
      0084B6 1A 06            [ 1]  117 	or	a, (0x06, sp)
      0084B8 90 F7            [ 1]  118 	ld	(y), a
      0084BA 20 04            [ 2]  119 	jra	00103$
      0084BC                        120 00102$:
                                    121 ;	libs/stm8l_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      0084BC 14 03            [ 1]  122 	and	a, (0x03, sp)
      0084BE 90 F7            [ 1]  123 	ld	(y), a
      0084C0                        124 00103$:
                                    125 ;	libs/stm8l_gpio.c: 38: GPIOx->DDR |= GPIO_Pin;
      0084C0 1E 04            [ 2]  126 	ldw	x, (0x04, sp)
      0084C2 F6               [ 1]  127 	ld	a, (x)
      0084C3 1A 06            [ 1]  128 	or	a, (0x06, sp)
      0084C5 1E 04            [ 2]  129 	ldw	x, (0x04, sp)
      0084C7 F7               [ 1]  130 	ld	(x), a
      0084C8 20 08            [ 2]  131 	jra	00106$
      0084CA                        132 00105$:
                                    133 ;	libs/stm8l_gpio.c: 42: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      0084CA 1E 04            [ 2]  134 	ldw	x, (0x04, sp)
      0084CC F6               [ 1]  135 	ld	a, (x)
      0084CD 14 03            [ 1]  136 	and	a, (0x03, sp)
      0084CF 1E 04            [ 2]  137 	ldw	x, (0x04, sp)
      0084D1 F7               [ 1]  138 	ld	(x), a
      0084D2                        139 00106$:
                                    140 ;	libs/stm8l_gpio.c: 51: GPIOx->CR1 |= GPIO_Pin;
      0084D2 93               [ 1]  141 	ldw	x, y
      0084D3 1C 00 03         [ 2]  142 	addw	x, #0x0003
      0084D6 F6               [ 1]  143 	ld	a, (x)
                                    144 ;	libs/stm8l_gpio.c: 49: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      0084D7 88               [ 1]  145 	push	a
      0084D8 7B 0A            [ 1]  146 	ld	a, (0x0a, sp)
      0084DA A5 40            [ 1]  147 	bcp	a, #0x40
      0084DC 84               [ 1]  148 	pop	a
      0084DD 27 05            [ 1]  149 	jreq	00108$
                                    150 ;	libs/stm8l_gpio.c: 51: GPIOx->CR1 |= GPIO_Pin;
      0084DF 1A 06            [ 1]  151 	or	a, (0x06, sp)
      0084E1 F7               [ 1]  152 	ld	(x), a
      0084E2 20 03            [ 2]  153 	jra	00109$
      0084E4                        154 00108$:
                                    155 ;	libs/stm8l_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0084E4 14 03            [ 1]  156 	and	a, (0x03, sp)
      0084E6 F7               [ 1]  157 	ld	(x), a
      0084E7                        158 00109$:
                                    159 ;	libs/stm8l_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0084E7 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      0084E9 F6               [ 1]  161 	ld	a, (x)
                                    162 ;	libs/stm8l_gpio.c: 61: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      0084EA 88               [ 1]  163 	push	a
      0084EB 7B 0A            [ 1]  164 	ld	a, (0x0a, sp)
      0084ED A5 20            [ 1]  165 	bcp	a, #0x20
      0084EF 84               [ 1]  166 	pop	a
      0084F0 27 07            [ 1]  167 	jreq	00111$
                                    168 ;	libs/stm8l_gpio.c: 63: GPIOx->CR2 |= GPIO_Pin;
      0084F2 1A 06            [ 1]  169 	or	a, (0x06, sp)
      0084F4 1E 01            [ 2]  170 	ldw	x, (0x01, sp)
      0084F6 F7               [ 1]  171 	ld	(x), a
      0084F7 20 05            [ 2]  172 	jra	00113$
      0084F9                        173 00111$:
                                    174 ;	libs/stm8l_gpio.c: 66: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0084F9 14 03            [ 1]  175 	and	a, (0x03, sp)
      0084FB 1E 01            [ 2]  176 	ldw	x, (0x01, sp)
      0084FD F7               [ 1]  177 	ld	(x), a
      0084FE                        178 00113$:
                                    179 ;	libs/stm8l_gpio.c: 69: }
      0084FE 5B 06            [ 2]  180 	addw	sp, #6
      008500 85               [ 2]  181 	popw	x
      008501 84               [ 1]  182 	pop	a
      008502 FC               [ 2]  183 	jp	(x)
                                    184 ;	libs/stm8l_gpio.c: 71: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
                                    185 ;	-----------------------------------------
                                    186 ;	 function GPIO_ExternalPullUpConfig
                                    187 ;	-----------------------------------------
      008503                        188 _GPIO_ExternalPullUpConfig:
      008503 88               [ 1]  189 	push	a
                                    190 ;	libs/stm8l_gpio.c: 79: GPIOx->CR1 |= GPIO_Pin;
      008504 1C 00 03         [ 2]  191 	addw	x, #0x0003
      008507 88               [ 1]  192 	push	a
      008508 F6               [ 1]  193 	ld	a, (x)
      008509 6B 02            [ 1]  194 	ld	(0x02, sp), a
      00850B 84               [ 1]  195 	pop	a
                                    196 ;	libs/stm8l_gpio.c: 77: if (NewState != DISABLE) /* External Pull-Up Set*/
      00850C 0D 04            [ 1]  197 	tnz	(0x04, sp)
      00850E 27 05            [ 1]  198 	jreq	00102$
                                    199 ;	libs/stm8l_gpio.c: 79: GPIOx->CR1 |= GPIO_Pin;
      008510 1A 01            [ 1]  200 	or	a, (0x01, sp)
      008512 F7               [ 1]  201 	ld	(x), a
      008513 20 04            [ 2]  202 	jra	00104$
      008515                        203 00102$:
                                    204 ;	libs/stm8l_gpio.c: 82: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008515 43               [ 1]  205 	cpl	a
      008516 14 01            [ 1]  206 	and	a, (0x01, sp)
      008518 F7               [ 1]  207 	ld	(x), a
      008519                        208 00104$:
                                    209 ;	libs/stm8l_gpio.c: 84: }
      008519 84               [ 1]  210 	pop	a
      00851A 85               [ 2]  211 	popw	x
      00851B 84               [ 1]  212 	pop	a
      00851C FC               [ 2]  213 	jp	(x)
                                    214 ;	libs/stm8l_gpio.c: 87: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
                                    215 ;	-----------------------------------------
                                    216 ;	 function GPIO_Write
                                    217 ;	-----------------------------------------
      00851D                        218 _GPIO_Write:
                                    219 ;	libs/stm8l_gpio.c: 89: GPIOx->ODR = GPIO_PortVal;
      00851D F7               [ 1]  220 	ld	(x), a
                                    221 ;	libs/stm8l_gpio.c: 90: }
      00851E 81               [ 4]  222 	ret
                                    223 ;	libs/stm8l_gpio.c: 92: void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
                                    224 ;	-----------------------------------------
                                    225 ;	 function GPIO_WriteBit
                                    226 ;	-----------------------------------------
      00851F                        227 _GPIO_WriteBit:
      00851F 88               [ 1]  228 	push	a
                                    229 ;	libs/stm8l_gpio.c: 100: GPIOx->ODR |= GPIO_Pin;
      008520 88               [ 1]  230 	push	a
      008521 F6               [ 1]  231 	ld	a, (x)
      008522 6B 02            [ 1]  232 	ld	(0x02, sp), a
      008524 84               [ 1]  233 	pop	a
                                    234 ;	libs/stm8l_gpio.c: 98: if (GPIO_BitVal != RESET)
      008525 0D 04            [ 1]  235 	tnz	(0x04, sp)
      008527 27 05            [ 1]  236 	jreq	00102$
                                    237 ;	libs/stm8l_gpio.c: 100: GPIOx->ODR |= GPIO_Pin;
      008529 1A 01            [ 1]  238 	or	a, (0x01, sp)
      00852B F7               [ 1]  239 	ld	(x), a
      00852C 20 04            [ 2]  240 	jra	00104$
      00852E                        241 00102$:
                                    242 ;	libs/stm8l_gpio.c: 105: GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
      00852E 43               [ 1]  243 	cpl	a
      00852F 14 01            [ 1]  244 	and	a, (0x01, sp)
      008531 F7               [ 1]  245 	ld	(x), a
      008532                        246 00104$:
                                    247 ;	libs/stm8l_gpio.c: 107: }
      008532 84               [ 1]  248 	pop	a
      008533 85               [ 2]  249 	popw	x
      008534 84               [ 1]  250 	pop	a
      008535 FC               [ 2]  251 	jp	(x)
                                    252 ;	libs/stm8l_gpio.c: 109: void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
                                    253 ;	-----------------------------------------
                                    254 ;	 function GPIO_SetBits
                                    255 ;	-----------------------------------------
      008536                        256 _GPIO_SetBits:
      008536 88               [ 1]  257 	push	a
      008537 6B 01            [ 1]  258 	ld	(0x01, sp), a
                                    259 ;	libs/stm8l_gpio.c: 111: GPIOx->ODR |= GPIO_Pin;
      008539 F6               [ 1]  260 	ld	a, (x)
      00853A 1A 01            [ 1]  261 	or	a, (0x01, sp)
      00853C F7               [ 1]  262 	ld	(x), a
                                    263 ;	libs/stm8l_gpio.c: 112: }
      00853D 84               [ 1]  264 	pop	a
      00853E 81               [ 4]  265 	ret
                                    266 ;	libs/stm8l_gpio.c: 114: void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
                                    267 ;	-----------------------------------------
                                    268 ;	 function GPIO_ResetBits
                                    269 ;	-----------------------------------------
      00853F                        270 _GPIO_ResetBits:
      00853F 88               [ 1]  271 	push	a
                                    272 ;	libs/stm8l_gpio.c: 116: GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
      008540 88               [ 1]  273 	push	a
      008541 F6               [ 1]  274 	ld	a, (x)
      008542 6B 02            [ 1]  275 	ld	(0x02, sp), a
      008544 84               [ 1]  276 	pop	a
      008545 43               [ 1]  277 	cpl	a
      008546 14 01            [ 1]  278 	and	a, (0x01, sp)
      008548 F7               [ 1]  279 	ld	(x), a
                                    280 ;	libs/stm8l_gpio.c: 117: }
      008549 84               [ 1]  281 	pop	a
      00854A 81               [ 4]  282 	ret
                                    283 ;	libs/stm8l_gpio.c: 119: void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
                                    284 ;	-----------------------------------------
                                    285 ;	 function GPIO_ToggleBits
                                    286 ;	-----------------------------------------
      00854B                        287 _GPIO_ToggleBits:
      00854B 88               [ 1]  288 	push	a
      00854C 6B 01            [ 1]  289 	ld	(0x01, sp), a
                                    290 ;	libs/stm8l_gpio.c: 121: GPIOx->ODR ^= GPIO_Pin;
      00854E F6               [ 1]  291 	ld	a, (x)
      00854F 18 01            [ 1]  292 	xor	a, (0x01, sp)
      008551 F7               [ 1]  293 	ld	(x), a
                                    294 ;	libs/stm8l_gpio.c: 122: }
      008552 84               [ 1]  295 	pop	a
      008553 81               [ 4]  296 	ret
                                    297 ;	libs/stm8l_gpio.c: 124: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    298 ;	-----------------------------------------
                                    299 ;	 function GPIO_ReadInputData
                                    300 ;	-----------------------------------------
      008554                        301 _GPIO_ReadInputData:
                                    302 ;	libs/stm8l_gpio.c: 126: return ((uint8_t)GPIOx->IDR);
      008554 E6 01            [ 1]  303 	ld	a, (0x1, x)
                                    304 ;	libs/stm8l_gpio.c: 127: }
      008556 81               [ 4]  305 	ret
                                    306 ;	libs/stm8l_gpio.c: 129: BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    307 ;	-----------------------------------------
                                    308 ;	 function GPIO_ReadInputDataBit
                                    309 ;	-----------------------------------------
      008557                        310 _GPIO_ReadInputDataBit:
      008557 88               [ 1]  311 	push	a
      008558 6B 01            [ 1]  312 	ld	(0x01, sp), a
                                    313 ;	libs/stm8l_gpio.c: 131: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      00855A E6 01            [ 1]  314 	ld	a, (0x1, x)
      00855C 14 01            [ 1]  315 	and	a, (0x01, sp)
                                    316 ;	libs/stm8l_gpio.c: 132: }
      00855E 5B 01            [ 2]  317 	addw	sp, #1
      008560 81               [ 4]  318 	ret
                                    319 ;	libs/stm8l_gpio.c: 134: BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    320 ;	-----------------------------------------
                                    321 ;	 function GPIO_ReadOutputDataBit
                                    322 ;	-----------------------------------------
      008561                        323 _GPIO_ReadOutputDataBit:
      008561 88               [ 1]  324 	push	a
      008562 6B 01            [ 1]  325 	ld	(0x01, sp), a
                                    326 ;	libs/stm8l_gpio.c: 136: return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
      008564 F6               [ 1]  327 	ld	a, (x)
      008565 14 01            [ 1]  328 	and	a, (0x01, sp)
                                    329 ;	libs/stm8l_gpio.c: 137: }
      008567 5B 01            [ 2]  330 	addw	sp, #1
      008569 81               [ 4]  331 	ret
                                    332 	.area CODE
                                    333 	.area CONST
                                    334 	.area INITIALIZER
                                    335 	.area CABS (ABS)
