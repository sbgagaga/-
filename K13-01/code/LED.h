#ifndef __LED_H__
#define __LED_H__

#include "K13-01.h"

#define H 1
#define L 0
#define on 1
#define off 0
#define iconLock  0x8000
#define iconErr  0x4000

void DisplayPro();
void WorkLedPro();
void USBLedPro();
void LEDScan();
void DisplayIcon(uint16);
void LockPro();
void ErrPro();

#endif