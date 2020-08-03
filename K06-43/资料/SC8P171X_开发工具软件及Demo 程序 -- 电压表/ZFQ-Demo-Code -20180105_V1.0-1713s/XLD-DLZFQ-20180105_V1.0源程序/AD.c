#include "AD.h"

/************************************************************
函数名称：AD_Sample
函数功能：AD采样函数
入口参数：ADCH,AD通道
出口参数：ADRESH,ADRESL
备    注：采样成功返回1，超时返回0   
************************************************************/

unsigned char Ad_sample(unsigned char adch)
{

	ADCON1 = 0x00;					//左对齐
	ADCON0 = 0X41 | (adch << 2);	//16分频
	asm("nop");
	asm("nop");
	GODONE = 1;						//开始转换
	volatile unsigned char i = 0;
	while(GODONE)
	{
		if(0 == (--i))				//ad等待限时，防止拔插电后出现死循环
			return 0;
	}
	return 1;
}

/**************************************************************
函数名称：NtcAD_Testing()
函数功能：温度传感器采样函数
入口参数：
出口参数：Flag_Ntc_OneAd，AdResult
备    注：采样NTC的AD值，采样10次，去掉最大及最小求算术平均值 
**************************************************************/
void Ad_testing(uchar i)
{

	uint Ad_temp;
	
    if(Ad_sample(i))
	{
        Ad_temp=(ADRESH<<2)+(ADRESL>>6);  //10位ad
		
		if(0 == Adtimes)
		{
			Admax = 0x0000;
			Admin = 0xffff;
		}
		else if(Ad_temp > Admax)
			Admax = Ad_temp;				//AD采样最大值
		else if(Ad_temp < Admin)
			Admin = Ad_temp;				//AD采样最小值
		
		Adsum += Ad_temp;
		if(++Adtimes >= 10)
		{
			Adsum -= Admax;
			Adsum -= Admin;	
			Adresult = Adsum >> 3;		
			
		    Adsum = 0;
    		Admin = 0;
    		Admax = 0;
    		Adtimes = 0;
			PID.iCurVal=1023-Adresult;			
		    Flag_ntc_onead=1;
		}
	}
	else
	{
		Adsum = 0;
		Admin = 0;
		Admax = 0;
		Adtimes = 0;
	}
	Check_Ntc();
}



void Check_Ntc()
{
	
	if(Flag_ntc_onead)
	{  
		
		if(Adresult>0X3FA)//NTC开路判断
		{   
			Ntcnormaldely=0;
			if(++Ntcopendely>100)
			{
				Flag_rt_open=1;
				Ntcopendely=0;
				Flag_hot = 0;
				
				Flag_err=1;
				
			}
		}
		else if(Adresult<20)//ntc短路判断
		{   
			Ntcnormaldely=0;
			if(++Ntcshortdely>100)
			{
				Flag_rt_short=1;
				Ntcshortdely=0;
				Flag_hot = 0;				
				Flag_err=1;
			}
		}
		else
		{
			
			if ( Flag_rt_short || Flag_rt_open ) //ntc正常判断
			{
				if(++Ntcnormaldely>5)
				{
					Flag_rt_short= 0;
					Flag_rt_open = 0;
					Flag_err=0;
				}
			}					
		}
		
		
			
	
	}
}



void source_v(unsigned char i)  //上电检测电源电压
{	
	uint k,vsum=0;
	uchar vresult,vmax=0,vtimes=0;
	for(k=0;k<2000;k++)
	{
		if(Ad_sample(i))			
		{ 			
			vsum += ADRESH;
			if(++vtimes >= 4)
			{
				vresult = vsum >> 2;
				if(vresult>vmax)
				{
					vmax=vresult;
				}
				vsum = 0;
				vtimes = 0;
				asm("clrwdt");
			}
		}
	}
	
	if(vmax>130)
	{
		Flag_HV=1;
	}
	else
	{
		Flag_HV=0;
	}
				
}




