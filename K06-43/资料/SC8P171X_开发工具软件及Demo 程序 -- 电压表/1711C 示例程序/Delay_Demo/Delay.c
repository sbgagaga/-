/**********************************************************
延时函数使用范例
**********************************************************/

#include <sc.h>

#ifndef _XTAL_FREQ
 #define _XTAL_FREQ 8000000			//8Mhz,使用内置延时函数必须定义主频
#endif

//微秒级非精准延时函数
void DelayXus(unsigned char x)
{
	while(--x);
}

//毫秒级非精准延时函数
void DelayXms(unsigned char x)
{
	unsigned char i = 0;;
	
	while(--x)
	{
		asm("clrwdt"); 
		while(--i)
		{
			asm("nop");
			asm("nop");
			asm("nop");
			asm("nop");
		}
	}
}

void main(void)
{
	DelayXms(50);
	while(1)
	{
		NOP();
		_delay(1000);		//延时1000指令周期(编译器内置函数)
		CLRWDT();
		__delay_us(400);	//延时400us(编译器内置函数)
		CLRWDT();
		__delay_ms(2);		//延时2ms(编译器内置函数)
		CLRWDT();
	}
}

