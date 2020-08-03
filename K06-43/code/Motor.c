#include "Motor.h"

uint8 WorkCnt=0;

void Motor()
{
    if(!WorkFlag)
    {
        MotorOff();
        WorkCnt=0;
    }
    else
    {
        MotorOn();
        WorkCnt++;
        if(WorkCnt>=100)
        {
            WorkCnt=0;
            if(WorkSec<60)
            {
                WorkSec++;
                WorkTotalSec++;
            }
            else
            {
                WorkSec=0;
                WorkTotalSec=0;
                if(WorkMin<99)
                {
                    WorkMin++;
                }
            }
        }
    }
    if(WorkTotalSec>=60)
    {
        WorkTotalSec=0;
        WorkTotalMin++;
    }
    if(WorkTotalMin>=15)
    {
        WorkTotalMin=0;
        CleanFlag=1;
    }
}



