#include "K06-43.h"

void main()
{
    SystemInit();
    AllLedFlag=1;//�ϵ�ȫ�Ƶ���1s
    while (1)
    {
        Apply();
        asm("clrwdt");
    }
}


