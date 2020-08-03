
/******************** (C) COPYRIGHT 2016 CMS LTD **************************
* ģ��IIC�����շ��ο����� write by liaol,cms
* �� �� ����IIC_Soft_Master.c
* ���ڰ汾��2016/6/23 @V1.0
* ��    ����www.mcu.com.cn	
* ��	ע��������ʹ��CMS89F526��֤ͨ��
**************************************************************************/

#include <sc.h>

bit B_MainLoop;

volatile unsigned char Recebuffer[5];
volatile unsigned char Sendbuffer[5];

#define I2C_SCL	RC0
#define I2C_SDA	RC1
#define I2C_SCL_IO	TRISC0
#define I2C_SDA_IO	TRISC1


unsigned char I2C_Read1Byte(unsigned char ack);
unsigned char I2C_Write1Byte(unsigned char data);
void I2C_WaitMoment();
void I2C_WriteStop();
void I2C_WriteStart();


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
	
	INTCON = 0XC0;
	
	unsigned char time1s;
	
	while(1)
	{
		if(B_MainLoop)
		{
			B_MainLoop = 0;
			CLRWDT();
			
			if(++time1s >= 200)
			{
				time1s = 0;
				Sendbuffer[0]++;
				
				/*д4���ֽ�*/
				I2C_WriteStart();
				I2C_Write1Byte(0xa0);
				I2C_Write1Byte(0x4);
				I2C_Write1Byte(Sendbuffer[0]);
				I2C_Write1Byte(~Sendbuffer[0]);
				I2C_Write1Byte(0x3);
				I2C_WriteStop();
				
				/*��4���ֽ�*/
				I2C_WriteStart();
				I2C_Write1Byte(0xa1);
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
void interrupt ISR()
{
	static unsigned char tcount;
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

/***********************************************************
�������ܣ�����IIC�����ź�
��ڲ�����no
�������أ�no
��    ע����SCLΪ�ߵ�ƽʱ��SDA���Ϸ����Ӹߵ��͵ĵ�ƽ�仯
***********************************************************/
void I2C_WriteStart()
{
	I2C_SDA_IO = 0;
	I2C_SCL_IO = 0;
	I2C_WaitMoment();
	
	I2C_SDA = 1;			//�Ƚ�SDA=1����׼����SCL=1ʱ����SDA=0
	I2C_SCL = 1;			//ʱ����������
	I2C_WaitMoment();
	I2C_SDA = 0;			//SCL=1ʱ����SDA���ͼ����������ź�
	
	I2C_WaitMoment();
	I2C_SCL = 0;			//��SCL=0����������źŲ���
	I2C_WaitMoment();
}

/***********************************************************
�������ܣ�����IIC�����ź�
��ڲ�����no
�������أ�no
��    ע����SCLΪ�ߵ�ƽʱ��SDA���Ϸ����ӵ͵��ߵĵ�ƽ�仯
***********************************************************/
void I2C_WriteStop()
{
	I2C_SDA_IO = 0;
	I2C_SCL_IO = 0;
	I2C_WaitMoment();
	
	I2C_SDA = 0;			//�Ƚ�SDA=0����׼����SCL=1ʱ����SDA=1
	I2C_SCL = 1;			//ʱ����������
	I2C_WaitMoment();
	I2C_SDA = 1;			//SCL=1ʱ����SDA���߼�����ֹͣ�ź�
	
	I2C_WaitMoment();
	I2C_SCL = 0;			//��SCL=0����������źŲ���
	I2C_WaitMoment();
}

/***********************************************************
�������ܣ�ģ��IIC��������8λ����
��ڲ�����data-����������
�������أ�����ackӦ���ź�
��    ע��IICЭ��ackӦ���ź�Ϊ����Ч
***********************************************************/
unsigned char I2C_Write1Byte(unsigned char data)
{
	unsigned char i = 8;
	I2C_SDA_IO = 0;
	I2C_SCL_IO = 0;
	do
	{
		I2C_SCL = 0;
		if(data&0x80)
			I2C_SDA = 1;
		else
			I2C_SDA = 0;
		
		I2C_SCL = 1;		//ʱ������һ�������أ���һλ����д��
		data <<= 1;
	}
	while(--i);
	I2C_SCL = 0;
	
	I2C_SDA_IO = 1;			//��Ϊ����ڽ���Ӧ���ź�

	I2C_WaitMoment();
	I2C_SCL = 1;			//����������׼����Ӧ���ź�
	I2C_WaitMoment();
	
	i = I2C_SDA;
	I2C_SCL = 0;
	I2C_SDA_IO = 0;
	return i;
}

/***********************************************************
�������ܣ�ģ��IIC��������8λ����
��ڲ�����ack-Ӧ���ź�
�������أ����յ�������
��    ע��IICЭ��ackӦ���ź�Ϊ����Ч
***********************************************************/
unsigned char I2C_Read1Byte(unsigned char ack)
{
	unsigned char i,data;
	I2C_SDA_IO = 1;
	I2C_SCL_IO = 1;
	I2C_WaitMoment();
	
	while(!I2C_SCL);				//�ȴ��ӻ�׼���������ͷ�ʱ��
	I2C_SCL_IO = 0;
	I2C_SCL = 0;
	I2C_WaitMoment();
	
	data <<= 1;
	if(I2C_SDA) data |= 0x1;
	
	
	for(i = 0; i < 7; i++)
	{
		I2C_SCL = 1;
		data <<= 1;
		if(I2C_SDA) data |= 0x1;
		I2C_SCL = 0;
	}
	
	I2C_SDA_IO = 0;
	
	if(ack)I2C_SDA = 1;			//�Ƿ���Ҫ���������
	else I2C_SDA = 0;
	
	I2C_WaitMoment();
	I2C_SCL = 1;
	I2C_WaitMoment();
	I2C_SCL = 0;
	return data;
}

//������ʱ
void I2C_WaitMoment()
{
	asm("nop");
	asm("nop");
}