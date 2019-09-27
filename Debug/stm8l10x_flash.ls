   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  76                     ; 46 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  76                     ; 47 {
  78                     	switch	.text
  79  0000               _FLASH_Unlock:
  81  0000 88            	push	a
  82       00000000      OFST:	set	0
  85                     ; 49     assert_param(IS_MEMORY_TYPE(FLASH_MemType));
  87                     ; 52     if (FLASH_MemType == FLASH_MemType_Program)
  89  0001 a1fd          	cp	a,#253
  90  0003 2608          	jrne	L73
  91                     ; 54         FLASH->PUKR = FLASH_RASS_KEY1;
  93  0005 35565052      	mov	20562,#86
  94                     ; 55         FLASH->PUKR= FLASH_RASS_KEY2;
  96  0009 35ae5052      	mov	20562,#174
  97  000d               L73:
  98                     ; 58     if (FLASH_MemType == FLASH_MemType_Data)
 100  000d 7b01          	ld	a,(OFST+1,sp)
 101  000f a1f7          	cp	a,#247
 102  0011 2608          	jrne	L14
 103                     ; 60         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 105  0013 35ae5053      	mov	20563,#174
 106                     ; 61         FLASH->DUKR = FLASH_RASS_KEY1;
 108  0017 35565053      	mov	20563,#86
 109  001b               L14:
 110                     ; 64 }
 113  001b 84            	pop	a
 114  001c 81            	ret
 149                     ; 72 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 149                     ; 73 {
 150                     	switch	.text
 151  001d               _FLASH_Lock:
 155                     ; 75     assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 157                     ; 77     FLASH->IAPSR &= FLASH_MemType;
 159  001d c45054        	and	a,20564
 160  0020 c75054        	ld	20564,a
 161                     ; 78 }
 164  0023 81            	ret
 198                     ; 86 void FLASH_DeInit(void)
 198                     ; 87 {
 199                     	switch	.text
 200  0024               _FLASH_DeInit:
 202  0024 88            	push	a
 203       00000001      OFST:	set	1
 206                     ; 89     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 208  0025 725f5050      	clr	20560
 209                     ; 90     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 211  0029 725f5051      	clr	20561
 212                     ; 91     FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 214  002d 35405054      	mov	20564,#64
 215                     ; 92     temp = FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 217  0031 c65054        	ld	a,20564
 218                     ; 93 }
 221  0034 84            	pop	a
 222  0035 81            	ret
 277                     ; 101 void FLASH_ITConfig(FunctionalState NewState)
 277                     ; 102 {
 278                     	switch	.text
 279  0036               _FLASH_ITConfig:
 283                     ; 105     assert_param(IS_FUNCTIONAL_STATE(NewState));
 285                     ; 107     if (NewState != DISABLE)
 287  0036 4d            	tnz	a
 288  0037 2706          	jreq	L521
 289                     ; 109         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 291  0039 72125050      	bset	20560,#1
 293  003d 2004          	jra	L721
 294  003f               L521:
 295                     ; 113         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 297  003f 72135050      	bres	20560,#1
 298  0043               L721:
 299                     ; 115 }
 302  0043 81            	ret
 336                     ; 124 void FLASH_EraseByte(uint16_t Address)
 336                     ; 125 {
 337                     	switch	.text
 338  0044               _FLASH_EraseByte:
 342                     ; 127     assert_param(IS_FLASH_ADDRESS(Address));
 344                     ; 129     *((PointerAttr uint8_t*) Address) = FLASH_CLEAR_BYTE; /* Erase byte */
 346  0044 7f            	clr	(x)
 347                     ; 131 }
 351  0045 81            	ret
 394                     ; 141 void FLASH_ProgramByte(uint16_t Address, uint8_t Data)
 394                     ; 142 {
 395                     	switch	.text
 396  0046               _FLASH_ProgramByte:
 398  0046 89            	pushw	x
 399       00000000      OFST:	set	0
 402                     ; 144     assert_param(IS_FLASH_ADDRESS(Address));
 404                     ; 145     *((PointerAttr uint8_t*) Address) = Data;
 406  0047 7b05          	ld	a,(OFST+5,sp)
 407  0049 1e01          	ldw	x,(OFST+1,sp)
 408  004b f7            	ld	(x),a
 409                     ; 146 }
 412  004c 85            	popw	x
 413  004d 81            	ret
 456                     ; 158 void FLASH_ProgramWord(uint16_t Address, uint32_t Data)
 456                     ; 159 {
 457                     	switch	.text
 458  004e               _FLASH_ProgramWord:
 460  004e 89            	pushw	x
 461       00000000      OFST:	set	0
 464                     ; 161     assert_param(IS_FLASH_ADDRESS(Address));
 466                     ; 164     FLASH->CR2 |= FLASH_CR2_WPRG;
 468  004f 721c5051      	bset	20561,#6
 469                     ; 166     *((PointerAttr uint8_t*)Address)       = *((uint8_t*)(&Data)); /* Write one byte - from lowest address*/
 471  0053 7b05          	ld	a,(OFST+5,sp)
 472  0055 1e01          	ldw	x,(OFST+1,sp)
 473  0057 f7            	ld	(x),a
 474                     ; 167     *(((PointerAttr uint8_t*)Address) + 1) = *((uint8_t*)(&Data)+1); /* Write one byte*/
 476  0058 7b06          	ld	a,(OFST+6,sp)
 477  005a 1e01          	ldw	x,(OFST+1,sp)
 478  005c e701          	ld	(1,x),a
 479                     ; 168     *(((PointerAttr uint8_t*)Address) + 2) = *((uint8_t*)(&Data)+2); /* Write one byte*/
 481  005e 7b07          	ld	a,(OFST+7,sp)
 482  0060 1e01          	ldw	x,(OFST+1,sp)
 483  0062 e702          	ld	(2,x),a
 484                     ; 169     *(((PointerAttr uint8_t*)Address) + 3) = *((uint8_t*)(&Data)+3); /* Write one byte - from higher address*/
 486  0064 7b08          	ld	a,(OFST+8,sp)
 487  0066 1e01          	ldw	x,(OFST+1,sp)
 488  0068 e703          	ld	(3,x),a
 489                     ; 170 }
 492  006a 85            	popw	x
 493  006b 81            	ret
 527                     ; 180 uint8_t FLASH_ReadByte(uint16_t Address)
 527                     ; 181 {
 528                     	switch	.text
 529  006c               _FLASH_ReadByte:
 533                     ; 183     assert_param(IS_FLASH_ADDRESS(Address));
 535                     ; 184     return(*((PointerAttr uint8_t*) Address)); /* Read byte */
 537  006c f6            	ld	a,(x)
 540  006d 81            	ret
 598                     ; 194 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgramTime)
 598                     ; 195 {
 599                     	switch	.text
 600  006e               _FLASH_SetProgrammingTime:
 604                     ; 197     assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgramTime));
 606                     ; 199     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
 608  006e 72115050      	bres	20560,#0
 609                     ; 200     FLASH->CR1 |= (uint8_t)FLASH_ProgramTime;
 611  0072 ca5050        	or	a,20560
 612  0075 c75050        	ld	20560,a
 613                     ; 201 }
 616  0078 81            	ret
 641                     ; 208 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 641                     ; 209 {
 642                     	switch	.text
 643  0079               _FLASH_GetProgrammingTime:
 647                     ; 210     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 649  0079 c65050        	ld	a,20560
 650  007c a401          	and	a,#1
 653  007e 81            	ret
 678                     ; 219 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 678                     ; 220 {
 679                     	switch	.text
 680  007f               _FLASH_GetReadOutProtectionStatus:
 684                     ; 221     if (OPT->OPT0_LOCKBYTE == FLASH_READOUTPROTECTION_KEY)
 686  007f c64800        	ld	a,18432
 687  0082 a1aa          	cp	a,#170
 688  0084 2603          	jrne	L772
 689                     ; 224         return ENABLE;
 691  0086 a601          	ld	a,#1
 694  0088 81            	ret
 695  0089               L772:
 696                     ; 229         return DISABLE;
 698  0089 4f            	clr	a
 701  008a 81            	ret
 735                     ; 239 uint16_t FLASH_GetBootSize(void)
 735                     ; 240 {
 736                     	switch	.text
 737  008b               _FLASH_GetBootSize:
 739  008b 89            	pushw	x
 740       00000002      OFST:	set	2
 743                     ; 244     temp = (uint16_t)(OPT->OPT2_BOOTSIZE * (uint16_t)64);
 745  008c c64802        	ld	a,18434
 746  008f 97            	ld	xl,a
 747  0090 a640          	ld	a,#64
 748  0092 42            	mul	x,a
 749  0093 1f01          	ldw	(OFST-1,sp),x
 750                     ; 247     if (OPT->OPT2_BOOTSIZE > 0x7F)
 752  0095 c64802        	ld	a,18434
 753  0098 a180          	cp	a,#128
 754  009a 2505          	jrult	L123
 755                     ; 249         temp = 8192;
 757  009c ae2000        	ldw	x,#8192
 758  009f 1f01          	ldw	(OFST-1,sp),x
 759  00a1               L123:
 760                     ; 253     return(temp);
 762  00a1 1e01          	ldw	x,(OFST-1,sp)
 765  00a3 5b02          	addw	sp,#2
 766  00a5 81            	ret
 800                     ; 263 uint16_t FLASH_GetDataSize(void)
 800                     ; 264 {
 801                     	switch	.text
 802  00a6               _FLASH_GetDataSize:
 804  00a6 89            	pushw	x
 805       00000002      OFST:	set	2
 808                     ; 267     temp = (uint16_t)(OPT->OPT3_DATASIZE * (uint16_t)64);
 810  00a7 c64803        	ld	a,18435
 811  00aa 97            	ld	xl,a
 812  00ab a640          	ld	a,#64
 813  00ad 42            	mul	x,a
 814  00ae 1f01          	ldw	(OFST-1,sp),x
 815                     ; 270     if (OPT->OPT3_DATASIZE > 0x20)
 817  00b0 c64803        	ld	a,18435
 818  00b3 a121          	cp	a,#33
 819  00b5 2505          	jrult	L143
 820                     ; 272         temp = 2048;
 822  00b7 ae0800        	ldw	x,#2048
 823  00ba 1f01          	ldw	(OFST-1,sp),x
 824  00bc               L143:
 825                     ; 276     return(temp);
 827  00bc 1e01          	ldw	x,(OFST-1,sp)
 830  00be 5b02          	addw	sp,#2
 831  00c0 81            	ret
 933                     ; 285 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
 933                     ; 286 {
 934                     	switch	.text
 935  00c1               _FLASH_GetFlagStatus:
 937  00c1 88            	push	a
 938       00000001      OFST:	set	1
 941                     ; 287     FlagStatus status = RESET;
 943                     ; 288     assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
 945                     ; 291     if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 947  00c2 c45054        	and	a,20564
 948  00c5 2706          	jreq	L114
 949                     ; 293         status = SET; /* FLASH_FLAG is set*/
 951  00c7 a601          	ld	a,#1
 952  00c9 6b01          	ld	(OFST+0,sp),a
 954  00cb 2002          	jra	L314
 955  00cd               L114:
 956                     ; 297         status = RESET; /* FLASH_FLAG is reset*/
 958  00cd 0f01          	clr	(OFST+0,sp)
 959  00cf               L314:
 960                     ; 301     return status;
 962  00cf 7b01          	ld	a,(OFST+0,sp)
 965  00d1 5b01          	addw	sp,#1
 966  00d3 81            	ret
1041                     ; 312 FLASH_Status_TypeDef FLASH_WaitForLastOperation(void)
1041                     ; 313 {
1042                     	switch	.text
1043  00d4               _FLASH_WaitForLastOperation:
1045  00d4 5205          	subw	sp,#5
1046       00000005      OFST:	set	5
1049                     ; 314     uint32_t timeout = OPERATION_TIMEOUT;
1051  00d6 ae1000        	ldw	x,#4096
1052  00d9 1f03          	ldw	(OFST-2,sp),x
1053  00db ae0000        	ldw	x,#0
1054  00de 1f01          	ldw	(OFST-4,sp),x
1055                     ; 315     uint8_t My_FlagStatus = 0x00;
1057  00e0 0f05          	clr	(OFST+0,sp)
1059  00e2 2010          	jra	L554
1060  00e4               L154:
1061                     ; 320         My_FlagStatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1063  00e4 c65054        	ld	a,20564
1064  00e7 a405          	and	a,#5
1065  00e9 6b05          	ld	(OFST+0,sp),a
1066                     ; 321         timeout--;
1068  00eb 96            	ldw	x,sp
1069  00ec 1c0001        	addw	x,#OFST-4
1070  00ef a601          	ld	a,#1
1071  00f1 cd0000        	call	c_lgsbc
1073  00f4               L554:
1074                     ; 318     while ((My_FlagStatus == 0x00) && (timeout != 0x00))
1076  00f4 0d05          	tnz	(OFST+0,sp)
1077  00f6 2609          	jrne	L164
1079  00f8 96            	ldw	x,sp
1080  00f9 1c0001        	addw	x,#OFST-4
1081  00fc cd0000        	call	c_lzmp
1083  00ff 26e3          	jrne	L154
1084  0101               L164:
1085                     ; 324     if (timeout == 0x00 )
1087  0101 96            	ldw	x,sp
1088  0102 1c0001        	addw	x,#OFST-4
1089  0105 cd0000        	call	c_lzmp
1091  0108 2604          	jrne	L364
1092                     ; 326         My_FlagStatus = FLASH_Status_TimeOut;
1094  010a a602          	ld	a,#2
1095  010c 6b05          	ld	(OFST+0,sp),a
1096  010e               L364:
1097                     ; 329     return((FLASH_Status_TypeDef)My_FlagStatus);
1099  010e 7b05          	ld	a,(OFST+0,sp)
1102  0110 5b05          	addw	sp,#5
1103  0112 81            	ret
1156                     ; 355 void FLASH_EraseBlock(uint8_t BlockNum)
1156                     ; 356 {
1157                     	switch	.text
1158  0113               _FLASH_EraseBlock:
1160  0113 5204          	subw	sp,#4
1161       00000004      OFST:	set	4
1164                     ; 358     uint16_t StartAddress = 0;
1166                     ; 360     assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1168                     ; 362     StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1170                     ; 364     pwFlash = (PointerAttr uint32_t *)(StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE));
1172  0115 5f            	clrw	x
1173  0116 97            	ld	xl,a
1174  0117 58            	sllw	x
1175  0118 58            	sllw	x
1176  0119 58            	sllw	x
1177  011a 58            	sllw	x
1178  011b 58            	sllw	x
1179  011c 58            	sllw	x
1180  011d 1c8000        	addw	x,#32768
1181  0120 1f01          	ldw	(OFST-3,sp),x
1182                     ; 367     FLASH->CR2 |= FLASH_CR2_ERASE;
1184  0122 721a5051      	bset	20561,#5
1185                     ; 369     *pwFlash = (uint32_t)0;
1187  0126 1e01          	ldw	x,(OFST-3,sp)
1188  0128 a600          	ld	a,#0
1189  012a e703          	ld	(3,x),a
1190  012c a600          	ld	a,#0
1191  012e e702          	ld	(2,x),a
1192  0130 a600          	ld	a,#0
1193  0132 e701          	ld	(1,x),a
1194  0134 a600          	ld	a,#0
1195  0136 f7            	ld	(x),a
1196                     ; 370 }
1199  0137 5b04          	addw	sp,#4
1200  0139 81            	ret
1294                     ; 383 void FLASH_ProgramBlock(uint8_t BlockNum, FLASH_ProgramMode_TypeDef FLASH_ProgramMode, uint8_t *Buffer)
1294                     ; 384 {
1295                     	switch	.text
1296  013a               _FLASH_ProgramBlock:
1298  013a 89            	pushw	x
1299  013b 5204          	subw	sp,#4
1300       00000004      OFST:	set	4
1303                     ; 385     uint16_t Count = 0;
1305                     ; 389     assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1307                     ; 390     assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgramMode));
1309                     ; 393     if (FLASH_ProgramMode == FLASH_ProgramMode_Standard)
1311  013d 9f            	ld	a,xl
1312  013e 4d            	tnz	a
1313  013f 2606          	jrne	L165
1314                     ; 396         FLASH->CR2 |= FLASH_CR2_PRG;
1316  0141 72105051      	bset	20561,#0
1318  0145 2004          	jra	L365
1319  0147               L165:
1320                     ; 401         FLASH->CR2 |= FLASH_CR2_FPRG;
1322  0147 72185051      	bset	20561,#4
1323  014b               L365:
1324                     ; 403     StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1326                     ; 405     StartAddress = StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE);
1328  014b 7b05          	ld	a,(OFST+1,sp)
1329  014d 5f            	clrw	x
1330  014e 97            	ld	xl,a
1331  014f 58            	sllw	x
1332  0150 58            	sllw	x
1333  0151 58            	sllw	x
1334  0152 58            	sllw	x
1335  0153 58            	sllw	x
1336  0154 58            	sllw	x
1337  0155 1c8000        	addw	x,#32768
1338  0158 1f01          	ldw	(OFST-3,sp),x
1339                     ; 408     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1341  015a 5f            	clrw	x
1342  015b 1f03          	ldw	(OFST-1,sp),x
1343  015d               L565:
1344                     ; 410         *((PointerAttr uint8_t*)StartAddress + Count) = ((uint8_t)(Buffer[Count]));
1346  015d 1e09          	ldw	x,(OFST+5,sp)
1347  015f 72fb03        	addw	x,(OFST-1,sp)
1348  0162 f6            	ld	a,(x)
1349  0163 1e01          	ldw	x,(OFST-3,sp)
1350  0165 72fb03        	addw	x,(OFST-1,sp)
1351  0168 f7            	ld	(x),a
1352                     ; 408     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1354  0169 1e03          	ldw	x,(OFST-1,sp)
1355  016b 1c0001        	addw	x,#1
1356  016e 1f03          	ldw	(OFST-1,sp),x
1359  0170 1e03          	ldw	x,(OFST-1,sp)
1360  0172 a30040        	cpw	x,#64
1361  0175 25e6          	jrult	L565
1362                     ; 412 }
1365  0177 5b06          	addw	sp,#6
1366  0179 81            	ret
1379                     	xdef	_FLASH_WaitForLastOperation
1380                     	xdef	_FLASH_GetFlagStatus
1381                     	xdef	_FLASH_GetDataSize
1382                     	xdef	_FLASH_GetBootSize
1383                     	xdef	_FLASH_GetReadOutProtectionStatus
1384                     	xdef	_FLASH_SetProgrammingTime
1385                     	xdef	_FLASH_GetProgrammingTime
1386                     	xdef	_FLASH_ReadByte
1387                     	xdef	_FLASH_ProgramWord
1388                     	xdef	_FLASH_EraseByte
1389                     	xdef	_FLASH_ProgramByte
1390                     	xdef	_FLASH_EraseBlock
1391                     	xdef	_FLASH_ProgramBlock
1392                     	xdef	_FLASH_ITConfig
1393                     	xdef	_FLASH_Lock
1394                     	xdef	_FLASH_Unlock
1395                     	xdef	_FLASH_DeInit
1414                     	xref	c_lzmp
1415                     	xref	c_lgsbc
1416                     	end
