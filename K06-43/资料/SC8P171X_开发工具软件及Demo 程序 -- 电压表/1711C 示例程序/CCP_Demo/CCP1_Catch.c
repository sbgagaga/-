
//CCP1捕捉模式参考程序
#include <SC.h>

volatile unsigned int ccpdata @0x15;	//CCPR1L/CCPR1H地址为0x15/0x16
volatile unsigned int data;

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	CCP1IF = 0;					//清除CCP1中断标志
	CCP1IE = 1;					//使能CCP1中断
	
	TMR1L = 0;					//复位Timer1的值(捕捉模式使用Timer1)
	TMR1H = 0;
	T1CON = 0B00000001;			//开启定时器,1:1预分频
	
	
	TRISC2 = 1;					//CCP1口为输入口
	CCP1CON = 0B00000110;		//CCP1工作在捕捉模式,每4个上升沿发生捕捉
	
	INTCON = 0B11000000;		//开启总中断

	while(1)
	{
		asm("clrwdt");
	}
}

void interrupt ccp1_isr()
{
	if(CCP1IF)
	{
		CCP1IF=0;
		data = ccpdata;			//发生捕捉时读出CCPR1L/CCPR1H的值到data
	}
}