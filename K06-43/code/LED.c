#include "LED.h"

const uint8 LEDNumbArr[]=
{
    0x3F,	//0 - 0
	0x06,	//1 - 1
	0x5B,	//2 - 2
	0x4F,	//3 - 3
	0x66,	//4 - 4
	0x6D,	//5 - 5
	0x7D,	//6 - 6
	0x07,	//7 - 7
	0x7F,	//8 - 8
	0x6F,	//9 - 9
};

uint8 LED_RAM[4]={0};//前2个作为数字
uint8 OnOffCnt=0;

void LEDScan()
{
    static uint8 LEDScanIndex=0;
    PIN_SEGA=L;	PIN_SEGB=L;	PIN_SEGC=L;	PIN_SEGD=L;	PIN_SEGE=L;	PIN_SEGF=L;	PIN_SEGG=L;
	PIN_DIG1=H;	PIN_DIG2=H;	PIN_DIG3=H;	PIN_DIG4=H;
    switch(LEDScanIndex)
    {
        case 0:
        if(LED_RAM[0]&0x01) PIN_SEGA=H; 
		if(LED_RAM[0]&0x02) PIN_SEGB=H;  
		if(LED_RAM[0]&0x04) PIN_SEGC=H; 
		if(LED_RAM[0]&0x08) PIN_SEGD=H; 
		if(LED_RAM[0]&0x10) PIN_SEGE=H; 
		if(LED_RAM[0]&0x20) PIN_SEGF=H; 
		if(LED_RAM[0]&0x40) PIN_SEGG=H; 
        if(LED_RAM[0]&0x80) PIN_SEGM=H; 
		PIN_DIG1=L;
        break;

        case 1:
        if(LED_RAM[1]&0x01) PIN_SEGA=H; 
		if(LED_RAM[1]&0x02) PIN_SEGB=H;  
		if(LED_RAM[1]&0x04) PIN_SEGC=H; 
		if(LED_RAM[1]&0x08) PIN_SEGD=H; 
		if(LED_RAM[1]&0x10) PIN_SEGE=H; 
		if(LED_RAM[1]&0x20) PIN_SEGF=H; 
		if(LED_RAM[1]&0x40) PIN_SEGG=H; 
        if(LED_RAM[1]&0x80) PIN_SEGM=H; 
		PIN_DIG2=L;
        break;

        case 2:
        if(LED_RAM[2]&0x01) PIN_SEGA=H; 
		if(LED_RAM[2]&0x02) PIN_SEGB=H;  
		if(LED_RAM[2]&0x04) PIN_SEGC=H; 
		if(LED_RAM[2]&0x08) PIN_SEGD=H; 
		if(LED_RAM[2]&0x10) PIN_SEGE=H; 
		if(LED_RAM[2]&0x20) PIN_SEGF=H; 
		if(LED_RAM[2]&0x40) PIN_SEGG=H; 
        if(LED_RAM[2]&0x80) PIN_SEGM=H; 
		PIN_DIG3=L;
        break;

        case 3:
        if(LED_RAM[3]&0x01) PIN_SEGA=H; 
		if(LED_RAM[3]&0x02) PIN_SEGB=H;  
		if(LED_RAM[3]&0x04) PIN_SEGC=H; 
		if(LED_RAM[3]&0x08) PIN_SEGD=H; 
		if(LED_RAM[3]&0x10) PIN_SEGE=H; 
		if(LED_RAM[3]&0x20) PIN_SEGF=H; 
		if(LED_RAM[3]&0x40) PIN_SEGG=H; 
		PIN_DIG4=L;
        break;
    }
    LEDScanIndex++;
    if(LEDScanIndex>=4)
    {
        LEDScanIndex=0;
    }
}

void DisplayIcon(uint8 sel,uint8 seg,bit sta)
{
    if(sta)
    {
        LED_RAM[sel]|=seg;
    }
    else
    {
        LED_RAM[sel]&=(~seg);
    }
}

void DisplayPro()
{
    LED_RAM[0]=0;
    LED_RAM[1]=0;
    LED_RAM[2]=0;
    LED_RAM[3]=0;
    if(!AllLedFlag)
    {
        if(!USBErrFlag)//充电异常
        {

        }
        else
        {
            SwitchCnt++;
            if(SwitchCnt>=50)
            {
                SwitchCnt=0;
                LedSwitchFlag=~LedSwitchFlag;
            }
            if(LedSwitchFlag)
            {
                DisplayIcon(Sel3,LED_M12,on);
            }
        }
    }
    else
    {
        LED_RAM[0]=0XFF;
        LED_RAM[1]=0XFF;
        LED_RAM[2]=0XFF;
        LED_RAM[3]=0XFF;
    }
}

void USBLedPro()
{
    if(USBFlag)//充电正常
    {
        if(BatPercent<90)
        {
            DisplayIcon(Sel0,LED_M3,on);//充电中
        }
        else if(BatPercent>=90)
        {
            DisplayIcon(Sel1,LED_M4,on);//已充满
        }
        DisplayIcon(Sel3,LED_M5,on);//分
        DisplayIcon(Sel2,LED_M7|LED_M8,on);//可使用时间
    }
}

void WorkLedPro()
{
    if(OnOffFlag)
    {
        OnOffCnt++;
        if(OnOffCnt>=200)
        {
            OnOffCnt=0;
            OnOffFlag=0;
            if(WorkFlag)
            {
                WorkSec=0;
                WorkMin=0;
            }
        }
        /*充电中的话把矛盾的灯关掉*/
        if(USBFlag)
        {
            DisplayIcon(Sel2,LED_M7|LED_M8,off);//可使用时间
            DisplayIcon(Sel3,LED_M5,off);//分
        }
        if(WorkMin!=0)
        {
            DisplayIcon(Sel0,LEDNumbArr[WorkMin/10],on);
            DisplayIcon(Sel1,LEDNumbArr[WorkMin%10],on);//数字
            DisplayIcon(Sel2,LED_M1|LED_M2,on);//本次使用时间
            DisplayIcon(Sel3,LED_M5,on);//分
        }
        else
        {
            DisplayIcon(Sel0,LEDNumbArr[WorkSec/10],on);
            DisplayIcon(Sel1,LEDNumbArr[WorkSec%10],on);//数字
            DisplayIcon(Sel2,LED_M1|LED_M2,on);//本次使用时间
            DisplayIcon(Sel3,LED_M6,on);//秒
        }
    }
    else
    {
        if(WorkFlag)
        {
            DisplayIcon(Sel0,LEDNumbArr[BatPercent/10],on);
            DisplayIcon(Sel1,LEDNumbArr[BatPercent%10],on);//数字
            DisplayIcon(Sel3,LED_M5,on);//分
            DisplayIcon(Sel2,LED_M7|LED_M8,on);//可使用时间
        }
    }
}

void LowBatLedPro()
{
    static uint8 SwitchCnt=0;
    static bit LedSwitchFlag=0;
    if(BatPercent<10)
    {
        SwitchCnt++;
        if(SwitchCnt>=50)
        {
            SwitchCnt=0;
            LedSwitchFlag=~LedSwitchFlag;
        }

    }
    else if(BatPercent>=10&&BatPercent<90&&USBFlag)
    {
        LedSwitchFlag=1;
    }
    else if(BatPercent>=90)
    {
        LedSwitchFlag=0;
    }
    if(LedSwitchFlag)
    {
        DisplayIcon(Sel3,LED_M11,on);//充电图标
    }
}

void CleanLedPro()
{
    static uint8 SwitchCnt=0,SwitchNumb=0;
    static bit LedSwitchFlag=0;
    if(CleanFlag)
    {
        SwitchCnt++;
        if(SwitchCnt>=50)
        {
            SwitchCnt=0;
            LedSwitchFlag=~LedSwitchFlag;
            if(!LedSwitchFlag)
            {
                SwitchNumb++;
                if(SwitchNumb>=10)
                {
                    SwitchNumb=0;
                    CleanFlag=0;
                }
            }
        }
    }
}

void LockPro()
{
    static uint8 StartSwitchCnt=0,EndSwitchCnt=0,FailSwitchCnt=0;
    static uint8 Ledcnt=0;
    static bit LedSwitchFlag=0;
    if(!USBFlag)
    {
        if(LockSta.LockStart||LockSta.UnlockStart)
        {
            StartSwitchCnt++;
            if(StartSwitchCnt>=100)
            {
                StartSwitchCnt=0;
                if(LockSta.LockStart)
                {
                    LockNumb++;
                    if(LockNumb>=4)
                    {
                        LockNumb=3;
                    }
                }
                else if(LockSta.UnlockStart)
                {
                     LockNumb--;
                    if(LockNumb<=0)
                    {
                        LockNumb=1;
                    }
                }
            }
            DisplayIcon(Sel0,LEDNumbArr[0],on);
            DisplayIcon(Sel1,LEDNumbArr[LockNumb],on);//数字1、2、3
        }
        else
        {
            StartSwitchCnt=0;
        }
        
        if(LockSta.LockEnd||LockSta.UnlockEnd)
        {
            EndSwitchCnt++;
            if(EndSwitchCnt>=50)
            {
                EndSwitchCnt=0;
                LedSwitchFlag=~LedSwitchFlag;
                if(LedSwitchFlag)
                {
                    DisplayIcon(Sel3,LED_M13,on);//锁图标
                }
                if(!LedSwitchFlag)
                {
                    Ledcnt++;
                    if(Ledcnt>=4)
                    {
                        LockSta.LockEnd=0;
                        LockSta.UnlockEnd=0;
                    }
                }
                if(LockSta.LockEnd)
                {
                    DisplayIcon(Sel2,LED_M15|LED_M16,on);//安全锁已锁定
                }
            }
        }
        else
        {
            Ledcnt=0;
            EndSwitchCnt=0;
        }

        if(LockSta.UnlockFail)
        {
            FailSwitchCnt++;
            if(FailSwitchCnt>=50)
            {
                FailSwitchCnt=0;
                LedSwitchFlag=~LedSwitchFlag;
                if(LedSwitchFlag)
                {
                    DisplayIcon(Sel3,LED_M9|LED_M10,on);
                    DisplayIcon(Sel3,LED_M13,on);
                }
            }
        }
        else
        {
            
        }

        if(LockSta.LockFail)
        {
            LockSta.LockFail=0;
        }
        
    }
}
