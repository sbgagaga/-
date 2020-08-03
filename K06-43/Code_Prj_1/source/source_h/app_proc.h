#ifndef	_APP_PROC_H_
#define	_APP_PROC_H_

#define MotorOn() Pin_M=1; Pin_LED=L
#define MotorOff() Pin_M=0; Pin_LED=H

extern void AppMotor(void);
extern void AppChr(void);
extern uchar lock_count_down;	//µ¹¼ÆÊý£»
extern void LockSet(void);

#define BeepAlarmUpdate(n,m) alarm_beep_cnt=##n,speed_beep=##m
extern void BeepProc();

extern void TimeAddDec(uint bat_value); 

#endif

