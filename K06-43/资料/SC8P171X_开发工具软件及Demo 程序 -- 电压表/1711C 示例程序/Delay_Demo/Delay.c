/**********************************************************
��ʱ����ʹ�÷���
**********************************************************/

#include <sc.h>

#ifndef _XTAL_FREQ
 #define _XTAL_FREQ 8000000			//8Mhz,ʹ��������ʱ�������붨����Ƶ
#endif

//΢�뼶�Ǿ�׼��ʱ����
void DelayXus(unsigned char x)
{
	while(--x);
}

//���뼶�Ǿ�׼��ʱ����
void DelayXms(unsigned char x)
{
	unsigned char i = 0;;
	
	while(--x)
	{
		asm("clrwdt"); 
		while(--i)
		{
			asm("nop");
			asm("nop");
			asm("nop");
			asm("nop");
		}
	}
}

void main(void)
{
	DelayXms(50);
	while(1)
	{
		NOP();
		_delay(1000);		//��ʱ1000ָ������(���������ú���)
		CLRWDT();
		__delay_us(400);	//��ʱ400us(���������ú���)
		CLRWDT();
		__delay_ms(2);		//��ʱ2ms(���������ú���)
		CLRWDT();
	}
}

