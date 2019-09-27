   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 43 uint8_t ITC_GetCPUCC(void)
  43                     ; 44 {
  45                     	switch	.text
  46  0000               _ITC_GetCPUCC:
  50                     ; 46     _asm("push cc");
  53  0000 8a            push cc
  55                     ; 47     _asm("pop a");
  58  0001 84            pop a
  60                     ; 48     return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 70 void ITC_DeInit(void)
  86                     ; 71 {
  87                     	switch	.text
  88  0003               _ITC_DeInit:
  92                     ; 72     ITC->ISPR1 = ITC_SPR1_RESET_VALUE;
  94  0003 35ff7f70      	mov	32624,#255
  95                     ; 73     ITC->ISPR2 = ITC_SPR2_RESET_VALUE;
  97  0007 35ff7f71      	mov	32625,#255
  98                     ; 74     ITC->ISPR3 = ITC_SPR3_RESET_VALUE;
 100  000b 35ff7f72      	mov	32626,#255
 101                     ; 75     ITC->ISPR4 = ITC_SPR4_RESET_VALUE;
 103  000f 35ff7f73      	mov	32627,#255
 104                     ; 76     ITC->ISPR5 = ITC_SPR5_RESET_VALUE;
 106  0013 35ff7f74      	mov	32628,#255
 107                     ; 77     ITC->ISPR6 = ITC_SPR6_RESET_VALUE;
 109  0017 35ff7f75      	mov	32629,#255
 110                     ; 78     ITC->ISPR7 = ITC_SPR7_RESET_VALUE;
 112  001b 35ff7f76      	mov	32630,#255
 113                     ; 79     ITC->ISPR8 = ITC_SPR8_RESET_VALUE;
 115  001f 35ff7f77      	mov	32631,#255
 116                     ; 80 }
 119  0023 81            	ret
 144                     ; 88 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 89 {
 145                     	switch	.text
 146  0024               _ITC_GetSoftIntStatus:
 150                     ; 90     return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 152  0024 adda          	call	_ITC_GetCPUCC
 154  0026 a428          	and	a,#40
 157  0028 81            	ret
 412                     .const:	section	.text
 413  0000               L22:
 414  0000 004d          	dc.w	L14
 415  0002 0093          	dc.w	L702
 416  0004 0093          	dc.w	L702
 417  0006 0056          	dc.w	L34
 418  0008 0093          	dc.w	L702
 419  000a 0056          	dc.w	L34
 420  000c 0056          	dc.w	L34
 421  000e 005f          	dc.w	L54
 422  0010 005f          	dc.w	L54
 423  0012 005f          	dc.w	L54
 424  0014 005f          	dc.w	L54
 425  0016 0068          	dc.w	L74
 426  0018 0068          	dc.w	L74
 427  001a 0068          	dc.w	L74
 428  001c 0068          	dc.w	L74
 429  001e 0093          	dc.w	L702
 430  0020 0093          	dc.w	L702
 431  0022 0071          	dc.w	L15
 432  0024 0071          	dc.w	L15
 433  0026 007a          	dc.w	L35
 434  0028 007a          	dc.w	L35
 435  002a 007a          	dc.w	L35
 436  002c 0093          	dc.w	L702
 437  002e 0093          	dc.w	L702
 438  0030 0083          	dc.w	L55
 439  0032 0083          	dc.w	L55
 440  0034 0083          	dc.w	L55
 441  0036 008c          	dc.w	L75
 442  0038 008c          	dc.w	L75
 443                     ; 98 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 443                     ; 99 {
 444                     	switch	.text
 445  0029               _ITC_GetSoftwarePriority:
 447  0029 88            	push	a
 448  002a 89            	pushw	x
 449       00000002      OFST:	set	2
 452                     ; 100     uint8_t Value = 0;
 454  002b 0f02          	clr	(OFST+0,sp)
 455                     ; 104     assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 457                     ; 107     Mask = (uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U));
 459  002d a403          	and	a,#3
 460  002f 48            	sll	a
 461  0030 5f            	clrw	x
 462  0031 97            	ld	xl,a
 463  0032 a603          	ld	a,#3
 464  0034 5d            	tnzw	x
 465  0035 2704          	jreq	L41
 466  0037               L61:
 467  0037 48            	sll	a
 468  0038 5a            	decw	x
 469  0039 26fc          	jrne	L61
 470  003b               L41:
 471  003b 6b01          	ld	(OFST-1,sp),a
 472                     ; 109     switch (IRQn)
 474  003d 7b03          	ld	a,(OFST+1,sp)
 476                     ; 157     default:
 476                     ; 158         break;
 477  003f 4a            	dec	a
 478  0040 a11d          	cp	a,#29
 479  0042 2407          	jruge	L02
 480  0044 5f            	clrw	x
 481  0045 97            	ld	xl,a
 482  0046 58            	sllw	x
 483  0047 de0000        	ldw	x,(L22,x)
 484  004a fc            	jp	(x)
 485  004b               L02:
 486  004b 2046          	jra	L702
 487  004d               L14:
 488                     ; 111     case FLASH_IRQn:
 488                     ; 112         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 490  004d c67f70        	ld	a,32624
 491  0050 1401          	and	a,(OFST-1,sp)
 492  0052 6b02          	ld	(OFST+0,sp),a
 493                     ; 113         break;
 495  0054 203d          	jra	L702
 496  0056               L34:
 497                     ; 115     case AWU_IRQn:
 497                     ; 116     case EXTIB_IRQn:
 497                     ; 117     case EXTID_IRQn:
 497                     ; 118         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 499  0056 c67f71        	ld	a,32625
 500  0059 1401          	and	a,(OFST-1,sp)
 501  005b 6b02          	ld	(OFST+0,sp),a
 502                     ; 119         break;
 504  005d 2034          	jra	L702
 505  005f               L54:
 506                     ; 121     case EXTI0_IRQn:
 506                     ; 122     case EXTI1_IRQn:
 506                     ; 123     case EXTI2_IRQn:
 506                     ; 124     case EXTI3_IRQn:
 506                     ; 125         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 508  005f c67f72        	ld	a,32626
 509  0062 1401          	and	a,(OFST-1,sp)
 510  0064 6b02          	ld	(OFST+0,sp),a
 511                     ; 126         break;
 513  0066 202b          	jra	L702
 514  0068               L74:
 515                     ; 128     case EXTI4_IRQn:
 515                     ; 129     case EXTI5_IRQn:
 515                     ; 130     case EXTI6_IRQn:
 515                     ; 131     case EXTI7_IRQn:
 515                     ; 132         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 517  0068 c67f73        	ld	a,32627
 518  006b 1401          	and	a,(OFST-1,sp)
 519  006d 6b02          	ld	(OFST+0,sp),a
 520                     ; 133         break;
 522  006f 2022          	jra	L702
 523  0071               L15:
 524                     ; 135     case COMP_IRQn:
 524                     ; 136     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 524                     ; 137         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 526  0071 c67f74        	ld	a,32628
 527  0074 1401          	and	a,(OFST-1,sp)
 528  0076 6b02          	ld	(OFST+0,sp),a
 529                     ; 138         break;
 531  0078 2019          	jra	L702
 532  007a               L35:
 533                     ; 140     case TIM2_CAP_IRQn:
 533                     ; 141     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 533                     ; 142     case TIM3_CAP_IRQn:
 533                     ; 143         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 535  007a c67f75        	ld	a,32629
 536  007d 1401          	and	a,(OFST-1,sp)
 537  007f 6b02          	ld	(OFST+0,sp),a
 538                     ; 144         break;
 540  0081 2010          	jra	L702
 541  0083               L55:
 542                     ; 146     case TIM4_UPD_OVF_IRQn:
 542                     ; 147     case SPI_IRQn:
 542                     ; 148     case USART_TX_IRQn:
 542                     ; 149         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 544  0083 c67f76        	ld	a,32630
 545  0086 1401          	and	a,(OFST-1,sp)
 546  0088 6b02          	ld	(OFST+0,sp),a
 547                     ; 150         break;
 549  008a 2007          	jra	L702
 550  008c               L75:
 551                     ; 152     case USART_RX_IRQn:
 551                     ; 153     case I2C_IRQn:
 551                     ; 154         Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 553  008c c67f77        	ld	a,32631
 554  008f 1401          	and	a,(OFST-1,sp)
 555  0091 6b02          	ld	(OFST+0,sp),a
 556                     ; 155         break;
 558  0093               L16:
 559                     ; 157     default:
 559                     ; 158         break;
 561  0093               L702:
 562                     ; 161     Value >>= (uint8_t)(((uint8_t)IRQn % 4u) * 2u);
 564  0093 7b03          	ld	a,(OFST+1,sp)
 565  0095 a403          	and	a,#3
 566  0097 48            	sll	a
 567  0098 5f            	clrw	x
 568  0099 97            	ld	xl,a
 569  009a 7b02          	ld	a,(OFST+0,sp)
 570  009c 5d            	tnzw	x
 571  009d 2704          	jreq	L42
 572  009f               L62:
 573  009f 44            	srl	a
 574  00a0 5a            	decw	x
 575  00a1 26fc          	jrne	L62
 576  00a3               L42:
 577  00a3 6b02          	ld	(OFST+0,sp),a
 578                     ; 163     return((ITC_PriorityLevel_TypeDef)Value);
 580  00a5 7b02          	ld	a,(OFST+0,sp)
 583  00a7 5b03          	addw	sp,#3
 584  00a9 81            	ret
 648                     	switch	.const
 649  003a               L44:
 650  003a 00e2          	dc.w	L112
 651  003c 0170          	dc.w	L762
 652  003e 0170          	dc.w	L762
 653  0040 00f4          	dc.w	L312
 654  0042 0170          	dc.w	L762
 655  0044 00f4          	dc.w	L312
 656  0046 00f4          	dc.w	L312
 657  0048 0106          	dc.w	L512
 658  004a 0106          	dc.w	L512
 659  004c 0106          	dc.w	L512
 660  004e 0106          	dc.w	L512
 661  0050 0118          	dc.w	L712
 662  0052 0118          	dc.w	L712
 663  0054 0118          	dc.w	L712
 664  0056 0118          	dc.w	L712
 665  0058 0170          	dc.w	L762
 666  005a 0170          	dc.w	L762
 667  005c 012a          	dc.w	L122
 668  005e 012a          	dc.w	L122
 669  0060 013c          	dc.w	L322
 670  0062 013c          	dc.w	L322
 671  0064 013c          	dc.w	L322
 672  0066 0170          	dc.w	L762
 673  0068 0170          	dc.w	L762
 674  006a 014e          	dc.w	L522
 675  006c 014e          	dc.w	L522
 676  006e 014e          	dc.w	L522
 677  0070 0160          	dc.w	L722
 678  0072 0160          	dc.w	L722
 679                     ; 177 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 679                     ; 178 {
 680                     	switch	.text
 681  00aa               _ITC_SetSoftwarePriority:
 683  00aa 89            	pushw	x
 684  00ab 89            	pushw	x
 685       00000002      OFST:	set	2
 688                     ; 183     assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 690                     ; 184     assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 692                     ; 187     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 694                     ; 191     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U)));
 696  00ac 9e            	ld	a,xh
 697  00ad a403          	and	a,#3
 698  00af 48            	sll	a
 699  00b0 5f            	clrw	x
 700  00b1 97            	ld	xl,a
 701  00b2 a603          	ld	a,#3
 702  00b4 5d            	tnzw	x
 703  00b5 2704          	jreq	L23
 704  00b7               L43:
 705  00b7 48            	sll	a
 706  00b8 5a            	decw	x
 707  00b9 26fc          	jrne	L43
 708  00bb               L23:
 709  00bb 43            	cpl	a
 710  00bc 6b01          	ld	(OFST-1,sp),a
 711                     ; 194     NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << (((uint8_t)IRQn % 4U) * 2U));
 713  00be 7b03          	ld	a,(OFST+1,sp)
 714  00c0 a403          	and	a,#3
 715  00c2 48            	sll	a
 716  00c3 5f            	clrw	x
 717  00c4 97            	ld	xl,a
 718  00c5 7b04          	ld	a,(OFST+2,sp)
 719  00c7 5d            	tnzw	x
 720  00c8 2704          	jreq	L63
 721  00ca               L04:
 722  00ca 48            	sll	a
 723  00cb 5a            	decw	x
 724  00cc 26fc          	jrne	L04
 725  00ce               L63:
 726  00ce 6b02          	ld	(OFST+0,sp),a
 727                     ; 196     switch (IRQn)
 729  00d0 7b03          	ld	a,(OFST+1,sp)
 731                     ; 252     default:
 731                     ; 253         break;
 732  00d2 4a            	dec	a
 733  00d3 a11d          	cp	a,#29
 734  00d5 2407          	jruge	L24
 735  00d7 5f            	clrw	x
 736  00d8 97            	ld	xl,a
 737  00d9 58            	sllw	x
 738  00da de003a        	ldw	x,(L44,x)
 739  00dd fc            	jp	(x)
 740  00de               L24:
 741  00de ac700170      	jpf	L762
 742  00e2               L112:
 743                     ; 198     case FLASH_IRQn:
 743                     ; 199         ITC->ISPR1 &= Mask;
 745  00e2 c67f70        	ld	a,32624
 746  00e5 1401          	and	a,(OFST-1,sp)
 747  00e7 c77f70        	ld	32624,a
 748                     ; 200         ITC->ISPR1 |= NewPriority;
 750  00ea c67f70        	ld	a,32624
 751  00ed 1a02          	or	a,(OFST+0,sp)
 752  00ef c77f70        	ld	32624,a
 753                     ; 201         break;
 755  00f2 207c          	jra	L762
 756  00f4               L312:
 757                     ; 203     case AWU_IRQn:
 757                     ; 204     case EXTIB_IRQn:
 757                     ; 205     case EXTID_IRQn:
 757                     ; 206         ITC->ISPR2 &= Mask;
 759  00f4 c67f71        	ld	a,32625
 760  00f7 1401          	and	a,(OFST-1,sp)
 761  00f9 c77f71        	ld	32625,a
 762                     ; 207         ITC->ISPR2 |= NewPriority;
 764  00fc c67f71        	ld	a,32625
 765  00ff 1a02          	or	a,(OFST+0,sp)
 766  0101 c77f71        	ld	32625,a
 767                     ; 208         break;
 769  0104 206a          	jra	L762
 770  0106               L512:
 771                     ; 210     case EXTI0_IRQn:
 771                     ; 211     case EXTI1_IRQn:
 771                     ; 212     case EXTI2_IRQn:
 771                     ; 213     case EXTI3_IRQn:
 771                     ; 214         ITC->ISPR3 &= Mask;
 773  0106 c67f72        	ld	a,32626
 774  0109 1401          	and	a,(OFST-1,sp)
 775  010b c77f72        	ld	32626,a
 776                     ; 215         ITC->ISPR3 |= NewPriority;
 778  010e c67f72        	ld	a,32626
 779  0111 1a02          	or	a,(OFST+0,sp)
 780  0113 c77f72        	ld	32626,a
 781                     ; 216         break;
 783  0116 2058          	jra	L762
 784  0118               L712:
 785                     ; 218     case EXTI4_IRQn:
 785                     ; 219     case EXTI5_IRQn:
 785                     ; 220     case EXTI6_IRQn:
 785                     ; 221     case EXTI7_IRQn:
 785                     ; 222         ITC->ISPR4 &= Mask;
 787  0118 c67f73        	ld	a,32627
 788  011b 1401          	and	a,(OFST-1,sp)
 789  011d c77f73        	ld	32627,a
 790                     ; 223         ITC->ISPR4 |= NewPriority;
 792  0120 c67f73        	ld	a,32627
 793  0123 1a02          	or	a,(OFST+0,sp)
 794  0125 c77f73        	ld	32627,a
 795                     ; 224         break;
 797  0128 2046          	jra	L762
 798  012a               L122:
 799                     ; 226     case COMP_IRQn:
 799                     ; 227     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 799                     ; 228         ITC->ISPR5 &= Mask;
 801  012a c67f74        	ld	a,32628
 802  012d 1401          	and	a,(OFST-1,sp)
 803  012f c77f74        	ld	32628,a
 804                     ; 229         ITC->ISPR5 |= NewPriority;
 806  0132 c67f74        	ld	a,32628
 807  0135 1a02          	or	a,(OFST+0,sp)
 808  0137 c77f74        	ld	32628,a
 809                     ; 230         break;
 811  013a 2034          	jra	L762
 812  013c               L322:
 813                     ; 232     case TIM2_CAP_IRQn:
 813                     ; 233     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 813                     ; 234     case TIM3_CAP_IRQn:
 813                     ; 235         ITC->ISPR6 &= Mask;
 815  013c c67f75        	ld	a,32629
 816  013f 1401          	and	a,(OFST-1,sp)
 817  0141 c77f75        	ld	32629,a
 818                     ; 236         ITC->ISPR6 |= NewPriority;
 820  0144 c67f75        	ld	a,32629
 821  0147 1a02          	or	a,(OFST+0,sp)
 822  0149 c77f75        	ld	32629,a
 823                     ; 237         break;
 825  014c 2022          	jra	L762
 826  014e               L522:
 827                     ; 239     case TIM4_UPD_OVF_IRQn:
 827                     ; 240     case SPI_IRQn:
 827                     ; 241     case USART_TX_IRQn:
 827                     ; 242         ITC->ISPR7 &= Mask;
 829  014e c67f76        	ld	a,32630
 830  0151 1401          	and	a,(OFST-1,sp)
 831  0153 c77f76        	ld	32630,a
 832                     ; 243         ITC->ISPR7 |= NewPriority;
 834  0156 c67f76        	ld	a,32630
 835  0159 1a02          	or	a,(OFST+0,sp)
 836  015b c77f76        	ld	32630,a
 837                     ; 244         break;
 839  015e 2010          	jra	L762
 840  0160               L722:
 841                     ; 246     case USART_RX_IRQn:
 841                     ; 247     case I2C_IRQn:
 841                     ; 248         ITC->ISPR8 &= Mask;
 843  0160 c67f77        	ld	a,32631
 844  0163 1401          	and	a,(OFST-1,sp)
 845  0165 c77f77        	ld	32631,a
 846                     ; 249         ITC->ISPR8 |= NewPriority;
 848  0168 c67f77        	ld	a,32631
 849  016b 1a02          	or	a,(OFST+0,sp)
 850  016d c77f77        	ld	32631,a
 851                     ; 250         break;
 853  0170               L132:
 854                     ; 252     default:
 854                     ; 253         break;
 856  0170               L762:
 857                     ; 255 }
 860  0170 5b04          	addw	sp,#4
 861  0172 81            	ret
 874                     	xdef	_ITC_SetSoftwarePriority
 875                     	xdef	_ITC_GetSoftwarePriority
 876                     	xdef	_ITC_GetSoftIntStatus
 877                     	xdef	_ITC_DeInit
 878                     	xdef	_ITC_GetCPUCC
 897                     	end
