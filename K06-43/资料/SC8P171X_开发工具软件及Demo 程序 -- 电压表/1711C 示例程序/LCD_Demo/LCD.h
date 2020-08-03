#ifndef	__LCD_h__
#define	__LCD_h__

#define    BSET(x,y)    x|=(1<<y)	//置1
#define    BCLR(x,y)    x&=~(1<<y)	//置0

//SEG口定义
#define    P_SEG0    RA1
#define    P_SEG1    RA2
#define    P_SEG2    RA3
#define    P_SEG3    RA4
#define    P_SEG4    RA5
#define    P_SEG5    RB1
#define    P_SEG6    RB2
#define    P_SEG7    RB3


//COM口定义
#define    P_COM0    RC0
#define    IO_COM0   TRISC0
#define    EN_COM0   BSET(COMEN,0)
#define    DIS_COM0  BCLR(COMEN,0)

#define    P_COM1    RC1
#define    IO_COM1   TRISC1
#define    EN_COM1   BSET(COMEN,1)
#define    DIS_COM1  BCLR(COMEN,1)

#define    P_COM2    RC2
#define    IO_COM2   TRISC2
#define    EN_COM2   BSET(COMEN,2)
#define    DIS_COM2  BCLR(COMEN,2)

#define    P_COM3    RC3
#define    IO_COM3   TRISC3
#define    EN_COM3   BSET(COMEN,3)
#define    DIS_COM3  BCLR(COMEN,3)

#endif