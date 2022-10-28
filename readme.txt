	1 PWM输出，100Hz, T=10ms
	2 Key1调制PWM占空比：10，50，90
	3 按键去抖

项目：
Core	--用户程序
Drives	--库
MDK-ARM	--Keil5工作区
STM32CubeIDE	--CubeIDE工作区
VSCode		--vscodeEIDE工作区



---------------------------------------------------------------------------------------------------
方案：
APB2TimerClock:20MHz,Ts=50ns
1ms<->2 0000ticks
10ms<->20 0000ticks

prescaler 10	2MHz,Ts=500ns
1ms<->2000ticks
10ms<->20000ticks
---------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------

	high	low	CRR
100%	0	10	0
90% 	1	9	2000
50%	5	5	10000
10%	9	1	18000
0%	10	0	20000

ClockConfig：
APB2Timer clocks=20MHz

TIM4
PSC=10-1
Channel2  :PWM Generation CH2
Channel1  :PWM Generation CH1

ARR<->20000
CH2Pulse	=20000;
CH1Pulse=20000;//初值保证上电后关闭

NVICSetting TIM4 global interrupt Enable(tick)

```main.c
uint32_t TIM_CRR_LOOP[4]={
  20000,//0%
  18000,//10%
  10000,//50%
  2000//90%
};
uint8_t state1;//auto
uint8_t state2;//auto
HAL_TIM_PWM_Start(&htim4,TIM_CHANNEL_2);//PD13
HAL_TIM_PWM_Start(&htim4,TIM_CHANNEL_1);//PD12

main:
TIM4->CCR2=TIM_CRR_LOOP[state2];//直接操作寄存器
state2=(state2+1)%4;//循环注入
TIM4->CCR1=TIM_CRR_LOOP[state1];//直接操作寄存器
state1=(state1+1)%4;//循环注入

```



---------------------------------------------------------------------------------------------------
//Key1	<->PG6
//Key2	<->PG7
GPIO PG6 Enable

#define Key1_High()   (HAL_GPIO_ReadPin(GPIOG,GPIO_PIN_6)==GPIO_PIN_SET)
#define Key1_Low()    (HAL_GPIO_ReadPin(GPIOG,GPIO_PIN_6)==GPIO_PIN_RESET)

#define Key2_High()   (HAL_GPIO_ReadPin(GPIOG,GPIO_PIN_7)==GPIO_PIN_SET)
#define Key2_Low()    (HAL_GPIO_ReadPin(GPIOG,GPIO_PIN_7)==GPIO_PIN_RESET)


```主循环
while(1){
    if(Key1_Low()){//消抖PlanB
      HAL_Delay(10);
      if(Key1_Low()){
        TIM4->CCR1=TIM_CRR_LOOP[state1];
        state1=(state1+1)%4;
        do{
          while(Key1_Low());
          HAL_Delay(10);
        }while(Key1_Low());
      }
    }
    if(Key2_Low()){//消抖PlanB
      HAL_Delay(10);
      if(Key2_Low()){
        TIM4->CCR2=TIM_CRR_LOOP[state2];
        state2=(state2+1)%4;
        do{
          while(Key2_Low());
          HAL_Delay(10);
        }while(Key2_Low());
      }
    }



}
```
---------------------------------------------------------------------------------------------------
BEEP	-指示工作状态
PB12
GPIO PB12 Enable
```
HAL_GPIO_WritePin(GPIOB,GPIO_PIN_12,SET);
HAL_Delay(200);
HAL_GPIO_WritePin(GPIOB,GPIO_PIN_12,RESET);
```



