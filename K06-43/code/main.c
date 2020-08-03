#include "K06-43.h"

void main()
{
    SystemInit();
    AllLedFlag=1;//上电全灯点亮1s
    while (1)
    {
        Apply();
        asm("clrwdt");
    }
}


