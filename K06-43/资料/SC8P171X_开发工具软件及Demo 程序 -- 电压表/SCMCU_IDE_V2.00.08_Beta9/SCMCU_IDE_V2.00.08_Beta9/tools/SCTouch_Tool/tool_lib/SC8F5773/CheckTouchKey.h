//---------------------------------------------------------
//�ܽŶ���
#define			I2C_SCL			RB1
#define			I2C_SDA			RB0
volatile bit  	I2C_SCL_IO		@((unsigned)&TRISB*8)+1;		//IB�ڷ�������
volatile bit  	I2C_SDA_IO		@((unsigned)&TRISB*8)+0;		//IB�ڷ�������


//�����Ǵ����ڲ�һЩ����λ�ĺ궨��,�������
//���������ڲ��Ƚ������˵�ѹѡ��
#define		C_KVREF_04		0x00		//0.4VDD
#define		C_KVREF_05		0x40		//0.5VDD
#define		C_KVREF_06		0x80		//0.6VDD
#define		C_KVREF_07		0xC0		//0.7VDD


//��������ʱ��ѡ��
#define		C_KCLK_SYS		0x00		//fsys
#define		C_KCLK_SYS2		0x10		//fsys/2
#define		C_KCLK_SYS4		0x20		//fsys/4
#define		C_KCLK_SYS8		0x30		//fsys/8

//�ڲ��Ƚ����ο���ѹ�趨,������ֵ��ѡȡ
//C_KVREF_04	=>	0.4VDD
//C_KVREF_05	=>	0.5VDD
//C_KVREF_06	=>	0.6VDD
//C_KVREF_07	=>	0.7VDD
#define		C_KVREF			C_KVREF_05

//ת��ʱ���趨,������ֵ��ѡȡ,����ѡ��4/8��Ƶ
//C_KCLK_SYS	=>	ϵͳʱ��
//C_KCLK_SYS2	=>	ϵͳʱ�ӵ�2��Ƶ
//C_KCLK_SYS4	=>	ϵͳʱ�ӵ�4��Ƶ
//C_KCLK_SYS8	=>	ϵͳʱ�ӵ�8��Ƶ
#define		C_KCLK			C_KCLK_SYS4

//�������ͨ��ѡ��
#define		C_KCHS0			C_KVREF|C_KCLK|0x00
#define		C_KCHS1			C_KVREF|C_KCLK|0x01
#define		C_KCHS2			C_KVREF|C_KCLK|0x02
#define		C_KCHS3			C_KVREF|C_KCLK|0x03
#define		C_KCHS4			C_KVREF|C_KCLK|0x04
#define		C_KCHS5			C_KVREF|C_KCLK|0x05
#define		C_KCHS6			C_KVREF|C_KCLK|0x06
#define		C_KCHS7			C_KVREF|C_KCLK|0x07

//���������˲�ʱ��ѡ��
#define		C_LVBO_SYS0		0x00		//fsys
#define		C_LVBO_SYS1		0x20		//fsys/2
#define		C_LVBO_SYS2		0x40		//fsys/4
#define		C_LVBO_SYS3		0x60		//fsys/8
#define		C_LVBO_SYS4		0x80		//fsys
#define		C_LVBO_SYS5		0xA0		//fsys/2
#define		C_LVBO_SYS6		0xC0		//fsys/4
#define		C_LVBO_SYS7		0xE0		//fsys/8

#define		C_LVBO			C_LVBO_SYS0

#define		C_KEYCON2		C_LVBO |0x08

//---------------------------------------------------------------------------
extern unsigned int  TKDATA0;           //������ֵ


//-----------------------------------------------------------------------------
//��������
void CheckTouchKey();
unsigned char I2C_Read1bYTE(unsigned char ack);
unsigned char I2C_Write1bYTE(unsigned char data);
void I2C_WaitMoment();
void I2C_WriteStop();
void I2C_WriteStart();
void CheckTouchKey(void);		//��������

#endif




