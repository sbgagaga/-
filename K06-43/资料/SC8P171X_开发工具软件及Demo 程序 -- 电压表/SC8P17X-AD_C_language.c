/*
*Define: 通过内部固定基准电压1.2v计算电源
*Author: Li Wei
*Date  : 2017-11-23
*Chip  : SC8P171x
*/

#include <sc.h>

/**************************函数声明**********************/
void system_init(void);
void adc_init(void);
float cal_bat_voltage(unsigned short value);
/********************************************************/

/***********************变量定义***************************/
volatile unsigned short adc_value = 0;//程序中读取出基准电压通道的 AD 值
volatile float chip_voltage = 0;//当前芯片上的电压

volatile unsigned char adc_interupt_flag = 0;//是否产生过AD中断标识
volatile unsigned char adc_read_index = 0;//读AD值的序号

volatile unsigned short adc_value_sum = 0;//存储读取到的AD值的和
volatile unsigned short adc_value_max = 0;//存储读取到的AD最大值
volatile unsigned short adc_value_min = 0;//存储读取到的AD最小值
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
			
			//读AD计数
			adc_read_index++;
			
			//保存读取到的基准电压AD的最大值和最小值
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
				//计算读取基准的AD值。方法为：去掉一个最大值和一个最小值，再取平均数
				adc_value_sum = (adc_value_sum - adc_value_max - adc_value_min) >> 3;
				
				//处理AD的转换结果,得到输入电压
				/*SCMCU C 中描述浮点数是以 IEEE-754 标准格式实现的,
				只是把原标准下的32位长，减少到24位。这24位规定为：
				最高的1位为符号位(23bit), 接着的8位为指数位(15bit-22bit),
				剩下的15位为有效数字位(0bit-14bit).
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
	INTCON = 0;				//禁止中断
	OSCCON = 0x71;			//配置振荡为8M
	INTCON = 0xC0;			//使能中断
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
	//转换成浮点运算
	return (float)(1024.0 * 1.2 / value);
}

//中断服务函数
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



