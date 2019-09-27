   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _APR_Array:
  17  0000 00            	dc.b	0
  18  0001 08            	dc.b	8
  19  0002 10            	dc.b	16
  20  0003 20            	dc.b	32
  21  0004 3e            	dc.b	62
  22  0005 3e            	dc.b	62
  23  0006 3e            	dc.b	62
  24  0007 3e            	dc.b	62
  25  0008 3e            	dc.b	62
  26  0009 3e            	dc.b	62
  27  000a 3e            	dc.b	62
  28  000b 3e            	dc.b	62
  29  000c 3e            	dc.b	62
  30  000d 3d            	dc.b	61
  31  000e 3d            	dc.b	61
  32  000f 24            	dc.b	36
  33  0010 0e            	dc.b	14
  34  0011               _TBR_Array:
  35  0011 00            	dc.b	0
  36  0012 01            	dc.b	1
  37  0013 01            	dc.b	1
  38  0014 01            	dc.b	1
  39  0015 01            	dc.b	1
  40  0016 02            	dc.b	2
  41  0017 03            	dc.b	3
  42  0018 04            	dc.b	4
  43  0019 05            	dc.b	5
  44  001a 06            	dc.b	6
  45  001b 07            	dc.b	7
  46  001c 08            	dc.b	8
  47  001d 09            	dc.b	9
  48  001e 0a            	dc.b	10
  49  001f 0b            	dc.b	11
  50  0020 0e            	dc.b	14
  51  0021 0f            	dc.b	15
  80                     ; 59 void AWU_DeInit(void)
  80                     ; 60 {
  82                     	switch	.text
  83  0000               _AWU_DeInit:
  87                     ; 61     AWU->CSR = AWU_CSR_RESET_VALUE;
  89  0000 725f50f0      	clr	20720
  90                     ; 62     AWU->APR = AWU_APR_RESET_VALUE;
  92  0004 353f50f1      	mov	20721,#63
  93                     ; 63     AWU->TBR = AWU_TBR_RESET_VALUE;
  95  0008 725f50f2      	clr	20722
  96                     ; 64 }
  99  000c 81            	ret
 261                     ; 74 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 261                     ; 75 {
 262                     	switch	.text
 263  000d               _AWU_Init:
 265  000d 88            	push	a
 266       00000000      OFST:	set	0
 269                     ; 78     assert_param(IS_AWU_TIMEBASE(AWU_TimeBase));
 271                     ; 81     AWU->CSR |= AWU_CSR_AWUEN;
 273  000e 721850f0      	bset	20720,#4
 274                     ; 84     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 276  0012 c650f2        	ld	a,20722
 277  0015 a4f0          	and	a,#240
 278  0017 c750f2        	ld	20722,a
 279                     ; 85     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 281  001a 7b01          	ld	a,(OFST+1,sp)
 282  001c 5f            	clrw	x
 283  001d 97            	ld	xl,a
 284  001e c650f2        	ld	a,20722
 285  0021 da0011        	or	a,(_TBR_Array,x)
 286  0024 c750f2        	ld	20722,a
 287                     ; 88     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 289  0027 c650f1        	ld	a,20721
 290  002a a4c0          	and	a,#192
 291  002c c750f1        	ld	20721,a
 292                     ; 89     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 294  002f 7b01          	ld	a,(OFST+1,sp)
 295  0031 5f            	clrw	x
 296  0032 97            	ld	xl,a
 297  0033 c650f1        	ld	a,20721
 298  0036 da0000        	or	a,(_APR_Array,x)
 299  0039 c750f1        	ld	20721,a
 300                     ; 91 }
 303  003c 84            	pop	a
 304  003d 81            	ret
 359                     ; 100 void AWU_Cmd(FunctionalState NewState)
 359                     ; 101 {
 360                     	switch	.text
 361  003e               _AWU_Cmd:
 365                     ; 102     assert_param(IS_FUNCTIONAL_STATE(NewState));
 367                     ; 104     if (NewState != DISABLE)
 369  003e 4d            	tnz	a
 370  003f 2706          	jreq	L331
 371                     ; 107         AWU->CSR |= AWU_CSR_AWUEN;
 373  0041 721850f0      	bset	20720,#4
 375  0045 2004          	jra	L531
 376  0047               L331:
 377                     ; 112         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 379  0047 721950f0      	bres	20720,#4
 380  004b               L531:
 381                     ; 114 }
 384  004b 81            	ret
 437                     	switch	.const
 438  0022               L41:
 439  0022 000003e8      	dc.l	1000
 440                     ; 129 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 440                     ; 130 {
 441                     	switch	.text
 442  004c               _AWU_LSICalibrationConfig:
 444  004c 5206          	subw	sp,#6
 445       00000006      OFST:	set	6
 448                     ; 132     uint16_t lsifreqkhz = 0x0;
 450                     ; 133     uint16_t A = 0x0;
 452                     ; 136     assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 454                     ; 138     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 456  004e 96            	ldw	x,sp
 457  004f 1c0009        	addw	x,#OFST+3
 458  0052 cd0000        	call	c_ltor
 460  0055 ae0022        	ldw	x,#L41
 461  0058 cd0000        	call	c_ludv
 463  005b be02          	ldw	x,c_lreg+2
 464  005d 1f03          	ldw	(OFST-3,sp),x
 465                     ; 142     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 467  005f 1e03          	ldw	x,(OFST-3,sp)
 468  0061 54            	srlw	x
 469  0062 54            	srlw	x
 470  0063 1f05          	ldw	(OFST-1,sp),x
 471                     ; 144     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 473  0065 1e05          	ldw	x,(OFST-1,sp)
 474  0067 58            	sllw	x
 475  0068 58            	sllw	x
 476  0069 1f01          	ldw	(OFST-5,sp),x
 477  006b 1e03          	ldw	x,(OFST-3,sp)
 478  006d 72f001        	subw	x,(OFST-5,sp)
 479  0070 1605          	ldw	y,(OFST-1,sp)
 480  0072 9058          	sllw	y
 481  0074 905c          	incw	y
 482  0076 cd0000        	call	c_imul
 484  0079 1605          	ldw	y,(OFST-1,sp)
 485  007b 9058          	sllw	y
 486  007d 9058          	sllw	y
 487  007f bf00          	ldw	c_x,x
 488  0081 90b300        	cpw	y,c_x
 489  0084 2509          	jrult	L561
 490                     ; 146         AWU->APR = (uint8_t)(A - 2U);
 492  0086 7b06          	ld	a,(OFST+0,sp)
 493  0088 a002          	sub	a,#2
 494  008a c750f1        	ld	20721,a
 496  008d 2006          	jra	L761
 497  008f               L561:
 498                     ; 150         AWU->APR = (uint8_t)(A - 1U);
 500  008f 7b06          	ld	a,(OFST+0,sp)
 501  0091 4a            	dec	a
 502  0092 c750f1        	ld	20721,a
 503  0095               L761:
 504                     ; 154     AWU->CSR |= AWU_CSR_MR;
 506  0095 721250f0      	bset	20720,#1
 507                     ; 156 }
 510  0099 5b06          	addw	sp,#6
 511  009b 81            	ret
 534                     ; 164 void AWU_IdleModeEnable(void)
 534                     ; 165 {
 535                     	switch	.text
 536  009c               _AWU_IdleModeEnable:
 540                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 542  009c 721950f0      	bres	20720,#4
 543                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 545  00a0 35f050f2      	mov	20722,#240
 546                     ; 173 }
 549  00a4 81            	ret
 572                     ; 181 void AWU_ReInitCounter(void)
 572                     ; 182 {
 573                     	switch	.text
 574  00a5               _AWU_ReInitCounter:
 578                     ; 183     AWU->CSR |= AWU_CSR_MR;
 580  00a5 721250f0      	bset	20720,#1
 581                     ; 184 }
 584  00a9 81            	ret
 628                     ; 193 FlagStatus AWU_GetFlagStatus(void)
 628                     ; 194 {
 629                     	switch	.text
 630  00aa               _AWU_GetFlagStatus:
 634                     ; 195     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 636  00aa c650f0        	ld	a,20720
 637  00ad a520          	bcp	a,#32
 638  00af 2603          	jrne	L42
 639  00b1 4f            	clr	a
 640  00b2 2002          	jra	L62
 641  00b4               L42:
 642  00b4 a601          	ld	a,#1
 643  00b6               L62:
 646  00b6 81            	ret
 681                     	xdef	_TBR_Array
 682                     	xdef	_APR_Array
 683                     	xdef	_AWU_GetFlagStatus
 684                     	xdef	_AWU_ReInitCounter
 685                     	xdef	_AWU_IdleModeEnable
 686                     	xdef	_AWU_LSICalibrationConfig
 687                     	xdef	_AWU_Cmd
 688                     	xdef	_AWU_Init
 689                     	xdef	_AWU_DeInit
 690                     	xref.b	c_lreg
 691                     	xref.b	c_x
 710                     	xref	c_imul
 711                     	xref	c_ludv
 712                     	xref	c_ltor
 713                     	end
