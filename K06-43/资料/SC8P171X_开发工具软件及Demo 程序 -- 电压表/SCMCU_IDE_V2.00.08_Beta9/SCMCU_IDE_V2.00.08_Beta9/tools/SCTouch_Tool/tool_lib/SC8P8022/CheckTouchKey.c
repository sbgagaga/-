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

unsigned int TKdata[16];

/**************************************************************************
* �������ƣ�
* �������ܣ�
* ��ڲ�������
* ���ڲ�������
* ��    ע��
**************************************************************************/

unsigned int Key_Test()
{	
	#ifdef	C_KEY_1
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x50;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[0] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif
	
	#ifdef	C_KEY_2
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x51;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[1] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif
	
	#ifdef	C_KEY_3
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x52;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[2] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	

	#ifdef	C_KEY_4
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x53;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[3] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_5
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x54;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[4] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_6
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x55;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[5] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_7
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x56;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[6] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_8
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x57;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[7] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_9
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x58;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[8] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_10
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x59;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[9] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	

	#ifdef	C_KEY_11
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x5A;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[10] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_12
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x5B;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[11] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_13
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x5C;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[12] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_14
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x5D;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[13] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_15
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x5E;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[14] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
	KEYCON0 = 0x00;
	#endif	
	
	#ifdef	C_KEY_16
	KEYCON0 = 0x02;      //ʹ�ܵ��ݿڣ�����������
	KEYCON1 = 0x5F;		 //0.5VDD,FRES/2��ͨ��1	
	KEYCON0 |= 0x01;	 //��ʼ��ⰴ�� .0λ��0��Ϊ1��ʼ���
	while(!(KEYCON0&0x80));	//.7λΪ1������
	TKdata[15] = ((KEYDATAH<<8) + KEYDATAL);				//��ü�ֵ
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
	
	#ifdef	C_KEY_5
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_6
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_7
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_8
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_9
	checksum += 1;
	#endif
	
	#ifdef	C_KEY_10
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_11
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_12
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_13
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_14
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_15
	checksum += 1;
	#endif	
	
	#ifdef	C_KEY_16
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
		
		#ifdef	C_KEY_5
		I2C_Write1bYTE(5);
		I2C_Write1bYTE(TKdata[4] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[4]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 5;
		checksum += (TKdata[4] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[4]>>8) & 0xff);		
		#endif		
		
		#ifdef	C_KEY_6
		I2C_Write1bYTE(6);
		I2C_Write1bYTE(TKdata[5] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[5]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 6;
		checksum += (TKdata[5] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[5]>>8) & 0xff);		
		#endif		
		
		#ifdef	C_KEY_7
		I2C_Write1bYTE(7);
		I2C_Write1bYTE(TKdata[6] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[6]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 7;
		checksum += (TKdata[6] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[6]>>8) & 0xff);		
		#endif		
		
		#ifdef	C_KEY_8
		I2C_Write1bYTE(8);
		I2C_Write1bYTE(TKdata[7] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[7]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 8;
		checksum += (TKdata[7] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[7]>>8) & 0xff);		
		#endif		
		
		#ifdef	C_KEY_9
		I2C_Write1bYTE(9);
		I2C_Write1bYTE(TKdata[8] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[8]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 9;
		checksum += (TKdata[8] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[8]>>8) & 0xff);		
		#endif		
		
		#ifdef	C_KEY_10
		I2C_Write1bYTE(10);
		I2C_Write1bYTE(TKdata[9] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[9]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 10;
		checksum += (TKdata[9] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[9]>>8) & 0xff);		
		#endif		
		
		#ifdef	C_KEY_11
		I2C_Write1bYTE(11);
		I2C_Write1bYTE(TKdata[10] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[10]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 11;
		checksum += (TKdata[10] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[10]>>8) & 0xff);		
		#endif		
		
		#ifdef	C_KEY_12
		I2C_Write1bYTE(12);
		I2C_Write1bYTE(TKdata[11] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[11]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 12;
		checksum += (TKdata[11] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[11]>>8) & 0xff);		
		#endif	
		
		#ifdef	C_KEY_13
		I2C_Write1bYTE(13);
		I2C_Write1bYTE(TKdata[12] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[12]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 13;
		checksum += (TKdata[12] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[12]>>8) & 0xff);		
		#endif	
		
		#ifdef	C_KEY_14
		I2C_Write1bYTE(14);
		I2C_Write1bYTE(TKdata[13] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[13]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 14;
		checksum += (TKdata[13] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[13]>>8) & 0xff);		
		#endif	
		
		#ifdef	C_KEY_15
		I2C_Write1bYTE(15);
		I2C_Write1bYTE(TKdata[14] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[14]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 15;
		checksum += (TKdata[14] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[14]>>8) & 0xff);		
		#endif	
		
		#ifdef	C_KEY_16
		I2C_Write1bYTE(16);
		I2C_Write1bYTE(TKdata[15] & 0xff);        		//��ֵ���ݵ�λ   
		I2C_Write1bYTE((TKdata[15]>>8) & 0xff);	  		//��ֵ���ݸ�λ
		checksum += 16;
		checksum += (TKdata[15] & 0xff);					//�����= ���ݸ���+��ֵ���ݵ��ܺ�
		checksum += ((TKdata[15]>>8) & 0xff);		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		

