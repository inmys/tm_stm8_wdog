#ifndef __STM8L_H
#define __STM8L_H

#define assert_param(a)         {}

typedef unsigned char     uint8_t;
typedef unsigned short    uint16_t;
typedef unsigned long     uint32_t;

#define     __IO    volatile         /*!< defines 'read / write' permissions  */

typedef enum {FALSE = 0, TRUE = !FALSE} bool;

typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus, BitStatus, BitAction;

typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;
#define IS_FUNCTIONALSTATE_OK(STATE) (((STATE) == DISABLE) || ((STATE) == ENABLE))

#if !defined  HSE_VALUE
 #define HSE_VALUE   ((uint32_t)16000000) /*!< Typical Value of the HSE in Hz */
#endif /* HSE_VALUE */

/**
  * @brief Definition of External Low Speed oscillator (LSE) frequency
  */
#if !defined  LSE_VALUE
#define LSE_VALUE   ((uint32_t)32768)   /*!< Typical Value of the LSE in Hz */
#endif /* LSE_VALUE */
/**
  * @brief Definition of Device on-chip RC oscillator frequencies
  */
#if !defined  HSI_VALUE
 #define HSI_VALUE   ((uint32_t)16000000) /*!< Typical Value of the HSI in Hz */
#endif /* HSI_VALUE */

#if !defined  LSI_VALUE
 #define LSI_VALUE   ((uint32_t)38000)    /*!< Typical Value of the LSI in Hz */
#endif /* LSI_VALUE */

typedef struct CSSLSE_struct
{
  __IO uint8_t CSR; /*!<  Control and Status Register*/
}
CSSLSE_TypeDef;

/** @addtogroup CSSLSE_Registers_Reset_Value
  * @{
  */
#define CSSLSE_CSR_RESET_VALUE       ((uint8_t)0x00)

// Bits definition for CSSLSE_CSR register
#define CSSLSE_CSR_SWITCHF            ((uint8_t)0x10)
#define CSSLSE_CSR_CSSF               ((uint8_t)0x08)
#define CSSLSE_CSR_CSSIE              ((uint8_t)0x04)
#define CSSLSE_CSR_SWITCHEN           ((uint8_t)0x02)
#define CSSLSE_CSR_CSSEN              ((uint8_t)0x01)

#define enableInterrupts()      __asm rim; __endasm     // enable interrupts
#define disableInterrupts()     __asm sim; __endasm;    // disable interrupts
#define rim()                   __asm rim; __endasm;    // enable interrupts
#define sim()                   __asm sim; __endasm;    // disable interrupts
#define nop()                   __asm nop; __endasm;    // No Operation
#define trap()                  __asm trap; __endasm;   // Trap (soft IT)
#define wfi()                   __asm wfi;  __endasm;   // Wait For Interrupt
#define halt()                  __asm halt; __endasm;   // Halt

#define INTERRUPT_HANDLER( a, b )       void a(void) __interrupt(b)
#define ISR( a, b )                     void a(void) __interrupt(b)

/******************************************************************************/
/*                          Peripherals Base Address                          */
/******************************************************************************/
#define OPT_BASE                    (uint16_t)0x4800
#define GPIOA_BASE                  (uint16_t)0x5000
#define GPIOB_BASE                  (uint16_t)0x5005
#define GPIOC_BASE                  (uint16_t)0x500A
#define GPIOD_BASE                  (uint16_t)0x500F
#define GPIOE_BASE                  (uint16_t)0x5014
#define GPIOF_BASE                  (uint16_t)0x5019
#define GPIOG_BASE                  (uint16_t)0x501E
#define GPIOH_BASE                  (uint16_t)0x5023
#define GPIOI_BASE                  (uint16_t)0x5028
#define FLASH_BASE                  (uint16_t)0x5050
#define DMA1_BASE                   (uint16_t)0x5070
#define DMA1_Channel0_BASE          (uint16_t)0x5075
#define DMA1_Channel1_BASE          (uint16_t)0x507F
#define DMA1_Channel2_BASE          (uint16_t)0x5089
#define DMA1_Channel3_BASE          (uint16_t)0x5093
#define EXTI_BASE                   (uint16_t)0x50A0
#define CLK_BASE                    (uint16_t)0x50C0
#define CSSLSE_BASE                 (uint16_t)0x5190
#define USART1_BASE                 (uint16_t)0x5230
#define USART2_BASE                 (uint16_t)0x53E0
#define USART3_BASE                 (uint16_t)0x53F0
#define TIM4_BASE                   (uint16_t)0x52E0
#define CFG_BASE                    (uint16_t)0x7F60

/******************************************************************************/
/*                          Peripherals declarations                          */
/******************************************************************************/
#define GPIOA                       ((GPIO_TypeDef *) GPIOA_BASE)
#define GPIOB                       ((GPIO_TypeDef *) GPIOB_BASE)
#define GPIOC                       ((GPIO_TypeDef *) GPIOC_BASE)
#define GPIOD                       ((GPIO_TypeDef *) GPIOD_BASE)
#define GPIOE                       ((GPIO_TypeDef *) GPIOE_BASE)
#define GPIOF                       ((GPIO_TypeDef *) GPIOF_BASE)
#define GPIOG                       ((GPIO_TypeDef *) GPIOG_BASE)
#define GPIOH                       ((GPIO_TypeDef *) GPIOH_BASE)
#define GPIOI                       ((GPIO_TypeDef *) GPIOI_BASE)
#define CLK                         ((CLK_TypeDef *) CLK_BASE)
#define FLASH                       ((FLASH_TypeDef *) FLASH_BASE)
#define DMA1                        ((DMA_TypeDef *) DMA1_BASE)
#define DMA1_Channel0               ((DMA_Channel_TypeDef *) DMA1_Channel0_BASE)
#define DMA1_Channel1               ((DMA_Channel_TypeDef *) DMA1_Channel1_BASE)
#define DMA1_Channel2               ((DMA_Channel_TypeDef *) DMA1_Channel2_BASE)
#define DMA1_Channel3               ((DMA_Channel_TypeDef *) DMA1_Channel3_BASE)
#define CSSLSE                      ((CSSLSE_TypeDef *) CSSLSE_BASE)
#define EXTI                        ((EXTI_TypeDef *) EXTI_BASE)
#define USART1                      ((USART_TypeDef *) USART1_BASE)
#define USART2                      ((USART_TypeDef *) USART2_BASE)
#define USART3                      ((USART_TypeDef *) USART3_BASE)
#define TIM4                        ((TIM4_TypeDef *) TIM4_BASE)
#define CFG                         ((CFG_TypeDef *) CFG_BASE)
#define OPT                         ((OPT_TypeDef *) OPT_BASE)
// -------------------  CLK  ---------------------------------

typedef struct CLK_struct
{
  __IO uint8_t CKDIVR;      /*!< Clock Master Divider Register */
  __IO uint8_t CRTCR;  /*!< RTC Clock selection Register */
  __IO uint8_t ICKCR;     /*!< Internal Clocks Control Register */
  __IO uint8_t PCKENR1;  /*!< Peripheral Clock Gating Register 1 */
  __IO uint8_t PCKENR2;  /*!< Peripheral Clock Gating Register 2 */
  __IO uint8_t CCOR;       /*!< Configurable Clock Output Register */
  __IO uint8_t ECKCR;     /*!< External Clocks Control Register */
  __IO uint8_t SCSR;     /*!< System clock status Register */
  __IO uint8_t SWR;      /*!< System clock Switch Register */
  __IO uint8_t SWCR;     /*!< Switch Control Register */
  __IO uint8_t CSSR;     /*!< Clock Security Sytem Register */
  __IO uint8_t CBEEPR;     /*!< Clock BEEP Register */
  __IO uint8_t HSICALR;     /*!< HSI Calibration Register */
  __IO uint8_t HSITRIMR; /*!< HSI clock Calibration Trimmer Register */
  __IO uint8_t HSIUNLCKR; /*!< HSI Unlock  Register */
  __IO uint8_t REGCSR;  /*!< Main regulator control status register */
  __IO uint8_t PCKENR3;  /*!< Peripheral Clock Gating Register 3 */
}
CLK_TypeDef;

// ------------------- USART ----------------------------------
typedef struct USART_struct
{
  __IO uint8_t SR;   /*!<  USART status register  */
  __IO uint8_t DR;   /*!<  USART data register     */
  __IO uint8_t BRR1; /*!<  USART baud rate register   */
  __IO uint8_t BRR2; /*!<  USART DIV mantissa[11:8] SCIDIV fraction */
  __IO uint8_t CR1;  /*!<  USART control register 1     */
  __IO uint8_t CR2;  /*!<  USART control register 2     */
  __IO uint8_t CR3;  /*!<  USART control register 3      */
  __IO uint8_t CR4;  /*!< USART control register 4      */
  __IO uint8_t CR5;  /*!<  USART control register 5       */
  __IO uint8_t GTR;  /*!<  USART guard time register     */
  __IO uint8_t PSCR; /*!<  USART prescaler register     */
}
USART_TypeDef;

// ------------------- EXTI ------------------------------------
typedef struct EXTI_struct
{
  __IO uint8_t CR1;           /*!<  The four LSB EXTI  pin sensitivity */
  __IO uint8_t CR2;           /*!<  The four MSB EXTI  pin sensitivity */
  __IO uint8_t CR3;           /*!<  EXTI port B & port D sensitivity */
  __IO uint8_t SR1;           /*!<  Pins Status flag register 1 */
  __IO uint8_t SR2;           /*!<  Ports Status flage register 2 */
  __IO uint8_t CONF1;         /*!<  Port interrupt selector */
  uint8_t RESERVED[4];  /*!<  reserved area */
  __IO uint8_t CR4;           /*!<  EXTI port G & port H sensitivity */
  __IO uint8_t CONF2;         /*!<  Port interrupt selector */
}
EXTI_TypeDef;

// ---------------------- GPIO --------------------------------

typedef struct GPIO_struct
{
  __IO uint8_t ODR; /*!< Output Data Register */
  __IO uint8_t IDR; /*!< Input Data Register */
  __IO uint8_t DDR; /*!< Data Direction Register */
  __IO uint8_t CR1; /*!< Configuration Register 1 */
  __IO uint8_t CR2; /*!< Configuration Register 2 */
}
GPIO_TypeDef;

// -------------------- DMA ----------------------------------
typedef struct DMA_struct
{
  __IO uint8_t  GCSR;     /*!<  Global configuration and status register  */
  __IO uint8_t  GIR1;     /*!<  Global interrupt register 1  */
}
DMA_TypeDef;

typedef struct DMA_Channel_struct
{
  __IO uint8_t  CCR;       /*!<  CHx Control register  */
  __IO uint8_t  CSPR;      /*!<  CHx Status & Priority register  */
  __IO uint8_t  CNBTR;     /*!<  CHx Number of Bytes to Tranfer register  */
  __IO uint8_t  CPARH;     /*!<  Peripheral Address High register  */
  __IO uint8_t  CPARL;     /*!<  Peripheral Address Low register  */
  __IO uint8_t  CM0EAR;    /*!<  Memory 0 Extended Address register  (for channel3)*/
  __IO uint8_t  CM0ARH;    /*!<  Memory 0 Address High register  */
  __IO uint8_t  CM0ARL;    /*!<  Memory 0 Address Low register  */
}
DMA_Channel_TypeDef;

// --------------------- TIM 4 -----------------------------
typedef struct TIM4_struct
{
  __IO uint8_t CR1;   /*!< control register 1 */
  __IO uint8_t CR2;   /*!< control register 2 */
  __IO uint8_t SMCR;  /*!< Synchro mode control register */
  __IO uint8_t DER;   /*!< DMA requests enable register */
  __IO uint8_t IER;   /*!< interrupt enable register  */
  __IO uint8_t SR1;   /*!< status register 1    */
  __IO uint8_t EGR;   /*!< event generation register */
  __IO uint8_t CNTR;  /*!< counter register  */
  __IO uint8_t PSCR;  /*!< prescaler register */
  __IO uint8_t ARR;   /*!< auto-reload register */
}
TIM4_TypeDef;


// ------------------- CFG ----------------------------------
typedef struct CFG_struct
{
  __IO uint8_t GCR; /*!< Global Configuration register */
}
CFG_TypeDef;

// -------------------- CLK RESET VALUE ------------------------

#define CLK_CKDIVR_RESET_VALUE    ((uint8_t)0x03)
#define CLK_CRTCR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_ICKCR_RESET_VALUE     ((uint8_t)0x11)
#define CLK_PCKENR1_RESET_VALUE   ((uint8_t)0x00)
#define CLK_PCKENR2_RESET_VALUE   ((uint8_t)0x80)
#define CLK_PCKENR3_RESET_VALUE   ((uint8_t)0x00)
#define CLK_CCOR_RESET_VALUE      ((uint8_t)0x00)
#define CLK_ECKCR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_SCSR_RESET_VALUE      ((uint8_t)0x01)
#define CLK_SWR_RESET_VALUE       ((uint8_t)0x01)
#define CLK_SWCR_RESET_VALUE      ((uint8_t)0x00)
#define CLK_CSSR_RESET_VALUE      ((uint8_t)0x00)
#define CLK_CBEEPR_RESET_VALUE    ((uint8_t)0x00)
#define CLK_HSICALR_RESET_VALUE   ((uint8_t)0x00)
#define CLK_HSITRIMR_RESET_VALUE  ((uint8_t)0x00)
#define CLK_HSIUNLCKR_RESET_VALUE ((uint8_t)0x00)
#define CLK_REGCSR_RESET_VALUE    ((uint8_t)0xB9)

// ---------------------- CFG RESET VALUE --------------------
#define CFG_GCR_RESET_VALUE ((uint8_t)0x00)

// ---------------------- EXTI RESET VALUE --------------------
#define EXTI_CR1_RESET_VALUE   ((uint8_t)0x00)
#define EXTI_CR2_RESET_VALUE   ((uint8_t)0x00)
#define EXTI_CR3_RESET_VALUE   ((uint8_t)0x00)
#define EXTI_CONF1_RESET_VALUE ((uint8_t)0x00)
#define EXTI_SR1_RESET_VALUE   ((uint8_t)0x00)
#define EXTI_SR2_RESET_VALUE   ((uint8_t)0x00)
#define EXTI_CR4_RESET_VALUE   ((uint8_t)0x00)
#define EXTI_CONF2_RESET_VALUE ((uint8_t)0x00)

// ---------------------USART RESET VALUE ------------------------
#define USART_SR_RESET_VALUE ((uint8_t)0xC0)
#define USART_BRR1_RESET_VALUE ((uint8_t)0x00)
#define USART_BRR2_RESET_VALUE ((uint8_t)0x00)
#define USART_CR1_RESET_VALUE ((uint8_t)0x00)
#define USART_CR2_RESET_VALUE ((uint8_t)0x00)
#define USART_CR3_RESET_VALUE ((uint8_t)0x00)
#define USART_CR4_RESET_VALUE ((uint8_t)0x00)

// -------------------- GPIO RESET VALUE -------------------------
#define GPIO_ODR_RESET_VALUE ((uint8_t)0x00)
#define GPIO_DDR_RESET_VALUE ((uint8_t)0x00)
#define GPIO_CR1_RESET_VALUE ((uint8_t)0x00)
#define GPIO_CR2_RESET_VALUE ((uint8_t)0x00)

//-------------------- TIM 4 RESET VALUE ----------------------------------
#define TIM4_CR1_RESET_VALUE    ((uint8_t)0x00)
#define TIM4_CR2_RESET_VALUE    ((uint8_t)0x00)
#define TIM4_SMCR_RESET_VALUE   ((uint8_t)0x00)
#define TIM4_DER_RESET_VALUE    ((uint8_t)0x00)
#define TIM4_IER_RESET_VALUE    ((uint8_t)0x00)
#define TIM4_SR1_RESET_VALUE    ((uint8_t)0x00)
#define TIM4_EGR_RESET_VALUE    ((uint8_t)0x00)
#define TIM4_CNTR_RESET_VALUE   ((uint8_t)0x00)
#define TIM4_PSCR_RESET_VALUE   ((uint8_t)0x00)
#define TIM4_ARR_RESET_VALUE    ((uint8_t)0xFF)

//------------------- DMA RESET VALUE --------------------------------
#define DMA_GCSR_RESET_VALUE       ((uint8_t)0xFC)
#define DMA_GIR1_RESET_VALUE       ((uint8_t)0x00)

#define DMA_CCR_RESET_VALUE          ((uint8_t)0x00)
#define DMA_CSPR_RESET_VALUE         ((uint8_t)0x00)
#define DMA_CNBTR_RESET_VALUE        ((uint8_t)0x00)
#define DMA_CPARH_RESET_VALUE        ((uint8_t)0x52)
#define DMA_C3PARH_RESET_VALUE       ((uint8_t)0x40)
#define DMA_CPARL_RESET_VALUE        ((uint8_t)0x00)
#define DMA_C3M0EAR_RESET_VALUE      ((uint8_t)0x00)
#define DMA_CM0ARH_RESET_VALUE       ((uint8_t)0x00)
#define DMA_CM0ARL_RESET_VALUE       ((uint8_t)0x00) 

// -------------------- CLK CONSTANTS ------------------------

#define CLK_CKDIVR_CKM            ((uint8_t)0x07) /*!< System clock prescaler mask */

#define CLK_CRTCR_RTCDIV          ((uint8_t)0xE0) /*!< RTC clock prescaler  mask*/
#define CLK_CRTCR_RTCSEL          ((uint8_t)0x1E) /*!< RTC clock output selection  mask */
#define CLK_CRTCR_RTCSWBSY        ((uint8_t)0x01) /*!< RTC clock switch busy */

#define CLK_ICKCR_BEEPAHALT       ((uint8_t)0x40) /*!< BEEP clock Active Halt/Halt mode */
#define CLK_ICKCR_FHWU            ((uint8_t)0x20) /*!< Fast Wake-up from Active Halt/Halt mode */
#define CLK_ICKCR_SAHALT          ((uint8_t)0x10) /*!< Slow Active-halt mode */
#define CLK_ICKCR_LSIRDY          ((uint8_t)0x08) /*!< Low speed internal RC oscillator ready */
#define CLK_ICKCR_LSION           ((uint8_t)0x04) /*!< Low speed internal RC oscillator enable */
#define CLK_ICKCR_HSIRDY          ((uint8_t)0x02) /*!< High speed internal RC oscillator ready */
#define CLK_ICKCR_HSION           ((uint8_t)0x01) /*!< High speed internal RC oscillator enable */

#define CLK_PCKENR1_TIM2          ((uint8_t)0x01) /*!< Timer 2 clock enable */
#define CLK_PCKENR1_TIM3          ((uint8_t)0x02) /*!< Timer 3 clock enable */
#define CLK_PCKENR1_TIM4          ((uint8_t)0x04) /*!< Timer 4 clock enable */
#define CLK_PCKENR1_I2C1          ((uint8_t)0x08) /*!< I2C1 clock enable */
#define CLK_PCKENR1_SPI1          ((uint8_t)0x10) /*!< SPI1 clock enable */
#define CLK_PCKENR1_USART1        ((uint8_t)0x20) /*!< USART1 clock enable */
#define CLK_PCKENR1_BEEP          ((uint8_t)0x40) /*!< BEEP clock enable */
#define CLK_PCKENR1_DAC           ((uint8_t)0x80) /*!< DAC clock enable */

#define CLK_PCKENR2_ADC1          ((uint8_t)0x01) /*!< ADC1 clock enable */
#define CLK_PCKENR2_TIM1          ((uint8_t)0x02) /*!< TIM1 clock enable */
#define CLK_PCKENR2_RTC           ((uint8_t)0x04) /*!< RTC clock enable */
#define CLK_PCKENR2_LCD           ((uint8_t)0x08) /*!< LCD clock enable */
#define CLK_PCKENR2_DMA1          ((uint8_t)0x10) /*!< DMA1 clock enable */
#define CLK_PCKENR2_COMP          ((uint8_t)0x20) /*!< Comparator clock enable */
#define CLK_PCKENR2_BOOTROM       ((uint8_t)0x80) /*!< Boot ROM clock enable */

#define CLK_PCKENR3_AES           ((uint8_t)0x01) /*!< AES clock enable */
#define CLK_PCKENR3_TIM5          ((uint8_t)0x02) /*!< Timer 5 clock enable */
#define CLK_PCKENR3_SPI2          ((uint8_t)0x04) /*!< SPI2 clock enable */
#define CLK_PCKENR3_UASRT2        ((uint8_t)0x08) /*!< USART2 clock enable */
#define CLK_PCKENR3_USART3        ((uint8_t)0x10) /*!< USART3 clock enable */

#define CLK_CCOR_CCODIV           ((uint8_t)0xE0) /*!< Configurable Clock output prescaler */
#define CLK_CCOR_CCOSEL           ((uint8_t)0x1E) /*!< Configurable clock output selection */
#define CLK_CCOR_CCOSWBSY         ((uint8_t)0x01) /*!< Configurable clock output switch busy  flag */

#define CLK_ECKCR_LSEBYP          ((uint8_t)0x20) /*!< Low speed external clock bypass */
#define CLK_ECKCR_HSEBYP          ((uint8_t)0x10) /*!< High speed external clock bypass */
#define CLK_ECKCR_LSERDY          ((uint8_t)0x08) /*!< Low speed external crystal oscillator ready */
#define CLK_ECKCR_LSEON           ((uint8_t)0x04) /*!< Low speed external crystal oscillator enable */
#define CLK_ECKCR_HSERDY          ((uint8_t)0x02) /*!< High speed external crystal oscillator ready */
#define CLK_ECKCR_HSEON           ((uint8_t)0x01) /*!< High speed external crystal oscillator enable */

#define CLK_SCSR_CKM              ((uint8_t)0x0F) /*!< System clock status bits */

#define CLK_SWR_SWI               ((uint8_t)0x0F) /*!< System clock selection bits */

#define CLK_SWCR_SWIF             ((uint8_t)0x08) /*!< Clock switch interrupt flag */
#define CLK_SWCR_SWIEN            ((uint8_t)0x04) /*!< Clock switch interrupt enable */
#define CLK_SWCR_SWEN             ((uint8_t)0x02) /*!< Switch start/stop */
#define CLK_SWCR_SWBSY            ((uint8_t)0x01) /*!< Switch busy */

#define CLK_CSSR_CSSDGON          ((uint8_t)0x10) /*!< Clock security sytem deglitcher system */
#define CLK_CSSR_CSSD             ((uint8_t)0x08) /*!< Clock security sytem detection */
#define CLK_CSSR_CSSDIE           ((uint8_t)0x04) /*!< Clock security system detection interrupt enable */
#define CLK_CSSR_AUX              ((uint8_t)0x02) /*!< Auxiliary oscillator connected to master clock */
#define CLK_CSSR_CSSEN            ((uint8_t)0x01) /*!< Clock security system enable */

#define CLK_CBEEPR_CLKBEEPSEL     ((uint8_t)0x06) /*!< Configurable BEEP clock source selection */
#define CLK_CBEEPR_BEEPSWBSY      ((uint8_t)0x01) /*!< BEEP clock busy in switch  */

#define CLK_HSICALR_HSICAL        ((uint8_t)0xFF) /*!<  Copy of otpion byte trimming HSI oscillator */

#define CLK_HSITRIMR_HSITRIM      ((uint8_t)0xFF) /*!< High speed internal oscillator trimmer */

#define CLK_HSIUNLCKR_HSIUNLCK    ((uint8_t)0xFF) /*!< High speed internal oscillator trimmer unlock  */

#define CLK_REGCSR_EEREADY        ((uint8_t)0x80) /*!< Flash program memory and Data EEPROM ready */
#define CLK_REGCSR_EEBUSY         ((uint8_t)0x40) /*!< Flash program memory and Data EEPROM busy */
#define CLK_REGCSR_LSEPD          ((uint8_t)0x20) /*!< LSE power-down */
#define CLK_REGCSR_HSEPD          ((uint8_t)0x10) /*!< HSE power-down */
#define CLK_REGCSR_LSIPD          ((uint8_t)0x08) /*!< LSI power-down */
#define CLK_REGCSR_HSIPD          ((uint8_t)0x04) /*!< HSI power-down */
#define CLK_REGCSR_REGOFF         ((uint8_t)0x02) /*!< Main regulator OFF */
#define CLK_REGCSR_REGREADY       ((uint8_t)0x01) /*!< Main regulator ready */
// ----------------------- DMA CONSTANTS -----------------------------
#define  DMA_GCSR_GE        ((uint8_t)0x01)            /*!<Global Enable */
#define  DMA_GCSR_GB        ((uint8_t)0x02)            /*!<Global Busy */
#define  DMA_GCSR_TO        ((uint8_t)0xFC)            /*!<Time Out */

/*  Bit definition for DMA_GIR1 register  */
#define  DMA_GIR1_IFC0      ((uint8_t)0x01)            /*!< Interrupt Flag Channel 0 */
#define  DMA_GIR1_IFC1      ((uint8_t)0x02)            /*!< Interrupt Flag Channel 1 */
#define  DMA_GIR1_IFC2      ((uint8_t)0x04)            /*!< Interrupt Flag Channel 2 */
#define  DMA_GIR1_IFC3      ((uint8_t)0x08)            /*!< Interrupt Flag Channel 3 */


/*  Bit definition for DMA_CCR registers  */
#define  DMA_CCR_CE         ((uint8_t)0x01)            /*!<Channel enable*/
#define  DMA_CCR_TCIE       ((uint8_t)0x02)            /*!<Transfer complete interrupt enable */
#define  DMA_CCR_HTIE       ((uint8_t)0x04)            /*!<Half Transfer interrupt enable */
#define  DMA_CCR_DTD        ((uint8_t)0x08)            /*!<Data transfer direction */
#define  DMA_CCR_ARM        ((uint8_t)0x10)            /*!<Autorelaod mode Circular buffer mode */
#define  DMA_CCR_IDM        ((uint8_t)0x20)            /*!<Inc/Dec mode */
#define  DMA_CCR_MEM        ((uint8_t)0x40)            /*!<Memory Transfer Enable */


/*  Bit definition for DMA_CSPR registers  */
#define  DMA_CSPR_TCIF      ((uint8_t)0x02)            /*!<Transaction Complete Interrupt Flag*/
#define  DMA_CSPR_HTIF      ((uint8_t)0x04)            /*!<Half Transaction Interrupt Flag*/
#define  DMA_CSPR_16BM      ((uint8_t)0x08)            /*!<16 bit mode*/
#define  DMA_CSPR_PL        ((uint8_t)0x30)            /*!<Channel priority level*/
#define  DMA_CSPR_PEND      ((uint8_t)0x40)            /*!<Channel pending*/
#define  DMA_CSPR_BUSY      ((uint8_t)0x80)            /*!<Channel Busy */


/*  Bit definition for DMA_CNBTR register */
#define  DMA_CNBTR_NDT      ((uint8_t)0xFF)            /*!<Number of data to Transfer */

/*  Bit definition for DMA_CPARH register  */
#define  DMA_CPARH_PA       ((uint8_t)0xFF)        /*!<Peripheral MSB Address Pointer */
/*  Bit definition for DMA_CPARL register  */
#define  DMA_CPARL_PA       ((uint8_t)0xFF)        /*!<Peripheral LSB Address Pointer */


/*  Bit definition for DMA_CMAR registers  */
#define  DMA_CM0EAR_MA      ((uint8_t)0x01)        /* Memory Extended Address Pointer only for channel 3 in Memory to memory transfer*/
#define  DMA_CM0ARH_MA      ((uint8_t)0xFF)        /*!<Memory MSB Address Pointer*/
#define  DMA_CM0ARL_MA      ((uint8_t)0xFF)        /*!<Memory LSB Address Pointer */

// ---------------------- USART CONSTANTS -----------------------------
#define USART_SR_TXE       ((uint8_t)0x80) /*!< Transmit Data Register Empty mask */
#define USART_SR_TC        ((uint8_t)0x40) /*!< Transmission Complete mask */
#define USART_SR_RXNE      ((uint8_t)0x20) /*!< Read Data Register Not Empty mask */
#define USART_SR_IDLE      ((uint8_t)0x10) /*!< IDLE line detected mask */
#define USART_SR_OR        ((uint8_t)0x08) /*!< OverRun error mask */
#define USART_SR_NF        ((uint8_t)0x04) /*!< Noise Flag mask */
#define USART_SR_FE        ((uint8_t)0x02) /*!< Framing Error mask */
#define USART_SR_PE        ((uint8_t)0x01) /*!< Parity Error mask */

#define USART_BRR1_DIVM    ((uint8_t)0xFF) /*!< LSB mantissa of USARTDIV [7:0] mask */

#define USART_BRR2_DIVM    ((uint8_t)0xF0) /*!< MSB mantissa of USARTDIV [11:8] mask */
#define USART_BRR2_DIVF    ((uint8_t)0x0F) /*!< Fraction bits of USARTDIV [3:0] mask */

#define USART_CR1_R8       ((uint8_t)0x80) /*!< Receive Data bit 8 */
#define USART_CR1_T8       ((uint8_t)0x40) /*!< Transmit data bit 8 */
#define USART_CR1_USARTD   ((uint8_t)0x20) /*!< USART Disable (for low power consumption) */
#define USART_CR1_M        ((uint8_t)0x10) /*!< Word length mask */
#define USART_CR1_WAKE     ((uint8_t)0x08) /*!< Wake-up method mask */
#define USART_CR1_PCEN     ((uint8_t)0x04) /*!< Parity Control Enable mask */
#define USART_CR1_PS       ((uint8_t)0x02) /*!< USART Parity Selection */
#define USART_CR1_PIEN     ((uint8_t)0x01) /*!< USART Parity Interrupt Enable mask */

#define USART_CR2_TIEN     ((uint8_t)0x80) /*!< Transmitter Interrupt Enable mask */
#define USART_CR2_TCIEN    ((uint8_t)0x40) /*!< TransmissionComplete Interrupt Enable mask */
#define USART_CR2_RIEN     ((uint8_t)0x20) /*!< Receiver Interrupt Enable mask */
#define USART_CR2_ILIEN    ((uint8_t)0x10) /*!< IDLE Line Interrupt Enable mask */
#define USART_CR2_TEN      ((uint8_t)0x08) /*!< Transmitter Enable mask */
#define USART_CR2_REN      ((uint8_t)0x04) /*!< Receiver Enable mask */
#define USART_CR2_RWU      ((uint8_t)0x02) /*!< Receiver Wake-Up mask */
#define USART_CR2_SBK      ((uint8_t)0x01) /*!< Send Break mask */

#define USART_CR3_STOP     ((uint8_t)0x30) /*!< STOP bits [1:0] mask */
#define USART_CR3_CLKEN    ((uint8_t)0x08) /*!< Clock Enable mask */
#define USART_CR3_CPOL     ((uint8_t)0x04) /*!< Clock Polarity mask */
#define USART_CR3_CPHA     ((uint8_t)0x02) /*!< Clock Phase mask */
#define USART_CR3_LBCL     ((uint8_t)0x01) /*!< Last Bit Clock pulse mask */

#define USART_CR4_ADD      ((uint8_t)0x0F) /*!< Address of the USART node mask */

#define USART_CR5_DMAT     ((uint8_t)0x80) /*!< DMA Enable transmitter mask */
#define USART_CR5_DMAR     ((uint8_t)0x40) /*!< DMA Enable receiver mask */
#define USART_CR5_SCEN     ((uint8_t)0x20) /*!< Smart Card Enable mask */
#define USART_CR5_NACK     ((uint8_t)0x10) /*!< Smart Card Nack Enable mask */
#define USART_CR5_HDSEL    ((uint8_t)0x08) /*!< Half-Duplex Selection mask */
#define USART_CR5_IRLP     ((uint8_t)0x04) /*!< Irda Low Power Selection mask */
#define USART_CR5_IREN     ((uint8_t)0x02) /*!< Irda Enable mask */
#define USART_CR5_EIE      ((uint8_t)0x01) /*!< Error Interrupt mask */

// ----------------------- TIM4 CONSTANTS ------------------------------
/* CR1*/
#define TIM4_CR1_ARPE    ((uint8_t)0x80) /*!< Auto-Reload Preload Enable Mask. */
#define TIM4_CR1_OPM     ((uint8_t)0x08) /*!< One Pulse Mode Mask. */
#define TIM4_CR1_URS     ((uint8_t)0x04) /*!< Update Request Source Mask. */
#define TIM4_CR1_UDIS    ((uint8_t)0x02) /*!< Update DIsable Mask. */
#define TIM4_CR1_CEN     ((uint8_t)0x01) /*!< Counter Enable Mask. */

/* CR2*/
#define TIM4_CR2_MMS     ((uint8_t)0x70) /*!< MMS Selection Mask. */

/* SMCR*/
#define TIM4_SMCR_MSM    ((uint8_t)0x80) /*!< Master/Slave Mode Mask. */
#define TIM4_SMCR_TS     ((uint8_t)0x70) /*!< Trigger Selection Mask. */
#define TIM4_SMCR_SMS    ((uint8_t)0x07) /*!< Slave Mode Selection Mask. */

/* DER*/
#define TIM4_DER_UDE     ((uint8_t)0x01) /*!< Update DMA request Enable  mask. */

/* IER*/
#define TIM4_IER_TIE     ((uint8_t)0x40) /*!< Trigger Interrupt Enable Mask. */
#define TIM4_IER_UIE     ((uint8_t)0x01) /*!< Update Interrupt Enable Mask. */

/* SR1*/
#define TIM4_SR1_UIF     ((uint8_t)0x01) /*!< Update Interrupt Flag Mask. */
#define TIM4_SR1_TIF     ((uint8_t)0x40) /*!< Trigger Interrupt Flag Mask. */

/* EGR*/
#define TIM4_EGR_UG      ((uint8_t)0x01) /*!< Update Generation Mask. */
#define TIM4_EGR_TG      ((uint8_t)0x40) /*!< Trigger Generation Mask. */

/* CNTR*/
#define TIM4_CNTR_CNT    ((uint8_t)0xFF) /*!<Counter Value (LSB) Mask. */

/* PSCR*/
#define TIM4_PSCR_PSC    ((uint8_t)0x0F) /*!<Prescaler Value  Mask. */

/* ARR*/
#define TIM4_ARR_ARR     ((uint8_t)0xFF) /*!<Autoreload Value Mask. */

// ----------------------- CFG CONSTANTS --------------------------------
#define CFG_GCR_SWD ((uint8_t)0x01) /*!< Swim disable bit mask */
#define CFG_GCR_AL  ((uint8_t)0x02) /*!< Activation Level bit mask */

// ------------------------ EXTI CONSTANTS -----------------------------
/* CR1 */
#define EXTI_CR1_P3IS      ((uint8_t)0xC0) /*!< EXTI Pin 3 external interrupt sensitivity bit Mask */
#define EXTI_CR1_P2IS      ((uint8_t)0x30) /*!< EXTI Pin 2 external interrupt sensitivity bit Mask */
#define EXTI_CR1_P1IS      ((uint8_t)0x0C) /*!< EXTI Pin 1  external interrupt sensitivity bit Mask */
#define EXTI_CR1_P0IS      ((uint8_t)0x03) /*!< EXTI Pin 0 external interrupt sensitivity bit Mask */

/* CR2 */
#define EXTI_CR2_P7IS      ((uint8_t)0xC0) /*!< EXTI Pin 7 external interrupt sensitivity bit Mask */
#define EXTI_CR2_P6IS      ((uint8_t)0x30) /*!< EXTI Pin 6 external interrupt sensitivity bit Mask */
#define EXTI_CR2_P5IS      ((uint8_t)0x0C) /*!< EXTI Pin 5  external interrupt sensitivity bit Mask */
#define EXTI_CR2_P4IS      ((uint8_t)0x03) /*!< EXTI Pin 4 external interrupt sensitivity bit Mask */

/* CR3 */
#define EXTI_CR3_PBIS      ((uint8_t)0x03) /*!< EXTI PORTB external interrupt sensitivity bits Mask */
#define EXTI_CR3_PDIS      ((uint8_t)0x0C) /*!< EXTI PORTD external interrupt sensitivity bits Mask */
#define EXTI_CR3_PEIS      ((uint8_t)0x30) /*!< EXTI PORTE external interrupt sensitivity bits Mask */
#define EXTI_CR3_PFIS      ((uint8_t)0xC0) /*!< EXTI PORTF external interrupt sensitivity bits Mask */

/* CONF1 */
#define EXTI_CONF1_PBLIS   ((uint8_t)0x01) /*!< EXTI PORTB low interrupt selector bit Mask */
#define EXTI_CONF1_PBHIS   ((uint8_t)0x02) /*!< EXTI PORTB high interrupt selector bit Mask */
#define EXTI_CONF1_PDLIS   ((uint8_t)0x04) /*!< EXTI PORTD low interrupt selector bit Mask */
#define EXTI_CONF1_PDHIS   ((uint8_t)0x08) /*!< EXTI PORTD high interrupt selector bit Mask */
#define EXTI_CONF1_PELIS   ((uint8_t)0x10) /*!< EXTI PORTE low interrupt selector bit Mask */
#define EXTI_CONF1_PEHIS   ((uint8_t)0x20) /*!< EXTI PORTE high interrupt selector bit Mask */
#define EXTI_CONF1_PFLIS   ((uint8_t)0x40) /*!< EXTI PORTF low interrupt selector bit Mask */
#define EXTI_CONF1_PFES    ((uint8_t)0x80) /*!< EXTI PORTF or PORTE interrupt selector bit Mask */

/* CR4 */
#define EXTI_CR4_PGIS      ((uint8_t)0x03) /*!< EXTI PORTG external interrupt sensitivity bits Mask */
#define EXTI_CR4_PHIS      ((uint8_t)0x0C) /*!< EXTI PORTH external interrupt sensitivity bits Mask */

/* CONF2 */
#define EXTI_CONF2_PFHIS   ((uint8_t)0x01) /*!< EXTI PORTF high interrupt selector bit Mask */
#define EXTI_CONF2_PGLIS   ((uint8_t)0x02) /*!< EXTI PORTG low interrupt selector bit Mask */
#define EXTI_CONF2_PGHIS   ((uint8_t)0x04) /*!< EXTI PORTG high interrupt selector bit Mask */
#define EXTI_CONF2_PHLIS   ((uint8_t)0x08) /*!< EXTI PORTH low interrupt selector bit Mask */
#define EXTI_CONF2_PHHIS   ((uint8_t)0x10) /*!< EXTI PORTH high interrupt selector bit Mask */
#define EXTI_CONF2_PGBS    ((uint8_t)0x20) /*!< EXTI PORTB or PORTG interrupt selector bit Mask */
#define EXTI_CONF2_PHDS    ((uint8_t)0x40) /*!< EXTI PORTD or PORTH interrupt selector bit Mask */

#endif
