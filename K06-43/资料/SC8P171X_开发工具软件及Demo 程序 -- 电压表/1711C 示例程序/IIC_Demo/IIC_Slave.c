
/******************** (C) COPYRIGHT 2016 CMS LTD **************************
* Ӳ��IIC�Ӷ��շ��ο����� write by liaol,cms
* �� �� ����IIC_Slave.c
* ���ڰ汾��2016/6/23 @V1.0
* ��    ����www.mcu.com.cn	
* ��	ע��������ʹ��CMS89F526��֤ͨ��
**************************************************************************/
#include <cms.h>

#define		RECE_BUFFER_LENGTH		5		//������ջ�������С(byte)
#define		SEND_BUFFER_LENGTH		5		//���巢�ͻ�������С(byte)

unsigned char Recebuffer[RECE_BUFFER_LENGTH];
unsigned char Sendbuffer[SEND_BUFFER_LENGTH];

bit B_MainLoop;

//�жϷ�����
void interrupt ISR(void)
{
	static unsigned char rececount=0,sendcount=0;
	if(SSPIF)					//IIC�ж�
	{
		SSPIF = 0;
		if(RW)					//1-����0-д
		{
			//��������
			SSPBUF = Sendbuffer[sendcount];
			if(++sendcount >= SEND_BUFFER_LENGTH)
			{
				sendcount = 0;
			}
			asm("nop");			//���������ʱ,���������������ݿ��ܳ���
			CKP = 1;			//����׼�����,�ͷ�ʱ��
		}
		else
		{
			//��������
			if(DA)				//DAΪ1-�յ��������ݣ�DAΪ0-�յ����ǵ�ַ
			{
				Recebuffer[rececount] = SSPBUF;
				if(++rececount >= RECE_BUFFER_LENGTH)
				{
					rececount = 0;
				}
			}
			else
			{
				SSPBUF;			//�������SSPBUF
				rececount = 0;
				sendcount = 0;
			}
			SSPOV = 0;
		}
	}
	
	static unsigned char tcount = 0;
	if(TMR2IF)					//Timer2�ж�
	{
		TMR2IF = 0;
		if(++tcount >= 40)		//5ms
		{
			tcount = 0;
			B_MainLoop = 1;
		}
	}
}


void main()
{
	NOP();
	CLRWDT();
	OSCCON = 0x71;
	
	TRISB = 0;
	PORTB = 0;
	
	/*��ʼ��IICģ��*/
	TRISA5 = 1;			//SDA��SCKΪ�����
	TRISA6 = 1;
	SSPSTAT = 0X80;		//���״̬λ����׼100KHz
	SSPCON = 0X36;		//�Ӷ�ģʽ��7λ��ַ��ʹ�ܶ˿ڼ�ʱ��
	SSPCON2 = 0X0;
	SSPADD = 0XA0;		//�豸�ӵ�ַ
	SSPIE = 1;
	
	/*��ʼ����ʱ��2, 125us�ж�*/
	PR2 = 250;
	T2CON = 4;
	TMR2IE = 1;
	
	INTCON = 0xc0;		//ȫ���ж�ʹ��
	
	unsigned char time1s;
	
	while(1)
	{
		
		//У����յ�������
		if(4 == Recebuffer[0] && 3 == Recebuffer[3] && Recebuffer[1] == (unsigned char)~Recebuffer[2])
		{
			PORTB = Recebuffer[1];
		}
		
		if(B_MainLoop)
		{
			CLRWDT();
			B_MainLoop = 0;
			if(++time1s >= 200)
			{
				time1s = 0;
				Sendbuffer[0]++;
			}
		}
	}
}