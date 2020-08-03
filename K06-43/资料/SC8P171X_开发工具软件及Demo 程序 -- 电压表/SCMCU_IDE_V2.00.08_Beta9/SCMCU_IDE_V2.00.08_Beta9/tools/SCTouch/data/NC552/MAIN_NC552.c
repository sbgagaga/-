#include <sc.h>
#include "Touch_Kscan_Library.h"




volatile unsigned char MainTime;
volatile bit	B_MainLoop,B_OnOff;

//ϵͳ��ʼ��
void Init_System()
{
	asm("nop");
	asm("clrwdt");
	INTCON = 0;				//��ֹ�ж�
	OSCCON = 0X70;			//������Ϊ8M
	OPTION_REG = 0;
	
	
	//��ʱ�ȴ���Դ��ѹ�ȶ�
	//DelayXms(200);
	TRISA = 0;
	PORTA = 0;
	TRISB = 0;
	PORTB = 0;

	PIE1 = 2;
	PR2 = 250;				//8M�½�TMR2����Ϊ125us�ж�
	T2CON = 4;				//ʹ�ܶ�ʱ��2��Ԥ��Ƶ1:1
	
	INTCON = 0XC0;			//ʹ�����жϣ������ж�
}


/**********************************************************
�������ƣ�Refurbish_Sfr
�������ܣ�ˢ��һЩ���⹦�ܼĴ���
��ڲ�������
���ڲ������� 
��    ע��ÿ��һ��ʱ��ˢ��һ��SFR����ǿ����������
**********************************************************/
void Refurbish_Sfr()
{	
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
	static unsigned char KeyOldFlag = 0;
	if(KeyFlag[0])
	{
		if(KeyFlag[0] != KeyOldFlag)
		{
			//ȷ��״̬�ı�İ���
			KeyOldFlag ^= KeyFlag[0];
			if((KeyOldFlag&0x1) && (KeyFlag[0]&0x1))
			{
				//KEY1������
				PORTB ^=0X02;
				B_OnOff = !B_OnOff;
			}
			if((KeyOldFlag&0x2) && (KeyFlag[0]&0x2))
			{
				//KEY2������
				PORTB ^=0X02;
				B_OnOff = 1;
			}
			if((KeyOldFlag&0x4) && (KeyFlag[0]&0x4))
			{
				//KEY3������
				PORTB ^=0X02;
				B_OnOff = 1;
			}
			if((KeyOldFlag&0x8) && (KeyFlag[0]&0x8))
			{
				//KEY4������
				B_OnOff = 1;
			}
			KeyOldFlag = KeyFlag[0];
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
		if(++MainTime >= 32)	//��Ϊ4MSɨ��һ�ΰ���
		{
			MainTime = 0;
			B_MainLoop = 1;
		}
	}
	else
	{
		PIR1 = 0;
		INTCON &= 0XF8;
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