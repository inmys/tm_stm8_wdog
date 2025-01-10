                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
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
      008884                         76 _TIM4_DeInit:
                                     77 ;	libs/stm8l_tim4.c: 132: TIM4->CR1   = TIM4_CR1_RESET_VALUE;
      008884 35 00 52 E0      [ 1]   78 	mov	0x52e0+0, #0x00
                                     79 ;	libs/stm8l_tim4.c: 133: TIM4->CR2   = TIM4_CR2_RESET_VALUE;
      008888 35 00 52 E1      [ 1]   80 	mov	0x52e1+0, #0x00
                                     81 ;	libs/stm8l_tim4.c: 134: TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
      00888C 35 00 52 E2      [ 1]   82 	mov	0x52e2+0, #0x00
                                     83 ;	libs/stm8l_tim4.c: 135: TIM4->IER   = TIM4_IER_RESET_VALUE;
      008890 35 00 52 E4      [ 1]   84 	mov	0x52e4+0, #0x00
                                     85 ;	libs/stm8l_tim4.c: 136: TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
      008894 35 00 52 E7      [ 1]   86 	mov	0x52e7+0, #0x00
                                     87 ;	libs/stm8l_tim4.c: 137: TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
      008898 35 00 52 E8      [ 1]   88 	mov	0x52e8+0, #0x00
                                     89 ;	libs/stm8l_tim4.c: 138: TIM4->ARR   = TIM4_ARR_RESET_VALUE;
      00889C 35 FF 52 E9      [ 1]   90 	mov	0x52e9+0, #0xff
                                     91 ;	libs/stm8l_tim4.c: 139: TIM4->SR1   = TIM4_SR1_RESET_VALUE;
      0088A0 35 00 52 E5      [ 1]   92 	mov	0x52e5+0, #0x00
                                     93 ;	libs/stm8l_tim4.c: 140: }
      0088A4 81               [ 4]   94 	ret
                                     95 ;	libs/stm8l_tim4.c: 165: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
                                     96 ;	-----------------------------------------
                                     97 ;	 function TIM4_TimeBaseInit
                                     98 ;	-----------------------------------------
      0088A5                         99 _TIM4_TimeBaseInit:
                                    100 ;	libs/stm8l_tim4.c: 171: TIM4->ARR = (uint8_t)(TIM4_Period);
      0088A5 AE 52 E9         [ 2]  101 	ldw	x, #0x52e9
      0088A8 88               [ 1]  102 	push	a
      0088A9 7B 04            [ 1]  103 	ld	a, (0x04, sp)
      0088AB F7               [ 1]  104 	ld	(x), a
      0088AC 84               [ 1]  105 	pop	a
                                    106 ;	libs/stm8l_tim4.c: 173: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
      0088AD C7 52 E8         [ 1]  107 	ld	0x52e8, a
                                    108 ;	libs/stm8l_tim4.c: 176: TIM4->EGR = TIM4_EventSource_Update;
      0088B0 35 01 52 E6      [ 1]  109 	mov	0x52e6+0, #0x01
                                    110 ;	libs/stm8l_tim4.c: 177: }
      0088B4 85               [ 2]  111 	popw	x
      0088B5 84               [ 1]  112 	pop	a
      0088B6 FC               [ 2]  113 	jp	(x)
                                    114 ;	libs/stm8l_tim4.c: 205: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
                                    115 ;	-----------------------------------------
                                    116 ;	 function TIM4_PrescalerConfig
                                    117 ;	-----------------------------------------
      0088B7                        118 _TIM4_PrescalerConfig:
                                    119 ;	libs/stm8l_tim4.c: 213: TIM4->PSCR = (uint8_t) Prescaler;
      0088B7 C7 52 E8         [ 1]  120 	ld	0x52e8, a
                                    121 ;	libs/stm8l_tim4.c: 218: TIM4->EGR |= TIM4_EGR_UG ;
      0088BA C6 52 E6         [ 1]  122 	ld	a, 0x52e6
                                    123 ;	libs/stm8l_tim4.c: 216: if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
      0088BD 88               [ 1]  124 	push	a
      0088BE 7B 04            [ 1]  125 	ld	a, (0x04, sp)
      0088C0 4A               [ 1]  126 	dec	a
      0088C1 84               [ 1]  127 	pop	a
      0088C2 26 07            [ 1]  128 	jrne	00102$
                                    129 ;	libs/stm8l_tim4.c: 218: TIM4->EGR |= TIM4_EGR_UG ;
      0088C4 AA 01            [ 1]  130 	or	a, #0x01
      0088C6 C7 52 E6         [ 1]  131 	ld	0x52e6, a
      0088C9 20 05            [ 2]  132 	jra	00104$
      0088CB                        133 00102$:
                                    134 ;	libs/stm8l_tim4.c: 222: TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
      0088CB A4 FE            [ 1]  135 	and	a, #0xfe
      0088CD C7 52 E6         [ 1]  136 	ld	0x52e6, a
      0088D0                        137 00104$:
                                    138 ;	libs/stm8l_tim4.c: 224: }
      0088D0 85               [ 2]  139 	popw	x
      0088D1 84               [ 1]  140 	pop	a
      0088D2 FC               [ 2]  141 	jp	(x)
                                    142 ;	libs/stm8l_tim4.c: 232: void TIM4_SetCounter(uint8_t Counter)
                                    143 ;	-----------------------------------------
                                    144 ;	 function TIM4_SetCounter
                                    145 ;	-----------------------------------------
      0088D3                        146 _TIM4_SetCounter:
                                    147 ;	libs/stm8l_tim4.c: 235: TIM4->CNTR = (uint8_t)(Counter);
      0088D3 C7 52 E7         [ 1]  148 	ld	0x52e7, a
                                    149 ;	libs/stm8l_tim4.c: 236: }
      0088D6 81               [ 4]  150 	ret
                                    151 ;	libs/stm8l_tim4.c: 244: void TIM4_SetAutoreload(uint8_t Autoreload)
                                    152 ;	-----------------------------------------
                                    153 ;	 function TIM4_SetAutoreload
                                    154 ;	-----------------------------------------
      0088D7                        155 _TIM4_SetAutoreload:
                                    156 ;	libs/stm8l_tim4.c: 247: TIM4->ARR = (uint8_t)(Autoreload);
      0088D7 C7 52 E9         [ 1]  157 	ld	0x52e9, a
                                    158 ;	libs/stm8l_tim4.c: 248: }
      0088DA 81               [ 4]  159 	ret
                                    160 ;	libs/stm8l_tim4.c: 255: uint8_t TIM4_GetCounter(void)
                                    161 ;	-----------------------------------------
                                    162 ;	 function TIM4_GetCounter
                                    163 ;	-----------------------------------------
      0088DB                        164 _TIM4_GetCounter:
                                    165 ;	libs/stm8l_tim4.c: 258: tmpcntr = TIM4->CNTR;
      0088DB C6 52 E7         [ 1]  166 	ld	a, 0x52e7
                                    167 ;	libs/stm8l_tim4.c: 260: return ((uint8_t)tmpcntr);
                                    168 ;	libs/stm8l_tim4.c: 261: }
      0088DE 81               [ 4]  169 	ret
                                    170 ;	libs/stm8l_tim4.c: 284: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
                                    171 ;	-----------------------------------------
                                    172 ;	 function TIM4_GetPrescaler
                                    173 ;	-----------------------------------------
      0088DF                        174 _TIM4_GetPrescaler:
                                    175 ;	libs/stm8l_tim4.c: 287: return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
      0088DF C6 52 E8         [ 1]  176 	ld	a, 0x52e8
                                    177 ;	libs/stm8l_tim4.c: 288: }
      0088E2 81               [ 4]  178 	ret
                                    179 ;	libs/stm8l_tim4.c: 296: void TIM4_UpdateDisableConfig(FunctionalState NewState)
                                    180 ;	-----------------------------------------
                                    181 ;	 function TIM4_UpdateDisableConfig
                                    182 ;	-----------------------------------------
      0088E3                        183 _TIM4_UpdateDisableConfig:
      0088E3 88               [ 1]  184 	push	a
      0088E4 6B 01            [ 1]  185 	ld	(0x01, sp), a
                                    186 ;	libs/stm8l_tim4.c: 304: TIM4->CR1 |= TIM4_CR1_UDIS ;
      0088E6 C6 52 E0         [ 1]  187 	ld	a, 0x52e0
                                    188 ;	libs/stm8l_tim4.c: 302: if (NewState != DISABLE)
      0088E9 0D 01            [ 1]  189 	tnz	(0x01, sp)
      0088EB 27 07            [ 1]  190 	jreq	00102$
                                    191 ;	libs/stm8l_tim4.c: 304: TIM4->CR1 |= TIM4_CR1_UDIS ;
      0088ED AA 02            [ 1]  192 	or	a, #0x02
      0088EF C7 52 E0         [ 1]  193 	ld	0x52e0, a
      0088F2 20 05            [ 2]  194 	jra	00104$
      0088F4                        195 00102$:
                                    196 ;	libs/stm8l_tim4.c: 308: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
      0088F4 A4 FD            [ 1]  197 	and	a, #0xfd
      0088F6 C7 52 E0         [ 1]  198 	ld	0x52e0, a
      0088F9                        199 00104$:
                                    200 ;	libs/stm8l_tim4.c: 310: }
      0088F9 84               [ 1]  201 	pop	a
      0088FA 81               [ 4]  202 	ret
                                    203 ;	libs/stm8l_tim4.c: 320: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
                                    204 ;	-----------------------------------------
                                    205 ;	 function TIM4_UpdateRequestConfig
                                    206 ;	-----------------------------------------
      0088FB                        207 _TIM4_UpdateRequestConfig:
      0088FB 97               [ 1]  208 	ld	xl, a
                                    209 ;	libs/stm8l_tim4.c: 328: TIM4->CR1 |= TIM4_CR1_URS ;
      0088FC C6 52 E0         [ 1]  210 	ld	a, 0x52e0
                                    211 ;	libs/stm8l_tim4.c: 326: if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
      0088FF 88               [ 1]  212 	push	a
      008900 9F               [ 1]  213 	ld	a, xl
      008901 4A               [ 1]  214 	dec	a
      008902 84               [ 1]  215 	pop	a
      008903 26 06            [ 1]  216 	jrne	00102$
                                    217 ;	libs/stm8l_tim4.c: 328: TIM4->CR1 |= TIM4_CR1_URS ;
      008905 AA 04            [ 1]  218 	or	a, #0x04
      008907 C7 52 E0         [ 1]  219 	ld	0x52e0, a
      00890A 81               [ 4]  220 	ret
      00890B                        221 00102$:
                                    222 ;	libs/stm8l_tim4.c: 332: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
      00890B A4 FB            [ 1]  223 	and	a, #0xfb
      00890D C7 52 E0         [ 1]  224 	ld	0x52e0, a
                                    225 ;	libs/stm8l_tim4.c: 334: }
      008910 81               [ 4]  226 	ret
                                    227 ;	libs/stm8l_tim4.c: 342: void TIM4_ARRPreloadConfig(FunctionalState NewState)
                                    228 ;	-----------------------------------------
                                    229 ;	 function TIM4_ARRPreloadConfig
                                    230 ;	-----------------------------------------
      008911                        231 _TIM4_ARRPreloadConfig:
      008911 88               [ 1]  232 	push	a
      008912 6B 01            [ 1]  233 	ld	(0x01, sp), a
                                    234 ;	libs/stm8l_tim4.c: 350: TIM4->CR1 |= TIM4_CR1_ARPE ;
      008914 C6 52 E0         [ 1]  235 	ld	a, 0x52e0
                                    236 ;	libs/stm8l_tim4.c: 348: if (NewState != DISABLE)
      008917 0D 01            [ 1]  237 	tnz	(0x01, sp)
      008919 27 07            [ 1]  238 	jreq	00102$
                                    239 ;	libs/stm8l_tim4.c: 350: TIM4->CR1 |= TIM4_CR1_ARPE ;
      00891B AA 80            [ 1]  240 	or	a, #0x80
      00891D C7 52 E0         [ 1]  241 	ld	0x52e0, a
      008920 20 05            [ 2]  242 	jra	00104$
      008922                        243 00102$:
                                    244 ;	libs/stm8l_tim4.c: 354: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
      008922 A4 7F            [ 1]  245 	and	a, #0x7f
      008924 C7 52 E0         [ 1]  246 	ld	0x52e0, a
      008927                        247 00104$:
                                    248 ;	libs/stm8l_tim4.c: 356: }
      008927 84               [ 1]  249 	pop	a
      008928 81               [ 4]  250 	ret
                                    251 ;	libs/stm8l_tim4.c: 366: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
                                    252 ;	-----------------------------------------
                                    253 ;	 function TIM4_SelectOnePulseMode
                                    254 ;	-----------------------------------------
      008929                        255 _TIM4_SelectOnePulseMode:
      008929 97               [ 1]  256 	ld	xl, a
                                    257 ;	libs/stm8l_tim4.c: 374: TIM4->CR1 |= TIM4_CR1_OPM ;
      00892A C6 52 E0         [ 1]  258 	ld	a, 0x52e0
                                    259 ;	libs/stm8l_tim4.c: 372: if (TIM4_OPMode == TIM4_OPMode_Single)
      00892D 88               [ 1]  260 	push	a
      00892E 9F               [ 1]  261 	ld	a, xl
      00892F 4A               [ 1]  262 	dec	a
      008930 84               [ 1]  263 	pop	a
      008931 26 06            [ 1]  264 	jrne	00102$
                                    265 ;	libs/stm8l_tim4.c: 374: TIM4->CR1 |= TIM4_CR1_OPM ;
      008933 AA 08            [ 1]  266 	or	a, #0x08
      008935 C7 52 E0         [ 1]  267 	ld	0x52e0, a
      008938 81               [ 4]  268 	ret
      008939                        269 00102$:
                                    270 ;	libs/stm8l_tim4.c: 378: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
      008939 A4 F7            [ 1]  271 	and	a, #0xf7
      00893B C7 52 E0         [ 1]  272 	ld	0x52e0, a
                                    273 ;	libs/stm8l_tim4.c: 380: }
      00893E 81               [ 4]  274 	ret
                                    275 ;	libs/stm8l_tim4.c: 388: void TIM4_Cmd(FunctionalState NewState)
                                    276 ;	-----------------------------------------
                                    277 ;	 function TIM4_Cmd
                                    278 ;	-----------------------------------------
      00893F                        279 _TIM4_Cmd:
      00893F 88               [ 1]  280 	push	a
      008940 6B 01            [ 1]  281 	ld	(0x01, sp), a
                                    282 ;	libs/stm8l_tim4.c: 396: TIM4->CR1 |= TIM4_CR1_CEN ;
      008942 C6 52 E0         [ 1]  283 	ld	a, 0x52e0
                                    284 ;	libs/stm8l_tim4.c: 394: if (NewState != DISABLE)
      008945 0D 01            [ 1]  285 	tnz	(0x01, sp)
      008947 27 07            [ 1]  286 	jreq	00102$
                                    287 ;	libs/stm8l_tim4.c: 396: TIM4->CR1 |= TIM4_CR1_CEN ;
      008949 AA 01            [ 1]  288 	or	a, #0x01
      00894B C7 52 E0         [ 1]  289 	ld	0x52e0, a
      00894E 20 05            [ 2]  290 	jra	00104$
      008950                        291 00102$:
                                    292 ;	libs/stm8l_tim4.c: 400: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
      008950 A4 FE            [ 1]  293 	and	a, #0xfe
      008952 C7 52 E0         [ 1]  294 	ld	0x52e0, a
      008955                        295 00104$:
                                    296 ;	libs/stm8l_tim4.c: 402: }
      008955 84               [ 1]  297 	pop	a
      008956 81               [ 4]  298 	ret
                                    299 ;	libs/stm8l_tim4.c: 430: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
                                    300 ;	-----------------------------------------
                                    301 ;	 function TIM4_ITConfig
                                    302 ;	-----------------------------------------
      008957                        303 _TIM4_ITConfig:
      008957 88               [ 1]  304 	push	a
                                    305 ;	libs/stm8l_tim4.c: 439: TIM4->IER |= (uint8_t)TIM4_IT;
      008958 AE 52 E4         [ 2]  306 	ldw	x, #0x52e4
      00895B 88               [ 1]  307 	push	a
      00895C F6               [ 1]  308 	ld	a, (x)
      00895D 6B 02            [ 1]  309 	ld	(0x02, sp), a
      00895F 84               [ 1]  310 	pop	a
                                    311 ;	libs/stm8l_tim4.c: 436: if (NewState != DISABLE)
      008960 0D 04            [ 1]  312 	tnz	(0x04, sp)
      008962 27 07            [ 1]  313 	jreq	00102$
                                    314 ;	libs/stm8l_tim4.c: 439: TIM4->IER |= (uint8_t)TIM4_IT;
      008964 1A 01            [ 1]  315 	or	a, (0x01, sp)
      008966 C7 52 E4         [ 1]  316 	ld	0x52e4, a
      008969 20 06            [ 2]  317 	jra	00104$
      00896B                        318 00102$:
                                    319 ;	libs/stm8l_tim4.c: 444: TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
      00896B 43               [ 1]  320 	cpl	a
      00896C 14 01            [ 1]  321 	and	a, (0x01, sp)
      00896E C7 52 E4         [ 1]  322 	ld	0x52e4, a
      008971                        323 00104$:
                                    324 ;	libs/stm8l_tim4.c: 446: }
      008971 84               [ 1]  325 	pop	a
      008972 85               [ 2]  326 	popw	x
      008973 84               [ 1]  327 	pop	a
      008974 FC               [ 2]  328 	jp	(x)
                                    329 ;	libs/stm8l_tim4.c: 456: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
                                    330 ;	-----------------------------------------
                                    331 ;	 function TIM4_GenerateEvent
                                    332 ;	-----------------------------------------
      008975                        333 _TIM4_GenerateEvent:
      008975 88               [ 1]  334 	push	a
      008976 6B 01            [ 1]  335 	ld	(0x01, sp), a
                                    336 ;	libs/stm8l_tim4.c: 462: TIM4->EGR |= (uint8_t)TIM4_EventSource;
      008978 C6 52 E6         [ 1]  337 	ld	a, 0x52e6
      00897B 1A 01            [ 1]  338 	or	a, (0x01, sp)
      00897D C7 52 E6         [ 1]  339 	ld	0x52e6, a
                                    340 ;	libs/stm8l_tim4.c: 463: }
      008980 84               [ 1]  341 	pop	a
      008981 81               [ 4]  342 	ret
                                    343 ;	libs/stm8l_tim4.c: 474: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    344 ;	-----------------------------------------
                                    345 ;	 function TIM4_GetFlagStatus
                                    346 ;	-----------------------------------------
      008982                        347 _TIM4_GetFlagStatus:
      008982 88               [ 1]  348 	push	a
      008983 6B 01            [ 1]  349 	ld	(0x01, sp), a
                                    350 ;	libs/stm8l_tim4.c: 481: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
      008985 C6 52 E5         [ 1]  351 	ld	a, 0x52e5
      008988 14 01            [ 1]  352 	and	a, (0x01, sp)
      00898A 27 03            [ 1]  353 	jreq	00102$
                                    354 ;	libs/stm8l_tim4.c: 483: bitstatus = SET;
      00898C A6 01            [ 1]  355 	ld	a, #0x01
                                    356 ;	libs/stm8l_tim4.c: 487: bitstatus = RESET;
      00898E 21                     357 	.byte 0x21
      00898F                        358 00102$:
      00898F 4F               [ 1]  359 	clr	a
      008990                        360 00103$:
                                    361 ;	libs/stm8l_tim4.c: 489: return ((FlagStatus)bitstatus);
                                    362 ;	libs/stm8l_tim4.c: 490: }
      008990 5B 01            [ 2]  363 	addw	sp, #1
      008992 81               [ 4]  364 	ret
                                    365 ;	libs/stm8l_tim4.c: 500: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    366 ;	-----------------------------------------
                                    367 ;	 function TIM4_ClearFlag
                                    368 ;	-----------------------------------------
      008993                        369 _TIM4_ClearFlag:
                                    370 ;	libs/stm8l_tim4.c: 505: TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
      008993 43               [ 1]  371 	cpl	a
      008994 C7 52 E5         [ 1]  372 	ld	0x52e5, a
                                    373 ;	libs/stm8l_tim4.c: 506: }
      008997 81               [ 4]  374 	ret
                                    375 ;	libs/stm8l_tim4.c: 518: ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
                                    376 ;	-----------------------------------------
                                    377 ;	 function TIM4_GetITStatus
                                    378 ;	-----------------------------------------
      008998                        379 _TIM4_GetITStatus:
      008998 52 02            [ 2]  380 	sub	sp, #2
      00899A 6B 02            [ 1]  381 	ld	(0x02, sp), a
                                    382 ;	libs/stm8l_tim4.c: 527: itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
      00899C C6 52 E5         [ 1]  383 	ld	a, 0x52e5
      00899F 14 02            [ 1]  384 	and	a, (0x02, sp)
      0089A1 6B 01            [ 1]  385 	ld	(0x01, sp), a
                                    386 ;	libs/stm8l_tim4.c: 529: itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
      0089A3 C6 52 E4         [ 1]  387 	ld	a, 0x52e4
      0089A6 14 02            [ 1]  388 	and	a, (0x02, sp)
                                    389 ;	libs/stm8l_tim4.c: 531: if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
      0089A8 0D 01            [ 1]  390 	tnz	(0x01, sp)
      0089AA 27 06            [ 1]  391 	jreq	00102$
      0089AC 4D               [ 1]  392 	tnz	a
      0089AD 27 03            [ 1]  393 	jreq	00102$
                                    394 ;	libs/stm8l_tim4.c: 533: bitstatus = (ITStatus)SET;
      0089AF A6 01            [ 1]  395 	ld	a, #0x01
                                    396 ;	libs/stm8l_tim4.c: 537: bitstatus = (ITStatus)RESET;
      0089B1 21                     397 	.byte 0x21
      0089B2                        398 00102$:
      0089B2 4F               [ 1]  399 	clr	a
      0089B3                        400 00103$:
                                    401 ;	libs/stm8l_tim4.c: 539: return ((ITStatus)bitstatus);
                                    402 ;	libs/stm8l_tim4.c: 540: }
      0089B3 5B 02            [ 2]  403 	addw	sp, #2
      0089B5 81               [ 4]  404 	ret
                                    405 ;	libs/stm8l_tim4.c: 550: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
                                    406 ;	-----------------------------------------
                                    407 ;	 function TIM4_ClearITPendingBit
                                    408 ;	-----------------------------------------
      0089B6                        409 _TIM4_ClearITPendingBit:
                                    410 ;	libs/stm8l_tim4.c: 556: TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
      0089B6 43               [ 1]  411 	cpl	a
      0089B7 C7 52 E5         [ 1]  412 	ld	0x52e5, a
                                    413 ;	libs/stm8l_tim4.c: 557: }
      0089BA 81               [ 4]  414 	ret
                                    415 ;	libs/stm8l_tim4.c: 568: void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
                                    416 ;	-----------------------------------------
                                    417 ;	 function TIM4_DMACmd
                                    418 ;	-----------------------------------------
      0089BB                        419 _TIM4_DMACmd:
      0089BB 88               [ 1]  420 	push	a
                                    421 ;	libs/stm8l_tim4.c: 577: TIM4->DER |= (uint8_t)TIM4_DMASource;
      0089BC AE 52 E3         [ 2]  422 	ldw	x, #0x52e3
      0089BF 88               [ 1]  423 	push	a
      0089C0 F6               [ 1]  424 	ld	a, (x)
      0089C1 6B 02            [ 1]  425 	ld	(0x02, sp), a
      0089C3 84               [ 1]  426 	pop	a
                                    427 ;	libs/stm8l_tim4.c: 574: if (NewState != DISABLE)
      0089C4 0D 04            [ 1]  428 	tnz	(0x04, sp)
      0089C6 27 07            [ 1]  429 	jreq	00102$
                                    430 ;	libs/stm8l_tim4.c: 577: TIM4->DER |= (uint8_t)TIM4_DMASource;
      0089C8 1A 01            [ 1]  431 	or	a, (0x01, sp)
      0089CA C7 52 E3         [ 1]  432 	ld	0x52e3, a
      0089CD 20 06            [ 2]  433 	jra	00104$
      0089CF                        434 00102$:
                                    435 ;	libs/stm8l_tim4.c: 582: TIM4->DER &= (uint8_t)~TIM4_DMASource;
      0089CF 43               [ 1]  436 	cpl	a
      0089D0 14 01            [ 1]  437 	and	a, (0x01, sp)
      0089D2 C7 52 E3         [ 1]  438 	ld	0x52e3, a
      0089D5                        439 00104$:
                                    440 ;	libs/stm8l_tim4.c: 584: }
      0089D5 84               [ 1]  441 	pop	a
      0089D6 85               [ 2]  442 	popw	x
      0089D7 84               [ 1]  443 	pop	a
      0089D8 FC               [ 2]  444 	jp	(x)
                                    445 ;	libs/stm8l_tim4.c: 607: void TIM4_InternalClockConfig(void)
                                    446 ;	-----------------------------------------
                                    447 ;	 function TIM4_InternalClockConfig
                                    448 ;	-----------------------------------------
      0089D9                        449 _TIM4_InternalClockConfig:
                                    450 ;	libs/stm8l_tim4.c: 610: TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
      0089D9 C6 52 E2         [ 1]  451 	ld	a, 0x52e2
      0089DC A4 F8            [ 1]  452 	and	a, #0xf8
      0089DE C7 52 E2         [ 1]  453 	ld	0x52e2, a
                                    454 ;	libs/stm8l_tim4.c: 611: }
      0089E1 81               [ 4]  455 	ret
                                    456 ;	libs/stm8l_tim4.c: 651: void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
                                    457 ;	-----------------------------------------
                                    458 ;	 function TIM4_SelectInputTrigger
                                    459 ;	-----------------------------------------
      0089E2                        460 _TIM4_SelectInputTrigger:
      0089E2 88               [ 1]  461 	push	a
      0089E3 6B 01            [ 1]  462 	ld	(0x01, sp), a
                                    463 ;	libs/stm8l_tim4.c: 658: tmpsmcr = TIM4->SMCR;
      0089E5 C6 52 E2         [ 1]  464 	ld	a, 0x52e2
                                    465 ;	libs/stm8l_tim4.c: 661: tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
      0089E8 A4 8F            [ 1]  466 	and	a, #0x8f
                                    467 ;	libs/stm8l_tim4.c: 662: tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
      0089EA 1A 01            [ 1]  468 	or	a, (0x01, sp)
                                    469 ;	libs/stm8l_tim4.c: 664: TIM4->SMCR = (uint8_t)tmpsmcr;
      0089EC C7 52 E2         [ 1]  470 	ld	0x52e2, a
                                    471 ;	libs/stm8l_tim4.c: 665: }
      0089EF 84               [ 1]  472 	pop	a
      0089F0 81               [ 4]  473 	ret
                                    474 ;	libs/stm8l_tim4.c: 676: void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
                                    475 ;	-----------------------------------------
                                    476 ;	 function TIM4_SelectOutputTrigger
                                    477 ;	-----------------------------------------
      0089F1                        478 _TIM4_SelectOutputTrigger:
      0089F1 88               [ 1]  479 	push	a
      0089F2 6B 01            [ 1]  480 	ld	(0x01, sp), a
                                    481 ;	libs/stm8l_tim4.c: 683: tmpcr2 = TIM4->CR2;
      0089F4 C6 52 E1         [ 1]  482 	ld	a, 0x52e1
                                    483 ;	libs/stm8l_tim4.c: 686: tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
      0089F7 A4 8F            [ 1]  484 	and	a, #0x8f
                                    485 ;	libs/stm8l_tim4.c: 689: tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
      0089F9 1A 01            [ 1]  486 	or	a, (0x01, sp)
                                    487 ;	libs/stm8l_tim4.c: 691: TIM4->CR2 = tmpcr2;
      0089FB C7 52 E1         [ 1]  488 	ld	0x52e1, a
                                    489 ;	libs/stm8l_tim4.c: 692: }
      0089FE 84               [ 1]  490 	pop	a
      0089FF 81               [ 4]  491 	ret
                                    492 ;	libs/stm8l_tim4.c: 706: void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
                                    493 ;	-----------------------------------------
                                    494 ;	 function TIM4_SelectSlaveMode
                                    495 ;	-----------------------------------------
      008A00                        496 _TIM4_SelectSlaveMode:
      008A00 88               [ 1]  497 	push	a
      008A01 6B 01            [ 1]  498 	ld	(0x01, sp), a
                                    499 ;	libs/stm8l_tim4.c: 713: tmpsmcr = TIM4->SMCR;
      008A03 C6 52 E2         [ 1]  500 	ld	a, 0x52e2
                                    501 ;	libs/stm8l_tim4.c: 716: tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
      008A06 A4 F8            [ 1]  502 	and	a, #0xf8
                                    503 ;	libs/stm8l_tim4.c: 719: tmpsmcr |= (uint8_t)TIM4_SlaveMode;
      008A08 1A 01            [ 1]  504 	or	a, (0x01, sp)
                                    505 ;	libs/stm8l_tim4.c: 721: TIM4->SMCR = tmpsmcr;
      008A0A C7 52 E2         [ 1]  506 	ld	0x52e2, a
                                    507 ;	libs/stm8l_tim4.c: 722: }
      008A0D 84               [ 1]  508 	pop	a
      008A0E 81               [ 4]  509 	ret
                                    510 ;	libs/stm8l_tim4.c: 730: void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
                                    511 ;	-----------------------------------------
                                    512 ;	 function TIM4_SelectMasterSlaveMode
                                    513 ;	-----------------------------------------
      008A0F                        514 _TIM4_SelectMasterSlaveMode:
      008A0F 88               [ 1]  515 	push	a
      008A10 6B 01            [ 1]  516 	ld	(0x01, sp), a
                                    517 ;	libs/stm8l_tim4.c: 738: TIM4->SMCR |= TIM4_SMCR_MSM;
      008A12 C6 52 E2         [ 1]  518 	ld	a, 0x52e2
                                    519 ;	libs/stm8l_tim4.c: 736: if (NewState != DISABLE)
      008A15 0D 01            [ 1]  520 	tnz	(0x01, sp)
      008A17 27 07            [ 1]  521 	jreq	00102$
                                    522 ;	libs/stm8l_tim4.c: 738: TIM4->SMCR |= TIM4_SMCR_MSM;
      008A19 AA 80            [ 1]  523 	or	a, #0x80
      008A1B C7 52 E2         [ 1]  524 	ld	0x52e2, a
      008A1E 20 05            [ 2]  525 	jra	00104$
      008A20                        526 00102$:
                                    527 ;	libs/stm8l_tim4.c: 742: TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
      008A20 A4 7F            [ 1]  528 	and	a, #0x7f
      008A22 C7 52 E2         [ 1]  529 	ld	0x52e2, a
      008A25                        530 00104$:
                                    531 ;	libs/stm8l_tim4.c: 744: }
      008A25 84               [ 1]  532 	pop	a
      008A26 81               [ 4]  533 	ret
                                    534 	.area CODE
                                    535 	.area CONST
                                    536 	.area INITIALIZER
                                    537 	.area CABS (ABS)
