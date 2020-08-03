#ifndef	_MCU_H_
#define	_MCU_H_

#define AD_AN1  0b00000001
#define AD_AN2  0b00000010
#define AD_AN3  0b00000011
#define AD_AN5  0b00000101 
#define AD_AN8  0b00001000
#define AD_AN9  0b00001001
#define AD_AN10 0b00001010
#define AD_AN11 0b00001011
#define AD_AN13 0b00001101
#define AD_BG	0b00001111

#ifdef	WPZ_DEBUG
	#define BAT_2V6	433
	#define BAT_2V8	467 
	#define BAT_3V0	500
	#define BAT_3V2	533
	#define BAT_3V3	550	
	#define BAT_3V4 567
	#define BAT_3V6	600
	#define BAT_3V8 633
	#define BAT_4V0	667
	#define BAT_4V1	683
	#define BAT_4V2 700
#else
	#define BAT_2V6	217
	#define BAT_2V8	233
	#define BAT_3V0	250
	#define BAT_3V2	267
	#define BAT_3V3	275
	#define BAT_3V4	283
	#define BAT_3V6	300
	#define BAT_3V8	317
	#define BAT_4V0	333
	#define BAT_4V1	342
	#define BAT_4V2 350
#endif

#ifdef		WPZ_DEBUG
  #define	VOLTAGE04V	67
  #define	VOLTAGE07V	117
#else
  #define	VOLTAGE04V	38	//0.045V
  #define	VOLTAGE07V	58	//0.07V
#endif

bit Flag_mainloop, 	//主程序循环标志
	Flag_RtSleep;	//睡眠定时器标志
//	Flag_1ms;		//1ms定时标志

uchar 	Rt2ms_cnt,		//2ms定时
		Rt10ms_cnt;		//10ms定时
//		Rt50ms_cnt;		//50ms定时
	
bit Flag_ad_done;		//有效AD值可读取标志；
//	Flag_adbat_done;	//有效电池电压AD检测可读取标志；
//	Flag_adiov_done; 	//有效过流AD检测可读取标志；

uint admax,       	//AD检测相关参数
	 admin,			 
	 adsum,
	 ad_bg,			//参考电压AD值；
	 ad_val,		//有效ad值	
	 current_val,	//电流值
	 current_scp,	//电机卡死电流
	 bat_val;	  	//电池电压

//extern uint ad_current;

#define WDT_ON()  WDTCON=0x01	//开看门狗
#define WDT_OFF() WDTCON=0x00	//关看门狗

extern void GPIO_Init(void);
extern unsigned char ADSample(unsigned char adch);
extern void AdRead(uchar ad_ch);
extern void AdProc(void);
extern void BatProc(void);
extern void IscpTest(void);
extern void SysSleep(void);
extern void SysSleepSet(void);

#endif


