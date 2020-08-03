#ifndef	_global_variable_H_
#define	_global_variable_H_

//#define WPZ_DEBUG  //����ʱ������һ�У�ʵ��оƬע����һ�У�

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
//ע�⣺����ʱ��PORTC������������л�ʱ��Ҫ�ֽ����帳ֵ��ʵ��оƬ������
//�������ʱ��PORTB7,PORTB6��PA7��PA6���棬ʵ����Ҫ�л�������
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

/*��������*/
bit	Flag_boot,     //�ϵ��־
    Flag_on,	   //���ػ���־
	Flag_off,	   //�ػ���־
	Flag_on_boot,  //������ʼ��־
	Flag_lk,	   //������־��1Ϊ����״̬���Ӽ�����ʧЧ
	Flag_lk_set,   //��������������־
	Flag_lk_alarm, //��������
	Flag_iov,	   //������־
//	Flag_scp,	   //��·��־
	Flag_xi,	   //ϴ��־
	Flag_xi_alarm, //ϴ����
	Flag_low,	   //�͵�����־
	Flag_low_alarm,//�͵���������־
	Flag_stop,	   //ͣ����־��
	Flag_beep,
	Flag_beep_boot,//������������ʼ
	Flag_chr,	   //����־
	Flag_chr_boot, //����ʼ��
	Flag_usb;	   //USB�����־


uchar actual_percent, //ʵ�ʵ����ٷֱ�
	  bat_percent,	  //�����ٷֱ�0-100
	  alarm_beep_cnt, //��������������
	  speed_beep,	  //�����������ٶ�
	  time_chr_add,   //������ʱ
	  time_dec_cnt,   //������ʱ
	  time_second,
	  time_minute,
	  timer_1s,
	  timer_boot_cnt; //��ʼ����ʱ��

extern void Init_System();

#endif