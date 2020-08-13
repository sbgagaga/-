#ifndef	_global_variable_H_
#define	_global_variable_H_

#include "K06-43.h"

#define PIN_EN RB5
#define PIN_BEEP RB4
#define PIN_KEY	RB6
#define PIN_USB	RB7
#define PIN_M RC3

/*LED宏定义*/
#define PIN_SEGA RC2
#define PIN_SEGB RC1
#define PIN_SEGC RC0
#define PIN_SEGD RE0
#define PIN_SEGE RA5
#define PIN_SEGF RA4
#define PIN_SEGG RA3
#define PIN_SEGM RA2

#define PIN_DIG1 RB6
#define PIN_DIG2 RB7
#define PIN_DIG3 RA0
#define PIN_DIG4 RA1

#define BeepAlarmUpdate(n,m) alarm_beep_cnt=##n,speed_beep=##m
#define		Pin_Vin_CFG(x,y)		TRISB3=x,WPUB3=y
#define		Pin_BAT_CFG(x,y)		TRISA1=x,WPUA1=y
#define		Pin_IOV_CFG(x,y)		TRISB1=x,WPUB1=y
#define		Pin_KEY_CFG(x,y)		TRISB6=x,WPUB6=y
#define		Pin_USB_CFG(x,y)		TRISB7=x,WPUB7=y
#define 	MotorOff() 				PIN_M=0
#define 	MotorOn() 				PIN_M=1

#define WDT_ON()  WDTCON=0x01	//开看门狗
#define WDT_OFF() WDTCON=0x00	//关看门狗

#define true    1
#define false   0
#define	IN 1
#define	OUT 0

#define AD_AN1  0b00000001
#define AD_AN2  0b00000010
#define AD_AN3  0b00000011
#define AD_AN5  0b00000101 
#define AD_AN8  0b00001000
#define AD_AN9  0b00001001
#define AD_AN10 0b00001010
#define AD_AN11 0b00001011
#define AD_AN13 0b00001101
#define AD_BG	0b00001111

#define uint8 	unsigned char
#define uint16  unsigned int
#define int16	int
#define uint32 	unsigned long

#ifdef	WPZ_DEBUG
	#define BAT_2V6	433
	#define BAT_2V8	467 
	#define BAT_3V0	500
	#define BAT_3V2	533
	#define BAT_3V3	550	
	#define BAT_3V4 567
	#define BAT_3V6	600
	#define BAT_3V8 633
	#define BAT_4V0	667
	#define BAT_4V1	683
	#define BAT_4V2 700
#else
	#define BAT_2V6	217
	#define BAT_2V8	233
	#define BAT_3V0	250
	#define BAT_3V2	267
	#define BAT_3V3	275
	#define BAT_3V4	283
	#define BAT_3V6	300
	#define BAT_3V8	317
	#define BAT_4V0	333
	#define BAT_4V1	342
	#define BAT_4V2 350
	#define USB_4V3 90
	#define USB_6V0 125
#endif

#ifdef		WPZ_DEBUG
  #define	VOLTAGE04V	67
  #define	VOLTAGE07V	117
#else
  #define	VOLTAGE04V	38	//0.045V
  #define	VOLTAGE07V	58	//0.07V
#endif

#endif