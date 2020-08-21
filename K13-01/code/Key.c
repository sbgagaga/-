#include "Key.h"

bit KeyInBuf=0;
bit KeyPress=0;
uint16 KeyCnt=0;

bit USBLink=0;

void KeyScan()
{
	if(!PIN_KEY)
	{
		KeyPress=1;
	}
	else
	{
		KeyPress=0;
	}
	/*按键判断*/
	if(KeyPress&&KeyCnt<10&&KeyInBuf==KeyPress&&(!LowBatFlag||USBFlag)&&!LockSta.LockFlag)//非低电压、非锁定、充电
	{
		KeyCnt++;
		if(KeyCnt>=10)
		{
			WorkFlag=~WorkFlag; 
			if(WorkFlag)
			{
				LEDWorkFlag=1;
			}
			if(!WorkFlag&&WorkMin!=0&&!USBFlag)
			{
				OnOffFlag=1;
			}
			else
			{
				OnOffFlag=0;
				WorkMin=0;
			}
		}
	}
	else if(KeyPress&&(KeyCnt>=10||LockSta.LockFlag)&&KeyCnt<250&&KeyInBuf==KeyPress&&!USBFlag)
	{
		KeyCnt++;
		if(KeyCnt>=250||(LockSta.LockFlag&&KeyCnt>=10))
		{
			KeyCnt=250;
			LockNumb=2;
			if(!LockSta.LockFlag)
			{
				LockSta.LockStart=1;
				LockSta.UnlockEnd=0;
			}
			else
			{
				LockSta.UnlockStart=1;
				LockSta.LockEnd=0;
			}
			OnOffFlag=0;
		}
	}
	else if(KeyPress&&KeyCnt>=250&&KeyInBuf==KeyPress&&!LockSta.LockEnd&&!LockSta.UnlockEnd)
	{
		KeyCnt++;
		if(KeyCnt>=1750)
		{
			KeyCnt=1750;
			LockSta.LockFlag=!LockSta.LockFlag;
			if(LockSta.LockFlag)
			{
				LockSta.LockStart=0;
				LockSta.LockEnd=1;
				WorkFlag=0;
				LEDWorkFlag=0;
			}
			else
			{
				LockSta.UnlockStart=0;
				LockSta.UnlockEnd=1;
				WorkFlag=1;
				LEDWorkFlag=1;
			}
		}
	}
	else if(!KeyPress||KeyInBuf!=KeyPress)
	{
		KeyCnt=0;
		LockSta.UnlockEnd=0;
		if(LockSta.LockEnd)
		{
			LockSta.LockEnd=0;
			LockSta.UnlockFail=1;
		}
		if(LockSta.UnlockStart)
		{
			LockSta.UnlockStart=0;
			LockSta.UnlockFail=1;
		}
		if(LockSta.LockStart)
		{
			LockSta.LockStart=0;
		}
	}
	KeyInBuf=KeyPress;

	if(!PIN_USB)
	{
		USBLink=1;
	}
	else
	{
		USBLink=0;
	}
	/*USB判断*/
	if(USBLink&&!IovFlag)
	{
		USBFlag=1;
		LockSta.LockFlag=0;
	}
	else if(!USBLink)
	{
		USBFlag=0;
	}
}

