#include "ADC.h"

uint8 ADCState=0;
uint16 ADCVal[4]={0};//bg��current��Vbat��Vusb
uint16 ADmax=0,ADmin=0,ADsum=0;
uint8 ADcnt=0;
TYPE_STRUCT_AD ADCModule={&ADmax,&ADmin,&ADsum,&ADcnt};

void ADCPro()
{
    switch (ADCState)
    {
        case 0://�ڲ��ο���ѹ����
        ADCRead(AD_BG,ADCModule,ADCVal);
        break;

        case 1://��������
        ADCRead(AD_AN10,ADCModule,ADCVal+1);
        break;

        case 2://��ص�ѹ����
        ADCRead(AD_AN8,ADCModule,ADCVal+2);
        break;

        case 3:
        ADCRead(AD_AN9,ADCModule,ADCVal+3);
        break;

        default:
            break;
    }

    if(ADCVal[2]<BAT_3V2) 
    {
        BatPercent=0; 
    }
    else if(ADCVal[2]>BAT_4V2)
    {
        BatPercent=99; 
    }
    else
    {
        BatPercent=ADCVal[2]-BAT_3V2;
    }

    if(ADCVal[2]<BAT_3V0)
    {
        LowBatFlag=1;
    }
    else
    {
        LowBatFlag=0;
    }

    if((ADCVal[3]<USB_4V3||ADCVal[3]>USB_6V0)&&USBFlag)
    {
        USBErrFlag=1;
    }
    else
    {
        USBErrFlag=0;
    }
    
}

void ADCRead(uint8 ch,TYPE_STRUCT_AD Module,uint16 *Val)
{
	uint16 ad_temp,AD_H,AD_L;

	if(ADSample(ch))
	{
        AD_H=ADRESH;
        AD_L=ADRESL;
		ad_temp=(AD_H<<4)|(AD_L>>4);  //12λad
	
		if(ad_temp > *Module.ADCmax)
        {
            *Module.ADCmax = ad_temp;//AD�������ֵ
        }					
		if(ad_temp < *Module.ADCmin)
        {
            *Module.ADCmin = ad_temp;//AD������Сֵ
        }	
			
		*Module.ADCSum += ad_temp;
		(*Module.ADCCnt)++;
		if(*Module.ADCCnt >= 10)
		{
            *Module.ADCCnt = 0;	
			*Module.ADCSum = *Module.ADCSum - *Module.ADCmax - *Module.ADCmin;
			*Module.ADCSum = *Module.ADCSum >> 3;
            switch (ADCState)
            {
                case 0:
                *Val=*Module.ADCSum;//�ڲ��ο���ѹ
                break;

                case 1:
                *Val=(*Module.ADCSum)*1000/(*(Val-1));//
                break;

                case 2:
                *Val=(*Module.ADCSum)*100/(*(Val-2));//
                break;

                case 3:
                *Val=(*Module.ADCSum)*100/(*(Val-3));//
                break;
            
                default:
                break;
            }
            *Module.ADCmax = 0x0000;
			*Module.ADCmin = 0xffff;
			*Module.ADCSum = 0;
            ADCState++;
            if(ADCState>=4)
            {
                ADCState=0;
            }
		}
	}
}

/************************************************************
�������ƣ�ADSample()
�������ܣ�AD��������
��ڲ�����ADCH,ADͨ��
���ڲ�����ADRESH,ADRESL
��    ע�������ɹ�����1����ʱ����0
************************************************************/
uint8 ADSample(uint8 ch)
{
	ADCON1 = 0x00;					//�����
	ADCON0 = 0X41 | ( ch << 2);	//16��Ƶ
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
