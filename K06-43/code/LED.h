#ifndef __LED_H__
#define __LED_H__

#include "K06-43.h"

/*
Sel0
LED_M3 �����

Sel1
LED_M4 �ѳ���

Sel2
LED_M1|LED_M2 ����ʹ��ʱ��
LED_M7|LED_M8 ��ʹ��ʱ��
LED_M9|LED_M10 ����3�����
LED_M15|LED_M16 ��ȫ��������

Sel3
LED_M5 ��
LED_M6 ��
LED_M11 ���ͼ��
LED_M12 ��̾��ͼ��
LED_M13 ����ͼ��
LED_M14 ϴͼ��
LED_M17 ����ϴ
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