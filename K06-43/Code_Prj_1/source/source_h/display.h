#ifndef	_DISPLAY_H_
#define	_DISPLAY_H_

#define	H 1
#define	L 0

#define	ON 	1
#define	OFF	0

#define ICONB	0 //��λ��ѡ�� BOTH
#define ICON1 	1
#define ICON2 	2

//����Ϊ ICON1
#define ICON_WZ1 	0X07  	//'WZ1����ʹ��ʱ��'
#define ICON_WZ2	0X08  	//'WZ2��ʹ��ʱ��'
#define ICON_WZ3	0X70  	//'WZ3����3�����'

//����Ϊ ICON2
#define ICON_M		0X01  	//'��'
#define ICON_F		0X02  	//'��'
#define ICON_FUL	0X04   	//'����'
#define ICON_CHR	0X08   	//'���'
#define ICON_LK 	0X10   	//'��'
#define ICON_XI 	0X20  	//'ϴ'

#define ICON_ALL	0X7F  	//ȫ��

//#define DIG_BW 	0X01   	//'��λ'
#define DIG_SW 	0X01   		//'ʮλ'
#define DIG_GW	0X02   		//'��λ'
#define DIG_ALL	0X03  		//'ȫ����ʾ'
#define DIG_OFF	0X00  		//'ȫ������ʾ'

#define	LED_OFF 	16		
#define NUM_OFF 	200 	//'���ֲ���ʾ'

uchar LED_RAM[4];  //��ʾ���棻
const unsigned char LEDCode[]=
{
	0x3F,	//0 - 0
	0x06,	//1 - 1
	0x5B,	//2 - 2
	0x4F,	//3 - 3
	0x66,	//4 - 4
	0x6D,	//5 - 5
	0x7D,	//6 - 6
	0x07,	//7 - 7
	0x7F,	//8 - 8
	0x6F,	//9 - 9
	0x71,	//10- F
	0x35,	//11- C
	0x38,	//12- L
	0x37,	//13- N
	0x79,	//14- E
	0x40,	//15- -
	0x00	//16- ����ʾ
};
extern void LedScan(void);
void DisPlayNum(uchar dis_num,uchar dig_sel);
extern void DisPlayIcon(uchar icon_seg,uchar icon_sel,uchar icon_sta);
extern void LedRamUpdate(void);

#endif