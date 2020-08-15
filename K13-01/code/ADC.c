#include "ADC.h"

uint8 ADCState=0;
uint16 ADCVal[3]={0};//bg��current��Vbat
uint32 ADsum=0;
uint8 ADcnt=0;

uint8 CurrentCnt=0;

void ADCPro()
{
    switch (ADCState)
    {
        case 0://�ڲ��ο���ѹ����
        ADCRead(AD_BG,ADCVal);
        break;

        case 1://��������
        ADCRead(AD_AN2,ADCVal+1);
        break;

        case 2://��ص�ѹ����
        ADCRead(AD_AN1,ADCVal+2);
        break;
    }
    if(SystemONFlag==0)
    {
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
            BatPercent=ADCVal[2]-BAT_3V0;
        }
    }
    if(ADCVal[2]<BAT_3V0)
    {
        LowBatFlag=1;
    }
    else
    {
        LowBatFlag=0;
    }
    if(ADCVal[1]>VOLTAGE07V)
    {
        CurrentCnt++;
        if(CurrentCnt>=200)
        {
            CurrentCnt=200;
            IovFlag=1;
        }
    }
    else
    {
        CurrentCnt=0;
        IovFlag=0;
    }
}

void Sec1sPro()
{
    static uint8 ActualPercent=0;
    uint8 PercentErr=0;
    uint16 TempPercent=0;

    /*�����������ʱ��*/
    if(USBFlag)
    {
        if(ADCVal[2]<BAT_3V3) 
        {
            TempPercent=0; 
        }
        else if(ADCVal[2]>BAT_4V2)
        {
            TempPercent=99; 
        }
        else
        {
            TempPercent=ADCVal[2]-BAT_3V3;
            TempPercent=TempPercent*4/3;
        }
        if(ActualPercent>TempPercent)
        {
            if(ActualPercent)
            {
                ActualPercent--;
            }
        }
        else if(ActualPercent<TempPercent)
        {
            if(ActualPercent<99)
            {
                ActualPercent++;
            }
        }
        if(ActualPercent>BatPercent)
        {
            PercentErr=ActualPercent-BatPercent;
            if(PercentErr<5)
            {
                BatAddTime=90-15*PercentErr;
            }
            else
            {
                BatAddTime=15;
            }
        }
        else
        {
            BatAddTime=240;
        }
    }

    /*�������ּ���ʱ��*/
    if(WorkFlag)
    {
        if(ADCVal[2]<BAT_3V2) 
        {
            TempPercent=0; 
        }
        else if(ADCVal[2]>BAT_4V0)
        {
            TempPercent=99; 
        }
        else
        {
            TempPercent=ADCVal[2]-BAT_3V2;
        }
        if(TempPercent>=33)
        {
            TempPercent=33+(ADCVal[2]-BAT_3V6)*2; 
        }
        if(ActualPercent>TempPercent)
        {
            if(ActualPercent)
            {
                ActualPercent--;
            }
        }
        else if(ActualPercent<TempPercent)
        {
            if(ActualPercent<99)
            {
                ActualPercent++;
            }
        }
        if(ActualPercent<BatPercent)
        {
            PercentErr=BatPercent-ActualPercent;
            if(PercentErr<5&&ActualPercent)
            {
                BatDecTime=75-15*PercentErr;
            }
            else
            {
                BatDecTime=8;
            }
        }
        else
        {
            BatDecTime=210;
        }
    }
    else
    {
        BatDecTime=210;
    }
}

void ADCRead(uint8 ch,uint16 *Val)
{
	uint16 ad_temp,AD_H,AD_L;

	if(ADSample(ch))
	{
        AD_H=ADRESH;
        AD_L=ADRESL;
		ad_temp=(AD_H<<4)|(AD_L>>4);  //12λad
		ADsum += ad_temp;
		ADcnt++;
		if(ADcnt >= 10)
		{
            ADcnt = 0;	
			ADsum /=10;
            switch (ADCState)
            {
                case 0:
                *Val=ADsum;//�ڲ��ο���ѹ
                break;

                case 1:
                *Val=ADsum*1000/(*(Val-1));//����
                break;

                case 2:
                *Val=ADsum*100/(*(Val-2));//��ص�ѹ
                break;
            }
			ADsum = 0;
            ADCState++;
            if(ADCState>=3)
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
