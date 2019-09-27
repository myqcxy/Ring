   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 55 void I2C_DeInit(void)
  43                     ; 56 {
  45                     	switch	.text
  46  0000               _I2C_DeInit:
  50                     ; 57     I2C->CR1 = I2C_CR1_RESET_VALUE;
  52  0000 725f5210      	clr	21008
  53                     ; 58     I2C->CR2 = I2C_CR2_RESET_VALUE;
  55  0004 725f5211      	clr	21009
  56                     ; 59     I2C->FREQR = I2C_FREQR_RESET_VALUE;
  58  0008 725f5212      	clr	21010
  59                     ; 60     I2C->OARL = I2C_OARL_RESET_VALUE;
  61  000c 725f5213      	clr	21011
  62                     ; 61     I2C->OARH = I2C_OARH_RESET_VALUE;
  64  0010 725f5214      	clr	21012
  65                     ; 62     I2C->ITR = I2C_ITR_RESET_VALUE;
  67  0014 725f521a      	clr	21018
  68                     ; 63     I2C->CCRL = I2C_CCRL_RESET_VALUE;
  70  0018 725f521b      	clr	21019
  71                     ; 64     I2C->CCRH = I2C_CCRH_RESET_VALUE;
  73  001c 725f521c      	clr	21020
  74                     ; 65     I2C->TRISER = I2C_TRISER_RESET_VALUE;
  76  0020 3502521d      	mov	21021,#2
  77                     ; 66 }
  80  0024 81            	ret
 254                     .const:	section	.text
 255  0000               L01:
 256  0000 000f4240      	dc.l	1000000
 257  0004               L21:
 258  0004 000186a1      	dc.l	100001
 259                     ; 81 void I2C_Init(uint32_t OutputClockFrequency, uint16_t OwnAddress,
 259                     ; 82               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef I2C_Ack,
 259                     ; 83               I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 259                     ; 84 {
 260                     	switch	.text
 261  0025               _I2C_Init:
 263  0025 520a          	subw	sp,#10
 264       0000000a      OFST:	set	10
 267                     ; 85     uint16_t result = 0x0004;
 269                     ; 86     uint16_t tmpval = 0;
 271                     ; 87     uint8_t tmpccrh = 0;
 273  0027 0f07          	clr	(OFST-3,sp)
 274                     ; 88     uint8_t input_clock = 0;
 276                     ; 91     assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 278                     ; 92     assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 280                     ; 93     assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 282                     ; 94     assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 284                     ; 95     assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 286                     ; 98     input_clock = CLK_GetClockFreq()/1000000;
 288  0029 cd0000        	call	_CLK_GetClockFreq
 290  002c ae0000        	ldw	x,#L01
 291  002f cd0000        	call	c_ludv
 293  0032 b603          	ld	a,c_lreg+3
 294  0034 6b08          	ld	(OFST-2,sp),a
 295                     ; 102     I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 297  0036 c65212        	ld	a,21010
 298  0039 a4c0          	and	a,#192
 299  003b c75212        	ld	21010,a
 300                     ; 104     I2C->FREQR |= input_clock;
 302  003e c65212        	ld	a,21010
 303  0041 1a08          	or	a,(OFST-2,sp)
 304  0043 c75212        	ld	21010,a
 305                     ; 108     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 307  0046 72115210      	bres	21008,#0
 308                     ; 111     I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 310  004a c6521c        	ld	a,21020
 311  004d a430          	and	a,#48
 312  004f c7521c        	ld	21020,a
 313                     ; 112     I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 315  0052 725f521b      	clr	21019
 316                     ; 115     if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 318  0056 96            	ldw	x,sp
 319  0057 1c000d        	addw	x,#OFST+3
 320  005a cd0000        	call	c_ltor
 322  005d ae0004        	ldw	x,#L21
 323  0060 cd0000        	call	c_lcmp
 325  0063 2403          	jruge	L41
 326  0065 cc00f2        	jp	L721
 327  0068               L41:
 328                     ; 118         tmpccrh = I2C_CCRH_FS;
 330  0068 a680          	ld	a,#128
 331  006a 6b07          	ld	(OFST-3,sp),a
 332                     ; 120         if (I2C_DutyCycle == I2C_DutyCycle_2)
 334  006c 0d13          	tnz	(OFST+9,sp)
 335  006e 2630          	jrne	L131
 336                     ; 123             result = (uint16_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 338  0070 96            	ldw	x,sp
 339  0071 1c000d        	addw	x,#OFST+3
 340  0074 cd0000        	call	c_ltor
 342  0077 a603          	ld	a,#3
 343  0079 cd0000        	call	c_smul
 345  007c 96            	ldw	x,sp
 346  007d 1c0001        	addw	x,#OFST-9
 347  0080 cd0000        	call	c_rtol
 349  0083 7b08          	ld	a,(OFST-2,sp)
 350  0085 b703          	ld	c_lreg+3,a
 351  0087 3f02          	clr	c_lreg+2
 352  0089 3f01          	clr	c_lreg+1
 353  008b 3f00          	clr	c_lreg
 354  008d ae0000        	ldw	x,#L01
 355  0090 cd0000        	call	c_lmul
 357  0093 96            	ldw	x,sp
 358  0094 1c0001        	addw	x,#OFST-9
 359  0097 cd0000        	call	c_ludv
 361  009a be02          	ldw	x,c_lreg+2
 362  009c 1f09          	ldw	(OFST-1,sp),x
 364  009e 2034          	jra	L331
 365  00a0               L131:
 366                     ; 128             result = (uint16_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 368  00a0 96            	ldw	x,sp
 369  00a1 1c000d        	addw	x,#OFST+3
 370  00a4 cd0000        	call	c_ltor
 372  00a7 a619          	ld	a,#25
 373  00a9 cd0000        	call	c_smul
 375  00ac 96            	ldw	x,sp
 376  00ad 1c0001        	addw	x,#OFST-9
 377  00b0 cd0000        	call	c_rtol
 379  00b3 7b08          	ld	a,(OFST-2,sp)
 380  00b5 b703          	ld	c_lreg+3,a
 381  00b7 3f02          	clr	c_lreg+2
 382  00b9 3f01          	clr	c_lreg+1
 383  00bb 3f00          	clr	c_lreg
 384  00bd ae0000        	ldw	x,#L01
 385  00c0 cd0000        	call	c_lmul
 387  00c3 96            	ldw	x,sp
 388  00c4 1c0001        	addw	x,#OFST-9
 389  00c7 cd0000        	call	c_ludv
 391  00ca be02          	ldw	x,c_lreg+2
 392  00cc 1f09          	ldw	(OFST-1,sp),x
 393                     ; 130             tmpccrh |= I2C_CCRH_DUTY;
 395  00ce 7b07          	ld	a,(OFST-3,sp)
 396  00d0 aa40          	or	a,#64
 397  00d2 6b07          	ld	(OFST-3,sp),a
 398  00d4               L331:
 399                     ; 134         if (result < (uint16_t)0x0001)
 401  00d4 1e09          	ldw	x,(OFST-1,sp)
 402  00d6 2605          	jrne	L531
 403                     ; 137             result = (uint16_t)0x0001;
 405  00d8 ae0001        	ldw	x,#1
 406  00db 1f09          	ldw	(OFST-1,sp),x
 407  00dd               L531:
 408                     ; 143         tmpval = ((input_clock * 3) / 10) + 1;
 410  00dd 7b08          	ld	a,(OFST-2,sp)
 411  00df 97            	ld	xl,a
 412  00e0 a603          	ld	a,#3
 413  00e2 42            	mul	x,a
 414  00e3 a60a          	ld	a,#10
 415  00e5 cd0000        	call	c_sdivx
 417  00e8 5c            	incw	x
 418  00e9 1f05          	ldw	(OFST-5,sp),x
 419                     ; 144         I2C->TRISER = (uint8_t)tmpval;
 421  00eb 7b06          	ld	a,(OFST-4,sp)
 422  00ed c7521d        	ld	21021,a
 424  00f0 2043          	jra	L731
 425  00f2               L721:
 426                     ; 150         result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 428  00f2 96            	ldw	x,sp
 429  00f3 1c000d        	addw	x,#OFST+3
 430  00f6 cd0000        	call	c_ltor
 432  00f9 3803          	sll	c_lreg+3
 433  00fb 3902          	rlc	c_lreg+2
 434  00fd 3901          	rlc	c_lreg+1
 435  00ff 3900          	rlc	c_lreg
 436  0101 96            	ldw	x,sp
 437  0102 1c0001        	addw	x,#OFST-9
 438  0105 cd0000        	call	c_rtol
 440  0108 7b08          	ld	a,(OFST-2,sp)
 441  010a b703          	ld	c_lreg+3,a
 442  010c 3f02          	clr	c_lreg+2
 443  010e 3f01          	clr	c_lreg+1
 444  0110 3f00          	clr	c_lreg
 445  0112 ae0000        	ldw	x,#L01
 446  0115 cd0000        	call	c_lmul
 448  0118 96            	ldw	x,sp
 449  0119 1c0001        	addw	x,#OFST-9
 450  011c cd0000        	call	c_ludv
 452  011f be02          	ldw	x,c_lreg+2
 453  0121 1f09          	ldw	(OFST-1,sp),x
 454                     ; 153         if (result < (uint16_t)0x0004)
 456  0123 1e09          	ldw	x,(OFST-1,sp)
 457  0125 a30004        	cpw	x,#4
 458  0128 2405          	jruge	L141
 459                     ; 156             result = (uint16_t)0x0004;
 461  012a ae0004        	ldw	x,#4
 462  012d 1f09          	ldw	(OFST-1,sp),x
 463  012f               L141:
 464                     ; 162         I2C->TRISER = (uint8_t)(input_clock + 1);
 466  012f 7b08          	ld	a,(OFST-2,sp)
 467  0131 4c            	inc	a
 468  0132 c7521d        	ld	21021,a
 469  0135               L731:
 470                     ; 166     I2C->CCRL = (uint8_t)result;
 472  0135 7b0a          	ld	a,(OFST+0,sp)
 473  0137 c7521b        	ld	21019,a
 474                     ; 167     I2C->CCRH = (uint8_t)(((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 476  013a 7b09          	ld	a,(OFST-1,sp)
 477  013c a40f          	and	a,#15
 478  013e 1a07          	or	a,(OFST-3,sp)
 479  0140 c7521c        	ld	21020,a
 480                     ; 170     I2C->CR1 |= I2C_CR1_PE;
 482  0143 72105210      	bset	21008,#0
 483                     ; 173     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 485  0147 72155211      	bres	21009,#2
 486                     ; 175     I2C->CR2 |= (uint8_t)I2C_Ack;
 488  014b c65211        	ld	a,21009
 489  014e 1a14          	or	a,(OFST+10,sp)
 490  0150 c75211        	ld	21009,a
 491                     ; 178     I2C->OARL = (uint8_t)(OwnAddress);
 493  0153 7b12          	ld	a,(OFST+8,sp)
 494  0155 c75213        	ld	21011,a
 495                     ; 179     I2C->OARH = (uint8_t)((uint8_t)I2C_AcknowledgedAddress |I2C_OARH_ADDCONF |
 495                     ; 180                           (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 497  0158 7b11          	ld	a,(OFST+7,sp)
 498  015a 97            	ld	xl,a
 499  015b 7b12          	ld	a,(OFST+8,sp)
 500  015d 9f            	ld	a,xl
 501  015e a403          	and	a,#3
 502  0160 97            	ld	xl,a
 503  0161 4f            	clr	a
 504  0162 02            	rlwa	x,a
 505  0163 4f            	clr	a
 506  0164 01            	rrwa	x,a
 507  0165 48            	sll	a
 508  0166 59            	rlcw	x
 509  0167 9f            	ld	a,xl
 510  0168 6b04          	ld	(OFST-6,sp),a
 511  016a 7b15          	ld	a,(OFST+11,sp)
 512  016c aa40          	or	a,#64
 513  016e 1a04          	or	a,(OFST-6,sp)
 514  0170 c75214        	ld	21012,a
 515                     ; 181 }
 518  0173 5b0a          	addw	sp,#10
 519  0175 81            	ret
 574                     ; 189 void I2C_Cmd(FunctionalState NewState)
 574                     ; 190 {
 575                     	switch	.text
 576  0176               _I2C_Cmd:
 580                     ; 192     assert_param(IS_FUNCTIONAL_STATE(NewState));
 582                     ; 194     if (NewState != DISABLE)
 584  0176 4d            	tnz	a
 585  0177 2706          	jreq	L171
 586                     ; 197         I2C->CR1 |= I2C_CR1_PE;
 588  0179 72105210      	bset	21008,#0
 590  017d 2004          	jra	L371
 591  017f               L171:
 592                     ; 202         I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 594  017f 72115210      	bres	21008,#0
 595  0183               L371:
 596                     ; 204 }
 599  0183 81            	ret
 634                     ; 211 void I2C_GeneralCallCmd(FunctionalState NewState)
 634                     ; 212 {
 635                     	switch	.text
 636  0184               _I2C_GeneralCallCmd:
 640                     ; 214     assert_param(IS_FUNCTIONAL_STATE(NewState));
 642                     ; 216     if (NewState != DISABLE)
 644  0184 4d            	tnz	a
 645  0185 2706          	jreq	L312
 646                     ; 219         I2C->CR1 |= I2C_CR1_ENGC;
 648  0187 721c5210      	bset	21008,#6
 650  018b 2004          	jra	L512
 651  018d               L312:
 652                     ; 224         I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 654  018d 721d5210      	bres	21008,#6
 655  0191               L512:
 656                     ; 226 }
 659  0191 81            	ret
 694                     ; 236 void I2C_GenerateSTART(FunctionalState NewState)
 694                     ; 237 {
 695                     	switch	.text
 696  0192               _I2C_GenerateSTART:
 700                     ; 239     assert_param(IS_FUNCTIONAL_STATE(NewState));
 702                     ; 241     if (NewState != DISABLE)
 704  0192 4d            	tnz	a
 705  0193 2706          	jreq	L532
 706                     ; 244         I2C->CR2 |= I2C_CR2_START;
 708  0195 72105211      	bset	21009,#0
 710  0199 2004          	jra	L732
 711  019b               L532:
 712                     ; 249         I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 714  019b 72115211      	bres	21009,#0
 715  019f               L732:
 716                     ; 251 }
 719  019f 81            	ret
 754                     ; 259 void I2C_GenerateSTOP(FunctionalState NewState)
 754                     ; 260 {
 755                     	switch	.text
 756  01a0               _I2C_GenerateSTOP:
 760                     ; 262     assert_param(IS_FUNCTIONAL_STATE(NewState));
 762                     ; 264     if (NewState != DISABLE)
 764  01a0 4d            	tnz	a
 765  01a1 2706          	jreq	L752
 766                     ; 267         I2C->CR2 |= I2C_CR2_STOP;
 768  01a3 72125211      	bset	21009,#1
 770  01a7 2004          	jra	L162
 771  01a9               L752:
 772                     ; 272         I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 774  01a9 72135211      	bres	21009,#1
 775  01ad               L162:
 776                     ; 274 }
 779  01ad 81            	ret
 815                     ; 282 void I2C_SoftwareResetCmd(FunctionalState NewState)
 815                     ; 283 {
 816                     	switch	.text
 817  01ae               _I2C_SoftwareResetCmd:
 821                     ; 285     assert_param(IS_FUNCTIONAL_STATE(NewState));
 823                     ; 287     if (NewState != DISABLE)
 825  01ae 4d            	tnz	a
 826  01af 2706          	jreq	L103
 827                     ; 290         I2C->CR2 |= I2C_CR2_SWRST;
 829  01b1 721e5211      	bset	21009,#7
 831  01b5 2004          	jra	L303
 832  01b7               L103:
 833                     ; 295         I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 835  01b7 721f5211      	bres	21009,#7
 836  01bb               L303:
 837                     ; 297 }
 840  01bb 81            	ret
 876                     ; 305 void I2C_StretchClockCmd(FunctionalState NewState)
 876                     ; 306 {
 877                     	switch	.text
 878  01bc               _I2C_StretchClockCmd:
 882                     ; 308     assert_param(IS_FUNCTIONAL_STATE(NewState));
 884                     ; 310     if (NewState != DISABLE)
 886  01bc 4d            	tnz	a
 887  01bd 2706          	jreq	L323
 888                     ; 313         I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 890  01bf 721f5210      	bres	21008,#7
 892  01c3 2004          	jra	L523
 893  01c5               L323:
 894                     ; 319         I2C->CR1 |= I2C_CR1_NOSTRETCH;
 896  01c5 721e5210      	bset	21008,#7
 897  01c9               L523:
 898                     ; 321 }
 901  01c9 81            	ret
 937                     ; 329 void I2C_AcknowledgeConfig(FunctionalState NewState)
 937                     ; 330 {
 938                     	switch	.text
 939  01ca               _I2C_AcknowledgeConfig:
 943                     ; 332     assert_param(IS_FUNCTIONAL_STATE(NewState));
 945                     ; 334     if (NewState != DISABLE)
 947  01ca 4d            	tnz	a
 948  01cb 2706          	jreq	L543
 949                     ; 337         I2C->CR2 |= I2C_CR2_ACK;
 951  01cd 72145211      	bset	21009,#2
 953  01d1 2004          	jra	L743
 954  01d3               L543:
 955                     ; 342         I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 957  01d3 72155211      	bres	21009,#2
 958  01d7               L743:
 959                     ; 344 }
 962  01d7 81            	ret
1020                     ; 354 void I2C_AckPositionConfig(I2C_AckPosition_TypeDef I2C_AckPosition)
1020                     ; 355 {
1021                     	switch	.text
1022  01d8               _I2C_AckPositionConfig:
1026                     ; 357     assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1028                     ; 360     I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1030  01d8 72175211      	bres	21009,#3
1031                     ; 362     I2C->CR2 |= I2C_AckPosition;
1033  01dc ca5211        	or	a,21009
1034  01df c75211        	ld	21009,a
1035                     ; 363 }
1038  01e2 81            	ret
1194                     ; 373 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1194                     ; 374 {
1195                     	switch	.text
1196  01e3               _I2C_ITConfig:
1198  01e3 89            	pushw	x
1199       00000000      OFST:	set	0
1202                     ; 376     assert_param(IS_I2C_CONFIG_IT(I2C_IT));
1204                     ; 377     assert_param(IS_FUNCTIONAL_STATE(NewState));
1206                     ; 379     if (NewState != DISABLE)
1208  01e4 0d05          	tnz	(OFST+5,sp)
1209  01e6 2709          	jreq	L364
1210                     ; 382         I2C->ITR |= (uint8_t)I2C_IT;
1212  01e8 9f            	ld	a,xl
1213  01e9 ca521a        	or	a,21018
1214  01ec c7521a        	ld	21018,a
1216  01ef 2009          	jra	L564
1217  01f1               L364:
1218                     ; 387         I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1220  01f1 7b02          	ld	a,(OFST+2,sp)
1221  01f3 43            	cpl	a
1222  01f4 c4521a        	and	a,21018
1223  01f7 c7521a        	ld	21018,a
1224  01fa               L564:
1225                     ; 389 }
1228  01fa 85            	popw	x
1229  01fb 81            	ret
1265                     ; 397 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1265                     ; 398 {
1266                     	switch	.text
1267  01fc               _I2C_FastModeDutyCycleConfig:
1271                     ; 401     assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1273                     ; 403     if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1275  01fc a140          	cp	a,#64
1276  01fe 2606          	jrne	L505
1277                     ; 406         I2C->CCRH |= I2C_CCRH_DUTY;
1279  0200 721c521c      	bset	21020,#6
1281  0204 2004          	jra	L705
1282  0206               L505:
1283                     ; 411         I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1285  0206 721d521c      	bres	21020,#6
1286  020a               L705:
1287                     ; 414 }
1290  020a 81            	ret
1497                     ; 424 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1497                     ; 425 {
1498                     	switch	.text
1499  020b               _I2C_CheckEvent:
1501  020b 89            	pushw	x
1502  020c 5206          	subw	sp,#6
1503       00000006      OFST:	set	6
1506                     ; 426     uint16_t lastevent = 0;
1508                     ; 427     uint8_t flag1, flag2= 0;
1510                     ; 428     ErrorStatus status = ERROR;
1512                     ; 431     assert_param(IS_I2C_EVENT(I2C_Event));
1514                     ; 433     if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1516  020e a30004        	cpw	x,#4
1517  0211 260d          	jrne	L516
1518                     ; 435         lastevent = (uint16_t)(I2C->SR2& I2C_SR2_AF);
1520  0213 c65218        	ld	a,21016
1521  0216 5f            	clrw	x
1522  0217 a404          	and	a,#4
1523  0219 5f            	clrw	x
1524  021a 02            	rlwa	x,a
1525  021b 1f04          	ldw	(OFST-2,sp),x
1526  021d 01            	rrwa	x,a
1528  021e 201f          	jra	L716
1529  0220               L516:
1530                     ; 439         flag1 = I2C->SR1;
1532  0220 c65217        	ld	a,21015
1533  0223 6b03          	ld	(OFST-3,sp),a
1534                     ; 440         flag2 = I2C->SR3;
1536  0225 c65219        	ld	a,21017
1537  0228 6b06          	ld	(OFST+0,sp),a
1538                     ; 441         lastevent = (((uint16_t)flag2 << (uint16_t)8)| (uint16_t)flag1);
1540  022a 7b03          	ld	a,(OFST-3,sp)
1541  022c 5f            	clrw	x
1542  022d 97            	ld	xl,a
1543  022e 1f01          	ldw	(OFST-5,sp),x
1544  0230 7b06          	ld	a,(OFST+0,sp)
1545  0232 5f            	clrw	x
1546  0233 97            	ld	xl,a
1547  0234 4f            	clr	a
1548  0235 02            	rlwa	x,a
1549  0236 01            	rrwa	x,a
1550  0237 1a02          	or	a,(OFST-4,sp)
1551  0239 01            	rrwa	x,a
1552  023a 1a01          	or	a,(OFST-5,sp)
1553  023c 01            	rrwa	x,a
1554  023d 1f04          	ldw	(OFST-2,sp),x
1555  023f               L716:
1556                     ; 444     if (lastevent == I2C_Event )
1558  023f 1e04          	ldw	x,(OFST-2,sp)
1559  0241 1307          	cpw	x,(OFST+1,sp)
1560  0243 2606          	jrne	L126
1561                     ; 447         status = SUCCESS;
1563  0245 a601          	ld	a,#1
1564  0247 6b06          	ld	(OFST+0,sp),a
1566  0249 2002          	jra	L326
1567  024b               L126:
1568                     ; 452         status = ERROR;
1570  024b 0f06          	clr	(OFST+0,sp)
1571  024d               L326:
1572                     ; 456     return status;
1574  024d 7b06          	ld	a,(OFST+0,sp)
1577  024f 5b08          	addw	sp,#8
1578  0251 81            	ret
1631                     ; 465 I2C_Event_TypeDef I2C_GetLastEvent(void)
1631                     ; 466 {
1632                     	switch	.text
1633  0252               _I2C_GetLastEvent:
1635  0252 5204          	subw	sp,#4
1636       00000004      OFST:	set	4
1639                     ; 467     uint16_t lastevent = 0;
1641                     ; 468     uint16_t flag1 = 0, flag2 = 0;
1645                     ; 470     if (I2C->SR2&I2C_SR2_AF != 0x00)
1647  0254 c65218        	ld	a,21016
1648  0257 a501          	bcp	a,#1
1649  0259 2707          	jreq	L356
1650                     ; 472         lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1652  025b ae0004        	ldw	x,#4
1653  025e 1f03          	ldw	(OFST-1,sp),x
1655  0260 201b          	jra	L556
1656  0262               L356:
1657                     ; 477         flag1 = I2C->SR1;
1659  0262 c65217        	ld	a,21015
1660  0265 5f            	clrw	x
1661  0266 97            	ld	xl,a
1662  0267 1f01          	ldw	(OFST-3,sp),x
1663                     ; 478         flag2 = I2C->SR3;
1665  0269 c65219        	ld	a,21017
1666  026c 5f            	clrw	x
1667  026d 97            	ld	xl,a
1668  026e 1f03          	ldw	(OFST-1,sp),x
1669                     ; 481         lastevent = (((uint16_t)flag2 << (uint16_t)8)| (uint16_t)flag1);
1671  0270 1e03          	ldw	x,(OFST-1,sp)
1672  0272 4f            	clr	a
1673  0273 02            	rlwa	x,a
1674  0274 01            	rrwa	x,a
1675  0275 1a02          	or	a,(OFST-2,sp)
1676  0277 01            	rrwa	x,a
1677  0278 1a01          	or	a,(OFST-3,sp)
1678  027a 01            	rrwa	x,a
1679  027b 1f03          	ldw	(OFST-1,sp),x
1680  027d               L556:
1681                     ; 484     return lastevent;
1683  027d 1e03          	ldw	x,(OFST-1,sp)
1686  027f 5b04          	addw	sp,#4
1687  0281 81            	ret
1710                     ; 493 uint8_t I2C_ReceiveData(void)
1710                     ; 494 {
1711                     	switch	.text
1712  0282               _I2C_ReceiveData:
1716                     ; 496     return ((uint8_t)I2C->DR);
1718  0282 c65216        	ld	a,21014
1721  0285 81            	ret
1788                     ; 506 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1788                     ; 507 {
1789                     	switch	.text
1790  0286               _I2C_Send7bitAddress:
1792  0286 89            	pushw	x
1793       00000000      OFST:	set	0
1796                     ; 509     assert_param(IS_I2C_ADDRESS(Address));
1798                     ; 510     assert_param(IS_I2C_DIRECTION(I2C_Direction));
1800                     ; 513     Address &= (uint8_t)0xFE;
1802  0287 7b01          	ld	a,(OFST+1,sp)
1803  0289 a4fe          	and	a,#254
1804  028b 6b01          	ld	(OFST+1,sp),a
1805                     ; 516     I2C->DR = (uint8_t)(Address | (uint8_t)I2C_Direction);
1807  028d 7b01          	ld	a,(OFST+1,sp)
1808  028f 1a02          	or	a,(OFST+2,sp)
1809  0291 c75216        	ld	21014,a
1810                     ; 517 }
1813  0294 85            	popw	x
1814  0295 81            	ret
1848                     ; 524 void I2C_SendData(uint8_t Data)
1848                     ; 525 {
1849                     	switch	.text
1850  0296               _I2C_SendData:
1854                     ; 527     I2C->DR = Data;
1856  0296 c75216        	ld	21014,a
1857                     ; 528 }
1860  0299 81            	ret
2062                     ; 536 FlagStatus I2C_GetFlagStatus(I2C_FLAG_TypeDef I2C_FLAG)
2062                     ; 537 {
2063                     	switch	.text
2064  029a               _I2C_GetFlagStatus:
2066  029a 89            	pushw	x
2067  029b 89            	pushw	x
2068       00000002      OFST:	set	2
2071                     ; 538     uint8_t tempreg, regindex = 0;
2073                     ; 539     FlagStatus bitstatus = RESET;
2075                     ; 542     assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
2077                     ; 545     regindex = I2C_FLAG >> 8;
2079  029c 9e            	ld	a,xh
2080  029d 6b01          	ld	(OFST-1,sp),a
2081                     ; 547     switch (regindex)
2083  029f 7b01          	ld	a,(OFST-1,sp)
2085                     ; 562         break;
2086  02a1 4a            	dec	a
2087  02a2 2708          	jreq	L737
2088  02a4 4a            	dec	a
2089  02a5 270c          	jreq	L147
2090  02a7 4a            	dec	a
2091  02a8 2710          	jreq	L347
2092  02aa 2013          	jra	L5501
2093  02ac               L737:
2094                     ; 550     case 0x01:
2094                     ; 551         tempreg = (uint8_t)I2C->SR1;
2096  02ac c65217        	ld	a,21015
2097  02af 6b02          	ld	(OFST+0,sp),a
2098                     ; 552         break;
2100  02b1 200c          	jra	L5501
2101  02b3               L147:
2102                     ; 555     case 0x02:
2102                     ; 556         tempreg = (uint8_t)I2C->SR2;
2104  02b3 c65218        	ld	a,21016
2105  02b6 6b02          	ld	(OFST+0,sp),a
2106                     ; 557         break;
2108  02b8 2005          	jra	L5501
2109  02ba               L347:
2110                     ; 560     case 0x03:
2110                     ; 561         tempreg = (uint8_t)I2C->SR3;
2112  02ba c65219        	ld	a,21017
2113  02bd 6b02          	ld	(OFST+0,sp),a
2114                     ; 562         break;
2116  02bf               L5501:
2117                     ; 566     if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
2119  02bf 7b04          	ld	a,(OFST+2,sp)
2120  02c1 1502          	bcp	a,(OFST+0,sp)
2121  02c3 2706          	jreq	L7501
2122                     ; 569         bitstatus = SET;
2124  02c5 a601          	ld	a,#1
2125  02c7 6b02          	ld	(OFST+0,sp),a
2127  02c9 2002          	jra	L1601
2128  02cb               L7501:
2129                     ; 574         bitstatus = RESET;
2131  02cb 0f02          	clr	(OFST+0,sp)
2132  02cd               L1601:
2133                     ; 577     return bitstatus;
2135  02cd 7b02          	ld	a,(OFST+0,sp)
2138  02cf 5b04          	addw	sp,#4
2139  02d1 81            	ret
2174                     ; 612 void I2C_ClearFlag(I2C_FLAG_TypeDef I2C_FLAG)
2174                     ; 613 {
2175                     	switch	.text
2176  02d2               _I2C_ClearFlag:
2180                     ; 615     assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
2182                     ; 618     I2C->SR2 = (uint8_t)(~I2C_FLAG);
2184  02d2 9f            	ld	a,xl
2185  02d3 43            	cpl	a
2186  02d4 c75218        	ld	21016,a
2187                     ; 619 }
2190  02d7 81            	ret
2245                     ; 640 ITStatus I2C_GetITStatus(I2C_IT_TypeDef I2C_IT)
2245                     ; 641 {
2246                     	switch	.text
2247  02d8               _I2C_GetITStatus:
2249  02d8 89            	pushw	x
2250  02d9 5203          	subw	sp,#3
2251       00000003      OFST:	set	3
2254                     ; 642     ITStatus bitstatus = RESET;
2256                     ; 643     uint8_t enablestatus = 0;
2258                     ; 646     assert_param(IS_I2C_GET_IT(I2C_IT));
2260                     ; 649     enablestatus = (uint8_t)(((I2C_IT & ITEN_Mask) >> (uint8_t)8) & (I2C->ITR)) ;
2262  02db c6521a        	ld	a,21018
2263  02de 5f            	clrw	x
2264  02df 97            	ld	xl,a
2265  02e0 1f01          	ldw	(OFST-2,sp),x
2266  02e2 7b04          	ld	a,(OFST+1,sp)
2267  02e4 97            	ld	xl,a
2268  02e5 7b05          	ld	a,(OFST+2,sp)
2269  02e7 9f            	ld	a,xl
2270  02e8 a407          	and	a,#7
2271  02ea 97            	ld	xl,a
2272  02eb 4f            	clr	a
2273  02ec 02            	rlwa	x,a
2274  02ed 4f            	clr	a
2275  02ee 01            	rrwa	x,a
2276  02ef 01            	rrwa	x,a
2277  02f0 1402          	and	a,(OFST-1,sp)
2278  02f2 41            	exg	a,xl
2279  02f3 1401          	and	a,(OFST-2,sp)
2280  02f5 41            	exg	a,xl
2281  02f6 6b03          	ld	(OFST+0,sp),a
2282                     ; 651     if ((uint16_t)(I2C_IT & Register_Mask) == Register_SR1_index)
2284  02f8 7b04          	ld	a,(OFST+1,sp)
2285  02fa 97            	ld	xl,a
2286  02fb 7b05          	ld	a,(OFST+2,sp)
2287  02fd 9f            	ld	a,xl
2288  02fe a430          	and	a,#48
2289  0300 97            	ld	xl,a
2290  0301 4f            	clr	a
2291  0302 02            	rlwa	x,a
2292  0303 a30100        	cpw	x,#256
2293  0306 2615          	jrne	L7211
2294                     ; 654         if (((I2C->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2296  0308 c65217        	ld	a,21015
2297  030b 1505          	bcp	a,(OFST+2,sp)
2298  030d 270a          	jreq	L1311
2300  030f 0d03          	tnz	(OFST+0,sp)
2301  0311 2706          	jreq	L1311
2302                     ; 657             bitstatus = SET;
2304  0313 a601          	ld	a,#1
2305  0315 6b03          	ld	(OFST+0,sp),a
2307  0317 2017          	jra	L5311
2308  0319               L1311:
2309                     ; 662             bitstatus = RESET;
2311  0319 0f03          	clr	(OFST+0,sp)
2312  031b 2013          	jra	L5311
2313  031d               L7211:
2314                     ; 668         if (((I2C->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2316  031d c65218        	ld	a,21016
2317  0320 1505          	bcp	a,(OFST+2,sp)
2318  0322 270a          	jreq	L7311
2320  0324 0d03          	tnz	(OFST+0,sp)
2321  0326 2706          	jreq	L7311
2322                     ; 671             bitstatus = SET;
2324  0328 a601          	ld	a,#1
2325  032a 6b03          	ld	(OFST+0,sp),a
2327  032c 2002          	jra	L5311
2328  032e               L7311:
2329                     ; 676             bitstatus = RESET;
2331  032e 0f03          	clr	(OFST+0,sp)
2332  0330               L5311:
2333                     ; 680     return  bitstatus;
2335  0330 7b03          	ld	a,(OFST+0,sp)
2338  0332 5b05          	addw	sp,#5
2339  0334 81            	ret
2375                     ; 717 void I2C_ClearITPendingBit(I2C_IT_TypeDef I2C_IT)
2375                     ; 718 {
2376                     	switch	.text
2377  0335               _I2C_ClearITPendingBit:
2381                     ; 720     assert_param(IS_I2C_CLEAR_IT(I2C_IT));
2383                     ; 723     I2C->SR2 = (uint8_t)(~I2C_IT);
2385  0335 9f            	ld	a,xl
2386  0336 43            	cpl	a
2387  0337 c75218        	ld	21016,a
2388                     ; 724 }
2391  033a 81            	ret
2404                     	xref	_CLK_GetClockFreq
2405                     	xdef	_I2C_ClearITPendingBit
2406                     	xdef	_I2C_GetITStatus
2407                     	xdef	_I2C_ClearFlag
2408                     	xdef	_I2C_GetFlagStatus
2409                     	xdef	_I2C_Send7bitAddress
2410                     	xdef	_I2C_SendData
2411                     	xdef	_I2C_ReceiveData
2412                     	xdef	_I2C_GetLastEvent
2413                     	xdef	_I2C_CheckEvent
2414                     	xdef	_I2C_ITConfig
2415                     	xdef	_I2C_FastModeDutyCycleConfig
2416                     	xdef	_I2C_AckPositionConfig
2417                     	xdef	_I2C_AcknowledgeConfig
2418                     	xdef	_I2C_StretchClockCmd
2419                     	xdef	_I2C_SoftwareResetCmd
2420                     	xdef	_I2C_GenerateSTOP
2421                     	xdef	_I2C_GenerateSTART
2422                     	xdef	_I2C_GeneralCallCmd
2423                     	xdef	_I2C_Cmd
2424                     	xdef	_I2C_Init
2425                     	xdef	_I2C_DeInit
2426                     	xref.b	c_lreg
2427                     	xref.b	c_x
2446                     	xref	c_sdivx
2447                     	xref	c_rtol
2448                     	xref	c_smul
2449                     	xref	c_lmul
2450                     	xref	c_lcmp
2451                     	xref	c_ltor
2452                     	xref	c_ludv
2453                     	end
