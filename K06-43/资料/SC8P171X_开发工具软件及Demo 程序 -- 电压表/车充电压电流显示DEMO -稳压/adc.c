#include "adc.h"


//AD配置，开AD
void Ad_ini(uchar ADCH)
{
	ADCON1 = 0;						//左对齐
	ADCON0 = 0X41 | (ADCH << 2);	//16分频
	asm("nop");
	asm("nop");
	GODONE = 1;					
}



//采样电压子函数
void Adc_v()
{
	uint Ad_temp;
	
	if(GODONE==1)  //如果AD采集错误则返回
	{
		return;
	}
	
	Ad_temp=(ADRESH<<4)+(ADRESL>>4); //12位
	
	if(Adtimes_v==0)   //第一次给Admax_v 0值，给Admin_v最大值
	{
		Admax_v=0;
		Admin_v=0xffff;
	}
	
	if(Ad_temp>Admax_v)
	{
		Admax_v=Ad_temp;
	}
	if(Ad_temp<Admin_v)
	{
		Admin_v=Ad_temp;
	}
	Adsum_v+=Ad_temp;
	if(++Adtimes_v >= 10)
	{
		Adsum_v -= Admax_v;
		Adsum_v -= Admin_v;
		
		Adresult_v = Adsum_v >> 3;		//8次平均值作为最终结果
		
		Adsum_v = 0;
		Admin_v = 0;
		Admax_v = 0;
		Adtimes_v = 0;
	}
	
}


//采样电流子函数
void Adc_i()
{
	uint Ad_temp;
	
	if(GODONE==1)  //如果AD采集错误则返回
	{
		return;
	}
	
	Ad_temp=(ADRESH<<4)+(ADRESL>>4); //12位
	
	if(Adtimes_i==0)
	{
		Admax_i=0;
		Admin_i=0xffff;
	}	
	if(Ad_temp>Admax_i)
	{
		Admax_i=Ad_temp;
	}
	if(Ad_temp<Admin_i)
	{
		Admin_i=Ad_temp;
	}
	
	Adsum_i+=Ad_temp;
	if(++Adtimes_i >= 10)
	{
		Adsum_i -= Admax_i;
		Adsum_i -= Admin_i;
		
		Adresult_i = Adsum_i >> 3;		//8次平均值作为最终结果
		Adsum_i = 0;
		Admin_i= 0;
		Admax_i = 0;
		Adtimes_i = 0;
		
	}

}


//采样基准子函数
void Adc_f()
{
	uint Ad_temp;
	
	if(GODONE==1)  //如果AD采集错误则返回
	{
		return;
	}	

	Ad_temp=(ADRESH<<4)+(ADRESL>>4); //12位
	
	if(Adtimes_f==0)
	{
		Admax_f=0;
		Admin_f=0xffff;
	}
	
	if(Ad_temp>Admax_f)
	{
		Admax_f=Ad_temp;
	}
	if(Ad_temp<Admin_f)
	{
		Admin_f=Ad_temp;
	}
	Adsum_f+=Ad_temp;
	if(++Adtimes_f >= 10)
	{
		Adsum_f -= Admax_f;
		Adsum_f -= Admin_f;
		
		Adresult_f = Adsum_f >> 3;		//8次平均值作为最终结果
		
		Adsum_f = 0;
		Admin_f = 0;
		Admax_f = 0;
		Adtimes_f = 0;
		if(Flag_adok==0)
		{
			Ad_v=Adresult_v;
			Ad_f=Adresult_f;
			Ad_i=Adresult_i;
			Flag_adok=1;
		}
		
	}

}










//AD采集
void Ad_test()
{
	if(Flag_mode)
	{
						
		switch(Dis_step)
		{
			case 0:  //首次从点LCD转到AD采样  开AD通道V_ADCH
				Ad_ini(V_ADCH);
				Dis_step=1;
				break;
			case 1:
				Dis_step=2;//等待AD 转换完毕
				break;
			case 2:
				Adc_v();
				Ad_ini(I_ADCH);
				Dis_step=3;
				break;				
			case 3:
				Dis_step=4;
				break;
			case 4:
				Adc_i();				
				Ad_ini(F_ADCH);
				Dis_step=5;
				break;
			case 5:
				Dis_step=6;
				break;			
			case 6:
				Adc_f();
				Dis_step=0;
				Flag_mode=0;  //转到点LCD屏
				break;			
		}
		
	}
	
}






//AD结果处理
void Ad_deal()
{
	if(Flag_adok)  //每4ms查询一次更新， AD全部出结果需要40ms
	{
		Ad_f_bak=Ad_f;
		Ad_v_bak=Ad_v;
		Ad_i_bak=Ad_i;   //备份数据，防止计算时进中断改变
		Flag_adok=0;
	}
		
	if(Ad_f_bak)
	{	
		V_value_sum+=((ulong)(Ad_v_bak<<4)*12)/Ad_f_bak;	 
		// 分压电阻为1:15    计算过程为      （1.2/Ad_f_bak）=（V/16 /Ad_v_bak)   算出来后再放大10倍即可
							
		I_value_sum+=((Ad_i_bak*6000)/Ad_f_bak)*100/119;
		// 电流电阻为30m欧   计算过程为       （1.2/Ad_f_bak）=（V /Ad_I_bak)   I=V/R  算出来后放大100倍
		//后面*100/119为偏差修正
 		if(++IV_count>=16)
		{
			IV_count=0;
			I_value=I_value_sum>>4;
			V_value=V_value_sum>>4;
			I_value_sum=0;
			V_value_sum=0;
			
		}
		
		
		if(++Dis_updata_count>=500) //每2S刷新一次
		{
			Dis_updata_count=0;
			
			Code1_baki=Table_code[I_value/100]|0x80;
			Code2_baki=Table_code[I_value%100/10];
			Code3_baki=Table_code[I_value%10];
						
			Code1_bakv=Table_code[V_value/100];
			Code2_bakv=Table_code[V_value%100/10]|0x80;
			Code3_bakv=Table_code[V_value%10];
			if(Code1_bakv==0x3f)  Code1_bakv=0;
					
		}
	
		
		Flag_update=0;
		if(Code2_bakv>0)   
		{
			if(I_value>0)  //接上负载后如果有电流 则3s交替显示
			{
				conv_time++;
				if(conv_time>=750)
				{
					conv_time=0;
					if(Flag_conv==0)
					{
						Code1_bak=Code1_baki;
						Code2_bak=Code2_baki;
						Code3_bak=Code3_baki;
						Flag_conv=1;
					}
					else
					{
						Code1_bak=Code1_bakv;
						Code2_bak=Code2_bakv;
						Code3_bak=Code3_bakv;
						Flag_conv=0;
					}
				}
			}
			else
			{
				conv_time=0;
				Flag_conv=0;
				Code1_bak=Code1_bakv;
				Code2_bak=Code2_bakv;
				Code3_bak=Code3_bakv;
			}
		}
		Flag_update=1;
	
	}
}
		



	
	
