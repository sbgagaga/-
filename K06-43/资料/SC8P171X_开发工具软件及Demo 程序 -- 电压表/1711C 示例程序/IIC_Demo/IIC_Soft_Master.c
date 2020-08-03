
/******************** (C) COPYRIGHT 2016 CMS LTD **************************
* 模拟IIC主控收发参考程序 write by liaol,cms
* 文 件 名：IIC_Soft_Master.c
* 日期版本：2016/6/23 @V1.0
* 官    网：www.mcu.com.cn	
* 备	注：本程序使用CMS89F526验证通过
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
	
	/*初始化定时器2, 125us中断*/
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
				
				/*写4个字节*/
				I2C_WriteStart();
				I2C_Write1Byte(0xa0);
				I2C_Write1Byte(0x4);
				I2C_Write1Byte(Sendbuffer[0]);
				I2C_Write1Byte(~Sendbuffer[0]);
				I2C_Write1Byte(0x3);
				I2C_WriteStop();
				
				/*读4个字节*/
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

//125us定时中断
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
函数功能：产生IIC启动信号
入口参数：no
函数返回：no
备    注：在SCL为高电平时，SDA线上发生从高到低的电平变化
***********************************************************/
void I2C_WriteStart()
{
	I2C_SDA_IO = 0;
	I2C_SCL_IO = 0;
	I2C_WaitMoment();
	
	I2C_SDA = 1;			//先将SDA=1，以准备在SCL=1时，将SDA=0
	I2C_SCL = 1;			//时钟总线拉高
	I2C_WaitMoment();
	I2C_SDA = 0;			//SCL=1时，将SDA拉低即产生启动信号
	
	I2C_WaitMoment();
	I2C_SCL = 0;			//将SCL=0，完成启动信号操作
	I2C_WaitMoment();
}

/***********************************************************
函数功能：产生IIC结束信号
入口参数：no
函数返回：no
备    注：在SCL为高电平时，SDA线上发生从低到高的电平变化
***********************************************************/
void I2C_WriteStop()
{
	I2C_SDA_IO = 0;
	I2C_SCL_IO = 0;
	I2C_WaitMoment();
	
	I2C_SDA = 0;			//先将SDA=0，以准备在SCL=1时，将SDA=1
	I2C_SCL = 1;			//时钟总线拉高
	I2C_WaitMoment();
	I2C_SDA = 1;			//SCL=1时，将SDA拉高即产生停止信号
	
	I2C_WaitMoment();
	I2C_SCL = 0;			//将SCL=0，完成启动信号操作
	I2C_WaitMoment();
}

/***********************************************************
函数功能：模拟IIC主机发送8位数据
入口参数：data-待发送数据
函数返回：返回ack应答信号
备    注：IIC协议ack应答信号为低有效
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
		
		I2C_SCL = 1;		//时钟线做一个上升沿，将一位数据写入
		data <<= 1;
	}
	while(--i);
	I2C_SCL = 0;
	
	I2C_SDA_IO = 1;			//置为输入口接收应答信号

	I2C_WaitMoment();
	I2C_SCL = 1;			//做个上升沿准备读应答信号
	I2C_WaitMoment();
	
	i = I2C_SDA;
	I2C_SCL = 0;
	I2C_SDA_IO = 0;
	return i;
}

/***********************************************************
函数功能：模拟IIC主机接收8位数据
入口参数：ack-应答信号
函数返回：接收到的数据
备    注：IIC协议ack应答信号为低有效
***********************************************************/
unsigned char I2C_Read1Byte(unsigned char ack)
{
	unsigned char i,data;
	I2C_SDA_IO = 1;
	I2C_SCL_IO = 1;
	I2C_WaitMoment();
	
	while(!I2C_SCL);				//等待从机准备好数据释放时钟
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
	
	if(ack)I2C_SDA = 1;			//是否需要更多的数据
	else I2C_SDA = 0;
	
	I2C_WaitMoment();
	I2C_SCL = 1;
	I2C_WaitMoment();
	I2C_SCL = 0;
	return data;
}

//短暂延时
void I2C_WaitMoment()
{
	asm("nop");
	asm("nop");
}