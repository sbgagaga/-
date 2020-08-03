
/******************** (C) COPYRIGHT 2016 CMS LTD **************************
* 硬件IIC从动收发参考程序 write by liaol,cms
* 文 件 名：IIC_Slave.c
* 日期版本：2016/6/23 @V1.0
* 官    网：www.mcu.com.cn	
* 备	注：本程序使用CMS89F526验证通过
**************************************************************************/
#include <cms.h>

#define		RECE_BUFFER_LENGTH		5		//定义接收缓冲区大小(byte)
#define		SEND_BUFFER_LENGTH		5		//定义发送缓冲区大小(byte)

unsigned char Recebuffer[RECE_BUFFER_LENGTH];
unsigned char Sendbuffer[SEND_BUFFER_LENGTH];

bit B_MainLoop;

//中断服务函数
void interrupt ISR(void)
{
	static unsigned char rececount=0,sendcount=0;
	if(SSPIF)					//IIC中断
	{
		SSPIF = 0;
		if(RW)					//1-读，0-写
		{
			//发送数据
			SSPBUF = Sendbuffer[sendcount];
			if(++sendcount >= SEND_BUFFER_LENGTH)
			{
				sendcount = 0;
			}
			asm("nop");			//这儿必须延时,否则主机接收数据可能出错
			CKP = 1;			//数据准备完毕,释放时钟
		}
		else
		{
			//接收数据
			if(DA)				//DA为1-收到的是数据，DA为0-收到的是地址
			{
				Recebuffer[rececount] = SSPBUF;
				if(++rececount >= RECE_BUFFER_LENGTH)
				{
					rececount = 0;
				}
			}
			else
			{
				SSPBUF;			//必须读出SSPBUF
				rececount = 0;
				sendcount = 0;
			}
			SSPOV = 0;
		}
	}
	
	static unsigned char tcount = 0;
	if(TMR2IF)					//Timer2中断
	{
		TMR2IF = 0;
		if(++tcount >= 40)		//5ms
		{
			tcount = 0;
			B_MainLoop = 1;
		}
	}
}


void main()
{
	NOP();
	CLRWDT();
	OSCCON = 0x71;
	
	TRISB = 0;
	PORTB = 0;
	
	/*初始化IIC模块*/
	TRISA5 = 1;			//SDA及SCK为输入口
	TRISA6 = 1;
	SSPSTAT = 0X80;		//清除状态位，标准100KHz
	SSPCON = 0X36;		//从动模式，7位地址，使能端口及时钟
	SSPCON2 = 0X0;
	SSPADD = 0XA0;		//设备从地址
	SSPIE = 1;
	
	/*初始化定时器2, 125us中断*/
	PR2 = 250;
	T2CON = 4;
	TMR2IE = 1;
	
	INTCON = 0xc0;		//全局中断使能
	
	unsigned char time1s;
	
	while(1)
	{
		
		//校验接收到的数据
		if(4 == Recebuffer[0] && 3 == Recebuffer[3] && Recebuffer[1] == (unsigned char)~Recebuffer[2])
		{
			PORTB = Recebuffer[1];
		}
		
		if(B_MainLoop)
		{
			CLRWDT();
			B_MainLoop = 0;
			if(++time1s >= 200)
			{
				time1s = 0;
				Sendbuffer[0]++;
			}
		}
	}
}