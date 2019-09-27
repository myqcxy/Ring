   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 50 void TIM2_DeInit(void)
  43                     ; 51 {
  45                     	switch	.text
  46  0000               _TIM2_DeInit:
  50                     ; 52     TIM2->CR1 = TIM_CR1_RESET_VALUE;
  52  0000 725f5250      	clr	21072
  53                     ; 53     TIM2->CR2 = TIM_CR2_RESET_VALUE;
  55  0004 725f5251      	clr	21073
  56                     ; 54     TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  58  0008 725f5252      	clr	21074
  59                     ; 55     TIM2->ETR = TIM_ETR_RESET_VALUE;
  61  000c 725f5253      	clr	21075
  62                     ; 56     TIM2->IER = TIM_IER_RESET_VALUE;
  64  0010 725f5254      	clr	21076
  65                     ; 57     TIM2->SR2 = TIM_SR2_RESET_VALUE;
  67  0014 725f5256      	clr	21078
  68                     ; 60     TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  70  0018 725f525a      	clr	21082
  71                     ; 62     TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  73  001c 35015258      	mov	21080,#1
  74                     ; 63     TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  76  0020 35015259      	mov	21081,#1
  77                     ; 66     TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  79  0024 725f525a      	clr	21082
  80                     ; 67     TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  82  0028 725f5258      	clr	21080
  83                     ; 68     TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  85  002c 725f5259      	clr	21081
  86                     ; 70     TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  88  0030 725f525b      	clr	21083
  89                     ; 71     TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  91  0034 725f525c      	clr	21084
  92                     ; 73     TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  94  0038 725f525d      	clr	21085
  95                     ; 75     TIM2->ARRH = TIM_ARRH_RESET_VALUE;
  97  003c 35ff525e      	mov	21086,#255
  98                     ; 76     TIM2->ARRL = TIM_ARRL_RESET_VALUE;
 100  0040 35ff525f      	mov	21087,#255
 101                     ; 78     TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 103  0044 725f5260      	clr	21088
 104                     ; 79     TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 106  0048 725f5261      	clr	21089
 107                     ; 80     TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 109  004c 725f5262      	clr	21090
 110                     ; 81     TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 112  0050 725f5263      	clr	21091
 113                     ; 83     TIM2->OISR = TIM_OISR_RESET_VALUE;
 115  0054 725f5265      	clr	21093
 116                     ; 84     TIM2->EGR = 0x01;/*TIM_EGR_UG;*/
 118  0058 35015257      	mov	21079,#1
 119                     ; 85     TIM2->BKR = TIM_BKR_RESET_VALUE;
 121  005c 725f5264      	clr	21092
 122                     ; 86     TIM2->SR1 = TIM_SR1_RESET_VALUE;
 124  0060 725f5255      	clr	21077
 125                     ; 87 }
 128  0064 81            	ret
 290                     ; 96 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 290                     ; 97                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 290                     ; 98                        uint16_t TIM2_Period)
 290                     ; 99 {
 291                     	switch	.text
 292  0065               _TIM2_TimeBaseInit:
 294  0065 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 101     assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 300                     ; 102     assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 302                     ; 107     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 304  0066 7b05          	ld	a,(OFST+5,sp)
 305  0068 c7525e        	ld	21086,a
 306                     ; 108     TIM2->ARRL = (uint8_t)(TIM2_Period);
 308  006b 7b06          	ld	a,(OFST+6,sp)
 309  006d c7525f        	ld	21087,a
 310                     ; 111     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 312  0070 9e            	ld	a,xh
 313  0071 c7525d        	ld	21085,a
 314                     ; 114     TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 316  0074 c65250        	ld	a,21072
 317  0077 a48f          	and	a,#143
 318  0079 c75250        	ld	21072,a
 319                     ; 115     TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 321  007c 9f            	ld	a,xl
 322  007d ca5250        	or	a,21072
 323  0080 c75250        	ld	21072,a
 324                     ; 116 }
 327  0083 85            	popw	x
 328  0084 81            	ret
 526                     ; 127 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 526                     ; 128                   TIM2_OutputState_TypeDef TIM2_OutputState,
 526                     ; 129                   uint16_t TIM2_Pulse,
 526                     ; 130                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 526                     ; 131                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 526                     ; 132 {
 527                     	switch	.text
 528  0085               _TIM2_OC1Init:
 530  0085 89            	pushw	x
 531  0086 88            	push	a
 532       00000001      OFST:	set	1
 535                     ; 133     uint8_t tmpccmr1 = 0;
 537                     ; 136     assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 539                     ; 137     assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 541                     ; 138     assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 543                     ; 139     assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 545                     ; 141     tmpccmr1 = TIM2->CCMR1;
 547  0087 c65258        	ld	a,21080
 548  008a 6b01          	ld	(OFST+0,sp),a
 549                     ; 144     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 551  008c 7211525a      	bres	21082,#0
 552                     ; 146     tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 554  0090 7b01          	ld	a,(OFST+0,sp)
 555  0092 a48f          	and	a,#143
 556  0094 6b01          	ld	(OFST+0,sp),a
 557                     ; 149     tmpccmr1 |= (uint8_t)TIM2_OCMode;
 559  0096 9e            	ld	a,xh
 560  0097 1a01          	or	a,(OFST+0,sp)
 561  0099 6b01          	ld	(OFST+0,sp),a
 562                     ; 151     TIM2->CCMR1 = tmpccmr1;
 564  009b 7b01          	ld	a,(OFST+0,sp)
 565  009d c75258        	ld	21080,a
 566                     ; 154     if (TIM2_OutputState == TIM2_OutputState_Enable)
 568  00a0 9f            	ld	a,xl
 569  00a1 a101          	cp	a,#1
 570  00a3 2606          	jrne	L722
 571                     ; 156         TIM2->CCER1 |= TIM_CCER1_CC1E;
 573  00a5 7210525a      	bset	21082,#0
 575  00a9 2004          	jra	L132
 576  00ab               L722:
 577                     ; 160         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 579  00ab 7211525a      	bres	21082,#0
 580  00af               L132:
 581                     ; 164     if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 583  00af 7b08          	ld	a,(OFST+7,sp)
 584  00b1 a101          	cp	a,#1
 585  00b3 2606          	jrne	L332
 586                     ; 166         TIM2->CCER1 |= TIM_CCER1_CC1P;
 588  00b5 7212525a      	bset	21082,#1
 590  00b9 2004          	jra	L532
 591  00bb               L332:
 592                     ; 170         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 594  00bb 7213525a      	bres	21082,#1
 595  00bf               L532:
 596                     ; 174     if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 598  00bf 7b09          	ld	a,(OFST+8,sp)
 599  00c1 a101          	cp	a,#1
 600  00c3 2606          	jrne	L732
 601                     ; 176         TIM2->OISR |= TIM_OISR_OIS1;
 603  00c5 72105265      	bset	21093,#0
 605  00c9 2004          	jra	L142
 606  00cb               L732:
 607                     ; 180         TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 609  00cb 72115265      	bres	21093,#0
 610  00cf               L142:
 611                     ; 184     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 613  00cf 7b06          	ld	a,(OFST+5,sp)
 614  00d1 c75260        	ld	21088,a
 615                     ; 185     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 617  00d4 7b07          	ld	a,(OFST+6,sp)
 618  00d6 c75261        	ld	21089,a
 619                     ; 186 }
 622  00d9 5b03          	addw	sp,#3
 623  00db 81            	ret
 706                     ; 197 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 706                     ; 198                   TIM2_OutputState_TypeDef TIM2_OutputState,
 706                     ; 199                   uint16_t TIM2_Pulse,
 706                     ; 200                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 706                     ; 201                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 706                     ; 202 {
 707                     	switch	.text
 708  00dc               _TIM2_OC2Init:
 710  00dc 89            	pushw	x
 711  00dd 88            	push	a
 712       00000001      OFST:	set	1
 715                     ; 203     uint8_t tmpccmr2 = 0;
 717                     ; 206     assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 719                     ; 207     assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 721                     ; 208     assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 723                     ; 209     assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 725                     ; 211     tmpccmr2 = TIM2->CCMR2;
 727  00de c65259        	ld	a,21081
 728  00e1 6b01          	ld	(OFST+0,sp),a
 729                     ; 214     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 731  00e3 7219525a      	bres	21082,#4
 732                     ; 217     tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 734  00e7 7b01          	ld	a,(OFST+0,sp)
 735  00e9 a48f          	and	a,#143
 736  00eb 6b01          	ld	(OFST+0,sp),a
 737                     ; 220     tmpccmr2 |= (uint8_t)TIM2_OCMode;
 739  00ed 9e            	ld	a,xh
 740  00ee 1a01          	or	a,(OFST+0,sp)
 741  00f0 6b01          	ld	(OFST+0,sp),a
 742                     ; 222     TIM2->CCMR2 = tmpccmr2;
 744  00f2 7b01          	ld	a,(OFST+0,sp)
 745  00f4 c75259        	ld	21081,a
 746                     ; 225     if (TIM2_OutputState == TIM2_OutputState_Enable)
 748  00f7 9f            	ld	a,xl
 749  00f8 a101          	cp	a,#1
 750  00fa 2606          	jrne	L503
 751                     ; 227         TIM2->CCER1 |= TIM_CCER1_CC2E;
 753  00fc 7218525a      	bset	21082,#4
 755  0100 2004          	jra	L703
 756  0102               L503:
 757                     ; 231         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 759  0102 7219525a      	bres	21082,#4
 760  0106               L703:
 761                     ; 235     if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 763  0106 7b08          	ld	a,(OFST+7,sp)
 764  0108 a101          	cp	a,#1
 765  010a 2606          	jrne	L113
 766                     ; 237         TIM2->CCER1 |= TIM_CCER1_CC2P;
 768  010c 721a525a      	bset	21082,#5
 770  0110 2004          	jra	L313
 771  0112               L113:
 772                     ; 241         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 774  0112 721b525a      	bres	21082,#5
 775  0116               L313:
 776                     ; 246     if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 778  0116 7b09          	ld	a,(OFST+8,sp)
 779  0118 a101          	cp	a,#1
 780  011a 2606          	jrne	L513
 781                     ; 248         TIM2->OISR |= TIM_OISR_OIS2;
 783  011c 72145265      	bset	21093,#2
 785  0120 2004          	jra	L713
 786  0122               L513:
 787                     ; 252         TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 789  0122 72155265      	bres	21093,#2
 790  0126               L713:
 791                     ; 256     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 793  0126 7b06          	ld	a,(OFST+5,sp)
 794  0128 c75262        	ld	21090,a
 795                     ; 257     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 797  012b 7b07          	ld	a,(OFST+6,sp)
 798  012d c75263        	ld	21091,a
 799                     ; 258 }
 802  0130 5b03          	addw	sp,#3
 803  0132 81            	ret
1001                     ; 275 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1001                     ; 276                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1001                     ; 277                     TIM2_BreakState_TypeDef TIM2_BreakState,
1001                     ; 278                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1001                     ; 279                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1001                     ; 280 
1001                     ; 281 {
1002                     	switch	.text
1003  0133               _TIM2_BKRConfig:
1005  0133 89            	pushw	x
1006       00000000      OFST:	set	0
1009                     ; 283     assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1011                     ; 284     assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1013                     ; 285     assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1015                     ; 286     assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1017                     ; 287     assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1019                     ; 294     TIM2->BKR = (uint8_t)((uint8_t)TIM2_OSSIState|(uint8_t)TIM2_LockLevel| \
1019                     ; 295                           (uint8_t)TIM2_BreakState|(uint8_t)TIM2_BreakPolarity|\
1019                     ; 296                           (uint8_t)TIM2_AutomaticOutput);
1021  0134 9f            	ld	a,xl
1022  0135 1a01          	or	a,(OFST+1,sp)
1023  0137 1a05          	or	a,(OFST+5,sp)
1024  0139 1a06          	or	a,(OFST+6,sp)
1025  013b 1a07          	or	a,(OFST+7,sp)
1026  013d c75264        	ld	21092,a
1027                     ; 297 }
1030  0140 85            	popw	x
1031  0141 81            	ret
1215                     ; 308 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1215                     ; 309                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1215                     ; 310                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1215                     ; 311                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1215                     ; 312                  uint8_t TIM2_ICFilter)
1215                     ; 313 {
1216                     	switch	.text
1217  0142               _TIM2_ICInit:
1219  0142 89            	pushw	x
1220       00000000      OFST:	set	0
1223                     ; 315     assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1225                     ; 317     if (TIM2_Channel == TIM2_Channel_1)
1227  0143 9e            	ld	a,xh
1228  0144 4d            	tnz	a
1229  0145 2614          	jrne	L735
1230                     ; 320         TI1_Config(TIM2_ICPolarity,
1230                     ; 321                    TIM2_ICSelection,
1230                     ; 322                    TIM2_ICFilter);
1232  0147 7b07          	ld	a,(OFST+7,sp)
1233  0149 88            	push	a
1234  014a 7b06          	ld	a,(OFST+6,sp)
1235  014c 97            	ld	xl,a
1236  014d 7b03          	ld	a,(OFST+3,sp)
1237  014f 95            	ld	xh,a
1238  0150 cd05ea        	call	L3_TI1_Config
1240  0153 84            	pop	a
1241                     ; 325         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1243  0154 7b06          	ld	a,(OFST+6,sp)
1244  0156 cd04dc        	call	_TIM2_SetIC1Prescaler
1247  0159 2012          	jra	L145
1248  015b               L735:
1249                     ; 330         TI2_Config(TIM2_ICPolarity,
1249                     ; 331                    TIM2_ICSelection,
1249                     ; 332                    TIM2_ICFilter);
1251  015b 7b07          	ld	a,(OFST+7,sp)
1252  015d 88            	push	a
1253  015e 7b06          	ld	a,(OFST+6,sp)
1254  0160 97            	ld	xl,a
1255  0161 7b03          	ld	a,(OFST+3,sp)
1256  0163 95            	ld	xh,a
1257  0164 cd0627        	call	L5_TI2_Config
1259  0167 84            	pop	a
1260                     ; 334         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1262  0168 7b06          	ld	a,(OFST+6,sp)
1263  016a cd04f6        	call	_TIM2_SetIC2Prescaler
1265  016d               L145:
1266                     ; 336 }
1269  016d 85            	popw	x
1270  016e 81            	ret
1366                     ; 348 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1366                     ; 349                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1366                     ; 350                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1366                     ; 351                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1366                     ; 352                      uint8_t TIM2_ICFilter)
1366                     ; 353 {
1367                     	switch	.text
1368  016f               _TIM2_PWMIConfig:
1370  016f 89            	pushw	x
1371  0170 89            	pushw	x
1372       00000002      OFST:	set	2
1375                     ; 354     uint8_t icpolarity = TIM2_ICPolarity_Rising;
1377                     ; 355     uint8_t icselection = TIM2_ICSelection_DirectTI;
1379                     ; 358     assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1381                     ; 361     if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
1383  0171 9f            	ld	a,xl
1384  0172 4d            	tnz	a
1385  0173 2606          	jrne	L116
1386                     ; 363         icpolarity = TIM2_ICPolarity_Falling;
1388  0175 a601          	ld	a,#1
1389  0177 6b01          	ld	(OFST-1,sp),a
1391  0179 2002          	jra	L316
1392  017b               L116:
1393                     ; 367         icpolarity = TIM2_ICPolarity_Rising;
1395  017b 0f01          	clr	(OFST-1,sp)
1396  017d               L316:
1397                     ; 371     if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
1399  017d 7b07          	ld	a,(OFST+5,sp)
1400  017f a101          	cp	a,#1
1401  0181 2606          	jrne	L516
1402                     ; 373         icselection = TIM2_ICSelection_IndirectTI;
1404  0183 a602          	ld	a,#2
1405  0185 6b02          	ld	(OFST+0,sp),a
1407  0187 2004          	jra	L716
1408  0189               L516:
1409                     ; 377         icselection = TIM2_ICSelection_DirectTI;
1411  0189 a601          	ld	a,#1
1412  018b 6b02          	ld	(OFST+0,sp),a
1413  018d               L716:
1414                     ; 380     if (TIM2_Channel == TIM2_Channel_1)
1416  018d 0d03          	tnz	(OFST+1,sp)
1417  018f 2626          	jrne	L126
1418                     ; 383         TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1418                     ; 384                    TIM2_ICFilter);
1420  0191 7b09          	ld	a,(OFST+7,sp)
1421  0193 88            	push	a
1422  0194 7b08          	ld	a,(OFST+6,sp)
1423  0196 97            	ld	xl,a
1424  0197 7b05          	ld	a,(OFST+3,sp)
1425  0199 95            	ld	xh,a
1426  019a cd05ea        	call	L3_TI1_Config
1428  019d 84            	pop	a
1429                     ; 387         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1431  019e 7b08          	ld	a,(OFST+6,sp)
1432  01a0 cd04dc        	call	_TIM2_SetIC1Prescaler
1434                     ; 390         TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1436  01a3 7b09          	ld	a,(OFST+7,sp)
1437  01a5 88            	push	a
1438  01a6 7b03          	ld	a,(OFST+1,sp)
1439  01a8 97            	ld	xl,a
1440  01a9 7b02          	ld	a,(OFST+0,sp)
1441  01ab 95            	ld	xh,a
1442  01ac cd0627        	call	L5_TI2_Config
1444  01af 84            	pop	a
1445                     ; 393         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1447  01b0 7b08          	ld	a,(OFST+6,sp)
1448  01b2 cd04f6        	call	_TIM2_SetIC2Prescaler
1451  01b5 2024          	jra	L326
1452  01b7               L126:
1453                     ; 398         TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1453                     ; 399                    TIM2_ICFilter);
1455  01b7 7b09          	ld	a,(OFST+7,sp)
1456  01b9 88            	push	a
1457  01ba 7b08          	ld	a,(OFST+6,sp)
1458  01bc 97            	ld	xl,a
1459  01bd 7b05          	ld	a,(OFST+3,sp)
1460  01bf 95            	ld	xh,a
1461  01c0 cd0627        	call	L5_TI2_Config
1463  01c3 84            	pop	a
1464                     ; 402         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1466  01c4 7b08          	ld	a,(OFST+6,sp)
1467  01c6 cd04f6        	call	_TIM2_SetIC2Prescaler
1469                     ; 405         TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1471  01c9 7b09          	ld	a,(OFST+7,sp)
1472  01cb 88            	push	a
1473  01cc 7b03          	ld	a,(OFST+1,sp)
1474  01ce 97            	ld	xl,a
1475  01cf 7b02          	ld	a,(OFST+0,sp)
1476  01d1 95            	ld	xh,a
1477  01d2 cd05ea        	call	L3_TI1_Config
1479  01d5 84            	pop	a
1480                     ; 408         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1482  01d6 7b08          	ld	a,(OFST+6,sp)
1483  01d8 cd04dc        	call	_TIM2_SetIC1Prescaler
1485  01db               L326:
1486                     ; 410 }
1489  01db 5b04          	addw	sp,#4
1490  01dd 81            	ret
1545                     ; 418 void TIM2_Cmd(FunctionalState NewState)
1545                     ; 419 {
1546                     	switch	.text
1547  01de               _TIM2_Cmd:
1551                     ; 421     assert_param(IS_FUNCTIONAL_STATE(NewState));
1553                     ; 424     if (NewState != DISABLE)
1555  01de 4d            	tnz	a
1556  01df 2706          	jreq	L356
1557                     ; 426         TIM2->CR1 |= TIM_CR1_CEN;
1559  01e1 72105250      	bset	21072,#0
1561  01e5 2004          	jra	L556
1562  01e7               L356:
1563                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1565  01e7 72115250      	bres	21072,#0
1566  01eb               L556:
1567                     ; 432 }
1570  01eb 81            	ret
1606                     ; 440 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1606                     ; 441 {
1607                     	switch	.text
1608  01ec               _TIM2_CtrlPWMOutputs:
1612                     ; 443     assert_param(IS_FUNCTIONAL_STATE(NewState));
1614                     ; 447     if (NewState != DISABLE)
1616  01ec 4d            	tnz	a
1617  01ed 2706          	jreq	L576
1618                     ; 449         TIM2->BKR |= TIM_BKR_MOE ;
1620  01ef 721e5264      	bset	21092,#7
1622  01f3 2004          	jra	L776
1623  01f5               L576:
1624                     ; 453         TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1626  01f5 721f5264      	bres	21092,#7
1627  01f9               L776:
1628                     ; 455 }
1631  01f9 81            	ret
1717                     ; 465 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1717                     ; 466 {
1718                     	switch	.text
1719  01fa               _TIM2_ITConfig:
1721  01fa 89            	pushw	x
1722       00000000      OFST:	set	0
1725                     ; 468     assert_param(IS_TIM2_IT(TIM2_IT));
1727                     ; 469     assert_param(IS_FUNCTIONAL_STATE(NewState));
1729                     ; 471     if (NewState != DISABLE)
1731  01fb 9f            	ld	a,xl
1732  01fc 4d            	tnz	a
1733  01fd 2709          	jreq	L147
1734                     ; 474         TIM2->IER |= (uint8_t)TIM2_IT;
1736  01ff 9e            	ld	a,xh
1737  0200 ca5254        	or	a,21076
1738  0203 c75254        	ld	21076,a
1740  0206 2009          	jra	L347
1741  0208               L147:
1742                     ; 479         TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
1744  0208 7b01          	ld	a,(OFST+1,sp)
1745  020a 43            	cpl	a
1746  020b c45254        	and	a,21076
1747  020e c75254        	ld	21076,a
1748  0211               L347:
1749                     ; 481 }
1752  0211 85            	popw	x
1753  0212 81            	ret
1777                     ; 489 void TIM2_InternalClockConfig(void)
1777                     ; 490 {
1778                     	switch	.text
1779  0213               _TIM2_InternalClockConfig:
1783                     ; 492     TIM2->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
1785  0213 c65252        	ld	a,21074
1786  0216 a4f8          	and	a,#248
1787  0218 c75252        	ld	21074,a
1788                     ; 493 }
1791  021b 81            	ret
1908                     ; 505 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
1908                     ; 506                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
1908                     ; 507                               uint8_t TIM2_ExtTRGFilter)
1908                     ; 508 {
1909                     	switch	.text
1910  021c               _TIM2_ETRClockMode1Config:
1912  021c 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 510     TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
1918  021d 7b05          	ld	a,(OFST+5,sp)
1919  021f 88            	push	a
1920  0220 9f            	ld	a,xl
1921  0221 97            	ld	xl,a
1922  0222 7b02          	ld	a,(OFST+2,sp)
1923  0224 95            	ld	xh,a
1924  0225 ad35          	call	_TIM2_ETRConfig
1926  0227 84            	pop	a
1927                     ; 513     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1929  0228 c65252        	ld	a,21074
1930  022b a4f8          	and	a,#248
1931  022d c75252        	ld	21074,a
1932                     ; 514     TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
1934  0230 c65252        	ld	a,21074
1935  0233 aa07          	or	a,#7
1936  0235 c75252        	ld	21074,a
1937                     ; 517     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1939  0238 c65252        	ld	a,21074
1940  023b a48f          	and	a,#143
1941  023d c75252        	ld	21074,a
1942                     ; 518     TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
1944  0240 c65252        	ld	a,21074
1945  0243 aa70          	or	a,#112
1946  0245 c75252        	ld	21074,a
1947                     ; 519 }
1950  0248 85            	popw	x
1951  0249 81            	ret
2009                     ; 531 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2009                     ; 532                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2009                     ; 533                               uint8_t TIM2_ExtTRGFilter)
2009                     ; 534 {
2010                     	switch	.text
2011  024a               _TIM2_ETRClockMode2Config:
2013  024a 89            	pushw	x
2014       00000000      OFST:	set	0
2017                     ; 536     TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
2019  024b 7b05          	ld	a,(OFST+5,sp)
2020  024d 88            	push	a
2021  024e 9f            	ld	a,xl
2022  024f 97            	ld	xl,a
2023  0250 7b02          	ld	a,(OFST+2,sp)
2024  0252 95            	ld	xh,a
2025  0253 ad07          	call	_TIM2_ETRConfig
2027  0255 84            	pop	a
2028                     ; 539     TIM2->ETR |= TIM_ETR_ECE ;
2030  0256 721c5253      	bset	21075,#6
2031                     ; 540 }
2034  025a 85            	popw	x
2035  025b 81            	ret
2091                     ; 552 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2091                     ; 553                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2091                     ; 554                     uint8_t TIM2_ExtTRGFilter)
2091                     ; 555 {
2092                     	switch	.text
2093  025c               _TIM2_ETRConfig:
2095  025c 89            	pushw	x
2096       00000000      OFST:	set	0
2099                     ; 557     assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
2101                     ; 558     assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
2103                     ; 559     assert_param(IS_TIM2_EXT_FILTER(TIM2_ExtTRGFilter));
2105                     ; 561     TIM2->ETR |= (uint8_t)((uint8_t)TIM2_ExtTRGPrescaler|(uint8_t)TIM2_ExtTRGPolarity|(uint8_t)TIM2_ExtTRGFilter);
2107  025d 9f            	ld	a,xl
2108  025e 1a01          	or	a,(OFST+1,sp)
2109  0260 1a05          	or	a,(OFST+5,sp)
2110  0262 ca5253        	or	a,21075
2111  0265 c75253        	ld	21075,a
2112                     ; 562 }
2115  0268 85            	popw	x
2116  0269 81            	ret
2205                     ; 574 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
2205                     ; 575                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2205                     ; 576                                  uint8_t TIM2_ICFilter)
2205                     ; 577 {
2206                     	switch	.text
2207  026a               _TIM2_TIxExternalClockConfig:
2209  026a 89            	pushw	x
2210       00000000      OFST:	set	0
2213                     ; 579     assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
2215                     ; 580     assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
2217                     ; 581     assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
2219                     ; 584     if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
2221  026b 9e            	ld	a,xh
2222  026c a160          	cp	a,#96
2223  026e 260f          	jrne	L3411
2224                     ; 586         TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2226  0270 7b05          	ld	a,(OFST+5,sp)
2227  0272 88            	push	a
2228  0273 ae0001        	ldw	x,#1
2229  0276 7b03          	ld	a,(OFST+3,sp)
2230  0278 95            	ld	xh,a
2231  0279 cd0627        	call	L5_TI2_Config
2233  027c 84            	pop	a
2235  027d 200d          	jra	L5411
2236  027f               L3411:
2237                     ; 590         TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2239  027f 7b05          	ld	a,(OFST+5,sp)
2240  0281 88            	push	a
2241  0282 ae0001        	ldw	x,#1
2242  0285 7b03          	ld	a,(OFST+3,sp)
2243  0287 95            	ld	xh,a
2244  0288 cd05ea        	call	L3_TI1_Config
2246  028b 84            	pop	a
2247  028c               L5411:
2248                     ; 594     TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
2250  028c 7b01          	ld	a,(OFST+1,sp)
2251  028e ad0a          	call	_TIM2_SelectInputTrigger
2253                     ; 597     TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2255  0290 c65252        	ld	a,21074
2256  0293 aa07          	or	a,#7
2257  0295 c75252        	ld	21074,a
2258                     ; 598 }
2261  0298 85            	popw	x
2262  0299 81            	ret
2362                     ; 606 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
2362                     ; 607 {
2363                     	switch	.text
2364  029a               _TIM2_SelectInputTrigger:
2366  029a 88            	push	a
2367  029b 88            	push	a
2368       00000001      OFST:	set	1
2371                     ; 608     uint8_t tmpsmcr = 0;
2373                     ; 611     assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
2375                     ; 613     tmpsmcr = TIM2->SMCR;
2377  029c c65252        	ld	a,21074
2378  029f 6b01          	ld	(OFST+0,sp),a
2379                     ; 616     tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2381  02a1 7b01          	ld	a,(OFST+0,sp)
2382  02a3 a48f          	and	a,#143
2383  02a5 6b01          	ld	(OFST+0,sp),a
2384                     ; 617     tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
2386  02a7 7b01          	ld	a,(OFST+0,sp)
2387  02a9 1a02          	or	a,(OFST+1,sp)
2388  02ab 6b01          	ld	(OFST+0,sp),a
2389                     ; 619     TIM2->SMCR = (uint8_t)tmpsmcr;
2391  02ad 7b01          	ld	a,(OFST+0,sp)
2392  02af c75252        	ld	21074,a
2393                     ; 620 }
2396  02b2 85            	popw	x
2397  02b3 81            	ret
2433                     ; 628 void TIM2_UpdateDisableConfig(FunctionalState NewState)
2433                     ; 629 {
2434                     	switch	.text
2435  02b4               _TIM2_UpdateDisableConfig:
2439                     ; 631     assert_param(IS_FUNCTIONAL_STATE(NewState));
2441                     ; 634     if (NewState != DISABLE)
2443  02b4 4d            	tnz	a
2444  02b5 2706          	jreq	L7221
2445                     ; 636         TIM2->CR1 |= TIM_CR1_UDIS;
2447  02b7 72125250      	bset	21072,#1
2449  02bb 2004          	jra	L1321
2450  02bd               L7221:
2451                     ; 640         TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2453  02bd 72135250      	bres	21072,#1
2454  02c1               L1321:
2455                     ; 642 }
2458  02c1 81            	ret
2516                     ; 650 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2516                     ; 651 {
2517                     	switch	.text
2518  02c2               _TIM2_UpdateRequestConfig:
2522                     ; 653     assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
2524                     ; 656     if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
2526  02c2 a101          	cp	a,#1
2527  02c4 2606          	jrne	L1621
2528                     ; 658         TIM2->CR1 |= TIM_CR1_URS ;
2530  02c6 72145250      	bset	21072,#2
2532  02ca 2004          	jra	L3621
2533  02cc               L1621:
2534                     ; 662         TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
2536  02cc 72155250      	bres	21072,#2
2537  02d0               L3621:
2538                     ; 664 }
2541  02d0 81            	ret
2577                     ; 672 void TIM2_SelectHallSensor(FunctionalState NewState)
2577                     ; 673 {
2578                     	switch	.text
2579  02d1               _TIM2_SelectHallSensor:
2583                     ; 675     assert_param(IS_FUNCTIONAL_STATE(NewState));
2585                     ; 678     if (NewState != DISABLE)
2587  02d1 4d            	tnz	a
2588  02d2 2706          	jreq	L3031
2589                     ; 680         TIM2->CR2 |= TIM_CR2_TI1S;
2591  02d4 721e5251      	bset	21073,#7
2593  02d8 2004          	jra	L5031
2594  02da               L3031:
2595                     ; 684         TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2597  02da 721f5251      	bres	21073,#7
2598  02de               L5031:
2599                     ; 686 }
2602  02de 81            	ret
2659                     ; 694 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2659                     ; 695 {
2660                     	switch	.text
2661  02df               _TIM2_SelectOnePulseMode:
2665                     ; 697     assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
2667                     ; 700     if (TIM2_OPMode == TIM2_OPMode_Single)
2669  02df a101          	cp	a,#1
2670  02e1 2606          	jrne	L5331
2671                     ; 702         TIM2->CR1 |= TIM_CR1_OPM ;
2673  02e3 72165250      	bset	21072,#3
2675  02e7 2004          	jra	L7331
2676  02e9               L5331:
2677                     ; 706         TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2679  02e9 72175250      	bres	21072,#3
2680  02ed               L7331:
2681                     ; 708 }
2684  02ed 81            	ret
2783                     ; 716 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
2783                     ; 717 {
2784                     	switch	.text
2785  02ee               _TIM2_SelectOutputTrigger:
2787  02ee 88            	push	a
2788  02ef 88            	push	a
2789       00000001      OFST:	set	1
2792                     ; 718     uint8_t tmpcr2 = 0;
2794                     ; 721     assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
2796                     ; 723     tmpcr2 = TIM2->CR2;
2798  02f0 c65251        	ld	a,21073
2799  02f3 6b01          	ld	(OFST+0,sp),a
2800                     ; 726     tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2802  02f5 7b01          	ld	a,(OFST+0,sp)
2803  02f7 a48f          	and	a,#143
2804  02f9 6b01          	ld	(OFST+0,sp),a
2805                     ; 729     tmpcr2 |=  (uint8_t)TIM2_TRGOSource;
2807  02fb 7b01          	ld	a,(OFST+0,sp)
2808  02fd 1a02          	or	a,(OFST+1,sp)
2809  02ff 6b01          	ld	(OFST+0,sp),a
2810                     ; 731     TIM2->CR2 = tmpcr2;
2812  0301 7b01          	ld	a,(OFST+0,sp)
2813  0303 c75251        	ld	21073,a
2814                     ; 732 }
2817  0306 85            	popw	x
2818  0307 81            	ret
2901                     ; 740 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
2901                     ; 741 {
2902                     	switch	.text
2903  0308               _TIM2_SelectSlaveMode:
2905  0308 88            	push	a
2906  0309 88            	push	a
2907       00000001      OFST:	set	1
2910                     ; 742     uint8_t tmpsmcr = 0;
2912                     ; 745     assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
2914                     ; 747     tmpsmcr = TIM2->SMCR;
2916  030a c65252        	ld	a,21074
2917  030d 6b01          	ld	(OFST+0,sp),a
2918                     ; 750     tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2920  030f 7b01          	ld	a,(OFST+0,sp)
2921  0311 a4f8          	and	a,#248
2922  0313 6b01          	ld	(OFST+0,sp),a
2923                     ; 753     tmpsmcr |= (uint8_t)TIM2_SlaveMode;
2925  0315 7b01          	ld	a,(OFST+0,sp)
2926  0317 1a02          	or	a,(OFST+1,sp)
2927  0319 6b01          	ld	(OFST+0,sp),a
2928                     ; 755     TIM2->SMCR = tmpsmcr;
2930  031b 7b01          	ld	a,(OFST+0,sp)
2931  031d c75252        	ld	21074,a
2932                     ; 756 }
2935  0320 85            	popw	x
2936  0321 81            	ret
2972                     ; 764 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
2972                     ; 765 {
2973                     	switch	.text
2974  0322               _TIM2_SelectMasterSlaveMode:
2978                     ; 767     assert_param(IS_FUNCTIONAL_STATE(NewState));
2980                     ; 770     if (NewState != DISABLE)
2982  0322 4d            	tnz	a
2983  0323 2706          	jreq	L7541
2984                     ; 772         TIM2->SMCR |= TIM_SMCR_MSM;
2986  0325 721e5252      	bset	21074,#7
2988  0329 2004          	jra	L1641
2989  032b               L7541:
2990                     ; 776         TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2992  032b 721f5252      	bres	21074,#7
2993  032f               L1641:
2994                     ; 778 }
2997  032f 81            	ret
3110                     ; 790 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
3110                     ; 791                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
3110                     ; 792                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
3110                     ; 793 {
3111                     	switch	.text
3112  0330               _TIM2_EncoderInterfaceConfig:
3114  0330 89            	pushw	x
3115  0331 5203          	subw	sp,#3
3116       00000003      OFST:	set	3
3119                     ; 794     uint8_t tmpsmcr = 0;
3121                     ; 795     uint8_t tmpccmr1 = 0;
3123                     ; 796     uint8_t tmpccmr2 = 0;
3125                     ; 799     assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
3127                     ; 800     assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
3129                     ; 801     assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
3131                     ; 803     tmpsmcr = TIM2->SMCR;
3133  0333 c65252        	ld	a,21074
3134  0336 6b01          	ld	(OFST-2,sp),a
3135                     ; 804     tmpccmr1 = TIM2->CCMR1;
3137  0338 c65258        	ld	a,21080
3138  033b 6b02          	ld	(OFST-1,sp),a
3139                     ; 805     tmpccmr2 = TIM2->CCMR2;
3141  033d c65259        	ld	a,21081
3142  0340 6b03          	ld	(OFST+0,sp),a
3143                     ; 808     tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3145  0342 7b01          	ld	a,(OFST-2,sp)
3146  0344 a4f0          	and	a,#240
3147  0346 6b01          	ld	(OFST-2,sp),a
3148                     ; 809     tmpsmcr |= (uint8_t)TIM2_EncoderMode;
3150  0348 9e            	ld	a,xh
3151  0349 1a01          	or	a,(OFST-2,sp)
3152  034b 6b01          	ld	(OFST-2,sp),a
3153                     ; 812     tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3155  034d 7b02          	ld	a,(OFST-1,sp)
3156  034f a4fc          	and	a,#252
3157  0351 6b02          	ld	(OFST-1,sp),a
3158                     ; 813     tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3160  0353 7b03          	ld	a,(OFST+0,sp)
3161  0355 a4fc          	and	a,#252
3162  0357 6b03          	ld	(OFST+0,sp),a
3163                     ; 814     tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3165  0359 7b02          	ld	a,(OFST-1,sp)
3166  035b aa01          	or	a,#1
3167  035d 6b02          	ld	(OFST-1,sp),a
3168                     ; 815     tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3170  035f 7b03          	ld	a,(OFST+0,sp)
3171  0361 aa01          	or	a,#1
3172  0363 6b03          	ld	(OFST+0,sp),a
3173                     ; 818     if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
3175  0365 9f            	ld	a,xl
3176  0366 a101          	cp	a,#1
3177  0368 2606          	jrne	L7351
3178                     ; 820         TIM2->CCER1 |= TIM_CCER1_CC1P ;
3180  036a 7212525a      	bset	21082,#1
3182  036e 2004          	jra	L1451
3183  0370               L7351:
3184                     ; 824         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3186  0370 7213525a      	bres	21082,#1
3187  0374               L1451:
3188                     ; 827     if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
3190  0374 7b08          	ld	a,(OFST+5,sp)
3191  0376 a101          	cp	a,#1
3192  0378 2606          	jrne	L3451
3193                     ; 829         TIM2->CCER1 |= TIM_CCER1_CC2P ;
3195  037a 721a525a      	bset	21082,#5
3197  037e 2004          	jra	L5451
3198  0380               L3451:
3199                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3201  0380 721b525a      	bres	21082,#5
3202  0384               L5451:
3203                     ; 836     TIM2->SMCR = tmpsmcr;
3205  0384 7b01          	ld	a,(OFST-2,sp)
3206  0386 c75252        	ld	21074,a
3207                     ; 837     TIM2->CCMR1 = tmpccmr1;
3209  0389 7b02          	ld	a,(OFST-1,sp)
3210  038b c75258        	ld	21080,a
3211                     ; 838     TIM2->CCMR2 = tmpccmr2;
3213  038e 7b03          	ld	a,(OFST+0,sp)
3214  0390 c75259        	ld	21081,a
3215                     ; 839 }
3218  0393 5b05          	addw	sp,#5
3219  0395 81            	ret
3287                     ; 849 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef TIM2_Prescaler,
3287                     ; 850                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
3287                     ; 851 {
3288                     	switch	.text
3289  0396               _TIM2_PrescalerConfig:
3293                     ; 853     assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
3295                     ; 854     assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
3297                     ; 857     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
3299  0396 9e            	ld	a,xh
3300  0397 c7525d        	ld	21085,a
3301                     ; 860     if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
3303  039a 9f            	ld	a,xl
3304  039b a101          	cp	a,#1
3305  039d 2606          	jrne	L1061
3306                     ; 862         TIM2->EGR |= TIM_EGR_UG ;
3308  039f 72105257      	bset	21079,#0
3310  03a3 2004          	jra	L3061
3311  03a5               L1061:
3312                     ; 866         TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3314  03a5 72115257      	bres	21079,#0
3315  03a9               L3061:
3316                     ; 868 }
3319  03a9 81            	ret
3364                     ; 876 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
3364                     ; 877 {
3365                     	switch	.text
3366  03aa               _TIM2_CounterModeConfig:
3368  03aa 88            	push	a
3369  03ab 88            	push	a
3370       00000001      OFST:	set	1
3373                     ; 878     uint8_t tmpcr1 = 0;
3375                     ; 881     assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
3377                     ; 883     tmpcr1 = TIM2->CR1;
3379  03ac c65250        	ld	a,21072
3380  03af 6b01          	ld	(OFST+0,sp),a
3381                     ; 886     tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3383  03b1 7b01          	ld	a,(OFST+0,sp)
3384  03b3 a48f          	and	a,#143
3385  03b5 6b01          	ld	(OFST+0,sp),a
3386                     ; 889     tmpcr1 |= (uint8_t)TIM2_CounterMode;
3388  03b7 7b01          	ld	a,(OFST+0,sp)
3389  03b9 1a02          	or	a,(OFST+1,sp)
3390  03bb 6b01          	ld	(OFST+0,sp),a
3391                     ; 891     TIM2->CR1 = tmpcr1;
3393  03bd 7b01          	ld	a,(OFST+0,sp)
3394  03bf c75250        	ld	21072,a
3395                     ; 892 }
3398  03c2 85            	popw	x
3399  03c3 81            	ret
3466                     ; 900 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3466                     ; 901 {
3467                     	switch	.text
3468  03c4               _TIM2_ForcedOC1Config:
3470  03c4 88            	push	a
3471  03c5 88            	push	a
3472       00000001      OFST:	set	1
3475                     ; 902     uint8_t tmpccmr1 = 0;
3477                     ; 905     assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3479                     ; 907     tmpccmr1 = TIM2->CCMR1;
3481  03c6 c65258        	ld	a,21080
3482  03c9 6b01          	ld	(OFST+0,sp),a
3483                     ; 910     tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3485  03cb 7b01          	ld	a,(OFST+0,sp)
3486  03cd a48f          	and	a,#143
3487  03cf 6b01          	ld	(OFST+0,sp),a
3488                     ; 913     tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
3490  03d1 7b01          	ld	a,(OFST+0,sp)
3491  03d3 1a02          	or	a,(OFST+1,sp)
3492  03d5 6b01          	ld	(OFST+0,sp),a
3493                     ; 915     TIM2->CCMR1 = tmpccmr1;
3495  03d7 7b01          	ld	a,(OFST+0,sp)
3496  03d9 c75258        	ld	21080,a
3497                     ; 916 }
3500  03dc 85            	popw	x
3501  03dd 81            	ret
3546                     ; 924 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3546                     ; 925 {
3547                     	switch	.text
3548  03de               _TIM2_ForcedOC2Config:
3550  03de 88            	push	a
3551  03df 88            	push	a
3552       00000001      OFST:	set	1
3555                     ; 926     uint8_t tmpccmr2 = 0;
3557                     ; 929     assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3559                     ; 931     tmpccmr2 = TIM2->CCMR2;
3561  03e0 c65259        	ld	a,21081
3562  03e3 6b01          	ld	(OFST+0,sp),a
3563                     ; 934     tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3565  03e5 7b01          	ld	a,(OFST+0,sp)
3566  03e7 a48f          	and	a,#143
3567  03e9 6b01          	ld	(OFST+0,sp),a
3568                     ; 937     tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
3570  03eb 7b01          	ld	a,(OFST+0,sp)
3571  03ed 1a02          	or	a,(OFST+1,sp)
3572  03ef 6b01          	ld	(OFST+0,sp),a
3573                     ; 939     TIM2->CCMR2 = tmpccmr2;
3575  03f1 7b01          	ld	a,(OFST+0,sp)
3576  03f3 c75259        	ld	21081,a
3577                     ; 940 }
3580  03f6 85            	popw	x
3581  03f7 81            	ret
3617                     ; 948 void TIM2_ARRPreloadConfig(FunctionalState NewState)
3617                     ; 949 {
3618                     	switch	.text
3619  03f8               _TIM2_ARRPreloadConfig:
3623                     ; 951     assert_param(IS_FUNCTIONAL_STATE(NewState));
3625                     ; 954     if (NewState != DISABLE)
3627  03f8 4d            	tnz	a
3628  03f9 2706          	jreq	L1271
3629                     ; 956         TIM2->CR1 |= TIM_CR1_ARPE;
3631  03fb 721e5250      	bset	21072,#7
3633  03ff 2004          	jra	L3271
3634  0401               L1271:
3635                     ; 960         TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3637  0401 721f5250      	bres	21072,#7
3638  0405               L3271:
3639                     ; 962 }
3642  0405 81            	ret
3678                     ; 970 void TIM2_OC1PreloadConfig(FunctionalState NewState)
3678                     ; 971 {
3679                     	switch	.text
3680  0406               _TIM2_OC1PreloadConfig:
3684                     ; 973     assert_param(IS_FUNCTIONAL_STATE(NewState));
3686                     ; 976     if (NewState != DISABLE)
3688  0406 4d            	tnz	a
3689  0407 2706          	jreq	L3471
3690                     ; 978         TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
3692  0409 72165258      	bset	21080,#3
3694  040d 2004          	jra	L5471
3695  040f               L3471:
3696                     ; 982         TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3698  040f 72175258      	bres	21080,#3
3699  0413               L5471:
3700                     ; 984 }
3703  0413 81            	ret
3739                     ; 992 void TIM2_OC2PreloadConfig(FunctionalState NewState)
3739                     ; 993 {
3740                     	switch	.text
3741  0414               _TIM2_OC2PreloadConfig:
3745                     ; 995     assert_param(IS_FUNCTIONAL_STATE(NewState));
3747                     ; 998     if (NewState != DISABLE)
3749  0414 4d            	tnz	a
3750  0415 2706          	jreq	L5671
3751                     ; 1000         TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
3753  0417 72165259      	bset	21081,#3
3755  041b 2004          	jra	L7671
3756  041d               L5671:
3757                     ; 1004         TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3759  041d 72175259      	bres	21081,#3
3760  0421               L7671:
3761                     ; 1006 }
3764  0421 81            	ret
3799                     ; 1014 void TIM2_OC1FastCmd(FunctionalState NewState)
3799                     ; 1015 {
3800                     	switch	.text
3801  0422               _TIM2_OC1FastCmd:
3805                     ; 1017     assert_param(IS_FUNCTIONAL_STATE(NewState));
3807                     ; 1020     if (NewState != DISABLE)
3809  0422 4d            	tnz	a
3810  0423 2706          	jreq	L7002
3811                     ; 1022         TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
3813  0425 72145258      	bset	21080,#2
3815  0429 2004          	jra	L1102
3816  042b               L7002:
3817                     ; 1026         TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3819  042b 72155258      	bres	21080,#2
3820  042f               L1102:
3821                     ; 1028 }
3824  042f 81            	ret
3859                     ; 1036 void TIM2_OC2FastCmd(FunctionalState NewState)
3859                     ; 1037 {
3860                     	switch	.text
3861  0430               _TIM2_OC2FastCmd:
3865                     ; 1039     assert_param(IS_FUNCTIONAL_STATE(NewState));
3867                     ; 1042     if (NewState != DISABLE)
3869  0430 4d            	tnz	a
3870  0431 2706          	jreq	L1302
3871                     ; 1044         TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
3873  0433 72145259      	bset	21081,#2
3875  0437 2004          	jra	L3302
3876  0439               L1302:
3877                     ; 1048         TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3879  0439 72155259      	bres	21081,#2
3880  043d               L3302:
3881                     ; 1050 }
3884  043d 81            	ret
3965                     ; 1058 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3965                     ; 1059 {
3966                     	switch	.text
3967  043e               _TIM2_GenerateEvent:
3971                     ; 1061     assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3973                     ; 1064     TIM2->EGR |= (uint8_t)TIM2_EventSource;
3975  043e ca5257        	or	a,21079
3976  0441 c75257        	ld	21079,a
3977                     ; 1065 }
3980  0444 81            	ret
4016                     ; 1073 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4016                     ; 1074 {
4017                     	switch	.text
4018  0445               _TIM2_OC1PolarityConfig:
4022                     ; 1076     assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4024                     ; 1079     if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4026  0445 a101          	cp	a,#1
4027  0447 2606          	jrne	L7012
4028                     ; 1081         TIM2->CCER1 |= TIM_CCER1_CC1P ;
4030  0449 7212525a      	bset	21082,#1
4032  044d 2004          	jra	L1112
4033  044f               L7012:
4034                     ; 1085         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4036  044f 7213525a      	bres	21082,#1
4037  0453               L1112:
4038                     ; 1087 }
4041  0453 81            	ret
4077                     ; 1095 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4077                     ; 1096 {
4078                     	switch	.text
4079  0454               _TIM2_OC2PolarityConfig:
4083                     ; 1098     assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4085                     ; 1101     if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4087  0454 a101          	cp	a,#1
4088  0456 2606          	jrne	L1312
4089                     ; 1103         TIM2->CCER1 |= TIM_CCER1_CC2P ;
4091  0458 721a525a      	bset	21082,#5
4093  045c 2004          	jra	L3312
4094  045e               L1312:
4095                     ; 1107         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4097  045e 721b525a      	bres	21082,#5
4098  0462               L3312:
4099                     ; 1109 }
4102  0462 81            	ret
4147                     ; 1119 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
4147                     ; 1120                  FunctionalState NewState)
4147                     ; 1121 {
4148                     	switch	.text
4149  0463               _TIM2_CCxCmd:
4151  0463 89            	pushw	x
4152       00000000      OFST:	set	0
4155                     ; 1123     assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4157                     ; 1124     assert_param(IS_FUNCTIONAL_STATE(NewState));
4159                     ; 1126     if (TIM2_Channel == TIM2_Channel_1)
4161  0464 9e            	ld	a,xh
4162  0465 4d            	tnz	a
4163  0466 2610          	jrne	L7512
4164                     ; 1129         if (NewState != DISABLE)
4166  0468 9f            	ld	a,xl
4167  0469 4d            	tnz	a
4168  046a 2706          	jreq	L1612
4169                     ; 1131             TIM2->CCER1 |= TIM_CCER1_CC1E ;
4171  046c 7210525a      	bset	21082,#0
4173  0470 2014          	jra	L5612
4174  0472               L1612:
4175                     ; 1135             TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4177  0472 7211525a      	bres	21082,#0
4178  0476 200e          	jra	L5612
4179  0478               L7512:
4180                     ; 1142         if (NewState != DISABLE)
4182  0478 0d02          	tnz	(OFST+2,sp)
4183  047a 2706          	jreq	L7612
4184                     ; 1144             TIM2->CCER1 |= TIM_CCER1_CC2E;
4186  047c 7218525a      	bset	21082,#4
4188  0480 2004          	jra	L5612
4189  0482               L7612:
4190                     ; 1148             TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4192  0482 7219525a      	bres	21082,#4
4193  0486               L5612:
4194                     ; 1152 }
4197  0486 85            	popw	x
4198  0487 81            	ret
4243                     ; 1164 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
4243                     ; 1165                      TIM2_OCMode_TypeDef TIM2_OCMode)
4243                     ; 1166 {
4244                     	switch	.text
4245  0488               _TIM2_SelectOCxM:
4247  0488 89            	pushw	x
4248       00000000      OFST:	set	0
4251                     ; 1168     assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4253                     ; 1169     assert_param(IS_TIM2_OCM(TIM2_OCMode));
4255                     ; 1171     if (TIM2_Channel == TIM2_Channel_1)
4257  0489 9e            	ld	a,xh
4258  048a 4d            	tnz	a
4259  048b 2615          	jrne	L5122
4260                     ; 1174         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4262  048d 7211525a      	bres	21082,#0
4263                     ; 1177         TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4265  0491 c65258        	ld	a,21080
4266  0494 a48f          	and	a,#143
4267  0496 c75258        	ld	21080,a
4268                     ; 1180         TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
4270  0499 9f            	ld	a,xl
4271  049a ca5258        	or	a,21080
4272  049d c75258        	ld	21080,a
4274  04a0 2014          	jra	L7122
4275  04a2               L5122:
4276                     ; 1185         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4278  04a2 7219525a      	bres	21082,#4
4279                     ; 1188         TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4281  04a6 c65259        	ld	a,21081
4282  04a9 a48f          	and	a,#143
4283  04ab c75259        	ld	21081,a
4284                     ; 1191         TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
4286  04ae c65259        	ld	a,21081
4287  04b1 1a02          	or	a,(OFST+2,sp)
4288  04b3 c75259        	ld	21081,a
4289  04b6               L7122:
4290                     ; 1193 }
4293  04b6 85            	popw	x
4294  04b7 81            	ret
4328                     ; 1201 void TIM2_SetCounter(uint16_t TIM2_Counter)
4328                     ; 1202 {
4329                     	switch	.text
4330  04b8               _TIM2_SetCounter:
4334                     ; 1205     TIM2->CNTRH = (uint8_t)(TIM2_Counter >> 8);
4336  04b8 9e            	ld	a,xh
4337  04b9 c7525b        	ld	21083,a
4338                     ; 1206     TIM2->CNTRL = (uint8_t)(TIM2_Counter);
4340  04bc 9f            	ld	a,xl
4341  04bd c7525c        	ld	21084,a
4342                     ; 1207 }
4345  04c0 81            	ret
4379                     ; 1215 void TIM2_SetAutoreload(uint16_t TIM2_Autoreload)
4379                     ; 1216 {
4380                     	switch	.text
4381  04c1               _TIM2_SetAutoreload:
4385                     ; 1218     TIM2->ARRH = (uint8_t)(TIM2_Autoreload >> 8);
4387  04c1 9e            	ld	a,xh
4388  04c2 c7525e        	ld	21086,a
4389                     ; 1219     TIM2->ARRL = (uint8_t)(TIM2_Autoreload);
4391  04c5 9f            	ld	a,xl
4392  04c6 c7525f        	ld	21087,a
4393                     ; 1220 }
4396  04c9 81            	ret
4430                     ; 1228 void TIM2_SetCompare1(uint16_t TIM2_Compare)
4430                     ; 1229 {
4431                     	switch	.text
4432  04ca               _TIM2_SetCompare1:
4436                     ; 1231     TIM2->CCR1H = (uint8_t)(TIM2_Compare >> 8);
4438  04ca 9e            	ld	a,xh
4439  04cb c75260        	ld	21088,a
4440                     ; 1232     TIM2->CCR1L = (uint8_t)(TIM2_Compare);
4442  04ce 9f            	ld	a,xl
4443  04cf c75261        	ld	21089,a
4444                     ; 1233 }
4447  04d2 81            	ret
4481                     ; 1241 void TIM2_SetCompare2(uint16_t TIM2_Compare)
4481                     ; 1242 {
4482                     	switch	.text
4483  04d3               _TIM2_SetCompare2:
4487                     ; 1244     TIM2->CCR2H = (uint8_t)(TIM2_Compare >> 8);
4489  04d3 9e            	ld	a,xh
4490  04d4 c75262        	ld	21090,a
4491                     ; 1245     TIM2->CCR2L = (uint8_t)(TIM2_Compare);
4493  04d7 9f            	ld	a,xl
4494  04d8 c75263        	ld	21091,a
4495                     ; 1246 }
4498  04db 81            	ret
4543                     ; 1254 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
4543                     ; 1255 {
4544                     	switch	.text
4545  04dc               _TIM2_SetIC1Prescaler:
4547  04dc 88            	push	a
4548  04dd 88            	push	a
4549       00000001      OFST:	set	1
4552                     ; 1256     uint8_t tmpccmr1 = 0;
4554                     ; 1259     assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
4556                     ; 1261     tmpccmr1 = TIM2->CCMR1;
4558  04de c65258        	ld	a,21080
4559  04e1 6b01          	ld	(OFST+0,sp),a
4560                     ; 1264     tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4562  04e3 7b01          	ld	a,(OFST+0,sp)
4563  04e5 a4f3          	and	a,#243
4564  04e7 6b01          	ld	(OFST+0,sp),a
4565                     ; 1267     tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
4567  04e9 7b01          	ld	a,(OFST+0,sp)
4568  04eb 1a02          	or	a,(OFST+1,sp)
4569  04ed 6b01          	ld	(OFST+0,sp),a
4570                     ; 1269     TIM2->CCMR1 = tmpccmr1;
4572  04ef 7b01          	ld	a,(OFST+0,sp)
4573  04f1 c75258        	ld	21080,a
4574                     ; 1270 }
4577  04f4 85            	popw	x
4578  04f5 81            	ret
4623                     ; 1278 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
4623                     ; 1279 {
4624                     	switch	.text
4625  04f6               _TIM2_SetIC2Prescaler:
4627  04f6 88            	push	a
4628  04f7 88            	push	a
4629       00000001      OFST:	set	1
4632                     ; 1280     uint8_t tmpccmr2 = 0;
4634                     ; 1283     assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
4636                     ; 1285     tmpccmr2 = TIM2->CCMR2;
4638  04f8 c65259        	ld	a,21081
4639  04fb 6b01          	ld	(OFST+0,sp),a
4640                     ; 1288     tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4642  04fd 7b01          	ld	a,(OFST+0,sp)
4643  04ff a4f3          	and	a,#243
4644  0501 6b01          	ld	(OFST+0,sp),a
4645                     ; 1291     tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
4647  0503 7b01          	ld	a,(OFST+0,sp)
4648  0505 1a02          	or	a,(OFST+1,sp)
4649  0507 6b01          	ld	(OFST+0,sp),a
4650                     ; 1293     TIM2->CCMR2 = tmpccmr2;
4652  0509 7b01          	ld	a,(OFST+0,sp)
4653  050b c75259        	ld	21081,a
4654                     ; 1294 }
4657  050e 85            	popw	x
4658  050f 81            	ret
4710                     ; 1302 uint16_t TIM2_GetCapture1(void)
4710                     ; 1303 {
4711                     	switch	.text
4712  0510               _TIM2_GetCapture1:
4714  0510 5204          	subw	sp,#4
4715       00000004      OFST:	set	4
4718                     ; 1304     uint16_t tmpccr1 = 0;
4720                     ; 1307     tmpccr1h = TIM2->CCR1H;
4722  0512 c65260        	ld	a,21088
4723  0515 6b02          	ld	(OFST-2,sp),a
4724                     ; 1308     tmpccr1l = TIM2->CCR1L;
4726  0517 c65261        	ld	a,21089
4727  051a 6b01          	ld	(OFST-3,sp),a
4728                     ; 1310     tmpccr1 = (uint16_t)(tmpccr1l);
4730  051c 7b01          	ld	a,(OFST-3,sp)
4731  051e 5f            	clrw	x
4732  051f 97            	ld	xl,a
4733  0520 1f03          	ldw	(OFST-1,sp),x
4734                     ; 1311     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4736  0522 7b02          	ld	a,(OFST-2,sp)
4737  0524 5f            	clrw	x
4738  0525 97            	ld	xl,a
4739  0526 4f            	clr	a
4740  0527 02            	rlwa	x,a
4741  0528 01            	rrwa	x,a
4742  0529 1a04          	or	a,(OFST+0,sp)
4743  052b 01            	rrwa	x,a
4744  052c 1a03          	or	a,(OFST-1,sp)
4745  052e 01            	rrwa	x,a
4746  052f 1f03          	ldw	(OFST-1,sp),x
4747                     ; 1313     return ((uint16_t)tmpccr1);
4749  0531 1e03          	ldw	x,(OFST-1,sp)
4752  0533 5b04          	addw	sp,#4
4753  0535 81            	ret
4805                     ; 1322 uint16_t TIM2_GetCapture2(void)
4805                     ; 1323 {
4806                     	switch	.text
4807  0536               _TIM2_GetCapture2:
4809  0536 5204          	subw	sp,#4
4810       00000004      OFST:	set	4
4813                     ; 1324     uint16_t tmpccr2 = 0;
4815                     ; 1327     tmpccr2h = TIM2->CCR2H;
4817  0538 c65262        	ld	a,21090
4818  053b 6b02          	ld	(OFST-2,sp),a
4819                     ; 1328     tmpccr2l = TIM2->CCR2L;
4821  053d c65263        	ld	a,21091
4822  0540 6b01          	ld	(OFST-3,sp),a
4823                     ; 1330     tmpccr2 = (uint16_t)(tmpccr2l);
4825  0542 7b01          	ld	a,(OFST-3,sp)
4826  0544 5f            	clrw	x
4827  0545 97            	ld	xl,a
4828  0546 1f03          	ldw	(OFST-1,sp),x
4829                     ; 1331     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4831  0548 7b02          	ld	a,(OFST-2,sp)
4832  054a 5f            	clrw	x
4833  054b 97            	ld	xl,a
4834  054c 4f            	clr	a
4835  054d 02            	rlwa	x,a
4836  054e 01            	rrwa	x,a
4837  054f 1a04          	or	a,(OFST+0,sp)
4838  0551 01            	rrwa	x,a
4839  0552 1a03          	or	a,(OFST-1,sp)
4840  0554 01            	rrwa	x,a
4841  0555 1f03          	ldw	(OFST-1,sp),x
4842                     ; 1333     return ((uint16_t)tmpccr2);
4844  0557 1e03          	ldw	x,(OFST-1,sp)
4847  0559 5b04          	addw	sp,#4
4848  055b 81            	ret
4900                     ; 1342 uint16_t TIM2_GetCounter(void)
4900                     ; 1343 {
4901                     	switch	.text
4902  055c               _TIM2_GetCounter:
4904  055c 5204          	subw	sp,#4
4905       00000004      OFST:	set	4
4908                     ; 1344     uint16_t tmpcnt = 0;
4910                     ; 1347     tmpcntrh = TIM2->CNTRH;
4912  055e c6525b        	ld	a,21083
4913  0561 6b02          	ld	(OFST-2,sp),a
4914                     ; 1348     tmpcntrl = TIM2->CNTRL;
4916  0563 c6525c        	ld	a,21084
4917  0566 6b01          	ld	(OFST-3,sp),a
4918                     ; 1350     tmpcnt = (uint16_t)(tmpcntrl);
4920  0568 7b01          	ld	a,(OFST-3,sp)
4921  056a 5f            	clrw	x
4922  056b 97            	ld	xl,a
4923  056c 1f03          	ldw	(OFST-1,sp),x
4924                     ; 1351     tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4926  056e 7b02          	ld	a,(OFST-2,sp)
4927  0570 5f            	clrw	x
4928  0571 97            	ld	xl,a
4929  0572 4f            	clr	a
4930  0573 02            	rlwa	x,a
4931  0574 01            	rrwa	x,a
4932  0575 1a04          	or	a,(OFST+0,sp)
4933  0577 01            	rrwa	x,a
4934  0578 1a03          	or	a,(OFST-1,sp)
4935  057a 01            	rrwa	x,a
4936  057b 1f03          	ldw	(OFST-1,sp),x
4937                     ; 1353     return ((uint16_t)tmpcnt);
4939  057d 1e03          	ldw	x,(OFST-1,sp)
4942  057f 5b04          	addw	sp,#4
4943  0581 81            	ret
4967                     ; 1362 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4967                     ; 1363 {
4968                     	switch	.text
4969  0582               _TIM2_GetPrescaler:
4973                     ; 1365     return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
4975  0582 c6525d        	ld	a,21085
4978  0585 81            	ret
5117                     ; 1375 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
5117                     ; 1376 {
5118                     	switch	.text
5119  0586               _TIM2_GetFlagStatus:
5121  0586 5204          	subw	sp,#4
5122       00000004      OFST:	set	4
5125                     ; 1377     __IO FlagStatus bitstatus = RESET;
5127  0588 0f04          	clr	(OFST+0,sp)
5128                     ; 1381     assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
5130                     ; 1383     tim2_flag_l = (uint8_t)(TIM2_FLAG);
5132  058a 9f            	ld	a,xl
5133  058b 6b02          	ld	(OFST-2,sp),a
5134                     ; 1384     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
5136  058d 9e            	ld	a,xh
5137  058e 6b03          	ld	(OFST-1,sp),a
5138                     ; 1386     if (((TIM2->SR1 & tim2_flag_l) | (TIM2->SR2 & tim2_flag_h)) != 0)
5140  0590 c65256        	ld	a,21078
5141  0593 1403          	and	a,(OFST-1,sp)
5142  0595 6b01          	ld	(OFST-3,sp),a
5143  0597 c65255        	ld	a,21077
5144  059a 1402          	and	a,(OFST-2,sp)
5145  059c 1a01          	or	a,(OFST-3,sp)
5146  059e 2706          	jreq	L3552
5147                     ; 1388         bitstatus = SET;
5149  05a0 a601          	ld	a,#1
5150  05a2 6b04          	ld	(OFST+0,sp),a
5152  05a4 2002          	jra	L5552
5153  05a6               L3552:
5154                     ; 1392         bitstatus = RESET;
5156  05a6 0f04          	clr	(OFST+0,sp)
5157  05a8               L5552:
5158                     ; 1394     return ((FlagStatus)bitstatus);
5160  05a8 7b04          	ld	a,(OFST+0,sp)
5163  05aa 5b04          	addw	sp,#4
5164  05ac 81            	ret
5199                     ; 1403 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
5199                     ; 1404 {
5200                     	switch	.text
5201  05ad               _TIM2_ClearFlag:
5203  05ad 89            	pushw	x
5204       00000000      OFST:	set	0
5207                     ; 1406     assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
5209                     ; 1408     TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
5211  05ae 9f            	ld	a,xl
5212  05af 43            	cpl	a
5213  05b0 c75255        	ld	21077,a
5214                     ; 1409     TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
5216  05b3 7b01          	ld	a,(OFST+1,sp)
5217  05b5 43            	cpl	a
5218  05b6 c75256        	ld	21078,a
5219                     ; 1410 }
5222  05b9 85            	popw	x
5223  05ba 81            	ret
5287                     ; 1419 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
5287                     ; 1420 {
5288                     	switch	.text
5289  05bb               _TIM2_GetITStatus:
5291  05bb 88            	push	a
5292  05bc 5203          	subw	sp,#3
5293       00000003      OFST:	set	3
5296                     ; 1421     __IO ITStatus bitstatus = RESET;
5298  05be 0f03          	clr	(OFST+0,sp)
5299                     ; 1423     __IO uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
5301  05c0 0f01          	clr	(OFST-2,sp)
5304  05c2 0f02          	clr	(OFST-1,sp)
5305                     ; 1426     assert_param(IS_TIM2_GET_IT(TIM2_IT));
5307                     ; 1428     TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
5309  05c4 c45255        	and	a,21077
5310  05c7 6b01          	ld	(OFST-2,sp),a
5311                     ; 1430     TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
5313  05c9 c65254        	ld	a,21076
5314  05cc 1404          	and	a,(OFST+1,sp)
5315  05ce 6b02          	ld	(OFST-1,sp),a
5316                     ; 1432     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
5318  05d0 0d01          	tnz	(OFST-2,sp)
5319  05d2 270a          	jreq	L7262
5321  05d4 0d02          	tnz	(OFST-1,sp)
5322  05d6 2706          	jreq	L7262
5323                     ; 1434         bitstatus = (ITStatus)SET;
5325  05d8 a601          	ld	a,#1
5326  05da 6b03          	ld	(OFST+0,sp),a
5328  05dc 2002          	jra	L1362
5329  05de               L7262:
5330                     ; 1438         bitstatus = (ITStatus)RESET;
5332  05de 0f03          	clr	(OFST+0,sp)
5333  05e0               L1362:
5334                     ; 1440     return ((ITStatus)bitstatus);
5336  05e0 7b03          	ld	a,(OFST+0,sp)
5339  05e2 5b04          	addw	sp,#4
5340  05e4 81            	ret
5376                     ; 1449 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
5376                     ; 1450 {
5377                     	switch	.text
5378  05e5               _TIM2_ClearITPendingBit:
5382                     ; 1452     assert_param(IS_TIM2_IT(TIM2_IT));
5384                     ; 1455     TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
5386  05e5 43            	cpl	a
5387  05e6 c75255        	ld	21077,a
5388                     ; 1456 }
5391  05e9 81            	ret
5463                     ; 1468 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5463                     ; 1469                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5463                     ; 1470                        uint8_t TIM2_ICFilter)
5463                     ; 1471 {
5464                     	switch	.text
5465  05ea               L3_TI1_Config:
5467  05ea 89            	pushw	x
5468  05eb 89            	pushw	x
5469       00000002      OFST:	set	2
5472                     ; 1472     uint8_t tmpccmr1 = 0;
5474                     ; 1473     uint8_t tmpicpolarity = TIM2_ICPolarity;
5476  05ec 9e            	ld	a,xh
5477  05ed 6b01          	ld	(OFST-1,sp),a
5478                     ; 1474     tmpccmr1 = TIM2->CCMR1;
5480  05ef c65258        	ld	a,21080
5481  05f2 6b02          	ld	(OFST+0,sp),a
5482                     ; 1477     assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5484                     ; 1478     assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5486                     ; 1479     assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5488                     ; 1482     TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5490  05f4 7211525a      	bres	21082,#0
5491                     ; 1485     tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5493  05f8 7b02          	ld	a,(OFST+0,sp)
5494  05fa a40c          	and	a,#12
5495  05fc 6b02          	ld	(OFST+0,sp),a
5496                     ; 1486     tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5498  05fe 7b07          	ld	a,(OFST+5,sp)
5499  0600 97            	ld	xl,a
5500  0601 a610          	ld	a,#16
5501  0603 42            	mul	x,a
5502  0604 9f            	ld	a,xl
5503  0605 1a04          	or	a,(OFST+2,sp)
5504  0607 1a02          	or	a,(OFST+0,sp)
5505  0609 6b02          	ld	(OFST+0,sp),a
5506                     ; 1488     TIM2->CCMR1 = tmpccmr1;
5508  060b 7b02          	ld	a,(OFST+0,sp)
5509  060d c75258        	ld	21080,a
5510                     ; 1491     if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5512  0610 7b01          	ld	a,(OFST-1,sp)
5513  0612 a101          	cp	a,#1
5514  0614 2606          	jrne	L7072
5515                     ; 1493         TIM2->CCER1 |= TIM_CCER1_CC1P;
5517  0616 7212525a      	bset	21082,#1
5519  061a 2004          	jra	L1172
5520  061c               L7072:
5521                     ; 1497         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5523  061c 7213525a      	bres	21082,#1
5524  0620               L1172:
5525                     ; 1501     TIM2->CCER1 |=  TIM_CCER1_CC1E;
5527  0620 7210525a      	bset	21082,#0
5528                     ; 1502 }
5531  0624 5b04          	addw	sp,#4
5532  0626 81            	ret
5604                     ; 1514 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5604                     ; 1515                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5604                     ; 1516                        uint8_t TIM2_ICFilter)
5604                     ; 1517 {
5605                     	switch	.text
5606  0627               L5_TI2_Config:
5608  0627 89            	pushw	x
5609  0628 89            	pushw	x
5610       00000002      OFST:	set	2
5613                     ; 1518     uint8_t tmpccmr2 = 0;
5615                     ; 1519     uint8_t tmpicpolarity = TIM2_ICPolarity;
5617  0629 9e            	ld	a,xh
5618  062a 6b01          	ld	(OFST-1,sp),a
5619                     ; 1522     assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5621                     ; 1523     assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5623                     ; 1524     assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5625                     ; 1526     tmpccmr2 = TIM2->CCMR2;
5627  062c c65259        	ld	a,21081
5628  062f 6b02          	ld	(OFST+0,sp),a
5629                     ; 1529     TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5631  0631 7219525a      	bres	21082,#4
5632                     ; 1532     tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5634  0635 7b02          	ld	a,(OFST+0,sp)
5635  0637 a40c          	and	a,#12
5636  0639 6b02          	ld	(OFST+0,sp),a
5637                     ; 1533     tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5639  063b 7b07          	ld	a,(OFST+5,sp)
5640  063d 97            	ld	xl,a
5641  063e a610          	ld	a,#16
5642  0640 42            	mul	x,a
5643  0641 9f            	ld	a,xl
5644  0642 1a04          	or	a,(OFST+2,sp)
5645  0644 1a02          	or	a,(OFST+0,sp)
5646  0646 6b02          	ld	(OFST+0,sp),a
5647                     ; 1535     TIM2->CCMR2 = tmpccmr2;
5649  0648 7b02          	ld	a,(OFST+0,sp)
5650  064a c75259        	ld	21081,a
5651                     ; 1538     if (tmpicpolarity == TIM2_ICPolarity_Falling)
5653  064d 7b01          	ld	a,(OFST-1,sp)
5654  064f a101          	cp	a,#1
5655  0651 2606          	jrne	L1572
5656                     ; 1540         TIM2->CCER1 |= TIM_CCER1_CC2P ;
5658  0653 721a525a      	bset	21082,#5
5660  0657 2004          	jra	L3572
5661  0659               L1572:
5662                     ; 1544         TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5664  0659 721b525a      	bres	21082,#5
5665  065d               L3572:
5666                     ; 1548     TIM2->CCER1 |=  TIM_CCER1_CC2E;
5668  065d 7218525a      	bset	21082,#4
5669                     ; 1549 }
5672  0661 5b04          	addw	sp,#4
5673  0663 81            	ret
5741                     ; 1558 uint32_t TIM2_ComputeLsiClockFreq(uint32_t TIM2_TimerClockFreq)
5741                     ; 1559 {
5742                     	switch	.text
5743  0664               _TIM2_ComputeLsiClockFreq:
5745  0664 520c          	subw	sp,#12
5746       0000000c      OFST:	set	12
5749                     ; 1564     TIM2_ICInit(	TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_Div8, 0x0);
5751  0666 4b00          	push	#0
5752  0668 4b0c          	push	#12
5753  066a 4b01          	push	#1
5754  066c 5f            	clrw	x
5755  066d 4f            	clr	a
5756  066e 95            	ld	xh,a
5757  066f cd0142        	call	_TIM2_ICInit
5759  0672 5b03          	addw	sp,#3
5760                     ; 1567     TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
5762  0674 ae0001        	ldw	x,#1
5763  0677 a602          	ld	a,#2
5764  0679 95            	ld	xh,a
5765  067a cd01fa        	call	_TIM2_ITConfig
5767                     ; 1570     TIM2_Cmd(ENABLE);
5769  067d a601          	ld	a,#1
5770  067f cd01de        	call	_TIM2_Cmd
5772                     ; 1572     TIM2->SR1 = 0x00;
5774  0682 725f5255      	clr	21077
5775                     ; 1573     TIM2->SR2 = 0x00;
5777  0686 725f5256      	clr	21078
5778                     ; 1576     TIM2_ClearFlag(TIM2_FLAG_CC1);
5780  068a ae0002        	ldw	x,#2
5781  068d cd05ad        	call	_TIM2_ClearFlag
5784  0690               L1103:
5785                     ; 1579     while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != TIM2_FLAG_CC1)
5787  0690 c65255        	ld	a,21077
5788  0693 a402          	and	a,#2
5789  0695 a102          	cp	a,#2
5790  0697 26f7          	jrne	L1103
5791                     ; 1583     ICValue1 = TIM2_GetCapture1();
5793  0699 cd0510        	call	_TIM2_GetCapture1
5795  069c 1f09          	ldw	(OFST-3,sp),x
5796                     ; 1584     TIM2_ClearFlag(TIM2_FLAG_CC1);
5798  069e ae0002        	ldw	x,#2
5799  06a1 cd05ad        	call	_TIM2_ClearFlag
5802  06a4               L7103:
5803                     ; 1587     while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != TIM2_FLAG_CC1)
5805  06a4 c65255        	ld	a,21077
5806  06a7 a402          	and	a,#2
5807  06a9 a102          	cp	a,#2
5808  06ab 26f7          	jrne	L7103
5809                     ; 1591     ICValue2 = TIM2_GetCapture1();
5811  06ad cd0510        	call	_TIM2_GetCapture1
5813  06b0 1f0b          	ldw	(OFST-1,sp),x
5814                     ; 1592     TIM2_ClearFlag(TIM2_FLAG_CC1);
5816  06b2 ae0002        	ldw	x,#2
5817  06b5 cd05ad        	call	_TIM2_ClearFlag
5819                     ; 1595     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5821  06b8 7211525a      	bres	21082,#0
5822                     ; 1597     TIM2->CCMR1 = 0x00;
5824  06bc 725f5258      	clr	21080
5825                     ; 1599     TIM2_Cmd(DISABLE);
5827  06c0 4f            	clr	a
5828  06c1 cd01de        	call	_TIM2_Cmd
5830                     ; 1602     LSIClockFreq = (8 * TIM2_TimerClockFreq) / (ICValue2 - ICValue1);
5832  06c4 1e0b          	ldw	x,(OFST-1,sp)
5833  06c6 72f009        	subw	x,(OFST-3,sp)
5834  06c9 cd0000        	call	c_uitolx
5836  06cc 96            	ldw	x,sp
5837  06cd 1c0001        	addw	x,#OFST-11
5838  06d0 cd0000        	call	c_rtol
5840  06d3 96            	ldw	x,sp
5841  06d4 1c000f        	addw	x,#OFST+3
5842  06d7 cd0000        	call	c_ltor
5844  06da a603          	ld	a,#3
5845  06dc cd0000        	call	c_llsh
5847  06df 96            	ldw	x,sp
5848  06e0 1c0001        	addw	x,#OFST-11
5849  06e3 cd0000        	call	c_ludv
5851  06e6 96            	ldw	x,sp
5852  06e7 1c0005        	addw	x,#OFST-7
5853  06ea cd0000        	call	c_rtol
5855                     ; 1603     return LSIClockFreq;
5857  06ed 96            	ldw	x,sp
5858  06ee 1c0005        	addw	x,#OFST-7
5859  06f1 cd0000        	call	c_ltor
5863  06f4 5b0c          	addw	sp,#12
5864  06f6 81            	ret
5888                     ; 1612 FunctionalState TIM2_GetStatus(void)
5888                     ; 1613 {
5889                     	switch	.text
5890  06f7               _TIM2_GetStatus:
5894                     ; 1614     return ((FunctionalState) (TIM2->CR1 & TIM_CR1_CEN));
5896  06f7 c65250        	ld	a,21072
5897  06fa a401          	and	a,#1
5900  06fc 81            	ret
5913                     	xdef	_TIM2_GetStatus
5914                     	xdef	_TIM2_ComputeLsiClockFreq
5915                     	xdef	_TIM2_ClearITPendingBit
5916                     	xdef	_TIM2_GetITStatus
5917                     	xdef	_TIM2_ClearFlag
5918                     	xdef	_TIM2_GetFlagStatus
5919                     	xdef	_TIM2_GetPrescaler
5920                     	xdef	_TIM2_GetCounter
5921                     	xdef	_TIM2_GetCapture2
5922                     	xdef	_TIM2_GetCapture1
5923                     	xdef	_TIM2_SetIC2Prescaler
5924                     	xdef	_TIM2_SetIC1Prescaler
5925                     	xdef	_TIM2_SetCompare2
5926                     	xdef	_TIM2_SetCompare1
5927                     	xdef	_TIM2_SetAutoreload
5928                     	xdef	_TIM2_SetCounter
5929                     	xdef	_TIM2_SelectOCxM
5930                     	xdef	_TIM2_CCxCmd
5931                     	xdef	_TIM2_OC2PolarityConfig
5932                     	xdef	_TIM2_OC1PolarityConfig
5933                     	xdef	_TIM2_GenerateEvent
5934                     	xdef	_TIM2_OC2FastCmd
5935                     	xdef	_TIM2_OC1FastCmd
5936                     	xdef	_TIM2_OC2PreloadConfig
5937                     	xdef	_TIM2_OC1PreloadConfig
5938                     	xdef	_TIM2_ARRPreloadConfig
5939                     	xdef	_TIM2_ForcedOC2Config
5940                     	xdef	_TIM2_ForcedOC1Config
5941                     	xdef	_TIM2_CounterModeConfig
5942                     	xdef	_TIM2_PrescalerConfig
5943                     	xdef	_TIM2_EncoderInterfaceConfig
5944                     	xdef	_TIM2_SelectMasterSlaveMode
5945                     	xdef	_TIM2_SelectSlaveMode
5946                     	xdef	_TIM2_SelectOutputTrigger
5947                     	xdef	_TIM2_SelectOnePulseMode
5948                     	xdef	_TIM2_SelectHallSensor
5949                     	xdef	_TIM2_UpdateRequestConfig
5950                     	xdef	_TIM2_UpdateDisableConfig
5951                     	xdef	_TIM2_SelectInputTrigger
5952                     	xdef	_TIM2_TIxExternalClockConfig
5953                     	xdef	_TIM2_ETRConfig
5954                     	xdef	_TIM2_ETRClockMode2Config
5955                     	xdef	_TIM2_ETRClockMode1Config
5956                     	xdef	_TIM2_InternalClockConfig
5957                     	xdef	_TIM2_ITConfig
5958                     	xdef	_TIM2_CtrlPWMOutputs
5959                     	xdef	_TIM2_Cmd
5960                     	xdef	_TIM2_PWMIConfig
5961                     	xdef	_TIM2_ICInit
5962                     	xdef	_TIM2_BKRConfig
5963                     	xdef	_TIM2_OC2Init
5964                     	xdef	_TIM2_OC1Init
5965                     	xdef	_TIM2_TimeBaseInit
5966                     	xdef	_TIM2_DeInit
5967                     	xref.b	c_x
5986                     	xref	c_ludv
5987                     	xref	c_rtol
5988                     	xref	c_uitolx
5989                     	xref	c_llsh
5990                     	xref	c_ltor
5991                     	end
