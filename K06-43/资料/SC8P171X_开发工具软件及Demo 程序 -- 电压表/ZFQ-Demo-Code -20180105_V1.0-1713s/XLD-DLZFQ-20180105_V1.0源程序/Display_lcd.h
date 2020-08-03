#ifndef	_Display_lcd_H_
#define	_Display_lcd_H_
#include "TypeDef.h"
#include "main.h"
#include <sc.h>
#include "AD.h" 
#include "global_variable.h"

/**************************************************
**************************************************/
#define  COM0_0    BSET(Display[0],0)  
#define  COM0_1    BSET(Display[0],1)
#define  COM0_2    BSET(Display[0],2)
#define  COM0_3    BSET(Display[0],3)
#define  COM0_4    BSET(Display[0],4)
#define  COM0_5    BSET(Display[0],5)
#define  COM0_6    BSET(Display[0],6)
#define  COM0_7    BSET(Display[0],7)

#define  COM1_0    BSET(Display[1],0)  
#define  COM1_1    BSET(Display[1],1)
#define  COM1_2    BSET(Display[1],2)
#define  COM1_3    BSET(Display[1],3)
#define  COM1_4    BSET(Display[1],4)
#define  COM1_5    BSET(Display[1],5)
#define  COM1_6    BSET(Display[1],6)
#define  COM1_7    BSET(Display[1],7)

#define  COM2_0    BSET(Display[2],0)  
#define  COM2_1    BSET(Display[2],1)
#define  COM2_2    BSET(Display[2],2)
#define  COM2_3    BSET(Display[2],3)
#define  COM2_4    BSET(Display[2],4)
#define  COM2_5    BSET(Display[2],5)
#define  COM2_6    BSET(Display[2],6)
#define  COM2_7    BSET(Display[2],7)

#define  COM3_0    BSET(Display[3],0)  
#define  COM3_1    BSET(Display[3],1)
#define  COM3_2    BSET(Display[3],2)
#define  COM3_3    BSET(Display[3],3)
#define  COM3_4    BSET(Display[3],4)
#define  COM3_5    BSET(Display[3],5)
#define  COM3_6    BSET(Display[3],6)
#define  COM3_7    BSET(Display[3],7)
 
/**************************************************
**************************************************/

void Set_disp();
void Disp_Lcd();
void disf(uchar a);
#endif