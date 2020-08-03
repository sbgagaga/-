/**************************************************************************
* SC8P8022ϵ��MCU�����������⺯��
* �� �� ����CheckTouchKey.c
* �޸����ڣ�2018/05/25
* �޸���Ա��luo
* �� �� �ţ�V1.0
**************************************************************************/
#include "CheckTouchKey.h"			//�˰���������ǰ��
//---------------------------------------------------
#include <sc.h>






#ifdef	ENABLE_IIC
unsigned char I2C_Read1bYTE(unsigned char ack);		//���ڴ������湤��
unsigned char I2C_Write1bYTE(unsigned char data);
void I2C_WriteStop();
void I2C_WriteStart();
#endif

unsigned int TKdata[4];

/**************************************************************************
* �������ƣ�
* �������ܣ�
* ��ڲ�������
* ���ڲ�������
* ��    ע��
**************************************************************************/

unsigned int Key_Test()
{	
	unsigned char	cnt=0;
	#ifdef	C_KEY_1
	KEYCON0 = 0;
	KEYCON1 = 0;
	KEYCON0 = Table_KeyCap[cnt];		//ʹ�ܵ��ݿڣ�ѡ���Ƿ�������
	KEYCON1 = Table_KeyChannel[cnt];	//���ü��ͨ��
	KEYCON0 |= 0x1;
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[0] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif
	
	cnt++;
	#ifdef	C_KEY_2
	KEYCON0 = 0;
	KEYCON1 = 0;
	KEYCON0 = Table_KeyCap[cnt];		//ʹ�ܵ��ݿڣ�ѡ���Ƿ�������
	KEYCON1 = Table_KeyChannel[cnt];	//���ü��ͨ��
	KEYCON0 |= 0x1;						//��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[1] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif
	
	cnt++;
	#ifdef	C_KEY_3
	KEYCON0 = 0;
	KEYCON1 = 0;
	KEYCON0 = Table_KeyCap[cnt];		//ʹ�ܵ��ݿڣ�ѡ���Ƿ�������
	KEYCON1 = Table_KeyChannel[cnt];	//���ü��ͨ��
	KEYCON0 |= 0x1;						 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[2] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif
		
	cnt++;
	#ifdef	C_KEY_4
	KEYCON0 = 0;
	KEYCON1 = 0;
	KEYCON0 = Table_KeyCap[cnt];		//ʹ�ܵ��ݿڣ�ѡ���Ƿ�������
	KEYCON1 = Table_KeyChannel[cnt];	//���ü��ͨ��
	KEYCON0 |= 0x1;						 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[3] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	

	return 0;
															
}

/**************************************************************************
* �������ƣ�
* �������ܣ�IIC�����ݳ���
* ��ڲ�������
* ���ڲ�����
* ��    ע��
**************************************************************************/
void CheckTouchKey_F()
{
	#ifdef	ENABLE_IIC
		unsigned char checksum = 0;
	#endif	
	
	asm("clrwdt");
	
	#ifdef	C_KEY_1
	checksum += 1;
	#endif
	
	#ifdef	C_KEY_2
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_3
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_4
	checksum += 1;
	#endif	
	
									
	if (checksum)		//��������˰���
	{
		
		Key_Test();		//��ⰴ��ֵ
		
		
		checksum *= 3;		//�ڴ�֮ǰ��checksum��ʾ��������
		checksum += 2;		//�ڴ�֮���checksum��ʾУ���
		//-----------------�����ͨѶ����Ϊ   0xA0+���ݸ���+����+�����------------------
		I2C_WriteStart();
		I2C_Write1bYTE(0xa0);							//�������ӵ�����
		I2C_Write1bYTE(checksum);						//���ݸ���Ϊ  X*2+2  X��ʾ��������
		
		#ifdef	C_KEY_1
		I2C_Write1bYTE(1);
		I2C_Write1bYTE(TKdata[0] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[0]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 1;
		checksum += (TKdata[0] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[0]>>8) & 0xff);		
		#endif
		
		#ifdef	C_KEY_2
		I2C_Write1bYTE(2);
		I2C_Write1bYTE(TKdata[1] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[1]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 2;
		checksum += (TKdata[1] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[1]>>8) & 0xff);		
		#endif		
		
		#ifdef	C_KEY_3
		I2C_Write1bYTE(3);
		I2C_Write1bYTE(TKdata[2] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[2]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 3;
		checksum += (TKdata[2] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[2]>>8) & 0xff);		
		#endif		
		
		#ifdef	C_KEY_4
		I2C_Write1bYTE(4);
		I2C_Write1bYTE(TKdata[3] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[3]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 4;
		checksum += (TKdata[3] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[3]>>8) & 0xff);		
		#endif		
		
			
		I2C_Write1bYTE(checksum);						//��У���
		I2C_WriteStop();								//����					
	}	
	
}	

/**************************************************************************
�����������
**************************************************************************/	
void CheckTouchKey()
{
	CheckTouchKey_F();
}
	
	
	
	
	
	
	
/*********************************************************************	
 IIC����
	
*********************************************************************/


//��ʼ�ź�-��SCLΪ�ߵ�ƽʱ��SDA���Ϸ����Ӹߵ��͵ĵ�ƽ�仯
void I2C_WriteStart()
{
	I2C_SDA_IO = 0;
	I2C_SCL_IO = 0;
	I2C_WaitMoment();
	
	I2C_SDA = 1;			//�Ƚ�SDA=1����׼����SCL=1ʱ����SDA=0
	I2C_SCL = 1;			//ʱ����������
	I2C_WaitMoment();
	I2C_SDA = 0;			//SCL=1ʱ����SDA���ͼ����������ź�
	
	I2C_WaitMoment();
	I2C_SCL = 0;			//��SCL=0����������źŲ���
	I2C_WaitMoment();
}

//�����ź�-��SCLΪ�ߵ�ƽʱ��SDA���Ϸ����ӵ͵��ߵĵ�ƽ�仯
void I2C_WriteStop()
{
	I2C_SDA_IO = 0;
	I2C_SCL_IO = 0;
	I2C_WaitMoment();
	
	I2C_SDA = 0;			//�Ƚ�SDA=0����׼����SCL=1ʱ����SDA=1
	I2C_SCL = 1;			//ʱ����������
	I2C_WaitMoment();
	I2C_SDA = 1;			//SCL=1ʱ����SDA���߼�����ֹͣ�ź�
	
	I2C_WaitMoment();
	I2C_SCL = 0;			//��SCL=0����������źŲ���
	I2C_WaitMoment();
}

/***********************************************************
�������ܣ�ģ��IIC��������8λ����
��ڲ�����data-����������
�������أ�����ackӦ���ź�
��    ע��IICЭ��ackӦ���ź�Ϊ����Ч
***********************************************************/
unsigned char I2C_Write1bYTE(unsigned char data)
{
	unsigned char i = 8;
	I2C_SDA_IO = 0;
	I2C_SCL_IO = 0;
	do
	{
		I2C_SCL = 0;
		if(data&0x80)
			I2C_SDA = 1;
		else
			I2C_SDA = 0;
		
		I2C_SCL = 1;		//ʱ������һ�������أ���һλ����д��
		data <<= 1;
	}
	while(--i);
	I2C_SCL = 0;
	
	I2C_SDA_IO = 1;			//��Ϊ����ڽ���Ӧ���ź�

	I2C_WaitMoment();
	I2C_SCL = 1;			//����������׼����Ӧ���ź�
	I2C_WaitMoment();
	
	i = I2C_SDA;
	I2C_SCL = 0;
	I2C_SDA_IO = 0;
	return i;
}

/***********************************************************
�������ܣ�ģ��IIC��������8λ����
��ڲ�����ack-Ӧ���ź�
�������أ����յ�������
��    ע��IICЭ��ackӦ���ź�Ϊ����Ч
***********************************************************/
unsigned char I2C_Read1bYTE(unsigned char ack)
{
	unsigned char i,data;
	I2C_SDA_IO = 1;
	I2C_SCL_IO = 1;
	I2C_WaitMoment();
	
	while(!I2C_SCL);				//�ȴ��ӻ�׼���������ͷ�ʱ��
	I2C_SCL_IO = 0;
	I2C_SCL = 0;
	I2C_WaitMoment();
	
	data <<= 1;
	if(I2C_SDA) data |= 0x1;
	
	
	for(i = 0; i < 7; i++)
	{
		I2C_SCL = 1;
		data <<= 1;
		if(I2C_SDA) data |= 0x1;
		I2C_SCL = 0;
	}
	
	I2C_SDA_IO = 0;
	
	if(ack)I2C_SDA = 1;			//�Ƿ���Ҫ���������
	else I2C_SDA = 0;
	
	I2C_WaitMoment();
	I2C_SCL = 1;
	I2C_WaitMoment();
	I2C_SCL = 0;
	return data;
}

void I2C_WaitMoment()
{
	asm("nop");
	asm("nop");
}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		

