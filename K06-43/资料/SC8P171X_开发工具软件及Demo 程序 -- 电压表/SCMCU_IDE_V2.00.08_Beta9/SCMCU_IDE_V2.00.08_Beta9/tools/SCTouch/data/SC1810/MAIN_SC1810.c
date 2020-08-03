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
	
	PORTB = 0;
	TRISB = 0;
	PORTB = 0X10;	
	WPUB = 0X10;		//PORTB.4���Ҫ����ߵ�ƽ�������������
						//����͵�ʱ��ǵùر�������������������ߵ���
	WPDB = 0;
	//��ʱ�ȴ���Դ��ѹ�ȶ�
	//DelayXms(200);
	
	TMR0 = 6;				//Ԥ��Ƶ��WDT����ʱTMR0�ķ�Ƶ��Ϊ1:1��8M�½�TMR0����Ϊ125us�жϣ�
	INTCON = 0XA0;			//ʹ���ж�
	
	PwmData = 0xF0;			//ռ�ձȣ�CCPRXL:PWMXB(1,0))/��PR2+1)*4
	PR2 =0XFF;				//pwm����T=��PR2+1)*4*(TMR2Ԥ��Ƶ��/Fosc,�˴�T=128uS;
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
	INTCON = 0XA0;
	TRISB = 0;
	WPUB = 0X10;
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
				PORTB ^= 0X10;
				B_OnOff = 1;
			}
			if((KeyOldFlag&0x4) && (KeyFlag[0]&0x4))
			{
				//KEY3������
				B_OnOff = 1;
				PwmData = PwmData+0X10; 
				PwmData &= 0x03ff;
				unsigned char Temp=0x40;	//��PWM2
	
				if(PwmData&0x01)
				Temp |=0x10;
				if(PwmData&0x02)
				Temp |=0x20;
				CCPCON = Temp;		//ռ�ձȵĵ�2Bit�� <.1.0>
				Temp = (PwmData>>2);	//��8λ
				CCPR2L = Temp;		//
				TMR2IF = 0;              	//����PIR1�Ĵ����е�TMR2IF�жϱ�־λ
				T2CON &= 0X04;             	//��ʱ��TMR2����1:1Ԥ��Ƶ��
				TMR2ON = 1;              	//T2CON�Ĵ����е�TMR2ONλ��1ʹ��Timer2
				TRISB4 = 0;					//����TRISC2λ��ʹ��CCP1�������������
				
			}
			if((KeyOldFlag&0x8) && (KeyFlag[0]&0x8))
			{
				//KEY4������
				PORTB ^= 0X10;
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
	if(T0IF)				//��ֻʹ����һ���ж�Դ,������ȥ�ж�
	{
		TMR0 += 6;
		T0IF = 0;
		if(++MainTime >= 32)		//4ms��һ����ѭ��
		{
			MainTime = 0;
			B_MainLoop = 1;
		}
	}
	else
	{
		INTCON = 0XA0;
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
		PIR1 = 0;
		T2CON = 0;
		CCPCON = 0;
		KEYCON0 = 0;
		//��������ǰ,����̶����ߵ�ƽ,���ȫ������͵�ƽ,���ر�������������
		TRISB = 0;
		PORTB = 0;
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