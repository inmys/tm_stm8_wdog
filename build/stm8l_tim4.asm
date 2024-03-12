;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module stm8l_tim4
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_DeInit
	.globl _TIM4_TimeBaseInit
	.globl _TIM4_PrescalerConfig
	.globl _TIM4_SetCounter
	.globl _TIM4_SetAutoreload
	.globl _TIM4_GetCounter
	.globl _TIM4_GetPrescaler
	.globl _TIM4_UpdateDisableConfig
	.globl _TIM4_UpdateRequestConfig
	.globl _TIM4_ARRPreloadConfig
	.globl _TIM4_SelectOnePulseMode
	.globl _TIM4_Cmd
	.globl _TIM4_ITConfig
	.globl _TIM4_GenerateEvent
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetITStatus
	.globl _TIM4_ClearITPendingBit
	.globl _TIM4_DMACmd
	.globl _TIM4_InternalClockConfig
	.globl _TIM4_SelectInputTrigger
	.globl _TIM4_SelectOutputTrigger
	.globl _TIM4_SelectSlaveMode
	.globl _TIM4_SelectMasterSlaveMode
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	libs/stm8l_tim4.c: 130: void TIM4_DeInit(void)
;	-----------------------------------------
;	 function TIM4_DeInit
;	-----------------------------------------
_TIM4_DeInit:
;	libs/stm8l_tim4.c: 132: TIM4->CR1   = TIM4_CR1_RESET_VALUE;
	mov	0x52e0+0, #0x00
;	libs/stm8l_tim4.c: 133: TIM4->CR2   = TIM4_CR2_RESET_VALUE;
	mov	0x52e1+0, #0x00
;	libs/stm8l_tim4.c: 134: TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
	mov	0x52e2+0, #0x00
;	libs/stm8l_tim4.c: 135: TIM4->IER   = TIM4_IER_RESET_VALUE;
	mov	0x52e4+0, #0x00
;	libs/stm8l_tim4.c: 136: TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
	mov	0x52e7+0, #0x00
;	libs/stm8l_tim4.c: 137: TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
	mov	0x52e8+0, #0x00
;	libs/stm8l_tim4.c: 138: TIM4->ARR   = TIM4_ARR_RESET_VALUE;
	mov	0x52e9+0, #0xff
;	libs/stm8l_tim4.c: 139: TIM4->SR1   = TIM4_SR1_RESET_VALUE;
	mov	0x52e5+0, #0x00
;	libs/stm8l_tim4.c: 140: }
	ret
;	libs/stm8l_tim4.c: 165: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
;	-----------------------------------------
;	 function TIM4_TimeBaseInit
;	-----------------------------------------
_TIM4_TimeBaseInit:
;	libs/stm8l_tim4.c: 171: TIM4->ARR = (uint8_t)(TIM4_Period);
	ldw	x, #0x52e9
	ld	a, (0x04, sp)
	ld	(x), a
;	libs/stm8l_tim4.c: 173: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
	ldw	x, #0x52e8
	ld	a, (0x03, sp)
	ld	(x), a
;	libs/stm8l_tim4.c: 176: TIM4->EGR = TIM4_EventSource_Update;
	mov	0x52e6+0, #0x01
;	libs/stm8l_tim4.c: 177: }
	ret
;	libs/stm8l_tim4.c: 205: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
;	-----------------------------------------
;	 function TIM4_PrescalerConfig
;	-----------------------------------------
_TIM4_PrescalerConfig:
;	libs/stm8l_tim4.c: 213: TIM4->PSCR = (uint8_t) Prescaler;
	ldw	x, #0x52e8
	ld	a, (0x03, sp)
	ld	(x), a
;	libs/stm8l_tim4.c: 218: TIM4->EGR |= TIM4_EGR_UG ;
	ld	a, 0x52e6
;	libs/stm8l_tim4.c: 216: if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
	push	a
	ld	a, (0x05, sp)
	dec	a
	pop	a
	jrne	00102$
;	libs/stm8l_tim4.c: 218: TIM4->EGR |= TIM4_EGR_UG ;
	or	a, #0x01
	ld	0x52e6, a
	ret
00102$:
;	libs/stm8l_tim4.c: 222: TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
	and	a, #0xfe
	ld	0x52e6, a
;	libs/stm8l_tim4.c: 224: }
	ret
;	libs/stm8l_tim4.c: 232: void TIM4_SetCounter(uint8_t Counter)
;	-----------------------------------------
;	 function TIM4_SetCounter
;	-----------------------------------------
_TIM4_SetCounter:
;	libs/stm8l_tim4.c: 235: TIM4->CNTR = (uint8_t)(Counter);
	ldw	x, #0x52e7
	ld	a, (0x03, sp)
	ld	(x), a
;	libs/stm8l_tim4.c: 236: }
	ret
;	libs/stm8l_tim4.c: 244: void TIM4_SetAutoreload(uint8_t Autoreload)
;	-----------------------------------------
;	 function TIM4_SetAutoreload
;	-----------------------------------------
_TIM4_SetAutoreload:
;	libs/stm8l_tim4.c: 247: TIM4->ARR = (uint8_t)(Autoreload);
	ldw	x, #0x52e9
	ld	a, (0x03, sp)
	ld	(x), a
;	libs/stm8l_tim4.c: 248: }
	ret
;	libs/stm8l_tim4.c: 255: uint8_t TIM4_GetCounter(void)
;	-----------------------------------------
;	 function TIM4_GetCounter
;	-----------------------------------------
_TIM4_GetCounter:
;	libs/stm8l_tim4.c: 258: tmpcntr = TIM4->CNTR;
	ld	a, 0x52e7
;	libs/stm8l_tim4.c: 260: return ((uint8_t)tmpcntr);
;	libs/stm8l_tim4.c: 261: }
	ret
;	libs/stm8l_tim4.c: 284: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
;	-----------------------------------------
;	 function TIM4_GetPrescaler
;	-----------------------------------------
_TIM4_GetPrescaler:
;	libs/stm8l_tim4.c: 287: return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
	ld	a, 0x52e8
;	libs/stm8l_tim4.c: 288: }
	ret
;	libs/stm8l_tim4.c: 296: void TIM4_UpdateDisableConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM4_UpdateDisableConfig
;	-----------------------------------------
_TIM4_UpdateDisableConfig:
;	libs/stm8l_tim4.c: 304: TIM4->CR1 |= TIM4_CR1_UDIS ;
	ld	a, 0x52e0
;	libs/stm8l_tim4.c: 302: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	libs/stm8l_tim4.c: 304: TIM4->CR1 |= TIM4_CR1_UDIS ;
	or	a, #0x02
	ld	0x52e0, a
	ret
00102$:
;	libs/stm8l_tim4.c: 308: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
	and	a, #0xfd
	ld	0x52e0, a
;	libs/stm8l_tim4.c: 310: }
	ret
;	libs/stm8l_tim4.c: 320: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
;	-----------------------------------------
;	 function TIM4_UpdateRequestConfig
;	-----------------------------------------
_TIM4_UpdateRequestConfig:
;	libs/stm8l_tim4.c: 328: TIM4->CR1 |= TIM4_CR1_URS ;
	ld	a, 0x52e0
;	libs/stm8l_tim4.c: 326: if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
	push	a
	ld	a, (0x04, sp)
	dec	a
	pop	a
	jrne	00102$
;	libs/stm8l_tim4.c: 328: TIM4->CR1 |= TIM4_CR1_URS ;
	or	a, #0x04
	ld	0x52e0, a
	ret
00102$:
;	libs/stm8l_tim4.c: 332: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
	and	a, #0xfb
	ld	0x52e0, a
;	libs/stm8l_tim4.c: 334: }
	ret
;	libs/stm8l_tim4.c: 342: void TIM4_ARRPreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM4_ARRPreloadConfig
;	-----------------------------------------
_TIM4_ARRPreloadConfig:
;	libs/stm8l_tim4.c: 350: TIM4->CR1 |= TIM4_CR1_ARPE ;
	ld	a, 0x52e0
;	libs/stm8l_tim4.c: 348: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	libs/stm8l_tim4.c: 350: TIM4->CR1 |= TIM4_CR1_ARPE ;
	or	a, #0x80
	ld	0x52e0, a
	ret
00102$:
;	libs/stm8l_tim4.c: 354: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
	and	a, #0x7f
	ld	0x52e0, a
;	libs/stm8l_tim4.c: 356: }
	ret
;	libs/stm8l_tim4.c: 366: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
;	-----------------------------------------
;	 function TIM4_SelectOnePulseMode
;	-----------------------------------------
_TIM4_SelectOnePulseMode:
;	libs/stm8l_tim4.c: 374: TIM4->CR1 |= TIM4_CR1_OPM ;
	ld	a, 0x52e0
;	libs/stm8l_tim4.c: 372: if (TIM4_OPMode == TIM4_OPMode_Single)
	push	a
	ld	a, (0x04, sp)
	dec	a
	pop	a
	jrne	00102$
;	libs/stm8l_tim4.c: 374: TIM4->CR1 |= TIM4_CR1_OPM ;
	or	a, #0x08
	ld	0x52e0, a
	ret
00102$:
;	libs/stm8l_tim4.c: 378: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
	and	a, #0xf7
	ld	0x52e0, a
;	libs/stm8l_tim4.c: 380: }
	ret
;	libs/stm8l_tim4.c: 388: void TIM4_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM4_Cmd
;	-----------------------------------------
_TIM4_Cmd:
;	libs/stm8l_tim4.c: 396: TIM4->CR1 |= TIM4_CR1_CEN ;
	ld	a, 0x52e0
;	libs/stm8l_tim4.c: 394: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	libs/stm8l_tim4.c: 396: TIM4->CR1 |= TIM4_CR1_CEN ;
	or	a, #0x01
	ld	0x52e0, a
	ret
00102$:
;	libs/stm8l_tim4.c: 400: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
	and	a, #0xfe
	ld	0x52e0, a
;	libs/stm8l_tim4.c: 402: }
	ret
;	libs/stm8l_tim4.c: 430: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM4_ITConfig
;	-----------------------------------------
_TIM4_ITConfig:
	push	a
;	libs/stm8l_tim4.c: 439: TIM4->IER |= (uint8_t)TIM4_IT;
	ld	a, 0x52e4
;	libs/stm8l_tim4.c: 436: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	libs/stm8l_tim4.c: 439: TIM4->IER |= (uint8_t)TIM4_IT;
	or	a, (0x04, sp)
	ld	0x52e4, a
	jra	00104$
00102$:
;	libs/stm8l_tim4.c: 444: TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
	push	a
	ld	a, (0x05, sp)
	cpl	a
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	ld	0x52e4, a
00104$:
;	libs/stm8l_tim4.c: 446: }
	pop	a
	ret
;	libs/stm8l_tim4.c: 456: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
;	-----------------------------------------
;	 function TIM4_GenerateEvent
;	-----------------------------------------
_TIM4_GenerateEvent:
;	libs/stm8l_tim4.c: 462: TIM4->EGR |= (uint8_t)TIM4_EventSource;
	ld	a, 0x52e6
	or	a, (0x03, sp)
	ld	0x52e6, a
;	libs/stm8l_tim4.c: 463: }
	ret
;	libs/stm8l_tim4.c: 474: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
;	-----------------------------------------
;	 function TIM4_GetFlagStatus
;	-----------------------------------------
_TIM4_GetFlagStatus:
;	libs/stm8l_tim4.c: 481: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
	ld	a, 0x52e5
	and	a, (0x03, sp)
	jreq	00102$
;	libs/stm8l_tim4.c: 483: bitstatus = SET;
	ld	a, #0x01
	ret
00102$:
;	libs/stm8l_tim4.c: 487: bitstatus = RESET;
	clr	a
;	libs/stm8l_tim4.c: 489: return ((FlagStatus)bitstatus);
;	libs/stm8l_tim4.c: 490: }
	ret
;	libs/stm8l_tim4.c: 500: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
;	-----------------------------------------
;	 function TIM4_ClearFlag
;	-----------------------------------------
_TIM4_ClearFlag:
;	libs/stm8l_tim4.c: 505: TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
	ld	a, (0x03, sp)
	cpl	a
	ld	0x52e5, a
;	libs/stm8l_tim4.c: 506: }
	ret
;	libs/stm8l_tim4.c: 518: ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
;	-----------------------------------------
;	 function TIM4_GetITStatus
;	-----------------------------------------
_TIM4_GetITStatus:
	push	a
;	libs/stm8l_tim4.c: 527: itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
	ld	a, 0x52e5
	and	a, (0x04, sp)
	ld	(0x01, sp), a
;	libs/stm8l_tim4.c: 529: itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
	ld	a, 0x52e4
	and	a, (0x04, sp)
;	libs/stm8l_tim4.c: 531: if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
	tnz	(0x01, sp)
	jreq	00102$
	tnz	a
	jreq	00102$
;	libs/stm8l_tim4.c: 533: bitstatus = (ITStatus)SET;
	ld	a, #0x01
;	libs/stm8l_tim4.c: 537: bitstatus = (ITStatus)RESET;
	.byte 0x21
00102$:
	clr	a
00103$:
;	libs/stm8l_tim4.c: 539: return ((ITStatus)bitstatus);
;	libs/stm8l_tim4.c: 540: }
	addw	sp, #1
	ret
;	libs/stm8l_tim4.c: 550: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
;	-----------------------------------------
;	 function TIM4_ClearITPendingBit
;	-----------------------------------------
_TIM4_ClearITPendingBit:
;	libs/stm8l_tim4.c: 556: TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
	ld	a, (0x03, sp)
	cpl	a
	ld	0x52e5, a
;	libs/stm8l_tim4.c: 557: }
	ret
;	libs/stm8l_tim4.c: 568: void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM4_DMACmd
;	-----------------------------------------
_TIM4_DMACmd:
	push	a
;	libs/stm8l_tim4.c: 577: TIM4->DER |= (uint8_t)TIM4_DMASource;
	ld	a, 0x52e3
;	libs/stm8l_tim4.c: 574: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	libs/stm8l_tim4.c: 577: TIM4->DER |= (uint8_t)TIM4_DMASource;
	or	a, (0x04, sp)
	ld	0x52e3, a
	jra	00104$
00102$:
;	libs/stm8l_tim4.c: 582: TIM4->DER &= (uint8_t)~TIM4_DMASource;
	push	a
	ld	a, (0x05, sp)
	cpl	a
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	ld	0x52e3, a
00104$:
;	libs/stm8l_tim4.c: 584: }
	pop	a
	ret
;	libs/stm8l_tim4.c: 607: void TIM4_InternalClockConfig(void)
;	-----------------------------------------
;	 function TIM4_InternalClockConfig
;	-----------------------------------------
_TIM4_InternalClockConfig:
;	libs/stm8l_tim4.c: 610: TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
	ld	a, 0x52e2
	and	a, #0xf8
	ld	0x52e2, a
;	libs/stm8l_tim4.c: 611: }
	ret
;	libs/stm8l_tim4.c: 651: void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
;	-----------------------------------------
;	 function TIM4_SelectInputTrigger
;	-----------------------------------------
_TIM4_SelectInputTrigger:
;	libs/stm8l_tim4.c: 658: tmpsmcr = TIM4->SMCR;
	ld	a, 0x52e2
;	libs/stm8l_tim4.c: 661: tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
	and	a, #0x8f
;	libs/stm8l_tim4.c: 662: tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
	or	a, (0x03, sp)
;	libs/stm8l_tim4.c: 664: TIM4->SMCR = (uint8_t)tmpsmcr;
	ld	0x52e2, a
;	libs/stm8l_tim4.c: 665: }
	ret
;	libs/stm8l_tim4.c: 676: void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
;	-----------------------------------------
;	 function TIM4_SelectOutputTrigger
;	-----------------------------------------
_TIM4_SelectOutputTrigger:
;	libs/stm8l_tim4.c: 683: tmpcr2 = TIM4->CR2;
	ld	a, 0x52e1
;	libs/stm8l_tim4.c: 686: tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
	and	a, #0x8f
;	libs/stm8l_tim4.c: 689: tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
	or	a, (0x03, sp)
;	libs/stm8l_tim4.c: 691: TIM4->CR2 = tmpcr2;
	ld	0x52e1, a
;	libs/stm8l_tim4.c: 692: }
	ret
;	libs/stm8l_tim4.c: 706: void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
;	-----------------------------------------
;	 function TIM4_SelectSlaveMode
;	-----------------------------------------
_TIM4_SelectSlaveMode:
;	libs/stm8l_tim4.c: 713: tmpsmcr = TIM4->SMCR;
	ld	a, 0x52e2
;	libs/stm8l_tim4.c: 716: tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
	and	a, #0xf8
;	libs/stm8l_tim4.c: 719: tmpsmcr |= (uint8_t)TIM4_SlaveMode;
	or	a, (0x03, sp)
;	libs/stm8l_tim4.c: 721: TIM4->SMCR = tmpsmcr;
	ld	0x52e2, a
;	libs/stm8l_tim4.c: 722: }
	ret
;	libs/stm8l_tim4.c: 730: void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM4_SelectMasterSlaveMode
;	-----------------------------------------
_TIM4_SelectMasterSlaveMode:
;	libs/stm8l_tim4.c: 738: TIM4->SMCR |= TIM4_SMCR_MSM;
	ld	a, 0x52e2
;	libs/stm8l_tim4.c: 736: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	libs/stm8l_tim4.c: 738: TIM4->SMCR |= TIM4_SMCR_MSM;
	or	a, #0x80
	ld	0x52e2, a
	ret
00102$:
;	libs/stm8l_tim4.c: 742: TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
	and	a, #0x7f
	ld	0x52e2, a
;	libs/stm8l_tim4.c: 744: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
