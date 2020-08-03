#include "AD.h"

/************************************************************
�������ƣ�AD_Sample
�������ܣ�AD��������
��ڲ�����ADCH,ADͨ��
���ڲ�����ADRESH,ADRESL
��    ע�������ɹ�����1����ʱ����0   
************************************************************/

unsigned char Ad_sample(unsigned char adch)
{

	ADCON1 = 0x00;					//�����
	ADCON0 = 0X41 | (adch << 2);	//16��Ƶ
	asm("nop");
	asm("nop");
	GODONE = 1;						//��ʼת��
	volatile unsigned char i = 0;
	while(GODONE)
	{
		if(0 == (--i))				//ad�ȴ���ʱ����ֹ�β��������ѭ��
			return 0;
	}
	return 1;
}

/**************************************************************
�������ƣ�NtcAD_Testing()
�������ܣ��¶ȴ�������������
��ڲ�����
���ڲ�����Flag_Ntc_OneAd��AdResult
��    ע������NTC��ADֵ������10�Σ�ȥ�������С������ƽ��ֵ 
**************************************************************/
void Ad_testing(uchar i)
{

	uint Ad_temp;
	
    if(Ad_sample(i))
	{
        Ad_temp=(ADRESH<<2)+(ADRESL>>6);  //10λad
		
		if(0 == Adtimes)
		{
			Admax = 0x0000;
			Admin = 0xffff;
		}
		else if(Ad_temp > Admax)
			Admax = Ad_temp;				//AD�������ֵ
		else if(Ad_temp < Admin)
			Admin = Ad_temp;				//AD������Сֵ
		
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
		
		if(Adresult>0X3FA)//NTC��·�ж�
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
		else if(Adresult<20)//ntc��·�ж�
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
			
			if ( Flag_rt_short || Flag_rt_open ) //ntc�����ж�
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



void source_v(unsigned char i)  //�ϵ����Դ��ѹ
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




