   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 43 void SPI_DeInit(void)
  43                     ; 44 {
  45                     	switch	.text
  46  0000               _SPI_DeInit:
  50                     ; 45     SPI->CR1 = SPI_CR1_RESET_VALUE;
  52  0000 725f5200      	clr	20992
  53                     ; 46     SPI->CR2 = SPI_CR2_RESET_VALUE;
  55  0004 725f5201      	clr	20993
  56                     ; 47     SPI->ICR = SPI_ICR_RESET_VALUE;
  58  0008 725f5202      	clr	20994
  59                     ; 48     SPI->SR = SPI_SR_RESET_VALUE;
  61  000c 35025203      	mov	20995,#2
  62                     ; 49 }
  65  0010 81            	ret
 369                     ; 63 void SPI_Init(SPI_FirstBit_TypeDef SPI_FirstBit, SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 369                     ; 64               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL, SPI_CPHA_TypeDef SPI_CPHA,
 369                     ; 65               SPI_DirectionMode_TypeDef SPI_DirectionMode, SPI_NSS_TypeDef SPI_NSS)
 369                     ; 66 {
 370                     	switch	.text
 371  0011               _SPI_Init:
 373  0011 89            	pushw	x
 374       00000000      OFST:	set	0
 377                     ; 69     assert_param(IS_SPI_FIRST_BIT(SPI_FirstBit));
 379                     ; 70     assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 381                     ; 71     assert_param(IS_SPI_MODE(SPI_Mode));
 383                     ; 72     assert_param(IS_SPI_CPOL(SPI_CPOL));
 385                     ; 73     assert_param(IS_SPI_CPHA(SPI_CPHA));
 387                     ; 74     assert_param(IS_SPI_DIRECTION_MODE(SPI_DirectionMode));
 389                     ; 75     assert_param(IS_SPI_NSS(SPI_NSS));
 391                     ; 78     SPI->CR1 = (uint8_t)((uint8_t)(SPI_FirstBit) |
 391                     ; 79                          (uint8_t)(SPI_BaudRatePrescaler) |
 391                     ; 80                          (uint8_t)(SPI_CPOL) |
 391                     ; 81                          (uint8_t)(SPI_CPHA));
 393  0012 9f            	ld	a,xl
 394  0013 1a01          	or	a,(OFST+1,sp)
 395  0015 1a06          	or	a,(OFST+6,sp)
 396  0017 1a07          	or	a,(OFST+7,sp)
 397  0019 c75200        	ld	20992,a
 398                     ; 84     SPI->CR2 = (uint8_t)((uint8_t)(SPI_DirectionMode) | (uint8_t)(SPI_NSS));
 400  001c 7b08          	ld	a,(OFST+8,sp)
 401  001e 1a09          	or	a,(OFST+9,sp)
 402  0020 c75201        	ld	20993,a
 403                     ; 86     if (SPI_Mode == SPI_Mode_Master)
 405  0023 7b05          	ld	a,(OFST+5,sp)
 406  0025 a104          	cp	a,#4
 407  0027 2606          	jrne	L771
 408                     ; 88         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 410  0029 72105201      	bset	20993,#0
 412  002d 2004          	jra	L102
 413  002f               L771:
 414                     ; 92         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 416  002f 72115201      	bres	20993,#0
 417  0033               L102:
 418                     ; 96     SPI->CR1 |= (uint8_t)(SPI_Mode);
 420  0033 c65200        	ld	a,20992
 421  0036 1a05          	or	a,(OFST+5,sp)
 422  0038 c75200        	ld	20992,a
 423                     ; 97 }
 426  003b 85            	popw	x
 427  003c 81            	ret
 482                     ; 106 void SPI_Cmd(FunctionalState NewState)
 482                     ; 107 {
 483                     	switch	.text
 484  003d               _SPI_Cmd:
 488                     ; 110     assert_param(IS_FUNCTIONAL_STATE(NewState));
 490                     ; 112     if (NewState != DISABLE)
 492  003d 4d            	tnz	a
 493  003e 2706          	jreq	L132
 494                     ; 114         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral */
 496  0040 721c5200      	bset	20992,#6
 498  0044 2004          	jra	L332
 499  0046               L132:
 500                     ; 118         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral */
 502  0046 721d5200      	bres	20992,#6
 503  004a               L332:
 504                     ; 121 }
 507  004a 81            	ret
 609                     ; 132 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 609                     ; 133 {
 610                     	switch	.text
 611  004b               _SPI_ITConfig:
 613  004b 89            	pushw	x
 614  004c 88            	push	a
 615       00000001      OFST:	set	1
 618                     ; 134     uint8_t itpos = 0;
 620                     ; 136     assert_param(IS_SPI_CONFIG_IT(SPI_IT));
 622                     ; 137     assert_param(IS_FUNCTIONAL_STATE(NewState));
 624                     ; 140     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 626  004d 9e            	ld	a,xh
 627  004e a40f          	and	a,#15
 628  0050 5f            	clrw	x
 629  0051 97            	ld	xl,a
 630  0052 a601          	ld	a,#1
 631  0054 5d            	tnzw	x
 632  0055 2704          	jreq	L41
 633  0057               L61:
 634  0057 48            	sll	a
 635  0058 5a            	decw	x
 636  0059 26fc          	jrne	L61
 637  005b               L41:
 638  005b 6b01          	ld	(OFST+0,sp),a
 639                     ; 142     if (NewState != DISABLE)
 641  005d 0d03          	tnz	(OFST+2,sp)
 642  005f 270a          	jreq	L303
 643                     ; 144         SPI->ICR |= itpos; /* Enable interrupt*/
 645  0061 c65202        	ld	a,20994
 646  0064 1a01          	or	a,(OFST+0,sp)
 647  0066 c75202        	ld	20994,a
 649  0069 2009          	jra	L503
 650  006b               L303:
 651                     ; 148         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 653  006b 7b01          	ld	a,(OFST+0,sp)
 654  006d 43            	cpl	a
 655  006e c45202        	and	a,20994
 656  0071 c75202        	ld	20994,a
 657  0074               L503:
 658                     ; 150 }
 661  0074 5b03          	addw	sp,#3
 662  0076 81            	ret
 696                     ; 155 void SPI_SendData(uint8_t Data)
 696                     ; 156 {
 697                     	switch	.text
 698  0077               _SPI_SendData:
 702                     ; 157     SPI->DR = Data; /* Write in the DR register the data to be sent*/
 704  0077 c75204        	ld	20996,a
 705                     ; 158 }
 708  007a 81            	ret
 731                     ; 166 uint8_t SPI_ReceiveData(void)
 731                     ; 167 {
 732                     	switch	.text
 733  007b               _SPI_ReceiveData:
 737                     ; 168     return ((uint8_t)SPI->DR); /* Return the data in the DR register */
 739  007b c65204        	ld	a,20996
 742  007e 81            	ret
 778                     ; 180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 778                     ; 181 {
 779                     	switch	.text
 780  007f               _SPI_NSSInternalSoftwareCmd:
 784                     ; 184     assert_param(IS_FUNCTIONAL_STATE(NewState));
 786                     ; 186     if (NewState != DISABLE)
 788  007f 4d            	tnz	a
 789  0080 2706          	jreq	L353
 790                     ; 188         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software */
 792  0082 72105201      	bset	20993,#0
 794  0086 2004          	jra	L553
 795  0088               L353:
 796                     ; 192         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software */
 798  0088 72115201      	bres	20993,#0
 799  008c               L553:
 800                     ; 195 }
 803  008c 81            	ret
 859                     ; 204 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
 859                     ; 205 {
 860                     	switch	.text
 861  008d               _SPI_BiDirectionalLineConfig:
 865                     ; 208     assert_param(IS_SPI_DIRECTION(SPI_Direction));
 867                     ; 209     if (SPI_Direction != SPI_Direction_Rx)
 869  008d 4d            	tnz	a
 870  008e 2706          	jreq	L504
 871                     ; 211         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 873  0090 721c5201      	bset	20993,#6
 875  0094 2004          	jra	L704
 876  0096               L504:
 877                     ; 215         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 879  0096 721d5201      	bres	20993,#6
 880  009a               L704:
 881                     ; 217 }
 884  009a 81            	ret
 998                     ; 227 FlagStatus SPI_GetFlagStatus(SPI_FLAG_TypeDef SPI_FLAG)
 998                     ; 228 {
 999                     	switch	.text
1000  009b               _SPI_GetFlagStatus:
1002  009b 88            	push	a
1003       00000001      OFST:	set	1
1006                     ; 229     FlagStatus status = RESET;
1008                     ; 231     assert_param(IS_SPI_FLAG(SPI_FLAG));
1010                     ; 234     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1012  009c c45203        	and	a,20995
1013  009f 2706          	jreq	L364
1014                     ; 236         status = SET; /* SPI_FLAG is set */
1016  00a1 a601          	ld	a,#1
1017  00a3 6b01          	ld	(OFST+0,sp),a
1019  00a5 2002          	jra	L564
1020  00a7               L364:
1021                     ; 240         status = RESET; /* SPI_FLAG is reset*/
1023  00a7 0f01          	clr	(OFST+0,sp)
1024  00a9               L564:
1025                     ; 244     return status;
1027  00a9 7b01          	ld	a,(OFST+0,sp)
1030  00ab 5b01          	addw	sp,#1
1031  00ad 81            	ret
1054                     ; 258 void SPI_ClearFlag(void)
1054                     ; 259 {
1055                     	switch	.text
1056  00ae               _SPI_ClearFlag:
1060                     ; 261     SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1062  00ae 35f75203      	mov	20995,#247
1063                     ; 262 }
1066  00b2 81            	ret
1148                     ; 275 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1148                     ; 276 {
1149                     	switch	.text
1150  00b3               _SPI_GetITStatus:
1152  00b3 88            	push	a
1153  00b4 89            	pushw	x
1154       00000002      OFST:	set	2
1157                     ; 277     ITStatus pendingbitstatus = RESET;
1159                     ; 278     uint8_t itpos = 0;
1161                     ; 279     uint8_t itmask1 = 0;
1163                     ; 280     uint8_t itmask2 = 0;
1165                     ; 281     uint8_t enablestatus = 0;
1167                     ; 282     assert_param(IS_SPI_GET_IT(SPI_IT));
1169                     ; 284     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1171  00b5 a40f          	and	a,#15
1172  00b7 5f            	clrw	x
1173  00b8 97            	ld	xl,a
1174  00b9 a601          	ld	a,#1
1175  00bb 5d            	tnzw	x
1176  00bc 2704          	jreq	L63
1177  00be               L04:
1178  00be 48            	sll	a
1179  00bf 5a            	decw	x
1180  00c0 26fc          	jrne	L04
1181  00c2               L63:
1182  00c2 6b01          	ld	(OFST-1,sp),a
1183                     ; 287     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1185  00c4 7b03          	ld	a,(OFST+1,sp)
1186  00c6 4e            	swap	a
1187  00c7 a40f          	and	a,#15
1188  00c9 6b02          	ld	(OFST+0,sp),a
1189                     ; 289     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1191  00cb 7b02          	ld	a,(OFST+0,sp)
1192  00cd 5f            	clrw	x
1193  00ce 97            	ld	xl,a
1194  00cf a601          	ld	a,#1
1195  00d1 5d            	tnzw	x
1196  00d2 2704          	jreq	L24
1197  00d4               L44:
1198  00d4 48            	sll	a
1199  00d5 5a            	decw	x
1200  00d6 26fc          	jrne	L44
1201  00d8               L24:
1202  00d8 6b02          	ld	(OFST+0,sp),a
1203                     ; 291     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1205  00da c65203        	ld	a,20995
1206  00dd 1402          	and	a,(OFST+0,sp)
1207  00df 6b02          	ld	(OFST+0,sp),a
1208                     ; 293     if (((SPI->ICR & itpos) != RESET) && enablestatus)
1210  00e1 c65202        	ld	a,20994
1211  00e4 1501          	bcp	a,(OFST-1,sp)
1212  00e6 270a          	jreq	L145
1214  00e8 0d02          	tnz	(OFST+0,sp)
1215  00ea 2706          	jreq	L145
1216                     ; 296         pendingbitstatus = SET;
1218  00ec a601          	ld	a,#1
1219  00ee 6b02          	ld	(OFST+0,sp),a
1221  00f0 2002          	jra	L345
1222  00f2               L145:
1223                     ; 301         pendingbitstatus = RESET;
1225  00f2 0f02          	clr	(OFST+0,sp)
1226  00f4               L345:
1227                     ; 304     return  pendingbitstatus;
1229  00f4 7b02          	ld	a,(OFST+0,sp)
1232  00f6 5b03          	addw	sp,#3
1233  00f8 81            	ret
1257                     ; 318 void SPI_ClearITPendingBit(void)
1257                     ; 319 {
1258                     	switch	.text
1259  00f9               _SPI_ClearITPendingBit:
1263                     ; 321     SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1265  00f9 35f75203      	mov	20995,#247
1266                     ; 322 }
1269  00fd 81            	ret
1282                     	xdef	_SPI_ClearITPendingBit
1283                     	xdef	_SPI_ClearFlag
1284                     	xdef	_SPI_GetITStatus
1285                     	xdef	_SPI_GetFlagStatus
1286                     	xdef	_SPI_ReceiveData
1287                     	xdef	_SPI_SendData
1288                     	xdef	_SPI_BiDirectionalLineConfig
1289                     	xdef	_SPI_NSSInternalSoftwareCmd
1290                     	xdef	_SPI_ITConfig
1291                     	xdef	_SPI_Cmd
1292                     	xdef	_SPI_Init
1293                     	xdef	_SPI_DeInit
1312                     	end
