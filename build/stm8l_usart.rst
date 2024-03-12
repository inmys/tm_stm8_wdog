                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
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
      008A40                         78 _USART_DeInit:
                                     79 ;	libs/stm8l_usart.c: 153: (void) USARTx->SR;
      008A40 16 03            [ 2]   80 	ldw	y, (0x03, sp)
      008A42 90 F6            [ 1]   81 	ld	a, (y)
                                     82 ;	libs/stm8l_usart.c: 154: (void) USARTx->DR;
      008A44 93               [ 1]   83 	ldw	x, y
      008A45 E6 01            [ 1]   84 	ld	a, (0x1, x)
                                     85 ;	libs/stm8l_usart.c: 156: USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
      008A47 93               [ 1]   86 	ldw	x, y
      008A48 6F 03            [ 1]   87 	clr	(0x0003, x)
                                     88 ;	libs/stm8l_usart.c: 157: USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
      008A4A 93               [ 1]   89 	ldw	x, y
      008A4B 5C               [ 1]   90 	incw	x
      008A4C 5C               [ 1]   91 	incw	x
      008A4D 7F               [ 1]   92 	clr	(x)
                                     93 ;	libs/stm8l_usart.c: 159: USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
      008A4E 93               [ 1]   94 	ldw	x, y
      008A4F 6F 04            [ 1]   95 	clr	(0x0004, x)
                                     96 ;	libs/stm8l_usart.c: 160: USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
      008A51 93               [ 1]   97 	ldw	x, y
      008A52 6F 05            [ 1]   98 	clr	(0x0005, x)
                                     99 ;	libs/stm8l_usart.c: 161: USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
      008A54 93               [ 1]  100 	ldw	x, y
      008A55 6F 06            [ 1]  101 	clr	(0x0006, x)
                                    102 ;	libs/stm8l_usart.c: 162: USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
      008A57 93               [ 1]  103 	ldw	x, y
      008A58 6F 07            [ 1]  104 	clr	(0x0007, x)
                                    105 ;	libs/stm8l_usart.c: 163: }
      008A5A 81               [ 4]  106 	ret
                                    107 ;	libs/stm8l_usart.c: 192: void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
                                    108 ;	-----------------------------------------
                                    109 ;	 function USART_Init
                                    110 ;	-----------------------------------------
      008A5B                        111 _USART_Init:
      008A5B 52 0B            [ 2]  112 	sub	sp, #11
                                    113 ;	libs/stm8l_usart.c: 210: USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
      008A5D 16 0E            [ 2]  114 	ldw	y, (0x0e, sp)
      008A5F 17 01            [ 2]  115 	ldw	(0x01, sp), y
      008A61 93               [ 1]  116 	ldw	x, y
      008A62 1C 00 04         [ 2]  117 	addw	x, #0x0004
      008A65 F6               [ 1]  118 	ld	a, (x)
      008A66 A4 E9            [ 1]  119 	and	a, #0xe9
      008A68 6B 0B            [ 1]  120 	ld	(0x0b, sp), a
      008A6A F7               [ 1]  121 	ld	(x), a
                                    122 ;	libs/stm8l_usart.c: 213: USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
      008A6B F6               [ 1]  123 	ld	a, (x)
      008A6C 7B 14            [ 1]  124 	ld	a, (0x14, sp)
      008A6E 1A 16            [ 1]  125 	or	a, (0x16, sp)
      008A70 1A 0B            [ 1]  126 	or	a, (0x0b, sp)
      008A72 F7               [ 1]  127 	ld	(x), a
                                    128 ;	libs/stm8l_usart.c: 216: USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
      008A73 1E 01            [ 2]  129 	ldw	x, (0x01, sp)
      008A75 1C 00 06         [ 2]  130 	addw	x, #0x0006
      008A78 F6               [ 1]  131 	ld	a, (x)
      008A79 A4 CF            [ 1]  132 	and	a, #0xcf
      008A7B F7               [ 1]  133 	ld	(x), a
                                    134 ;	libs/stm8l_usart.c: 218: USARTx->CR3 |= (uint8_t)USART_StopBits;
      008A7C 88               [ 1]  135 	push	a
      008A7D F6               [ 1]  136 	ld	a, (x)
      008A7E 84               [ 1]  137 	pop	a
      008A7F 1A 15            [ 1]  138 	or	a, (0x15, sp)
      008A81 F7               [ 1]  139 	ld	(x), a
                                    140 ;	libs/stm8l_usart.c: 221: USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
      008A82 1E 01            [ 2]  141 	ldw	x, (0x01, sp)
      008A84 5C               [ 1]  142 	incw	x
      008A85 5C               [ 1]  143 	incw	x
      008A86 1F 03            [ 2]  144 	ldw	(0x03, sp), x
      008A88 F6               [ 1]  145 	ld	a, (x)
      008A89 1E 03            [ 2]  146 	ldw	x, (0x03, sp)
      008A8B 7F               [ 1]  147 	clr	(x)
                                    148 ;	libs/stm8l_usart.c: 223: USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
      008A8C 1E 01            [ 2]  149 	ldw	x, (0x01, sp)
      008A8E 1C 00 03         [ 2]  150 	addw	x, #0x0003
      008A91 1F 05            [ 2]  151 	ldw	(0x05, sp), x
      008A93 F6               [ 1]  152 	ld	a, (x)
      008A94 A4 0F            [ 1]  153 	and	a, #0x0f
      008A96 1E 05            [ 2]  154 	ldw	x, (0x05, sp)
      008A98 F7               [ 1]  155 	ld	(x), a
                                    156 ;	libs/stm8l_usart.c: 225: USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
      008A99 1E 05            [ 2]  157 	ldw	x, (0x05, sp)
      008A9B 88               [ 1]  158 	push	a
      008A9C F6               [ 1]  159 	ld	a, (x)
      008A9D 84               [ 1]  160 	pop	a
      008A9E A4 F0            [ 1]  161 	and	a, #0xf0
      008AA0 1E 05            [ 2]  162 	ldw	x, (0x05, sp)
      008AA2 F7               [ 1]  163 	ld	(x), a
                                    164 ;	libs/stm8l_usart.c: 227: BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
      008AA3 CD 86 9B         [ 4]  165 	call	_CLK_GetClockFreq
      008AA6 1F 0A            [ 2]  166 	ldw	(0x0a, sp), x
      008AA8 1E 12            [ 2]  167 	ldw	x, (0x12, sp)
      008AAA 89               [ 2]  168 	pushw	x
      008AAB 1E 12            [ 2]  169 	ldw	x, (0x12, sp)
      008AAD 89               [ 2]  170 	pushw	x
      008AAE 1E 0E            [ 2]  171 	ldw	x, (0x0e, sp)
      008AB0 89               [ 2]  172 	pushw	x
      008AB1 90 89            [ 2]  173 	pushw	y
      008AB3 CD 8D 80         [ 4]  174 	call	__divulong
      008AB6 5B 08            [ 2]  175 	addw	sp, #8
      008AB8 1F 09            [ 2]  176 	ldw	(0x09, sp), x
      008ABA 17 07            [ 2]  177 	ldw	(0x07, sp), y
                                    178 ;	libs/stm8l_usart.c: 229: USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
      008ABC 16 09            [ 2]  179 	ldw	y, (0x09, sp)
      008ABE 90 9E            [ 1]  180 	ld	a, yh
      008AC0 A4 F0            [ 1]  181 	and	a, #0xf0
      008AC2 6B 0B            [ 1]  182 	ld	(0x0b, sp), a
      008AC4 1E 05            [ 2]  183 	ldw	x, (0x05, sp)
      008AC6 7B 0B            [ 1]  184 	ld	a, (0x0b, sp)
      008AC8 F7               [ 1]  185 	ld	(x), a
                                    186 ;	libs/stm8l_usart.c: 231: USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
      008AC9 1E 05            [ 2]  187 	ldw	x, (0x05, sp)
      008ACB F6               [ 1]  188 	ld	a, (x)
      008ACC 7B 0A            [ 1]  189 	ld	a, (0x0a, sp)
      008ACE A4 0F            [ 1]  190 	and	a, #0x0f
      008AD0 1A 0B            [ 1]  191 	or	a, (0x0b, sp)
      008AD2 1E 05            [ 2]  192 	ldw	x, (0x05, sp)
      008AD4 F7               [ 1]  193 	ld	(x), a
                                    194 ;	libs/stm8l_usart.c: 233: USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
      008AD5 93               [ 1]  195 	ldw	x, y
      008AD6 A6 10            [ 1]  196 	ld	a, #0x10
      008AD8 62               [ 2]  197 	div	x, a
      008AD9 9F               [ 1]  198 	ld	a, xl
      008ADA 1E 03            [ 2]  199 	ldw	x, (0x03, sp)
      008ADC F7               [ 1]  200 	ld	(x), a
                                    201 ;	libs/stm8l_usart.c: 236: USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
      008ADD 1E 01            [ 2]  202 	ldw	x, (0x01, sp)
      008ADF 1C 00 05         [ 2]  203 	addw	x, #0x0005
      008AE2 F6               [ 1]  204 	ld	a, (x)
      008AE3 A4 F3            [ 1]  205 	and	a, #0xf3
      008AE5 F7               [ 1]  206 	ld	(x), a
                                    207 ;	libs/stm8l_usart.c: 238: USARTx->CR2 |= (uint8_t)USART_Mode;
      008AE6 88               [ 1]  208 	push	a
      008AE7 F6               [ 1]  209 	ld	a, (x)
      008AE8 84               [ 1]  210 	pop	a
      008AE9 1A 17            [ 1]  211 	or	a, (0x17, sp)
      008AEB F7               [ 1]  212 	ld	(x), a
                                    213 ;	libs/stm8l_usart.c: 239: }
      008AEC 5B 0B            [ 2]  214 	addw	sp, #11
      008AEE 81               [ 4]  215 	ret
                                    216 ;	libs/stm8l_usart.c: 264: void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
                                    217 ;	-----------------------------------------
                                    218 ;	 function USART_ClockInit
                                    219 ;	-----------------------------------------
      008AEF                        220 _USART_ClockInit:
      008AEF 88               [ 1]  221 	push	a
                                    222 ;	libs/stm8l_usart.c: 275: USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
      008AF0 1E 04            [ 2]  223 	ldw	x, (0x04, sp)
      008AF2 1C 00 06         [ 2]  224 	addw	x, #0x0006
      008AF5 F6               [ 1]  225 	ld	a, (x)
      008AF6 A4 F8            [ 1]  226 	and	a, #0xf8
      008AF8 6B 01            [ 1]  227 	ld	(0x01, sp), a
      008AFA F7               [ 1]  228 	ld	(x), a
                                    229 ;	libs/stm8l_usart.c: 277: USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
      008AFB F6               [ 1]  230 	ld	a, (x)
      008AFC 7B 07            [ 1]  231 	ld	a, (0x07, sp)
      008AFE 1A 08            [ 1]  232 	or	a, (0x08, sp)
      008B00 1A 09            [ 1]  233 	or	a, (0x09, sp)
      008B02 1A 01            [ 1]  234 	or	a, (0x01, sp)
      008B04 F7               [ 1]  235 	ld	(x), a
                                    236 ;	libs/stm8l_usart.c: 275: USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
      008B05 F6               [ 1]  237 	ld	a, (x)
                                    238 ;	libs/stm8l_usart.c: 279: if (USART_Clock != USART_Clock_Disable)
      008B06 0D 06            [ 1]  239 	tnz	(0x06, sp)
      008B08 27 05            [ 1]  240 	jreq	00102$
                                    241 ;	libs/stm8l_usart.c: 281: USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
      008B0A AA 08            [ 1]  242 	or	a, #0x08
      008B0C F7               [ 1]  243 	ld	(x), a
      008B0D 20 03            [ 2]  244 	jra	00104$
      008B0F                        245 00102$:
                                    246 ;	libs/stm8l_usart.c: 285: USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
      008B0F A4 F7            [ 1]  247 	and	a, #0xf7
      008B11 F7               [ 1]  248 	ld	(x), a
      008B12                        249 00104$:
                                    250 ;	libs/stm8l_usart.c: 287: }
      008B12 84               [ 1]  251 	pop	a
      008B13 81               [ 4]  252 	ret
                                    253 ;	libs/stm8l_usart.c: 296: void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    254 ;	-----------------------------------------
                                    255 ;	 function USART_Cmd
                                    256 ;	-----------------------------------------
      008B14                        257 _USART_Cmd:
                                    258 ;	libs/stm8l_usart.c: 300: USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
      008B14 1E 03            [ 2]  259 	ldw	x, (0x03, sp)
      008B16 1C 00 04         [ 2]  260 	addw	x, #0x0004
      008B19 F6               [ 1]  261 	ld	a, (x)
                                    262 ;	libs/stm8l_usart.c: 298: if (NewState != DISABLE)
      008B1A 0D 05            [ 1]  263 	tnz	(0x05, sp)
      008B1C 27 04            [ 1]  264 	jreq	00102$
                                    265 ;	libs/stm8l_usart.c: 300: USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
      008B1E A4 DF            [ 1]  266 	and	a, #0xdf
      008B20 F7               [ 1]  267 	ld	(x), a
      008B21 81               [ 4]  268 	ret
      008B22                        269 00102$:
                                    270 ;	libs/stm8l_usart.c: 304: USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
      008B22 AA 20            [ 1]  271 	or	a, #0x20
      008B24 F7               [ 1]  272 	ld	(x), a
                                    273 ;	libs/stm8l_usart.c: 306: }
      008B25 81               [ 4]  274 	ret
                                    275 ;	libs/stm8l_usart.c: 329: void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
                                    276 ;	-----------------------------------------
                                    277 ;	 function USART_SetPrescaler
                                    278 ;	-----------------------------------------
      008B26                        279 _USART_SetPrescaler:
                                    280 ;	libs/stm8l_usart.c: 332: USARTx->PSCR = USART_Prescaler;
      008B26 1E 03            [ 2]  281 	ldw	x, (0x03, sp)
      008B28 7B 05            [ 1]  282 	ld	a, (0x05, sp)
      008B2A E7 0A            [ 1]  283 	ld	(0x000a, x), a
                                    284 ;	libs/stm8l_usart.c: 333: }
      008B2C 81               [ 4]  285 	ret
                                    286 ;	libs/stm8l_usart.c: 340: void USART_SendBreak(USART_TypeDef* USARTx)
                                    287 ;	-----------------------------------------
                                    288 ;	 function USART_SendBreak
                                    289 ;	-----------------------------------------
      008B2D                        290 _USART_SendBreak:
                                    291 ;	libs/stm8l_usart.c: 342: USARTx->CR2 |= USART_CR2_SBK;
      008B2D 1E 03            [ 2]  292 	ldw	x, (0x03, sp)
      008B2F 1C 00 05         [ 2]  293 	addw	x, #0x0005
      008B32 F6               [ 1]  294 	ld	a, (x)
      008B33 AA 01            [ 1]  295 	or	a, #0x01
      008B35 F7               [ 1]  296 	ld	(x), a
                                    297 ;	libs/stm8l_usart.c: 343: }
      008B36 81               [ 4]  298 	ret
                                    299 ;	libs/stm8l_usart.c: 382: uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
                                    300 ;	-----------------------------------------
                                    301 ;	 function USART_ReceiveData8
                                    302 ;	-----------------------------------------
      008B37                        303 _USART_ReceiveData8:
                                    304 ;	libs/stm8l_usart.c: 384: return USARTx->DR;
      008B37 1E 03            [ 2]  305 	ldw	x, (0x03, sp)
      008B39 E6 01            [ 1]  306 	ld	a, (0x1, x)
                                    307 ;	libs/stm8l_usart.c: 385: }
      008B3B 81               [ 4]  308 	ret
                                    309 ;	libs/stm8l_usart.c: 392: uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
                                    310 ;	-----------------------------------------
                                    311 ;	 function USART_ReceiveData9
                                    312 ;	-----------------------------------------
      008B3C                        313 _USART_ReceiveData9:
      008B3C 52 02            [ 2]  314 	sub	sp, #2
                                    315 ;	libs/stm8l_usart.c: 396: temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
      008B3E 16 05            [ 2]  316 	ldw	y, (0x05, sp)
      008B40 93               [ 1]  317 	ldw	x, y
      008B41 E6 04            [ 1]  318 	ld	a, (0x4, x)
      008B43 A4 80            [ 1]  319 	and	a, #0x80
      008B45 97               [ 1]  320 	ld	xl, a
      008B46 4F               [ 1]  321 	clr	a
      008B47 95               [ 1]  322 	ld	xh, a
      008B48 58               [ 2]  323 	sllw	x
      008B49 1F 01            [ 2]  324 	ldw	(0x01, sp), x
                                    325 ;	libs/stm8l_usart.c: 397: return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
      008B4B 90 E6 01         [ 1]  326 	ld	a, (0x1, y)
      008B4E 5F               [ 1]  327 	clrw	x
      008B4F 1A 02            [ 1]  328 	or	a, (0x02, sp)
      008B51 02               [ 1]  329 	rlwa	x
      008B52 1A 01            [ 1]  330 	or	a, (0x01, sp)
      008B54 A4 01            [ 1]  331 	and	a, #0x01
      008B56 95               [ 1]  332 	ld	xh, a
                                    333 ;	libs/stm8l_usart.c: 398: }
      008B57 5B 02            [ 2]  334 	addw	sp, #2
      008B59 81               [ 4]  335 	ret
                                    336 ;	libs/stm8l_usart.c: 405: void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
                                    337 ;	-----------------------------------------
                                    338 ;	 function USART_SendData8
                                    339 ;	-----------------------------------------
      008B5A                        340 _USART_SendData8:
                                    341 ;	libs/stm8l_usart.c: 408: USARTx->DR = Data;
      008B5A 1E 03            [ 2]  342 	ldw	x, (0x03, sp)
      008B5C 5C               [ 1]  343 	incw	x
      008B5D 7B 05            [ 1]  344 	ld	a, (0x05, sp)
      008B5F F7               [ 1]  345 	ld	(x), a
                                    346 ;	libs/stm8l_usart.c: 409: }
      008B60 81               [ 4]  347 	ret
                                    348 ;	libs/stm8l_usart.c: 418: void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
                                    349 ;	-----------------------------------------
                                    350 ;	 function USART_SendData9
                                    351 ;	-----------------------------------------
      008B61                        352 _USART_SendData9:
      008B61 52 03            [ 2]  353 	sub	sp, #3
                                    354 ;	libs/stm8l_usart.c: 423: USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
      008B63 16 06            [ 2]  355 	ldw	y, (0x06, sp)
      008B65 93               [ 1]  356 	ldw	x, y
      008B66 1C 00 04         [ 2]  357 	addw	x, #0x0004
      008B69 F6               [ 1]  358 	ld	a, (x)
      008B6A A4 BF            [ 1]  359 	and	a, #0xbf
      008B6C 6B 01            [ 1]  360 	ld	(0x01, sp), a
      008B6E F7               [ 1]  361 	ld	(x), a
                                    362 ;	libs/stm8l_usart.c: 426: USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
      008B6F F6               [ 1]  363 	ld	a, (x)
      008B70 7B 08            [ 1]  364 	ld	a, (0x08, sp)
      008B72 6B 02            [ 1]  365 	ld	(0x02, sp), a
      008B74 7B 09            [ 1]  366 	ld	a, (0x09, sp)
      008B76 04 02            [ 1]  367 	srl	(0x02, sp)
      008B78 46               [ 1]  368 	rrc	a
      008B79 04 02            [ 1]  369 	srl	(0x02, sp)
      008B7B 46               [ 1]  370 	rrc	a
      008B7C A4 40            [ 1]  371 	and	a, #0x40
      008B7E 1A 01            [ 1]  372 	or	a, (0x01, sp)
      008B80 F7               [ 1]  373 	ld	(x), a
                                    374 ;	libs/stm8l_usart.c: 429: USARTx->DR   = (uint8_t)(Data);
      008B81 93               [ 1]  375 	ldw	x, y
      008B82 5C               [ 1]  376 	incw	x
      008B83 7B 09            [ 1]  377 	ld	a, (0x09, sp)
      008B85 F7               [ 1]  378 	ld	(x), a
                                    379 ;	libs/stm8l_usart.c: 430: }
      008B86 5B 03            [ 2]  380 	addw	sp, #3
      008B88 81               [ 4]  381 	ret
                                    382 ;	libs/stm8l_usart.c: 473: void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    383 ;	-----------------------------------------
                                    384 ;	 function USART_ReceiverWakeUpCmd
                                    385 ;	-----------------------------------------
      008B89                        386 _USART_ReceiverWakeUpCmd:
                                    387 ;	libs/stm8l_usart.c: 480: USARTx->CR2 |= USART_CR2_RWU;
      008B89 1E 03            [ 2]  388 	ldw	x, (0x03, sp)
      008B8B 1C 00 05         [ 2]  389 	addw	x, #0x0005
      008B8E F6               [ 1]  390 	ld	a, (x)
                                    391 ;	libs/stm8l_usart.c: 477: if (NewState != DISABLE)
      008B8F 0D 05            [ 1]  392 	tnz	(0x05, sp)
      008B91 27 04            [ 1]  393 	jreq	00102$
                                    394 ;	libs/stm8l_usart.c: 480: USARTx->CR2 |= USART_CR2_RWU;
      008B93 AA 02            [ 1]  395 	or	a, #0x02
      008B95 F7               [ 1]  396 	ld	(x), a
      008B96 81               [ 4]  397 	ret
      008B97                        398 00102$:
                                    399 ;	libs/stm8l_usart.c: 485: USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
      008B97 A4 FD            [ 1]  400 	and	a, #0xfd
      008B99 F7               [ 1]  401 	ld	(x), a
                                    402 ;	libs/stm8l_usart.c: 487: }
      008B9A 81               [ 4]  403 	ret
                                    404 ;	libs/stm8l_usart.c: 496: void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
                                    405 ;	-----------------------------------------
                                    406 ;	 function USART_SetAddress
                                    407 ;	-----------------------------------------
      008B9B                        408 _USART_SetAddress:
                                    409 ;	libs/stm8l_usart.c: 502: USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
      008B9B 1E 03            [ 2]  410 	ldw	x, (0x03, sp)
      008B9D 1C 00 07         [ 2]  411 	addw	x, #0x0007
      008BA0 F6               [ 1]  412 	ld	a, (x)
      008BA1 A4 F0            [ 1]  413 	and	a, #0xf0
      008BA3 F7               [ 1]  414 	ld	(x), a
                                    415 ;	libs/stm8l_usart.c: 504: USARTx->CR4 |= USART_Address;
      008BA4 88               [ 1]  416 	push	a
      008BA5 F6               [ 1]  417 	ld	a, (x)
      008BA6 84               [ 1]  418 	pop	a
      008BA7 1A 05            [ 1]  419 	or	a, (0x05, sp)
      008BA9 F7               [ 1]  420 	ld	(x), a
                                    421 ;	libs/stm8l_usart.c: 505: }
      008BAA 81               [ 4]  422 	ret
                                    423 ;	libs/stm8l_usart.c: 515: void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
                                    424 ;	-----------------------------------------
                                    425 ;	 function USART_WakeUpConfig
                                    426 ;	-----------------------------------------
      008BAB                        427 _USART_WakeUpConfig:
                                    428 ;	libs/stm8l_usart.c: 519: USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
      008BAB 1E 03            [ 2]  429 	ldw	x, (0x03, sp)
      008BAD 1C 00 04         [ 2]  430 	addw	x, #0x0004
      008BB0 F6               [ 1]  431 	ld	a, (x)
      008BB1 A4 F7            [ 1]  432 	and	a, #0xf7
      008BB3 F7               [ 1]  433 	ld	(x), a
                                    434 ;	libs/stm8l_usart.c: 520: USARTx->CR1 |= (uint8_t)USART_WakeUp;
      008BB4 88               [ 1]  435 	push	a
      008BB5 F6               [ 1]  436 	ld	a, (x)
      008BB6 84               [ 1]  437 	pop	a
      008BB7 1A 05            [ 1]  438 	or	a, (0x05, sp)
      008BB9 F7               [ 1]  439 	ld	(x), a
                                    440 ;	libs/stm8l_usart.c: 521: }
      008BBA 81               [ 4]  441 	ret
                                    442 ;	libs/stm8l_usart.c: 566: void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    443 ;	-----------------------------------------
                                    444 ;	 function USART_HalfDuplexCmd
                                    445 ;	-----------------------------------------
      008BBB                        446 _USART_HalfDuplexCmd:
                                    447 ;	libs/stm8l_usart.c: 572: USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
      008BBB 1E 03            [ 2]  448 	ldw	x, (0x03, sp)
      008BBD 1C 00 08         [ 2]  449 	addw	x, #0x0008
      008BC0 F6               [ 1]  450 	ld	a, (x)
                                    451 ;	libs/stm8l_usart.c: 570: if (NewState != DISABLE)
      008BC1 0D 05            [ 1]  452 	tnz	(0x05, sp)
      008BC3 27 04            [ 1]  453 	jreq	00102$
                                    454 ;	libs/stm8l_usart.c: 572: USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
      008BC5 AA 08            [ 1]  455 	or	a, #0x08
      008BC7 F7               [ 1]  456 	ld	(x), a
      008BC8 81               [ 4]  457 	ret
      008BC9                        458 00102$:
                                    459 ;	libs/stm8l_usart.c: 576: USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
      008BC9 A4 F7            [ 1]  460 	and	a, #0xf7
      008BCB F7               [ 1]  461 	ld	(x), a
                                    462 ;	libs/stm8l_usart.c: 578: }
      008BCC 81               [ 4]  463 	ret
                                    464 ;	libs/stm8l_usart.c: 644: void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    465 ;	-----------------------------------------
                                    466 ;	 function USART_SmartCardCmd
                                    467 ;	-----------------------------------------
      008BCD                        468 _USART_SmartCardCmd:
                                    469 ;	libs/stm8l_usart.c: 651: USARTx->CR5 |= USART_CR5_SCEN;
      008BCD 1E 03            [ 2]  470 	ldw	x, (0x03, sp)
      008BCF 1C 00 08         [ 2]  471 	addw	x, #0x0008
      008BD2 F6               [ 1]  472 	ld	a, (x)
                                    473 ;	libs/stm8l_usart.c: 648: if (NewState != DISABLE)
      008BD3 0D 05            [ 1]  474 	tnz	(0x05, sp)
      008BD5 27 04            [ 1]  475 	jreq	00102$
                                    476 ;	libs/stm8l_usart.c: 651: USARTx->CR5 |= USART_CR5_SCEN;
      008BD7 AA 20            [ 1]  477 	or	a, #0x20
      008BD9 F7               [ 1]  478 	ld	(x), a
      008BDA 81               [ 4]  479 	ret
      008BDB                        480 00102$:
                                    481 ;	libs/stm8l_usart.c: 656: USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
      008BDB A4 DF            [ 1]  482 	and	a, #0xdf
      008BDD F7               [ 1]  483 	ld	(x), a
                                    484 ;	libs/stm8l_usart.c: 658: }
      008BDE 81               [ 4]  485 	ret
                                    486 ;	libs/stm8l_usart.c: 667: void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    487 ;	-----------------------------------------
                                    488 ;	 function USART_SmartCardNACKCmd
                                    489 ;	-----------------------------------------
      008BDF                        490 _USART_SmartCardNACKCmd:
                                    491 ;	libs/stm8l_usart.c: 674: USARTx->CR5 |= USART_CR5_NACK;
      008BDF 1E 03            [ 2]  492 	ldw	x, (0x03, sp)
      008BE1 1C 00 08         [ 2]  493 	addw	x, #0x0008
      008BE4 F6               [ 1]  494 	ld	a, (x)
                                    495 ;	libs/stm8l_usart.c: 671: if (NewState != DISABLE)
      008BE5 0D 05            [ 1]  496 	tnz	(0x05, sp)
      008BE7 27 04            [ 1]  497 	jreq	00102$
                                    498 ;	libs/stm8l_usart.c: 674: USARTx->CR5 |= USART_CR5_NACK;
      008BE9 AA 10            [ 1]  499 	or	a, #0x10
      008BEB F7               [ 1]  500 	ld	(x), a
      008BEC 81               [ 4]  501 	ret
      008BED                        502 00102$:
                                    503 ;	libs/stm8l_usart.c: 679: USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
      008BED A4 EF            [ 1]  504 	and	a, #0xef
      008BEF F7               [ 1]  505 	ld	(x), a
                                    506 ;	libs/stm8l_usart.c: 681: }
      008BF0 81               [ 4]  507 	ret
                                    508 ;	libs/stm8l_usart.c: 690: void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
                                    509 ;	-----------------------------------------
                                    510 ;	 function USART_SetGuardTime
                                    511 ;	-----------------------------------------
      008BF1                        512 _USART_SetGuardTime:
                                    513 ;	libs/stm8l_usart.c: 693: USARTx->GTR = USART_GuardTime;
      008BF1 1E 03            [ 2]  514 	ldw	x, (0x03, sp)
      008BF3 7B 05            [ 1]  515 	ld	a, (0x05, sp)
      008BF5 E7 09            [ 1]  516 	ld	(0x0009, x), a
                                    517 ;	libs/stm8l_usart.c: 694: }
      008BF7 81               [ 4]  518 	ret
                                    519 ;	libs/stm8l_usart.c: 751: void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
                                    520 ;	-----------------------------------------
                                    521 ;	 function USART_IrDAConfig
                                    522 ;	-----------------------------------------
      008BF8                        523 _USART_IrDAConfig:
                                    524 ;	libs/stm8l_usart.c: 757: USARTx->CR5 |= USART_CR5_IRLP;
      008BF8 1E 03            [ 2]  525 	ldw	x, (0x03, sp)
      008BFA 1C 00 08         [ 2]  526 	addw	x, #0x0008
      008BFD F6               [ 1]  527 	ld	a, (x)
                                    528 ;	libs/stm8l_usart.c: 755: if (USART_IrDAMode != USART_IrDAMode_Normal)
      008BFE 0D 05            [ 1]  529 	tnz	(0x05, sp)
      008C00 27 04            [ 1]  530 	jreq	00102$
                                    531 ;	libs/stm8l_usart.c: 757: USARTx->CR5 |= USART_CR5_IRLP;
      008C02 AA 04            [ 1]  532 	or	a, #0x04
      008C04 F7               [ 1]  533 	ld	(x), a
      008C05 81               [ 4]  534 	ret
      008C06                        535 00102$:
                                    536 ;	libs/stm8l_usart.c: 761: USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
      008C06 A4 FB            [ 1]  537 	and	a, #0xfb
      008C08 F7               [ 1]  538 	ld	(x), a
                                    539 ;	libs/stm8l_usart.c: 763: }
      008C09 81               [ 4]  540 	ret
                                    541 ;	libs/stm8l_usart.c: 772: void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
                                    542 ;	-----------------------------------------
                                    543 ;	 function USART_IrDACmd
                                    544 ;	-----------------------------------------
      008C0A                        545 _USART_IrDACmd:
                                    546 ;	libs/stm8l_usart.c: 781: USARTx->CR5 |= USART_CR5_IREN;
      008C0A 1E 03            [ 2]  547 	ldw	x, (0x03, sp)
      008C0C 1C 00 08         [ 2]  548 	addw	x, #0x0008
      008C0F F6               [ 1]  549 	ld	a, (x)
                                    550 ;	libs/stm8l_usart.c: 778: if (NewState != DISABLE)
      008C10 0D 05            [ 1]  551 	tnz	(0x05, sp)
      008C12 27 04            [ 1]  552 	jreq	00102$
                                    553 ;	libs/stm8l_usart.c: 781: USARTx->CR5 |= USART_CR5_IREN;
      008C14 AA 02            [ 1]  554 	or	a, #0x02
      008C16 F7               [ 1]  555 	ld	(x), a
      008C17 81               [ 4]  556 	ret
      008C18                        557 00102$:
                                    558 ;	libs/stm8l_usart.c: 786: USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
      008C18 A4 FD            [ 1]  559 	and	a, #0xfd
      008C1A F7               [ 1]  560 	ld	(x), a
                                    561 ;	libs/stm8l_usart.c: 788: }
      008C1B 81               [ 4]  562 	ret
                                    563 ;	libs/stm8l_usart.c: 818: void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
                                    564 ;	-----------------------------------------
                                    565 ;	 function USART_DMACmd
                                    566 ;	-----------------------------------------
      008C1C                        567 _USART_DMACmd:
      008C1C 88               [ 1]  568 	push	a
                                    569 ;	libs/stm8l_usart.c: 829: USARTx->CR5 |= (uint8_t) USART_DMAReq;
      008C1D 1E 04            [ 2]  570 	ldw	x, (0x04, sp)
      008C1F 1C 00 08         [ 2]  571 	addw	x, #0x0008
      008C22 F6               [ 1]  572 	ld	a, (x)
                                    573 ;	libs/stm8l_usart.c: 825: if (NewState != DISABLE)
      008C23 0D 07            [ 1]  574 	tnz	(0x07, sp)
      008C25 27 05            [ 1]  575 	jreq	00102$
                                    576 ;	libs/stm8l_usart.c: 829: USARTx->CR5 |= (uint8_t) USART_DMAReq;
      008C27 1A 06            [ 1]  577 	or	a, (0x06, sp)
      008C29 F7               [ 1]  578 	ld	(x), a
      008C2A 20 0A            [ 2]  579 	jra	00104$
      008C2C                        580 00102$:
                                    581 ;	libs/stm8l_usart.c: 835: USARTx->CR5 &= (uint8_t)~USART_DMAReq;
      008C2C 88               [ 1]  582 	push	a
      008C2D 7B 07            [ 1]  583 	ld	a, (0x07, sp)
      008C2F 43               [ 1]  584 	cpl	a
      008C30 6B 02            [ 1]  585 	ld	(0x02, sp), a
      008C32 84               [ 1]  586 	pop	a
      008C33 14 01            [ 1]  587 	and	a, (0x01, sp)
      008C35 F7               [ 1]  588 	ld	(x), a
      008C36                        589 00104$:
                                    590 ;	libs/stm8l_usart.c: 837: }
      008C36 84               [ 1]  591 	pop	a
      008C37 81               [ 4]  592 	ret
                                    593 ;	libs/stm8l_usart.c: 939: void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
                                    594 ;	-----------------------------------------
                                    595 ;	 function USART_ITConfig
                                    596 ;	-----------------------------------------
      008C38                        597 _USART_ITConfig:
      008C38 52 07            [ 2]  598 	sub	sp, #7
                                    599 ;	libs/stm8l_usart.c: 946: usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
      008C3A 1E 0C            [ 2]  600 	ldw	x, (0x0c, sp)
                                    601 ;	libs/stm8l_usart.c: 948: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
      008C3C 7B 0D            [ 1]  602 	ld	a, (0x0d, sp)
      008C3E A4 0F            [ 1]  603 	and	a, #0x0f
      008C40 88               [ 1]  604 	push	a
      008C41 A6 01            [ 1]  605 	ld	a, #0x01
      008C43 6B 08            [ 1]  606 	ld	(0x08, sp), a
      008C45 84               [ 1]  607 	pop	a
      008C46 4D               [ 1]  608 	tnz	a
      008C47 27 05            [ 1]  609 	jreq	00144$
      008C49                        610 00143$:
      008C49 08 07            [ 1]  611 	sll	(0x07, sp)
      008C4B 4A               [ 1]  612 	dec	a
      008C4C 26 FB            [ 1]  613 	jrne	00143$
      008C4E                        614 00144$:
                                    615 ;	libs/stm8l_usart.c: 953: if (usartreg == 0x01)
      008C4E 9E               [ 1]  616 	ld	a, xh
      008C4F 4A               [ 1]  617 	dec	a
      008C50 26 05            [ 1]  618 	jrne	00146$
      008C52 A6 01            [ 1]  619 	ld	a, #0x01
      008C54 6B 01            [ 1]  620 	ld	(0x01, sp), a
      008C56 C5                     621 	.byte 0xc5
      008C57                        622 00146$:
      008C57 0F 01            [ 1]  623 	clr	(0x01, sp)
      008C59                        624 00147$:
                                    625 ;	libs/stm8l_usart.c: 955: USARTx->CR1 |= itpos;
      008C59 16 0A            [ 2]  626 	ldw	y, (0x0a, sp)
                                    627 ;	libs/stm8l_usart.c: 957: else if (usartreg == 0x05)
      008C5B 9E               [ 1]  628 	ld	a, xh
      008C5C A0 05            [ 1]  629 	sub	a, #0x05
      008C5E 26 04            [ 1]  630 	jrne	00149$
      008C60 4C               [ 1]  631 	inc	a
      008C61 6B 02            [ 1]  632 	ld	(0x02, sp), a
      008C63 C5                     633 	.byte 0xc5
      008C64                        634 00149$:
      008C64 0F 02            [ 1]  635 	clr	(0x02, sp)
      008C66                        636 00150$:
                                    637 ;	libs/stm8l_usart.c: 955: USARTx->CR1 |= itpos;
      008C66 93               [ 1]  638 	ldw	x, y
      008C67 1C 00 04         [ 2]  639 	addw	x, #0x0004
      008C6A 1F 03            [ 2]  640 	ldw	(0x03, sp), x
                                    641 ;	libs/stm8l_usart.c: 959: USARTx->CR5 |= itpos;
      008C6C 93               [ 1]  642 	ldw	x, y
      008C6D 1C 00 08         [ 2]  643 	addw	x, #0x0008
                                    644 ;	libs/stm8l_usart.c: 964: USARTx->CR2 |= itpos;
      008C70 72 A9 00 05      [ 2]  645 	addw	y, #0x0005
      008C74 17 05            [ 2]  646 	ldw	(0x05, sp), y
                                    647 ;	libs/stm8l_usart.c: 950: if (NewState != DISABLE)
      008C76 0D 0E            [ 1]  648 	tnz	(0x0e, sp)
      008C78 27 22            [ 1]  649 	jreq	00114$
                                    650 ;	libs/stm8l_usart.c: 953: if (usartreg == 0x01)
      008C7A 0D 01            [ 1]  651 	tnz	(0x01, sp)
      008C7C 27 0A            [ 1]  652 	jreq	00105$
                                    653 ;	libs/stm8l_usart.c: 955: USARTx->CR1 |= itpos;
      008C7E 1E 03            [ 2]  654 	ldw	x, (0x03, sp)
      008C80 F6               [ 1]  655 	ld	a, (x)
      008C81 1A 07            [ 1]  656 	or	a, (0x07, sp)
      008C83 1E 03            [ 2]  657 	ldw	x, (0x03, sp)
      008C85 F7               [ 1]  658 	ld	(x), a
      008C86 20 36            [ 2]  659 	jra	00116$
      008C88                        660 00105$:
                                    661 ;	libs/stm8l_usart.c: 957: else if (usartreg == 0x05)
      008C88 0D 02            [ 1]  662 	tnz	(0x02, sp)
      008C8A 27 06            [ 1]  663 	jreq	00102$
                                    664 ;	libs/stm8l_usart.c: 959: USARTx->CR5 |= itpos;
      008C8C F6               [ 1]  665 	ld	a, (x)
      008C8D 1A 07            [ 1]  666 	or	a, (0x07, sp)
      008C8F F7               [ 1]  667 	ld	(x), a
      008C90 20 2C            [ 2]  668 	jra	00116$
      008C92                        669 00102$:
                                    670 ;	libs/stm8l_usart.c: 964: USARTx->CR2 |= itpos;
      008C92 1E 05            [ 2]  671 	ldw	x, (0x05, sp)
      008C94 F6               [ 1]  672 	ld	a, (x)
      008C95 1A 07            [ 1]  673 	or	a, (0x07, sp)
      008C97 1E 05            [ 2]  674 	ldw	x, (0x05, sp)
      008C99 F7               [ 1]  675 	ld	(x), a
      008C9A 20 22            [ 2]  676 	jra	00116$
      008C9C                        677 00114$:
                                    678 ;	libs/stm8l_usart.c: 972: USARTx->CR1 &= (uint8_t)(~itpos);
      008C9C 03 07            [ 1]  679 	cpl	(0x07, sp)
                                    680 ;	libs/stm8l_usart.c: 970: if (usartreg == 0x01)
      008C9E 0D 01            [ 1]  681 	tnz	(0x01, sp)
      008CA0 27 0A            [ 1]  682 	jreq	00111$
                                    683 ;	libs/stm8l_usart.c: 972: USARTx->CR1 &= (uint8_t)(~itpos);
      008CA2 1E 03            [ 2]  684 	ldw	x, (0x03, sp)
      008CA4 F6               [ 1]  685 	ld	a, (x)
      008CA5 14 07            [ 1]  686 	and	a, (0x07, sp)
      008CA7 1E 03            [ 2]  687 	ldw	x, (0x03, sp)
      008CA9 F7               [ 1]  688 	ld	(x), a
      008CAA 20 12            [ 2]  689 	jra	00116$
      008CAC                        690 00111$:
                                    691 ;	libs/stm8l_usart.c: 974: else if (usartreg == 0x05)
      008CAC 0D 02            [ 1]  692 	tnz	(0x02, sp)
      008CAE 27 06            [ 1]  693 	jreq	00108$
                                    694 ;	libs/stm8l_usart.c: 976: USARTx->CR5 &= (uint8_t)(~itpos);
      008CB0 F6               [ 1]  695 	ld	a, (x)
      008CB1 14 07            [ 1]  696 	and	a, (0x07, sp)
      008CB3 F7               [ 1]  697 	ld	(x), a
      008CB4 20 08            [ 2]  698 	jra	00116$
      008CB6                        699 00108$:
                                    700 ;	libs/stm8l_usart.c: 981: USARTx->CR2 &= (uint8_t)(~itpos);
      008CB6 1E 05            [ 2]  701 	ldw	x, (0x05, sp)
      008CB8 F6               [ 1]  702 	ld	a, (x)
      008CB9 14 07            [ 1]  703 	and	a, (0x07, sp)
      008CBB 1E 05            [ 2]  704 	ldw	x, (0x05, sp)
      008CBD F7               [ 1]  705 	ld	(x), a
      008CBE                        706 00116$:
                                    707 ;	libs/stm8l_usart.c: 984: }
      008CBE 5B 07            [ 2]  708 	addw	sp, #7
      008CC0 81               [ 4]  709 	ret
                                    710 ;	libs/stm8l_usart.c: 1002: FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
                                    711 ;	-----------------------------------------
                                    712 ;	 function USART_GetFlagStatus
                                    713 ;	-----------------------------------------
      008CC1                        714 _USART_GetFlagStatus:
      008CC1 88               [ 1]  715 	push	a
                                    716 ;	libs/stm8l_usart.c: 1009: if (USART_FLAG == USART_FLAG_SBK)
      008CC2 16 06            [ 2]  717 	ldw	y, (0x06, sp)
                                    718 ;	libs/stm8l_usart.c: 1011: if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
      008CC4 1E 04            [ 2]  719 	ldw	x, (0x04, sp)
      008CC6 7B 07            [ 1]  720 	ld	a, (0x07, sp)
      008CC8 6B 01            [ 1]  721 	ld	(0x01, sp), a
                                    722 ;	libs/stm8l_usart.c: 1009: if (USART_FLAG == USART_FLAG_SBK)
      008CCA 90 A3 01 01      [ 2]  723 	cpw	y, #0x0101
      008CCE 26 0D            [ 1]  724 	jrne	00108$
                                    725 ;	libs/stm8l_usart.c: 1011: if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
      008CD0 E6 05            [ 1]  726 	ld	a, (0x5, x)
      008CD2 14 01            [ 1]  727 	and	a, (0x01, sp)
      008CD4 27 04            [ 1]  728 	jreq	00102$
                                    729 ;	libs/stm8l_usart.c: 1014: status = SET;
      008CD6 A6 01            [ 1]  730 	ld	a, #0x01
      008CD8 20 0C            [ 2]  731 	jra	00109$
      008CDA                        732 00102$:
                                    733 ;	libs/stm8l_usart.c: 1019: status = RESET;
      008CDA 4F               [ 1]  734 	clr	a
      008CDB 20 09            [ 2]  735 	jra	00109$
      008CDD                        736 00108$:
                                    737 ;	libs/stm8l_usart.c: 1024: if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
      008CDD F6               [ 1]  738 	ld	a, (x)
      008CDE 14 01            [ 1]  739 	and	a, (0x01, sp)
      008CE0 27 03            [ 1]  740 	jreq	00105$
                                    741 ;	libs/stm8l_usart.c: 1027: status = SET;
      008CE2 A6 01            [ 1]  742 	ld	a, #0x01
                                    743 ;	libs/stm8l_usart.c: 1032: status = RESET;
      008CE4 21                     744 	.byte 0x21
      008CE5                        745 00105$:
      008CE5 4F               [ 1]  746 	clr	a
      008CE6                        747 00109$:
                                    748 ;	libs/stm8l_usart.c: 1036: return status;
                                    749 ;	libs/stm8l_usart.c: 1037: }
      008CE6 5B 01            [ 2]  750 	addw	sp, #1
      008CE8 81               [ 4]  751 	ret
                                    752 ;	libs/stm8l_usart.c: 1060: void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
                                    753 ;	-----------------------------------------
                                    754 ;	 function USART_ClearFlag
                                    755 ;	-----------------------------------------
      008CE9                        756 _USART_ClearFlag:
                                    757 ;	libs/stm8l_usart.c: 1065: USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
      008CE9 16 03            [ 2]  758 	ldw	y, (0x03, sp)
      008CEB 1E 05            [ 2]  759 	ldw	x, (0x05, sp)
      008CED 53               [ 2]  760 	cplw	x
      008CEE 9F               [ 1]  761 	ld	a, xl
      008CEF 90 F7            [ 1]  762 	ld	(y), a
                                    763 ;	libs/stm8l_usart.c: 1066: }
      008CF1 81               [ 4]  764 	ret
                                    765 ;	libs/stm8l_usart.c: 1083: ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
                                    766 ;	-----------------------------------------
                                    767 ;	 function USART_GetITStatus
                                    768 ;	-----------------------------------------
      008CF2                        769 _USART_GetITStatus:
      008CF2 52 06            [ 2]  770 	sub	sp, #6
                                    771 ;	libs/stm8l_usart.c: 1096: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
      008CF4 7B 0C            [ 1]  772 	ld	a, (0x0c, sp)
      008CF6 97               [ 1]  773 	ld	xl, a
      008CF7 A4 0F            [ 1]  774 	and	a, #0x0f
      008CF9 88               [ 1]  775 	push	a
      008CFA A6 01            [ 1]  776 	ld	a, #0x01
      008CFC 6B 07            [ 1]  777 	ld	(0x07, sp), a
      008CFE 84               [ 1]  778 	pop	a
      008CFF 4D               [ 1]  779 	tnz	a
      008D00 27 05            [ 1]  780 	jreq	00163$
      008D02                        781 00162$:
      008D02 08 06            [ 1]  782 	sll	(0x06, sp)
      008D04 4A               [ 1]  783 	dec	a
      008D05 26 FB            [ 1]  784 	jrne	00162$
      008D07                        785 00163$:
                                    786 ;	libs/stm8l_usart.c: 1098: itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
      008D07 9F               [ 1]  787 	ld	a, xl
      008D08 4E               [ 1]  788 	swap	a
      008D09 A4 0F            [ 1]  789 	and	a, #0x0f
                                    790 ;	libs/stm8l_usart.c: 1100: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      008D0B 88               [ 1]  791 	push	a
      008D0C A6 01            [ 1]  792 	ld	a, #0x01
      008D0E 6B 02            [ 1]  793 	ld	(0x02, sp), a
      008D10 84               [ 1]  794 	pop	a
      008D11 4D               [ 1]  795 	tnz	a
      008D12 27 05            [ 1]  796 	jreq	00165$
      008D14                        797 00164$:
      008D14 08 01            [ 1]  798 	sll	(0x01, sp)
      008D16 4A               [ 1]  799 	dec	a
      008D17 26 FB            [ 1]  800 	jrne	00164$
      008D19                        801 00165$:
                                    802 ;	libs/stm8l_usart.c: 1103: if (USART_IT == USART_IT_PE)
      008D19 16 0B            [ 2]  803 	ldw	y, (0x0b, sp)
      008D1B 17 02            [ 2]  804 	ldw	(0x02, sp), y
                                    805 ;	libs/stm8l_usart.c: 1106: enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
      008D1D 16 09            [ 2]  806 	ldw	y, (0x09, sp)
                                    807 ;	libs/stm8l_usart.c: 1109: if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008D1F 17 04            [ 2]  808 	ldw	(0x04, sp), y
      008D21 93               [ 1]  809 	ldw	x, y
      008D22 F6               [ 1]  810 	ld	a, (x)
      008D23 14 06            [ 1]  811 	and	a, (0x06, sp)
      008D25 6B 06            [ 1]  812 	ld	(0x06, sp), a
                                    813 ;	libs/stm8l_usart.c: 1103: if (USART_IT == USART_IT_PE)
      008D27 1E 02            [ 2]  814 	ldw	x, (0x02, sp)
      008D29 A3 01 00         [ 2]  815 	cpw	x, #0x0100
      008D2C 26 16            [ 1]  816 	jrne	00118$
                                    817 ;	libs/stm8l_usart.c: 1106: enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
      008D2E 1E 04            [ 2]  818 	ldw	x, (0x04, sp)
      008D30 E6 04            [ 1]  819 	ld	a, (0x4, x)
      008D32 6B 03            [ 1]  820 	ld	(0x03, sp), a
      008D34 14 01            [ 1]  821 	and	a, (0x01, sp)
                                    822 ;	libs/stm8l_usart.c: 1109: if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008D36 0D 06            [ 1]  823 	tnz	(0x06, sp)
      008D38 27 07            [ 1]  824 	jreq	00102$
      008D3A 4D               [ 1]  825 	tnz	a
      008D3B 27 04            [ 1]  826 	jreq	00102$
                                    827 ;	libs/stm8l_usart.c: 1112: pendingbitstatus = SET;
      008D3D A6 01            [ 1]  828 	ld	a, #0x01
      008D3F 20 35            [ 2]  829 	jra	00119$
      008D41                        830 00102$:
                                    831 ;	libs/stm8l_usart.c: 1117: pendingbitstatus = RESET;
      008D41 4F               [ 1]  832 	clr	a
      008D42 20 32            [ 2]  833 	jra	00119$
      008D44                        834 00118$:
                                    835 ;	libs/stm8l_usart.c: 1124: enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
      008D44 1E 04            [ 2]  836 	ldw	x, (0x04, sp)
      008D46 E6 05            [ 1]  837 	ld	a, (0x5, x)
      008D48 14 01            [ 1]  838 	and	a, (0x01, sp)
                                    839 ;	libs/stm8l_usart.c: 1121: else if (USART_IT == USART_IT_OR)
      008D4A 1E 02            [ 2]  840 	ldw	x, (0x02, sp)
      008D4C A3 02 35         [ 2]  841 	cpw	x, #0x0235
      008D4F 26 1A            [ 1]  842 	jrne	00115$
                                    843 ;	libs/stm8l_usart.c: 1124: enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
      008D51 6B 03            [ 1]  844 	ld	(0x03, sp), a
                                    845 ;	libs/stm8l_usart.c: 1127: temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
      008D53 1E 04            [ 2]  846 	ldw	x, (0x04, sp)
      008D55 E6 08            [ 1]  847 	ld	a, (0x8, x)
      008D57 A4 01            [ 1]  848 	and	a, #0x01
                                    849 ;	libs/stm8l_usart.c: 1129: if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
      008D59 0D 06            [ 1]  850 	tnz	(0x06, sp)
      008D5B 27 0B            [ 1]  851 	jreq	00106$
      008D5D 0D 03            [ 1]  852 	tnz	(0x03, sp)
      008D5F 26 03            [ 1]  853 	jrne	00105$
      008D61 4D               [ 1]  854 	tnz	a
      008D62 27 04            [ 1]  855 	jreq	00106$
      008D64                        856 00105$:
                                    857 ;	libs/stm8l_usart.c: 1132: pendingbitstatus = SET;
      008D64 A6 01            [ 1]  858 	ld	a, #0x01
      008D66 20 0E            [ 2]  859 	jra	00119$
      008D68                        860 00106$:
                                    861 ;	libs/stm8l_usart.c: 1137: pendingbitstatus = RESET;
      008D68 4F               [ 1]  862 	clr	a
      008D69 20 0B            [ 2]  863 	jra	00119$
      008D6B                        864 00115$:
                                    865 ;	libs/stm8l_usart.c: 1144: enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
                                    866 ;	libs/stm8l_usart.c: 1146: if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008D6B 0D 06            [ 1]  867 	tnz	(0x06, sp)
      008D6D 27 06            [ 1]  868 	jreq	00111$
      008D6F 4D               [ 1]  869 	tnz	a
      008D70 27 03            [ 1]  870 	jreq	00111$
                                    871 ;	libs/stm8l_usart.c: 1149: pendingbitstatus = SET;
      008D72 A6 01            [ 1]  872 	ld	a, #0x01
                                    873 ;	libs/stm8l_usart.c: 1154: pendingbitstatus = RESET;
      008D74 21                     874 	.byte 0x21
      008D75                        875 00111$:
      008D75 4F               [ 1]  876 	clr	a
      008D76                        877 00119$:
                                    878 ;	libs/stm8l_usart.c: 1159: return  pendingbitstatus;
                                    879 ;	libs/stm8l_usart.c: 1160: }
      008D76 5B 06            [ 2]  880 	addw	sp, #6
      008D78 81               [ 4]  881 	ret
                                    882 ;	libs/stm8l_usart.c: 1183: void USART_ClearITPendingBit(USART_TypeDef* USARTx)//, USART_IT_TypeDef USART_IT)
                                    883 ;	-----------------------------------------
                                    884 ;	 function USART_ClearITPendingBit
                                    885 ;	-----------------------------------------
      008D79                        886 _USART_ClearITPendingBit:
                                    887 ;	libs/stm8l_usart.c: 1188: USARTx->SR &= (uint8_t)(~USART_SR_TC);
      008D79 1E 03            [ 2]  888 	ldw	x, (0x03, sp)
      008D7B F6               [ 1]  889 	ld	a, (x)
      008D7C A4 BF            [ 1]  890 	and	a, #0xbf
      008D7E F7               [ 1]  891 	ld	(x), a
                                    892 ;	libs/stm8l_usart.c: 1189: }
      008D7F 81               [ 4]  893 	ret
                                    894 	.area CODE
                                    895 	.area CONST
                                    896 	.area INITIALIZER
                                    897 	.area CABS (ABS)
