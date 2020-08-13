#include "Motor.h"

uint16 WorkCnt=0;
uint16 TimeDecCnt=0;
uint16 TimeAddCnt=0;

void Motor()
{
    if(!WorkFlag)
    {
        MotorOff();
        WorkCnt=0;
        TimeDecCnt=0;
    }
    else if(WorkFlag&&!LockSta.LockFlag)
    {
        MotorOn();
        TimeDecCnt++;
        if(TimeDecCnt>=BatDecTime*100)
        {
            TimeDecCnt=0;
            if(BatPercent)
            {
                BatPercent--;
            }
        }
        WorkCnt++;
        if(WorkCnt>=6000)
        {
            WorkCnt=0;
            if(WorkMin<99)
            {
                WorkMin++;
            }
        }
    }
    if(USBFlag)
    {
        TimeAddCnt++;
        if(TimeAddCnt>BatAddTime*100)
        {
            TimeAddCnt=0;
            if(BatPercent<99)
            {
                BatPercent++;
            }
        }
        if(BatPercent<=BAT_3V0)
        {
            PIN_EN =false;
        }
        else
        {
            PIN_EN =true;
        }
    }
    else
    {
        TimeAddCnt=0;
        PIN_EN =true;
    }
}




