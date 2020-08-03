#include "ADC.h"

uint8 ADCState=0;
uint16 ADCVal[4]={0};//bg、current、Vbat、Vusb
uint16 ADmax=0,ADmin=0,ADsum=0;
uint8 ADcnt=0;
TYPE_STRUCT_AD ADCModule={&ADmax,&ADmin,&ADsum,&ADcnt};

void ADCPro()
{
    switch (ADCState)
    {
        case 0://内部参考电压采样
        ADCRead(AD_BG,ADCModule,ADCVal);
        break;

        case 1://过流采样
        ADCRead(AD_AN10,ADCModule,ADCVal+1);
        break;

        case 2://电池电压采样
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
		ad_temp=(AD_H<<4)|(AD_L>>4);  //12位ad
	
		if(ad_temp > *Module.ADCmax)
        {
            *Module.ADCmax = ad_temp;//AD采样最大值
        }					
		if(ad_temp < *Module.ADCmin)
        {
            *Module.ADCmin = ad_temp;//AD采样最小值
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
                *Val=*Module.ADCSum;//内部参考电压
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
函数名称：ADSample()
函数功能：AD采样函数
入口参数：ADCH,AD通道
出口参数：ADRESH,ADRESL
备    注：采样成功返回1，超时返回0
************************************************************/
uint8 ADSample(uint8 ch)
{
	ADCON1 = 0x00;					//左对齐
	ADCON0 = 0X41 | ( ch << 2);	//16分频
	asm("nop");
	asm("nop");
	GODONE = 1;						//开始转换
	volatile unsigned char i = 0;
	while(GODONE)
	{
		if(0 == (--i))				//ad等待限时，防止拔插电后出现死循环
			return 0;
	}
	return 1;
}
