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
      008999                         78 _USART_DeInit:
                                     79 ;	libs/stm8l_usart.c: 154: (void) USARTx->DR;
      008999 90 93            [ 1]   80 	ldw	y, x
      00899B E6 01            [ 1]   81 	ld	a, (0x1, x)
                                     82 ;	libs/stm8l_usart.c: 156: USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
      00899D 93               [ 1]   83 	ldw	x, y
      00899E 6F 03            [ 1]   84 	clr	(0x0003, x)
                                     85 ;	libs/stm8l_usart.c: 157: USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
      0089A0 93               [ 1]   86 	ldw	x, y
      0089A1 5C               [ 1]   87 	incw	x
      0089A2 5C               [ 1]   88 	incw	x
      0089A3 7F               [ 1]   89 	clr	(x)
                                     90 ;	libs/stm8l_usart.c: 159: USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
      0089A4 93               [ 1]   91 	ldw	x, y
      0089A5 6F 04            [ 1]   92 	clr	(0x0004, x)
                                     93 ;	libs/stm8l_usart.c: 160: USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
      0089A7 93               [ 1]   94 	ldw	x, y
      0089A8 6F 05            [ 1]   95 	clr	(0x0005, x)
                                     96 ;	libs/stm8l_usart.c: 161: USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
      0089AA 93               [ 1]   97 	ldw	x, y
      0089AB 6F 06            [ 1]   98 	clr	(0x0006, x)
                                     99 ;	libs/stm8l_usart.c: 162: USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
      0089AD 93               [ 1]  100 	ldw	x, y
      0089AE 6F 07            [ 1]  101 	clr	(0x0007, x)
                                    102 ;	libs/stm8l_usart.c: 163: }
      0089B0 81               [ 4]  103 	ret
                                    104 ;	libs/stm8l_usart.c: 192: void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
                                    105 ;	-----------------------------------------
                                    106 ;	 function USART_Init
                                    107 ;	-----------------------------------------
      0089B1                        108 _USART_Init:
      0089B1 52 0B            [ 2]  109 	sub	sp, #11
                                    110 ;	libs/stm8l_usart.c: 210: USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
      0089B3 1F 0A            [ 2]  111 	ldw	(0x0a, sp), x
      0089B5 1C 00 04         [ 2]  112 	addw	x, #0x0004
      0089B8 F6               [ 1]  113 	ld	a, (x)
      0089B9 A4 E9            [ 1]  114 	and	a, #0xe9
      0089BB 6B 09            [ 1]  115 	ld	(0x09, sp), a
      0089BD F7               [ 1]  116 	ld	(x), a
                                    117 ;	libs/stm8l_usart.c: 213: USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
      0089BE F6               [ 1]  118 	ld	a, (x)
      0089BF 7B 12            [ 1]  119 	ld	a, (0x12, sp)
      0089C1 1A 14            [ 1]  120 	or	a, (0x14, sp)
      0089C3 1A 09            [ 1]  121 	or	a, (0x09, sp)
      0089C5 F7               [ 1]  122 	ld	(x), a
                                    123 ;	libs/stm8l_usart.c: 216: USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
      0089C6 1E 0A            [ 2]  124 	ldw	x, (0x0a, sp)
      0089C8 1C 00 06         [ 2]  125 	addw	x, #0x0006
      0089CB F6               [ 1]  126 	ld	a, (x)
      0089CC A4 CF            [ 1]  127 	and	a, #0xcf
      0089CE F7               [ 1]  128 	ld	(x), a
                                    129 ;	libs/stm8l_usart.c: 218: USARTx->CR3 |= (uint8_t)USART_StopBits;
      0089CF 88               [ 1]  130 	push	a
      0089D0 F6               [ 1]  131 	ld	a, (x)
      0089D1 84               [ 1]  132 	pop	a
      0089D2 1A 13            [ 1]  133 	or	a, (0x13, sp)
      0089D4 F7               [ 1]  134 	ld	(x), a
                                    135 ;	libs/stm8l_usart.c: 221: USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
      0089D5 1E 0A            [ 2]  136 	ldw	x, (0x0a, sp)
      0089D7 5C               [ 1]  137 	incw	x
      0089D8 5C               [ 1]  138 	incw	x
      0089D9 1F 01            [ 2]  139 	ldw	(0x01, sp), x
      0089DB F6               [ 1]  140 	ld	a, (x)
      0089DC 1E 01            [ 2]  141 	ldw	x, (0x01, sp)
      0089DE 7F               [ 1]  142 	clr	(x)
                                    143 ;	libs/stm8l_usart.c: 223: USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
      0089DF 1E 0A            [ 2]  144 	ldw	x, (0x0a, sp)
      0089E1 1C 00 03         [ 2]  145 	addw	x, #0x0003
      0089E4 1F 03            [ 2]  146 	ldw	(0x03, sp), x
      0089E6 F6               [ 1]  147 	ld	a, (x)
      0089E7 A4 0F            [ 1]  148 	and	a, #0x0f
      0089E9 1E 03            [ 2]  149 	ldw	x, (0x03, sp)
      0089EB F7               [ 1]  150 	ld	(x), a
                                    151 ;	libs/stm8l_usart.c: 225: USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
      0089EC 1E 03            [ 2]  152 	ldw	x, (0x03, sp)
      0089EE 88               [ 1]  153 	push	a
      0089EF F6               [ 1]  154 	ld	a, (x)
      0089F0 84               [ 1]  155 	pop	a
      0089F1 A4 F0            [ 1]  156 	and	a, #0xf0
      0089F3 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      0089F5 F7               [ 1]  158 	ld	(x), a
                                    159 ;	libs/stm8l_usart.c: 227: BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
      0089F6 CD 85 AF         [ 4]  160 	call	_CLK_GetClockFreq
      0089F9 1F 08            [ 2]  161 	ldw	(0x08, sp), x
      0089FB 1E 10            [ 2]  162 	ldw	x, (0x10, sp)
      0089FD 89               [ 2]  163 	pushw	x
      0089FE 1E 10            [ 2]  164 	ldw	x, (0x10, sp)
      008A00 89               [ 2]  165 	pushw	x
      008A01 1E 0C            [ 2]  166 	ldw	x, (0x0c, sp)
      008A03 89               [ 2]  167 	pushw	x
      008A04 90 89            [ 2]  168 	pushw	y
      008A06 CD 8C F6         [ 4]  169 	call	__divulong
      008A09 5B 08            [ 2]  170 	addw	sp, #8
      008A0B 17 05            [ 2]  171 	ldw	(0x05, sp), y
                                    172 ;	libs/stm8l_usart.c: 229: USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
      008A0D 9E               [ 1]  173 	ld	a, xh
      008A0E A4 F0            [ 1]  174 	and	a, #0xf0
      008A10 6B 09            [ 1]  175 	ld	(0x09, sp), a
      008A12 16 03            [ 2]  176 	ldw	y, (0x03, sp)
      008A14 7B 09            [ 1]  177 	ld	a, (0x09, sp)
      008A16 90 F7            [ 1]  178 	ld	(y), a
                                    179 ;	libs/stm8l_usart.c: 231: USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
      008A18 16 03            [ 2]  180 	ldw	y, (0x03, sp)
      008A1A 90 F6            [ 1]  181 	ld	a, (y)
      008A1C 9F               [ 1]  182 	ld	a, xl
      008A1D A4 0F            [ 1]  183 	and	a, #0x0f
      008A1F 1A 09            [ 1]  184 	or	a, (0x09, sp)
      008A21 16 03            [ 2]  185 	ldw	y, (0x03, sp)
      008A23 90 F7            [ 1]  186 	ld	(y), a
                                    187 ;	libs/stm8l_usart.c: 233: USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
      008A25 A6 10            [ 1]  188 	ld	a, #0x10
      008A27 62               [ 2]  189 	div	x, a
      008A28 9F               [ 1]  190 	ld	a, xl
      008A29 1E 01            [ 2]  191 	ldw	x, (0x01, sp)
      008A2B F7               [ 1]  192 	ld	(x), a
                                    193 ;	libs/stm8l_usart.c: 236: USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
      008A2C 1E 0A            [ 2]  194 	ldw	x, (0x0a, sp)
      008A2E 1C 00 05         [ 2]  195 	addw	x, #0x0005
      008A31 F6               [ 1]  196 	ld	a, (x)
      008A32 A4 F3            [ 1]  197 	and	a, #0xf3
      008A34 F7               [ 1]  198 	ld	(x), a
                                    199 ;	libs/stm8l_usart.c: 238: USARTx->CR2 |= (uint8_t)USART_Mode;
      008A35 88               [ 1]  200 	push	a
      008A36 F6               [ 1]  201 	ld	a, (x)
      008A37 84               [ 1]  202 	pop	a
      008A38 1A 15            [ 1]  203 	or	a, (0x15, sp)
      008A3A F7               [ 1]  204 	ld	(x), a
                                    205 ;	libs/stm8l_usart.c: 239: }
      008A3B 1E 0C            [ 2]  206 	ldw	x, (12, sp)
      008A3D 5B 15            [ 2]  207 	addw	sp, #21
      008A3F FC               [ 2]  208 	jp	(x)
                                    209 ;	libs/stm8l_usart.c: 264: void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
                                    210 ;	-----------------------------------------
                                    211 ;	 function USART_ClockInit
                                    212 ;	-----------------------------------------
      008A40                        213 _USART_ClockInit:
      008A40 52 04            [ 2]  214 	sub	sp, #4
      008A42 6B 04            [ 1]  215 	ld	(0x04, sp), a
                                    216 ;	libs/stm8l_usart.c: 275: USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
      008A44 1C 00 06         [ 2]  217 	addw	x, #0x0006
      008A47 1F 01            [ 2]  218 	ldw	(0x01, sp), x
      008A49 F6               [ 1]  219 	ld	a, (x)
      008A4A A4 F8            [ 1]  220 	and	a, #0xf8
      008A4C 6B 03            [ 1]  221 	ld	(0x03, sp), a
      008A4E 1E 01            [ 2]  222 	ldw	x, (0x01, sp)
      008A50 7B 03            [ 1]  223 	ld	a, (0x03, sp)
      008A52 F7               [ 1]  224 	ld	(x), a
                                    225 ;	libs/stm8l_usart.c: 277: USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
      008A53 1E 01            [ 2]  226 	ldw	x, (0x01, sp)
      008A55 F6               [ 1]  227 	ld	a, (x)
      008A56 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      008A58 1A 08            [ 1]  229 	or	a, (0x08, sp)
      008A5A 1A 09            [ 1]  230 	or	a, (0x09, sp)
      008A5C 1A 03            [ 1]  231 	or	a, (0x03, sp)
      008A5E 1E 01            [ 2]  232 	ldw	x, (0x01, sp)
      008A60 F7               [ 1]  233 	ld	(x), a
                                    234 ;	libs/stm8l_usart.c: 275: USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
      008A61 1E 01            [ 2]  235 	ldw	x, (0x01, sp)
      008A63 F6               [ 1]  236 	ld	a, (x)
                                    237 ;	libs/stm8l_usart.c: 279: if (USART_Clock != USART_Clock_Disable)
      008A64 0D 04            [ 1]  238 	tnz	(0x04, sp)
      008A66 27 07            [ 1]  239 	jreq	00102$
                                    240 ;	libs/stm8l_usart.c: 281: USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
      008A68 AA 08            [ 1]  241 	or	a, #0x08
      008A6A 1E 01            [ 2]  242 	ldw	x, (0x01, sp)
      008A6C F7               [ 1]  243 	ld	(x), a
      008A6D 20 05            [ 2]  244 	jra	00104$
      008A6F                        245 00102$:
                                    246 ;	libs/stm8l_usart.c: 285: USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
      008A6F A4 F7            [ 1]  247 	and	a, #0xf7
      008A71 1E 01            [ 2]  248 	ldw	x, (0x01, sp)
      008A73 F7               [ 1]  249 	ld	(x), a
      008A74                        250 00104$:
                                    251 ;	libs/stm8l_usart.c: 287: }
      008A74 1E 05            [ 2]  252 	ldw	x, (5, sp)
      008A76 5B 09            [ 2]  253 	addw	sp, #9
      008A78 FC               [ 2]  254 	jp	(x)
                                    255 ;	libs/stm8l_usart.c: 296: void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    256 ;	-----------------------------------------
                                    257 ;	 function USART_Cmd
                                    258 ;	-----------------------------------------
      008A79                        259 _USART_Cmd:
      008A79 88               [ 1]  260 	push	a
      008A7A 6B 01            [ 1]  261 	ld	(0x01, sp), a
                                    262 ;	libs/stm8l_usart.c: 300: USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
      008A7C 1C 00 04         [ 2]  263 	addw	x, #0x0004
      008A7F F6               [ 1]  264 	ld	a, (x)
                                    265 ;	libs/stm8l_usart.c: 298: if (NewState != DISABLE)
      008A80 0D 01            [ 1]  266 	tnz	(0x01, sp)
      008A82 27 05            [ 1]  267 	jreq	00102$
                                    268 ;	libs/stm8l_usart.c: 300: USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
      008A84 A4 DF            [ 1]  269 	and	a, #0xdf
      008A86 F7               [ 1]  270 	ld	(x), a
      008A87 20 03            [ 2]  271 	jra	00104$
      008A89                        272 00102$:
                                    273 ;	libs/stm8l_usart.c: 304: USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
      008A89 AA 20            [ 1]  274 	or	a, #0x20
      008A8B F7               [ 1]  275 	ld	(x), a
      008A8C                        276 00104$:
                                    277 ;	libs/stm8l_usart.c: 306: }
      008A8C 84               [ 1]  278 	pop	a
      008A8D 81               [ 4]  279 	ret
                                    280 ;	libs/stm8l_usart.c: 329: void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
                                    281 ;	-----------------------------------------
                                    282 ;	 function USART_SetPrescaler
                                    283 ;	-----------------------------------------
      008A8E                        284 _USART_SetPrescaler:
                                    285 ;	libs/stm8l_usart.c: 332: USARTx->PSCR = USART_Prescaler;
      008A8E 1C 00 0A         [ 2]  286 	addw	x, #0x000a
      008A91 F7               [ 1]  287 	ld	(x), a
                                    288 ;	libs/stm8l_usart.c: 333: }
      008A92 81               [ 4]  289 	ret
                                    290 ;	libs/stm8l_usart.c: 340: void USART_SendBreak(USART_TypeDef* USARTx)
                                    291 ;	-----------------------------------------
                                    292 ;	 function USART_SendBreak
                                    293 ;	-----------------------------------------
      008A93                        294 _USART_SendBreak:
                                    295 ;	libs/stm8l_usart.c: 342: USARTx->CR2 |= USART_CR2_SBK;
      008A93 1C 00 05         [ 2]  296 	addw	x, #0x0005
      008A96 F6               [ 1]  297 	ld	a, (x)
      008A97 AA 01            [ 1]  298 	or	a, #0x01
      008A99 F7               [ 1]  299 	ld	(x), a
                                    300 ;	libs/stm8l_usart.c: 343: }
      008A9A 81               [ 4]  301 	ret
                                    302 ;	libs/stm8l_usart.c: 382: uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
                                    303 ;	-----------------------------------------
                                    304 ;	 function USART_ReceiveData8
                                    305 ;	-----------------------------------------
      008A9B                        306 _USART_ReceiveData8:
                                    307 ;	libs/stm8l_usart.c: 384: return USARTx->DR;
      008A9B E6 01            [ 1]  308 	ld	a, (0x1, x)
                                    309 ;	libs/stm8l_usart.c: 385: }
      008A9D 81               [ 4]  310 	ret
                                    311 ;	libs/stm8l_usart.c: 392: uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
                                    312 ;	-----------------------------------------
                                    313 ;	 function USART_ReceiveData9
                                    314 ;	-----------------------------------------
      008A9E                        315 _USART_ReceiveData9:
      008A9E 52 02            [ 2]  316 	sub	sp, #2
                                    317 ;	libs/stm8l_usart.c: 396: temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
      008AA0 90 93            [ 1]  318 	ldw	y, x
      008AA2 E6 04            [ 1]  319 	ld	a, (0x4, x)
      008AA4 A4 80            [ 1]  320 	and	a, #0x80
      008AA6 97               [ 1]  321 	ld	xl, a
      008AA7 4F               [ 1]  322 	clr	a
      008AA8 95               [ 1]  323 	ld	xh, a
      008AA9 58               [ 2]  324 	sllw	x
      008AAA 1F 01            [ 2]  325 	ldw	(0x01, sp), x
                                    326 ;	libs/stm8l_usart.c: 397: return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
      008AAC 90 E6 01         [ 1]  327 	ld	a, (0x1, y)
      008AAF 5F               [ 1]  328 	clrw	x
      008AB0 1A 02            [ 1]  329 	or	a, (0x02, sp)
      008AB2 02               [ 1]  330 	rlwa	x
      008AB3 1A 01            [ 1]  331 	or	a, (0x01, sp)
      008AB5 A4 01            [ 1]  332 	and	a, #0x01
      008AB7 95               [ 1]  333 	ld	xh, a
                                    334 ;	libs/stm8l_usart.c: 398: }
      008AB8 5B 02            [ 2]  335 	addw	sp, #2
      008ABA 81               [ 4]  336 	ret
                                    337 ;	libs/stm8l_usart.c: 405: void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
                                    338 ;	-----------------------------------------
                                    339 ;	 function USART_SendData8
                                    340 ;	-----------------------------------------
      008ABB                        341 _USART_SendData8:
                                    342 ;	libs/stm8l_usart.c: 408: USARTx->DR = Data;
      008ABB 5C               [ 1]  343 	incw	x
      008ABC F7               [ 1]  344 	ld	(x), a
                                    345 ;	libs/stm8l_usart.c: 409: }
      008ABD 81               [ 4]  346 	ret
                                    347 ;	libs/stm8l_usart.c: 418: void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
                                    348 ;	-----------------------------------------
                                    349 ;	 function USART_SendData9
                                    350 ;	-----------------------------------------
      008ABE                        351 _USART_SendData9:
      008ABE 52 03            [ 2]  352 	sub	sp, #3
                                    353 ;	libs/stm8l_usart.c: 423: USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
      008AC0 1F 02            [ 2]  354 	ldw	(0x02, sp), x
      008AC2 1C 00 04         [ 2]  355 	addw	x, #0x0004
      008AC5 F6               [ 1]  356 	ld	a, (x)
      008AC6 A4 BF            [ 1]  357 	and	a, #0xbf
      008AC8 6B 01            [ 1]  358 	ld	(0x01, sp), a
      008ACA F7               [ 1]  359 	ld	(x), a
                                    360 ;	libs/stm8l_usart.c: 426: USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
      008ACB F6               [ 1]  361 	ld	a, (x)
      008ACC 16 06            [ 2]  362 	ldw	y, (0x06, sp)
      008ACE 90 54            [ 2]  363 	srlw	y
      008AD0 90 54            [ 2]  364 	srlw	y
      008AD2 90 9F            [ 1]  365 	ld	a, yl
      008AD4 A4 40            [ 1]  366 	and	a, #0x40
      008AD6 1A 01            [ 1]  367 	or	a, (0x01, sp)
      008AD8 F7               [ 1]  368 	ld	(x), a
                                    369 ;	libs/stm8l_usart.c: 429: USARTx->DR   = (uint8_t)(Data);
      008AD9 1E 02            [ 2]  370 	ldw	x, (0x02, sp)
      008ADB 5C               [ 1]  371 	incw	x
      008ADC 7B 07            [ 1]  372 	ld	a, (0x07, sp)
      008ADE F7               [ 1]  373 	ld	(x), a
                                    374 ;	libs/stm8l_usart.c: 430: }
      008ADF 1E 04            [ 2]  375 	ldw	x, (4, sp)
      008AE1 5B 07            [ 2]  376 	addw	sp, #7
      008AE3 FC               [ 2]  377 	jp	(x)
                                    378 ;	libs/stm8l_usart.c: 473: void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    379 ;	-----------------------------------------
                                    380 ;	 function USART_ReceiverWakeUpCmd
                                    381 ;	-----------------------------------------
      008AE4                        382 _USART_ReceiverWakeUpCmd:
      008AE4 88               [ 1]  383 	push	a
      008AE5 6B 01            [ 1]  384 	ld	(0x01, sp), a
                                    385 ;	libs/stm8l_usart.c: 480: USARTx->CR2 |= USART_CR2_RWU;
      008AE7 1C 00 05         [ 2]  386 	addw	x, #0x0005
      008AEA F6               [ 1]  387 	ld	a, (x)
                                    388 ;	libs/stm8l_usart.c: 477: if (NewState != DISABLE)
      008AEB 0D 01            [ 1]  389 	tnz	(0x01, sp)
      008AED 27 05            [ 1]  390 	jreq	00102$
                                    391 ;	libs/stm8l_usart.c: 480: USARTx->CR2 |= USART_CR2_RWU;
      008AEF AA 02            [ 1]  392 	or	a, #0x02
      008AF1 F7               [ 1]  393 	ld	(x), a
      008AF2 20 03            [ 2]  394 	jra	00104$
      008AF4                        395 00102$:
                                    396 ;	libs/stm8l_usart.c: 485: USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
      008AF4 A4 FD            [ 1]  397 	and	a, #0xfd
      008AF6 F7               [ 1]  398 	ld	(x), a
      008AF7                        399 00104$:
                                    400 ;	libs/stm8l_usart.c: 487: }
      008AF7 84               [ 1]  401 	pop	a
      008AF8 81               [ 4]  402 	ret
                                    403 ;	libs/stm8l_usart.c: 496: void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
                                    404 ;	-----------------------------------------
                                    405 ;	 function USART_SetAddress
                                    406 ;	-----------------------------------------
      008AF9                        407 _USART_SetAddress:
      008AF9 88               [ 1]  408 	push	a
      008AFA 6B 01            [ 1]  409 	ld	(0x01, sp), a
                                    410 ;	libs/stm8l_usart.c: 502: USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
      008AFC 1C 00 07         [ 2]  411 	addw	x, #0x0007
      008AFF F6               [ 1]  412 	ld	a, (x)
      008B00 A4 F0            [ 1]  413 	and	a, #0xf0
      008B02 F7               [ 1]  414 	ld	(x), a
                                    415 ;	libs/stm8l_usart.c: 504: USARTx->CR4 |= USART_Address;
      008B03 88               [ 1]  416 	push	a
      008B04 F6               [ 1]  417 	ld	a, (x)
      008B05 84               [ 1]  418 	pop	a
      008B06 1A 01            [ 1]  419 	or	a, (0x01, sp)
      008B08 F7               [ 1]  420 	ld	(x), a
                                    421 ;	libs/stm8l_usart.c: 505: }
      008B09 84               [ 1]  422 	pop	a
      008B0A 81               [ 4]  423 	ret
                                    424 ;	libs/stm8l_usart.c: 515: void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
                                    425 ;	-----------------------------------------
                                    426 ;	 function USART_WakeUpConfig
                                    427 ;	-----------------------------------------
      008B0B                        428 _USART_WakeUpConfig:
      008B0B 88               [ 1]  429 	push	a
      008B0C 6B 01            [ 1]  430 	ld	(0x01, sp), a
                                    431 ;	libs/stm8l_usart.c: 519: USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
      008B0E 1C 00 04         [ 2]  432 	addw	x, #0x0004
      008B11 F6               [ 1]  433 	ld	a, (x)
      008B12 A4 F7            [ 1]  434 	and	a, #0xf7
      008B14 F7               [ 1]  435 	ld	(x), a
                                    436 ;	libs/stm8l_usart.c: 520: USARTx->CR1 |= (uint8_t)USART_WakeUp;
      008B15 88               [ 1]  437 	push	a
      008B16 F6               [ 1]  438 	ld	a, (x)
      008B17 84               [ 1]  439 	pop	a
      008B18 1A 01            [ 1]  440 	or	a, (0x01, sp)
      008B1A F7               [ 1]  441 	ld	(x), a
                                    442 ;	libs/stm8l_usart.c: 521: }
      008B1B 84               [ 1]  443 	pop	a
      008B1C 81               [ 4]  444 	ret
                                    445 ;	libs/stm8l_usart.c: 566: void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    446 ;	-----------------------------------------
                                    447 ;	 function USART_HalfDuplexCmd
                                    448 ;	-----------------------------------------
      008B1D                        449 _USART_HalfDuplexCmd:
      008B1D 88               [ 1]  450 	push	a
      008B1E 6B 01            [ 1]  451 	ld	(0x01, sp), a
                                    452 ;	libs/stm8l_usart.c: 572: USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
      008B20 1C 00 08         [ 2]  453 	addw	x, #0x0008
      008B23 F6               [ 1]  454 	ld	a, (x)
                                    455 ;	libs/stm8l_usart.c: 570: if (NewState != DISABLE)
      008B24 0D 01            [ 1]  456 	tnz	(0x01, sp)
      008B26 27 05            [ 1]  457 	jreq	00102$
                                    458 ;	libs/stm8l_usart.c: 572: USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
      008B28 AA 08            [ 1]  459 	or	a, #0x08
      008B2A F7               [ 1]  460 	ld	(x), a
      008B2B 20 03            [ 2]  461 	jra	00104$
      008B2D                        462 00102$:
                                    463 ;	libs/stm8l_usart.c: 576: USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
      008B2D A4 F7            [ 1]  464 	and	a, #0xf7
      008B2F F7               [ 1]  465 	ld	(x), a
      008B30                        466 00104$:
                                    467 ;	libs/stm8l_usart.c: 578: }
      008B30 84               [ 1]  468 	pop	a
      008B31 81               [ 4]  469 	ret
                                    470 ;	libs/stm8l_usart.c: 644: void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    471 ;	-----------------------------------------
                                    472 ;	 function USART_SmartCardCmd
                                    473 ;	-----------------------------------------
      008B32                        474 _USART_SmartCardCmd:
      008B32 88               [ 1]  475 	push	a
      008B33 6B 01            [ 1]  476 	ld	(0x01, sp), a
                                    477 ;	libs/stm8l_usart.c: 651: USARTx->CR5 |= USART_CR5_SCEN;
      008B35 1C 00 08         [ 2]  478 	addw	x, #0x0008
      008B38 F6               [ 1]  479 	ld	a, (x)
                                    480 ;	libs/stm8l_usart.c: 648: if (NewState != DISABLE)
      008B39 0D 01            [ 1]  481 	tnz	(0x01, sp)
      008B3B 27 05            [ 1]  482 	jreq	00102$
                                    483 ;	libs/stm8l_usart.c: 651: USARTx->CR5 |= USART_CR5_SCEN;
      008B3D AA 20            [ 1]  484 	or	a, #0x20
      008B3F F7               [ 1]  485 	ld	(x), a
      008B40 20 03            [ 2]  486 	jra	00104$
      008B42                        487 00102$:
                                    488 ;	libs/stm8l_usart.c: 656: USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
      008B42 A4 DF            [ 1]  489 	and	a, #0xdf
      008B44 F7               [ 1]  490 	ld	(x), a
      008B45                        491 00104$:
                                    492 ;	libs/stm8l_usart.c: 658: }
      008B45 84               [ 1]  493 	pop	a
      008B46 81               [ 4]  494 	ret
                                    495 ;	libs/stm8l_usart.c: 667: void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    496 ;	-----------------------------------------
                                    497 ;	 function USART_SmartCardNACKCmd
                                    498 ;	-----------------------------------------
      008B47                        499 _USART_SmartCardNACKCmd:
      008B47 88               [ 1]  500 	push	a
      008B48 6B 01            [ 1]  501 	ld	(0x01, sp), a
                                    502 ;	libs/stm8l_usart.c: 674: USARTx->CR5 |= USART_CR5_NACK;
      008B4A 1C 00 08         [ 2]  503 	addw	x, #0x0008
      008B4D F6               [ 1]  504 	ld	a, (x)
                                    505 ;	libs/stm8l_usart.c: 671: if (NewState != DISABLE)
      008B4E 0D 01            [ 1]  506 	tnz	(0x01, sp)
      008B50 27 05            [ 1]  507 	jreq	00102$
                                    508 ;	libs/stm8l_usart.c: 674: USARTx->CR5 |= USART_CR5_NACK;
      008B52 AA 10            [ 1]  509 	or	a, #0x10
      008B54 F7               [ 1]  510 	ld	(x), a
      008B55 20 03            [ 2]  511 	jra	00104$
      008B57                        512 00102$:
                                    513 ;	libs/stm8l_usart.c: 679: USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
      008B57 A4 EF            [ 1]  514 	and	a, #0xef
      008B59 F7               [ 1]  515 	ld	(x), a
      008B5A                        516 00104$:
                                    517 ;	libs/stm8l_usart.c: 681: }
      008B5A 84               [ 1]  518 	pop	a
      008B5B 81               [ 4]  519 	ret
                                    520 ;	libs/stm8l_usart.c: 690: void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
                                    521 ;	-----------------------------------------
                                    522 ;	 function USART_SetGuardTime
                                    523 ;	-----------------------------------------
      008B5C                        524 _USART_SetGuardTime:
                                    525 ;	libs/stm8l_usart.c: 693: USARTx->GTR = USART_GuardTime;
      008B5C 1C 00 09         [ 2]  526 	addw	x, #0x0009
      008B5F F7               [ 1]  527 	ld	(x), a
                                    528 ;	libs/stm8l_usart.c: 694: }
      008B60 81               [ 4]  529 	ret
                                    530 ;	libs/stm8l_usart.c: 751: void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
                                    531 ;	-----------------------------------------
                                    532 ;	 function USART_IrDAConfig
                                    533 ;	-----------------------------------------
      008B61                        534 _USART_IrDAConfig:
      008B61 88               [ 1]  535 	push	a
      008B62 6B 01            [ 1]  536 	ld	(0x01, sp), a
                                    537 ;	libs/stm8l_usart.c: 757: USARTx->CR5 |= USART_CR5_IRLP;
      008B64 1C 00 08         [ 2]  538 	addw	x, #0x0008
      008B67 F6               [ 1]  539 	ld	a, (x)
                                    540 ;	libs/stm8l_usart.c: 755: if (USART_IrDAMode != USART_IrDAMode_Normal)
      008B68 0D 01            [ 1]  541 	tnz	(0x01, sp)
      008B6A 27 05            [ 1]  542 	jreq	00102$
                                    543 ;	libs/stm8l_usart.c: 757: USARTx->CR5 |= USART_CR5_IRLP;
      008B6C AA 04            [ 1]  544 	or	a, #0x04
      008B6E F7               [ 1]  545 	ld	(x), a
      008B6F 20 03            [ 2]  546 	jra	00104$
      008B71                        547 00102$:
                                    548 ;	libs/stm8l_usart.c: 761: USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
      008B71 A4 FB            [ 1]  549 	and	a, #0xfb
      008B73 F7               [ 1]  550 	ld	(x), a
      008B74                        551 00104$:
                                    552 ;	libs/stm8l_usart.c: 763: }
      008B74 84               [ 1]  553 	pop	a
      008B75 81               [ 4]  554 	ret
                                    555 ;	libs/stm8l_usart.c: 772: void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    556 ;	-----------------------------------------
                                    557 ;	 function USART_IrDACmd
                                    558 ;	-----------------------------------------
      008B76                        559 _USART_IrDACmd:
      008B76 88               [ 1]  560 	push	a
      008B77 6B 01            [ 1]  561 	ld	(0x01, sp), a
                                    562 ;	libs/stm8l_usart.c: 781: USARTx->CR5 |= USART_CR5_IREN;
      008B79 1C 00 08         [ 2]  563 	addw	x, #0x0008
      008B7C F6               [ 1]  564 	ld	a, (x)
                                    565 ;	libs/stm8l_usart.c: 778: if (NewState != DISABLE)
      008B7D 0D 01            [ 1]  566 	tnz	(0x01, sp)
      008B7F 27 05            [ 1]  567 	jreq	00102$
                                    568 ;	libs/stm8l_usart.c: 781: USARTx->CR5 |= USART_CR5_IREN;
      008B81 AA 02            [ 1]  569 	or	a, #0x02
      008B83 F7               [ 1]  570 	ld	(x), a
      008B84 20 03            [ 2]  571 	jra	00104$
      008B86                        572 00102$:
                                    573 ;	libs/stm8l_usart.c: 786: USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
      008B86 A4 FD            [ 1]  574 	and	a, #0xfd
      008B88 F7               [ 1]  575 	ld	(x), a
      008B89                        576 00104$:
                                    577 ;	libs/stm8l_usart.c: 788: }
      008B89 84               [ 1]  578 	pop	a
      008B8A 81               [ 4]  579 	ret
                                    580 ;	libs/stm8l_usart.c: 818: void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
                                    581 ;	-----------------------------------------
                                    582 ;	 function USART_DMACmd
                                    583 ;	-----------------------------------------
      008B8B                        584 _USART_DMACmd:
      008B8B 88               [ 1]  585 	push	a
                                    586 ;	libs/stm8l_usart.c: 829: USARTx->CR5 |= (uint8_t) USART_DMAReq;
      008B8C 1C 00 08         [ 2]  587 	addw	x, #0x0008
      008B8F 88               [ 1]  588 	push	a
      008B90 F6               [ 1]  589 	ld	a, (x)
      008B91 6B 02            [ 1]  590 	ld	(0x02, sp), a
      008B93 84               [ 1]  591 	pop	a
                                    592 ;	libs/stm8l_usart.c: 825: if (NewState != DISABLE)
      008B94 0D 04            [ 1]  593 	tnz	(0x04, sp)
      008B96 27 05            [ 1]  594 	jreq	00102$
                                    595 ;	libs/stm8l_usart.c: 829: USARTx->CR5 |= (uint8_t) USART_DMAReq;
      008B98 1A 01            [ 1]  596 	or	a, (0x01, sp)
      008B9A F7               [ 1]  597 	ld	(x), a
      008B9B 20 04            [ 2]  598 	jra	00104$
      008B9D                        599 00102$:
                                    600 ;	libs/stm8l_usart.c: 835: USARTx->CR5 &= (uint8_t)~USART_DMAReq;
      008B9D 43               [ 1]  601 	cpl	a
      008B9E 14 01            [ 1]  602 	and	a, (0x01, sp)
      008BA0 F7               [ 1]  603 	ld	(x), a
      008BA1                        604 00104$:
                                    605 ;	libs/stm8l_usart.c: 837: }
      008BA1 84               [ 1]  606 	pop	a
      008BA2 85               [ 2]  607 	popw	x
      008BA3 84               [ 1]  608 	pop	a
      008BA4 FC               [ 2]  609 	jp	(x)
                                    610 ;	libs/stm8l_usart.c: 939: void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
                                    611 ;	-----------------------------------------
                                    612 ;	 function USART_ITConfig
                                    613 ;	-----------------------------------------
      008BA5                        614 _USART_ITConfig:
      008BA5 52 09            [ 2]  615 	sub	sp, #9
      008BA7 1F 08            [ 2]  616 	ldw	(0x08, sp), x
                                    617 ;	libs/stm8l_usart.c: 946: usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
      008BA9 1E 0C            [ 2]  618 	ldw	x, (0x0c, sp)
                                    619 ;	libs/stm8l_usart.c: 948: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
      008BAB 7B 0D            [ 1]  620 	ld	a, (0x0d, sp)
      008BAD A4 0F            [ 1]  621 	and	a, #0x0f
      008BAF 88               [ 1]  622 	push	a
      008BB0 A6 01            [ 1]  623 	ld	a, #0x01
      008BB2 6B 08            [ 1]  624 	ld	(0x08, sp), a
      008BB4 84               [ 1]  625 	pop	a
      008BB5 4D               [ 1]  626 	tnz	a
      008BB6 27 05            [ 1]  627 	jreq	00144$
      008BB8                        628 00143$:
      008BB8 08 07            [ 1]  629 	sll	(0x07, sp)
      008BBA 4A               [ 1]  630 	dec	a
      008BBB 26 FB            [ 1]  631 	jrne	00143$
      008BBD                        632 00144$:
                                    633 ;	libs/stm8l_usart.c: 953: if (usartreg == 0x01)
      008BBD 9E               [ 1]  634 	ld	a, xh
      008BBE 4A               [ 1]  635 	dec	a
      008BBF 26 05            [ 1]  636 	jrne	00146$
      008BC1 A6 01            [ 1]  637 	ld	a, #0x01
      008BC3 6B 01            [ 1]  638 	ld	(0x01, sp), a
      008BC5 C5                     639 	.byte 0xc5
      008BC6                        640 00146$:
      008BC6 0F 01            [ 1]  641 	clr	(0x01, sp)
      008BC8                        642 00147$:
                                    643 ;	libs/stm8l_usart.c: 955: USARTx->CR1 |= itpos;
      008BC8 16 08            [ 2]  644 	ldw	y, (0x08, sp)
      008BCA 72 A9 00 04      [ 2]  645 	addw	y, #0x0004
      008BCE 17 02            [ 2]  646 	ldw	(0x02, sp), y
                                    647 ;	libs/stm8l_usart.c: 957: else if (usartreg == 0x05)
      008BD0 9E               [ 1]  648 	ld	a, xh
      008BD1 A0 05            [ 1]  649 	sub	a, #0x05
      008BD3 26 04            [ 1]  650 	jrne	00149$
      008BD5 4C               [ 1]  651 	inc	a
      008BD6 6B 04            [ 1]  652 	ld	(0x04, sp), a
      008BD8 C5                     653 	.byte 0xc5
      008BD9                        654 00149$:
      008BD9 0F 04            [ 1]  655 	clr	(0x04, sp)
      008BDB                        656 00150$:
                                    657 ;	libs/stm8l_usart.c: 959: USARTx->CR5 |= itpos;
      008BDB 1E 08            [ 2]  658 	ldw	x, (0x08, sp)
      008BDD 1C 00 08         [ 2]  659 	addw	x, #0x0008
      008BE0 1F 05            [ 2]  660 	ldw	(0x05, sp), x
                                    661 ;	libs/stm8l_usart.c: 964: USARTx->CR2 |= itpos;
      008BE2 1E 08            [ 2]  662 	ldw	x, (0x08, sp)
      008BE4 1C 00 05         [ 2]  663 	addw	x, #0x0005
                                    664 ;	libs/stm8l_usart.c: 950: if (NewState != DISABLE)
      008BE7 0D 0E            [ 1]  665 	tnz	(0x0e, sp)
      008BE9 27 22            [ 1]  666 	jreq	00114$
                                    667 ;	libs/stm8l_usart.c: 953: if (usartreg == 0x01)
      008BEB 0D 01            [ 1]  668 	tnz	(0x01, sp)
      008BED 27 0A            [ 1]  669 	jreq	00105$
                                    670 ;	libs/stm8l_usart.c: 955: USARTx->CR1 |= itpos;
      008BEF 1E 02            [ 2]  671 	ldw	x, (0x02, sp)
      008BF1 F6               [ 1]  672 	ld	a, (x)
      008BF2 1A 07            [ 1]  673 	or	a, (0x07, sp)
      008BF4 1E 02            [ 2]  674 	ldw	x, (0x02, sp)
      008BF6 F7               [ 1]  675 	ld	(x), a
      008BF7 20 36            [ 2]  676 	jra	00116$
      008BF9                        677 00105$:
                                    678 ;	libs/stm8l_usart.c: 957: else if (usartreg == 0x05)
      008BF9 0D 04            [ 1]  679 	tnz	(0x04, sp)
      008BFB 27 0A            [ 1]  680 	jreq	00102$
                                    681 ;	libs/stm8l_usart.c: 959: USARTx->CR5 |= itpos;
      008BFD 1E 05            [ 2]  682 	ldw	x, (0x05, sp)
      008BFF F6               [ 1]  683 	ld	a, (x)
      008C00 1A 07            [ 1]  684 	or	a, (0x07, sp)
      008C02 1E 05            [ 2]  685 	ldw	x, (0x05, sp)
      008C04 F7               [ 1]  686 	ld	(x), a
      008C05 20 28            [ 2]  687 	jra	00116$
      008C07                        688 00102$:
                                    689 ;	libs/stm8l_usart.c: 964: USARTx->CR2 |= itpos;
      008C07 F6               [ 1]  690 	ld	a, (x)
      008C08 1A 07            [ 1]  691 	or	a, (0x07, sp)
      008C0A F7               [ 1]  692 	ld	(x), a
      008C0B 20 22            [ 2]  693 	jra	00116$
      008C0D                        694 00114$:
                                    695 ;	libs/stm8l_usart.c: 972: USARTx->CR1 &= (uint8_t)(~itpos);
      008C0D 03 07            [ 1]  696 	cpl	(0x07, sp)
                                    697 ;	libs/stm8l_usart.c: 970: if (usartreg == 0x01)
      008C0F 0D 01            [ 1]  698 	tnz	(0x01, sp)
      008C11 27 0A            [ 1]  699 	jreq	00111$
                                    700 ;	libs/stm8l_usart.c: 972: USARTx->CR1 &= (uint8_t)(~itpos);
      008C13 1E 02            [ 2]  701 	ldw	x, (0x02, sp)
      008C15 F6               [ 1]  702 	ld	a, (x)
      008C16 14 07            [ 1]  703 	and	a, (0x07, sp)
      008C18 1E 02            [ 2]  704 	ldw	x, (0x02, sp)
      008C1A F7               [ 1]  705 	ld	(x), a
      008C1B 20 12            [ 2]  706 	jra	00116$
      008C1D                        707 00111$:
                                    708 ;	libs/stm8l_usart.c: 974: else if (usartreg == 0x05)
      008C1D 0D 04            [ 1]  709 	tnz	(0x04, sp)
      008C1F 27 0A            [ 1]  710 	jreq	00108$
                                    711 ;	libs/stm8l_usart.c: 976: USARTx->CR5 &= (uint8_t)(~itpos);
      008C21 1E 05            [ 2]  712 	ldw	x, (0x05, sp)
      008C23 F6               [ 1]  713 	ld	a, (x)
      008C24 14 07            [ 1]  714 	and	a, (0x07, sp)
      008C26 1E 05            [ 2]  715 	ldw	x, (0x05, sp)
      008C28 F7               [ 1]  716 	ld	(x), a
      008C29 20 04            [ 2]  717 	jra	00116$
      008C2B                        718 00108$:
                                    719 ;	libs/stm8l_usart.c: 981: USARTx->CR2 &= (uint8_t)(~itpos);
      008C2B F6               [ 1]  720 	ld	a, (x)
      008C2C 14 07            [ 1]  721 	and	a, (0x07, sp)
      008C2E F7               [ 1]  722 	ld	(x), a
      008C2F                        723 00116$:
                                    724 ;	libs/stm8l_usart.c: 984: }
      008C2F 1E 0A            [ 2]  725 	ldw	x, (10, sp)
      008C31 5B 0E            [ 2]  726 	addw	sp, #14
      008C33 FC               [ 2]  727 	jp	(x)
                                    728 ;	libs/stm8l_usart.c: 1002: FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
                                    729 ;	-----------------------------------------
                                    730 ;	 function USART_GetFlagStatus
                                    731 ;	-----------------------------------------
      008C34                        732 _USART_GetFlagStatus:
      008C34 88               [ 1]  733 	push	a
                                    734 ;	libs/stm8l_usart.c: 1009: if (USART_FLAG == USART_FLAG_SBK)
      008C35 16 04            [ 2]  735 	ldw	y, (0x04, sp)
                                    736 ;	libs/stm8l_usart.c: 1011: if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
      008C37 7B 05            [ 1]  737 	ld	a, (0x05, sp)
      008C39 6B 01            [ 1]  738 	ld	(0x01, sp), a
                                    739 ;	libs/stm8l_usart.c: 1009: if (USART_FLAG == USART_FLAG_SBK)
      008C3B 90 A3 01 01      [ 2]  740 	cpw	y, #0x0101
      008C3F 26 0D            [ 1]  741 	jrne	00108$
                                    742 ;	libs/stm8l_usart.c: 1011: if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
      008C41 E6 05            [ 1]  743 	ld	a, (0x5, x)
      008C43 14 01            [ 1]  744 	and	a, (0x01, sp)
      008C45 27 04            [ 1]  745 	jreq	00102$
                                    746 ;	libs/stm8l_usart.c: 1014: status = SET;
      008C47 A6 01            [ 1]  747 	ld	a, #0x01
      008C49 20 0C            [ 2]  748 	jra	00109$
      008C4B                        749 00102$:
                                    750 ;	libs/stm8l_usart.c: 1019: status = RESET;
      008C4B 4F               [ 1]  751 	clr	a
      008C4C 20 09            [ 2]  752 	jra	00109$
      008C4E                        753 00108$:
                                    754 ;	libs/stm8l_usart.c: 1024: if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
      008C4E F6               [ 1]  755 	ld	a, (x)
      008C4F 14 01            [ 1]  756 	and	a, (0x01, sp)
      008C51 27 03            [ 1]  757 	jreq	00105$
                                    758 ;	libs/stm8l_usart.c: 1027: status = SET;
      008C53 A6 01            [ 1]  759 	ld	a, #0x01
                                    760 ;	libs/stm8l_usart.c: 1032: status = RESET;
      008C55 21                     761 	.byte 0x21
      008C56                        762 00105$:
      008C56 4F               [ 1]  763 	clr	a
      008C57                        764 00109$:
                                    765 ;	libs/stm8l_usart.c: 1036: return status;
                                    766 ;	libs/stm8l_usart.c: 1037: }
      008C57 1E 02            [ 2]  767 	ldw	x, (2, sp)
      008C59 5B 05            [ 2]  768 	addw	sp, #5
      008C5B FC               [ 2]  769 	jp	(x)
                                    770 ;	libs/stm8l_usart.c: 1060: void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
                                    771 ;	-----------------------------------------
                                    772 ;	 function USART_ClearFlag
                                    773 ;	-----------------------------------------
      008C5C                        774 _USART_ClearFlag:
                                    775 ;	libs/stm8l_usart.c: 1065: USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
      008C5C 16 03            [ 2]  776 	ldw	y, (0x03, sp)
      008C5E 90 53            [ 2]  777 	cplw	y
      008C60 90 9F            [ 1]  778 	ld	a, yl
      008C62 F7               [ 1]  779 	ld	(x), a
                                    780 ;	libs/stm8l_usart.c: 1066: }
      008C63 1E 01            [ 2]  781 	ldw	x, (1, sp)
      008C65 5B 04            [ 2]  782 	addw	sp, #4
      008C67 FC               [ 2]  783 	jp	(x)
                                    784 ;	libs/stm8l_usart.c: 1083: ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
                                    785 ;	-----------------------------------------
                                    786 ;	 function USART_GetITStatus
                                    787 ;	-----------------------------------------
      008C68                        788 _USART_GetITStatus:
      008C68 52 06            [ 2]  789 	sub	sp, #6
      008C6A 1F 05            [ 2]  790 	ldw	(0x05, sp), x
                                    791 ;	libs/stm8l_usart.c: 1096: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
      008C6C 7B 0A            [ 1]  792 	ld	a, (0x0a, sp)
      008C6E 97               [ 1]  793 	ld	xl, a
      008C6F A4 0F            [ 1]  794 	and	a, #0x0f
      008C71 88               [ 1]  795 	push	a
      008C72 A6 01            [ 1]  796 	ld	a, #0x01
      008C74 6B 05            [ 1]  797 	ld	(0x05, sp), a
      008C76 84               [ 1]  798 	pop	a
      008C77 4D               [ 1]  799 	tnz	a
      008C78 27 05            [ 1]  800 	jreq	00163$
      008C7A                        801 00162$:
      008C7A 08 04            [ 1]  802 	sll	(0x04, sp)
      008C7C 4A               [ 1]  803 	dec	a
      008C7D 26 FB            [ 1]  804 	jrne	00162$
      008C7F                        805 00163$:
                                    806 ;	libs/stm8l_usart.c: 1098: itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
      008C7F 9F               [ 1]  807 	ld	a, xl
      008C80 4E               [ 1]  808 	swap	a
      008C81 A4 0F            [ 1]  809 	and	a, #0x0f
                                    810 ;	libs/stm8l_usart.c: 1100: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      008C83 88               [ 1]  811 	push	a
      008C84 A6 01            [ 1]  812 	ld	a, #0x01
      008C86 6B 02            [ 1]  813 	ld	(0x02, sp), a
      008C88 84               [ 1]  814 	pop	a
      008C89 4D               [ 1]  815 	tnz	a
      008C8A 27 05            [ 1]  816 	jreq	00165$
      008C8C                        817 00164$:
      008C8C 08 01            [ 1]  818 	sll	(0x01, sp)
      008C8E 4A               [ 1]  819 	dec	a
      008C8F 26 FB            [ 1]  820 	jrne	00164$
      008C91                        821 00165$:
                                    822 ;	libs/stm8l_usart.c: 1103: if (USART_IT == USART_IT_PE)
      008C91 16 09            [ 2]  823 	ldw	y, (0x09, sp)
      008C93 17 02            [ 2]  824 	ldw	(0x02, sp), y
                                    825 ;	libs/stm8l_usart.c: 1109: if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008C95 1E 05            [ 2]  826 	ldw	x, (0x05, sp)
      008C97 F6               [ 1]  827 	ld	a, (x)
      008C98 14 04            [ 1]  828 	and	a, (0x04, sp)
      008C9A 6B 04            [ 1]  829 	ld	(0x04, sp), a
                                    830 ;	libs/stm8l_usart.c: 1103: if (USART_IT == USART_IT_PE)
      008C9C 1E 02            [ 2]  831 	ldw	x, (0x02, sp)
      008C9E A3 01 00         [ 2]  832 	cpw	x, #0x0100
      008CA1 26 17            [ 1]  833 	jrne	00118$
                                    834 ;	libs/stm8l_usart.c: 1106: enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
      008CA3 16 05            [ 2]  835 	ldw	y, (0x05, sp)
      008CA5 17 02            [ 2]  836 	ldw	(0x02, sp), y
      008CA7 93               [ 1]  837 	ldw	x, y
      008CA8 E6 04            [ 1]  838 	ld	a, (0x4, x)
      008CAA 14 01            [ 1]  839 	and	a, (0x01, sp)
                                    840 ;	libs/stm8l_usart.c: 1109: if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008CAC 0D 04            [ 1]  841 	tnz	(0x04, sp)
      008CAE 27 07            [ 1]  842 	jreq	00102$
      008CB0 4D               [ 1]  843 	tnz	a
      008CB1 27 04            [ 1]  844 	jreq	00102$
                                    845 ;	libs/stm8l_usart.c: 1112: pendingbitstatus = SET;
      008CB3 A6 01            [ 1]  846 	ld	a, #0x01
      008CB5 20 35            [ 2]  847 	jra	00119$
      008CB7                        848 00102$:
                                    849 ;	libs/stm8l_usart.c: 1117: pendingbitstatus = RESET;
      008CB7 4F               [ 1]  850 	clr	a
      008CB8 20 32            [ 2]  851 	jra	00119$
      008CBA                        852 00118$:
                                    853 ;	libs/stm8l_usart.c: 1124: enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
      008CBA 1E 05            [ 2]  854 	ldw	x, (0x05, sp)
      008CBC E6 05            [ 1]  855 	ld	a, (0x5, x)
      008CBE 14 01            [ 1]  856 	and	a, (0x01, sp)
                                    857 ;	libs/stm8l_usart.c: 1121: else if (USART_IT == USART_IT_OR)
      008CC0 1E 02            [ 2]  858 	ldw	x, (0x02, sp)
      008CC2 A3 02 35         [ 2]  859 	cpw	x, #0x0235
      008CC5 26 1A            [ 1]  860 	jrne	00115$
                                    861 ;	libs/stm8l_usart.c: 1124: enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
      008CC7 6B 03            [ 1]  862 	ld	(0x03, sp), a
                                    863 ;	libs/stm8l_usart.c: 1127: temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
      008CC9 1E 05            [ 2]  864 	ldw	x, (0x05, sp)
      008CCB E6 08            [ 1]  865 	ld	a, (0x8, x)
      008CCD A4 01            [ 1]  866 	and	a, #0x01
                                    867 ;	libs/stm8l_usart.c: 1129: if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
      008CCF 0D 04            [ 1]  868 	tnz	(0x04, sp)
      008CD1 27 0B            [ 1]  869 	jreq	00106$
      008CD3 0D 03            [ 1]  870 	tnz	(0x03, sp)
      008CD5 26 03            [ 1]  871 	jrne	00105$
      008CD7 4D               [ 1]  872 	tnz	a
      008CD8 27 04            [ 1]  873 	jreq	00106$
      008CDA                        874 00105$:
                                    875 ;	libs/stm8l_usart.c: 1132: pendingbitstatus = SET;
      008CDA A6 01            [ 1]  876 	ld	a, #0x01
      008CDC 20 0E            [ 2]  877 	jra	00119$
      008CDE                        878 00106$:
                                    879 ;	libs/stm8l_usart.c: 1137: pendingbitstatus = RESET;
      008CDE 4F               [ 1]  880 	clr	a
      008CDF 20 0B            [ 2]  881 	jra	00119$
      008CE1                        882 00115$:
                                    883 ;	libs/stm8l_usart.c: 1144: enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
                                    884 ;	libs/stm8l_usart.c: 1146: if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008CE1 0D 04            [ 1]  885 	tnz	(0x04, sp)
      008CE3 27 06            [ 1]  886 	jreq	00111$
      008CE5 4D               [ 1]  887 	tnz	a
      008CE6 27 03            [ 1]  888 	jreq	00111$
                                    889 ;	libs/stm8l_usart.c: 1149: pendingbitstatus = SET;
      008CE8 A6 01            [ 1]  890 	ld	a, #0x01
                                    891 ;	libs/stm8l_usart.c: 1154: pendingbitstatus = RESET;
      008CEA 21                     892 	.byte 0x21
      008CEB                        893 00111$:
      008CEB 4F               [ 1]  894 	clr	a
      008CEC                        895 00119$:
                                    896 ;	libs/stm8l_usart.c: 1159: return  pendingbitstatus;
                                    897 ;	libs/stm8l_usart.c: 1160: }
      008CEC 1E 07            [ 2]  898 	ldw	x, (7, sp)
      008CEE 5B 0A            [ 2]  899 	addw	sp, #10
      008CF0 FC               [ 2]  900 	jp	(x)
                                    901 ;	libs/stm8l_usart.c: 1183: void USART_ClearITPendingBit(USART_TypeDef* USARTx)//, USART_IT_TypeDef USART_IT)
                                    902 ;	-----------------------------------------
                                    903 ;	 function USART_ClearITPendingBit
                                    904 ;	-----------------------------------------
      008CF1                        905 _USART_ClearITPendingBit:
                                    906 ;	libs/stm8l_usart.c: 1188: USARTx->SR &= (uint8_t)(~USART_SR_TC);
      008CF1 F6               [ 1]  907 	ld	a, (x)
      008CF2 A4 BF            [ 1]  908 	and	a, #0xbf
      008CF4 F7               [ 1]  909 	ld	(x), a
                                    910 ;	libs/stm8l_usart.c: 1189: }
      008CF5 81               [ 4]  911 	ret
                                    912 	.area CODE
                                    913 	.area CONST
                                    914 	.area INITIALIZER
                                    915 	.area CABS (ABS)
