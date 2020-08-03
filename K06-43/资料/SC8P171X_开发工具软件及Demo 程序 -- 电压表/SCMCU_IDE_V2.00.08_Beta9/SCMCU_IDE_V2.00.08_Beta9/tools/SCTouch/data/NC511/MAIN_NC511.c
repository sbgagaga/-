#include <sc.h>
#include "Touch_Kscan_Library.h"

volatile unsigned char MainTime;
volatile bit	B_MainLoop;

//ע�����
//1��SC8P8022 �� PIN2 ���� RE0��RB7 �Ϸ���һ���ڴ�������Ӧ�ù����� TRISB,7 ��������Ϊ1����RB7Ϊ����״̬��
//2��SC8P8022 �� PIN7 ���� RA1��RA2��RC2 �Ϸ���һ��Ӧ�ù����н�δʹ�õ�2���ܽŹ̶�����Ϊ����״̬��

//ϵͳ��ʼ��
void Init_System()
{
	asm("nop");
	asm("clrwdt");
	INTCON = 0;				//��ֹ�ж�
	OSCCON = 0X71;			//������Ϊ8M
	OPTION_REG = 0;
	
	//��ʱ�ȴ���Դ��ѹ�ȶ�
	//DelayXms(200);
	
	
	//PIE2 = 0;
	PIE1 = 2;
	PR2 = 250;				//8M�½�TMR2����Ϊ125us�ж�
	T2CON = 4;				//ʹ�ܶ�ʱ��2
	
	INTCON = 0XC0;			//ʹ���ж�
}


/**********************************************************
ˢ�����⹦�ܼĴ���
**********************************************************/
void Refurbish_Sfr()
{
/*	//��Ϊ���ֿ�
	ANSEL = 0;
	ANSELH = 0;
	
	TRISA = 0;
	TRISB = 0;
	TRISC = 0;
	TRISE = 9;
	
	LEDCON0 = 0;
	LEDCON1 = 0;
	SEGEN0 = 0;
	SEGEN1 = 0;
	SEGEN2 = 0;
	COMEN = 0;
	
	SSPCON = 0;
//	SSPCON2 = 0;
	CCP1CON = 0;
	CCP2CON = 0;
//	RCSTA = 0;
//	RCREG = 0;
//	TXSTA = 0;
	IOCB = 0;
	PSTRCON = 0;
	CM1CON0 = 0;
	CM2CON0 = 0;
	CM2CON1 = 0;
	SRCON = 0;
//	BAUDCTL = 0;
//	PWMCON0 = 0;
//	PWMCON1 = 0;
	T1CON = 0;
	EECON1 = 0;
	PIE2 = 0;
*/	
	OPTION_REG = 0;
	
	
	//ˢ���ж���ؿ��ƼĴ���
	PIE1 = 2;
	PR2 = 250;
	INTCON = 0XC0;
	if(4 != T2CON)
		T2CON = 4;
}


/***********************************************************
��������
***********************************************************/
void KeyServer()
{
	static unsigned int KeyOldFlag = 0;
	unsigned int i = (unsigned int)((KeyFlag[1]<<8) | KeyFlag[0]);
	if(i)
	{
		if(i != KeyOldFlag)
		{
			KeyOldFlag = i;
			switch(i)
			{
				case 1:
				case 2:
				case 4:
				case 8:
				default:break;
			}
		}
	}
	else
	{
		KeyOldFlag = 0;
	}
}

/***********************************************************
�жϷ�����
***********************************************************/
void interrupt Isr_Timer()
{
	if(TMR2IF)				//��ֻʹ����һ���ж�Դ,������ȥ�ж�
	{
		TMR2IF = 0;
		if(++MainTime >= 32)
		{
			MainTime = 0;
			B_MainLoop = 1;
		}
	}
	else
	{
		PIR1 = 0;
	//	PIR2 = 0;
	}
}

/***********************************************************
��ѭ��
***********************************************************/
void main()
{
	Init_System();
	while(1)
	{
		if(B_MainLoop)
		{
			B_MainLoop = 0;
			CLRWDT();
			
			CheckTouchKey();
			
			Refurbish_Sfr();
			KeyServer();
		}
	}
}