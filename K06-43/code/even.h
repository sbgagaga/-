#ifndef __EVEN_H__
#define __EVEN_H__

#include "K06-43.h"

#define DEF_TICK_2mS    (struct_TimerTick.flag_2mStick  )
#define DEF_TICK_5mS    (struct_TimerTick.flag_5mStick  )
#define DEF_TICK_10mS   (struct_TimerTick.flag_10mStick )
#define DEF_TICK_15mS   (struct_TimerTick.flag_15mStick )
#define DEF_TICK_20mS   (struct_TimerTick.flag_20mStick )
#define DEF_TICK_50mS   (struct_TimerTick.flag_50mStick )
#define DEF_TICK_100mS  (struct_TimerTick.flag_100mStick)

typedef struct
{
    unsigned char flag_2mStick:1;
    unsigned char flag_5mStick:1;
    unsigned char flag_10mStick:1;
    unsigned char flag_15mStick:1;
    unsigned char flag_20mStick:1;
    unsigned char flag_50mStick:1;
    unsigned char flag_100mStick:1;
    unsigned char flag_200mStick:1;
}TIMERTICK_STRUCT;

extern TIMERTICK_STRUCT struct_TimerTick;

void interrupt Isr_Timer();

#endif