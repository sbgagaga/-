#ifndef _TOUCHKEY_CONST_H_
#define _TOUCHKEY_CONST_H_

//��������ʱ�䶨��
const unsigned char C_OPTION_REG_ = 0x0B;


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

//�������ͨ��ѡ��
#define		C_KCHS0			C_KVREF|C_KCLK|0x00
#define		C_KCHS1			C_KVREF|C_KCLK|0x01
#define		C_KCHS2			C_KVREF|C_KCLK|0x02
#define		C_KCHS3			C_KVREF|C_KCLK|0x03
#define		C_KCHS4			C_KVREF|C_KCLK|0x04
#define		C_KCHS5			C_KVREF|C_KCLK|0x05
#define		C_KCHS6			C_KVREF|C_KCLK|0x06
#define		C_KCHS7			C_KVREF|C_KCLK|0x07


//���߲�������ѡ��,ʹ�ܵ��ݿ�
#define		C_KCAP0 		0x00 | 0x2
#define		C_KCAP1 		0x08 | 0x2
#define		C_KCAP2 		0x10 | 0x2
#define		C_KCAP3 		0x18 | 0x2
#define		C_KCAP4 		0x20 | 0x2
#define		C_KCAP5 		0x28 | 0x2
#define		C_KCAP6 		0x30 | 0x2
#define		C_KCAP7 		0x38 | 0x2

//�˲�ʱ��ѡ��
#define		C_LVBO0			0x00
#define		C_LVBO1			0x20
#define		C_LVBO2			0x40
#define		C_LVBO3			0x60
#define		C_LVBO4			0x80
#define		C_LVBO5			0xA0
#define		C_LVBO6			0xC0
#define		C_LVBO7			0xE0

#endif