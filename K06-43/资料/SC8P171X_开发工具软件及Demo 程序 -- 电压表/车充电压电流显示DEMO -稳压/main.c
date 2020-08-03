#include "main.h"


void Init_System()
{
	asm("nop");
	asm("clrwdt");
	INTCON = 0;				//禁止中断
	OSCCON  = 0X71;			//配置振荡为8M
	OPTION_REG = 0;          

	PIE1 = 0;     
	TMR0=131;    //定时配置
	
	INTCON=0XA0;   //中断控制位配置
  	
	ANSEL=0x02;
	ANSELH=0x01;
	
	PORTA=0;
	PORTB=0;
	PORTC=0;
	PORTE=0;
	
	TRISA=0XFF;
	TRISB=0XFF;
	TRISC=0XFF;
	TRISE=0XFF;

	PORTA=0;
	PORTB=0;
	PORTC=0;
	PORTE=0;
			
	WPUA = 0X00;
	WPUB = 0X00;
	WPUC = 0X00;   //端口配置
	
}


void interrupt Isr_Timer()
{
	if(T0IF)
	{
		TMR0 += 131;
		T0IF=0;
		Tcount++;   //125us
		display();
		Ad_test();
	}
}

void main()
{
	Init_System();
	
	Dis_updata_count=484; //上电AD算完后立即显示	
	while(1)
	{
		if(Tcount>=32)
		{
			Tcount=0;
			asm("clrwdt");
			Ad_deal();
			Flash_dis();
		}
		
	}
	
	
}




