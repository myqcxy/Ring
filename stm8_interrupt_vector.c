/*	BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 *	Copyright (c) 2007 STMicroelectronics
 */

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

//--Custom Interrupt ---------------------------------------
@far @interrupt void TIM2_Handle_ISR(void);
//@far @interrupt void Uart1Tx_Handle_ISR(void);
@far @interrupt void UsartRx_Handle_ISR(void);
@far @interrupt void AWU_Handle_ISR(void);
@far @interrupt void EXTI5_Handle_ISR(void);
//----------------------------------------------------------
@far @interrupt void NonHandledInterrupt (void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

extern void _stext();     /* startup routine */

struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* reset */
	{0x82, NonHandledInterrupt}, // trap  
	{0x82, NonHandledInterrupt}, // irq0  Reserved
	{0x82, NonHandledInterrupt}, // irq1  Flash
	{0x82, NonHandledInterrupt}, // irq2  Reserved
	{0x82, NonHandledInterrupt}, // irq3  Reserved
	{0x82, AWU_Handle_ISR}, // irq4  AWU 
	{0x82, NonHandledInterrupt}, // irq5	Reserved
	{0x82, NonHandledInterrupt}, // irq6  EXTIB PORTB
	{0x82, NonHandledInterrupt}, // irq7  EXTID PORTD
	{0x82, NonHandledInterrupt}, // irq8  EXTI0
	{0x82, NonHandledInterrupt}, // irq9  EXTI1
	{0x82, NonHandledInterrupt}, // irq10 EXTI2
	{0x82, NonHandledInterrupt}, // irq11 EXTI3
	{0x82, NonHandledInterrupt}, // irq12 EXTI4
	{0x82, EXTI5_Handle_ISR}, // irq13 EXTI5
	{0x82, NonHandledInterrupt}, // irq14 EXTI6
	{0x82, NonHandledInterrupt}, // irq15 EXTI7
	{0x82, NonHandledInterrupt}, // irq16 Reserved
	{0x82, NonHandledInterrupt}, // irq17 Reserved
	{0x82, NonHandledInterrupt},  // irq18 Comp
	{0x82, TIM2_Handle_ISR}, // irq19 TM2 Up/Ov/Tr/Br 
	{0x82, NonHandledInterrupt}, // irq20 TM2 Ca/Co
	{0x82, NonHandledInterrupt}, // irq21 TM3 Up/Ov/Br
	{0x82, NonHandledInterrupt}, // irq22 TM3 Ca/Co
	{0x82, NonHandledInterrupt}, // irq23 Reserved
	{0x82, NonHandledInterrupt}, // irq24 Reserved
	{0x82, NonHandledInterrupt}, // irq25 TM4 Up/Tr
	{0x82, NonHandledInterrupt}, // irq26 SPI
	{0x82, NonHandledInterrupt}, // irq27 USART TX
	{0x82, UsartRx_Handle_ISR}, // irq28 USART Rx
	{0x82, NonHandledInterrupt}, // irq29 I2C
};
