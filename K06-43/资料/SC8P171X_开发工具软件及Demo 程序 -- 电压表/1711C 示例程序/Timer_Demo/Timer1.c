#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB = 0;					//PORTB口作输出口
		
	TMR1L = 0;					//设定Timer初始值
	TMR1H = 0xFE;
	TMR1IF = 0;
	TMR1IE = 1;					//使能Timer1溢出中断
	
	T1CON = 0B00100001;			//开启Timer1，预分频为1:4
	
	INTCON = 0XC0;				//开启总中断
	while(1)
	{
		asm("clrwdt");
	}
}

void interrupt Timer1_Isr(void)
{
	if(TMR1IF)
	{
		TMR1H += 0XFE;
		TMR1IF = 0;
		
		PORTB ^= 0XFF;
	}
}