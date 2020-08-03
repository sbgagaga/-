#ifndef _DISPLAY_H_
#define	_DISPLAY_H_

#include <sc.h>
#include "adc.h"
#include "mytype.h"
#include "main.h"

//对应的LCD点屏段位如下：

/*
1a   2->3
1b	 2->4
1c	 5->2
1d	 2->6
1e   2->5
1f   3->2 
1g   4->2 
1h   1->2


2a   5->4
2b	 3->5
2c   4->5 
2d   3->4
2e   6->3
2f   4->3
2g   5->3
2h   3->1

3a   1->6
3b   3->6
3c   5->6
3d   6->4
3e   4->6 
3f   6->5
3g   1->5


*/




#define LED6	RB1     //8pin
#define	LED5	RC0     //11pin
#define LED4	RB7     //2pin
#define	LED3	RB6    //3pin
#define LED2	RB3    //6pin
#define	LED1	RB4    //7pin

#define LED6M	TRISB1
#define	LED5M	TRISC0
#define LED4M	TRISB7
#define	LED3M	TRISB6
#define LED2M	TRISB3
#define	LED1M	TRISB4

uchar const Table_code[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x00,0x77,0x76};

void display();
void Flash_dis();
#endif