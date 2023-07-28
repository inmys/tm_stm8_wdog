// #define PWR_BTN_PORT GPIOA
// #define PWR_BTN_PIN GPIO_Pin_2

// #define LED_GOOD_PORT GPIOA
// #define LED_GOOD_PIN GPIO_Pin_3

// #define WDOG_IN_PORT GPIOB
// #define WDOG_IN_PIN GPIO_Pin_0

// #define WDOG_OUT_PORT GPIOC
// #define WDOG_OUT_PIN GPIO_Pin_4

// #define ENABLE_DCDC_PORT GPIOB 
// #define ENABLE_DCDC_PIN GPIO_Pin_1

// #define ENABLE_5V_PORT GPIOB 
// #define ENABLE_5V_PIN GPIO_Pin_2

// #define PG_SMARC_PORT GPIOB 
// #define PG_SMARC_PIN GPIO_Pin_3

// #define PG_5V_PORT GPIOB
// #define PG_5V_PIN GPIO_Pin_4

// #define CARRIER_PWR_ON_PORT GPIOB
// #define CARRIER_PWR_ON_PIN GPIO_Pin_5

// #define POWER_CPU_PORT GPIOB
// #define POWER_CPU_PIN GPIO_Pin_6

// #define RESET_CPU_PORT GPIOB
// #define RESET_CPU_PIN GPIO_Pin_7

// #define LED_PWR_PORT GPIOD
// #define LED_PWR_PIN 0


#define PWR_BTN GPIOA, GPIO_Pin_2

#define LED_GOOD GPIOA, GPIO_Pin_3

#define WDOG_IN GPIOB, GPIO_Pin_0
 
#define WDOG_OUT GPIOC, GPIO_Pin_4

#define ENABLE_DCDC GPIOB, GPIO_Pin_1 

#define ENABLE_5V GPIOB, GPIO_Pin_2  

#define PG_SMARC GPIOB, GPIO_Pin_3 

#define PG_5V GPIOB, GPIO_Pin_4

#define CARRIER_PWR_ON GPIOB, GPIO_Pin_5

#define POWER_CPU GPIOB, GPIO_Pin_6

#define RESET_CPU GPIOB, GPIO_Pin_7

#define LED_PWR GPIOD, GPIO_Pin_0

#define B_PWR_MASK			(0)
#define B_PG_5V_MASK		(1)
#define B_PG_SMARC_MASK		(2)



#define TIMER_60_SEC (6000)
#define TIMER_30_SEC (3000)
#define TIMER_10_SEC (1000)
#define TIMER_5_SEC (500)
#define TIMER_3_SEC (300)
#define TIMER_2_SEC (200)
#define TIMER_1_SEC (100)
#define TIMER_700_MS (70)
#define TIMER_500_MS (50)
#define TIMER_300_MS (30)
#define TIMER_200_MS (20)
#define TIMER_100_MS (10)
#define TIMER_50_MS (5)