   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 50 void TIM3_DeInit(void)
  43                     ; 51 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 52     TIM3->CR1 = TIM_CR1_RESET_VALUE;
  52  0000 725f5280      	clr	21120
  53                     ; 53     TIM3->CR2 = TIM_CR2_RESET_VALUE;
  55  0004 725f5281      	clr	21121
  56                     ; 54     TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  58  0008 725f5282      	clr	21122
  59                     ; 55     TIM3->ETR = TIM_ETR_RESET_VALUE;
  61  000c 725f5283      	clr	21123
  62                     ; 56     TIM3->IER = TIM_IER_RESET_VALUE;
  64  0010 725f5284      	clr	21124
  65                     ; 57     TIM3->SR2 = TIM_SR2_RESET_VALUE;
  67  0014 725f5286      	clr	21126
  68                     ; 60     TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  70  0018 725f528a      	clr	21130
  71                     ; 62     TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  73  001c 35015288      	mov	21128,#1
  74                     ; 63     TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  76  0020 35015289      	mov	21129,#1
  77                     ; 66     TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  79  0024 725f528a      	clr	21130
  80                     ; 67     TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  82  0028 725f5288      	clr	21128
  83                     ; 68     TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  85  002c 725f5289      	clr	21129
  86                     ; 70     TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  88  0030 725f528b      	clr	21131
  89                     ; 71     TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  91  0034 725f528c      	clr	21132
  92                     ; 73     TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  94  0038 725f528d      	clr	21133
  95                     ; 75     TIM3->ARRH = TIM_ARRH_RESET_VALUE;
  97  003c 35ff528e      	mov	21134,#255
  98                     ; 76     TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 100  0040 35ff528f      	mov	21135,#255
 101                     ; 78     TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 103  0044 725f5290      	clr	21136
 104                     ; 79     TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 106  0048 725f5291      	clr	21137
 107                     ; 80     TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 109  004c 725f5292      	clr	21138
 110                     ; 81     TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 112  0050 725f5293      	clr	21139
 113                     ; 84     TIM3->OISR = TIM_OISR_RESET_VALUE;
 115  0054 725f5295      	clr	21141
 116                     ; 85     TIM3->EGR = 0x01;/*TIM_EGR_UG;*/
 118  0058 35015287      	mov	21127,#1
 119                     ; 86     TIM3->BKR = TIM_BKR_RESET_VALUE;
 121  005c 725f5294      	clr	21140
 122                     ; 87     TIM3->SR1 = TIM_SR1_RESET_VALUE;
 124  0060 725f5285      	clr	21125
 125                     ; 88 }
 128  0064 81            	ret
 290                     ; 98 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 290                     ; 99                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 290                     ; 100                        uint16_t TIM3_Period)
 290                     ; 101 {
 291                     	switch	.text
 292  0065               _TIM3_TimeBaseInit:
 294  0065 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 103     assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 300                     ; 104     assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 302                     ; 109     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 304  0066 7b05          	ld	a,(OFST+5,sp)
 305  0068 c7528e        	ld	21134,a
 306                     ; 110     TIM3->ARRL = (uint8_t)(TIM3_Period);
 308  006b 7b06          	ld	a,(OFST+6,sp)
 309  006d c7528f        	ld	21135,a
 310                     ; 113     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 312  0070 9e            	ld	a,xh
 313  0071 c7528d        	ld	21133,a
 314                     ; 116     TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 316  0074 c65280        	ld	a,21120
 317  0077 a48f          	and	a,#143
 318  0079 c75280        	ld	21120,a
 319                     ; 117     TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 321  007c 9f            	ld	a,xl
 322  007d ca5280        	or	a,21120
 323  0080 c75280        	ld	21120,a
 324                     ; 118 }
 327  0083 85            	popw	x
 328  0084 81            	ret
 526                     ; 129 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 526                     ; 130                   TIM3_OutputState_TypeDef TIM3_OutputState,
 526                     ; 131                   uint16_t TIM3_Pulse,
 526                     ; 132                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 526                     ; 133                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 526                     ; 134 {
 527                     	switch	.text
 528  0085               _TIM3_OC1Init:
 530  0085 89            	pushw	x
 531  0086 88            	push	a
 532       00000001      OFST:	set	1
 535                     ; 135     uint8_t tmpccmr1 = 0;
 537                     ; 138     assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 539                     ; 139     assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 541                     ; 140     assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 543                     ; 141     assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 545                     ; 143     tmpccmr1 = TIM3->CCMR1;
 547  0087 c65288        	ld	a,21128
 548  008a 6b01          	ld	(OFST+0,sp),a
 549                     ; 146     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 551  008c 7211528a      	bres	21130,#0
 552                     ; 148     tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 554  0090 7b01          	ld	a,(OFST+0,sp)
 555  0092 a48f          	and	a,#143
 556  0094 6b01          	ld	(OFST+0,sp),a
 557                     ; 151     tmpccmr1 |= (uint8_t)TIM3_OCMode;
 559  0096 9e            	ld	a,xh
 560  0097 1a01          	or	a,(OFST+0,sp)
 561  0099 6b01          	ld	(OFST+0,sp),a
 562                     ; 153     TIM3->CCMR1 = tmpccmr1;
 564  009b 7b01          	ld	a,(OFST+0,sp)
 565  009d c75288        	ld	21128,a
 566                     ; 156     if (TIM3_OutputState == TIM3_OutputState_Enable)
 568  00a0 9f            	ld	a,xl
 569  00a1 a101          	cp	a,#1
 570  00a3 2606          	jrne	L722
 571                     ; 158         TIM3->CCER1 |= TIM_CCER1_CC1E;
 573  00a5 7210528a      	bset	21130,#0
 575  00a9 2004          	jra	L132
 576  00ab               L722:
 577                     ; 162         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 579  00ab 7211528a      	bres	21130,#0
 580  00af               L132:
 581                     ; 166     if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 583  00af 7b08          	ld	a,(OFST+7,sp)
 584  00b1 a101          	cp	a,#1
 585  00b3 2606          	jrne	L332
 586                     ; 168         TIM3->CCER1 |= TIM_CCER1_CC1P;
 588  00b5 7212528a      	bset	21130,#1
 590  00b9 2004          	jra	L532
 591  00bb               L332:
 592                     ; 172         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 594  00bb 7213528a      	bres	21130,#1
 595  00bf               L532:
 596                     ; 176     if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 598  00bf 7b09          	ld	a,(OFST+8,sp)
 599  00c1 a101          	cp	a,#1
 600  00c3 2606          	jrne	L732
 601                     ; 178         TIM3->OISR |= TIM_OISR_OIS1;
 603  00c5 72105295      	bset	21141,#0
 605  00c9 2004          	jra	L142
 606  00cb               L732:
 607                     ; 182         TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 609  00cb 72115295      	bres	21141,#0
 610  00cf               L142:
 611                     ; 186     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 613  00cf 7b06          	ld	a,(OFST+5,sp)
 614  00d1 c75290        	ld	21136,a
 615                     ; 187     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 617  00d4 7b07          	ld	a,(OFST+6,sp)
 618  00d6 c75291        	ld	21137,a
 619                     ; 188 }
 622  00d9 5b03          	addw	sp,#3
 623  00db 81            	ret
 706                     ; 199 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 706                     ; 200                   TIM3_OutputState_TypeDef TIM3_OutputState,
 706                     ; 201                   uint16_t TIM3_Pulse,
 706                     ; 202                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 706                     ; 203                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 706                     ; 204 {
 707                     	switch	.text
 708  00dc               _TIM3_OC2Init:
 710  00dc 89            	pushw	x
 711  00dd 88            	push	a
 712       00000001      OFST:	set	1
 715                     ; 205     uint8_t tmpccmr2 = 0;
 717                     ; 208     assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 719                     ; 209     assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 721                     ; 210     assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 723                     ; 211     assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 725                     ; 213     tmpccmr2 = TIM3->CCMR2;
 727  00de c65289        	ld	a,21129
 728  00e1 6b01          	ld	(OFST+0,sp),a
 729                     ; 216     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 731  00e3 7219528a      	bres	21130,#4
 732                     ; 219     tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 734  00e7 7b01          	ld	a,(OFST+0,sp)
 735  00e9 a48f          	and	a,#143
 736  00eb 6b01          	ld	(OFST+0,sp),a
 737                     ; 222     tmpccmr2 |= (uint8_t)TIM3_OCMode;
 739  00ed 9e            	ld	a,xh
 740  00ee 1a01          	or	a,(OFST+0,sp)
 741  00f0 6b01          	ld	(OFST+0,sp),a
 742                     ; 224     TIM3->CCMR2 = tmpccmr2;
 744  00f2 7b01          	ld	a,(OFST+0,sp)
 745  00f4 c75289        	ld	21129,a
 746                     ; 227     if (TIM3_OutputState == TIM3_OutputState_Enable)
 748  00f7 9f            	ld	a,xl
 749  00f8 a101          	cp	a,#1
 750  00fa 2606          	jrne	L503
 751                     ; 229         TIM3->CCER1 |= TIM_CCER1_CC2E;
 753  00fc 7218528a      	bset	21130,#4
 755  0100 2004          	jra	L703
 756  0102               L503:
 757                     ; 233         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 759  0102 7219528a      	bres	21130,#4
 760  0106               L703:
 761                     ; 237     if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 763  0106 7b08          	ld	a,(OFST+7,sp)
 764  0108 a101          	cp	a,#1
 765  010a 2606          	jrne	L113
 766                     ; 239         TIM3->CCER1 |= TIM_CCER1_CC2P;
 768  010c 721a528a      	bset	21130,#5
 770  0110 2004          	jra	L313
 771  0112               L113:
 772                     ; 243         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 774  0112 721b528a      	bres	21130,#5
 775  0116               L313:
 776                     ; 248     if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 778  0116 7b09          	ld	a,(OFST+8,sp)
 779  0118 a101          	cp	a,#1
 780  011a 2606          	jrne	L513
 781                     ; 250         TIM3->OISR |= TIM_OISR_OIS2;
 783  011c 72145295      	bset	21141,#2
 785  0120 2004          	jra	L713
 786  0122               L513:
 787                     ; 254         TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 789  0122 72155295      	bres	21141,#2
 790  0126               L713:
 791                     ; 258     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 793  0126 7b06          	ld	a,(OFST+5,sp)
 794  0128 c75292        	ld	21138,a
 795                     ; 259     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 797  012b 7b07          	ld	a,(OFST+6,sp)
 798  012d c75293        	ld	21139,a
 799                     ; 260 }
 802  0130 5b03          	addw	sp,#3
 803  0132 81            	ret
1001                     ; 277 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1001                     ; 278                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1001                     ; 279                     TIM3_BreakState_TypeDef TIM3_BreakState,
1001                     ; 280                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1001                     ; 281                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1001                     ; 282 
1001                     ; 283 {
1002                     	switch	.text
1003  0133               _TIM3_BKRConfig:
1005  0133 89            	pushw	x
1006       00000000      OFST:	set	0
1009                     ; 285     assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1011                     ; 286     assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1013                     ; 287     assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1015                     ; 288     assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1017                     ; 289     assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1019                     ; 296     TIM3->BKR = (uint8_t)((uint8_t)TIM3_OSSIState|(uint8_t)TIM3_LockLevel| \
1019                     ; 297                           (uint8_t)TIM3_BreakState|(uint8_t)TIM3_BreakPolarity|\
1019                     ; 298                           (uint8_t)TIM3_AutomaticOutput);
1021  0134 9f            	ld	a,xl
1022  0135 1a01          	or	a,(OFST+1,sp)
1023  0137 1a05          	or	a,(OFST+5,sp)
1024  0139 1a06          	or	a,(OFST+6,sp)
1025  013b 1a07          	or	a,(OFST+7,sp)
1026  013d c75294        	ld	21140,a
1027                     ; 299 }
1030  0140 85            	popw	x
1031  0141 81            	ret
1215                     ; 310 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
1215                     ; 311                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1215                     ; 312                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
1215                     ; 313                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1215                     ; 314                  uint8_t TIM3_ICFilter)
1215                     ; 315 {
1216                     	switch	.text
1217  0142               _TIM3_ICInit:
1219  0142 89            	pushw	x
1220       00000000      OFST:	set	0
1223                     ; 317     assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1225                     ; 319     if (TIM3_Channel == TIM3_Channel_1)
1227  0143 9e            	ld	a,xh
1228  0144 4d            	tnz	a
1229  0145 2614          	jrne	L735
1230                     ; 322         TI1_Config(TIM3_ICPolarity,
1230                     ; 323                    TIM3_ICSelection,
1230                     ; 324                    TIM3_ICFilter);
1232  0147 7b07          	ld	a,(OFST+7,sp)
1233  0149 88            	push	a
1234  014a 7b06          	ld	a,(OFST+6,sp)
1235  014c 97            	ld	xl,a
1236  014d 7b03          	ld	a,(OFST+3,sp)
1237  014f 95            	ld	xh,a
1238  0150 cd05ea        	call	L3_TI1_Config
1240  0153 84            	pop	a
1241                     ; 327         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1243  0154 7b06          	ld	a,(OFST+6,sp)
1244  0156 cd04dc        	call	_TIM3_SetIC1Prescaler
1247  0159 2012          	jra	L145
1248  015b               L735:
1249                     ; 332         TI2_Config(TIM3_ICPolarity,
1249                     ; 333                    TIM3_ICSelection,
1249                     ; 334                    TIM3_ICFilter);
1251  015b 7b07          	ld	a,(OFST+7,sp)
1252  015d 88            	push	a
1253  015e 7b06          	ld	a,(OFST+6,sp)
1254  0160 97            	ld	xl,a
1255  0161 7b03          	ld	a,(OFST+3,sp)
1256  0163 95            	ld	xh,a
1257  0164 cd0627        	call	L5_TI2_Config
1259  0167 84            	pop	a
1260                     ; 336         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1262  0168 7b06          	ld	a,(OFST+6,sp)
1263  016a cd04f6        	call	_TIM3_SetIC2Prescaler
1265  016d               L145:
1266                     ; 338 }
1269  016d 85            	popw	x
1270  016e 81            	ret
1366                     ; 350 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1366                     ; 351                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1366                     ; 352                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1366                     ; 353                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1366                     ; 354                      uint8_t TIM3_ICFilter)
1366                     ; 355 {
1367                     	switch	.text
1368  016f               _TIM3_PWMIConfig:
1370  016f 89            	pushw	x
1371  0170 89            	pushw	x
1372       00000002      OFST:	set	2
1375                     ; 356     uint8_t icpolarity = TIM3_ICPolarity_Rising;
1377                     ; 357     uint8_t icselection = TIM3_ICSelection_DirectTI;
1379                     ; 360     assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1381                     ; 363     if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
1383  0171 9f            	ld	a,xl
1384  0172 4d            	tnz	a
1385  0173 2606          	jrne	L116
1386                     ; 365         icpolarity = TIM3_ICPolarity_Falling;
1388  0175 a601          	ld	a,#1
1389  0177 6b01          	ld	(OFST-1,sp),a
1391  0179 2002          	jra	L316
1392  017b               L116:
1393                     ; 369         icpolarity = TIM3_ICPolarity_Rising;
1395  017b 0f01          	clr	(OFST-1,sp)
1396  017d               L316:
1397                     ; 373     if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
1399  017d 7b07          	ld	a,(OFST+5,sp)
1400  017f a101          	cp	a,#1
1401  0181 2606          	jrne	L516
1402                     ; 375         icselection = TIM3_ICSelection_IndirectTI;
1404  0183 a602          	ld	a,#2
1405  0185 6b02          	ld	(OFST+0,sp),a
1407  0187 2004          	jra	L716
1408  0189               L516:
1409                     ; 379         icselection = TIM3_ICSelection_DirectTI;
1411  0189 a601          	ld	a,#1
1412  018b 6b02          	ld	(OFST+0,sp),a
1413  018d               L716:
1414                     ; 382     if (TIM3_Channel == TIM3_Channel_1)
1416  018d 0d03          	tnz	(OFST+1,sp)
1417  018f 2626          	jrne	L126
1418                     ; 385         TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
1418                     ; 386                    TIM3_ICFilter);
1420  0191 7b09          	ld	a,(OFST+7,sp)
1421  0193 88            	push	a
1422  0194 7b08          	ld	a,(OFST+6,sp)
1423  0196 97            	ld	xl,a
1424  0197 7b05          	ld	a,(OFST+3,sp)
1425  0199 95            	ld	xh,a
1426  019a cd05ea        	call	L3_TI1_Config
1428  019d 84            	pop	a
1429                     ; 389         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1431  019e 7b08          	ld	a,(OFST+6,sp)
1432  01a0 cd04dc        	call	_TIM3_SetIC1Prescaler
1434                     ; 392         TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1436  01a3 7b09          	ld	a,(OFST+7,sp)
1437  01a5 88            	push	a
1438  01a6 7b03          	ld	a,(OFST+1,sp)
1439  01a8 97            	ld	xl,a
1440  01a9 7b02          	ld	a,(OFST+0,sp)
1441  01ab 95            	ld	xh,a
1442  01ac cd0627        	call	L5_TI2_Config
1444  01af 84            	pop	a
1445                     ; 395         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1447  01b0 7b08          	ld	a,(OFST+6,sp)
1448  01b2 cd04f6        	call	_TIM3_SetIC2Prescaler
1451  01b5 2024          	jra	L326
1452  01b7               L126:
1453                     ; 400         TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
1453                     ; 401                    TIM3_ICFilter);
1455  01b7 7b09          	ld	a,(OFST+7,sp)
1456  01b9 88            	push	a
1457  01ba 7b08          	ld	a,(OFST+6,sp)
1458  01bc 97            	ld	xl,a
1459  01bd 7b05          	ld	a,(OFST+3,sp)
1460  01bf 95            	ld	xh,a
1461  01c0 cd0627        	call	L5_TI2_Config
1463  01c3 84            	pop	a
1464                     ; 404         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1466  01c4 7b08          	ld	a,(OFST+6,sp)
1467  01c6 cd04f6        	call	_TIM3_SetIC2Prescaler
1469                     ; 407         TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1471  01c9 7b09          	ld	a,(OFST+7,sp)
1472  01cb 88            	push	a
1473  01cc 7b03          	ld	a,(OFST+1,sp)
1474  01ce 97            	ld	xl,a
1475  01cf 7b02          	ld	a,(OFST+0,sp)
1476  01d1 95            	ld	xh,a
1477  01d2 cd05ea        	call	L3_TI1_Config
1479  01d5 84            	pop	a
1480                     ; 410         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1482  01d6 7b08          	ld	a,(OFST+6,sp)
1483  01d8 cd04dc        	call	_TIM3_SetIC1Prescaler
1485  01db               L326:
1486                     ; 412 }
1489  01db 5b04          	addw	sp,#4
1490  01dd 81            	ret
1545                     ; 420 void TIM3_Cmd(FunctionalState NewState)
1545                     ; 421 {
1546                     	switch	.text
1547  01de               _TIM3_Cmd:
1551                     ; 423     assert_param(IS_FUNCTIONAL_STATE(NewState));
1553                     ; 426     if (NewState != DISABLE)
1555  01de 4d            	tnz	a
1556  01df 2706          	jreq	L356
1557                     ; 428         TIM3->CR1 |= TIM_CR1_CEN;
1559  01e1 72105280      	bset	21120,#0
1561  01e5 2004          	jra	L556
1562  01e7               L356:
1563                     ; 432         TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1565  01e7 72115280      	bres	21120,#0
1566  01eb               L556:
1567                     ; 434 }
1570  01eb 81            	ret
1606                     ; 442 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1606                     ; 443 {
1607                     	switch	.text
1608  01ec               _TIM3_CtrlPWMOutputs:
1612                     ; 445     assert_param(IS_FUNCTIONAL_STATE(NewState));
1614                     ; 449     if (NewState != DISABLE)
1616  01ec 4d            	tnz	a
1617  01ed 2706          	jreq	L576
1618                     ; 451         TIM3->BKR |= TIM_BKR_MOE ;
1620  01ef 721e5294      	bset	21140,#7
1622  01f3 2004          	jra	L776
1623  01f5               L576:
1624                     ; 455         TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1626  01f5 721f5294      	bres	21140,#7
1627  01f9               L776:
1628                     ; 457 }
1631  01f9 81            	ret
1717                     ; 466 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1717                     ; 467 {
1718                     	switch	.text
1719  01fa               _TIM3_ITConfig:
1721  01fa 89            	pushw	x
1722       00000000      OFST:	set	0
1725                     ; 469     assert_param(IS_TIM3_IT(TIM3_IT));
1727                     ; 470     assert_param(IS_FUNCTIONAL_STATE(NewState));
1729                     ; 472     if (NewState != DISABLE)
1731  01fb 9f            	ld	a,xl
1732  01fc 4d            	tnz	a
1733  01fd 2709          	jreq	L147
1734                     ; 475         TIM3->IER |= (uint8_t)TIM3_IT;
1736  01ff 9e            	ld	a,xh
1737  0200 ca5284        	or	a,21124
1738  0203 c75284        	ld	21124,a
1740  0206 2009          	jra	L347
1741  0208               L147:
1742                     ; 480         TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
1744  0208 7b01          	ld	a,(OFST+1,sp)
1745  020a 43            	cpl	a
1746  020b c45284        	and	a,21124
1747  020e c75284        	ld	21124,a
1748  0211               L347:
1749                     ; 482 }
1752  0211 85            	popw	x
1753  0212 81            	ret
1777                     ; 490 void TIM3_InternalClockConfig(void)
1777                     ; 491 {
1778                     	switch	.text
1779  0213               _TIM3_InternalClockConfig:
1783                     ; 493     TIM3->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
1785  0213 c65282        	ld	a,21122
1786  0216 a4f8          	and	a,#248
1787  0218 c75282        	ld	21122,a
1788                     ; 494 }
1791  021b 81            	ret
1908                     ; 506 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1908                     ; 507                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1908                     ; 508                               uint8_t TIM3_ExtTRGFilter)
1908                     ; 509 {
1909                     	switch	.text
1910  021c               _TIM3_ETRClockMode1Config:
1912  021c 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 511     TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
1918  021d 7b05          	ld	a,(OFST+5,sp)
1919  021f 88            	push	a
1920  0220 9f            	ld	a,xl
1921  0221 97            	ld	xl,a
1922  0222 7b02          	ld	a,(OFST+2,sp)
1923  0224 95            	ld	xh,a
1924  0225 ad35          	call	_TIM3_ETRConfig
1926  0227 84            	pop	a
1927                     ; 514     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1929  0228 c65282        	ld	a,21122
1930  022b a4f8          	and	a,#248
1931  022d c75282        	ld	21122,a
1932                     ; 515     TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
1934  0230 c65282        	ld	a,21122
1935  0233 aa07          	or	a,#7
1936  0235 c75282        	ld	21122,a
1937                     ; 518     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1939  0238 c65282        	ld	a,21122
1940  023b a48f          	and	a,#143
1941  023d c75282        	ld	21122,a
1942                     ; 519     TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
1944  0240 c65282        	ld	a,21122
1945  0243 aa70          	or	a,#112
1946  0245 c75282        	ld	21122,a
1947                     ; 520 }
1950  0248 85            	popw	x
1951  0249 81            	ret
2009                     ; 531 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2009                     ; 532                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2009                     ; 533                               uint8_t TIM3_ExtTRGFilter)
2009                     ; 534 {
2010                     	switch	.text
2011  024a               _TIM3_ETRClockMode2Config:
2013  024a 89            	pushw	x
2014       00000000      OFST:	set	0
2017                     ; 536     TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
2019  024b 7b05          	ld	a,(OFST+5,sp)
2020  024d 88            	push	a
2021  024e 9f            	ld	a,xl
2022  024f 97            	ld	xl,a
2023  0250 7b02          	ld	a,(OFST+2,sp)
2024  0252 95            	ld	xh,a
2025  0253 ad07          	call	_TIM3_ETRConfig
2027  0255 84            	pop	a
2028                     ; 539     TIM3->ETR |= TIM_ETR_ECE ;
2030  0256 721c5283      	bset	21123,#6
2031                     ; 540 }
2034  025a 85            	popw	x
2035  025b 81            	ret
2091                     ; 552 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2091                     ; 553                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2091                     ; 554                     uint8_t TIM3_ExtTRGFilter)
2091                     ; 555 {
2092                     	switch	.text
2093  025c               _TIM3_ETRConfig:
2095  025c 89            	pushw	x
2096       00000000      OFST:	set	0
2099                     ; 557     assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
2101                     ; 558     assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
2103                     ; 559     assert_param(IS_TIM3_EXT_FILTER(TIM3_ExtTRGFilter));
2105                     ; 561     TIM3->ETR |= (uint8_t)((uint8_t)TIM3_ExtTRGPrescaler|(uint8_t)TIM3_ExtTRGPolarity|(uint8_t)TIM3_ExtTRGFilter);
2107  025d 9f            	ld	a,xl
2108  025e 1a01          	or	a,(OFST+1,sp)
2109  0260 1a05          	or	a,(OFST+5,sp)
2110  0262 ca5283        	or	a,21123
2111  0265 c75283        	ld	21123,a
2112                     ; 562 }
2115  0268 85            	popw	x
2116  0269 81            	ret
2205                     ; 574 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
2205                     ; 575                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2205                     ; 576                                  uint8_t TIM3_ICFilter)
2205                     ; 577 {
2206                     	switch	.text
2207  026a               _TIM3_TIxExternalClockConfig:
2209  026a 89            	pushw	x
2210       00000000      OFST:	set	0
2213                     ; 579     assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
2215                     ; 580     assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
2217                     ; 581     assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
2219                     ; 584     if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
2221  026b 9e            	ld	a,xh
2222  026c a160          	cp	a,#96
2223  026e 260f          	jrne	L3411
2224                     ; 586         TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2226  0270 7b05          	ld	a,(OFST+5,sp)
2227  0272 88            	push	a
2228  0273 ae0001        	ldw	x,#1
2229  0276 7b03          	ld	a,(OFST+3,sp)
2230  0278 95            	ld	xh,a
2231  0279 cd0627        	call	L5_TI2_Config
2233  027c 84            	pop	a
2235  027d 200d          	jra	L5411
2236  027f               L3411:
2237                     ; 590         TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2239  027f 7b05          	ld	a,(OFST+5,sp)
2240  0281 88            	push	a
2241  0282 ae0001        	ldw	x,#1
2242  0285 7b03          	ld	a,(OFST+3,sp)
2243  0287 95            	ld	xh,a
2244  0288 cd05ea        	call	L3_TI1_Config
2246  028b 84            	pop	a
2247  028c               L5411:
2248                     ; 594     TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
2250  028c 7b01          	ld	a,(OFST+1,sp)
2251  028e ad0a          	call	_TIM3_SelectInputTrigger
2253                     ; 597     TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
2255  0290 c65282        	ld	a,21122
2256  0293 aa07          	or	a,#7
2257  0295 c75282        	ld	21122,a
2258                     ; 598 }
2261  0298 85            	popw	x
2262  0299 81            	ret
2362                     ; 606 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
2362                     ; 607 {
2363                     	switch	.text
2364  029a               _TIM3_SelectInputTrigger:
2366  029a 88            	push	a
2367  029b 88            	push	a
2368       00000001      OFST:	set	1
2371                     ; 608     uint8_t tmpsmcr = 0;
2373                     ; 611     assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
2375                     ; 613     tmpsmcr = TIM3->SMCR;
2377  029c c65282        	ld	a,21122
2378  029f 6b01          	ld	(OFST+0,sp),a
2379                     ; 616     tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2381  02a1 7b01          	ld	a,(OFST+0,sp)
2382  02a3 a48f          	and	a,#143
2383  02a5 6b01          	ld	(OFST+0,sp),a
2384                     ; 617     tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
2386  02a7 7b01          	ld	a,(OFST+0,sp)
2387  02a9 1a02          	or	a,(OFST+1,sp)
2388  02ab 6b01          	ld	(OFST+0,sp),a
2389                     ; 619     TIM3->SMCR = (uint8_t)tmpsmcr;
2391  02ad 7b01          	ld	a,(OFST+0,sp)
2392  02af c75282        	ld	21122,a
2393                     ; 620 }
2396  02b2 85            	popw	x
2397  02b3 81            	ret
2433                     ; 629 void TIM3_UpdateDisableConfig(FunctionalState NewState)
2433                     ; 630 {
2434                     	switch	.text
2435  02b4               _TIM3_UpdateDisableConfig:
2439                     ; 632     assert_param(IS_FUNCTIONAL_STATE(NewState));
2441                     ; 635     if (NewState != DISABLE)
2443  02b4 4d            	tnz	a
2444  02b5 2706          	jreq	L7221
2445                     ; 637         TIM3->CR1 |= TIM_CR1_UDIS;
2447  02b7 72125280      	bset	21120,#1
2449  02bb 2004          	jra	L1321
2450  02bd               L7221:
2451                     ; 641         TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2453  02bd 72135280      	bres	21120,#1
2454  02c1               L1321:
2455                     ; 643 }
2458  02c1 81            	ret
2516                     ; 651 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
2516                     ; 652 {
2517                     	switch	.text
2518  02c2               _TIM3_UpdateRequestConfig:
2522                     ; 654     assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
2524                     ; 657     if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
2526  02c2 a101          	cp	a,#1
2527  02c4 2606          	jrne	L1621
2528                     ; 659         TIM3->CR1 |= TIM_CR1_URS ;
2530  02c6 72145280      	bset	21120,#2
2532  02ca 2004          	jra	L3621
2533  02cc               L1621:
2534                     ; 663         TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
2536  02cc 72155280      	bres	21120,#2
2537  02d0               L3621:
2538                     ; 665 }
2541  02d0 81            	ret
2577                     ; 673 void TIM3_SelectHallSensor(FunctionalState NewState)
2577                     ; 674 {
2578                     	switch	.text
2579  02d1               _TIM3_SelectHallSensor:
2583                     ; 676     assert_param(IS_FUNCTIONAL_STATE(NewState));
2585                     ; 679     if (NewState != DISABLE)
2587  02d1 4d            	tnz	a
2588  02d2 2706          	jreq	L3031
2589                     ; 681         TIM3->CR2 |= TIM_CR2_TI1S;
2591  02d4 721e5281      	bset	21121,#7
2593  02d8 2004          	jra	L5031
2594  02da               L3031:
2595                     ; 685         TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2597  02da 721f5281      	bres	21121,#7
2598  02de               L5031:
2599                     ; 687 }
2602  02de 81            	ret
2659                     ; 695 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
2659                     ; 696 {
2660                     	switch	.text
2661  02df               _TIM3_SelectOnePulseMode:
2665                     ; 698     assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
2667                     ; 701     if (TIM3_OPMode == TIM3_OPMode_Single)
2669  02df a101          	cp	a,#1
2670  02e1 2606          	jrne	L5331
2671                     ; 703         TIM3->CR1 |= TIM_CR1_OPM ;
2673  02e3 72165280      	bset	21120,#3
2675  02e7 2004          	jra	L7331
2676  02e9               L5331:
2677                     ; 707         TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2679  02e9 72175280      	bres	21120,#3
2680  02ed               L7331:
2681                     ; 709 }
2684  02ed 81            	ret
2783                     ; 717 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
2783                     ; 718 {
2784                     	switch	.text
2785  02ee               _TIM3_SelectOutputTrigger:
2787  02ee 88            	push	a
2788  02ef 88            	push	a
2789       00000001      OFST:	set	1
2792                     ; 719     uint8_t tmpcr2 = 0;
2794                     ; 722     assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
2796                     ; 724     tmpcr2 = TIM3->CR2;
2798  02f0 c65281        	ld	a,21121
2799  02f3 6b01          	ld	(OFST+0,sp),a
2800                     ; 727     tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2802  02f5 7b01          	ld	a,(OFST+0,sp)
2803  02f7 a48f          	and	a,#143
2804  02f9 6b01          	ld	(OFST+0,sp),a
2805                     ; 730     tmpcr2 |=  (uint8_t)TIM3_TRGOSource;
2807  02fb 7b01          	ld	a,(OFST+0,sp)
2808  02fd 1a02          	or	a,(OFST+1,sp)
2809  02ff 6b01          	ld	(OFST+0,sp),a
2810                     ; 732     TIM3->CR2 = tmpcr2;
2812  0301 7b01          	ld	a,(OFST+0,sp)
2813  0303 c75281        	ld	21121,a
2814                     ; 733 }
2817  0306 85            	popw	x
2818  0307 81            	ret
2901                     ; 741 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
2901                     ; 742 {
2902                     	switch	.text
2903  0308               _TIM3_SelectSlaveMode:
2905  0308 88            	push	a
2906  0309 88            	push	a
2907       00000001      OFST:	set	1
2910                     ; 743     uint8_t tmpsmcr = 0;
2912                     ; 746     assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
2914                     ; 748     tmpsmcr = TIM3->SMCR;
2916  030a c65282        	ld	a,21122
2917  030d 6b01          	ld	(OFST+0,sp),a
2918                     ; 751     tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2920  030f 7b01          	ld	a,(OFST+0,sp)
2921  0311 a4f8          	and	a,#248
2922  0313 6b01          	ld	(OFST+0,sp),a
2923                     ; 754     tmpsmcr |= (uint8_t)TIM3_SlaveMode;
2925  0315 7b01          	ld	a,(OFST+0,sp)
2926  0317 1a02          	or	a,(OFST+1,sp)
2927  0319 6b01          	ld	(OFST+0,sp),a
2928                     ; 756     TIM3->SMCR = tmpsmcr;
2930  031b 7b01          	ld	a,(OFST+0,sp)
2931  031d c75282        	ld	21122,a
2932                     ; 757 }
2935  0320 85            	popw	x
2936  0321 81            	ret
2972                     ; 765 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
2972                     ; 766 {
2973                     	switch	.text
2974  0322               _TIM3_SelectMasterSlaveMode:
2978                     ; 768     assert_param(IS_FUNCTIONAL_STATE(NewState));
2980                     ; 771     if (NewState != DISABLE)
2982  0322 4d            	tnz	a
2983  0323 2706          	jreq	L7541
2984                     ; 773         TIM3->SMCR |= TIM_SMCR_MSM;
2986  0325 721e5282      	bset	21122,#7
2988  0329 2004          	jra	L1641
2989  032b               L7541:
2990                     ; 777         TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2992  032b 721f5282      	bres	21122,#7
2993  032f               L1641:
2994                     ; 779 }
2997  032f 81            	ret
3110                     ; 791 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
3110                     ; 792                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
3110                     ; 793                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
3110                     ; 794 {
3111                     	switch	.text
3112  0330               _TIM3_EncoderInterfaceConfig:
3114  0330 89            	pushw	x
3115  0331 5203          	subw	sp,#3
3116       00000003      OFST:	set	3
3119                     ; 795     uint8_t tmpsmcr = 0;
3121                     ; 796     uint8_t tmpccmr1 = 0;
3123                     ; 797     uint8_t tmpccmr2 = 0;
3125                     ; 800     assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
3127                     ; 801     assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
3129                     ; 802     assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
3131                     ; 804     tmpsmcr = TIM3->SMCR;
3133  0333 c65282        	ld	a,21122
3134  0336 6b01          	ld	(OFST-2,sp),a
3135                     ; 805     tmpccmr1 = TIM3->CCMR1;
3137  0338 c65288        	ld	a,21128
3138  033b 6b02          	ld	(OFST-1,sp),a
3139                     ; 806     tmpccmr2 = TIM3->CCMR2;
3141  033d c65289        	ld	a,21129
3142  0340 6b03          	ld	(OFST+0,sp),a
3143                     ; 809     tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3145  0342 7b01          	ld	a,(OFST-2,sp)
3146  0344 a4f0          	and	a,#240
3147  0346 6b01          	ld	(OFST-2,sp),a
3148                     ; 810     tmpsmcr |= (uint8_t)TIM3_EncoderMode;
3150  0348 9e            	ld	a,xh
3151  0349 1a01          	or	a,(OFST-2,sp)
3152  034b 6b01          	ld	(OFST-2,sp),a
3153                     ; 813     tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3155  034d 7b02          	ld	a,(OFST-1,sp)
3156  034f a4fc          	and	a,#252
3157  0351 6b02          	ld	(OFST-1,sp),a
3158                     ; 814     tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3160  0353 7b03          	ld	a,(OFST+0,sp)
3161  0355 a4fc          	and	a,#252
3162  0357 6b03          	ld	(OFST+0,sp),a
3163                     ; 815     tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3165  0359 7b02          	ld	a,(OFST-1,sp)
3166  035b aa01          	or	a,#1
3167  035d 6b02          	ld	(OFST-1,sp),a
3168                     ; 816     tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3170  035f 7b03          	ld	a,(OFST+0,sp)
3171  0361 aa01          	or	a,#1
3172  0363 6b03          	ld	(OFST+0,sp),a
3173                     ; 819     if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
3175  0365 9f            	ld	a,xl
3176  0366 a101          	cp	a,#1
3177  0368 2606          	jrne	L7351
3178                     ; 821         TIM3->CCER1 |= TIM_CCER1_CC1P ;
3180  036a 7212528a      	bset	21130,#1
3182  036e 2004          	jra	L1451
3183  0370               L7351:
3184                     ; 825         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3186  0370 7213528a      	bres	21130,#1
3187  0374               L1451:
3188                     ; 828     if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
3190  0374 7b08          	ld	a,(OFST+5,sp)
3191  0376 a101          	cp	a,#1
3192  0378 2606          	jrne	L3451
3193                     ; 830         TIM3->CCER1 |= TIM_CCER1_CC2P ;
3195  037a 721a528a      	bset	21130,#5
3197  037e 2004          	jra	L5451
3198  0380               L3451:
3199                     ; 834         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3201  0380 721b528a      	bres	21130,#5
3202  0384               L5451:
3203                     ; 837     TIM3->SMCR = tmpsmcr;
3205  0384 7b01          	ld	a,(OFST-2,sp)
3206  0386 c75282        	ld	21122,a
3207                     ; 838     TIM3->CCMR1 = tmpccmr1;
3209  0389 7b02          	ld	a,(OFST-1,sp)
3210  038b c75288        	ld	21128,a
3211                     ; 839     TIM3->CCMR2 = tmpccmr2;
3213  038e 7b03          	ld	a,(OFST+0,sp)
3214  0390 c75289        	ld	21129,a
3215                     ; 840 }
3218  0393 5b05          	addw	sp,#5
3219  0395 81            	ret
3287                     ; 850 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef TIM3_Prescaler,
3287                     ; 851                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
3287                     ; 852 {
3288                     	switch	.text
3289  0396               _TIM3_PrescalerConfig:
3293                     ; 854     assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
3295                     ; 855     assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
3297                     ; 858     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
3299  0396 9e            	ld	a,xh
3300  0397 c7528d        	ld	21133,a
3301                     ; 862     if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
3303  039a 9f            	ld	a,xl
3304  039b a101          	cp	a,#1
3305  039d 2606          	jrne	L1061
3306                     ; 864         TIM3->EGR |= TIM_EGR_UG ;
3308  039f 72105287      	bset	21127,#0
3310  03a3 2004          	jra	L3061
3311  03a5               L1061:
3312                     ; 868         TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3314  03a5 72115287      	bres	21127,#0
3315  03a9               L3061:
3316                     ; 870 }
3319  03a9 81            	ret
3364                     ; 878 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
3364                     ; 879 {
3365                     	switch	.text
3366  03aa               _TIM3_CounterModeConfig:
3368  03aa 88            	push	a
3369  03ab 88            	push	a
3370       00000001      OFST:	set	1
3373                     ; 880     uint8_t tmpcr1 = 0;
3375                     ; 883     assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
3377                     ; 885     tmpcr1 = TIM3->CR1;
3379  03ac c65280        	ld	a,21120
3380  03af 6b01          	ld	(OFST+0,sp),a
3381                     ; 888     tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3383  03b1 7b01          	ld	a,(OFST+0,sp)
3384  03b3 a48f          	and	a,#143
3385  03b5 6b01          	ld	(OFST+0,sp),a
3386                     ; 891     tmpcr1 |= (uint8_t)TIM3_CounterMode;
3388  03b7 7b01          	ld	a,(OFST+0,sp)
3389  03b9 1a02          	or	a,(OFST+1,sp)
3390  03bb 6b01          	ld	(OFST+0,sp),a
3391                     ; 893     TIM3->CR1 = tmpcr1;
3393  03bd 7b01          	ld	a,(OFST+0,sp)
3394  03bf c75280        	ld	21120,a
3395                     ; 894 }
3398  03c2 85            	popw	x
3399  03c3 81            	ret
3466                     ; 902 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3466                     ; 903 {
3467                     	switch	.text
3468  03c4               _TIM3_ForcedOC1Config:
3470  03c4 88            	push	a
3471  03c5 88            	push	a
3472       00000001      OFST:	set	1
3475                     ; 904     uint8_t tmpccmr1 = 0;
3477                     ; 907     assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3479                     ; 909     tmpccmr1 = TIM3->CCMR1;
3481  03c6 c65288        	ld	a,21128
3482  03c9 6b01          	ld	(OFST+0,sp),a
3483                     ; 912     tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3485  03cb 7b01          	ld	a,(OFST+0,sp)
3486  03cd a48f          	and	a,#143
3487  03cf 6b01          	ld	(OFST+0,sp),a
3488                     ; 915     tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
3490  03d1 7b01          	ld	a,(OFST+0,sp)
3491  03d3 1a02          	or	a,(OFST+1,sp)
3492  03d5 6b01          	ld	(OFST+0,sp),a
3493                     ; 917     TIM3->CCMR1 = tmpccmr1;
3495  03d7 7b01          	ld	a,(OFST+0,sp)
3496  03d9 c75288        	ld	21128,a
3497                     ; 918 }
3500  03dc 85            	popw	x
3501  03dd 81            	ret
3546                     ; 926 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3546                     ; 927 {
3547                     	switch	.text
3548  03de               _TIM3_ForcedOC2Config:
3550  03de 88            	push	a
3551  03df 88            	push	a
3552       00000001      OFST:	set	1
3555                     ; 928     uint8_t tmpccmr2 = 0;
3557                     ; 931     assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3559                     ; 933     tmpccmr2 = TIM3->CCMR2;
3561  03e0 c65289        	ld	a,21129
3562  03e3 6b01          	ld	(OFST+0,sp),a
3563                     ; 936     tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3565  03e5 7b01          	ld	a,(OFST+0,sp)
3566  03e7 a48f          	and	a,#143
3567  03e9 6b01          	ld	(OFST+0,sp),a
3568                     ; 939     tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
3570  03eb 7b01          	ld	a,(OFST+0,sp)
3571  03ed 1a02          	or	a,(OFST+1,sp)
3572  03ef 6b01          	ld	(OFST+0,sp),a
3573                     ; 941     TIM3->CCMR2 = tmpccmr2;
3575  03f1 7b01          	ld	a,(OFST+0,sp)
3576  03f3 c75289        	ld	21129,a
3577                     ; 942 }
3580  03f6 85            	popw	x
3581  03f7 81            	ret
3617                     ; 950 void TIM3_ARRPreloadConfig(FunctionalState NewState)
3617                     ; 951 {
3618                     	switch	.text
3619  03f8               _TIM3_ARRPreloadConfig:
3623                     ; 953     assert_param(IS_FUNCTIONAL_STATE(NewState));
3625                     ; 956     if (NewState != DISABLE)
3627  03f8 4d            	tnz	a
3628  03f9 2706          	jreq	L1271
3629                     ; 958         TIM3->CR1 |= TIM_CR1_ARPE;
3631  03fb 721e5280      	bset	21120,#7
3633  03ff 2004          	jra	L3271
3634  0401               L1271:
3635                     ; 962         TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3637  0401 721f5280      	bres	21120,#7
3638  0405               L3271:
3639                     ; 964 }
3642  0405 81            	ret
3678                     ; 972 void TIM3_OC1PreloadConfig(FunctionalState NewState)
3678                     ; 973 {
3679                     	switch	.text
3680  0406               _TIM3_OC1PreloadConfig:
3684                     ; 975     assert_param(IS_FUNCTIONAL_STATE(NewState));
3686                     ; 978     if (NewState != DISABLE)
3688  0406 4d            	tnz	a
3689  0407 2706          	jreq	L3471
3690                     ; 980         TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
3692  0409 72165288      	bset	21128,#3
3694  040d 2004          	jra	L5471
3695  040f               L3471:
3696                     ; 984         TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3698  040f 72175288      	bres	21128,#3
3699  0413               L5471:
3700                     ; 986 }
3703  0413 81            	ret
3739                     ; 994 void TIM3_OC2PreloadConfig(FunctionalState NewState)
3739                     ; 995 {
3740                     	switch	.text
3741  0414               _TIM3_OC2PreloadConfig:
3745                     ; 997     assert_param(IS_FUNCTIONAL_STATE(NewState));
3747                     ; 1000     if (NewState != DISABLE)
3749  0414 4d            	tnz	a
3750  0415 2706          	jreq	L5671
3751                     ; 1002         TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
3753  0417 72165289      	bset	21129,#3
3755  041b 2004          	jra	L7671
3756  041d               L5671:
3757                     ; 1006         TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3759  041d 72175289      	bres	21129,#3
3760  0421               L7671:
3761                     ; 1008 }
3764  0421 81            	ret
3799                     ; 1016 void TIM3_OC1FastCmd(FunctionalState NewState)
3799                     ; 1017 {
3800                     	switch	.text
3801  0422               _TIM3_OC1FastCmd:
3805                     ; 1019     assert_param(IS_FUNCTIONAL_STATE(NewState));
3807                     ; 1022     if (NewState != DISABLE)
3809  0422 4d            	tnz	a
3810  0423 2706          	jreq	L7002
3811                     ; 1024         TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
3813  0425 72145288      	bset	21128,#2
3815  0429 2004          	jra	L1102
3816  042b               L7002:
3817                     ; 1028         TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3819  042b 72155288      	bres	21128,#2
3820  042f               L1102:
3821                     ; 1030 }
3824  042f 81            	ret
3859                     ; 1038 void TIM3_OC2FastCmd(FunctionalState NewState)
3859                     ; 1039 {
3860                     	switch	.text
3861  0430               _TIM3_OC2FastCmd:
3865                     ; 1041     assert_param(IS_FUNCTIONAL_STATE(NewState));
3867                     ; 1044     if (NewState != DISABLE)
3869  0430 4d            	tnz	a
3870  0431 2706          	jreq	L1302
3871                     ; 1046         TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
3873  0433 72145289      	bset	21129,#2
3875  0437 2004          	jra	L3302
3876  0439               L1302:
3877                     ; 1050         TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3879  0439 72155289      	bres	21129,#2
3880  043d               L3302:
3881                     ; 1052 }
3884  043d 81            	ret
3965                     ; 1060 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3965                     ; 1061 {
3966                     	switch	.text
3967  043e               _TIM3_GenerateEvent:
3971                     ; 1063     assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3973                     ; 1066     TIM3->EGR |= (uint8_t)TIM3_EventSource;
3975  043e ca5287        	or	a,21127
3976  0441 c75287        	ld	21127,a
3977                     ; 1067 }
3980  0444 81            	ret
4016                     ; 1075 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4016                     ; 1076 {
4017                     	switch	.text
4018  0445               _TIM3_OC1PolarityConfig:
4022                     ; 1078     assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4024                     ; 1081     if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4026  0445 a101          	cp	a,#1
4027  0447 2606          	jrne	L7012
4028                     ; 1083         TIM3->CCER1 |= TIM_CCER1_CC1P ;
4030  0449 7212528a      	bset	21130,#1
4032  044d 2004          	jra	L1112
4033  044f               L7012:
4034                     ; 1087         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4036  044f 7213528a      	bres	21130,#1
4037  0453               L1112:
4038                     ; 1089 }
4041  0453 81            	ret
4077                     ; 1097 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4077                     ; 1098 {
4078                     	switch	.text
4079  0454               _TIM3_OC2PolarityConfig:
4083                     ; 1100     assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4085                     ; 1103     if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4087  0454 a101          	cp	a,#1
4088  0456 2606          	jrne	L1312
4089                     ; 1105         TIM3->CCER1 |= TIM_CCER1_CC2P ;
4091  0458 721a528a      	bset	21130,#5
4093  045c 2004          	jra	L3312
4094  045e               L1312:
4095                     ; 1109         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4097  045e 721b528a      	bres	21130,#5
4098  0462               L3312:
4099                     ; 1111 }
4102  0462 81            	ret
4147                     ; 1121 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
4147                     ; 1122                  FunctionalState NewState)
4147                     ; 1123 {
4148                     	switch	.text
4149  0463               _TIM3_CCxCmd:
4151  0463 89            	pushw	x
4152       00000000      OFST:	set	0
4155                     ; 1125     assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4157                     ; 1126     assert_param(IS_FUNCTIONAL_STATE(NewState));
4159                     ; 1128     if (TIM3_Channel == TIM3_Channel_1)
4161  0464 9e            	ld	a,xh
4162  0465 4d            	tnz	a
4163  0466 2610          	jrne	L7512
4164                     ; 1131         if (NewState != DISABLE)
4166  0468 9f            	ld	a,xl
4167  0469 4d            	tnz	a
4168  046a 2706          	jreq	L1612
4169                     ; 1133             TIM3->CCER1 |= TIM_CCER1_CC1E ;
4171  046c 7210528a      	bset	21130,#0
4173  0470 2014          	jra	L5612
4174  0472               L1612:
4175                     ; 1137             TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4177  0472 7211528a      	bres	21130,#0
4178  0476 200e          	jra	L5612
4179  0478               L7512:
4180                     ; 1144         if (NewState != DISABLE)
4182  0478 0d02          	tnz	(OFST+2,sp)
4183  047a 2706          	jreq	L7612
4184                     ; 1146             TIM3->CCER1 |= TIM_CCER1_CC2E;
4186  047c 7218528a      	bset	21130,#4
4188  0480 2004          	jra	L5612
4189  0482               L7612:
4190                     ; 1150             TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4192  0482 7219528a      	bres	21130,#4
4193  0486               L5612:
4194                     ; 1153 }
4197  0486 85            	popw	x
4198  0487 81            	ret
4243                     ; 1165 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
4243                     ; 1166                      TIM3_OCMode_TypeDef TIM3_OCMode)
4243                     ; 1167 {
4244                     	switch	.text
4245  0488               _TIM3_SelectOCxM:
4247  0488 89            	pushw	x
4248       00000000      OFST:	set	0
4251                     ; 1169     assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4253                     ; 1170     assert_param(IS_TIM3_OCM(TIM3_OCMode));
4255                     ; 1172     if (TIM3_Channel == TIM3_Channel_1)
4257  0489 9e            	ld	a,xh
4258  048a 4d            	tnz	a
4259  048b 2615          	jrne	L5122
4260                     ; 1175         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4262  048d 7211528a      	bres	21130,#0
4263                     ; 1178         TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4265  0491 c65288        	ld	a,21128
4266  0494 a48f          	and	a,#143
4267  0496 c75288        	ld	21128,a
4268                     ; 1181         TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
4270  0499 9f            	ld	a,xl
4271  049a ca5288        	or	a,21128
4272  049d c75288        	ld	21128,a
4274  04a0 2014          	jra	L7122
4275  04a2               L5122:
4276                     ; 1186         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4278  04a2 7219528a      	bres	21130,#4
4279                     ; 1189         TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4281  04a6 c65289        	ld	a,21129
4282  04a9 a48f          	and	a,#143
4283  04ab c75289        	ld	21129,a
4284                     ; 1192         TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
4286  04ae c65289        	ld	a,21129
4287  04b1 1a02          	or	a,(OFST+2,sp)
4288  04b3 c75289        	ld	21129,a
4289  04b6               L7122:
4290                     ; 1194 }
4293  04b6 85            	popw	x
4294  04b7 81            	ret
4328                     ; 1202 void TIM3_SetCounter(uint16_t TIM3_Counter)
4328                     ; 1203 {
4329                     	switch	.text
4330  04b8               _TIM3_SetCounter:
4334                     ; 1206     TIM3->CNTRH = (uint8_t)(TIM3_Counter >> 8);
4336  04b8 9e            	ld	a,xh
4337  04b9 c7528b        	ld	21131,a
4338                     ; 1207     TIM3->CNTRL = (uint8_t)(TIM3_Counter);
4340  04bc 9f            	ld	a,xl
4341  04bd c7528c        	ld	21132,a
4342                     ; 1208 }
4345  04c0 81            	ret
4379                     ; 1216 void TIM3_SetAutoreload(uint16_t TIM3_Autoreload)
4379                     ; 1217 {
4380                     	switch	.text
4381  04c1               _TIM3_SetAutoreload:
4385                     ; 1219     TIM3->ARRH = (uint8_t)(TIM3_Autoreload >> 8);
4387  04c1 9e            	ld	a,xh
4388  04c2 c7528e        	ld	21134,a
4389                     ; 1220     TIM3->ARRL = (uint8_t)(TIM3_Autoreload);
4391  04c5 9f            	ld	a,xl
4392  04c6 c7528f        	ld	21135,a
4393                     ; 1221 }
4396  04c9 81            	ret
4430                     ; 1229 void TIM3_SetCompare1(uint16_t TIM3_Compare)
4430                     ; 1230 {
4431                     	switch	.text
4432  04ca               _TIM3_SetCompare1:
4436                     ; 1232     TIM3->CCR1H = (uint8_t)(TIM3_Compare >> 8);
4438  04ca 9e            	ld	a,xh
4439  04cb c75290        	ld	21136,a
4440                     ; 1233     TIM3->CCR1L = (uint8_t)(TIM3_Compare);
4442  04ce 9f            	ld	a,xl
4443  04cf c75291        	ld	21137,a
4444                     ; 1234 }
4447  04d2 81            	ret
4481                     ; 1242 void TIM3_SetCompare2(uint16_t TIM3_Compare)
4481                     ; 1243 {
4482                     	switch	.text
4483  04d3               _TIM3_SetCompare2:
4487                     ; 1245     TIM3->CCR2H = (uint8_t)(TIM3_Compare >> 8);
4489  04d3 9e            	ld	a,xh
4490  04d4 c75292        	ld	21138,a
4491                     ; 1246     TIM3->CCR2L = (uint8_t)(TIM3_Compare);
4493  04d7 9f            	ld	a,xl
4494  04d8 c75293        	ld	21139,a
4495                     ; 1247 }
4498  04db 81            	ret
4543                     ; 1255 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
4543                     ; 1256 {
4544                     	switch	.text
4545  04dc               _TIM3_SetIC1Prescaler:
4547  04dc 88            	push	a
4548  04dd 88            	push	a
4549       00000001      OFST:	set	1
4552                     ; 1257     uint8_t tmpccmr1 = 0;
4554                     ; 1260     assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
4556                     ; 1262     tmpccmr1 = TIM3->CCMR1;
4558  04de c65288        	ld	a,21128
4559  04e1 6b01          	ld	(OFST+0,sp),a
4560                     ; 1265     tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4562  04e3 7b01          	ld	a,(OFST+0,sp)
4563  04e5 a4f3          	and	a,#243
4564  04e7 6b01          	ld	(OFST+0,sp),a
4565                     ; 1268     tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
4567  04e9 7b01          	ld	a,(OFST+0,sp)
4568  04eb 1a02          	or	a,(OFST+1,sp)
4569  04ed 6b01          	ld	(OFST+0,sp),a
4570                     ; 1270     TIM3->CCMR1 = tmpccmr1;
4572  04ef 7b01          	ld	a,(OFST+0,sp)
4573  04f1 c75288        	ld	21128,a
4574                     ; 1271 }
4577  04f4 85            	popw	x
4578  04f5 81            	ret
4623                     ; 1279 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
4623                     ; 1280 {
4624                     	switch	.text
4625  04f6               _TIM3_SetIC2Prescaler:
4627  04f6 88            	push	a
4628  04f7 88            	push	a
4629       00000001      OFST:	set	1
4632                     ; 1281     uint8_t tmpccmr2 = 0;
4634                     ; 1284     assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
4636                     ; 1286     tmpccmr2 = TIM3->CCMR2;
4638  04f8 c65289        	ld	a,21129
4639  04fb 6b01          	ld	(OFST+0,sp),a
4640                     ; 1289     tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4642  04fd 7b01          	ld	a,(OFST+0,sp)
4643  04ff a4f3          	and	a,#243
4644  0501 6b01          	ld	(OFST+0,sp),a
4645                     ; 1292     tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
4647  0503 7b01          	ld	a,(OFST+0,sp)
4648  0505 1a02          	or	a,(OFST+1,sp)
4649  0507 6b01          	ld	(OFST+0,sp),a
4650                     ; 1294     TIM3->CCMR2 = tmpccmr2;
4652  0509 7b01          	ld	a,(OFST+0,sp)
4653  050b c75289        	ld	21129,a
4654                     ; 1295 }
4657  050e 85            	popw	x
4658  050f 81            	ret
4710                     ; 1303 uint16_t TIM3_GetCapture1(void)
4710                     ; 1304 {
4711                     	switch	.text
4712  0510               _TIM3_GetCapture1:
4714  0510 5204          	subw	sp,#4
4715       00000004      OFST:	set	4
4718                     ; 1305     uint16_t tmpccr1 = 0;
4720                     ; 1308     tmpccr1h = TIM3->CCR1H;
4722  0512 c65290        	ld	a,21136
4723  0515 6b02          	ld	(OFST-2,sp),a
4724                     ; 1309     tmpccr1l = TIM3->CCR1L;
4726  0517 c65291        	ld	a,21137
4727  051a 6b01          	ld	(OFST-3,sp),a
4728                     ; 1311     tmpccr1 = (uint16_t)(tmpccr1l);
4730  051c 7b01          	ld	a,(OFST-3,sp)
4731  051e 5f            	clrw	x
4732  051f 97            	ld	xl,a
4733  0520 1f03          	ldw	(OFST-1,sp),x
4734                     ; 1312     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
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
4747                     ; 1314     return ((uint16_t)tmpccr1);
4749  0531 1e03          	ldw	x,(OFST-1,sp)
4752  0533 5b04          	addw	sp,#4
4753  0535 81            	ret
4805                     ; 1323 uint16_t TIM3_GetCapture2(void)
4805                     ; 1324 {
4806                     	switch	.text
4807  0536               _TIM3_GetCapture2:
4809  0536 5204          	subw	sp,#4
4810       00000004      OFST:	set	4
4813                     ; 1325     uint16_t tmpccr2 = 0;
4815                     ; 1328     tmpccr2h = TIM3->CCR2H;
4817  0538 c65292        	ld	a,21138
4818  053b 6b02          	ld	(OFST-2,sp),a
4819                     ; 1329     tmpccr2l = TIM3->CCR2L;
4821  053d c65293        	ld	a,21139
4822  0540 6b01          	ld	(OFST-3,sp),a
4823                     ; 1331     tmpccr2 = (uint16_t)(tmpccr2l);
4825  0542 7b01          	ld	a,(OFST-3,sp)
4826  0544 5f            	clrw	x
4827  0545 97            	ld	xl,a
4828  0546 1f03          	ldw	(OFST-1,sp),x
4829                     ; 1332     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
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
4842                     ; 1334     return ((uint16_t)tmpccr2);
4844  0557 1e03          	ldw	x,(OFST-1,sp)
4847  0559 5b04          	addw	sp,#4
4848  055b 81            	ret
4900                     ; 1343 uint16_t TIM3_GetCounter(void)
4900                     ; 1344 {
4901                     	switch	.text
4902  055c               _TIM3_GetCounter:
4904  055c 5204          	subw	sp,#4
4905       00000004      OFST:	set	4
4908                     ; 1345     uint16_t tmpcnt = 0;
4910                     ; 1348     tmpcntrh = TIM3->CNTRH;
4912  055e c6528b        	ld	a,21131
4913  0561 6b02          	ld	(OFST-2,sp),a
4914                     ; 1349     tmpcntrl = TIM3->CNTRL;
4916  0563 c6528c        	ld	a,21132
4917  0566 6b01          	ld	(OFST-3,sp),a
4918                     ; 1351     tmpcnt = (uint16_t)(tmpcntrl);
4920  0568 7b01          	ld	a,(OFST-3,sp)
4921  056a 5f            	clrw	x
4922  056b 97            	ld	xl,a
4923  056c 1f03          	ldw	(OFST-1,sp),x
4924                     ; 1352     tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
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
4937                     ; 1354     return ((uint16_t)tmpcnt);
4939  057d 1e03          	ldw	x,(OFST-1,sp)
4942  057f 5b04          	addw	sp,#4
4943  0581 81            	ret
4967                     ; 1363 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
4967                     ; 1364 {
4968                     	switch	.text
4969  0582               _TIM3_GetPrescaler:
4973                     ; 1366     return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
4975  0582 c6528d        	ld	a,21133
4978  0585 81            	ret
5117                     ; 1376 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
5117                     ; 1377 {
5118                     	switch	.text
5119  0586               _TIM3_GetFlagStatus:
5121  0586 5204          	subw	sp,#4
5122       00000004      OFST:	set	4
5125                     ; 1378     __IO FlagStatus bitstatus = RESET;
5127  0588 0f04          	clr	(OFST+0,sp)
5128                     ; 1382     assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
5130                     ; 1384     tim3_flag_l = (uint8_t)(TIM3_FLAG);
5132  058a 9f            	ld	a,xl
5133  058b 6b02          	ld	(OFST-2,sp),a
5134                     ; 1385     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
5136  058d 9e            	ld	a,xh
5137  058e 6b03          	ld	(OFST-1,sp),a
5138                     ; 1387     if (((TIM3->SR1 & tim3_flag_l) | (TIM3->SR2 & tim3_flag_h)) != 0)
5140  0590 c65286        	ld	a,21126
5141  0593 1403          	and	a,(OFST-1,sp)
5142  0595 6b01          	ld	(OFST-3,sp),a
5143  0597 c65285        	ld	a,21125
5144  059a 1402          	and	a,(OFST-2,sp)
5145  059c 1a01          	or	a,(OFST-3,sp)
5146  059e 2706          	jreq	L3552
5147                     ; 1389         bitstatus = SET;
5149  05a0 a601          	ld	a,#1
5150  05a2 6b04          	ld	(OFST+0,sp),a
5152  05a4 2002          	jra	L5552
5153  05a6               L3552:
5154                     ; 1393         bitstatus = RESET;
5156  05a6 0f04          	clr	(OFST+0,sp)
5157  05a8               L5552:
5158                     ; 1395     return ((FlagStatus)bitstatus);
5160  05a8 7b04          	ld	a,(OFST+0,sp)
5163  05aa 5b04          	addw	sp,#4
5164  05ac 81            	ret
5199                     ; 1404 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
5199                     ; 1405 {
5200                     	switch	.text
5201  05ad               _TIM3_ClearFlag:
5203  05ad 89            	pushw	x
5204       00000000      OFST:	set	0
5207                     ; 1407     assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
5209                     ; 1409     TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
5211  05ae 9f            	ld	a,xl
5212  05af 43            	cpl	a
5213  05b0 c75285        	ld	21125,a
5214                     ; 1410     TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
5216  05b3 7b01          	ld	a,(OFST+1,sp)
5217  05b5 43            	cpl	a
5218  05b6 c75286        	ld	21126,a
5219                     ; 1411 }
5222  05b9 85            	popw	x
5223  05ba 81            	ret
5287                     ; 1420 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
5287                     ; 1421 {
5288                     	switch	.text
5289  05bb               _TIM3_GetITStatus:
5291  05bb 88            	push	a
5292  05bc 5203          	subw	sp,#3
5293       00000003      OFST:	set	3
5296                     ; 1422     __IO ITStatus bitstatus = RESET;
5298  05be 0f03          	clr	(OFST+0,sp)
5299                     ; 1424     __IO uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
5301  05c0 0f01          	clr	(OFST-2,sp)
5304  05c2 0f02          	clr	(OFST-1,sp)
5305                     ; 1427     assert_param(IS_TIM3_GET_IT(TIM3_IT));
5307                     ; 1429     TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
5309  05c4 c45285        	and	a,21125
5310  05c7 6b01          	ld	(OFST-2,sp),a
5311                     ; 1431     TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
5313  05c9 c65284        	ld	a,21124
5314  05cc 1404          	and	a,(OFST+1,sp)
5315  05ce 6b02          	ld	(OFST-1,sp),a
5316                     ; 1433     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
5318  05d0 0d01          	tnz	(OFST-2,sp)
5319  05d2 270a          	jreq	L7262
5321  05d4 0d02          	tnz	(OFST-1,sp)
5322  05d6 2706          	jreq	L7262
5323                     ; 1435         bitstatus = (ITStatus)SET;
5325  05d8 a601          	ld	a,#1
5326  05da 6b03          	ld	(OFST+0,sp),a
5328  05dc 2002          	jra	L1362
5329  05de               L7262:
5330                     ; 1439         bitstatus = (ITStatus)RESET;
5332  05de 0f03          	clr	(OFST+0,sp)
5333  05e0               L1362:
5334                     ; 1441     return ((ITStatus)bitstatus);
5336  05e0 7b03          	ld	a,(OFST+0,sp)
5339  05e2 5b04          	addw	sp,#4
5340  05e4 81            	ret
5376                     ; 1450 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
5376                     ; 1451 {
5377                     	switch	.text
5378  05e5               _TIM3_ClearITPendingBit:
5382                     ; 1453     assert_param(IS_TIM3_IT(TIM3_IT));
5384                     ; 1456     TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
5386  05e5 43            	cpl	a
5387  05e6 c75285        	ld	21125,a
5388                     ; 1457 }
5391  05e9 81            	ret
5463                     ; 1469 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5463                     ; 1470                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5463                     ; 1471                        uint8_t TIM3_ICFilter)
5463                     ; 1472 {
5464                     	switch	.text
5465  05ea               L3_TI1_Config:
5467  05ea 89            	pushw	x
5468  05eb 89            	pushw	x
5469       00000002      OFST:	set	2
5472                     ; 1473     uint8_t tmpccmr1 = 0;
5474                     ; 1474     uint8_t tmpicpolarity = TIM3_ICPolarity;
5476  05ec 9e            	ld	a,xh
5477  05ed 6b01          	ld	(OFST-1,sp),a
5478                     ; 1475     tmpccmr1 = TIM3->CCMR1;
5480  05ef c65288        	ld	a,21128
5481  05f2 6b02          	ld	(OFST+0,sp),a
5482                     ; 1478     assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5484                     ; 1479     assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5486                     ; 1480     assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5488                     ; 1483     TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5490  05f4 7211528a      	bres	21130,#0
5491                     ; 1486     tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5493  05f8 7b02          	ld	a,(OFST+0,sp)
5494  05fa a40c          	and	a,#12
5495  05fc 6b02          	ld	(OFST+0,sp),a
5496                     ; 1487     tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5498  05fe 7b07          	ld	a,(OFST+5,sp)
5499  0600 97            	ld	xl,a
5500  0601 a610          	ld	a,#16
5501  0603 42            	mul	x,a
5502  0604 9f            	ld	a,xl
5503  0605 1a04          	or	a,(OFST+2,sp)
5504  0607 1a02          	or	a,(OFST+0,sp)
5505  0609 6b02          	ld	(OFST+0,sp),a
5506                     ; 1489     TIM3->CCMR1 = tmpccmr1;
5508  060b 7b02          	ld	a,(OFST+0,sp)
5509  060d c75288        	ld	21128,a
5510                     ; 1492     if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5512  0610 7b01          	ld	a,(OFST-1,sp)
5513  0612 a101          	cp	a,#1
5514  0614 2606          	jrne	L7072
5515                     ; 1494         TIM3->CCER1 |= TIM_CCER1_CC1P;
5517  0616 7212528a      	bset	21130,#1
5519  061a 2004          	jra	L1172
5520  061c               L7072:
5521                     ; 1498         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5523  061c 7213528a      	bres	21130,#1
5524  0620               L1172:
5525                     ; 1502     TIM3->CCER1 |=  TIM_CCER1_CC1E;
5527  0620 7210528a      	bset	21130,#0
5528                     ; 1503 }
5531  0624 5b04          	addw	sp,#4
5532  0626 81            	ret
5604                     ; 1515 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5604                     ; 1516                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5604                     ; 1517                        uint8_t TIM3_ICFilter)
5604                     ; 1518 {
5605                     	switch	.text
5606  0627               L5_TI2_Config:
5608  0627 89            	pushw	x
5609  0628 89            	pushw	x
5610       00000002      OFST:	set	2
5613                     ; 1519     uint8_t tmpccmr2 = 0;
5615                     ; 1520     uint8_t tmpicpolarity = TIM3_ICPolarity;
5617  0629 9e            	ld	a,xh
5618  062a 6b01          	ld	(OFST-1,sp),a
5619                     ; 1523     assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5621                     ; 1524     assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5623                     ; 1525     assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5625                     ; 1527     tmpccmr2 = TIM3->CCMR2;
5627  062c c65289        	ld	a,21129
5628  062f 6b02          	ld	(OFST+0,sp),a
5629                     ; 1530     TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5631  0631 7219528a      	bres	21130,#4
5632                     ; 1533     tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5634  0635 7b02          	ld	a,(OFST+0,sp)
5635  0637 a40c          	and	a,#12
5636  0639 6b02          	ld	(OFST+0,sp),a
5637                     ; 1534     tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5639  063b 7b07          	ld	a,(OFST+5,sp)
5640  063d 97            	ld	xl,a
5641  063e a610          	ld	a,#16
5642  0640 42            	mul	x,a
5643  0641 9f            	ld	a,xl
5644  0642 1a04          	or	a,(OFST+2,sp)
5645  0644 1a02          	or	a,(OFST+0,sp)
5646  0646 6b02          	ld	(OFST+0,sp),a
5647                     ; 1536     TIM3->CCMR2 = tmpccmr2;
5649  0648 7b02          	ld	a,(OFST+0,sp)
5650  064a c75289        	ld	21129,a
5651                     ; 1539     if (tmpicpolarity == TIM3_ICPolarity_Falling)
5653  064d 7b01          	ld	a,(OFST-1,sp)
5654  064f a101          	cp	a,#1
5655  0651 2606          	jrne	L1572
5656                     ; 1541         TIM3->CCER1 |= TIM_CCER1_CC2P ;
5658  0653 721a528a      	bset	21130,#5
5660  0657 2004          	jra	L3572
5661  0659               L1572:
5662                     ; 1545         TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5664  0659 721b528a      	bres	21130,#5
5665  065d               L3572:
5666                     ; 1549     TIM3->CCER1 |=  TIM_CCER1_CC2E;
5668  065d 7218528a      	bset	21130,#4
5669                     ; 1550 }
5672  0661 5b04          	addw	sp,#4
5673  0663 81            	ret
5697                     ; 1560 FunctionalState TIM3_GetStatus(void)
5697                     ; 1561 {
5698                     	switch	.text
5699  0664               _TIM3_GetStatus:
5703                     ; 1562     return ((FunctionalState) (TIM3->CR1 & TIM_CR1_CEN));
5705  0664 c65280        	ld	a,21120
5706  0667 a401          	and	a,#1
5709  0669 81            	ret
5722                     	xdef	_TIM3_ClearITPendingBit
5723                     	xdef	_TIM3_GetITStatus
5724                     	xdef	_TIM3_ClearFlag
5725                     	xdef	_TIM3_GetFlagStatus
5726                     	xdef	_TIM3_GetPrescaler
5727                     	xdef	_TIM3_GetCounter
5728                     	xdef	_TIM3_GetCapture2
5729                     	xdef	_TIM3_GetCapture1
5730                     	xdef	_TIM3_SetIC2Prescaler
5731                     	xdef	_TIM3_SetIC1Prescaler
5732                     	xdef	_TIM3_SetCompare2
5733                     	xdef	_TIM3_SetCompare1
5734                     	xdef	_TIM3_SetAutoreload
5735                     	xdef	_TIM3_SetCounter
5736                     	xdef	_TIM3_SelectOCxM
5737                     	xdef	_TIM3_CCxCmd
5738                     	xdef	_TIM3_OC2PolarityConfig
5739                     	xdef	_TIM3_OC1PolarityConfig
5740                     	xdef	_TIM3_GenerateEvent
5741                     	xdef	_TIM3_OC2FastCmd
5742                     	xdef	_TIM3_OC1FastCmd
5743                     	xdef	_TIM3_OC2PreloadConfig
5744                     	xdef	_TIM3_OC1PreloadConfig
5745                     	xdef	_TIM3_ARRPreloadConfig
5746                     	xdef	_TIM3_ForcedOC2Config
5747                     	xdef	_TIM3_ForcedOC1Config
5748                     	xdef	_TIM3_CounterModeConfig
5749                     	xdef	_TIM3_PrescalerConfig
5750                     	xdef	_TIM3_EncoderInterfaceConfig
5751                     	xdef	_TIM3_SelectMasterSlaveMode
5752                     	xdef	_TIM3_SelectSlaveMode
5753                     	xdef	_TIM3_SelectOutputTrigger
5754                     	xdef	_TIM3_SelectOnePulseMode
5755                     	xdef	_TIM3_SelectHallSensor
5756                     	xdef	_TIM3_UpdateRequestConfig
5757                     	xdef	_TIM3_UpdateDisableConfig
5758                     	xdef	_TIM3_SelectInputTrigger
5759                     	xdef	_TIM3_TIxExternalClockConfig
5760                     	xdef	_TIM3_ETRConfig
5761                     	xdef	_TIM3_ETRClockMode2Config
5762                     	xdef	_TIM3_ETRClockMode1Config
5763                     	xdef	_TIM3_InternalClockConfig
5764                     	xdef	_TIM3_ITConfig
5765                     	xdef	_TIM3_CtrlPWMOutputs
5766                     	xdef	_TIM3_GetStatus
5767                     	xdef	_TIM3_Cmd
5768                     	xdef	_TIM3_PWMIConfig
5769                     	xdef	_TIM3_ICInit
5770                     	xdef	_TIM3_BKRConfig
5771                     	xdef	_TIM3_OC2Init
5772                     	xdef	_TIM3_OC1Init
5773                     	xdef	_TIM3_TimeBaseInit
5774                     	xdef	_TIM3_DeInit
5793                     	end
