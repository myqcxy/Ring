/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
 
 /*	After pressing button, this ring work 50s
 *	short press, send data to phone
 *	long press, send out a warn
 */
 
 
#include "stm8l10x.h"
#include "stm8l10x_clk.h"
#include "stm8l10x_exti.h"
#include "stm8l10x_flash.h"
#include "stm8l10x_gpio.h"
#include "stm8l10x_i2c.h"
#include "stm8l10x_tim2.h"
#include "stm8l10x_iwdg.h"
#include "stm8l10x_usart.h"
#include "stm8l10x_awu.h"

#include "main.h"


int main( void )
{
	
	uint8_t i, j, k, a, b, b1;
	uint8_t n,u8;
	uint8_t bWaitRx;
	uint8_t* pU8;
	
	
	
  CLK_DeInit();       //2M, all peripherals enable
  disableInterrupts();
	
	Init_Port();	
	//while(1) LED_1;
	
	/*BRTS_0;
	USART_DeInit();//重置usart的外围设备
	Set_Usart(1);//设置usart pc3
	BT_RES_1;//重置*/
	/*	while(1){
			LED_1;
			//BRTS_0;
		} */
		
	FLASH_DeInit();
	FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);
	Init_Mem();
	
	m_Param.tLLasting=5500;		//55s
	m_Param.tSLasting=5500;		//55s
	m_Param.tDataGap=1000;				//10s
	m_Param.tWarnGap=1000;				//10s
	m_Param.tMvDetectGap=10;		//128ms, ref AWU_Timebase_TypeDef
	m_Param.tMvLasting=10;		//0.1s		
	m_Param.nMvSendNum=200;		//25.6s		
	m_Param.tLLedLasting=100;		//1s
	m_Param.tSLedLasting=20;		//0.3s

	m_Param.bResv=0;
	for(i=0;i<4;i++)
		m_Param.uResv[i]=0;
	
	EXTI_DeInit();//初始化外部中断
	//设置外部中断在下降沿和低电平有效
	EXTI_SetPinSensitivity(EXTI_Pin_5, EXTI_Trigger_Falling_Low);
	m_bWakeExti=0;

	TIM2_DeInit();//初始化tim2寄存器
	CLK_SetTick(1);	//TIM2 for ticktime 使能tim2 外部中断
	USART_DeInit();//重置usart的外围设备
	Set_Usart(1);//设置usart pc3
	m_Idle=0;

	bWaitRx=0;
	m_WarnSeq=1;
	m_tWarnGap=m_Param.tWarnGap;
	m_tDataGap=m_Param.tDataGap;
	
	BT_RES_1;//重置
	Delay(1);
	BT_RES_0;
	ClearDog();//m_intr1=0
	BRTS_1;//sleep 蓝牙
	bRx=0;	//start recv
	
	enableInterrupts();
//BRTS_0;Set_Usart(1);
while(1)
	{
	
/*	while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET){};
				USART_SendData8('a');*/
				

		Delay(1);
		if(m_Press==02)		//long Press
		{
			m_tLLasting=1;
			m_tSLasting=0;
			m_tWarnGap=m_Param.tWarnGap;
			m_WarnSeq++;
			
			m_Press=0;
			m_bWakeExti=0;
		}
		else if(m_Press==01)	//short press
		{
			m_tSLasting=1;
			m_tDataGap=m_Param.tDataGap;
			
			m_Press=0;
			m_bWakeExti=0;
		}
		
		if(m_tLLasting)	//in warning
		{
			if(m_tLLasting>=m_Param.tLLasting)
				m_tLLasting=0;
			else if(m_tWarnGap>=m_Param.tWarnGap)
			{
				m_tWarnGap=1;
				m_tLedLasting=m_Param.tLLedLasting;
				MakeSendPack(MSG_WARN, m_WarnSeq);
			}
		}
		else if(m_tSLasting)	//in data selecting
		{
			if(m_tSLasting>=m_Param.tSLasting)
				m_tSLasting=0;
			else if(m_tDataGap>=m_Param.tDataGap)
			{
				m_tDataGap=1;
				m_tLedLasting=m_Param.tSLedLasting;
				MakeSendPack(MSG_DATA, 0);
			}
		}

		if(m_tMvLasting>=m_Param.tMvLasting)
		{
			m_tMvLasting=0;
			//select MV data
			m_nMvSendNum++;
			if(!m_tLLasting && !m_tSLasting)
				m_Idle=500;			//---sleep immediately
			if(m_nMvSendNum>=m_Param.nMvSendNum)
			{
				m_nMvSendNum=0;
//				MakeSendPack(MSG_DATA, 0);
				m_Idle=200;			//---delay 300 ms for waiting end bt sending
				
			}
		}
		
		u8=RecvData(500);//=0 no data
		if(u8>0)
		{
			if(u8==255)//error
				Clear_Usart_Rx();	
			else
			{
				//recv deal 
				//Usart_ReceiveData8();
			}
			
			bRx=0;	//restart recv
		}
		
		if(!m_tLLasting && !m_tSLasting)
		{
			m_Idle++;
			if(m_bWakeExti)//如果处于唤醒状态
				m_Idle0=4000;		//4s
			else
				m_Idle0=500;

			if(m_Idle>m_Idle0)
			{
				m_Idle=0;
				EnterAHalt(m_Param.tMvDetectGap);
				JustExitAHalt();
				m_tMvLasting=m_Param.tMvLasting;
				LED_1;
			}
		}
	}
}//main


void Delay(uint16_t nTimes)  //1ms, f=2MHz
{
	uint16_t i;
	uint16_t nBase;
	
	for(i=0;i<nTimes;i++)
	{
		nBase=648;//debug 154，release 648;
		while(nBase!=0)
			nBase--;
	}
}

//----------------------------------------------------------
void Delay_5us(void)	//2M--not precise
{
	uint16_t nBase;

	nBase=32;	//debug 1, release 4, freq 2M;
	while(nBase!=0)
		nBase--;
}

void ClearDog(void)
{
//	disableInterrupts();
	m_intr1=0;
//	enableInterrupts();
}

//---All set in OD_HiZ, changed before being used and restore after being used-----------
void Init_Port(void)
{
	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);
	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);    
	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);    
	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);  

	GPIO_Init(GPIOA, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Slow); //BT_RES, reset
	GPIO_Init(GPIOB, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Slow); //BRTS, no
	
	GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_In_PU_IT); //KEY
	
	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow); //LED, shut
}

//----------------------------------------------------------
void Init_Mem(void)
{
	uint8_t i;
	
	m_intr1=0;	//based on TIM2, restricting uart tx & rx
	m_intr2=0;	
	m_intr3=0;	
	m_intr4=0;	

	m_tSLasting=0;				
	m_tLLasting=0;				
	m_tDataGap=0;					
	m_tWarnGap=0;					
	m_tMvDetectGap=0;	
	m_nMvSendNum=0;
	
	m_Press=0;
	m_WarnSeq=255;
	
	for(i=0;i<6;i++)
		m_MAC[i]=0;
		
	for(i=0;i<12;i++)
		m_DeviceID[i]=0;

	Clear_Usart_Tx();
	Clear_Usart_Rx();

}

//----------------------------------------------------------
void CLK_SetTick(uint8_t b)  //TIM2 10ms
{
	if(b)
	{
		CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);//开启tim2的外部时钟
	  TIM2_TimeBaseInit(TIM2_Prescaler_1, TIM2_CounterMode_Up, 19999);	
    TIM2_InternalClockConfig();//开启tim2的内部时钟
		TIM2_ITConfig(TIM2_IT_Update, ENABLE);//开启tim2内部中断
		TIM2_Cmd(ENABLE);//让tim外围设备有效
  }else{
		TIM2_Cmd(DISABLE);
    CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
	}		
}

//----------------------------------------------------------
void Set_Usart(uint8_t b)
{
  if(b)
	{
		OPEN_UART_TX;//设置pc3为uart
		CLK_PeripheralClockConfig(CLK_Peripheral_USART, ENABLE);//使能外设时钟
		USART_Init((uint32_t)9600, USART_WordLength_8D, USART_StopBits_1,
                USART_Parity_No, USART_Mode_Rx | USART_Mode_Tx);//115200 past
								
    USART_ITConfig(USART_IT_RXNE, ENABLE);//使能接收中断
    //Usart_ITConfig(Usart_IT_TXE, ENABLE);
    USART_Cmd(ENABLE);
	}else{
    USART_ITConfig(USART_IT_RXNE, DISABLE);
    USART_ITConfig(USART_IT_TXE, DISABLE);
    USART_Cmd(DISABLE);
		CLK_PeripheralClockConfig(CLK_Peripheral_USART, DISABLE);
		CLOSE_UART_TX;
	}		
}


void Usart_Send(uint8_t Len)
{
  uint8_t* pB;
  uint8_t i;
  
	if(Len <= MAX_TX_LEN)
	{
		for(i=0;i<Len;i++)
		{
			/* 等待传输结束 */
			while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET){};
			USART_SendData8(Usart_TxBuff[i]);
		}
	}
}

//--------------------------------------------------------------
void Clear_Usart_Tx(void)
{
	uint8_t i;
	
	for(i=0;i<MAX_TX_LEN;i++)
		Usart_TxBuff[i]=0;
}

//--------------------------------------------------------------
void Clear_Usart_Rx(void)
{
	uint8_t i;
	
	for(i=0;i<MAX_RX_LEN;i++)
		Usart_RxBuff[i]=0;
	
	bRx=1;
	iRxIndex=0;
	bRxFirst=0;
}

//--------------------------------------------------------------
void IWDG_Config(void)
{
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  IWDG_SetPrescaler(IWDG_Prescaler_256);	//4ms
  IWDG_SetReload((uint8_t)(100));	//400ms
  IWDG_ReloadCounter();
  IWDG_Enable();
}

//-------------------------------------------------------------
void MakeSendPack(uint8_t cmd, uint8_t nNo)
{
	uint8_t i;
	uint16_t u16;
	
	OPEN_UART_TX;
	BRTS_0;//打开蓝牙
	Delay(1);
	//设置发送信息
	Usart_TxBuff[0]=0xEB;
	Usart_TxBuff[1]=0x90;
	Usart_TxBuff[2]=0xEB;
	Usart_TxBuff[3]=0x90;
		
	for(i=0;i<6;i++)
		Usart_TxBuff[i+4]=m_MAC[i];
	
	Usart_TxBuff[10]=cmd | 0x80;
	Usart_TxBuff[11]=nNo;
	
//	for(i=0;i<12;i++)
//		Usart_TxBuff[i+12]=m_DeviceID[i];
	
	u16=GetCheckSumXor(Usart_TxBuff,MAX_TX_LEN);
	Usart_TxBuff[MAX_TX_LEN-2]=(uint8_t)(u16 & 0xff);
	Usart_TxBuff[MAX_TX_LEN-1]=(uint8_t)((u16 >> 8) & 0xff);

	Usart_Send(MAX_TX_LEN);	
}

//--------------------------------------------------------------
uint8_t RecvData(uint16_t uWait)	//ret: 0--no data, 255--err data, other--valid data
{
	uint8_t b=0;
	uint8_t Cmd=0;
	static uint16_t u16=0;
	
	if(!bRxFirst)
		u16=0;
	else
	{
		u16++;
		if(u16>uWait)
			return 255;
		else
		{
			if(iRxIndex>=MAX_RX_LEN)
			{
				b=1;
				if(CheckSumXor(Usart_RxBuff,MAX_RX_LEN))
					Cmd=Usart_RxBuff[10];
				else
					Cmd=255;
			}
		}
	}
	
	if(b)
	{	
		bRx=1;
		bRxFirst=0;
	}	
	
	return b;
}
/*
uint16_t CheckSum(uint8_t* pu8, uint8_t Len)
{
	uint16_t u16;
	uint8_t i,u8,uLen;
	
	u16=0;
	if(Len<2)
		return 0;
		
	uLen=*pu8;
	for(i=0;i<uLen-2;i++)
	{
		u16 +=*pu8;
		pu8++;
	}
	
	return ~u16;
}
*/
//-----------------------------------------------
uint8_t GetCheckSumXor(uint8_t* pu8, uint8_t Len)
{
	uint8_t u8=0;
	uint8_t i;
	uint8_t* pu;
	
	pu=pu8;
	if(Len<2)
		return 0;
		
	for(i=0;i<Len-1;i++)
	{
		u8 ^=*pu;
		pu++;
	}
	
	return u8;
}

//-------------------------------------------
bool CheckSumXor(uint8_t* pu8,uint8_t Len)
{
	bool b=FALSE;
	uint8_t u1=0;
	uint8_t u2=0;
	uint8_t* pDat;
	
	pDat=pu8;
	u1=GetCheckSumXor(pDat,Len);
	
	pDat=pu8;
	u2=(*(pDat+Len-1));
				
	if(u1==u2)
		b=TRUE;

	return b;
}

void EnterAHalt(uint8_t time)
{
	CLK_SetTick(0);	
	Set_Usart(0);
//	CLK_PeripheralClockConfig(CLK_Peripheral_I2C, DISABLE);

	BT_RES_0;
	BRTS_1;//sleep
	LED_0;
	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);    
	
//	CLK_DeInit();
  AWU_DeInit();
	CLK_PeripheralClockConfig(CLK_Peripheral_AWU, ENABLE);
	if(time>16)
		time=16;
	AWU_Init(time);
	AWU_Cmd(ENABLE);
  halt();
}

void JustExitAHalt(void)
{
	CLK_DeInit();       //2M, all peripherals enable
	disableInterrupts();
	
	Init_Port();	

	EXTI_DeInit();//初始化外部中断
	
	EXTI_SetPinSensitivity(EXTI_Pin_5, EXTI_Trigger_Falling);

	TIM2_DeInit();
	CLK_SetTick(1);	//TIM2 for ticktime
	USART_DeInit();
	//I2C_Init();
	Set_Usart(1);
	Clear_Usart_Tx();
	Clear_Usart_Rx();	
	bRx=0;
	m_Press=0;
	enableInterrupts();
}

//--Send Psw & HeadCtrl Signals---------------------------------
#ifdef _COSMIC_
@far @interrupt void TIM2_Handle_ISR(void)
{
	uint8_t m,n;
	static uint8_t Key=0;
	static uint8_t OldKey=0;
	static uint8_t KeyLasting=0;

	TIM2_ClearITPendingBit(TIM2_IT_Update);
	
	if(m_tLLasting>0)
		m_tLLasting++;
	if(m_tSLasting>0)
		m_tSLasting++;
	
	if(m_tWarnGap>0)
		m_tWarnGap++;
	if(m_tDataGap>0)
		m_tDataGap++;
		
	m_tMvLasting++;	
		
	if(m_tLedLasting)
	{	
		LED_1;
		m_tLedLasting--;
	}
	else
		LED_0;

	if(READ_KEY)	//no press
	{
		if(KeyLasting>10 && KeyLasting<=150)
			m_Press=01;			//short press
		
		Key=0;
		OldKey=0;
		KeyLasting=0;
	}
	else	//press
	{
		Key=1;
		if(OldKey==0)	//first press
			KeyLasting=1;
		else
		{
			KeyLasting++;
			if(KeyLasting>150 && KeyLasting<250)
			{
				KeyLasting=251;
				m_Press=02;				//long press
			}
			else if(KeyLasting>250)
				KeyLasting=251;
		}
	}
	OldKey=Key;
}

//@far @interrupt void UsartTx_Handle_ISR(void)
//{
//}

//---------------------------------------------
bool I2C_CheckEvent_T(I2C_Event_TypeDef I2C_Event,uint8_t timeout)
{
	bool b=FALSE;
	uint8_t i;
	
	for(i=0;i<timeout;i++)
	{
		if(I2C_CheckEvent(I2C_Event))
		{
			b=TRUE;
			break;
		}
		else
			Delay_5us();
	}
	
	return b;
}
//---------------------------------------------
bool I2C_SendCmd(uint8_t slvAddr,uint8_t Size)	
{
	uint8_t i;
	uint8_t iTx=0;
  
	/* I2C Initialize */
	//I2C_Init((uint32_t)200000, 0xE0, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);	//100kHz
	while (I2C_GetFlagStatus(I2C_FLAG_BUSY));

	I2C_GenerateSTART(ENABLE);
	/* Test on EV5 and clear it -- finish the start*/
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

	/* Send slave Address for write */
  I2C_Send7bitAddress(slvAddr, I2C_Direction_Transmitter);

	/* Test on EV6 and clear it */
  if(!I2C_CheckEvent_T(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED,5))	//200us
	{
		I2C_GenerateSTOP(ENABLE);
		return FALSE;
	}

//  I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);
  /* Send data */
  while (iTx < Size)
  {
    I2C_SendData(I2c_TxBuff[iTx++]);
    /* Test on EV8 and clear it */
    while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
  }

  /* Send STOP Condition */
  I2C_GenerateSTOP(ENABLE);
	Delay_5us();
	Delay_5us();
	
	return TRUE;
}

//---------------------------------------------
bool I2C_GetData(uint8_t slvAddr, uint8_t *pu8, uint8_t Size)	
{
	uint8_t iRx=0;
	uint8_t* pData;

	pData=pu8;
  /* I2C Initialize */
	//I2C_Init((uint32_t)200000, 0xE0, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);	//100kHz
  while (I2C_GetFlagStatus(I2C_FLAG_BUSY));
	I2C_GenerateSTART(ENABLE);
	/* Test on EV5 and clear it -- finish the start*/
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
	/* Send slave Address for write */
  I2C_Send7bitAddress(slvAddr, I2C_Direction_Transmitter);
	/* Test on EV6 and clear it */
  if(!I2C_CheckEvent_T(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED,5))	//200us
	{
		I2C_GenerateSTOP(ENABLE);
		return FALSE;
	}
	
  I2C_SendData(0x00);//发送数据
  /* Test on EV8 and clear it */
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	I2C_GenerateSTART(ENABLE);
/* Test on EV5 and clear it -- finish the start*/
  while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
	/* Send slave Address for write */
  I2C_Send7bitAddress(slvAddr, I2C_Direction_Receiver);
  /* Test on EV6 and clear it */
  if(!I2C_CheckEvent_T(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED,5))	//200us
	{
		I2C_GenerateSTOP(ENABLE);
		return FALSE;
	}
  //I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);
  /* Recv data */
  while (iRx < Size)
  {
    /* Test on EV8 and clear it */
    while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
    *pData = (uint8_t)(I2C_ReceiveData());
		pData++;
		iRx++;
  }

  /* Send STOP Condition */
  I2C_GenerateSTOP(ENABLE);
	Delay_5us();
	Delay_5us();
	
	return TRUE;
}

//---------------------------------------------
void Clear_I2c_Rx()
{
	uint8_t i;
	
	for(i=0;i<I2C_MAX_RX_LEN;i++)
		I2c_RxBuff[i]=0;
}


//读取蓝牙的数据
@far @interrupt void UsartRx_Handle_ISR(void)
{
	uint8_t w;
	
	w=(uint8_t)USART->DR;
	//w=Usart_ReceiveData8();

	/*while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET){};
				USART_SendData8('a');*/

	if(!bRx)
	{
		if(!bRxFirst)
		{
			Usart_RxBuff[0]=w;
			bRxFirst=1;
			iRxIndex=1;
		}else{
			if(iRxIndex<MAX_RX_LEN)
			{
				Usart_RxBuff[iRxIndex]=w;
				iRxIndex++;
			}
		}
	}	
}

//-----------------------------------------
@far @interrupt void AWU_Handle_ISR(void)
{
	//返回外围设备AWU的状态标志 AWU：自动唤醒
	AWU_GetFlagStatus();
}

//-----------------------------------------
@far @interrupt void EXTI5_Handle_ISR(void)//按下按钮触发
{
	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
	m_bWakeExti=1;
}

#endif
