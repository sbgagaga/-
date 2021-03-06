;**********************************************************
;*********************触摸按键常量文件*********************
;**********************************************************
#ifndef	_TOUCH_KSCAN_CONST_H_
#define	_TOUCH_KSCAN_CONST_H_
;----------------------------------------------------------
;MCU所有按键通道定义
C_KCHS0     DEF         0030H         ;P0,0 
C_KCHS1     DEF         0031H         ;P0,1       
C_KCHS2     DEF         0032H         ;P0,2 
C_KCHS3     DEF         0033H         ;P0,3 
C_KCHS4     DEF         0034H         ;P0,4 
C_KCHS5     DEF         0035H         ;P0,5 
C_KCHS6     DEF         0036H         ;P0,6 
C_KCHS7     DEF         0037H         ;P0,7 
C_KCHS8     DEF         0130H         ;P1,0 
C_KCHS9     DEF         0131H         ;P1,1 
C_KCHS10    DEF         0132H         ;P1,2 
C_KCHS11    DEF         0133H         ;P1,3 
C_KCHS12    DEF         0134H         ;P1,4 
C_KCHS13    DEF         0135H         ;P1,6 
C_KCHS14    DEF         0136H         ;P2,0
C_KCHS15    DEF         0137H         ;P2,1 
;----------------------------------------------------------
;MCU触摸通道口电容定义
C_KCAP_0     DEF       B'00000010' ;按键口不接电容
C_KCAP_1     DEF       B'00001010' ;按键口接电容c*1
C_KCAP_2     DEF       B'00010010' ;按键口接电容c*2
C_KCAP_3     DEF       B'00011010' ;按键口接电容c*3
C_KCAP_4     DEF       B'00100010' ;按键口接电容c*4
C_KCAP_5     DEF       B'00101010' ;按键口接电容c*5
C_KCAP_6     DEF       B'00110010' ;按键口接电容c*6
C_KCAP_7     DEF       B'00111010' ;按键口接电容c*7
;----------------------------------------------------------
#endif