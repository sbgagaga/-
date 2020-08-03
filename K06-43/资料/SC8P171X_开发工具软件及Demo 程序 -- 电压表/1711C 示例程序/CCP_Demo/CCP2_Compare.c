
//CCP1�Ƚ�ģʽ�ο�����
#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB=0;
	
	CCP2CON=0B00001011;			//CCP2����Ϊ�Ƚ�ģʽ
	
	INTCON=0B11000000;			//ʹ�����ж�
	
	CCP2IE = 1;					//ʹ��CCP2�ж�
	CCPR2H=0X00;
	CCPR2L=0X80;				//���ñȽ�ƥ��ֵ
	
	T1CON=0B00010001;			//����Timer1��Ƶ�ȣ�����Timer1
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
		PORTB^=0XFF;			//ƥ��ʱ��תIO��
	}
}
