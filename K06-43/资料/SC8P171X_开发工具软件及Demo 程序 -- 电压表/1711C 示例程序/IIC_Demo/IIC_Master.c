
/******************** (C) COPYRIGHT 2016 CMS LTD **************************
* Ӳ��IIC�����շ��ο����� write by liaol,cms
* �� �� ����IIC_Master.c
* ���ڰ汾��2016/6/23 @V1.0
* ��    ����www.mcu.com.cn
* ��	ע��������ʹ��CMS89F526��֤ͨ��
**************************************************************************/

#include <cms.h>
#define 	I2C_SCL_IO	TRISA6
#define 	I2C_SDA_IO	TRISA5

#define		TRUE		1
#define		FALSE		0

bit B_MainLoop;

volatile unsigned char Recebuffer[5];		//�������ݻ���
volatile unsigned char Sendbuffer[5];		//�������ݻ���


unsigned char I2C_Read1Byte(unsigned char ack);
void I2C_Write1Byte(unsigned char data);
void I2C_WriteStop();
void I2C_WriteStart();
void I2C_CheckWorkStatus();
unsigned char I2C_WaitStatus();

void main()
{
	NOP();
	CLRWDT();
	OSCCON = 0x71;
	
	INTCON = 0;
	TRISB = 0;
	PORTB = 0;
	
	PIR1 = 0;
	PIR2 = 0;
	PIE1 = 0;
	PIE2 = 0;
	
	/*��ʼ����ʱ��2, 125us�ж�*/
	PR2 = 250;
	T2CON = 4;
	TMR2IE = 1;

	INTCON = 0XC0;		//ȫ���ж�ʹ��

	unsigned char time1s;
	while(1)
	{
		if(B_MainLoop)
		{
			B_MainLoop = 0;
			CLRWDT();
			
			PORTB = Recebuffer[0];
			if(++time1s >= 200)
			{
				time1s = 0;
				Sendbuffer[0]++;
				
				/*ȷ��IIC��������*/
				I2C_CheckWorkStatus();
				
				/*д4���ֽ�*/
				I2C_WriteStart();
				I2C_Write1Byte(0xA0);
				I2C_Write1Byte(0x4);
				I2C_Write1Byte(Sendbuffer[0]);
				I2C_Write1Byte(~Sendbuffer[0]);
				I2C_Write1Byte(0x3);
				I2C_WriteStop();

				/*��4���ֽ�*/
				I2C_WriteStart();
				I2C_Write1Byte(0xA1);
				Recebuffer[0] = I2C_Read1Byte(0);
				Recebuffer[1] = I2C_Read1Byte(0);
				Recebuffer[2] = I2C_Read1Byte(0);
				Recebuffer[3] = I2C_Read1Byte(1);
				I2C_WriteStop();
			}
		}
	}
}

//125us��ʱ�ж�
void interrupt Timer_Isr()
{
	static unsigned char tcount = 0;
	if(TMR2IF)
	{
		TMR2IF = 0;

		if(++tcount >= 40)
		{
			tcount = 0;
			B_MainLoop = 1;
		}
	}
	else
	{
		PIR1 = 0;
		PIR2 = 0;
	}
}


//Ӳ������IIC�����ź�
void I2C_WriteStart()
{
	SEN = 1;				//����IIC�����ź�
	I2C_WaitStatus();		//�ȴ������źŲ������
}

//Ӳ������IICֹͣ�ź�
void I2C_WriteStop()
{
	PEN = 1;				//����IICֹͣ�ź�
	I2C_WaitStatus();		//�ȴ�ֹͣ�źŲ������
}

//��ӻ�д1�ֽ�����
void I2C_Write1Byte(unsigned char data)
{
	SSPBUF = data;			//����������ַ��д�ź�
	I2C_WaitStatus();		//�ȴ����ݷ������
}

//��ȡ���Դӻ���1�ֽ�����
unsigned char I2C_Read1Byte(unsigned char ack)
{
//	unsigned char data;
	RCEN = 1;				//���ö�����
	I2C_WaitStatus();		//�ȴ��������
//	data = SSPBUF;			//��������
	
	ACKDT = ack;			//ȷ������λ,����Ҫ���������
	ACKEN = 1;				//����Ӧ���ź�
	I2C_WaitStatus();		//�ȴ�ACK�������
	return SSPBUF;//data;
}

//�ȴ�״̬���
unsigned char I2C_WaitStatus()
{
	unsigned char t = 0;
	while(0 == SSPIF)		//ֱ�����Ϊֹ
	{
		if(0 == (--t))
		{
			SSPCON = 0;		//��ʱ��ֹIICͨ��
			return FALSE;
		}
	}
	SSPIF = 0;				//��SSPIF��־λ
	return TRUE;
}

//���IIC����״̬
void I2C_CheckWorkStatus()
{
	if(0x28 != SSPCON)
	{
		I2C_SDA_IO = 1;		//SDA����Ϊ�����,����������ݻ����
	//	I2C_SCL_IO = 1;
		SSPADD = 0x40;		//ʱ��=Fosc/(4*(SSPADD+1))
		SSPSTAT = 0x80;		//��׼100KHz
		SSPCON = 0x28;		//����ģʽ
		SSPCON2 = 0;
	}
}