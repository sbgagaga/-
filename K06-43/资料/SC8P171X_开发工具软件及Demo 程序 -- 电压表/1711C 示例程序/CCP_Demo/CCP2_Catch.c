
//CCP2��׽ģʽ�ο�����
#include <SC.h>

volatile unsigned int ccpdata @0x1B;	//CCPR2L/CCPR2H��ַΪ0x1B/0x1C
volatile unsigned int data;

void main(void)
{
	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
	CCP2IF = 0;					//���CCP2�жϱ�־
	CCP2IE = 1;					//ʹ��CCP2�ж�
	
	TMR1L = 0;					//��λTimer1��ֵ(��׽ģʽʹ��Timer1)
	TMR1H = 0;
	T1CON = 0B00000001;			//������ʱ��,1:1Ԥ��Ƶ
	
	TRISC1 = 1;					//CCP2��Ϊ�����
	CCP2CON = 0B00000110;		//CCP2�����ڲ�׽ģʽ,ÿ4�������ط�����׽
	
	INTCON = 0B11000000;		//�������ж�
	
	while(1)
	{
		asm("clrwdt");
	}
}

void interrupt ccp1_isr()
{
	if(CCP2IF)
	{
		CCP2IF=0;
		data = ccpdata;			//������׽ʱ����CCPR2L/CCPR2H��ֵ��data
	}
}