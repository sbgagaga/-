#include "Key.h"

bit KeyInFlag=0,USBInFlag=0;
bit KeyInBuf=0;
bit KeyFlag=0;
bit KeyLock=0,USBLock=0;
uint16 KeyCnt=0;
int16 USBCnt=0;

void KeyScan()
{
	Pin_KEY_CFG(IN,true);
	Pin_USB_CFG(IN,true);
	asm("nop");	asm("nop"); 
	if(PIN_KEY)
	{
		KeyInFlag=0;
	}  
	else
	{
		KeyInFlag=1;
	}
	if(PIN_USB)
	{
		USBInFlag=0;
	}  
	else
	{
		USBInFlag=1;
	}
	asm("nop");	asm("nop"); 
	Pin_KEY_CFG(OUT,false);
	Pin_USB_CFG(OUT,false);

	/*°´¼üÅÐ¶Ï*/
	if(KeyInFlag&&KeyCnt<10&&KeyInBuf==KeyInFlag&&!KeyLock)
	{
		KeyCnt++;
		if(KeyCnt>=10)
		{
			KeyLock=1;
			KeyFlag=1;
		}
	}
	else if(KeyInFlag&&KeyCnt>=10&&KeyCnt<250&&KeyInBuf==KeyInFlag)
	{
		KeyCnt++;
		if(KeyCnt>=250)
		{
			KeyFlag=0;
			if(!LockSta.LockFlag)
			{
				LockNumb=1;
				LockSta.LockStart=1;
			}
			else
			{
				LockNumb=3;
				LockSta.UnlockStart=1;
			}
		}
	}
	else if(KeyInFlag&&KeyCnt>=250&&KeyInBuf==KeyInFlag&&(LockSta.LockStart||LockSta.UnlockStart))
	{
		KeyCnt++;
		if(KeyCnt>=1750)
		{
			KeyCnt=1750;
			LockSta.LockFlag=~LockSta.LockFlag;
			if(LockSta.LockFlag)
			{
				LockSta.LockStart=0;
				LockSta.LockEnd=1;
			}
			else
			{
				LockSta.UnlockStart=0;
				LockSta.UnlockEnd=1;
			}
		}
	}
	else if(!KeyInFlag||KeyInBuf!=KeyInFlag)
	{
		KeyCnt=0;
		KeyLock=0;
		if(KeyFlag==1)
		{
			KeyFlag=0;
			WorkFlag=~WorkFlag; 
			OnOffFlag=1;
		}
		if(LockSta.LockStart)
		{
			LockSta.LockStart=0;
			LockSta.LockFail=1;
		}
		if(LockSta.UnlockStart)
		{
			LockSta.UnlockStart=0;
			LockSta.UnlockFail=1;
		}
	}
	KeyInBuf=KeyInFlag;
	if(LowBatFlag||IovFlag||LockSta.LockFlag||USBErrFlag)
	{
		WorkFlag=0;
	}

	/*USBÅÐ¶Ï*/
	if(USBInFlag&&!USBLock)
	{
		USBCnt++;
		if(USBCnt>=100)
		{
			USBCnt=250;
			USBFlag=1;
			LockFlag=0;
			USBLock=1;
			AllLedFlag=1;
		}
	}
	else if(!USBInFlag)
	{
		USBCnt--;
		if(USBCnt<=0)
		{
			USBCnt=0;
			USBFlag=0;
			USBLock=0;
		}
	}
}

