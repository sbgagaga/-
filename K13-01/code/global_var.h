#ifndef	_global_variable_H_
#define	_global_variable_H_

#include "K13-01.h"

#define PIN_EN RA5
#define PIN_KEY	RA6
#define PIN_USB	RA7
#define PIN_M RA3
#define PIN_BAT RA1
#define PIN_IOV RA2
#define PIN_GND RA0

/*LED宏定义*/
#define PIN_LED1 RB5
#define PIN_LED2 RB4
#define PIN_LED3 RB3
#define PIN_LED4 RC3
#define PIN_LED5 RC2

#define BeepAlarmUpdate(n,m) alarm_beep_cnt=##n,speed_beep=##m
//#define		Pin_Vin_CFG(x,y)		TRISC1=x,WPUC1=y
#define		Pin_BAT_CFG(x,y)		TRISA1=x,WPUA1=y
#define		Pin_IOV_CFG(x,y)		TRISA2=x,WPUA2=y
#define		Pin_KEY_CFG(x,y)		TRISA6=x,WPUA6=y
#define		Pin_USB_CFG(x,y)		TRISA7=x,WPUA7=y

#define		Pin_LED1_CFG(x,y)		TRISB5=x,WPUB5=y
#define		Pin_LED2_CFG(x,y)		TRISB4=x,WPUB4=y
#define		Pin_LED3_CFG(x,y)		TRISB3=x,WPUB3=y
#define		Pin_LED4_CFG(x,y)		TRISC3=x,WPUC3=y
#define		Pin_LED5_CFG(x,y)		TRISC2=x,WPUC2=y

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

#define int8	char
#define uint8 	unsigned char
#define uint16  unsigned int
#define int16	int
#define uint32 	unsigned long

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

#define	VOLTAGE04V	38	//0.045V
#define	VOLTAGE07V	58	//0.07V

#endif