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

	OSCCON=0X61;		//晶振配置为4M,内部
	INTCON=0B11000000;	//使能全局中断，外设中断
	PIE1=0B00000010;	//TIMER2匹配中断
	T2CON=0B00000100;	//使能TIMER2
	PR2	= 200;			//TIMER时钟为Fosc/4; 200us进一次中断
}

/***********************************************************
中断服务函数
函数名称：Isr_Timer()
函数功能：中断处理函数
入口参数：
出口参数：
备    注：200US定时2中断
***********************************************************/
void interrupt Isr_Timer()
{
	if(TMR2IF&&TMR2ON)			//若只使能了一个中断源,可以略去判断
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
中断服务函数
函数名称：main()
函数功能：主函数
入口参数：
出口参数：
备    注：
***********************************************************/
void main(void)
{
	Init_System();  //配置端口
	Flag_boot 		=1;
	timer_boot_cnt	=0;
	while(1)
	{
		if(Flag_mainloop&&Flag_boot)//上电初始化；
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
		if(Flag_mainloop&&(!Flag_boot))//正常工作
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