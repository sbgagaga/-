#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB = 0;					//PORTB口作输出口
		
	PR2 = 250;					//设定Timer初始值
	TMR2IF = 0;
	TMR2IE = 1;					//使能Timer2溢出中断
	
	T2CON = 0B00000100;			//开启Timer2
	
	INTCON = 0XC0;				//开启总中断
	while(1)
	{
		asm("clrwdt");
	}
}

void interrupt Timer1_Isr(void)
{
	if(TMR2IF)
	{
		TMR2IF = 0;
		
		PORTB ^= 0XFF;
	}
}