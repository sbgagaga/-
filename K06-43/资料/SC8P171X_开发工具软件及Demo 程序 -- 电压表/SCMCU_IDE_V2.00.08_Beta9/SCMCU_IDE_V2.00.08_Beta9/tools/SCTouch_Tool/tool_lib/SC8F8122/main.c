
#include "CheckTouchKey.h"		//此包含放在最前面
		
//---------------------------------------------------
#include <sc.h>

volatile unsigned int MainTime;

/***********************************************************************
函数功能：延时子函数，13个指令周期1循环
***********************************************************************/
static void Delay(unsigned int dtemp) 
{
	while(dtemp--);
}
/***********************************************************************
子函数功能：延时templ  ms，有中断则不准
***********************************************************************/
static void Delay_nms (unsigned int inittempl)
{
	unsigned int	i;
	/******************************************************************/
	for(i=0;i<inittempl;i++)
	{
		Delay(154);
		CLRWDT();
	}
}

/**********************************************************
初始化程序
**********************************************************/
void System_Init()
{
	CLRWDT();					//清看门狗
	OSCCON = 0X70;				//配置振荡为8M
	OPTION_REG = 0B00001111;	//INT下降沿  预分频WDT 4*18=72ms  溢出(3V下约为144)
	CLRWDT();					//清看门狗
	
	TRISB = 0B11111111;			//触摸口
	
	PORTB = 0;
	
	WPUB = 0;
			 	
	PIE1 = 0;

	INTCON = 0xD0;				//使能中断，允许int中断	
}

/**********************************************************
函数名称：Refurbish_Sfr
函数功能：刷新一些特殊功能寄存器
入口参数：无
出口参数：无 
备    注：每隔一定时间刷新一次SFR可增强抗干扰能力
**********************************************************/
void Refurbish_Sfr()
{
	CLRWDT();					//清看门狗
	OSCCON = 0X70;				//配置振荡为8M
	OPTION_REG = 0B00001111;	//INT下降沿  预分频WDT 4*18=72ms
	CLRWDT();					//清看门狗
	
	TRISB = 0B11111111;			//触摸口
	
	PORTB = 0;
	
	WPUB = 0;
		 	
	PIE1 = 0;

	INTCON = 0xD0;				//使能中断，允许int中断
	
	T2CON =4;	
	PR2 =250;	
}

/***********************************************************
中断服务函数
***********************************************************/
void interrupt Isr_Timer()
{
	if(TMR2IE==1&&TMR2IF==1)				//若只使能了一个中断源,可以略去判断
	{
		TMR2IF = 0;
		MainTime++;
	}

	else
	{
		INTCON &= 0xD2;	
		PIR1 = 0;
		
	}
}
/***********************************************************
主函数
***********************************************************/
void main()
{
	Delay_nms(100);			//延时等待电源电压稳定
	System_Init();			//系统初始化
		
	while(1)
	{
		
		Refurbish_Sfr();	//唤醒后刷新专用寄存器
		CheckTouchKey();	//触摸检测	
		
	}
}

