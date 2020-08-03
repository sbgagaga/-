
/***********************************************************
1/2bias LCD驱动程序，适用于CMS89FXXX系列系列芯片(不适用于89F6385/6395/2385/2395)
RC0-RC3作为LCD驱动的COM口，内置上下拉电阻；
RA和RE作为LCD驱动的SEG口，在LCD.H文件里面设置
通过软件控制LCD时序
***********************************************************/
#include <SC.h>
#include "LCD.h"

void SET_DISP(unsigned char*);	//显示设置
void LCD_DISP(void);	//LCD显示

unsigned char tcount;	//计时，TMR2每进1次中断加1

void main(void)
{
	CLRWDT();		// 清看门狗
	OSCCON = 0x71;	// 设置振荡器为内振8M
	PORTA = 0;
	TRISA = 0;		//PA口做输出
	PORTC = 0;
	TRISC = 0XF;	//RC0-RC3为LCD的COM口
	PORTE = 0;
	TRISE = 0;
	OPTION_REG = 0;	//设置预分频器给TMR0
	INTCON = 0;		//关闭所有中断
	TMR2 = 124;		//TMR2阈值
	T2CON = 4;		//使能TMR2计数
	TMR2IE = 1;		// 允许TMR2中断
	PEIE = 1;		// 允许外设中断
	GIE = 1;		// 允许全局中断
	while (1)
	{
		CLRWDT();	// 清看门狗
		if(tcount>15)	//125*16=2ms,每2ms进一次显示
		{
			tcount=0;
			LCD_DISP();	//2ms进一次LCD显示分支
		}
	}
}

/*****************************************************
中断函数，其中"interrupt"为中断关键字，不能修改；"isr"为用户定义名字，可修改
*****************************************************/
static void interrupt isr(void)	
{
	if(TMR2IF)
	{				// TMR2会自动加载
		TMR2IF = 0;	// 清除中断标志位
		tcount++;	//每125us+1
	}
}

/*****************************************************
显示设置函数
将要显示的数据赋给数组RDATA[0]-RDATA[3]
*****************************************************/
void SET_DISP(unsigned char *RDATA)
{					//实际应用中修改该函数内容，设置要显示的值
	*RDATA=0x1;
	*(RDATA+1)=0x2;
	*(RDATA+2)=0x4;
	*(RDATA+3)=0x8;
}
/*****************************************************
LCD显示程序
*****************************************************/
void LCD_DISP(void)
{
	static unsigned char dcount;
	unsigned char display[4];
	SET_DISP(display);		//显示设置
	
	LCDCON0 = 0B10000000;	//使能LCD模块 
	TRISC = 0B00001111;		//PORTC,0~PORTC,3--LCD-COM口 ;PORTC,4--LED-COM口	
	COMEN = 0B00001111;  	//对应IO口为LED功能的COM口(COM0-COM3)
	dcount++;
	
	switch(dcount&7)
	{	
	case 0:		//COM0输出低电平
		if(display[0] & 0x01)  {P_SEG0 = 1;} else {P_SEG0 = 0;}
		if(display[0] & 0x02)  {P_SEG1 = 1;} else {P_SEG1 = 0;}					 
		if(display[0] & 0x04)  {P_SEG2 = 1;} else {P_SEG2 = 0;}
		if(display[0] & 0x08)  {P_SEG3 = 1;} else {P_SEG3 = 0;}			
		if(display[0] & 0x10)  {P_SEG4 = 1;} else {P_SEG4 = 0;}
		if(display[0] & 0x20)  {P_SEG5 = 1;} else {P_SEG5 = 0;}
		if(display[0] & 0x40)  {P_SEG6 = 1;} else {P_SEG6 = 0;}
		if(display[0] & 0x80)  {P_SEG7 = 1;} else {P_SEG7 = 0;}
		
		P_COM0=0;		//COM0输出低
		IO_COM0=0;		//COM0做输出		
		DIS_COM0;		//关闭COM0内部上下拉使能 
		break;		
	case 1:		//COM1输出低电平
		if(display[1] & 0x01)  {P_SEG0 = 1;} else {P_SEG0 = 0;}			 
		if(display[1] & 0x02)  {P_SEG1 = 1;} else {P_SEG1 = 0;}							 
		if(display[1] & 0x04)  {P_SEG2 = 1;} else {P_SEG2 = 0;}
		if(display[1] & 0x08)  {P_SEG3 = 1;} else {P_SEG3 = 0;}					
		if(display[1] & 0x10)  {P_SEG4 = 1;} else {P_SEG4 = 0;}
		if(display[1] & 0x20)  {P_SEG5 = 1;} else {P_SEG5 = 0;}
		if(display[1] & 0x40)  {P_SEG6 = 1;} else {P_SEG6 = 0;}
		if(display[1] & 0x80)  {P_SEG7 = 1;} else {P_SEG7 = 0;}
		
		P_COM1=0;		//COM1输出低
		IO_COM1=0;		//COM1做输出		
		DIS_COM1;		//关闭COM1内部上下拉使能
		break;
	case 2:		//COM2输出低电平
		if(display[2] & 0x01)  {P_SEG0 = 1;} else {P_SEG0 = 0;}			 
		if(display[2] & 0x02)  {P_SEG1 = 1;} else {P_SEG1 = 0;}							 
		if(display[2] & 0x04)  {P_SEG2 = 1;} else {P_SEG2 = 0;}
		if(display[2] & 0x08)  {P_SEG3 = 1;} else {P_SEG3 = 0;}					
		if(display[2] & 0x10)  {P_SEG4 = 1;} else {P_SEG4 = 0;}
		if(display[2] & 0x20)  {P_SEG5 = 1;} else {P_SEG5 = 0;}
		if(display[2] & 0x40)  {P_SEG6 = 1;} else {P_SEG6 = 0;}
		if(display[2] & 0x80)  {P_SEG7 = 1;} else {P_SEG7 = 0;}
		
		P_COM2=0;		//COM1输出低
		IO_COM2=0;		//COM1做输出		
		DIS_COM2;		//关闭COM1内部上下拉使能
		break;	
	case 3:		//COM3输出低电平
		if(display[3] & 0x01)  {P_SEG0 = 1;} else {P_SEG0 = 0;}			 
		if(display[3] & 0x02)  {P_SEG1 = 1;} else {P_SEG1 = 0;}							 
		if(display[3] & 0x04)  {P_SEG2 = 1;} else {P_SEG2 = 0;}
		if(display[3] & 0x08)  {P_SEG3 = 1;} else {P_SEG3 = 0;}					
		if(display[3] & 0x10)  {P_SEG4 = 1;} else {P_SEG4 = 0;}
		if(display[3] & 0x20)  {P_SEG5 = 1;} else {P_SEG5 = 0;}
		if(display[3] & 0x40)  {P_SEG6 = 1;} else {P_SEG6 = 0;}
		if(display[3] & 0x80)  {P_SEG7 = 1;} else {P_SEG7 = 0;}
		
		P_COM3=0;		//COM1输出低
		IO_COM3=0;		//COM1做输出		
		DIS_COM3;		//关闭COM1内部上下拉使能
		break;
	case 4:		//COM0输出高电平	
		if(display[0] & 0x01)  {P_SEG0 = 0;} else {P_SEG0 = 1;}			 
		if(display[0] & 0x02)  {P_SEG1 = 0;} else {P_SEG1 = 1;}							 
		if(display[0] & 0x04)  {P_SEG2 = 0;} else {P_SEG2 = 1;}
		if(display[0] & 0x08)  {P_SEG3 = 0;} else {P_SEG3 = 1;}					
		if(display[0] & 0x10)  {P_SEG4 = 0;} else {P_SEG4 = 1;}
		if(display[0] & 0x20)  {P_SEG5 = 0;} else {P_SEG5 = 1;}
		if(display[0] & 0x40)  {P_SEG6 = 0;} else {P_SEG6 = 1;}
		if(display[0] & 0x80)  {P_SEG7 = 0;} else {P_SEG7 = 1;}
		
		P_COM0=1;		//COM0输出高
		IO_COM0=0;		//COM0做输出		
		DIS_COM0;		//关闭COM0内部上下拉使能 
		break;		
	case 5:		//COM1输出高电平
		if(display[1] & 0x01)  {P_SEG0 = 0;} else {P_SEG0 = 1;}			 
		if(display[1] & 0x02)  {P_SEG1 = 0;} else {P_SEG1 = 1;}							 
		if(display[1] & 0x04)  {P_SEG2 = 0;} else {P_SEG2 = 1;}
		if(display[1] & 0x08)  {P_SEG3 = 0;} else {P_SEG3 = 1;}					
		if(display[1] & 0x10)  {P_SEG4 = 0;} else {P_SEG4 = 1;}
		if(display[1] & 0x20)  {P_SEG5 = 0;} else {P_SEG5 = 1;}
		if(display[1] & 0x40)  {P_SEG6 = 0;} else {P_SEG6 = 1;}
		if(display[1] & 0x80)  {P_SEG7 = 0;} else {P_SEG7 = 1;}
		
		P_COM1=1;		//COM1输出高
		IO_COM1=0;		//COM1做输出		
		DIS_COM1;		//关闭COM1内部上下拉使能
		break;
	case 6:		//COM2输出高电平
		if(display[2] & 0x01)  {P_SEG0 = 0;} else {P_SEG0 = 1;}			 
		if(display[2] & 0x02)  {P_SEG1 = 0;} else {P_SEG1 = 1;}							 
		if(display[2] & 0x04)  {P_SEG2 = 0;} else {P_SEG2 = 1;}
		if(display[2] & 0x08)  {P_SEG3 = 0;} else {P_SEG3 = 1;}					
		if(display[2] & 0x10)  {P_SEG4 = 0;} else {P_SEG4 = 1;}
		if(display[2] & 0x20)  {P_SEG5 = 0;} else {P_SEG5 = 1;}
		if(display[2] & 0x40)  {P_SEG6 = 0;} else {P_SEG6 = 1;}
		if(display[2] & 0x80)  {P_SEG7 = 0;} else {P_SEG7 = 1;}
		
		P_COM2=1;		//COM1输出高
		IO_COM2=0;		//COM1做输出		
		DIS_COM2;		//关闭COM1内部上下拉使能
		break;	
	case 7:		//COM3输出高电平
		if(display[3] & 0x01)  {P_SEG0 = 0;} else {P_SEG0 = 1;}			 
		if(display[3] & 0x02)  {P_SEG1 = 0;} else {P_SEG1 = 1;}							 
		if(display[3] & 0x04)  {P_SEG2 = 0;} else {P_SEG2 = 1;}
		if(display[3] & 0x08)  {P_SEG3 = 0;} else {P_SEG3 = 1;}					
		if(display[3] & 0x10)  {P_SEG4 = 0;} else {P_SEG4 = 1;}
		if(display[3] & 0x20)  {P_SEG5 = 0;} else {P_SEG5 = 1;}
		if(display[3] & 0x40)  {P_SEG6 = 0;} else {P_SEG6 = 1;}
		if(display[3] & 0x80)  {P_SEG7 = 0;} else {P_SEG7 = 1;}
		
		P_COM3=1;		//COM3输出高
		IO_COM3=0;		//COM3做输出		
		DIS_COM3;		//关闭COM1内部上下拉使能
		break;
		}
}





