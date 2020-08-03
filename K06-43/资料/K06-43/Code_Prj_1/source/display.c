#include "source_h\common.h"

/************************************************************
函数名称：
函数功能：底层LED显示驱动
入口参数：
出口参数：
备    注：
************************************************************/
void LedIndex(uchar led_index)
{
	Pin_SEGA=L;	Pin_SEGB=L;	Pin_SEGC=L;	Pin_SEGD=L;	Pin_SEGE=L;	Pin_SEGF=L;	Pin_SEGG=L;
	Pin_DIG1=H;	Pin_DIG2=H;	Pin_DIG3=H;	Pin_DIG4=H;
	switch(led_index)
	{
		case 0:
		Pin_KEY_CFG(IN,PULL);
		Pin_USB_CFG(IN,PULL);
		asm("nop");	asm("nop"); 
		if(Pin_USB) Flag_key_usb=1; else Flag_key_usb=0;
		if(Pin_KEY) Flag_key_set=1; else Flag_key_set=0;
		asm("nop");	asm("nop"); 
		Pin_KEY_CFG(OUT,PULL);
		Pin_USB_CFG(OUT,PULL);
		break;
		case 1:	
		if(LED_RAM[0]&0x01) Pin_SEGA=H; 
		if(LED_RAM[0]&0x02) Pin_SEGB=H;  
		if(LED_RAM[0]&0x04) Pin_SEGC=H; 
		if(LED_RAM[0]&0x08) Pin_SEGD=H; 
		if(LED_RAM[0]&0x10) Pin_SEGE=H; 
		if(LED_RAM[0]&0x20) Pin_SEGF=H; 
		if(LED_RAM[0]&0x40) Pin_SEGG=H; 
		Pin_DIG1=L;
		break;
		case 2:
		if(LED_RAM[1]&0x01) Pin_SEGA=H;
		if(LED_RAM[1]&0x02) Pin_SEGB=H;
		if(LED_RAM[1]&0x04) Pin_SEGC=H;
		if(LED_RAM[1]&0x08) Pin_SEGD=H;
		if(LED_RAM[1]&0x10) Pin_SEGE=H;
		if(LED_RAM[1]&0x20) Pin_SEGF=H;
		if(LED_RAM[1]&0x40) Pin_SEGG=H;
		Pin_DIG2=L;
		break;
		case 3:
		if(LED_RAM[2]&0x01) Pin_SEGA=H;
		if(LED_RAM[2]&0x02) Pin_SEGB=H;
		if(LED_RAM[2]&0x04) Pin_SEGC=H;
		if(LED_RAM[2]&0x08) Pin_SEGD=H;
		if(LED_RAM[2]&0x10) Pin_SEGE=H;
		if(LED_RAM[2]&0x20) Pin_SEGF=H;
		if(LED_RAM[2]&0x40) Pin_SEGG=H;
		Pin_DIG3=L;
		break;
		case 4:
		if(LED_RAM[3]&0x01) Pin_SEGA=H;
		if(LED_RAM[3]&0x02) Pin_SEGB=H;
		if(LED_RAM[3]&0x04) Pin_SEGC=H;
		if(LED_RAM[3]&0x08) Pin_SEGD=H;
		if(LED_RAM[3]&0x10) Pin_SEGE=H;
		if(LED_RAM[3]&0x20) Pin_SEGF=H;
		if(LED_RAM[3]&0x40) Pin_SEGG=H;
		Pin_DIG4=L;
		break;
		default:
		led_index=0;
		break;
	}
}
/************************************************************
函数名称：
函数功能：LED扫描
入口参数：
出口参数：
备    注：
************************************************************/
void LedScan(void)
{
	static  uchar led_scan_index;

//	LED_RAM[0]=0x00; LED_RAM[1]=0x00; LED_RAM[2]=0X10; LED_RAM[3]=0X20;
	led_scan_index++; if(led_scan_index>4) led_scan_index=0; 
	
	LedIndex(led_scan_index);
}
/************************************************************
函数名称：数字显示
函数功能:
入口参数：dis_num:显示的数字0-199; N:显示的位数长度，低位显示优先，0代表不显示；
出口参数：
备    注：
************************************************************/
uchar LED_RAM_R[4];
bit Flag_dig1,
	Flag_dig2;
//	Flag_dig3;
void DisPlayNum(uchar dis_num,uchar dig_sel)
{	
	//if(lenth>3) lenth=3;
	if(dis_num>99) dis_num=99;
	
	Flag_dig1=1;
	Flag_dig2=1; 
//	Flag_dig3=1;
	
	if(dig_sel==0) { Flag_dig1=0; Flag_dig2=0; }
	if(Flag_dig1&&(dig_sel&0x01)) LED_RAM_R[0]=LEDCode[dis_num/10]; else LED_RAM_R[0]=0;
	if(Flag_dig2&&(dig_sel&0x02)) LED_RAM_R[1]=LEDCode[dis_num%10]; else LED_RAM_R[1]=0;
	//if(Flag_dig3&&(lenth&0x04)) LED_RAM_R[2]=LEDCode[dis_num%10]; else LED_RAM_R[2]=0;
}

/************************************************************
函数名称：图标显示
函数功能: 
入口参数：图标段码，图标位码选择，显示状态
出口参数：
备    注：
************************************************************/
void DisPlayIcon(uchar icon_seg,uchar icon_sel,uchar icon_sta)
{
	switch(icon_sel)
	{
		case 0: if(icon_sta){ LED_RAM_R[2]|=icon_seg; LED_RAM_R[3]|=icon_seg; } break; 
		case 1: if(icon_sta)  LED_RAM_R[2]|=icon_seg; break; 
		case 2: if(icon_sta)  LED_RAM_R[3]|=icon_seg; break; 
		default: break; 
	} 
} 
/************************************************************
函数名称：
函数功能：显存更新
入口参数：
出口参数：
备    注：
************************************************************/
bit	Flag_scan_dir,	//充电扫描方向；
	Flag_ledcp_dir; //开机初始时，数码滚动方向；
void LedRamUpdate(void)
{	
	static uchar led_cp_cnt,   //充电灯指向；
				 led_cp,
				 led_boot_cnt,	//
				 alarm_lk_cnt,
				 alarm_xi_cnt, //
				 alarm_low_cnt,
				 timer_chr_boot,
				 chr_boot_cnt;
	static uchar timer_off,
				 timer_add,
				 timer_chr,		//充电定时器；
				 timer_lk,		//锁定定时器
				 timer_xi;  	//洗定时器；
	  
	LED_RAM_R[0]=0; LED_RAM_R[1]=0; LED_RAM_R[2]=0; LED_RAM_R[3]=0;
	
	if(Flag_usb) { Flag_off=0; Flag_lk_set=0; Flag_lk_alarm=0; }
	if(Flag_lk_set) { Flag_on=0; Flag_off=0; Flag_low_alarm=0; }
	if(Flag_on||Flag_low_alarm) Flag_usb=0;

//******充电*************************************	
	if(Flag_usb)
	{
		if(Flag_chr_boot)
		{
			timer_chr_boot++;
			if(timer_chr_boot>=30) 
			{ 
				timer_chr_boot=0; 
				if(Flag_scan_dir) 
				{ chr_boot_cnt++; if(chr_boot_cnt>5) Flag_scan_dir=0; }
				else 
				{ chr_boot_cnt--; if(chr_boot_cnt==0) Flag_chr_boot=0; }
			}
			switch(chr_boot_cnt)
			{
				case 1: DisPlayIcon(ICON_LK|ICON_CHR|ICON_FUL|ICON_XI,ICON2,ON); break;
				case 2: DisPlayIcon(ICON_WZ3,ICON1,ON); break;
				case 3: DisPlayIcon(ICON_WZ2,ICON1,ON); DisPlayIcon(ICON_F|ICON_M,ICON2,ON); break;
				case 4: DisPlayNum(88,DIG_ALL); break;
				case 5: DisPlayIcon(ICON_WZ1,ICON1,ON); break;
				default: break;
			}
		}
		else
		{
			DisPlayNum(bat_percent,DIG_ALL); 
			DisPlayIcon(ICON_WZ2,ICON1,ON); 
			DisPlayIcon(ICON_F,ICON2,ON); 
			if(Flag_chr) 
			{ DisPlayIcon(ICON_CHR,ICON2,ON); } 
			else 
			{ DisPlayIcon(ICON_FUL,ICON2,ON); } 
		}
	}
	else 
	{ 
		Flag_chr_boot=1;
		Flag_scan_dir=1; timer_chr_boot=0; chr_boot_cnt=0; 
	}
//******洗报警*************************************	
	if(Flag_xi_alarm) 
	{
		if(timer_xi<50) { DisPlayIcon(ICON_XI,ICON2,ON); }
		timer_xi++; if(timer_xi>100) { timer_xi=0; alarm_xi_cnt++; 	}
		if(Flag_xi) alarm_xi_cnt=0;
		if(alarm_xi_cnt>=5) Flag_xi_alarm=0;
	}
	else{ alarm_xi_cnt=0; timer_xi=0; }
//******锁定报警*************************************	
	if(Flag_lk_alarm)
	{ 	
		Flag_low_alarm=0; 
		Flag_on=0;
		if(timer_lk<50) { DisPlayIcon(ICON_LK,ICON2,ON); }
		timer_lk++; if(timer_lk>100) { timer_lk=0; alarm_lk_cnt++; }
		if(Flag_key_long) alarm_lk_cnt=0; 
		if(alarm_lk_cnt>=5) Flag_lk_alarm=0; 
	}
	else
	{ alarm_lk_cnt=0; timer_lk=0; }	//初始化锁定参数 
//******锁定设置*************************************
	if(Flag_lk_set){ 
		if(Flag_lk) DisPlayIcon(ICON_WZ3,ICON1,ON); 
		DisPlayIcon(ICON_M,ICON2,ON); 
		DisPlayNum(lock_count_down,DIG_GW); 
	} 
//******开机时*************************************
	if(Flag_on)
	{
		DisPlayIcon(ICON_WZ2,ICON1,ON);
		DisPlayIcon(ICON_F,ICON2,ON);
		if(Flag_on_boot)
		{
			timer_add++;
			if(timer_add>=20) 
			{ 
				timer_add=0;
				if(Flag_ledcp_dir) 
				{ led_cp_cnt++;if(led_cp_cnt>2){led_cp_cnt=2;Flag_ledcp_dir=0;led_boot_cnt++;} }
				else
				{ led_cp_cnt--;if(led_cp_cnt==0){ led_cp_cnt=0; Flag_ledcp_dir=1;} }
				if(led_boot_cnt>=3) Flag_on_boot=0;//滚动显示3次后退出开机初始化；
				
				if(led_cp_cnt==0) led_cp=DIG_OFF;
				if(led_cp_cnt==1) led_cp=DIG_GW;
				if(led_cp_cnt==2) led_cp=DIG_GW|DIG_SW;
			}
			DisPlayNum(bat_percent,led_cp);
		}
		else { DisPlayNum(bat_percent,DIG_ALL); } 
		//DisPlayNum(ad_current,DIG_ALL); 
		//DisPlayNum(actual_percent,DIG_ALL);
	}
	else if(Flag_low_alarm) //低电压报警
	{
		DisPlayIcon(ICON_WZ2,ICON1,ON); 
		DisPlayIcon(ICON_F,ICON2,ON); 
		if(timer_add<100) { DisPlayNum(bat_percent,DIG_ALL); DisPlayIcon(ICON_CHR,ICON2,ON); }
		timer_add++; if(timer_add>200) { timer_add=0; alarm_low_cnt++; } 
		if(alarm_low_cnt>4) Flag_low_alarm=0; 
		if(Flag_low) alarm_low_cnt=0; 
	}
	else 
	{ 
		Flag_on_boot=1; Flag_ledcp_dir=1; led_cp=0; led_cp_cnt=0; led_boot_cnt=0; 
		timer_add=0; alarm_low_cnt=0; 
	}
//******关机时*************************************
	if(Flag_off)
	{
		timer_off++; if(timer_off>=250) Flag_off=0;
		DisPlayIcon(ICON_WZ1,ICON1,ON);
		if(time_minute) 
		{
			DisPlayNum(time_minute,DIG_ALL);
			DisPlayIcon(ICON_F,ICON2,ON);
		}
		else
		{
			DisPlayNum(time_second,DIG_ALL);
			DisPlayIcon(ICON_M,ICON2,ON);
		}
	}
	else timer_off=0;
//******显示更新*************************************	
	LED_RAM[0]=LED_RAM_R[0];
	LED_RAM[1]=LED_RAM_R[1];
	LED_RAM[2]=LED_RAM_R[2];
	LED_RAM[3]=LED_RAM_R[3];
}






