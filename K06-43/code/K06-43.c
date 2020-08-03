#include "K06-43.h"

bit SystemONFlag=0;
uint8 VarPowerUpCount=0;

uint8 BatPercent=0;
uint8 Time1sCnt=0;

uint8 WorkTotalMin=0;
uint8 WorkTotalSec=0;
uint8 WorkSec=0;
uint8 WorkMin=0;

uint8 LockNumb=0;

TYPE_UNION_LockSta LockSta;

bit PowerFlag=0;
bit OnOffFlag=0;
bit WorkFlag=0;
bit CleanFlag=0;
bit IovFlag=0;
bit LowBatFlag=0;
bit USBFlag=0;
bit USBErrFlag=0;
bit AllLedFlag=0;


void Apply()
{
    if(DEF_TICK_2mS == 1)
    {	 
        DEF_TICK_2mS = 0;
        if(SystemONFlag)
        {
            KeyScan();
        }
        LEDScan();
    }

    if(DEF_TICK_5mS == 1)
    {
        DEF_TICK_5mS = 0; 
    }

    if(DEF_TICK_10mS == 1)
    {
        DEF_TICK_10mS = 0;
        /*�ϵ��ӳ�*/
        if(SystemONFlag==0&&VarPowerUpCount<100)
        {
            VarPowerUpCount++;
            ADCPro();
            BeepAlarmUpdate(1,50);
            BeepPro();
        }
        else if(VarPowerUpCount>=100)
        {
            SystemONFlag=1;
            VarPowerUpCount=0;
        }
        /*�ϵ����*/
        if(SystemONFlag)
        {
            ADCPro();
            BeepPro();
            ChargePro();
        }
        if(AllLedFlag)
        {
            Time1sCnt++;
            if(Time1sCnt>=100)
            {
                Time1sCnt=0;
                AllLedFlag=0;
            }
        }
    }
    
    if(DEF_TICK_15mS == 1)
    {
        DEF_TICK_15mS = 0;
    }
    
    if(DEF_TICK_20mS == 1)
    {
        DEF_TICK_20mS = 0;
    }

    if(DEF_TICK_50mS == 1)
    {
        DEF_TICK_50mS = 0;
    }

    if(DEF_TICK_100mS == 1)
    {
        DEF_TICK_100mS = 0;
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
	/*ȫ���ó����*/
	TRISA =0X00;
	TRISB =0X00;
	TRISC =0X00;
	TRISE =0X00; 
    /*ȫ������������������Զ��Ͽ�����*/
	WPUA  =0XFF;
	WPUB  =0XFF;
	WPUC  =0XFF;
	WPUE  =0XFF;
    /*Ĭ�����0*/
	PORTA =	0X80;
	PORTB = 0X80;
	PORTC = 0;
	PORTE = 0;

	PIN_EN =true;
	
	Pin_IOV_CFG(1,0); ANS8=1; //AN8����Ϊģ�����룻
	Pin_BAT_CFG(1,0); ANS10=1; //AN10����Ϊģ�����룻
    Pin_Vin_CFG(1,0); ANS9=1;//AN9����Ϊģ�����룻
}

void TimerInit()
{
    OSCCON=0X61;		//��������Ϊ4M,�ڲ�
	INTCON=0B11000000;	//ʹ��ȫ���жϣ������ж�
	PIE1=0B00000001;	//TIMER1����ж�
    TMR1H=0xFC;
    TMR1L=0x18;         //���ö�ʱ��1��ʱ1ms
    T1CON=0x31;         //Ԥ����4��,ʹ�ܶ�ʱ��1
}

