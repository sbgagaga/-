#ifndef	_DISPLAY_H_
#define	_DISPLAY_H_

#define	H 1
#define	L 0

#define	ON 	1
#define	OFF	0

#define ICONB	0 //两位都选中 BOTH
#define ICON1 	1
#define ICON2 	2

//以下为 ICON1
#define ICON_WZ1 	0X07  	//'WZ1本次使用时间'
#define ICON_WZ2	0X08  	//'WZ2可使用时间'
#define ICON_WZ3	0X70  	//'WZ3长按3秒解锁'

//以下为 ICON2
#define ICON_M		0X01  	//'秒'
#define ICON_F		0X02  	//'分'
#define ICON_FUL	0X04   	//'充满'
#define ICON_CHR	0X08   	//'充电'
#define ICON_LK 	0X10   	//'锁'
#define ICON_XI 	0X20  	//'洗'

#define ICON_ALL	0X7F  	//全部

//#define DIG_BW 	0X01   	//'百位'
#define DIG_SW 	0X01   		//'十位'
#define DIG_GW	0X02   		//'个位'
#define DIG_ALL	0X03  		//'全部显示'
#define DIG_OFF	0X00  		//'全部不显示'

#define	LED_OFF 	16		
#define NUM_OFF 	200 	//'数字不显示'

uchar LED_RAM[4];  //显示缓存；
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
	0x00	//16- 无显示
};
extern void LedScan(void);
void DisPlayNum(uchar dis_num,uchar dig_sel);
extern void DisPlayIcon(uchar icon_seg,uchar icon_sel,uchar icon_sta);
extern void LedRamUpdate(void);

#endif