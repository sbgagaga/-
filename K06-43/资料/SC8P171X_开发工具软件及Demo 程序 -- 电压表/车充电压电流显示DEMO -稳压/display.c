
#include "display.h"


void display()
{
	
	LED1=0;
	LED2=0;
	LED3=0;
	LED4=0;
	LED5=0;
	LED6=0;

	LED6M=1;
	LED5M=1;
	LED4M=1;
	LED3M=1;
	LED2M=1;
	LED1M=1;  //数码管消影

				
	if(Flag_update) //更新显示
	{
		Code1=Code1_bak;
		Code2=Code2_bak;
		Code3=Code3_bak;
	}

	
	if(Flag_mode==0)//点LED与AD采样分开 独立进行
	{
		Dis_step++;	
		if(Dis_step>22) 
		{ 
			Dis_step=0;
			Flag_mode=1;//转去AD采样
		}		
		if(Flag_shan)
		{
			return;
		}		
	}
	else
	{
		return; //如果Flag_mode=1则测AD，不进行点屏
	}

	
	//3位数码管 从高位开始点
	switch(Dis_step)
	{
		
		case 0:
			if(Code1&0x01)//1a
			{
				LED2M=0;
				LED3M=0;
				LED2=1;
				LED3=0;
			}
			break;
		case 1:
			if(Code1&0x02)//1b
			{
				LED2M=0;
				LED4M=0;
				LED2=1;
				LED4=0;
			}
			break;
		case 2:
			if(Code1&0x04)//1c
			{
				LED2M=0;
				LED5M=0;
				LED2=0;
				LED5=1;
			}
			break;
		case 3:
			if(Code1&0x08)//1d
			{
				LED6M=0;
				LED2M=0;
				LED6=0;
				LED2=1;
			}
			break;
		case 4:
			if(Code1&0x10)//1e
			{
				LED5M=0;
				LED2M=0;
				LED5=0;
				LED2=1;
			}
			break;			
		case 5:
			if(Code1&0x20)//1f
			{
				LED2M=0;
				LED3M=0;
				LED2=0;
				LED3=1;
			}
			break;
		case 6:
			if(Code1&0x40)//1G
			{
				LED2M=0;
				LED4M=0;
				LED2=0;
				LED4=1;
			}
			break;
		case 7:
			if(Code2&0x01)//2A
			{
				LED4M=0;
				LED5M=0;
				LED4=0;
				LED5=1;
			}
			break;
		case 8:
			if(Code2&0x02)//2B
			{
				LED5M=0;
				LED3M=0;
				LED5=0;
				LED3=1;				
			}
			break;
		case 9:
			if(Code2&0x04)//2C
			{
				LED4M=0;
				LED5M=0;
				LED4=1;
				LED5=0;				
			}
			break;			
		case 10:
			if(Code2&0x08)//2D
			{
				LED3M=0;
				LED4M=0;
				LED3=1;
				LED4=0;				
			}
			break;
		case 11:
			if(Code2&0x10)//2E
			{
				LED6M=0;
				LED3M=0;
				LED6=1;
				LED3=0;				
			}
			break;			
		case 12:
			if(Code2&0x20)//2F
			{
				LED4M=0;
				LED3M=0;
				LED4=1;
				LED3=0;				
			}
			break;	
		case 13:
			if(Code2&0x40)//2G
			{
				LED5M=0;
				LED3M=0;
				LED5=1;
				LED3=0;				
			}
			break;			
		case 14:
			if(Code2&0x80)//2H
			{
				LED3M=0;
				LED1M=0;
				LED3=1;
				LED1=0;				
			}
			break;			
		case 15:
			if(Code3&0x01)//3A
			{
				LED1M=0;
				LED6M=0;
				LED1=1;
				LED6=0;				
			}
			break;			
		case 16:
			if(Code3&0x02)//3B
			{
				LED3M=0;
				LED6M=0;
				LED3=1;
				LED6=0;				
			}
			break;	
		case 17:
			if(Code3&0x04)//3C
			{
				LED5M=0;
				LED6M=0;
				LED5=1;
				LED6=0;				
			}
			break;
		case 18:
			if(Code3&0x08)//3D
			{
				LED6M=0;
				LED4M=0;
				LED6=1;
				LED4=0;				
			}
			break;
		case 19:
			if(Code3&0x10)//3E
			{
				LED4M=0;
				LED6M=0;
				LED4=1;
				LED6=0;				
			}
			break;	
		case 20:
			if(Code3&0x20)//3F
			{
				LED6M=0;
				LED5M=0;
				LED6=1;
				LED5=0;				
			}
			break;	
		case 21:
			if(Code3&0x40)//3G
			{
				LED1M=0;
				LED5M=0;
				LED1=1;
				LED5=0;				
			}
			break;
		case 22:
			if(Code1&0x80)//1H
			{
				LED2M=0;
				LED1M=0;
				LED2=1;
				LED1=0;				
			}
			break;				
	}
		
	
		
}



void Flash_dis()
{
	if(Flag_flash)
	{
		if(++Flash_count>=125)
		{
			Flash_count=0;
			Flag_shan=~Flag_shan;
		}
	}
	else
	{
		Flag_shan=0;
	}
		
}		
		