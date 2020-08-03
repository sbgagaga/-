#ifndef	_TYPEDEF_H_
#define	_TYPEDEF_H_

#define uchar unsigned char
#define uint  unsigned int
#define ulong unsigned long

#define	TRUE	1
#define	FALSE	0

#define	BSET(x,y)	x|=(1<<y)				//ÖÃ1
#define	BCLR(x,y)	x&=~(1<<y)				//ÖÃ0

#define TestOne(Ram,Bit)	(Ram & (1<<Bit))
#define TestZero(Ram,Bit)	!(Ram & (1<<Bit))

#endif