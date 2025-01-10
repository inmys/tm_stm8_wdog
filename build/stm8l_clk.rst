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
      008569                         79 _CLK_DeInit:
                                     80 ;	libs/stm8l_clk.c: 122: CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
      008569 35 11 50 C2      [ 1]   81 	mov	0x50c2+0, #0x11
                                     82 ;	libs/stm8l_clk.c: 123: CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
      00856D 35 00 50 C6      [ 1]   83 	mov	0x50c6+0, #0x00
                                     84 ;	libs/stm8l_clk.c: 124: CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
      008571 35 00 50 C1      [ 1]   85 	mov	0x50c1+0, #0x00
                                     86 ;	libs/stm8l_clk.c: 125: CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
      008575 35 00 50 CB      [ 1]   87 	mov	0x50cb+0, #0x00
                                     88 ;	libs/stm8l_clk.c: 126: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008579 35 01 50 C8      [ 1]   89 	mov	0x50c8+0, #0x01
                                     90 ;	libs/stm8l_clk.c: 127: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      00857D 35 00 50 C9      [ 1]   91 	mov	0x50c9+0, #0x00
                                     92 ;	libs/stm8l_clk.c: 128: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008581 35 03 50 C0      [ 1]   93 	mov	0x50c0+0, #0x03
                                     94 ;	libs/stm8l_clk.c: 129: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008585 35 00 50 C3      [ 1]   95 	mov	0x50c3+0, #0x00
                                     96 ;	libs/stm8l_clk.c: 130: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008589 35 80 50 C4      [ 1]   97 	mov	0x50c4+0, #0x80
                                     98 ;	libs/stm8l_clk.c: 131: CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
      00858D 35 00 50 D0      [ 1]   99 	mov	0x50d0+0, #0x00
                                    100 ;	libs/stm8l_clk.c: 132: CLK->CSSR  = CLK_CSSR_RESET_VALUE;
      008591 35 00 50 CA      [ 1]  101 	mov	0x50ca+0, #0x00
                                    102 ;	libs/stm8l_clk.c: 133: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008595 35 00 50 C5      [ 1]  103 	mov	0x50c5+0, #0x00
                                    104 ;	libs/stm8l_clk.c: 134: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008599 35 00 50 CD      [ 1]  105 	mov	0x50cd+0, #0x00
                                    106 ;	libs/stm8l_clk.c: 135: CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
      00859D 35 00 50 CC      [ 1]  107 	mov	0x50cc+0, #0x00
                                    108 ;	libs/stm8l_clk.c: 136: CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
      0085A1 35 00 50 CE      [ 1]  109 	mov	0x50ce+0, #0x00
                                    110 ;	libs/stm8l_clk.c: 137: CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
      0085A5 35 B9 50 CF      [ 1]  111 	mov	0x50cf+0, #0xb9
                                    112 ;	libs/stm8l_clk.c: 138: }
      0085A9 81               [ 4]  113 	ret
                                    114 ;	libs/stm8l_clk.c: 160: void CLK_HSICmd(FunctionalState NewState)
                                    115 ;	-----------------------------------------
                                    116 ;	 function CLK_HSICmd
                                    117 ;	-----------------------------------------
      0085AA                        118 _CLK_HSICmd:
      0085AA 88               [ 1]  119 	push	a
      0085AB 6B 01            [ 1]  120 	ld	(0x01, sp), a
                                    121 ;	libs/stm8l_clk.c: 168: CLK->ICKCR |= CLK_ICKCR_HSION;
      0085AD C6 50 C2         [ 1]  122 	ld	a, 0x50c2
                                    123 ;	libs/stm8l_clk.c: 165: if (NewState != DISABLE)
      0085B0 0D 01            [ 1]  124 	tnz	(0x01, sp)
      0085B2 27 07            [ 1]  125 	jreq	00102$
                                    126 ;	libs/stm8l_clk.c: 168: CLK->ICKCR |= CLK_ICKCR_HSION;
      0085B4 AA 01            [ 1]  127 	or	a, #0x01
      0085B6 C7 50 C2         [ 1]  128 	ld	0x50c2, a
      0085B9 20 05            [ 2]  129 	jra	00104$
      0085BB                        130 00102$:
                                    131 ;	libs/stm8l_clk.c: 173: CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
      0085BB A4 FE            [ 1]  132 	and	a, #0xfe
      0085BD C7 50 C2         [ 1]  133 	ld	0x50c2, a
      0085C0                        134 00104$:
                                    135 ;	libs/stm8l_clk.c: 175: }
      0085C0 84               [ 1]  136 	pop	a
      0085C1 81               [ 4]  137 	ret
                                    138 ;	libs/stm8l_clk.c: 188: void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
                                    139 ;	-----------------------------------------
                                    140 ;	 function CLK_AdjustHSICalibrationValue
                                    141 ;	-----------------------------------------
      0085C2                        142 _CLK_AdjustHSICalibrationValue:
                                    143 ;	libs/stm8l_clk.c: 191: CLK->HSIUNLCKR = 0xAC;
      0085C2 35 AC 50 CE      [ 1]  144 	mov	0x50ce+0, #0xac
                                    145 ;	libs/stm8l_clk.c: 192: CLK->HSIUNLCKR = 0x35;
      0085C6 35 35 50 CE      [ 1]  146 	mov	0x50ce+0, #0x35
                                    147 ;	libs/stm8l_clk.c: 195: CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
      0085CA C7 50 CD         [ 1]  148 	ld	0x50cd, a
                                    149 ;	libs/stm8l_clk.c: 196: }
      0085CD 81               [ 4]  150 	ret
                                    151 ;	libs/stm8l_clk.c: 212: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      0085CE                        155 _CLK_LSICmd:
      0085CE 88               [ 1]  156 	push	a
      0085CF 6B 01            [ 1]  157 	ld	(0x01, sp), a
                                    158 ;	libs/stm8l_clk.c: 221: CLK->ICKCR |= CLK_ICKCR_LSION;
      0085D1 C6 50 C2         [ 1]  159 	ld	a, 0x50c2
                                    160 ;	libs/stm8l_clk.c: 218: if (NewState != DISABLE)
      0085D4 0D 01            [ 1]  161 	tnz	(0x01, sp)
      0085D6 27 07            [ 1]  162 	jreq	00102$
                                    163 ;	libs/stm8l_clk.c: 221: CLK->ICKCR |= CLK_ICKCR_LSION;
      0085D8 AA 04            [ 1]  164 	or	a, #0x04
      0085DA C7 50 C2         [ 1]  165 	ld	0x50c2, a
      0085DD 20 05            [ 2]  166 	jra	00104$
      0085DF                        167 00102$:
                                    168 ;	libs/stm8l_clk.c: 226: CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
      0085DF A4 FB            [ 1]  169 	and	a, #0xfb
      0085E1 C7 50 C2         [ 1]  170 	ld	0x50c2, a
      0085E4                        171 00104$:
                                    172 ;	libs/stm8l_clk.c: 228: }
      0085E4 84               [ 1]  173 	pop	a
      0085E5 81               [ 4]  174 	ret
                                    175 ;	libs/stm8l_clk.c: 249: void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
                                    176 ;	-----------------------------------------
                                    177 ;	 function CLK_HSEConfig
                                    178 ;	-----------------------------------------
      0085E6                        179 _CLK_HSEConfig:
      0085E6 88               [ 1]  180 	push	a
      0085E7 6B 01            [ 1]  181 	ld	(0x01, sp), a
                                    182 ;	libs/stm8l_clk.c: 256: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
      0085E9 72 11 50 C6      [ 1]  183 	bres	0x50c6, #0
                                    184 ;	libs/stm8l_clk.c: 259: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
      0085ED 72 19 50 C6      [ 1]  185 	bres	0x50c6, #4
                                    186 ;	libs/stm8l_clk.c: 262: CLK->ECKCR |= (uint8_t)CLK_HSE;
      0085F1 C6 50 C6         [ 1]  187 	ld	a, 0x50c6
      0085F4 1A 01            [ 1]  188 	or	a, (0x01, sp)
      0085F6 C7 50 C6         [ 1]  189 	ld	0x50c6, a
                                    190 ;	libs/stm8l_clk.c: 263: }
      0085F9 84               [ 1]  191 	pop	a
      0085FA 81               [ 4]  192 	ret
                                    193 ;	libs/stm8l_clk.c: 280: void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
                                    194 ;	-----------------------------------------
                                    195 ;	 function CLK_LSEConfig
                                    196 ;	-----------------------------------------
      0085FB                        197 _CLK_LSEConfig:
      0085FB 88               [ 1]  198 	push	a
      0085FC 6B 01            [ 1]  199 	ld	(0x01, sp), a
                                    200 ;	libs/stm8l_clk.c: 287: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
      0085FE 72 15 50 C6      [ 1]  201 	bres	0x50c6, #2
                                    202 ;	libs/stm8l_clk.c: 290: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
      008602 72 1B 50 C6      [ 1]  203 	bres	0x50c6, #5
                                    204 ;	libs/stm8l_clk.c: 293: CLK->ECKCR |= (uint8_t)CLK_LSE;
      008606 C6 50 C6         [ 1]  205 	ld	a, 0x50c6
      008609 1A 01            [ 1]  206 	or	a, (0x01, sp)
      00860B C7 50 C6         [ 1]  207 	ld	0x50c6, a
                                    208 ;	libs/stm8l_clk.c: 295: }
      00860E 84               [ 1]  209 	pop	a
      00860F 81               [ 4]  210 	ret
                                    211 ;	libs/stm8l_clk.c: 306: void CLK_ClockSecuritySystemEnable(void)
                                    212 ;	-----------------------------------------
                                    213 ;	 function CLK_ClockSecuritySystemEnable
                                    214 ;	-----------------------------------------
      008610                        215 _CLK_ClockSecuritySystemEnable:
                                    216 ;	libs/stm8l_clk.c: 309: CLK->CSSR |= CLK_CSSR_CSSEN;
      008610 72 10 50 CA      [ 1]  217 	bset	0x50ca, #0
                                    218 ;	libs/stm8l_clk.c: 310: }
      008614 81               [ 4]  219 	ret
                                    220 ;	libs/stm8l_clk.c: 317: void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
                                    221 ;	-----------------------------------------
                                    222 ;	 function CLK_ClockSecuritySytemDeglitchCmd
                                    223 ;	-----------------------------------------
      008615                        224 _CLK_ClockSecuritySytemDeglitchCmd:
      008615 88               [ 1]  225 	push	a
      008616 6B 01            [ 1]  226 	ld	(0x01, sp), a
                                    227 ;	libs/stm8l_clk.c: 325: CLK->CSSR |= CLK_CSSR_CSSDGON;
      008618 C6 50 CA         [ 1]  228 	ld	a, 0x50ca
                                    229 ;	libs/stm8l_clk.c: 322: if (NewState != DISABLE)
      00861B 0D 01            [ 1]  230 	tnz	(0x01, sp)
      00861D 27 07            [ 1]  231 	jreq	00102$
                                    232 ;	libs/stm8l_clk.c: 325: CLK->CSSR |= CLK_CSSR_CSSDGON;
      00861F AA 10            [ 1]  233 	or	a, #0x10
      008621 C7 50 CA         [ 1]  234 	ld	0x50ca, a
      008624 20 05            [ 2]  235 	jra	00104$
      008626                        236 00102$:
                                    237 ;	libs/stm8l_clk.c: 330: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
      008626 A4 EF            [ 1]  238 	and	a, #0xef
      008628 C7 50 CA         [ 1]  239 	ld	0x50ca, a
      00862B                        240 00104$:
                                    241 ;	libs/stm8l_clk.c: 332: }
      00862B 84               [ 1]  242 	pop	a
      00862C 81               [ 4]  243 	ret
                                    244 ;	libs/stm8l_clk.c: 356: void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
                                    245 ;	-----------------------------------------
                                    246 ;	 function CLK_CCOConfig
                                    247 ;	-----------------------------------------
      00862D                        248 _CLK_CCOConfig:
                                    249 ;	libs/stm8l_clk.c: 363: CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
      00862D 1A 03            [ 1]  250 	or	a, (0x03, sp)
      00862F C7 50 C5         [ 1]  251 	ld	0x50c5, a
                                    252 ;	libs/stm8l_clk.c: 364: }
      008632 85               [ 2]  253 	popw	x
      008633 84               [ 1]  254 	pop	a
      008634 FC               [ 2]  255 	jp	(x)
                                    256 ;	libs/stm8l_clk.c: 416: void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
                                    257 ;	-----------------------------------------
                                    258 ;	 function CLK_SYSCLKSourceConfig
                                    259 ;	-----------------------------------------
      008635                        260 _CLK_SYSCLKSourceConfig:
                                    261 ;	libs/stm8l_clk.c: 422: CLK->SWR = (uint8_t)CLK_SYSCLKSource;
      008635 C7 50 C8         [ 1]  262 	ld	0x50c8, a
                                    263 ;	libs/stm8l_clk.c: 423: }
      008638 81               [ 4]  264 	ret
                                    265 ;	libs/stm8l_clk.c: 435: CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
                                    266 ;	-----------------------------------------
                                    267 ;	 function CLK_GetSYSCLKSource
                                    268 ;	-----------------------------------------
      008639                        269 _CLK_GetSYSCLKSource:
                                    270 ;	libs/stm8l_clk.c: 437: return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
      008639 C6 50 C7         [ 1]  271 	ld	a, 0x50c7
                                    272 ;	libs/stm8l_clk.c: 438: }
      00863C 81               [ 4]  273 	ret
                                    274 ;	libs/stm8l_clk.c: 478: uint32_t CLK_GetClockFreq(void)
                                    275 ;	-----------------------------------------
                                    276 ;	 function CLK_GetClockFreq
                                    277 ;	-----------------------------------------
      00863D                        278 _CLK_GetClockFreq:
      00863D 52 04            [ 2]  279 	sub	sp, #4
                                    280 ;	libs/stm8l_clk.c: 481: uint32_t sourcefrequency = 0;
      00863F 5F               [ 1]  281 	clrw	x
      008640 1F 03            [ 2]  282 	ldw	(0x03, sp), x
      008642 1F 01            [ 2]  283 	ldw	(0x01, sp), x
                                    284 ;	libs/stm8l_clk.c: 486: clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
      008644 C6 50 C7         [ 1]  285 	ld	a, 0x50c7
                                    286 ;	libs/stm8l_clk.c: 488: if ( clocksource == CLK_SYSCLKSource_HSI)
      008647 A1 01            [ 1]  287 	cp	a, #0x01
      008649 26 0C            [ 1]  288 	jrne	00108$
                                    289 ;	libs/stm8l_clk.c: 490: sourcefrequency = HSI_VALUE;
      00864B AE 24 00         [ 2]  290 	ldw	x, #0x2400
      00864E 1F 03            [ 2]  291 	ldw	(0x03, sp), x
      008650 AE 00 F4         [ 2]  292 	ldw	x, #0x00f4
      008653 1F 01            [ 2]  293 	ldw	(0x01, sp), x
      008655 20 1C            [ 2]  294 	jra	00109$
      008657                        295 00108$:
                                    296 ;	libs/stm8l_clk.c: 492: else if ( clocksource == CLK_SYSCLKSource_LSI)
      008657 A1 02            [ 1]  297 	cp	a, #0x02
      008659 26 0A            [ 1]  298 	jrne	00105$
                                    299 ;	libs/stm8l_clk.c: 494: sourcefrequency = LSI_VALUE;
      00865B AE 94 70         [ 2]  300 	ldw	x, #0x9470
      00865E 1F 03            [ 2]  301 	ldw	(0x03, sp), x
      008660 5F               [ 1]  302 	clrw	x
      008661 1F 01            [ 2]  303 	ldw	(0x01, sp), x
      008663 20 0E            [ 2]  304 	jra	00109$
      008665                        305 00105$:
                                    306 ;	libs/stm8l_clk.c: 496: else if ( clocksource == CLK_SYSCLKSource_HSE)
      008665 A1 04            [ 1]  307 	cp	a, #0x04
      008667 26 0A            [ 1]  308 	jrne	00109$
                                    309 ;	libs/stm8l_clk.c: 498: sourcefrequency = HSE_VALUE;
      008669 AE 24 00         [ 2]  310 	ldw	x, #0x2400
      00866C 1F 03            [ 2]  311 	ldw	(0x03, sp), x
      00866E AE 00 F4         [ 2]  312 	ldw	x, #0x00f4
      008671 1F 01            [ 2]  313 	ldw	(0x01, sp), x
                                    314 ;	libs/stm8l_clk.c: 502: clockfrequency = LSE_VALUE;
      008673                        315 00109$:
                                    316 ;	libs/stm8l_clk.c: 506: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
      008673 C6 50 C0         [ 1]  317 	ld	a, 0x50c0
      008676 A4 07            [ 1]  318 	and	a, #0x07
                                    319 ;	libs/stm8l_clk.c: 507: presc = SYSDivFactor[tmp];
      008678 5F               [ 1]  320 	clrw	x
      008679 97               [ 1]  321 	ld	xl, a
      00867A D6 80 90         [ 1]  322 	ld	a, (_SYSDivFactor+0, x)
                                    323 ;	libs/stm8l_clk.c: 510: clockfrequency = sourcefrequency / presc;
      00867D 5F               [ 1]  324 	clrw	x
      00867E 97               [ 1]  325 	ld	xl, a
      00867F 90 5F            [ 1]  326 	clrw	y
      008681 89               [ 2]  327 	pushw	x
      008682 90 89            [ 2]  328 	pushw	y
      008684 1E 07            [ 2]  329 	ldw	x, (0x07, sp)
      008686 89               [ 2]  330 	pushw	x
      008687 1E 07            [ 2]  331 	ldw	x, (0x07, sp)
      008689 89               [ 2]  332 	pushw	x
      00868A CD 8D 84         [ 4]  333 	call	__divulong
                                    334 ;	libs/stm8l_clk.c: 512: return((uint32_t)clockfrequency);
                                    335 ;	libs/stm8l_clk.c: 513: }
      00868D 5B 0C            [ 2]  336 	addw	sp, #12
      00868F 81               [ 4]  337 	ret
                                    338 ;	libs/stm8l_clk.c: 528: void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
                                    339 ;	-----------------------------------------
                                    340 ;	 function CLK_SYSCLKDivConfig
                                    341 ;	-----------------------------------------
      008690                        342 _CLK_SYSCLKDivConfig:
                                    343 ;	libs/stm8l_clk.c: 533: CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
      008690 C7 50 C0         [ 1]  344 	ld	0x50c0, a
                                    345 ;	libs/stm8l_clk.c: 534: }
      008693 81               [ 4]  346 	ret
                                    347 ;	libs/stm8l_clk.c: 541: void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
                                    348 ;	-----------------------------------------
                                    349 ;	 function CLK_SYSCLKSourceSwitchCmd
                                    350 ;	-----------------------------------------
      008694                        351 _CLK_SYSCLKSourceSwitchCmd:
      008694 88               [ 1]  352 	push	a
      008695 6B 01            [ 1]  353 	ld	(0x01, sp), a
                                    354 ;	libs/stm8l_clk.c: 549: CLK->SWCR |= CLK_SWCR_SWEN;
      008697 C6 50 C9         [ 1]  355 	ld	a, 0x50c9
                                    356 ;	libs/stm8l_clk.c: 546: if (NewState != DISABLE)
      00869A 0D 01            [ 1]  357 	tnz	(0x01, sp)
      00869C 27 07            [ 1]  358 	jreq	00102$
                                    359 ;	libs/stm8l_clk.c: 549: CLK->SWCR |= CLK_SWCR_SWEN;
      00869E AA 02            [ 1]  360 	or	a, #0x02
      0086A0 C7 50 C9         [ 1]  361 	ld	0x50c9, a
      0086A3 20 05            [ 2]  362 	jra	00104$
      0086A5                        363 00102$:
                                    364 ;	libs/stm8l_clk.c: 554: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0086A5 A4 FD            [ 1]  365 	and	a, #0xfd
      0086A7 C7 50 C9         [ 1]  366 	ld	0x50c9, a
      0086AA                        367 00104$:
                                    368 ;	libs/stm8l_clk.c: 556: }
      0086AA 84               [ 1]  369 	pop	a
      0086AB 81               [ 4]  370 	ret
                                    371 ;	libs/stm8l_clk.c: 616: void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
                                    372 ;	-----------------------------------------
                                    373 ;	 function CLK_RTCClockConfig
                                    374 ;	-----------------------------------------
      0086AC                        375 _CLK_RTCClockConfig:
                                    376 ;	libs/stm8l_clk.c: 623: CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
      0086AC 1A 03            [ 1]  377 	or	a, (0x03, sp)
      0086AE C7 50 C1         [ 1]  378 	ld	0x50c1, a
                                    379 ;	libs/stm8l_clk.c: 624: }
      0086B1 85               [ 2]  380 	popw	x
      0086B2 84               [ 1]  381 	pop	a
      0086B3 FC               [ 2]  382 	jp	(x)
                                    383 ;	libs/stm8l_clk.c: 635: void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
                                    384 ;	-----------------------------------------
                                    385 ;	 function CLK_BEEPClockConfig
                                    386 ;	-----------------------------------------
      0086B4                        387 _CLK_BEEPClockConfig:
                                    388 ;	libs/stm8l_clk.c: 641: CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
      0086B4 C7 50 CB         [ 1]  389 	ld	0x50cb, a
                                    390 ;	libs/stm8l_clk.c: 643: }
      0086B7 81               [ 4]  391 	ret
                                    392 ;	libs/stm8l_clk.c: 677: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    393 ;	-----------------------------------------
                                    394 ;	 function CLK_PeripheralClockConfig
                                    395 ;	-----------------------------------------
      0086B8                        396 _CLK_PeripheralClockConfig:
      0086B8 52 02            [ 2]  397 	sub	sp, #2
                                    398 ;	libs/stm8l_clk.c: 686: reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
      0086BA 88               [ 1]  399 	push	a
      0086BB A4 F0            [ 1]  400 	and	a, #0xf0
      0086BD 97               [ 1]  401 	ld	xl, a
      0086BE 84               [ 1]  402 	pop	a
      0086BF 90 93            [ 1]  403 	ldw	y, x
                                    404 ;	libs/stm8l_clk.c: 693: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0086C1 A4 0F            [ 1]  405 	and	a, #0x0f
      0086C3 88               [ 1]  406 	push	a
      0086C4 A6 01            [ 1]  407 	ld	a, #0x01
      0086C6 6B 02            [ 1]  408 	ld	(0x02, sp), a
      0086C8 84               [ 1]  409 	pop	a
      0086C9 4D               [ 1]  410 	tnz	a
      0086CA 27 05            [ 1]  411 	jreq	00144$
      0086CC                        412 00143$:
      0086CC 08 01            [ 1]  413 	sll	(0x01, sp)
      0086CE 4A               [ 1]  414 	dec	a
      0086CF 26 FB            [ 1]  415 	jrne	00143$
      0086D1                        416 00144$:
                                    417 ;	libs/stm8l_clk.c: 698: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0086D1 7B 01            [ 1]  418 	ld	a, (0x01, sp)
      0086D3 43               [ 1]  419 	cpl	a
      0086D4 6B 02            [ 1]  420 	ld	(0x02, sp), a
                                    421 ;	libs/stm8l_clk.c: 688: if ( reg == 0x00)
      0086D6 9F               [ 1]  422 	ld	a, xl
      0086D7 4D               [ 1]  423 	tnz	a
      0086D8 26 15            [ 1]  424 	jrne	00114$
                                    425 ;	libs/stm8l_clk.c: 693: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0086DA C6 50 C3         [ 1]  426 	ld	a, 0x50c3
                                    427 ;	libs/stm8l_clk.c: 690: if (NewState != DISABLE)
      0086DD 0D 05            [ 1]  428 	tnz	(0x05, sp)
      0086DF 27 07            [ 1]  429 	jreq	00102$
                                    430 ;	libs/stm8l_clk.c: 693: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0086E1 1A 01            [ 1]  431 	or	a, (0x01, sp)
      0086E3 C7 50 C3         [ 1]  432 	ld	0x50c3, a
      0086E6 20 35            [ 2]  433 	jra	00116$
      0086E8                        434 00102$:
                                    435 ;	libs/stm8l_clk.c: 698: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0086E8 14 02            [ 1]  436 	and	a, (0x02, sp)
      0086EA C7 50 C3         [ 1]  437 	ld	0x50c3, a
      0086ED 20 2E            [ 2]  438 	jra	00116$
      0086EF                        439 00114$:
                                    440 ;	libs/stm8l_clk.c: 701: else if (reg == 0x10)
      0086EF 90 9F            [ 1]  441 	ld	a, yl
      0086F1 A1 10            [ 1]  442 	cp	a, #0x10
      0086F3 26 15            [ 1]  443 	jrne	00111$
                                    444 ;	libs/stm8l_clk.c: 706: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0086F5 C6 50 C4         [ 1]  445 	ld	a, 0x50c4
                                    446 ;	libs/stm8l_clk.c: 703: if (NewState != DISABLE)
      0086F8 0D 05            [ 1]  447 	tnz	(0x05, sp)
      0086FA 27 07            [ 1]  448 	jreq	00105$
                                    449 ;	libs/stm8l_clk.c: 706: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0086FC 1A 01            [ 1]  450 	or	a, (0x01, sp)
      0086FE C7 50 C4         [ 1]  451 	ld	0x50c4, a
      008701 20 1A            [ 2]  452 	jra	00116$
      008703                        453 00105$:
                                    454 ;	libs/stm8l_clk.c: 711: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008703 14 02            [ 1]  455 	and	a, (0x02, sp)
      008705 C7 50 C4         [ 1]  456 	ld	0x50c4, a
      008708 20 13            [ 2]  457 	jra	00116$
      00870A                        458 00111$:
                                    459 ;	libs/stm8l_clk.c: 719: CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00870A C6 50 D0         [ 1]  460 	ld	a, 0x50d0
                                    461 ;	libs/stm8l_clk.c: 716: if (NewState != DISABLE)
      00870D 0D 05            [ 1]  462 	tnz	(0x05, sp)
      00870F 27 07            [ 1]  463 	jreq	00108$
                                    464 ;	libs/stm8l_clk.c: 719: CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008711 1A 01            [ 1]  465 	or	a, (0x01, sp)
      008713 C7 50 D0         [ 1]  466 	ld	0x50d0, a
      008716 20 05            [ 2]  467 	jra	00116$
      008718                        468 00108$:
                                    469 ;	libs/stm8l_clk.c: 724: CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008718 14 02            [ 1]  470 	and	a, (0x02, sp)
      00871A C7 50 D0         [ 1]  471 	ld	0x50d0, a
      00871D                        472 00116$:
                                    473 ;	libs/stm8l_clk.c: 727: }
      00871D 5B 02            [ 2]  474 	addw	sp, #2
      00871F 85               [ 2]  475 	popw	x
      008720 84               [ 1]  476 	pop	a
      008721 FC               [ 2]  477 	jp	(x)
                                    478 ;	libs/stm8l_clk.c: 765: void CLK_LSEClockSecuritySystemEnable(void)
                                    479 ;	-----------------------------------------
                                    480 ;	 function CLK_LSEClockSecuritySystemEnable
                                    481 ;	-----------------------------------------
      008722                        482 _CLK_LSEClockSecuritySystemEnable:
                                    483 ;	libs/stm8l_clk.c: 768: CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
      008722 72 10 51 90      [ 1]  484 	bset	0x5190, #0
                                    485 ;	libs/stm8l_clk.c: 769: }
      008726 81               [ 4]  486 	ret
                                    487 ;	libs/stm8l_clk.c: 777: void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
                                    488 ;	-----------------------------------------
                                    489 ;	 function CLK_RTCCLKSwitchOnLSEFailureEnable
                                    490 ;	-----------------------------------------
      008727                        491 _CLK_RTCCLKSwitchOnLSEFailureEnable:
                                    492 ;	libs/stm8l_clk.c: 780: CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
      008727 72 12 51 90      [ 1]  493 	bset	0x5190, #1
                                    494 ;	libs/stm8l_clk.c: 781: }
      00872B 81               [ 4]  495 	ret
                                    496 ;	libs/stm8l_clk.c: 807: void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
                                    497 ;	-----------------------------------------
                                    498 ;	 function CLK_HaltConfig
                                    499 ;	-----------------------------------------
      00872C                        500 _CLK_HaltConfig:
      00872C 88               [ 1]  501 	push	a
                                    502 ;	libs/stm8l_clk.c: 815: CLK->ICKCR |= (uint8_t)(CLK_Halt);
      00872D AE 50 C2         [ 2]  503 	ldw	x, #0x50c2
      008730 88               [ 1]  504 	push	a
      008731 F6               [ 1]  505 	ld	a, (x)
      008732 6B 02            [ 1]  506 	ld	(0x02, sp), a
      008734 84               [ 1]  507 	pop	a
                                    508 ;	libs/stm8l_clk.c: 813: if (NewState != DISABLE)
      008735 0D 04            [ 1]  509 	tnz	(0x04, sp)
      008737 27 07            [ 1]  510 	jreq	00102$
                                    511 ;	libs/stm8l_clk.c: 815: CLK->ICKCR |= (uint8_t)(CLK_Halt);
      008739 1A 01            [ 1]  512 	or	a, (0x01, sp)
      00873B C7 50 C2         [ 1]  513 	ld	0x50c2, a
      00873E 20 06            [ 2]  514 	jra	00104$
      008740                        515 00102$:
                                    516 ;	libs/stm8l_clk.c: 819: CLK->ICKCR &= (uint8_t)(~CLK_Halt);
      008740 43               [ 1]  517 	cpl	a
      008741 14 01            [ 1]  518 	and	a, (0x01, sp)
      008743 C7 50 C2         [ 1]  519 	ld	0x50c2, a
      008746                        520 00104$:
                                    521 ;	libs/stm8l_clk.c: 821: }
      008746 84               [ 1]  522 	pop	a
      008747 85               [ 2]  523 	popw	x
      008748 84               [ 1]  524 	pop	a
      008749 FC               [ 2]  525 	jp	(x)
                                    526 ;	libs/stm8l_clk.c: 831: void CLK_MainRegulatorCmd(FunctionalState NewState)
                                    527 ;	-----------------------------------------
                                    528 ;	 function CLK_MainRegulatorCmd
                                    529 ;	-----------------------------------------
      00874A                        530 _CLK_MainRegulatorCmd:
      00874A 88               [ 1]  531 	push	a
      00874B 6B 01            [ 1]  532 	ld	(0x01, sp), a
                                    533 ;	libs/stm8l_clk.c: 839: CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
      00874D C6 50 CF         [ 1]  534 	ld	a, 0x50cf
                                    535 ;	libs/stm8l_clk.c: 836: if (NewState != DISABLE)
      008750 0D 01            [ 1]  536 	tnz	(0x01, sp)
      008752 27 07            [ 1]  537 	jreq	00102$
                                    538 ;	libs/stm8l_clk.c: 839: CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
      008754 A4 FD            [ 1]  539 	and	a, #0xfd
      008756 C7 50 CF         [ 1]  540 	ld	0x50cf, a
      008759 20 05            [ 2]  541 	jra	00104$
      00875B                        542 00102$:
                                    543 ;	libs/stm8l_clk.c: 844: CLK->REGCSR |= CLK_REGCSR_REGOFF;
      00875B AA 02            [ 1]  544 	or	a, #0x02
      00875D C7 50 CF         [ 1]  545 	ld	0x50cf, a
      008760                        546 00104$:
                                    547 ;	libs/stm8l_clk.c: 846: }
      008760 84               [ 1]  548 	pop	a
      008761 81               [ 4]  549 	ret
                                    550 ;	libs/stm8l_clk.c: 875: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    551 ;	-----------------------------------------
                                    552 ;	 function CLK_ITConfig
                                    553 ;	-----------------------------------------
      008762                        554 _CLK_ITConfig:
      008762 88               [ 1]  555 	push	a
                                    556 ;	libs/stm8l_clk.c: 884: if (CLK_IT == CLK_IT_SWIF)
      008763 A1 1C            [ 1]  557 	cp	a, #0x1c
      008765 26 07            [ 1]  558 	jrne	00144$
      008767 88               [ 1]  559 	push	a
      008768 A6 01            [ 1]  560 	ld	a, #0x01
      00876A 6B 02            [ 1]  561 	ld	(0x02, sp), a
      00876C 84               [ 1]  562 	pop	a
      00876D C5                     563 	.byte 0xc5
      00876E                        564 00144$:
      00876E 0F 01            [ 1]  565 	clr	(0x01, sp)
      008770                        566 00145$:
                                    567 ;	libs/stm8l_clk.c: 889: else if (CLK_IT == CLK_IT_LSECSSF)
      008770 A0 2C            [ 1]  568 	sub	a, #0x2c
      008772 26 02            [ 1]  569 	jrne	00147$
      008774 4C               [ 1]  570 	inc	a
      008775 21                     571 	.byte 0x21
      008776                        572 00147$:
      008776 4F               [ 1]  573 	clr	a
      008777                        574 00148$:
                                    575 ;	libs/stm8l_clk.c: 882: if (NewState != DISABLE)
      008777 0D 04            [ 1]  576 	tnz	(0x04, sp)
      008779 27 25            [ 1]  577 	jreq	00114$
                                    578 ;	libs/stm8l_clk.c: 884: if (CLK_IT == CLK_IT_SWIF)
      00877B 0D 01            [ 1]  579 	tnz	(0x01, sp)
      00877D 27 0A            [ 1]  580 	jreq	00105$
                                    581 ;	libs/stm8l_clk.c: 887: CLK->SWCR |= CLK_SWCR_SWIEN;
      00877F C6 50 C9         [ 1]  582 	ld	a, 0x50c9
      008782 AA 04            [ 1]  583 	or	a, #0x04
      008784 C7 50 C9         [ 1]  584 	ld	0x50c9, a
      008787 20 3A            [ 2]  585 	jra	00116$
      008789                        586 00105$:
                                    587 ;	libs/stm8l_clk.c: 889: else if (CLK_IT == CLK_IT_LSECSSF)
      008789 4D               [ 1]  588 	tnz	a
      00878A 27 0A            [ 1]  589 	jreq	00102$
                                    590 ;	libs/stm8l_clk.c: 892: CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
      00878C C6 51 90         [ 1]  591 	ld	a, 0x5190
      00878F AA 04            [ 1]  592 	or	a, #0x04
      008791 C7 51 90         [ 1]  593 	ld	0x5190, a
      008794 20 2D            [ 2]  594 	jra	00116$
      008796                        595 00102$:
                                    596 ;	libs/stm8l_clk.c: 897: CLK->CSSR |= CLK_CSSR_CSSDIE;
      008796 C6 50 CA         [ 1]  597 	ld	a, 0x50ca
      008799 AA 04            [ 1]  598 	or	a, #0x04
      00879B C7 50 CA         [ 1]  599 	ld	0x50ca, a
      00879E 20 23            [ 2]  600 	jra	00116$
      0087A0                        601 00114$:
                                    602 ;	libs/stm8l_clk.c: 902: if (CLK_IT == CLK_IT_SWIF)
      0087A0 0D 01            [ 1]  603 	tnz	(0x01, sp)
      0087A2 27 0A            [ 1]  604 	jreq	00111$
                                    605 ;	libs/stm8l_clk.c: 905: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      0087A4 C6 50 C9         [ 1]  606 	ld	a, 0x50c9
      0087A7 A4 FB            [ 1]  607 	and	a, #0xfb
      0087A9 C7 50 C9         [ 1]  608 	ld	0x50c9, a
      0087AC 20 15            [ 2]  609 	jra	00116$
      0087AE                        610 00111$:
                                    611 ;	libs/stm8l_clk.c: 907: else if (CLK_IT == CLK_IT_LSECSSF)
      0087AE 4D               [ 1]  612 	tnz	a
      0087AF 27 0A            [ 1]  613 	jreq	00108$
                                    614 ;	libs/stm8l_clk.c: 910: CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
      0087B1 C6 51 90         [ 1]  615 	ld	a, 0x5190
      0087B4 A4 FB            [ 1]  616 	and	a, #0xfb
      0087B6 C7 51 90         [ 1]  617 	ld	0x5190, a
      0087B9 20 08            [ 2]  618 	jra	00116$
      0087BB                        619 00108$:
                                    620 ;	libs/stm8l_clk.c: 915: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      0087BB C6 50 CA         [ 1]  621 	ld	a, 0x50ca
      0087BE A4 FB            [ 1]  622 	and	a, #0xfb
      0087C0 C7 50 CA         [ 1]  623 	ld	0x50ca, a
      0087C3                        624 00116$:
                                    625 ;	libs/stm8l_clk.c: 918: }
      0087C3 84               [ 1]  626 	pop	a
      0087C4 85               [ 2]  627 	popw	x
      0087C5 84               [ 1]  628 	pop	a
      0087C6 FC               [ 2]  629 	jp	(x)
                                    630 ;	libs/stm8l_clk.c: 945: FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
                                    631 ;	-----------------------------------------
                                    632 ;	 function CLK_GetFlagStatus
                                    633 ;	-----------------------------------------
      0087C7                        634 _CLK_GetFlagStatus:
      0087C7 88               [ 1]  635 	push	a
                                    636 ;	libs/stm8l_clk.c: 955: reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
      0087C8 97               [ 1]  637 	ld	xl, a
      0087C9 A4 F0            [ 1]  638 	and	a, #0xf0
                                    639 ;	libs/stm8l_clk.c: 958: pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
      0087CB 88               [ 1]  640 	push	a
      0087CC 9F               [ 1]  641 	ld	a, xl
      0087CD A4 0F            [ 1]  642 	and	a, #0x0f
      0087CF 97               [ 1]  643 	ld	xl, a
      0087D0 84               [ 1]  644 	pop	a
                                    645 ;	libs/stm8l_clk.c: 960: if (reg == 0x00) /* The flag to check is in CRTC Rregister */
      0087D1 4D               [ 1]  646 	tnz	a
      0087D2 26 05            [ 1]  647 	jrne	00123$
                                    648 ;	libs/stm8l_clk.c: 962: reg = CLK->CRTCR;
      0087D4 C6 50 C1         [ 1]  649 	ld	a, 0x50c1
      0087D7 20 42            [ 2]  650 	jra	00124$
      0087D9                        651 00123$:
                                    652 ;	libs/stm8l_clk.c: 964: else if (reg == 0x10) /* The flag to check is in ICKCR register */
      0087D9 A1 10            [ 1]  653 	cp	a, #0x10
      0087DB 26 05            [ 1]  654 	jrne	00120$
                                    655 ;	libs/stm8l_clk.c: 966: reg = CLK->ICKCR;
      0087DD C6 50 C2         [ 1]  656 	ld	a, 0x50c2
      0087E0 20 39            [ 2]  657 	jra	00124$
      0087E2                        658 00120$:
                                    659 ;	libs/stm8l_clk.c: 968: else if (reg == 0x20) /* The flag to check is in CCOR register */
      0087E2 A1 20            [ 1]  660 	cp	a, #0x20
      0087E4 26 05            [ 1]  661 	jrne	00117$
                                    662 ;	libs/stm8l_clk.c: 970: reg = CLK->CCOR;
      0087E6 C6 50 C5         [ 1]  663 	ld	a, 0x50c5
      0087E9 20 30            [ 2]  664 	jra	00124$
      0087EB                        665 00117$:
                                    666 ;	libs/stm8l_clk.c: 972: else if (reg == 0x30) /* The flag to check is in ECKCR register */
      0087EB A1 30            [ 1]  667 	cp	a, #0x30
      0087ED 26 05            [ 1]  668 	jrne	00114$
                                    669 ;	libs/stm8l_clk.c: 974: reg = CLK->ECKCR;
      0087EF C6 50 C6         [ 1]  670 	ld	a, 0x50c6
      0087F2 20 27            [ 2]  671 	jra	00124$
      0087F4                        672 00114$:
                                    673 ;	libs/stm8l_clk.c: 976: else if (reg == 0x40) /* The flag to check is in SWCR register */
      0087F4 A1 40            [ 1]  674 	cp	a, #0x40
      0087F6 26 05            [ 1]  675 	jrne	00111$
                                    676 ;	libs/stm8l_clk.c: 978: reg = CLK->SWCR;
      0087F8 C6 50 C9         [ 1]  677 	ld	a, 0x50c9
      0087FB 20 1E            [ 2]  678 	jra	00124$
      0087FD                        679 00111$:
                                    680 ;	libs/stm8l_clk.c: 980: else if (reg == 0x50) /* The flag to check is in CSSR register */
      0087FD A1 50            [ 1]  681 	cp	a, #0x50
      0087FF 26 05            [ 1]  682 	jrne	00108$
                                    683 ;	libs/stm8l_clk.c: 982: reg = CLK->CSSR;
      008801 C6 50 CA         [ 1]  684 	ld	a, 0x50ca
      008804 20 15            [ 2]  685 	jra	00124$
      008806                        686 00108$:
                                    687 ;	libs/stm8l_clk.c: 984: else if (reg == 0x70) /* The flag to check is in REGCSR register */
      008806 A1 70            [ 1]  688 	cp	a, #0x70
      008808 26 05            [ 1]  689 	jrne	00105$
                                    690 ;	libs/stm8l_clk.c: 986: reg = CLK->REGCSR;
      00880A C6 50 CF         [ 1]  691 	ld	a, 0x50cf
      00880D 20 0C            [ 2]  692 	jra	00124$
      00880F                        693 00105$:
                                    694 ;	libs/stm8l_clk.c: 988: else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
      00880F A1 80            [ 1]  695 	cp	a, #0x80
      008811 26 05            [ 1]  696 	jrne	00102$
                                    697 ;	libs/stm8l_clk.c: 990: reg = CSSLSE->CSR;
      008813 C6 51 90         [ 1]  698 	ld	a, 0x5190
      008816 20 03            [ 2]  699 	jra	00124$
      008818                        700 00102$:
                                    701 ;	libs/stm8l_clk.c: 994: reg = CLK->CBEEPR;
      008818 C6 50 CB         [ 1]  702 	ld	a, 0x50cb
      00881B                        703 00124$:
                                    704 ;	libs/stm8l_clk.c: 998: if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
      00881B 88               [ 1]  705 	push	a
      00881C A6 01            [ 1]  706 	ld	a, #0x01
      00881E 6B 02            [ 1]  707 	ld	(0x02, sp), a
      008820 9F               [ 1]  708 	ld	a, xl
      008821 4D               [ 1]  709 	tnz	a
      008822 27 05            [ 1]  710 	jreq	00198$
      008824                        711 00197$:
      008824 08 02            [ 1]  712 	sll	(0x02, sp)
      008826 4A               [ 1]  713 	dec	a
      008827 26 FB            [ 1]  714 	jrne	00197$
      008829                        715 00198$:
      008829 84               [ 1]  716 	pop	a
      00882A 14 01            [ 1]  717 	and	a, (0x01, sp)
      00882C 27 03            [ 1]  718 	jreq	00126$
                                    719 ;	libs/stm8l_clk.c: 1000: bitstatus = SET;
      00882E A6 01            [ 1]  720 	ld	a, #0x01
                                    721 ;	libs/stm8l_clk.c: 1004: bitstatus = RESET;
      008830 21                     722 	.byte 0x21
      008831                        723 00126$:
      008831 4F               [ 1]  724 	clr	a
      008832                        725 00127$:
                                    726 ;	libs/stm8l_clk.c: 1008: return((FlagStatus)bitstatus);
                                    727 ;	libs/stm8l_clk.c: 1009: }
      008832 5B 01            [ 2]  728 	addw	sp, #1
      008834 81               [ 4]  729 	ret
                                    730 ;	libs/stm8l_clk.c: 1016: void CLK_ClearFlag(void)
                                    731 ;	-----------------------------------------
                                    732 ;	 function CLK_ClearFlag
                                    733 ;	-----------------------------------------
      008835                        734 _CLK_ClearFlag:
                                    735 ;	libs/stm8l_clk.c: 1020: CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
      008835 72 17 51 90      [ 1]  736 	bres	0x5190, #3
                                    737 ;	libs/stm8l_clk.c: 1021: }
      008839 81               [ 4]  738 	ret
                                    739 ;	libs/stm8l_clk.c: 1032: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    740 ;	-----------------------------------------
                                    741 ;	 function CLK_GetITStatus
                                    742 ;	-----------------------------------------
      00883A                        743 _CLK_GetITStatus:
      00883A 88               [ 1]  744 	push	a
                                    745 ;	libs/stm8l_clk.c: 1040: if (CLK_IT == CLK_IT_SWIF)
      00883B 6B 01            [ 1]  746 	ld	(0x01, sp), a
      00883D A1 1C            [ 1]  747 	cp	a, #0x1c
      00883F 26 0F            [ 1]  748 	jrne	00114$
                                    749 ;	libs/stm8l_clk.c: 1043: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008841 C6 50 C9         [ 1]  750 	ld	a, 0x50c9
      008844 14 01            [ 1]  751 	and	a, (0x01, sp)
                                    752 ;	libs/stm8l_clk.c: 1045: bitstatus = SET;
      008846 A0 0C            [ 1]  753 	sub	a, #0x0c
      008848 26 03            [ 1]  754 	jrne	00102$
      00884A 4C               [ 1]  755 	inc	a
      00884B 20 24            [ 2]  756 	jra	00115$
      00884D                        757 00102$:
                                    758 ;	libs/stm8l_clk.c: 1049: bitstatus = RESET;
      00884D 4F               [ 1]  759 	clr	a
      00884E 20 21            [ 2]  760 	jra	00115$
      008850                        761 00114$:
                                    762 ;	libs/stm8l_clk.c: 1052: else if (CLK_IT == CLK_IT_LSECSSF)
      008850 7B 01            [ 1]  763 	ld	a, (0x01, sp)
      008852 A1 2C            [ 1]  764 	cp	a, #0x2c
      008854 26 0F            [ 1]  765 	jrne	00111$
                                    766 ;	libs/stm8l_clk.c: 1055: if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008856 C6 51 90         [ 1]  767 	ld	a, 0x5190
      008859 14 01            [ 1]  768 	and	a, (0x01, sp)
                                    769 ;	libs/stm8l_clk.c: 1057: bitstatus = SET;
      00885B A0 0C            [ 1]  770 	sub	a, #0x0c
      00885D 26 03            [ 1]  771 	jrne	00105$
      00885F 4C               [ 1]  772 	inc	a
      008860 20 0F            [ 2]  773 	jra	00115$
      008862                        774 00105$:
                                    775 ;	libs/stm8l_clk.c: 1061: bitstatus = RESET;
      008862 4F               [ 1]  776 	clr	a
      008863 20 0C            [ 2]  777 	jra	00115$
      008865                        778 00111$:
                                    779 ;	libs/stm8l_clk.c: 1067: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008865 C6 50 CA         [ 1]  780 	ld	a, 0x50ca
      008868 14 01            [ 1]  781 	and	a, (0x01, sp)
                                    782 ;	libs/stm8l_clk.c: 1069: bitstatus = SET;
      00886A A0 0C            [ 1]  783 	sub	a, #0x0c
      00886C 26 02            [ 1]  784 	jrne	00108$
      00886E 4C               [ 1]  785 	inc	a
                                    786 ;	libs/stm8l_clk.c: 1073: bitstatus = RESET;
      00886F 21                     787 	.byte 0x21
      008870                        788 00108$:
      008870 4F               [ 1]  789 	clr	a
      008871                        790 00115$:
                                    791 ;	libs/stm8l_clk.c: 1078: return bitstatus;
                                    792 ;	libs/stm8l_clk.c: 1079: }
      008871 5B 01            [ 2]  793 	addw	sp, #1
      008873 81               [ 4]  794 	ret
                                    795 ;	libs/stm8l_clk.c: 1089: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    796 ;	-----------------------------------------
                                    797 ;	 function CLK_ClearITPendingBit
                                    798 ;	-----------------------------------------
      008874                        799 _CLK_ClearITPendingBit:
                                    800 ;	libs/stm8l_clk.c: 1095: if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
      008874 A4 F0            [ 1]  801 	and	a, #0xf0
      008876 A1 20            [ 1]  802 	cp	a, #0x20
      008878 26 05            [ 1]  803 	jrne	00102$
                                    804 ;	libs/stm8l_clk.c: 1098: CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
      00887A 72 17 51 90      [ 1]  805 	bres	0x5190, #3
      00887E 81               [ 4]  806 	ret
      00887F                        807 00102$:
                                    808 ;	libs/stm8l_clk.c: 1103: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      00887F 72 17 50 C9      [ 1]  809 	bres	0x50c9, #3
                                    810 ;	libs/stm8l_clk.c: 1105: }
      008883 81               [ 4]  811 	ret
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
