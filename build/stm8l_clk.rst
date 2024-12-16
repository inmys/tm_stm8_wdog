                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8l_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SYSDivFactor
                                     12 	.globl _CLK_DeInit
                                     13 	.globl _CLK_HSICmd
                                     14 	.globl _CLK_AdjustHSICalibrationValue
                                     15 	.globl _CLK_LSICmd
                                     16 	.globl _CLK_HSEConfig
                                     17 	.globl _CLK_LSEConfig
                                     18 	.globl _CLK_ClockSecuritySystemEnable
                                     19 	.globl _CLK_ClockSecuritySytemDeglitchCmd
                                     20 	.globl _CLK_CCOConfig
                                     21 	.globl _CLK_SYSCLKSourceConfig
                                     22 	.globl _CLK_GetSYSCLKSource
                                     23 	.globl _CLK_GetClockFreq
                                     24 	.globl _CLK_SYSCLKDivConfig
                                     25 	.globl _CLK_SYSCLKSourceSwitchCmd
                                     26 	.globl _CLK_RTCClockConfig
                                     27 	.globl _CLK_BEEPClockConfig
                                     28 	.globl _CLK_PeripheralClockConfig
                                     29 	.globl _CLK_LSEClockSecuritySystemEnable
                                     30 	.globl _CLK_RTCCLKSwitchOnLSEFailureEnable
                                     31 	.globl _CLK_HaltConfig
                                     32 	.globl _CLK_MainRegulatorCmd
                                     33 	.globl _CLK_ITConfig
                                     34 	.globl _CLK_GetFlagStatus
                                     35 	.globl _CLK_ClearFlag
                                     36 	.globl _CLK_GetITStatus
                                     37 	.globl _CLK_ClearITPendingBit
                                     38 ;--------------------------------------------------------
                                     39 ; ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DATA
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area INITIALIZED
                                     46 ;--------------------------------------------------------
                                     47 ; absolute external ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area DABS (ABS)
                                     50 
                                     51 ; default segment ordering for linker
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area CONST
                                     56 	.area INITIALIZER
                                     57 	.area CODE
                                     58 
                                     59 ;--------------------------------------------------------
                                     60 ; global & static initialisations
                                     61 ;--------------------------------------------------------
                                     62 	.area HOME
                                     63 	.area GSINIT
                                     64 	.area GSFINAL
                                     65 	.area GSINIT
                                     66 ;--------------------------------------------------------
                                     67 ; Home
                                     68 ;--------------------------------------------------------
                                     69 	.area HOME
                                     70 	.area HOME
                                     71 ;--------------------------------------------------------
                                     72 ; code
                                     73 ;--------------------------------------------------------
                                     74 	.area CODE
                                     75 ;	libs/stm8l_clk.c: 120: void CLK_DeInit(void)
                                     76 ;	-----------------------------------------
                                     77 ;	 function CLK_DeInit
                                     78 ;	-----------------------------------------
      0084DB                         79 _CLK_DeInit:
                                     80 ;	libs/stm8l_clk.c: 122: CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
      0084DB 35 11 50 C2      [ 1]   81 	mov	0x50c2+0, #0x11
                                     82 ;	libs/stm8l_clk.c: 123: CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
      0084DF 35 00 50 C6      [ 1]   83 	mov	0x50c6+0, #0x00
                                     84 ;	libs/stm8l_clk.c: 124: CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
      0084E3 35 00 50 C1      [ 1]   85 	mov	0x50c1+0, #0x00
                                     86 ;	libs/stm8l_clk.c: 125: CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
      0084E7 35 00 50 CB      [ 1]   87 	mov	0x50cb+0, #0x00
                                     88 ;	libs/stm8l_clk.c: 126: CLK->SWR  = CLK_SWR_RESET_VALUE;
      0084EB 35 01 50 C8      [ 1]   89 	mov	0x50c8+0, #0x01
                                     90 ;	libs/stm8l_clk.c: 127: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      0084EF 35 00 50 C9      [ 1]   91 	mov	0x50c9+0, #0x00
                                     92 ;	libs/stm8l_clk.c: 128: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      0084F3 35 03 50 C0      [ 1]   93 	mov	0x50c0+0, #0x03
                                     94 ;	libs/stm8l_clk.c: 129: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      0084F7 35 00 50 C3      [ 1]   95 	mov	0x50c3+0, #0x00
                                     96 ;	libs/stm8l_clk.c: 130: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      0084FB 35 80 50 C4      [ 1]   97 	mov	0x50c4+0, #0x80
                                     98 ;	libs/stm8l_clk.c: 131: CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
      0084FF 35 00 50 D0      [ 1]   99 	mov	0x50d0+0, #0x00
                                    100 ;	libs/stm8l_clk.c: 132: CLK->CSSR  = CLK_CSSR_RESET_VALUE;
      008503 35 00 50 CA      [ 1]  101 	mov	0x50ca+0, #0x00
                                    102 ;	libs/stm8l_clk.c: 133: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008507 35 00 50 C5      [ 1]  103 	mov	0x50c5+0, #0x00
                                    104 ;	libs/stm8l_clk.c: 134: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      00850B 35 00 50 CD      [ 1]  105 	mov	0x50cd+0, #0x00
                                    106 ;	libs/stm8l_clk.c: 135: CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
      00850F 35 00 50 CC      [ 1]  107 	mov	0x50cc+0, #0x00
                                    108 ;	libs/stm8l_clk.c: 136: CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
      008513 35 00 50 CE      [ 1]  109 	mov	0x50ce+0, #0x00
                                    110 ;	libs/stm8l_clk.c: 137: CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
      008517 35 B9 50 CF      [ 1]  111 	mov	0x50cf+0, #0xb9
                                    112 ;	libs/stm8l_clk.c: 138: }
      00851B 81               [ 4]  113 	ret
                                    114 ;	libs/stm8l_clk.c: 160: void CLK_HSICmd(FunctionalState NewState)
                                    115 ;	-----------------------------------------
                                    116 ;	 function CLK_HSICmd
                                    117 ;	-----------------------------------------
      00851C                        118 _CLK_HSICmd:
      00851C 88               [ 1]  119 	push	a
      00851D 6B 01            [ 1]  120 	ld	(0x01, sp), a
                                    121 ;	libs/stm8l_clk.c: 168: CLK->ICKCR |= CLK_ICKCR_HSION;
      00851F C6 50 C2         [ 1]  122 	ld	a, 0x50c2
                                    123 ;	libs/stm8l_clk.c: 165: if (NewState != DISABLE)
      008522 0D 01            [ 1]  124 	tnz	(0x01, sp)
      008524 27 07            [ 1]  125 	jreq	00102$
                                    126 ;	libs/stm8l_clk.c: 168: CLK->ICKCR |= CLK_ICKCR_HSION;
      008526 AA 01            [ 1]  127 	or	a, #0x01
      008528 C7 50 C2         [ 1]  128 	ld	0x50c2, a
      00852B 20 05            [ 2]  129 	jra	00104$
      00852D                        130 00102$:
                                    131 ;	libs/stm8l_clk.c: 173: CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
      00852D A4 FE            [ 1]  132 	and	a, #0xfe
      00852F C7 50 C2         [ 1]  133 	ld	0x50c2, a
      008532                        134 00104$:
                                    135 ;	libs/stm8l_clk.c: 175: }
      008532 84               [ 1]  136 	pop	a
      008533 81               [ 4]  137 	ret
                                    138 ;	libs/stm8l_clk.c: 188: void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
                                    139 ;	-----------------------------------------
                                    140 ;	 function CLK_AdjustHSICalibrationValue
                                    141 ;	-----------------------------------------
      008534                        142 _CLK_AdjustHSICalibrationValue:
                                    143 ;	libs/stm8l_clk.c: 191: CLK->HSIUNLCKR = 0xAC;
      008534 35 AC 50 CE      [ 1]  144 	mov	0x50ce+0, #0xac
                                    145 ;	libs/stm8l_clk.c: 192: CLK->HSIUNLCKR = 0x35;
      008538 35 35 50 CE      [ 1]  146 	mov	0x50ce+0, #0x35
                                    147 ;	libs/stm8l_clk.c: 195: CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
      00853C C7 50 CD         [ 1]  148 	ld	0x50cd, a
                                    149 ;	libs/stm8l_clk.c: 196: }
      00853F 81               [ 4]  150 	ret
                                    151 ;	libs/stm8l_clk.c: 212: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      008540                        155 _CLK_LSICmd:
      008540 88               [ 1]  156 	push	a
      008541 6B 01            [ 1]  157 	ld	(0x01, sp), a
                                    158 ;	libs/stm8l_clk.c: 221: CLK->ICKCR |= CLK_ICKCR_LSION;
      008543 C6 50 C2         [ 1]  159 	ld	a, 0x50c2
                                    160 ;	libs/stm8l_clk.c: 218: if (NewState != DISABLE)
      008546 0D 01            [ 1]  161 	tnz	(0x01, sp)
      008548 27 07            [ 1]  162 	jreq	00102$
                                    163 ;	libs/stm8l_clk.c: 221: CLK->ICKCR |= CLK_ICKCR_LSION;
      00854A AA 04            [ 1]  164 	or	a, #0x04
      00854C C7 50 C2         [ 1]  165 	ld	0x50c2, a
      00854F 20 05            [ 2]  166 	jra	00104$
      008551                        167 00102$:
                                    168 ;	libs/stm8l_clk.c: 226: CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
      008551 A4 FB            [ 1]  169 	and	a, #0xfb
      008553 C7 50 C2         [ 1]  170 	ld	0x50c2, a
      008556                        171 00104$:
                                    172 ;	libs/stm8l_clk.c: 228: }
      008556 84               [ 1]  173 	pop	a
      008557 81               [ 4]  174 	ret
                                    175 ;	libs/stm8l_clk.c: 249: void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
                                    176 ;	-----------------------------------------
                                    177 ;	 function CLK_HSEConfig
                                    178 ;	-----------------------------------------
      008558                        179 _CLK_HSEConfig:
      008558 88               [ 1]  180 	push	a
      008559 6B 01            [ 1]  181 	ld	(0x01, sp), a
                                    182 ;	libs/stm8l_clk.c: 256: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
      00855B 72 11 50 C6      [ 1]  183 	bres	0x50c6, #0
                                    184 ;	libs/stm8l_clk.c: 259: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
      00855F 72 19 50 C6      [ 1]  185 	bres	0x50c6, #4
                                    186 ;	libs/stm8l_clk.c: 262: CLK->ECKCR |= (uint8_t)CLK_HSE;
      008563 C6 50 C6         [ 1]  187 	ld	a, 0x50c6
      008566 1A 01            [ 1]  188 	or	a, (0x01, sp)
      008568 C7 50 C6         [ 1]  189 	ld	0x50c6, a
                                    190 ;	libs/stm8l_clk.c: 263: }
      00856B 84               [ 1]  191 	pop	a
      00856C 81               [ 4]  192 	ret
                                    193 ;	libs/stm8l_clk.c: 280: void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
                                    194 ;	-----------------------------------------
                                    195 ;	 function CLK_LSEConfig
                                    196 ;	-----------------------------------------
      00856D                        197 _CLK_LSEConfig:
      00856D 88               [ 1]  198 	push	a
      00856E 6B 01            [ 1]  199 	ld	(0x01, sp), a
                                    200 ;	libs/stm8l_clk.c: 287: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
      008570 72 15 50 C6      [ 1]  201 	bres	0x50c6, #2
                                    202 ;	libs/stm8l_clk.c: 290: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
      008574 72 1B 50 C6      [ 1]  203 	bres	0x50c6, #5
                                    204 ;	libs/stm8l_clk.c: 293: CLK->ECKCR |= (uint8_t)CLK_LSE;
      008578 C6 50 C6         [ 1]  205 	ld	a, 0x50c6
      00857B 1A 01            [ 1]  206 	or	a, (0x01, sp)
      00857D C7 50 C6         [ 1]  207 	ld	0x50c6, a
                                    208 ;	libs/stm8l_clk.c: 295: }
      008580 84               [ 1]  209 	pop	a
      008581 81               [ 4]  210 	ret
                                    211 ;	libs/stm8l_clk.c: 306: void CLK_ClockSecuritySystemEnable(void)
                                    212 ;	-----------------------------------------
                                    213 ;	 function CLK_ClockSecuritySystemEnable
                                    214 ;	-----------------------------------------
      008582                        215 _CLK_ClockSecuritySystemEnable:
                                    216 ;	libs/stm8l_clk.c: 309: CLK->CSSR |= CLK_CSSR_CSSEN;
      008582 72 10 50 CA      [ 1]  217 	bset	0x50ca, #0
                                    218 ;	libs/stm8l_clk.c: 310: }
      008586 81               [ 4]  219 	ret
                                    220 ;	libs/stm8l_clk.c: 317: void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
                                    221 ;	-----------------------------------------
                                    222 ;	 function CLK_ClockSecuritySytemDeglitchCmd
                                    223 ;	-----------------------------------------
      008587                        224 _CLK_ClockSecuritySytemDeglitchCmd:
      008587 88               [ 1]  225 	push	a
      008588 6B 01            [ 1]  226 	ld	(0x01, sp), a
                                    227 ;	libs/stm8l_clk.c: 325: CLK->CSSR |= CLK_CSSR_CSSDGON;
      00858A C6 50 CA         [ 1]  228 	ld	a, 0x50ca
                                    229 ;	libs/stm8l_clk.c: 322: if (NewState != DISABLE)
      00858D 0D 01            [ 1]  230 	tnz	(0x01, sp)
      00858F 27 07            [ 1]  231 	jreq	00102$
                                    232 ;	libs/stm8l_clk.c: 325: CLK->CSSR |= CLK_CSSR_CSSDGON;
      008591 AA 10            [ 1]  233 	or	a, #0x10
      008593 C7 50 CA         [ 1]  234 	ld	0x50ca, a
      008596 20 05            [ 2]  235 	jra	00104$
      008598                        236 00102$:
                                    237 ;	libs/stm8l_clk.c: 330: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
      008598 A4 EF            [ 1]  238 	and	a, #0xef
      00859A C7 50 CA         [ 1]  239 	ld	0x50ca, a
      00859D                        240 00104$:
                                    241 ;	libs/stm8l_clk.c: 332: }
      00859D 84               [ 1]  242 	pop	a
      00859E 81               [ 4]  243 	ret
                                    244 ;	libs/stm8l_clk.c: 356: void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
                                    245 ;	-----------------------------------------
                                    246 ;	 function CLK_CCOConfig
                                    247 ;	-----------------------------------------
      00859F                        248 _CLK_CCOConfig:
                                    249 ;	libs/stm8l_clk.c: 363: CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
      00859F 1A 03            [ 1]  250 	or	a, (0x03, sp)
      0085A1 C7 50 C5         [ 1]  251 	ld	0x50c5, a
                                    252 ;	libs/stm8l_clk.c: 364: }
      0085A4 85               [ 2]  253 	popw	x
      0085A5 84               [ 1]  254 	pop	a
      0085A6 FC               [ 2]  255 	jp	(x)
                                    256 ;	libs/stm8l_clk.c: 416: void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
                                    257 ;	-----------------------------------------
                                    258 ;	 function CLK_SYSCLKSourceConfig
                                    259 ;	-----------------------------------------
      0085A7                        260 _CLK_SYSCLKSourceConfig:
                                    261 ;	libs/stm8l_clk.c: 422: CLK->SWR = (uint8_t)CLK_SYSCLKSource;
      0085A7 C7 50 C8         [ 1]  262 	ld	0x50c8, a
                                    263 ;	libs/stm8l_clk.c: 423: }
      0085AA 81               [ 4]  264 	ret
                                    265 ;	libs/stm8l_clk.c: 435: CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
                                    266 ;	-----------------------------------------
                                    267 ;	 function CLK_GetSYSCLKSource
                                    268 ;	-----------------------------------------
      0085AB                        269 _CLK_GetSYSCLKSource:
                                    270 ;	libs/stm8l_clk.c: 437: return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
      0085AB C6 50 C7         [ 1]  271 	ld	a, 0x50c7
                                    272 ;	libs/stm8l_clk.c: 438: }
      0085AE 81               [ 4]  273 	ret
                                    274 ;	libs/stm8l_clk.c: 478: uint32_t CLK_GetClockFreq(void)
                                    275 ;	-----------------------------------------
                                    276 ;	 function CLK_GetClockFreq
                                    277 ;	-----------------------------------------
      0085AF                        278 _CLK_GetClockFreq:
      0085AF 52 04            [ 2]  279 	sub	sp, #4
                                    280 ;	libs/stm8l_clk.c: 481: uint32_t sourcefrequency = 0;
      0085B1 5F               [ 1]  281 	clrw	x
      0085B2 1F 03            [ 2]  282 	ldw	(0x03, sp), x
      0085B4 1F 01            [ 2]  283 	ldw	(0x01, sp), x
                                    284 ;	libs/stm8l_clk.c: 486: clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
      0085B6 C6 50 C7         [ 1]  285 	ld	a, 0x50c7
                                    286 ;	libs/stm8l_clk.c: 488: if ( clocksource == CLK_SYSCLKSource_HSI)
      0085B9 A1 01            [ 1]  287 	cp	a, #0x01
      0085BB 26 0C            [ 1]  288 	jrne	00108$
                                    289 ;	libs/stm8l_clk.c: 490: sourcefrequency = HSI_VALUE;
      0085BD AE 24 00         [ 2]  290 	ldw	x, #0x2400
      0085C0 1F 03            [ 2]  291 	ldw	(0x03, sp), x
      0085C2 AE 00 F4         [ 2]  292 	ldw	x, #0x00f4
      0085C5 1F 01            [ 2]  293 	ldw	(0x01, sp), x
      0085C7 20 1C            [ 2]  294 	jra	00109$
      0085C9                        295 00108$:
                                    296 ;	libs/stm8l_clk.c: 492: else if ( clocksource == CLK_SYSCLKSource_LSI)
      0085C9 A1 02            [ 1]  297 	cp	a, #0x02
      0085CB 26 0A            [ 1]  298 	jrne	00105$
                                    299 ;	libs/stm8l_clk.c: 494: sourcefrequency = LSI_VALUE;
      0085CD AE 94 70         [ 2]  300 	ldw	x, #0x9470
      0085D0 1F 03            [ 2]  301 	ldw	(0x03, sp), x
      0085D2 5F               [ 1]  302 	clrw	x
      0085D3 1F 01            [ 2]  303 	ldw	(0x01, sp), x
      0085D5 20 0E            [ 2]  304 	jra	00109$
      0085D7                        305 00105$:
                                    306 ;	libs/stm8l_clk.c: 496: else if ( clocksource == CLK_SYSCLKSource_HSE)
      0085D7 A1 04            [ 1]  307 	cp	a, #0x04
      0085D9 26 0A            [ 1]  308 	jrne	00109$
                                    309 ;	libs/stm8l_clk.c: 498: sourcefrequency = HSE_VALUE;
      0085DB AE 24 00         [ 2]  310 	ldw	x, #0x2400
      0085DE 1F 03            [ 2]  311 	ldw	(0x03, sp), x
      0085E0 AE 00 F4         [ 2]  312 	ldw	x, #0x00f4
      0085E3 1F 01            [ 2]  313 	ldw	(0x01, sp), x
                                    314 ;	libs/stm8l_clk.c: 502: clockfrequency = LSE_VALUE;
      0085E5                        315 00109$:
                                    316 ;	libs/stm8l_clk.c: 506: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
      0085E5 C6 50 C0         [ 1]  317 	ld	a, 0x50c0
      0085E8 A4 07            [ 1]  318 	and	a, #0x07
                                    319 ;	libs/stm8l_clk.c: 507: presc = SYSDivFactor[tmp];
      0085EA 5F               [ 1]  320 	clrw	x
      0085EB 97               [ 1]  321 	ld	xl, a
      0085EC D6 80 90         [ 1]  322 	ld	a, (_SYSDivFactor+0, x)
                                    323 ;	libs/stm8l_clk.c: 510: clockfrequency = sourcefrequency / presc;
      0085EF 5F               [ 1]  324 	clrw	x
      0085F0 97               [ 1]  325 	ld	xl, a
      0085F1 90 5F            [ 1]  326 	clrw	y
      0085F3 89               [ 2]  327 	pushw	x
      0085F4 90 89            [ 2]  328 	pushw	y
      0085F6 1E 07            [ 2]  329 	ldw	x, (0x07, sp)
      0085F8 89               [ 2]  330 	pushw	x
      0085F9 1E 07            [ 2]  331 	ldw	x, (0x07, sp)
      0085FB 89               [ 2]  332 	pushw	x
      0085FC CD 8C F6         [ 4]  333 	call	__divulong
                                    334 ;	libs/stm8l_clk.c: 512: return((uint32_t)clockfrequency);
                                    335 ;	libs/stm8l_clk.c: 513: }
      0085FF 5B 0C            [ 2]  336 	addw	sp, #12
      008601 81               [ 4]  337 	ret
                                    338 ;	libs/stm8l_clk.c: 528: void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
                                    339 ;	-----------------------------------------
                                    340 ;	 function CLK_SYSCLKDivConfig
                                    341 ;	-----------------------------------------
      008602                        342 _CLK_SYSCLKDivConfig:
                                    343 ;	libs/stm8l_clk.c: 533: CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
      008602 C7 50 C0         [ 1]  344 	ld	0x50c0, a
                                    345 ;	libs/stm8l_clk.c: 534: }
      008605 81               [ 4]  346 	ret
                                    347 ;	libs/stm8l_clk.c: 541: void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
                                    348 ;	-----------------------------------------
                                    349 ;	 function CLK_SYSCLKSourceSwitchCmd
                                    350 ;	-----------------------------------------
      008606                        351 _CLK_SYSCLKSourceSwitchCmd:
      008606 88               [ 1]  352 	push	a
      008607 6B 01            [ 1]  353 	ld	(0x01, sp), a
                                    354 ;	libs/stm8l_clk.c: 549: CLK->SWCR |= CLK_SWCR_SWEN;
      008609 C6 50 C9         [ 1]  355 	ld	a, 0x50c9
                                    356 ;	libs/stm8l_clk.c: 546: if (NewState != DISABLE)
      00860C 0D 01            [ 1]  357 	tnz	(0x01, sp)
      00860E 27 07            [ 1]  358 	jreq	00102$
                                    359 ;	libs/stm8l_clk.c: 549: CLK->SWCR |= CLK_SWCR_SWEN;
      008610 AA 02            [ 1]  360 	or	a, #0x02
      008612 C7 50 C9         [ 1]  361 	ld	0x50c9, a
      008615 20 05            [ 2]  362 	jra	00104$
      008617                        363 00102$:
                                    364 ;	libs/stm8l_clk.c: 554: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008617 A4 FD            [ 1]  365 	and	a, #0xfd
      008619 C7 50 C9         [ 1]  366 	ld	0x50c9, a
      00861C                        367 00104$:
                                    368 ;	libs/stm8l_clk.c: 556: }
      00861C 84               [ 1]  369 	pop	a
      00861D 81               [ 4]  370 	ret
                                    371 ;	libs/stm8l_clk.c: 616: void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
                                    372 ;	-----------------------------------------
                                    373 ;	 function CLK_RTCClockConfig
                                    374 ;	-----------------------------------------
      00861E                        375 _CLK_RTCClockConfig:
                                    376 ;	libs/stm8l_clk.c: 623: CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
      00861E 1A 03            [ 1]  377 	or	a, (0x03, sp)
      008620 C7 50 C1         [ 1]  378 	ld	0x50c1, a
                                    379 ;	libs/stm8l_clk.c: 624: }
      008623 85               [ 2]  380 	popw	x
      008624 84               [ 1]  381 	pop	a
      008625 FC               [ 2]  382 	jp	(x)
                                    383 ;	libs/stm8l_clk.c: 635: void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
                                    384 ;	-----------------------------------------
                                    385 ;	 function CLK_BEEPClockConfig
                                    386 ;	-----------------------------------------
      008626                        387 _CLK_BEEPClockConfig:
                                    388 ;	libs/stm8l_clk.c: 641: CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
      008626 C7 50 CB         [ 1]  389 	ld	0x50cb, a
                                    390 ;	libs/stm8l_clk.c: 643: }
      008629 81               [ 4]  391 	ret
                                    392 ;	libs/stm8l_clk.c: 677: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    393 ;	-----------------------------------------
                                    394 ;	 function CLK_PeripheralClockConfig
                                    395 ;	-----------------------------------------
      00862A                        396 _CLK_PeripheralClockConfig:
      00862A 52 02            [ 2]  397 	sub	sp, #2
                                    398 ;	libs/stm8l_clk.c: 686: reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
      00862C 88               [ 1]  399 	push	a
      00862D A4 F0            [ 1]  400 	and	a, #0xf0
      00862F 97               [ 1]  401 	ld	xl, a
      008630 84               [ 1]  402 	pop	a
      008631 90 93            [ 1]  403 	ldw	y, x
                                    404 ;	libs/stm8l_clk.c: 693: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008633 A4 0F            [ 1]  405 	and	a, #0x0f
      008635 88               [ 1]  406 	push	a
      008636 A6 01            [ 1]  407 	ld	a, #0x01
      008638 6B 02            [ 1]  408 	ld	(0x02, sp), a
      00863A 84               [ 1]  409 	pop	a
      00863B 4D               [ 1]  410 	tnz	a
      00863C 27 05            [ 1]  411 	jreq	00144$
      00863E                        412 00143$:
      00863E 08 01            [ 1]  413 	sll	(0x01, sp)
      008640 4A               [ 1]  414 	dec	a
      008641 26 FB            [ 1]  415 	jrne	00143$
      008643                        416 00144$:
                                    417 ;	libs/stm8l_clk.c: 698: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008643 7B 01            [ 1]  418 	ld	a, (0x01, sp)
      008645 43               [ 1]  419 	cpl	a
      008646 6B 02            [ 1]  420 	ld	(0x02, sp), a
                                    421 ;	libs/stm8l_clk.c: 688: if ( reg == 0x00)
      008648 9F               [ 1]  422 	ld	a, xl
      008649 4D               [ 1]  423 	tnz	a
      00864A 26 15            [ 1]  424 	jrne	00114$
                                    425 ;	libs/stm8l_clk.c: 693: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00864C C6 50 C3         [ 1]  426 	ld	a, 0x50c3
                                    427 ;	libs/stm8l_clk.c: 690: if (NewState != DISABLE)
      00864F 0D 05            [ 1]  428 	tnz	(0x05, sp)
      008651 27 07            [ 1]  429 	jreq	00102$
                                    430 ;	libs/stm8l_clk.c: 693: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008653 1A 01            [ 1]  431 	or	a, (0x01, sp)
      008655 C7 50 C3         [ 1]  432 	ld	0x50c3, a
      008658 20 35            [ 2]  433 	jra	00116$
      00865A                        434 00102$:
                                    435 ;	libs/stm8l_clk.c: 698: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00865A 14 02            [ 1]  436 	and	a, (0x02, sp)
      00865C C7 50 C3         [ 1]  437 	ld	0x50c3, a
      00865F 20 2E            [ 2]  438 	jra	00116$
      008661                        439 00114$:
                                    440 ;	libs/stm8l_clk.c: 701: else if (reg == 0x10)
      008661 90 9F            [ 1]  441 	ld	a, yl
      008663 A1 10            [ 1]  442 	cp	a, #0x10
      008665 26 15            [ 1]  443 	jrne	00111$
                                    444 ;	libs/stm8l_clk.c: 706: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008667 C6 50 C4         [ 1]  445 	ld	a, 0x50c4
                                    446 ;	libs/stm8l_clk.c: 703: if (NewState != DISABLE)
      00866A 0D 05            [ 1]  447 	tnz	(0x05, sp)
      00866C 27 07            [ 1]  448 	jreq	00105$
                                    449 ;	libs/stm8l_clk.c: 706: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00866E 1A 01            [ 1]  450 	or	a, (0x01, sp)
      008670 C7 50 C4         [ 1]  451 	ld	0x50c4, a
      008673 20 1A            [ 2]  452 	jra	00116$
      008675                        453 00105$:
                                    454 ;	libs/stm8l_clk.c: 711: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008675 14 02            [ 1]  455 	and	a, (0x02, sp)
      008677 C7 50 C4         [ 1]  456 	ld	0x50c4, a
      00867A 20 13            [ 2]  457 	jra	00116$
      00867C                        458 00111$:
                                    459 ;	libs/stm8l_clk.c: 719: CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00867C C6 50 D0         [ 1]  460 	ld	a, 0x50d0
                                    461 ;	libs/stm8l_clk.c: 716: if (NewState != DISABLE)
      00867F 0D 05            [ 1]  462 	tnz	(0x05, sp)
      008681 27 07            [ 1]  463 	jreq	00108$
                                    464 ;	libs/stm8l_clk.c: 719: CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008683 1A 01            [ 1]  465 	or	a, (0x01, sp)
      008685 C7 50 D0         [ 1]  466 	ld	0x50d0, a
      008688 20 05            [ 2]  467 	jra	00116$
      00868A                        468 00108$:
                                    469 ;	libs/stm8l_clk.c: 724: CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00868A 14 02            [ 1]  470 	and	a, (0x02, sp)
      00868C C7 50 D0         [ 1]  471 	ld	0x50d0, a
      00868F                        472 00116$:
                                    473 ;	libs/stm8l_clk.c: 727: }
      00868F 5B 02            [ 2]  474 	addw	sp, #2
      008691 85               [ 2]  475 	popw	x
      008692 84               [ 1]  476 	pop	a
      008693 FC               [ 2]  477 	jp	(x)
                                    478 ;	libs/stm8l_clk.c: 765: void CLK_LSEClockSecuritySystemEnable(void)
                                    479 ;	-----------------------------------------
                                    480 ;	 function CLK_LSEClockSecuritySystemEnable
                                    481 ;	-----------------------------------------
      008694                        482 _CLK_LSEClockSecuritySystemEnable:
                                    483 ;	libs/stm8l_clk.c: 768: CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
      008694 72 10 51 90      [ 1]  484 	bset	0x5190, #0
                                    485 ;	libs/stm8l_clk.c: 769: }
      008698 81               [ 4]  486 	ret
                                    487 ;	libs/stm8l_clk.c: 777: void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
                                    488 ;	-----------------------------------------
                                    489 ;	 function CLK_RTCCLKSwitchOnLSEFailureEnable
                                    490 ;	-----------------------------------------
      008699                        491 _CLK_RTCCLKSwitchOnLSEFailureEnable:
                                    492 ;	libs/stm8l_clk.c: 780: CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
      008699 72 12 51 90      [ 1]  493 	bset	0x5190, #1
                                    494 ;	libs/stm8l_clk.c: 781: }
      00869D 81               [ 4]  495 	ret
                                    496 ;	libs/stm8l_clk.c: 807: void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
                                    497 ;	-----------------------------------------
                                    498 ;	 function CLK_HaltConfig
                                    499 ;	-----------------------------------------
      00869E                        500 _CLK_HaltConfig:
      00869E 88               [ 1]  501 	push	a
                                    502 ;	libs/stm8l_clk.c: 815: CLK->ICKCR |= (uint8_t)(CLK_Halt);
      00869F AE 50 C2         [ 2]  503 	ldw	x, #0x50c2
      0086A2 88               [ 1]  504 	push	a
      0086A3 F6               [ 1]  505 	ld	a, (x)
      0086A4 6B 02            [ 1]  506 	ld	(0x02, sp), a
      0086A6 84               [ 1]  507 	pop	a
                                    508 ;	libs/stm8l_clk.c: 813: if (NewState != DISABLE)
      0086A7 0D 04            [ 1]  509 	tnz	(0x04, sp)
      0086A9 27 07            [ 1]  510 	jreq	00102$
                                    511 ;	libs/stm8l_clk.c: 815: CLK->ICKCR |= (uint8_t)(CLK_Halt);
      0086AB 1A 01            [ 1]  512 	or	a, (0x01, sp)
      0086AD C7 50 C2         [ 1]  513 	ld	0x50c2, a
      0086B0 20 06            [ 2]  514 	jra	00104$
      0086B2                        515 00102$:
                                    516 ;	libs/stm8l_clk.c: 819: CLK->ICKCR &= (uint8_t)(~CLK_Halt);
      0086B2 43               [ 1]  517 	cpl	a
      0086B3 14 01            [ 1]  518 	and	a, (0x01, sp)
      0086B5 C7 50 C2         [ 1]  519 	ld	0x50c2, a
      0086B8                        520 00104$:
                                    521 ;	libs/stm8l_clk.c: 821: }
      0086B8 84               [ 1]  522 	pop	a
      0086B9 85               [ 2]  523 	popw	x
      0086BA 84               [ 1]  524 	pop	a
      0086BB FC               [ 2]  525 	jp	(x)
                                    526 ;	libs/stm8l_clk.c: 831: void CLK_MainRegulatorCmd(FunctionalState NewState)
                                    527 ;	-----------------------------------------
                                    528 ;	 function CLK_MainRegulatorCmd
                                    529 ;	-----------------------------------------
      0086BC                        530 _CLK_MainRegulatorCmd:
      0086BC 88               [ 1]  531 	push	a
      0086BD 6B 01            [ 1]  532 	ld	(0x01, sp), a
                                    533 ;	libs/stm8l_clk.c: 839: CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
      0086BF C6 50 CF         [ 1]  534 	ld	a, 0x50cf
                                    535 ;	libs/stm8l_clk.c: 836: if (NewState != DISABLE)
      0086C2 0D 01            [ 1]  536 	tnz	(0x01, sp)
      0086C4 27 07            [ 1]  537 	jreq	00102$
                                    538 ;	libs/stm8l_clk.c: 839: CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
      0086C6 A4 FD            [ 1]  539 	and	a, #0xfd
      0086C8 C7 50 CF         [ 1]  540 	ld	0x50cf, a
      0086CB 20 05            [ 2]  541 	jra	00104$
      0086CD                        542 00102$:
                                    543 ;	libs/stm8l_clk.c: 844: CLK->REGCSR |= CLK_REGCSR_REGOFF;
      0086CD AA 02            [ 1]  544 	or	a, #0x02
      0086CF C7 50 CF         [ 1]  545 	ld	0x50cf, a
      0086D2                        546 00104$:
                                    547 ;	libs/stm8l_clk.c: 846: }
      0086D2 84               [ 1]  548 	pop	a
      0086D3 81               [ 4]  549 	ret
                                    550 ;	libs/stm8l_clk.c: 875: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    551 ;	-----------------------------------------
                                    552 ;	 function CLK_ITConfig
                                    553 ;	-----------------------------------------
      0086D4                        554 _CLK_ITConfig:
      0086D4 88               [ 1]  555 	push	a
                                    556 ;	libs/stm8l_clk.c: 884: if (CLK_IT == CLK_IT_SWIF)
      0086D5 A1 1C            [ 1]  557 	cp	a, #0x1c
      0086D7 26 07            [ 1]  558 	jrne	00144$
      0086D9 88               [ 1]  559 	push	a
      0086DA A6 01            [ 1]  560 	ld	a, #0x01
      0086DC 6B 02            [ 1]  561 	ld	(0x02, sp), a
      0086DE 84               [ 1]  562 	pop	a
      0086DF C5                     563 	.byte 0xc5
      0086E0                        564 00144$:
      0086E0 0F 01            [ 1]  565 	clr	(0x01, sp)
      0086E2                        566 00145$:
                                    567 ;	libs/stm8l_clk.c: 889: else if (CLK_IT == CLK_IT_LSECSSF)
      0086E2 A0 2C            [ 1]  568 	sub	a, #0x2c
      0086E4 26 02            [ 1]  569 	jrne	00147$
      0086E6 4C               [ 1]  570 	inc	a
      0086E7 21                     571 	.byte 0x21
      0086E8                        572 00147$:
      0086E8 4F               [ 1]  573 	clr	a
      0086E9                        574 00148$:
                                    575 ;	libs/stm8l_clk.c: 882: if (NewState != DISABLE)
      0086E9 0D 04            [ 1]  576 	tnz	(0x04, sp)
      0086EB 27 25            [ 1]  577 	jreq	00114$
                                    578 ;	libs/stm8l_clk.c: 884: if (CLK_IT == CLK_IT_SWIF)
      0086ED 0D 01            [ 1]  579 	tnz	(0x01, sp)
      0086EF 27 0A            [ 1]  580 	jreq	00105$
                                    581 ;	libs/stm8l_clk.c: 887: CLK->SWCR |= CLK_SWCR_SWIEN;
      0086F1 C6 50 C9         [ 1]  582 	ld	a, 0x50c9
      0086F4 AA 04            [ 1]  583 	or	a, #0x04
      0086F6 C7 50 C9         [ 1]  584 	ld	0x50c9, a
      0086F9 20 3A            [ 2]  585 	jra	00116$
      0086FB                        586 00105$:
                                    587 ;	libs/stm8l_clk.c: 889: else if (CLK_IT == CLK_IT_LSECSSF)
      0086FB 4D               [ 1]  588 	tnz	a
      0086FC 27 0A            [ 1]  589 	jreq	00102$
                                    590 ;	libs/stm8l_clk.c: 892: CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
      0086FE C6 51 90         [ 1]  591 	ld	a, 0x5190
      008701 AA 04            [ 1]  592 	or	a, #0x04
      008703 C7 51 90         [ 1]  593 	ld	0x5190, a
      008706 20 2D            [ 2]  594 	jra	00116$
      008708                        595 00102$:
                                    596 ;	libs/stm8l_clk.c: 897: CLK->CSSR |= CLK_CSSR_CSSDIE;
      008708 C6 50 CA         [ 1]  597 	ld	a, 0x50ca
      00870B AA 04            [ 1]  598 	or	a, #0x04
      00870D C7 50 CA         [ 1]  599 	ld	0x50ca, a
      008710 20 23            [ 2]  600 	jra	00116$
      008712                        601 00114$:
                                    602 ;	libs/stm8l_clk.c: 902: if (CLK_IT == CLK_IT_SWIF)
      008712 0D 01            [ 1]  603 	tnz	(0x01, sp)
      008714 27 0A            [ 1]  604 	jreq	00111$
                                    605 ;	libs/stm8l_clk.c: 905: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      008716 C6 50 C9         [ 1]  606 	ld	a, 0x50c9
      008719 A4 FB            [ 1]  607 	and	a, #0xfb
      00871B C7 50 C9         [ 1]  608 	ld	0x50c9, a
      00871E 20 15            [ 2]  609 	jra	00116$
      008720                        610 00111$:
                                    611 ;	libs/stm8l_clk.c: 907: else if (CLK_IT == CLK_IT_LSECSSF)
      008720 4D               [ 1]  612 	tnz	a
      008721 27 0A            [ 1]  613 	jreq	00108$
                                    614 ;	libs/stm8l_clk.c: 910: CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
      008723 C6 51 90         [ 1]  615 	ld	a, 0x5190
      008726 A4 FB            [ 1]  616 	and	a, #0xfb
      008728 C7 51 90         [ 1]  617 	ld	0x5190, a
      00872B 20 08            [ 2]  618 	jra	00116$
      00872D                        619 00108$:
                                    620 ;	libs/stm8l_clk.c: 915: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      00872D C6 50 CA         [ 1]  621 	ld	a, 0x50ca
      008730 A4 FB            [ 1]  622 	and	a, #0xfb
      008732 C7 50 CA         [ 1]  623 	ld	0x50ca, a
      008735                        624 00116$:
                                    625 ;	libs/stm8l_clk.c: 918: }
      008735 84               [ 1]  626 	pop	a
      008736 85               [ 2]  627 	popw	x
      008737 84               [ 1]  628 	pop	a
      008738 FC               [ 2]  629 	jp	(x)
                                    630 ;	libs/stm8l_clk.c: 945: FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
                                    631 ;	-----------------------------------------
                                    632 ;	 function CLK_GetFlagStatus
                                    633 ;	-----------------------------------------
      008739                        634 _CLK_GetFlagStatus:
      008739 88               [ 1]  635 	push	a
                                    636 ;	libs/stm8l_clk.c: 955: reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
      00873A 97               [ 1]  637 	ld	xl, a
      00873B A4 F0            [ 1]  638 	and	a, #0xf0
                                    639 ;	libs/stm8l_clk.c: 958: pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
      00873D 88               [ 1]  640 	push	a
      00873E 9F               [ 1]  641 	ld	a, xl
      00873F A4 0F            [ 1]  642 	and	a, #0x0f
      008741 97               [ 1]  643 	ld	xl, a
      008742 84               [ 1]  644 	pop	a
                                    645 ;	libs/stm8l_clk.c: 960: if (reg == 0x00) /* The flag to check is in CRTC Rregister */
      008743 4D               [ 1]  646 	tnz	a
      008744 26 05            [ 1]  647 	jrne	00123$
                                    648 ;	libs/stm8l_clk.c: 962: reg = CLK->CRTCR;
      008746 C6 50 C1         [ 1]  649 	ld	a, 0x50c1
      008749 20 42            [ 2]  650 	jra	00124$
      00874B                        651 00123$:
                                    652 ;	libs/stm8l_clk.c: 964: else if (reg == 0x10) /* The flag to check is in ICKCR register */
      00874B A1 10            [ 1]  653 	cp	a, #0x10
      00874D 26 05            [ 1]  654 	jrne	00120$
                                    655 ;	libs/stm8l_clk.c: 966: reg = CLK->ICKCR;
      00874F C6 50 C2         [ 1]  656 	ld	a, 0x50c2
      008752 20 39            [ 2]  657 	jra	00124$
      008754                        658 00120$:
                                    659 ;	libs/stm8l_clk.c: 968: else if (reg == 0x20) /* The flag to check is in CCOR register */
      008754 A1 20            [ 1]  660 	cp	a, #0x20
      008756 26 05            [ 1]  661 	jrne	00117$
                                    662 ;	libs/stm8l_clk.c: 970: reg = CLK->CCOR;
      008758 C6 50 C5         [ 1]  663 	ld	a, 0x50c5
      00875B 20 30            [ 2]  664 	jra	00124$
      00875D                        665 00117$:
                                    666 ;	libs/stm8l_clk.c: 972: else if (reg == 0x30) /* The flag to check is in ECKCR register */
      00875D A1 30            [ 1]  667 	cp	a, #0x30
      00875F 26 05            [ 1]  668 	jrne	00114$
                                    669 ;	libs/stm8l_clk.c: 974: reg = CLK->ECKCR;
      008761 C6 50 C6         [ 1]  670 	ld	a, 0x50c6
      008764 20 27            [ 2]  671 	jra	00124$
      008766                        672 00114$:
                                    673 ;	libs/stm8l_clk.c: 976: else if (reg == 0x40) /* The flag to check is in SWCR register */
      008766 A1 40            [ 1]  674 	cp	a, #0x40
      008768 26 05            [ 1]  675 	jrne	00111$
                                    676 ;	libs/stm8l_clk.c: 978: reg = CLK->SWCR;
      00876A C6 50 C9         [ 1]  677 	ld	a, 0x50c9
      00876D 20 1E            [ 2]  678 	jra	00124$
      00876F                        679 00111$:
                                    680 ;	libs/stm8l_clk.c: 980: else if (reg == 0x50) /* The flag to check is in CSSR register */
      00876F A1 50            [ 1]  681 	cp	a, #0x50
      008771 26 05            [ 1]  682 	jrne	00108$
                                    683 ;	libs/stm8l_clk.c: 982: reg = CLK->CSSR;
      008773 C6 50 CA         [ 1]  684 	ld	a, 0x50ca
      008776 20 15            [ 2]  685 	jra	00124$
      008778                        686 00108$:
                                    687 ;	libs/stm8l_clk.c: 984: else if (reg == 0x70) /* The flag to check is in REGCSR register */
      008778 A1 70            [ 1]  688 	cp	a, #0x70
      00877A 26 05            [ 1]  689 	jrne	00105$
                                    690 ;	libs/stm8l_clk.c: 986: reg = CLK->REGCSR;
      00877C C6 50 CF         [ 1]  691 	ld	a, 0x50cf
      00877F 20 0C            [ 2]  692 	jra	00124$
      008781                        693 00105$:
                                    694 ;	libs/stm8l_clk.c: 988: else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
      008781 A1 80            [ 1]  695 	cp	a, #0x80
      008783 26 05            [ 1]  696 	jrne	00102$
                                    697 ;	libs/stm8l_clk.c: 990: reg = CSSLSE->CSR;
      008785 C6 51 90         [ 1]  698 	ld	a, 0x5190
      008788 20 03            [ 2]  699 	jra	00124$
      00878A                        700 00102$:
                                    701 ;	libs/stm8l_clk.c: 994: reg = CLK->CBEEPR;
      00878A C6 50 CB         [ 1]  702 	ld	a, 0x50cb
      00878D                        703 00124$:
                                    704 ;	libs/stm8l_clk.c: 998: if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
      00878D 88               [ 1]  705 	push	a
      00878E A6 01            [ 1]  706 	ld	a, #0x01
      008790 6B 02            [ 1]  707 	ld	(0x02, sp), a
      008792 9F               [ 1]  708 	ld	a, xl
      008793 4D               [ 1]  709 	tnz	a
      008794 27 05            [ 1]  710 	jreq	00198$
      008796                        711 00197$:
      008796 08 02            [ 1]  712 	sll	(0x02, sp)
      008798 4A               [ 1]  713 	dec	a
      008799 26 FB            [ 1]  714 	jrne	00197$
      00879B                        715 00198$:
      00879B 84               [ 1]  716 	pop	a
      00879C 14 01            [ 1]  717 	and	a, (0x01, sp)
      00879E 27 03            [ 1]  718 	jreq	00126$
                                    719 ;	libs/stm8l_clk.c: 1000: bitstatus = SET;
      0087A0 A6 01            [ 1]  720 	ld	a, #0x01
                                    721 ;	libs/stm8l_clk.c: 1004: bitstatus = RESET;
      0087A2 21                     722 	.byte 0x21
      0087A3                        723 00126$:
      0087A3 4F               [ 1]  724 	clr	a
      0087A4                        725 00127$:
                                    726 ;	libs/stm8l_clk.c: 1008: return((FlagStatus)bitstatus);
                                    727 ;	libs/stm8l_clk.c: 1009: }
      0087A4 5B 01            [ 2]  728 	addw	sp, #1
      0087A6 81               [ 4]  729 	ret
                                    730 ;	libs/stm8l_clk.c: 1016: void CLK_ClearFlag(void)
                                    731 ;	-----------------------------------------
                                    732 ;	 function CLK_ClearFlag
                                    733 ;	-----------------------------------------
      0087A7                        734 _CLK_ClearFlag:
                                    735 ;	libs/stm8l_clk.c: 1020: CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
      0087A7 72 17 51 90      [ 1]  736 	bres	0x5190, #3
                                    737 ;	libs/stm8l_clk.c: 1021: }
      0087AB 81               [ 4]  738 	ret
                                    739 ;	libs/stm8l_clk.c: 1032: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    740 ;	-----------------------------------------
                                    741 ;	 function CLK_GetITStatus
                                    742 ;	-----------------------------------------
      0087AC                        743 _CLK_GetITStatus:
      0087AC 88               [ 1]  744 	push	a
                                    745 ;	libs/stm8l_clk.c: 1040: if (CLK_IT == CLK_IT_SWIF)
      0087AD 6B 01            [ 1]  746 	ld	(0x01, sp), a
      0087AF A1 1C            [ 1]  747 	cp	a, #0x1c
      0087B1 26 0F            [ 1]  748 	jrne	00114$
                                    749 ;	libs/stm8l_clk.c: 1043: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0087B3 C6 50 C9         [ 1]  750 	ld	a, 0x50c9
      0087B6 14 01            [ 1]  751 	and	a, (0x01, sp)
                                    752 ;	libs/stm8l_clk.c: 1045: bitstatus = SET;
      0087B8 A0 0C            [ 1]  753 	sub	a, #0x0c
      0087BA 26 03            [ 1]  754 	jrne	00102$
      0087BC 4C               [ 1]  755 	inc	a
      0087BD 20 24            [ 2]  756 	jra	00115$
      0087BF                        757 00102$:
                                    758 ;	libs/stm8l_clk.c: 1049: bitstatus = RESET;
      0087BF 4F               [ 1]  759 	clr	a
      0087C0 20 21            [ 2]  760 	jra	00115$
      0087C2                        761 00114$:
                                    762 ;	libs/stm8l_clk.c: 1052: else if (CLK_IT == CLK_IT_LSECSSF)
      0087C2 7B 01            [ 1]  763 	ld	a, (0x01, sp)
      0087C4 A1 2C            [ 1]  764 	cp	a, #0x2c
      0087C6 26 0F            [ 1]  765 	jrne	00111$
                                    766 ;	libs/stm8l_clk.c: 1055: if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0087C8 C6 51 90         [ 1]  767 	ld	a, 0x5190
      0087CB 14 01            [ 1]  768 	and	a, (0x01, sp)
                                    769 ;	libs/stm8l_clk.c: 1057: bitstatus = SET;
      0087CD A0 0C            [ 1]  770 	sub	a, #0x0c
      0087CF 26 03            [ 1]  771 	jrne	00105$
      0087D1 4C               [ 1]  772 	inc	a
      0087D2 20 0F            [ 2]  773 	jra	00115$
      0087D4                        774 00105$:
                                    775 ;	libs/stm8l_clk.c: 1061: bitstatus = RESET;
      0087D4 4F               [ 1]  776 	clr	a
      0087D5 20 0C            [ 2]  777 	jra	00115$
      0087D7                        778 00111$:
                                    779 ;	libs/stm8l_clk.c: 1067: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0087D7 C6 50 CA         [ 1]  780 	ld	a, 0x50ca
      0087DA 14 01            [ 1]  781 	and	a, (0x01, sp)
                                    782 ;	libs/stm8l_clk.c: 1069: bitstatus = SET;
      0087DC A0 0C            [ 1]  783 	sub	a, #0x0c
      0087DE 26 02            [ 1]  784 	jrne	00108$
      0087E0 4C               [ 1]  785 	inc	a
                                    786 ;	libs/stm8l_clk.c: 1073: bitstatus = RESET;
      0087E1 21                     787 	.byte 0x21
      0087E2                        788 00108$:
      0087E2 4F               [ 1]  789 	clr	a
      0087E3                        790 00115$:
                                    791 ;	libs/stm8l_clk.c: 1078: return bitstatus;
                                    792 ;	libs/stm8l_clk.c: 1079: }
      0087E3 5B 01            [ 2]  793 	addw	sp, #1
      0087E5 81               [ 4]  794 	ret
                                    795 ;	libs/stm8l_clk.c: 1089: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    796 ;	-----------------------------------------
                                    797 ;	 function CLK_ClearITPendingBit
                                    798 ;	-----------------------------------------
      0087E6                        799 _CLK_ClearITPendingBit:
                                    800 ;	libs/stm8l_clk.c: 1095: if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
      0087E6 A4 F0            [ 1]  801 	and	a, #0xf0
      0087E8 A1 20            [ 1]  802 	cp	a, #0x20
      0087EA 26 05            [ 1]  803 	jrne	00102$
                                    804 ;	libs/stm8l_clk.c: 1098: CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
      0087EC 72 17 51 90      [ 1]  805 	bres	0x5190, #3
      0087F0 81               [ 4]  806 	ret
      0087F1                        807 00102$:
                                    808 ;	libs/stm8l_clk.c: 1103: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      0087F1 72 17 50 C9      [ 1]  809 	bres	0x50c9, #3
                                    810 ;	libs/stm8l_clk.c: 1105: }
      0087F5 81               [ 4]  811 	ret
                                    812 	.area CODE
                                    813 	.area CONST
      008090                        814 _SYSDivFactor:
      008090 01                     815 	.db #0x01	; 1
      008091 02                     816 	.db #0x02	; 2
      008092 04                     817 	.db #0x04	; 4
      008093 08                     818 	.db #0x08	; 8
      008094 10                     819 	.db #0x10	; 16
                                    820 	.area INITIALIZER
                                    821 	.area CABS (ABS)
