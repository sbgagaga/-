#include "LED.h"

uint8 NumbArr[10]={0x77,0x24,0x5D,0X6D,0X2E,0X6B,0X7B,0X25,0X7F,0X2F};//数字
uint8 HideNumbArr[11]={0,0x40,0x70,0x78,0x7E,0x7F,0x3F,0X0F,0x07,0X01,0};//自下往上扫描
uint16 OffHideNumbArr[7]={0,0x12,0x5B,0X7F,0x97F,0x2DFF,0x3FFF};
// const uint8 LEDSeg1[16][2]=
// {
//     {1,0},{2,1},{2,0},{3,1},{0,1},{3,0},{4,0},//上到下，左到右排序,左数字
//     {0,2},{1,3},{1,2},{2,3},{0,3},{3,2},{4,2},//上到下，左到右排序,右数字
//     {0,4},{1,4}//感叹号、锁
// };
const uint8 LEDSeg1[16]={1,2,2,3,0,3,4,0,1,1,2,0,3,4,0,1};
uint8 LEDSeg2[16]={0,1,0,1,1,0,0,2,3,2,3,3,2,2,4,4};
uint16 LedIndex=0;
uint8 LEDArrMap[5]={0};

void LEDScan()
{
    static uint8 LEDScanIndex=0;

    Pin_LED1_CFG(IN,0);
    Pin_LED2_CFG(IN,0);
    Pin_LED3_CFG(IN,0);
    Pin_LED4_CFG(IN,0);
    Pin_LED5_CFG(IN,0);
    asm("nop");	asm("nop");

    switch(LEDScanIndex)
    {
        case 0:
        if(LEDArrMap[0]&0x02) 
        {
            Pin_LED2_CFG(OUT,0);PIN_LED2=L ;
        }
		if(LEDArrMap[0]&0x04)  
        {
            Pin_LED3_CFG(OUT,0);PIN_LED3=L ;
        }
		if(LEDArrMap[0]&0x08) 
        {
            Pin_LED4_CFG(OUT,0);PIN_LED4=L ;
        }
		if(LEDArrMap[0]&0x10) 
        {
            Pin_LED5_CFG(OUT,0);PIN_LED5=L ;
        }
		Pin_LED1_CFG(OUT,0);PIN_LED1=H ;
        break;

        case 1:
        if(LEDArrMap[1]&0x01)
        {
            Pin_LED1_CFG(OUT,0);PIN_LED1=L ;
        } 
        if(LEDArrMap[1]&0x04) 
        {
            Pin_LED3_CFG(OUT,0);PIN_LED3=L ; 
        }
        if(LEDArrMap[1]&0x08) 
        {
            Pin_LED4_CFG(OUT,0);PIN_LED4=L ;
        }
        if(LEDArrMap[1]&0x10)
        {
            Pin_LED5_CFG(OUT,0);PIN_LED5=L ;
        } 
        Pin_LED2_CFG(OUT,0); PIN_LED2=H ;
        break;

        case 2:
        if(LEDArrMap[2]&0x01) 
        {
            Pin_LED1_CFG(OUT,0);PIN_LED1=L ;
        }
		if(LEDArrMap[2]&0x02) 
        {
            Pin_LED2_CFG(OUT,0);PIN_LED2=L ;
        }
		if(LEDArrMap[2]&0x08) 
        {
            Pin_LED4_CFG(OUT,0);PIN_LED4=L ;
        }
		if(LEDArrMap[2]&0x10) 
        {
            Pin_LED5_CFG(OUT,0);PIN_LED5=L ;
        }
		Pin_LED3_CFG(OUT,0);PIN_LED3=H ;
        break;

        case 3:
        if(LEDArrMap[3]&0x01)
        {
            Pin_LED1_CFG(OUT,0);PIN_LED1=L ;
        }
		if(LEDArrMap[3]&0x02)
        {
            Pin_LED2_CFG(OUT,0);PIN_LED2=L ;
        }
		if(LEDArrMap[3]&0x04)
        {
            Pin_LED3_CFG(OUT,0);PIN_LED3=L ; 
        }
		Pin_LED4_CFG(OUT,0);PIN_LED4=H ;
        break;

        case 4:
        if(LEDArrMap[4]&0x01)
        {
            Pin_LED1_CFG(OUT,0);PIN_LED1=L ;
        }
		if(LEDArrMap[4]&0x04)
        {
            Pin_LED3_CFG(OUT,0);PIN_LED3=L ; 
        }
        Pin_LED5_CFG(OUT,0);PIN_LED5=H ;
    }
    LEDScanIndex++;
    if(LEDScanIndex>=5)
    {
        LEDScanIndex=0;
    }
}

void DisplayIcon(uint16 index)
{
    uint8 i=0;
    uint16 Mask=0x01;

    for(i=0;i<16;i++)
    {
        if(index&Mask)
        {
            LEDArrMap[LEDSeg1[i]]|=(1<<LEDSeg2[i]);
        }
        else
        {
            LEDArrMap[LEDSeg1[i]]&=~(1<<LEDSeg2[i]);
        }
        
        Mask<<=1;
    }
}

void DisplayPro()
{
    LedIndex=0;
    WorkLedPro();
    USBLedPro();
    LockPro();
    ErrPro();
    DisplayIcon(LedIndex);
}

void USBLedPro()
{
    static uint8 index=0;
    static uint8 cnt=0;

    if(USBFlag&&!WorkFlag&&!OnOffFlag)//充电正常
    {
        cnt++;
        if(cnt>=40)
        {
            cnt=0;
            index++;
            if(index>=11)
            {
                index=0;
            }
        }
        if(BatPercent<99)
        {
            LedIndex=NumbArr[BatPercent/10];
            LedIndex|=((uint16)NumbArr[BatPercent%10]&~HideNumbArr[index])<<7;
            LedIndex&=~HideNumbArr[index];
        }
        else
        {
            index=0;
            LedIndex=NumbArr[BatPercent/10];
            LedIndex|=NumbArr[BatPercent%10]<<7;
        }
        
    }
    else
    {
        index=0;
        cnt=0;
    }
}

void WorkLedPro()
{
    static int8 LedSwitchCnt=0;
    static bit LedSwitchFlag=0;
    static int8 index=0;
    static uint8 cnt=0;
    static bit dir=0;
    if(WorkFlag&&!LockSta.LockStart&&!OnOffFlag&&!LockSta.LockFlag)
    {
        if(BatPercent<=10)
        {
            LedSwitchCnt++;
            if(LedSwitchCnt>=40)
            {
                LedSwitchCnt=0;
                LedSwitchFlag=!LedSwitchFlag;
            }
        }
        else
        {
            LedSwitchCnt=0;
            LedSwitchFlag=1;
        }
        if(LedSwitchFlag)
        {
            LedIndex|=NumbArr[BatPercent/10];
            LedIndex|=(uint16)NumbArr[BatPercent%10]<<7;
        }
    }
    else if(OnOffFlag)
    {
        cnt++;
        if(cnt>=40)
        {
            cnt=0;
            index++;
            if(index>=7)
            {
                if(dir)
                {
                    OnOffFlag=0;
                    WorkMin=0;
                    return;
                }
                dir=!dir;
                index=0;
            }
        }
        if(!dir)
        {
            LedIndex=NumbArr[BatPercent/10];
            LedIndex|=(uint16)NumbArr[BatPercent%10]<<7;
            LedIndex&=~OffHideNumbArr[index];
        }
        else
        {
            LedIndex=NumbArr[WorkMin/10];
            LedIndex|=(uint16)NumbArr[WorkMin%10]<<7;
            LedIndex&=~OffHideNumbArr[6-index];
        }
    }
}

void LockPro()
{
    static uint8 SwitchCnt=0,LockSwitchCnt=0;
    static uint8 Ledcnt=0;
    static bit LedSwitchFlag=0;
    if(!USBFlag)
    {
        if(LockSta.LockStart||LockSta.UnlockStart)
        {
            SwitchCnt++;
            if(SwitchCnt>=100)
            {
                SwitchCnt=0;
                if(LockNumb>0)
                {
                    LockNumb--;
                }
            }
            LedIndex=NumbArr[0];
            LedIndex|=(uint16)NumbArr[LockNumb+1]<<7;
            if(LockSta.UnlockStart)
            {
                LedIndex|=iconLock;
            }
        }
        else
        {
            SwitchCnt=0;
        }
        if(LockSta.LockEnd||LockSta.UnlockFail)
        {
            LockSwitchCnt++;
            if(LockSwitchCnt>=35)
            {
                LockSwitchCnt=0;
                LedSwitchFlag=!LedSwitchFlag;
                if(!LedSwitchFlag)
                {
                    Ledcnt++;
                    if(Ledcnt>=4)
                    {
                        LockSta.LockEnd=0;
                        LockSta.UnlockFail=0;
                    }
                }
            }
            if(LedSwitchFlag)
            {
                LedIndex=iconLock;
            }
        }
        else
        {
            Ledcnt=0;
            LockSwitchCnt=0;
        }
    }
}

void ErrPro()
{
    static uint8 SwitchCnt=0;
    static bit LedSwitchFlag=0;
    if(IovFlag)
    {
        SwitchCnt++;
        if(SwitchCnt>=35)
        {
            SwitchCnt=0;
            LedSwitchFlag=!LedSwitchFlag;

        }
        if(LedSwitchFlag)
        {
            LedIndex=iconErr;
        }
    }
    else
    {
        SwitchCnt=0;
    }
}
