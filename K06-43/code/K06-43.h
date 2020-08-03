#ifndef __K06_43__
#define __K06_43__

#include <sc.h>
#include "global_var.h"
#include "even.h"
#include "LED.h"
#include "ADC.h"
#include "Key.h"
#include "Motor.h"
#include "Beep.h"

extern uint8 BatPercent;
extern uint8 WorkTotalMin;
extern uint8 WorkTotalSec;
extern uint8 WorkSec;
extern uint8 WorkMin;

extern uint8 LockNumb;
extern TYPE_UNION_LockSta LockSta;

extern bit PowerFlag;
extern bit OnOffFlag;
extern bit CleanFlag;
extern bit WorkFlag;
extern bit IovFlag;
extern bit LowBatFlag;
extern bit USBFlag;
extern bit USBErrFlag;
extern bit AllLedFlag;
extern bit SystemONFlag;

typedef union 
{
    uint8 LockStart:1;
    uint8 LockFail:1;
    uint8 LockEnd:1
    uint8 UnlockStart:1;
    uint8 UnlockFail:1
    uint8 UnlockEnd:1;
    uint8 LockFlag:1
    uint8 reservation:1;
    uint8 LockSta;
}TYPE_UNION_LockSta;


void Apply();
void SystemInit();
void GPIOInit();
void TimerInit();

#endif