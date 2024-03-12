                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8l_tim4
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_DeInit
                                     12 	.globl _TIM4_TimeBaseInit
                                     13 	.globl _TIM4_PrescalerConfig
                                     14 	.globl _TIM4_SetCounter
                                     15 	.globl _TIM4_SetAutoreload
                                     16 	.globl _TIM4_GetCounter
                                     17 	.globl _TIM4_GetPrescaler
                                     18 	.globl _TIM4_UpdateDisableConfig
                                     19 	.globl _TIM4_UpdateRequestConfig
                                     20 	.globl _TIM4_ARRPreloadConfig
                                     21 	.globl _TIM4_SelectOnePulseMode
                                     22 	.globl _TIM4_Cmd
                                     23 	.globl _TIM4_ITConfig
                                     24 	.globl _TIM4_GenerateEvent
                                     25 	.globl _TIM4_GetFlagStatus
                                     26 	.globl _TIM4_ClearFlag
                                     27 	.globl _TIM4_GetITStatus
                                     28 	.globl _TIM4_ClearITPendingBit
                                     29 	.globl _TIM4_DMACmd
                                     30 	.globl _TIM4_InternalClockConfig
                                     31 	.globl _TIM4_SelectInputTrigger
                                     32 	.globl _TIM4_SelectOutputTrigger
                                     33 	.globl _TIM4_SelectSlaveMode
                                     34 	.globl _TIM4_SelectMasterSlaveMode
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area DATA
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 
                                     48 ; default segment ordering for linker
                                     49 	.area HOME
                                     50 	.area GSINIT
                                     51 	.area GSFINAL
                                     52 	.area CONST
                                     53 	.area INITIALIZER
                                     54 	.area CODE
                                     55 
                                     56 ;--------------------------------------------------------
                                     57 ; global & static initialisations
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area GSINIT
                                     61 	.area GSFINAL
                                     62 	.area GSINIT
                                     63 ;--------------------------------------------------------
                                     64 ; Home
                                     65 ;--------------------------------------------------------
                                     66 	.area HOME
                                     67 	.area HOME
                                     68 ;--------------------------------------------------------
                                     69 ; code
                                     70 ;--------------------------------------------------------
                                     71 	.area CODE
                                     72 ;	libs/stm8l_tim4.c: 130: void TIM4_DeInit(void)
                                     73 ;	-----------------------------------------
                                     74 ;	 function TIM4_DeInit
                                     75 ;	-----------------------------------------
      0088C2                         76 _TIM4_DeInit:
                                     77 ;	libs/stm8l_tim4.c: 132: TIM4->CR1   = TIM4_CR1_RESET_VALUE;
      0088C2 35 00 52 E0      [ 1]   78 	mov	0x52e0+0, #0x00
                                     79 ;	libs/stm8l_tim4.c: 133: TIM4->CR2   = TIM4_CR2_RESET_VALUE;
      0088C6 35 00 52 E1      [ 1]   80 	mov	0x52e1+0, #0x00
                                     81 ;	libs/stm8l_tim4.c: 134: TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
      0088CA 35 00 52 E2      [ 1]   82 	mov	0x52e2+0, #0x00
                                     83 ;	libs/stm8l_tim4.c: 135: TIM4->IER   = TIM4_IER_RESET_VALUE;
      0088CE 35 00 52 E4      [ 1]   84 	mov	0x52e4+0, #0x00
                                     85 ;	libs/stm8l_tim4.c: 136: TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
      0088D2 35 00 52 E7      [ 1]   86 	mov	0x52e7+0, #0x00
                                     87 ;	libs/stm8l_tim4.c: 137: TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
      0088D6 35 00 52 E8      [ 1]   88 	mov	0x52e8+0, #0x00
                                     89 ;	libs/stm8l_tim4.c: 138: TIM4->ARR   = TIM4_ARR_RESET_VALUE;
      0088DA 35 FF 52 E9      [ 1]   90 	mov	0x52e9+0, #0xff
                                     91 ;	libs/stm8l_tim4.c: 139: TIM4->SR1   = TIM4_SR1_RESET_VALUE;
      0088DE 35 00 52 E5      [ 1]   92 	mov	0x52e5+0, #0x00
                                     93 ;	libs/stm8l_tim4.c: 140: }
      0088E2 81               [ 4]   94 	ret
                                     95 ;	libs/stm8l_tim4.c: 165: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
                                     96 ;	-----------------------------------------
                                     97 ;	 function TIM4_TimeBaseInit
                                     98 ;	-----------------------------------------
      0088E3                         99 _TIM4_TimeBaseInit:
                                    100 ;	libs/stm8l_tim4.c: 171: TIM4->ARR = (uint8_t)(TIM4_Period);
      0088E3 AE 52 E9         [ 2]  101 	ldw	x, #0x52e9
      0088E6 7B 04            [ 1]  102 	ld	a, (0x04, sp)
      0088E8 F7               [ 1]  103 	ld	(x), a
                                    104 ;	libs/stm8l_tim4.c: 173: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
      0088E9 AE 52 E8         [ 2]  105 	ldw	x, #0x52e8
      0088EC 7B 03            [ 1]  106 	ld	a, (0x03, sp)
      0088EE F7               [ 1]  107 	ld	(x), a
                                    108 ;	libs/stm8l_tim4.c: 176: TIM4->EGR = TIM4_EventSource_Update;
      0088EF 35 01 52 E6      [ 1]  109 	mov	0x52e6+0, #0x01
                                    110 ;	libs/stm8l_tim4.c: 177: }
      0088F3 81               [ 4]  111 	ret
                                    112 ;	libs/stm8l_tim4.c: 205: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
                                    113 ;	-----------------------------------------
                                    114 ;	 function TIM4_PrescalerConfig
                                    115 ;	-----------------------------------------
      0088F4                        116 _TIM4_PrescalerConfig:
                                    117 ;	libs/stm8l_tim4.c: 213: TIM4->PSCR = (uint8_t) Prescaler;
      0088F4 AE 52 E8         [ 2]  118 	ldw	x, #0x52e8
      0088F7 7B 03            [ 1]  119 	ld	a, (0x03, sp)
      0088F9 F7               [ 1]  120 	ld	(x), a
                                    121 ;	libs/stm8l_tim4.c: 218: TIM4->EGR |= TIM4_EGR_UG ;
      0088FA C6 52 E6         [ 1]  122 	ld	a, 0x52e6
                                    123 ;	libs/stm8l_tim4.c: 216: if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
      0088FD 88               [ 1]  124 	push	a
      0088FE 7B 05            [ 1]  125 	ld	a, (0x05, sp)
      008900 4A               [ 1]  126 	dec	a
      008901 84               [ 1]  127 	pop	a
      008902 26 06            [ 1]  128 	jrne	00102$
                                    129 ;	libs/stm8l_tim4.c: 218: TIM4->EGR |= TIM4_EGR_UG ;
      008904 AA 01            [ 1]  130 	or	a, #0x01
      008906 C7 52 E6         [ 1]  131 	ld	0x52e6, a
      008909 81               [ 4]  132 	ret
      00890A                        133 00102$:
                                    134 ;	libs/stm8l_tim4.c: 222: TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
      00890A A4 FE            [ 1]  135 	and	a, #0xfe
      00890C C7 52 E6         [ 1]  136 	ld	0x52e6, a
                                    137 ;	libs/stm8l_tim4.c: 224: }
      00890F 81               [ 4]  138 	ret
                                    139 ;	libs/stm8l_tim4.c: 232: void TIM4_SetCounter(uint8_t Counter)
                                    140 ;	-----------------------------------------
                                    141 ;	 function TIM4_SetCounter
                                    142 ;	-----------------------------------------
      008910                        143 _TIM4_SetCounter:
                                    144 ;	libs/stm8l_tim4.c: 235: TIM4->CNTR = (uint8_t)(Counter);
      008910 AE 52 E7         [ 2]  145 	ldw	x, #0x52e7
      008913 7B 03            [ 1]  146 	ld	a, (0x03, sp)
      008915 F7               [ 1]  147 	ld	(x), a
                                    148 ;	libs/stm8l_tim4.c: 236: }
      008916 81               [ 4]  149 	ret
                                    150 ;	libs/stm8l_tim4.c: 244: void TIM4_SetAutoreload(uint8_t Autoreload)
                                    151 ;	-----------------------------------------
                                    152 ;	 function TIM4_SetAutoreload
                                    153 ;	-----------------------------------------
      008917                        154 _TIM4_SetAutoreload:
                                    155 ;	libs/stm8l_tim4.c: 247: TIM4->ARR = (uint8_t)(Autoreload);
      008917 AE 52 E9         [ 2]  156 	ldw	x, #0x52e9
      00891A 7B 03            [ 1]  157 	ld	a, (0x03, sp)
      00891C F7               [ 1]  158 	ld	(x), a
                                    159 ;	libs/stm8l_tim4.c: 248: }
      00891D 81               [ 4]  160 	ret
                                    161 ;	libs/stm8l_tim4.c: 255: uint8_t TIM4_GetCounter(void)
                                    162 ;	-----------------------------------------
                                    163 ;	 function TIM4_GetCounter
                                    164 ;	-----------------------------------------
      00891E                        165 _TIM4_GetCounter:
                                    166 ;	libs/stm8l_tim4.c: 258: tmpcntr = TIM4->CNTR;
      00891E C6 52 E7         [ 1]  167 	ld	a, 0x52e7
                                    168 ;	libs/stm8l_tim4.c: 260: return ((uint8_t)tmpcntr);
                                    169 ;	libs/stm8l_tim4.c: 261: }
      008921 81               [ 4]  170 	ret
                                    171 ;	libs/stm8l_tim4.c: 284: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
                                    172 ;	-----------------------------------------
                                    173 ;	 function TIM4_GetPrescaler
                                    174 ;	-----------------------------------------
      008922                        175 _TIM4_GetPrescaler:
                                    176 ;	libs/stm8l_tim4.c: 287: return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
      008922 C6 52 E8         [ 1]  177 	ld	a, 0x52e8
                                    178 ;	libs/stm8l_tim4.c: 288: }
      008925 81               [ 4]  179 	ret
                                    180 ;	libs/stm8l_tim4.c: 296: void TIM4_UpdateDisableConfig(FunctionalState NewState)
                                    181 ;	-----------------------------------------
                                    182 ;	 function TIM4_UpdateDisableConfig
                                    183 ;	-----------------------------------------
      008926                        184 _TIM4_UpdateDisableConfig:
                                    185 ;	libs/stm8l_tim4.c: 304: TIM4->CR1 |= TIM4_CR1_UDIS ;
      008926 C6 52 E0         [ 1]  186 	ld	a, 0x52e0
                                    187 ;	libs/stm8l_tim4.c: 302: if (NewState != DISABLE)
      008929 0D 03            [ 1]  188 	tnz	(0x03, sp)
      00892B 27 06            [ 1]  189 	jreq	00102$
                                    190 ;	libs/stm8l_tim4.c: 304: TIM4->CR1 |= TIM4_CR1_UDIS ;
      00892D AA 02            [ 1]  191 	or	a, #0x02
      00892F C7 52 E0         [ 1]  192 	ld	0x52e0, a
      008932 81               [ 4]  193 	ret
      008933                        194 00102$:
                                    195 ;	libs/stm8l_tim4.c: 308: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
      008933 A4 FD            [ 1]  196 	and	a, #0xfd
      008935 C7 52 E0         [ 1]  197 	ld	0x52e0, a
                                    198 ;	libs/stm8l_tim4.c: 310: }
      008938 81               [ 4]  199 	ret
                                    200 ;	libs/stm8l_tim4.c: 320: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
                                    201 ;	-----------------------------------------
                                    202 ;	 function TIM4_UpdateRequestConfig
                                    203 ;	-----------------------------------------
      008939                        204 _TIM4_UpdateRequestConfig:
                                    205 ;	libs/stm8l_tim4.c: 328: TIM4->CR1 |= TIM4_CR1_URS ;
      008939 C6 52 E0         [ 1]  206 	ld	a, 0x52e0
                                    207 ;	libs/stm8l_tim4.c: 326: if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
      00893C 88               [ 1]  208 	push	a
      00893D 7B 04            [ 1]  209 	ld	a, (0x04, sp)
      00893F 4A               [ 1]  210 	dec	a
      008940 84               [ 1]  211 	pop	a
      008941 26 06            [ 1]  212 	jrne	00102$
                                    213 ;	libs/stm8l_tim4.c: 328: TIM4->CR1 |= TIM4_CR1_URS ;
      008943 AA 04            [ 1]  214 	or	a, #0x04
      008945 C7 52 E0         [ 1]  215 	ld	0x52e0, a
      008948 81               [ 4]  216 	ret
      008949                        217 00102$:
                                    218 ;	libs/stm8l_tim4.c: 332: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
      008949 A4 FB            [ 1]  219 	and	a, #0xfb
      00894B C7 52 E0         [ 1]  220 	ld	0x52e0, a
                                    221 ;	libs/stm8l_tim4.c: 334: }
      00894E 81               [ 4]  222 	ret
                                    223 ;	libs/stm8l_tim4.c: 342: void TIM4_ARRPreloadConfig(FunctionalState NewState)
                                    224 ;	-----------------------------------------
                                    225 ;	 function TIM4_ARRPreloadConfig
                                    226 ;	-----------------------------------------
      00894F                        227 _TIM4_ARRPreloadConfig:
                                    228 ;	libs/stm8l_tim4.c: 350: TIM4->CR1 |= TIM4_CR1_ARPE ;
      00894F C6 52 E0         [ 1]  229 	ld	a, 0x52e0
                                    230 ;	libs/stm8l_tim4.c: 348: if (NewState != DISABLE)
      008952 0D 03            [ 1]  231 	tnz	(0x03, sp)
      008954 27 06            [ 1]  232 	jreq	00102$
                                    233 ;	libs/stm8l_tim4.c: 350: TIM4->CR1 |= TIM4_CR1_ARPE ;
      008956 AA 80            [ 1]  234 	or	a, #0x80
      008958 C7 52 E0         [ 1]  235 	ld	0x52e0, a
      00895B 81               [ 4]  236 	ret
      00895C                        237 00102$:
                                    238 ;	libs/stm8l_tim4.c: 354: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
      00895C A4 7F            [ 1]  239 	and	a, #0x7f
      00895E C7 52 E0         [ 1]  240 	ld	0x52e0, a
                                    241 ;	libs/stm8l_tim4.c: 356: }
      008961 81               [ 4]  242 	ret
                                    243 ;	libs/stm8l_tim4.c: 366: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
                                    244 ;	-----------------------------------------
                                    245 ;	 function TIM4_SelectOnePulseMode
                                    246 ;	-----------------------------------------
      008962                        247 _TIM4_SelectOnePulseMode:
                                    248 ;	libs/stm8l_tim4.c: 374: TIM4->CR1 |= TIM4_CR1_OPM ;
      008962 C6 52 E0         [ 1]  249 	ld	a, 0x52e0
                                    250 ;	libs/stm8l_tim4.c: 372: if (TIM4_OPMode == TIM4_OPMode_Single)
      008965 88               [ 1]  251 	push	a
      008966 7B 04            [ 1]  252 	ld	a, (0x04, sp)
      008968 4A               [ 1]  253 	dec	a
      008969 84               [ 1]  254 	pop	a
      00896A 26 06            [ 1]  255 	jrne	00102$
                                    256 ;	libs/stm8l_tim4.c: 374: TIM4->CR1 |= TIM4_CR1_OPM ;
      00896C AA 08            [ 1]  257 	or	a, #0x08
      00896E C7 52 E0         [ 1]  258 	ld	0x52e0, a
      008971 81               [ 4]  259 	ret
      008972                        260 00102$:
                                    261 ;	libs/stm8l_tim4.c: 378: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
      008972 A4 F7            [ 1]  262 	and	a, #0xf7
      008974 C7 52 E0         [ 1]  263 	ld	0x52e0, a
                                    264 ;	libs/stm8l_tim4.c: 380: }
      008977 81               [ 4]  265 	ret
                                    266 ;	libs/stm8l_tim4.c: 388: void TIM4_Cmd(FunctionalState NewState)
                                    267 ;	-----------------------------------------
                                    268 ;	 function TIM4_Cmd
                                    269 ;	-----------------------------------------
      008978                        270 _TIM4_Cmd:
                                    271 ;	libs/stm8l_tim4.c: 396: TIM4->CR1 |= TIM4_CR1_CEN ;
      008978 C6 52 E0         [ 1]  272 	ld	a, 0x52e0
                                    273 ;	libs/stm8l_tim4.c: 394: if (NewState != DISABLE)
      00897B 0D 03            [ 1]  274 	tnz	(0x03, sp)
      00897D 27 06            [ 1]  275 	jreq	00102$
                                    276 ;	libs/stm8l_tim4.c: 396: TIM4->CR1 |= TIM4_CR1_CEN ;
      00897F AA 01            [ 1]  277 	or	a, #0x01
      008981 C7 52 E0         [ 1]  278 	ld	0x52e0, a
      008984 81               [ 4]  279 	ret
      008985                        280 00102$:
                                    281 ;	libs/stm8l_tim4.c: 400: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
      008985 A4 FE            [ 1]  282 	and	a, #0xfe
      008987 C7 52 E0         [ 1]  283 	ld	0x52e0, a
                                    284 ;	libs/stm8l_tim4.c: 402: }
      00898A 81               [ 4]  285 	ret
                                    286 ;	libs/stm8l_tim4.c: 430: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
                                    287 ;	-----------------------------------------
                                    288 ;	 function TIM4_ITConfig
                                    289 ;	-----------------------------------------
      00898B                        290 _TIM4_ITConfig:
      00898B 88               [ 1]  291 	push	a
                                    292 ;	libs/stm8l_tim4.c: 439: TIM4->IER |= (uint8_t)TIM4_IT;
      00898C C6 52 E4         [ 1]  293 	ld	a, 0x52e4
                                    294 ;	libs/stm8l_tim4.c: 436: if (NewState != DISABLE)
      00898F 0D 05            [ 1]  295 	tnz	(0x05, sp)
      008991 27 07            [ 1]  296 	jreq	00102$
                                    297 ;	libs/stm8l_tim4.c: 439: TIM4->IER |= (uint8_t)TIM4_IT;
      008993 1A 04            [ 1]  298 	or	a, (0x04, sp)
      008995 C7 52 E4         [ 1]  299 	ld	0x52e4, a
      008998 20 0C            [ 2]  300 	jra	00104$
      00899A                        301 00102$:
                                    302 ;	libs/stm8l_tim4.c: 444: TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
      00899A 88               [ 1]  303 	push	a
      00899B 7B 05            [ 1]  304 	ld	a, (0x05, sp)
      00899D 43               [ 1]  305 	cpl	a
      00899E 6B 02            [ 1]  306 	ld	(0x02, sp), a
      0089A0 84               [ 1]  307 	pop	a
      0089A1 14 01            [ 1]  308 	and	a, (0x01, sp)
      0089A3 C7 52 E4         [ 1]  309 	ld	0x52e4, a
      0089A6                        310 00104$:
                                    311 ;	libs/stm8l_tim4.c: 446: }
      0089A6 84               [ 1]  312 	pop	a
      0089A7 81               [ 4]  313 	ret
                                    314 ;	libs/stm8l_tim4.c: 456: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
                                    315 ;	-----------------------------------------
                                    316 ;	 function TIM4_GenerateEvent
                                    317 ;	-----------------------------------------
      0089A8                        318 _TIM4_GenerateEvent:
                                    319 ;	libs/stm8l_tim4.c: 462: TIM4->EGR |= (uint8_t)TIM4_EventSource;
      0089A8 C6 52 E6         [ 1]  320 	ld	a, 0x52e6
      0089AB 1A 03            [ 1]  321 	or	a, (0x03, sp)
      0089AD C7 52 E6         [ 1]  322 	ld	0x52e6, a
                                    323 ;	libs/stm8l_tim4.c: 463: }
      0089B0 81               [ 4]  324 	ret
                                    325 ;	libs/stm8l_tim4.c: 474: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    326 ;	-----------------------------------------
                                    327 ;	 function TIM4_GetFlagStatus
                                    328 ;	-----------------------------------------
      0089B1                        329 _TIM4_GetFlagStatus:
                                    330 ;	libs/stm8l_tim4.c: 481: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
      0089B1 C6 52 E5         [ 1]  331 	ld	a, 0x52e5
      0089B4 14 03            [ 1]  332 	and	a, (0x03, sp)
      0089B6 27 03            [ 1]  333 	jreq	00102$
                                    334 ;	libs/stm8l_tim4.c: 483: bitstatus = SET;
      0089B8 A6 01            [ 1]  335 	ld	a, #0x01
      0089BA 81               [ 4]  336 	ret
      0089BB                        337 00102$:
                                    338 ;	libs/stm8l_tim4.c: 487: bitstatus = RESET;
      0089BB 4F               [ 1]  339 	clr	a
                                    340 ;	libs/stm8l_tim4.c: 489: return ((FlagStatus)bitstatus);
                                    341 ;	libs/stm8l_tim4.c: 490: }
      0089BC 81               [ 4]  342 	ret
                                    343 ;	libs/stm8l_tim4.c: 500: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    344 ;	-----------------------------------------
                                    345 ;	 function TIM4_ClearFlag
                                    346 ;	-----------------------------------------
      0089BD                        347 _TIM4_ClearFlag:
                                    348 ;	libs/stm8l_tim4.c: 505: TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
      0089BD 7B 03            [ 1]  349 	ld	a, (0x03, sp)
      0089BF 43               [ 1]  350 	cpl	a
      0089C0 C7 52 E5         [ 1]  351 	ld	0x52e5, a
                                    352 ;	libs/stm8l_tim4.c: 506: }
      0089C3 81               [ 4]  353 	ret
                                    354 ;	libs/stm8l_tim4.c: 518: ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
                                    355 ;	-----------------------------------------
                                    356 ;	 function TIM4_GetITStatus
                                    357 ;	-----------------------------------------
      0089C4                        358 _TIM4_GetITStatus:
      0089C4 88               [ 1]  359 	push	a
                                    360 ;	libs/stm8l_tim4.c: 527: itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
      0089C5 C6 52 E5         [ 1]  361 	ld	a, 0x52e5
      0089C8 14 04            [ 1]  362 	and	a, (0x04, sp)
      0089CA 6B 01            [ 1]  363 	ld	(0x01, sp), a
                                    364 ;	libs/stm8l_tim4.c: 529: itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
      0089CC C6 52 E4         [ 1]  365 	ld	a, 0x52e4
      0089CF 14 04            [ 1]  366 	and	a, (0x04, sp)
                                    367 ;	libs/stm8l_tim4.c: 531: if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
      0089D1 0D 01            [ 1]  368 	tnz	(0x01, sp)
      0089D3 27 06            [ 1]  369 	jreq	00102$
      0089D5 4D               [ 1]  370 	tnz	a
      0089D6 27 03            [ 1]  371 	jreq	00102$
                                    372 ;	libs/stm8l_tim4.c: 533: bitstatus = (ITStatus)SET;
      0089D8 A6 01            [ 1]  373 	ld	a, #0x01
                                    374 ;	libs/stm8l_tim4.c: 537: bitstatus = (ITStatus)RESET;
      0089DA 21                     375 	.byte 0x21
      0089DB                        376 00102$:
      0089DB 4F               [ 1]  377 	clr	a
      0089DC                        378 00103$:
                                    379 ;	libs/stm8l_tim4.c: 539: return ((ITStatus)bitstatus);
                                    380 ;	libs/stm8l_tim4.c: 540: }
      0089DC 5B 01            [ 2]  381 	addw	sp, #1
      0089DE 81               [ 4]  382 	ret
                                    383 ;	libs/stm8l_tim4.c: 550: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
                                    384 ;	-----------------------------------------
                                    385 ;	 function TIM4_ClearITPendingBit
                                    386 ;	-----------------------------------------
      0089DF                        387 _TIM4_ClearITPendingBit:
                                    388 ;	libs/stm8l_tim4.c: 556: TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
      0089DF 7B 03            [ 1]  389 	ld	a, (0x03, sp)
      0089E1 43               [ 1]  390 	cpl	a
      0089E2 C7 52 E5         [ 1]  391 	ld	0x52e5, a
                                    392 ;	libs/stm8l_tim4.c: 557: }
      0089E5 81               [ 4]  393 	ret
                                    394 ;	libs/stm8l_tim4.c: 568: void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
                                    395 ;	-----------------------------------------
                                    396 ;	 function TIM4_DMACmd
                                    397 ;	-----------------------------------------
      0089E6                        398 _TIM4_DMACmd:
      0089E6 88               [ 1]  399 	push	a
                                    400 ;	libs/stm8l_tim4.c: 577: TIM4->DER |= (uint8_t)TIM4_DMASource;
      0089E7 C6 52 E3         [ 1]  401 	ld	a, 0x52e3
                                    402 ;	libs/stm8l_tim4.c: 574: if (NewState != DISABLE)
      0089EA 0D 05            [ 1]  403 	tnz	(0x05, sp)
      0089EC 27 07            [ 1]  404 	jreq	00102$
                                    405 ;	libs/stm8l_tim4.c: 577: TIM4->DER |= (uint8_t)TIM4_DMASource;
      0089EE 1A 04            [ 1]  406 	or	a, (0x04, sp)
      0089F0 C7 52 E3         [ 1]  407 	ld	0x52e3, a
      0089F3 20 0C            [ 2]  408 	jra	00104$
      0089F5                        409 00102$:
                                    410 ;	libs/stm8l_tim4.c: 582: TIM4->DER &= (uint8_t)~TIM4_DMASource;
      0089F5 88               [ 1]  411 	push	a
      0089F6 7B 05            [ 1]  412 	ld	a, (0x05, sp)
      0089F8 43               [ 1]  413 	cpl	a
      0089F9 6B 02            [ 1]  414 	ld	(0x02, sp), a
      0089FB 84               [ 1]  415 	pop	a
      0089FC 14 01            [ 1]  416 	and	a, (0x01, sp)
      0089FE C7 52 E3         [ 1]  417 	ld	0x52e3, a
      008A01                        418 00104$:
                                    419 ;	libs/stm8l_tim4.c: 584: }
      008A01 84               [ 1]  420 	pop	a
      008A02 81               [ 4]  421 	ret
                                    422 ;	libs/stm8l_tim4.c: 607: void TIM4_InternalClockConfig(void)
                                    423 ;	-----------------------------------------
                                    424 ;	 function TIM4_InternalClockConfig
                                    425 ;	-----------------------------------------
      008A03                        426 _TIM4_InternalClockConfig:
                                    427 ;	libs/stm8l_tim4.c: 610: TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
      008A03 C6 52 E2         [ 1]  428 	ld	a, 0x52e2
      008A06 A4 F8            [ 1]  429 	and	a, #0xf8
      008A08 C7 52 E2         [ 1]  430 	ld	0x52e2, a
                                    431 ;	libs/stm8l_tim4.c: 611: }
      008A0B 81               [ 4]  432 	ret
                                    433 ;	libs/stm8l_tim4.c: 651: void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
                                    434 ;	-----------------------------------------
                                    435 ;	 function TIM4_SelectInputTrigger
                                    436 ;	-----------------------------------------
      008A0C                        437 _TIM4_SelectInputTrigger:
                                    438 ;	libs/stm8l_tim4.c: 658: tmpsmcr = TIM4->SMCR;
      008A0C C6 52 E2         [ 1]  439 	ld	a, 0x52e2
                                    440 ;	libs/stm8l_tim4.c: 661: tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
      008A0F A4 8F            [ 1]  441 	and	a, #0x8f
                                    442 ;	libs/stm8l_tim4.c: 662: tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
      008A11 1A 03            [ 1]  443 	or	a, (0x03, sp)
                                    444 ;	libs/stm8l_tim4.c: 664: TIM4->SMCR = (uint8_t)tmpsmcr;
      008A13 C7 52 E2         [ 1]  445 	ld	0x52e2, a
                                    446 ;	libs/stm8l_tim4.c: 665: }
      008A16 81               [ 4]  447 	ret
                                    448 ;	libs/stm8l_tim4.c: 676: void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
                                    449 ;	-----------------------------------------
                                    450 ;	 function TIM4_SelectOutputTrigger
                                    451 ;	-----------------------------------------
      008A17                        452 _TIM4_SelectOutputTrigger:
                                    453 ;	libs/stm8l_tim4.c: 683: tmpcr2 = TIM4->CR2;
      008A17 C6 52 E1         [ 1]  454 	ld	a, 0x52e1
                                    455 ;	libs/stm8l_tim4.c: 686: tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
      008A1A A4 8F            [ 1]  456 	and	a, #0x8f
                                    457 ;	libs/stm8l_tim4.c: 689: tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
      008A1C 1A 03            [ 1]  458 	or	a, (0x03, sp)
                                    459 ;	libs/stm8l_tim4.c: 691: TIM4->CR2 = tmpcr2;
      008A1E C7 52 E1         [ 1]  460 	ld	0x52e1, a
                                    461 ;	libs/stm8l_tim4.c: 692: }
      008A21 81               [ 4]  462 	ret
                                    463 ;	libs/stm8l_tim4.c: 706: void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
                                    464 ;	-----------------------------------------
                                    465 ;	 function TIM4_SelectSlaveMode
                                    466 ;	-----------------------------------------
      008A22                        467 _TIM4_SelectSlaveMode:
                                    468 ;	libs/stm8l_tim4.c: 713: tmpsmcr = TIM4->SMCR;
      008A22 C6 52 E2         [ 1]  469 	ld	a, 0x52e2
                                    470 ;	libs/stm8l_tim4.c: 716: tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
      008A25 A4 F8            [ 1]  471 	and	a, #0xf8
                                    472 ;	libs/stm8l_tim4.c: 719: tmpsmcr |= (uint8_t)TIM4_SlaveMode;
      008A27 1A 03            [ 1]  473 	or	a, (0x03, sp)
                                    474 ;	libs/stm8l_tim4.c: 721: TIM4->SMCR = tmpsmcr;
      008A29 C7 52 E2         [ 1]  475 	ld	0x52e2, a
                                    476 ;	libs/stm8l_tim4.c: 722: }
      008A2C 81               [ 4]  477 	ret
                                    478 ;	libs/stm8l_tim4.c: 730: void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
                                    479 ;	-----------------------------------------
                                    480 ;	 function TIM4_SelectMasterSlaveMode
                                    481 ;	-----------------------------------------
      008A2D                        482 _TIM4_SelectMasterSlaveMode:
                                    483 ;	libs/stm8l_tim4.c: 738: TIM4->SMCR |= TIM4_SMCR_MSM;
      008A2D C6 52 E2         [ 1]  484 	ld	a, 0x52e2
                                    485 ;	libs/stm8l_tim4.c: 736: if (NewState != DISABLE)
      008A30 0D 03            [ 1]  486 	tnz	(0x03, sp)
      008A32 27 06            [ 1]  487 	jreq	00102$
                                    488 ;	libs/stm8l_tim4.c: 738: TIM4->SMCR |= TIM4_SMCR_MSM;
      008A34 AA 80            [ 1]  489 	or	a, #0x80
      008A36 C7 52 E2         [ 1]  490 	ld	0x52e2, a
      008A39 81               [ 4]  491 	ret
      008A3A                        492 00102$:
                                    493 ;	libs/stm8l_tim4.c: 742: TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
      008A3A A4 7F            [ 1]  494 	and	a, #0x7f
      008A3C C7 52 E2         [ 1]  495 	ld	0x52e2, a
                                    496 ;	libs/stm8l_tim4.c: 744: }
      008A3F 81               [ 4]  497 	ret
                                    498 	.area CODE
                                    499 	.area CONST
                                    500 	.area INITIALIZER
                                    501 	.area CABS (ABS)
