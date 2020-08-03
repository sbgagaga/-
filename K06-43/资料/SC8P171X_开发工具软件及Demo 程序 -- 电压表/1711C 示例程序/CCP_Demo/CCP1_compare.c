
//CCP1比较模式参考程序
#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB=0;
	
	CCP1CON=0B00001011;			//CCP1配置为比较模式
	
	INTCON=0B11000000;			//使能总中断
	
	CCP1IE = 1;					//使能CCP1中断
	CCPR1H=0X00;
	CCPR1L=0X80;				//设置比较匹配值
	
	T1CON=0B00010001;			//设置Timer1分频比，开启Timer1
    while(1)
    {
    	asm("CLRWDT");
    }
}


void interrupt ccp1_isr(void)
{
	if(CCP1IF&&CCP1IE)
	{
		CCP1IF=0;
		PORTB^=0XFF;			//匹配时翻转IO口
	}
}
