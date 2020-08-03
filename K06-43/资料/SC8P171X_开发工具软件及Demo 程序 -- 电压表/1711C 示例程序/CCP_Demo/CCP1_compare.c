
//CCP1�Ƚ�ģʽ�ο�����
#include <SC.h>

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	TRISB=0;
	
	CCP1CON=0B00001011;			//CCP1����Ϊ�Ƚ�ģʽ
	
	INTCON=0B11000000;			//ʹ�����ж�
	
	CCP1IE = 1;					//ʹ��CCP1�ж�
	CCPR1H=0X00;
	CCPR1L=0X80;				//���ñȽ�ƥ��ֵ
	
	T1CON=0B00010001;			//����Timer1��Ƶ�ȣ�����Timer1
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
		PORTB^=0XFF;			//ƥ��ʱ��תIO��
	}
}
