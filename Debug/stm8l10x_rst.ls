   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 110                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 110                     ; 55 {
 112                     	switch	.text
 113  0000               _RST_GetFlagStatus:
 117                     ; 57     assert_param(IS_RST_FLAG(RST_Flag));
 119                     ; 61     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 121  0000 c450b1        	and	a,20657
 124  0003 81            	ret
 159                     ; 70 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 159                     ; 71 {
 160                     	switch	.text
 161  0004               _RST_ClearFlag:
 165                     ; 73     assert_param(IS_RST_FLAG(RST_Flag));
 167                     ; 75     RST->SR = (uint8_t)RST_Flag;
 169  0004 c750b1        	ld	20657,a
 170                     ; 76 }
 173  0007 81            	ret
 196                     ; 85 void RST_GPOutputEnable(void)
 196                     ; 86 {
 197                     	switch	.text
 198  0008               _RST_GPOutputEnable:
 202                     ; 88     RST->CR = RST_CR_MASK;
 204  0008 35d050b0      	mov	20656,#208
 205                     ; 89 }
 208  000c 81            	ret
 221                     	xdef	_RST_GPOutputEnable
 222                     	xdef	_RST_ClearFlag
 223                     	xdef	_RST_GetFlagStatus
 242                     	end
