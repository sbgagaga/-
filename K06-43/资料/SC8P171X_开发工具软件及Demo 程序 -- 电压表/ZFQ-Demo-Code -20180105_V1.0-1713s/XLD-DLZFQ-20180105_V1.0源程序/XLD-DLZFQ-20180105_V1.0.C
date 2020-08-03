
#include "main.h"

void Init_System()
{
	asm("nop");
	asm("clrwdt");
	
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;
		
	TRISC =0XFF;
	TRISB =0X3B;
	TRISA =0X00;
	TRISE=0X00;  //端口配置
		
	PORTA = 0;
	PORTB = 0;
	PORTC = 0;				
	LCDCON0 = 0;
		
	INTCON=0;
	OSCCON=0X71;	//晶振配置
	
	
	
}


/************************************************************
函数名称：AcTestZero()
函数功能：交流电过零检测函数
入口参数：
出口参数：
备    注：
************************************************************/
void AcTestZero()
{
	if(Flag_ach)
	{
		if ((!PI_ZERO)&&(!PI_ZERO)&&(!PI_ZERO))
		{
			Flag_ach=0;	
			Flag_zero=1;		
		}
	}
	else
	{
		if (PI_ZERO&&PI_ZERO&&PI_ZERO)
		{
			Flag_ach=1;
			Flag_zero=1;
						
		}
	}		
}



/************************************************************
函数名称：ScrControl()
函数功能：可控硅斩波控制函数。
入口参数：AcSet,可控硅斩波延时时间
		  Flag_hot  可控硅开启标志
		  Flag_zero  过零标志
出口参数：
备    注：       		  
************************************************************/
void ScrControl()
{
	
	if(Flag_hot&&Flag_zero)
	{
		if(Flag_HV)
		{
			if(Flag_vtemp)
			PO_BT1=0;  //开可控硅
		}
		else
			PO_BT1=0;
			
	    Kkg_dly++;
		if(Kkg_dly>=5)  //625us触发时间
		{
			Flag_vtemp=~Flag_vtemp;
			Flag_zero=0;
			Kkg_dly=0;
 			PO_BT1=1;
		}				
	}
	else
	{
		PO_BT1=1;
		Flag_zero=0;
		Kkg_dly=0;
	}
}

/***********************************************************
中断服务函数
函数名称：Isr_Timer()
函数功能：中断处理函数
入口参数：
出口参数：
备    注：125US定时2中断
***********************************************************/
void interrupt Isr_Timer()
{
	if(TMR2IF&&TMR2ON)			//若只使能了一个中断源,可以略去判断
	{
		TMR2IF = 0;
		Maintime++;
		if(Maintime >= 20)
		{
			Maintime = 0;
			Flag_mainloop = 1;		//2.5mS进一次主程序
		}		
		AcTestZero();		//过零检测
		ScrControl();		//可控硅控制

		Tmper_pro(); //实时温度查询
	}
}




void main()
{
	Init_System();  //配置端口
	
	source_v(9);
	
	PIE1=2;
	PR2=250;
	T2CON=4;	
	INTCON=0XC0; //配置定时中断
	
	PID.uKP_Coe=1;
	PID.uKI_Coe=1;
	PID.uKD_Coe=20;  //PID参数
	
	PID.iPriVal=0;
	Tempr_setdata=180;  //上电默认设置180度
	
	while(1)
	{
		if(Flag_mainloop)
		{
			Flag_mainloop = 0;	
			asm("clrwdt");	
			Ad_testing(11);	 //AD检测			
				 	         //按键处理
				
			PID_control();	 //PID算法处理
			Temp_setdeal();	 //温度显示处理	
			Set_disp();		//显示转换
			Kscan();         //按键检测
			Kdeal();
			Disp_Lcd();						
		}
	}
}




void PID_control()
{
	if(Flag_onoff)
	{
		Pid_count++;
		if(Pid_count>=400) //1s钟调用一次PID算法
		{                             
			Pid_count=0;
			PID_operation();
		}
		if(Flag_err==0)
		{
			if(PID.iPriVal==0)
			{
				Flag_hot=0;
			}
			else if((Pid_count>>3)<(PID.iPriVal/10))   //1s钟分50个控制周期  pid算出来的控制量是放大10倍后的量
			{
				Flag_hot=1;
			}
			else
			{
				Flag_hot=0;
			}
		}
		else
		{
			Flag_hot=0;
		}
	}
	else
	{
		Pid_count=0;
		PID.iPriVal=0;
		Flag_hot=0;
		
	}
}

void PID_operation(void)
{
    uint Temp[3] = {0};   //中间临时变量
    uint PostSum = 0;     //正数和
    uint NegSum = 0;      //负数和
    if(PID.iSetVal > PID.iCurVal)                
    {
        if(PID.iSetVal - PID.iCurVal > 100)      
            PID.iPriVal = 500;                  
        else                                    
        {
            Temp[0] = PID.iSetVal - PID.iCurVal;    
            PID.uEkFlag[1] = 0;                     
            
            PID.liEkVal[2] = PID.liEkVal[1];
            PID.liEkVal[1] = PID.liEkVal[0];
            PID.liEkVal[0] = Temp[0];
            
            if(PID.liEkVal[0] > PID.liEkVal[1])            
            {
                Temp[0] = PID.liEkVal[0] - PID.liEkVal[1];  
                PID.uEkFlag[0] = 0;                         
            }                                       
            else
            {
                Temp[0] = PID.liEkVal[1] - PID.liEkVal[0];  
                PID.uEkFlag[0] = 1;                         
            }                        
           
            Temp[2] = PID.liEkVal[1] << 1;                   
            if((PID.liEkVal[0] + PID.liEkVal[2]) > Temp[2]) 
            {
                Temp[2] = (PID.liEkVal[0] + PID.liEkVal[2]) - Temp[2];
                PID.uEkFlag[2]=0;                           
            }                                               
            else                                            
            {
                Temp[2] = Temp[2] - (PID.liEkVal[0] + PID.liEkVal[2]); 
                PID.uEkFlag[2] = 1;                         
            }                                   
            
            Temp[0] = PID.uKP_Coe * Temp[0];        
            Temp[1] = PID.uKI_Coe * PID.liEkVal[0]; 
            Temp[2] = PID.uKD_Coe * Temp[2];        
            
            if(PID.uEkFlag[0] == 0)
                PostSum += Temp[0];                        
            else                                            
                NegSum += Temp[0];                         
            
            if(PID.uEkFlag[1] == 0)     
                PostSum += Temp[1];                         
            else

            if(PID.uEkFlag[2]==0)
                PostSum += Temp[2];             
            else
                NegSum += Temp[2];             
                                  
            PostSum += PID.iPriVal;         
            if(PostSum > NegSum)                
            { 
                Temp[0] = PostSum - NegSum;
                if(Temp[0] < 500 )              
                    PID.iPriVal = Temp[0];
                else 
					PID.iPriVal = 500;     
            }
            else                                
                PID.iPriVal = 0;
        }
    }
    else 
	PID.iPriVal = 0;                       
}


void Temp_setdeal()
{
	if(Flag_onoff)
	{
		//count2=0;
		if(!Flag_first)  //按+ -键后，显示设置温度1S
		{
			Tempr_rank=Tempr_setdata;
			if(Tempr_tdata>=Tempr_setdata)
			{
				Flag_temprdir=0;  //降温
			} 
			else
			{
				Flag_temprdir=1;  //升温
			}
			
			count1=0;	
			Flag_first=1;		
		}
		else
		{
						
			count1++;
			if(count1>=400)
			{
				count1=0;
				if(!Flag_temprok)
				{
					Tempr_rank=Tempr_tdata;
				
					if(Flag_temprdir==0)  //冷却情况下
					{
						if(Tempr_tdata<=Tempr_setdata)
						{
								Flag_temprok=1;
						}
					}
					else
					{
						if(Tempr_tdata>=Tempr_setdata)
						{
								Flag_temprok=1;
						}
					}
				}
				else
				{
					Tempr_rank=Tempr_setdata;
					
				}
			}
						
		}
			
	}
	else
	{
		count1=0;
		Flag_first=0;
	}
	
}




void  Tmper_pro()  //得到实时温度
{
	static uint n=0;
	if(Flag_ntc_onead)
	{
		if(!Flag_step)
		{
			Tmper_temp=PID.iCurVal;
			Flag_step=1;
		}
		else
		{
				
			if(Tmper_temp>Temptab[n])
			{
				n++;
				if(n>=236)
				{
					n=236;   //最高温				
					Tempr_tdata=236;
					Flag_step=0;
				}
			}
			else
			{
				Tempr_tdata=n;	  //真实温度
				n=0;
				Flag_step=0;		
			}
		}
	}
			
}







