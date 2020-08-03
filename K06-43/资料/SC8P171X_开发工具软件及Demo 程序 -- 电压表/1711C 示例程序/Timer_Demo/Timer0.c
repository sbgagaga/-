#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB = 0;					//PORTB���������
	
	OPTION_REG = 0B11010000;	//Timer0ʹ���ڲ�ʱ�ӣ�Ԥ��ƵΪ1:2
	
	TMR0 = 6;					//�趨Timer��ʼֵ
	T0IF = 0;
	T0IE = 1;					//ʹ��Timer0����ж�
	
	GIE = 1;					//�������ж�
	
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