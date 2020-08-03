#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB = 0;					//PORTB���������
		
	TMR1L = 0;					//�趨Timer��ʼֵ
	TMR1H = 0xFE;
	TMR1IF = 0;
	TMR1IE = 1;					//ʹ��Timer1����ж�
	
	T1CON = 0B00100001;			//����Timer1��Ԥ��ƵΪ1:4
	
	INTCON = 0XC0;				//�������ж�
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