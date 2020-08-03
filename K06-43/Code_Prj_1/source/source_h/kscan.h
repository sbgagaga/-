#ifndef _KSCAN_H_
#define _KSCAN_H_

#define KEY_USB  0x01
#define KEY_SET  0x02

bit Flag_Btn_Release;	// 开关按键状态；1为释放状态，0为按下状态
bit Flag_key_long;		// 长按键标志
bit Flag_key_usb;
bit Flag_key_set;

extern void Btn_Init(void);

uchar	ReadKey,	//按健值；
//		KeyTrg,		//哪个键触发；
		ReadKeyTmp,
		ReadKeyOld;
extern void BtnScan(void);



#endif