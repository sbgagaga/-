#include "Kscan.h"

void Kscan()
{
	COMEN = 0B00001111;
	TRISA|=0x0F;	
	WPUA=0X0E;
	
	TRISC|=0X0F;

	Delay(10);
	
	Keyflash=0;
	if(!KEY_POWER)
	{
		Keyflash=1;
	}
		else if(!KEY_ADD)
		{
			Keyflash=2;
		}
			else if(!KEY_SUB)
			{
				Keyflash=3;
			}
	
	if(Keyflash)
	{
		if(Keyflash==Keyold)
		{
			
			if(Keyflash!=1)
			{
				if(!Flag_en)
				{
					Flag_keyf=1;
					Flag_en=1;
				}
					
			}
			else
			{
				if(!Flag_en)
				{
					Keyc1++;
					if(Keyc1>=400)
					{
						Keyc1=0;
						Flag_keyf=1;
						Flag_en=1;						
					}
				}
				
			}
			
				
			
		}
		else
		{
			Keyc1=0;
			Keyc++;
			if(Keyc>=5)
			{
				Keyc=0;
				Keyold=Keyflash;
			}
		}
	
	
	}
	else
	{
		Flag_en=0;
		Flag_keyf=0;
		Keyc=0;
		Keyc1=0;
	}
	
	
	
}


void Kdeal()
{
	if(Flag_keyf)
	{		
		Flag_keyf=0;
		
		switch(Keyflash)
		{
			case 1:
			
				Flag_onoff=~Flag_onoff;
				Tempr_setdata=180;	
				Flag_first=0;
				Flag_temprok=0;
				
				break;
			
			case 2:
				if(Tempr_setdata<230)
				{					
					Tempr_setdata+=5;
					Flag_first=0;
					Flag_temprok=0;
				}
				break;
			case 3:
				if(Tempr_setdata>80)
				{					
					Tempr_setdata-=5;
					Flag_first=0;
					Flag_temprok=0;
				}
		}
		
		PID.iSetVal=Temptab[Tempr_setdata];
	}
}
	
	
	


void Delay(uchar k)
{
	uchar i;
	for(i=0;i<k;i++)
	{
		asm("nop");
	}	
}



