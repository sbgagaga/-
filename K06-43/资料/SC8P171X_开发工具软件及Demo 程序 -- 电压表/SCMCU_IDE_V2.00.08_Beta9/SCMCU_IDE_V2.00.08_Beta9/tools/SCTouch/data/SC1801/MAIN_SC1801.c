#include <sc.h>
#include "Touch_Kscan_Library.h"




volatile unsigned char MainTime;
volatile unsigned int PwmData;
volatile bit	B_MainLoop,B_OnOff;

//ϵͳ��ʼ��
void Init_System()
{
	asm("nop");
	asm("clrwdt");
	OPTION_REG |= 0x07;
			
	OPTION_REG |= 0x08;
	asm("clrwdt");
			
	OPTION_REG = C_OPTION_REG_;		//Ԥ��Ƶ�����Ź���18ms*2*3=108ms
	asm("clrwdt");
	
	INTCON = 0;				//��ֹ�ж�
	OSCCON = 0X70;			//������Ϊ8M
	
	PORTA = 0;
	TRISA = 0;
	PORTA = 0X00;	
	WPUA = 0X00;
	
	PORTB = 0;
	TRISB = 0;
	PORTB = 0X00;	
	WPUB = 0X00;		//
						//
						
	PORTC = 0;
	TRISC = 0;
	PORTC = 0X00;	
	WPUC = 0X00;
	
	WPDA = 0;
	WPDB = 0;
	WPDC = 0;
	//��ʱ�ȴ���Դ��ѹ�ȶ�
	//DelayXms(200);
	
	TMR0 = 6;				//Ԥ��Ƶ��WDT����ʱTMR0�ķ�Ƶ��Ϊ1:1��8M�½�TMR0����Ϊ125us�жϣ�
	INTCON = 0XC0;			//ʹ�����жϣ������ж�
	
	T2CON = 0B00000000; 	// 1��Ƶ
	PR2 = 250;				//��ʱ125uS
	TMR2 = 0;
	TMR2ON =1;
	TMR2IE =1;				// T2 �ж�ʹ��
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
	INTCON = 0XC0;
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
				B_OnOff = !B_OnOff;
				PORTB ^= 0X10;
			}
			if((KeyOldFlag&0x2) && (KeyFlag[0]&0x2))
			{
				//KEY2������
				PORTB ^= 0X08;
				B_OnOff = 1;
			}
			if((KeyOldFlag&0x4) && (KeyFlag[0]&0x4))
			{
				//KEY3������
				PORTB ^= 0X04;
				B_OnOff = 1;
				
			}
			if((KeyOldFlag&0x8) && (KeyFlag[0]&0x8))
			{
				//KEY4������
				PORTB ^= 0X20;
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
		if(++MainTime >= 32)		//4ms��һ����ѭ��
		{
			MainTime = 0;
			B_MainLoop = 1;
		}
	}
	else
	{
		INTCON = 0XC0;
		PIR1 = 0;
	}
	
}

/***********************************************************
���ߺ���
***********************************************************/
void WorkSleep()
{
#if (0 != C_KEY_WAKEUP)
	static unsigned char time;
	
	if(B_OnOff)	
		time = 0;
	
	if(++time >= 250)
	{
		time = 0;
		INTCON = 0;			//;�ض�ADCģ�鼰�ж�ʹ�ܣ�
		PIE1 = 0;
		PIE2 = 0;
		PIR1 = 0;
		PIR2 = 0;
		T2CON = 0;
		PWMCON0 = 0;
	//	KEYCON0 = 0;
		//��������ǰ,����̶����ߵ�ƽ,���ȫ������͵�ƽ,���ر�������������
		TRISA = 0;
		PORTA = 0;
		TRISB = 0;
		PORTB = 0;
		TRISC = 0;
		PORTC = 0;
		WPUA = 0;
		WPUB = 0;

/****����ҪPB���жϻ��ѣ�ʹ�����г��򲢰����޸�****/
			//RBPU = 0;//ʹ��PB����
			//TRISB1 =1;//����
			//WPUB1 = 1;//����			
			//RBIF = 0;//���־
			//IOCB1 = 1;//����PB1��ƽ�仯�ж�
			//PORTB;//��һ��PB��			
/************************************/	

		//��������ģʽ,���������ѵİ�����ָ���������
		SystemEnterSleep();
		if(RBIF) RBIF = 0;
		//���߱�����,���������жϵ�SFR,ʹϵͳ������������
		Refurbish_Sfr();
	}
#endif
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
							
			Refurbish_Sfr();
			
			CheckTouchKey();
			KeyServer();
			WorkSleep();
		}
	}
}