#ifndef __K13_01__
#define __K13_01__

#include <sc.h>
#include "global_var.h"
#include "even.h"
#include "LED.h"
#include "ADC.h"
#include "Key.h"
#include "Motor.h"

typedef struct 
{
    uint8 LockStart:1;
    uint8 LockFail:1;
    uint8 LockEnd:1;
    uint8 UnlockStart:1;
    uint8 UnlockFail:1;//锁定结束和解锁失败的延迟用
    uint8 UnlockEnd:1;
    uint8 LockFlag:1;
    uint8 reservation:2;
}TYPE_UNION_LockSta;

extern uint8 LockNumb;

extern uint8 BatPercent;
extern uint8 WorkMin;

extern bit LedIovFlag;
extern bit SystemONFlag;
extern bit OnOffFlag;
extern bit WorkFlag;
extern bit IovFlag;
extern bit LowBatFlag;
extern bit USBFlag;
extern bit LEDWorkFlag;
extern TYPE_UNION_LockSta LockSta;
extern uint8 BatAddTime;
extern uint8 BatDecTime;

void SystemSleep();
void Apply();
void SystemInit();
void GPIOInit();
void TimerInit();

#endif