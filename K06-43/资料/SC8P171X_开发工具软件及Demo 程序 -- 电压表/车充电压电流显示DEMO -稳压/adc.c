#include "adc.h"


//AD���ã���AD
void Ad_ini(uchar ADCH)
{
	ADCON1 = 0;						//�����
	ADCON0 = 0X41 | (ADCH << 2);	//16��Ƶ
	asm("nop");
	asm("nop");
	GODONE = 1;					
}



//������ѹ�Ӻ���
void Adc_v()
{
	uint Ad_temp;
	
	if(GODONE==1)  //���AD�ɼ������򷵻�
	{
		return;
	}
	
	Ad_temp=(ADRESH<<4)+(ADRESL>>4); //12λ
	
	if(Adtimes_v==0)   //��һ�θ�Admax_v 0ֵ����Admin_v���ֵ
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
		
		Adresult_v = Adsum_v >> 3;		//8��ƽ��ֵ��Ϊ���ս��
		
		Adsum_v = 0;
		Admin_v = 0;
		Admax_v = 0;
		Adtimes_v = 0;
	}
	
}


//���������Ӻ���
void Adc_i()
{
	uint Ad_temp;
	
	if(GODONE==1)  //���AD�ɼ������򷵻�
	{
		return;
	}
	
	Ad_temp=(ADRESH<<4)+(ADRESL>>4); //12λ
	
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
		
		Adresult_i = Adsum_i >> 3;		//8��ƽ��ֵ��Ϊ���ս��
		Adsum_i = 0;
		Admin_i= 0;
		Admax_i = 0;
		Adtimes_i = 0;
		
	}

}


//������׼�Ӻ���
void Adc_f()
{
	uint Ad_temp;
	
	if(GODONE==1)  //���AD�ɼ������򷵻�
	{
		return;
	}	

	Ad_temp=(ADRESH<<4)+(ADRESL>>4); //12λ
	
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
		
		Adresult_f = Adsum_f >> 3;		//8��ƽ��ֵ��Ϊ���ս��
		
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










//AD�ɼ�
void Ad_test()
{
	if(Flag_mode)
	{
						
		switch(Dis_step)
		{
			case 0:  //�״δӵ�LCDת��AD����  ��ADͨ��V_ADCH
				Ad_ini(V_ADCH);
				Dis_step=1;
				break;
			case 1:
				Dis_step=2;//�ȴ�AD ת�����
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
				Flag_mode=0;  //ת����LCD��
				break;			
		}
		
	}
	
}






//AD�������
void Ad_deal()
{
	if(Flag_adok)  //ÿ4ms��ѯһ�θ��£� ADȫ���������Ҫ40ms
	{
		Ad_f_bak=Ad_f;
		Ad_v_bak=Ad_v;
		Ad_i_bak=Ad_i;   //�������ݣ���ֹ����ʱ���жϸı�
		Flag_adok=0;
	}
		
	if(Ad_f_bak)
	{	
		V_value_sum+=((ulong)(Ad_v_bak<<4)*12)/Ad_f_bak;	 
		// ��ѹ����Ϊ1:15    �������Ϊ      ��1.2/Ad_f_bak��=��V/16 /Ad_v_bak)   ��������ٷŴ�10������
							
		I_value_sum+=((Ad_i_bak*6000)/Ad_f_bak)*100/119;
		// ��������Ϊ30mŷ   �������Ϊ       ��1.2/Ad_f_bak��=��V /Ad_I_bak)   I=V/R  �������Ŵ�100��
		//����*100/119Ϊƫ������
 		if(++IV_count>=16)
		{
			IV_count=0;
			I_value=I_value_sum>>4;
			V_value=V_value_sum>>4;
			I_value_sum=0;
			V_value_sum=0;
			
		}
		
		
		if(++Dis_updata_count>=500) //ÿ2Sˢ��һ��
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
			if(I_value>0)  //���ϸ��غ�����е��� ��3s������ʾ
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
		



	
	
