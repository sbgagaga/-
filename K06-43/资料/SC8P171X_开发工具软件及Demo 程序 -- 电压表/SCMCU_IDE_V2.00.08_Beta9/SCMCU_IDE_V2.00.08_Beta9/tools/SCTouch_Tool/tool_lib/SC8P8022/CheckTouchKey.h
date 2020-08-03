//---------------------------------------------------------
//�ܽŶ���
#define         I2C_SCL         RB0
#define         I2C_SDA         RB1
volatile bit    I2C_SCL_IO      @((unsigned)&TRISB*8)+0;        //IB�ڷ�������
volatile bit    I2C_SDA_IO      @((unsigned)&TRISB*8)+1;        //IB�ڷ�������


/***************************************************
�������ݲ��ɸ�
***************************************************/
#define		C_KTMR		230		//�������ʱ��,ֵԼС���ʱ��Խ����������Խ��
#define		C_KADJ		10		//�����а�����������
#define		C_KUP		8		//�����ſ�ʱ������,���½�50����Ϊ�м����½�����30����Ϊ�����ſ�
#define		C_KRISE		10		//�������жϰ����ſ���ֵ����ǰֵ�Ⱦ�ֵ�����������Ϊ�а����ſ�

//---------------------------------------------------------------------------
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

//�������ͨ��ѡ��
#define		C_KCHS0			C_KVREF|C_KCLK|0x00
#define		C_KCHS8			C_KVREF|C_KCLK|0x08
#define		C_KCHS9			C_KVREF|C_KCLK|0x09
#define		C_KCHS14		C_KVREF|C_KCLK|0x0E

//���߲�������ѡ��,ʹ�ܵ��ݿ�
#define		C_KCAP0 		0x00 | 0x2
#define		C_KCAP1 		0x08 | 0x2
#define		C_KCAP2 		0x10 | 0x2
#define		C_KCAP3 		0x18 | 0x2
#define		C_KCAP4 		0x20 | 0x2
#define		C_KCAP5 		0x28 | 0x2
#define		C_KCAP6 		0x30 | 0x2
#define		C_KCAP7 		0x38 | 0x2

//�ڲ��Ƚ����ο���ѹ�趨,������ֵ��ѡȡ
//C_KVREF_04	=>	0.4VDD
//C_KVREF_05	=>	0.5VDD
//C_KVREF_06	=>	0.6VDD
//C_KVREF_07	=>	0.7VDD
#define		C_KVREF			C_KVREF_05

//ת��ʱ���趨,������ֵ��ѡȡ,����ѡ��4��Ƶ
//C_KCLK_SYS	=>	ϵͳʱ��
//C_KCLK_SYS2	=>	ϵͳʱ�ӵ�2��Ƶ
//C_KCLK_SYS4	=>	ϵͳʱ�ӵ�4��Ƶ
//C_KCLK_SYS8	=>	ϵͳʱ�ӵ�8��Ƶ
#define		C_KCLK			C_KCLK_SYS4


//���ͨ���趨,ΪC_KCHS0��C_KCHS15����֮һ
//δ�趨��ͨ��Ĭ��ΪC_KCHS0
const unsigned char Table_KeyChannel[] = {
	C_KCHS0,		//����1��Ӧ����ͨ��
	C_KCHS8,		//����2��Ӧ����ͨ��
	C_KCHS9,		//����3��Ӧ����ͨ��
	C_KCHS14			//����4��Ӧ����ͨ��
};

//�ڲ���������ѡ��,��������������,�������Ϊ0,�ʵ�������ߵ�ֵ,��Χ:C_KCAP0��C_KCAP7
const unsigned char Table_KeyCap[] = {
	C_KCAP0,		//����1�ڲ���������
	C_KCAP0,		//����2�ڲ���������
	C_KCAP0,		//����3�ڲ���������
	C_KCAP0			//����4�ڲ���������
};
//-----------------------------------------------------------------------------

extern unsigned int  TKDATA0;         //������ֵ

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




