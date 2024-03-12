                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
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
      0085D8                         79 _CLK_DeInit:
                                     80 ;	libs/stm8l_clk.c: 122: CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
      0085D8 35 11 50 C2      [ 1]   81 	mov	0x50c2+0, #0x11
                                     82 ;	libs/stm8l_clk.c: 123: CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
      0085DC 35 00 50 C6      [ 1]   83 	mov	0x50c6+0, #0x00
                                     84 ;	libs/stm8l_clk.c: 124: CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
      0085E0 35 00 50 C1      [ 1]   85 	mov	0x50c1+0, #0x00
                                     86 ;	libs/stm8l_clk.c: 125: CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
      0085E4 35 00 50 CB      [ 1]   87 	mov	0x50cb+0, #0x00
                                     88 ;	libs/stm8l_clk.c: 126: CLK->SWR  = CLK_SWR_RESET_VALUE;
      0085E8 35 01 50 C8      [ 1]   89 	mov	0x50c8+0, #0x01
                                     90 ;	libs/stm8l_clk.c: 127: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      0085EC 35 00 50 C9      [ 1]   91 	mov	0x50c9+0, #0x00
                                     92 ;	libs/stm8l_clk.c: 128: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      0085F0 35 03 50 C0      [ 1]   93 	mov	0x50c0+0, #0x03
                                     94 ;	libs/stm8l_clk.c: 129: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      0085F4 35 00 50 C3      [ 1]   95 	mov	0x50c3+0, #0x00
                                     96 ;	libs/stm8l_clk.c: 130: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      0085F8 35 80 50 C4      [ 1]   97 	mov	0x50c4+0, #0x80
                                     98 ;	libs/stm8l_clk.c: 131: CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
      0085FC 35 00 50 D0      [ 1]   99 	mov	0x50d0+0, #0x00
                                    100 ;	libs/stm8l_clk.c: 132: CLK->CSSR  = CLK_CSSR_RESET_VALUE;
      008600 35 00 50 CA      [ 1]  101 	mov	0x50ca+0, #0x00
                                    102 ;	libs/stm8l_clk.c: 133: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008604 35 00 50 C5      [ 1]  103 	mov	0x50c5+0, #0x00
                                    104 ;	libs/stm8l_clk.c: 134: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008608 35 00 50 CD      [ 1]  105 	mov	0x50cd+0, #0x00
                                    106 ;	libs/stm8l_clk.c: 135: CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
      00860C 35 00 50 CC      [ 1]  107 	mov	0x50cc+0, #0x00
                                    108 ;	libs/stm8l_clk.c: 136: CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
      008610 35 00 50 CE      [ 1]  109 	mov	0x50ce+0, #0x00
                                    110 ;	libs/stm8l_clk.c: 137: CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
      008614 35 B9 50 CF      [ 1]  111 	mov	0x50cf+0, #0xb9
                                    112 ;	libs/stm8l_clk.c: 138: }
      008618 81               [ 4]  113 	ret
                                    114 ;	libs/stm8l_clk.c: 160: void CLK_HSICmd(FunctionalState NewState)
                                    115 ;	-----------------------------------------
                                    116 ;	 function CLK_HSICmd
                                    117 ;	-----------------------------------------
      008619                        118 _CLK_HSICmd:
                                    119 ;	libs/stm8l_clk.c: 168: CLK->ICKCR |= CLK_ICKCR_HSION;
      008619 C6 50 C2         [ 1]  120 	ld	a, 0x50c2
                                    121 ;	libs/stm8l_clk.c: 165: if (NewState != DISABLE)
      00861C 0D 03            [ 1]  122 	tnz	(0x03, sp)
      00861E 27 06            [ 1]  123 	jreq	00102$
                                    124 ;	libs/stm8l_clk.c: 168: CLK->ICKCR |= CLK_ICKCR_HSION;
      008620 AA 01            [ 1]  125 	or	a, #0x01
      008622 C7 50 C2         [ 1]  126 	ld	0x50c2, a
      008625 81               [ 4]  127 	ret
      008626                        128 00102$:
                                    129 ;	libs/stm8l_clk.c: 173: CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
      008626 A4 FE            [ 1]  130 	and	a, #0xfe
      008628 C7 50 C2         [ 1]  131 	ld	0x50c2, a
                                    132 ;	libs/stm8l_clk.c: 175: }
      00862B 81               [ 4]  133 	ret
                                    134 ;	libs/stm8l_clk.c: 188: void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
                                    135 ;	-----------------------------------------
                                    136 ;	 function CLK_AdjustHSICalibrationValue
                                    137 ;	-----------------------------------------
      00862C                        138 _CLK_AdjustHSICalibrationValue:
                                    139 ;	libs/stm8l_clk.c: 191: CLK->HSIUNLCKR = 0xAC;
      00862C 35 AC 50 CE      [ 1]  140 	mov	0x50ce+0, #0xac
                                    141 ;	libs/stm8l_clk.c: 192: CLK->HSIUNLCKR = 0x35;
      008630 35 35 50 CE      [ 1]  142 	mov	0x50ce+0, #0x35
                                    143 ;	libs/stm8l_clk.c: 195: CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
      008634 AE 50 CD         [ 2]  144 	ldw	x, #0x50cd
      008637 7B 03            [ 1]  145 	ld	a, (0x03, sp)
      008639 F7               [ 1]  146 	ld	(x), a
                                    147 ;	libs/stm8l_clk.c: 196: }
      00863A 81               [ 4]  148 	ret
                                    149 ;	libs/stm8l_clk.c: 212: void CLK_LSICmd(FunctionalState NewState)
                                    150 ;	-----------------------------------------
                                    151 ;	 function CLK_LSICmd
                                    152 ;	-----------------------------------------
      00863B                        153 _CLK_LSICmd:
                                    154 ;	libs/stm8l_clk.c: 221: CLK->ICKCR |= CLK_ICKCR_LSION;
      00863B C6 50 C2         [ 1]  155 	ld	a, 0x50c2
                                    156 ;	libs/stm8l_clk.c: 218: if (NewState != DISABLE)
      00863E 0D 03            [ 1]  157 	tnz	(0x03, sp)
      008640 27 06            [ 1]  158 	jreq	00102$
                                    159 ;	libs/stm8l_clk.c: 221: CLK->ICKCR |= CLK_ICKCR_LSION;
      008642 AA 04            [ 1]  160 	or	a, #0x04
      008644 C7 50 C2         [ 1]  161 	ld	0x50c2, a
      008647 81               [ 4]  162 	ret
      008648                        163 00102$:
                                    164 ;	libs/stm8l_clk.c: 226: CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
      008648 A4 FB            [ 1]  165 	and	a, #0xfb
      00864A C7 50 C2         [ 1]  166 	ld	0x50c2, a
                                    167 ;	libs/stm8l_clk.c: 228: }
      00864D 81               [ 4]  168 	ret
                                    169 ;	libs/stm8l_clk.c: 249: void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
                                    170 ;	-----------------------------------------
                                    171 ;	 function CLK_HSEConfig
                                    172 ;	-----------------------------------------
      00864E                        173 _CLK_HSEConfig:
                                    174 ;	libs/stm8l_clk.c: 256: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
      00864E 72 11 50 C6      [ 1]  175 	bres	20678, #0
                                    176 ;	libs/stm8l_clk.c: 259: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
      008652 72 19 50 C6      [ 1]  177 	bres	20678, #4
                                    178 ;	libs/stm8l_clk.c: 262: CLK->ECKCR |= (uint8_t)CLK_HSE;
      008656 C6 50 C6         [ 1]  179 	ld	a, 0x50c6
      008659 1A 03            [ 1]  180 	or	a, (0x03, sp)
      00865B C7 50 C6         [ 1]  181 	ld	0x50c6, a
                                    182 ;	libs/stm8l_clk.c: 263: }
      00865E 81               [ 4]  183 	ret
                                    184 ;	libs/stm8l_clk.c: 280: void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
                                    185 ;	-----------------------------------------
                                    186 ;	 function CLK_LSEConfig
                                    187 ;	-----------------------------------------
      00865F                        188 _CLK_LSEConfig:
                                    189 ;	libs/stm8l_clk.c: 287: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
      00865F 72 15 50 C6      [ 1]  190 	bres	20678, #2
                                    191 ;	libs/stm8l_clk.c: 290: CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
      008663 72 1B 50 C6      [ 1]  192 	bres	20678, #5
                                    193 ;	libs/stm8l_clk.c: 293: CLK->ECKCR |= (uint8_t)CLK_LSE;
      008667 C6 50 C6         [ 1]  194 	ld	a, 0x50c6
      00866A 1A 03            [ 1]  195 	or	a, (0x03, sp)
      00866C C7 50 C6         [ 1]  196 	ld	0x50c6, a
                                    197 ;	libs/stm8l_clk.c: 295: }
      00866F 81               [ 4]  198 	ret
                                    199 ;	libs/stm8l_clk.c: 306: void CLK_ClockSecuritySystemEnable(void)
                                    200 ;	-----------------------------------------
                                    201 ;	 function CLK_ClockSecuritySystemEnable
                                    202 ;	-----------------------------------------
      008670                        203 _CLK_ClockSecuritySystemEnable:
                                    204 ;	libs/stm8l_clk.c: 309: CLK->CSSR |= CLK_CSSR_CSSEN;
      008670 72 10 50 CA      [ 1]  205 	bset	20682, #0
                                    206 ;	libs/stm8l_clk.c: 310: }
      008674 81               [ 4]  207 	ret
                                    208 ;	libs/stm8l_clk.c: 317: void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_ClockSecuritySytemDeglitchCmd
                                    211 ;	-----------------------------------------
      008675                        212 _CLK_ClockSecuritySytemDeglitchCmd:
                                    213 ;	libs/stm8l_clk.c: 325: CLK->CSSR |= CLK_CSSR_CSSDGON;
      008675 C6 50 CA         [ 1]  214 	ld	a, 0x50ca
                                    215 ;	libs/stm8l_clk.c: 322: if (NewState != DISABLE)
      008678 0D 03            [ 1]  216 	tnz	(0x03, sp)
      00867A 27 06            [ 1]  217 	jreq	00102$
                                    218 ;	libs/stm8l_clk.c: 325: CLK->CSSR |= CLK_CSSR_CSSDGON;
      00867C AA 10            [ 1]  219 	or	a, #0x10
      00867E C7 50 CA         [ 1]  220 	ld	0x50ca, a
      008681 81               [ 4]  221 	ret
      008682                        222 00102$:
                                    223 ;	libs/stm8l_clk.c: 330: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
      008682 A4 EF            [ 1]  224 	and	a, #0xef
      008684 C7 50 CA         [ 1]  225 	ld	0x50ca, a
                                    226 ;	libs/stm8l_clk.c: 332: }
      008687 81               [ 4]  227 	ret
                                    228 ;	libs/stm8l_clk.c: 356: void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
                                    229 ;	-----------------------------------------
                                    230 ;	 function CLK_CCOConfig
                                    231 ;	-----------------------------------------
      008688                        232 _CLK_CCOConfig:
                                    233 ;	libs/stm8l_clk.c: 363: CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
      008688 7B 03            [ 1]  234 	ld	a, (0x03, sp)
      00868A 1A 04            [ 1]  235 	or	a, (0x04, sp)
      00868C C7 50 C5         [ 1]  236 	ld	0x50c5, a
                                    237 ;	libs/stm8l_clk.c: 364: }
      00868F 81               [ 4]  238 	ret
                                    239 ;	libs/stm8l_clk.c: 416: void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
                                    240 ;	-----------------------------------------
                                    241 ;	 function CLK_SYSCLKSourceConfig
                                    242 ;	-----------------------------------------
      008690                        243 _CLK_SYSCLKSourceConfig:
                                    244 ;	libs/stm8l_clk.c: 422: CLK->SWR = (uint8_t)CLK_SYSCLKSource;
      008690 AE 50 C8         [ 2]  245 	ldw	x, #0x50c8
      008693 7B 03            [ 1]  246 	ld	a, (0x03, sp)
      008695 F7               [ 1]  247 	ld	(x), a
                                    248 ;	libs/stm8l_clk.c: 423: }
      008696 81               [ 4]  249 	ret
                                    250 ;	libs/stm8l_clk.c: 435: CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
                                    251 ;	-----------------------------------------
                                    252 ;	 function CLK_GetSYSCLKSource
                                    253 ;	-----------------------------------------
      008697                        254 _CLK_GetSYSCLKSource:
                                    255 ;	libs/stm8l_clk.c: 437: return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
      008697 C6 50 C7         [ 1]  256 	ld	a, 0x50c7
                                    257 ;	libs/stm8l_clk.c: 438: }
      00869A 81               [ 4]  258 	ret
                                    259 ;	libs/stm8l_clk.c: 478: uint32_t CLK_GetClockFreq(void)
                                    260 ;	-----------------------------------------
                                    261 ;	 function CLK_GetClockFreq
                                    262 ;	-----------------------------------------
      00869B                        263 _CLK_GetClockFreq:
      00869B 52 04            [ 2]  264 	sub	sp, #4
                                    265 ;	libs/stm8l_clk.c: 481: uint32_t sourcefrequency = 0;
      00869D 5F               [ 1]  266 	clrw	x
      00869E 1F 03            [ 2]  267 	ldw	(0x03, sp), x
      0086A0 1F 01            [ 2]  268 	ldw	(0x01, sp), x
                                    269 ;	libs/stm8l_clk.c: 486: clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
      0086A2 C6 50 C7         [ 1]  270 	ld	a, 0x50c7
                                    271 ;	libs/stm8l_clk.c: 488: if ( clocksource == CLK_SYSCLKSource_HSI)
      0086A5 A1 01            [ 1]  272 	cp	a, #0x01
      0086A7 26 0C            [ 1]  273 	jrne	00108$
                                    274 ;	libs/stm8l_clk.c: 490: sourcefrequency = HSI_VALUE;
      0086A9 AE 24 00         [ 2]  275 	ldw	x, #0x2400
      0086AC 1F 03            [ 2]  276 	ldw	(0x03, sp), x
      0086AE AE 00 F4         [ 2]  277 	ldw	x, #0x00f4
      0086B1 1F 01            [ 2]  278 	ldw	(0x01, sp), x
      0086B3 20 1C            [ 2]  279 	jra	00109$
      0086B5                        280 00108$:
                                    281 ;	libs/stm8l_clk.c: 492: else if ( clocksource == CLK_SYSCLKSource_LSI)
      0086B5 A1 02            [ 1]  282 	cp	a, #0x02
      0086B7 26 0A            [ 1]  283 	jrne	00105$
                                    284 ;	libs/stm8l_clk.c: 494: sourcefrequency = LSI_VALUE;
      0086B9 AE 94 70         [ 2]  285 	ldw	x, #0x9470
      0086BC 1F 03            [ 2]  286 	ldw	(0x03, sp), x
      0086BE 5F               [ 1]  287 	clrw	x
      0086BF 1F 01            [ 2]  288 	ldw	(0x01, sp), x
      0086C1 20 0E            [ 2]  289 	jra	00109$
      0086C3                        290 00105$:
                                    291 ;	libs/stm8l_clk.c: 496: else if ( clocksource == CLK_SYSCLKSource_HSE)
      0086C3 A1 04            [ 1]  292 	cp	a, #0x04
      0086C5 26 0A            [ 1]  293 	jrne	00109$
                                    294 ;	libs/stm8l_clk.c: 498: sourcefrequency = HSE_VALUE;
      0086C7 AE 24 00         [ 2]  295 	ldw	x, #0x2400
      0086CA 1F 03            [ 2]  296 	ldw	(0x03, sp), x
      0086CC AE 00 F4         [ 2]  297 	ldw	x, #0x00f4
      0086CF 1F 01            [ 2]  298 	ldw	(0x01, sp), x
                                    299 ;	libs/stm8l_clk.c: 502: clockfrequency = LSE_VALUE;
      0086D1                        300 00109$:
                                    301 ;	libs/stm8l_clk.c: 506: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
      0086D1 C6 50 C0         [ 1]  302 	ld	a, 0x50c0
      0086D4 A4 07            [ 1]  303 	and	a, #0x07
                                    304 ;	libs/stm8l_clk.c: 507: presc = SYSDivFactor[tmp];
      0086D6 5F               [ 1]  305 	clrw	x
      0086D7 97               [ 1]  306 	ld	xl, a
      0086D8 1C 80 90         [ 2]  307 	addw	x, #(_SYSDivFactor + 0)
      0086DB F6               [ 1]  308 	ld	a, (x)
                                    309 ;	libs/stm8l_clk.c: 510: clockfrequency = sourcefrequency / presc;
      0086DC 5F               [ 1]  310 	clrw	x
      0086DD 97               [ 1]  311 	ld	xl, a
      0086DE 90 5F            [ 1]  312 	clrw	y
      0086E0 89               [ 2]  313 	pushw	x
      0086E1 90 89            [ 2]  314 	pushw	y
      0086E3 1E 07            [ 2]  315 	ldw	x, (0x07, sp)
      0086E5 89               [ 2]  316 	pushw	x
      0086E6 1E 07            [ 2]  317 	ldw	x, (0x07, sp)
      0086E8 89               [ 2]  318 	pushw	x
      0086E9 CD 8D 80         [ 4]  319 	call	__divulong
                                    320 ;	libs/stm8l_clk.c: 512: return((uint32_t)clockfrequency);
                                    321 ;	libs/stm8l_clk.c: 513: }
      0086EC 5B 0C            [ 2]  322 	addw	sp, #12
      0086EE 81               [ 4]  323 	ret
                                    324 ;	libs/stm8l_clk.c: 528: void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
                                    325 ;	-----------------------------------------
                                    326 ;	 function CLK_SYSCLKDivConfig
                                    327 ;	-----------------------------------------
      0086EF                        328 _CLK_SYSCLKDivConfig:
                                    329 ;	libs/stm8l_clk.c: 533: CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
      0086EF AE 50 C0         [ 2]  330 	ldw	x, #0x50c0
      0086F2 7B 03            [ 1]  331 	ld	a, (0x03, sp)
      0086F4 F7               [ 1]  332 	ld	(x), a
                                    333 ;	libs/stm8l_clk.c: 534: }
      0086F5 81               [ 4]  334 	ret
                                    335 ;	libs/stm8l_clk.c: 541: void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
                                    336 ;	-----------------------------------------
                                    337 ;	 function CLK_SYSCLKSourceSwitchCmd
                                    338 ;	-----------------------------------------
      0086F6                        339 _CLK_SYSCLKSourceSwitchCmd:
                                    340 ;	libs/stm8l_clk.c: 549: CLK->SWCR |= CLK_SWCR_SWEN;
      0086F6 C6 50 C9         [ 1]  341 	ld	a, 0x50c9
                                    342 ;	libs/stm8l_clk.c: 546: if (NewState != DISABLE)
      0086F9 0D 03            [ 1]  343 	tnz	(0x03, sp)
      0086FB 27 06            [ 1]  344 	jreq	00102$
                                    345 ;	libs/stm8l_clk.c: 549: CLK->SWCR |= CLK_SWCR_SWEN;
      0086FD AA 02            [ 1]  346 	or	a, #0x02
      0086FF C7 50 C9         [ 1]  347 	ld	0x50c9, a
      008702 81               [ 4]  348 	ret
      008703                        349 00102$:
                                    350 ;	libs/stm8l_clk.c: 554: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008703 A4 FD            [ 1]  351 	and	a, #0xfd
      008705 C7 50 C9         [ 1]  352 	ld	0x50c9, a
                                    353 ;	libs/stm8l_clk.c: 556: }
      008708 81               [ 4]  354 	ret
                                    355 ;	libs/stm8l_clk.c: 616: void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
                                    356 ;	-----------------------------------------
                                    357 ;	 function CLK_RTCClockConfig
                                    358 ;	-----------------------------------------
      008709                        359 _CLK_RTCClockConfig:
                                    360 ;	libs/stm8l_clk.c: 623: CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
      008709 7B 03            [ 1]  361 	ld	a, (0x03, sp)
      00870B 1A 04            [ 1]  362 	or	a, (0x04, sp)
      00870D C7 50 C1         [ 1]  363 	ld	0x50c1, a
                                    364 ;	libs/stm8l_clk.c: 624: }
      008710 81               [ 4]  365 	ret
                                    366 ;	libs/stm8l_clk.c: 635: void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
                                    367 ;	-----------------------------------------
                                    368 ;	 function CLK_BEEPClockConfig
                                    369 ;	-----------------------------------------
      008711                        370 _CLK_BEEPClockConfig:
                                    371 ;	libs/stm8l_clk.c: 641: CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
      008711 AE 50 CB         [ 2]  372 	ldw	x, #0x50cb
      008714 7B 03            [ 1]  373 	ld	a, (0x03, sp)
      008716 F7               [ 1]  374 	ld	(x), a
                                    375 ;	libs/stm8l_clk.c: 643: }
      008717 81               [ 4]  376 	ret
                                    377 ;	libs/stm8l_clk.c: 677: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    378 ;	-----------------------------------------
                                    379 ;	 function CLK_PeripheralClockConfig
                                    380 ;	-----------------------------------------
      008718                        381 _CLK_PeripheralClockConfig:
      008718 52 02            [ 2]  382 	sub	sp, #2
                                    383 ;	libs/stm8l_clk.c: 686: reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
      00871A 7B 05            [ 1]  384 	ld	a, (0x05, sp)
      00871C A4 F0            [ 1]  385 	and	a, #0xf0
      00871E 97               [ 1]  386 	ld	xl, a
      00871F 90 93            [ 1]  387 	ldw	y, x
                                    388 ;	libs/stm8l_clk.c: 693: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008721 7B 05            [ 1]  389 	ld	a, (0x05, sp)
      008723 A4 0F            [ 1]  390 	and	a, #0x0f
      008725 88               [ 1]  391 	push	a
      008726 A6 01            [ 1]  392 	ld	a, #0x01
      008728 6B 02            [ 1]  393 	ld	(0x02, sp), a
      00872A 84               [ 1]  394 	pop	a
      00872B 4D               [ 1]  395 	tnz	a
      00872C 27 05            [ 1]  396 	jreq	00144$
      00872E                        397 00143$:
      00872E 08 01            [ 1]  398 	sll	(0x01, sp)
      008730 4A               [ 1]  399 	dec	a
      008731 26 FB            [ 1]  400 	jrne	00143$
      008733                        401 00144$:
                                    402 ;	libs/stm8l_clk.c: 698: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008733 7B 01            [ 1]  403 	ld	a, (0x01, sp)
      008735 43               [ 1]  404 	cpl	a
      008736 6B 02            [ 1]  405 	ld	(0x02, sp), a
                                    406 ;	libs/stm8l_clk.c: 688: if ( reg == 0x00)
      008738 9F               [ 1]  407 	ld	a, xl
      008739 4D               [ 1]  408 	tnz	a
      00873A 26 15            [ 1]  409 	jrne	00114$
                                    410 ;	libs/stm8l_clk.c: 693: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00873C C6 50 C3         [ 1]  411 	ld	a, 0x50c3
                                    412 ;	libs/stm8l_clk.c: 690: if (NewState != DISABLE)
      00873F 0D 06            [ 1]  413 	tnz	(0x06, sp)
      008741 27 07            [ 1]  414 	jreq	00102$
                                    415 ;	libs/stm8l_clk.c: 693: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008743 1A 01            [ 1]  416 	or	a, (0x01, sp)
      008745 C7 50 C3         [ 1]  417 	ld	0x50c3, a
      008748 20 35            [ 2]  418 	jra	00116$
      00874A                        419 00102$:
                                    420 ;	libs/stm8l_clk.c: 698: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00874A 14 02            [ 1]  421 	and	a, (0x02, sp)
      00874C C7 50 C3         [ 1]  422 	ld	0x50c3, a
      00874F 20 2E            [ 2]  423 	jra	00116$
      008751                        424 00114$:
                                    425 ;	libs/stm8l_clk.c: 701: else if (reg == 0x10)
      008751 90 9F            [ 1]  426 	ld	a, yl
      008753 A1 10            [ 1]  427 	cp	a, #0x10
      008755 26 15            [ 1]  428 	jrne	00111$
                                    429 ;	libs/stm8l_clk.c: 706: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008757 C6 50 C4         [ 1]  430 	ld	a, 0x50c4
                                    431 ;	libs/stm8l_clk.c: 703: if (NewState != DISABLE)
      00875A 0D 06            [ 1]  432 	tnz	(0x06, sp)
      00875C 27 07            [ 1]  433 	jreq	00105$
                                    434 ;	libs/stm8l_clk.c: 706: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00875E 1A 01            [ 1]  435 	or	a, (0x01, sp)
      008760 C7 50 C4         [ 1]  436 	ld	0x50c4, a
      008763 20 1A            [ 2]  437 	jra	00116$
      008765                        438 00105$:
                                    439 ;	libs/stm8l_clk.c: 711: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008765 14 02            [ 1]  440 	and	a, (0x02, sp)
      008767 C7 50 C4         [ 1]  441 	ld	0x50c4, a
      00876A 20 13            [ 2]  442 	jra	00116$
      00876C                        443 00111$:
                                    444 ;	libs/stm8l_clk.c: 719: CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00876C C6 50 D0         [ 1]  445 	ld	a, 0x50d0
                                    446 ;	libs/stm8l_clk.c: 716: if (NewState != DISABLE)
      00876F 0D 06            [ 1]  447 	tnz	(0x06, sp)
      008771 27 07            [ 1]  448 	jreq	00108$
                                    449 ;	libs/stm8l_clk.c: 719: CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008773 1A 01            [ 1]  450 	or	a, (0x01, sp)
      008775 C7 50 D0         [ 1]  451 	ld	0x50d0, a
      008778 20 05            [ 2]  452 	jra	00116$
      00877A                        453 00108$:
                                    454 ;	libs/stm8l_clk.c: 724: CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00877A 14 02            [ 1]  455 	and	a, (0x02, sp)
      00877C C7 50 D0         [ 1]  456 	ld	0x50d0, a
      00877F                        457 00116$:
                                    458 ;	libs/stm8l_clk.c: 727: }
      00877F 5B 02            [ 2]  459 	addw	sp, #2
      008781 81               [ 4]  460 	ret
                                    461 ;	libs/stm8l_clk.c: 765: void CLK_LSEClockSecuritySystemEnable(void)
                                    462 ;	-----------------------------------------
                                    463 ;	 function CLK_LSEClockSecuritySystemEnable
                                    464 ;	-----------------------------------------
      008782                        465 _CLK_LSEClockSecuritySystemEnable:
                                    466 ;	libs/stm8l_clk.c: 768: CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
      008782 72 10 51 90      [ 1]  467 	bset	20880, #0
                                    468 ;	libs/stm8l_clk.c: 769: }
      008786 81               [ 4]  469 	ret
                                    470 ;	libs/stm8l_clk.c: 777: void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
                                    471 ;	-----------------------------------------
                                    472 ;	 function CLK_RTCCLKSwitchOnLSEFailureEnable
                                    473 ;	-----------------------------------------
      008787                        474 _CLK_RTCCLKSwitchOnLSEFailureEnable:
                                    475 ;	libs/stm8l_clk.c: 780: CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
      008787 72 12 51 90      [ 1]  476 	bset	20880, #1
                                    477 ;	libs/stm8l_clk.c: 781: }
      00878B 81               [ 4]  478 	ret
                                    479 ;	libs/stm8l_clk.c: 807: void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
                                    480 ;	-----------------------------------------
                                    481 ;	 function CLK_HaltConfig
                                    482 ;	-----------------------------------------
      00878C                        483 _CLK_HaltConfig:
      00878C 88               [ 1]  484 	push	a
                                    485 ;	libs/stm8l_clk.c: 815: CLK->ICKCR |= (uint8_t)(CLK_Halt);
      00878D C6 50 C2         [ 1]  486 	ld	a, 0x50c2
                                    487 ;	libs/stm8l_clk.c: 813: if (NewState != DISABLE)
      008790 0D 05            [ 1]  488 	tnz	(0x05, sp)
      008792 27 07            [ 1]  489 	jreq	00102$
                                    490 ;	libs/stm8l_clk.c: 815: CLK->ICKCR |= (uint8_t)(CLK_Halt);
      008794 1A 04            [ 1]  491 	or	a, (0x04, sp)
      008796 C7 50 C2         [ 1]  492 	ld	0x50c2, a
      008799 20 0C            [ 2]  493 	jra	00104$
      00879B                        494 00102$:
                                    495 ;	libs/stm8l_clk.c: 819: CLK->ICKCR &= (uint8_t)(~CLK_Halt);
      00879B 88               [ 1]  496 	push	a
      00879C 7B 05            [ 1]  497 	ld	a, (0x05, sp)
      00879E 43               [ 1]  498 	cpl	a
      00879F 6B 02            [ 1]  499 	ld	(0x02, sp), a
      0087A1 84               [ 1]  500 	pop	a
      0087A2 14 01            [ 1]  501 	and	a, (0x01, sp)
      0087A4 C7 50 C2         [ 1]  502 	ld	0x50c2, a
      0087A7                        503 00104$:
                                    504 ;	libs/stm8l_clk.c: 821: }
      0087A7 84               [ 1]  505 	pop	a
      0087A8 81               [ 4]  506 	ret
                                    507 ;	libs/stm8l_clk.c: 831: void CLK_MainRegulatorCmd(FunctionalState NewState)
                                    508 ;	-----------------------------------------
                                    509 ;	 function CLK_MainRegulatorCmd
                                    510 ;	-----------------------------------------
      0087A9                        511 _CLK_MainRegulatorCmd:
                                    512 ;	libs/stm8l_clk.c: 839: CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
      0087A9 C6 50 CF         [ 1]  513 	ld	a, 0x50cf
                                    514 ;	libs/stm8l_clk.c: 836: if (NewState != DISABLE)
      0087AC 0D 03            [ 1]  515 	tnz	(0x03, sp)
      0087AE 27 06            [ 1]  516 	jreq	00102$
                                    517 ;	libs/stm8l_clk.c: 839: CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
      0087B0 A4 FD            [ 1]  518 	and	a, #0xfd
      0087B2 C7 50 CF         [ 1]  519 	ld	0x50cf, a
      0087B5 81               [ 4]  520 	ret
      0087B6                        521 00102$:
                                    522 ;	libs/stm8l_clk.c: 844: CLK->REGCSR |= CLK_REGCSR_REGOFF;
      0087B6 AA 02            [ 1]  523 	or	a, #0x02
      0087B8 C7 50 CF         [ 1]  524 	ld	0x50cf, a
                                    525 ;	libs/stm8l_clk.c: 846: }
      0087BB 81               [ 4]  526 	ret
                                    527 ;	libs/stm8l_clk.c: 875: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    528 ;	-----------------------------------------
                                    529 ;	 function CLK_ITConfig
                                    530 ;	-----------------------------------------
      0087BC                        531 _CLK_ITConfig:
      0087BC 88               [ 1]  532 	push	a
                                    533 ;	libs/stm8l_clk.c: 884: if (CLK_IT == CLK_IT_SWIF)
      0087BD 7B 04            [ 1]  534 	ld	a, (0x04, sp)
      0087BF A0 1C            [ 1]  535 	sub	a, #0x1c
      0087C1 26 04            [ 1]  536 	jrne	00144$
      0087C3 4C               [ 1]  537 	inc	a
      0087C4 6B 01            [ 1]  538 	ld	(0x01, sp), a
      0087C6 C5                     539 	.byte 0xc5
      0087C7                        540 00144$:
      0087C7 0F 01            [ 1]  541 	clr	(0x01, sp)
      0087C9                        542 00145$:
                                    543 ;	libs/stm8l_clk.c: 889: else if (CLK_IT == CLK_IT_LSECSSF)
      0087C9 7B 04            [ 1]  544 	ld	a, (0x04, sp)
      0087CB A0 2C            [ 1]  545 	sub	a, #0x2c
      0087CD 26 02            [ 1]  546 	jrne	00147$
      0087CF 4C               [ 1]  547 	inc	a
      0087D0 21                     548 	.byte 0x21
      0087D1                        549 00147$:
      0087D1 4F               [ 1]  550 	clr	a
      0087D2                        551 00148$:
                                    552 ;	libs/stm8l_clk.c: 882: if (NewState != DISABLE)
      0087D2 0D 05            [ 1]  553 	tnz	(0x05, sp)
      0087D4 27 19            [ 1]  554 	jreq	00114$
                                    555 ;	libs/stm8l_clk.c: 884: if (CLK_IT == CLK_IT_SWIF)
      0087D6 0D 01            [ 1]  556 	tnz	(0x01, sp)
      0087D8 27 06            [ 1]  557 	jreq	00105$
                                    558 ;	libs/stm8l_clk.c: 887: CLK->SWCR |= CLK_SWCR_SWIEN;
      0087DA 72 14 50 C9      [ 1]  559 	bset	20681, #2
      0087DE 20 26            [ 2]  560 	jra	00116$
      0087E0                        561 00105$:
                                    562 ;	libs/stm8l_clk.c: 889: else if (CLK_IT == CLK_IT_LSECSSF)
      0087E0 4D               [ 1]  563 	tnz	a
      0087E1 27 06            [ 1]  564 	jreq	00102$
                                    565 ;	libs/stm8l_clk.c: 892: CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
      0087E3 72 14 51 90      [ 1]  566 	bset	20880, #2
      0087E7 20 1D            [ 2]  567 	jra	00116$
      0087E9                        568 00102$:
                                    569 ;	libs/stm8l_clk.c: 897: CLK->CSSR |= CLK_CSSR_CSSDIE;
      0087E9 72 14 50 CA      [ 1]  570 	bset	20682, #2
      0087ED 20 17            [ 2]  571 	jra	00116$
      0087EF                        572 00114$:
                                    573 ;	libs/stm8l_clk.c: 902: if (CLK_IT == CLK_IT_SWIF)
      0087EF 0D 01            [ 1]  574 	tnz	(0x01, sp)
      0087F1 27 06            [ 1]  575 	jreq	00111$
                                    576 ;	libs/stm8l_clk.c: 905: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      0087F3 72 15 50 C9      [ 1]  577 	bres	20681, #2
      0087F7 20 0D            [ 2]  578 	jra	00116$
      0087F9                        579 00111$:
                                    580 ;	libs/stm8l_clk.c: 907: else if (CLK_IT == CLK_IT_LSECSSF)
      0087F9 4D               [ 1]  581 	tnz	a
      0087FA 27 06            [ 1]  582 	jreq	00108$
                                    583 ;	libs/stm8l_clk.c: 910: CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
      0087FC 72 15 51 90      [ 1]  584 	bres	20880, #2
      008800 20 04            [ 2]  585 	jra	00116$
      008802                        586 00108$:
                                    587 ;	libs/stm8l_clk.c: 915: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      008802 72 15 50 CA      [ 1]  588 	bres	20682, #2
      008806                        589 00116$:
                                    590 ;	libs/stm8l_clk.c: 918: }
      008806 84               [ 1]  591 	pop	a
      008807 81               [ 4]  592 	ret
                                    593 ;	libs/stm8l_clk.c: 945: FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
                                    594 ;	-----------------------------------------
                                    595 ;	 function CLK_GetFlagStatus
                                    596 ;	-----------------------------------------
      008808                        597 _CLK_GetFlagStatus:
      008808 88               [ 1]  598 	push	a
                                    599 ;	libs/stm8l_clk.c: 955: reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
      008809 7B 04            [ 1]  600 	ld	a, (0x04, sp)
      00880B A4 F0            [ 1]  601 	and	a, #0xf0
                                    602 ;	libs/stm8l_clk.c: 958: pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
      00880D 88               [ 1]  603 	push	a
      00880E 7B 05            [ 1]  604 	ld	a, (0x05, sp)
      008810 A4 0F            [ 1]  605 	and	a, #0x0f
      008812 97               [ 1]  606 	ld	xl, a
      008813 84               [ 1]  607 	pop	a
                                    608 ;	libs/stm8l_clk.c: 960: if (reg == 0x00) /* The flag to check is in CRTC Rregister */
      008814 4D               [ 1]  609 	tnz	a
      008815 26 05            [ 1]  610 	jrne	00123$
                                    611 ;	libs/stm8l_clk.c: 962: reg = CLK->CRTCR;
      008817 C6 50 C1         [ 1]  612 	ld	a, 0x50c1
      00881A 20 42            [ 2]  613 	jra	00124$
      00881C                        614 00123$:
                                    615 ;	libs/stm8l_clk.c: 964: else if (reg == 0x10) /* The flag to check is in ICKCR register */
      00881C A1 10            [ 1]  616 	cp	a, #0x10
      00881E 26 05            [ 1]  617 	jrne	00120$
                                    618 ;	libs/stm8l_clk.c: 966: reg = CLK->ICKCR;
      008820 C6 50 C2         [ 1]  619 	ld	a, 0x50c2
      008823 20 39            [ 2]  620 	jra	00124$
      008825                        621 00120$:
                                    622 ;	libs/stm8l_clk.c: 968: else if (reg == 0x20) /* The flag to check is in CCOR register */
      008825 A1 20            [ 1]  623 	cp	a, #0x20
      008827 26 05            [ 1]  624 	jrne	00117$
                                    625 ;	libs/stm8l_clk.c: 970: reg = CLK->CCOR;
      008829 C6 50 C5         [ 1]  626 	ld	a, 0x50c5
      00882C 20 30            [ 2]  627 	jra	00124$
      00882E                        628 00117$:
                                    629 ;	libs/stm8l_clk.c: 972: else if (reg == 0x30) /* The flag to check is in ECKCR register */
      00882E A1 30            [ 1]  630 	cp	a, #0x30
      008830 26 05            [ 1]  631 	jrne	00114$
                                    632 ;	libs/stm8l_clk.c: 974: reg = CLK->ECKCR;
      008832 C6 50 C6         [ 1]  633 	ld	a, 0x50c6
      008835 20 27            [ 2]  634 	jra	00124$
      008837                        635 00114$:
                                    636 ;	libs/stm8l_clk.c: 976: else if (reg == 0x40) /* The flag to check is in SWCR register */
      008837 A1 40            [ 1]  637 	cp	a, #0x40
      008839 26 05            [ 1]  638 	jrne	00111$
                                    639 ;	libs/stm8l_clk.c: 978: reg = CLK->SWCR;
      00883B C6 50 C9         [ 1]  640 	ld	a, 0x50c9
      00883E 20 1E            [ 2]  641 	jra	00124$
      008840                        642 00111$:
                                    643 ;	libs/stm8l_clk.c: 980: else if (reg == 0x50) /* The flag to check is in CSSR register */
      008840 A1 50            [ 1]  644 	cp	a, #0x50
      008842 26 05            [ 1]  645 	jrne	00108$
                                    646 ;	libs/stm8l_clk.c: 982: reg = CLK->CSSR;
      008844 C6 50 CA         [ 1]  647 	ld	a, 0x50ca
      008847 20 15            [ 2]  648 	jra	00124$
      008849                        649 00108$:
                                    650 ;	libs/stm8l_clk.c: 984: else if (reg == 0x70) /* The flag to check is in REGCSR register */
      008849 A1 70            [ 1]  651 	cp	a, #0x70
      00884B 26 05            [ 1]  652 	jrne	00105$
                                    653 ;	libs/stm8l_clk.c: 986: reg = CLK->REGCSR;
      00884D C6 50 CF         [ 1]  654 	ld	a, 0x50cf
      008850 20 0C            [ 2]  655 	jra	00124$
      008852                        656 00105$:
                                    657 ;	libs/stm8l_clk.c: 988: else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
      008852 A1 80            [ 1]  658 	cp	a, #0x80
      008854 26 05            [ 1]  659 	jrne	00102$
                                    660 ;	libs/stm8l_clk.c: 990: reg = CSSLSE->CSR;
      008856 C6 51 90         [ 1]  661 	ld	a, 0x5190
      008859 20 03            [ 2]  662 	jra	00124$
      00885B                        663 00102$:
                                    664 ;	libs/stm8l_clk.c: 994: reg = CLK->CBEEPR;
      00885B C6 50 CB         [ 1]  665 	ld	a, 0x50cb
      00885E                        666 00124$:
                                    667 ;	libs/stm8l_clk.c: 998: if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
      00885E 88               [ 1]  668 	push	a
      00885F A6 01            [ 1]  669 	ld	a, #0x01
      008861 6B 02            [ 1]  670 	ld	(0x02, sp), a
      008863 9F               [ 1]  671 	ld	a, xl
      008864 4D               [ 1]  672 	tnz	a
      008865 27 05            [ 1]  673 	jreq	00198$
      008867                        674 00197$:
      008867 08 02            [ 1]  675 	sll	(0x02, sp)
      008869 4A               [ 1]  676 	dec	a
      00886A 26 FB            [ 1]  677 	jrne	00197$
      00886C                        678 00198$:
      00886C 84               [ 1]  679 	pop	a
      00886D 14 01            [ 1]  680 	and	a, (0x01, sp)
      00886F 27 03            [ 1]  681 	jreq	00126$
                                    682 ;	libs/stm8l_clk.c: 1000: bitstatus = SET;
      008871 A6 01            [ 1]  683 	ld	a, #0x01
                                    684 ;	libs/stm8l_clk.c: 1004: bitstatus = RESET;
      008873 21                     685 	.byte 0x21
      008874                        686 00126$:
      008874 4F               [ 1]  687 	clr	a
      008875                        688 00127$:
                                    689 ;	libs/stm8l_clk.c: 1008: return((FlagStatus)bitstatus);
                                    690 ;	libs/stm8l_clk.c: 1009: }
      008875 5B 01            [ 2]  691 	addw	sp, #1
      008877 81               [ 4]  692 	ret
                                    693 ;	libs/stm8l_clk.c: 1016: void CLK_ClearFlag(void)
                                    694 ;	-----------------------------------------
                                    695 ;	 function CLK_ClearFlag
                                    696 ;	-----------------------------------------
      008878                        697 _CLK_ClearFlag:
                                    698 ;	libs/stm8l_clk.c: 1020: CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
      008878 72 17 51 90      [ 1]  699 	bres	20880, #3
                                    700 ;	libs/stm8l_clk.c: 1021: }
      00887C 81               [ 4]  701 	ret
                                    702 ;	libs/stm8l_clk.c: 1032: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    703 ;	-----------------------------------------
                                    704 ;	 function CLK_GetITStatus
                                    705 ;	-----------------------------------------
      00887D                        706 _CLK_GetITStatus:
                                    707 ;	libs/stm8l_clk.c: 1040: if (CLK_IT == CLK_IT_SWIF)
      00887D 7B 03            [ 1]  708 	ld	a, (0x03, sp)
      00887F A1 1C            [ 1]  709 	cp	a, #0x1c
      008881 26 0D            [ 1]  710 	jrne	00114$
                                    711 ;	libs/stm8l_clk.c: 1043: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008883 C6 50 C9         [ 1]  712 	ld	a, 0x50c9
      008886 14 03            [ 1]  713 	and	a, (0x03, sp)
                                    714 ;	libs/stm8l_clk.c: 1045: bitstatus = SET;
      008888 A0 0C            [ 1]  715 	sub	a, #0x0c
      00888A 26 02            [ 1]  716 	jrne	00102$
      00888C 4C               [ 1]  717 	inc	a
      00888D 81               [ 4]  718 	ret
      00888E                        719 00102$:
                                    720 ;	libs/stm8l_clk.c: 1049: bitstatus = RESET;
      00888E 4F               [ 1]  721 	clr	a
      00888F 81               [ 4]  722 	ret
      008890                        723 00114$:
                                    724 ;	libs/stm8l_clk.c: 1052: else if (CLK_IT == CLK_IT_LSECSSF)
      008890 7B 03            [ 1]  725 	ld	a, (0x03, sp)
      008892 A1 2C            [ 1]  726 	cp	a, #0x2c
      008894 26 0D            [ 1]  727 	jrne	00111$
                                    728 ;	libs/stm8l_clk.c: 1055: if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008896 C6 51 90         [ 1]  729 	ld	a, 0x5190
      008899 14 03            [ 1]  730 	and	a, (0x03, sp)
                                    731 ;	libs/stm8l_clk.c: 1057: bitstatus = SET;
      00889B A0 0C            [ 1]  732 	sub	a, #0x0c
      00889D 26 02            [ 1]  733 	jrne	00105$
      00889F 4C               [ 1]  734 	inc	a
      0088A0 81               [ 4]  735 	ret
      0088A1                        736 00105$:
                                    737 ;	libs/stm8l_clk.c: 1061: bitstatus = RESET;
      0088A1 4F               [ 1]  738 	clr	a
      0088A2 81               [ 4]  739 	ret
      0088A3                        740 00111$:
                                    741 ;	libs/stm8l_clk.c: 1067: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0088A3 C6 50 CA         [ 1]  742 	ld	a, 0x50ca
      0088A6 14 03            [ 1]  743 	and	a, (0x03, sp)
                                    744 ;	libs/stm8l_clk.c: 1069: bitstatus = SET;
      0088A8 A0 0C            [ 1]  745 	sub	a, #0x0c
      0088AA 26 02            [ 1]  746 	jrne	00108$
      0088AC 4C               [ 1]  747 	inc	a
      0088AD 81               [ 4]  748 	ret
      0088AE                        749 00108$:
                                    750 ;	libs/stm8l_clk.c: 1073: bitstatus = RESET;
      0088AE 4F               [ 1]  751 	clr	a
                                    752 ;	libs/stm8l_clk.c: 1078: return bitstatus;
                                    753 ;	libs/stm8l_clk.c: 1079: }
      0088AF 81               [ 4]  754 	ret
                                    755 ;	libs/stm8l_clk.c: 1089: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    756 ;	-----------------------------------------
                                    757 ;	 function CLK_ClearITPendingBit
                                    758 ;	-----------------------------------------
      0088B0                        759 _CLK_ClearITPendingBit:
                                    760 ;	libs/stm8l_clk.c: 1095: if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
      0088B0 7B 03            [ 1]  761 	ld	a, (0x03, sp)
      0088B2 A4 F0            [ 1]  762 	and	a, #0xf0
      0088B4 A1 20            [ 1]  763 	cp	a, #0x20
      0088B6 26 05            [ 1]  764 	jrne	00102$
                                    765 ;	libs/stm8l_clk.c: 1098: CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
      0088B8 72 17 51 90      [ 1]  766 	bres	20880, #3
      0088BC 81               [ 4]  767 	ret
      0088BD                        768 00102$:
                                    769 ;	libs/stm8l_clk.c: 1103: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      0088BD 72 17 50 C9      [ 1]  770 	bres	20681, #3
                                    771 ;	libs/stm8l_clk.c: 1105: }
      0088C1 81               [ 4]  772 	ret
                                    773 	.area CODE
                                    774 	.area CONST
      008090                        775 _SYSDivFactor:
      008090 01                     776 	.db #0x01	; 1
      008091 02                     777 	.db #0x02	; 2
      008092 04                     778 	.db #0x04	; 4
      008093 08                     779 	.db #0x08	; 8
      008094 10                     780 	.db #0x10	; 16
                                    781 	.area INITIALIZER
                                    782 	.area CABS (ABS)
