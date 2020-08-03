#include "Beep.h"

bit BeepFlag=0;
uint8 BeepCnt=0,BeepSpeed=50,BeepTemp=0;

void BeepPro()
{
    if(BeepCnt!=0)
    {
        if(BeepFlag)
        {
            PIN_BEEP=1;
        }
        else
        {
            PIN_BEEP=0;
        }
        BeepTemp++;
        if(BeepTemp>BeepSpeed)
        {
            BeepTemp=0;
            BeepFlag=~BeepFlag;
            if(!BeepFlag)
            {
                BeepCnt--;
            }
        }
    }
    else
    {
        BeepFlag=1;
    }
    
}

