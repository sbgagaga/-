#include "K13-01.h"

void main()
{
    SystemInit();
    while (1)
    {
        Apply();
        asm("clrwdt");
    }
}

