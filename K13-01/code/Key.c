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
	/*°´¼üÅÐ¶Ï*/
	if(KeyPress&&KeyCnt<10&&KeyInBuf==KeyPress&&!IovFlag&&(!LowBatFlag||USBFlag))
	{
		KeyCnt++;
		if(KeyCnt>=10)
		{
			WorkFlag=~WorkFlag; 
			if(!WorkFlag&&WorkMin!=0&&!USBFlag&&!LockSta.LockFlag)
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
	else if(KeyPress&&KeyCnt>=10&&KeyCnt<250&&KeyInBuf==KeyPress&&!USBFlag)
	{
		KeyCnt++;
		if(KeyCnt>=250)
		{
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
			}
			else
			{
				LockSta.UnlockStart=0;
				LockSta.UnlockEnd=1;
				WorkFlag=1;
			}
		}
	}
	else if(!KeyPress||KeyInBuf!=KeyPress)
	{
		KeyCnt=0;
		LockSta.UnlockEnd=0;
		if((LockSta.LockFlag&&WorkFlag)||LockSta.UnlockStart)
		{
			LockSta.UnlockStart=0;
			LockSta.UnlockFail=1;
			WorkFlag=0;
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
	/*USBÅÐ¶Ï*/
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

