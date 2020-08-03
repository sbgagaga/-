#ifndef	_TYPEDEF_H_
#define	_TYPEDEF_H_

#define uchar unsigned char
#define uint  unsigned int
#define ulong unsigned long

#define BOOL  unsigned char		//布尔型

#define	TRUE	1
#define	FALSE	0

#define	SetBit(x,y)			x |= (1<<y)
#define ClrBit(x,y)			x &= ~(1<<y)

#define		BSET(x,y)		x|=(1<<y)				//置1
#define		BCLR(x,y)		x&=~(1<<y)				//置0

#define TestOne(Ram,Bit)	(Ram & (1<<Bit))
#define TestZero(Ram,Bit)	!(Ram & (1<<Bit))



typedef struct
{
	unsigned char Radix;			//低八位为小数
	unsigned char Integer;			//高八位为整数
}VolFloat;

typedef union
{
	unsigned int Vol;
	VolFloat Volf;
}VolType;

typedef union
{
	unsigned int bytes;
	struct
	{
		unsigned char bytel;
		unsigned char byteh;
	}byte;
}twobyte;

#endif