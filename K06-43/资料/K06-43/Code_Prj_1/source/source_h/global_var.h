#ifndef	_global_variable_H_
#define	_global_variable_H_

//#define WPZ_DEBUG  //调试时加上这一行，实际芯片注销这一行；

#define		Pin_GND		RA0
#define		Pin_BAT		RA1
#define		Pin_IOV		RA2
#define		Pin_M		RA3
#define		Pin_EN		RA4

#define		Pin_KEY		RB5
#define		Pin_USB		RB4

#define		Pin_DIG1	RB5
#define		Pin_DIG2	RB4
#define		Pin_DIG3	RB3
#define		Pin_DIG4	RB2
#define		Pin_SEGA	RB1
#define		Pin_SEGB	RC3
#define		Pin_SEGC	RC2
#define		Pin_SEGD	RC1
#define		Pin_SEGE	RC0
#define		Pin_SEGF	RE0
#define		Pin_SEGG	RA5

#ifdef		WPZ_DEBUG
  #define	Pin_LED		RA7
  #define	Pin_BEEP	RA6
#else
  #define	Pin_LED		RB7
  #define	Pin_BEEP	RB6
#endif

#define		Pin_GND_CFG(x,y)		TRISA0=x,WPUA0=y
#define		Pin_BAT_CFG(x,y)		TRISA1=x,WPUA1=y
#define		Pin_IOV_CFG(x,y)		TRISA2=x,WPUA2=y
#define		Pin_M_CFG(x,y)			TRISA3=x,WPUA3=y
#define		Pin_EN_CFG(x,y)			TRISA5=x,WPUA5=y
#define		Pin_KEY_CFG(x,y)		TRISB5=x,WPUB5=y
#define		Pin_USB_CFG(x,y)		TRISB4=x,WPUB4=y
//注意：仿真时，PORTC口在输入输出切换时需要字节整体赋值，实际芯片正常；
//另外仿真时，PORTB7,PORTB6用PA7和PA6代替，实际需要切换回来；
#ifdef		WPZ_DEBUG
  #define	Pin_LED_CFG(x,y)	TRISA7=x,WPUA7=y
  #define	Pin_BEEP_CFG(x,y)	TRISA6=x,WPUA6=y
#else
  #define	Pin_LED_CFG(x,y)	TRISB7=x,WPUB7=y
  #define	Pin_BEEP_CFG(x,y)	TRISB6=x,WPUB6=y
#endif

#define	IN 1
#define	OUT 0
#define	PULL 1
#define	NONE 0

/*变量定义*/
bit	Flag_boot,     //上电标志
    Flag_on,	   //开关机标志
	Flag_off,	   //关机标志
	Flag_on_boot,  //开机初始标志
	Flag_lk,	   //锁定标志，1为锁定状态，加减操作失效
	Flag_lk_set,   //锁定解锁操作标志
	Flag_lk_alarm, //锁定报警
	Flag_iov,	   //过流标志
//	Flag_scp,	   //短路标志
	Flag_xi,	   //洗标志
	Flag_xi_alarm, //洗报警
	Flag_low,	   //低电量标志
	Flag_low_alarm,//低电量报警标志
	Flag_stop,	   //停机标志；
	Flag_beep,
	Flag_beep_boot,//蜂鸣器报警初始
	Flag_chr,	   //充电标志
	Flag_chr_boot, //充电初始化
	Flag_usb;	   //USB插入标志


uchar actual_percent, //实际电量百分比
	  bat_percent,	  //电量百分比0-100
	  alarm_beep_cnt, //蜂鸣器报警次数
	  speed_beep,	  //蜂鸣器叫声速度
	  time_chr_add,   //增量定时
	  time_dec_cnt,   //减量定时
	  time_second,
	  time_minute,
	  timer_1s,
	  timer_boot_cnt; //初始化定时器

extern void Init_System();

#endif