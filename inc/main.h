#ifndef __MAIN_H__
#define __MAIN_H__

/*-----------------------------------
Port:
PA2--Êä³öPP£BBT_RES, Bluetooth reset, 0-active, 1-reset
PB4--Êä³öPP£BBRTS, Bluetooth send data, 0-active, 1-sleep

PB5--ÊäÈëPU£¬Key

PB6--Êä³öPP£¬LED

PC3--Êä³öOD£¬LED

PC4~7--Êä³ö£¬wifiµÄCHPD¡¢GPIO2¡¢GPIO16¡¢GPIO0£¬Êä³öÉÏÀ­

PC3--Uart_Rx£¬ÊäÈëÉÏÀ­
PC3--Uart_Tx£¬Êä³öÉÏÀ­
-----------------------------------*/
//-----MKEY-MIRROR----
#define BT_RES_0 GPIOA->ODR &= (uint8_t)(~GPIO_Pin_2)	//active
#define BT_RES_1 GPIOA->ODR |= GPIO_Pin_2							//reset
#define BRTS_0 GPIOB->ODR &= (uint8_t)(~GPIO_Pin_4)		//active
#define BRTS_1 GPIOB->ODR |= GPIO_Pin_4								//sleep

#define LED_0 GPIOB->ODR &= (uint8_t)(~GPIO_Pin_6)	//led turn off
#define LED_1 GPIOB->ODR |= GPIO_Pin_6							//led turn on

#define OPEN_UART_TX GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_High_Slow);          //PC3--Uart Tx
#define CLOSE_UART_TX GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_OD_HiZ_Slow);          

#define READ_KEY	GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_5)	//Key  --

//const uint8_t sRST[]={'A','T','+','R','S','T'};		//6
//const uint8_t sCWMODE[]={'A','T','+','C','W','M','O','D','E','=','1'};//11
//const uint8_t sUART[]={'A','T','+','U','A','R','T','=','9','6','0','0',',','8',',','1',',','0',',','0'};//20
//AT+UART=9600,8,1,0,0
//const uint8_t sCIPSTATUS[]={'A','T','+','C','I','P','S','T','A','T','U','S'};	//12
//const uint8_t sCIPSTART_L[]={'A','T','+','C','I','P','S','T','A','R','T','=','"','U','D','P','"',',','"','1','9','2','.','1','6','8','.'};//27,+X
//const uint8_t sCIPSTART_H[]={'.','2','5','5','"',',','4','9','7','3',',','4','9','7','2',',','1'};//17


//const uint8_t sCWJAP[]={'A','T','+','C','W','J','A','P','=','"'};//10	+ssid PSW
//---**************************************************------
//const uint8_t sSSID[]={'Z','C','Z','8','8','8','8','8'};		//8
//const uint8_t sPSW[]={'w','x','6','8','0','8','2','1'};		//8
//const uint8_t sSSID[]={'H','o','m','e','C','o','n','t','r','o','l'};		//11
//const uint8_t sPSW[]={'j','i','a','j','u','k','o','n','g','z','h','i','6','9','5','8'};		//16
//const uint8_t sSSID[]={'B','-','1','0','2'};		//5
//const uint8_t sPSW[]={'s','h','i','y','a','n','s','h','i','1','2','3'};		//12
//const uint8_t sSSID[]={'T','P','-','L','I','N','K','_','5','0','4'};		//11
//const uint8_t sPSW[]={'x','j','t','u','b','m','e','5','0','4'};		//10
//const uint8_t sSSID[]={'X','Y','H','Q'};		//4
//const uint8_t sPSW[]={'1','2','3','4','5','6','h','q','s','b'};		//10

//const uint16_t station=10;//1;
//---***************************************************----

//const uint8_t sCIFSR[]={'A','T','+','C','I','F','S','R'};//8

//const uint8_t sSEND[]={'A','T','+','C','I','P','S','E','N','D','=','1','3'};//13,length stationL stationH prop0~7 chkL chkH
//const uint8_t sCLOSE[]={'A','T','+','C','I','P','C','L','O','S','E'};//11
//const uint8_t sCWQAP[]={'A','T','+','C','W','Q','A','P'};//8

//const uint8_t sOK[]={'O','K','\r','\n'};//4
//const uint8_t sRetSTATUS[]={'S','T','A','T','U','S',':','2'};//8  
//const uint8_t sRetFAIL[]={'F','A','I','L','\r','\n'};//6
//const uint8_t sRetCONN[]={'C','O','N','N'};//4
//const uint8_t sSUBNET[]={'1','9','2','.','1','6','8','.'};//8
//const uint8_t sRetBG[]={'>'};//1
//const uint8_t sRetRECV[]={'+','I','P','D',','};//5

//uint8_t sNET[]={'0','0','1'};//3

struct Param{
	uint16_t tLLasting;				
	uint16_t tSLasting;				
	uint16_t tDataGap;					
	uint16_t tWarnGap;					
	
	uint8_t tMvDetectGap;			//defined by AWU_Timebase_TypeDef					
	uint16_t nMvSendNum;	
	
	uint16_t tMvLasting;			
	
	uint8_t tLLedLasting;
	uint8_t tSLedLasting;

	uint8_t bResv;
	uint16_t uResv[4];
};

struct Param m_Param;

uint16_t m_tLLasting;				
uint16_t m_tSLasting;				
uint16_t m_tDataGap;					
uint16_t m_tWarnGap;
uint8_t m_tMvDetectGap;
uint16_t m_tMvLasting;			
uint16_t m_nMvSendNum;	
uint8_t m_WarnSeq;

uint8_t m_tLedLasting;
uint8_t m_Press;		//1--short press, 2--Long press

uint16_t m_Idle,m_Idle0;
uint8_t m_bWakeExti;
//--communication command & ack------
#define SET_PARAM					0x01
#define GET_PARAM					0x02
#define START_CONTINUE		0x03
#define STOP_CONTINUE 		0x04
#define STOP_WARN	 				0x05

#define MSG_DATA					0x10

#define MSG_WARN					0x20

//-------------------------------------
#define MAX_TX_LEN	64
#define MAX_RX_LEN	64
uint8_t Usart_TxBuff[MAX_TX_LEN];

uint8_t Usart_RxBuff[MAX_RX_LEN];//½ÓÊÕÊý¾ÝÊdµÚÒ»¸ö´æ´¢µØÖ·
//bRx£º¿ªÊ¼±êÖ¾£¬0£¬¿ÉÒÔ¿ªÊ¼½ÓÊÕ
//iRxIndex ½ÓÊÕÊý¾ÝÊý×éÏÂ±ê
uint8_t bRx,iRxIndex;
//ÊÇ·ñÊÇµÚÒ»¸ö×Ö·û£¬Ä¬ÈÏÎª²
//0,
uint8_t bRxFirst;

uint16_t m_intr1,m_intr2,m_intr3,m_intr4,m_Intv1;
uint8_t iWDog;
uint8_t m_Shinning;

uint8_t m_MAC[6];
uint8_t m_DeviceID[12];

uint8_t m_Turn;
uint16_t m_beat=0;	//heartbeat, send from host per 10s 

#define I2C_MAX_TX_LEN	4
#define I2C_MAX_RX_LEN	16	
const uint8_t addrMaybe[8]={0xbc,0x3e,0x94,0x9c,0xb4,0x16,0x1e,0x36};
uint8_t I2c_TxBuff[I2C_MAX_TX_LEN];//={0,1,0,0xc0};
uint8_t I2c_RxBuff[I2C_MAX_RX_LEN];

void Delay(uint16_t nTimes);
void LedFlick(uint8_t t8,uint16_t t16);

//void CLK_CloseAll(void);
void CLK_SetTick(uint8_t b);	//TIM2 for ticktime

void Init_Port(void);
void Init_Mem(void);
void IWDG_Config(void);

void Set_Usart(uint8_t b);
void Usart_Send(uint8_t Len);

void Clear_Usart_Tx(void);
void Clear_Usart_Rx(void);

void MakeSendPack(uint8_t cmd, uint8_t nNo);
uint8_t RecvData(uint16_t uWait);
//uint16_t CheckSum(uint8_t* pu8, uint8_t Len);
uint8_t GetCheckSumXor(uint8_t* pu8, uint8_t Len);
bool CheckSumXor(uint8_t* pu8,uint8_t Len);
uint8_t GetCheckSumXor(uint8_t* pu8, uint8_t Len);

void ClearDog(void);

void EnterAHalt(uint8_t time);
void JustExitAHalt(void);


void Clear_I2c_Rx(void);
uint8_t I2C_SearchAddr(void);
bool I2C_CheckEvent_T(I2C_Event_TypeDef I2C_Event,uint8_t timeout);
bool I2C_SendCmd(uint8_t slvAddr,uint8_t Size);	
bool I2C_GetData(uint8_t slvAddr,uint8_t *pu8,uint8_t Size);	
void makeI2cWritePack(uint8_t addr);
void Delay_5us(void);

#endif    /* __MAIN_H__ */
