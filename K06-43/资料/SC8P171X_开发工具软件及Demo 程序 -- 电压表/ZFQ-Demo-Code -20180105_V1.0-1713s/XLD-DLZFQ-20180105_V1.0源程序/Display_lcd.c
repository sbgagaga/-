
#include "Display_lcd.h"



void Set_disp()
{
	
	uchar  smg_data1, smg_data2, smg_data3;
	
	Display[0]=0;
	Display[1]=0;
	Display[2]=0;
	Display[3]=0;

    smg_data1 = LCDCode[Tempr_rank/100];      //百位
	smg_data2 = LCDCode[Tempr_rank%100/10];	 //十位
	smg_data3 = LCDCode[Tempr_rank%10];	 //个位
	
		
   if(Flag_onoff)
   {
		if(smg_data1 & 0x01)
			COM3_1;//1a		
		if(smg_data1 & 0x02)
			COM2_1;//1b		
		if(smg_data1 & 0x04)
			COM1_1;//1c	
		if(smg_data1 & 0x08)
			COM0_1;//1D		
		if(smg_data1 & 0x10)
			COM0_0;//1E
		if(smg_data1 & 0x20)
			COM2_0;//1F	
		if(smg_data1 & 0x40)
			COM1_0;//1G		
		
			
		if(smg_data2 & 0x01)
			COM3_3;//2a		
		if(smg_data2 & 0x02)
			COM2_3;//2b		
		if(smg_data2 & 0x04)
			COM1_3;//2c	
		if(smg_data2 & 0x08)
			COM0_3;//2D		
		if(smg_data2 & 0x10)
			COM0_2;//2E
		if(smg_data2 & 0x20)
			COM2_2;//2F	
		if(smg_data2 & 0x40)
			COM1_2;//2G	

		
		if(smg_data3 & 0x01)
			COM3_5;//3a		
		if(smg_data3 & 0x02)
			COM2_5;//3b		
		if(smg_data3 & 0x04)
			COM1_5;//3c	
		if(smg_data3 & 0x08)
			COM0_5;//3D		
		if(smg_data3 & 0x10)
			COM0_4;//3E
		if(smg_data3 & 0x20)
			COM2_4;//3F	
		if(smg_data3 & 0x40)
			COM1_4;//3G
			
		COM3_4;
		COM3_2;	
		
		if(smg_data1==0x3f) 
		{
			Display[0]&=0xfc;
			Display[1]&=0xfc;
			Display[2]&=0xfc;
			Display[3]&=0xfd;
		}
		
			
   }
   else
   {
		Display[0]=0X17;
		Display[1]=0X16;
		Display[2]=0X17;
		Display[3]=0X2A;	  
	/*	Display[0]=0XFF;
		Display[1]=0XFF;
		Display[2]=0XFF;
		Display[3]=0XFF;*/
   }
   
	
}		
	
/***********************************************************
函数名称：Disp_Lcd
函数功能：LCD处理
入口参数：无
出口参数：无
备    注：无
***********************************************************/
void Disp_Lcd() 
{		
	 
		//LCDCON = 0B10000000;  //使能LCD模块、关闭LED模块
		LCDCON0=0B10000000;
		COMEN=0B00001111;
		
		
		WPUA=0X00; 	
		TRISA&=0XF1;	
		
		TRISC=0XFF;
		
		if(Flag_onoff)
		{
			P_LED1=1; //开背光
		}
		else
		{
			P_LED1=0; //关背光
		}

		if(Dcount & 0x01)
		{
			P_SEG1 = 1;
			P_SEG2 = 1;
			P_SEG3 = 1;
			P_SEG4 = 1;
			P_SEG5 = 1;
			P_SEG0 = 1;

		}
		else
		{
			P_SEG1 = 0;
			P_SEG2 = 0;
			P_SEG3 = 0;
			P_SEG4 = 0;
			P_SEG5 = 0;
			P_SEG0 = 0;	
		}
	
		switch(Dcount)
		{	
		case 0:	
								
			disf(0);
			
		
			COMEN =0B00001110;
			TRISC =0B10011110;	 	
			P_COM0 = 0;																		 
			break;		
		case 1:
	
			disf(0);
			
		
			COMEN=0B10001110;
			TRISC=0B10011110;
			P_COM0 = 1;			
			break;
			
		case 2:
								
			disf(1);
			
		
			COMEN=0B00001101;
			TRISC=0B10011101;
			P_COM1 = 0;	
			break;
		case 3:
							
			disf(1);	
			
			COMEN=0B00001101;
			TRISC=0B10011101;
			P_COM1 = 1;	
			break;
		
		case 4:	
								
			disf(2);	
				
			COMEN=0B00001011;
			TRISC=0B10011011;
			P_COM2 = 0;	
			break;
		case 5:
								
			disf(2);	
					
			COMEN=0B00001011;
			TRISC=0B10011011;
			P_COM2 = 1;	
			break;
			
		case 6:
							
			disf(3);
						
			COMEN=0B00000111;
			TRISC=0B10010111;
			P_COM3 = 0;	
			break;
		default:
								
			disf(3);
			
			COMEN=0B00000111;
			TRISC=0B10010111;
			P_COM3 = 1;	
			break;
			
						     					
		}
		Dcount++; 	if(8 <= Dcount)  {Dcount = 0;}
		if(Dcount&0x01)	
			Flag_bit=0;
		else  
			Flag_bit=1;	
}



void disf(uchar a)
{
	
	
	if(Display[a] & 0x01)  {P_SEG0 = Flag_bit;}			 
	if(Display[a] & 0x02)  {P_SEG1 = Flag_bit;}							 
	if(Display[a] & 0x04)  {P_SEG2 = Flag_bit;}
	if(Display[a] & 0x08)  {P_SEG3 = Flag_bit;}					
	if(Display[a] & 0x010)  {P_SEG4 = Flag_bit;}
	if(Display[a] & 0x020)  {P_SEG5 = Flag_bit;}

	
	
}	
