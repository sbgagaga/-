#include "even.h"

unsigned int TimerTick=0;
TIMERTICK_STRUCT struct_TimerTick;

void interrupt Isr_Timer()
{
    TMR1IF=0;
    TimerTick++;
    if(TimerTick % 2 == 0)
    {
        struct_TimerTick.flag_2mStick = 1;
    }       
    if(TimerTick % 5 == 0)
    {
        struct_TimerTick.flag_5mStick = 1;
    }
    if(TimerTick % 10 == 0)
    {
        struct_TimerTick.flag_10mStick = 1;
    }
    if(TimerTick % 15 == 0)
    {
        struct_TimerTick.flag_15mStick = 1;
    }
    if(TimerTick % 20 == 0)
    {
        struct_TimerTick.flag_20mStick = 1;
    }
    if(TimerTick %50 == 0)
    {
        struct_TimerTick.flag_50mStick = 1;
    }
    if(TimerTick % 100 == 0)
    {
        struct_TimerTick.flag_100mStick = 1;
        TimerTick=0;
    }
}












