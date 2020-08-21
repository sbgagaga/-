opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8P1712C
opt include "E:\SCMCU_IDE_V2.00.08_Beta9\data\include\sc8p1712c.cgen.inc"
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
	FNCALL	_main,_Apply
	FNCALL	_main,_SystemInit
	FNCALL	_SystemInit,_GPIOInit
	FNCALL	_SystemInit,_TimerInit
	FNCALL	_Apply,_ADCPro
	FNCALL	_Apply,_DisplayPro
	FNCALL	_Apply,_KeyScan
	FNCALL	_Apply,_Motor
	FNCALL	_Apply,_Sec1sPro
	FNCALL	_Sec1sPro,___bmul
	FNCALL	_Sec1sPro,___lwdiv
	FNCALL	_Motor,___wmul
	FNCALL	_DisplayPro,_DisplayIcon
	FNCALL	_DisplayPro,_ErrPro
	FNCALL	_DisplayPro,_LockPro
	FNCALL	_DisplayPro,_USBLedPro
	FNCALL	_DisplayPro,_WorkLedPro
	FNCALL	_WorkLedPro,___bmul
	FNCALL	_WorkLedPro,___lbdiv
	FNCALL	_WorkLedPro,___lbmod
	FNCALL	_USBLedPro,___lbdiv
	FNCALL	_USBLedPro,___lbmod
	FNCALL	_ADCPro,_ADCRead
	FNCALL	_ADCRead,_ADSample
	FNCALL	_ADCRead,___lldiv
	FNCALL	_ADCRead,___lmul
	FNROOT	_main
	FNCALL	_Isr_Timer,_LEDScan
	FNCALL	intlevel1,_Isr_Timer
	global	intlevel1
	FNROOT	intlevel1
	global	_LEDArrMap
	global	_BatDecTime
	global	_BatAddTime
	global	_LEDSeg2
	global	_OffHideNumbArr
	global	_HideNumbArr
	global	_NumbArr
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	15

;initializer for _LEDArrMap
	retlw	0FFh
	retlw	0FFh
	retlw	0EFh
	retlw	0FFh
	retlw	0FFh
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	23

;initializer for _BatDecTime
	retlw	0D2h
	line	22

;initializer for _BatAddTime
	retlw	0F0h
psect	idataBANK1,class=CODE,space=0,delta=2,noexec
global __pidataBANK1
__pidataBANK1:
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	13

;initializer for _LEDSeg2
	retlw	low(0)
	retlw	01h
	retlw	low(0)
	retlw	01h
	retlw	01h
	retlw	low(0)
	retlw	low(0)
	retlw	02h
	retlw	03h
	retlw	02h
	retlw	03h
	retlw	03h
	retlw	02h
	retlw	02h
	retlw	04h
	retlw	04h
	line	5

;initializer for _OffHideNumbArr
	retlw	low(0)
	retlw	high(0)

	retlw	012h
	retlw	0

	retlw	05Bh
	retlw	0

	retlw	07Fh
	retlw	0

	retlw	07Fh
	retlw	09h

	retlw	0FFh
	retlw	02Dh

	retlw	0FFh
	retlw	03Fh

	line	4

;initializer for _HideNumbArr
	retlw	low(0)
	retlw	040h
	retlw	070h
	retlw	078h
	retlw	07Eh
	retlw	07Fh
	retlw	03Fh
	retlw	0Fh
	retlw	07h
	retlw	01h
	retlw	low(0)
	line	3

;initializer for _NumbArr
	retlw	077h
	retlw	024h
	retlw	05Dh
	retlw	06Dh
	retlw	02Eh
	retlw	06Bh
	retlw	07Bh
	retlw	025h
	retlw	07Fh
	retlw	02Fh
	global	_LEDSeg1
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
	global __stringbase
__stringbase:
	retlw	0
psect	strings
	global    __end_of__stringtab
__end_of__stringtab:
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	12
_LEDSeg1:
	retlw	01h
	retlw	02h
	retlw	02h
	retlw	03h
	retlw	low(0)
	retlw	03h
	retlw	04h
	retlw	low(0)
	retlw	01h
	retlw	01h
	retlw	02h
	retlw	low(0)
	retlw	03h
	retlw	04h
	retlw	low(0)
	retlw	01h
	global __end_of_LEDSeg1
__end_of_LEDSeg1:
	global	_LEDSeg1
	global	_WorkMin
	global	ErrPro@LedSwitchFlag
	global	LockPro@LedSwitchFlag
	global	WorkLedPro@dir
	global	WorkLedPro@LedSwitchFlag
	global	_USBLink
	global	_KeyInBuf
	global	_LEDWorkFlag
	global	_OnOffFlag
	global	_KeyPress
	global	_time10ms
	global	_time2ms
	global	_WorkFlag
	global	_USBFlag
	global	_IovFlag
	global	_LowBatFlag
	global	_SystemONFlag
	global	_ADsum
	global	_TimeAddCnt
	global	_TimeDecCnt
	global	_WorkCnt
	global	_LedIndex
	global	_KeyCnt
	global	_LockSta
	global	ErrPro@SwitchCnt
	global	LockPro@Ledcnt
	global	LockPro@LockSwitchCnt
	global	LockPro@SwitchCnt
	global	WorkLedPro@cnt
	global	WorkLedPro@index
	global	WorkLedPro@LedSwitchCnt
	global	USBLedPro@cnt
	global	USBLedPro@index
	global	LEDScan@LEDScanIndex
	global	_Sec1sCnt
	global	_LockNumb
	global	_VarPowerUpCount
	global	_cnt10ms
	global	_cnt2ms
	global	Sec1sPro@ActualPercent
	global	_CurrentCnt
	global	_ADcnt
	global	_ADCState
	global	_BatPercent
	global	_ADCVal
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_T2CON
_T2CON	set	18
	global	_INTCON
_INTCON	set	11
	global	_PORTC
_PORTC	set	7
	global	_PORTB
_PORTB	set	6
	global	_PORTA
_PORTA	set	5
	global	_GODONE
_GODONE	set	249
	global	_TMR2IF
_TMR2IF	set	97
	global	_RC3
_RC3	set	59
	global	_RC2
_RC2	set	58
	global	_RB5
_RB5	set	53
	global	_RB4
_RB4	set	52
	global	_RB3
_RB3	set	51
	global	_RA7
_RA7	set	47
	global	_RA6
_RA6	set	46
	global	_RA5
_RA5	set	45
	global	_RA3
_RA3	set	43
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_WPUB
_WPUB	set	149
	global	_PR2
_PR2	set	146
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_TRISC
_TRISC	set	135
	global	_TRISB
_TRISB	set	134
	global	_TRISA
_TRISA	set	133
	global	_WPUB5
_WPUB5	set	1197
	global	_WPUB4
_WPUB4	set	1196
	global	_WPUB3
_WPUB3	set	1195
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB3
_TRISB3	set	1075
	global	_TRISA7
_TRISA7	set	1071
	global	_TRISA6
_TRISA6	set	1070
	global	_TRISA2
_TRISA2	set	1066
	global	_TRISA1
_TRISA1	set	1065
	global	_RBPU
_RBPU	set	1039
	global	_WDTCON
_WDTCON	set	261
	global	_WPUC
_WPUC	set	399
	global	_WPUA
_WPUA	set	398
	global	_ANS2
_ANS2	set	3138
	global	_ANS1
_ANS1	set	3137
	global	_WPUC3
_WPUC3	set	3195
	global	_WPUC2
_WPUC2	set	3194
	global	_WPUA7
_WPUA7	set	3191
	global	_WPUA6
_WPUA6	set	3190
	global	_WPUA2
_WPUA2	set	3186
	global	_WPUA1
_WPUA1	set	3185
; #config settings
	file	"K13-01.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bitbssCOMMON,class=COMMON,bit,space=1,noexec
global __pbitbssCOMMON
__pbitbssCOMMON:
ErrPro@LedSwitchFlag:
       ds      1

LockPro@LedSwitchFlag:
       ds      1

WorkLedPro@dir:
       ds      1

WorkLedPro@LedSwitchFlag:
       ds      1

_USBLink:
       ds      1

_KeyInBuf:
       ds      1

_LEDWorkFlag:
       ds      1

_OnOffFlag:
       ds      1

_KeyPress:
       ds      1

_time10ms:
       ds      1

_time2ms:
       ds      1

_WorkFlag:
       ds      1

_USBFlag:
       ds      1

_IovFlag:
       ds      1

_LowBatFlag:
       ds      1

_SystemONFlag:
       ds      1

psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_WorkMin:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_ADsum:
       ds      4

_TimeAddCnt:
       ds      2

_TimeDecCnt:
       ds      2

_WorkCnt:
       ds      2

_LedIndex:
       ds      2

_KeyCnt:
       ds      2

_LockSta:
       ds      2

ErrPro@SwitchCnt:
       ds      1

LockPro@Ledcnt:
       ds      1

LockPro@LockSwitchCnt:
       ds      1

LockPro@SwitchCnt:
       ds      1

WorkLedPro@cnt:
       ds      1

WorkLedPro@index:
       ds      1

WorkLedPro@LedSwitchCnt:
       ds      1

USBLedPro@cnt:
       ds      1

USBLedPro@index:
       ds      1

LEDScan@LEDScanIndex:
       ds      1

_Sec1sCnt:
       ds      1

_LockNumb:
       ds      1

_VarPowerUpCount:
       ds      1

_cnt10ms:
       ds      1

_cnt2ms:
       ds      1

Sec1sPro@ActualPercent:
       ds      1

_CurrentCnt:
       ds      1

_ADcnt:
       ds      1

_ADCState:
       ds      1

_BatPercent:
       ds      1

_ADCVal:
       ds      6

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	15
_LEDArrMap:
       ds      5

psect	dataBANK0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	23
_BatDecTime:
       ds      1

psect	dataBANK0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	22
_BatAddTime:
       ds      1

psect	dataBANK1,class=BANK1,space=1,noexec
global __pdataBANK1
__pdataBANK1:
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	13
_LEDSeg2:
       ds      16

psect	dataBANK1
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	5
_OffHideNumbArr:
       ds      14

psect	dataBANK1
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	4
_HideNumbArr:
       ds      11

psect	dataBANK1
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	3
_NumbArr:
       ds      10

	file	"K13-01.as"
	line	#
global btemp
psect inittext,class=CODE,delta=2
global init_fetch0,btemp
;	Called with low address in FSR and high address in W
init_fetch0:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram0
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram0:
	fcall init_fetch0
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram0
; Initialize objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
global init_ram0, __pidataBANK1
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK1+51)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram0
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2,merge=1
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	fcall	__pidataBANK0+6		;fetch initializer
	movwf	__pdataBANK0+6&07fh		
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+02Ah)
	fcall	clear_ram0
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
	clrf	((__pbitbssCOMMON/8)+1)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1,noexec
global __pcstackBANK1
__pcstackBANK1:
	global	ADCRead@ch
ADCRead@ch:	; 1 bytes @ 0x0
	ds	1
	global	ADCRead@AD_H
ADCRead@AD_H:	; 2 bytes @ 0x1
	ds	2
	global	ADCRead@AD_L
ADCRead@AD_L:	; 2 bytes @ 0x3
	ds	2
	global	ADCRead@ad_temp
ADCRead@ad_temp:	; 2 bytes @ 0x5
	ds	2
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_ADSample:	; 1 bytes @ 0x0
?_LEDScan:	; 1 bytes @ 0x0
??_LEDScan:	; 1 bytes @ 0x0
?_KeyScan:	; 1 bytes @ 0x0
?_Motor:	; 1 bytes @ 0x0
?_DisplayPro:	; 1 bytes @ 0x0
?_SystemInit:	; 1 bytes @ 0x0
?_GPIOInit:	; 1 bytes @ 0x0
?_TimerInit:	; 1 bytes @ 0x0
?_WorkLedPro:	; 1 bytes @ 0x0
?_USBLedPro:	; 1 bytes @ 0x0
?_LockPro:	; 1 bytes @ 0x0
?_ErrPro:	; 1 bytes @ 0x0
?_ADCPro:	; 1 bytes @ 0x0
?_Sec1sPro:	; 1 bytes @ 0x0
?_Isr_Timer:	; 1 bytes @ 0x0
??_Isr_Timer:	; 1 bytes @ 0x0
?_Apply:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	ds	3
??_ADSample:	; 1 bytes @ 0x3
??_KeyScan:	; 1 bytes @ 0x3
??_SystemInit:	; 1 bytes @ 0x3
??_GPIOInit:	; 1 bytes @ 0x3
??_TimerInit:	; 1 bytes @ 0x3
??_LockPro:	; 1 bytes @ 0x3
??_ErrPro:	; 1 bytes @ 0x3
?_DisplayIcon:	; 1 bytes @ 0x3
??___lmul:	; 1 bytes @ 0x3
?___bmul:	; 1 bytes @ 0x3
?___lbdiv:	; 1 bytes @ 0x3
?___lbmod:	; 1 bytes @ 0x3
	global	?___wmul
?___wmul:	; 2 bytes @ 0x3
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x3
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x3
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x3
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x3
	global	DisplayIcon@index
DisplayIcon@index:	; 2 bytes @ 0x3
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x3
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x3
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x3
	ds	1
??___bmul:	; 1 bytes @ 0x4
??___lbdiv:	; 1 bytes @ 0x4
??___lbmod:	; 1 bytes @ 0x4
	global	ADSample@ch
ADSample@ch:	; 1 bytes @ 0x4
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x4
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x4
	ds	1
??_DisplayIcon:	; 1 bytes @ 0x5
	global	ADSample@i
ADSample@i:	; 1 bytes @ 0x5
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x5
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x5
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x5
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x5
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x5
	ds	1
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x6
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x6
	ds	1
??_Motor:	; 1 bytes @ 0x7
??_ADCPro:	; 1 bytes @ 0x7
??___wmul:	; 1 bytes @ 0x7
??___lldiv:	; 1 bytes @ 0x7
??___lwdiv:	; 1 bytes @ 0x7
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x7
	ds	1
??_DisplayPro:	; 1 bytes @ 0x8
??_Apply:	; 1 bytes @ 0x8
??_main:	; 1 bytes @ 0x8
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
??_WorkLedPro:	; 1 bytes @ 0x0
??_USBLedPro:	; 1 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x0
	global	DisplayIcon@Mask
DisplayIcon@Mask:	; 2 bytes @ 0x0
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x1
	ds	1
	global	DisplayIcon@i
DisplayIcon@i:	; 1 bytes @ 0x2
	ds	1
??_Sec1sPro:	; 1 bytes @ 0x3
	ds	1
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	1
	global	Sec1sPro@PercentErr
Sec1sPro@PercentErr:	; 1 bytes @ 0x5
	ds	1
	global	Sec1sPro@TempPercent
Sec1sPro@TempPercent:	; 2 bytes @ 0x6
	ds	2
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x8
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x8
	ds	4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0xC
	ds	4
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x10
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0x14
	ds	1
?_ADCRead:	; 1 bytes @ 0x15
	global	ADCRead@Val
ADCRead@Val:	; 1 bytes @ 0x15
	ds	1
??_ADCRead:	; 1 bytes @ 0x16
	ds	4
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    16
;!    Data        58
;!    BSS         43
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      8      11
;!    BANK0            80     26      75
;!    BANK1            80      7      58

;!
;!Pointer List with Targets:
;!
;!    ADCRead@Val	PTR unsigned int  size(1) Largest target is 6
;!		 -> ADCVal(BANK0[6]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    _Sec1sPro->___lwdiv
;!    _Motor->___wmul
;!    _WorkLedPro->___lbmod
;!    _USBLedPro->___lbmod
;!    _ADCRead->___lmul
;!    ___lldiv->___lmul
;!
;!Critical Paths under _Isr_Timer in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _Sec1sPro->___lwdiv
;!    _Motor->___wmul
;!    _DisplayPro->_DisplayIcon
;!    _DisplayPro->_USBLedPro
;!    _ADCPro->_ADCRead
;!    _ADCRead->___lldiv
;!    ___lldiv->___lmul
;!
;!Critical Paths under _Isr_Timer in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    _ADCPro->_ADCRead
;!
;!Critical Paths under _Isr_Timer in BANK1
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0    4005
;!                              _Apply
;!                         _SystemInit
;! ---------------------------------------------------------------------------------
;! (1) _SystemInit                                           0     0      0       0
;!                           _GPIOInit
;!                          _TimerInit
;! ---------------------------------------------------------------------------------
;! (2) _TimerInit                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _GPIOInit                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Apply                                                0     0      0    4005
;!                             _ADCPro
;!                         _DisplayPro
;!                            _KeyScan
;!                              _Motor
;!                           _Sec1sPro
;! ---------------------------------------------------------------------------------
;! (2) _Sec1sPro                                             5     5      0     953
;!                                              3 BANK0      5     5      0
;!                             ___bmul
;!                            ___lwdiv
;! ---------------------------------------------------------------------------------
;! (3) ___lwdiv                                              7     3      4     371
;!                                              3 COMMON     4     0      4
;!                                              0 BANK0      3     3      0
;! ---------------------------------------------------------------------------------
;! (2) _Motor                                                0     0      0      52
;!                             ___wmul
;! ---------------------------------------------------------------------------------
;! (3) ___wmul                                               6     2      4      52
;!                                              3 COMMON     4     0      4
;!                                              0 BANK0      2     2      0
;! ---------------------------------------------------------------------------------
;! (2) _KeyScan                                              1     1      0       0
;!                                              3 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _DisplayPro                                           0     0      0    1422
;!                        _DisplayIcon
;!                             _ErrPro
;!                            _LockPro
;!                          _USBLedPro
;!                         _WorkLedPro
;! ---------------------------------------------------------------------------------
;! (3) _WorkLedPro                                           2     2      0     659
;!                                              0 BANK0      2     2      0
;!                             ___bmul
;!                            ___lbdiv
;!                            ___lbmod
;! ---------------------------------------------------------------------------------
;! (3) ___bmul                                               3     2      1     224
;!                                              3 COMMON     3     2      1
;! ---------------------------------------------------------------------------------
;! (3) _USBLedPro                                            3     3      0     435
;!                                              0 BANK0      3     3      0
;!                            ___lbdiv
;!                            ___lbmod
;! ---------------------------------------------------------------------------------
;! (4) ___lbmod                                              5     4      1     216
;!                                              3 COMMON     5     4      1
;! ---------------------------------------------------------------------------------
;! (4) ___lbdiv                                              4     3      1     219
;!                                              3 COMMON     4     3      1
;! ---------------------------------------------------------------------------------
;! (3) _LockPro                                              2     2      0       0
;!                                              3 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! (3) _ErrPro                                               0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _DisplayIcon                                          7     5      2     328
;!                                              3 COMMON     4     2      2
;!                                              0 BANK0      3     3      0
;! ---------------------------------------------------------------------------------
;! (2) _ADCPro                                               0     0      0    1578
;!                            _ADCRead
;! ---------------------------------------------------------------------------------
;! (3) _ADCRead                                             12    11      1    1578
;!                                             21 BANK0      5     4      1
;!                                              0 BANK1      7     7      0
;!                           _ADSample
;!                            ___lldiv
;!                             ___lmul
;! ---------------------------------------------------------------------------------
;! (4) ___lmul                                              12     4      8     396
;!                                              3 COMMON     4     4      0
;!                                              0 BANK0      8     0      8
;! ---------------------------------------------------------------------------------
;! (4) ___lldiv                                             13     5      8     631
;!                                              8 BANK0     13     5      8
;!                             ___lmul (ARG)
;! ---------------------------------------------------------------------------------
;! (4) _ADSample                                             3     3      0      65
;!                                              3 COMMON     3     3      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _Isr_Timer                                            3     3      0       0
;!                                              0 COMMON     3     3      0
;!                            _LEDScan
;! ---------------------------------------------------------------------------------
;! (6) _LEDScan                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _Apply
;!     _ADCPro
;!       _ADCRead
;!         _ADSample
;!         ___lldiv
;!           ___lmul (ARG)
;!         ___lmul
;!     _DisplayPro
;!       _DisplayIcon
;!       _ErrPro
;!       _LockPro
;!       _USBLedPro
;!         ___lbdiv
;!         ___lbmod
;!       _WorkLedPro
;!         ___bmul
;!         ___lbdiv
;!         ___lbmod
;!     _KeyScan
;!     _Motor
;!       ___wmul
;!     _Sec1sPro
;!       ___bmul
;!       ___lwdiv
;!   _SystemInit
;!     _GPIOInit
;!     _TimerInit
;!
;! _Isr_Timer (ROOT)
;!   _LEDScan
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!SFR3                 0      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!BANK1               50      7      3A       7       72.5%
;!BITBANK1            50      0       0       6        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     1A      4B       5       93.8%
;!BITBANK0            50      0       0       4        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      8       B       1       78.6%
;!BITCOMMON            E      0       2       0       14.3%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      90       8        0.0%
;!ABS                  0      0      90       3        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 3 in file "C:\Users\Administrator\Desktop\project\K13-01\code\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_Apply
;;		_SystemInit
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\main.c"
	line	3
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\main.c"
	line	3
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	5
	
l6931:	
;main.c: 5: SystemInit();
	fcall	_SystemInit
	line	8
	
l6933:	
;main.c: 7: {
;main.c: 8: Apply();
	fcall	_Apply
	line	9
# 9 "C:\Users\Administrator\Desktop\project\K13-01\code\main.c"
clrwdt ;# 
psect	maintext
	goto	l6933
	global	start
	ljmp	start
	opt stack 0
	line	11
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_SystemInit

;; *************** function _SystemInit *****************
;; Defined at:
;;		line 117 in file "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 300/200
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_GPIOInit
;;		_TimerInit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	117
global __ptext1
__ptext1:	;psect for function _SystemInit
psect	text1
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	117
	global	__size_of_SystemInit
	__size_of_SystemInit	equ	__end_of_SystemInit-_SystemInit
	
_SystemInit:	
;incstack = 0
	opt	stack 4
; Regs used in _SystemInit: [wreg+status,2+status,0+pclath+cstack]
	line	119
	
l5357:	
# 119 "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
nop ;# 
	line	120
# 120 "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
clrwdt ;# 
psect	text1
	line	121
	
l5359:	
;K13-01.c: 121: GPIOInit();
	fcall	_GPIOInit
	line	122
;K13-01.c: 122: TimerInit();
	fcall	_TimerInit
	line	123
	
l5361:	
;K13-01.c: 123: WDTCON=0x01;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	124
	
l1802:	
	return
	opt stack 0
GLOBAL	__end_of_SystemInit
	__end_of_SystemInit:
	signat	_SystemInit,89
	global	_TimerInit

;; *************** function _TimerInit *****************
;; Defined at:
;;		line 157 in file "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 300/300
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SystemInit
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	157
global __ptext2
__ptext2:	;psect for function _TimerInit
psect	text2
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	157
	global	__size_of_TimerInit
	__size_of_TimerInit	equ	__end_of_TimerInit-_TimerInit
	
_TimerInit:	
;incstack = 0
	opt	stack 4
; Regs used in _TimerInit: [wreg]
	line	168
	
l5269:	
;K13-01.c: 168: OSCCON=0X61;
	movlw	low(061h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	169
;K13-01.c: 169: INTCON=0B11000000;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	170
;K13-01.c: 170: PIE1=0B00000010;
	movlw	low(02h)
	movwf	(140)^080h	;volatile
	line	171
;K13-01.c: 171: T2CON=0B00000100;
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	172
;K13-01.c: 172: PR2 = 200;
	movlw	low(0C8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	173
	
l1808:	
	return
	opt stack 0
GLOBAL	__end_of_TimerInit
	__end_of_TimerInit:
	signat	_TimerInit,89
	global	_GPIOInit

;; *************** function _GPIOInit *****************
;; Defined at:
;;		line 126 in file "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/300
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SystemInit
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	126
global __ptext3
__ptext3:	;psect for function _GPIOInit
psect	text3
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	126
	global	__size_of_GPIOInit
	__size_of_GPIOInit	equ	__end_of_GPIOInit-_GPIOInit
	
_GPIOInit:	
;incstack = 0
	opt	stack 4
; Regs used in _GPIOInit: [wreg+status,2]
	line	128
	
l5229:	
;K13-01.c: 128: RBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1039/8)^080h,(1039)&7	;volatile
	line	130
	
l5231:	
;K13-01.c: 130: TRISA =0X00;
	clrf	(133)^080h	;volatile
	line	131
;K13-01.c: 131: TRISB =0X00;
	clrf	(134)^080h	;volatile
	line	132
;K13-01.c: 132: TRISC =0X00;
	clrf	(135)^080h	;volatile
	line	136
	
l5233:	
;K13-01.c: 136: WPUA =0XFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	137
	
l5235:	
;K13-01.c: 137: WPUB =0XFF;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	138
	
l5237:	
;K13-01.c: 138: WPUC =0XFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(399)^0180h	;volatile
	line	142
	
l5239:	
;K13-01.c: 142: PORTA = 0X80;
	movlw	low(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	143
	
l5241:	
;K13-01.c: 143: PORTB = 0X80;
	movlw	low(080h)
	movwf	(6)	;volatile
	line	144
	
l5243:	
;K13-01.c: 144: PORTC = 0;
	clrf	(7)	;volatile
	line	147
	
l5245:	
;K13-01.c: 147: RA5 =1;
	bsf	(45/8),(45)&7	;volatile
	line	148
	
l5247:	
;K13-01.c: 148: RBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1039/8)^080h,(1039)&7	;volatile
	line	149
	
l5249:	
;K13-01.c: 149: TRISA6=1,WPUA6=1;
	bsf	(1070/8)^080h,(1070)&7	;volatile
	
l5251:	
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3190/8)^0180h,(3190)&7	;volatile
	line	150
	
l5253:	
;K13-01.c: 150: TRISA7=1,WPUA7=1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1071/8)^080h,(1071)&7	;volatile
	
l5255:	
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3191/8)^0180h,(3191)&7	;volatile
	line	152
	
l5257:	
;K13-01.c: 152: TRISA1=1,WPUA1=0; ANS1=1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1065/8)^080h,(1065)&7	;volatile
	
l5259:	
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3185/8)^0180h,(3185)&7	;volatile
	
l5261:	
	bsf	(3137/8)^0180h,(3137)&7	;volatile
	line	153
	
l5263:	
;K13-01.c: 153: TRISA2=1,WPUA2=0; ANS2=1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1066/8)^080h,(1066)&7	;volatile
	
l5265:	
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3186/8)^0180h,(3186)&7	;volatile
	
l5267:	
	bsf	(3138/8)^0180h,(3138)&7	;volatile
	line	155
	
l1805:	
	return
	opt stack 0
GLOBAL	__end_of_GPIOInit
	__end_of_GPIOInit:
	signat	_GPIOInit,89
	global	_Apply

;; *************** function _Apply *****************
;; Defined at:
;;		line 25 in file "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/200
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ADCPro
;;		_DisplayPro
;;		_KeyScan
;;		_Motor
;;		_Sec1sPro
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	25
global __ptext4
__ptext4:	;psect for function _Apply
psect	text4
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	25
	global	__size_of_Apply
	__size_of_Apply	equ	__end_of_Apply-_Apply
	
_Apply:	
;incstack = 0
	opt	stack 2
; Regs used in _Apply: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	27
	
l6893:	
;K13-01.c: 27: if(time2ms)
	btfss	(_time2ms/8),(_time2ms)&7
	goto	u4751
	goto	u4750
u4751:
	goto	l6899
u4750:
	line	29
	
l6895:	
;K13-01.c: 28: {
;K13-01.c: 29: time2ms=0;
	bcf	(_time2ms/8),(_time2ms)&7
	line	30
;K13-01.c: 30: if(SystemONFlag)
	btfss	(_SystemONFlag/8),(_SystemONFlag)&7
	goto	u4761
	goto	u4760
u4761:
	goto	l6899
u4760:
	line	32
	
l6897:	
;K13-01.c: 31: {
;K13-01.c: 32: KeyScan();
	fcall	_KeyScan
	line	35
	
l6899:	
;K13-01.c: 33: }
;K13-01.c: 34: }
;K13-01.c: 35: if(time10ms)
	btfss	(_time10ms/8),(_time10ms)&7
	goto	u4771
	goto	u4770
u4771:
	goto	l1789
u4770:
	line	37
	
l6901:	
;K13-01.c: 36: {
;K13-01.c: 37: time10ms=0;
	bcf	(_time10ms/8),(_time10ms)&7
	line	38
;K13-01.c: 38: if(SystemONFlag==0&&VarPowerUpCount<100)
	btfsc	(_SystemONFlag/8),(_SystemONFlag)&7
	goto	u4781
	goto	u4780
u4781:
	goto	l6909
u4780:
	
l6903:	
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_VarPowerUpCount),w
	skipnc
	goto	u4791
	goto	u4790
u4791:
	goto	l6909
u4790:
	line	40
	
l6905:	
;K13-01.c: 39: {
;K13-01.c: 40: VarPowerUpCount++;
	incf	(_VarPowerUpCount),f
	line	41
	
l6907:	
;K13-01.c: 41: ADCPro();
	fcall	_ADCPro
	line	42
;K13-01.c: 42: }
	goto	l6915
	line	43
	
l6909:	
;K13-01.c: 43: else if(VarPowerUpCount>=100)
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_VarPowerUpCount),w
	skipc
	goto	u4801
	goto	u4800
u4801:
	goto	l6915
u4800:
	line	45
	
l6911:	
;K13-01.c: 44: {
;K13-01.c: 45: SystemONFlag=1;
	bsf	(_SystemONFlag/8),(_SystemONFlag)&7
	line	46
	
l6913:	
;K13-01.c: 46: VarPowerUpCount=0;
	clrf	(_VarPowerUpCount)
	line	49
	
l6915:	
;K13-01.c: 47: }
;K13-01.c: 49: if(SystemONFlag)
	btfss	(_SystemONFlag/8),(_SystemONFlag)&7
	goto	u4811
	goto	u4810
u4811:
	goto	l6923
u4810:
	line	51
	
l6917:	
;K13-01.c: 50: {
;K13-01.c: 51: ADCPro();
	fcall	_ADCPro
	line	52
	
l6919:	
;K13-01.c: 52: Motor();
	fcall	_Motor
	line	53
	
l6921:	
;K13-01.c: 53: DisplayPro();
	fcall	_DisplayPro
	line	58
	
l6923:	
;K13-01.c: 57: }
;K13-01.c: 58: Sec1sCnt++;
	incf	(_Sec1sCnt),f
	line	59
	
l6925:	
;K13-01.c: 59: if(Sec1sCnt>=100)
	movlw	low(064h)
	subwf	(_Sec1sCnt),w
	skipc
	goto	u4821
	goto	u4820
u4821:
	goto	l1789
u4820:
	line	61
	
l6927:	
;K13-01.c: 60: {
;K13-01.c: 61: Sec1sCnt=0;
	clrf	(_Sec1sCnt)
	line	62
	
l6929:	
;K13-01.c: 62: Sec1sPro();
	fcall	_Sec1sPro
	line	65
	
l1789:	
	return
	opt stack 0
GLOBAL	__end_of_Apply
	__end_of_Apply:
	signat	_Apply,89
	global	_Sec1sPro

;; *************** function _Sec1sPro *****************
;; Defined at:
;;		line 65 in file "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  TempPercent     2    6[BANK0 ] unsigned int 
;;  PercentErr      1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       2       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___bmul
;;		___lwdiv
;; This function is called by:
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	65
global __ptext5
__ptext5:	;psect for function _Sec1sPro
psect	text5
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	65
	global	__size_of_Sec1sPro
	__size_of_Sec1sPro	equ	__end_of_Sec1sPro-_Sec1sPro
	
_Sec1sPro:	
;incstack = 0
	opt	stack 3
; Regs used in _Sec1sPro: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l6581:	
	line	69
;ADC.c: 69: unsigned int TempPercent=0;
	clrf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	72
	
l6583:	
;ADC.c: 72: if(USBFlag)
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u4231
	goto	u4230
u4231:
	goto	l6621
u4230:
	line	74
	
l6585:	
;ADC.c: 73: {
;ADC.c: 74: if(ADCVal[2]<275)
	movlw	01h
	subwf	1+(_ADCVal)+04h,w
	movlw	013h
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipnc
	goto	u4241
	goto	u4240
u4241:
	goto	l6589
u4240:
	line	76
	
l6587:	
;ADC.c: 75: {
;ADC.c: 76: TempPercent=0;
	clrf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	77
;ADC.c: 77: }
	goto	l6597
	line	78
	
l6589:	
;ADC.c: 78: else if(ADCVal[2]>350)
	movlw	01h
	subwf	1+(_ADCVal)+04h,w
	movlw	05Fh
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipc
	goto	u4251
	goto	u4250
u4251:
	goto	l6593
u4250:
	line	80
	
l6591:	
;ADC.c: 79: {
;ADC.c: 80: TempPercent=99;
	movlw	063h
	movwf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	81
;ADC.c: 81: }
	goto	l6597
	line	84
	
l6593:	
;ADC.c: 82: else
;ADC.c: 83: {
;ADC.c: 84: TempPercent=ADCVal[2]-275;
	movf	1+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent+1)
	movf	0+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent)
	movlw	0EDh
	addwf	(Sec1sPro@TempPercent),f
	skipnc
	incf	(Sec1sPro@TempPercent+1),f
	movlw	0FEh
	addwf	(Sec1sPro@TempPercent+1),f
	line	85
	
l6595:	
;ADC.c: 85: TempPercent=TempPercent*4/3;
	movlw	03h
	movwf	(___lwdiv@divisor)
	clrf	(___lwdiv@divisor+1)
	movf	(Sec1sPro@TempPercent+1),w
	movwf	(??_Sec1sPro+0)+0+1
	movf	(Sec1sPro@TempPercent),w
	movwf	(??_Sec1sPro+0)+0
	clrc
	rlf	(??_Sec1sPro+0)+0,f
	rlf	(??_Sec1sPro+0)+1,f
	clrc
	rlf	(??_Sec1sPro+0)+0,f
	rlf	(??_Sec1sPro+0)+1,f
	movf	0+(??_Sec1sPro+0)+0,w
	movwf	(___lwdiv@dividend)
	movf	1+(??_Sec1sPro+0)+0,w
	movwf	(___lwdiv@dividend+1)
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(Sec1sPro@TempPercent+1)
	movf	(0+(?___lwdiv)),w
	movwf	(Sec1sPro@TempPercent)
	line	87
	
l6597:	
;ADC.c: 86: }
;ADC.c: 87: if(ActualPercent>TempPercent)
	movf	(Sec1sPro@ActualPercent),w
	movwf	(??_Sec1sPro+0)+0
	clrf	(??_Sec1sPro+0)+0+1
	movf	1+(??_Sec1sPro+0)+0,w
	subwf	(Sec1sPro@TempPercent+1),w
	skipz
	goto	u4265
	movf	0+(??_Sec1sPro+0)+0,w
	subwf	(Sec1sPro@TempPercent),w
u4265:
	skipnc
	goto	u4261
	goto	u4260
u4261:
	goto	l6603
u4260:
	line	89
	
l6599:	
;ADC.c: 88: {
;ADC.c: 89: if(ActualPercent)
	movf	((Sec1sPro@ActualPercent)),w
	btfsc	status,2
	goto	u4271
	goto	u4270
u4271:
	goto	l6609
u4270:
	line	91
	
l6601:	
;ADC.c: 90: {
;ADC.c: 91: ActualPercent--;
	decf	(Sec1sPro@ActualPercent),f
	goto	l6609
	line	94
	
l6603:	
;ADC.c: 94: else if(ActualPercent<TempPercent)
	movf	(Sec1sPro@ActualPercent),w
	movwf	(??_Sec1sPro+0)+0
	clrf	(??_Sec1sPro+0)+0+1
	movf	(Sec1sPro@TempPercent+1),w
	subwf	1+(??_Sec1sPro+0)+0,w
	skipz
	goto	u4285
	movf	(Sec1sPro@TempPercent),w
	subwf	0+(??_Sec1sPro+0)+0,w
u4285:
	skipnc
	goto	u4281
	goto	u4280
u4281:
	goto	l6609
u4280:
	line	96
	
l6605:	
;ADC.c: 95: {
;ADC.c: 96: if(ActualPercent<99)
	movlw	low(063h)
	subwf	(Sec1sPro@ActualPercent),w
	skipnc
	goto	u4291
	goto	u4290
u4291:
	goto	l6609
u4290:
	line	98
	
l6607:	
;ADC.c: 97: {
;ADC.c: 98: ActualPercent++;
	incf	(Sec1sPro@ActualPercent),f
	line	101
	
l6609:	
;ADC.c: 99: }
;ADC.c: 100: }
;ADC.c: 101: if(ActualPercent>BatPercent)
	movf	(Sec1sPro@ActualPercent),w
	subwf	(_BatPercent),w
	skipnc
	goto	u4301
	goto	u4300
u4301:
	goto	l6619
u4300:
	line	103
	
l6611:	
;ADC.c: 102: {
;ADC.c: 103: PercentErr=ActualPercent-BatPercent;
	movf	(_BatPercent),w
	subwf	(Sec1sPro@ActualPercent),w
	movwf	(Sec1sPro@PercentErr)
	line	104
	
l6613:	
;ADC.c: 104: if(PercentErr<5)
	movlw	low(05h)
	subwf	(Sec1sPro@PercentErr),w
	skipnc
	goto	u4311
	goto	u4310
u4311:
	goto	l6617
u4310:
	line	106
	
l6615:	
;ADC.c: 105: {
;ADC.c: 106: BatAddTime=90-15*PercentErr;
	movlw	low(0F1h)
	movwf	(___bmul@multiplicand)
	movf	(Sec1sPro@PercentErr),w
	fcall	___bmul
	addlw	05Ah
	movwf	(_BatAddTime)
	line	107
;ADC.c: 107: }
	goto	l6621
	line	110
	
l6617:	
;ADC.c: 108: else
;ADC.c: 109: {
;ADC.c: 110: BatAddTime=15;
	movlw	low(0Fh)
	movwf	(_BatAddTime)
	goto	l6621
	line	115
	
l6619:	
;ADC.c: 113: else
;ADC.c: 114: {
;ADC.c: 115: BatAddTime=240;
	movlw	low(0F0h)
	movwf	(_BatAddTime)
	line	120
	
l6621:	
;ADC.c: 116: }
;ADC.c: 117: }
;ADC.c: 120: if(WorkFlag)
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u4321
	goto	u4320
u4321:
	goto	l6663
u4320:
	line	122
	
l6623:	
;ADC.c: 121: {
;ADC.c: 122: if(ADCVal[2]<267)
	movlw	01h
	subwf	1+(_ADCVal)+04h,w
	movlw	0Bh
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipnc
	goto	u4331
	goto	u4330
u4331:
	goto	l6627
u4330:
	line	124
	
l6625:	
;ADC.c: 123: {
;ADC.c: 124: TempPercent=0;
	clrf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	125
;ADC.c: 125: }
	goto	l605
	line	126
	
l6627:	
;ADC.c: 126: else if(ADCVal[2]>333)
	movlw	01h
	subwf	1+(_ADCVal)+04h,w
	movlw	04Eh
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipc
	goto	u4341
	goto	u4340
u4341:
	goto	l6631
u4340:
	line	128
	
l6629:	
;ADC.c: 127: {
;ADC.c: 128: TempPercent=99;
	movlw	063h
	movwf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	129
;ADC.c: 129: }
	goto	l605
	line	132
	
l6631:	
;ADC.c: 130: else
;ADC.c: 131: {
;ADC.c: 132: TempPercent=ADCVal[2]-267;
	movf	1+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent+1)
	movf	0+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent)
	movlw	0F5h
	addwf	(Sec1sPro@TempPercent),f
	skipnc
	incf	(Sec1sPro@TempPercent+1),f
	movlw	0FEh
	addwf	(Sec1sPro@TempPercent+1),f
	line	133
	
l605:	
	line	134
;ADC.c: 133: }
;ADC.c: 134: if(TempPercent>=33)
	movlw	0
	subwf	(Sec1sPro@TempPercent+1),w
	movlw	021h
	skipnz
	subwf	(Sec1sPro@TempPercent),w
	skipc
	goto	u4351
	goto	u4350
u4351:
	goto	l6639
u4350:
	line	136
	
l6633:	
;ADC.c: 135: {
;ADC.c: 136: TempPercent=33+(ADCVal[2]-300)*2;
	movf	1+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent+1)
	movf	0+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent)
	
l6635:	
	clrc
	rlf	(Sec1sPro@TempPercent),f
	rlf	(Sec1sPro@TempPercent+1),f
	
l6637:	
	movlw	0C9h
	addwf	(Sec1sPro@TempPercent),f
	skipnc
	incf	(Sec1sPro@TempPercent+1),f
	movlw	0FDh
	addwf	(Sec1sPro@TempPercent+1),f
	line	138
	
l6639:	
;ADC.c: 137: }
;ADC.c: 138: if(ActualPercent>TempPercent)
	movf	(Sec1sPro@ActualPercent),w
	movwf	(??_Sec1sPro+0)+0
	clrf	(??_Sec1sPro+0)+0+1
	movf	1+(??_Sec1sPro+0)+0,w
	subwf	(Sec1sPro@TempPercent+1),w
	skipz
	goto	u4365
	movf	0+(??_Sec1sPro+0)+0,w
	subwf	(Sec1sPro@TempPercent),w
u4365:
	skipnc
	goto	u4361
	goto	u4360
u4361:
	goto	l6645
u4360:
	line	140
	
l6641:	
;ADC.c: 139: {
;ADC.c: 140: if(ActualPercent)
	movf	((Sec1sPro@ActualPercent)),w
	btfsc	status,2
	goto	u4371
	goto	u4370
u4371:
	goto	l6651
u4370:
	line	142
	
l6643:	
;ADC.c: 141: {
;ADC.c: 142: ActualPercent--;
	decf	(Sec1sPro@ActualPercent),f
	goto	l6651
	line	145
	
l6645:	
;ADC.c: 145: else if(ActualPercent<TempPercent)
	movf	(Sec1sPro@ActualPercent),w
	movwf	(??_Sec1sPro+0)+0
	clrf	(??_Sec1sPro+0)+0+1
	movf	(Sec1sPro@TempPercent+1),w
	subwf	1+(??_Sec1sPro+0)+0,w
	skipz
	goto	u4385
	movf	(Sec1sPro@TempPercent),w
	subwf	0+(??_Sec1sPro+0)+0,w
u4385:
	skipnc
	goto	u4381
	goto	u4380
u4381:
	goto	l6651
u4380:
	line	147
	
l6647:	
;ADC.c: 146: {
;ADC.c: 147: if(ActualPercent<99)
	movlw	low(063h)
	subwf	(Sec1sPro@ActualPercent),w
	skipnc
	goto	u4391
	goto	u4390
u4391:
	goto	l6651
u4390:
	line	149
	
l6649:	
;ADC.c: 148: {
;ADC.c: 149: ActualPercent++;
	incf	(Sec1sPro@ActualPercent),f
	line	152
	
l6651:	
;ADC.c: 150: }
;ADC.c: 151: }
;ADC.c: 152: if(ActualPercent<BatPercent)
	movf	(_BatPercent),w
	subwf	(Sec1sPro@ActualPercent),w
	skipnc
	goto	u4401
	goto	u4400
u4401:
	goto	l6663
u4400:
	line	154
	
l6653:	
;ADC.c: 153: {
;ADC.c: 154: PercentErr=BatPercent-ActualPercent;
	movf	(Sec1sPro@ActualPercent),w
	subwf	(_BatPercent),w
	movwf	(Sec1sPro@PercentErr)
	line	155
	
l6655:	
;ADC.c: 155: if(PercentErr<5&&ActualPercent)
	movlw	low(05h)
	subwf	(Sec1sPro@PercentErr),w
	skipnc
	goto	u4411
	goto	u4410
u4411:
	goto	l6661
u4410:
	
l6657:	
	movf	((Sec1sPro@ActualPercent)),w
	btfsc	status,2
	goto	u4421
	goto	u4420
u4421:
	goto	l6661
u4420:
	line	157
	
l6659:	
;ADC.c: 156: {
;ADC.c: 157: BatDecTime=75-15*PercentErr;
	movlw	low(0F1h)
	movwf	(___bmul@multiplicand)
	movf	(Sec1sPro@PercentErr),w
	fcall	___bmul
	addlw	04Bh
	movwf	(_BatDecTime)
	line	158
;ADC.c: 158: }
	goto	l619
	line	161
	
l6661:	
;ADC.c: 159: else
;ADC.c: 160: {
;ADC.c: 161: BatDecTime=8;
	movlw	low(08h)
	movwf	(_BatDecTime)
	goto	l619
	line	166
	
l6663:	
;ADC.c: 164: else
;ADC.c: 165: {
;ADC.c: 166: BatDecTime=210;
	movlw	low(0D2h)
	movwf	(_BatDecTime)
	line	173
	
l619:	
	return
	opt stack 0
GLOBAL	__end_of_Sec1sPro
	__end_of_Sec1sPro:
	signat	_Sec1sPro,89
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 6 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    3[COMMON] unsigned int 
;;  dividend        2    5[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    1[BANK0 ] unsigned int 
;;  counter         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         4       3       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Sec1sPro
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
	line	6
global __ptext6
__ptext6:	;psect for function ___lwdiv
psect	text6
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 3
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l6511:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
l6513:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u4131
	goto	u4130
u4131:
	goto	l6533
u4130:
	line	16
	
l6515:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	l6519
	line	18
	
l6517:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	19
	incf	(___lwdiv@counter),f
	line	17
	
l6519:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4141
	goto	u4140
u4141:
	goto	l6517
u4140:
	line	22
	
l6521:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	23
	
l6523:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4155
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4155:
	skipc
	goto	u4151
	goto	u4150
u4151:
	goto	l6529
u4150:
	line	24
	
l6525:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
l6527:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	27
	
l6529:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	28
	
l6531:	
	decfsz	(___lwdiv@counter),f
	goto	u4161
	goto	u4160
u4161:
	goto	l6521
u4160:
	line	30
	
l6533:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	31
	
l4564:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_Motor

;; *************** function _Motor *****************
;; Defined at:
;;		line 7 in file "C:\Users\Administrator\Desktop\project\K13-01\code\Motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\Motor.c"
	line	7
global __ptext7
__ptext7:	;psect for function _Motor
psect	text7
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\Motor.c"
	line	7
	global	__size_of_Motor
	__size_of_Motor	equ	__end_of_Motor-_Motor
	
_Motor:	
;incstack = 0
	opt	stack 3
; Regs used in _Motor: [wreg+status,2+status,0+pclath+cstack]
	line	9
	
l6845:	
;Motor.c: 9: if(!WorkFlag)
	btfsc	(_WorkFlag/8),(_WorkFlag)&7
	goto	u4641
	goto	u4640
u4641:
	goto	l4208
u4640:
	line	11
	
l6847:	
;Motor.c: 10: {
;Motor.c: 11: RA3=0;
	bcf	(43/8),(43)&7	;volatile
	line	12
	
l6849:	
;Motor.c: 12: WorkCnt=0;
	clrf	(_WorkCnt)
	clrf	(_WorkCnt+1)
	line	13
;Motor.c: 13: TimeDecCnt=0;
	clrf	(_TimeDecCnt)
	clrf	(_TimeDecCnt+1)
	line	14
;Motor.c: 14: }
	goto	l6873
	line	15
	
l4208:	
;Motor.c: 15: else if(WorkFlag&&!LockSta.LockFlag)
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u4651
	goto	u4650
u4651:
	goto	l6873
u4650:
	
l6851:	
	btfsc	(_LockSta),6
	goto	u4661
	goto	u4660
u4661:
	goto	l6873
u4660:
	line	17
	
l6853:	
;Motor.c: 16: {
;Motor.c: 17: RA3=1;
	bsf	(43/8),(43)&7	;volatile
	line	18
	
l6855:	
;Motor.c: 18: TimeDecCnt++;
	incf	(_TimeDecCnt),f
	skipnz
	incf	(_TimeDecCnt+1),f
	line	19
	
l6857:	
;Motor.c: 19: if(TimeDecCnt>=BatDecTime*100)
	movf	(_BatDecTime),w
	movwf	(___wmul@multiplier)
	clrf	(___wmul@multiplier+1)
	movlw	064h
	movwf	(___wmul@multiplicand)
	clrf	(___wmul@multiplicand+1)
	fcall	___wmul
	movf	(1+(?___wmul)),w
	subwf	(_TimeDecCnt+1),w
	skipz
	goto	u4675
	movf	(0+(?___wmul)),w
	subwf	(_TimeDecCnt),w
u4675:
	skipc
	goto	u4671
	goto	u4670
u4671:
	goto	l4211
u4670:
	line	21
	
l6859:	
;Motor.c: 20: {
;Motor.c: 21: TimeDecCnt=0;
	clrf	(_TimeDecCnt)
	clrf	(_TimeDecCnt+1)
	line	22
	
l6861:	
;Motor.c: 22: if(BatPercent)
	movf	((_BatPercent)),w
	btfsc	status,2
	goto	u4681
	goto	u4680
u4681:
	goto	l4211
u4680:
	line	24
	
l6863:	
;Motor.c: 23: {
;Motor.c: 24: BatPercent--;
	decf	(_BatPercent),f
	line	26
	
l4211:	
	line	27
;Motor.c: 25: }
;Motor.c: 26: }
;Motor.c: 27: WorkCnt++;
	incf	(_WorkCnt),f
	skipnz
	incf	(_WorkCnt+1),f
	line	28
	
l6865:	
;Motor.c: 28: if(WorkCnt>=6000)
	movlw	017h
	subwf	(_WorkCnt+1),w
	movlw	070h
	skipnz
	subwf	(_WorkCnt),w
	skipc
	goto	u4691
	goto	u4690
u4691:
	goto	l6873
u4690:
	line	30
	
l6867:	
;Motor.c: 29: {
;Motor.c: 30: WorkCnt=0;
	clrf	(_WorkCnt)
	clrf	(_WorkCnt+1)
	line	31
	
l6869:	
;Motor.c: 31: if(WorkMin<99)
	movlw	low(063h)
	subwf	(_WorkMin),w
	skipnc
	goto	u4701
	goto	u4700
u4701:
	goto	l4210
u4700:
	line	33
	
l6871:	
;Motor.c: 32: {
;Motor.c: 33: WorkMin++;
	incf	(_WorkMin),f
	goto	l6873
	line	36
	
l4210:	
	line	37
	
l6873:	
;Motor.c: 34: }
;Motor.c: 35: }
;Motor.c: 36: }
;Motor.c: 37: if(USBFlag)
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u4711
	goto	u4710
u4711:
	goto	l6889
u4710:
	line	39
	
l6875:	
;Motor.c: 38: {
;Motor.c: 39: TimeAddCnt++;
	incf	(_TimeAddCnt),f
	skipnz
	incf	(_TimeAddCnt+1),f
	line	40
	
l6877:	
;Motor.c: 40: if(TimeAddCnt>BatAddTime*100)
	movf	(_BatAddTime),w
	movwf	(___wmul@multiplier)
	clrf	(___wmul@multiplier+1)
	movlw	064h
	movwf	(___wmul@multiplicand)
	clrf	(___wmul@multiplicand+1)
	fcall	___wmul
	movf	(_TimeAddCnt+1),w
	subwf	(1+(?___wmul)),w
	skipz
	goto	u4725
	movf	(_TimeAddCnt),w
	subwf	(0+(?___wmul)),w
u4725:
	skipnc
	goto	u4721
	goto	u4720
u4721:
	goto	l6885
u4720:
	line	42
	
l6879:	
;Motor.c: 41: {
;Motor.c: 42: TimeAddCnt=0;
	clrf	(_TimeAddCnt)
	clrf	(_TimeAddCnt+1)
	line	43
	
l6881:	
;Motor.c: 43: if(BatPercent<99)
	movlw	low(063h)
	subwf	(_BatPercent),w
	skipnc
	goto	u4731
	goto	u4730
u4731:
	goto	l6885
u4730:
	line	45
	
l6883:	
;Motor.c: 44: {
;Motor.c: 45: BatPercent++;
	incf	(_BatPercent),f
	line	48
	
l6885:	
;Motor.c: 46: }
;Motor.c: 47: }
;Motor.c: 48: if(BatPercent<=250)
	movlw	low(0FBh)
	subwf	(_BatPercent),w
	skipnc
	goto	u4741
	goto	u4740
u4741:
	goto	l4218
u4740:
	line	50
	
l6887:	
;Motor.c: 49: {
;Motor.c: 50: RA5 =0;
	bcf	(45/8),(45)&7	;volatile
	line	51
;Motor.c: 51: }
	goto	l4221
	line	52
	
l4218:	
	line	54
;Motor.c: 52: else
;Motor.c: 53: {
;Motor.c: 54: RA5 =1;
	bsf	(45/8),(45)&7	;volatile
	goto	l4221
	line	59
	
l6889:	
;Motor.c: 57: else
;Motor.c: 58: {
;Motor.c: 59: TimeAddCnt=0;
	clrf	(_TimeAddCnt)
	clrf	(_TimeAddCnt+1)
	goto	l4218
	line	62
	
l4221:	
	return
	opt stack 0
GLOBAL	__end_of_Motor
	__end_of_Motor:
	signat	_Motor,89
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    3[COMMON] unsigned int 
;;  multiplicand    2    5[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    0[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         4       2       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Motor
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul16.c"
	line	15
global __ptext8
__ptext8:	;psect for function ___wmul
psect	text8
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul16.c"
	line	15
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
;incstack = 0
	opt	stack 3
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	43
	
l6829:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	45
	
l6831:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u4621
	goto	u4620
u4621:
	goto	l6835
u4620:
	line	46
	
l6833:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	47
	
l6835:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	48
	
l6837:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	49
	
l6839:	
	movf	((___wmul@multiplier)),w
iorwf	((___wmul@multiplier+1)),w
	btfss	status,2
	goto	u4631
	goto	u4630
u4631:
	goto	l6831
u4630:
	line	52
	
l6841:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	53
	
l4227:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	_KeyScan

;; *************** function _KeyScan *****************
;; Defined at:
;;		line 9 in file "C:\Users\Administrator\Desktop\project\K13-01\code\Key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/200
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          1       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\Key.c"
	line	9
global __ptext9
__ptext9:	;psect for function _KeyScan
psect	text9
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\Key.c"
	line	9
	global	__size_of_KeyScan
	__size_of_KeyScan	equ	__end_of_KeyScan-_KeyScan
	
_KeyScan:	
;incstack = 0
	opt	stack 4
; Regs used in _KeyScan: [wreg+status,2+status,0]
	line	11
	
l5957:	
;Key.c: 11: if(!RA6)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(46/8),(46)&7	;volatile
	goto	u2781
	goto	u2780
u2781:
	goto	l2373
u2780:
	line	13
	
l5959:	
;Key.c: 12: {
;Key.c: 13: KeyPress=1;
	bsf	(_KeyPress/8),(_KeyPress)&7
	line	14
;Key.c: 14: }
	goto	l2374
	line	15
	
l2373:	
	line	17
;Key.c: 15: else
;Key.c: 16: {
;Key.c: 17: KeyPress=0;
	bcf	(_KeyPress/8),(_KeyPress)&7
	line	18
	
l2374:	
	line	20
;Key.c: 18: }
;Key.c: 20: if(KeyPress&&KeyCnt<10&&KeyInBuf==KeyPress&&(!LowBatFlag||USBFlag)&&!LockSta.LockFlag)
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u2791
	goto	u2790
u2791:
	goto	l2375
u2790:
	
l5961:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipnc
	goto	u2801
	goto	u2800
u2801:
	goto	l2375
u2800:
	
l5963:	
	btfsc	(_KeyPress/8),(_KeyPress)&7
	goto	u2811
	goto	u2810
u2811:
	movlw	1
	goto	u2812
u2810:
	movlw	0
u2812:
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u2821
	goto	u2820
u2821:
	movlw	1
	goto	u2822
u2820:
	movlw	0
u2822:
	xorwf	(??_KeyScan+0)+0,w
	skipz
	goto	u2831
	goto	u2830
u2831:
	goto	l2375
u2830:
	
l5965:	
	btfss	(_LowBatFlag/8),(_LowBatFlag)&7
	goto	u2841
	goto	u2840
u2841:
	goto	l2377
u2840:
	
l5967:	
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u2851
	goto	u2850
u2851:
	goto	l2375
u2850:
	
l2377:	
	btfsc	(_LockSta),6
	goto	u2861
	goto	u2860
u2861:
	goto	l2375
u2860:
	line	22
	
l5969:	
;Key.c: 21: {
;Key.c: 22: KeyCnt++;
	incf	(_KeyCnt),f
	skipnz
	incf	(_KeyCnt+1),f
	line	23
	
l5971:	
;Key.c: 23: if(KeyCnt>=10)
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u2871
	goto	u2870
u2871:
	goto	l2382
u2870:
	line	25
	
l5973:	
;Key.c: 24: {
;Key.c: 25: WorkFlag=~WorkFlag;
	movlw	1<<((_WorkFlag)&7)
	xorwf	((_WorkFlag)/8),f
	line	26
	
l5975:	
;Key.c: 26: if(WorkFlag)
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u2881
	goto	u2880
u2881:
	goto	l2379
u2880:
	line	28
	
l5977:	
;Key.c: 27: {
;Key.c: 28: LEDWorkFlag=1;
	bsf	(_LEDWorkFlag/8),(_LEDWorkFlag)&7
	line	29
	
l2379:	
	line	30
;Key.c: 29: }
;Key.c: 30: if(!WorkFlag&&WorkMin!=0&&!USBFlag)
	btfsc	(_WorkFlag/8),(_WorkFlag)&7
	goto	u2891
	goto	u2890
u2891:
	goto	l2380
u2890:
	
l5979:	
	movf	((_WorkMin)),w
	btfsc	status,2
	goto	u2901
	goto	u2900
u2901:
	goto	l2380
u2900:
	
l5981:	
	btfsc	(_USBFlag/8),(_USBFlag)&7
	goto	u2911
	goto	u2910
u2911:
	goto	l2380
u2910:
	line	32
	
l5983:	
;Key.c: 31: {
;Key.c: 32: OnOffFlag=1;
	bsf	(_OnOffFlag/8),(_OnOffFlag)&7
	line	33
;Key.c: 33: }
	goto	l2382
	line	34
	
l2380:	
	line	36
;Key.c: 34: else
;Key.c: 35: {
;Key.c: 36: OnOffFlag=0;
	bcf	(_OnOffFlag/8),(_OnOffFlag)&7
	line	37
	
l5985:	
;Key.c: 37: WorkMin=0;
	clrf	(_WorkMin)
	goto	l2382
	line	41
	
l2375:	
;Key.c: 41: else if(KeyPress&&(KeyCnt>=10||LockSta.LockFlag)&&KeyCnt<250&&KeyInBuf==KeyPress&&!USBFlag)
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u2921
	goto	u2920
u2921:
	goto	l2383
u2920:
	
l5987:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipnc
	goto	u2931
	goto	u2930
u2931:
	goto	l5991
u2930:
	
l5989:	
	btfss	(_LockSta),6
	goto	u2941
	goto	u2940
u2941:
	goto	l2383
u2940:
	
l5991:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0FAh
	skipnz
	subwf	(_KeyCnt),w
	skipnc
	goto	u2951
	goto	u2950
u2951:
	goto	l2383
u2950:
	
l5993:	
	btfsc	(_KeyPress/8),(_KeyPress)&7
	goto	u2961
	goto	u2960
u2961:
	movlw	1
	goto	u2962
u2960:
	movlw	0
u2962:
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u2971
	goto	u2970
u2971:
	movlw	1
	goto	u2972
u2970:
	movlw	0
u2972:
	xorwf	(??_KeyScan+0)+0,w
	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l2383
u2980:
	
l5995:	
	btfsc	(_USBFlag/8),(_USBFlag)&7
	goto	u2991
	goto	u2990
u2991:
	goto	l2383
u2990:
	line	43
	
l5997:	
;Key.c: 42: {
;Key.c: 43: KeyCnt++;
	incf	(_KeyCnt),f
	skipnz
	incf	(_KeyCnt+1),f
	line	44
	
l5999:	
;Key.c: 44: if(KeyCnt>=250||(LockSta.LockFlag&&KeyCnt>=10))
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0FAh
	skipnz
	subwf	(_KeyCnt),w
	skipnc
	goto	u3001
	goto	u3000
u3001:
	goto	l6005
u3000:
	
l6001:	
	btfss	(_LockSta),6
	goto	u3011
	goto	u3010
u3011:
	goto	l2382
u3010:
	
l6003:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u3021
	goto	u3020
u3021:
	goto	l2382
u3020:
	line	46
	
l6005:	
;Key.c: 45: {
;Key.c: 46: KeyCnt=250;
	movlw	0FAh
	movwf	(_KeyCnt)
	clrf	(_KeyCnt+1)
	line	47
;Key.c: 47: LockNumb=2;
	movlw	low(02h)
	movwf	(_LockNumb)
	line	48
	
l6007:	
;Key.c: 48: if(!LockSta.LockFlag)
	btfsc	(_LockSta),6
	goto	u3031
	goto	u3030
u3031:
	goto	l2389
u3030:
	line	50
	
l6009:	
;Key.c: 49: {
;Key.c: 50: LockSta.LockStart=1;
	bsf	(_LockSta),0
	line	51
;Key.c: 51: LockSta.UnlockEnd=0;
	bcf	(_LockSta),5
	line	52
;Key.c: 52: }
	goto	l2390
	line	53
	
l2389:	
	line	55
;Key.c: 53: else
;Key.c: 54: {
;Key.c: 55: LockSta.UnlockStart=1;
	bsf	(_LockSta),3
	line	56
;Key.c: 56: LockSta.LockEnd=0;
	bcf	(_LockSta),2
	line	57
	
l2390:	
	line	58
;Key.c: 57: }
;Key.c: 58: OnOffFlag=0;
	bcf	(_OnOffFlag/8),(_OnOffFlag)&7
	goto	l2382
	line	61
	
l2383:	
;Key.c: 61: else if(KeyPress&&KeyCnt>=250&&KeyInBuf==KeyPress&&!LockSta.LockEnd&&!LockSta.UnlockEnd)
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u3041
	goto	u3040
u3041:
	goto	l2392
u3040:
	
l6011:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0FAh
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u3051
	goto	u3050
u3051:
	goto	l2392
u3050:
	
l6013:	
	btfsc	(_KeyPress/8),(_KeyPress)&7
	goto	u3061
	goto	u3060
u3061:
	movlw	1
	goto	u3062
u3060:
	movlw	0
u3062:
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u3071
	goto	u3070
u3071:
	movlw	1
	goto	u3072
u3070:
	movlw	0
u3072:
	xorwf	(??_KeyScan+0)+0,w
	skipz
	goto	u3081
	goto	u3080
u3081:
	goto	l2392
u3080:
	
l6015:	
	btfsc	(_LockSta),2
	goto	u3091
	goto	u3090
u3091:
	goto	l2392
u3090:
	
l6017:	
	btfsc	(_LockSta),5
	goto	u3101
	goto	u3100
u3101:
	goto	l2392
u3100:
	line	63
	
l6019:	
;Key.c: 62: {
;Key.c: 63: KeyCnt++;
	incf	(_KeyCnt),f
	skipnz
	incf	(_KeyCnt+1),f
	line	64
	
l6021:	
;Key.c: 64: if(KeyCnt>=1750)
	movlw	06h
	subwf	(_KeyCnt+1),w
	movlw	0D6h
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u3111
	goto	u3110
u3111:
	goto	l2382
u3110:
	line	66
	
l6023:	
;Key.c: 65: {
;Key.c: 66: KeyCnt=1750;
	movlw	0D6h
	movwf	(_KeyCnt)
	movlw	06h
	movwf	((_KeyCnt))+1
	line	67
	
l6025:	
;Key.c: 67: LockSta.LockFlag=!LockSta.LockFlag;
	clrc
	btfss	(_LockSta),6
	setc
	btfsc	status,0
	goto	u3121
	goto	u3120
	
u3121:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_LockSta),6
	goto	u3134
u3120:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_LockSta),6
u3134:
	line	68
	
l6027:	
;Key.c: 68: if(LockSta.LockFlag)
	btfss	(_LockSta),6
	goto	u3141
	goto	u3140
u3141:
	goto	l2394
u3140:
	line	70
	
l6029:	
;Key.c: 69: {
;Key.c: 70: LockSta.LockStart=0;
	bcf	(_LockSta),0
	line	71
;Key.c: 71: LockSta.LockEnd=1;
	bsf	(_LockSta),2
	line	72
;Key.c: 72: WorkFlag=0;
	bcf	(_WorkFlag/8),(_WorkFlag)&7
	line	73
;Key.c: 73: LEDWorkFlag=0;
	bcf	(_LEDWorkFlag/8),(_LEDWorkFlag)&7
	line	74
;Key.c: 74: }
	goto	l2382
	line	75
	
l2394:	
	line	77
;Key.c: 75: else
;Key.c: 76: {
;Key.c: 77: LockSta.UnlockStart=0;
	bcf	(_LockSta),3
	line	78
;Key.c: 78: LockSta.UnlockEnd=1;
	bsf	(_LockSta),5
	line	79
;Key.c: 79: WorkFlag=1;
	bsf	(_WorkFlag/8),(_WorkFlag)&7
	line	80
;Key.c: 80: LEDWorkFlag=1;
	bsf	(_LEDWorkFlag/8),(_LEDWorkFlag)&7
	goto	l2382
	line	84
	
l2392:	
;Key.c: 84: else if(!KeyPress||KeyInBuf!=KeyPress)
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l6033
u3150:
	
l6031:	
	btfsc	(_KeyPress/8),(_KeyPress)&7
	goto	u3161
	goto	u3160
u3161:
	movlw	1
	goto	u3162
u3160:
	movlw	0
u3162:
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u3171
	goto	u3170
u3171:
	movlw	1
	goto	u3172
u3170:
	movlw	0
u3172:
	xorwf	(??_KeyScan+0)+0,w
	skipnz
	goto	u3181
	goto	u3180
u3181:
	goto	l2382
u3180:
	line	86
	
l6033:	
;Key.c: 85: {
;Key.c: 86: KeyCnt=0;
	clrf	(_KeyCnt)
	clrf	(_KeyCnt+1)
	line	87
	
l6035:	
;Key.c: 87: LockSta.UnlockEnd=0;
	bcf	(_LockSta),5
	line	88
	
l6037:	
;Key.c: 88: if(LockSta.LockEnd)
	btfss	(_LockSta),2
	goto	u3191
	goto	u3190
u3191:
	goto	l2400
u3190:
	line	90
	
l6039:	
;Key.c: 89: {
;Key.c: 90: LockSta.LockEnd=0;
	bcf	(_LockSta),2
	line	91
;Key.c: 91: LockSta.UnlockFail=1;
	bsf	(_LockSta),4
	line	92
	
l2400:	
	line	93
;Key.c: 92: }
;Key.c: 93: if(LockSta.UnlockStart)
	btfss	(_LockSta),3
	goto	u3201
	goto	u3200
u3201:
	goto	l2401
u3200:
	line	95
	
l6041:	
;Key.c: 94: {
;Key.c: 95: LockSta.UnlockStart=0;
	bcf	(_LockSta),3
	line	96
;Key.c: 96: LockSta.UnlockFail=1;
	bsf	(_LockSta),4
	line	97
	
l2401:	
	line	98
;Key.c: 97: }
;Key.c: 98: if(LockSta.LockStart)
	btfss	(_LockSta),0
	goto	u3211
	goto	u3210
u3211:
	goto	l2382
u3210:
	line	100
	
l6043:	
;Key.c: 99: {
;Key.c: 100: LockSta.LockStart=0;
	bcf	(_LockSta),0
	line	103
	
l2382:	
;Key.c: 101: }
;Key.c: 102: }
;Key.c: 103: KeyInBuf=KeyPress;
	bcf	(_KeyInBuf/8),(_KeyInBuf)&7
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u3225
	bsf	(_KeyInBuf/8),(_KeyInBuf)&7
u3225:

	line	105
;Key.c: 105: if(!RA7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(47/8),(47)&7	;volatile
	goto	u3231
	goto	u3230
u3231:
	goto	l2403
u3230:
	line	107
	
l6045:	
;Key.c: 106: {
;Key.c: 107: USBLink=1;
	bsf	(_USBLink/8),(_USBLink)&7
	line	108
;Key.c: 108: }
	goto	l2404
	line	109
	
l2403:	
	line	111
;Key.c: 109: else
;Key.c: 110: {
;Key.c: 111: USBLink=0;
	bcf	(_USBLink/8),(_USBLink)&7
	line	112
	
l2404:	
	line	114
;Key.c: 112: }
;Key.c: 114: if(USBLink&&!IovFlag)
	btfss	(_USBLink/8),(_USBLink)&7
	goto	u3241
	goto	u3240
u3241:
	goto	l2405
u3240:
	
l6047:	
	btfsc	(_IovFlag/8),(_IovFlag)&7
	goto	u3251
	goto	u3250
u3251:
	goto	l2405
u3250:
	line	116
	
l6049:	
;Key.c: 115: {
;Key.c: 116: USBFlag=1;
	bsf	(_USBFlag/8),(_USBFlag)&7
	line	117
;Key.c: 117: LockSta.LockFlag=0;
	bcf	(_LockSta),6
	line	118
;Key.c: 118: }
	goto	l2408
	line	119
	
l2405:	
;Key.c: 119: else if(!USBLink)
	btfsc	(_USBLink/8),(_USBLink)&7
	goto	u3261
	goto	u3260
u3261:
	goto	l2408
u3260:
	line	121
	
l6051:	
;Key.c: 120: {
;Key.c: 121: USBFlag=0;
	bcf	(_USBFlag/8),(_USBFlag)&7
	line	123
	
l2408:	
	return
	opt stack 0
GLOBAL	__end_of_KeyScan
	__end_of_KeyScan:
	signat	_KeyScan,89
	global	_DisplayPro

;; *************** function _DisplayPro *****************
;; Defined at:
;;		line 144 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : B00/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_DisplayIcon
;;		_ErrPro
;;		_LockPro
;;		_USBLedPro
;;		_WorkLedPro
;; This function is called by:
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	144
global __ptext10
__ptext10:	;psect for function _DisplayPro
psect	text10
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	144
	global	__size_of_DisplayPro
	__size_of_DisplayPro	equ	__end_of_DisplayPro-_DisplayPro
	
_DisplayPro:	
;incstack = 0
	opt	stack 2
; Regs used in _DisplayPro: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	146
	
l6715:	
;LED.c: 146: LedIndex=0;
	clrf	(_LedIndex)
	clrf	(_LedIndex+1)
	line	147
	
l6717:	
;LED.c: 147: WorkLedPro();
	fcall	_WorkLedPro
	line	148
	
l6719:	
;LED.c: 148: USBLedPro();
	fcall	_USBLedPro
	line	149
	
l6721:	
;LED.c: 149: LockPro();
	fcall	_LockPro
	line	150
	
l6723:	
;LED.c: 150: ErrPro();
	fcall	_ErrPro
	line	151
	
l6725:	
;LED.c: 151: DisplayIcon(LedIndex);
	movf	(_LedIndex+1),w
	movwf	(DisplayIcon@index+1)
	movf	(_LedIndex),w
	movwf	(DisplayIcon@index)
	fcall	_DisplayIcon
	line	152
	
l3024:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayPro
	__end_of_DisplayPro:
	signat	_DisplayPro,89
	global	_WorkLedPro

;; *************** function _WorkLedPro *****************
;; Defined at:
;;		line 192 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       2       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___bmul
;;		___lbdiv
;;		___lbmod
;; This function is called by:
;;		_DisplayPro
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	line	192
global __ptext11
__ptext11:	;psect for function _WorkLedPro
psect	text11
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	192
	global	__size_of_WorkLedPro
	__size_of_WorkLedPro	equ	__end_of_WorkLedPro-_WorkLedPro
	
_WorkLedPro:	
;incstack = 0
	opt	stack 2
; Regs used in _WorkLedPro: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	199
	
l6391:	
;LED.c: 194: static char LedSwitchCnt=0;
;LED.c: 195: static bit LedSwitchFlag=0;
;LED.c: 196: static char index=0;
;LED.c: 197: static unsigned char cnt=0;
;LED.c: 198: static bit dir=0;
;LED.c: 199: if(LEDWorkFlag&&!OnOffFlag&&!LockSta.LockFlag&&!LockSta.LockStart&&(!USBFlag||WorkFlag))
	btfss	(_LEDWorkFlag/8),(_LEDWorkFlag)&7
	goto	u3851
	goto	u3850
u3851:
	goto	l3050
u3850:
	
l6393:	
	btfsc	(_OnOffFlag/8),(_OnOffFlag)&7
	goto	u3861
	goto	u3860
u3861:
	goto	l3050
u3860:
	
l6395:	
	btfsc	(_LockSta),6
	goto	u3871
	goto	u3870
u3871:
	goto	l3050
u3870:
	
l6397:	
	btfsc	(_LockSta),0
	goto	u3881
	goto	u3880
u3881:
	goto	l3050
u3880:
	
l6399:	
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u3891
	goto	u3890
u3891:
	goto	l6403
u3890:
	
l6401:	
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u3901
	goto	u3900
u3901:
	goto	l3050
u3900:
	line	201
	
l6403:	
;LED.c: 200: {
;LED.c: 201: if(BatPercent<=10&&WorkFlag)
	movlw	low(0Bh)
	subwf	(_BatPercent),w
	skipnc
	goto	u3911
	goto	u3910
u3911:
	goto	l6415
u3910:
	
l6405:	
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u3921
	goto	u3920
u3921:
	goto	l6415
u3920:
	line	203
	
l6407:	
;LED.c: 202: {
;LED.c: 203: LedSwitchCnt++;
	incf	(WorkLedPro@LedSwitchCnt),f
	line	204
	
l6409:	
;LED.c: 204: if(LedSwitchCnt>=80)
	movlw	low(050h)
	subwf	(WorkLedPro@LedSwitchCnt),w
	skipc
	goto	u3931
	goto	u3930
u3931:
	goto	l6419
u3930:
	line	206
	
l6411:	
;LED.c: 205: {
;LED.c: 206: LedSwitchCnt=0;
	clrf	(WorkLedPro@LedSwitchCnt)
	line	207
	
l6413:	
;LED.c: 207: LedSwitchFlag=!LedSwitchFlag;
	movlw	1<<((WorkLedPro@LedSwitchFlag)&7)
	xorwf	((WorkLedPro@LedSwitchFlag)/8),f
	goto	l6419
	line	212
	
l6415:	
;LED.c: 210: else
;LED.c: 211: {
;LED.c: 212: LedSwitchCnt=0;
	clrf	(WorkLedPro@LedSwitchCnt)
	line	213
	
l6417:	
;LED.c: 213: LedSwitchFlag=1;
	bsf	(WorkLedPro@LedSwitchFlag/8),(WorkLedPro@LedSwitchFlag)&7
	line	215
	
l6419:	
;LED.c: 214: }
;LED.c: 215: if(LedSwitchFlag)
	btfss	(WorkLedPro@LedSwitchFlag/8),(WorkLedPro@LedSwitchFlag)&7
	goto	u3941
	goto	u3940
u3941:
	goto	l3062
u3940:
	line	217
	
l6421:	
;LED.c: 216: {
;LED.c: 217: LedIndex=NumbArr[BatPercent/10];
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_BatPercent),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(_LedIndex)
	clrf	(_LedIndex+1)
	line	218
	
l6423:	
;LED.c: 218: LedIndex|=(unsigned int)NumbArr[BatPercent%10]<<7;
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_BatPercent),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0
	clrf	(??_WorkLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u3955:
	clrc
	rlf	(??_WorkLedPro+0)+0,f
	rlf	(??_WorkLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u3955
	movf	0+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex+1),f
	goto	l3062
	line	221
	
l3050:	
;LED.c: 221: else if(OnOffFlag)
	btfss	(_OnOffFlag/8),(_OnOffFlag)&7
	goto	u3961
	goto	u3960
u3961:
	goto	l3062
u3960:
	line	223
	
l6425:	
;LED.c: 222: {
;LED.c: 223: cnt++;
	incf	(WorkLedPro@cnt),f
	line	224
	
l6427:	
;LED.c: 224: if(cnt>=40)
	movlw	low(028h)
	subwf	(WorkLedPro@cnt),w
	skipc
	goto	u3971
	goto	u3970
u3971:
	goto	l6447
u3970:
	line	226
	
l6429:	
;LED.c: 225: {
;LED.c: 226: cnt=0;
	clrf	(WorkLedPro@cnt)
	line	227
	
l6431:	
;LED.c: 227: index++;
	incf	(WorkLedPro@index),f
	line	228
	
l6433:	
;LED.c: 228: if(index>=7)
	movlw	low(07h)
	subwf	(WorkLedPro@index),w
	skipc
	goto	u3981
	goto	u3980
u3981:
	goto	l6447
u3980:
	line	230
	
l6435:	
;LED.c: 229: {
;LED.c: 230: if(dir)
	btfss	(WorkLedPro@dir/8),(WorkLedPro@dir)&7
	goto	u3991
	goto	u3990
u3991:
	goto	l6443
u3990:
	line	232
	
l6437:	
;LED.c: 231: {
;LED.c: 232: OnOffFlag=0;
	bcf	(_OnOffFlag/8),(_OnOffFlag)&7
	line	233
	
l6439:	
;LED.c: 233: WorkMin=0;
	clrf	(_WorkMin)
	goto	l3062
	line	236
	
l6443:	
;LED.c: 235: }
;LED.c: 236: dir=!dir;
	movlw	1<<((WorkLedPro@dir)&7)
	xorwf	((WorkLedPro@dir)/8),f
	line	237
	
l6445:	
;LED.c: 237: index=0;
	clrf	(WorkLedPro@index)
	line	240
	
l6447:	
;LED.c: 238: }
;LED.c: 239: }
;LED.c: 240: if(!dir)
	btfsc	(WorkLedPro@dir/8),(WorkLedPro@dir)&7
	goto	u4001
	goto	u4000
u4001:
	goto	l6455
u4000:
	line	242
	
l6449:	
;LED.c: 241: {
;LED.c: 242: LedIndex=NumbArr[BatPercent/10];
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_BatPercent),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(_LedIndex)
	clrf	(_LedIndex+1)
	line	243
	
l6451:	
;LED.c: 243: LedIndex|=(unsigned int)NumbArr[BatPercent%10]<<7;
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_BatPercent),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0
	clrf	(??_WorkLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u4015:
	clrc
	rlf	(??_WorkLedPro+0)+0,f
	rlf	(??_WorkLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u4015
	movf	0+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex+1),f
	line	244
	
l6453:	
;LED.c: 244: LedIndex&=~OffHideNumbArr[index];
	clrc
	rlf	(WorkLedPro@index),w
	addlw	low(_OffHideNumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0+1
	comf	(??_WorkLedPro+0)+0,f
	comf	(??_WorkLedPro+0)+1,f
	movf	0+(??_WorkLedPro+0)+0,w
	andwf	(_LedIndex),f
	movf	1+(??_WorkLedPro+0)+0,w
	andwf	(_LedIndex+1),f
	line	245
;LED.c: 245: }
	goto	l3062
	line	248
	
l6455:	
;LED.c: 246: else
;LED.c: 247: {
;LED.c: 248: LedIndex=NumbArr[WorkMin/10];
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_WorkMin),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(_LedIndex)
	clrf	(_LedIndex+1)
	line	249
	
l6457:	
;LED.c: 249: LedIndex|=(unsigned int)NumbArr[WorkMin%10]<<7;
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_WorkMin),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0
	clrf	(??_WorkLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u4025:
	clrc
	rlf	(??_WorkLedPro+0)+0,f
	rlf	(??_WorkLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u4025
	movf	0+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex+1),f
	line	250
	
l6459:	
;LED.c: 250: LedIndex&=~OffHideNumbArr[6-index];
	movlw	low(-2)
	movwf	(___bmul@multiplicand)
	movf	(WorkLedPro@index),w
	fcall	___bmul
	addlw	low(_OffHideNumbArr|((0x0)<<8)+0Ch)&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0+1
	comf	(??_WorkLedPro+0)+0,f
	comf	(??_WorkLedPro+0)+1,f
	movf	0+(??_WorkLedPro+0)+0,w
	andwf	(_LedIndex),f
	movf	1+(??_WorkLedPro+0)+0,w
	andwf	(_LedIndex+1),f
	line	253
	
l3062:	
	return
	opt stack 0
GLOBAL	__end_of_WorkLedPro
	__end_of_WorkLedPro:
	signat	_WorkLedPro,89
	global	___bmul

;; *************** function ___bmul *****************
;; Defined at:
;;		line 4 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul8.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    5[COMMON] unsigned char 
;;  product         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Sec1sPro
;;		_WorkLedPro
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul8.c"
	line	4
global __ptext12
__ptext12:	;psect for function ___bmul
psect	text12
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul8.c"
	line	4
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
;incstack = 0
	opt	stack 3
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	6
	
l5493:	
	clrf	(___bmul@product)
	line	43
	
l5495:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u1831
	goto	u1830
u1831:
	goto	l5499
u1830:
	line	44
	
l5497:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	45
	
l5499:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	46
	
l5501:	
	clrc
	rrf	(___bmul@multiplier),f
	line	47
	movf	((___bmul@multiplier)),w
	btfss	status,2
	goto	u1841
	goto	u1840
u1841:
	goto	l5495
u1840:
	line	50
	
l5503:	
	movf	(___bmul@product),w
	line	51
	
l4245:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
	signat	___bmul,8313
	global	_USBLedPro

;; *************** function _USBLedPro *****************
;; Defined at:
;;		line 154 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       3       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lbdiv
;;		___lbmod
;; This function is called by:
;;		_DisplayPro
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	154
global __ptext13
__ptext13:	;psect for function _USBLedPro
psect	text13
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	154
	global	__size_of_USBLedPro
	__size_of_USBLedPro	equ	__end_of_USBLedPro-_USBLedPro
	
_USBLedPro:	
;incstack = 0
	opt	stack 2
; Regs used in _USBLedPro: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	159
	
l6461:	
;LED.c: 156: static unsigned char index=0;
;LED.c: 157: static unsigned char cnt=0;
;LED.c: 159: if(USBFlag&&!WorkFlag&&!OnOffFlag)
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u4031
	goto	u4030
u4031:
	goto	l6493
u4030:
	
l6463:	
	btfsc	(_WorkFlag/8),(_WorkFlag)&7
	goto	u4041
	goto	u4040
u4041:
	goto	l6493
u4040:
	
l6465:	
	btfsc	(_OnOffFlag/8),(_OnOffFlag)&7
	goto	u4051
	goto	u4050
u4051:
	goto	l6493
u4050:
	line	161
	
l6467:	
;LED.c: 160: {
;LED.c: 161: cnt++;
	incf	(USBLedPro@cnt),f
	line	162
	
l6469:	
;LED.c: 162: if(cnt>=40)
	movlw	low(028h)
	subwf	(USBLedPro@cnt),w
	skipc
	goto	u4061
	goto	u4060
u4061:
	goto	l6479
u4060:
	line	164
	
l6471:	
;LED.c: 163: {
;LED.c: 164: cnt=0;
	clrf	(USBLedPro@cnt)
	line	165
	
l6473:	
;LED.c: 165: index++;
	incf	(USBLedPro@index),f
	line	166
	
l6475:	
;LED.c: 166: if(index>=11)
	movlw	low(0Bh)
	subwf	(USBLedPro@index),w
	skipc
	goto	u4071
	goto	u4070
u4071:
	goto	l6479
u4070:
	line	168
	
l6477:	
;LED.c: 167: {
;LED.c: 168: index=0;
	clrf	(USBLedPro@index)
	line	171
	
l6479:	
;LED.c: 169: }
;LED.c: 170: }
;LED.c: 171: if(BatPercent<99)
	movlw	low(063h)
	subwf	(_BatPercent),w
	skipnc
	goto	u4081
	goto	u4080
u4081:
	goto	l6487
u4080:
	line	173
	
l6481:	
;LED.c: 172: {
;LED.c: 173: LedIndex=NumbArr[BatPercent/10];
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_BatPercent),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(_LedIndex)
	clrf	(_LedIndex+1)
	line	174
	
l6483:	
;LED.c: 174: LedIndex|=((unsigned int)NumbArr[BatPercent%10]&~HideNumbArr[index])<<7;
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_BatPercent),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr
	movf	indf,w
	movwf	(??_USBLedPro+0)+0
	movf	(USBLedPro@index),w
	addlw	low(_HideNumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	comf	indf,w
	andwf	(??_USBLedPro+0)+0,w
	movwf	(??_USBLedPro+1)+0
	clrf	(??_USBLedPro+1)+0+1
	movlw	07h
	movwf	btemp+1
u4095:
	clrc
	rlf	(??_USBLedPro+1)+0,f
	rlf	(??_USBLedPro+1)+1,f
	decfsz	btemp+1,f
	goto	u4095
	movf	0+(??_USBLedPro+1)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_USBLedPro+1)+0,w
	iorwf	(_LedIndex+1),f
	line	175
	
l6485:	
;LED.c: 175: LedIndex&=~HideNumbArr[index];
	movf	(USBLedPro@index),w
	addlw	low(_HideNumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	comf	indf,w
	movwf	(??_USBLedPro+0)+0
	clrf	(??_USBLedPro+0)+0+1
	comf	(??_USBLedPro+0)+0+1
	movf	0+(??_USBLedPro+0)+0,w
	andwf	(_LedIndex),f
	movf	1+(??_USBLedPro+0)+0,w
	andwf	(_LedIndex+1),f
	line	176
;LED.c: 176: }
	goto	l3037
	line	179
	
l6487:	
;LED.c: 177: else
;LED.c: 178: {
;LED.c: 179: index=0;
	clrf	(USBLedPro@index)
	line	180
	
l6489:	
;LED.c: 180: LedIndex=NumbArr[BatPercent/10];
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_BatPercent),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(_LedIndex)
	clrf	(_LedIndex+1)
	line	181
	
l6491:	
;LED.c: 181: LedIndex|=NumbArr[BatPercent%10]<<7;
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_BatPercent),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_USBLedPro+0)+0
	clrf	(??_USBLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u4105:
	clrc
	rlf	(??_USBLedPro+0)+0,f
	rlf	(??_USBLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u4105
	movf	0+(??_USBLedPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_USBLedPro+0)+0,w
	iorwf	(_LedIndex+1),f
	goto	l3037
	line	187
	
l6493:	
;LED.c: 185: else
;LED.c: 186: {
;LED.c: 187: index=0;
	clrf	(USBLedPro@index)
	line	188
;LED.c: 188: cnt=0;
	clrf	(USBLedPro@cnt)
	line	190
	
l3037:	
	return
	opt stack 0
GLOBAL	__end_of_USBLedPro
	__end_of_USBLedPro:
	signat	_USBLedPro,89
	global	___lbmod

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 4 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    5[COMMON] unsigned char 
;;  rem             1    7[COMMON] unsigned char 
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: B00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         3       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_WorkLedPro
;;		_USBLedPro
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbmod.c"
	line	4
global __ptext14
__ptext14:	;psect for function ___lbmod
psect	text14
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbmod.c"
	line	4
	global	__size_of___lbmod
	__size_of___lbmod	equ	__end_of___lbmod-___lbmod
	
___lbmod:	
;incstack = 0
	opt	stack 2
; Regs used in ___lbmod: [wreg+status,2+status,0]
;___lbmod@dividend stored from wreg
	movwf	(___lbmod@dividend)
	line	9
	
l5531:	
	movlw	low(08h)
	movwf	(___lbmod@counter)
	line	10
	
l5533:	
	clrf	(___lbmod@rem)
	line	12
	
l5535:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u1895:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u1895
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l5537:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l5539:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u1901
	goto	u1900
u1901:
	goto	l5543
u1900:
	line	15
	
l5541:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l5543:	
	decfsz	(___lbmod@counter),f
	goto	u1911
	goto	u1910
u1911:
	goto	l5535
u1910:
	line	17
	
l5545:	
	movf	(___lbmod@rem),w
	line	18
	
l4496:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
	signat	___lbmod,8313
	global	___lbdiv

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 4 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    4[COMMON] unsigned char 
;;  quotient        1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_WorkLedPro
;;		_USBLedPro
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbdiv.c"
	line	4
global __ptext15
__ptext15:	;psect for function ___lbdiv
psect	text15
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbdiv.c"
	line	4
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	movwf	(___lbdiv@dividend)
	line	9
	
l5507:	
	clrf	(___lbdiv@quotient)
	line	10
	
l5509:	
	movf	((___lbdiv@divisor)),w
	btfsc	status,2
	goto	u1851
	goto	u1850
u1851:
	goto	l5527
u1850:
	line	11
	
l5511:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l5515
	
l4485:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l5513:	
	incf	(___lbdiv@counter),f
	line	12
	
l5515:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u1861
	goto	u1860
u1861:
	goto	l4485
u1860:
	line	16
	
l4487:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l5517:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u1871
	goto	u1870
u1871:
	goto	l5523
u1870:
	line	19
	
l5519:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l5521:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l5523:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l5525:	
	decfsz	(___lbdiv@counter),f
	goto	u1881
	goto	u1880
u1881:
	goto	l4487
u1880:
	line	25
	
l5527:	
	movf	(___lbdiv@quotient),w
	line	26
	
l4490:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_LockPro

;; *************** function _LockPro *****************
;; Defined at:
;;		line 255 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayPro
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	255
global __ptext16
__ptext16:	;psect for function _LockPro
psect	text16
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	255
	global	__size_of_LockPro
	__size_of_LockPro	equ	__end_of_LockPro-_LockPro
	
_LockPro:	
;incstack = 0
	opt	stack 3
; Regs used in _LockPro: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	260
	
l5735:	
;LED.c: 257: static unsigned char SwitchCnt=0,LockSwitchCnt=0;
;LED.c: 258: static unsigned char Ledcnt=0;
;LED.c: 259: static bit LedSwitchFlag=0;
;LED.c: 260: if(!USBFlag)
	btfsc	(_USBFlag/8),(_USBFlag)&7
	goto	u2311
	goto	u2310
u2311:
	goto	l3090
u2310:
	line	262
	
l5737:	
;LED.c: 261: {
;LED.c: 262: if(LockSta.LockStart||LockSta.UnlockStart)
	btfsc	(_LockSta),0
	goto	u2321
	goto	u2320
u2321:
	goto	l5741
u2320:
	
l5739:	
	btfss	(_LockSta),3
	goto	u2331
	goto	u2330
u2331:
	goto	l5755
u2330:
	line	264
	
l5741:	
;LED.c: 263: {
;LED.c: 264: SwitchCnt++;
	incf	(LockPro@SwitchCnt),f
	line	265
	
l5743:	
;LED.c: 265: if(SwitchCnt>=100)
	movlw	low(064h)
	subwf	(LockPro@SwitchCnt),w
	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l5751
u2340:
	line	267
	
l5745:	
;LED.c: 266: {
;LED.c: 267: SwitchCnt=0;
	clrf	(LockPro@SwitchCnt)
	line	268
	
l5747:	
;LED.c: 268: if(LockNumb>0)
	movf	((_LockNumb)),w
	btfsc	status,2
	goto	u2351
	goto	u2350
u2351:
	goto	l5751
u2350:
	line	270
	
l5749:	
;LED.c: 269: {
;LED.c: 270: LockNumb--;
	decf	(_LockNumb),f
	line	273
	
l5751:	
;LED.c: 271: }
;LED.c: 272: }
;LED.c: 273: LedIndex=NumbArr[0];
	bsf	status, 5	;RP0=1, select bank1
	movf	(_NumbArr)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_LedIndex)
	clrf	(_LedIndex+1)
	line	274
	
l5753:	
;LED.c: 274: LedIndex|=(unsigned int)NumbArr[LockNumb+1]<<7;
	movf	(_LockNumb),w
	addlw	low(_NumbArr|((0x0)<<8)+01h)&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_LockPro+0)+0
	clrf	(??_LockPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u2365:
	clrc
	rlf	(??_LockPro+0)+0,f
	rlf	(??_LockPro+0)+1,f
	decfsz	btemp+1,f
	goto	u2365
	movf	0+(??_LockPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_LockPro+0)+0,w
	iorwf	(_LedIndex+1),f
	line	275
;LED.c: 275: }
	goto	l5757
	line	278
	
l5755:	
;LED.c: 276: else
;LED.c: 277: {
;LED.c: 278: SwitchCnt=0;
	clrf	(LockPro@SwitchCnt)
	line	280
	
l5757:	
;LED.c: 279: }
;LED.c: 280: if(LockSta.LockEnd||LockSta.UnlockFail||LockSta.UnlockStart)
	btfsc	(_LockSta),2
	goto	u2371
	goto	u2370
u2371:
	goto	l5763
u2370:
	
l5759:	
	btfsc	(_LockSta),4
	goto	u2381
	goto	u2380
u2381:
	goto	l5763
u2380:
	
l5761:	
	btfss	(_LockSta),3
	goto	u2391
	goto	u2390
u2391:
	goto	l5783
u2390:
	line	282
	
l5763:	
;LED.c: 281: {
;LED.c: 282: LockSwitchCnt++;
	incf	(LockPro@LockSwitchCnt),f
	line	283
	
l5765:	
;LED.c: 283: if(LockSwitchCnt>=35)
	movlw	low(023h)
	subwf	(LockPro@LockSwitchCnt),w
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l3085
u2400:
	line	285
	
l5767:	
;LED.c: 284: {
;LED.c: 285: LockSwitchCnt=0;
	clrf	(LockPro@LockSwitchCnt)
	line	286
	
l5769:	
;LED.c: 286: LedSwitchFlag=!LedSwitchFlag;
	movlw	1<<((LockPro@LedSwitchFlag)&7)
	xorwf	((LockPro@LedSwitchFlag)/8),f
	line	287
	
l5771:	
;LED.c: 287: if(!LedSwitchFlag&&LockSta.UnlockFail)
	btfsc	(LockPro@LedSwitchFlag/8),(LockPro@LedSwitchFlag)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l3085
u2410:
	
l5773:	
	btfss	(_LockSta),4
	goto	u2421
	goto	u2420
u2421:
	goto	l3085
u2420:
	line	289
	
l5775:	
;LED.c: 288: {
;LED.c: 289: Ledcnt++;
	incf	(LockPro@Ledcnt),f
	line	290
	
l5777:	
;LED.c: 290: if(Ledcnt>=3)
	movlw	low(03h)
	subwf	(LockPro@Ledcnt),w
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l3085
u2430:
	line	292
	
l5779:	
;LED.c: 291: {
;LED.c: 292: LockSta.UnlockFail=0;
	bcf	(_LockSta),4
	line	295
	
l3085:	
	line	296
;LED.c: 293: }
;LED.c: 294: }
;LED.c: 295: }
;LED.c: 296: if(LedSwitchFlag)
	btfss	(LockPro@LedSwitchFlag/8),(LockPro@LedSwitchFlag)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l3090
u2440:
	line	298
	
l5781:	
;LED.c: 297: {
;LED.c: 298: LedIndex|=0x8000;
	bsf	(_LedIndex)+(15/8),(15)&7
	goto	l3090
	line	303
	
l5783:	
;LED.c: 301: else
;LED.c: 302: {
;LED.c: 303: Ledcnt=0;
	clrf	(LockPro@Ledcnt)
	line	304
;LED.c: 304: LockSwitchCnt=0;
	clrf	(LockPro@LockSwitchCnt)
	line	307
	
l3090:	
	return
	opt stack 0
GLOBAL	__end_of_LockPro
	__end_of_LockPro:
	signat	_LockPro,89
	global	_ErrPro

;; *************** function _ErrPro *****************
;; Defined at:
;;		line 309 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayPro
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	line	309
global __ptext17
__ptext17:	;psect for function _ErrPro
psect	text17
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	309
	global	__size_of_ErrPro
	__size_of_ErrPro	equ	__end_of_ErrPro-_ErrPro
	
_ErrPro:	
;incstack = 0
	opt	stack 3
; Regs used in _ErrPro: [wreg+status,2+status,0]
	line	313
	
l5785:	
;LED.c: 311: static unsigned char SwitchCnt=0;
;LED.c: 312: static bit LedSwitchFlag=0;
;LED.c: 313: if(IovFlag)
	btfss	(_IovFlag/8),(_IovFlag)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l5799
u2450:
	line	315
	
l5787:	
;LED.c: 314: {
;LED.c: 315: SwitchCnt++;
	incf	(ErrPro@SwitchCnt),f
	line	316
	
l5789:	
;LED.c: 316: if(SwitchCnt>=35)
	movlw	low(023h)
	subwf	(ErrPro@SwitchCnt),w
	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l5795
u2460:
	line	318
	
l5791:	
;LED.c: 317: {
;LED.c: 318: SwitchCnt=0;
	clrf	(ErrPro@SwitchCnt)
	line	319
	
l5793:	
;LED.c: 319: LedSwitchFlag=!LedSwitchFlag;
	movlw	1<<((ErrPro@LedSwitchFlag)&7)
	xorwf	((ErrPro@LedSwitchFlag)/8),f
	line	322
	
l5795:	
;LED.c: 321: }
;LED.c: 322: if(LedSwitchFlag)
	btfss	(ErrPro@LedSwitchFlag/8),(ErrPro@LedSwitchFlag)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l3101
u2470:
	line	324
	
l5797:	
;LED.c: 323: {
;LED.c: 324: LedIndex=0x4000;
	movlw	0
	movwf	(_LedIndex)
	movlw	040h
	movwf	((_LedIndex))+1
	goto	l3101
	line	329
	
l5799:	
;LED.c: 327: else
;LED.c: 328: {
;LED.c: 329: SwitchCnt=0;
	clrf	(ErrPro@SwitchCnt)
	line	331
	
l3101:	
	return
	opt stack 0
GLOBAL	__end_of_ErrPro
	__end_of_ErrPro:
	signat	_ErrPro,89
	global	_DisplayIcon

;; *************** function _DisplayIcon *****************
;; Defined at:
;;		line 124 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
;; Parameters:    Size  Location     Type
;;  index           2    3[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  Mask            2    0[BANK0 ] unsigned int 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : B00/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       3       0
;;      Temps:          2       0       0
;;      Totals:         4       3       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayPro
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	line	124
global __ptext18
__ptext18:	;psect for function _DisplayIcon
psect	text18
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	124
	global	__size_of_DisplayIcon
	__size_of_DisplayIcon	equ	__end_of_DisplayIcon-_DisplayIcon
	
_DisplayIcon:	
;incstack = 0
	opt	stack 3
; Regs used in _DisplayIcon: [wreg-fsr0h+status,2+status,0+pclath]
	line	126
	
l6369:	
	line	127
	
l6371:	
;LED.c: 127: unsigned int Mask=0x01;
	clrf	(DisplayIcon@Mask)
	incf	(DisplayIcon@Mask),f
	clrf	(DisplayIcon@Mask+1)
	line	129
	
l6373:	
;LED.c: 129: for(i=0;i<16;i++)
	clrf	(DisplayIcon@i)
	line	131
	
l6379:	
;LED.c: 130: {
;LED.c: 131: if(index&Mask)
	movf	(DisplayIcon@Mask),w
	andwf	(DisplayIcon@index),w
	movwf	(??_DisplayIcon+0)+0
	movf	(DisplayIcon@Mask+1),w
	andwf	(DisplayIcon@index+1),w
	movwf	1+(??_DisplayIcon+0)+0
	movf	((??_DisplayIcon+0)+0),w
iorwf	((??_DisplayIcon+0)+1),w
	btfsc	status,2
	goto	u3811
	goto	u3810
u3811:
	goto	l6383
u3810:
	line	133
	
l6381:	
;LED.c: 132: {
;LED.c: 133: LEDArrMap[LEDSeg1[i]]|=(1<<LEDSeg2[i]);
	movlw	low(01h)
	movwf	(??_DisplayIcon+0)+0
	movf	(DisplayIcon@i),w
	addlw	low(_LEDSeg2|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	incf	indf,w
	goto	u3824
u3825:
	clrc
	rlf	(??_DisplayIcon+0)+0,f
u3824:
	addlw	-1
	skipz
	goto	u3825
	movf	0+(??_DisplayIcon+0)+0,w
	movwf	(??_DisplayIcon+1)+0
	movf	(DisplayIcon@i),w
	addlw	low((((_LEDSeg1)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	addlw	low(_LEDArrMap|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	(??_DisplayIcon+1)+0,w
	iorwf	indf,f
	line	134
;LED.c: 134: }
	goto	l6385
	line	137
	
l6383:	
;LED.c: 135: else
;LED.c: 136: {
;LED.c: 137: LEDArrMap[LEDSeg1[i]]&=~(1<<LEDSeg2[i]);
	movlw	low(01h)
	movwf	(??_DisplayIcon+0)+0
	movf	(DisplayIcon@i),w
	addlw	low(_LEDSeg2|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	incf	indf,w
	goto	u3834
u3835:
	clrc
	rlf	(??_DisplayIcon+0)+0,f
u3834:
	addlw	-1
	skipz
	goto	u3835
	movf	0+(??_DisplayIcon+0)+0,w
	xorlw	0ffh
	movwf	(??_DisplayIcon+1)+0
	movf	(DisplayIcon@i),w
	addlw	low((((_LEDSeg1)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	addlw	low(_LEDArrMap|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	(??_DisplayIcon+1)+0,w
	andwf	indf,f
	line	140
	
l6385:	
;LED.c: 138: }
;LED.c: 140: Mask<<=1;
	clrc
	rlf	(DisplayIcon@Mask),f
	rlf	(DisplayIcon@Mask+1),f
	line	129
	
l6387:	
	incf	(DisplayIcon@i),f
	
l6389:	
	movlw	low(010h)
	subwf	(DisplayIcon@i),w
	skipc
	goto	u3841
	goto	u3840
u3841:
	goto	l6379
u3840:
	line	142
	
l3021:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayIcon
	__end_of_DisplayIcon:
	signat	_DisplayIcon,4217
	global	_ADCPro

;; *************** function _ADCPro *****************
;; Defined at:
;;		line 10 in file "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ADCRead
;; This function is called by:
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	10
global __ptext19
__ptext19:	;psect for function _ADCPro
psect	text19
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	10
	global	__size_of_ADCPro
	__size_of_ADCPro	equ	__end_of_ADCPro-_ADCPro
	
_ADCPro:	
;incstack = 0
	opt	stack 2
; Regs used in _ADCPro: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	12
	
l6537:	
;ADC.c: 12: switch (ADCState)
	goto	l6547
	line	15
	
l6539:	
;ADC.c: 15: ADCRead(0b00001111,ADCVal);
	movlw	(low(_ADCVal|((0x0)<<8)))&0ffh
	movwf	(ADCRead@Val)
	movlw	low(0Fh)
	fcall	_ADCRead
	line	16
;ADC.c: 16: break;
	goto	l571
	line	19
	
l6541:	
;ADC.c: 19: ADCRead(0b00000010,ADCVal+1);
	movlw	(low(_ADCVal|((0x0)<<8)+02h))&0ffh
	movwf	(ADCRead@Val)
	movlw	low(02h)
	fcall	_ADCRead
	line	20
;ADC.c: 20: break;
	goto	l571
	line	23
	
l6543:	
;ADC.c: 23: ADCRead(0b00000001,ADCVal+2);
	movlw	(low(_ADCVal|((0x0)<<8)+04h))&0ffh
	movwf	(ADCRead@Val)
	movlw	low(01h)
	fcall	_ADCRead
	line	24
;ADC.c: 24: break;
	goto	l571
	line	12
	
l6547:	
	movf	(_ADCState),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; direct_byte            9     6 (fixed)
; simple_byte           10     6 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	3
	subwf	fsr,w
skipnc
goto l571
movlw high(S6995)
movwf pclath
	movlw low(S6995)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S6995:
	ljmp	l6539
	ljmp	l6541
	ljmp	l6543
psect	text19

	line	25
	
l571:	
	line	26
;ADC.c: 26: if(SystemONFlag==0)
	btfsc	(_SystemONFlag/8),(_SystemONFlag)&7
	goto	u4171
	goto	u4170
u4171:
	goto	l6559
u4170:
	line	28
	
l6549:	
;ADC.c: 27: {
;ADC.c: 28: if(ADCVal[2]<267)
	movlw	01h
	subwf	1+(_ADCVal)+04h,w
	movlw	0Bh
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipnc
	goto	u4181
	goto	u4180
u4181:
	goto	l6553
u4180:
	line	30
	
l6551:	
;ADC.c: 29: {
;ADC.c: 30: BatPercent=0;
	clrf	(_BatPercent)
	line	31
;ADC.c: 31: }
	goto	l6559
	line	32
	
l6553:	
;ADC.c: 32: else if(ADCVal[2]>350)
	movlw	01h
	subwf	1+(_ADCVal)+04h,w
	movlw	05Fh
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipc
	goto	u4191
	goto	u4190
u4191:
	goto	l6557
u4190:
	line	34
	
l6555:	
;ADC.c: 33: {
;ADC.c: 34: BatPercent=99;
	movlw	low(063h)
	movwf	(_BatPercent)
	line	35
;ADC.c: 35: }
	goto	l6559
	line	38
	
l6557:	
;ADC.c: 36: else
;ADC.c: 37: {
;ADC.c: 38: BatPercent=ADCVal[2]-250;
	movf	0+(_ADCVal)+04h,w
	addlw	06h
	movwf	(_BatPercent)
	line	41
	
l6559:	
;ADC.c: 39: }
;ADC.c: 40: }
;ADC.c: 41: if(ADCVal[2]<250)
	movlw	0
	subwf	1+(_ADCVal)+04h,w
	movlw	0FAh
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipnc
	goto	u4201
	goto	u4200
u4201:
	goto	l579
u4200:
	line	43
	
l6561:	
;ADC.c: 42: {
;ADC.c: 43: LowBatFlag=1;
	bsf	(_LowBatFlag/8),(_LowBatFlag)&7
	line	44
;ADC.c: 44: }
	goto	l6563
	line	45
	
l579:	
	line	47
;ADC.c: 45: else
;ADC.c: 46: {
;ADC.c: 47: LowBatFlag=0;
	bcf	(_LowBatFlag/8),(_LowBatFlag)&7
	line	49
	
l6563:	
;ADC.c: 48: }
;ADC.c: 49: if(ADCVal[1]>58)
	movlw	0
	subwf	1+(_ADCVal)+02h,w
	movlw	03Bh
	skipnz
	subwf	0+(_ADCVal)+02h,w
	skipc
	goto	u4211
	goto	u4210
u4211:
	goto	l6573
u4210:
	line	51
	
l6565:	
;ADC.c: 50: {
;ADC.c: 51: CurrentCnt++;
	incf	(_CurrentCnt),f
	line	52
	
l6567:	
;ADC.c: 52: if(CurrentCnt>=200)
	movlw	low(0C8h)
	subwf	(_CurrentCnt),w
	skipc
	goto	u4221
	goto	u4220
u4221:
	goto	l584
u4220:
	line	54
	
l6569:	
;ADC.c: 53: {
;ADC.c: 54: CurrentCnt=200;
	movlw	low(0C8h)
	movwf	(_CurrentCnt)
	line	55
	
l6571:	
;ADC.c: 55: IovFlag=1;
	bsf	(_IovFlag/8),(_IovFlag)&7
	goto	l584
	line	60
	
l6573:	
;ADC.c: 58: else
;ADC.c: 59: {
;ADC.c: 60: CurrentCnt=0;
	clrf	(_CurrentCnt)
	line	61
	
l6575:	
;ADC.c: 61: IovFlag=0;
	bcf	(_IovFlag/8),(_IovFlag)&7
	line	63
	
l584:	
	return
	opt stack 0
GLOBAL	__end_of_ADCPro
	__end_of_ADCPro:
	signat	_ADCPro,89
	global	_ADCRead

;; *************** function _ADCRead *****************
;; Defined at:
;;		line 175 in file "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;;  Val             1   21[BANK0 ] PTR unsigned int 
;;		 -> ADCVal(6), 
;; Auto vars:     Size  Location     Type
;;  ch              1    0[BANK1 ] unsigned char 
;;  ad_temp         2    5[BANK1 ] unsigned int 
;;  AD_L            2    3[BANK1 ] unsigned int 
;;  AD_H            2    1[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       0       7
;;      Temps:          0       4       0
;;      Totals:         0       5       7
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ADSample
;;		___lldiv
;;		___lmul
;; This function is called by:
;;		_ADCPro
;; This function uses a non-reentrant model
;;
psect	text20,local,class=CODE,delta=2,merge=1,group=0
	line	175
global __ptext20
__ptext20:	;psect for function _ADCRead
psect	text20
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	175
	global	__size_of_ADCRead
	__size_of_ADCRead	equ	__end_of_ADCRead-_ADCRead
	
_ADCRead:	
;incstack = 0
	opt	stack 2
; Regs used in _ADCRead: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;ADCRead@ch stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(ADCRead@ch)^080h
	line	179
	
l6335:	
;ADC.c: 177: unsigned int ad_temp,AD_H,AD_L;
;ADC.c: 179: if(ADSample(ch))
	movf	(ADCRead@ch)^080h,w
	fcall	_ADSample
	xorlw	0
	skipnz
	goto	u3761
	goto	u3760
u3761:
	goto	l630
u3760:
	line	181
	
l6337:	
;ADC.c: 180: {
;ADC.c: 181: AD_H=ADRESH;
	movf	(30),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(ADCRead@AD_H)^080h
	clrf	(ADCRead@AD_H+1)^080h
	line	182
;ADC.c: 182: AD_L=ADRESL;
	movf	(158)^080h,w	;volatile
	movwf	(ADCRead@AD_L)^080h
	clrf	(ADCRead@AD_L+1)^080h
	line	183
;ADC.c: 183: ad_temp=(AD_H<<4)|(AD_L>>4);
	movf	(ADCRead@AD_H+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_ADCRead+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	movf	(ADCRead@AD_H)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_ADCRead+0)+0
	swapf	(??_ADCRead+0)+0,f
	swapf	(??_ADCRead+0)+1,f
	movlw	0f0h
	andwf	(??_ADCRead+0)+1,f
	movf	(??_ADCRead+0)+0,w
	andlw	0fh
	iorwf	(??_ADCRead+0)+1,f
	movlw	0f0h
	andwf	(??_ADCRead+0)+0,f
	movf	0+(??_ADCRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(ADCRead@ad_temp)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_ADCRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(ADCRead@ad_temp+1)^080h
	
l6339:	
	movf	(ADCRead@AD_L+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_ADCRead+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	movf	(ADCRead@AD_L)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_ADCRead+0)+0
	movlw	04h
u3775:
	clrc
	rrf	(??_ADCRead+0)+1,f
	rrf	(??_ADCRead+0)+0,f
	addlw	-1
	skipz
	goto	u3775
	movf	0+(??_ADCRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(ADCRead@ad_temp)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_ADCRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(ADCRead@ad_temp+1)^080h,f
	line	184
	
l6341:	
;ADC.c: 184: ADsum += ad_temp;
	movf	(ADCRead@ad_temp)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_ADCRead+0)+0)
	bsf	status, 5	;RP0=1, select bank1
	movf	(ADCRead@ad_temp+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	((??_ADCRead+0)+0+1)
	clrf	((??_ADCRead+0)+0+2)
	clrf	((??_ADCRead+0)+0+3)
	movf	0+(??_ADCRead+0)+0,w
	addwf	(_ADsum),f
	movf	1+(??_ADCRead+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3781
	addwf	(_ADsum+1),f
u3781:
	movf	2+(??_ADCRead+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3782
	addwf	(_ADsum+2),f
u3782:
	movf	3+(??_ADCRead+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3783
	addwf	(_ADsum+3),f
u3783:

	line	185
	
l6343:	
;ADC.c: 185: ADcnt++;
	incf	(_ADcnt),f
	line	186
;ADC.c: 186: if(ADcnt >= 10)
	movlw	low(0Ah)
	subwf	(_ADcnt),w
	skipc
	goto	u3791
	goto	u3790
u3791:
	goto	l630
u3790:
	line	188
	
l6345:	
;ADC.c: 187: {
;ADC.c: 188: ADcnt = 0;
	clrf	(_ADcnt)
	line	189
	
l6347:	
;ADC.c: 189: ADsum /=10;
	movlw	0Ah
	movwf	(___lldiv@divisor)
	clrf	(___lldiv@divisor+1)
	clrf	(___lldiv@divisor+2)
	clrf	(___lldiv@divisor+3)

	movf	(_ADsum+3),w
	movwf	(___lldiv@dividend+3)
	movf	(_ADsum+2),w
	movwf	(___lldiv@dividend+2)
	movf	(_ADsum+1),w
	movwf	(___lldiv@dividend+1)
	movf	(_ADsum),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(3+(?___lldiv)),w
	movwf	(_ADsum+3)
	movf	(2+(?___lldiv)),w
	movwf	(_ADsum+2)
	movf	(1+(?___lldiv)),w
	movwf	(_ADsum+1)
	movf	(0+(?___lldiv)),w
	movwf	(_ADsum)

	line	190
;ADC.c: 190: switch (ADCState)
	goto	l6357
	line	193
	
l6349:	
;ADC.c: 193: *Val=ADsum;
	movf	(ADCRead@Val),w
	movwf	fsr0
	movf	(_ADsum),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(_ADsum+1),w
	movwf	indf
	line	194
;ADC.c: 194: break;
	goto	l626
	line	197
	
l6351:	
;ADC.c: 197: *Val=ADsum*1000/(*(Val-1));
	movf	(ADCRead@Val),w
	addlw	-2
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_ADCRead+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADCRead+0)+0+1
	movf	0+(??_ADCRead+0)+0,w
	movwf	(___lldiv@divisor)
	movf	1+(??_ADCRead+0)+0,w
	movwf	((___lldiv@divisor))+1
	clrf	2+((___lldiv@divisor))
	clrf	3+((___lldiv@divisor))
	movf	(_ADsum+3),w
	movwf	(___lmul@multiplier+3)
	movf	(_ADsum+2),w
	movwf	(___lmul@multiplier+2)
	movf	(_ADsum+1),w
	movwf	(___lmul@multiplier+1)
	movf	(_ADsum),w
	movwf	(___lmul@multiplier)

	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	03h
	movwf	(___lmul@multiplicand+1)
	movlw	0E8h
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(___lldiv@dividend+3)
	movf	(2+(?___lmul)),w
	movwf	(___lldiv@dividend+2)
	movf	(1+(?___lmul)),w
	movwf	(___lldiv@dividend+1)
	movf	(0+(?___lmul)),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(ADCRead@Val),w
	movwf	fsr0
	movf	(0+(?___lldiv)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(1+(?___lldiv)),w
	movwf	indf
	line	198
;ADC.c: 198: break;
	goto	l626
	line	201
	
l6353:	
;ADC.c: 201: *Val=ADsum*100/(*(Val-2));
	movf	(ADCRead@Val),w
	addlw	-4
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_ADCRead+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADCRead+0)+0+1
	movf	0+(??_ADCRead+0)+0,w
	movwf	(___lldiv@divisor)
	movf	1+(??_ADCRead+0)+0,w
	movwf	((___lldiv@divisor))+1
	clrf	2+((___lldiv@divisor))
	clrf	3+((___lldiv@divisor))
	movf	(_ADsum+3),w
	movwf	(___lmul@multiplier+3)
	movf	(_ADsum+2),w
	movwf	(___lmul@multiplier+2)
	movf	(_ADsum+1),w
	movwf	(___lmul@multiplier+1)
	movf	(_ADsum),w
	movwf	(___lmul@multiplier)

	movlw	064h
	movwf	(___lmul@multiplicand)
	clrf	(___lmul@multiplicand+1)
	clrf	(___lmul@multiplicand+2)
	clrf	(___lmul@multiplicand+3)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(___lldiv@dividend+3)
	movf	(2+(?___lmul)),w
	movwf	(___lldiv@dividend+2)
	movf	(1+(?___lmul)),w
	movwf	(___lldiv@dividend+1)
	movf	(0+(?___lmul)),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(ADCRead@Val),w
	movwf	fsr0
	movf	(0+(?___lldiv)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(1+(?___lldiv)),w
	movwf	indf
	line	202
;ADC.c: 202: break;
	goto	l626
	line	190
	
l6357:	
	movf	(_ADCState),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; direct_byte            9     6 (fixed)
; simple_byte           10     6 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	3
	subwf	fsr,w
skipnc
goto l626
movlw high(S6997)
movwf pclath
	movlw low(S6997)
	addwf fsr,w
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S6997:
	ljmp	l6349
	ljmp	l6351
	ljmp	l6353
psect	text20

	line	203
	
l626:	
	line	204
;ADC.c: 204: ADsum = 0;
	clrf	(_ADsum)
	clrf	(_ADsum+1)
	clrf	(_ADsum+2)
	clrf	(_ADsum+3)
	line	205
	
l6359:	
;ADC.c: 205: ADCState++;
	incf	(_ADCState),f
	line	206
	
l6361:	
;ADC.c: 206: if(ADCState>=3)
	movlw	low(03h)
	subwf	(_ADCState),w
	skipc
	goto	u3801
	goto	u3800
u3801:
	goto	l630
u3800:
	line	208
	
l6363:	
;ADC.c: 207: {
;ADC.c: 208: ADCState=0;
	clrf	(_ADCState)
	line	212
	
l630:	
	return
	opt stack 0
GLOBAL	__end_of_ADCRead
	__end_of_ADCRead:
	signat	_ADCRead,8313
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 15 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    3[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       8       0
;;      Locals:         4       0       0
;;      Temps:          0       0       0
;;      Totals:         4       8       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCRead
;; This function uses a non-reentrant model
;;
psect	text21,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul32.c"
	line	15
global __ptext21
__ptext21:	;psect for function ___lmul
psect	text21
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul32.c"
	line	15
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
;incstack = 0
	opt	stack 2
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
l6297:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	120
	
l4236:	
	line	121
	btfss	(___lmul@multiplier),(0)&7
	goto	u3691
	goto	u3690
u3691:
	goto	l6301
u3690:
	line	122
	
l6299:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3701
	addwf	(___lmul@product+1),f
u3701:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3702
	addwf	(___lmul@product+2),f
u3702:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3703
	addwf	(___lmul@product+3),f
u3703:

	line	123
	
l6301:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	124
	
l6303:	
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	line	125
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u3711
	goto	u3710
u3711:
	goto	l4236
u3710:
	line	128
	
l6305:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	129
	
l4239:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
	signat	___lmul,8316
	global	___lldiv

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 6 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    8[BANK0 ] unsigned long 
;;  dividend        4   12[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   16[BANK0 ] unsigned long 
;;  counter         1   20[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       8       0
;;      Locals:         0       5       0
;;      Temps:          0       0       0
;;      Totals:         0      13       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCRead
;; This function uses a non-reentrant model
;;
psect	text22,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lldiv.c"
	line	6
global __ptext22
__ptext22:	;psect for function ___lldiv
psect	text22
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lldiv.c"
	line	6
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	14
	
l6309:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	15
	
l6311:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u3721
	goto	u3720
u3721:
	goto	l6331
u3720:
	line	16
	
l6313:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	l6317
	line	18
	
l6315:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	19
	incf	(___lldiv@counter),f
	line	17
	
l6317:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u3731
	goto	u3730
u3731:
	goto	l6315
u3730:
	line	22
	
l6319:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	23
	
l6321:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u3745
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u3745
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u3745
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u3745:
	skipc
	goto	u3741
	goto	u3740
u3741:
	goto	l6327
u3740:
	line	24
	
l6323:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	25
	
l6325:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	27
	
l6327:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	28
	
l6329:	
	decfsz	(___lldiv@counter),f
	goto	u3751
	goto	u3750
u3751:
	goto	l6319
u3750:
	line	30
	
l6331:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	31
	
l4511:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_ADSample

;; *************** function _ADSample *****************
;; Defined at:
;;		line 221 in file "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    4[COMMON] unsigned char 
;;  i               1    5[COMMON] volatile unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCRead
;; This function uses a non-reentrant model
;;
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	221
global __ptext23
__ptext23:	;psect for function _ADSample
psect	text23
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	221
	global	__size_of_ADSample
	__size_of_ADSample	equ	__end_of_ADSample-_ADSample
	
_ADSample:	
;incstack = 0
	opt	stack 2
; Regs used in _ADSample: [wreg+status,2+status,0]
;ADSample@ch stored from wreg
	movwf	(ADSample@ch)
	line	223
	
l6281:	
;ADC.c: 223: ADCON1 = 0x00;
	clrf	(159)^080h	;volatile
	line	224
	
l6283:	
;ADC.c: 224: ADCON0 = 0X41 | ( ch << 2);
	movf	(ADSample@ch),w
	movwf	(??_ADSample+0)+0
	movlw	(02h)-1
u3665:
	clrc
	rlf	(??_ADSample+0)+0,f
	addlw	-1
	skipz
	goto	u3665
	clrc
	rlf	(??_ADSample+0)+0,w
	iorlw	041h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	225
# 225 "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
nop ;# 
	line	226
# 226 "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
nop ;# 
psect	text23
	line	227
	
l6285:	
;ADC.c: 227: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7	;volatile
	line	228
	
l6287:	
;ADC.c: 228: volatile unsigned char i = 0;
	clrf	(ADSample@i)	;volatile
	line	229
;ADC.c: 229: while(GODONE)
	goto	l633
	
l634:	
	line	231
;ADC.c: 230: {
;ADC.c: 231: if(0 == (--i))
	decfsz	(ADSample@i),f	;volatile
	goto	u3671
	goto	u3670
u3671:
	goto	l633
u3670:
	line	232
	
l6289:	
;ADC.c: 232: return 0;
	movlw	low(0)
	goto	l636
	line	233
	
l633:	
	line	229
	btfsc	(249/8),(249)&7	;volatile
	goto	u3681
	goto	u3680
u3681:
	goto	l634
u3680:
	line	234
	
l6293:	
;ADC.c: 233: }
;ADC.c: 234: return 1;
	movlw	low(01h)
	line	235
	
l636:	
	return
	opt stack 0
GLOBAL	__end_of_ADSample
	__end_of_ADSample:
	signat	_ADSample,4217
	global	_Isr_Timer

;; *************** function _Isr_Timer *****************
;; Defined at:
;;		line 8 in file "C:\Users\Administrator\Desktop\project\K13-01\code\even.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          3       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LEDScan
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\even.c"
	line	8
global __ptext24
__ptext24:	;psect for function _Isr_Timer
psect	text24
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\even.c"
	line	8
	global	__size_of_Isr_Timer
	__size_of_Isr_Timer	equ	__end_of_Isr_Timer-_Isr_Timer
	
_Isr_Timer:	
;incstack = 0
	opt	stack 2
; Regs used in _Isr_Timer: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_Isr_Timer+0)
	movf	fsr0,w
	movwf	(??_Isr_Timer+1)
	movf	pclath,w
	movwf	(??_Isr_Timer+2)
	ljmp	_Isr_Timer
psect	text24
	line	10
	
i1l6199:	
;even.c: 10: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7	;volatile
	line	11
	
i1l6201:	
;even.c: 11: cnt2ms++;
	incf	(_cnt2ms),f
	line	12
;even.c: 12: cnt10ms++;
	incf	(_cnt10ms),f
	line	13
	
i1l6203:	
;even.c: 13: if(cnt2ms>=10)
	movlw	low(0Ah)
	subwf	(_cnt2ms),w
	skipc
	goto	u364_21
	goto	u364_20
u364_21:
	goto	i1l6211
u364_20:
	line	15
	
i1l6205:	
;even.c: 14: {
;even.c: 15: LEDScan();
	fcall	_LEDScan
	line	16
	
i1l6207:	
;even.c: 16: cnt2ms=0;
	clrf	(_cnt2ms)
	line	17
	
i1l6209:	
;even.c: 17: time2ms=1;
	bsf	(_time2ms/8),(_time2ms)&7
	line	19
	
i1l6211:	
;even.c: 18: }
;even.c: 19: if(cnt10ms>=50)
	movlw	low(032h)
	subwf	(_cnt10ms),w
	skipc
	goto	u365_21
	goto	u365_20
u365_21:
	goto	i1l1190
u365_20:
	line	21
	
i1l6213:	
;even.c: 20: {
;even.c: 21: cnt10ms=0;
	clrf	(_cnt10ms)
	line	22
	
i1l6215:	
;even.c: 22: time10ms=1;
	bsf	(_time10ms/8),(_time10ms)&7
	line	24
	
i1l1190:	
	movf	(??_Isr_Timer+2),w
	movwf	pclath
	movf	(??_Isr_Timer+1),w
	movwf	fsr0
	swapf	(??_Isr_Timer+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Isr_Timer
	__end_of_Isr_Timer:
	signat	_Isr_Timer,89
	global	_LEDScan

;; *************** function _LEDScan *****************
;; Defined at:
;;		line 17 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Isr_Timer
;; This function uses a non-reentrant model
;;
psect	text25,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	17
global __ptext25
__ptext25:	;psect for function _LEDScan
psect	text25
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	17
	global	__size_of_LEDScan
	__size_of_LEDScan	equ	__end_of_LEDScan-_LEDScan
	
_LEDScan:	
;incstack = 0
	opt	stack 2
; Regs used in _LEDScan: [wreg-fsr0h+status,2+status,0]
	line	21
	
i1l6113:	
;LED.c: 19: static unsigned char LEDScanIndex=0;
;LED.c: 21: TRISB5=1,WPUB5=0;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	line	22
;LED.c: 22: TRISB4=1,WPUB4=0;
	bsf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	line	23
;LED.c: 23: TRISB3=1,WPUB3=0;
	bsf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	line	24
;LED.c: 24: TRISC3=1,WPUC3=0;
	bsf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	line	25
;LED.c: 25: TRISC2=1,WPUC2=0;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	line	26
# 26 "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
nop ;# 
# 26 "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
nop ;# 
psect	text25
	line	28
;LED.c: 28: switch(LEDScanIndex)
	goto	i1l6149
	line	30
;LED.c: 29: {
;LED.c: 30: case 0:
	
i1l2990:	
	line	31
;LED.c: 31: if(LEDArrMap[0]&0x02)
	btfss	(_LEDArrMap),(1)&7
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l2991
u338_20:
	line	33
	
i1l6115:	
;LED.c: 32: {
;LED.c: 33: TRISB4=0,WPUB4=0;RB4=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7	;volatile
	line	34
	
i1l2991:	
	line	35
;LED.c: 34: }
;LED.c: 35: if(LEDArrMap[0]&0x04)
	btfss	(_LEDArrMap),(2)&7
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l2992
u339_20:
	line	37
	
i1l6117:	
;LED.c: 36: {
;LED.c: 37: TRISB3=0,WPUB3=0;RB3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	38
	
i1l2992:	
	line	39
;LED.c: 38: }
;LED.c: 39: if(LEDArrMap[0]&0x08)
	btfss	(_LEDArrMap),(3)&7
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l2993
u340_20:
	line	41
	
i1l6119:	
;LED.c: 40: {
;LED.c: 41: TRISC3=0,WPUC3=0;RC3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	42
	
i1l2993:	
	line	43
;LED.c: 42: }
;LED.c: 43: if(LEDArrMap[0]&0x10)
	btfss	(_LEDArrMap),(4)&7
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l2994
u341_20:
	line	45
	
i1l6121:	
;LED.c: 44: {
;LED.c: 45: TRISC2=0,WPUC2=0;RC2=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7	;volatile
	line	46
	
i1l2994:	
	line	47
;LED.c: 46: }
;LED.c: 47: TRISB5=0,WPUB5=0;RB5=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bsf	(53/8),(53)&7	;volatile
	line	48
;LED.c: 48: break;
	goto	i1l6151
	line	50
;LED.c: 50: case 1:
	
i1l2996:	
	line	51
;LED.c: 51: if(LEDArrMap[1]&0x01)
	btfss	0+(_LEDArrMap)+01h,(0)&7
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l2997
u342_20:
	line	53
	
i1l6123:	
;LED.c: 52: {
;LED.c: 53: TRISB5=0,WPUB5=0;RB5=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7	;volatile
	line	54
	
i1l2997:	
	line	55
;LED.c: 54: }
;LED.c: 55: if(LEDArrMap[1]&0x04)
	btfss	0+(_LEDArrMap)+01h,(2)&7
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l2998
u343_20:
	line	57
	
i1l6125:	
;LED.c: 56: {
;LED.c: 57: TRISB3=0,WPUB3=0;RB3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	58
	
i1l2998:	
	line	59
;LED.c: 58: }
;LED.c: 59: if(LEDArrMap[1]&0x08)
	btfss	0+(_LEDArrMap)+01h,(3)&7
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l2999
u344_20:
	line	61
	
i1l6127:	
;LED.c: 60: {
;LED.c: 61: TRISC3=0,WPUC3=0;RC3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	62
	
i1l2999:	
	line	63
;LED.c: 62: }
;LED.c: 63: if(LEDArrMap[1]&0x10)
	btfss	0+(_LEDArrMap)+01h,(4)&7
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l3000
u345_20:
	line	65
	
i1l6129:	
;LED.c: 64: {
;LED.c: 65: TRISC2=0,WPUC2=0;RC2=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7	;volatile
	line	66
	
i1l3000:	
	line	67
;LED.c: 66: }
;LED.c: 67: TRISB4=0,WPUB4=0; RB4=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7	;volatile
	line	68
;LED.c: 68: break;
	goto	i1l6151
	line	70
;LED.c: 70: case 2:
	
i1l3001:	
	line	71
;LED.c: 71: if(LEDArrMap[2]&0x01)
	btfss	0+(_LEDArrMap)+02h,(0)&7
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l3002
u346_20:
	line	73
	
i1l6131:	
;LED.c: 72: {
;LED.c: 73: TRISB5=0,WPUB5=0;RB5=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7	;volatile
	line	74
	
i1l3002:	
	line	75
;LED.c: 74: }
;LED.c: 75: if(LEDArrMap[2]&0x02)
	btfss	0+(_LEDArrMap)+02h,(1)&7
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l3003
u347_20:
	line	77
	
i1l6133:	
;LED.c: 76: {
;LED.c: 77: TRISB4=0,WPUB4=0;RB4=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7	;volatile
	line	78
	
i1l3003:	
	line	79
;LED.c: 78: }
;LED.c: 79: if(LEDArrMap[2]&0x08)
	btfss	0+(_LEDArrMap)+02h,(3)&7
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l3004
u348_20:
	line	81
	
i1l6135:	
;LED.c: 80: {
;LED.c: 81: TRISC3=0,WPUC3=0;RC3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	82
	
i1l3004:	
	line	83
;LED.c: 82: }
;LED.c: 83: if(LEDArrMap[2]&0x10)
	btfss	0+(_LEDArrMap)+02h,(4)&7
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l3005
u349_20:
	line	85
	
i1l6137:	
;LED.c: 84: {
;LED.c: 85: TRISC2=0,WPUC2=0;RC2=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7	;volatile
	line	86
	
i1l3005:	
	line	87
;LED.c: 86: }
;LED.c: 87: TRISB3=0,WPUB3=0;RB3=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bsf	(51/8),(51)&7	;volatile
	line	88
;LED.c: 88: break;
	goto	i1l6151
	line	90
;LED.c: 90: case 3:
	
i1l3006:	
	line	91
;LED.c: 91: if(LEDArrMap[3]&0x01)
	btfss	0+(_LEDArrMap)+03h,(0)&7
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l3007
u350_20:
	line	93
	
i1l6139:	
;LED.c: 92: {
;LED.c: 93: TRISB5=0,WPUB5=0;RB5=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7	;volatile
	line	94
	
i1l3007:	
	line	95
;LED.c: 94: }
;LED.c: 95: if(LEDArrMap[3]&0x02)
	btfss	0+(_LEDArrMap)+03h,(1)&7
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l3008
u351_20:
	line	97
	
i1l6141:	
;LED.c: 96: {
;LED.c: 97: TRISB4=0,WPUB4=0;RB4=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7	;volatile
	line	98
	
i1l3008:	
	line	99
;LED.c: 98: }
;LED.c: 99: if(LEDArrMap[3]&0x04)
	btfss	0+(_LEDArrMap)+03h,(2)&7
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l3009
u352_20:
	line	101
	
i1l6143:	
;LED.c: 100: {
;LED.c: 101: TRISB3=0,WPUB3=0;RB3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	102
	
i1l3009:	
	line	103
;LED.c: 102: }
;LED.c: 103: TRISC3=0,WPUC3=0;RC3=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7	;volatile
	line	104
;LED.c: 104: break;
	goto	i1l6151
	line	106
;LED.c: 106: case 4:
	
i1l3010:	
	line	107
;LED.c: 107: if(LEDArrMap[4]&0x01)
	btfss	0+(_LEDArrMap)+04h,(0)&7
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l3011
u353_20:
	line	109
	
i1l6145:	
;LED.c: 108: {
;LED.c: 109: TRISB5=0,WPUB5=0;RB5=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7	;volatile
	line	110
	
i1l3011:	
	line	111
;LED.c: 110: }
;LED.c: 111: if(LEDArrMap[4]&0x04)
	btfss	0+(_LEDArrMap)+04h,(2)&7
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l3012
u354_20:
	line	113
	
i1l6147:	
;LED.c: 112: {
;LED.c: 113: TRISB3=0,WPUB3=0;RB3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	114
	
i1l3012:	
	line	115
;LED.c: 114: }
;LED.c: 115: TRISC2=0,WPUC2=0;RC2=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7	;volatile
	line	116
;LED.c: 116: }
	goto	i1l6151
	line	28
	
i1l6149:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(LEDScan@LEDScanIndex),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           11     6 (fixed)
; simple_byte           16     9 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	5
	subwf	fsr,w
skipnc
goto i1l6151
movlw high(i1S6999)
movwf pclath
	movlw low(i1S6999)
	addwf fsr,w
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
i1S6999:
	ljmp	i1l2990
	ljmp	i1l2996
	ljmp	i1l3001
	ljmp	i1l3006
	ljmp	i1l3010
psect	text25

	line	117
	
i1l6151:	
;LED.c: 117: LEDScanIndex++;
	incf	(LEDScan@LEDScanIndex),f
	line	118
	
i1l6153:	
;LED.c: 118: if(LEDScanIndex>=5)
	movlw	low(05h)
	subwf	(LEDScan@LEDScanIndex),w
	skipc
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l3014
u355_20:
	line	120
	
i1l6155:	
;LED.c: 119: {
;LED.c: 120: LEDScanIndex=0;
	clrf	(LEDScan@LEDScanIndex)
	line	122
	
i1l3014:	
	return
	opt stack 0
GLOBAL	__end_of_LEDScan
	__end_of_LEDScan:
	signat	_LEDScan,89
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
