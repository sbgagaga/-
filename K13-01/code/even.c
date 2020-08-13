#include "even.h"

uint8 cnt2ms=0;
uint8 cnt10ms=0;
bit time2ms=0;
bit time10ms=0;

void interrupt Isr_Timer()
{
    TMR2IF = 0;
    cnt2ms++;
    cnt10ms++;
    if(cnt2ms>=10)
    {
        LEDScan();
        cnt2ms=0;
        time2ms=1;
    }
    if(cnt10ms>=50)
    {
        cnt10ms=0;
        time10ms=1;
    }
}












