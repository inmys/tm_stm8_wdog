                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8l_usart
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLK_GetClockFreq
                                     12 	.globl _USART_DeInit
                                     13 	.globl _USART_Init
                                     14 	.globl _USART_ClockInit
                                     15 	.globl _USART_Cmd
                                     16 	.globl _USART_SetPrescaler
                                     17 	.globl _USART_SendBreak
                                     18 	.globl _USART_ReceiveData8
                                     19 	.globl _USART_ReceiveData9
                                     20 	.globl _USART_SendData8
                                     21 	.globl _USART_SendData9
                                     22 	.globl _USART_ReceiverWakeUpCmd
                                     23 	.globl _USART_SetAddress
                                     24 	.globl _USART_WakeUpConfig
                                     25 	.globl _USART_HalfDuplexCmd
                                     26 	.globl _USART_SmartCardCmd
                                     27 	.globl _USART_SmartCardNACKCmd
                                     28 	.globl _USART_SetGuardTime
                                     29 	.globl _USART_IrDAConfig
                                     30 	.globl _USART_IrDACmd
                                     31 	.globl _USART_DMACmd
                                     32 	.globl _USART_ITConfig
                                     33 	.globl _USART_GetFlagStatus
                                     34 	.globl _USART_ClearFlag
                                     35 	.globl _USART_GetITStatus
                                     36 	.globl _USART_ClearITPendingBit
                                     37 ;--------------------------------------------------------
                                     38 ; ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DATA
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area INITIALIZED
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 
                                     50 ; default segment ordering for linker
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area CONST
                                     55 	.area INITIALIZER
                                     56 	.area CODE
                                     57 
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
                                     65 ;--------------------------------------------------------
                                     66 ; Home
                                     67 ;--------------------------------------------------------
                                     68 	.area HOME
                                     69 	.area HOME
                                     70 ;--------------------------------------------------------
                                     71 ; code
                                     72 ;--------------------------------------------------------
                                     73 	.area CODE
                                     74 ;	libs/stm8l_usart.c: 148: void USART_DeInit(USART_TypeDef* USARTx)
                                     75 ;	-----------------------------------------
                                     76 ;	 function USART_DeInit
                                     77 ;	-----------------------------------------
      008A27                         78 _USART_DeInit:
                                     79 ;	libs/stm8l_usart.c: 154: (void) USARTx->DR;
      008A27 90 93            [ 1]   80 	ldw	y, x
      008A29 E6 01            [ 1]   81 	ld	a, (0x1, x)
                                     82 ;	libs/stm8l_usart.c: 156: USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
      008A2B 93               [ 1]   83 	ldw	x, y
      008A2C 6F 03            [ 1]   84 	clr	(0x0003, x)
                                     85 ;	libs/stm8l_usart.c: 157: USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
      008A2E 93               [ 1]   86 	ldw	x, y
      008A2F 5C               [ 1]   87 	incw	x
      008A30 5C               [ 1]   88 	incw	x
      008A31 7F               [ 1]   89 	clr	(x)
                                     90 ;	libs/stm8l_usart.c: 159: USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
      008A32 93               [ 1]   91 	ldw	x, y
      008A33 6F 04            [ 1]   92 	clr	(0x0004, x)
                                     93 ;	libs/stm8l_usart.c: 160: USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
      008A35 93               [ 1]   94 	ldw	x, y
      008A36 6F 05            [ 1]   95 	clr	(0x0005, x)
                                     96 ;	libs/stm8l_usart.c: 161: USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
      008A38 93               [ 1]   97 	ldw	x, y
      008A39 6F 06            [ 1]   98 	clr	(0x0006, x)
                                     99 ;	libs/stm8l_usart.c: 162: USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
      008A3B 93               [ 1]  100 	ldw	x, y
      008A3C 6F 07            [ 1]  101 	clr	(0x0007, x)
                                    102 ;	libs/stm8l_usart.c: 163: }
      008A3E 81               [ 4]  103 	ret
                                    104 ;	libs/stm8l_usart.c: 192: void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
                                    105 ;	-----------------------------------------
                                    106 ;	 function USART_Init
                                    107 ;	-----------------------------------------
      008A3F                        108 _USART_Init:
      008A3F 52 0B            [ 2]  109 	sub	sp, #11
                                    110 ;	libs/stm8l_usart.c: 210: USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
      008A41 1F 0A            [ 2]  111 	ldw	(0x0a, sp), x
      008A43 1C 00 04         [ 2]  112 	addw	x, #0x0004
      008A46 F6               [ 1]  113 	ld	a, (x)
      008A47 A4 E9            [ 1]  114 	and	a, #0xe9
      008A49 6B 09            [ 1]  115 	ld	(0x09, sp), a
      008A4B F7               [ 1]  116 	ld	(x), a
                                    117 ;	libs/stm8l_usart.c: 213: USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
      008A4C F6               [ 1]  118 	ld	a, (x)
      008A4D 7B 12            [ 1]  119 	ld	a, (0x12, sp)
      008A4F 1A 14            [ 1]  120 	or	a, (0x14, sp)
      008A51 1A 09            [ 1]  121 	or	a, (0x09, sp)
      008A53 F7               [ 1]  122 	ld	(x), a
                                    123 ;	libs/stm8l_usart.c: 216: USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
      008A54 1E 0A            [ 2]  124 	ldw	x, (0x0a, sp)
      008A56 1C 00 06         [ 2]  125 	addw	x, #0x0006
      008A59 F6               [ 1]  126 	ld	a, (x)
      008A5A A4 CF            [ 1]  127 	and	a, #0xcf
      008A5C F7               [ 1]  128 	ld	(x), a
                                    129 ;	libs/stm8l_usart.c: 218: USARTx->CR3 |= (uint8_t)USART_StopBits;
      008A5D 88               [ 1]  130 	push	a
      008A5E F6               [ 1]  131 	ld	a, (x)
      008A5F 84               [ 1]  132 	pop	a
      008A60 1A 13            [ 1]  133 	or	a, (0x13, sp)
      008A62 F7               [ 1]  134 	ld	(x), a
                                    135 ;	libs/stm8l_usart.c: 221: USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
      008A63 1E 0A            [ 2]  136 	ldw	x, (0x0a, sp)
      008A65 5C               [ 1]  137 	incw	x
      008A66 5C               [ 1]  138 	incw	x
      008A67 1F 01            [ 2]  139 	ldw	(0x01, sp), x
      008A69 F6               [ 1]  140 	ld	a, (x)
      008A6A 1E 01            [ 2]  141 	ldw	x, (0x01, sp)
      008A6C 7F               [ 1]  142 	clr	(x)
                                    143 ;	libs/stm8l_usart.c: 223: USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
      008A6D 1E 0A            [ 2]  144 	ldw	x, (0x0a, sp)
      008A6F 1C 00 03         [ 2]  145 	addw	x, #0x0003
      008A72 1F 03            [ 2]  146 	ldw	(0x03, sp), x
      008A74 F6               [ 1]  147 	ld	a, (x)
      008A75 A4 0F            [ 1]  148 	and	a, #0x0f
      008A77 1E 03            [ 2]  149 	ldw	x, (0x03, sp)
      008A79 F7               [ 1]  150 	ld	(x), a
                                    151 ;	libs/stm8l_usart.c: 225: USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
      008A7A 1E 03            [ 2]  152 	ldw	x, (0x03, sp)
      008A7C 88               [ 1]  153 	push	a
      008A7D F6               [ 1]  154 	ld	a, (x)
      008A7E 84               [ 1]  155 	pop	a
      008A7F A4 F0            [ 1]  156 	and	a, #0xf0
      008A81 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      008A83 F7               [ 1]  158 	ld	(x), a
                                    159 ;	libs/stm8l_usart.c: 227: BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
      008A84 CD 86 3D         [ 4]  160 	call	_CLK_GetClockFreq
      008A87 1F 08            [ 2]  161 	ldw	(0x08, sp), x
      008A89 1E 10            [ 2]  162 	ldw	x, (0x10, sp)
      008A8B 89               [ 2]  163 	pushw	x
      008A8C 1E 10            [ 2]  164 	ldw	x, (0x10, sp)
      008A8E 89               [ 2]  165 	pushw	x
      008A8F 1E 0C            [ 2]  166 	ldw	x, (0x0c, sp)
      008A91 89               [ 2]  167 	pushw	x
      008A92 90 89            [ 2]  168 	pushw	y
      008A94 CD 8D 84         [ 4]  169 	call	__divulong
      008A97 5B 08            [ 2]  170 	addw	sp, #8
      008A99 17 05            [ 2]  171 	ldw	(0x05, sp), y
                                    172 ;	libs/stm8l_usart.c: 229: USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
      008A9B 9E               [ 1]  173 	ld	a, xh
      008A9C A4 F0            [ 1]  174 	and	a, #0xf0
      008A9E 6B 09            [ 1]  175 	ld	(0x09, sp), a
      008AA0 16 03            [ 2]  176 	ldw	y, (0x03, sp)
      008AA2 7B 09            [ 1]  177 	ld	a, (0x09, sp)
      008AA4 90 F7            [ 1]  178 	ld	(y), a
                                    179 ;	libs/stm8l_usart.c: 231: USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
      008AA6 16 03            [ 2]  180 	ldw	y, (0x03, sp)
      008AA8 90 F6            [ 1]  181 	ld	a, (y)
      008AAA 9F               [ 1]  182 	ld	a, xl
      008AAB A4 0F            [ 1]  183 	and	a, #0x0f
      008AAD 1A 09            [ 1]  184 	or	a, (0x09, sp)
      008AAF 16 03            [ 2]  185 	ldw	y, (0x03, sp)
      008AB1 90 F7            [ 1]  186 	ld	(y), a
                                    187 ;	libs/stm8l_usart.c: 233: USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
      008AB3 A6 10            [ 1]  188 	ld	a, #0x10
      008AB5 62               [ 2]  189 	div	x, a
      008AB6 9F               [ 1]  190 	ld	a, xl
      008AB7 1E 01            [ 2]  191 	ldw	x, (0x01, sp)
      008AB9 F7               [ 1]  192 	ld	(x), a
                                    193 ;	libs/stm8l_usart.c: 236: USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
      008ABA 1E 0A            [ 2]  194 	ldw	x, (0x0a, sp)
      008ABC 1C 00 05         [ 2]  195 	addw	x, #0x0005
      008ABF F6               [ 1]  196 	ld	a, (x)
      008AC0 A4 F3            [ 1]  197 	and	a, #0xf3
      008AC2 F7               [ 1]  198 	ld	(x), a
                                    199 ;	libs/stm8l_usart.c: 238: USARTx->CR2 |= (uint8_t)USART_Mode;
      008AC3 88               [ 1]  200 	push	a
      008AC4 F6               [ 1]  201 	ld	a, (x)
      008AC5 84               [ 1]  202 	pop	a
      008AC6 1A 15            [ 1]  203 	or	a, (0x15, sp)
      008AC8 F7               [ 1]  204 	ld	(x), a
                                    205 ;	libs/stm8l_usart.c: 239: }
      008AC9 1E 0C            [ 2]  206 	ldw	x, (12, sp)
      008ACB 5B 15            [ 2]  207 	addw	sp, #21
      008ACD FC               [ 2]  208 	jp	(x)
                                    209 ;	libs/stm8l_usart.c: 264: void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
                                    210 ;	-----------------------------------------
                                    211 ;	 function USART_ClockInit
                                    212 ;	-----------------------------------------
      008ACE                        213 _USART_ClockInit:
      008ACE 52 04            [ 2]  214 	sub	sp, #4
      008AD0 6B 04            [ 1]  215 	ld	(0x04, sp), a
                                    216 ;	libs/stm8l_usart.c: 275: USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
      008AD2 1C 00 06         [ 2]  217 	addw	x, #0x0006
      008AD5 1F 01            [ 2]  218 	ldw	(0x01, sp), x
      008AD7 F6               [ 1]  219 	ld	a, (x)
      008AD8 A4 F8            [ 1]  220 	and	a, #0xf8
      008ADA 6B 03            [ 1]  221 	ld	(0x03, sp), a
      008ADC 1E 01            [ 2]  222 	ldw	x, (0x01, sp)
      008ADE 7B 03            [ 1]  223 	ld	a, (0x03, sp)
      008AE0 F7               [ 1]  224 	ld	(x), a
                                    225 ;	libs/stm8l_usart.c: 277: USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
      008AE1 1E 01            [ 2]  226 	ldw	x, (0x01, sp)
      008AE3 F6               [ 1]  227 	ld	a, (x)
      008AE4 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      008AE6 1A 08            [ 1]  229 	or	a, (0x08, sp)
      008AE8 1A 09            [ 1]  230 	or	a, (0x09, sp)
      008AEA 1A 03            [ 1]  231 	or	a, (0x03, sp)
      008AEC 1E 01            [ 2]  232 	ldw	x, (0x01, sp)
      008AEE F7               [ 1]  233 	ld	(x), a
                                    234 ;	libs/stm8l_usart.c: 275: USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
      008AEF 1E 01            [ 2]  235 	ldw	x, (0x01, sp)
      008AF1 F6               [ 1]  236 	ld	a, (x)
                                    237 ;	libs/stm8l_usart.c: 279: if (USART_Clock != USART_Clock_Disable)
      008AF2 0D 04            [ 1]  238 	tnz	(0x04, sp)
      008AF4 27 07            [ 1]  239 	jreq	00102$
                                    240 ;	libs/stm8l_usart.c: 281: USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
      008AF6 AA 08            [ 1]  241 	or	a, #0x08
      008AF8 1E 01            [ 2]  242 	ldw	x, (0x01, sp)
      008AFA F7               [ 1]  243 	ld	(x), a
      008AFB 20 05            [ 2]  244 	jra	00104$
      008AFD                        245 00102$:
                                    246 ;	libs/stm8l_usart.c: 285: USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
      008AFD A4 F7            [ 1]  247 	and	a, #0xf7
      008AFF 1E 01            [ 2]  248 	ldw	x, (0x01, sp)
      008B01 F7               [ 1]  249 	ld	(x), a
      008B02                        250 00104$:
                                    251 ;	libs/stm8l_usart.c: 287: }
      008B02 1E 05            [ 2]  252 	ldw	x, (5, sp)
      008B04 5B 09            [ 2]  253 	addw	sp, #9
      008B06 FC               [ 2]  254 	jp	(x)
                                    255 ;	libs/stm8l_usart.c: 296: void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    256 ;	-----------------------------------------
                                    257 ;	 function USART_Cmd
                                    258 ;	-----------------------------------------
      008B07                        259 _USART_Cmd:
      008B07 88               [ 1]  260 	push	a
      008B08 6B 01            [ 1]  261 	ld	(0x01, sp), a
                                    262 ;	libs/stm8l_usart.c: 300: USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
      008B0A 1C 00 04         [ 2]  263 	addw	x, #0x0004
      008B0D F6               [ 1]  264 	ld	a, (x)
                                    265 ;	libs/stm8l_usart.c: 298: if (NewState != DISABLE)
      008B0E 0D 01            [ 1]  266 	tnz	(0x01, sp)
      008B10 27 05            [ 1]  267 	jreq	00102$
                                    268 ;	libs/stm8l_usart.c: 300: USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
      008B12 A4 DF            [ 1]  269 	and	a, #0xdf
      008B14 F7               [ 1]  270 	ld	(x), a
      008B15 20 03            [ 2]  271 	jra	00104$
      008B17                        272 00102$:
                                    273 ;	libs/stm8l_usart.c: 304: USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
      008B17 AA 20            [ 1]  274 	or	a, #0x20
      008B19 F7               [ 1]  275 	ld	(x), a
      008B1A                        276 00104$:
                                    277 ;	libs/stm8l_usart.c: 306: }
      008B1A 84               [ 1]  278 	pop	a
      008B1B 81               [ 4]  279 	ret
                                    280 ;	libs/stm8l_usart.c: 329: void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
                                    281 ;	-----------------------------------------
                                    282 ;	 function USART_SetPrescaler
                                    283 ;	-----------------------------------------
      008B1C                        284 _USART_SetPrescaler:
                                    285 ;	libs/stm8l_usart.c: 332: USARTx->PSCR = USART_Prescaler;
      008B1C 1C 00 0A         [ 2]  286 	addw	x, #0x000a
      008B1F F7               [ 1]  287 	ld	(x), a
                                    288 ;	libs/stm8l_usart.c: 333: }
      008B20 81               [ 4]  289 	ret
                                    290 ;	libs/stm8l_usart.c: 340: void USART_SendBreak(USART_TypeDef* USARTx)
                                    291 ;	-----------------------------------------
                                    292 ;	 function USART_SendBreak
                                    293 ;	-----------------------------------------
      008B21                        294 _USART_SendBreak:
                                    295 ;	libs/stm8l_usart.c: 342: USARTx->CR2 |= USART_CR2_SBK;
      008B21 1C 00 05         [ 2]  296 	addw	x, #0x0005
      008B24 F6               [ 1]  297 	ld	a, (x)
      008B25 AA 01            [ 1]  298 	or	a, #0x01
      008B27 F7               [ 1]  299 	ld	(x), a
                                    300 ;	libs/stm8l_usart.c: 343: }
      008B28 81               [ 4]  301 	ret
                                    302 ;	libs/stm8l_usart.c: 382: uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
                                    303 ;	-----------------------------------------
                                    304 ;	 function USART_ReceiveData8
                                    305 ;	-----------------------------------------
      008B29                        306 _USART_ReceiveData8:
                                    307 ;	libs/stm8l_usart.c: 384: return USARTx->DR;
      008B29 E6 01            [ 1]  308 	ld	a, (0x1, x)
                                    309 ;	libs/stm8l_usart.c: 385: }
      008B2B 81               [ 4]  310 	ret
                                    311 ;	libs/stm8l_usart.c: 392: uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
                                    312 ;	-----------------------------------------
                                    313 ;	 function USART_ReceiveData9
                                    314 ;	-----------------------------------------
      008B2C                        315 _USART_ReceiveData9:
      008B2C 52 02            [ 2]  316 	sub	sp, #2
                                    317 ;	libs/stm8l_usart.c: 396: temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
      008B2E 90 93            [ 1]  318 	ldw	y, x
      008B30 E6 04            [ 1]  319 	ld	a, (0x4, x)
      008B32 A4 80            [ 1]  320 	and	a, #0x80
      008B34 97               [ 1]  321 	ld	xl, a
      008B35 4F               [ 1]  322 	clr	a
      008B36 95               [ 1]  323 	ld	xh, a
      008B37 58               [ 2]  324 	sllw	x
      008B38 1F 01            [ 2]  325 	ldw	(0x01, sp), x
                                    326 ;	libs/stm8l_usart.c: 397: return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
      008B3A 90 E6 01         [ 1]  327 	ld	a, (0x1, y)
      008B3D 5F               [ 1]  328 	clrw	x
      008B3E 1A 02            [ 1]  329 	or	a, (0x02, sp)
      008B40 02               [ 1]  330 	rlwa	x
      008B41 1A 01            [ 1]  331 	or	a, (0x01, sp)
      008B43 A4 01            [ 1]  332 	and	a, #0x01
      008B45 95               [ 1]  333 	ld	xh, a
                                    334 ;	libs/stm8l_usart.c: 398: }
      008B46 5B 02            [ 2]  335 	addw	sp, #2
      008B48 81               [ 4]  336 	ret
                                    337 ;	libs/stm8l_usart.c: 405: void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
                                    338 ;	-----------------------------------------
                                    339 ;	 function USART_SendData8
                                    340 ;	-----------------------------------------
      008B49                        341 _USART_SendData8:
                                    342 ;	libs/stm8l_usart.c: 408: USARTx->DR = Data;
      008B49 5C               [ 1]  343 	incw	x
      008B4A F7               [ 1]  344 	ld	(x), a
                                    345 ;	libs/stm8l_usart.c: 409: }
      008B4B 81               [ 4]  346 	ret
                                    347 ;	libs/stm8l_usart.c: 418: void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
                                    348 ;	-----------------------------------------
                                    349 ;	 function USART_SendData9
                                    350 ;	-----------------------------------------
      008B4C                        351 _USART_SendData9:
      008B4C 52 03            [ 2]  352 	sub	sp, #3
                                    353 ;	libs/stm8l_usart.c: 423: USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
      008B4E 1F 02            [ 2]  354 	ldw	(0x02, sp), x
      008B50 1C 00 04         [ 2]  355 	addw	x, #0x0004
      008B53 F6               [ 1]  356 	ld	a, (x)
      008B54 A4 BF            [ 1]  357 	and	a, #0xbf
      008B56 6B 01            [ 1]  358 	ld	(0x01, sp), a
      008B58 F7               [ 1]  359 	ld	(x), a
                                    360 ;	libs/stm8l_usart.c: 426: USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
      008B59 F6               [ 1]  361 	ld	a, (x)
      008B5A 16 06            [ 2]  362 	ldw	y, (0x06, sp)
      008B5C 90 54            [ 2]  363 	srlw	y
      008B5E 90 54            [ 2]  364 	srlw	y
      008B60 90 9F            [ 1]  365 	ld	a, yl
      008B62 A4 40            [ 1]  366 	and	a, #0x40
      008B64 1A 01            [ 1]  367 	or	a, (0x01, sp)
      008B66 F7               [ 1]  368 	ld	(x), a
                                    369 ;	libs/stm8l_usart.c: 429: USARTx->DR   = (uint8_t)(Data);
      008B67 1E 02            [ 2]  370 	ldw	x, (0x02, sp)
      008B69 5C               [ 1]  371 	incw	x
      008B6A 7B 07            [ 1]  372 	ld	a, (0x07, sp)
      008B6C F7               [ 1]  373 	ld	(x), a
                                    374 ;	libs/stm8l_usart.c: 430: }
      008B6D 1E 04            [ 2]  375 	ldw	x, (4, sp)
      008B6F 5B 07            [ 2]  376 	addw	sp, #7
      008B71 FC               [ 2]  377 	jp	(x)
                                    378 ;	libs/stm8l_usart.c: 473: void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    379 ;	-----------------------------------------
                                    380 ;	 function USART_ReceiverWakeUpCmd
                                    381 ;	-----------------------------------------
      008B72                        382 _USART_ReceiverWakeUpCmd:
      008B72 88               [ 1]  383 	push	a
      008B73 6B 01            [ 1]  384 	ld	(0x01, sp), a
                                    385 ;	libs/stm8l_usart.c: 480: USARTx->CR2 |= USART_CR2_RWU;
      008B75 1C 00 05         [ 2]  386 	addw	x, #0x0005
      008B78 F6               [ 1]  387 	ld	a, (x)
                                    388 ;	libs/stm8l_usart.c: 477: if (NewState != DISABLE)
      008B79 0D 01            [ 1]  389 	tnz	(0x01, sp)
      008B7B 27 05            [ 1]  390 	jreq	00102$
                                    391 ;	libs/stm8l_usart.c: 480: USARTx->CR2 |= USART_CR2_RWU;
      008B7D AA 02            [ 1]  392 	or	a, #0x02
      008B7F F7               [ 1]  393 	ld	(x), a
      008B80 20 03            [ 2]  394 	jra	00104$
      008B82                        395 00102$:
                                    396 ;	libs/stm8l_usart.c: 485: USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
      008B82 A4 FD            [ 1]  397 	and	a, #0xfd
      008B84 F7               [ 1]  398 	ld	(x), a
      008B85                        399 00104$:
                                    400 ;	libs/stm8l_usart.c: 487: }
      008B85 84               [ 1]  401 	pop	a
      008B86 81               [ 4]  402 	ret
                                    403 ;	libs/stm8l_usart.c: 496: void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
                                    404 ;	-----------------------------------------
                                    405 ;	 function USART_SetAddress
                                    406 ;	-----------------------------------------
      008B87                        407 _USART_SetAddress:
      008B87 88               [ 1]  408 	push	a
      008B88 6B 01            [ 1]  409 	ld	(0x01, sp), a
                                    410 ;	libs/stm8l_usart.c: 502: USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
      008B8A 1C 00 07         [ 2]  411 	addw	x, #0x0007
      008B8D F6               [ 1]  412 	ld	a, (x)
      008B8E A4 F0            [ 1]  413 	and	a, #0xf0
      008B90 F7               [ 1]  414 	ld	(x), a
                                    415 ;	libs/stm8l_usart.c: 504: USARTx->CR4 |= USART_Address;
      008B91 88               [ 1]  416 	push	a
      008B92 F6               [ 1]  417 	ld	a, (x)
      008B93 84               [ 1]  418 	pop	a
      008B94 1A 01            [ 1]  419 	or	a, (0x01, sp)
      008B96 F7               [ 1]  420 	ld	(x), a
                                    421 ;	libs/stm8l_usart.c: 505: }
      008B97 84               [ 1]  422 	pop	a
      008B98 81               [ 4]  423 	ret
                                    424 ;	libs/stm8l_usart.c: 515: void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
                                    425 ;	-----------------------------------------
                                    426 ;	 function USART_WakeUpConfig
                                    427 ;	-----------------------------------------
      008B99                        428 _USART_WakeUpConfig:
      008B99 88               [ 1]  429 	push	a
      008B9A 6B 01            [ 1]  430 	ld	(0x01, sp), a
                                    431 ;	libs/stm8l_usart.c: 519: USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
      008B9C 1C 00 04         [ 2]  432 	addw	x, #0x0004
      008B9F F6               [ 1]  433 	ld	a, (x)
      008BA0 A4 F7            [ 1]  434 	and	a, #0xf7
      008BA2 F7               [ 1]  435 	ld	(x), a
                                    436 ;	libs/stm8l_usart.c: 520: USARTx->CR1 |= (uint8_t)USART_WakeUp;
      008BA3 88               [ 1]  437 	push	a
      008BA4 F6               [ 1]  438 	ld	a, (x)
      008BA5 84               [ 1]  439 	pop	a
      008BA6 1A 01            [ 1]  440 	or	a, (0x01, sp)
      008BA8 F7               [ 1]  441 	ld	(x), a
                                    442 ;	libs/stm8l_usart.c: 521: }
      008BA9 84               [ 1]  443 	pop	a
      008BAA 81               [ 4]  444 	ret
                                    445 ;	libs/stm8l_usart.c: 566: void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    446 ;	-----------------------------------------
                                    447 ;	 function USART_HalfDuplexCmd
                                    448 ;	-----------------------------------------
      008BAB                        449 _USART_HalfDuplexCmd:
      008BAB 88               [ 1]  450 	push	a
      008BAC 6B 01            [ 1]  451 	ld	(0x01, sp), a
                                    452 ;	libs/stm8l_usart.c: 572: USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
      008BAE 1C 00 08         [ 2]  453 	addw	x, #0x0008
      008BB1 F6               [ 1]  454 	ld	a, (x)
                                    455 ;	libs/stm8l_usart.c: 570: if (NewState != DISABLE)
      008BB2 0D 01            [ 1]  456 	tnz	(0x01, sp)
      008BB4 27 05            [ 1]  457 	jreq	00102$
                                    458 ;	libs/stm8l_usart.c: 572: USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
      008BB6 AA 08            [ 1]  459 	or	a, #0x08
      008BB8 F7               [ 1]  460 	ld	(x), a
      008BB9 20 03            [ 2]  461 	jra	00104$
      008BBB                        462 00102$:
                                    463 ;	libs/stm8l_usart.c: 576: USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
      008BBB A4 F7            [ 1]  464 	and	a, #0xf7
      008BBD F7               [ 1]  465 	ld	(x), a
      008BBE                        466 00104$:
                                    467 ;	libs/stm8l_usart.c: 578: }
      008BBE 84               [ 1]  468 	pop	a
      008BBF 81               [ 4]  469 	ret
                                    470 ;	libs/stm8l_usart.c: 644: void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    471 ;	-----------------------------------------
                                    472 ;	 function USART_SmartCardCmd
                                    473 ;	-----------------------------------------
      008BC0                        474 _USART_SmartCardCmd:
      008BC0 88               [ 1]  475 	push	a
      008BC1 6B 01            [ 1]  476 	ld	(0x01, sp), a
                                    477 ;	libs/stm8l_usart.c: 651: USARTx->CR5 |= USART_CR5_SCEN;
      008BC3 1C 00 08         [ 2]  478 	addw	x, #0x0008
      008BC6 F6               [ 1]  479 	ld	a, (x)
                                    480 ;	libs/stm8l_usart.c: 648: if (NewState != DISABLE)
      008BC7 0D 01            [ 1]  481 	tnz	(0x01, sp)
      008BC9 27 05            [ 1]  482 	jreq	00102$
                                    483 ;	libs/stm8l_usart.c: 651: USARTx->CR5 |= USART_CR5_SCEN;
      008BCB AA 20            [ 1]  484 	or	a, #0x20
      008BCD F7               [ 1]  485 	ld	(x), a
      008BCE 20 03            [ 2]  486 	jra	00104$
      008BD0                        487 00102$:
                                    488 ;	libs/stm8l_usart.c: 656: USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
      008BD0 A4 DF            [ 1]  489 	and	a, #0xdf
      008BD2 F7               [ 1]  490 	ld	(x), a
      008BD3                        491 00104$:
                                    492 ;	libs/stm8l_usart.c: 658: }
      008BD3 84               [ 1]  493 	pop	a
      008BD4 81               [ 4]  494 	ret
                                    495 ;	libs/stm8l_usart.c: 667: void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    496 ;	-----------------------------------------
                                    497 ;	 function USART_SmartCardNACKCmd
                                    498 ;	-----------------------------------------
      008BD5                        499 _USART_SmartCardNACKCmd:
      008BD5 88               [ 1]  500 	push	a
      008BD6 6B 01            [ 1]  501 	ld	(0x01, sp), a
                                    502 ;	libs/stm8l_usart.c: 674: USARTx->CR5 |= USART_CR5_NACK;
      008BD8 1C 00 08         [ 2]  503 	addw	x, #0x0008
      008BDB F6               [ 1]  504 	ld	a, (x)
                                    505 ;	libs/stm8l_usart.c: 671: if (NewState != DISABLE)
      008BDC 0D 01            [ 1]  506 	tnz	(0x01, sp)
      008BDE 27 05            [ 1]  507 	jreq	00102$
                                    508 ;	libs/stm8l_usart.c: 674: USARTx->CR5 |= USART_CR5_NACK;
      008BE0 AA 10            [ 1]  509 	or	a, #0x10
      008BE2 F7               [ 1]  510 	ld	(x), a
      008BE3 20 03            [ 2]  511 	jra	00104$
      008BE5                        512 00102$:
                                    513 ;	libs/stm8l_usart.c: 679: USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
      008BE5 A4 EF            [ 1]  514 	and	a, #0xef
      008BE7 F7               [ 1]  515 	ld	(x), a
      008BE8                        516 00104$:
                                    517 ;	libs/stm8l_usart.c: 681: }
      008BE8 84               [ 1]  518 	pop	a
      008BE9 81               [ 4]  519 	ret
                                    520 ;	libs/stm8l_usart.c: 690: void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
                                    521 ;	-----------------------------------------
                                    522 ;	 function USART_SetGuardTime
                                    523 ;	-----------------------------------------
      008BEA                        524 _USART_SetGuardTime:
                                    525 ;	libs/stm8l_usart.c: 693: USARTx->GTR = USART_GuardTime;
      008BEA 1C 00 09         [ 2]  526 	addw	x, #0x0009
      008BED F7               [ 1]  527 	ld	(x), a
                                    528 ;	libs/stm8l_usart.c: 694: }
      008BEE 81               [ 4]  529 	ret
                                    530 ;	libs/stm8l_usart.c: 751: void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
                                    531 ;	-----------------------------------------
                                    532 ;	 function USART_IrDAConfig
                                    533 ;	-----------------------------------------
      008BEF                        534 _USART_IrDAConfig:
      008BEF 88               [ 1]  535 	push	a
      008BF0 6B 01            [ 1]  536 	ld	(0x01, sp), a
                                    537 ;	libs/stm8l_usart.c: 757: USARTx->CR5 |= USART_CR5_IRLP;
      008BF2 1C 00 08         [ 2]  538 	addw	x, #0x0008
      008BF5 F6               [ 1]  539 	ld	a, (x)
                                    540 ;	libs/stm8l_usart.c: 755: if (USART_IrDAMode != USART_IrDAMode_Normal)
      008BF6 0D 01            [ 1]  541 	tnz	(0x01, sp)
      008BF8 27 05            [ 1]  542 	jreq	00102$
                                    543 ;	libs/stm8l_usart.c: 757: USARTx->CR5 |= USART_CR5_IRLP;
      008BFA AA 04            [ 1]  544 	or	a, #0x04
      008BFC F7               [ 1]  545 	ld	(x), a
      008BFD 20 03            [ 2]  546 	jra	00104$
      008BFF                        547 00102$:
                                    548 ;	libs/stm8l_usart.c: 761: USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
      008BFF A4 FB            [ 1]  549 	and	a, #0xfb
      008C01 F7               [ 1]  550 	ld	(x), a
      008C02                        551 00104$:
                                    552 ;	libs/stm8l_usart.c: 763: }
      008C02 84               [ 1]  553 	pop	a
      008C03 81               [ 4]  554 	ret
                                    555 ;	libs/stm8l_usart.c: 772: void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    556 ;	-----------------------------------------
                                    557 ;	 function USART_IrDACmd
                                    558 ;	-----------------------------------------
      008C04                        559 _USART_IrDACmd:
      008C04 88               [ 1]  560 	push	a
      008C05 6B 01            [ 1]  561 	ld	(0x01, sp), a
                                    562 ;	libs/stm8l_usart.c: 781: USARTx->CR5 |= USART_CR5_IREN;
      008C07 1C 00 08         [ 2]  563 	addw	x, #0x0008
      008C0A F6               [ 1]  564 	ld	a, (x)
                                    565 ;	libs/stm8l_usart.c: 778: if (NewState != DISABLE)
      008C0B 0D 01            [ 1]  566 	tnz	(0x01, sp)
      008C0D 27 05            [ 1]  567 	jreq	00102$
                                    568 ;	libs/stm8l_usart.c: 781: USARTx->CR5 |= USART_CR5_IREN;
      008C0F AA 02            [ 1]  569 	or	a, #0x02
      008C11 F7               [ 1]  570 	ld	(x), a
      008C12 20 03            [ 2]  571 	jra	00104$
      008C14                        572 00102$:
                                    573 ;	libs/stm8l_usart.c: 786: USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
      008C14 A4 FD            [ 1]  574 	and	a, #0xfd
      008C16 F7               [ 1]  575 	ld	(x), a
      008C17                        576 00104$:
                                    577 ;	libs/stm8l_usart.c: 788: }
      008C17 84               [ 1]  578 	pop	a
      008C18 81               [ 4]  579 	ret
                                    580 ;	libs/stm8l_usart.c: 818: void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
                                    581 ;	-----------------------------------------
                                    582 ;	 function USART_DMACmd
                                    583 ;	-----------------------------------------
      008C19                        584 _USART_DMACmd:
      008C19 88               [ 1]  585 	push	a
                                    586 ;	libs/stm8l_usart.c: 829: USARTx->CR5 |= (uint8_t) USART_DMAReq;
      008C1A 1C 00 08         [ 2]  587 	addw	x, #0x0008
      008C1D 88               [ 1]  588 	push	a
      008C1E F6               [ 1]  589 	ld	a, (x)
      008C1F 6B 02            [ 1]  590 	ld	(0x02, sp), a
      008C21 84               [ 1]  591 	pop	a
                                    592 ;	libs/stm8l_usart.c: 825: if (NewState != DISABLE)
      008C22 0D 04            [ 1]  593 	tnz	(0x04, sp)
      008C24 27 05            [ 1]  594 	jreq	00102$
                                    595 ;	libs/stm8l_usart.c: 829: USARTx->CR5 |= (uint8_t) USART_DMAReq;
      008C26 1A 01            [ 1]  596 	or	a, (0x01, sp)
      008C28 F7               [ 1]  597 	ld	(x), a
      008C29 20 04            [ 2]  598 	jra	00104$
      008C2B                        599 00102$:
                                    600 ;	libs/stm8l_usart.c: 835: USARTx->CR5 &= (uint8_t)~USART_DMAReq;
      008C2B 43               [ 1]  601 	cpl	a
      008C2C 14 01            [ 1]  602 	and	a, (0x01, sp)
      008C2E F7               [ 1]  603 	ld	(x), a
      008C2F                        604 00104$:
                                    605 ;	libs/stm8l_usart.c: 837: }
      008C2F 84               [ 1]  606 	pop	a
      008C30 85               [ 2]  607 	popw	x
      008C31 84               [ 1]  608 	pop	a
      008C32 FC               [ 2]  609 	jp	(x)
                                    610 ;	libs/stm8l_usart.c: 939: void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
                                    611 ;	-----------------------------------------
                                    612 ;	 function USART_ITConfig
                                    613 ;	-----------------------------------------
      008C33                        614 _USART_ITConfig:
      008C33 52 09            [ 2]  615 	sub	sp, #9
      008C35 1F 08            [ 2]  616 	ldw	(0x08, sp), x
                                    617 ;	libs/stm8l_usart.c: 946: usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
      008C37 1E 0C            [ 2]  618 	ldw	x, (0x0c, sp)
                                    619 ;	libs/stm8l_usart.c: 948: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
      008C39 7B 0D            [ 1]  620 	ld	a, (0x0d, sp)
      008C3B A4 0F            [ 1]  621 	and	a, #0x0f
      008C3D 88               [ 1]  622 	push	a
      008C3E A6 01            [ 1]  623 	ld	a, #0x01
      008C40 6B 08            [ 1]  624 	ld	(0x08, sp), a
      008C42 84               [ 1]  625 	pop	a
      008C43 4D               [ 1]  626 	tnz	a
      008C44 27 05            [ 1]  627 	jreq	00144$
      008C46                        628 00143$:
      008C46 08 07            [ 1]  629 	sll	(0x07, sp)
      008C48 4A               [ 1]  630 	dec	a
      008C49 26 FB            [ 1]  631 	jrne	00143$
      008C4B                        632 00144$:
                                    633 ;	libs/stm8l_usart.c: 953: if (usartreg == 0x01)
      008C4B 9E               [ 1]  634 	ld	a, xh
      008C4C 4A               [ 1]  635 	dec	a
      008C4D 26 05            [ 1]  636 	jrne	00146$
      008C4F A6 01            [ 1]  637 	ld	a, #0x01
      008C51 6B 01            [ 1]  638 	ld	(0x01, sp), a
      008C53 C5                     639 	.byte 0xc5
      008C54                        640 00146$:
      008C54 0F 01            [ 1]  641 	clr	(0x01, sp)
      008C56                        642 00147$:
                                    643 ;	libs/stm8l_usart.c: 955: USARTx->CR1 |= itpos;
      008C56 16 08            [ 2]  644 	ldw	y, (0x08, sp)
      008C58 72 A9 00 04      [ 2]  645 	addw	y, #0x0004
      008C5C 17 02            [ 2]  646 	ldw	(0x02, sp), y
                                    647 ;	libs/stm8l_usart.c: 957: else if (usartreg == 0x05)
      008C5E 9E               [ 1]  648 	ld	a, xh
      008C5F A0 05            [ 1]  649 	sub	a, #0x05
      008C61 26 04            [ 1]  650 	jrne	00149$
      008C63 4C               [ 1]  651 	inc	a
      008C64 6B 04            [ 1]  652 	ld	(0x04, sp), a
      008C66 C5                     653 	.byte 0xc5
      008C67                        654 00149$:
      008C67 0F 04            [ 1]  655 	clr	(0x04, sp)
      008C69                        656 00150$:
                                    657 ;	libs/stm8l_usart.c: 959: USARTx->CR5 |= itpos;
      008C69 1E 08            [ 2]  658 	ldw	x, (0x08, sp)
      008C6B 1C 00 08         [ 2]  659 	addw	x, #0x0008
      008C6E 1F 05            [ 2]  660 	ldw	(0x05, sp), x
                                    661 ;	libs/stm8l_usart.c: 964: USARTx->CR2 |= itpos;
      008C70 1E 08            [ 2]  662 	ldw	x, (0x08, sp)
      008C72 1C 00 05         [ 2]  663 	addw	x, #0x0005
                                    664 ;	libs/stm8l_usart.c: 950: if (NewState != DISABLE)
      008C75 0D 0E            [ 1]  665 	tnz	(0x0e, sp)
      008C77 27 22            [ 1]  666 	jreq	00114$
                                    667 ;	libs/stm8l_usart.c: 953: if (usartreg == 0x01)
      008C79 0D 01            [ 1]  668 	tnz	(0x01, sp)
      008C7B 27 0A            [ 1]  669 	jreq	00105$
                                    670 ;	libs/stm8l_usart.c: 955: USARTx->CR1 |= itpos;
      008C7D 1E 02            [ 2]  671 	ldw	x, (0x02, sp)
      008C7F F6               [ 1]  672 	ld	a, (x)
      008C80 1A 07            [ 1]  673 	or	a, (0x07, sp)
      008C82 1E 02            [ 2]  674 	ldw	x, (0x02, sp)
      008C84 F7               [ 1]  675 	ld	(x), a
      008C85 20 36            [ 2]  676 	jra	00116$
      008C87                        677 00105$:
                                    678 ;	libs/stm8l_usart.c: 957: else if (usartreg == 0x05)
      008C87 0D 04            [ 1]  679 	tnz	(0x04, sp)
      008C89 27 0A            [ 1]  680 	jreq	00102$
                                    681 ;	libs/stm8l_usart.c: 959: USARTx->CR5 |= itpos;
      008C8B 1E 05            [ 2]  682 	ldw	x, (0x05, sp)
      008C8D F6               [ 1]  683 	ld	a, (x)
      008C8E 1A 07            [ 1]  684 	or	a, (0x07, sp)
      008C90 1E 05            [ 2]  685 	ldw	x, (0x05, sp)
      008C92 F7               [ 1]  686 	ld	(x), a
      008C93 20 28            [ 2]  687 	jra	00116$
      008C95                        688 00102$:
                                    689 ;	libs/stm8l_usart.c: 964: USARTx->CR2 |= itpos;
      008C95 F6               [ 1]  690 	ld	a, (x)
      008C96 1A 07            [ 1]  691 	or	a, (0x07, sp)
      008C98 F7               [ 1]  692 	ld	(x), a
      008C99 20 22            [ 2]  693 	jra	00116$
      008C9B                        694 00114$:
                                    695 ;	libs/stm8l_usart.c: 972: USARTx->CR1 &= (uint8_t)(~itpos);
      008C9B 03 07            [ 1]  696 	cpl	(0x07, sp)
                                    697 ;	libs/stm8l_usart.c: 970: if (usartreg == 0x01)
      008C9D 0D 01            [ 1]  698 	tnz	(0x01, sp)
      008C9F 27 0A            [ 1]  699 	jreq	00111$
                                    700 ;	libs/stm8l_usart.c: 972: USARTx->CR1 &= (uint8_t)(~itpos);
      008CA1 1E 02            [ 2]  701 	ldw	x, (0x02, sp)
      008CA3 F6               [ 1]  702 	ld	a, (x)
      008CA4 14 07            [ 1]  703 	and	a, (0x07, sp)
      008CA6 1E 02            [ 2]  704 	ldw	x, (0x02, sp)
      008CA8 F7               [ 1]  705 	ld	(x), a
      008CA9 20 12            [ 2]  706 	jra	00116$
      008CAB                        707 00111$:
                                    708 ;	libs/stm8l_usart.c: 974: else if (usartreg == 0x05)
      008CAB 0D 04            [ 1]  709 	tnz	(0x04, sp)
      008CAD 27 0A            [ 1]  710 	jreq	00108$
                                    711 ;	libs/stm8l_usart.c: 976: USARTx->CR5 &= (uint8_t)(~itpos);
      008CAF 1E 05            [ 2]  712 	ldw	x, (0x05, sp)
      008CB1 F6               [ 1]  713 	ld	a, (x)
      008CB2 14 07            [ 1]  714 	and	a, (0x07, sp)
      008CB4 1E 05            [ 2]  715 	ldw	x, (0x05, sp)
      008CB6 F7               [ 1]  716 	ld	(x), a
      008CB7 20 04            [ 2]  717 	jra	00116$
      008CB9                        718 00108$:
                                    719 ;	libs/stm8l_usart.c: 981: USARTx->CR2 &= (uint8_t)(~itpos);
      008CB9 F6               [ 1]  720 	ld	a, (x)
      008CBA 14 07            [ 1]  721 	and	a, (0x07, sp)
      008CBC F7               [ 1]  722 	ld	(x), a
      008CBD                        723 00116$:
                                    724 ;	libs/stm8l_usart.c: 984: }
      008CBD 1E 0A            [ 2]  725 	ldw	x, (10, sp)
      008CBF 5B 0E            [ 2]  726 	addw	sp, #14
      008CC1 FC               [ 2]  727 	jp	(x)
                                    728 ;	libs/stm8l_usart.c: 1002: FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
                                    729 ;	-----------------------------------------
                                    730 ;	 function USART_GetFlagStatus
                                    731 ;	-----------------------------------------
      008CC2                        732 _USART_GetFlagStatus:
      008CC2 88               [ 1]  733 	push	a
                                    734 ;	libs/stm8l_usart.c: 1009: if (USART_FLAG == USART_FLAG_SBK)
      008CC3 16 04            [ 2]  735 	ldw	y, (0x04, sp)
                                    736 ;	libs/stm8l_usart.c: 1011: if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
      008CC5 7B 05            [ 1]  737 	ld	a, (0x05, sp)
      008CC7 6B 01            [ 1]  738 	ld	(0x01, sp), a
                                    739 ;	libs/stm8l_usart.c: 1009: if (USART_FLAG == USART_FLAG_SBK)
      008CC9 90 A3 01 01      [ 2]  740 	cpw	y, #0x0101
      008CCD 26 0D            [ 1]  741 	jrne	00108$
                                    742 ;	libs/stm8l_usart.c: 1011: if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
      008CCF E6 05            [ 1]  743 	ld	a, (0x5, x)
      008CD1 14 01            [ 1]  744 	and	a, (0x01, sp)
      008CD3 27 04            [ 1]  745 	jreq	00102$
                                    746 ;	libs/stm8l_usart.c: 1014: status = SET;
      008CD5 A6 01            [ 1]  747 	ld	a, #0x01
      008CD7 20 0C            [ 2]  748 	jra	00109$
      008CD9                        749 00102$:
                                    750 ;	libs/stm8l_usart.c: 1019: status = RESET;
      008CD9 4F               [ 1]  751 	clr	a
      008CDA 20 09            [ 2]  752 	jra	00109$
      008CDC                        753 00108$:
                                    754 ;	libs/stm8l_usart.c: 1024: if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
      008CDC F6               [ 1]  755 	ld	a, (x)
      008CDD 14 01            [ 1]  756 	and	a, (0x01, sp)
      008CDF 27 03            [ 1]  757 	jreq	00105$
                                    758 ;	libs/stm8l_usart.c: 1027: status = SET;
      008CE1 A6 01            [ 1]  759 	ld	a, #0x01
                                    760 ;	libs/stm8l_usart.c: 1032: status = RESET;
      008CE3 21                     761 	.byte 0x21
      008CE4                        762 00105$:
      008CE4 4F               [ 1]  763 	clr	a
      008CE5                        764 00109$:
                                    765 ;	libs/stm8l_usart.c: 1036: return status;
                                    766 ;	libs/stm8l_usart.c: 1037: }
      008CE5 1E 02            [ 2]  767 	ldw	x, (2, sp)
      008CE7 5B 05            [ 2]  768 	addw	sp, #5
      008CE9 FC               [ 2]  769 	jp	(x)
                                    770 ;	libs/stm8l_usart.c: 1060: void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
                                    771 ;	-----------------------------------------
                                    772 ;	 function USART_ClearFlag
                                    773 ;	-----------------------------------------
      008CEA                        774 _USART_ClearFlag:
                                    775 ;	libs/stm8l_usart.c: 1065: USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
      008CEA 16 03            [ 2]  776 	ldw	y, (0x03, sp)
      008CEC 90 53            [ 2]  777 	cplw	y
      008CEE 90 9F            [ 1]  778 	ld	a, yl
      008CF0 F7               [ 1]  779 	ld	(x), a
                                    780 ;	libs/stm8l_usart.c: 1066: }
      008CF1 1E 01            [ 2]  781 	ldw	x, (1, sp)
      008CF3 5B 04            [ 2]  782 	addw	sp, #4
      008CF5 FC               [ 2]  783 	jp	(x)
                                    784 ;	libs/stm8l_usart.c: 1083: ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
                                    785 ;	-----------------------------------------
                                    786 ;	 function USART_GetITStatus
                                    787 ;	-----------------------------------------
      008CF6                        788 _USART_GetITStatus:
      008CF6 52 06            [ 2]  789 	sub	sp, #6
      008CF8 1F 05            [ 2]  790 	ldw	(0x05, sp), x
                                    791 ;	libs/stm8l_usart.c: 1096: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
      008CFA 7B 0A            [ 1]  792 	ld	a, (0x0a, sp)
      008CFC 97               [ 1]  793 	ld	xl, a
      008CFD A4 0F            [ 1]  794 	and	a, #0x0f
      008CFF 88               [ 1]  795 	push	a
      008D00 A6 01            [ 1]  796 	ld	a, #0x01
      008D02 6B 05            [ 1]  797 	ld	(0x05, sp), a
      008D04 84               [ 1]  798 	pop	a
      008D05 4D               [ 1]  799 	tnz	a
      008D06 27 05            [ 1]  800 	jreq	00163$
      008D08                        801 00162$:
      008D08 08 04            [ 1]  802 	sll	(0x04, sp)
      008D0A 4A               [ 1]  803 	dec	a
      008D0B 26 FB            [ 1]  804 	jrne	00162$
      008D0D                        805 00163$:
                                    806 ;	libs/stm8l_usart.c: 1098: itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
      008D0D 9F               [ 1]  807 	ld	a, xl
      008D0E 4E               [ 1]  808 	swap	a
      008D0F A4 0F            [ 1]  809 	and	a, #0x0f
                                    810 ;	libs/stm8l_usart.c: 1100: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      008D11 88               [ 1]  811 	push	a
      008D12 A6 01            [ 1]  812 	ld	a, #0x01
      008D14 6B 02            [ 1]  813 	ld	(0x02, sp), a
      008D16 84               [ 1]  814 	pop	a
      008D17 4D               [ 1]  815 	tnz	a
      008D18 27 05            [ 1]  816 	jreq	00165$
      008D1A                        817 00164$:
      008D1A 08 01            [ 1]  818 	sll	(0x01, sp)
      008D1C 4A               [ 1]  819 	dec	a
      008D1D 26 FB            [ 1]  820 	jrne	00164$
      008D1F                        821 00165$:
                                    822 ;	libs/stm8l_usart.c: 1103: if (USART_IT == USART_IT_PE)
      008D1F 16 09            [ 2]  823 	ldw	y, (0x09, sp)
      008D21 17 02            [ 2]  824 	ldw	(0x02, sp), y
                                    825 ;	libs/stm8l_usart.c: 1109: if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008D23 1E 05            [ 2]  826 	ldw	x, (0x05, sp)
      008D25 F6               [ 1]  827 	ld	a, (x)
      008D26 14 04            [ 1]  828 	and	a, (0x04, sp)
      008D28 6B 04            [ 1]  829 	ld	(0x04, sp), a
                                    830 ;	libs/stm8l_usart.c: 1103: if (USART_IT == USART_IT_PE)
      008D2A 1E 02            [ 2]  831 	ldw	x, (0x02, sp)
      008D2C A3 01 00         [ 2]  832 	cpw	x, #0x0100
      008D2F 26 17            [ 1]  833 	jrne	00118$
                                    834 ;	libs/stm8l_usart.c: 1106: enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
      008D31 16 05            [ 2]  835 	ldw	y, (0x05, sp)
      008D33 17 02            [ 2]  836 	ldw	(0x02, sp), y
      008D35 93               [ 1]  837 	ldw	x, y
      008D36 E6 04            [ 1]  838 	ld	a, (0x4, x)
      008D38 14 01            [ 1]  839 	and	a, (0x01, sp)
                                    840 ;	libs/stm8l_usart.c: 1109: if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008D3A 0D 04            [ 1]  841 	tnz	(0x04, sp)
      008D3C 27 07            [ 1]  842 	jreq	00102$
      008D3E 4D               [ 1]  843 	tnz	a
      008D3F 27 04            [ 1]  844 	jreq	00102$
                                    845 ;	libs/stm8l_usart.c: 1112: pendingbitstatus = SET;
      008D41 A6 01            [ 1]  846 	ld	a, #0x01
      008D43 20 35            [ 2]  847 	jra	00119$
      008D45                        848 00102$:
                                    849 ;	libs/stm8l_usart.c: 1117: pendingbitstatus = RESET;
      008D45 4F               [ 1]  850 	clr	a
      008D46 20 32            [ 2]  851 	jra	00119$
      008D48                        852 00118$:
                                    853 ;	libs/stm8l_usart.c: 1124: enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
      008D48 1E 05            [ 2]  854 	ldw	x, (0x05, sp)
      008D4A E6 05            [ 1]  855 	ld	a, (0x5, x)
      008D4C 14 01            [ 1]  856 	and	a, (0x01, sp)
                                    857 ;	libs/stm8l_usart.c: 1121: else if (USART_IT == USART_IT_OR)
      008D4E 1E 02            [ 2]  858 	ldw	x, (0x02, sp)
      008D50 A3 02 35         [ 2]  859 	cpw	x, #0x0235
      008D53 26 1A            [ 1]  860 	jrne	00115$
                                    861 ;	libs/stm8l_usart.c: 1124: enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
      008D55 6B 03            [ 1]  862 	ld	(0x03, sp), a
                                    863 ;	libs/stm8l_usart.c: 1127: temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
      008D57 1E 05            [ 2]  864 	ldw	x, (0x05, sp)
      008D59 E6 08            [ 1]  865 	ld	a, (0x8, x)
      008D5B A4 01            [ 1]  866 	and	a, #0x01
                                    867 ;	libs/stm8l_usart.c: 1129: if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
      008D5D 0D 04            [ 1]  868 	tnz	(0x04, sp)
      008D5F 27 0B            [ 1]  869 	jreq	00106$
      008D61 0D 03            [ 1]  870 	tnz	(0x03, sp)
      008D63 26 03            [ 1]  871 	jrne	00105$
      008D65 4D               [ 1]  872 	tnz	a
      008D66 27 04            [ 1]  873 	jreq	00106$
      008D68                        874 00105$:
                                    875 ;	libs/stm8l_usart.c: 1132: pendingbitstatus = SET;
      008D68 A6 01            [ 1]  876 	ld	a, #0x01
      008D6A 20 0E            [ 2]  877 	jra	00119$
      008D6C                        878 00106$:
                                    879 ;	libs/stm8l_usart.c: 1137: pendingbitstatus = RESET;
      008D6C 4F               [ 1]  880 	clr	a
      008D6D 20 0B            [ 2]  881 	jra	00119$
      008D6F                        882 00115$:
                                    883 ;	libs/stm8l_usart.c: 1144: enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
                                    884 ;	libs/stm8l_usart.c: 1146: if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008D6F 0D 04            [ 1]  885 	tnz	(0x04, sp)
      008D71 27 06            [ 1]  886 	jreq	00111$
      008D73 4D               [ 1]  887 	tnz	a
      008D74 27 03            [ 1]  888 	jreq	00111$
                                    889 ;	libs/stm8l_usart.c: 1149: pendingbitstatus = SET;
      008D76 A6 01            [ 1]  890 	ld	a, #0x01
                                    891 ;	libs/stm8l_usart.c: 1154: pendingbitstatus = RESET;
      008D78 21                     892 	.byte 0x21
      008D79                        893 00111$:
      008D79 4F               [ 1]  894 	clr	a
      008D7A                        895 00119$:
                                    896 ;	libs/stm8l_usart.c: 1159: return  pendingbitstatus;
                                    897 ;	libs/stm8l_usart.c: 1160: }
      008D7A 1E 07            [ 2]  898 	ldw	x, (7, sp)
      008D7C 5B 0A            [ 2]  899 	addw	sp, #10
      008D7E FC               [ 2]  900 	jp	(x)
                                    901 ;	libs/stm8l_usart.c: 1183: void USART_ClearITPendingBit(USART_TypeDef* USARTx)//, USART_IT_TypeDef USART_IT)
                                    902 ;	-----------------------------------------
                                    903 ;	 function USART_ClearITPendingBit
                                    904 ;	-----------------------------------------
      008D7F                        905 _USART_ClearITPendingBit:
                                    906 ;	libs/stm8l_usart.c: 1188: USARTx->SR &= (uint8_t)(~USART_SR_TC);
      008D7F F6               [ 1]  907 	ld	a, (x)
      008D80 A4 BF            [ 1]  908 	and	a, #0xbf
      008D82 F7               [ 1]  909 	ld	(x), a
                                    910 ;	libs/stm8l_usart.c: 1189: }
      008D83 81               [ 4]  911 	ret
                                    912 	.area CODE
                                    913 	.area CONST
                                    914 	.area INITIALIZER
                                    915 	.area CABS (ABS)
