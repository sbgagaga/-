#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB = 0;					//PORTB���������
		
	PR2 = 250;					//�趨Timer��ʼֵ
	TMR2IF = 0;
	TMR2IE = 1;					//ʹ��Timer2����ж�
	
	T2CON = 0B00000100;			//����Timer2
	
	INTCON = 0XC0;				//�������ж�
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