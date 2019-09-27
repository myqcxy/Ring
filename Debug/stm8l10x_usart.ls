   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  54                     ; 47 void USART_DeInit(void)
  54                     ; 48 {
  56                     	switch	.text
  57  0000               _USART_DeInit:
  59  0000 88            	push	a
  60       00000001      OFST:	set	1
  63                     ; 52     dummy = USART->SR;
  65  0001 c65230        	ld	a,21040
  66                     ; 53     dummy = USART->DR;
  68  0004 c65231        	ld	a,21041
  69                     ; 55     USART->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
  71  0007 725f5233      	clr	21043
  72                     ; 56     USART->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
  74  000b 725f5232      	clr	21042
  75                     ; 58     USART->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
  77  000f 725f5234      	clr	21044
  78                     ; 59     USART->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
  80  0013 725f5235      	clr	21045
  81                     ; 60     USART->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
  83  0017 725f5236      	clr	21046
  84                     ; 61     USART->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
  86  001b 725f5237      	clr	21047
  87                     ; 62 }
  90  001f 84            	pop	a
  91  0020 81            	ret
 264                     ; 76 void USART_Init(uint32_t BaudRate, USART_WordLength_TypeDef USART_WordLength,
 264                     ; 77                 USART_StopBits_TypeDef USART_StopBits, USART_Parity_TypeDef
 264                     ; 78                 USART_Parity,	USART_Mode_TypeDef USART_Mode)
 264                     ; 79 {
 265                     	switch	.text
 266  0021               _USART_Init:
 268  0021 5204          	subw	sp,#4
 269       00000004      OFST:	set	4
 272                     ; 80     uint32_t BaudRate_Mantissa = 0;
 274                     ; 83     assert_param(IS_USART_BAUDRATE(BaudRate));
 276                     ; 85     assert_param(IS_USART_WordLength(USART_WordLength));
 278                     ; 87     assert_param(IS_USART_STOPBITS(USART_StopBits));
 280                     ; 89     assert_param(IS_USART_PARITY(USART_Parity));
 282                     ; 91     assert_param(IS_USART_MODE(USART_Mode));
 284                     ; 94     USART->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS |USART_CR1_M));
 286  0023 c65234        	ld	a,21044
 287  0026 a4e9          	and	a,#233
 288  0028 c75234        	ld	21044,a
 289                     ; 97     USART->CR1 |= (uint8_t)(USART_WordLength |USART_Parity);
 291  002b 7b0b          	ld	a,(OFST+7,sp)
 292  002d 1a0d          	or	a,(OFST+9,sp)
 293  002f ca5234        	or	a,21044
 294  0032 c75234        	ld	21044,a
 295                     ; 100     USART->CR3 &= (uint8_t)(~USART_CR3_STOP);
 297  0035 c65236        	ld	a,21046
 298  0038 a4cf          	and	a,#207
 299  003a c75236        	ld	21046,a
 300                     ; 102     USART->CR3 |= (uint8_t)USART_StopBits;
 302  003d c65236        	ld	a,21046
 303  0040 1a0c          	or	a,(OFST+8,sp)
 304  0042 c75236        	ld	21046,a
 305                     ; 105     USART->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 307  0045 725f5232      	clr	21042
 308                     ; 107     USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 310  0049 c65233        	ld	a,21043
 311  004c a40f          	and	a,#15
 312  004e c75233        	ld	21043,a
 313                     ; 109     USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 315  0051 c65233        	ld	a,21043
 316  0054 a4f0          	and	a,#240
 317  0056 c75233        	ld	21043,a
 318                     ; 111     BaudRate_Mantissa  = ((uint32_t)CLK_GetClockFreq()/ BaudRate );
 320  0059 cd0000        	call	_CLK_GetClockFreq
 322  005c 96            	ldw	x,sp
 323  005d 1c0007        	addw	x,#OFST+3
 324  0060 cd0000        	call	c_ludv
 326  0063 96            	ldw	x,sp
 327  0064 1c0001        	addw	x,#OFST-3
 328  0067 cd0000        	call	c_rtol
 330                     ; 113     USART->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8)& (uint8_t)0xF0);
 332  006a 7b03          	ld	a,(OFST-1,sp)
 333  006c a4f0          	and	a,#240
 334  006e c75233        	ld	21043,a
 335                     ; 115     USART->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 337  0071 7b04          	ld	a,(OFST+0,sp)
 338  0073 a40f          	and	a,#15
 339  0075 ca5233        	or	a,21043
 340  0078 c75233        	ld	21043,a
 341                     ; 117     USART->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 343  007b 96            	ldw	x,sp
 344  007c 1c0001        	addw	x,#OFST-3
 345  007f cd0000        	call	c_ltor
 347  0082 a604          	ld	a,#4
 348  0084 cd0000        	call	c_lursh
 350  0087 b603          	ld	a,c_lreg+3
 351  0089 c75232        	ld	21042,a
 352                     ; 120     USART->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 354  008c c65235        	ld	a,21045
 355  008f a4f3          	and	a,#243
 356  0091 c75235        	ld	21045,a
 357                     ; 122     USART->CR2 |= (uint8_t)USART_Mode;
 359  0094 c65235        	ld	a,21045
 360  0097 1a0e          	or	a,(OFST+10,sp)
 361  0099 c75235        	ld	21045,a
 362                     ; 123 }
 365  009c 5b04          	addw	sp,#4
 366  009e 81            	ret
 514                     ; 134 void USART_ClockInit(USART_Clock_TypeDef USART_Clock, USART_CPOL_TypeDef USART_CPOL,
 514                     ; 135                      USART_CPHA_TypeDef USART_CPHA, USART_LastBit_TypeDef USART_LastBit)
 514                     ; 136 {
 515                     	switch	.text
 516  009f               _USART_ClockInit:
 518  009f 89            	pushw	x
 519       00000000      OFST:	set	0
 522                     ; 138     assert_param(IS_USART_CLOCK(USART_Clock));
 524                     ; 139     assert_param(IS_USART_CPOL(USART_CPOL));
 526                     ; 140     assert_param(IS_USART_CPHA(USART_CPHA));
 528                     ; 141     assert_param(IS_USART_LASTBIT(USART_LastBit));
 530                     ; 144     USART->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 532  00a0 c65236        	ld	a,21046
 533  00a3 a4f8          	and	a,#248
 534  00a5 c75236        	ld	21046,a
 535                     ; 146     USART->CR3 |= (uint8_t)(USART_CPOL | USART_CPHA | USART_LastBit);
 537  00a8 9f            	ld	a,xl
 538  00a9 1a05          	or	a,(OFST+5,sp)
 539  00ab 1a06          	or	a,(OFST+6,sp)
 540  00ad ca5236        	or	a,21046
 541  00b0 c75236        	ld	21046,a
 542                     ; 148     if (USART_Clock != USART_Clock_Disable)
 544  00b3 0d01          	tnz	(OFST+1,sp)
 545  00b5 2706          	jreq	L522
 546                     ; 150         USART->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 548  00b7 72165236      	bset	21046,#3
 550  00bb 2004          	jra	L722
 551  00bd               L522:
 552                     ; 154         USART->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 554  00bd 72175236      	bres	21046,#3
 555  00c1               L722:
 556                     ; 156 }
 559  00c1 85            	popw	x
 560  00c2 81            	ret
 615                     ; 165 void USART_Cmd(FunctionalState NewState)
 615                     ; 166 {
 616                     	switch	.text
 617  00c3               _USART_Cmd:
 621                     ; 167     assert_param(IS_FUNCTIONAL_STATE(NewState));
 623                     ; 169     if (NewState != DISABLE)
 625  00c3 4d            	tnz	a
 626  00c4 2706          	jreq	L752
 627                     ; 171         USART->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 629  00c6 721b5234      	bres	21044,#5
 631  00ca 2004          	jra	L162
 632  00cc               L752:
 633                     ; 175         USART->CR1 |= USART_CR1_USARTD;  /**< USART Disable */
 635  00cc 721a5234      	bset	21044,#5
 636  00d0               L162:
 637                     ; 177 }
 640  00d0 81            	ret
 751                     ; 196 void USART_ITConfig(USART_IT_TypeDef USART_IT, FunctionalState NewState)
 751                     ; 197 {
 752                     	switch	.text
 753  00d1               _USART_ITConfig:
 755  00d1 89            	pushw	x
 756  00d2 89            	pushw	x
 757       00000002      OFST:	set	2
 760                     ; 198     uint8_t uartreg, itpos = 0x00;
 762                     ; 199     assert_param(IS_USART_CONFIG_IT(USART_IT));
 764                     ; 200     assert_param(IS_FUNCTIONAL_STATE(NewState));
 766                     ; 203     uartreg = (uint8_t)(USART_IT >> (uint8_t)0x08);
 768  00d3 9e            	ld	a,xh
 769  00d4 6b01          	ld	(OFST-1,sp),a
 770                     ; 205     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 772  00d6 9f            	ld	a,xl
 773  00d7 a40f          	and	a,#15
 774  00d9 5f            	clrw	x
 775  00da 97            	ld	xl,a
 776  00db a601          	ld	a,#1
 777  00dd 5d            	tnzw	x
 778  00de 2704          	jreq	L61
 779  00e0               L02:
 780  00e0 48            	sll	a
 781  00e1 5a            	decw	x
 782  00e2 26fc          	jrne	L02
 783  00e4               L61:
 784  00e4 6b02          	ld	(OFST+0,sp),a
 785                     ; 207     if (NewState != DISABLE)
 787  00e6 0d07          	tnz	(OFST+5,sp)
 788  00e8 271a          	jreq	L533
 789                     ; 210         if (uartreg == 0x01)
 791  00ea 7b01          	ld	a,(OFST-1,sp)
 792  00ec a101          	cp	a,#1
 793  00ee 260a          	jrne	L733
 794                     ; 212             USART->CR1 |= itpos;
 796  00f0 c65234        	ld	a,21044
 797  00f3 1a02          	or	a,(OFST+0,sp)
 798  00f5 c75234        	ld	21044,a
 800  00f8 2024          	jra	L343
 801  00fa               L733:
 802                     ; 217             USART->CR2 |= itpos;
 804  00fa c65235        	ld	a,21045
 805  00fd 1a02          	or	a,(OFST+0,sp)
 806  00ff c75235        	ld	21045,a
 807  0102 201a          	jra	L343
 808  0104               L533:
 809                     ; 223         if (uartreg == 0x01)
 811  0104 7b01          	ld	a,(OFST-1,sp)
 812  0106 a101          	cp	a,#1
 813  0108 260b          	jrne	L543
 814                     ; 225             USART->CR1 &= (uint8_t)(~itpos);
 816  010a 7b02          	ld	a,(OFST+0,sp)
 817  010c 43            	cpl	a
 818  010d c45234        	and	a,21044
 819  0110 c75234        	ld	21044,a
 821  0113 2009          	jra	L343
 822  0115               L543:
 823                     ; 230             USART->CR2 &= (uint8_t)(~itpos);
 825  0115 7b02          	ld	a,(OFST+0,sp)
 826  0117 43            	cpl	a
 827  0118 c45235        	and	a,21045
 828  011b c75235        	ld	21045,a
 829  011e               L343:
 830                     ; 234 }
 833  011e 5b04          	addw	sp,#4
 834  0120 81            	ret
 857                     ; 243 uint8_t USART_ReceiveData8(void)
 857                     ; 244 {
 858                     	switch	.text
 859  0121               _USART_ReceiveData8:
 863                     ; 245     return USART->DR;
 865  0121 c65231        	ld	a,21041
 868  0124 81            	ret
 891                     ; 257 uint16_t USART_ReceiveData9(void)
 891                     ; 258 {
 892                     	switch	.text
 893  0125               _USART_ReceiveData9:
 895  0125 89            	pushw	x
 896       00000002      OFST:	set	2
 899                     ; 259     return (uint16_t)( (((uint16_t) USART->DR) | ((uint16_t)(((uint16_t)( (uint16_t)USART->CR1 & (uint16_t)USART_CR1_R8)) << 1))) & ((uint16_t)0x01FF));
 901  0126 c65234        	ld	a,21044
 902  0129 5f            	clrw	x
 903  012a a480          	and	a,#128
 904  012c 5f            	clrw	x
 905  012d 02            	rlwa	x,a
 906  012e 58            	sllw	x
 907  012f 1f01          	ldw	(OFST-1,sp),x
 908  0131 c65231        	ld	a,21041
 909  0134 5f            	clrw	x
 910  0135 97            	ld	xl,a
 911  0136 01            	rrwa	x,a
 912  0137 1a02          	or	a,(OFST+0,sp)
 913  0139 01            	rrwa	x,a
 914  013a 1a01          	or	a,(OFST-1,sp)
 915  013c 01            	rrwa	x,a
 916  013d 01            	rrwa	x,a
 917  013e a4ff          	and	a,#255
 918  0140 01            	rrwa	x,a
 919  0141 a401          	and	a,#1
 920  0143 01            	rrwa	x,a
 923  0144 5b02          	addw	sp,#2
 924  0146 81            	ret
 960                     ; 269 void USART_ReceiverWakeUpCmd(FunctionalState NewState)
 960                     ; 270 {
 961                     	switch	.text
 962  0147               _USART_ReceiverWakeUpCmd:
 966                     ; 271     assert_param(IS_FUNCTIONAL_STATE(NewState));
 968                     ; 273     if (NewState != DISABLE)
 970  0147 4d            	tnz	a
 971  0148 2706          	jreq	L704
 972                     ; 276         USART->CR2 |= USART_CR2_RWU;
 974  014a 72125235      	bset	21045,#1
 976  014e 2004          	jra	L114
 977  0150               L704:
 978                     ; 281         USART->CR2 &= ((uint8_t)~USART_CR2_RWU);
 980  0150 72135235      	bres	21045,#1
 981  0154               L114:
 982                     ; 283 }
 985  0154 81            	ret
1008                     ; 292 void USART_SendBreak(void)
1008                     ; 293 {
1009                     	switch	.text
1010  0155               _USART_SendBreak:
1014                     ; 294     USART->CR2 |= USART_CR2_SBK;
1016  0155 72105235      	bset	21045,#0
1017                     ; 295 }
1020  0159 81            	ret
1054                     ; 305 void USART_SendData8(uint8_t Data)
1054                     ; 306 {
1055                     	switch	.text
1056  015a               _USART_SendData8:
1060                     ; 308     USART->DR = Data;
1062  015a c75231        	ld	21041,a
1063                     ; 309 }
1066  015d 81            	ret
1100                     ; 320 void USART_SendData9(uint16_t Data)
1100                     ; 321 {
1101                     	switch	.text
1102  015e               _USART_SendData9:
1104  015e 89            	pushw	x
1105       00000000      OFST:	set	0
1108                     ; 322     assert_param(IS_USART_DATA_9BITS(Data));
1110                     ; 324     USART->CR1 &= ((uint8_t)~USART_CR1_T8);                    /* Clear the transmit data bit 8     */
1112  015f 721d5234      	bres	21044,#6
1113                     ; 325     USART->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8); /* Write the transmit data bit [8]   */
1115  0163 54            	srlw	x
1116  0164 54            	srlw	x
1117  0165 9f            	ld	a,xl
1118  0166 a440          	and	a,#64
1119  0168 ca5234        	or	a,21044
1120  016b c75234        	ld	21044,a
1121                     ; 326     USART->DR   = (uint8_t)(Data);                             /* Write the transmit data bit [0:7] */
1123  016e 7b02          	ld	a,(OFST+2,sp)
1124  0170 c75231        	ld	21041,a
1125                     ; 328 }
1128  0173 85            	popw	x
1129  0174 81            	ret
1163                     ; 337 void USART_SetAddress(uint8_t Address)
1163                     ; 338 {
1164                     	switch	.text
1165  0175               _USART_SetAddress:
1167  0175 88            	push	a
1168       00000000      OFST:	set	0
1171                     ; 340     assert_param(IS_USART_ADDRESS(Address));
1173                     ; 343     USART->CR4 &= ((uint8_t)~USART_CR4_ADD);
1175  0176 c65237        	ld	a,21047
1176  0179 a4f0          	and	a,#240
1177  017b c75237        	ld	21047,a
1178                     ; 345     USART->CR4 |= Address;
1180  017e c65237        	ld	a,21047
1181  0181 1a01          	or	a,(OFST+1,sp)
1182  0183 c75237        	ld	21047,a
1183                     ; 346 }
1186  0186 84            	pop	a
1187  0187 81            	ret
1244                     ; 355 void USART_WakeUpConfig(USART_WakeUp_TypeDef USART_WakeUp)
1244                     ; 356 {
1245                     	switch	.text
1246  0188               _USART_WakeUpConfig:
1250                     ; 357     assert_param(IS_USART_WAKEUP(USART_WakeUp));
1252                     ; 359     USART->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1254  0188 72175234      	bres	21044,#3
1255                     ; 360     USART->CR1 |= (uint8_t)USART_WakeUp;
1257  018c ca5234        	or	a,21044
1258  018f c75234        	ld	21044,a
1259                     ; 361 }
1262  0192 81            	ret
1398                     ; 371 FlagStatus USART_GetFlagStatus(USART_FLAG_TypeDef USART_FLAG)
1398                     ; 372 {
1399                     	switch	.text
1400  0193               _USART_GetFlagStatus:
1402  0193 89            	pushw	x
1403  0194 88            	push	a
1404       00000001      OFST:	set	1
1407                     ; 373     FlagStatus status = RESET;
1409                     ; 376     assert_param(IS_USART_FLAG(USART_FLAG));
1411                     ; 378     if (USART_FLAG == USART_FLAG_SBK)
1413  0195 a30101        	cpw	x,#257
1414  0198 2610          	jrne	L306
1415                     ; 380         if ((USART->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1417  019a 9f            	ld	a,xl
1418  019b c45235        	and	a,21045
1419  019e 2706          	jreq	L506
1420                     ; 383             status = SET;
1422  01a0 a601          	ld	a,#1
1423  01a2 6b01          	ld	(OFST+0,sp),a
1425  01a4 2013          	jra	L116
1426  01a6               L506:
1427                     ; 388             status = RESET;
1429  01a6 0f01          	clr	(OFST+0,sp)
1430  01a8 200f          	jra	L116
1431  01aa               L306:
1432                     ; 393         if ((USART->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1434  01aa c65230        	ld	a,21040
1435  01ad 1503          	bcp	a,(OFST+2,sp)
1436  01af 2706          	jreq	L316
1437                     ; 396             status = SET;
1439  01b1 a601          	ld	a,#1
1440  01b3 6b01          	ld	(OFST+0,sp),a
1442  01b5 2002          	jra	L116
1443  01b7               L316:
1444                     ; 401             status = RESET;
1446  01b7 0f01          	clr	(OFST+0,sp)
1447  01b9               L116:
1448                     ; 405     return status;
1450  01b9 7b01          	ld	a,(OFST+0,sp)
1453  01bb 5b03          	addw	sp,#3
1454  01bd 81            	ret
1477                     ; 430 void USART_ClearFlag(void)
1477                     ; 431 {
1478                     	switch	.text
1479  01be               _USART_ClearFlag:
1483                     ; 433     USART->SR = (uint8_t)~(USART_SR_RXNE);
1485  01be 35df5230      	mov	21040,#223
1486                     ; 434 }
1489  01c2 81            	ret
1571                     ; 451 ITStatus USART_GetITStatus(USART_IT_TypeDef USART_IT)
1571                     ; 452 {
1572                     	switch	.text
1573  01c3               _USART_GetITStatus:
1575  01c3 89            	pushw	x
1576  01c4 89            	pushw	x
1577       00000002      OFST:	set	2
1580                     ; 453     ITStatus pendingbitstatus = RESET;
1582                     ; 454     uint8_t itpos = 0;
1584                     ; 455     uint8_t itmask1 = 0;
1586                     ; 456     uint8_t itmask2 = 0;
1588                     ; 457     uint8_t enablestatus = 0;
1590                     ; 460     assert_param(IS_USART_GET_IT(USART_IT));
1592                     ; 463     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
1594  01c5 9f            	ld	a,xl
1595  01c6 a40f          	and	a,#15
1596  01c8 5f            	clrw	x
1597  01c9 97            	ld	xl,a
1598  01ca a601          	ld	a,#1
1599  01cc 5d            	tnzw	x
1600  01cd 2704          	jreq	L05
1601  01cf               L25:
1602  01cf 48            	sll	a
1603  01d0 5a            	decw	x
1604  01d1 26fc          	jrne	L25
1605  01d3               L05:
1606  01d3 6b01          	ld	(OFST-1,sp),a
1607                     ; 465     itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
1609  01d5 7b04          	ld	a,(OFST+2,sp)
1610  01d7 4e            	swap	a
1611  01d8 a40f          	and	a,#15
1612  01da 6b02          	ld	(OFST+0,sp),a
1613                     ; 467     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1615  01dc 7b02          	ld	a,(OFST+0,sp)
1616  01de 5f            	clrw	x
1617  01df 97            	ld	xl,a
1618  01e0 a601          	ld	a,#1
1619  01e2 5d            	tnzw	x
1620  01e3 2704          	jreq	L45
1621  01e5               L65:
1622  01e5 48            	sll	a
1623  01e6 5a            	decw	x
1624  01e7 26fc          	jrne	L65
1625  01e9               L45:
1626  01e9 6b02          	ld	(OFST+0,sp),a
1627                     ; 471     if (USART_IT == USART_IT_PE)
1629  01eb 1e03          	ldw	x,(OFST+1,sp)
1630  01ed a30100        	cpw	x,#256
1631  01f0 261c          	jrne	L176
1632                     ; 474         enablestatus = (uint8_t)((uint8_t)USART->CR1 & itmask2);
1634  01f2 c65234        	ld	a,21044
1635  01f5 1402          	and	a,(OFST+0,sp)
1636  01f7 6b02          	ld	(OFST+0,sp),a
1637                     ; 477         if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1639  01f9 c65230        	ld	a,21040
1640  01fc 1501          	bcp	a,(OFST-1,sp)
1641  01fe 270a          	jreq	L376
1643  0200 0d02          	tnz	(OFST+0,sp)
1644  0202 2706          	jreq	L376
1645                     ; 480             pendingbitstatus = SET;
1647  0204 a601          	ld	a,#1
1648  0206 6b02          	ld	(OFST+0,sp),a
1650  0208 201e          	jra	L776
1651  020a               L376:
1652                     ; 485             pendingbitstatus = RESET;
1654  020a 0f02          	clr	(OFST+0,sp)
1655  020c 201a          	jra	L776
1656  020e               L176:
1657                     ; 491         enablestatus = (uint8_t)((uint8_t)USART->CR2 & itmask2);
1659  020e c65235        	ld	a,21045
1660  0211 1402          	and	a,(OFST+0,sp)
1661  0213 6b02          	ld	(OFST+0,sp),a
1662                     ; 493         if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1664  0215 c65230        	ld	a,21040
1665  0218 1501          	bcp	a,(OFST-1,sp)
1666  021a 270a          	jreq	L107
1668  021c 0d02          	tnz	(OFST+0,sp)
1669  021e 2706          	jreq	L107
1670                     ; 496             pendingbitstatus = SET;
1672  0220 a601          	ld	a,#1
1673  0222 6b02          	ld	(OFST+0,sp),a
1675  0224 2002          	jra	L776
1676  0226               L107:
1677                     ; 501             pendingbitstatus = RESET;
1679  0226 0f02          	clr	(OFST+0,sp)
1680  0228               L776:
1681                     ; 506     return  pendingbitstatus;
1683  0228 7b02          	ld	a,(OFST+0,sp)
1686  022a 5b04          	addw	sp,#4
1687  022c 81            	ret
1711                     ; 530 void USART_ClearITPendingBit(void)
1711                     ; 531 {
1712                     	switch	.text
1713  022d               _USART_ClearITPendingBit:
1717                     ; 533     USART->SR = (uint8_t)~(USART_SR_RXNE);
1719  022d 35df5230      	mov	21040,#223
1720                     ; 534 }
1723  0231 81            	ret
1736                     	xref	_CLK_GetClockFreq
1737                     	xdef	_USART_ClearITPendingBit
1738                     	xdef	_USART_GetITStatus
1739                     	xdef	_USART_ClearFlag
1740                     	xdef	_USART_GetFlagStatus
1741                     	xdef	_USART_WakeUpConfig
1742                     	xdef	_USART_SetAddress
1743                     	xdef	_USART_SendData9
1744                     	xdef	_USART_SendData8
1745                     	xdef	_USART_SendBreak
1746                     	xdef	_USART_ReceiverWakeUpCmd
1747                     	xdef	_USART_ReceiveData9
1748                     	xdef	_USART_ReceiveData8
1749                     	xdef	_USART_ITConfig
1750                     	xdef	_USART_Cmd
1751                     	xdef	_USART_ClockInit
1752                     	xdef	_USART_Init
1753                     	xdef	_USART_DeInit
1754                     	xref.b	c_lreg
1755                     	xref.b	c_x
1774                     	xref	c_lursh
1775                     	xref	c_ltor
1776                     	xref	c_rtol
1777                     	xref	c_ludv
1778                     	end
