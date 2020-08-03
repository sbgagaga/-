/*
*Define: ͨ���ڲ��̶���׼��ѹ1.2v�����Դ
*Author: Li Wei
*Date  : 2017-11-23
*Chip  : SC8P171x
*/

#include <sc.h>

/**************************��������**********************/
void system_init(void);
void adc_init(void);
float cal_bat_voltage(unsigned short value);
/********************************************************/

/***********************��������***************************/
volatile unsigned short adc_value = 0;//�����ж�ȡ����׼��ѹͨ���� AD ֵ
volatile float chip_voltage = 0;//��ǰоƬ�ϵĵ�ѹ

volatile unsigned char adc_interupt_flag = 0;//�Ƿ������AD�жϱ�ʶ
volatile unsigned char adc_read_index = 0;//��ADֵ�����

volatile unsigned short adc_value_sum = 0;//�洢��ȡ����ADֵ�ĺ�
volatile unsigned short adc_value_max = 0;//�洢��ȡ����AD���ֵ
volatile unsigned short adc_value_min = 0;//�洢��ȡ����AD��Сֵ
/*************************************************************/

void main(void)
{
	asm("nop");
	asm("clrwdt");
	system_init();
	
	adc_init();
	
	while(1)
	{
		if(adc_interupt_flag)
		{
			adc_interupt_flag = 0;
			
			//��AD����
			adc_read_index++;
			
			//�����ȡ���Ļ�׼��ѹAD�����ֵ����Сֵ
			if(1 == adc_read_index)
			{
				adc_value_max = adc_value;
				adc_value_min = adc_value;
			}
			else
			{
				if(adc_value_max < adc_value) 
					adc_value_max = adc_value;
				if(adc_value_min > adc_value)
					adc_value_min = adc_value;
			}
			
			adc_value_sum += adc_value;
			
			if(adc_read_index > 9)
			{
				adc_read_index = 0;
				//�����ȡ��׼��ADֵ������Ϊ��ȥ��һ�����ֵ��һ����Сֵ����ȡƽ����
				adc_value_sum = (adc_value_sum - adc_value_max - adc_value_min) >> 3;
				
				//����AD��ת�����,�õ������ѹ
				/*SCMCU C ���������������� IEEE-754 ��׼��ʽʵ�ֵ�,
				ֻ�ǰ�ԭ��׼�µ�32λ�������ٵ�24λ����24λ�涨Ϊ��
				��ߵ�1λΪ����λ(23bit), ���ŵ�8λΪָ��λ(15bit-22bit),
				ʣ�µ�15λΪ��Ч����λ(0bit-14bit).
				*/
				chip_voltage = cal_bat_voltage(adc_value_sum);
			}
			else
			{
				asm("nop");
				asm("nop");
				adc_init();
			}
		}
	}
}

void system_init(void)
{
	INTCON = 0;				//��ֹ�ж�
	OSCCON = 0x71;			//������Ϊ8M
	INTCON = 0xC0;			//ʹ���ж�
}

void adc_init(void)
{
	ADCON0 = 0x7D;
	ADCON1 = 0x80;//left:0 right:1
	
	ADIE = 1;
	GODONE = 1;//Start
	
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
}

float cal_bat_voltage(unsigned short value)
{
	//ת���ɸ�������
	return (float)(1024.0 * 1.2 / value);
}

//�жϷ�����
void interrupt ISR(void)
{
	if(ADIF)
	{
		ADIF = 0;
		
		adc_value = 0;
		adc_value |= (ADRESH << 8);//addr: 0x01E;
		adc_value |= ADRESL;//addr: 0x09E
		
		adc_interupt_flag = 1;
	}
}



