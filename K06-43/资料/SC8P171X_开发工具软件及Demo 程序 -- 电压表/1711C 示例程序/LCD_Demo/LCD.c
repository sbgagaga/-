
/***********************************************************
1/2bias LCD��������������CMS89FXXXϵ��ϵ��оƬ(��������89F6385/6395/2385/2395)
RC0-RC3��ΪLCD������COM�ڣ��������������裻
RA��RE��ΪLCD������SEG�ڣ���LCD.H�ļ���������
ͨ���������LCDʱ��
***********************************************************/
#include <SC.h>
#include "LCD.h"

void SET_DISP(unsigned char*);	//��ʾ����
void LCD_DISP(void);	//LCD��ʾ

unsigned char tcount;	//��ʱ��TMR2ÿ��1���жϼ�1

void main(void)
{
	CLRWDT();		// �忴�Ź�
	OSCCON = 0x71;	// ��������Ϊ����8M
	PORTA = 0;
	TRISA = 0;		//PA�������
	PORTC = 0;
	TRISC = 0XF;	//RC0-RC3ΪLCD��COM��
	PORTE = 0;
	TRISE = 0;
	OPTION_REG = 0;	//����Ԥ��Ƶ����TMR0
	INTCON = 0;		//�ر������ж�
	TMR2 = 124;		//TMR2��ֵ
	T2CON = 4;		//ʹ��TMR2����
	TMR2IE = 1;		// ����TMR2�ж�
	PEIE = 1;		// ���������ж�
	GIE = 1;		// ����ȫ���ж�
	while (1)
	{
		CLRWDT();	// �忴�Ź�
		if(tcount>15)	//125*16=2ms,ÿ2ms��һ����ʾ
		{
			tcount=0;
			LCD_DISP();	//2ms��һ��LCD��ʾ��֧
		}
	}
}

/*****************************************************
�жϺ���������"interrupt"Ϊ�жϹؼ��֣������޸ģ�"isr"Ϊ�û��������֣����޸�
*****************************************************/
static void interrupt isr(void)	
{
	if(TMR2IF)
	{				// TMR2���Զ�����
		TMR2IF = 0;	// ����жϱ�־λ
		tcount++;	//ÿ125us+1
	}
}

/*****************************************************
��ʾ���ú���
��Ҫ��ʾ�����ݸ�������RDATA[0]-RDATA[3]
*****************************************************/
void SET_DISP(unsigned char *RDATA)
{					//ʵ��Ӧ�����޸ĸú������ݣ�����Ҫ��ʾ��ֵ
	*RDATA=0x1;
	*(RDATA+1)=0x2;
	*(RDATA+2)=0x4;
	*(RDATA+3)=0x8;
}
/*****************************************************
LCD��ʾ����
*****************************************************/
void LCD_DISP(void)
{
	static unsigned char dcount;
	unsigned char display[4];
	SET_DISP(display);		//��ʾ����
	
	LCDCON0 = 0B10000000;	//ʹ��LCDģ�� 
	TRISC = 0B00001111;		//PORTC,0~PORTC,3--LCD-COM�� ;PORTC,4--LED-COM��	
	COMEN = 0B00001111;  	//��ӦIO��ΪLED���ܵ�COM��(COM0-COM3)
	dcount++;
	
	switch(dcount&7)
	{	
	case 0:		//COM0����͵�ƽ
		if(display[0] & 0x01)  {P_SEG0 = 1;} else {P_SEG0 = 0;}
		if(display[0] & 0x02)  {P_SEG1 = 1;} else {P_SEG1 = 0;}					 
		if(display[0] & 0x04)  {P_SEG2 = 1;} else {P_SEG2 = 0;}
		if(display[0] & 0x08)  {P_SEG3 = 1;} else {P_SEG3 = 0;}			
		if(display[0] & 0x10)  {P_SEG4 = 1;} else {P_SEG4 = 0;}
		if(display[0] & 0x20)  {P_SEG5 = 1;} else {P_SEG5 = 0;}
		if(display[0] & 0x40)  {P_SEG6 = 1;} else {P_SEG6 = 0;}
		if(display[0] & 0x80)  {P_SEG7 = 1;} else {P_SEG7 = 0;}
		
		P_COM0=0;		//COM0�����
		IO_COM0=0;		//COM0�����		
		DIS_COM0;		//�ر�COM0�ڲ�������ʹ�� 
		break;		
	case 1:		//COM1����͵�ƽ
		if(display[1] & 0x01)  {P_SEG0 = 1;} else {P_SEG0 = 0;}			 
		if(display[1] & 0x02)  {P_SEG1 = 1;} else {P_SEG1 = 0;}							 
		if(display[1] & 0x04)  {P_SEG2 = 1;} else {P_SEG2 = 0;}
		if(display[1] & 0x08)  {P_SEG3 = 1;} else {P_SEG3 = 0;}					
		if(display[1] & 0x10)  {P_SEG4 = 1;} else {P_SEG4 = 0;}
		if(display[1] & 0x20)  {P_SEG5 = 1;} else {P_SEG5 = 0;}
		if(display[1] & 0x40)  {P_SEG6 = 1;} else {P_SEG6 = 0;}
		if(display[1] & 0x80)  {P_SEG7 = 1;} else {P_SEG7 = 0;}
		
		P_COM1=0;		//COM1�����
		IO_COM1=0;		//COM1�����		
		DIS_COM1;		//�ر�COM1�ڲ�������ʹ��
		break;
	case 2:		//COM2����͵�ƽ
		if(display[2] & 0x01)  {P_SEG0 = 1;} else {P_SEG0 = 0;}			 
		if(display[2] & 0x02)  {P_SEG1 = 1;} else {P_SEG1 = 0;}							 
		if(display[2] & 0x04)  {P_SEG2 = 1;} else {P_SEG2 = 0;}
		if(display[2] & 0x08)  {P_SEG3 = 1;} else {P_SEG3 = 0;}					
		if(display[2] & 0x10)  {P_SEG4 = 1;} else {P_SEG4 = 0;}
		if(display[2] & 0x20)  {P_SEG5 = 1;} else {P_SEG5 = 0;}
		if(display[2] & 0x40)  {P_SEG6 = 1;} else {P_SEG6 = 0;}
		if(display[2] & 0x80)  {P_SEG7 = 1;} else {P_SEG7 = 0;}
		
		P_COM2=0;		//COM1�����
		IO_COM2=0;		//COM1�����		
		DIS_COM2;		//�ر�COM1�ڲ�������ʹ��
		break;	
	case 3:		//COM3����͵�ƽ
		if(display[3] & 0x01)  {P_SEG0 = 1;} else {P_SEG0 = 0;}			 
		if(display[3] & 0x02)  {P_SEG1 = 1;} else {P_SEG1 = 0;}							 
		if(display[3] & 0x04)  {P_SEG2 = 1;} else {P_SEG2 = 0;}
		if(display[3] & 0x08)  {P_SEG3 = 1;} else {P_SEG3 = 0;}					
		if(display[3] & 0x10)  {P_SEG4 = 1;} else {P_SEG4 = 0;}
		if(display[3] & 0x20)  {P_SEG5 = 1;} else {P_SEG5 = 0;}
		if(display[3] & 0x40)  {P_SEG6 = 1;} else {P_SEG6 = 0;}
		if(display[3] & 0x80)  {P_SEG7 = 1;} else {P_SEG7 = 0;}
		
		P_COM3=0;		//COM1�����
		IO_COM3=0;		//COM1�����		
		DIS_COM3;		//�ر�COM1�ڲ�������ʹ��
		break;
	case 4:		//COM0����ߵ�ƽ	
		if(display[0] & 0x01)  {P_SEG0 = 0;} else {P_SEG0 = 1;}			 
		if(display[0] & 0x02)  {P_SEG1 = 0;} else {P_SEG1 = 1;}							 
		if(display[0] & 0x04)  {P_SEG2 = 0;} else {P_SEG2 = 1;}
		if(display[0] & 0x08)  {P_SEG3 = 0;} else {P_SEG3 = 1;}					
		if(display[0] & 0x10)  {P_SEG4 = 0;} else {P_SEG4 = 1;}
		if(display[0] & 0x20)  {P_SEG5 = 0;} else {P_SEG5 = 1;}
		if(display[0] & 0x40)  {P_SEG6 = 0;} else {P_SEG6 = 1;}
		if(display[0] & 0x80)  {P_SEG7 = 0;} else {P_SEG7 = 1;}
		
		P_COM0=1;		//COM0�����
		IO_COM0=0;		//COM0�����		
		DIS_COM0;		//�ر�COM0�ڲ�������ʹ�� 
		break;		
	case 5:		//COM1����ߵ�ƽ
		if(display[1] & 0x01)  {P_SEG0 = 0;} else {P_SEG0 = 1;}			 
		if(display[1] & 0x02)  {P_SEG1 = 0;} else {P_SEG1 = 1;}							 
		if(display[1] & 0x04)  {P_SEG2 = 0;} else {P_SEG2 = 1;}
		if(display[1] & 0x08)  {P_SEG3 = 0;} else {P_SEG3 = 1;}					
		if(display[1] & 0x10)  {P_SEG4 = 0;} else {P_SEG4 = 1;}
		if(display[1] & 0x20)  {P_SEG5 = 0;} else {P_SEG5 = 1;}
		if(display[1] & 0x40)  {P_SEG6 = 0;} else {P_SEG6 = 1;}
		if(display[1] & 0x80)  {P_SEG7 = 0;} else {P_SEG7 = 1;}
		
		P_COM1=1;		//COM1�����
		IO_COM1=0;		//COM1�����		
		DIS_COM1;		//�ر�COM1�ڲ�������ʹ��
		break;
	case 6:		//COM2����ߵ�ƽ
		if(display[2] & 0x01)  {P_SEG0 = 0;} else {P_SEG0 = 1;}			 
		if(display[2] & 0x02)  {P_SEG1 = 0;} else {P_SEG1 = 1;}							 
		if(display[2] & 0x04)  {P_SEG2 = 0;} else {P_SEG2 = 1;}
		if(display[2] & 0x08)  {P_SEG3 = 0;} else {P_SEG3 = 1;}					
		if(display[2] & 0x10)  {P_SEG4 = 0;} else {P_SEG4 = 1;}
		if(display[2] & 0x20)  {P_SEG5 = 0;} else {P_SEG5 = 1;}
		if(display[2] & 0x40)  {P_SEG6 = 0;} else {P_SEG6 = 1;}
		if(display[2] & 0x80)  {P_SEG7 = 0;} else {P_SEG7 = 1;}
		
		P_COM2=1;		//COM1�����
		IO_COM2=0;		//COM1�����		
		DIS_COM2;		//�ر�COM1�ڲ�������ʹ��
		break;	
	case 7:		//COM3����ߵ�ƽ
		if(display[3] & 0x01)  {P_SEG0 = 0;} else {P_SEG0 = 1;}			 
		if(display[3] & 0x02)  {P_SEG1 = 0;} else {P_SEG1 = 1;}							 
		if(display[3] & 0x04)  {P_SEG2 = 0;} else {P_SEG2 = 1;}
		if(display[3] & 0x08)  {P_SEG3 = 0;} else {P_SEG3 = 1;}					
		if(display[3] & 0x10)  {P_SEG4 = 0;} else {P_SEG4 = 1;}
		if(display[3] & 0x20)  {P_SEG5 = 0;} else {P_SEG5 = 1;}
		if(display[3] & 0x40)  {P_SEG6 = 0;} else {P_SEG6 = 1;}
		if(display[3] & 0x80)  {P_SEG7 = 0;} else {P_SEG7 = 1;}
		
		P_COM3=1;		//COM3�����
		IO_COM3=0;		//COM3�����		
		DIS_COM3;		//�ر�COM1�ڲ�������ʹ��
		break;
		}
}





