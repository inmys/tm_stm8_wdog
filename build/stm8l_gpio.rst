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
      0083EE                         63 _GPIO_DeInit:
                                     64 ;	libs/stm8l_gpio.c: 5: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0083EE 90 93            [ 1]   65 	ldw	y, x
      0083F0 6F 04            [ 1]   66 	clr	(0x0004, x)
                                     67 ;	libs/stm8l_gpio.c: 6: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0083F2 90 7F            [ 1]   68 	clr	(y)
                                     69 ;	libs/stm8l_gpio.c: 7: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0083F4 93               [ 1]   70 	ldw	x, y
      0083F5 5C               [ 1]   71 	incw	x
      0083F6 5C               [ 1]   72 	incw	x
      0083F7 7F               [ 1]   73 	clr	(x)
                                     74 ;	libs/stm8l_gpio.c: 8: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0083F8 93               [ 1]   75 	ldw	x, y
      0083F9 6F 03            [ 1]   76 	clr	(0x0003, x)
                                     77 ;	libs/stm8l_gpio.c: 9: }
      0083FB 81               [ 4]   78 	ret
                                     79 ;	libs/stm8l_gpio.c: 12: void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     80 ;	-----------------------------------------
                                     81 ;	 function GPIO_Init
                                     82 ;	-----------------------------------------
      0083FC                         83 _GPIO_Init:
      0083FC 52 06            [ 2]   84 	sub	sp, #6
      0083FE 51               [ 1]   85 	exgw	x, y
      0083FF 6B 06            [ 1]   86 	ld	(0x06, sp), a
                                     87 ;	libs/stm8l_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008401 93               [ 1]   88 	ldw	x, y
      008402 1C 00 04         [ 2]   89 	addw	x, #0x0004
      008405 1F 01            [ 2]   90 	ldw	(0x01, sp), x
      008407 F6               [ 1]   91 	ld	a, (x)
      008408 88               [ 1]   92 	push	a
      008409 7B 07            [ 1]   93 	ld	a, (0x07, sp)
      00840B 43               [ 1]   94 	cpl	a
      00840C 6B 04            [ 1]   95 	ld	(0x04, sp), a
      00840E 84               [ 1]   96 	pop	a
      00840F 14 03            [ 1]   97 	and	a, (0x03, sp)
      008411 1E 01            [ 2]   98 	ldw	x, (0x01, sp)
      008413 F7               [ 1]   99 	ld	(x), a
                                    100 ;	libs/stm8l_gpio.c: 38: GPIOx->DDR |= GPIO_Pin;
      008414 93               [ 1]  101 	ldw	x, y
      008415 5C               [ 1]  102 	incw	x
      008416 5C               [ 1]  103 	incw	x
      008417 1F 04            [ 2]  104 	ldw	(0x04, sp), x
                                    105 ;	libs/stm8l_gpio.c: 28: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      008419 0D 09            [ 1]  106 	tnz	(0x09, sp)
      00841B 2A 1E            [ 1]  107 	jrpl	00105$
                                    108 ;	libs/stm8l_gpio.c: 32: GPIOx->ODR |= GPIO_Pin;
      00841D 90 F6            [ 1]  109 	ld	a, (y)
                                    110 ;	libs/stm8l_gpio.c: 30: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      00841F 88               [ 1]  111 	push	a
      008420 7B 0A            [ 1]  112 	ld	a, (0x0a, sp)
      008422 A5 10            [ 1]  113 	bcp	a, #0x10
      008424 84               [ 1]  114 	pop	a
      008425 27 06            [ 1]  115 	jreq	00102$
                                    116 ;	libs/stm8l_gpio.c: 32: GPIOx->ODR |= GPIO_Pin;
      008427 1A 06            [ 1]  117 	or	a, (0x06, sp)
      008429 90 F7            [ 1]  118 	ld	(y), a
      00842B 20 04            [ 2]  119 	jra	00103$
      00842D                        120 00102$:
                                    121 ;	libs/stm8l_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      00842D 14 03            [ 1]  122 	and	a, (0x03, sp)
      00842F 90 F7            [ 1]  123 	ld	(y), a
      008431                        124 00103$:
                                    125 ;	libs/stm8l_gpio.c: 38: GPIOx->DDR |= GPIO_Pin;
      008431 1E 04            [ 2]  126 	ldw	x, (0x04, sp)
      008433 F6               [ 1]  127 	ld	a, (x)
      008434 1A 06            [ 1]  128 	or	a, (0x06, sp)
      008436 1E 04            [ 2]  129 	ldw	x, (0x04, sp)
      008438 F7               [ 1]  130 	ld	(x), a
      008439 20 08            [ 2]  131 	jra	00106$
      00843B                        132 00105$:
                                    133 ;	libs/stm8l_gpio.c: 42: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      00843B 1E 04            [ 2]  134 	ldw	x, (0x04, sp)
      00843D F6               [ 1]  135 	ld	a, (x)
      00843E 14 03            [ 1]  136 	and	a, (0x03, sp)
      008440 1E 04            [ 2]  137 	ldw	x, (0x04, sp)
      008442 F7               [ 1]  138 	ld	(x), a
      008443                        139 00106$:
                                    140 ;	libs/stm8l_gpio.c: 51: GPIOx->CR1 |= GPIO_Pin;
      008443 93               [ 1]  141 	ldw	x, y
      008444 1C 00 03         [ 2]  142 	addw	x, #0x0003
      008447 F6               [ 1]  143 	ld	a, (x)
                                    144 ;	libs/stm8l_gpio.c: 49: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      008448 88               [ 1]  145 	push	a
      008449 7B 0A            [ 1]  146 	ld	a, (0x0a, sp)
      00844B A5 40            [ 1]  147 	bcp	a, #0x40
      00844D 84               [ 1]  148 	pop	a
      00844E 27 05            [ 1]  149 	jreq	00108$
                                    150 ;	libs/stm8l_gpio.c: 51: GPIOx->CR1 |= GPIO_Pin;
      008450 1A 06            [ 1]  151 	or	a, (0x06, sp)
      008452 F7               [ 1]  152 	ld	(x), a
      008453 20 03            [ 2]  153 	jra	00109$
      008455                        154 00108$:
                                    155 ;	libs/stm8l_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008455 14 03            [ 1]  156 	and	a, (0x03, sp)
      008457 F7               [ 1]  157 	ld	(x), a
      008458                        158 00109$:
                                    159 ;	libs/stm8l_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008458 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      00845A F6               [ 1]  161 	ld	a, (x)
                                    162 ;	libs/stm8l_gpio.c: 61: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      00845B 88               [ 1]  163 	push	a
      00845C 7B 0A            [ 1]  164 	ld	a, (0x0a, sp)
      00845E A5 20            [ 1]  165 	bcp	a, #0x20
      008460 84               [ 1]  166 	pop	a
      008461 27 07            [ 1]  167 	jreq	00111$
                                    168 ;	libs/stm8l_gpio.c: 63: GPIOx->CR2 |= GPIO_Pin;
      008463 1A 06            [ 1]  169 	or	a, (0x06, sp)
      008465 1E 01            [ 2]  170 	ldw	x, (0x01, sp)
      008467 F7               [ 1]  171 	ld	(x), a
      008468 20 05            [ 2]  172 	jra	00113$
      00846A                        173 00111$:
                                    174 ;	libs/stm8l_gpio.c: 66: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      00846A 14 03            [ 1]  175 	and	a, (0x03, sp)
      00846C 1E 01            [ 2]  176 	ldw	x, (0x01, sp)
      00846E F7               [ 1]  177 	ld	(x), a
      00846F                        178 00113$:
                                    179 ;	libs/stm8l_gpio.c: 69: }
      00846F 5B 06            [ 2]  180 	addw	sp, #6
      008471 85               [ 2]  181 	popw	x
      008472 84               [ 1]  182 	pop	a
      008473 FC               [ 2]  183 	jp	(x)
                                    184 ;	libs/stm8l_gpio.c: 71: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
                                    185 ;	-----------------------------------------
                                    186 ;	 function GPIO_ExternalPullUpConfig
                                    187 ;	-----------------------------------------
      008474                        188 _GPIO_ExternalPullUpConfig:
      008474 88               [ 1]  189 	push	a
                                    190 ;	libs/stm8l_gpio.c: 79: GPIOx->CR1 |= GPIO_Pin;
      008475 1C 00 03         [ 2]  191 	addw	x, #0x0003
      008478 88               [ 1]  192 	push	a
      008479 F6               [ 1]  193 	ld	a, (x)
      00847A 6B 02            [ 1]  194 	ld	(0x02, sp), a
      00847C 84               [ 1]  195 	pop	a
                                    196 ;	libs/stm8l_gpio.c: 77: if (NewState != DISABLE) /* External Pull-Up Set*/
      00847D 0D 04            [ 1]  197 	tnz	(0x04, sp)
      00847F 27 05            [ 1]  198 	jreq	00102$
                                    199 ;	libs/stm8l_gpio.c: 79: GPIOx->CR1 |= GPIO_Pin;
      008481 1A 01            [ 1]  200 	or	a, (0x01, sp)
      008483 F7               [ 1]  201 	ld	(x), a
      008484 20 04            [ 2]  202 	jra	00104$
      008486                        203 00102$:
                                    204 ;	libs/stm8l_gpio.c: 82: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008486 43               [ 1]  205 	cpl	a
      008487 14 01            [ 1]  206 	and	a, (0x01, sp)
      008489 F7               [ 1]  207 	ld	(x), a
      00848A                        208 00104$:
                                    209 ;	libs/stm8l_gpio.c: 84: }
      00848A 84               [ 1]  210 	pop	a
      00848B 85               [ 2]  211 	popw	x
      00848C 84               [ 1]  212 	pop	a
      00848D FC               [ 2]  213 	jp	(x)
                                    214 ;	libs/stm8l_gpio.c: 87: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
                                    215 ;	-----------------------------------------
                                    216 ;	 function GPIO_Write
                                    217 ;	-----------------------------------------
      00848E                        218 _GPIO_Write:
                                    219 ;	libs/stm8l_gpio.c: 89: GPIOx->ODR = GPIO_PortVal;
      00848E F7               [ 1]  220 	ld	(x), a
                                    221 ;	libs/stm8l_gpio.c: 90: }
      00848F 81               [ 4]  222 	ret
                                    223 ;	libs/stm8l_gpio.c: 92: void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
                                    224 ;	-----------------------------------------
                                    225 ;	 function GPIO_WriteBit
                                    226 ;	-----------------------------------------
      008490                        227 _GPIO_WriteBit:
      008490 88               [ 1]  228 	push	a
                                    229 ;	libs/stm8l_gpio.c: 100: GPIOx->ODR |= GPIO_Pin;
      008491 88               [ 1]  230 	push	a
      008492 F6               [ 1]  231 	ld	a, (x)
      008493 6B 02            [ 1]  232 	ld	(0x02, sp), a
      008495 84               [ 1]  233 	pop	a
                                    234 ;	libs/stm8l_gpio.c: 98: if (GPIO_BitVal != RESET)
      008496 0D 04            [ 1]  235 	tnz	(0x04, sp)
      008498 27 05            [ 1]  236 	jreq	00102$
                                    237 ;	libs/stm8l_gpio.c: 100: GPIOx->ODR |= GPIO_Pin;
      00849A 1A 01            [ 1]  238 	or	a, (0x01, sp)
      00849C F7               [ 1]  239 	ld	(x), a
      00849D 20 04            [ 2]  240 	jra	00104$
      00849F                        241 00102$:
                                    242 ;	libs/stm8l_gpio.c: 105: GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
      00849F 43               [ 1]  243 	cpl	a
      0084A0 14 01            [ 1]  244 	and	a, (0x01, sp)
      0084A2 F7               [ 1]  245 	ld	(x), a
      0084A3                        246 00104$:
                                    247 ;	libs/stm8l_gpio.c: 107: }
      0084A3 84               [ 1]  248 	pop	a
      0084A4 85               [ 2]  249 	popw	x
      0084A5 84               [ 1]  250 	pop	a
      0084A6 FC               [ 2]  251 	jp	(x)
                                    252 ;	libs/stm8l_gpio.c: 109: void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
                                    253 ;	-----------------------------------------
                                    254 ;	 function GPIO_SetBits
                                    255 ;	-----------------------------------------
      0084A7                        256 _GPIO_SetBits:
      0084A7 88               [ 1]  257 	push	a
      0084A8 6B 01            [ 1]  258 	ld	(0x01, sp), a
                                    259 ;	libs/stm8l_gpio.c: 111: GPIOx->ODR |= GPIO_Pin;
      0084AA F6               [ 1]  260 	ld	a, (x)
      0084AB 1A 01            [ 1]  261 	or	a, (0x01, sp)
      0084AD F7               [ 1]  262 	ld	(x), a
                                    263 ;	libs/stm8l_gpio.c: 112: }
      0084AE 84               [ 1]  264 	pop	a
      0084AF 81               [ 4]  265 	ret
                                    266 ;	libs/stm8l_gpio.c: 114: void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
                                    267 ;	-----------------------------------------
                                    268 ;	 function GPIO_ResetBits
                                    269 ;	-----------------------------------------
      0084B0                        270 _GPIO_ResetBits:
      0084B0 88               [ 1]  271 	push	a
                                    272 ;	libs/stm8l_gpio.c: 116: GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
      0084B1 88               [ 1]  273 	push	a
      0084B2 F6               [ 1]  274 	ld	a, (x)
      0084B3 6B 02            [ 1]  275 	ld	(0x02, sp), a
      0084B5 84               [ 1]  276 	pop	a
      0084B6 43               [ 1]  277 	cpl	a
      0084B7 14 01            [ 1]  278 	and	a, (0x01, sp)
      0084B9 F7               [ 1]  279 	ld	(x), a
                                    280 ;	libs/stm8l_gpio.c: 117: }
      0084BA 84               [ 1]  281 	pop	a
      0084BB 81               [ 4]  282 	ret
                                    283 ;	libs/stm8l_gpio.c: 119: void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
                                    284 ;	-----------------------------------------
                                    285 ;	 function GPIO_ToggleBits
                                    286 ;	-----------------------------------------
      0084BC                        287 _GPIO_ToggleBits:
      0084BC 88               [ 1]  288 	push	a
      0084BD 6B 01            [ 1]  289 	ld	(0x01, sp), a
                                    290 ;	libs/stm8l_gpio.c: 121: GPIOx->ODR ^= GPIO_Pin;
      0084BF F6               [ 1]  291 	ld	a, (x)
      0084C0 18 01            [ 1]  292 	xor	a, (0x01, sp)
      0084C2 F7               [ 1]  293 	ld	(x), a
                                    294 ;	libs/stm8l_gpio.c: 122: }
      0084C3 84               [ 1]  295 	pop	a
      0084C4 81               [ 4]  296 	ret
                                    297 ;	libs/stm8l_gpio.c: 124: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    298 ;	-----------------------------------------
                                    299 ;	 function GPIO_ReadInputData
                                    300 ;	-----------------------------------------
      0084C5                        301 _GPIO_ReadInputData:
                                    302 ;	libs/stm8l_gpio.c: 126: return ((uint8_t)GPIOx->IDR);
      0084C5 E6 01            [ 1]  303 	ld	a, (0x1, x)
                                    304 ;	libs/stm8l_gpio.c: 127: }
      0084C7 81               [ 4]  305 	ret
                                    306 ;	libs/stm8l_gpio.c: 129: BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    307 ;	-----------------------------------------
                                    308 ;	 function GPIO_ReadInputDataBit
                                    309 ;	-----------------------------------------
      0084C8                        310 _GPIO_ReadInputDataBit:
      0084C8 88               [ 1]  311 	push	a
      0084C9 6B 01            [ 1]  312 	ld	(0x01, sp), a
                                    313 ;	libs/stm8l_gpio.c: 131: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      0084CB E6 01            [ 1]  314 	ld	a, (0x1, x)
      0084CD 14 01            [ 1]  315 	and	a, (0x01, sp)
                                    316 ;	libs/stm8l_gpio.c: 132: }
      0084CF 5B 01            [ 2]  317 	addw	sp, #1
      0084D1 81               [ 4]  318 	ret
                                    319 ;	libs/stm8l_gpio.c: 134: BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    320 ;	-----------------------------------------
                                    321 ;	 function GPIO_ReadOutputDataBit
                                    322 ;	-----------------------------------------
      0084D2                        323 _GPIO_ReadOutputDataBit:
      0084D2 88               [ 1]  324 	push	a
      0084D3 6B 01            [ 1]  325 	ld	(0x01, sp), a
                                    326 ;	libs/stm8l_gpio.c: 136: return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
      0084D5 F6               [ 1]  327 	ld	a, (x)
      0084D6 14 01            [ 1]  328 	and	a, (0x01, sp)
                                    329 ;	libs/stm8l_gpio.c: 137: }
      0084D8 5B 01            [ 2]  330 	addw	sp, #1
      0084DA 81               [ 4]  331 	ret
                                    332 	.area CODE
                                    333 	.area CONST
                                    334 	.area INITIALIZER
                                    335 	.area CABS (ABS)
