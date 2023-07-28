#ifndef __STM8L_GPIO_H
#define __STM8L_GPIO_H

#include "stm8l.h"


typedef enum
{
  GPIO_Mode_In_FL_No_IT      = (uint8_t)0x00,   /*!< Input floating, no external interrupt */
  GPIO_Mode_In_PU_No_IT      = (uint8_t)0x40,   /*!< Input pull-up, no external interrupt */
  GPIO_Mode_In_FL_IT         = (uint8_t)0x20,   /*!< Input floating, external interrupt */
  GPIO_Mode_In_PU_IT         = (uint8_t)0x60,   /*!< Input pull-up, external interrupt */
  GPIO_Mode_Out_OD_Low_Fast  = (uint8_t)0xA0,   /*!< Output open-drain, low level, 10MHz */
  GPIO_Mode_Out_PP_Low_Fast  = (uint8_t)0xE0,   /*!< Output push-pull, low level, 10MHz */
  GPIO_Mode_Out_OD_Low_Slow  = (uint8_t)0x80,   /*!< Output open-drain, low level, 2MHz */
  GPIO_Mode_Out_PP_Low_Slow  = (uint8_t)0xC0,   /*!< Output push-pull, low level, 2MHz */
  GPIO_Mode_Out_OD_HiZ_Fast  = (uint8_t)0xB0,   /*!< Output open-drain, high-impedance level, 10MHz */
  GPIO_Mode_Out_PP_High_Fast = (uint8_t)0xF0,   /*!< Output push-pull, high level, 10MHz */
  GPIO_Mode_Out_OD_HiZ_Slow  = (uint8_t)0x90,   /*!< Output open-drain, high-impedance level, 2MHz */
  GPIO_Mode_Out_PP_High_Slow = (uint8_t)0xD0    /*!< Output push-pull, high level, 2MHz */
}GPIO_Mode_TypeDef;


typedef enum
{
  GPIO_Pin_0    = ((uint8_t)0x01),   /*!< Pin 0 selected */
  GPIO_Pin_1    = ((uint8_t)0x02),   /*!< Pin 1 selected */
  GPIO_Pin_2    = ((uint8_t)0x04),   /*!< Pin 2 selected */
  GPIO_Pin_3    = ((uint8_t)0x08),   /*!< Pin 3 selected */
  GPIO_Pin_4    = ((uint8_t)0x10),   /*!< Pin 4 selected */
  GPIO_Pin_5    = ((uint8_t)0x20),   /*!< Pin 5 selected */
  GPIO_Pin_6    = ((uint8_t)0x40),   /*!< Pin 6 selected */
  GPIO_Pin_7    = ((uint8_t)0x80),   /*!< Pin 7 selected */
  GPIO_Pin_LNib = ((uint8_t)0x0F),   /*!< Low nibble pins selected */
  GPIO_Pin_HNib = ((uint8_t)0xF0),   /*!< High nibble pins selected */
  GPIO_Pin_All  = ((uint8_t)0xFF)    /*!< All pins selected */
}GPIO_Pin_TypeDef;


void GPIO_DeInit(GPIO_TypeDef* GPIOx);
void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode);
void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState);

/* GPIO Read and Write ********************************************************/
void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal);
void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal);
void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin);
void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin);
void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin);

uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx);
uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx);
BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin);
BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin);

#endif
