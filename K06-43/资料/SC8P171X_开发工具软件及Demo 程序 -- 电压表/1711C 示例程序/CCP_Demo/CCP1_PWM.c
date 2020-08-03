
//CCP1 PWMģʽ�ο�����
#include <SC.h>           		//���õ�Ƭ����ͷ�ļ�

void main(void)            		//������,��Ƭ����������Ǵ����������ʼ����
{
	unsigned int delaycnt = 0;
	unsigned char pwmbuf = 0;

	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
								//�����Ƕ�CCP1��PWM���ܳ�ʼ��
    PR2 = 0xFF;              	//װ��PR2�Ĵ�������PWM���ڣ�Ƶ��Ϊ7812Hz
    CCP1CON = 0x0C;          	//CCP1ģ�鹤����PWMģʽ
    CCPR1L = 0xCD;           	//װ��CCPR1L�Ĵ�������PWMռ�ձȣ�Ϊ80%
    
	TMR2IF = 0;              	//����PIR1�Ĵ����е�TMR2IF�жϱ�־λ
    T2CKPS0 = 0;             	//��ʱ��TMR2����1:1Ԥ��Ƶ�ȣ�T2CKPS0=0
    T2CKPS1 = 0;             	//��ʱ��TMR2����1:1Ԥ��Ƶ�ȣ�T2CKPS1=0
    TMR2ON = 1;              	//T2CON�Ĵ����е�TMR2ONλ��1ʹ��Timer2
    TRISC2 = 0;					//����TRISC2λ��ʹ��CCP1�������������

    while(1)					//��ѭ��,��Ƭ����ʼ����,��һֱ���������ѭ��
    {
		if(++delaycnt > 1000)	//��ʱ1000��������ڣ��Ǿ�ȷ��ʱ
   		{
   			delaycnt = 0;        //�����Ա��´����¼���
   			pwmbuf++;			//ռ�ձȼ�һ
			CCPR1L = pwmbuf;	//д��ռ�ձ�
   		}
    }
}


