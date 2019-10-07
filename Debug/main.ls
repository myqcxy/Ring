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
 504                     ; 26 int main( void )
 504                     ; 27 {
 506                     	switch	.text
 507  0000               _main:
 509  0000 88            	push	a
 510       00000001      OFST:	set	1
 513                     ; 36   CLK_DeInit();       //2M, all peripherals enable
 515  0001 cd0000        	call	_CLK_DeInit
 517                     ; 37   disableInterrupts();
 520  0004 9b            sim
 522                     ; 39 	Init_Port();	
 525  0005 cd0164        	call	_Init_Port
 527                     ; 93 BRTS_0;Set_Usart(1);
 529  0008 72195005      	bres	20485,#4
 532  000c a601          	ld	a,#1
 533  000e cd023f        	call	_Set_Usart
 535  0011               L503:
 536                     ; 97 	while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET){};
 538  0011 ae0080        	ldw	x,#128
 539  0014 cd0000        	call	_USART_GetFlagStatus
 541  0017 4d            	tnz	a
 542  0018 27f7          	jreq	L503
 543                     ; 98 				USART_SendData8('a');
 546  001a a661          	ld	a,#97
 547  001c cd0000        	call	_USART_SendData8
 549                     ; 101 		Delay(1);
 551  001f ae0001        	ldw	x,#1
 552  0022 cd0125        	call	_Delay
 554                     ; 102 		if(m_Press==02)		//long Press
 556  0025 b6bb          	ld	a,_m_Press
 557  0027 a102          	cp	a,#2
 558  0029 2614          	jrne	L113
 559                     ; 104 			m_tLLasting=1;
 561  002b ae0001        	ldw	x,#1
 562  002e bfc9          	ldw	_m_tLLasting,x
 563                     ; 105 			m_tSLasting=0;
 565  0030 5f            	clrw	x
 566  0031 bfc7          	ldw	_m_tSLasting,x
 567                     ; 106 			m_tWarnGap=m_Param.tWarnGap;
 569  0033 bed1          	ldw	x,_m_Param+6
 570  0035 bfc3          	ldw	_m_tWarnGap,x
 571                     ; 107 			m_WarnSeq++;
 573  0037 3cbd          	inc	_m_WarnSeq
 574                     ; 109 			m_Press=0;
 576  0039 3fbb          	clr	_m_Press
 577                     ; 110 			m_bWakeExti=0;
 579  003b 3fb6          	clr	_m_bWakeExti
 581  003d 2013          	jra	L313
 582  003f               L113:
 583                     ; 112 		else if(m_Press==01)	//short press
 585  003f b6bb          	ld	a,_m_Press
 586  0041 a101          	cp	a,#1
 587  0043 260d          	jrne	L313
 588                     ; 114 			m_tSLasting=1;
 590  0045 ae0001        	ldw	x,#1
 591  0048 bfc7          	ldw	_m_tSLasting,x
 592                     ; 115 			m_tDataGap=m_Param.tDataGap;
 594  004a becf          	ldw	x,_m_Param+4
 595  004c bfc5          	ldw	_m_tDataGap,x
 596                     ; 117 			m_Press=0;
 598  004e 3fbb          	clr	_m_Press
 599                     ; 118 			m_bWakeExti=0;
 601  0050 3fb6          	clr	_m_bWakeExti
 602  0052               L313:
 603                     ; 121 		if(m_tLLasting)	//in warning
 605  0052 bec9          	ldw	x,_m_tLLasting
 606  0054 2724          	jreq	L713
 607                     ; 123 			if(m_tLLasting>=m_Param.tLLasting)
 609  0056 bec9          	ldw	x,_m_tLLasting
 610  0058 b3cb          	cpw	x,_m_Param
 611  005a 2505          	jrult	L123
 612                     ; 124 				m_tLLasting=0;
 614  005c 5f            	clrw	x
 615  005d bfc9          	ldw	_m_tLLasting,x
 617  005f 203d          	jra	L723
 618  0061               L123:
 619                     ; 125 			else if(m_tWarnGap>=m_Param.tWarnGap)
 621  0061 bec3          	ldw	x,_m_tWarnGap
 622  0063 b3d1          	cpw	x,_m_Param+6
 623  0065 2537          	jrult	L723
 624                     ; 127 				m_tWarnGap=1;
 626  0067 ae0001        	ldw	x,#1
 627  006a bfc3          	ldw	_m_tWarnGap,x
 628                     ; 128 				m_tLedLasting=m_Param.tLLedLasting;
 630  006c 45d8bc        	mov	_m_tLedLasting,_m_Param+13
 631                     ; 129 				MakeSendPack(MSG_WARN, m_WarnSeq);
 633  006f b6bd          	ld	a,_m_WarnSeq
 634  0071 97            	ld	xl,a
 635  0072 a620          	ld	a,#32
 636  0074 95            	ld	xh,a
 637  0075 cd030e        	call	_MakeSendPack
 639  0078 2024          	jra	L723
 640  007a               L713:
 641                     ; 132 		else if(m_tSLasting)	//in data selecting
 643  007a bec7          	ldw	x,_m_tSLasting
 644  007c 2720          	jreq	L723
 645                     ; 134 			if(m_tSLasting>=m_Param.tSLasting)
 647  007e bec7          	ldw	x,_m_tSLasting
 648  0080 b3cd          	cpw	x,_m_Param+2
 649  0082 2505          	jrult	L333
 650                     ; 135 				m_tSLasting=0;
 652  0084 5f            	clrw	x
 653  0085 bfc7          	ldw	_m_tSLasting,x
 655  0087 2015          	jra	L723
 656  0089               L333:
 657                     ; 136 			else if(m_tDataGap>=m_Param.tDataGap)
 659  0089 bec5          	ldw	x,_m_tDataGap
 660  008b b3cf          	cpw	x,_m_Param+4
 661  008d 250f          	jrult	L723
 662                     ; 138 				m_tDataGap=1;
 664  008f ae0001        	ldw	x,#1
 665  0092 bfc5          	ldw	_m_tDataGap,x
 666                     ; 139 				m_tLedLasting=m_Param.tSLedLasting;
 668  0094 45d9bc        	mov	_m_tLedLasting,_m_Param+14
 669                     ; 140 				MakeSendPack(MSG_DATA, 0);
 671  0097 5f            	clrw	x
 672  0098 a610          	ld	a,#16
 673  009a 95            	ld	xh,a
 674  009b cd030e        	call	_MakeSendPack
 676  009e               L723:
 677                     ; 144 		if(m_tMvLasting>=m_Param.tMvLasting)
 679  009e bec0          	ldw	x,_m_tMvLasting
 680  00a0 b3d6          	cpw	x,_m_Param+11
 681  00a2 2525          	jrult	L143
 682                     ; 146 			m_tMvLasting=0;
 684  00a4 5f            	clrw	x
 685  00a5 bfc0          	ldw	_m_tMvLasting,x
 686                     ; 148 			m_nMvSendNum++;
 688  00a7 bebe          	ldw	x,_m_nMvSendNum
 689  00a9 1c0001        	addw	x,#1
 690  00ac bfbe          	ldw	_m_nMvSendNum,x
 691                     ; 149 			if(!m_tLLasting && !m_tSLasting)
 693  00ae bec9          	ldw	x,_m_tLLasting
 694  00b0 2609          	jrne	L343
 696  00b2 bec7          	ldw	x,_m_tSLasting
 697  00b4 2605          	jrne	L343
 698                     ; 150 				m_Idle=500;			//---sleep immediately
 700  00b6 ae01f4        	ldw	x,#500
 701  00b9 bfb9          	ldw	_m_Idle,x
 702  00bb               L343:
 703                     ; 151 			if(m_nMvSendNum>=m_Param.nMvSendNum)
 705  00bb bebe          	ldw	x,_m_nMvSendNum
 706  00bd b3d4          	cpw	x,_m_Param+9
 707  00bf 2508          	jrult	L143
 708                     ; 153 				m_nMvSendNum=0;
 710  00c1 5f            	clrw	x
 711  00c2 bfbe          	ldw	_m_nMvSendNum,x
 712                     ; 155 				m_Idle=200;			//---delay 300 ms for waiting end bt sending
 714  00c4 ae00c8        	ldw	x,#200
 715  00c7 bfb9          	ldw	_m_Idle,x
 716  00c9               L143:
 717                     ; 160 		u8=RecvData(500);//=0 no data
 719  00c9 ae01f4        	ldw	x,#500
 720  00cc cd0371        	call	_RecvData
 722  00cf 6b01          	ld	(OFST+0,sp),a
 723                     ; 161 		if(u8>0)
 725  00d1 0d01          	tnz	(OFST+0,sp)
 726  00d3 270b          	jreq	L743
 727                     ; 163 			if(u8==255)//error
 729  00d5 7b01          	ld	a,(OFST+0,sp)
 730  00d7 a1ff          	cp	a,#255
 731  00d9 2603          	jrne	L353
 732                     ; 164 				Clear_Usart_Rx();	
 734  00db cd02dd        	call	_Clear_Usart_Rx
 737  00de               L353:
 738                     ; 171 			bRx=0;	//restart recv
 740  00de 3f35          	clr	_bRx
 741  00e0               L743:
 742                     ; 174 		if(!m_tLLasting && !m_tSLasting)
 744  00e0 bec9          	ldw	x,_m_tLLasting
 745  00e2 2703          	jreq	L6
 746  00e4 cc0011        	jp	L503
 747  00e7               L6:
 749  00e7 bec7          	ldw	x,_m_tSLasting
 750  00e9 2703          	jreq	L01
 751  00eb cc0011        	jp	L503
 752  00ee               L01:
 753                     ; 176 			m_Idle++;
 755  00ee beb9          	ldw	x,_m_Idle
 756  00f0 1c0001        	addw	x,#1
 757  00f3 bfb9          	ldw	_m_Idle,x
 758                     ; 177 			if(m_bWakeExti)//如果处于唤醒状态
 760  00f5 3db6          	tnz	_m_bWakeExti
 761  00f7 2707          	jreq	L753
 762                     ; 178 				m_Idle0=4000;		//4s
 764  00f9 ae0fa0        	ldw	x,#4000
 765  00fc bfb7          	ldw	_m_Idle0,x
 767  00fe 2005          	jra	L163
 768  0100               L753:
 769                     ; 180 				m_Idle0=500;
 771  0100 ae01f4        	ldw	x,#500
 772  0103 bfb7          	ldw	_m_Idle0,x
 773  0105               L163:
 774                     ; 182 			if(m_Idle>m_Idle0)
 776  0105 beb9          	ldw	x,_m_Idle
 777  0107 b3b7          	cpw	x,_m_Idle0
 778  0109 2203          	jrugt	L21
 779  010b cc0011        	jp	L503
 780  010e               L21:
 781                     ; 184 				m_Idle=0;
 783  010e 5f            	clrw	x
 784  010f bfb9          	ldw	_m_Idle,x
 785                     ; 185 				EnterAHalt(m_Param.tMvDetectGap);
 787  0111 b6d3          	ld	a,_m_Param+8
 788  0113 cd0424        	call	_EnterAHalt
 790                     ; 186 				JustExitAHalt();
 792  0116 cd0467        	call	_JustExitAHalt
 794                     ; 187 				m_tMvLasting=m_Param.tMvLasting;
 796  0119 bed6          	ldw	x,_m_Param+11
 797  011b bfc0          	ldw	_m_tMvLasting,x
 798                     ; 188 				LED_1;
 800  011d 721c5005      	bset	20485,#6
 801  0121 ac110011      	jpf	L503
 853                     ; 195 void Delay(uint16_t nTimes)  //1ms, f=2MHz
 853                     ; 196 {
 854                     	switch	.text
 855  0125               _Delay:
 857  0125 89            	pushw	x
 858  0126 5204          	subw	sp,#4
 859       00000004      OFST:	set	4
 862                     ; 200 	for(i=0;i<nTimes;i++)
 864  0128 5f            	clrw	x
 865  0129 1f01          	ldw	(OFST-3,sp),x
 867  012b 2017          	jra	L714
 868  012d               L314:
 869                     ; 202 		nBase=648;//debug 154，release 648;
 871  012d ae0288        	ldw	x,#648
 872  0130 1f03          	ldw	(OFST-1,sp),x
 873  0132               L324:
 874                     ; 204 			nBase--;
 876  0132 1e03          	ldw	x,(OFST-1,sp)
 877  0134 1d0001        	subw	x,#1
 878  0137 1f03          	ldw	(OFST-1,sp),x
 879                     ; 203 		while(nBase!=0)
 881  0139 1e03          	ldw	x,(OFST-1,sp)
 882  013b 26f5          	jrne	L324
 883                     ; 200 	for(i=0;i<nTimes;i++)
 885  013d 1e01          	ldw	x,(OFST-3,sp)
 886  013f 1c0001        	addw	x,#1
 887  0142 1f01          	ldw	(OFST-3,sp),x
 888  0144               L714:
 891  0144 1e01          	ldw	x,(OFST-3,sp)
 892  0146 1305          	cpw	x,(OFST+1,sp)
 893  0148 25e3          	jrult	L314
 894                     ; 206 }
 897  014a 5b06          	addw	sp,#6
 898  014c 81            	ret
 932                     ; 209 void Delay_5us(void)	//2M--not precise
 932                     ; 210 {
 933                     	switch	.text
 934  014d               _Delay_5us:
 936  014d 89            	pushw	x
 937       00000002      OFST:	set	2
 940                     ; 213 	nBase=32;	//debug 1, release 4, freq 2M;
 942  014e ae0020        	ldw	x,#32
 943  0151 1f01          	ldw	(OFST-1,sp),x
 944  0153               L744:
 945                     ; 215 		nBase--;
 947  0153 1e01          	ldw	x,(OFST-1,sp)
 948  0155 1d0001        	subw	x,#1
 949  0158 1f01          	ldw	(OFST-1,sp),x
 950                     ; 214 	while(nBase!=0)
 952  015a 1e01          	ldw	x,(OFST-1,sp)
 953  015c 26f5          	jrne	L744
 954                     ; 216 }
 957  015e 85            	popw	x
 958  015f 81            	ret
 982                     ; 218 void ClearDog(void)
 982                     ; 219 {
 983                     	switch	.text
 984  0160               _ClearDog:
 988                     ; 221 	m_intr1=0;
 990  0160 5f            	clrw	x
 991  0161 bf31          	ldw	_m_intr1,x
 992                     ; 223 }
 995  0163 81            	ret
1019                     ; 226 void Init_Port(void)
1019                     ; 227 {
1020                     	switch	.text
1021  0164               _Init_Port:
1025                     ; 228 	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);
1027  0164 4b90          	push	#144
1028  0166 4bff          	push	#255
1029  0168 ae5000        	ldw	x,#20480
1030  016b cd0000        	call	_GPIO_Init
1032  016e 85            	popw	x
1033                     ; 229 	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);    
1035  016f 4b90          	push	#144
1036  0171 4bff          	push	#255
1037  0173 ae5005        	ldw	x,#20485
1038  0176 cd0000        	call	_GPIO_Init
1040  0179 85            	popw	x
1041                     ; 230 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);    
1043  017a 4b90          	push	#144
1044  017c 4bff          	push	#255
1045  017e ae500a        	ldw	x,#20490
1046  0181 cd0000        	call	_GPIO_Init
1048  0184 85            	popw	x
1049                     ; 231 	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);  
1051  0185 4b90          	push	#144
1052  0187 4bff          	push	#255
1053  0189 ae500f        	ldw	x,#20495
1054  018c cd0000        	call	_GPIO_Init
1056  018f 85            	popw	x
1057                     ; 233 	GPIO_Init(GPIOA, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Slow); //BT_RES, reset
1059  0190 4bc0          	push	#192
1060  0192 4b04          	push	#4
1061  0194 ae5000        	ldw	x,#20480
1062  0197 cd0000        	call	_GPIO_Init
1064  019a 85            	popw	x
1065                     ; 234 	GPIO_Init(GPIOB, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Slow); //BRTS, no
1067  019b 4bd0          	push	#208
1068  019d 4b10          	push	#16
1069  019f ae5005        	ldw	x,#20485
1070  01a2 cd0000        	call	_GPIO_Init
1072  01a5 85            	popw	x
1073                     ; 236 	GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_In_PU_IT); //KEY
1075  01a6 4b60          	push	#96
1076  01a8 4b20          	push	#32
1077  01aa ae5005        	ldw	x,#20485
1078  01ad cd0000        	call	_GPIO_Init
1080  01b0 85            	popw	x
1081                     ; 238 	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow); //LED, shut
1083  01b1 4bc0          	push	#192
1084  01b3 4b40          	push	#64
1085  01b5 ae5005        	ldw	x,#20485
1086  01b8 cd0000        	call	_GPIO_Init
1088  01bb 85            	popw	x
1089                     ; 239 }
1092  01bc 81            	ret
1142                     ; 242 void Init_Mem(void)
1142                     ; 243 {
1143                     	switch	.text
1144  01bd               _Init_Mem:
1146  01bd 88            	push	a
1147       00000001      OFST:	set	1
1150                     ; 246 	m_intr1=0;	//based on TIM2, restricting uart tx & rx
1152  01be 5f            	clrw	x
1153  01bf bf31          	ldw	_m_intr1,x
1154                     ; 247 	m_intr2=0;	
1156  01c1 5f            	clrw	x
1157  01c2 bf2f          	ldw	_m_intr2,x
1158                     ; 248 	m_intr3=0;	
1160  01c4 5f            	clrw	x
1161  01c5 bf2d          	ldw	_m_intr3,x
1162                     ; 249 	m_intr4=0;	
1164  01c7 5f            	clrw	x
1165  01c8 bf2b          	ldw	_m_intr4,x
1166                     ; 251 	m_tSLasting=0;				
1168  01ca 5f            	clrw	x
1169  01cb bfc7          	ldw	_m_tSLasting,x
1170                     ; 252 	m_tLLasting=0;				
1172  01cd 5f            	clrw	x
1173  01ce bfc9          	ldw	_m_tLLasting,x
1174                     ; 253 	m_tDataGap=0;					
1176  01d0 5f            	clrw	x
1177  01d1 bfc5          	ldw	_m_tDataGap,x
1178                     ; 254 	m_tWarnGap=0;					
1180  01d3 5f            	clrw	x
1181  01d4 bfc3          	ldw	_m_tWarnGap,x
1182                     ; 255 	m_tMvDetectGap=0;	
1184  01d6 3fc2          	clr	_m_tMvDetectGap
1185                     ; 256 	m_nMvSendNum=0;
1187  01d8 5f            	clrw	x
1188  01d9 bfbe          	ldw	_m_nMvSendNum,x
1189                     ; 258 	m_Press=0;
1191  01db 3fbb          	clr	_m_Press
1192                     ; 259 	m_WarnSeq=255;
1194  01dd 35ff00bd      	mov	_m_WarnSeq,#255
1195                     ; 261 	for(i=0;i<6;i++)
1197  01e1 0f01          	clr	(OFST+0,sp)
1198  01e3               L315:
1199                     ; 262 		m_MAC[i]=0;
1201  01e3 7b01          	ld	a,(OFST+0,sp)
1202  01e5 5f            	clrw	x
1203  01e6 97            	ld	xl,a
1204  01e7 6f21          	clr	(_m_MAC,x)
1205                     ; 261 	for(i=0;i<6;i++)
1207  01e9 0c01          	inc	(OFST+0,sp)
1210  01eb 7b01          	ld	a,(OFST+0,sp)
1211  01ed a106          	cp	a,#6
1212  01ef 25f2          	jrult	L315
1213                     ; 264 	for(i=0;i<12;i++)
1215  01f1 0f01          	clr	(OFST+0,sp)
1216  01f3               L125:
1217                     ; 265 		m_DeviceID[i]=0;
1219  01f3 7b01          	ld	a,(OFST+0,sp)
1220  01f5 5f            	clrw	x
1221  01f6 97            	ld	xl,a
1222  01f7 6f15          	clr	(_m_DeviceID,x)
1223                     ; 264 	for(i=0;i<12;i++)
1225  01f9 0c01          	inc	(OFST+0,sp)
1228  01fb 7b01          	ld	a,(OFST+0,sp)
1229  01fd a10c          	cp	a,#12
1230  01ff 25f2          	jrult	L125
1231                     ; 267 	Clear_Usart_Tx();
1233  0201 cd02ca        	call	_Clear_Usart_Tx
1235                     ; 268 	Clear_Usart_Rx();
1237  0204 cd02dd        	call	_Clear_Usart_Rx
1239                     ; 270 }
1242  0207 84            	pop	a
1243  0208 81            	ret
1282                     ; 273 void CLK_SetTick(uint8_t b)  //TIM2 10ms
1282                     ; 274 {
1283                     	switch	.text
1284  0209               _CLK_SetTick:
1288                     ; 275 	if(b)
1290  0209 4d            	tnz	a
1291  020a 2727          	jreq	L545
1292                     ; 277 		CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);//开启tim2的外部时钟
1294  020c ae0001        	ldw	x,#1
1295  020f a601          	ld	a,#1
1296  0211 95            	ld	xh,a
1297  0212 cd0000        	call	_CLK_PeripheralClockConfig
1299                     ; 278 	  TIM2_TimeBaseInit(TIM2_Prescaler_1, TIM2_CounterMode_Up, 19999);	
1301  0215 ae4e1f        	ldw	x,#19999
1302  0218 89            	pushw	x
1303  0219 5f            	clrw	x
1304  021a 4f            	clr	a
1305  021b 95            	ld	xh,a
1306  021c cd0000        	call	_TIM2_TimeBaseInit
1308  021f 85            	popw	x
1309                     ; 279     TIM2_InternalClockConfig();//开启tim2的内部时钟
1311  0220 cd0000        	call	_TIM2_InternalClockConfig
1313                     ; 280 		TIM2_ITConfig(TIM2_IT_Update, ENABLE);//开启tim2内部中断
1315  0223 ae0001        	ldw	x,#1
1316  0226 a601          	ld	a,#1
1317  0228 95            	ld	xh,a
1318  0229 cd0000        	call	_TIM2_ITConfig
1320                     ; 281 		TIM2_Cmd(ENABLE);//让tim外围设备有效
1322  022c a601          	ld	a,#1
1323  022e cd0000        	call	_TIM2_Cmd
1326  0231 200b          	jra	L745
1327  0233               L545:
1328                     ; 283 		TIM2_Cmd(DISABLE);
1330  0233 4f            	clr	a
1331  0234 cd0000        	call	_TIM2_Cmd
1333                     ; 284     CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
1335  0237 5f            	clrw	x
1336  0238 a601          	ld	a,#1
1337  023a 95            	ld	xh,a
1338  023b cd0000        	call	_CLK_PeripheralClockConfig
1340  023e               L745:
1341                     ; 286 }
1344  023e 81            	ret
1383                     ; 289 void Set_Usart(uint8_t b)
1383                     ; 290 {
1384                     	switch	.text
1385  023f               _Set_Usart:
1389                     ; 291   if(b)
1391  023f 4d            	tnz	a
1392  0240 2739          	jreq	L765
1393                     ; 293 		OPEN_UART_TX;//设置pc3为uart
1395  0242 4bd0          	push	#208
1396  0244 4b08          	push	#8
1397  0246 ae500a        	ldw	x,#20490
1398  0249 cd0000        	call	_GPIO_Init
1400  024c 85            	popw	x
1401                     ; 294 		CLK_PeripheralClockConfig(CLK_Peripheral_USART, ENABLE);//使能外设时钟
1404  024d ae0001        	ldw	x,#1
1405  0250 a620          	ld	a,#32
1406  0252 95            	ld	xh,a
1407  0253 cd0000        	call	_CLK_PeripheralClockConfig
1409                     ; 295 		USART_Init((uint32_t)9600, USART_WordLength_8D, USART_StopBits_1,
1409                     ; 296                 USART_Parity_No, USART_Mode_Rx | USART_Mode_Tx);//115200 past
1411  0256 4b0c          	push	#12
1412  0258 4b00          	push	#0
1413  025a 4b00          	push	#0
1414  025c 4b00          	push	#0
1415  025e ae2580        	ldw	x,#9600
1416  0261 89            	pushw	x
1417  0262 ae0000        	ldw	x,#0
1418  0265 89            	pushw	x
1419  0266 cd0000        	call	_USART_Init
1421  0269 5b08          	addw	sp,#8
1422                     ; 298     USART_ITConfig(USART_IT_RXNE, ENABLE);//使能接收中断
1424  026b 4b01          	push	#1
1425  026d ae0255        	ldw	x,#597
1426  0270 cd0000        	call	_USART_ITConfig
1428  0273 84            	pop	a
1429                     ; 300     USART_Cmd(ENABLE);
1431  0274 a601          	ld	a,#1
1432  0276 cd0000        	call	_USART_Cmd
1435  0279 2028          	jra	L175
1436  027b               L765:
1437                     ; 302     USART_ITConfig(USART_IT_RXNE, DISABLE);
1439  027b 4b00          	push	#0
1440  027d ae0255        	ldw	x,#597
1441  0280 cd0000        	call	_USART_ITConfig
1443  0283 84            	pop	a
1444                     ; 303     USART_ITConfig(USART_IT_TXE, DISABLE);
1446  0284 4b00          	push	#0
1447  0286 ae0277        	ldw	x,#631
1448  0289 cd0000        	call	_USART_ITConfig
1450  028c 84            	pop	a
1451                     ; 304     USART_Cmd(DISABLE);
1453  028d 4f            	clr	a
1454  028e cd0000        	call	_USART_Cmd
1456                     ; 305 		CLK_PeripheralClockConfig(CLK_Peripheral_USART, DISABLE);
1458  0291 5f            	clrw	x
1459  0292 a620          	ld	a,#32
1460  0294 95            	ld	xh,a
1461  0295 cd0000        	call	_CLK_PeripheralClockConfig
1463                     ; 306 		CLOSE_UART_TX;
1465  0298 4b90          	push	#144
1466  029a 4b08          	push	#8
1467  029c ae500a        	ldw	x,#20490
1468  029f cd0000        	call	_GPIO_Init
1470  02a2 85            	popw	x
1471  02a3               L175:
1472                     ; 308 }
1475  02a3 81            	ret
1521                     ; 311 void Usart_Send(uint8_t Len)
1521                     ; 312 {
1522                     	switch	.text
1523  02a4               _Usart_Send:
1525  02a4 88            	push	a
1526  02a5 88            	push	a
1527       00000001      OFST:	set	1
1530                     ; 316 	if(Len <= MAX_TX_LEN)
1532  02a6 a141          	cp	a,#65
1533  02a8 241e          	jruge	L516
1534                     ; 318 		for(i=0;i<Len;i++)
1536  02aa 0f01          	clr	(OFST+0,sp)
1538  02ac 2014          	jra	L326
1539  02ae               L136:
1540                     ; 321 			while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET){};
1542  02ae ae0080        	ldw	x,#128
1543  02b1 cd0000        	call	_USART_GetFlagStatus
1545  02b4 4d            	tnz	a
1546  02b5 27f7          	jreq	L136
1547                     ; 322 			USART_SendData8(Usart_TxBuff[i]);
1550  02b7 7b01          	ld	a,(OFST+0,sp)
1551  02b9 5f            	clrw	x
1552  02ba 97            	ld	xl,a
1553  02bb e676          	ld	a,(_Usart_TxBuff,x)
1554  02bd cd0000        	call	_USART_SendData8
1556                     ; 318 		for(i=0;i<Len;i++)
1558  02c0 0c01          	inc	(OFST+0,sp)
1559  02c2               L326:
1562  02c2 7b01          	ld	a,(OFST+0,sp)
1563  02c4 1102          	cp	a,(OFST+1,sp)
1564  02c6 25e6          	jrult	L136
1565  02c8               L516:
1566                     ; 325 }
1569  02c8 85            	popw	x
1570  02c9 81            	ret
1605                     ; 328 void Clear_Usart_Tx(void)
1605                     ; 329 {
1606                     	switch	.text
1607  02ca               _Clear_Usart_Tx:
1609  02ca 88            	push	a
1610       00000001      OFST:	set	1
1613                     ; 332 	for(i=0;i<MAX_TX_LEN;i++)
1615  02cb 0f01          	clr	(OFST+0,sp)
1616  02cd               L356:
1617                     ; 333 		Usart_TxBuff[i]=0;
1619  02cd 7b01          	ld	a,(OFST+0,sp)
1620  02cf 5f            	clrw	x
1621  02d0 97            	ld	xl,a
1622  02d1 6f76          	clr	(_Usart_TxBuff,x)
1623                     ; 332 	for(i=0;i<MAX_TX_LEN;i++)
1625  02d3 0c01          	inc	(OFST+0,sp)
1628  02d5 7b01          	ld	a,(OFST+0,sp)
1629  02d7 a140          	cp	a,#64
1630  02d9 25f2          	jrult	L356
1631                     ; 334 }
1634  02db 84            	pop	a
1635  02dc 81            	ret
1673                     ; 337 void Clear_Usart_Rx(void)
1673                     ; 338 {
1674                     	switch	.text
1675  02dd               _Clear_Usart_Rx:
1677  02dd 88            	push	a
1678       00000001      OFST:	set	1
1681                     ; 341 	for(i=0;i<MAX_RX_LEN;i++)
1683  02de 0f01          	clr	(OFST+0,sp)
1684  02e0               L776:
1685                     ; 342 		Usart_RxBuff[i]=0;
1687  02e0 7b01          	ld	a,(OFST+0,sp)
1688  02e2 5f            	clrw	x
1689  02e3 97            	ld	xl,a
1690  02e4 6f36          	clr	(_Usart_RxBuff,x)
1691                     ; 341 	for(i=0;i<MAX_RX_LEN;i++)
1693  02e6 0c01          	inc	(OFST+0,sp)
1696  02e8 7b01          	ld	a,(OFST+0,sp)
1697  02ea a140          	cp	a,#64
1698  02ec 25f2          	jrult	L776
1699                     ; 344 	bRx=1;
1701  02ee 35010035      	mov	_bRx,#1
1702                     ; 345 	iRxIndex=0;
1704  02f2 3f34          	clr	_iRxIndex
1705                     ; 346 	bRxFirst=0;
1707  02f4 3f33          	clr	_bRxFirst
1708                     ; 347 }
1711  02f6 84            	pop	a
1712  02f7 81            	ret
1740                     ; 350 void IWDG_Config(void)
1740                     ; 351 {
1741                     	switch	.text
1742  02f8               _IWDG_Config:
1746                     ; 352   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
1748  02f8 a655          	ld	a,#85
1749  02fa cd0000        	call	_IWDG_WriteAccessCmd
1751                     ; 353   IWDG_SetPrescaler(IWDG_Prescaler_256);	//4ms
1753  02fd a606          	ld	a,#6
1754  02ff cd0000        	call	_IWDG_SetPrescaler
1756                     ; 354   IWDG_SetReload((uint8_t)(100));	//400ms
1758  0302 a664          	ld	a,#100
1759  0304 cd0000        	call	_IWDG_SetReload
1761                     ; 355   IWDG_ReloadCounter();
1763  0307 cd0000        	call	_IWDG_ReloadCounter
1765                     ; 356   IWDG_Enable();
1767  030a cd0000        	call	_IWDG_Enable
1769                     ; 357 }
1772  030d 81            	ret
1839                     ; 360 void MakeSendPack(uint8_t cmd, uint8_t nNo)
1839                     ; 361 {
1840                     	switch	.text
1841  030e               _MakeSendPack:
1843  030e 89            	pushw	x
1844  030f 5203          	subw	sp,#3
1845       00000003      OFST:	set	3
1848                     ; 365 	OPEN_UART_TX;
1850  0311 4bd0          	push	#208
1851  0313 4b08          	push	#8
1852  0315 ae500a        	ldw	x,#20490
1853  0318 cd0000        	call	_GPIO_Init
1855  031b 85            	popw	x
1856                     ; 366 	BRTS_0;//打开蓝牙
1859  031c 72195005      	bres	20485,#4
1860                     ; 367 	Delay(1);
1862  0320 ae0001        	ldw	x,#1
1863  0323 cd0125        	call	_Delay
1865                     ; 369 	Usart_TxBuff[0]=0xEB;
1867  0326 35eb0076      	mov	_Usart_TxBuff,#235
1868                     ; 370 	Usart_TxBuff[1]=0x90;
1870  032a 35900077      	mov	_Usart_TxBuff+1,#144
1871                     ; 371 	Usart_TxBuff[2]=0xEB;
1873  032e 35eb0078      	mov	_Usart_TxBuff+2,#235
1874                     ; 372 	Usart_TxBuff[3]=0x90;
1876  0332 35900079      	mov	_Usart_TxBuff+3,#144
1877                     ; 374 	for(i=0;i<6;i++)
1879  0336 0f03          	clr	(OFST+0,sp)
1880  0338               L747:
1881                     ; 375 		Usart_TxBuff[i+4]=m_MAC[i];
1883  0338 7b03          	ld	a,(OFST+0,sp)
1884  033a 5f            	clrw	x
1885  033b 97            	ld	xl,a
1886  033c e621          	ld	a,(_m_MAC,x)
1887  033e e77a          	ld	(_Usart_TxBuff+4,x),a
1888                     ; 374 	for(i=0;i<6;i++)
1890  0340 0c03          	inc	(OFST+0,sp)
1893  0342 7b03          	ld	a,(OFST+0,sp)
1894  0344 a106          	cp	a,#6
1895  0346 25f0          	jrult	L747
1896                     ; 377 	Usart_TxBuff[10]=cmd | 0x80;
1898  0348 7b04          	ld	a,(OFST+1,sp)
1899  034a aa80          	or	a,#128
1900  034c b780          	ld	_Usart_TxBuff+10,a
1901                     ; 378 	Usart_TxBuff[11]=nNo;
1903  034e 7b05          	ld	a,(OFST+2,sp)
1904  0350 b781          	ld	_Usart_TxBuff+11,a
1905                     ; 383 	u16=GetCheckSumXor(Usart_TxBuff,MAX_TX_LEN);
1907  0352 4b40          	push	#64
1908  0354 ae0076        	ldw	x,#_Usart_TxBuff
1909  0357 ad5b          	call	_GetCheckSumXor
1911  0359 5b01          	addw	sp,#1
1912  035b 5f            	clrw	x
1913  035c 97            	ld	xl,a
1914  035d 1f01          	ldw	(OFST-2,sp),x
1915                     ; 384 	Usart_TxBuff[MAX_TX_LEN-2]=(uint8_t)(u16 & 0xff);
1917  035f 7b02          	ld	a,(OFST-1,sp)
1918  0361 a4ff          	and	a,#255
1919  0363 b7b4          	ld	_Usart_TxBuff+62,a
1920                     ; 385 	Usart_TxBuff[MAX_TX_LEN-1]=(uint8_t)((u16 >> 8) & 0xff);
1922  0365 7b01          	ld	a,(OFST-2,sp)
1923  0367 b7b5          	ld	_Usart_TxBuff+63,a
1924                     ; 387 	Usart_Send(MAX_TX_LEN);	
1926  0369 a640          	ld	a,#64
1927  036b cd02a4        	call	_Usart_Send
1929                     ; 388 }
1932  036e 5b05          	addw	sp,#5
1933  0370 81            	ret
1936                     	bsct
1937  0002               L557_u16:
1938  0002 0000          	dc.w	0
2002                     ; 391 uint8_t RecvData(uint16_t uWait)	//ret: 0--no data, 255--err data, other--valid data
2002                     ; 392 {
2003                     	switch	.text
2004  0371               _RecvData:
2006  0371 89            	pushw	x
2007  0372 89            	pushw	x
2008       00000002      OFST:	set	2
2011                     ; 393 	uint8_t b=0;
2013  0373 0f02          	clr	(OFST+0,sp)
2014                     ; 394 	uint8_t Cmd=0;
2016                     ; 397 	if(!bRxFirst)
2018  0375 3d33          	tnz	_bRxFirst
2019  0377 2605          	jrne	L1101
2020                     ; 398 		u16=0;
2022  0379 5f            	clrw	x
2023  037a bf02          	ldw	L557_u16,x
2025  037c 2027          	jra	L3101
2026  037e               L1101:
2027                     ; 401 		u16++;
2029  037e be02          	ldw	x,L557_u16
2030  0380 1c0001        	addw	x,#1
2031  0383 bf02          	ldw	L557_u16,x
2032                     ; 402 		if(u16>uWait)
2034  0385 be02          	ldw	x,L557_u16
2035  0387 1303          	cpw	x,(OFST+1,sp)
2036  0389 2304          	jrule	L5101
2037                     ; 403 			return 255;
2039  038b a6ff          	ld	a,#255
2041  038d 2022          	jra	L64
2042  038f               L5101:
2043                     ; 406 			if(iRxIndex>=MAX_RX_LEN)
2045  038f b634          	ld	a,_iRxIndex
2046  0391 a140          	cp	a,#64
2047  0393 2510          	jrult	L3101
2048                     ; 408 				b=1;
2050  0395 a601          	ld	a,#1
2051  0397 6b02          	ld	(OFST+0,sp),a
2052                     ; 409 				if(CheckSumXor(Usart_RxBuff,MAX_RX_LEN))
2054  0399 4b40          	push	#64
2055  039b ae0036        	ldw	x,#_Usart_RxBuff
2056  039e ad50          	call	_CheckSumXor
2058  03a0 5b01          	addw	sp,#1
2059  03a2 4d            	tnz	a
2060  03a3 2700          	jreq	L3201
2061                     ; 410 					Cmd=Usart_RxBuff[10];
2064  03a5               L3201:
2065                     ; 412 					Cmd=255;
2067  03a5               L3101:
2068                     ; 417 	if(b)
2070  03a5 0d02          	tnz	(OFST+0,sp)
2071  03a7 2706          	jreq	L7201
2072                     ; 419 		bRx=1;
2074  03a9 35010035      	mov	_bRx,#1
2075                     ; 420 		bRxFirst=0;
2077  03ad 3f33          	clr	_bRxFirst
2078  03af               L7201:
2079                     ; 423 	return b;
2081  03af 7b02          	ld	a,(OFST+0,sp)
2083  03b1               L64:
2085  03b1 5b04          	addw	sp,#4
2086  03b3 81            	ret
2158                     ; 446 uint8_t GetCheckSumXor(uint8_t* pu8, uint8_t Len)
2158                     ; 447 {
2159                     	switch	.text
2160  03b4               _GetCheckSumXor:
2162  03b4 89            	pushw	x
2163  03b5 5204          	subw	sp,#4
2164       00000004      OFST:	set	4
2167                     ; 448 	uint8_t u8=0;
2169  03b7 0f01          	clr	(OFST-3,sp)
2170                     ; 452 	pu=pu8;
2172  03b9 1f03          	ldw	(OFST-1,sp),x
2173                     ; 453 	if(Len<2)
2175  03bb 7b09          	ld	a,(OFST+5,sp)
2176  03bd a102          	cp	a,#2
2177  03bf 2403          	jruge	L7601
2178                     ; 454 		return 0;
2180  03c1 4f            	clr	a
2182  03c2 2029          	jra	L25
2183  03c4               L7601:
2184                     ; 456 	for(i=0;i<Len-1;i++)
2186  03c4 0f02          	clr	(OFST-2,sp)
2188  03c6 2010          	jra	L5701
2189  03c8               L1701:
2190                     ; 458 		u8 ^=*pu;
2192  03c8 1e03          	ldw	x,(OFST-1,sp)
2193  03ca 7b01          	ld	a,(OFST-3,sp)
2194  03cc f8            	xor	a,	(x)
2195  03cd 6b01          	ld	(OFST-3,sp),a
2196                     ; 459 		pu++;
2198  03cf 1e03          	ldw	x,(OFST-1,sp)
2199  03d1 1c0001        	addw	x,#1
2200  03d4 1f03          	ldw	(OFST-1,sp),x
2201                     ; 456 	for(i=0;i<Len-1;i++)
2203  03d6 0c02          	inc	(OFST-2,sp)
2204  03d8               L5701:
2207  03d8 9c            	rvf
2208  03d9 7b09          	ld	a,(OFST+5,sp)
2209  03db 5f            	clrw	x
2210  03dc 97            	ld	xl,a
2211  03dd 5a            	decw	x
2212  03de 7b02          	ld	a,(OFST-2,sp)
2213  03e0 905f          	clrw	y
2214  03e2 9097          	ld	yl,a
2215  03e4 90bf00        	ldw	c_y,y
2216  03e7 b300          	cpw	x,c_y
2217  03e9 2cdd          	jrsgt	L1701
2218                     ; 462 	return u8;
2220  03eb 7b01          	ld	a,(OFST-3,sp)
2222  03ed               L25:
2224  03ed 5b06          	addw	sp,#6
2225  03ef 81            	ret
2329                     ; 466 bool CheckSumXor(uint8_t* pu8,uint8_t Len)
2329                     ; 467 {
2330                     	switch	.text
2331  03f0               _CheckSumXor:
2333  03f0 89            	pushw	x
2334  03f1 5205          	subw	sp,#5
2335       00000005      OFST:	set	5
2338                     ; 468 	bool b=FALSE;
2340  03f3 0f01          	clr	(OFST-4,sp)
2341                     ; 469 	uint8_t u1=0;
2343                     ; 470 	uint8_t u2=0;
2345                     ; 473 	pDat=pu8;
2347  03f5 1f04          	ldw	(OFST-1,sp),x
2348                     ; 474 	u1=GetCheckSumXor(pDat,Len);
2350  03f7 7b0a          	ld	a,(OFST+5,sp)
2351  03f9 88            	push	a
2352  03fa 1e05          	ldw	x,(OFST+0,sp)
2353  03fc adb6          	call	_GetCheckSumXor
2355  03fe 5b01          	addw	sp,#1
2356  0400 6b02          	ld	(OFST-3,sp),a
2357                     ; 476 	pDat=pu8;
2359  0402 1e06          	ldw	x,(OFST+1,sp)
2360  0404 1f04          	ldw	(OFST-1,sp),x
2361                     ; 477 	u2=(*(pDat+Len-1));
2363  0406 7b04          	ld	a,(OFST-1,sp)
2364  0408 97            	ld	xl,a
2365  0409 7b05          	ld	a,(OFST+0,sp)
2366  040b 1b0a          	add	a,(OFST+5,sp)
2367  040d 2401          	jrnc	L65
2368  040f 5c            	incw	x
2369  0410               L65:
2370  0410 02            	rlwa	x,a
2371  0411 5a            	decw	x
2372  0412 f6            	ld	a,(x)
2373  0413 6b03          	ld	(OFST-2,sp),a
2374                     ; 479 	if(u1==u2)
2376  0415 7b02          	ld	a,(OFST-3,sp)
2377  0417 1103          	cp	a,(OFST-2,sp)
2378  0419 2604          	jrne	L3511
2379                     ; 480 		b=TRUE;
2381  041b a601          	ld	a,#1
2382  041d 6b01          	ld	(OFST-4,sp),a
2383  041f               L3511:
2384                     ; 482 	return b;
2386  041f 7b01          	ld	a,(OFST-4,sp)
2389  0421 5b07          	addw	sp,#7
2390  0423 81            	ret
2432                     ; 485 void EnterAHalt(uint8_t time)
2432                     ; 486 {
2433                     	switch	.text
2434  0424               _EnterAHalt:
2436  0424 88            	push	a
2437       00000000      OFST:	set	0
2440                     ; 487 	CLK_SetTick(0);	
2442  0425 4f            	clr	a
2443  0426 cd0209        	call	_CLK_SetTick
2445                     ; 488 	Set_Usart(0);
2447  0429 4f            	clr	a
2448  042a cd023f        	call	_Set_Usart
2450                     ; 491 	BT_RES_0;
2452  042d 72155000      	bres	20480,#2
2453                     ; 492 	BRTS_1;//sleep
2455  0431 72185005      	bset	20485,#4
2456                     ; 493 	LED_0;
2458  0435 721d5005      	bres	20485,#6
2459                     ; 494 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_OD_HiZ_Slow);    
2461  0439 4b90          	push	#144
2462  043b 4bff          	push	#255
2463  043d ae500a        	ldw	x,#20490
2464  0440 cd0000        	call	_GPIO_Init
2466  0443 85            	popw	x
2467                     ; 497   AWU_DeInit();
2469  0444 cd0000        	call	_AWU_DeInit
2471                     ; 498 	CLK_PeripheralClockConfig(CLK_Peripheral_AWU, ENABLE);
2473  0447 ae0001        	ldw	x,#1
2474  044a a640          	ld	a,#64
2475  044c 95            	ld	xh,a
2476  044d cd0000        	call	_CLK_PeripheralClockConfig
2478                     ; 499 	if(time>16)
2480  0450 7b01          	ld	a,(OFST+1,sp)
2481  0452 a111          	cp	a,#17
2482  0454 2504          	jrult	L3711
2483                     ; 500 		time=16;
2485  0456 a610          	ld	a,#16
2486  0458 6b01          	ld	(OFST+1,sp),a
2487  045a               L3711:
2488                     ; 501 	AWU_Init(time);
2490  045a 7b01          	ld	a,(OFST+1,sp)
2491  045c cd0000        	call	_AWU_Init
2493                     ; 502 	AWU_Cmd(ENABLE);
2495  045f a601          	ld	a,#1
2496  0461 cd0000        	call	_AWU_Cmd
2498                     ; 503   halt();
2501  0464 8e            halt
2503                     ; 504 }
2507  0465 84            	pop	a
2508  0466 81            	ret
2545                     ; 506 void JustExitAHalt(void)
2545                     ; 507 {
2546                     	switch	.text
2547  0467               _JustExitAHalt:
2551                     ; 508 	CLK_DeInit();       //2M, all peripherals enable
2553  0467 cd0000        	call	_CLK_DeInit
2555                     ; 509 	disableInterrupts();
2558  046a 9b            sim
2560                     ; 511 	Init_Port();	
2563  046b cd0164        	call	_Init_Port
2565                     ; 513 	EXTI_DeInit();//初始化外部中断
2567  046e cd0000        	call	_EXTI_DeInit
2569                     ; 515 	EXTI_SetPinSensitivity(EXTI_Pin_5, EXTI_Trigger_Falling);
2571  0471 ae0002        	ldw	x,#2
2572  0474 a612          	ld	a,#18
2573  0476 95            	ld	xh,a
2574  0477 cd0000        	call	_EXTI_SetPinSensitivity
2576                     ; 517 	TIM2_DeInit();
2578  047a cd0000        	call	_TIM2_DeInit
2580                     ; 518 	CLK_SetTick(1);	//TIM2 for ticktime
2582  047d a601          	ld	a,#1
2583  047f cd0209        	call	_CLK_SetTick
2585                     ; 519 	USART_DeInit();
2587  0482 cd0000        	call	_USART_DeInit
2589                     ; 521 	Set_Usart(1);
2591  0485 a601          	ld	a,#1
2592  0487 cd023f        	call	_Set_Usart
2594                     ; 522 	Clear_Usart_Tx();
2596  048a cd02ca        	call	_Clear_Usart_Tx
2598                     ; 523 	Clear_Usart_Rx();	
2600  048d cd02dd        	call	_Clear_Usart_Rx
2602                     ; 524 	bRx=0;
2604  0490 3f35          	clr	_bRx
2605                     ; 525 	m_Press=0;
2607  0492 3fbb          	clr	_m_Press
2608                     ; 526 	enableInterrupts();
2611  0494 9a            rim
2613                     ; 527 }
2617  0495 81            	ret
2620                     	bsct
2621  0004               L5021_Key:
2622  0004 00            	dc.b	0
2623  0005               L7021_OldKey:
2624  0005 00            	dc.b	0
2625  0006               L1121_KeyLasting:
2626  0006 00            	dc.b	0
2685                     ; 531 @far @interrupt void TIM2_Handle_ISR(void)
2685                     ; 532 {
2687                     	switch	.text
2688  0496               f_TIM2_Handle_ISR:
2690  0496 3b0002        	push	c_x+2
2691  0499 be00          	ldw	x,c_x
2692  049b 89            	pushw	x
2693  049c 3b0002        	push	c_y+2
2694  049f be00          	ldw	x,c_y
2695  04a1 89            	pushw	x
2698                     ; 538 	TIM2_ClearITPendingBit(TIM2_IT_Update);
2700  04a2 a601          	ld	a,#1
2701  04a4 cd0000        	call	_TIM2_ClearITPendingBit
2703                     ; 540 	if(m_tLLasting>0)
2705  04a7 bec9          	ldw	x,_m_tLLasting
2706  04a9 2707          	jreq	L1421
2707                     ; 541 		m_tLLasting++;
2709  04ab bec9          	ldw	x,_m_tLLasting
2710  04ad 1c0001        	addw	x,#1
2711  04b0 bfc9          	ldw	_m_tLLasting,x
2712  04b2               L1421:
2713                     ; 542 	if(m_tSLasting>0)
2715  04b2 bec7          	ldw	x,_m_tSLasting
2716  04b4 2707          	jreq	L3421
2717                     ; 543 		m_tSLasting++;
2719  04b6 bec7          	ldw	x,_m_tSLasting
2720  04b8 1c0001        	addw	x,#1
2721  04bb bfc7          	ldw	_m_tSLasting,x
2722  04bd               L3421:
2723                     ; 545 	if(m_tWarnGap>0)
2725  04bd bec3          	ldw	x,_m_tWarnGap
2726  04bf 2707          	jreq	L5421
2727                     ; 546 		m_tWarnGap++;
2729  04c1 bec3          	ldw	x,_m_tWarnGap
2730  04c3 1c0001        	addw	x,#1
2731  04c6 bfc3          	ldw	_m_tWarnGap,x
2732  04c8               L5421:
2733                     ; 547 	if(m_tDataGap>0)
2735  04c8 bec5          	ldw	x,_m_tDataGap
2736  04ca 2707          	jreq	L7421
2737                     ; 548 		m_tDataGap++;
2739  04cc bec5          	ldw	x,_m_tDataGap
2740  04ce 1c0001        	addw	x,#1
2741  04d1 bfc5          	ldw	_m_tDataGap,x
2742  04d3               L7421:
2743                     ; 550 	m_tMvLasting++;	
2745  04d3 bec0          	ldw	x,_m_tMvLasting
2746  04d5 1c0001        	addw	x,#1
2747  04d8 bfc0          	ldw	_m_tMvLasting,x
2748                     ; 552 	if(m_tLedLasting)
2750  04da 3dbc          	tnz	_m_tLedLasting
2751  04dc 2708          	jreq	L1521
2752                     ; 554 		LED_1;
2754  04de 721c5005      	bset	20485,#6
2755                     ; 555 		m_tLedLasting--;
2757  04e2 3abc          	dec	_m_tLedLasting
2759  04e4 2004          	jra	L3521
2760  04e6               L1521:
2761                     ; 558 		LED_0;
2763  04e6 721d5005      	bres	20485,#6
2764  04ea               L3521:
2765                     ; 560 	if(READ_KEY)	//no press
2767  04ea 4b20          	push	#32
2768  04ec ae5005        	ldw	x,#20485
2769  04ef cd0000        	call	_GPIO_ReadInputDataBit
2771  04f2 5b01          	addw	sp,#1
2772  04f4 4d            	tnz	a
2773  04f5 2718          	jreq	L5521
2774                     ; 562 		if(KeyLasting>10 && KeyLasting<=150)
2776  04f7 b606          	ld	a,L1121_KeyLasting
2777  04f9 a10b          	cp	a,#11
2778  04fb 250a          	jrult	L7521
2780  04fd b606          	ld	a,L1121_KeyLasting
2781  04ff a197          	cp	a,#151
2782  0501 2404          	jruge	L7521
2783                     ; 563 			m_Press=01;			//short press
2785  0503 350100bb      	mov	_m_Press,#1
2786  0507               L7521:
2787                     ; 565 		Key=0;
2789  0507 3f04          	clr	L5021_Key
2790                     ; 566 		OldKey=0;
2792  0509 3f05          	clr	L7021_OldKey
2793                     ; 567 		KeyLasting=0;
2795  050b 3f06          	clr	L1121_KeyLasting
2797  050d 2030          	jra	L1621
2798  050f               L5521:
2799                     ; 571 		Key=1;
2801  050f 35010004      	mov	L5021_Key,#1
2802                     ; 572 		if(OldKey==0)	//first press
2804  0513 3d05          	tnz	L7021_OldKey
2805  0515 2606          	jrne	L3621
2806                     ; 573 			KeyLasting=1;
2808  0517 35010006      	mov	L1121_KeyLasting,#1
2810  051b 2022          	jra	L1621
2811  051d               L3621:
2812                     ; 576 			KeyLasting++;
2814  051d 3c06          	inc	L1121_KeyLasting
2815                     ; 577 			if(KeyLasting>150 && KeyLasting<250)
2817  051f b606          	ld	a,L1121_KeyLasting
2818  0521 a197          	cp	a,#151
2819  0523 2510          	jrult	L7621
2821  0525 b606          	ld	a,L1121_KeyLasting
2822  0527 a1fa          	cp	a,#250
2823  0529 240a          	jruge	L7621
2824                     ; 579 				KeyLasting=251;
2826  052b 35fb0006      	mov	L1121_KeyLasting,#251
2827                     ; 580 				m_Press=02;				//long press
2829  052f 350200bb      	mov	_m_Press,#2
2831  0533 200a          	jra	L1621
2832  0535               L7621:
2833                     ; 582 			else if(KeyLasting>250)
2835  0535 b606          	ld	a,L1121_KeyLasting
2836  0537 a1fb          	cp	a,#251
2837  0539 2504          	jrult	L1621
2838                     ; 583 				KeyLasting=251;
2840  053b 35fb0006      	mov	L1121_KeyLasting,#251
2841  053f               L1621:
2842                     ; 586 	OldKey=Key;
2844  053f 450405        	mov	L7021_OldKey,L5021_Key
2845                     ; 587 }
2848  0542 85            	popw	x
2849  0543 bf00          	ldw	c_y,x
2850  0545 320002        	pop	c_y+2
2851  0548 85            	popw	x
2852  0549 bf00          	ldw	c_x,x
2853  054b 320002        	pop	c_x+2
2854  054e 80            	iret
3033                     ; 594 bool I2C_CheckEvent_T(I2C_Event_TypeDef I2C_Event,uint8_t timeout)
3033                     ; 595 {
3035                     	switch	.text
3036  054f               _I2C_CheckEvent_T:
3038  054f 89            	pushw	x
3039  0550 89            	pushw	x
3040       00000002      OFST:	set	2
3043                     ; 596 	bool b=FALSE;
3045  0551 0f01          	clr	(OFST-1,sp)
3046                     ; 599 	for(i=0;i<timeout;i++)
3048  0553 0f02          	clr	(OFST+0,sp)
3050  0555 2016          	jra	L1731
3051  0557               L5631:
3052                     ; 601 		if(I2C_CheckEvent(I2C_Event))
3054  0557 1e03          	ldw	x,(OFST+1,sp)
3055  0559 cd0000        	call	_I2C_CheckEvent
3057  055c 4d            	tnz	a
3058  055d 2709          	jreq	L5731
3059                     ; 603 			b=TRUE;
3061  055f a601          	ld	a,#1
3062  0561 6b01          	ld	(OFST-1,sp),a
3063                     ; 604 			break;
3064  0563               L3731:
3065                     ; 610 	return b;
3067  0563 7b01          	ld	a,(OFST-1,sp)
3070  0565 5b04          	addw	sp,#4
3071  0567 81            	ret
3072  0568               L5731:
3073                     ; 607 			Delay_5us();
3075  0568 cd014d        	call	_Delay_5us
3077                     ; 599 	for(i=0;i<timeout;i++)
3079  056b 0c02          	inc	(OFST+0,sp)
3080  056d               L1731:
3083  056d 7b02          	ld	a,(OFST+0,sp)
3084  056f 1107          	cp	a,(OFST+5,sp)
3085  0571 25e4          	jrult	L5631
3086  0573 20ee          	jra	L3731
3148                     ; 613 bool I2C_SendCmd(uint8_t slvAddr,uint8_t Size)	
3148                     ; 614 {
3149                     	switch	.text
3150  0575               _I2C_SendCmd:
3152  0575 89            	pushw	x
3153  0576 88            	push	a
3154       00000001      OFST:	set	1
3157                     ; 616 	uint8_t iTx=0;
3159  0577 0f01          	clr	(OFST+0,sp)
3161  0579               L3341:
3162                     ; 620 	while (I2C_GetFlagStatus(I2C_FLAG_BUSY));
3164  0579 ae0302        	ldw	x,#770
3165  057c cd0000        	call	_I2C_GetFlagStatus
3167  057f 4d            	tnz	a
3168  0580 26f7          	jrne	L3341
3169                     ; 622 	I2C_GenerateSTART(ENABLE);
3171  0582 a601          	ld	a,#1
3172  0584 cd0000        	call	_I2C_GenerateSTART
3175  0587               L1441:
3176                     ; 624   while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
3178  0587 ae0301        	ldw	x,#769
3179  058a cd0000        	call	_I2C_CheckEvent
3181  058d 4d            	tnz	a
3182  058e 27f7          	jreq	L1441
3183                     ; 627   I2C_Send7bitAddress(slvAddr, I2C_Direction_Transmitter);
3185  0590 5f            	clrw	x
3186  0591 7b02          	ld	a,(OFST+1,sp)
3187  0593 95            	ld	xh,a
3188  0594 cd0000        	call	_I2C_Send7bitAddress
3190                     ; 630   if(!I2C_CheckEvent_T(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED,5))	//200us
3192  0597 4b05          	push	#5
3193  0599 ae0782        	ldw	x,#1922
3194  059c adb1          	call	_I2C_CheckEvent_T
3196  059e 5b01          	addw	sp,#1
3197  05a0 4d            	tnz	a
3198  05a1 261e          	jrne	L1541
3199                     ; 632 		I2C_GenerateSTOP(ENABLE);
3201  05a3 a601          	ld	a,#1
3202  05a5 cd0000        	call	_I2C_GenerateSTOP
3204                     ; 633 		return FALSE;
3206  05a8 4f            	clr	a
3208  05a9 2029          	jra	L27
3209  05ab               L7441:
3210                     ; 640     I2C_SendData(I2c_TxBuff[iTx++]);
3212  05ab 7b01          	ld	a,(OFST+0,sp)
3213  05ad 97            	ld	xl,a
3214  05ae 0c01          	inc	(OFST+0,sp)
3215  05b0 9f            	ld	a,xl
3216  05b1 5f            	clrw	x
3217  05b2 97            	ld	xl,a
3218  05b3 e610          	ld	a,(_I2c_TxBuff,x)
3219  05b5 cd0000        	call	_I2C_SendData
3222  05b8               L7541:
3223                     ; 642     while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
3225  05b8 ae0784        	ldw	x,#1924
3226  05bb cd0000        	call	_I2C_CheckEvent
3228  05be 4d            	tnz	a
3229  05bf 27f7          	jreq	L7541
3230  05c1               L1541:
3231                     ; 638   while (iTx < Size)
3233  05c1 7b01          	ld	a,(OFST+0,sp)
3234  05c3 1103          	cp	a,(OFST+2,sp)
3235  05c5 25e4          	jrult	L7441
3236                     ; 646   I2C_GenerateSTOP(ENABLE);
3238  05c7 a601          	ld	a,#1
3239  05c9 cd0000        	call	_I2C_GenerateSTOP
3241                     ; 647 	Delay_5us();
3243  05cc cd014d        	call	_Delay_5us
3245                     ; 648 	Delay_5us();
3247  05cf cd014d        	call	_Delay_5us
3249                     ; 650 	return TRUE;
3251  05d2 a601          	ld	a,#1
3253  05d4               L27:
3255  05d4 5b03          	addw	sp,#3
3256  05d6 81            	ret
3338                     ; 654 bool I2C_GetData(uint8_t slvAddr, uint8_t *pu8, uint8_t Size)	
3338                     ; 655 {
3339                     	switch	.text
3340  05d7               _I2C_GetData:
3342  05d7 88            	push	a
3343  05d8 5203          	subw	sp,#3
3344       00000003      OFST:	set	3
3347                     ; 656 	uint8_t iRx=0;
3349  05da 0f01          	clr	(OFST-2,sp)
3350                     ; 659 	pData=pu8;
3352  05dc 1e07          	ldw	x,(OFST+4,sp)
3353  05de 1f02          	ldw	(OFST-1,sp),x
3355  05e0               L5251:
3356                     ; 662   while (I2C_GetFlagStatus(I2C_FLAG_BUSY));
3358  05e0 ae0302        	ldw	x,#770
3359  05e3 cd0000        	call	_I2C_GetFlagStatus
3361  05e6 4d            	tnz	a
3362  05e7 26f7          	jrne	L5251
3363                     ; 663 	I2C_GenerateSTART(ENABLE);
3365  05e9 a601          	ld	a,#1
3366  05eb cd0000        	call	_I2C_GenerateSTART
3369  05ee               L3351:
3370                     ; 665   while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
3372  05ee ae0301        	ldw	x,#769
3373  05f1 cd0000        	call	_I2C_CheckEvent
3375  05f4 4d            	tnz	a
3376  05f5 27f7          	jreq	L3351
3377                     ; 667   I2C_Send7bitAddress(slvAddr, I2C_Direction_Transmitter);
3379  05f7 5f            	clrw	x
3380  05f8 7b04          	ld	a,(OFST+1,sp)
3381  05fa 95            	ld	xh,a
3382  05fb cd0000        	call	_I2C_Send7bitAddress
3384                     ; 669   if(!I2C_CheckEvent_T(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED,5))	//200us
3386  05fe 4b05          	push	#5
3387  0600 ae0782        	ldw	x,#1922
3388  0603 cd054f        	call	_I2C_CheckEvent_T
3390  0606 5b01          	addw	sp,#1
3391  0608 4d            	tnz	a
3392  0609 2608          	jrne	L7351
3393                     ; 671 		I2C_GenerateSTOP(ENABLE);
3395  060b a601          	ld	a,#1
3396  060d cd0000        	call	_I2C_GenerateSTOP
3398                     ; 672 		return FALSE;
3400  0610 4f            	clr	a
3402  0611 2037          	jra	L67
3403  0613               L7351:
3404                     ; 675   I2C_SendData(0x00);//发送数据
3406  0613 4f            	clr	a
3407  0614 cd0000        	call	_I2C_SendData
3410  0617               L3451:
3411                     ; 677   while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
3413  0617 ae0784        	ldw	x,#1924
3414  061a cd0000        	call	_I2C_CheckEvent
3416  061d 4d            	tnz	a
3417  061e 27f7          	jreq	L3451
3418                     ; 679 	I2C_GenerateSTART(ENABLE);
3420  0620 a601          	ld	a,#1
3421  0622 cd0000        	call	_I2C_GenerateSTART
3424  0625               L1551:
3425                     ; 681   while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
3427  0625 ae0301        	ldw	x,#769
3428  0628 cd0000        	call	_I2C_CheckEvent
3430  062b 4d            	tnz	a
3431  062c 27f7          	jreq	L1551
3432                     ; 683   I2C_Send7bitAddress(slvAddr, I2C_Direction_Receiver);
3434  062e ae0001        	ldw	x,#1
3435  0631 7b04          	ld	a,(OFST+1,sp)
3436  0633 95            	ld	xh,a
3437  0634 cd0000        	call	_I2C_Send7bitAddress
3439                     ; 685   if(!I2C_CheckEvent_T(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED,5))	//200us
3441  0637 4b05          	push	#5
3442  0639 ae0302        	ldw	x,#770
3443  063c cd054f        	call	_I2C_CheckEvent_T
3445  063f 5b01          	addw	sp,#1
3446  0641 4d            	tnz	a
3447  0642 2621          	jrne	L1651
3448                     ; 687 		I2C_GenerateSTOP(ENABLE);
3450  0644 a601          	ld	a,#1
3451  0646 cd0000        	call	_I2C_GenerateSTOP
3453                     ; 688 		return FALSE;
3455  0649 4f            	clr	a
3457  064a               L67:
3459  064a 5b04          	addw	sp,#4
3460  064c 81            	ret
3461  064d               L7651:
3462                     ; 695     while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED));
3464  064d ae0340        	ldw	x,#832
3465  0650 cd0000        	call	_I2C_CheckEvent
3467  0653 4d            	tnz	a
3468  0654 27f7          	jreq	L7651
3469                     ; 696     *pData = (uint8_t)(I2C_ReceiveData());
3471  0656 cd0000        	call	_I2C_ReceiveData
3473  0659 1e02          	ldw	x,(OFST-1,sp)
3474  065b f7            	ld	(x),a
3475                     ; 697 		pData++;
3477  065c 1e02          	ldw	x,(OFST-1,sp)
3478  065e 1c0001        	addw	x,#1
3479  0661 1f02          	ldw	(OFST-1,sp),x
3480                     ; 698 		iRx++;
3482  0663 0c01          	inc	(OFST-2,sp)
3483  0665               L1651:
3484                     ; 692   while (iRx < Size)
3486  0665 7b01          	ld	a,(OFST-2,sp)
3487  0667 1109          	cp	a,(OFST+6,sp)
3488  0669 25e2          	jrult	L7651
3489                     ; 702   I2C_GenerateSTOP(ENABLE);
3491  066b a601          	ld	a,#1
3492  066d cd0000        	call	_I2C_GenerateSTOP
3494                     ; 703 	Delay_5us();
3496  0670 cd014d        	call	_Delay_5us
3498                     ; 704 	Delay_5us();
3500  0673 cd014d        	call	_Delay_5us
3502                     ; 706 	return TRUE;
3504  0676 a601          	ld	a,#1
3506  0678 20d0          	jra	L67
3541                     ; 710 void Clear_I2c_Rx()
3541                     ; 711 {
3542                     	switch	.text
3543  067a               _Clear_I2c_Rx:
3545  067a 88            	push	a
3546       00000001      OFST:	set	1
3549                     ; 714 	for(i=0;i<I2C_MAX_RX_LEN;i++)
3551  067b 0f01          	clr	(OFST+0,sp)
3552  067d               L1161:
3553                     ; 715 		I2c_RxBuff[i]=0;
3555  067d 7b01          	ld	a,(OFST+0,sp)
3556  067f 5f            	clrw	x
3557  0680 97            	ld	xl,a
3558  0681 6f00          	clr	(_I2c_RxBuff,x)
3559                     ; 714 	for(i=0;i<I2C_MAX_RX_LEN;i++)
3561  0683 0c01          	inc	(OFST+0,sp)
3564  0685 7b01          	ld	a,(OFST+0,sp)
3565  0687 a110          	cp	a,#16
3566  0689 25f2          	jrult	L1161
3567                     ; 716 }
3570  068b 84            	pop	a
3571  068c 81            	ret
3611                     ; 720 @far @interrupt void UsartRx_Handle_ISR(void)
3611                     ; 721 {
3613                     	switch	.text
3614  068d               f_UsartRx_Handle_ISR:
3616       00000001      OFST:	set	1
3617  068d 3b0002        	push	c_x+2
3618  0690 be00          	ldw	x,c_x
3619  0692 89            	pushw	x
3620  0693 3b0002        	push	c_y+2
3621  0696 be00          	ldw	x,c_y
3622  0698 89            	pushw	x
3623  0699 88            	push	a
3626                     ; 724 	w=(uint8_t)USART->DR;
3628  069a c65231        	ld	a,21041
3629  069d 6b01          	ld	(OFST+0,sp),a
3631  069f               L1461:
3632                     ; 727 	while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET){};
3634  069f ae0080        	ldw	x,#128
3635  06a2 cd0000        	call	_USART_GetFlagStatus
3637  06a5 4d            	tnz	a
3638  06a6 27f7          	jreq	L1461
3639                     ; 728 				USART_SendData8('a');
3642  06a8 a661          	ld	a,#97
3643  06aa cd0000        	call	_USART_SendData8
3645                     ; 730 	if(!bRx)
3647  06ad 3d35          	tnz	_bRx
3648  06af 2622          	jrne	L5461
3649                     ; 732 		if(!bRxFirst)
3651  06b1 3d33          	tnz	_bRxFirst
3652  06b3 260e          	jrne	L7461
3653                     ; 734 			Usart_RxBuff[0]=w;
3655  06b5 7b01          	ld	a,(OFST+0,sp)
3656  06b7 b736          	ld	_Usart_RxBuff,a
3657                     ; 735 			bRxFirst=1;
3659  06b9 35010033      	mov	_bRxFirst,#1
3660                     ; 736 			iRxIndex=1;
3662  06bd 35010034      	mov	_iRxIndex,#1
3664  06c1 2010          	jra	L5461
3665  06c3               L7461:
3666                     ; 738 			if(iRxIndex<MAX_RX_LEN)
3668  06c3 b634          	ld	a,_iRxIndex
3669  06c5 a140          	cp	a,#64
3670  06c7 240a          	jruge	L5461
3671                     ; 740 				Usart_RxBuff[iRxIndex]=w;
3673  06c9 b634          	ld	a,_iRxIndex
3674  06cb 5f            	clrw	x
3675  06cc 97            	ld	xl,a
3676  06cd 7b01          	ld	a,(OFST+0,sp)
3677  06cf e736          	ld	(_Usart_RxBuff,x),a
3678                     ; 741 				iRxIndex++;
3680  06d1 3c34          	inc	_iRxIndex
3681  06d3               L5461:
3682                     ; 745 }
3685  06d3 84            	pop	a
3686  06d4 85            	popw	x
3687  06d5 bf00          	ldw	c_y,x
3688  06d7 320002        	pop	c_y+2
3689  06da 85            	popw	x
3690  06db bf00          	ldw	c_x,x
3691  06dd 320002        	pop	c_x+2
3692  06e0 80            	iret
3715                     ; 748 @far @interrupt void AWU_Handle_ISR(void)
3715                     ; 749 {
3716                     	switch	.text
3717  06e1               f_AWU_Handle_ISR:
3719  06e1 3b0002        	push	c_x+2
3720  06e4 be00          	ldw	x,c_x
3721  06e6 89            	pushw	x
3722  06e7 3b0002        	push	c_y+2
3723  06ea be00          	ldw	x,c_y
3724  06ec 89            	pushw	x
3727                     ; 751 	AWU_GetFlagStatus();
3729  06ed cd0000        	call	_AWU_GetFlagStatus
3731                     ; 752 }
3734  06f0 85            	popw	x
3735  06f1 bf00          	ldw	c_y,x
3736  06f3 320002        	pop	c_y+2
3737  06f6 85            	popw	x
3738  06f7 bf00          	ldw	c_x,x
3739  06f9 320002        	pop	c_x+2
3740  06fc 80            	iret
3764                     ; 755 @far @interrupt void EXTI5_Handle_ISR(void)//按下按钮触发
3764                     ; 756 {
3765                     	switch	.text
3766  06fd               f_EXTI5_Handle_ISR:
3768  06fd 3b0002        	push	c_x+2
3769  0700 be00          	ldw	x,c_x
3770  0702 89            	pushw	x
3771  0703 3b0002        	push	c_y+2
3772  0706 be00          	ldw	x,c_y
3773  0708 89            	pushw	x
3776                     ; 757 	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
3778  0709 a620          	ld	a,#32
3779  070b cd0000        	call	_EXTI_ClearITPendingBit
3781                     ; 758 	m_bWakeExti=1;
3783  070e 350100b6      	mov	_m_bWakeExti,#1
3784                     ; 759 }
3787  0712 85            	popw	x
3788  0713 bf00          	ldw	c_y,x
3789  0715 320002        	pop	c_y+2
3790  0718 85            	popw	x
3791  0719 bf00          	ldw	c_x,x
3792  071b 320002        	pop	c_x+2
3793  071e 80            	iret
3805                     	xdef	f_EXTI5_Handle_ISR
3806                     	xdef	f_AWU_Handle_ISR
3807                     	xdef	f_UsartRx_Handle_ISR
3808                     	xdef	f_TIM2_Handle_ISR
3809                     	xdef	_main
3810                     	xdef	_Delay_5us
3811                     	xdef	_I2C_GetData
3812                     	xdef	_I2C_SendCmd
3813                     	xdef	_I2C_CheckEvent_T
3814                     	xdef	_Clear_I2c_Rx
3815                     	xdef	_JustExitAHalt
3816                     	xdef	_EnterAHalt
3817                     	xdef	_ClearDog
3818                     	xdef	_CheckSumXor
3819                     	xdef	_GetCheckSumXor
3820                     	xdef	_RecvData
3821                     	xdef	_MakeSendPack
3822                     	xdef	_Clear_Usart_Rx
3823                     	xdef	_Clear_Usart_Tx
3824                     	xdef	_Usart_Send
3825                     	xdef	_Set_Usart
3826                     	xdef	_IWDG_Config
3827                     	xdef	_Init_Mem
3828                     	xdef	_Init_Port
3829                     	xdef	_CLK_SetTick
3830                     	xdef	_Delay
3831                     	switch	.ubsct
3832  0000               _I2c_RxBuff:
3833  0000 000000000000  	ds.b	16
3834                     	xdef	_I2c_RxBuff
3835  0010               _I2c_TxBuff:
3836  0010 00000000      	ds.b	4
3837                     	xdef	_I2c_TxBuff
3838                     	xdef	_addrMaybe
3839                     	xdef	_m_beat
3840  0014               _m_Turn:
3841  0014 00            	ds.b	1
3842                     	xdef	_m_Turn
3843  0015               _m_DeviceID:
3844  0015 000000000000  	ds.b	12
3845                     	xdef	_m_DeviceID
3846  0021               _m_MAC:
3847  0021 000000000000  	ds.b	6
3848                     	xdef	_m_MAC
3849  0027               _m_Shinning:
3850  0027 00            	ds.b	1
3851                     	xdef	_m_Shinning
3852  0028               _iWDog:
3853  0028 00            	ds.b	1
3854                     	xdef	_iWDog
3855  0029               _m_Intv1:
3856  0029 0000          	ds.b	2
3857                     	xdef	_m_Intv1
3858  002b               _m_intr4:
3859  002b 0000          	ds.b	2
3860                     	xdef	_m_intr4
3861  002d               _m_intr3:
3862  002d 0000          	ds.b	2
3863                     	xdef	_m_intr3
3864  002f               _m_intr2:
3865  002f 0000          	ds.b	2
3866                     	xdef	_m_intr2
3867  0031               _m_intr1:
3868  0031 0000          	ds.b	2
3869                     	xdef	_m_intr1
3870  0033               _bRxFirst:
3871  0033 00            	ds.b	1
3872                     	xdef	_bRxFirst
3873  0034               _iRxIndex:
3874  0034 00            	ds.b	1
3875                     	xdef	_iRxIndex
3876  0035               _bRx:
3877  0035 00            	ds.b	1
3878                     	xdef	_bRx
3879  0036               _Usart_RxBuff:
3880  0036 000000000000  	ds.b	64
3881                     	xdef	_Usart_RxBuff
3882  0076               _Usart_TxBuff:
3883  0076 000000000000  	ds.b	64
3884                     	xdef	_Usart_TxBuff
3885  00b6               _m_bWakeExti:
3886  00b6 00            	ds.b	1
3887                     	xdef	_m_bWakeExti
3888  00b7               _m_Idle0:
3889  00b7 0000          	ds.b	2
3890                     	xdef	_m_Idle0
3891  00b9               _m_Idle:
3892  00b9 0000          	ds.b	2
3893                     	xdef	_m_Idle
3894  00bb               _m_Press:
3895  00bb 00            	ds.b	1
3896                     	xdef	_m_Press
3897  00bc               _m_tLedLasting:
3898  00bc 00            	ds.b	1
3899                     	xdef	_m_tLedLasting
3900  00bd               _m_WarnSeq:
3901  00bd 00            	ds.b	1
3902                     	xdef	_m_WarnSeq
3903  00be               _m_nMvSendNum:
3904  00be 0000          	ds.b	2
3905                     	xdef	_m_nMvSendNum
3906  00c0               _m_tMvLasting:
3907  00c0 0000          	ds.b	2
3908                     	xdef	_m_tMvLasting
3909  00c2               _m_tMvDetectGap:
3910  00c2 00            	ds.b	1
3911                     	xdef	_m_tMvDetectGap
3912  00c3               _m_tWarnGap:
3913  00c3 0000          	ds.b	2
3914                     	xdef	_m_tWarnGap
3915  00c5               _m_tDataGap:
3916  00c5 0000          	ds.b	2
3917                     	xdef	_m_tDataGap
3918  00c7               _m_tSLasting:
3919  00c7 0000          	ds.b	2
3920                     	xdef	_m_tSLasting
3921  00c9               _m_tLLasting:
3922  00c9 0000          	ds.b	2
3923                     	xdef	_m_tLLasting
3924  00cb               _m_Param:
3925  00cb 000000000000  	ds.b	24
3926                     	xdef	_m_Param
3927                     	xref	_AWU_GetFlagStatus
3928                     	xref	_AWU_Cmd
3929                     	xref	_AWU_Init
3930                     	xref	_AWU_DeInit
3931                     	xref	_USART_GetFlagStatus
3932                     	xref	_USART_SendData8
3933                     	xref	_USART_ITConfig
3934                     	xref	_USART_Cmd
3935                     	xref	_USART_Init
3936                     	xref	_USART_DeInit
3937                     	xref	_IWDG_Enable
3938                     	xref	_IWDG_ReloadCounter
3939                     	xref	_IWDG_SetReload
3940                     	xref	_IWDG_SetPrescaler
3941                     	xref	_IWDG_WriteAccessCmd
3942                     	xref	_TIM2_ClearITPendingBit
3943                     	xref	_TIM2_InternalClockConfig
3944                     	xref	_TIM2_ITConfig
3945                     	xref	_TIM2_Cmd
3946                     	xref	_TIM2_TimeBaseInit
3947                     	xref	_TIM2_DeInit
3948                     	xref	_I2C_GetFlagStatus
3949                     	xref	_I2C_Send7bitAddress
3950                     	xref	_I2C_SendData
3951                     	xref	_I2C_ReceiveData
3952                     	xref	_I2C_CheckEvent
3953                     	xref	_I2C_GenerateSTOP
3954                     	xref	_I2C_GenerateSTART
3955                     	xref	_GPIO_ReadInputDataBit
3956                     	xref	_GPIO_Init
3957                     	xref	_EXTI_ClearITPendingBit
3958                     	xref	_EXTI_SetPinSensitivity
3959                     	xref	_EXTI_DeInit
3960                     	xref	_CLK_PeripheralClockConfig
3961                     	xref	_CLK_DeInit
3962                     	xref.b	c_x
3963                     	xref.b	c_y
3983                     	end
