
//CCP1 PWM模式参考程序
#include <SC.h>           		//调用单片机的头文件

void main(void)            		//主函数,单片机开机后就是从这个函数开始运行
{
	unsigned int delaycnt = 0;
	unsigned char pwmbuf = 0;

	asm("nop");
	asm("clrwdt");
	OSCCON = 0X71;				//8M
	
								//以下是对CCP1的PWM功能初始化
    PR2 = 0xFF;              	//装载PR2寄存器设置PWM周期，频率为7812Hz
    CCP1CON = 0x0C;          	//CCP1模块工作在PWM模式
    CCPR1L = 0xCD;           	//装载CCPR1L寄存器设置PWM占空比，为80%
    
	TMR2IF = 0;              	//清零PIR1寄存器中的TMR2IF中断标志位
    T2CKPS0 = 0;             	//定时器TMR2设置1:1预分频比，T2CKPS0=0
    T2CKPS1 = 0;             	//定时器TMR2设置1:1预分频比，T2CKPS1=0
    TMR2ON = 1;              	//T2CON寄存器中的TMR2ON位置1使能Timer2
    TRISC2 = 0;					//清零TRISC2位，使能CCP1引脚输出驱动器

    while(1)					//死循环,单片机初始化后,将一直运行这个死循环
    {
		if(++delaycnt > 1000)	//延时1000个软件周期，非精确定时
   		{
   			delaycnt = 0;        //清零以备下次重新计数
   			pwmbuf++;			//占空比加一
			CCPR1L = pwmbuf;	//写入占空比
   		}
    }
}


