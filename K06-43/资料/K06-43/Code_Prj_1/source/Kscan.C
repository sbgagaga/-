#include "source_h\common.h"

/**********************************************************************************                                   
* 描述: 按键初始化；
* 笔记: 
***********************************************************************************/
void Btn_Init(void)
{
	
}

/**********************************************************************************                                   
* 描述: 输入检测，按键检测
* 笔记: 
***********************************************************************************/
void BtnScan(void)
{
	ReadKeyTmp=0;

	if(Flag_key_usb) ReadKeyTmp&=~(1<<0); else ReadKeyTmp|=(1<<0);
	if(Flag_key_set) ReadKeyTmp&=~(1<<1); else ReadKeyTmp|=(1<<1);
	//Flag_PIN_BANK=0;

	if(ReadKeyOld==ReadKeyTmp)//消抖；
	{
	//	KeyTrg=ReadKeyTmp&(ReadKeyTmp^ReadKey);
		ReadKey=ReadKeyTmp;
		if((ReadKey&KEY_SET)!=KEY_SET) { Flag_Btn_Release=1; Flag_key_long=0;}//按键释放状态,长按键标志为0；
	}
	ReadKeyOld=ReadKeyTmp;
}



