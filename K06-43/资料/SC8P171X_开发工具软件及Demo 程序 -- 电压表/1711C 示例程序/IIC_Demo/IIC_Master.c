
/******************** (C) COPYRIGHT 2016 CMS LTD **************************
* 硬件IIC主控收发参考程序 write by liaol,cms
* 文 件 名：IIC_Master.c
* 日期版本：2016/6/23 @V1.0
* 官    网：www.mcu.com.cn
* 备	注：本程序使用CMS89F526验证通过
**************************************************************************/

#include <cms.h>
#define 	I2C_SCL_IO	TRISA6
#define 	I2C_SDA_IO	TRISA5

#define		TRUE		1
#define		FALSE		0

bit B_MainLoop;

volatile unsigned char Recebuffer[5];		//接收数据缓存
volatile unsigned char Sendbuffer[5];		//发送数据缓存


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
	
	/*初始化定时器2, 125us中断*/
	PR2 = 250;
	T2CON = 4;
	TMR2IE = 1;

	INTCON = 0XC0;		//全局中断使能

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
				
				/*确定IIC工作正常*/
				I2C_CheckWorkStatus();
				
				/*写4个字节*/
				I2C_WriteStart();
				I2C_Write1Byte(0xA0);
				I2C_Write1Byte(0x4);
				I2C_Write1Byte(Sendbuffer[0]);
				I2C_Write1Byte(~Sendbuffer[0]);
				I2C_Write1Byte(0x3);
				I2C_WriteStop();

				/*读4个字节*/
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

//125us定时中断
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


//硬件产生IIC启动信号
void I2C_WriteStart()
{
	SEN = 1;				//产生IIC启动信号
	I2C_WaitStatus();		//等待启动信号产生完成
}

//硬件产生IIC停止信号
void I2C_WriteStop()
{
	PEN = 1;				//产生IIC停止信号
	I2C_WaitStatus();		//等待停止信号产生完成
}

//向从机写1字节数据
void I2C_Write1Byte(unsigned char data)
{
	SSPBUF = data;			//发送器件地址和写信号
	I2C_WaitStatus();		//等待数据发送完成
}

//读取来自从机的1字节数据
unsigned char I2C_Read1Byte(unsigned char ack)
{
//	unsigned char data;
	RCEN = 1;				//设置读允许
	I2C_WaitStatus();		//等待接收完成
//	data = SSPBUF;			//读出数据
	
	ACKDT = ack;			//确认数据位,还需要更多的数据
	ACKEN = 1;				//发送应答信号
	I2C_WaitStatus();		//等待ACK发送完成
	return SSPBUF;//data;
}

//等待状态完成
unsigned char I2C_WaitStatus()
{
	unsigned char t = 0;
	while(0 == SSPIF)		//直到完成为止
	{
		if(0 == (--t))
		{
			SSPCON = 0;		//超时禁止IIC通信
			return FALSE;
		}
	}
	SSPIF = 0;				//清SSPIF标志位
	return TRUE;
}

//检测IIC工作状态
void I2C_CheckWorkStatus()
{
	if(0x28 != SSPCON)
	{
		I2C_SDA_IO = 1;		//SDA必须为输入口,否则接收数据会错误
	//	I2C_SCL_IO = 1;
		SSPADD = 0x40;		//时钟=Fosc/(4*(SSPADD+1))
		SSPSTAT = 0x80;		//标准100KHz
		SSPCON = 0x28;		//主控模式
		SSPCON2 = 0;
	}
}