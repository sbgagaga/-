#include "K13-01.h"

bit SystemONFlag=0;
uint8 VarPowerUpCount=0;

uint8 BatPercent=0;

uint8 WorkMin=0;

uint8 LockNumb=0;

TYPE_UNION_LockSta LockSta;

bit OnOffFlag=0;
bit WorkFlag=0;
bit IovFlag=0;
bit LowBatFlag=0;
bit USBFlag=0;

uint8 Sec1sCnt=0;
uint8 BatAddTime=0;
uint8 BatDecTime=0;

void Apply()
{
    if(time2ms)
    {
        time2ms=0;
        if(SystemONFlag)
        {
            KeyScan();
        }
    }
    if(time10ms)
    {
        time10ms=0;
        if(SystemONFlag==0&&VarPowerUpCount<100)
        {
            VarPowerUpCount++;
            ADCPro();
        }
        else if(VarPowerUpCount>=100)
        {
            SystemONFlag=1;
            VarPowerUpCount=0;
        }
        /*上电完成*/
        if(SystemONFlag)
        {
            ADCPro();
            Motor();
            DisplayPro();
            //SystemSleep();
        }
        Sec1sCnt++;
        if(Sec1sCnt>=100)
        {
            Sec1sCnt=0;
            Sec1sPro();
        }
        
    }
}

void SystemSleep()
{
    static uint8 SleepCnt=0;
    if(WorkFlag||OnOffFlag||LowBatFlag||USBFlag||IovFlag)
    {
        SleepCnt=0;
    }
    else
    {
        SleepCnt++;
        if(SleepCnt>=200)
        {
            SleepCnt=0;
            asm("clrwdt");
            INTCON=0;
            PIE1 = 0;
            PIE2 = 0;	
            PIR1 = 0;
            ADCON0	= 0;

            TRISA =0X00;
	        TRISB =0X00;
            WPUA = 0xFF;
            WPUB = 0xFF;
            WPUC = 0xFF;
            PORTA =	0;			//初始端口配置为输出低；
            PORTB = 0;
            PORTC = 0;
            PIN_BAT=H;
            PIN_IOV=H;
            PIN_GND=H;
            PIN_EN =L;
            Pin_KEY_CFG(1,1);
            Pin_USB_CFG(1,1);

            WDT_OFF();
            RBIE=1;
            IOCB=0xC0;
            OSCCON=0X01;
            RBIF = 0;
            PORTB;
            asm("sleep");
		    asm("nop");
            SystemInit();
        }
    }
}

void SystemInit()
{
    asm("nop");
	asm("clrwdt");
    GPIOInit();
    TimerInit();
    WDT_ON();
}

void GPIOInit()
{
    RBPU=0;
	/*全配置成输出*/
	TRISA =0X00;
	TRISB =0X00;
	TRISC =0X00;
	//TRISE =0X00; 

    /*全部设置上拉，输出会自动断开上拉*/
	WPUA  =0XFF;
	WPUB  =0XFF;
	WPUC  =0XFF;
	//WPUE  =0XFF;

    /*默认输出0*/
	PORTA =	0X80;
	PORTB = 0X80;
	PORTC = 0;
	//PORTE = 0;

	PIN_EN =true;
    RBPU=0;
    Pin_KEY_CFG(IN,1);
    Pin_USB_CFG(IN,1);
	
	Pin_BAT_CFG(1,0); ANS1=1; //AN1配置为模拟输入；
	Pin_IOV_CFG(1,0); ANS2=1; //AN2配置为模拟输入；
    //Pin_Vin_CFG(1,0); ANS9=1;//AN9配置为模拟输入；
}

void TimerInit()
{
    // OSCCON=0X71;		//晶振配置为8M,内部
	// INTCON=0B11000000;	//使能全局中断，外设中断
	// PIE1=0B00000001;	//TIMER1溢出中断
    // TMR1IF = 0;
	// TMR1IE = 1;	
    // TMR1H=0xFC;
    // TMR1L=0x18;         //设置定时器1计时1ms
    // T1CON = 0X01; //预分配4倍,使能定时器1

	OSCCON=0X61;		//晶振配置为4M,内部
	INTCON=0B11000000;	//使能全局中断，外设中断
	PIE1=0B00000010;	//TIMER2匹配中断
	T2CON=0B00000100;	//使能TIMER2
	PR2	= 200;			//TIMER时钟为Fosc/4; 200us进一次中断
}
