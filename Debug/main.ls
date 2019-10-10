   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _m_beat:
  17  0000 0000          	dc.w	0
  18                     .const:	section	.text
  19  0000               _addrMaybe:
  20  0000 bc            	dc.b	188
  21  0001 3e            	dc.b	62
  22  0002 94            	dc.b	148
  23  0003 9c            	dc.b	156
  24  0004 b4            	dc.b	180
  25  0005 16            	dc.b	22
  26  0006 1e            	dc.b	30
  27  0007 36            	dc.b	54
 530                     ; 26 int main( void )
 530                     ; 27 {
 532                     	switch	.text
 533  0000               _main:
 535  0000 89            	pushw	x
 536       00000002      OFST:	set	2
 539                     ; 36   CLK_DeInit();       //2M, all peripherals enable
 541  0001 cd0000        	call	_CLK_DeInit
 543                     ; 37   disableInterrupts();
 546  0004 9b            sim
 548                     ; 39 	Init_Port();	
 551  0005 cd01d9        	call	_Init_Port
 553                     ; 51 	FLASH_DeInit();
 555  0008 cd0000        	call	_FLASH_DeInit
 557                     ; 52 	FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);
 559  000b 4f            	clr	a
 560  000c cd0000        	call	_FLASH_SetProgrammingTime
 562                     ; 53 	Init_Mem();
 564  000f cd0232        	call	_Init_Mem
 566                     ; 55 	m_Param.tLLasting=5500;		//55s
 568  0012 ae157c        	ldw	x,#5500
 569  0015 bfcb          	ldw	_m_Param,x
 570                     ; 56 	m_Param.tSLasting=5500;		//55s
 572  0017 ae157c        	ldw	x,#5500
 573  001a bfcd          	ldw	_m_Param+2,x
 574                     ; 57 	m_Param.tDataGap=1000;				//10s
 576  001c ae03e8        	ldw	x,#1000
 577  001f bfcf          	ldw	_m_Param+4,x
 578                     ; 58 	m_Param.tWarnGap=1000;				//10s
 580  0021 ae03e8        	ldw	x,#1000
 581  0024 bfd1          	ldw	_m_Param+6,x
 582                     ; 59 	m_Param.tMvDetectGap=10;		//128ms, ref AWU_Timebase_TypeDef
 584  0026 350a00d3      	mov	_m_Param+8,#10
 585                     ; 60 	m_Param.tMvLasting=10;		//0.1s		
 587  002a ae000a        	ldw	x,#10
 588  002d bfd6          	ldw	_m_Param+11,x
 589                     ; 61 	m_Param.nMvSendNum=200;		//25.6s		
 591  002f ae00c8        	ldw	x,#200
 592  0032 bfd4          	ldw	_m_Param+9,x
 593                     ; 62 	m_Param.tLLedLasting=100;		//1s
 595  0034 356400d8      	mov	_m_Param+13,#100
 596                     ; 63 	m_Param.tSLedLasting=20;		//0.3s
 598  0038 351400d9      	mov	_m_Param+14,#20
 599                     ; 65 	m_Param.bResv=0;
 601  003c 3fda          	clr	_m_Param+15
 602                     ; 66 	for(i=0;i<4;i++)
 604  003e 0f02          	clr	(OFST+0,sp)
 605  0040               L703:
 606                     ; 67 		m_Param.uResv[i]=0;
 608  0040 7b02          	ld	a,(OFST+0,sp)
 609  0042 5f            	clrw	x
 610  0043 97            	ld	xl,a
 611  0044 58            	sllw	x
 612  0045 905f          	clrw	y
 613  0047 efdb          	ldw	(_m_Param+16,x),y
 614                     ; 66 	for(i=0;i<4;i++)
 616  0049 0c02          	inc	(OFST+0,sp)
 619  004b 7b02          	ld	a,(OFST+0,sp)
 620  004d a104          	cp	a,#4
 621  004f 25ef          	jrult	L703
 622                     ; 69 	EXTI_DeInit();//初始化外部中断
 624  0051 cd0000        	call	_EXTI_DeInit
 626                     ; 71 	EXTI_SetPinSensitivity(EXTI_Pin_5, EXTI_Trigger_Falling_Low);
 628  0054 5f            	clrw	x
 629  0055 a612          	ld	a,#18
 630  0057 95            	ld	xh,a
 631  0058 cd0000        	call	_EXTI_SetPinSensitivity
 633                     ; 72 	m_bWakeExti=0;
 635  005b 3fb6          	clr	_m_bWakeExti
 636                     ; 74 	TIM2_DeInit();//初始化tim2寄存器
 638  005d cd0000        	call	_TIM2_DeInit
 640                     ; 75 	CLK_SetTick(1);	//TIM2 for ticktime 使能tim2 外部中断
 642  0060 a601          	ld	a,#1
 643  0062 cd027e        	call	_CLK_SetTick
 645                     ; 76 	USART_DeInit();//重置usart的外围设备
 647  0065 cd0000        	call	_USART_DeInit
 649                     ; 77 	Set_Usart(1);//设置usart pc3
 651  0068 a601          	ld	a,#1
 652  006a cd02b4        	call	_Set_Usart
 654                     ; 78 	m_Idle=0;
 656  006d 5f            	clrw	x
 657  006e bfb9          	ldw	_m_Idle,x
 658                     ; 80 	bWaitRx=0;
 660                     ; 81 	m_WarnSeq=1;
 662  0070 350100bd      	mov	_m_WarnSeq,#1
 663                     ; 82 	m_tWarnGap=m_Param.tWarnGap;
 665  0074 bed1          	ldw	x,_m_Param+6
 666  0076 bfc3          	ldw	_m_tWarnGap,x
 667                     ; 83 	m_tDataGap=m_Param.tDataGap;
 669  0078 becf          	ldw	x,_m_Param+4
 670  007a bfc5          	ldw	_m_tDataGap,x
 671                     ; 85 	BT_RES_1;//重置
 673  007c 72145000      	bset	20480,#2
 674                     ; 86 	Delay(1);
 676  0080 ae0001        	ldw	x,#1
 677  0083 cd019a        	call	_Delay
 679                     ; 87 	BT_RES_0;
 681  0086 72155000      	bres	20480,#2
 682                     ; 88 	ClearDog();//m_intr1=0
 684  008a cd01d5        	call	_ClearDog
 686                     ; 89 	BRTS_1;//sleep 蓝牙
 688  008d 72185005      	bset	20485,#4
 689                     ; 90 	bRx=0;	//start recv
 691  0091 3f35          	clr	_bRx
 692                     ; 92 	enableInterrupts();
 695  0093 9a            rim
 697  0094               L513:
 698                     ; 101 		Delay(1);
 700  0094 ae0001        	ldw	x,#1
 701  0097 cd019a        	call	_Delay
 703                     ; 102 		if(m_Press==02)		//long Press
 705  009a b6bb          	ld	a,_m_Press
 706  009c a102          	cp	a,#2
 707  009e 2614          	jrne	L123
 708                     ; 104 			m_tLLasting=1;
 710  00a0 ae0001        	ldw	x,#1
 711  00a3 bfc9          	ldw	_m_tLLasting,x
 712                     ; 105 			m_tSLasting=0;
 714  00a5 5f            	clrw	x
 715  00a6 bfc7          	ldw	_m_tSLasting,x
 716                     ; 106 			m_tWarnGap=m_Param.tWarnGap;
 718  00a8 bed1          	ldw	x,_m_Param+6
 719  00aa bfc3          	ldw	_m_tWarnGap,x
 720                     ; 107 			m_WarnSeq++;
 722  00ac 3cbd          	inc	_m_WarnSeq
 723                     ; 109 			m_Press=0;
 725  00ae 3fbb          	clr	_m_Press
 726                     ; 110 			m_bWakeExti=0;
 728  00b0 3fb6          	clr	_m_bWakeExti
 730  00b2 2013          	jra	L323
 731  00b4               L123:
 732                     ; 112 		else if(m_Press==01)	//short press
 734  00b4 b6bb          	ld	a,_m_Press
 735  00b6 a101          	cp	a,#1
 736  00b8 260d          	jrne	L323
 737                     ; 114 			m_tSLasting=1;
 739  00ba ae0001        	ldw	x,#1
 740  00bd bfc7          	ldw	_m_tSLasting,x
 741                     ; 115 			m_tDataGap=m_Param.tDataGap;
 743  00bf becf          	ldw	x,_m_Param+4
 744  00c1 bfc5          	ldw	_m_tDataGap,x
 745                     ; 117 			m_Press=0;
 747  00c3 3fbb          	clr	_m_Press
 748                     ; 118 			m_bWakeExti=0;
 750  00c5 3fb6          	clr	_m_bWakeExti
 751  00c7               L323:
 752                     ; 121 		if(m_tLLasting)	//in warning
 754  00c7 bec9          	ldw	x,_m_tLLasting
 755  00c9 2724          	jreq	L723
 756                     ; 123 			if(m_tLLasting>=m_Param.tLLasting)
 758  00cb bec9          	ldw	x,_m_tLLasting
 759  00cd b3cb          	cpw	x,_m_Param
 760  00cf 2505          	jrult	L133
 761                     ; 124 				m_tLLasting=0;
 763  00d1 5f            	clrw	x
 764  00d2 bfc9          	ldw	_m_tLLasting,x
 766  00d4 203d          	jra	L733
 767  00d6               L133:
 768                     ; 125 			else if(m_tWarnGap>=m_Param.tWarnGap)
 770  00d6 bec3          	ldw	x,_m_tWarnGap
 771  00d8 b3d1          	cpw	x,_m_Param+6
 772  00da 2537          	jrult	L733
 773                     ; 127 				m_tWarnGap=1;
 775  00dc ae0001        	ldw	x,#1
 776  00df bfc3          	ldw	_m_tWarnGap,x
 777                     ; 128 				m_tLedLasting=m_Param.tLLedLasting;
 779  00e1 45d8bc        	mov	_m_tLedLasting,_m_Param+13
 780                     ; 129 				MakeSendPack(MSG_WARN, m_WarnSeq);
 782  00e4 b6bd          	ld	a,_m_WarnSeq
 783  00e6 97            	ld	xl,a
 784  00e7 a620          	ld	a,#32
 785  00e9 95            	ld	xh,a
 786  00ea cd0383        	call	_MakeSendPack
 788  00ed 2024          	jra	L733
 789  00ef               L723:
 790                     ; 132 		else if(m_tSLasting)	//in data selecting
 792  00ef bec7          	ldw	x,_m_tSLasting
 793  00f1 2720          	jreq	L733
 794                     ; 134 			if(m_tSLasting>=m_Param.tSLasting)
 796  00f3 bec7          	ldw	x,_m_tSLasting
 797  00f5 b3cd          	cpw	x,_m_Param+2
 798  00f7 2505          	jrult	L343
 799                     ; 135 				m_tSLasting=0;
 801  00f9 5f            	clrw	x
 802  00fa bfc7          	ldw	_m_tSLasting,x
 804  00fc 2015          	jra	L733
 805  00fe               L343:
 806                     ; 136 			else if(m_tDataGap>=m_Param.tDataGap)
 808  00fe bec5          	ldw	x,_m_tDataGap
 809  0100 b3cf          	cpw	x,_m_Param+4
 810  0102 250f          	jrult	L733
 811                     ; 138 				m_tDataGap=1;
 813  0104 ae0001        	ldw	x,#1
 814  0107 bfc5          	ldw	_m_tDataGap,x
 815                     ; 139 				m_tLedLasting=m_Param.tSLedLasting;
 817  0109 45d9bc        	mov	_m_tLedLasting,_m_Param+14
 818                     ; 140 				MakeSendPack(MSG_DATA, 0);
 820  010c 5f            	clrw	x
 821  010d a610          	ld	a,#16
 822  010f 95            	ld	xh,a
 823  0110 cd0383        	call	_MakeSendPack
 825  0113               L733:
 826                     ; 144 		if(m_tMvLasting>=m_Param.tMvLasting)
 828  0113 bec0          	ldw	x,_m_tMvLasting
 829  0115 b3d6          	cpw	x,_m_Param+11
 830  0117 2525          	jrult	L153
 831                     ; 146 			m_tMvLasting=0;
 833  0119 5f            	clrw	x
 834  011a bfc0          	ldw	_m_tMvLasting,x
 835                     ; 148 			m_nMvSendNum++;
 837  011c bebe          	ldw	x,_m_nMvSendNum
 838  011e 1c0001        	addw	x,#1
 839  0121 bfbe          	ldw	_m_nMvSendNum,x
 840                     ; 149 			if(!m_tLLasting && !m_tSLasting)
 842  0123 bec9          	ldw	x,_m_tLLasting
 843  0125 2609          	jrne	L353
 845  0127 bec7          	ldw	x,_m_tSLasting
 846  0129 2605          	jrne	L353
 847                     ; 150 				m_Idle=500;			//---sleep immediately
 849  012b ae01f4        	ldw	x,#500
 850  012e bfb9          	ldw	_m_Idle,x
 851  0130               L353:
 852                     ; 151 			if(m_nMvSendNum>=m_Param.nMvSendNum)
 854  0130 bebe          	ldw	x,_m_nMvSendNum
 855  0132 b3d4          	cpw	x,_m_Param+9
 856  0134 2508          	jrult	L153
 857                     ; 153 				m_nMvSendNum=0;
 859  0136 5f            	clrw	x
 860  0137 bfbe          	ldw	_m_nMvSendNum,x
 861                     ; 155 				m_Idle=200;			//---delay 300 ms for waiting end bt sending
 863  0139 ae00c8        	ldw	x,#200
 864  013c bfb9          	ldw	_m_Idle,x
 865  013e               L153:
 866                     ; 160 		u8=RecvData(500);//=0 no data
 868  013e ae01f4        	ldw	x,#500
 869  0141 cd03e6        	call	_RecvData
 871  0144 6b02          	ld	(OFST+0,sp),a
 872                     ; 161 		if(u8>0)
 874  0146 0d02          	tnz	(OFST+0,sp)
 875  0148 270b          	jreq	L753
 876                     ; 163 			if(u8==255)//error
 878  014a 7b02          	ld	a,(OFST+0,sp)
 879  014c a1ff          	cp	a,#255
 880  014e 2603          	jrne	L363
 881                     ; 164 				Clear_Usart_Rx();	
 883  0150 cd0352        	call	_Clear_Usart_Rx
 886  0153               L363:
 887                     ; 171 			bRx=0;	//restart recv
 889  0153 3f35          	clr	_bRx
 890  0155               L753:
 891                     ; 174 		if(!m_tLLasting && !m_tSLasting)
 893  0155 bec9          	ldw	x,_m_tLLasting
 894  0157 2703          	jreq	L6
 895  0159 cc0094        	jp	L513
 896  015c               L6:
 898  015c bec7          	ldw	x,_m_tSLasting
 899  015e 2703          	jreq	L01
 900  0160 cc0094        	jp	L513
 901  0163               L01:
 902                     ; 176 			m_Idle++;
 904  0163 beb9          	ldw	x,_m_Idle
 905  0165 1c0001        	addw	x,#1
 906  0168 bfb9          	ldw	_m_Idle,x
 907                     ; 177 			if(m_bWakeExti)//如果处于唤醒状态
 909  016a 3db6          	tnz	_m_bWakeExti
 910  016c 2707          	jreq	L763
 911                     ; 178 				m_Idle0=4000;		//4s
 913  016e ae0fa0        	ldw	x,#4000
 914  0171 bfb7          	ldw	_m_Idle0,x
 916  0173 2005          	jra	L173
 917  0175               L763:
 918                     ; 180 				m_Idle0=500;
 920  0175 ae01f4        	ldw	x,#500
 921  0178 bfb7          	ldw	_m_Idle0,x
 922  017a               L173:
 923                     ; 182 			if(m_Idle>m_Idle0)
 925  017a beb9          	ldw	x,_m_Idle
 926  017c b3b7          	cpw	x,_m_Idle0
 927  017e 2203          	jrugt	L21
 928  0180 cc0094        	jp	L513
 929  0183               L21:
 930                     ; 184 				m_Idle=0;
 932  0183 5f            	clrw	x
 933  0184 bfb9          	ldw	_m_Idle,x
 934                     ; 185 				EnterAHalt(m_Param.tMvDetectGap);
 936  0186 b6d3          	ld	a,_m_Param+8
 937  0188 cd0499        	call	_EnterAHalt
 939                     ; 186 				JustExitAHalt();
 941  018b cd04dc        	call	_JustExitAHalt
 943                     ; 187 				m_tMvLasting=m_Param.tMvLasting;
 945  018e bed6          	ldw	x,_m_Param+11
 946  0190 bfc0          	ldw	_m_tMvLasting,x
 947                     ; 188 				LED_1;
 949  0192 721c5005      	bset	20485,#6
 950  0196 ac940094      	jpf	L513
1002                     ; 195 void Delay(uint16_t nTimes)  //1ms, f=2MHz
1002                     ; 196 {
1003                     	switch	.text
1004  019a               _Delay:
1006  019a 89            	pushw	x
1007  019b 5204          	subw	sp,#4
1008       00000004      OFST:	set	4
1011                     ; 200 	for(i=0;i<nTimes;i++)
1013  019d 5f            	clrw	x
1014  019e 1f01          	ldw	(OFST-3,sp),x
1016  01a0 2017          	jra	L724
1017  01a2               L324:
1018                     ; 202 		nBase=648;//debug 154，release 648;
1020  01a2 ae0288        	ldw	x,#648
1021  01a5 1f03          	ldw	(OFST-1,sp),x
1022  01a7               L334:
1023                     ; 204 			nBase--;
1025  01a7 1e03          	ldw	x,(OFST-1,sp)
1026  01a9 1d0001        	subw	x,#1
1027  01ac 1f03          	ldw	(OFST-1,sp),x
1028                     ; 203 		while(nBase!=0)
1030  01ae 1e03          	ldw	x,(OFST-1,sp)
1031  01b0 26f5          	jrne	L334
1032                     ; 200 	for(i=0;i<nTimes;i++)
1034  01b2 1e01          	ldw	x,(OFST-3,sp)
1035  01b4 1c0001        	addw	x,#1
1036  01b7 1f01          	ldw	(OFST-3,sp),x
1037  01b9               L724:
1040  01b9 1e01          	ldw	x,(OFST-3,sp)
1041  01bb 1305          	cpw	x,(OFST+1,sp)
1042  01bd 25e3          	jrult	L324
1043                     ; 206 }
1046  01bf 5b06          	addw	sp,#6
1047  01c1 81            	ret
1081                     ; 209 void Delay_5us(void)	//2M--not precise
1081                     ; 210 {
1082                     	switch	.text
1083  01c2               _Delay_5us:
1085  01c2 89            	pushw	x
1086       00000002      OFST:	set	2
1089                     ; 213 	nBase=32;	//debug 1, release 4, freq 2M;
1091  01c3 ae0020        	ldw	x,#32
1092  01c6 1f01          	ldw	(OFST-1,sp),x
1093  01c8               L754:
1094                     ; 215 		nBase--;
1096  01c8 1e01          	ldw	x,(OFST-1,sp)
1097  01ca 1d0001        	subw	x,#1
1098  01cd 1f01          	ldw	(OFST-1,sp),x
1099                     ; 214 	while(nBase!=0)
1101  01cf 1e01          	ldw	x,(OFST-1,sp)
1102  01d1 26f5          	jrne	L754
1103                     ; 216 }
1106  01d3 85            	popw	x
1107  01d4 81            	ret
1131                     ; 218 void ClearDog(void)
1131                     ; 219 {
1132                     	switch	.text
1133  01d5               _ClearDog:
1137                     ; 221 	m_intr1=0;
1139  01d5 5f            	clrw	x
1140  01d6 bf31          	ldw	_m_intr1,x
1141                     ; 223 }
1144  01d8 81            	ret
1168                     ; 226 void Init_Port(void)
1168                     ; 227 {
1169                     	switch	.text
1170  01d9               _Init_Port:
1174                     ; 228 	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);
1176  01d9 4b90          	push	#144
1177  01db 4bff          	push	#255
1178  01dd ae5000        	ldw	x,#20480
1179  01e0 cd0000        	call	_GPIO_Init
1181  01e3 85            	popw	x
1182                     ; 229 	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);    
1184  01e4 4b90          	push	#144
1185  01e6 4bff          	push	#255
1186  01e8 ae5005        	ldw	x,#20485
1187  01eb cd0000        	call	_GPIO_Init
1189  01ee 85            	popw	x
1190                     ; 230 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);    
1192  01ef 4b90          	push	#144
1193  01f1 4bff          	push	#255
1194  01f3 ae500a        	ldw	x,#20490
1195  01f6 cd0000        	call	_GPIO_Init
1197  01f9 85            	popw	x
1198                     ; 231 	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);  
1200  01fa 4b90          	push	#144
1201  01fc 4bff          	push	#255
1202  01fe ae500f        	ldw	x,#20495
1203  0201 cd0000        	call	_GPIO_Init
1205  0204 85            	popw	x
1206                     ; 233 	GPIO_Init(GPIOA, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Slow); //BT_RES, reset
1208  0205 4bc0          	push	#192
1209  0207 4b04          	push	#4
1210  0209 ae5000        	ldw	x,#20480
1211  020c cd0000        	call	_GPIO_Init
1213  020f 85            	popw	x
1214                     ; 234 	GPIO_Init(GPIOB, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Slow); //BRTS, no
1216  0210 4bd0          	push	#208
1217  0212 4b10          	push	#16
1218  0214 ae5005        	ldw	x,#20485
1219  0217 cd0000        	call	_GPIO_Init
1221  021a 85            	popw	x
1222                     ; 236 	GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_In_PU_IT); //KEY
1224  021b 4b60          	push	#96
1225  021d 4b20          	push	#32
1226  021f ae5005        	ldw	x,#20485
1227  0222 cd0000        	call	_GPIO_Init
1229  0225 85            	popw	x
1230                     ; 238 	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow); //LED, shut
1232  0226 4bc0          	push	#192
1233  0228 4b40          	push	#64
1234  022a ae5005        	ldw	x,#20485
1235  022d cd0000        	call	_GPIO_Init
1237  0230 85            	popw	x
1238                     ; 239 }
1241  0231 81            	ret
1291                     ; 242 void Init_Mem(void)
1291                     ; 243 {
1292                     	switch	.text
1293  0232               _Init_Mem:
1295  0232 88            	push	a
1296       00000001      OFST:	set	1
1299                     ; 246 	m_intr1=0;	//based on TIM2, restricting uart tx & rx
1301  0233 5f            	clrw	x
1302  0234 bf31          	ldw	_m_intr1,x
1303                     ; 247 	m_intr2=0;	
1305  0236 5f            	clrw	x
1306  0237 bf2f          	ldw	_m_intr2,x
1307                     ; 248 	m_intr3=0;	
1309  0239 5f            	clrw	x
1310  023a bf2d          	ldw	_m_intr3,x
1311                     ; 249 	m_intr4=0;	
1313  023c 5f            	clrw	x
1314  023d bf2b          	ldw	_m_intr4,x
1315                     ; 251 	m_tSLasting=0;				
1317  023f 5f            	clrw	x
1318  0240 bfc7          	ldw	_m_tSLasting,x
1319                     ; 252 	m_tLLasting=0;				
1321  0242 5f            	clrw	x
1322  0243 bfc9          	ldw	_m_tLLasting,x
1323                     ; 253 	m_tDataGap=0;					
1325  0245 5f            	clrw	x
1326  0246 bfc5          	ldw	_m_tDataGap,x
1327                     ; 254 	m_tWarnGap=0;					
1329  0248 5f            	clrw	x
1330  0249 bfc3          	ldw	_m_tWarnGap,x
1331                     ; 255 	m_tMvDetectGap=0;	
1333  024b 3fc2          	clr	_m_tMvDetectGap
1334                     ; 256 	m_nMvSendNum=0;
1336  024d 5f            	clrw	x
1337  024e bfbe          	ldw	_m_nMvSendNum,x
1338                     ; 258 	m_Press=0;
1340  0250 3fbb          	clr	_m_Press
1341                     ; 259 	m_WarnSeq=255;
1343  0252 35ff00bd      	mov	_m_WarnSeq,#255
1344                     ; 261 	for(i=0;i<6;i++)
1346  0256 0f01          	clr	(OFST+0,sp)
1347  0258               L325:
1348                     ; 262 		m_MAC[i]=0;
1350  0258 7b01          	ld	a,(OFST+0,sp)
1351  025a 5f            	clrw	x
1352  025b 97            	ld	xl,a
1353  025c 6f21          	clr	(_m_MAC,x)
1354                     ; 261 	for(i=0;i<6;i++)
1356  025e 0c01          	inc	(OFST+0,sp)
1359  0260 7b01          	ld	a,(OFST+0,sp)
1360  0262 a106          	cp	a,#6
1361  0264 25f2          	jrult	L325
1362                     ; 264 	for(i=0;i<12;i++)
1364  0266 0f01          	clr	(OFST+0,sp)
1365  0268               L135:
1366                     ; 265 		m_DeviceID[i]=0;
1368  0268 7b01          	ld	a,(OFST+0,sp)
1369  026a 5f            	clrw	x
1370  026b 97            	ld	xl,a
1371  026c 6f15          	clr	(_m_DeviceID,x)
1372                     ; 264 	for(i=0;i<12;i++)
1374  026e 0c01          	inc	(OFST+0,sp)
1377  0270 7b01          	ld	a,(OFST+0,sp)
1378  0272 a10c          	cp	a,#12
1379  0274 25f2          	jrult	L135
1380                     ; 267 	Clear_Usart_Tx();
1382  0276 cd033f        	call	_Clear_Usart_Tx
1384                     ; 268 	Clear_Usart_Rx();
1386  0279 cd0352        	call	_Clear_Usart_Rx
1388                     ; 270 }
1391  027c 84            	pop	a
1392  027d 81            	ret
1431                     ; 273 void CLK_SetTick(uint8_t b)  //TIM2 10ms
1431                     ; 274 {
1432                     	switch	.text
1433  027e               _CLK_SetTick:
1437                     ; 275 	if(b)
1439  027e 4d            	tnz	a
1440  027f 2727          	jreq	L555
1441                     ; 277 		CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);//开启tim2的外部时钟
1443  0281 ae0001        	ldw	x,#1
1444  0284 a601          	ld	a,#1
1445  0286 95            	ld	xh,a
1446  0287 cd0000        	call	_CLK_PeripheralClockConfig
1448                     ; 278 	  TIM2_TimeBaseInit(TIM2_Prescaler_1, TIM2_CounterMode_Up, 19999);	
1450  028a ae4e1f        	ldw	x,#19999
1451  028d 89            	pushw	x
1452  028e 5f            	clrw	x
1453  028f 4f            	clr	a
1454  0290 95            	ld	xh,a
1455  0291 cd0000        	call	_TIM2_TimeBaseInit
1457  0294 85            	popw	x
1458                     ; 279     TIM2_InternalClockConfig();//开启tim2的内部时钟
1460  0295 cd0000        	call	_TIM2_InternalClockConfig
1462                     ; 280 		TIM2_ITConfig(TIM2_IT_Update, ENABLE);//开启tim2内部中断
1464  0298 ae0001        	ldw	x,#1
1465  029b a601          	ld	a,#1
1466  029d 95            	ld	xh,a
1467  029e cd0000        	call	_TIM2_ITConfig
1469                     ; 281 		TIM2_Cmd(ENABLE);//让tim外围设备有效
1471  02a1 a601          	ld	a,#1
1472  02a3 cd0000        	call	_TIM2_Cmd
1475  02a6 200b          	jra	L755
1476  02a8               L555:
1477                     ; 283 		TIM2_Cmd(DISABLE);
1479  02a8 4f            	clr	a
1480  02a9 cd0000        	call	_TIM2_Cmd
1482                     ; 284     CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
1484  02ac 5f            	clrw	x
1485  02ad a601          	ld	a,#1
1486  02af 95            	ld	xh,a
1487  02b0 cd0000        	call	_CLK_PeripheralClockConfig
1489  02b3               L755:
1490                     ; 286 }
1493  02b3 81            	ret
1532                     ; 289 void Set_Usart(uint8_t b)
1532                     ; 290 {
1533                     	switch	.text
1534  02b4               _Set_Usart:
1538                     ; 291   if(b)
1540  02b4 4d            	tnz	a
1541  02b5 2739          	jreq	L775
1542                     ; 293 		OPEN_UART_TX;//设置pc3为uart
1544  02b7 4bd0          	push	#208
1545  02b9 4b08          	push	#8
1546  02bb ae500a        	ldw	x,#20490
1547  02be cd0000        	call	_GPIO_Init
1549  02c1 85            	popw	x
1550                     ; 294 		CLK_PeripheralClockConfig(CLK_Peripheral_USART, ENABLE);//使能外设时钟
1553  02c2 ae0001        	ldw	x,#1
1554  02c5 a620          	ld	a,#32
1555  02c7 95            	ld	xh,a
1556  02c8 cd0000        	call	_CLK_PeripheralClockConfig
1558                     ; 295 		USART_Init((uint32_t)9600, USART_WordLength_8D, USART_StopBits_1,
1558                     ; 296                 USART_Parity_No, USART_Mode_Rx | USART_Mode_Tx);//115200 past
1560  02cb 4b0c          	push	#12
1561  02cd 4b00          	push	#0
1562  02cf 4b00          	push	#0
1563  02d1 4b00          	push	#0
1564  02d3 ae2580        	ldw	x,#9600
1565  02d6 89            	pushw	x
1566  02d7 ae0000        	ldw	x,#0
1567  02da 89            	pushw	x
1568  02db cd0000        	call	_USART_Init
1570  02de 5b08          	addw	sp,#8
1571                     ; 298     USART_ITConfig(USART_IT_RXNE, ENABLE);//使能接收中断
1573  02e0 4b01          	push	#1
1574  02e2 ae0255        	ldw	x,#597
1575  02e5 cd0000        	call	_USART_ITConfig
1577  02e8 84            	pop	a
1578                     ; 300     USART_Cmd(ENABLE);
1580  02e9 a601          	ld	a,#1
1581  02eb cd0000        	call	_USART_Cmd
1584  02ee 2028          	jra	L106
1585  02f0               L775:
1586                     ; 302     USART_ITConfig(USART_IT_RXNE, DISABLE);
1588  02f0 4b00          	push	#0
1589  02f2 ae0255        	ldw	x,#597
1590  02f5 cd0000        	call	_USART_ITConfig
1592  02f8 84            	pop	a
1593                     ; 303     USART_ITConfig(USART_IT_TXE, DISABLE);
1595  02f9 4b00          	push	#0
1596  02fb ae0277        	ldw	x,#631
1597  02fe cd0000        	call	_USART_ITConfig
1599  0301 84            	pop	a
1600                     ; 304     USART_Cmd(DISABLE);
1602  0302 4f            	clr	a
1603  0303 cd0000        	call	_USART_Cmd
1605                     ; 305 		CLK_PeripheralClockConfig(CLK_Peripheral_USART, DISABLE);
1607  0306 5f            	clrw	x
1608  0307 a620          	ld	a,#32
1609  0309 95            	ld	xh,a
1610  030a cd0000        	call	_CLK_PeripheralClockConfig
1612                     ; 306 		CLOSE_UART_TX;
1614  030d 4b90          	push	#144
1615  030f 4b08          	push	#8
1616  0311 ae500a        	ldw	x,#20490
1617  0314 cd0000        	call	_GPIO_Init
1619  0317 85            	popw	x
1620  0318               L106:
1621                     ; 308 }
1624  0318 81            	ret
1670                     ; 311 void Usart_Send(uint8_t Len)
1670                     ; 312 {
1671                     	switch	.text
1672  0319               _Usart_Send:
1674  0319 88            	push	a
1675  031a 88            	push	a
1676       00000001      OFST:	set	1
1679                     ; 316 	if(Len <= MAX_TX_LEN)
1681  031b a141          	cp	a,#65
1682  031d 241e          	jruge	L526
1683                     ; 318 		for(i=0;i<Len;i++)
1685  031f 0f01          	clr	(OFST+0,sp)
1687  0321 2014          	jra	L336
1688  0323               L146:
1689                     ; 321 			while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET){};
1691  0323 ae0080        	ldw	x,#128
1692  0326 cd0000        	call	_USART_GetFlagStatus
1694  0329 4d            	tnz	a
1695  032a 27f7          	jreq	L146
1696                     ; 322 			USART_SendData8(Usart_TxBuff[i]);
1699  032c 7b01          	ld	a,(OFST+0,sp)
1700  032e 5f            	clrw	x
1701  032f 97            	ld	xl,a
1702  0330 e676          	ld	a,(_Usart_TxBuff,x)
1703  0332 cd0000        	call	_USART_SendData8
1705                     ; 318 		for(i=0;i<Len;i++)
1707  0335 0c01          	inc	(OFST+0,sp)
1708  0337               L336:
1711  0337 7b01          	ld	a,(OFST+0,sp)
1712  0339 1102          	cp	a,(OFST+1,sp)
1713  033b 25e6          	jrult	L146
1714  033d               L526:
1715                     ; 325 }
1718  033d 85            	popw	x
1719  033e 81            	ret
1754                     ; 328 void Clear_Usart_Tx(void)
1754                     ; 329 {
1755                     	switch	.text
1756  033f               _Clear_Usart_Tx:
1758  033f 88            	push	a
1759       00000001      OFST:	set	1
1762                     ; 332 	for(i=0;i<MAX_TX_LEN;i++)
1764  0340 0f01          	clr	(OFST+0,sp)
1765  0342               L366:
1766                     ; 333 		Usart_TxBuff[i]=0;
1768  0342 7b01          	ld	a,(OFST+0,sp)
1769  0344 5f            	clrw	x
1770  0345 97            	ld	xl,a
1771  0346 6f76          	clr	(_Usart_TxBuff,x)
1772                     ; 332 	for(i=0;i<MAX_TX_LEN;i++)
1774  0348 0c01          	inc	(OFST+0,sp)
1777  034a 7b01          	ld	a,(OFST+0,sp)
1778  034c a140          	cp	a,#64
1779  034e 25f2          	jrult	L366
1780                     ; 334 }
1783  0350 84            	pop	a
1784  0351 81            	ret
1822                     ; 337 void Clear_Usart_Rx(void)
1822                     ; 338 {
1823                     	switch	.text
1824  0352               _Clear_Usart_Rx:
1826  0352 88            	push	a
1827       00000001      OFST:	set	1
1830                     ; 341 	for(i=0;i<MAX_RX_LEN;i++)
1832  0353 0f01          	clr	(OFST+0,sp)
1833  0355               L707:
1834                     ; 342 		Usart_RxBuff[i]=0;
1836  0355 7b01          	ld	a,(OFST+0,sp)
1837  0357 5f            	clrw	x
1838  0358 97            	ld	xl,a
1839  0359 6f36          	clr	(_Usart_RxBuff,x)
1840                     ; 341 	for(i=0;i<MAX_RX_LEN;i++)
1842  035b 0c01          	inc	(OFST+0,sp)
1845  035d 7b01          	ld	a,(OFST+0,sp)
1846  035f a140          	cp	a,#64
1847  0361 25f2          	jrult	L707
1848                     ; 344 	bRx=1;
1850  0363 35010035      	mov	_bRx,#1
1851                     ; 345 	iRxIndex=0;
1853  0367 3f34          	clr	_iRxIndex
1854                     ; 346 	bRxFirst=0;
1856  0369 3f33          	clr	_bRxFirst
1857                     ; 347 }
1860  036b 84            	pop	a
1861  036c 81            	ret
1889                     ; 350 void IWDG_Config(void)
1889                     ; 351 {
1890                     	switch	.text
1891  036d               _IWDG_Config:
1895                     ; 352   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
1897  036d a655          	ld	a,#85
1898  036f cd0000        	call	_IWDG_WriteAccessCmd
1900                     ; 353   IWDG_SetPrescaler(IWDG_Prescaler_256);	//4ms
1902  0372 a606          	ld	a,#6
1903  0374 cd0000        	call	_IWDG_SetPrescaler
1905                     ; 354   IWDG_SetReload((uint8_t)(100));	//400ms
1907  0377 a664          	ld	a,#100
1908  0379 cd0000        	call	_IWDG_SetReload
1910                     ; 355   IWDG_ReloadCounter();
1912  037c cd0000        	call	_IWDG_ReloadCounter
1914                     ; 356   IWDG_Enable();
1916  037f cd0000        	call	_IWDG_Enable
1918                     ; 357 }
1921  0382 81            	ret
1988                     ; 360 void MakeSendPack(uint8_t cmd, uint8_t nNo)
1988                     ; 361 {
1989                     	switch	.text
1990  0383               _MakeSendPack:
1992  0383 89            	pushw	x
1993  0384 5203          	subw	sp,#3
1994       00000003      OFST:	set	3
1997                     ; 365 	OPEN_UART_TX;
1999  0386 4bd0          	push	#208
2000  0388 4b08          	push	#8
2001  038a ae500a        	ldw	x,#20490
2002  038d cd0000        	call	_GPIO_Init
2004  0390 85            	popw	x
2005                     ; 366 	BRTS_0;//打开蓝牙
2008  0391 72195005      	bres	20485,#4
2009                     ; 367 	Delay(1);
2011  0395 ae0001        	ldw	x,#1
2012  0398 cd019a        	call	_Delay
2014                     ; 369 	Usart_TxBuff[0]=0xEB;
2016  039b 35eb0076      	mov	_Usart_TxBuff,#235
2017                     ; 370 	Usart_TxBuff[1]=0x90;
2019  039f 35900077      	mov	_Usart_TxBuff+1,#144
2020                     ; 371 	Usart_TxBuff[2]=0xEB;
2022  03a3 35eb0078      	mov	_Usart_TxBuff+2,#235
2023                     ; 372 	Usart_TxBuff[3]=0x90;
2025  03a7 35900079      	mov	_Usart_TxBuff+3,#144
2026                     ; 374 	for(i=0;i<6;i++)
2028  03ab 0f03          	clr	(OFST+0,sp)
2029  03ad               L757:
2030                     ; 375 		Usart_TxBuff[i+4]=m_MAC[i];
2032  03ad 7b03          	ld	a,(OFST+0,sp)
2033  03af 5f            	clrw	x
2034  03b0 97            	ld	xl,a
2035  03b1 e621          	ld	a,(_m_MAC,x)
2036  03b3 e77a          	ld	(_Usart_TxBuff+4,x),a
2037                     ; 374 	for(i=0;i<6;i++)
2039  03b5 0c03          	inc	(OFST+0,sp)
2042  03b7 7b03          	ld	a,(OFST+0,sp)
2043  03b9 a106          	cp	a,#6
2044  03bb 25f0          	jrult	L757
2045                     ; 377 	Usart_TxBuff[10]=cmd | 0x80;
2047  03bd 7b04          	ld	a,(OFST+1,sp)
2048  03bf aa80          	or	a,#128
2049  03c1 b780          	ld	_Usart_TxBuff+10,a
2050                     ; 378 	Usart_TxBuff[11]=nNo;
2052  03c3 7b05          	ld	a,(OFST+2,sp)
2053  03c5 b781          	ld	_Usart_TxBuff+11,a
2054                     ; 383 	u16=GetCheckSumXor(Usart_TxBuff,MAX_TX_LEN);
2056  03c7 4b40          	push	#64
2057  03c9 ae0076        	ldw	x,#_Usart_TxBuff
2058  03cc ad5b          	call	_GetCheckSumXor
2060  03ce 5b01          	addw	sp,#1
2061  03d0 5f            	clrw	x
2062  03d1 97            	ld	xl,a
2063  03d2 1f01          	ldw	(OFST-2,sp),x
2064                     ; 384 	Usart_TxBuff[MAX_TX_LEN-2]=(uint8_t)(u16 & 0xff);
2066  03d4 7b02          	ld	a,(OFST-1,sp)
2067  03d6 a4ff          	and	a,#255
2068  03d8 b7b4          	ld	_Usart_TxBuff+62,a
2069                     ; 385 	Usart_TxBuff[MAX_TX_LEN-1]=(uint8_t)((u16 >> 8) & 0xff);
2071  03da 7b01          	ld	a,(OFST-2,sp)
2072  03dc b7b5          	ld	_Usart_TxBuff+63,a
2073                     ; 387 	Usart_Send(MAX_TX_LEN);	
2075  03de a640          	ld	a,#64
2076  03e0 cd0319        	call	_Usart_Send
2078                     ; 388 }
2081  03e3 5b05          	addw	sp,#5
2082  03e5 81            	ret
2085                     	bsct
2086  0002               L567_u16:
2087  0002 0000          	dc.w	0
2151                     ; 391 uint8_t RecvData(uint16_t uWait)	//ret: 0--no data, 255--err data, other--valid data
2151                     ; 392 {
2152                     	switch	.text
2153  03e6               _RecvData:
2155  03e6 89            	pushw	x
2156  03e7 89            	pushw	x
2157       00000002      OFST:	set	2
2160                     ; 393 	uint8_t b=0;
2162  03e8 0f02          	clr	(OFST+0,sp)
2163                     ; 394 	uint8_t Cmd=0;
2165                     ; 397 	if(!bRxFirst)
2167  03ea 3d33          	tnz	_bRxFirst
2168  03ec 2605          	jrne	L1201
2169                     ; 398 		u16=0;
2171  03ee 5f            	clrw	x
2172  03ef bf02          	ldw	L567_u16,x
2174  03f1 2027          	jra	L3201
2175  03f3               L1201:
2176                     ; 401 		u16++;
2178  03f3 be02          	ldw	x,L567_u16
2179  03f5 1c0001        	addw	x,#1
2180  03f8 bf02          	ldw	L567_u16,x
2181                     ; 402 		if(u16>uWait)
2183  03fa be02          	ldw	x,L567_u16
2184  03fc 1303          	cpw	x,(OFST+1,sp)
2185  03fe 2304          	jrule	L5201
2186                     ; 403 			return 255;
2188  0400 a6ff          	ld	a,#255
2190  0402 2022          	jra	L64
2191  0404               L5201:
2192                     ; 406 			if(iRxIndex>=MAX_RX_LEN)
2194  0404 b634          	ld	a,_iRxIndex
2195  0406 a140          	cp	a,#64
2196  0408 2510          	jrult	L3201
2197                     ; 408 				b=1;
2199  040a a601          	ld	a,#1
2200  040c 6b02          	ld	(OFST+0,sp),a
2201                     ; 409 				if(CheckSumXor(Usart_RxBuff,MAX_RX_LEN))
2203  040e 4b40          	push	#64
2204  0410 ae0036        	ldw	x,#_Usart_RxBuff
2205  0413 ad50          	call	_CheckSumXor
2207  0415 5b01          	addw	sp,#1
2208  0417 4d            	tnz	a
2209  0418 2700          	jreq	L3301
2210                     ; 410 					Cmd=Usart_RxBuff[10];
2213  041a               L3301:
2214                     ; 412 					Cmd=255;
2216  041a               L3201:
2217                     ; 417 	if(b)
2219  041a 0d02          	tnz	(OFST+0,sp)
2220  041c 2706          	jreq	L7301
2221                     ; 419 		bRx=1;
2223  041e 35010035      	mov	_bRx,#1
2224                     ; 420 		bRxFirst=0;
2226  0422 3f33          	clr	_bRxFirst
2227  0424               L7301:
2228                     ; 423 	return b;
2230  0424 7b02          	ld	a,(OFST+0,sp)
2232  0426               L64:
2234  0426 5b04          	addw	sp,#4
2235  0428 81            	ret
2307                     ; 446 uint8_t GetCheckSumXor(uint8_t* pu8, uint8_t Len)
2307                     ; 447 {
2308                     	switch	.text
2309  0429               _GetCheckSumXor:
2311  0429 89            	pushw	x
2312  042a 5204          	subw	sp,#4
2313       00000004      OFST:	set	4
2316                     ; 448 	uint8_t u8=0;
2318  042c 0f01          	clr	(OFST-3,sp)
2319                     ; 452 	pu=pu8;
2321  042e 1f03          	ldw	(OFST-1,sp),x
2322                     ; 453 	if(Len<2)
2324  0430 7b09          	ld	a,(OFST+5,sp)
2325  0432 a102          	cp	a,#2
2326  0434 2403          	jruge	L7701
2327                     ; 454 		return 0;
2329  0436 4f            	clr	a
2331  0437 2029          	jra	L25
2332  0439               L7701:
2333                     ; 456 	for(i=0;i<Len-1;i++)
2335  0439 0f02          	clr	(OFST-2,sp)
2337  043b 2010          	jra	L5011
2338  043d               L1011:
2339                     ; 458 		u8 ^=*pu;
2341  043d 1e03          	ldw	x,(OFST-1,sp)
2342  043f 7b01          	ld	a,(OFST-3,sp)
2343  0441 f8            	xor	a,	(x)
2344  0442 6b01          	ld	(OFST-3,sp),a
2345                     ; 459 		pu++;
2347  0444 1e03          	ldw	x,(OFST-1,sp)
2348  0446 1c0001        	addw	x,#1
2349  0449 1f03          	ldw	(OFST-1,sp),x
2350                     ; 456 	for(i=0;i<Len-1;i++)
2352  044b 0c02          	inc	(OFST-2,sp)
2353  044d               L5011:
2356  044d 9c            	rvf
2357  044e 7b09          	ld	a,(OFST+5,sp)
2358  0450 5f            	clrw	x
2359  0451 97            	ld	xl,a
2360  0452 5a            	decw	x
2361  0453 7b02          	ld	a,(OFST-2,sp)
2362  0455 905f          	clrw	y
2363  0457 9097          	ld	yl,a
2364  0459 90bf00        	ldw	c_y,y
2365  045c b300          	cpw	x,c_y
2366  045e 2cdd          	jrsgt	L1011
2367                     ; 462 	return u8;
2369  0460 7b01          	ld	a,(OFST-3,sp)
2371  0462               L25:
2373  0462 5b06          	addw	sp,#6
2374  0464 81            	ret
2478                     ; 466 bool CheckSumXor(uint8_t* pu8,uint8_t Len)
2478                     ; 467 {
2479                     	switch	.text
2480  0465               _CheckSumXor:
2482  0465 89            	pushw	x
2483  0466 5205          	subw	sp,#5
2484       00000005      OFST:	set	5
2487                     ; 468 	bool b=FALSE;
2489  0468 0f01          	clr	(OFST-4,sp)
2490                     ; 469 	uint8_t u1=0;
2492                     ; 470 	uint8_t u2=0;
2494                     ; 473 	pDat=pu8;
2496  046a 1f04          	ldw	(OFST-1,sp),x
2497                     ; 474 	u1=GetCheckSumXor(pDat,Len);
2499  046c 7b0a          	ld	a,(OFST+5,sp)
2500  046e 88            	push	a
2501  046f 1e05          	ldw	x,(OFST+0,sp)
2502  0471 adb6          	call	_GetCheckSumXor
2504  0473 5b01          	addw	sp,#1
2505  0475 6b02          	ld	(OFST-3,sp),a
2506                     ; 476 	pDat=pu8;
2508  0477 1e06          	ldw	x,(OFST+1,sp)
2509  0479 1f04          	ldw	(OFST-1,sp),x
2510                     ; 477 	u2=(*(pDat+Len-1));
2512  047b 7b04          	ld	a,(OFST-1,sp)
2513  047d 97            	ld	xl,a
2514  047e 7b05          	ld	a,(OFST+0,sp)
2515  0480 1b0a          	add	a,(OFST+5,sp)
2516  0482 2401          	jrnc	L65
2517  0484 5c            	incw	x
2518  0485               L65:
2519  0485 02            	rlwa	x,a
2520  0486 5a            	decw	x
2521  0487 f6            	ld	a,(x)
2522  0488 6b03          	ld	(OFST-2,sp),a
2523                     ; 479 	if(u1==u2)
2525  048a 7b02          	ld	a,(OFST-3,sp)
2526  048c 1103          	cp	a,(OFST-2,sp)
2527  048e 2604          	jrne	L3611
2528                     ; 480 		b=TRUE;
2530  0490 a601          	ld	a,#1
2531  0492 6b01          	ld	(OFST-4,sp),a
2532  0494               L3611:
2533                     ; 482 	return b;
2535  0494 7b01          	ld	a,(OFST-4,sp)
2538  0496 5b07          	addw	sp,#7
2539  0498 81            	ret
2581                     ; 485 void EnterAHalt(uint8_t time)
2581                     ; 486 {
2582                     	switch	.text
2583  0499               _EnterAHalt:
2585  0499 88            	push	a
2586       00000000      OFST:	set	0
2589                     ; 487 	CLK_SetTick(0);	
2591  049a 4f            	clr	a
2592  049b cd027e        	call	_CLK_SetTick
2594                     ; 488 	Set_Usart(0);
2596  049e 4f            	clr	a
2597  049f cd02b4        	call	_Set_Usart
2599                     ; 491 	BT_RES_0;
2601  04a2 72155000      	bres	20480,#2
2602                     ; 492 	BRTS_1;//sleep
2604  04a6 72185005      	bset	20485,#4
2605                     ; 493 	LED_0;
2607  04aa 721d5005      	bres	20485,#6
2608                     ; 494 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);    
2610  04ae 4b90          	push	#144
2611  04b0 4bff          	push	#255
2612  04b2 ae500a        	ldw	x,#20490
2613  04b5 cd0000        	call	_GPIO_Init
2615  04b8 85            	popw	x
2616                     ; 497   AWU_DeInit();
2618  04b9 cd0000        	call	_AWU_DeInit
2620                     ; 498 	CLK_PeripheralClockConfig(CLK_Peripheral_AWU, ENABLE);
2622  04bc ae0001        	ldw	x,#1
2623  04bf a640          	ld	a,#64
2624  04c1 95            	ld	xh,a
2625  04c2 cd0000        	call	_CLK_PeripheralClockConfig
2627                     ; 499 	if(time>16)
2629  04c5 7b01          	ld	a,(OFST+1,sp)
2630  04c7 a111          	cp	a,#17
2631  04c9 2504          	jrult	L3021
2632                     ; 500 		time=16;
2634  04cb a610          	ld	a,#16
2635  04cd 6b01          	ld	(OFST+1,sp),a
2636  04cf               L3021:
2637                     ; 501 	AWU_Init(time);
2639  04cf 7b01          	ld	a,(OFST+1,sp)
2640  04d1 cd0000        	call	_AWU_Init
2642                     ; 502 	AWU_Cmd(ENABLE);
2644  04d4 a601          	ld	a,#1
2645  04d6 cd0000        	call	_AWU_Cmd
2647                     ; 503   halt();
2650  04d9 8e            halt
2652                     ; 504 }
2656  04da 84            	pop	a
2657  04db 81            	ret
2694                     ; 506 void JustExitAHalt(void)
2694                     ; 507 {
2695                     	switch	.text
2696  04dc               _JustExitAHalt:
2700                     ; 508 	CLK_DeInit();       //2M, all peripherals enable
2702  04dc cd0000        	call	_CLK_DeInit
2704                     ; 509 	disableInterrupts();
2707  04df 9b            sim
2709                     ; 511 	Init_Port();	
2712  04e0 cd01d9        	call	_Init_Port
2714                     ; 513 	EXTI_DeInit();//初始化外部中断
2716  04e3 cd0000        	call	_EXTI_DeInit
2718                     ; 515 	EXTI_SetPinSensitivity(EXTI_Pin_5, EXTI_Trigger_Falling);
2720  04e6 ae0002        	ldw	x,#2
2721  04e9 a612          	ld	a,#18
2722  04eb 95            	ld	xh,a
2723  04ec cd0000        	call	_EXTI_SetPinSensitivity
2725                     ; 517 	TIM2_DeInit();
2727  04ef cd0000        	call	_TIM2_DeInit
2729                     ; 518 	CLK_SetTick(1);	//TIM2 for ticktime
2731  04f2 a601          	ld	a,#1
2732  04f4 cd027e        	call	_CLK_SetTick
2734                     ; 519 	USART_DeInit();
2736  04f7 cd0000        	call	_USART_DeInit
2738                     ; 521 	Set_Usart(1);
2740  04fa a601          	ld	a,#1
2741  04fc cd02b4        	call	_Set_Usart
2743                     ; 522 	Clear_Usart_Tx();
2745  04ff cd033f        	call	_Clear_Usart_Tx
2747                     ; 523 	Clear_Usart_Rx();	
2749  0502 cd0352        	call	_Clear_Usart_Rx
2751                     ; 524 	bRx=0;
2753  0505 3f35          	clr	_bRx
2754                     ; 525 	m_Press=0;
2756  0507 3fbb          	clr	_m_Press
2757                     ; 526 	enableInterrupts();
2760  0509 9a            rim
2762                     ; 527 }
2766  050a 81            	ret
2769                     	bsct
2770  0004               L5121_Key:
2771  0004 00            	dc.b	0
2772  0005               L7121_OldKey:
2773  0005 00            	dc.b	0
2774  0006               L1221_KeyLasting:
2775  0006 00            	dc.b	0
2834                     ; 531 @far @interrupt void TIM2_Handle_ISR(void)
2834                     ; 532 {
2836                     	switch	.text
2837  050b               f_TIM2_Handle_ISR:
2839  050b 3b0002        	push	c_x+2
2840  050e be00          	ldw	x,c_x
2841  0510 89            	pushw	x
2842  0511 3b0002        	push	c_y+2
2843  0514 be00          	ldw	x,c_y
2844  0516 89            	pushw	x
2847                     ; 538 	TIM2_ClearITPendingBit(TIM2_IT_Update);
2849  0517 a601          	ld	a,#1
2850  0519 cd0000        	call	_TIM2_ClearITPendingBit
2852                     ; 540 	if(m_tLLasting>0)
2854  051c bec9          	ldw	x,_m_tLLasting
2855  051e 2707          	jreq	L1521
2856                     ; 541 		m_tLLasting++;
2858  0520 bec9          	ldw	x,_m_tLLasting
2859  0522 1c0001        	addw	x,#1
2860  0525 bfc9          	ldw	_m_tLLasting,x
2861  0527               L1521:
2862                     ; 542 	if(m_tSLasting>0)
2864  0527 bec7          	ldw	x,_m_tSLasting
2865  0529 2707          	jreq	L3521
2866                     ; 543 		m_tSLasting++;
2868  052b bec7          	ldw	x,_m_tSLasting
2869  052d 1c0001        	addw	x,#1
2870  0530 bfc7          	ldw	_m_tSLasting,x
2871  0532               L3521:
2872                     ; 545 	if(m_tWarnGap>0)
2874  0532 bec3          	ldw	x,_m_tWarnGap
2875  0534 2707          	jreq	L5521
2876                     ; 546 		m_tWarnGap++;
2878  0536 bec3          	ldw	x,_m_tWarnGap
2879  0538 1c0001        	addw	x,#1
2880  053b bfc3          	ldw	_m_tWarnGap,x
2881  053d               L5521:
2882                     ; 547 	if(m_tDataGap>0)
2884  053d bec5          	ldw	x,_m_tDataGap
2885  053f 2707          	jreq	L7521
2886                     ; 548 		m_tDataGap++;
2888  0541 bec5          	ldw	x,_m_tDataGap
2889  0543 1c0001        	addw	x,#1
2890  0546 bfc5          	ldw	_m_tDataGap,x
2891  0548               L7521:
2892                     ; 550 	m_tMvLasting++;	
2894  0548 bec0          	ldw	x,_m_tMvLasting
2895  054a 1c0001        	addw	x,#1
2896  054d bfc0          	ldw	_m_tMvLasting,x
2897                     ; 552 	if(m_tLedLasting)
2899  054f 3dbc          	tnz	_m_tLedLasting
2900  0551 2708          	jreq	L1621
2901                     ; 554 		LED_1;
2903  0553 721c5005      	bset	20485,#6
2904                     ; 555 		m_tLedLasting--;
2906  0557 3abc          	dec	_m_tLedLasting
2908  0559 2004          	jra	L3621
2909  055b               L1621:
2910                     ; 558 		LED_0;
2912  055b 721d5005      	bres	20485,#6
2913  055f               L3621:
2914                     ; 560 	if(READ_KEY)	//no press
2916  055f 4b20          	push	#32
2917  0561 ae5005        	ldw	x,#20485
2918  0564 cd0000        	call	_GPIO_ReadInputDataBit
2920  0567 5b01          	addw	sp,#1
2921  0569 4d            	tnz	a
2922  056a 2718          	jreq	L5621
2923                     ; 562 		if(KeyLasting>10 && KeyLasting<=150)
2925  056c b606          	ld	a,L1221_KeyLasting
2926  056e a10b          	cp	a,#11
2927  0570 250a          	jrult	L7621
2929  0572 b606          	ld	a,L1221_KeyLasting
2930  0574 a197          	cp	a,#151
2931  0576 2404          	jruge	L7621
2932                     ; 563 			m_Press=01;			//short press
2934  0578 350100bb      	mov	_m_Press,#1
2935  057c               L7621:
2936                     ; 565 		Key=0;
2938  057c 3f04          	clr	L5121_Key
2939                     ; 566 		OldKey=0;
2941  057e 3f05          	clr	L7121_OldKey
2942                     ; 567 		KeyLasting=0;
2944  0580 3f06          	clr	L1221_KeyLasting
2946  0582 2030          	jra	L1721
2947  0584               L5621:
2948                     ; 571 		Key=1;
2950  0584 35010004      	mov	L5121_Key,#1
2951                     ; 572 		if(OldKey==0)	//first press
2953  0588 3d05          	tnz	L7121_OldKey
2954  058a 2606          	jrne	L3721
2955                     ; 573 			KeyLasting=1;
2957  058c 35010006      	mov	L1221_KeyLasting,#1
2959  0590 2022          	jra	L1721
2960  0592               L3721:
2961                     ; 576 			KeyLasting++;
2963  0592 3c06          	inc	L1221_KeyLasting
2964                     ; 577 			if(KeyLasting>150 && KeyLasting<250)
2966  0594 b606          	ld	a,L1221_KeyLasting
2967  0596 a197          	cp	a,#151
2968  0598 2510          	jrult	L7721
2970  059a b606          	ld	a,L1221_KeyLasting
2971  059c a1fa          	cp	a,#250
2972  059e 240a          	jruge	L7721
2973                     ; 579 				KeyLasting=251;
2975  05a0 35fb0006      	mov	L1221_KeyLasting,#251
2976                     ; 580 				m_Press=02;				//long press
2978  05a4 350200bb      	mov	_m_Press,#2
2980  05a8 200a          	jra	L1721
2981  05aa               L7721:
2982                     ; 582 			else if(KeyLasting>250)
2984  05aa b606          	ld	a,L1221_KeyLasting
2985  05ac a1fb          	cp	a,#251
2986  05ae 2504          	jrult	L1721
2987                     ; 583 				KeyLasting=251;
2989  05b0 35fb0006      	mov	L1221_KeyLasting,#251
2990  05b4               L1721:
2991                     ; 586 	OldKey=Key;
2993  05b4 450405        	mov	L7121_OldKey,L5121_Key
2994                     ; 587 }
2997  05b7 85            	popw	x
2998  05b8 bf00          	ldw	c_y,x
2999  05ba 320002        	pop	c_y+2
3000  05bd 85            	popw	x
3001  05be bf00          	ldw	c_x,x
3002  05c0 320002        	pop	c_x+2
3003  05c3 80            	iret
3182                     ; 594 bool I2C_CheckEvent_T(I2C_Event_TypeDef I2C_Event,uint8_t timeout)
3182                     ; 595 {
3184                     	switch	.text
3185  05c4               _I2C_CheckEvent_T:
3187  05c4 89            	pushw	x
3188  05c5 89            	pushw	x
3189       00000002      OFST:	set	2
3192                     ; 596 	bool b=FALSE;
3194  05c6 0f01          	clr	(OFST-1,sp)
3195                     ; 599 	for(i=0;i<timeout;i++)
3197  05c8 0f02          	clr	(OFST+0,sp)
3199  05ca 2016          	jra	L1041
3200  05cc               L5731:
3201                     ; 601 		if(I2C_CheckEvent(I2C_Event))
3203  05cc 1e03          	ldw	x,(OFST+1,sp)
3204  05ce cd0000        	call	_I2C_CheckEvent
3206  05d1 4d            	tnz	a
3207  05d2 2709          	jreq	L5041
3208                     ; 603 			b=TRUE;
3210  05d4 a601          	ld	a,#1
3211  05d6 6b01          	ld	(OFST-1,sp),a
3212                     ; 604 			break;
3213  05d8               L3041:
3214                     ; 610 	return b;
3216  05d8 7b01          	ld	a,(OFST-1,sp)
3219  05da 5b04          	addw	sp,#4
3220  05dc 81            	ret
3221  05dd               L5041:
3222                     ; 607 			Delay_5us();
3224  05dd cd01c2        	call	_Delay_5us
3226                     ; 599 	for(i=0;i<timeout;i++)
3228  05e0 0c02          	inc	(OFST+0,sp)
3229  05e2               L1041:
3232  05e2 7b02          	ld	a,(OFST+0,sp)
3233  05e4 1107          	cp	a,(OFST+5,sp)
3234  05e6 25e4          	jrult	L5731
3235  05e8 20ee          	jra	L3041
3297                     ; 613 bool I2C_SendCmd(uint8_t slvAddr,uint8_t Size)	
3297                     ; 614 {
3298                     	switch	.text
3299  05ea               _I2C_SendCmd:
3301  05ea 89            	pushw	x
3302  05eb 88            	push	a
3303       00000001      OFST:	set	1
3306                     ; 616 	uint8_t iTx=0;
3308  05ec 0f01          	clr	(OFST+0,sp)
3310  05ee               L3441:
3311                     ; 620 	while (I2C_GetFlagStatus(I2C_FLAG_BUSY));
3313  05ee ae0302        	ldw	x,#770
3314  05f1 cd0000        	call	_I2C_GetFlagStatus
3316  05f4 4d            	tnz	a
3317  05f5 26f7          	jrne	L3441
3318                     ; 622 	I2C_GenerateSTART(ENABLE);
3320  05f7 a601          	ld	a,#1
3321  05f9 cd0000        	call	_I2C_GenerateSTART
3324  05fc               L1541:
3325                     ; 624   while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
3327  05fc ae0301        	ldw	x,#769
3328  05ff cd0000        	call	_I2C_CheckEvent
3330  0602 4d            	tnz	a
3331  0603 27f7          	jreq	L1541
3332                     ; 627   I2C_Send7bitAddress(slvAddr, I2C_Direction_Transmitter);
3334  0605 5f            	clrw	x
3335  0606 7b02          	ld	a,(OFST+1,sp)
3336  0608 95            	ld	xh,a
3337  0609 cd0000        	call	_I2C_Send7bitAddress
3339                     ; 630   if(!I2C_CheckEvent_T(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED,5))	//200us
3341  060c 4b05          	push	#5
3342  060e ae0782        	ldw	x,#1922
3343  0611 adb1          	call	_I2C_CheckEvent_T
3345  0613 5b01          	addw	sp,#1
3346  0615 4d            	tnz	a
3347  0616 261e          	jrne	L1641
3348                     ; 632 		I2C_GenerateSTOP(ENABLE);
3350  0618 a601          	ld	a,#1
3351  061a cd0000        	call	_I2C_GenerateSTOP
3353                     ; 633 		return FALSE;
3355  061d 4f            	clr	a
3357  061e 2029          	jra	L27
3358  0620               L7541:
3359                     ; 640     I2C_SendData(I2c_TxBuff[iTx++]);
3361  0620 7b01          	ld	a,(OFST+0,sp)
3362  0622 97            	ld	xl,a
3363  0623 0c01          	inc	(OFST+0,sp)
3364  0625 9f            	ld	a,xl
3365  0626 5f            	clrw	x
3366  0627 97            	ld	xl,a
3367  0628 e610          	ld	a,(_I2c_TxBuff,x)
3368  062a cd0000        	call	_I2C_SendData
3371  062d               L7641:
3372                     ; 642     while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
3374  062d ae0784        	ldw	x,#1924
3375  0630 cd0000        	call	_I2C_CheckEvent
3377  0633 4d            	tnz	a
3378  0634 27f7          	jreq	L7641
3379  0636               L1641:
3380                     ; 638   while (iTx < Size)
3382  0636 7b01          	ld	a,(OFST+0,sp)
3383  0638 1103          	cp	a,(OFST+2,sp)
3384  063a 25e4          	jrult	L7541
3385                     ; 646   I2C_GenerateSTOP(ENABLE);
3387  063c a601          	ld	a,#1
3388  063e cd0000        	call	_I2C_GenerateSTOP
3390                     ; 647 	Delay_5us();
3392  0641 cd01c2        	call	_Delay_5us
3394                     ; 648 	Delay_5us();
3396  0644 cd01c2        	call	_Delay_5us
3398                     ; 650 	return TRUE;
3400  0647 a601          	ld	a,#1
3402  0649               L27:
3404  0649 5b03          	addw	sp,#3
3405  064b 81            	ret
3487                     ; 654 bool I2C_GetData(uint8_t slvAddr, uint8_t *pu8, uint8_t Size)	
3487                     ; 655 {
3488                     	switch	.text
3489  064c               _I2C_GetData:
3491  064c 88            	push	a
3492  064d 5203          	subw	sp,#3
3493       00000003      OFST:	set	3
3496                     ; 656 	uint8_t iRx=0;
3498  064f 0f01          	clr	(OFST-2,sp)
3499                     ; 659 	pData=pu8;
3501  0651 1e07          	ldw	x,(OFST+4,sp)
3502  0653 1f02          	ldw	(OFST-1,sp),x
3504  0655               L5351:
3505                     ; 662   while (I2C_GetFlagStatus(I2C_FLAG_BUSY));
3507  0655 ae0302        	ldw	x,#770
3508  0658 cd0000        	call	_I2C_GetFlagStatus
3510  065b 4d            	tnz	a
3511  065c 26f7          	jrne	L5351
3512                     ; 663 	I2C_GenerateSTART(ENABLE);
3514  065e a601          	ld	a,#1
3515  0660 cd0000        	call	_I2C_GenerateSTART
3518  0663               L3451:
3519                     ; 665   while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
3521  0663 ae0301        	ldw	x,#769
3522  0666 cd0000        	call	_I2C_CheckEvent
3524  0669 4d            	tnz	a
3525  066a 27f7          	jreq	L3451
3526                     ; 667   I2C_Send7bitAddress(slvAddr, I2C_Direction_Transmitter);
3528  066c 5f            	clrw	x
3529  066d 7b04          	ld	a,(OFST+1,sp)
3530  066f 95            	ld	xh,a
3531  0670 cd0000        	call	_I2C_Send7bitAddress
3533                     ; 669   if(!I2C_CheckEvent_T(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED,5))	//200us
3535  0673 4b05          	push	#5
3536  0675 ae0782        	ldw	x,#1922
3537  0678 cd05c4        	call	_I2C_CheckEvent_T
3539  067b 5b01          	addw	sp,#1
3540  067d 4d            	tnz	a
3541  067e 2608          	jrne	L7451
3542                     ; 671 		I2C_GenerateSTOP(ENABLE);
3544  0680 a601          	ld	a,#1
3545  0682 cd0000        	call	_I2C_GenerateSTOP
3547                     ; 672 		return FALSE;
3549  0685 4f            	clr	a
3551  0686 2037          	jra	L67
3552  0688               L7451:
3553                     ; 675   I2C_SendData(0x00);//发送数据
3555  0688 4f            	clr	a
3556  0689 cd0000        	call	_I2C_SendData
3559  068c               L3551:
3560                     ; 677   while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
3562  068c ae0784        	ldw	x,#1924
3563  068f cd0000        	call	_I2C_CheckEvent
3565  0692 4d            	tnz	a
3566  0693 27f7          	jreq	L3551
3567                     ; 679 	I2C_GenerateSTART(ENABLE);
3569  0695 a601          	ld	a,#1
3570  0697 cd0000        	call	_I2C_GenerateSTART
3573  069a               L1651:
3574                     ; 681   while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
3576  069a ae0301        	ldw	x,#769
3577  069d cd0000        	call	_I2C_CheckEvent
3579  06a0 4d            	tnz	a
3580  06a1 27f7          	jreq	L1651
3581                     ; 683   I2C_Send7bitAddress(slvAddr, I2C_Direction_Receiver);
3583  06a3 ae0001        	ldw	x,#1
3584  06a6 7b04          	ld	a,(OFST+1,sp)
3585  06a8 95            	ld	xh,a
3586  06a9 cd0000        	call	_I2C_Send7bitAddress
3588                     ; 685   if(!I2C_CheckEvent_T(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED,5))	//200us
3590  06ac 4b05          	push	#5
3591  06ae ae0302        	ldw	x,#770
3592  06b1 cd05c4        	call	_I2C_CheckEvent_T
3594  06b4 5b01          	addw	sp,#1
3595  06b6 4d            	tnz	a
3596  06b7 2621          	jrne	L1751
3597                     ; 687 		I2C_GenerateSTOP(ENABLE);
3599  06b9 a601          	ld	a,#1
3600  06bb cd0000        	call	_I2C_GenerateSTOP
3602                     ; 688 		return FALSE;
3604  06be 4f            	clr	a
3606  06bf               L67:
3608  06bf 5b04          	addw	sp,#4
3609  06c1 81            	ret
3610  06c2               L7751:
3611                     ; 695     while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
3613  06c2 ae0340        	ldw	x,#832
3614  06c5 cd0000        	call	_I2C_CheckEvent
3616  06c8 4d            	tnz	a
3617  06c9 27f7          	jreq	L7751
3618                     ; 696     *pData = (uint8_t)(I2C_ReceiveData());
3620  06cb cd0000        	call	_I2C_ReceiveData
3622  06ce 1e02          	ldw	x,(OFST-1,sp)
3623  06d0 f7            	ld	(x),a
3624                     ; 697 		pData++;
3626  06d1 1e02          	ldw	x,(OFST-1,sp)
3627  06d3 1c0001        	addw	x,#1
3628  06d6 1f02          	ldw	(OFST-1,sp),x
3629                     ; 698 		iRx++;
3631  06d8 0c01          	inc	(OFST-2,sp)
3632  06da               L1751:
3633                     ; 692   while (iRx < Size)
3635  06da 7b01          	ld	a,(OFST-2,sp)
3636  06dc 1109          	cp	a,(OFST+6,sp)
3637  06de 25e2          	jrult	L7751
3638                     ; 702   I2C_GenerateSTOP(ENABLE);
3640  06e0 a601          	ld	a,#1
3641  06e2 cd0000        	call	_I2C_GenerateSTOP
3643                     ; 703 	Delay_5us();
3645  06e5 cd01c2        	call	_Delay_5us
3647                     ; 704 	Delay_5us();
3649  06e8 cd01c2        	call	_Delay_5us
3651                     ; 706 	return TRUE;
3653  06eb a601          	ld	a,#1
3655  06ed 20d0          	jra	L67
3690                     ; 710 void Clear_I2c_Rx()
3690                     ; 711 {
3691                     	switch	.text
3692  06ef               _Clear_I2c_Rx:
3694  06ef 88            	push	a
3695       00000001      OFST:	set	1
3698                     ; 714 	for(i=0;i<I2C_MAX_RX_LEN;i++)
3700  06f0 0f01          	clr	(OFST+0,sp)
3701  06f2               L1261:
3702                     ; 715 		I2c_RxBuff[i]=0;
3704  06f2 7b01          	ld	a,(OFST+0,sp)
3705  06f4 5f            	clrw	x
3706  06f5 97            	ld	xl,a
3707  06f6 6f00          	clr	(_I2c_RxBuff,x)
3708                     ; 714 	for(i=0;i<I2C_MAX_RX_LEN;i++)
3710  06f8 0c01          	inc	(OFST+0,sp)
3713  06fa 7b01          	ld	a,(OFST+0,sp)
3714  06fc a110          	cp	a,#16
3715  06fe 25f2          	jrult	L1261
3716                     ; 716 }
3719  0700 84            	pop	a
3720  0701 81            	ret
3758                     ; 720 @far @interrupt void UsartRx_Handle_ISR(void)
3758                     ; 721 {
3760                     	switch	.text
3761  0702               f_UsartRx_Handle_ISR:
3763       00000001      OFST:	set	1
3764  0702 88            	push	a
3767                     ; 724 	w=(uint8_t)USART->DR;
3769  0703 c65231        	ld	a,21041
3770  0706 6b01          	ld	(OFST+0,sp),a
3771                     ; 730 	if(!bRx)
3773  0708 3d35          	tnz	_bRx
3774  070a 2622          	jrne	L5461
3775                     ; 732 		if(!bRxFirst)
3777  070c 3d33          	tnz	_bRxFirst
3778  070e 260e          	jrne	L7461
3779                     ; 734 			Usart_RxBuff[0]=w;
3781  0710 7b01          	ld	a,(OFST+0,sp)
3782  0712 b736          	ld	_Usart_RxBuff,a
3783                     ; 735 			bRxFirst=1;
3785  0714 35010033      	mov	_bRxFirst,#1
3786                     ; 736 			iRxIndex=1;
3788  0718 35010034      	mov	_iRxIndex,#1
3790  071c 2010          	jra	L5461
3791  071e               L7461:
3792                     ; 738 			if(iRxIndex<MAX_RX_LEN)
3794  071e b634          	ld	a,_iRxIndex
3795  0720 a140          	cp	a,#64
3796  0722 240a          	jruge	L5461
3797                     ; 740 				Usart_RxBuff[iRxIndex]=w;
3799  0724 b634          	ld	a,_iRxIndex
3800  0726 5f            	clrw	x
3801  0727 97            	ld	xl,a
3802  0728 7b01          	ld	a,(OFST+0,sp)
3803  072a e736          	ld	(_Usart_RxBuff,x),a
3804                     ; 741 				iRxIndex++;
3806  072c 3c34          	inc	_iRxIndex
3807  072e               L5461:
3808                     ; 745 }
3811  072e 84            	pop	a
3812  072f 80            	iret
3835                     ; 748 @far @interrupt void AWU_Handle_ISR(void)
3835                     ; 749 {
3836                     	switch	.text
3837  0730               f_AWU_Handle_ISR:
3839  0730 3b0002        	push	c_x+2
3840  0733 be00          	ldw	x,c_x
3841  0735 89            	pushw	x
3842  0736 3b0002        	push	c_y+2
3843  0739 be00          	ldw	x,c_y
3844  073b 89            	pushw	x
3847                     ; 751 	AWU_GetFlagStatus();
3849  073c cd0000        	call	_AWU_GetFlagStatus
3851                     ; 752 }
3854  073f 85            	popw	x
3855  0740 bf00          	ldw	c_y,x
3856  0742 320002        	pop	c_y+2
3857  0745 85            	popw	x
3858  0746 bf00          	ldw	c_x,x
3859  0748 320002        	pop	c_x+2
3860  074b 80            	iret
3884                     ; 755 @far @interrupt void EXTI5_Handle_ISR(void)//按下按钮触发
3884                     ; 756 {
3885                     	switch	.text
3886  074c               f_EXTI5_Handle_ISR:
3888  074c 3b0002        	push	c_x+2
3889  074f be00          	ldw	x,c_x
3890  0751 89            	pushw	x
3891  0752 3b0002        	push	c_y+2
3892  0755 be00          	ldw	x,c_y
3893  0757 89            	pushw	x
3896                     ; 757 	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
3898  0758 a620          	ld	a,#32
3899  075a cd0000        	call	_EXTI_ClearITPendingBit
3901                     ; 758 	m_bWakeExti=1;
3903  075d 350100b6      	mov	_m_bWakeExti,#1
3904                     ; 759 }
3907  0761 85            	popw	x
3908  0762 bf00          	ldw	c_y,x
3909  0764 320002        	pop	c_y+2
3910  0767 85            	popw	x
3911  0768 bf00          	ldw	c_x,x
3912  076a 320002        	pop	c_x+2
3913  076d 80            	iret
3925                     	xdef	f_EXTI5_Handle_ISR
3926                     	xdef	f_AWU_Handle_ISR
3927                     	xdef	f_UsartRx_Handle_ISR
3928                     	xdef	f_TIM2_Handle_ISR
3929                     	xdef	_main
3930                     	xdef	_Delay_5us
3931                     	xdef	_I2C_GetData
3932                     	xdef	_I2C_SendCmd
3933                     	xdef	_I2C_CheckEvent_T
3934                     	xdef	_Clear_I2c_Rx
3935                     	xdef	_JustExitAHalt
3936                     	xdef	_EnterAHalt
3937                     	xdef	_ClearDog
3938                     	xdef	_CheckSumXor
3939                     	xdef	_GetCheckSumXor
3940                     	xdef	_RecvData
3941                     	xdef	_MakeSendPack
3942                     	xdef	_Clear_Usart_Rx
3943                     	xdef	_Clear_Usart_Tx
3944                     	xdef	_Usart_Send
3945                     	xdef	_Set_Usart
3946                     	xdef	_IWDG_Config
3947                     	xdef	_Init_Mem
3948                     	xdef	_Init_Port
3949                     	xdef	_CLK_SetTick
3950                     	xdef	_Delay
3951                     	switch	.ubsct
3952  0000               _I2c_RxBuff:
3953  0000 000000000000  	ds.b	16
3954                     	xdef	_I2c_RxBuff
3955  0010               _I2c_TxBuff:
3956  0010 00000000      	ds.b	4
3957                     	xdef	_I2c_TxBuff
3958                     	xdef	_addrMaybe
3959                     	xdef	_m_beat
3960  0014               _m_Turn:
3961  0014 00            	ds.b	1
3962                     	xdef	_m_Turn
3963  0015               _m_DeviceID:
3964  0015 000000000000  	ds.b	12
3965                     	xdef	_m_DeviceID
3966  0021               _m_MAC:
3967  0021 000000000000  	ds.b	6
3968                     	xdef	_m_MAC
3969  0027               _m_Shinning:
3970  0027 00            	ds.b	1
3971                     	xdef	_m_Shinning
3972  0028               _iWDog:
3973  0028 00            	ds.b	1
3974                     	xdef	_iWDog
3975  0029               _m_Intv1:
3976  0029 0000          	ds.b	2
3977                     	xdef	_m_Intv1
3978  002b               _m_intr4:
3979  002b 0000          	ds.b	2
3980                     	xdef	_m_intr4
3981  002d               _m_intr3:
3982  002d 0000          	ds.b	2
3983                     	xdef	_m_intr3
3984  002f               _m_intr2:
3985  002f 0000          	ds.b	2
3986                     	xdef	_m_intr2
3987  0031               _m_intr1:
3988  0031 0000          	ds.b	2
3989                     	xdef	_m_intr1
3990  0033               _bRxFirst:
3991  0033 00            	ds.b	1
3992                     	xdef	_bRxFirst
3993  0034               _iRxIndex:
3994  0034 00            	ds.b	1
3995                     	xdef	_iRxIndex
3996  0035               _bRx:
3997  0035 00            	ds.b	1
3998                     	xdef	_bRx
3999  0036               _Usart_RxBuff:
4000  0036 000000000000  	ds.b	64
4001                     	xdef	_Usart_RxBuff
4002  0076               _Usart_TxBuff:
4003  0076 000000000000  	ds.b	64
4004                     	xdef	_Usart_TxBuff
4005  00b6               _m_bWakeExti:
4006  00b6 00            	ds.b	1
4007                     	xdef	_m_bWakeExti
4008  00b7               _m_Idle0:
4009  00b7 0000          	ds.b	2
4010                     	xdef	_m_Idle0
4011  00b9               _m_Idle:
4012  00b9 0000          	ds.b	2
4013                     	xdef	_m_Idle
4014  00bb               _m_Press:
4015  00bb 00            	ds.b	1
4016                     	xdef	_m_Press
4017  00bc               _m_tLedLasting:
4018  00bc 00            	ds.b	1
4019                     	xdef	_m_tLedLasting
4020  00bd               _m_WarnSeq:
4021  00bd 00            	ds.b	1
4022                     	xdef	_m_WarnSeq
4023  00be               _m_nMvSendNum:
4024  00be 0000          	ds.b	2
4025                     	xdef	_m_nMvSendNum
4026  00c0               _m_tMvLasting:
4027  00c0 0000          	ds.b	2
4028                     	xdef	_m_tMvLasting
4029  00c2               _m_tMvDetectGap:
4030  00c2 00            	ds.b	1
4031                     	xdef	_m_tMvDetectGap
4032  00c3               _m_tWarnGap:
4033  00c3 0000          	ds.b	2
4034                     	xdef	_m_tWarnGap
4035  00c5               _m_tDataGap:
4036  00c5 0000          	ds.b	2
4037                     	xdef	_m_tDataGap
4038  00c7               _m_tSLasting:
4039  00c7 0000          	ds.b	2
4040                     	xdef	_m_tSLasting
4041  00c9               _m_tLLasting:
4042  00c9 0000          	ds.b	2
4043                     	xdef	_m_tLLasting
4044  00cb               _m_Param:
4045  00cb 000000000000  	ds.b	24
4046                     	xdef	_m_Param
4047                     	xref	_AWU_GetFlagStatus
4048                     	xref	_AWU_Cmd
4049                     	xref	_AWU_Init
4050                     	xref	_AWU_DeInit
4051                     	xref	_USART_GetFlagStatus
4052                     	xref	_USART_SendData8
4053                     	xref	_USART_ITConfig
4054                     	xref	_USART_Cmd
4055                     	xref	_USART_Init
4056                     	xref	_USART_DeInit
4057                     	xref	_IWDG_Enable
4058                     	xref	_IWDG_ReloadCounter
4059                     	xref	_IWDG_SetReload
4060                     	xref	_IWDG_SetPrescaler
4061                     	xref	_IWDG_WriteAccessCmd
4062                     	xref	_TIM2_ClearITPendingBit
4063                     	xref	_TIM2_InternalClockConfig
4064                     	xref	_TIM2_ITConfig
4065                     	xref	_TIM2_Cmd
4066                     	xref	_TIM2_TimeBaseInit
4067                     	xref	_TIM2_DeInit
4068                     	xref	_I2C_GetFlagStatus
4069                     	xref	_I2C_Send7bitAddress
4070                     	xref	_I2C_SendData
4071                     	xref	_I2C_ReceiveData
4072                     	xref	_I2C_CheckEvent
4073                     	xref	_I2C_GenerateSTOP
4074                     	xref	_I2C_GenerateSTART
4075                     	xref	_GPIO_ReadInputDataBit
4076                     	xref	_GPIO_Init
4077                     	xref	_FLASH_SetProgrammingTime
4078                     	xref	_FLASH_DeInit
4079                     	xref	_EXTI_ClearITPendingBit
4080                     	xref	_EXTI_SetPinSensitivity
4081                     	xref	_EXTI_DeInit
4082                     	xref	_CLK_PeripheralClockConfig
4083                     	xref	_CLK_DeInit
4084                     	xref.b	c_x
4085                     	xref.b	c_y
4105                     	end
