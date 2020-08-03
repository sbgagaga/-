#include "source_h\common.h"

/************************************************************
函数名称：
函数功能：剃须刀程序
入口参数：
出口参数：
备    注：
************************************************************/
uchar sta_m,		 	//电机状态；
	  timer_motor,		//定时器；	
	  debance_low_cnt,	//低电压检测;
	  debance_hiov_cnt,	//半过流检测；
	  debance_iov_cnt,	//过流检测；
	  debance_scp_cnt;	//短路检测；
uint time_motor_cnt;	//电机工作时间
uint ad_scp;
void AppMotor(void)
{
	switch(sta_m)
	{
		case 0:	//关机状态；
		Flag_on	 =0;
		Flag_low =0;
		Flag_xi  =0;
		Flag_iov =0;
		MotorOff();
		if((ReadKey&KEY_SET)&&Flag_Btn_Release&&(!Flag_lk)) 
		{
			Flag_Btn_Release	= 0;
			debance_hiov_cnt	= 0;
			debance_iov_cnt		= 0;
			debance_scp_cnt		= 0;
			debance_low_cnt		= 0;
			if(Flag_stop) Flag_low_alarm=1; else { sta_m = 1; MotorOn(); }
			time_second=0;
			time_minute=0;
			Flag_off=0;
			current_val=0;
		}
		break;
		case 1:	//开机状态； 
		MotorOn();
		timer_motor++;
		if(timer_motor>=100)
		{
			timer_motor=0;
			time_motor_cnt++;
			if(time_motor_cnt>=time_dec_cnt) 
			{ 
				time_motor_cnt=0; if(bat_percent) bat_percent--; 
			}
			time_second++; if(time_second>=60) { time_second=0; if(time_minute<60) time_minute++; }
		}
		
		if(bat_percent) { Flag_low=0; Flag_on=1; }
		else {
			if(!Flag_low) { BeepAlarmUpdate(3,50); Flag_low=1; } 
			Flag_on=0; Flag_low_alarm=1; 
		}
		
		//低电压检测
		if(bat_val<BAT_3V0) debance_low_cnt++; else debance_low_cnt=0;
		if(debance_low_cnt>200) { Flag_stop=1; bat_percent=0; }

		//半过流检测
		if(current_val>VOLTAGE04V) debance_hiov_cnt++; else debance_hiov_cnt=0; 
		if(debance_hiov_cnt>250)   { Flag_xi_alarm=1; Flag_xi=1; BeepAlarmUpdate(3,50); }

		//过流检测
		if(current_scp>VOLTAGE07V) debance_iov_cnt++; else debance_iov_cnt=0; 
		if(debance_iov_cnt>200) Flag_iov=1; 
		
		//短路检测
		if(ADSample(AD_AN2))
		{
			ad_scp=(ADRESH<<4)+(ADRESL>>4);  //12位ad
			ad_scp=ad_scp<<1;
			if(ad_scp>ad_bg) debance_scp_cnt++; else debance_scp_cnt=0; //0.6V保护
		}
		if(debance_scp_cnt) { sta_m = 0; BeepAlarmUpdate(1,10); }
		
		if(((ReadKey&KEY_SET)&&Flag_Btn_Release)||Flag_iov||Flag_stop||Flag_lk)
		{
			Flag_Btn_Release = 0;
			sta_m	= 0;
			Flag_low_alarm=0;
			if(Flag_lk) BeepAlarmUpdate(3,25); else { Flag_off= 1; BeepAlarmUpdate(0,25); }
		}
		break;
		default:
		sta_m = 0;
		break;
	}
}
/************************************************************
函数名称：
函数功能：加热程序设置
入口参数：
出口参数：
备    注：
************************************************************/
uchar sta_chr,		 	//加热状态；
	  timer_chr,		//充电定时器；
	  debance_usb_cnt;	//usb检测滤波；
uint  time_chr_cnt;		//充电时间计时；
void AppChr(void)
{
	switch(sta_chr)
	{
		case 0:	
		Flag_usb	=0;
		if(ReadKey&KEY_USB) 
		{
			debance_usb_cnt++;
			if(debance_usb_cnt>20)
			{
				sta_chr		=1;
			//	Flag_chr	=1;
				time_chr_cnt=0;	
			//  timer_chr	=0;
				BeepAlarmUpdate(2,10);
				Flag_low_alarm=0;
			//	bat_percent=100;
			}
		}
		break;
		case 1:
		Flag_usb=1;
		Flag_lk=0;
		Flag_stop=0;
		timer_chr++;
		if(timer_chr>=100)
		{
			timer_chr=0;
			time_chr_cnt++;
			if(time_chr_cnt>=time_chr_add) 
			{ 
				time_chr_cnt=0;
				if(bat_percent<99) bat_percent++;
			}
			if(bat_val<=BAT_3V0) Pin_EN=L; else Pin_EN=H;
		}
		if(bat_percent<99) Flag_chr=1; else Flag_chr=0;  
		
		if(ReadKey&KEY_USB) debance_usb_cnt=0; else debance_usb_cnt++;
		if(debance_usb_cnt>=10)	{ sta_chr=0; Pin_EN=H; time_motor_cnt=0; BeepAlarmUpdate(0,10); }
		break;
		default:
		sta_chr=0;
		break;
	}
}
/************************************************************
函数名称：
函数功能：
入口参数：
出口参数：
备    注:
************************************************************/
uchar 	sta_lock,
		lock_count_down,	//倒计数；
		timer_lock;
void LockSet(void)
{
	switch(sta_lock)
	{
		case 0:
		Flag_lk_set	=0;
		timer_lock	=0;
		//lock_count_down=3;
		if(ReadKey&KEY_SET)
		{
			if(Flag_lk){ Flag_lk_alarm=1; Flag_lk_set=1; lock_count_down=3;}else lock_count_down=4;//如果原来是锁定状态
			Flag_key_long = 1; //长按键标志
			sta_lock=1;
		}
		case 1:
		if(ReadKey&KEY_SET)
		{
			timer_lock++;
			if(timer_lock>=100)
			{
				timer_lock = 0;
				if(lock_count_down) 
				{
					Flag_lk_set=1;
					lock_count_down--; 
					if(lock_count_down==0) 
					{
						Flag_lk=~Flag_lk; 
						if(Flag_lk) Flag_lk_alarm=1; else Flag_lk_alarm=0; 
						Flag_lk_set=0; 
						timer_lock=0; 
						BeepAlarmUpdate(3,25); 
					}
				}
			}
		}
		else sta_lock=0;
		break;
		default:
		sta_lock=0;
		break;
	}
}
/************************************************************
函数名称：
函数功能：
入口参数：
出口参数：
备    注: 
************************************************************/
uchar timer_beep;		//蜂鸣器定时器；
void BeepProc()
{
	if(alarm_beep_cnt) 
	{ 
		if(Flag_beep_boot) { Flag_beep_boot=0; Flag_beep=1; }//蜂鸣器启动初始化
		
		timer_beep++;
		if(timer_beep>speed_beep) { timer_beep=0; Flag_beep=~Flag_beep; if(!Flag_beep) alarm_beep_cnt--; }
	} 
	else 
	{
		timer_beep=0;
		Flag_beep=0;
		Flag_xi	 =0;
		Flag_beep_boot=1;
	}
	
}
/************************************************************
函数名称：
函数功能：
入口参数：
出口参数：
备    注：       		  
************************************************************/
void TimeAddDec(uint bat_value)
{
	uchar percent_err;
	uint tmp_percent;
	
	if(Flag_usb)
	{
		if(bat_value<BAT_3V3) tmp_percent=0;
		else if(bat_value>BAT_4V2) tmp_percent=96;
		else
		{
			tmp_percent=bat_value-BAT_3V3; 
			#ifdef WPZ_DEBUG
			tmp_percent=tmp_percent*2/3; 
			#else
			tmp_percent=tmp_percent*4/3; 
			#endif
		}

		if(actual_percent>tmp_percent) 	{ if(actual_percent) actual_percent--; }
		if(actual_percent<tmp_percent) 	{ if(actual_percent<99) actual_percent++; }
		
		if(actual_percent>bat_percent) 
		{ 
			percent_err=actual_percent-bat_percent; 
			if(percent_err<5) time_chr_add=90-15*percent_err; else time_chr_add=15; 
		}
		else time_chr_add=240;
	}
	
	if(sta_m)
	{
		if(bat_value<BAT_3V2) tmp_percent=0;
		else if(bat_value>BAT_4V0) tmp_percent=99;
		else
		{
			tmp_percent=bat_value-BAT_3V2;
			#ifdef	WPZ_DEBUG
			if(tmp_percent<67) tmp_percent=tmp_percent/2; 	//BAT_3V6-3V2之间转化为33%;
			else tmp_percent=33+(bat_value-BAT_3V6); 
			#else
			if(tmp_percent<33) tmp_percent=tmp_percent; 	//BAT_3V6-3V2之间转化为33%;
			else tmp_percent=33+(bat_value-BAT_3V6)*2; 
			#endif
		}
		
		if(actual_percent>tmp_percent) 	{ if(actual_percent) actual_percent--; }
		if(actual_percent<tmp_percent) 	{ if(actual_percent<99) actual_percent++; }
		
		if(actual_percent<bat_percent)
		{
			percent_err=bat_percent-actual_percent;
			if(actual_percent&&(percent_err<5)) time_dec_cnt=75-15*percent_err; else time_dec_cnt=8;
		}
		else time_dec_cnt=210;
	}
	else time_dec_cnt=210;

}



