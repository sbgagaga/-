
//CCP1比较模式参考程序
#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB=0;
	
	CCP2CON=0B00001011;			//CCP2配置为比较模式
	
	INTCON=0B11000000;			//使能总中断
	
	CCP2IE = 1;					//使能CCP2中断
	CCPR2H=0X00;
	CCPR2L=0X80;				//设置比较匹配值
	
	T1CON=0B00010001;			//设置Timer1分频比，开启Timer1
    while(1)
    {
    	asm("CLRWDT");
    }
}


void interrupt ccp2_isr(void)
{
	if(CCP2IF&&CCP2IE)
	{
		CCP2IF=0;
		PORTB^=0XFF;			//匹配时翻转IO口
	}
}
