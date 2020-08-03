#include "source_h\common.h"

void Init_System()
{
	asm("nop");
	asm("clrwdt");

	Btn_Init();
	GPIO_Init();
	WDT_ON();
	TRISB =0X00;
	TRISC =0X00;

	OSCCON=0X61;		//��������Ϊ4M,�ڲ�
	INTCON=0B11000000;	//ʹ��ȫ���жϣ������ж�
	PIE1=0B00000010;	//TIMER2ƥ���ж�
	T2CON=0B00000100;	//ʹ��TIMER2
	PR2	= 200;			//TIMERʱ��ΪFosc/4; 200us��һ���ж�
}

/***********************************************************
�жϷ�����
�������ƣ�Isr_Timer()
�������ܣ��жϴ�������
��ڲ�����
���ڲ�����
��    ע��200US��ʱ2�ж�
***********************************************************/
void interrupt Isr_Timer()
{
	if(TMR2IF&&TMR2ON)			//��ֻʹ����һ���ж�Դ,������ȥ�ж�
	{
		TMR2IF = 0;
		
		if(Flag_beep){ 
			if(Pin_BEEP) Pin_BEEP=L; else Pin_BEEP=H; 
		}
		else Pin_BEEP=L;
		
		Rt2ms_cnt++;
		if(Rt2ms_cnt>=10)
		{
			Rt2ms_cnt=0;
			LedScan();
		}
		Rt10ms_cnt++;
		if(Rt10ms_cnt>=50)
		{
			Rt10ms_cnt=0;
			Flag_mainloop=1;
			Flag_RtSleep=1;
		}
	}
}

/***********************************************************
�жϷ�����
�������ƣ�main()
�������ܣ�������
��ڲ�����
���ڲ�����
��    ע��
***********************************************************/
void main(void)
{
	Init_System();  //���ö˿�
	Flag_boot 		=1;
	timer_boot_cnt	=0;
	while(1)
	{
		if(Flag_mainloop&&Flag_boot)//�ϵ��ʼ����
		{
			Flag_mainloop = 0;	
			
			asm("clrwdt");
			LED_RAM[0]=0XFF;
			LED_RAM[1]=0XFF;
			LED_RAM[2]=0XFF;
			LED_RAM[3]=0XFF;
			AdProc();
			BeepAlarmUpdate(1,50);
			BeepProc();
			timer_boot_cnt++; if(timer_boot_cnt>100) Flag_boot=0; 
			
			if(bat_val<BAT_3V2) bat_percent=0; 
			else if(bat_val>BAT_4V2) bat_percent=99; 
			else bat_percent=bat_val-BAT_3V2; 
			//if(bat_percent>75) bat_percent=99; 
			//actual_percent=bat_percent;
		}
		if(Flag_mainloop&&(!Flag_boot))//��������
		{
			Flag_mainloop = 0;		

			asm("clrwdt");
			BtnScan();
			AppMotor();
			AppChr();
			if(!Flag_usb) LockSet(); 
			BeepProc();
			timer_1s++; if(timer_1s>100) { timer_1s=0; TimeAddDec(bat_val); } 
			LedRamUpdate();
			AdProc();
			SysSleep();
		}
	}
}