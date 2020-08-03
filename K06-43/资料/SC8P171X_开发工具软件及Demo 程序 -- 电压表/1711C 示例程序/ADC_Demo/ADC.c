/**********************************************************
AD��ⷶ������
**********************************************************/

#include <SC.h>


volatile unsigned int	adresult;

void ADC_Sample(unsigned char adch);
void DelayXms(unsigned char x);


#define _DEBUG			//���Գ�����

/**********************************************************
�������ƣ�AD_Sample
�������ܣ�AD���
��ڲ�����adch - ���ͨ��
���ڲ������� 
��    ע������ͨ������������Ϊģ���
	      ����10��,ȡ�м�˴ε�ƽ��ֵΪ�����������adresult��
**********************************************************/
void ADC_Sample(unsigned char adch)
{
	static unsigned long adsum = 0;
	static unsigned int admin = 0,admax = 0;
	static unsigned char adtimes = 0;
	volatile unsigned int ad_temp;
	ADCON1 = 0;						//�����
	ADCON0 = 0X41 | (adch << 2);	//16��Ƶ
	asm("nop");
	asm("nop");
	GODONE = 1;						//��ʼת��

	unsigned char i = 0;
	while(GODONE)
	{
		if(0 == (--i))
			return;
	}
	
	ad_temp=(ADRESH<<4)+(ADRESL>>4);	//����12λADֵ
	
	if(0 == admax)
	{
		admax = ad_temp;
		admin = ad_temp;
	}
	else if(ad_temp > admax)
		admax = ad_temp;				//AD�������ֵ
	else if(ad_temp < admin)
		admin = ad_temp;				//AD������Сֵ
	
	adsum += ad_temp;
	if(++adtimes >= 10)
	{
		adsum -= admax;
		adsum -= admin;
		
		adresult = adsum >> 3;		//8��ƽ��ֵ��Ϊ���ս��
		
		adsum = 0;
		admin = 0;
		admax = 0;
		adtimes = 0;
	}
}


//ADC���β���
unsigned char ADC_Result(unsigned char adch)
{
	ADCON1 = 0;						//�����
	ADCON0 = 0X41 | (adch << 2);	//16��Ƶ
	asm("nop");
	asm("nop");
	GODONE = 1;						//��ʼת��

	unsigned char i = 0;
	while(GODONE)
	{
		if(0 == (--i))
			return 0;				//ת����ʱ
	}
	return ADRESH;
}
/***********************************************************
�������ƣ�DelayXms
�������ܣ����뼶�Ǿ�׼��ʱ
��ڲ�����x - ��ʱʱ��
���ڲ�����
��    ע��
***********************************************************/
void DelayXms(unsigned char x)
{
	unsigned char i,j;
	for(i=x;i>0;i--)
		for(j=153;j>0;j--);
}

/***********************************************************
main������
***********************************************************/
void main()
{
	asm("nop");
	asm("clrwdt");
	INTCON = 0;				//��ֹ�ж�
	OSCCON = 0X71;			//������Ϊ8M
	
	while(1)
	{
		asm("clrwdt");
		DelayXms(1);

#ifdef _DEBUG		
		ANSELH = 0X20;
		TRISB5 = 1;
		ADC_Sample(13);
		
		unsigned char result;
		
		result = ADC_Result(13);
#endif
	}
}
