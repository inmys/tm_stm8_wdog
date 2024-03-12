;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module stm8l_gpio
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GPIO_DeInit
	.globl _GPIO_Init
	.globl _GPIO_ExternalPullUpConfig
	.globl _GPIO_Write
	.globl _GPIO_WriteBit
	.globl _GPIO_SetBits
	.globl _GPIO_ResetBits
	.globl _GPIO_ToggleBits
	.globl _GPIO_ReadInputData
	.globl _GPIO_ReadInputDataBit
	.globl _GPIO_ReadOutputDataBit
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
;	libs/stm8l_gpio.c: 3: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
;	-----------------------------------------
;	 function GPIO_DeInit
;	-----------------------------------------
_GPIO_DeInit:
;	libs/stm8l_gpio.c: 5: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	ldw	y, (0x03, sp)
	ldw	x, y
	clr	(0x0004, x)
;	libs/stm8l_gpio.c: 6: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	clr	(y)
;	libs/stm8l_gpio.c: 7: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	ldw	x, y
	incw	x
	incw	x
	clr	(x)
;	libs/stm8l_gpio.c: 8: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	ldw	x, y
	clr	(0x0003, x)
;	libs/stm8l_gpio.c: 9: }
	ret
;	libs/stm8l_gpio.c: 12: void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
;	-----------------------------------------
;	 function GPIO_Init
;	-----------------------------------------
_GPIO_Init:
	sub	sp, #5
;	libs/stm8l_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	ldw	y, (0x08, sp)
	ldw	x, y
	addw	x, #0x0004
	ldw	(0x01, sp), x
	ld	a, (x)
	push	a
	ld	a, (0x0b, sp)
	cpl	a
	ld	(0x04, sp), a
	pop	a
	and	a, (0x03, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
;	libs/stm8l_gpio.c: 38: GPIOx->DDR |= GPIO_Pin;
	ldw	x, y
	incw	x
	incw	x
	ldw	(0x04, sp), x
;	libs/stm8l_gpio.c: 28: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
	tnz	(0x0b, sp)
	jrpl	00105$
;	libs/stm8l_gpio.c: 32: GPIOx->ODR |= GPIO_Pin;
	ld	a, (y)
;	libs/stm8l_gpio.c: 30: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
	push	a
	ld	a, (0x0c, sp)
	bcp	a, #0x10
	pop	a
	jreq	00102$
;	libs/stm8l_gpio.c: 32: GPIOx->ODR |= GPIO_Pin;
	or	a, (0x0a, sp)
	ld	(y), a
	jra	00103$
00102$:
;	libs/stm8l_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
	and	a, (0x03, sp)
	ld	(y), a
00103$:
;	libs/stm8l_gpio.c: 38: GPIOx->DDR |= GPIO_Pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
	or	a, (0x0a, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
	jra	00106$
00105$:
;	libs/stm8l_gpio.c: 42: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
	ldw	x, (0x04, sp)
	ld	a, (x)
	and	a, (0x03, sp)
	ldw	x, (0x04, sp)
	ld	(x), a
00106$:
;	libs/stm8l_gpio.c: 51: GPIOx->CR1 |= GPIO_Pin;
	ldw	x, y
	addw	x, #0x0003
	ld	a, (x)
;	libs/stm8l_gpio.c: 49: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
	push	a
	ld	a, (0x0c, sp)
	bcp	a, #0x40
	pop	a
	jreq	00108$
;	libs/stm8l_gpio.c: 51: GPIOx->CR1 |= GPIO_Pin;
	or	a, (0x0a, sp)
	ld	(x), a
	jra	00109$
00108$:
;	libs/stm8l_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
	and	a, (0x03, sp)
	ld	(x), a
00109$:
;	libs/stm8l_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	ldw	x, (0x01, sp)
	ld	a, (x)
;	libs/stm8l_gpio.c: 61: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
	push	a
	ld	a, (0x0c, sp)
	bcp	a, #0x20
	pop	a
	jreq	00111$
;	libs/stm8l_gpio.c: 63: GPIOx->CR2 |= GPIO_Pin;
	or	a, (0x0a, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
	jra	00113$
00111$:
;	libs/stm8l_gpio.c: 66: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	and	a, (0x03, sp)
	ldw	x, (0x01, sp)
	ld	(x), a
00113$:
;	libs/stm8l_gpio.c: 69: }
	addw	sp, #5
	ret
;	libs/stm8l_gpio.c: 71: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
;	-----------------------------------------
;	 function GPIO_ExternalPullUpConfig
;	-----------------------------------------
_GPIO_ExternalPullUpConfig:
	push	a
;	libs/stm8l_gpio.c: 79: GPIOx->CR1 |= GPIO_Pin;
	ldw	x, (0x04, sp)
	addw	x, #0x0003
	ld	a, (x)
;	libs/stm8l_gpio.c: 77: if (NewState != DISABLE) /* External Pull-Up Set*/
	tnz	(0x07, sp)
	jreq	00102$
;	libs/stm8l_gpio.c: 79: GPIOx->CR1 |= GPIO_Pin;
	or	a, (0x06, sp)
	ld	(x), a
	jra	00104$
00102$:
;	libs/stm8l_gpio.c: 82: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
	push	a
	ld	a, (0x07, sp)
	cpl	a
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	ld	(x), a
00104$:
;	libs/stm8l_gpio.c: 84: }
	pop	a
	ret
;	libs/stm8l_gpio.c: 87: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
;	-----------------------------------------
;	 function GPIO_Write
;	-----------------------------------------
_GPIO_Write:
;	libs/stm8l_gpio.c: 89: GPIOx->ODR = GPIO_PortVal;
	ldw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
;	libs/stm8l_gpio.c: 90: }
	ret
;	libs/stm8l_gpio.c: 92: void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
;	-----------------------------------------
;	 function GPIO_WriteBit
;	-----------------------------------------
_GPIO_WriteBit:
	push	a
;	libs/stm8l_gpio.c: 100: GPIOx->ODR |= GPIO_Pin;
	ldw	x, (0x04, sp)
	ld	a, (x)
;	libs/stm8l_gpio.c: 98: if (GPIO_BitVal != RESET)
	tnz	(0x07, sp)
	jreq	00102$
;	libs/stm8l_gpio.c: 100: GPIOx->ODR |= GPIO_Pin;
	or	a, (0x06, sp)
	ld	(x), a
	jra	00104$
00102$:
;	libs/stm8l_gpio.c: 105: GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
	push	a
	ld	a, (0x07, sp)
	cpl	a
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	ld	(x), a
00104$:
;	libs/stm8l_gpio.c: 107: }
	pop	a
	ret
;	libs/stm8l_gpio.c: 109: void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
;	-----------------------------------------
;	 function GPIO_SetBits
;	-----------------------------------------
_GPIO_SetBits:
;	libs/stm8l_gpio.c: 111: GPIOx->ODR |= GPIO_Pin;
	ldw	x, (0x03, sp)
	ld	a, (x)
	or	a, (0x05, sp)
	ld	(x), a
;	libs/stm8l_gpio.c: 112: }
	ret
;	libs/stm8l_gpio.c: 114: void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
;	-----------------------------------------
;	 function GPIO_ResetBits
;	-----------------------------------------
_GPIO_ResetBits:
	push	a
;	libs/stm8l_gpio.c: 116: GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
	ldw	x, (0x04, sp)
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x06, sp)
	cpl	a
	and	a, (0x01, sp)
	ld	(x), a
;	libs/stm8l_gpio.c: 117: }
	pop	a
	ret
;	libs/stm8l_gpio.c: 119: void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
;	-----------------------------------------
;	 function GPIO_ToggleBits
;	-----------------------------------------
_GPIO_ToggleBits:
;	libs/stm8l_gpio.c: 121: GPIOx->ODR ^= GPIO_Pin;
	ldw	x, (0x03, sp)
	ld	a, (x)
	xor	a, (0x05, sp)
	ld	(x), a
;	libs/stm8l_gpio.c: 122: }
	ret
;	libs/stm8l_gpio.c: 124: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
;	-----------------------------------------
;	 function GPIO_ReadInputData
;	-----------------------------------------
_GPIO_ReadInputData:
;	libs/stm8l_gpio.c: 126: return ((uint8_t)GPIOx->IDR);
	ldw	x, (0x03, sp)
	ld	a, (0x1, x)
;	libs/stm8l_gpio.c: 127: }
	ret
;	libs/stm8l_gpio.c: 129: BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
;	-----------------------------------------
;	 function GPIO_ReadInputDataBit
;	-----------------------------------------
_GPIO_ReadInputDataBit:
;	libs/stm8l_gpio.c: 131: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
	ldw	x, (0x03, sp)
	ld	a, (0x1, x)
	and	a, (0x05, sp)
;	libs/stm8l_gpio.c: 132: }
	ret
;	libs/stm8l_gpio.c: 134: BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
;	-----------------------------------------
;	 function GPIO_ReadOutputDataBit
;	-----------------------------------------
_GPIO_ReadOutputDataBit:
;	libs/stm8l_gpio.c: 136: return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
	ldw	x, (0x03, sp)
	ld	a, (x)
	and	a, (0x05, sp)
;	libs/stm8l_gpio.c: 137: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
