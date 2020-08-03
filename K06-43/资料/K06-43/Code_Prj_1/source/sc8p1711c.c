#include "source_h\common.h"

/************************************************************
函数名称：
函数功能：GPIO初始化，多余IO设置成输出低
入口参数：
出口参数：
备    注：
************************************************************/
void GPIO_Init(void)
{
	RBPU=0;//1:禁止 PORTB 上拉; 0:由端口的各个锁存值使能 PORTB 上拉;
	//引脚方向设置，1为输入，0为输出
	
	TRISA =0X00; 		//如果有哪个脚是合封的，配置为输入，关上拉；
	TRISB =0X00;
	TRISC =0X00;
	TRISE =0X00;  		
	WPUA  =0XFF;
	WPUB  =0XFF;
	WPUC  =0XFF;
	WPUE  =0XFF;
	PORTA =	0X80;			//初始端口配置为输出低；
	PORTB = 0X80;
	PORTC = 0;
	PORTE = 0;

	Pin_GND=L;
	Pin_EN =H;
	
//	Pin_KEY_CFG(IN,PULL);
//	Pin_USB_CFG(IN,PULL);
	Pin_IOV_CFG(IN,NONE); ANS2=1; //AN2配置为模拟输入；
	Pin_BAT_CFG(IN,NONE); ANS1=1; //AN1配置为模拟输入；
}

/************************************************************
函数名称：ADSample()
函数功能：AD采样函数
入口参数：ADCH,AD通道
出口参数：ADRESH,ADRESL
备    注：采样成功返回1，超时返回0
************************************************************/
unsigned char ADSample(unsigned char adch)
{
	ADCON1 = 0x00;					//左对齐
	ADCON0 = 0X41 | ( adch << 2);	//16分频
	asm("nop");
	asm("nop");
	GODONE = 1;						//开始转换
	volatile unsigned char i = 0;
	while(GODONE)
	{
		if(0 == (--i))				//ad等待限时，防止拔插电后出现死循环
			return 0;
	}
	return 1;
}

/**************************************************************
函数名称：AdRead(uchar ad_ch)
函数功能：采样
入口参数：ad_ch通道
出口参数：
备    注：采样10次，去掉最大及最小求算术平均值
**************************************************************/
void AdRead(uchar ad_ch)
{
	static uchar adtimes;	//采样次数；
	uint ad_temp;

	if(ADSample(ad_ch))
	{
		ad_temp=(ADRESH<<4)+(ADRESL>>4);  //12位ad
	
		if(adtimes==0)
		{
			admax = 0x0000;
			admin = 0xffff;
			adsum = 0;
		}
		if(ad_temp > admax)	admax = ad_temp;				//AD采样最大值
		if(ad_temp < admin)	admin = ad_temp;				//AD采样最小值
			
		adsum += ad_temp;
		adtimes++;
		if(adtimes >= 10)
		{
			adsum = adsum - admax - admin;
			ad_val = adsum >> 3;		
			adtimes = 0;		
			Flag_ad_done=1;
		}
	}
}
/**************************************************************
函数名称：
函数功能：分时采样0.6V电压值，电源电压，NTC值并进行处理；
入口参数：
出口参数：
备    注：
**************************************************************/
uchar sta_ad;		//采样状态；
uint ad_current;	//过流AD值；
void AdProc(void)
{
	ulong dat_tmp;
		
	switch(sta_ad)
	{
		case 0: //内部参考电压采样
		AdRead(AD_BG);	
		if(Flag_ad_done){ Flag_ad_done=0; ad_bg=ad_val;	sta_ad=1; }
		break;
		case 1: //过流采样
		AdRead(AD_AN2);	
		if(Flag_ad_done) 
		{
			Flag_ad_done=0; 
			dat_tmp=ad_val; 
			ad_current=dat_tmp*1000/ad_bg;
			current_scp=ad_current;
			if(ad_current>current_val) current_val++; else { if(current_val) current_val--; }
			sta_ad=2; 
		}
		break;
		case 2: //电池电压采样
		AdRead(AD_AN1);	
		if(Flag_ad_done)
		{
			Flag_ad_done=0;
			//ad_bat=ad_val;
			dat_tmp=ad_val;
			bat_val=dat_tmp*100/ad_bg; 
			sta_ad=0;
		}
		break;
		default:
		sta_ad=0; 
		break;
	}
}
/**************************************************************
函数名称：电机短路保护
函数功能：
入口参数：
出口参数：
备    注：
**************************************************************
void IscpTest(void)
{
	uint ad_temp;
	
    if(ADSample(AD_AN2))
	{
	    ad_temp=(ADRESH<<4)+(ADRESL>>4);  //12位ad
		ad_temp=ad_temp>>1;
		if(ad_temp>ad_bg) Flag_scp=1; else Flag_scp=0; //0.6V保护
	}
}
/**************************************************************
函数名称：
函数功能：系统睡眠
入口参数：
出口参数：
备    注： 
**************************************************************/
uchar RSleepCnt;
void SysSleep(void)
{
	if(Flag_on||Flag_usb||Flag_off||Flag_low_alarm||Flag_lk_alarm||Flag_xi_alarm||ReadKey) RSleepCnt=0; 
	if(Flag_RtSleep) { Flag_RtSleep=0; RSleepCnt++; }
	if(RSleepCnt>=200) //无操作2秒后进入睡眠；
	{
		RSleepCnt=0;
		asm("clrwdt");
		
		INTCON=0;
		PIE1 = 0;
		PIE2 = 0;	
		PIR1 = 0;
		//进入休眠前关掉所有功能模块,以降低休眠电流
		ADCON0	= 0; //禁止ADC，不消耗工作电流;
		KEYCON0 = 0;
		CCP1CON = 0;
		CCP2CON = 0;
		
		SysSleepSet();
		
		WDT_OFF();
		RBIE=1;				//允许PORTB电平变化中断；
		GIE =0;				//GIE=0时，唤醒后执行SLEEP后程序; GIE=1时，唤醒后跳至中断服务
		IOCB = 0B00110000;	//PB5,PB4唤醒；
		OSCCON=0X01;		//晶振配置为32K,内部;
		RBIF = 0;			//清标志
		PORTB;
		asm("sleep");
		asm("nop");
		Init_System();
	}
}
/**************************************************************
函数名称：
函数功能：系统睡眠
入口参数：
出口参数：
备    注： 
**************************************************************/
void SysSleepSet(void)
{
	RBPU=0;//OPTION_REG.7 1:禁止 PORTB 上拉; 0:由端口的各个锁存值使能 PORTB 上拉;
	//引脚方向设置，1为输入，0为输出
	TRISC =0X00;
	TRISB =0X00;
	TRISA =0X00; 		//如果有哪个脚是合封的，配置为输入，关上拉；
	TRISE =0X00;  		//初始端口配置为输出；
	
	WPUA = 0xFF;
	WPUB = 0xFF;
	WPUC = 0xFF;
	WPUE = 0xFF;
	
	PORTA =	0X80;			//初始端口配置为输出低；
	PORTB = 0X80;
	PORTC = 0;
	PORTE = 0;
	
	Pin_BAT=H;
	Pin_IOV=H;
	Pin_GND=H;
	Pin_EN =L;

	Pin_USB_CFG(IN,PULL);
	Pin_KEY_CFG(IN,PULL);
}





