
//CCP1��׽ģʽ�ο�����
#include <SC.h>

volatile unsigned int ccpdata @0x15;	//CCPR1L/CCPR1H��ַΪ0x15/0x16
volatile unsigned int data;

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	CCP1IF = 0;					//���CCP1�жϱ�־
	CCP1IE = 1;					//ʹ��CCP1�ж�
	
	TMR1L = 0;					//��λTimer1��ֵ(��׽ģʽʹ��Timer1)
	TMR1H = 0;
	T1CON = 0B00000001;			//������ʱ��,1:1Ԥ��Ƶ
	
	
	TRISC2 = 1;					//CCP1��Ϊ�����
	CCP1CON = 0B00000110;		//CCP1�����ڲ�׽ģʽ,ÿ4�������ط�����׽
	
	INTCON = 0B11000000;		//�������ж�

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
		data = ccpdata;			//������׽ʱ����CCPR1L/CCPR1H��ֵ��data
	}
}