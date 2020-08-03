#ifndef __LED_H__
#define __LED_H__

#include "K06-43.h"

/*
Sel0
LED_M3 充电中

Sel1
LED_M4 已充满

Sel2
LED_M1|LED_M2 本次使用时间
LED_M7|LED_M8 可使用时间
LED_M9|LED_M10 长按3秒解锁
LED_M15|LED_M16 安全锁已锁定

Sel3
LED_M5 分
LED_M6 秒
LED_M11 充电图标
LED_M12 感叹号图标
LED_M13 锁定图标
LED_M14 洗图标
LED_M17 请清洗
*/
#define Sel0	0
#define	LED_M3 0x80

#define Sel1	1
#define	LED_M4 0x80

#define Sel2	2
#define	LED_M1 0x01
#define	LED_M2 0x02
#define	LED_M7 0x04
#define	LED_M8 0x08
#define	LED_M9 0x10
#define	LED_M10 0x20
#define	LED_M15 0x40
#define	LED_M16 0x80

#define Sel3	3
#define	LED_M5 0x01
#define	LED_M6 0x02
#define	LED_M11 0x04
#define	LED_M12 0x08
#define	LED_M13 0x10
#define	LED_M14 0x20
#define	LED_M17 0x40

#define LED_ALL 0xFF

#define H 1
#define L 0
#define on 1
#define off 0

void LEDScan();
void DisplayIcon(uint8 ,uint8 ,bit);
void LowBatLedPro();
void LockPro();

#endif