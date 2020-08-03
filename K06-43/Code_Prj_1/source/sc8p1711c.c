#include "source_h\common.h"

/************************************************************
�������ƣ�
�������ܣ�GPIO��ʼ��������IO���ó������
��ڲ�����
���ڲ�����
��    ע��
************************************************************/
void GPIO_Init(void)
{
	RBPU=0;//1:��ֹ PORTB ����; 0:�ɶ˿ڵĸ�������ֵʹ�� PORTB ����;
	//���ŷ������ã�1Ϊ���룬0Ϊ���
	
	TRISA =0X00; 		//������ĸ����ǺϷ�ģ�����Ϊ���룬��������
	TRISB =0X00;
	TRISC =0X00;
	TRISE =0X00;  		
	WPUA  =0XFF;
	WPUB  =0XFF;
	WPUC  =0XFF;
	WPUE  =0XFF;
	PORTA =	0X80;			//��ʼ�˿�����Ϊ����ͣ�
	PORTB = 0X80;
	PORTC = 0;
	PORTE = 0;

	Pin_GND=L;
	Pin_EN =H;
	
//	Pin_KEY_CFG(IN,PULL);
//	Pin_USB_CFG(IN,PULL);
	Pin_IOV_CFG(IN,NONE); ANS2=1; //AN2����Ϊģ�����룻
	Pin_BAT_CFG(IN,NONE); ANS1=1; //AN1����Ϊģ�����룻
}

/************************************************************
�������ƣ�ADSample()
�������ܣ�AD��������
��ڲ�����ADCH,ADͨ��
���ڲ�����ADRESH,ADRESL
��    ע�������ɹ�����1����ʱ����0
************************************************************/
unsigned char ADSample(unsigned char adch)
{
	ADCON1 = 0x00;					//�����
	ADCON0 = 0X41 | ( adch << 2);	//16��Ƶ
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
�������ƣ�AdRead(uchar ad_ch)
�������ܣ�����
��ڲ�����ad_chͨ��
���ڲ�����
��    ע������10�Σ�ȥ�������С������ƽ��ֵ
**************************************************************/
void AdRead(uchar ad_ch)
{
	static uchar adtimes;	//����������
	uint ad_temp;

	if(ADSample(ad_ch))
	{
		ad_temp=(ADRESH<<4)+(ADRESL>>4);  //12λad
	
		if(adtimes==0)
		{
			admax = 0x0000;
			admin = 0xffff;
			adsum = 0;
		}
		if(ad_temp > admax)	admax = ad_temp;				//AD�������ֵ
		if(ad_temp < admin)	admin = ad_temp;				//AD������Сֵ
			
		adsum += ad_temp;
		adtimes++;
		if(adtimes >= 10)
		{
			adsum = adsum - admax - admin;
			ad_val = adsum >> 3;		
			adtimes = 0;		
			Flag_ad_done=1;
		}
	}
}
/**************************************************************
�������ƣ�
�������ܣ���ʱ����0.6V��ѹֵ����Դ��ѹ��NTCֵ�����д���
��ڲ�����
���ڲ�����
��    ע��
**************************************************************/
uchar sta_ad;		//����״̬��
uint ad_current;	//����ADֵ��
void AdProc(void)
{
	ulong dat_tmp;
		
	switch(sta_ad)
	{
		case 0: //�ڲ��ο���ѹ����
		AdRead(AD_BG);	
		if(Flag_ad_done){ Flag_ad_done=0; ad_bg=ad_val;	sta_ad=1; }
		break;
		case 1: //��������
		AdRead(AD_AN2);	
		if(Flag_ad_done) 
		{
			Flag_ad_done=0; 
			dat_tmp=ad_val; 
			ad_current=dat_tmp*1000/ad_bg;
			current_scp=ad_current;
			if(ad_current>current_val) current_val++; else { if(current_val) current_val--; }
			sta_ad=2; 
		}
		break;
		case 2: //��ص�ѹ����
		AdRead(AD_AN1);	
		if(Flag_ad_done)
		{
			Flag_ad_done=0;
			//ad_bat=ad_val;
			dat_tmp=ad_val;
			bat_val=dat_tmp*100/ad_bg; 
			sta_ad=0;
		}
		break;
		default:
		sta_ad=0; 
		break;
	}
}
/**************************************************************
�������ƣ������·����
�������ܣ�
��ڲ�����
���ڲ�����
��    ע��
**************************************************************
void IscpTest(void)
{
	uint ad_temp;
	
    if(ADSample(AD_AN2))
	{
	    ad_temp=(ADRESH<<4)+(ADRESL>>4);  //12λad
		ad_temp=ad_temp>>1;
		if(ad_temp>ad_bg) Flag_scp=1; else Flag_scp=0; //0.6V����
	}
}
/**************************************************************
�������ƣ�
�������ܣ�ϵͳ˯��
��ڲ�����
���ڲ�����
��    ע�� 
**************************************************************/
uchar RSleepCnt;
void SysSleep(void)
{
	if(Flag_on||Flag_usb||Flag_off||Flag_low_alarm||Flag_lk_alarm||Flag_xi_alarm||ReadKey) RSleepCnt=0; 
	if(Flag_RtSleep) { Flag_RtSleep=0; RSleepCnt++; }
	if(RSleepCnt>=200) //�޲���2������˯�ߣ�
	{
		RSleepCnt=0;
		asm("clrwdt");
		
		INTCON=0;
		PIE1 = 0;
		PIE2 = 0;	
		PIR1 = 0;
		//��������ǰ�ص����й���ģ��,�Խ������ߵ���
		ADCON0	= 0; //��ֹADC�������Ĺ�������;
		KEYCON0 = 0;
		CCP1CON = 0;
		CCP2CON = 0;
		
		SysSleepSet();
		
		WDT_OFF();
		RBIE=1;				//����PORTB��ƽ�仯�жϣ�
		GIE =0;				//GIE=0ʱ�����Ѻ�ִ��SLEEP�����; GIE=1ʱ�����Ѻ������жϷ���
		IOCB = 0B00110000;	//PB5,PB4���ѣ�
		OSCCON=0X01;		//��������Ϊ32K,�ڲ�;
		RBIF = 0;			//���־
		PORTB;
		asm("sleep");
		asm("nop");
		Init_System();
	}
}
/**************************************************************
�������ƣ�
�������ܣ�ϵͳ˯��
��ڲ�����
���ڲ�����
��    ע�� 
**************************************************************/
void SysSleepSet(void)
{
	RBPU=0;//OPTION_REG.7 1:��ֹ PORTB ����; 0:�ɶ˿ڵĸ�������ֵʹ�� PORTB ����;
	//���ŷ������ã�1Ϊ���룬0Ϊ���
	TRISC =0X00;
	TRISB =0X00;
	TRISA =0X00; 		//������ĸ����ǺϷ�ģ�����Ϊ���룬��������
	TRISE =0X00;  		//��ʼ�˿�����Ϊ�����
	
	WPUA = 0xFF;
	WPUB = 0xFF;
	WPUC = 0xFF;
	WPUE = 0xFF;
	
	PORTA =	0X80;			//��ʼ�˿�����Ϊ����ͣ�
	PORTB = 0X80;
	PORTC = 0;
	PORTE = 0;
	
	Pin_BAT=H;
	Pin_IOV=H;
	Pin_GND=H;
	Pin_EN =L;

	Pin_USB_CFG(IN,PULL);
	Pin_KEY_CFG(IN,PULL);
}





