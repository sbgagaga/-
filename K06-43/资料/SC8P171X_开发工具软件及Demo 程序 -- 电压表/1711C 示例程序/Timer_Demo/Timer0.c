#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB = 0;					//PORTB口作输出口
	
	OPTION_REG = 0B11010000;	//Timer0使用内部时钟，预分频为1:2
	
	TMR0 = 6;					//设定Timer初始值
	T0IF = 0;
	T0IE = 1;					//使能Timer0溢出中断
	
	GIE = 1;					//开启总中断
	
	while(1)
	{
		asm("clrwdt");
	}
}

void interrupt Timer0_Isr(void)
{
	if(T0IF)
	{
		TMR0 += 6;
		T0IF = 0;
		
		PORTB ^= 0XFF;
	}
}