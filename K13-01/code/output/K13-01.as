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
	FNCALL	_Apply,_ADCPro
	FNCALL	_Apply,_DisplayPro
	FNCALL	_Apply,_KeyScan
	FNCALL	_Apply,_Motor
	FNCALL	_Apply,_Sec1sPro
	FNCALL	_Apply,_SystemSleep
	FNCALL	_SystemSleep,_SystemInit
	FNCALL	_SystemInit,_GPIOInit
	FNCALL	_SystemInit,_TimerInit
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
	global	_NumbArr
	global	_HideNumbArr
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	16

;initializer for _LEDArrMap
	retlw	0FFh
	retlw	0FFh
	retlw	0EFh
	retlw	0FFh
	retlw	0FFh
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	24

;initializer for _BatDecTime
	retlw	0D2h
	line	23

;initializer for _BatAddTime
	retlw	0F0h
psect	idataBANK1,class=CODE,space=0,delta=2,noexec
global __pidataBANK1
__pidataBANK1:
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	14

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
	line	6

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
	line	5

;initializer for _HideNumbArr
	retlw	low(0)
	retlw	040h
	retlw	070h
	retlw	078h
	retlw	07Eh
	retlw	07Fh
	retlw	07Fh
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
	line	13
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
	global	_USBFlag
	global	_WorkFlag
	global	_LedIovFlag
	global	_IovFlag
	global	_LowBatFlag
	global	_SystemONFlag
	global	_ADsum
	global	_WorkCnt
	global	_LedIndex
	global	_KeyCnt
	global	SystemSleep@SleepCnt
	global	_LockSta
	global	ErrPro@SwitchCnt
	global	ErrPro@cnt
	global	LockPro@Ledcnt
	global	LockPro@LockSwitchCnt
	global	LockPro@SwitchCnt
	global	WorkLedPro@delaycnt
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
	global	_WorkMin
	global	_BatPercent
	global	_ADCVal
	global	_TimeAddCnt
	global	_TimeDecCnt
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_T2CON
_T2CON	set	18
	global	_PIR1
_PIR1	set	12
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
	global	_RBIE
_RBIE	set	91
	global	_RBIF
_RBIF	set	88
	global	_RC3
_RC3	set	59
	global	_RC2
_RC2	set	58
	global	_RB7
_RB7	set	55
	global	_RB6
_RB6	set	54
	global	_RB5
_RB5	set	53
	global	_RB4
_RB4	set	52
	global	_RB3
_RB3	set	51
	global	_RA5
_RA5	set	45
	global	_RA3
_RA3	set	43
	global	_RA2
_RA2	set	42
	global	_RA1
_RA1	set	41
	global	_RA0
_RA0	set	40
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_IOCB
_IOCB	set	150
	global	_WPUB
_WPUB	set	149
	global	_PR2
_PR2	set	146
	global	_OSCCON
_OSCCON	set	143
	global	_PIE2
_PIE2	set	141
	global	_PIE1
_PIE1	set	140
	global	_TRISC
_TRISC	set	135
	global	_TRISB
_TRISB	set	134
	global	_TRISA
_TRISA	set	133
	global	_WPUB7
_WPUB7	set	1199
	global	_WPUB6
_WPUB6	set	1198
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
	global	_TRISB7
_TRISB7	set	1079
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB3
_TRISB3	set	1075
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

_USBFlag:
       ds      1

_WorkFlag:
       ds      1

_LedIovFlag:
       ds      1

_IovFlag:
       ds      1

_LowBatFlag:
       ds      1

_SystemONFlag:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_ADsum:
       ds      4

_WorkCnt:
       ds      2

_LedIndex:
       ds      2

_KeyCnt:
       ds      2

SystemSleep@SleepCnt:
       ds      2

_LockSta:
       ds      2

ErrPro@SwitchCnt:
       ds      1

ErrPro@cnt:
       ds      1

LockPro@Ledcnt:
       ds      1

LockPro@LockSwitchCnt:
       ds      1

LockPro@SwitchCnt:
       ds      1

WorkLedPro@delaycnt:
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

_WorkMin:
       ds      1

_BatPercent:
       ds      1

_ADCVal:
       ds      6

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	16
_LEDArrMap:
       ds      5

psect	dataBANK0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	24
_BatDecTime:
       ds      1

psect	dataBANK0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	23
_BatAddTime:
       ds      1

psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_TimeAddCnt:
       ds      2

_TimeDecCnt:
       ds      2

psect	dataBANK1,class=BANK1,space=1,noexec
global __pdataBANK1
__pdataBANK1:
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	14
_LEDSeg2:
       ds      16

psect	dataBANK1
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	6
_OffHideNumbArr:
       ds      14

psect	dataBANK1
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	3
_NumbArr:
       ds      10

psect	dataBANK1
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	5
_HideNumbArr:
       ds      7

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
	movlw low(__pdataBANK1+47)
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

; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+04h)
	fcall	clear_ram0
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+02Bh)
	fcall	clear_ram0
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
	clrf	((__pbitbssCOMMON/8)+1)&07Fh
	clrf	((__pbitbssCOMMON/8)+2)&07Fh
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
?_SystemSleep:	; 1 bytes @ 0x0
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
??_SystemSleep:	; 1 bytes @ 0x3
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
;!    Data        54
;!    BSS         47
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      8      11
;!    BANK0            80     26      76
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
;! (0) _main                                                 0     0      0    3223
;!                              _Apply
;!                         _SystemInit
;! ---------------------------------------------------------------------------------
;! (1) _Apply                                                0     0      0    3223
;!                             _ADCPro
;!                         _DisplayPro
;!                            _KeyScan
;!                              _Motor
;!                           _Sec1sPro
;!                        _SystemSleep
;! ---------------------------------------------------------------------------------
;! (2) _SystemSleep                                          0     0      0       0
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
;! (2) _DisplayPro                                           0     0      0     640
;!                        _DisplayIcon
;!                             _ErrPro
;!                            _LockPro
;!                          _USBLedPro
;!                         _WorkLedPro
;! ---------------------------------------------------------------------------------
;! (3) _WorkLedPro                                           2     2      0     268
;!                                              0 BANK0      2     2      0
;!                             ___bmul
;!                            ___lbdiv
;!                            ___lbmod
;! ---------------------------------------------------------------------------------
;! (3) ___bmul                                               3     2      1     224
;!                                              3 COMMON     3     2      1
;! ---------------------------------------------------------------------------------
;! (3) _USBLedPro                                            4     4      0      44
;!                                              0 BANK0      4     4      0
;!                            ___lbdiv
;!                            ___lbmod
;! ---------------------------------------------------------------------------------
;! (4) ___lbmod                                              5     4      1      22
;!                                              3 COMMON     5     4      1
;! ---------------------------------------------------------------------------------
;! (4) ___lbdiv                                              4     3      1      22
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
;!     _SystemSleep
;!       _SystemInit
;!         _GPIOInit
;!         _TimerInit
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
;!BANK0               50     1A      4C       5       95.0%
;!BITBANK0            50      0       0       4        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      8       B       1       78.6%
;!BITCOMMON            E      0       3       0       21.4%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      91       8        0.0%
;!ABS                  0      0      91       3        0.0%
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
	
l7276:	
;main.c: 5: SystemInit();
	fcall	_SystemInit
	line	8
	
l7278:	
;main.c: 7: {
;main.c: 8: Apply();
	fcall	_Apply
	line	9
# 9 "C:\Users\Administrator\Desktop\project\K13-01\code\main.c"
clrwdt ;# 
psect	maintext
	goto	l7278
	global	start
	ljmp	start
	opt stack 0
	line	11
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_Apply

;; *************** function _Apply *****************
;; Defined at:
;;		line 26 in file "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
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
;;		_SystemSleep
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	26
global __ptext1
__ptext1:	;psect for function _Apply
psect	text1
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	26
	global	__size_of_Apply
	__size_of_Apply	equ	__end_of_Apply-_Apply
	
_Apply:	
;incstack = 0
	opt	stack 2
; Regs used in _Apply: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	28
	
l7236:	
;K13-01.c: 28: if(time2ms)
	btfss	(_time2ms/8),(_time2ms)&7
	goto	u5151
	goto	u5150
u5151:
	goto	l7242
u5150:
	line	30
	
l7238:	
;K13-01.c: 29: {
;K13-01.c: 30: time2ms=0;
	bcf	(_time2ms/8),(_time2ms)&7
	line	31
;K13-01.c: 31: if(SystemONFlag)
	btfss	(_SystemONFlag/8),(_SystemONFlag)&7
	goto	u5161
	goto	u5160
u5161:
	goto	l7242
u5160:
	line	33
	
l7240:	
;K13-01.c: 32: {
;K13-01.c: 33: KeyScan();
	fcall	_KeyScan
	line	36
	
l7242:	
;K13-01.c: 34: }
;K13-01.c: 35: }
;K13-01.c: 36: if(time10ms)
	btfss	(_time10ms/8),(_time10ms)&7
	goto	u5171
	goto	u5170
u5171:
	goto	l1797
u5170:
	line	38
	
l7244:	
;K13-01.c: 37: {
;K13-01.c: 38: time10ms=0;
	bcf	(_time10ms/8),(_time10ms)&7
	line	39
;K13-01.c: 39: if(SystemONFlag==0&&VarPowerUpCount<100)
	btfsc	(_SystemONFlag/8),(_SystemONFlag)&7
	goto	u5181
	goto	u5180
u5181:
	goto	l7252
u5180:
	
l7246:	
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_VarPowerUpCount),w
	skipnc
	goto	u5191
	goto	u5190
u5191:
	goto	l7252
u5190:
	line	41
	
l7248:	
;K13-01.c: 40: {
;K13-01.c: 41: VarPowerUpCount++;
	incf	(_VarPowerUpCount),f
	line	42
	
l7250:	
;K13-01.c: 42: ADCPro();
	fcall	_ADCPro
	line	43
;K13-01.c: 43: }
	goto	l7258
	line	44
	
l7252:	
;K13-01.c: 44: else if(VarPowerUpCount>=100)
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_VarPowerUpCount),w
	skipc
	goto	u5201
	goto	u5200
u5201:
	goto	l7258
u5200:
	line	46
	
l7254:	
;K13-01.c: 45: {
;K13-01.c: 46: SystemONFlag=1;
	bsf	(_SystemONFlag/8),(_SystemONFlag)&7
	line	47
	
l7256:	
;K13-01.c: 47: VarPowerUpCount=0;
	clrf	(_VarPowerUpCount)
	line	50
	
l7258:	
;K13-01.c: 48: }
;K13-01.c: 50: if(SystemONFlag)
	btfss	(_SystemONFlag/8),(_SystemONFlag)&7
	goto	u5211
	goto	u5210
u5211:
	goto	l7268
u5210:
	line	52
	
l7260:	
;K13-01.c: 51: {
;K13-01.c: 52: ADCPro();
	fcall	_ADCPro
	line	53
	
l7262:	
;K13-01.c: 53: Motor();
	fcall	_Motor
	line	54
	
l7264:	
;K13-01.c: 54: DisplayPro();
	fcall	_DisplayPro
	line	56
	
l7266:	
;K13-01.c: 56: SystemSleep();
	fcall	_SystemSleep
	line	59
	
l7268:	
;K13-01.c: 58: }
;K13-01.c: 59: Sec1sCnt++;
	bcf	status, 6	;RP1=0, select bank0
	incf	(_Sec1sCnt),f
	line	60
	
l7270:	
;K13-01.c: 60: if(Sec1sCnt>=100)
	movlw	low(064h)
	subwf	(_Sec1sCnt),w
	skipc
	goto	u5221
	goto	u5220
u5221:
	goto	l1797
u5220:
	line	62
	
l7272:	
;K13-01.c: 61: {
;K13-01.c: 62: Sec1sCnt=0;
	clrf	(_Sec1sCnt)
	line	63
	
l7274:	
;K13-01.c: 63: Sec1sPro();
	fcall	_Sec1sPro
	line	66
	
l1797:	
	return
	opt stack 0
GLOBAL	__end_of_Apply
	__end_of_Apply:
	signat	_Apply,89
	global	_SystemSleep

;; *************** function _SystemSleep *****************
;; Defined at:
;;		line 68 in file "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
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
;;		On exit  : 100/0
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
;;		_SystemInit
;; This function is called by:
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	68
global __ptext2
__ptext2:	;psect for function _SystemSleep
psect	text2
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	68
	global	__size_of_SystemSleep
	__size_of_SystemSleep	equ	__end_of_SystemSleep-_SystemSleep
	
_SystemSleep:	
;incstack = 0
	opt	stack 2
; Regs used in _SystemSleep: [wreg+status,2+status,0+pclath+cstack]
	line	71
	
l6204:	
;K13-01.c: 70: static unsigned int SleepCnt=0;
;K13-01.c: 71: if(WorkFlag||OnOffFlag||USBFlag||KeyPress)
	btfsc	(_WorkFlag/8),(_WorkFlag)&7
	goto	u3361
	goto	u3360
u3361:
	goto	l6212
u3360:
	
l6206:	
	btfsc	(_OnOffFlag/8),(_OnOffFlag)&7
	goto	u3371
	goto	u3370
u3371:
	goto	l6212
u3370:
	
l6208:	
	btfsc	(_USBFlag/8),(_USBFlag)&7
	goto	u3381
	goto	u3380
u3381:
	goto	l6212
u3380:
	
l6210:	
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u3391
	goto	u3390
u3391:
	goto	l6214
u3390:
	line	73
	
l6212:	
;K13-01.c: 72: {
;K13-01.c: 73: SleepCnt=0;
	clrf	(SystemSleep@SleepCnt)
	clrf	(SystemSleep@SleepCnt+1)
	line	74
;K13-01.c: 74: }
	goto	l1807
	line	77
	
l6214:	
;K13-01.c: 75: else
;K13-01.c: 76: {
;K13-01.c: 77: SleepCnt++;
	incf	(SystemSleep@SleepCnt),f
	skipnz
	incf	(SystemSleep@SleepCnt+1),f
	line	78
	
l6216:	
;K13-01.c: 78: if(SleepCnt>=1000)
	movlw	03h
	subwf	(SystemSleep@SleepCnt+1),w
	movlw	0E8h
	skipnz
	subwf	(SystemSleep@SleepCnt),w
	skipc
	goto	u3401
	goto	u3400
u3401:
	goto	l1807
u3400:
	line	80
	
l6218:	
;K13-01.c: 79: {
;K13-01.c: 80: LEDWorkFlag=0;
	bcf	(_LEDWorkFlag/8),(_LEDWorkFlag)&7
	line	81
	
l6220:	
;K13-01.c: 81: SleepCnt=0;
	clrf	(SystemSleep@SleepCnt)
	clrf	(SystemSleep@SleepCnt+1)
	line	82
# 82 "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
clrwdt ;# 
psect	text2
	line	83
;K13-01.c: 83: INTCON=0;
	clrf	(11)	;volatile
	line	84
;K13-01.c: 84: PIE1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(140)^080h	;volatile
	line	85
;K13-01.c: 85: PIE2 = 0;
	clrf	(141)^080h	;volatile
	line	86
;K13-01.c: 86: PIR1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	87
;K13-01.c: 87: ADCON0 = 0;
	clrf	(31)	;volatile
	line	89
;K13-01.c: 89: TRISA =0X00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	90
;K13-01.c: 90: TRISB =0X00;
	clrf	(134)^080h	;volatile
	line	91
;K13-01.c: 91: TRISC =0x00;
	clrf	(135)^080h	;volatile
	line	92
	
l6222:	
;K13-01.c: 92: WPUA = 0xFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	93
	
l6224:	
;K13-01.c: 93: WPUB = 0xFF;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	94
	
l6226:	
;K13-01.c: 94: WPUC = 0xFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(399)^0180h	;volatile
	line	95
	
l6228:	
;K13-01.c: 95: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	96
	
l6230:	
;K13-01.c: 96: PORTB = 0;
	clrf	(6)	;volatile
	line	97
	
l6232:	
;K13-01.c: 97: PORTC = 0;
	clrf	(7)	;volatile
	line	98
	
l6234:	
;K13-01.c: 98: RA1=1;
	bsf	(41/8),(41)&7	;volatile
	line	99
	
l6236:	
;K13-01.c: 99: RA2=1;
	bsf	(42/8),(42)&7	;volatile
	line	100
	
l6238:	
;K13-01.c: 100: RA0=1;
	bsf	(40/8),(40)&7	;volatile
	line	101
	
l6240:	
;K13-01.c: 101: RA5 =0;
	bcf	(45/8),(45)&7	;volatile
	line	102
	
l6242:	
;K13-01.c: 102: TRISB6=1,WPUB6=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7	;volatile
	
l6244:	
	bsf	(1198/8)^080h,(1198)&7	;volatile
	line	103
	
l6246:	
;K13-01.c: 103: TRISB7=1,WPUB7=1;
	bsf	(1079/8)^080h,(1079)&7	;volatile
	
l6248:	
	bsf	(1199/8)^080h,(1199)&7	;volatile
	line	105
	
l6250:	
;K13-01.c: 105: WDTCON=0x00;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(261)^0100h	;volatile
	line	106
	
l6252:	
;K13-01.c: 106: RBIE=1;
	bsf	(91/8),(91)&7	;volatile
	line	107
	
l6254:	
;K13-01.c: 107: IOCB=0xC0;
	movlw	low(0C0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(150)^080h	;volatile
	line	108
	
l6256:	
;K13-01.c: 108: OSCCON=0X01;
	movlw	low(01h)
	movwf	(143)^080h	;volatile
	line	109
	
l6258:	
;K13-01.c: 109: RBIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	110
	
l6260:	
;K13-01.c: 110: PORTB;
	bcf	status, 5	;RP0=0, select bank0
	movf	(6),w	;volatile
	line	111
# 111 "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
sleep ;# 
	line	112
# 112 "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
nop ;# 
psect	text2
	line	113
	
l6262:	
;K13-01.c: 113: SystemInit();
	fcall	_SystemInit
	line	116
	
l1807:	
	return
	opt stack 0
GLOBAL	__end_of_SystemSleep
	__end_of_SystemSleep:
	signat	_SystemSleep,89
	global	_SystemInit

;; *************** function _SystemInit *****************
;; Defined at:
;;		line 118 in file "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
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
;;		_SystemSleep
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	118
global __ptext3
__ptext3:	;psect for function _SystemInit
psect	text3
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	118
	global	__size_of_SystemInit
	__size_of_SystemInit	equ	__end_of_SystemInit-_SystemInit
	
_SystemInit:	
;incstack = 0
	opt	stack 4
; Regs used in _SystemInit: [wreg+status,2+status,0+pclath+cstack]
	line	120
	
l5668:	
# 120 "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
nop ;# 
	line	121
# 121 "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
clrwdt ;# 
psect	text3
	line	122
	
l5670:	
;K13-01.c: 122: GPIOInit();
	fcall	_GPIOInit
	line	123
;K13-01.c: 123: TimerInit();
	fcall	_TimerInit
	line	124
	
l5672:	
;K13-01.c: 124: WDTCON=0x01;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	125
	
l1810:	
	return
	opt stack 0
GLOBAL	__end_of_SystemInit
	__end_of_SystemInit:
	signat	_SystemInit,89
	global	_TimerInit

;; *************** function _TimerInit *****************
;; Defined at:
;;		line 158 in file "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
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
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	158
global __ptext4
__ptext4:	;psect for function _TimerInit
psect	text4
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	158
	global	__size_of_TimerInit
	__size_of_TimerInit	equ	__end_of_TimerInit-_TimerInit
	
_TimerInit:	
;incstack = 0
	opt	stack 4
; Regs used in _TimerInit: [wreg]
	line	169
	
l5580:	
;K13-01.c: 169: OSCCON=0X61;
	movlw	low(061h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	170
;K13-01.c: 170: INTCON=0B11000000;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	171
;K13-01.c: 171: PIE1=0B00000010;
	movlw	low(02h)
	movwf	(140)^080h	;volatile
	line	172
;K13-01.c: 172: T2CON=0B00000100;
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	173
;K13-01.c: 173: PR2 = 200;
	movlw	low(0C8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	174
	
l1816:	
	return
	opt stack 0
GLOBAL	__end_of_TimerInit
	__end_of_TimerInit:
	signat	_TimerInit,89
	global	_GPIOInit

;; *************** function _GPIOInit *****************
;; Defined at:
;;		line 127 in file "C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
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
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	127
global __ptext5
__ptext5:	;psect for function _GPIOInit
psect	text5
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\K13-01.c"
	line	127
	global	__size_of_GPIOInit
	__size_of_GPIOInit	equ	__end_of_GPIOInit-_GPIOInit
	
_GPIOInit:	
;incstack = 0
	opt	stack 4
; Regs used in _GPIOInit: [wreg+status,2]
	line	129
	
l5540:	
;K13-01.c: 129: RBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1039/8)^080h,(1039)&7	;volatile
	line	131
	
l5542:	
;K13-01.c: 131: TRISA =0X00;
	clrf	(133)^080h	;volatile
	line	132
;K13-01.c: 132: TRISB =0X00;
	clrf	(134)^080h	;volatile
	line	133
;K13-01.c: 133: TRISC =0X00;
	clrf	(135)^080h	;volatile
	line	137
	
l5544:	
;K13-01.c: 137: WPUA =0XFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	138
	
l5546:	
;K13-01.c: 138: WPUB =0XFF;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	139
	
l5548:	
;K13-01.c: 139: WPUC =0XFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(399)^0180h	;volatile
	line	143
	
l5550:	
;K13-01.c: 143: PORTA = 0X80;
	movlw	low(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	144
	
l5552:	
;K13-01.c: 144: PORTB = 0X80;
	movlw	low(080h)
	movwf	(6)	;volatile
	line	145
	
l5554:	
;K13-01.c: 145: PORTC = 0;
	clrf	(7)	;volatile
	line	148
	
l5556:	
;K13-01.c: 148: RA5 =1;
	bsf	(45/8),(45)&7	;volatile
	line	149
	
l5558:	
;K13-01.c: 149: RBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1039/8)^080h,(1039)&7	;volatile
	line	150
	
l5560:	
;K13-01.c: 150: TRISB6=1,WPUB6=1;
	bsf	(1078/8)^080h,(1078)&7	;volatile
	
l5562:	
	bsf	(1198/8)^080h,(1198)&7	;volatile
	line	151
	
l5564:	
;K13-01.c: 151: TRISB7=1,WPUB7=1;
	bsf	(1079/8)^080h,(1079)&7	;volatile
	
l5566:	
	bsf	(1199/8)^080h,(1199)&7	;volatile
	line	153
	
l5568:	
;K13-01.c: 153: TRISA1=1,WPUA1=0; ANS1=1;
	bsf	(1065/8)^080h,(1065)&7	;volatile
	
l5570:	
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3185/8)^0180h,(3185)&7	;volatile
	
l5572:	
	bsf	(3137/8)^0180h,(3137)&7	;volatile
	line	154
	
l5574:	
;K13-01.c: 154: TRISA2=1,WPUA2=0; ANS2=1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1066/8)^080h,(1066)&7	;volatile
	
l5576:	
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3186/8)^0180h,(3186)&7	;volatile
	
l5578:	
	bsf	(3138/8)^0180h,(3138)&7	;volatile
	line	156
	
l1813:	
	return
	opt stack 0
GLOBAL	__end_of_GPIOInit
	__end_of_GPIOInit:
	signat	_GPIOInit,89
	global	_Sec1sPro

;; *************** function _Sec1sPro *****************
;; Defined at:
;;		line 68 in file "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
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
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	68
global __ptext6
__ptext6:	;psect for function _Sec1sPro
psect	text6
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	68
	global	__size_of_Sec1sPro
	__size_of_Sec1sPro	equ	__end_of_Sec1sPro-_Sec1sPro
	
_Sec1sPro:	
;incstack = 0
	opt	stack 3
; Regs used in _Sec1sPro: [wreg+status,2+status,0+pclath+cstack]
	line	71
	
l6794:	
	line	72
;ADC.c: 72: unsigned int TempPercent=0;
	clrf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	75
	
l6796:	
;ADC.c: 75: if(USBFlag)
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u4351
	goto	u4350
u4351:
	goto	l6834
u4350:
	line	77
	
l6798:	
;ADC.c: 76: {
;ADC.c: 77: if(ADCVal[2]<138)
	movlw	0
	subwf	1+(_ADCVal)+04h,w
	movlw	08Ah
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipnc
	goto	u4361
	goto	u4360
u4361:
	goto	l6802
u4360:
	line	79
	
l6800:	
;ADC.c: 78: {
;ADC.c: 79: TempPercent=0;
	clrf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	80
;ADC.c: 80: }
	goto	l6810
	line	81
	
l6802:	
;ADC.c: 81: else if(ADCVal[2]>175)
	movlw	0
	subwf	1+(_ADCVal)+04h,w
	movlw	0B0h
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipc
	goto	u4371
	goto	u4370
u4371:
	goto	l6806
u4370:
	line	83
	
l6804:	
;ADC.c: 82: {
;ADC.c: 83: TempPercent=99;
	movlw	063h
	movwf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	84
;ADC.c: 84: }
	goto	l6810
	line	87
	
l6806:	
;ADC.c: 85: else
;ADC.c: 86: {
;ADC.c: 87: TempPercent=ADCVal[2]-138;
	movf	1+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent+1)
	movf	0+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent)
	movlw	076h
	addwf	(Sec1sPro@TempPercent),f
	skipnc
	incf	(Sec1sPro@TempPercent+1),f
	movlw	0FFh
	addwf	(Sec1sPro@TempPercent+1),f
	line	88
	
l6808:	
;ADC.c: 88: TempPercent=TempPercent*4/3;
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
	line	90
	
l6810:	
;ADC.c: 89: }
;ADC.c: 90: if(ActualPercent>TempPercent)
	movf	(Sec1sPro@ActualPercent),w
	movwf	(??_Sec1sPro+0)+0
	clrf	(??_Sec1sPro+0)+0+1
	movf	1+(??_Sec1sPro+0)+0,w
	subwf	(Sec1sPro@TempPercent+1),w
	skipz
	goto	u4385
	movf	0+(??_Sec1sPro+0)+0,w
	subwf	(Sec1sPro@TempPercent),w
u4385:
	skipnc
	goto	u4381
	goto	u4380
u4381:
	goto	l6816
u4380:
	line	92
	
l6812:	
;ADC.c: 91: {
;ADC.c: 92: if(ActualPercent)
	movf	((Sec1sPro@ActualPercent)),w
	btfsc	status,2
	goto	u4391
	goto	u4390
u4391:
	goto	l6822
u4390:
	line	94
	
l6814:	
;ADC.c: 93: {
;ADC.c: 94: ActualPercent--;
	decf	(Sec1sPro@ActualPercent),f
	goto	l6822
	line	97
	
l6816:	
;ADC.c: 97: else if(ActualPercent<TempPercent)
	movf	(Sec1sPro@ActualPercent),w
	movwf	(??_Sec1sPro+0)+0
	clrf	(??_Sec1sPro+0)+0+1
	movf	(Sec1sPro@TempPercent+1),w
	subwf	1+(??_Sec1sPro+0)+0,w
	skipz
	goto	u4405
	movf	(Sec1sPro@TempPercent),w
	subwf	0+(??_Sec1sPro+0)+0,w
u4405:
	skipnc
	goto	u4401
	goto	u4400
u4401:
	goto	l6822
u4400:
	line	99
	
l6818:	
;ADC.c: 98: {
;ADC.c: 99: if(ActualPercent<99)
	movlw	low(063h)
	subwf	(Sec1sPro@ActualPercent),w
	skipnc
	goto	u4411
	goto	u4410
u4411:
	goto	l6822
u4410:
	line	101
	
l6820:	
;ADC.c: 100: {
;ADC.c: 101: ActualPercent++;
	incf	(Sec1sPro@ActualPercent),f
	line	104
	
l6822:	
;ADC.c: 102: }
;ADC.c: 103: }
;ADC.c: 104: if(ActualPercent>BatPercent)
	movf	(Sec1sPro@ActualPercent),w
	subwf	(_BatPercent),w
	skipnc
	goto	u4421
	goto	u4420
u4421:
	goto	l6832
u4420:
	line	106
	
l6824:	
;ADC.c: 105: {
;ADC.c: 106: PercentErr=ActualPercent-BatPercent;
	movf	(_BatPercent),w
	subwf	(Sec1sPro@ActualPercent),w
	movwf	(Sec1sPro@PercentErr)
	line	107
	
l6826:	
;ADC.c: 107: if(PercentErr<5)
	movlw	low(05h)
	subwf	(Sec1sPro@PercentErr),w
	skipnc
	goto	u4431
	goto	u4430
u4431:
	goto	l6830
u4430:
	line	109
	
l6828:	
;ADC.c: 108: {
;ADC.c: 109: BatAddTime=90-15*PercentErr;
	movlw	low(0F1h)
	movwf	(___bmul@multiplicand)
	movf	(Sec1sPro@PercentErr),w
	fcall	___bmul
	addlw	05Ah
	movwf	(_BatAddTime)
	line	110
;ADC.c: 110: }
	goto	l6834
	line	113
	
l6830:	
;ADC.c: 111: else
;ADC.c: 112: {
;ADC.c: 113: BatAddTime=15;
	movlw	low(0Fh)
	movwf	(_BatAddTime)
	goto	l6834
	line	118
	
l6832:	
;ADC.c: 116: else
;ADC.c: 117: {
;ADC.c: 118: BatAddTime=240;
	movlw	low(0F0h)
	movwf	(_BatAddTime)
	line	123
	
l6834:	
;ADC.c: 119: }
;ADC.c: 120: }
;ADC.c: 123: if(WorkFlag)
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u4441
	goto	u4440
u4441:
	goto	l6876
u4440:
	line	125
	
l6836:	
;ADC.c: 124: {
;ADC.c: 125: if(ADCVal[2]<134)
	movlw	0
	subwf	1+(_ADCVal)+04h,w
	movlw	086h
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipnc
	goto	u4451
	goto	u4450
u4451:
	goto	l6840
u4450:
	line	127
	
l6838:	
;ADC.c: 126: {
;ADC.c: 127: TempPercent=0;
	clrf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	128
;ADC.c: 128: }
	goto	l609
	line	129
	
l6840:	
;ADC.c: 129: else if(ADCVal[2]>167)
	movlw	0
	subwf	1+(_ADCVal)+04h,w
	movlw	0A8h
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipc
	goto	u4461
	goto	u4460
u4461:
	goto	l6844
u4460:
	line	131
	
l6842:	
;ADC.c: 130: {
;ADC.c: 131: TempPercent=99;
	movlw	063h
	movwf	(Sec1sPro@TempPercent)
	clrf	(Sec1sPro@TempPercent+1)
	line	132
;ADC.c: 132: }
	goto	l609
	line	135
	
l6844:	
;ADC.c: 133: else
;ADC.c: 134: {
;ADC.c: 135: TempPercent=ADCVal[2]-134;
	movf	1+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent+1)
	movf	0+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent)
	movlw	07Ah
	addwf	(Sec1sPro@TempPercent),f
	skipnc
	incf	(Sec1sPro@TempPercent+1),f
	movlw	0FFh
	addwf	(Sec1sPro@TempPercent+1),f
	line	136
	
l609:	
	line	137
;ADC.c: 136: }
;ADC.c: 137: if(TempPercent>=33)
	movlw	0
	subwf	(Sec1sPro@TempPercent+1),w
	movlw	021h
	skipnz
	subwf	(Sec1sPro@TempPercent),w
	skipc
	goto	u4471
	goto	u4470
u4471:
	goto	l6852
u4470:
	line	139
	
l6846:	
;ADC.c: 138: {
;ADC.c: 139: TempPercent=33+(ADCVal[2]-150)*2;
	movf	1+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent+1)
	movf	0+(_ADCVal)+04h,w
	movwf	(Sec1sPro@TempPercent)
	
l6848:	
	clrc
	rlf	(Sec1sPro@TempPercent),f
	rlf	(Sec1sPro@TempPercent+1),f
	
l6850:	
	movlw	0F5h
	addwf	(Sec1sPro@TempPercent),f
	skipnc
	incf	(Sec1sPro@TempPercent+1),f
	movlw	0FEh
	addwf	(Sec1sPro@TempPercent+1),f
	line	141
	
l6852:	
;ADC.c: 140: }
;ADC.c: 141: if(ActualPercent>TempPercent)
	movf	(Sec1sPro@ActualPercent),w
	movwf	(??_Sec1sPro+0)+0
	clrf	(??_Sec1sPro+0)+0+1
	movf	1+(??_Sec1sPro+0)+0,w
	subwf	(Sec1sPro@TempPercent+1),w
	skipz
	goto	u4485
	movf	0+(??_Sec1sPro+0)+0,w
	subwf	(Sec1sPro@TempPercent),w
u4485:
	skipnc
	goto	u4481
	goto	u4480
u4481:
	goto	l6858
u4480:
	line	143
	
l6854:	
;ADC.c: 142: {
;ADC.c: 143: if(ActualPercent)
	movf	((Sec1sPro@ActualPercent)),w
	btfsc	status,2
	goto	u4491
	goto	u4490
u4491:
	goto	l6864
u4490:
	line	145
	
l6856:	
;ADC.c: 144: {
;ADC.c: 145: ActualPercent--;
	decf	(Sec1sPro@ActualPercent),f
	goto	l6864
	line	148
	
l6858:	
;ADC.c: 148: else if(ActualPercent<TempPercent)
	movf	(Sec1sPro@ActualPercent),w
	movwf	(??_Sec1sPro+0)+0
	clrf	(??_Sec1sPro+0)+0+1
	movf	(Sec1sPro@TempPercent+1),w
	subwf	1+(??_Sec1sPro+0)+0,w
	skipz
	goto	u4505
	movf	(Sec1sPro@TempPercent),w
	subwf	0+(??_Sec1sPro+0)+0,w
u4505:
	skipnc
	goto	u4501
	goto	u4500
u4501:
	goto	l6864
u4500:
	line	150
	
l6860:	
;ADC.c: 149: {
;ADC.c: 150: if(ActualPercent<99)
	movlw	low(063h)
	subwf	(Sec1sPro@ActualPercent),w
	skipnc
	goto	u4511
	goto	u4510
u4511:
	goto	l6864
u4510:
	line	152
	
l6862:	
;ADC.c: 151: {
;ADC.c: 152: ActualPercent++;
	incf	(Sec1sPro@ActualPercent),f
	line	155
	
l6864:	
;ADC.c: 153: }
;ADC.c: 154: }
;ADC.c: 155: if(ActualPercent<BatPercent)
	movf	(_BatPercent),w
	subwf	(Sec1sPro@ActualPercent),w
	skipnc
	goto	u4521
	goto	u4520
u4521:
	goto	l6876
u4520:
	line	157
	
l6866:	
;ADC.c: 156: {
;ADC.c: 157: PercentErr=BatPercent-ActualPercent;
	movf	(Sec1sPro@ActualPercent),w
	subwf	(_BatPercent),w
	movwf	(Sec1sPro@PercentErr)
	line	158
	
l6868:	
;ADC.c: 158: if(PercentErr<5&&ActualPercent)
	movlw	low(05h)
	subwf	(Sec1sPro@PercentErr),w
	skipnc
	goto	u4531
	goto	u4530
u4531:
	goto	l6874
u4530:
	
l6870:	
	movf	((Sec1sPro@ActualPercent)),w
	btfsc	status,2
	goto	u4541
	goto	u4540
u4541:
	goto	l6874
u4540:
	line	160
	
l6872:	
;ADC.c: 159: {
;ADC.c: 160: BatDecTime=75-15*PercentErr;
	movlw	low(0F1h)
	movwf	(___bmul@multiplicand)
	movf	(Sec1sPro@PercentErr),w
	fcall	___bmul
	addlw	04Bh
	movwf	(_BatDecTime)
	line	161
;ADC.c: 161: }
	goto	l623
	line	164
	
l6874:	
;ADC.c: 162: else
;ADC.c: 163: {
;ADC.c: 164: BatDecTime=8;
	movlw	low(08h)
	movwf	(_BatDecTime)
	goto	l623
	line	169
	
l6876:	
;ADC.c: 167: else
;ADC.c: 168: {
;ADC.c: 169: BatDecTime=210;
	movlw	low(0D2h)
	movwf	(_BatDecTime)
	line	176
	
l623:	
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
psect	text7,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
	line	6
global __ptext7
__ptext7:	;psect for function ___lwdiv
psect	text7
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 3
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l6718:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
l6720:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u4251
	goto	u4250
u4251:
	goto	l6740
u4250:
	line	16
	
l6722:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	l6726
	line	18
	
l6724:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	19
	incf	(___lwdiv@counter),f
	line	17
	
l6726:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4261
	goto	u4260
u4261:
	goto	l6724
u4260:
	line	22
	
l6728:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	23
	
l6730:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4275
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4275:
	skipc
	goto	u4271
	goto	u4270
u4271:
	goto	l6736
u4270:
	line	24
	
l6732:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
l6734:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	27
	
l6736:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	28
	
l6738:	
	decfsz	(___lwdiv@counter),f
	goto	u4281
	goto	u4280
u4281:
	goto	l6728
u4280:
	line	30
	
l6740:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	31
	
l4579:	
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
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\Motor.c"
	line	7
global __ptext8
__ptext8:	;psect for function _Motor
psect	text8
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\Motor.c"
	line	7
	global	__size_of_Motor
	__size_of_Motor	equ	__end_of_Motor-_Motor
	
_Motor:	
;incstack = 0
	opt	stack 3
; Regs used in _Motor: [wreg+status,2+status,0+pclath+cstack]
	line	9
	
l7176:	
;Motor.c: 9: if(!WorkFlag)
	btfsc	(_WorkFlag/8),(_WorkFlag)&7
	goto	u5041
	goto	u5040
u5041:
	goto	l4223
u5040:
	line	11
	
l7178:	
;Motor.c: 10: {
;Motor.c: 11: RA3=0;
	bcf	(43/8),(43)&7	;volatile
	line	12
	
l7180:	
;Motor.c: 12: WorkCnt=0;
	clrf	(_WorkCnt)
	clrf	(_WorkCnt+1)
	line	13
;Motor.c: 13: TimeDecCnt=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_TimeDecCnt)^080h
	clrf	(_TimeDecCnt+1)^080h
	line	14
;Motor.c: 14: }
	goto	l7204
	line	15
	
l4223:	
;Motor.c: 15: else if(WorkFlag&&!LockSta.LockFlag)
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u5051
	goto	u5050
u5051:
	goto	l7204
u5050:
	
l7182:	
	btfsc	(_LockSta),6
	goto	u5061
	goto	u5060
u5061:
	goto	l7204
u5060:
	line	17
	
l7184:	
;Motor.c: 16: {
;Motor.c: 17: RA3=1;
	bsf	(43/8),(43)&7	;volatile
	line	18
	
l7186:	
;Motor.c: 18: TimeDecCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_TimeDecCnt)^080h,f
	skipnz
	incf	(_TimeDecCnt+1)^080h,f
	line	19
	
l7188:	
;Motor.c: 19: if(TimeDecCnt>=BatDecTime*100)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_BatDecTime),w
	movwf	(___wmul@multiplier)
	clrf	(___wmul@multiplier+1)
	movlw	064h
	movwf	(___wmul@multiplicand)
	clrf	(___wmul@multiplicand+1)
	fcall	___wmul
	movf	(1+(?___wmul)),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_TimeDecCnt+1)^080h,w
	skipz
	goto	u5075
	movf	(0+(?___wmul)),w
	subwf	(_TimeDecCnt)^080h,w
u5075:
	skipc
	goto	u5071
	goto	u5070
u5071:
	goto	l4226
u5070:
	line	21
	
l7190:	
;Motor.c: 20: {
;Motor.c: 21: TimeDecCnt=0;
	clrf	(_TimeDecCnt)^080h
	clrf	(_TimeDecCnt+1)^080h
	line	22
	
l7192:	
;Motor.c: 22: if(BatPercent)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_BatPercent)),w
	btfsc	status,2
	goto	u5081
	goto	u5080
u5081:
	goto	l4226
u5080:
	line	24
	
l7194:	
;Motor.c: 23: {
;Motor.c: 24: BatPercent--;
	decf	(_BatPercent),f
	line	26
	
l4226:	
	line	27
;Motor.c: 25: }
;Motor.c: 26: }
;Motor.c: 27: WorkCnt++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_WorkCnt),f
	skipnz
	incf	(_WorkCnt+1),f
	line	28
	
l7196:	
;Motor.c: 28: if(WorkCnt>=6000)
	movlw	017h
	subwf	(_WorkCnt+1),w
	movlw	070h
	skipnz
	subwf	(_WorkCnt),w
	skipc
	goto	u5091
	goto	u5090
u5091:
	goto	l7204
u5090:
	line	30
	
l7198:	
;Motor.c: 29: {
;Motor.c: 30: WorkCnt=0;
	clrf	(_WorkCnt)
	clrf	(_WorkCnt+1)
	line	31
	
l7200:	
;Motor.c: 31: if(WorkMin<99)
	movlw	low(063h)
	subwf	(_WorkMin),w
	skipnc
	goto	u5101
	goto	u5100
u5101:
	goto	l4225
u5100:
	line	33
	
l7202:	
;Motor.c: 32: {
;Motor.c: 33: WorkMin++;
	incf	(_WorkMin),f
	goto	l7204
	line	36
	
l4225:	
	line	37
	
l7204:	
;Motor.c: 34: }
;Motor.c: 35: }
;Motor.c: 36: }
;Motor.c: 37: if(USBFlag)
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u5111
	goto	u5110
u5111:
	goto	l7220
u5110:
	line	39
	
l7206:	
;Motor.c: 38: {
;Motor.c: 39: TimeAddCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_TimeAddCnt)^080h,f
	skipnz
	incf	(_TimeAddCnt+1)^080h,f
	line	40
	
l7208:	
;Motor.c: 40: if(TimeAddCnt>BatAddTime*100)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_BatAddTime),w
	movwf	(___wmul@multiplier)
	clrf	(___wmul@multiplier+1)
	movlw	064h
	movwf	(___wmul@multiplicand)
	clrf	(___wmul@multiplicand+1)
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	movf	(_TimeAddCnt+1)^080h,w
	subwf	(1+(?___wmul)),w
	skipz
	goto	u5125
	movf	(_TimeAddCnt)^080h,w
	subwf	(0+(?___wmul)),w
u5125:
	skipnc
	goto	u5121
	goto	u5120
u5121:
	goto	l7216
u5120:
	line	42
	
l7210:	
;Motor.c: 41: {
;Motor.c: 42: TimeAddCnt=0;
	clrf	(_TimeAddCnt)^080h
	clrf	(_TimeAddCnt+1)^080h
	line	43
	
l7212:	
;Motor.c: 43: if(BatPercent<99)
	movlw	low(063h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_BatPercent),w
	skipnc
	goto	u5131
	goto	u5130
u5131:
	goto	l7216
u5130:
	line	45
	
l7214:	
;Motor.c: 44: {
;Motor.c: 45: BatPercent++;
	incf	(_BatPercent),f
	line	48
	
l7216:	
;Motor.c: 46: }
;Motor.c: 47: }
;Motor.c: 48: if(BatPercent<=125)
	movlw	low(07Eh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_BatPercent),w
	skipnc
	goto	u5141
	goto	u5140
u5141:
	goto	l4233
u5140:
	line	50
	
l7218:	
;Motor.c: 49: {
;Motor.c: 50: RA5 =0;
	bcf	(45/8),(45)&7	;volatile
	line	51
;Motor.c: 51: }
	goto	l4236
	line	52
	
l4233:	
	line	54
;Motor.c: 52: else
;Motor.c: 53: {
;Motor.c: 54: RA5 =1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(45/8),(45)&7	;volatile
	goto	l4236
	line	59
	
l7220:	
;Motor.c: 57: else
;Motor.c: 58: {
;Motor.c: 59: TimeAddCnt=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_TimeAddCnt)^080h
	clrf	(_TimeAddCnt+1)^080h
	goto	l4233
	line	62
	
l4236:	
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
psect	text9,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul16.c"
	line	15
global __ptext9
__ptext9:	;psect for function ___wmul
psect	text9
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul16.c"
	line	15
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
;incstack = 0
	opt	stack 3
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	43
	
l7160:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	45
	
l7162:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u5021
	goto	u5020
u5021:
	goto	l7166
u5020:
	line	46
	
l7164:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	47
	
l7166:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	48
	
l7168:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	49
	
l7170:	
	movf	((___wmul@multiplier)),w
iorwf	((___wmul@multiplier+1)),w
	btfss	status,2
	goto	u5031
	goto	u5030
u5031:
	goto	l7162
u5030:
	line	52
	
l7172:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	53
	
l4242:	
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
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\Key.c"
	line	9
global __ptext10
__ptext10:	;psect for function _KeyScan
psect	text10
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\Key.c"
	line	9
	global	__size_of_KeyScan
	__size_of_KeyScan	equ	__end_of_KeyScan-_KeyScan
	
_KeyScan:	
;incstack = 0
	opt	stack 4
; Regs used in _KeyScan: [wreg+status,2+status,0]
	line	11
	
l6046:	
;Key.c: 11: if(!RB6)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7	;volatile
	goto	u2761
	goto	u2760
u2761:
	goto	l2379
u2760:
	line	13
	
l6048:	
;Key.c: 12: {
;Key.c: 13: KeyPress=1;
	bsf	(_KeyPress/8),(_KeyPress)&7
	line	14
;Key.c: 14: }
	goto	l2380
	line	15
	
l2379:	
	line	17
;Key.c: 15: else
;Key.c: 16: {
;Key.c: 17: KeyPress=0;
	bcf	(_KeyPress/8),(_KeyPress)&7
	line	18
	
l2380:	
	line	20
;Key.c: 18: }
;Key.c: 20: if(KeyPress&&KeyCnt<10&&KeyInBuf==KeyPress&&(!LowBatFlag||USBFlag)&&!LockSta.LockFlag)
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u2771
	goto	u2770
u2771:
	goto	l2381
u2770:
	
l6050:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipnc
	goto	u2781
	goto	u2780
u2781:
	goto	l2381
u2780:
	
l6052:	
	btfsc	(_KeyPress/8),(_KeyPress)&7
	goto	u2791
	goto	u2790
u2791:
	movlw	1
	goto	u2792
u2790:
	movlw	0
u2792:
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u2801
	goto	u2800
u2801:
	movlw	1
	goto	u2802
u2800:
	movlw	0
u2802:
	xorwf	(??_KeyScan+0)+0,w
	skipz
	goto	u2811
	goto	u2810
u2811:
	goto	l2381
u2810:
	
l6054:	
	btfss	(_LowBatFlag/8),(_LowBatFlag)&7
	goto	u2821
	goto	u2820
u2821:
	goto	l2383
u2820:
	
l6056:	
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u2831
	goto	u2830
u2831:
	goto	l2381
u2830:
	
l2383:	
	btfsc	(_LockSta),6
	goto	u2841
	goto	u2840
u2841:
	goto	l2381
u2840:
	line	22
	
l6058:	
;Key.c: 21: {
;Key.c: 22: KeyCnt++;
	incf	(_KeyCnt),f
	skipnz
	incf	(_KeyCnt+1),f
	line	23
	
l6060:	
;Key.c: 23: if(KeyCnt>=10)
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l2386
u2850:
	line	25
	
l6062:	
;Key.c: 24: {
;Key.c: 25: WorkFlag=~WorkFlag;
	movlw	1<<((_WorkFlag)&7)
	xorwf	((_WorkFlag)/8),f
	line	26
	
l6064:	
;Key.c: 26: if(WorkFlag)
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u2861
	goto	u2860
u2861:
	goto	l2386
u2860:
	line	28
	
l6066:	
;Key.c: 27: {
;Key.c: 28: LEDWorkFlag=1;
	bsf	(_LEDWorkFlag/8),(_LEDWorkFlag)&7
	line	29
;Key.c: 29: OnOffFlag=0;
	bcf	(_OnOffFlag/8),(_OnOffFlag)&7
	line	30
	
l6068:	
;Key.c: 30: WorkMin=0;
	clrf	(_WorkMin)
	goto	l2386
	line	34
	
l2381:	
;Key.c: 34: else if(KeyPress&&(KeyCnt>=10||LockSta.LockFlag)&&KeyCnt<250&&KeyInBuf==KeyPress&&!USBFlag)
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u2871
	goto	u2870
u2871:
	goto	l2387
u2870:
	
l6070:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipnc
	goto	u2881
	goto	u2880
u2881:
	goto	l6074
u2880:
	
l6072:	
	btfss	(_LockSta),6
	goto	u2891
	goto	u2890
u2891:
	goto	l2387
u2890:
	
l6074:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0FAh
	skipnz
	subwf	(_KeyCnt),w
	skipnc
	goto	u2901
	goto	u2900
u2901:
	goto	l2387
u2900:
	
l6076:	
	btfsc	(_KeyPress/8),(_KeyPress)&7
	goto	u2911
	goto	u2910
u2911:
	movlw	1
	goto	u2912
u2910:
	movlw	0
u2912:
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u2921
	goto	u2920
u2921:
	movlw	1
	goto	u2922
u2920:
	movlw	0
u2922:
	xorwf	(??_KeyScan+0)+0,w
	skipz
	goto	u2931
	goto	u2930
u2931:
	goto	l2387
u2930:
	
l6078:	
	btfsc	(_USBFlag/8),(_USBFlag)&7
	goto	u2941
	goto	u2940
u2941:
	goto	l2387
u2940:
	line	36
	
l6080:	
;Key.c: 35: {
;Key.c: 36: KeyCnt++;
	incf	(_KeyCnt),f
	skipnz
	incf	(_KeyCnt+1),f
	line	37
	
l6082:	
;Key.c: 37: if(KeyCnt>=250||(LockSta.LockFlag&&KeyCnt>=10))
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0FAh
	skipnz
	subwf	(_KeyCnt),w
	skipnc
	goto	u2951
	goto	u2950
u2951:
	goto	l6088
u2950:
	
l6084:	
	btfss	(_LockSta),6
	goto	u2961
	goto	u2960
u2961:
	goto	l2386
u2960:
	
l6086:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l2386
u2970:
	line	39
	
l6088:	
;Key.c: 38: {
;Key.c: 39: KeyCnt=250;
	movlw	0FAh
	movwf	(_KeyCnt)
	clrf	(_KeyCnt+1)
	line	40
;Key.c: 40: LockNumb=2;
	movlw	low(02h)
	movwf	(_LockNumb)
	line	41
	
l6090:	
;Key.c: 41: if(!LockSta.LockFlag)
	btfsc	(_LockSta),6
	goto	u2981
	goto	u2980
u2981:
	goto	l2393
u2980:
	line	43
	
l6092:	
;Key.c: 42: {
;Key.c: 43: LockSta.LockStart=1;
	bsf	(_LockSta),0
	line	44
;Key.c: 44: LockSta.UnlockEnd=0;
	bcf	(_LockSta),5
	line	45
;Key.c: 45: }
	goto	l6068
	line	46
	
l2393:	
	line	48
;Key.c: 46: else
;Key.c: 47: {
;Key.c: 48: LockSta.UnlockStart=1;
	bsf	(_LockSta),3
	line	49
;Key.c: 49: LockSta.LockEnd=0;
	bcf	(_LockSta),2
	goto	l6068
	line	54
	
l2387:	
;Key.c: 54: else if(KeyPress&&KeyCnt>=250&&KeyInBuf==KeyPress&&!LockSta.LockEnd&&!LockSta.UnlockEnd)
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u2991
	goto	u2990
u2991:
	goto	l2396
u2990:
	
l6096:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0FAh
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u3001
	goto	u3000
u3001:
	goto	l2396
u3000:
	
l6098:	
	btfsc	(_KeyPress/8),(_KeyPress)&7
	goto	u3011
	goto	u3010
u3011:
	movlw	1
	goto	u3012
u3010:
	movlw	0
u3012:
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u3021
	goto	u3020
u3021:
	movlw	1
	goto	u3022
u3020:
	movlw	0
u3022:
	xorwf	(??_KeyScan+0)+0,w
	skipz
	goto	u3031
	goto	u3030
u3031:
	goto	l2396
u3030:
	
l6100:	
	btfsc	(_LockSta),2
	goto	u3041
	goto	u3040
u3041:
	goto	l2396
u3040:
	
l6102:	
	btfsc	(_LockSta),5
	goto	u3051
	goto	u3050
u3051:
	goto	l2396
u3050:
	line	56
	
l6104:	
;Key.c: 55: {
;Key.c: 56: KeyCnt++;
	incf	(_KeyCnt),f
	skipnz
	incf	(_KeyCnt+1),f
	line	57
	
l6106:	
;Key.c: 57: if(KeyCnt>=1750)
	movlw	06h
	subwf	(_KeyCnt+1),w
	movlw	0D6h
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u3061
	goto	u3060
u3061:
	goto	l2386
u3060:
	line	59
	
l6108:	
;Key.c: 58: {
;Key.c: 59: KeyCnt=1750;
	movlw	0D6h
	movwf	(_KeyCnt)
	movlw	06h
	movwf	((_KeyCnt))+1
	line	60
	
l6110:	
;Key.c: 60: LockSta.LockFlag=!LockSta.LockFlag;
	clrc
	btfss	(_LockSta),6
	setc
	btfsc	status,0
	goto	u3071
	goto	u3070
	
u3071:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_LockSta),6
	goto	u3084
u3070:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_LockSta),6
u3084:
	line	61
	
l6112:	
;Key.c: 61: if(LockSta.LockFlag)
	btfss	(_LockSta),6
	goto	u3091
	goto	u3090
u3091:
	goto	l2398
u3090:
	line	63
	
l6114:	
;Key.c: 62: {
;Key.c: 63: LockSta.LockStart=0;
	bcf	(_LockSta),0
	line	64
;Key.c: 64: LockSta.LockEnd=1;
	bsf	(_LockSta),2
	line	65
;Key.c: 65: WorkFlag=0;
	bcf	(_WorkFlag/8),(_WorkFlag)&7
	line	66
;Key.c: 66: LEDWorkFlag=0;
	bcf	(_LEDWorkFlag/8),(_LEDWorkFlag)&7
	line	67
;Key.c: 67: }
	goto	l2386
	line	68
	
l2398:	
	line	70
;Key.c: 68: else
;Key.c: 69: {
;Key.c: 70: LockSta.UnlockStart=0;
	bcf	(_LockSta),3
	line	71
;Key.c: 71: LockSta.UnlockEnd=1;
	bsf	(_LockSta),5
	line	72
;Key.c: 72: WorkFlag=1;
	bsf	(_WorkFlag/8),(_WorkFlag)&7
	line	73
;Key.c: 73: LEDWorkFlag=1;
	bsf	(_LEDWorkFlag/8),(_LEDWorkFlag)&7
	goto	l2386
	line	77
	
l2396:	
;Key.c: 77: else if(!KeyPress||KeyInBuf!=KeyPress)
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l6118
u3100:
	
l6116:	
	btfsc	(_KeyPress/8),(_KeyPress)&7
	goto	u3111
	goto	u3110
u3111:
	movlw	1
	goto	u3112
u3110:
	movlw	0
u3112:
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u3121
	goto	u3120
u3121:
	movlw	1
	goto	u3122
u3120:
	movlw	0
u3122:
	xorwf	(??_KeyScan+0)+0,w
	skipnz
	goto	u3131
	goto	u3130
u3131:
	goto	l2386
u3130:
	line	79
	
l6118:	
;Key.c: 78: {
;Key.c: 79: KeyCnt=0;
	clrf	(_KeyCnt)
	clrf	(_KeyCnt+1)
	line	80
	
l6120:	
;Key.c: 80: LockSta.UnlockEnd=0;
	bcf	(_LockSta),5
	line	81
	
l6122:	
;Key.c: 81: if(LockSta.LockEnd)
	btfss	(_LockSta),2
	goto	u3141
	goto	u3140
u3141:
	goto	l2404
u3140:
	line	83
	
l6124:	
;Key.c: 82: {
;Key.c: 83: LockSta.LockEnd=0;
	bcf	(_LockSta),2
	line	84
;Key.c: 84: LockSta.UnlockFail=1;
	bsf	(_LockSta),4
	line	85
	
l2404:	
	line	86
;Key.c: 85: }
;Key.c: 86: if(LockSta.UnlockStart)
	btfss	(_LockSta),3
	goto	u3151
	goto	u3150
u3151:
	goto	l2405
u3150:
	line	88
	
l6126:	
;Key.c: 87: {
;Key.c: 88: LockSta.UnlockStart=0;
	bcf	(_LockSta),3
	line	89
;Key.c: 89: LockSta.UnlockFail=1;
	bsf	(_LockSta),4
	line	90
	
l2405:	
	line	91
;Key.c: 90: }
;Key.c: 91: if(LockSta.LockStart)
	btfss	(_LockSta),0
	goto	u3161
	goto	u3160
u3161:
	goto	l2386
u3160:
	line	93
	
l6128:	
;Key.c: 92: {
;Key.c: 93: LockSta.LockStart=0;
	bcf	(_LockSta),0
	line	96
	
l2386:	
;Key.c: 94: }
;Key.c: 95: }
;Key.c: 96: KeyInBuf=KeyPress;
	bcf	(_KeyInBuf/8),(_KeyInBuf)&7
	btfss	(_KeyPress/8),(_KeyPress)&7
	goto	u3175
	bsf	(_KeyInBuf/8),(_KeyInBuf)&7
u3175:

	line	98
;Key.c: 98: if(!WorkFlag&&!KeyPress&&WorkMin!=0&&!USBFlag)
	btfsc	(_WorkFlag/8),(_WorkFlag)&7
	goto	u3181
	goto	u3180
u3181:
	goto	l2407
u3180:
	
l6130:	
	btfsc	(_KeyPress/8),(_KeyPress)&7
	goto	u3191
	goto	u3190
u3191:
	goto	l2407
u3190:
	
l6132:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_WorkMin)),w
	btfsc	status,2
	goto	u3201
	goto	u3200
u3201:
	goto	l2407
u3200:
	
l6134:	
	btfsc	(_USBFlag/8),(_USBFlag)&7
	goto	u3211
	goto	u3210
u3211:
	goto	l2407
u3210:
	line	100
	
l6136:	
;Key.c: 99: {
;Key.c: 100: OnOffFlag=1;
	bsf	(_OnOffFlag/8),(_OnOffFlag)&7
	line	101
	
l2407:	
	line	103
;Key.c: 101: }
;Key.c: 103: if(!RB7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(55/8),(55)&7	;volatile
	goto	u3221
	goto	u3220
u3221:
	goto	l2408
u3220:
	line	105
	
l6138:	
;Key.c: 104: {
;Key.c: 105: USBLink=1;
	bsf	(_USBLink/8),(_USBLink)&7
	line	106
;Key.c: 106: }
	goto	l2409
	line	107
	
l2408:	
	line	109
;Key.c: 107: else
;Key.c: 108: {
;Key.c: 109: USBLink=0;
	bcf	(_USBLink/8),(_USBLink)&7
	line	110
	
l2409:	
	line	112
;Key.c: 110: }
;Key.c: 112: if(USBLink)
	btfss	(_USBLink/8),(_USBLink)&7
	goto	u3231
	goto	u3230
u3231:
	goto	l2410
u3230:
	line	114
	
l6140:	
;Key.c: 113: {
;Key.c: 114: USBFlag=1;
	bsf	(_USBFlag/8),(_USBFlag)&7
	line	115
;Key.c: 115: LockSta.LockFlag=0;
	bcf	(_LockSta),6
	line	116
;Key.c: 116: }
	goto	l2413
	line	117
	
l2410:	
;Key.c: 117: else if(!USBLink)
	btfsc	(_USBLink/8),(_USBLink)&7
	goto	u3241
	goto	u3240
u3241:
	goto	l2413
u3240:
	line	119
	
l6142:	
;Key.c: 118: {
;Key.c: 119: USBFlag=0;
	bcf	(_USBFlag/8),(_USBFlag)&7
	line	121
	
l2413:	
	return
	opt stack 0
GLOBAL	__end_of_KeyScan
	__end_of_KeyScan:
	signat	_KeyScan,89
	global	_DisplayPro

;; *************** function _DisplayPro *****************
;; Defined at:
;;		line 145 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
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
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	145
global __ptext11
__ptext11:	;psect for function _DisplayPro
psect	text11
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	145
	global	__size_of_DisplayPro
	__size_of_DisplayPro	equ	__end_of_DisplayPro-_DisplayPro
	
_DisplayPro:	
;incstack = 0
	opt	stack 2
; Regs used in _DisplayPro: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	147
	
l7224:	
;LED.c: 147: LedIndex=0;
	clrf	(_LedIndex)
	clrf	(_LedIndex+1)
	line	148
	
l7226:	
;LED.c: 148: WorkLedPro();
	fcall	_WorkLedPro
	line	149
	
l7228:	
;LED.c: 149: USBLedPro();
	fcall	_USBLedPro
	line	150
	
l7230:	
;LED.c: 150: LockPro();
	fcall	_LockPro
	line	151
	
l7232:	
;LED.c: 151: ErrPro();
	fcall	_ErrPro
	line	152
	
l7234:	
;LED.c: 152: DisplayIcon(LedIndex);
	movf	(_LedIndex+1),w
	movwf	(DisplayIcon@index+1)
	movf	(_LedIndex),w
	movwf	(DisplayIcon@index)
	fcall	_DisplayIcon
	line	153
	
l3031:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayPro
	__end_of_DisplayPro:
	signat	_DisplayPro,89
	global	_WorkLedPro

;; *************** function _WorkLedPro *****************
;; Defined at:
;;		line 191 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
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
psect	text12,local,class=CODE,delta=2,merge=1,group=0
	line	191
global __ptext12
__ptext12:	;psect for function _WorkLedPro
psect	text12
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	191
	global	__size_of_WorkLedPro
	__size_of_WorkLedPro	equ	__end_of_WorkLedPro-_WorkLedPro
	
_WorkLedPro:	
;incstack = 0
	opt	stack 2
; Regs used in _WorkLedPro: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	199
	
l7044:	
;LED.c: 193: static char LedSwitchCnt=0;
;LED.c: 194: static bit LedSwitchFlag=0;
;LED.c: 195: static char index=0;
;LED.c: 196: static unsigned char cnt=0;
;LED.c: 197: static bit dir=0;
;LED.c: 198: static unsigned char delaycnt=0;
;LED.c: 199: if(LEDWorkFlag&&!OnOffFlag&&!LockSta.LockFlag&&!LockSta.LockStart&&(!USBFlag||WorkFlag))
	btfss	(_LEDWorkFlag/8),(_LEDWorkFlag)&7
	goto	u4741
	goto	u4740
u4741:
	goto	l3059
u4740:
	
l7046:	
	btfsc	(_OnOffFlag/8),(_OnOffFlag)&7
	goto	u4751
	goto	u4750
u4751:
	goto	l3059
u4750:
	
l7048:	
	btfsc	(_LockSta),6
	goto	u4761
	goto	u4760
u4761:
	goto	l3059
u4760:
	
l7050:	
	btfsc	(_LockSta),0
	goto	u4771
	goto	u4770
u4771:
	goto	l3059
u4770:
	
l7052:	
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u4781
	goto	u4780
u4781:
	goto	l7056
u4780:
	
l7054:	
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u4791
	goto	u4790
u4791:
	goto	l3059
u4790:
	line	201
	
l7056:	
;LED.c: 200: {
;LED.c: 201: if(BatPercent<=10&&WorkFlag)
	movlw	low(0Bh)
	subwf	(_BatPercent),w
	skipnc
	goto	u4801
	goto	u4800
u4801:
	goto	l7068
u4800:
	
l7058:	
	btfss	(_WorkFlag/8),(_WorkFlag)&7
	goto	u4811
	goto	u4810
u4811:
	goto	l7068
u4810:
	line	203
	
l7060:	
;LED.c: 202: {
;LED.c: 203: LedSwitchCnt++;
	incf	(WorkLedPro@LedSwitchCnt),f
	line	204
	
l7062:	
;LED.c: 204: if(LedSwitchCnt>=80)
	movlw	low(050h)
	subwf	(WorkLedPro@LedSwitchCnt),w
	skipc
	goto	u4821
	goto	u4820
u4821:
	goto	l7072
u4820:
	line	206
	
l7064:	
;LED.c: 205: {
;LED.c: 206: LedSwitchCnt=0;
	clrf	(WorkLedPro@LedSwitchCnt)
	line	207
	
l7066:	
;LED.c: 207: LedSwitchFlag=!LedSwitchFlag;
	movlw	1<<((WorkLedPro@LedSwitchFlag)&7)
	xorwf	((WorkLedPro@LedSwitchFlag)/8),f
	goto	l7072
	line	212
	
l7068:	
;LED.c: 210: else
;LED.c: 211: {
;LED.c: 212: LedSwitchCnt=0;
	clrf	(WorkLedPro@LedSwitchCnt)
	line	213
	
l7070:	
;LED.c: 213: LedSwitchFlag=1;
	bsf	(WorkLedPro@LedSwitchFlag/8),(WorkLedPro@LedSwitchFlag)&7
	line	215
	
l7072:	
;LED.c: 214: }
;LED.c: 215: if(LedSwitchFlag)
	btfss	(WorkLedPro@LedSwitchFlag/8),(WorkLedPro@LedSwitchFlag)&7
	goto	u4831
	goto	u4830
u4831:
	goto	l7078
u4830:
	line	217
	
l7074:	
;LED.c: 216: {
;LED.c: 217: LedIndex|=NumbArr[BatPercent/10];
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_BatPercent),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	iorwf	(_LedIndex),f
	line	218
	
l7076:	
;LED.c: 218: LedIndex|=(unsigned int)NumbArr[BatPercent%10]<<7;
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_BatPercent),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0
	clrf	(??_WorkLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u4845:
	clrc
	rlf	(??_WorkLedPro+0)+0,f
	rlf	(??_WorkLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u4845
	movf	0+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex+1),f
	line	220
	
l7078:	
;LED.c: 219: }
;LED.c: 220: cnt=0;
	clrf	(WorkLedPro@cnt)
	line	221
	
l7080:	
;LED.c: 221: index=0;
	clrf	(WorkLedPro@index)
	line	222
	
l7082:	
;LED.c: 222: dir=0;
	bcf	(WorkLedPro@dir/8),(WorkLedPro@dir)&7
	line	223
;LED.c: 223: }
	goto	l3072
	line	224
	
l3059:	
;LED.c: 224: else if(OnOffFlag)
	btfss	(_OnOffFlag/8),(_OnOffFlag)&7
	goto	u4851
	goto	u4850
u4851:
	goto	l3072
u4850:
	line	226
	
l7084:	
;LED.c: 225: {
;LED.c: 226: cnt++;
	incf	(WorkLedPro@cnt),f
	line	227
	
l7086:	
;LED.c: 227: if(cnt>=30)
	movlw	low(01Eh)
	subwf	(WorkLedPro@cnt),w
	skipc
	goto	u4861
	goto	u4860
u4861:
	goto	l7114
u4860:
	line	229
	
l7088:	
;LED.c: 228: {
;LED.c: 229: cnt=0;
	clrf	(WorkLedPro@cnt)
	line	230
	
l7090:	
;LED.c: 230: index++;
	incf	(WorkLedPro@index),f
	line	231
	
l7092:	
;LED.c: 231: if(index>=7)
	movlw	low(07h)
	subwf	(WorkLedPro@index),w
	skipc
	goto	u4871
	goto	u4870
u4871:
	goto	l7114
u4870:
	line	233
	
l7094:	
;LED.c: 232: {
;LED.c: 233: if(dir)
	btfss	(WorkLedPro@dir/8),(WorkLedPro@dir)&7
	goto	u4881
	goto	u4880
u4881:
	goto	l7110
u4880:
	line	235
	
l7096:	
;LED.c: 234: {
;LED.c: 235: index=6;
	movlw	low(06h)
	movwf	(WorkLedPro@index)
	line	236
	
l7098:	
;LED.c: 236: delaycnt++;
	incf	(WorkLedPro@delaycnt),f
	line	237
	
l7100:	
;LED.c: 237: if(delaycnt>=7)
	movlw	low(07h)
	subwf	(WorkLedPro@delaycnt),w
	skipc
	goto	u4891
	goto	u4890
u4891:
	goto	l3069
u4890:
	line	239
	
l7102:	
;LED.c: 238: {
;LED.c: 239: index=0;
	clrf	(WorkLedPro@index)
	line	240
;LED.c: 240: delaycnt=0;
	clrf	(WorkLedPro@delaycnt)
	line	241
	
l7104:	
;LED.c: 241: OnOffFlag=0;
	bcf	(_OnOffFlag/8),(_OnOffFlag)&7
	line	242
;LED.c: 242: WorkMin=0;
	clrf	(_WorkMin)
	goto	l7082
	line	249
	
l7110:	
;LED.c: 247: else
;LED.c: 248: {
;LED.c: 249: dir=!dir;
	movlw	1<<((WorkLedPro@dir)&7)
	xorwf	((WorkLedPro@dir)/8),f
	line	250
	
l7112:	
;LED.c: 250: index=0;
	clrf	(WorkLedPro@index)
	goto	l7114
	line	253
	
l3069:	
	line	255
	
l7114:	
;LED.c: 251: }
;LED.c: 253: }
;LED.c: 254: }
;LED.c: 255: if(!dir)
	btfsc	(WorkLedPro@dir/8),(WorkLedPro@dir)&7
	goto	u4901
	goto	u4900
u4901:
	goto	l7122
u4900:
	line	257
	
l7116:	
;LED.c: 256: {
;LED.c: 257: LedIndex|=NumbArr[BatPercent/10];
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_BatPercent),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	iorwf	(_LedIndex),f
	line	258
	
l7118:	
;LED.c: 258: LedIndex|=(unsigned int)NumbArr[BatPercent%10]<<7;
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_BatPercent),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0
	clrf	(??_WorkLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u4915:
	clrc
	rlf	(??_WorkLedPro+0)+0,f
	rlf	(??_WorkLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u4915
	movf	0+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex+1),f
	line	259
	
l7120:	
;LED.c: 259: LedIndex&=~OffHideNumbArr[index];
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
	line	260
;LED.c: 260: }
	goto	l3072
	line	263
	
l7122:	
;LED.c: 261: else
;LED.c: 262: {
;LED.c: 263: LedIndex|=NumbArr[WorkMin/10];
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_WorkMin),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	iorwf	(_LedIndex),f
	line	264
	
l7124:	
;LED.c: 264: LedIndex|=(unsigned int)NumbArr[WorkMin%10]<<7;
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_WorkMin),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_WorkLedPro+0)+0
	clrf	(??_WorkLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u4925:
	clrc
	rlf	(??_WorkLedPro+0)+0,f
	rlf	(??_WorkLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u4925
	movf	0+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_WorkLedPro+0)+0,w
	iorwf	(_LedIndex+1),f
	line	265
	
l7126:	
;LED.c: 265: LedIndex&=~OffHideNumbArr[6-index];
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
	line	268
	
l3072:	
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
psect	text13,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul8.c"
	line	4
global __ptext13
__ptext13:	;psect for function ___bmul
psect	text13
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
	
l5594:	
	clrf	(___bmul@product)
	line	43
	
l5596:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u1831
	goto	u1830
u1831:
	goto	l5600
u1830:
	line	44
	
l5598:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	45
	
l5600:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	46
	
l5602:	
	clrc
	rrf	(___bmul@multiplier),f
	line	47
	movf	((___bmul@multiplier)),w
	btfss	status,2
	goto	u1841
	goto	u1840
u1841:
	goto	l5596
u1840:
	line	50
	
l5604:	
	movf	(___bmul@product),w
	line	51
	
l4260:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
	signat	___bmul,8313
	global	_USBLedPro

;; *************** function _USBLedPro *****************
;; Defined at:
;;		line 155 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
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
;;      Temps:          0       4       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lbdiv
;;		___lbmod
;; This function is called by:
;;		_DisplayPro
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	155
global __ptext14
__ptext14:	;psect for function _USBLedPro
psect	text14
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	155
	global	__size_of_USBLedPro
	__size_of_USBLedPro	equ	__end_of_USBLedPro-_USBLedPro
	
_USBLedPro:	
;incstack = 0
	opt	stack 2
; Regs used in _USBLedPro: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	160
	
l7128:	
;LED.c: 157: static unsigned char index=0;
;LED.c: 158: static unsigned char cnt=0;
;LED.c: 160: if(USBFlag&&!WorkFlag&&!OnOffFlag)
	btfss	(_USBFlag/8),(_USBFlag)&7
	goto	u4931
	goto	u4930
u4931:
	goto	l7158
u4930:
	
l7130:	
	btfsc	(_WorkFlag/8),(_WorkFlag)&7
	goto	u4941
	goto	u4940
u4941:
	goto	l7158
u4940:
	
l7132:	
	btfsc	(_OnOffFlag/8),(_OnOffFlag)&7
	goto	u4951
	goto	u4950
u4951:
	goto	l7158
u4950:
	line	162
	
l7134:	
;LED.c: 161: {
;LED.c: 162: cnt++;
	incf	(USBLedPro@cnt),f
	line	163
	
l7136:	
;LED.c: 163: if(cnt>=40)
	movlw	low(028h)
	subwf	(USBLedPro@cnt),w
	skipc
	goto	u4961
	goto	u4960
u4961:
	goto	l7146
u4960:
	line	165
	
l7138:	
;LED.c: 164: {
;LED.c: 165: cnt=0;
	clrf	(USBLedPro@cnt)
	line	166
	
l7140:	
;LED.c: 166: index++;
	incf	(USBLedPro@index),f
	line	167
	
l7142:	
;LED.c: 167: if(index>=7)
	movlw	low(07h)
	subwf	(USBLedPro@index),w
	skipc
	goto	u4971
	goto	u4970
u4971:
	goto	l7146
u4970:
	line	169
	
l7144:	
;LED.c: 168: {
;LED.c: 169: index=0;
	clrf	(USBLedPro@index)
	line	172
	
l7146:	
;LED.c: 170: }
;LED.c: 171: }
;LED.c: 172: if(BatPercent<99)
	movlw	low(063h)
	subwf	(_BatPercent),w
	skipnc
	goto	u4981
	goto	u4980
u4981:
	goto	l7152
u4980:
	line	174
	
l7148:	
;LED.c: 173: {
;LED.c: 174: LedIndex|=(NumbArr[BatPercent/10]|(unsigned int)NumbArr[BatPercent%10]<<7);
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_BatPercent),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_USBLedPro+0)+0
	clrf	(??_USBLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u4995:
	clrc
	rlf	(??_USBLedPro+0)+0,f
	rlf	(??_USBLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u4995
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_BatPercent),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	0+(??_USBLedPro+0)+0,w
	bcf	status, 7	;select IRP bank1
	iorwf	indf,w
	movwf	(??_USBLedPro+2)+0
	movf	1+(??_USBLedPro+0)+0,w
	movwf	1+(??_USBLedPro+2)+0
	movf	0+(??_USBLedPro+2)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_USBLedPro+2)+0,w
	iorwf	(_LedIndex+1),f
	line	175
	
l7150:	
;LED.c: 175: LedIndex&=(HideNumbArr[index]|(unsigned int)HideNumbArr[index]<<7);
	movf	(USBLedPro@index),w
	addlw	low(_HideNumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_USBLedPro+0)+0
	clrf	(??_USBLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u5005:
	clrc
	rlf	(??_USBLedPro+0)+0,f
	rlf	(??_USBLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u5005
	movf	(USBLedPro@index),w
	addlw	low(_HideNumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	0+(??_USBLedPro+0)+0,w
	iorwf	indf,w
	movwf	(??_USBLedPro+2)+0
	movf	1+(??_USBLedPro+0)+0,w
	movwf	1+(??_USBLedPro+2)+0
	movf	0+(??_USBLedPro+2)+0,w
	andwf	(_LedIndex),f
	movf	1+(??_USBLedPro+2)+0,w
	andwf	(_LedIndex+1),f
	line	176
;LED.c: 176: }
	goto	l3044
	line	179
	
l7152:	
;LED.c: 177: else
;LED.c: 178: {
;LED.c: 179: index=0;
	clrf	(USBLedPro@index)
	line	180
	
l7154:	
;LED.c: 180: LedIndex|=NumbArr[BatPercent/10];
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(_BatPercent),w
	fcall	___lbdiv
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	iorwf	(_LedIndex),f
	line	181
	
l7156:	
;LED.c: 181: LedIndex|=NumbArr[BatPercent%10]<<7;
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(_BatPercent),w
	fcall	___lbmod
	addlw	low(_NumbArr|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_USBLedPro+0)+0
	clrf	(??_USBLedPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u5015:
	clrc
	rlf	(??_USBLedPro+0)+0,f
	rlf	(??_USBLedPro+0)+1,f
	decfsz	btemp+1,f
	goto	u5015
	movf	0+(??_USBLedPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_USBLedPro+0)+0,w
	iorwf	(_LedIndex+1),f
	goto	l3044
	line	186
	
l7158:	
;LED.c: 184: else
;LED.c: 185: {
;LED.c: 186: index=0;
	clrf	(USBLedPro@index)
	line	187
;LED.c: 187: cnt=0;
	clrf	(USBLedPro@cnt)
	line	189
	
l3044:	
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
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
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
psect	text15,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbmod.c"
	line	4
global __ptext15
__ptext15:	;psect for function ___lbmod
psect	text15
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
	
l6486:	
	movlw	low(08h)
	movwf	(___lbmod@counter)
	line	10
	
l6488:	
	clrf	(___lbmod@rem)
	line	12
	
l6490:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u3795:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u3795
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l6492:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l6494:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u3801
	goto	u3800
u3801:
	goto	l6498
u3800:
	line	15
	
l6496:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l6498:	
	decfsz	(___lbmod@counter),f
	goto	u3811
	goto	u3810
u3811:
	goto	l6490
u3810:
	line	17
	
l6500:	
	movf	(___lbmod@rem),w
	line	18
	
l4511:	
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
psect	text16,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbdiv.c"
	line	4
global __ptext16
__ptext16:	;psect for function ___lbdiv
psect	text16
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
	
l6462:	
	clrf	(___lbdiv@quotient)
	line	10
	
l6464:	
	movf	((___lbdiv@divisor)),w
	btfsc	status,2
	goto	u3751
	goto	u3750
u3751:
	goto	l6482
u3750:
	line	11
	
l6466:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l6470
	
l4500:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l6468:	
	incf	(___lbdiv@counter),f
	line	12
	
l6470:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u3761
	goto	u3760
u3761:
	goto	l4500
u3760:
	line	16
	
l4502:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l6472:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u3771
	goto	u3770
u3771:
	goto	l6478
u3770:
	line	19
	
l6474:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l6476:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l6478:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l6480:	
	decfsz	(___lbdiv@counter),f
	goto	u3781
	goto	u3780
u3781:
	goto	l4502
u3780:
	line	25
	
l6482:	
	movf	(___lbdiv@quotient),w
	line	26
	
l4505:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_LockPro

;; *************** function _LockPro *****************
;; Defined at:
;;		line 270 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
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
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	270
global __ptext17
__ptext17:	;psect for function _LockPro
psect	text17
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	270
	global	__size_of_LockPro
	__size_of_LockPro	equ	__end_of_LockPro-_LockPro
	
_LockPro:	
;incstack = 0
	opt	stack 3
; Regs used in _LockPro: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	275
	
l5806:	
;LED.c: 272: static unsigned char SwitchCnt=0,LockSwitchCnt=0;
;LED.c: 273: static unsigned char Ledcnt=0;
;LED.c: 274: static bit LedSwitchFlag=0;
;LED.c: 275: if(!USBFlag)
	btfsc	(_USBFlag/8),(_USBFlag)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l3101
u2260:
	line	277
	
l5808:	
;LED.c: 276: {
;LED.c: 277: if(LockSta.LockStart||LockSta.UnlockStart)
	btfsc	(_LockSta),0
	goto	u2271
	goto	u2270
u2271:
	goto	l5812
u2270:
	
l5810:	
	btfss	(_LockSta),3
	goto	u2281
	goto	u2280
u2281:
	goto	l5826
u2280:
	line	279
	
l5812:	
;LED.c: 278: {
;LED.c: 279: SwitchCnt++;
	incf	(LockPro@SwitchCnt),f
	line	280
	
l5814:	
;LED.c: 280: if(SwitchCnt>=100)
	movlw	low(064h)
	subwf	(LockPro@SwitchCnt),w
	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l5822
u2290:
	line	282
	
l5816:	
;LED.c: 281: {
;LED.c: 282: SwitchCnt=0;
	clrf	(LockPro@SwitchCnt)
	line	283
	
l5818:	
;LED.c: 283: if(LockNumb>0)
	movf	((_LockNumb)),w
	btfsc	status,2
	goto	u2301
	goto	u2300
u2301:
	goto	l5822
u2300:
	line	285
	
l5820:	
;LED.c: 284: {
;LED.c: 285: LockNumb--;
	decf	(_LockNumb),f
	line	288
	
l5822:	
;LED.c: 286: }
;LED.c: 287: }
;LED.c: 288: LedIndex|=NumbArr[0];
	bsf	status, 5	;RP0=1, select bank1
	movf	(_NumbArr)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	iorwf	(_LedIndex),f
	line	289
	
l5824:	
;LED.c: 289: LedIndex|=(unsigned int)NumbArr[LockNumb+1]<<7;
	movf	(_LockNumb),w
	addlw	low(_NumbArr|((0x0)<<8)+01h)&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_LockPro+0)+0
	clrf	(??_LockPro+0)+0+1
	movlw	07h
	movwf	btemp+1
u2315:
	clrc
	rlf	(??_LockPro+0)+0,f
	rlf	(??_LockPro+0)+1,f
	decfsz	btemp+1,f
	goto	u2315
	movf	0+(??_LockPro+0)+0,w
	iorwf	(_LedIndex),f
	movf	1+(??_LockPro+0)+0,w
	iorwf	(_LedIndex+1),f
	line	290
;LED.c: 290: }
	goto	l5828
	line	293
	
l5826:	
;LED.c: 291: else
;LED.c: 292: {
;LED.c: 293: SwitchCnt=0;
	clrf	(LockPro@SwitchCnt)
	line	295
	
l5828:	
;LED.c: 294: }
;LED.c: 295: if(LockSta.LockEnd||LockSta.UnlockFail||LockSta.UnlockStart)
	btfsc	(_LockSta),2
	goto	u2321
	goto	u2320
u2321:
	goto	l5834
u2320:
	
l5830:	
	btfsc	(_LockSta),4
	goto	u2331
	goto	u2330
u2331:
	goto	l5834
u2330:
	
l5832:	
	btfss	(_LockSta),3
	goto	u2341
	goto	u2340
u2341:
	goto	l5854
u2340:
	line	297
	
l5834:	
;LED.c: 296: {
;LED.c: 297: LockSwitchCnt++;
	incf	(LockPro@LockSwitchCnt),f
	line	298
	
l5836:	
;LED.c: 298: if(LockSwitchCnt>=35)
	movlw	low(023h)
	subwf	(LockPro@LockSwitchCnt),w
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l3096
u2350:
	line	300
	
l5838:	
;LED.c: 299: {
;LED.c: 300: LockSwitchCnt=0;
	clrf	(LockPro@LockSwitchCnt)
	line	301
	
l5840:	
;LED.c: 301: LedSwitchFlag=!LedSwitchFlag;
	movlw	1<<((LockPro@LedSwitchFlag)&7)
	xorwf	((LockPro@LedSwitchFlag)/8),f
	line	302
	
l5842:	
;LED.c: 302: if(!LedSwitchFlag&&LockSta.UnlockFail)
	btfsc	(LockPro@LedSwitchFlag/8),(LockPro@LedSwitchFlag)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l3096
u2360:
	
l5844:	
	btfss	(_LockSta),4
	goto	u2371
	goto	u2370
u2371:
	goto	l3096
u2370:
	line	304
	
l5846:	
;LED.c: 303: {
;LED.c: 304: Ledcnt++;
	incf	(LockPro@Ledcnt),f
	line	305
	
l5848:	
;LED.c: 305: if(Ledcnt>=3)
	movlw	low(03h)
	subwf	(LockPro@Ledcnt),w
	skipc
	goto	u2381
	goto	u2380
u2381:
	goto	l3096
u2380:
	line	307
	
l5850:	
;LED.c: 306: {
;LED.c: 307: LockSta.UnlockFail=0;
	bcf	(_LockSta),4
	line	310
	
l3096:	
	line	311
;LED.c: 308: }
;LED.c: 309: }
;LED.c: 310: }
;LED.c: 311: if(LedSwitchFlag)
	btfss	(LockPro@LedSwitchFlag/8),(LockPro@LedSwitchFlag)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l3101
u2390:
	line	313
	
l5852:	
;LED.c: 312: {
;LED.c: 313: LedIndex|=0x8000;
	bsf	(_LedIndex)+(15/8),(15)&7
	goto	l3101
	line	318
	
l5854:	
;LED.c: 316: else
;LED.c: 317: {
;LED.c: 318: Ledcnt=0;
	clrf	(LockPro@Ledcnt)
	line	319
;LED.c: 319: LockSwitchCnt=0;
	clrf	(LockPro@LockSwitchCnt)
	line	322
	
l3101:	
	return
	opt stack 0
GLOBAL	__end_of_LockPro
	__end_of_LockPro:
	signat	_LockPro,89
	global	_ErrPro

;; *************** function _ErrPro *****************
;; Defined at:
;;		line 324 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
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
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	line	324
global __ptext18
__ptext18:	;psect for function _ErrPro
psect	text18
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	324
	global	__size_of_ErrPro
	__size_of_ErrPro	equ	__end_of_ErrPro-_ErrPro
	
_ErrPro:	
;incstack = 0
	opt	stack 3
; Regs used in _ErrPro: [wreg+status,2+status,0]
	line	329
	
l5856:	
;LED.c: 326: static unsigned char cnt=0;
;LED.c: 327: static unsigned char SwitchCnt=0;
;LED.c: 328: static bit LedSwitchFlag=0;
;LED.c: 329: if(LedIovFlag)
	btfss	(_LedIovFlag/8),(_LedIovFlag)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l5882
u2400:
	line	331
	
l5858:	
;LED.c: 330: {
;LED.c: 331: SwitchCnt++;
	incf	(ErrPro@SwitchCnt),f
	line	332
	
l5860:	
;LED.c: 332: if(SwitchCnt>=35)
	movlw	low(023h)
	subwf	(ErrPro@SwitchCnt),w
	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l5878
u2410:
	line	334
	
l5862:	
;LED.c: 333: {
;LED.c: 334: SwitchCnt=0;
	clrf	(ErrPro@SwitchCnt)
	line	335
	
l5864:	
;LED.c: 335: LedSwitchFlag=!LedSwitchFlag;
	movlw	1<<((ErrPro@LedSwitchFlag)&7)
	xorwf	((ErrPro@LedSwitchFlag)/8),f
	line	336
	
l5866:	
;LED.c: 336: if(!IovFlag&&!LedSwitchFlag)
	btfsc	(_IovFlag/8),(_IovFlag)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l5878
u2420:
	
l5868:	
	btfsc	(ErrPro@LedSwitchFlag/8),(ErrPro@LedSwitchFlag)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l5878
u2430:
	line	338
	
l5870:	
;LED.c: 337: {
;LED.c: 338: cnt++;
	incf	(ErrPro@cnt),f
	line	339
	
l5872:	
;LED.c: 339: if(cnt>=3)
	movlw	low(03h)
	subwf	(ErrPro@cnt),w
	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l5878
u2440:
	line	341
	
l5874:	
;LED.c: 340: {
;LED.c: 341: cnt=0;
	clrf	(ErrPro@cnt)
	line	342
	
l5876:	
;LED.c: 342: LedIovFlag=0;
	bcf	(_LedIovFlag/8),(_LedIovFlag)&7
	line	346
	
l5878:	
;LED.c: 343: }
;LED.c: 344: }
;LED.c: 345: }
;LED.c: 346: if(LedSwitchFlag)
	btfss	(ErrPro@LedSwitchFlag/8),(ErrPro@LedSwitchFlag)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l3116
u2450:
	line	348
	
l5880:	
;LED.c: 347: {
;LED.c: 348: LedIndex|=0x4000;
	bsf	(_LedIndex)+(14/8),(14)&7
	goto	l3116
	line	353
	
l5882:	
;LED.c: 351: else
;LED.c: 352: {
;LED.c: 353: SwitchCnt=0;
	clrf	(ErrPro@SwitchCnt)
	line	355
	
l3116:	
	return
	opt stack 0
GLOBAL	__end_of_ErrPro
	__end_of_ErrPro:
	signat	_ErrPro,89
	global	_DisplayIcon

;; *************** function _DisplayIcon *****************
;; Defined at:
;;		line 125 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
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
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	line	125
global __ptext19
__ptext19:	;psect for function _DisplayIcon
psect	text19
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	125
	global	__size_of_DisplayIcon
	__size_of_DisplayIcon	equ	__end_of_DisplayIcon-_DisplayIcon
	
_DisplayIcon:	
;incstack = 0
	opt	stack 3
; Regs used in _DisplayIcon: [wreg-fsr0h+status,2+status,0+pclath]
	line	127
	
l6564:	
	line	128
	
l6566:	
;LED.c: 128: unsigned int Mask=0x01;
	clrf	(DisplayIcon@Mask)
	incf	(DisplayIcon@Mask),f
	clrf	(DisplayIcon@Mask+1)
	line	130
	
l6568:	
;LED.c: 130: for(i=0;i<16;i++)
	clrf	(DisplayIcon@i)
	line	132
	
l6574:	
;LED.c: 131: {
;LED.c: 132: if(index&Mask)
	movf	(DisplayIcon@Mask),w
	andwf	(DisplayIcon@index),w
	movwf	(??_DisplayIcon+0)+0
	movf	(DisplayIcon@Mask+1),w
	andwf	(DisplayIcon@index+1),w
	movwf	1+(??_DisplayIcon+0)+0
	movf	((??_DisplayIcon+0)+0),w
iorwf	((??_DisplayIcon+0)+1),w
	btfsc	status,2
	goto	u3911
	goto	u3910
u3911:
	goto	l6578
u3910:
	line	134
	
l6576:	
;LED.c: 133: {
;LED.c: 134: LEDArrMap[LEDSeg1[i]]|=(1<<LEDSeg2[i]);
	movlw	low(01h)
	movwf	(??_DisplayIcon+0)+0
	movf	(DisplayIcon@i),w
	addlw	low(_LEDSeg2|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	incf	indf,w
	goto	u3924
u3925:
	clrc
	rlf	(??_DisplayIcon+0)+0,f
u3924:
	addlw	-1
	skipz
	goto	u3925
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
	line	135
;LED.c: 135: }
	goto	l6580
	line	138
	
l6578:	
;LED.c: 136: else
;LED.c: 137: {
;LED.c: 138: LEDArrMap[LEDSeg1[i]]&=~(1<<LEDSeg2[i]);
	movlw	low(01h)
	movwf	(??_DisplayIcon+0)+0
	movf	(DisplayIcon@i),w
	addlw	low(_LEDSeg2|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	incf	indf,w
	goto	u3934
u3935:
	clrc
	rlf	(??_DisplayIcon+0)+0,f
u3934:
	addlw	-1
	skipz
	goto	u3935
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
	line	141
	
l6580:	
;LED.c: 139: }
;LED.c: 141: Mask<<=1;
	clrc
	rlf	(DisplayIcon@Mask),f
	rlf	(DisplayIcon@Mask+1),f
	line	130
	
l6582:	
	incf	(DisplayIcon@i),f
	
l6584:	
	movlw	low(010h)
	subwf	(DisplayIcon@i),w
	skipc
	goto	u3941
	goto	u3940
u3941:
	goto	l6574
u3940:
	line	143
	
l3028:	
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
psect	text20,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	10
global __ptext20
__ptext20:	;psect for function _ADCPro
psect	text20
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	10
	global	__size_of_ADCPro
	__size_of_ADCPro	equ	__end_of_ADCPro-_ADCPro
	
_ADCPro:	
;incstack = 0
	opt	stack 2
; Regs used in _ADCPro: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	12
	
l6744:	
;ADC.c: 12: switch (ADCState)
	goto	l6754
	line	15
	
l6746:	
;ADC.c: 15: ADCRead(0b00001111,ADCVal);
	movlw	(low(_ADCVal|((0x0)<<8)))&0ffh
	movwf	(ADCRead@Val)
	movlw	low(0Fh)
	fcall	_ADCRead
	line	16
;ADC.c: 16: break;
	goto	l575
	line	19
	
l6748:	
;ADC.c: 19: ADCRead(0b00000010,ADCVal+1);
	movlw	(low(_ADCVal|((0x0)<<8)+02h))&0ffh
	movwf	(ADCRead@Val)
	movlw	low(02h)
	fcall	_ADCRead
	line	20
;ADC.c: 20: break;
	goto	l575
	line	23
	
l6750:	
;ADC.c: 23: ADCRead(0b00000001,ADCVal+2);
	movlw	(low(_ADCVal|((0x0)<<8)+04h))&0ffh
	movwf	(ADCRead@Val)
	movlw	low(01h)
	fcall	_ADCRead
	line	24
;ADC.c: 24: break;
	goto	l575
	line	12
	
l6754:	
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
goto l575
movlw high(S7340)
movwf pclath
	movlw low(S7340)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S7340:
	ljmp	l6746
	ljmp	l6748
	ljmp	l6750
psect	text20

	line	25
	
l575:	
	line	26
;ADC.c: 26: if(SystemONFlag==0)
	btfsc	(_SystemONFlag/8),(_SystemONFlag)&7
	goto	u4291
	goto	u4290
u4291:
	goto	l6766
u4290:
	line	28
	
l6756:	
;ADC.c: 27: {
;ADC.c: 28: if(ADCVal[2]<134)
	movlw	0
	subwf	1+(_ADCVal)+04h,w
	movlw	086h
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipnc
	goto	u4301
	goto	u4300
u4301:
	goto	l6760
u4300:
	line	30
	
l6758:	
;ADC.c: 29: {
;ADC.c: 30: BatPercent=0;
	clrf	(_BatPercent)
	line	31
;ADC.c: 31: }
	goto	l6766
	line	32
	
l6760:	
;ADC.c: 32: else if(ADCVal[2]>175)
	movlw	0
	subwf	1+(_ADCVal)+04h,w
	movlw	0B0h
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipc
	goto	u4311
	goto	u4310
u4311:
	goto	l6764
u4310:
	line	34
	
l6762:	
;ADC.c: 33: {
;ADC.c: 34: BatPercent=99;
	movlw	low(063h)
	movwf	(_BatPercent)
	line	35
;ADC.c: 35: }
	goto	l6766
	line	38
	
l6764:	
;ADC.c: 36: else
;ADC.c: 37: {
;ADC.c: 38: BatPercent=ADCVal[2]-125;
	movf	0+(_ADCVal)+04h,w
	addlw	083h
	movwf	(_BatPercent)
	line	41
	
l6766:	
;ADC.c: 39: }
;ADC.c: 40: }
;ADC.c: 41: if(ADCVal[2]<125)
	movlw	0
	subwf	1+(_ADCVal)+04h,w
	movlw	07Dh
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipnc
	goto	u4321
	goto	u4320
u4321:
	goto	l583
u4320:
	line	43
	
l6768:	
;ADC.c: 42: {
;ADC.c: 43: LowBatFlag=1;
	bsf	(_LowBatFlag/8),(_LowBatFlag)&7
	line	44
;ADC.c: 44: }
	goto	l6770
	line	45
	
l583:	
	line	47
;ADC.c: 45: else
;ADC.c: 46: {
;ADC.c: 47: LowBatFlag=0;
	bcf	(_LowBatFlag/8),(_LowBatFlag)&7
	line	49
	
l6770:	
;ADC.c: 48: }
;ADC.c: 49: if(ADCVal[1]>29)
	movlw	0
	subwf	1+(_ADCVal)+02h,w
	movlw	01Eh
	skipnz
	subwf	0+(_ADCVal)+02h,w
	skipc
	goto	u4331
	goto	u4330
u4331:
	goto	l6786
u4330:
	line	51
	
l6772:	
;ADC.c: 50: {
;ADC.c: 51: CurrentCnt++;
	incf	(_CurrentCnt),f
	line	52
	
l6774:	
;ADC.c: 52: if(CurrentCnt>=200)
	movlw	low(0C8h)
	subwf	(_CurrentCnt),w
	skipc
	goto	u4341
	goto	u4340
u4341:
	goto	l588
u4340:
	line	54
	
l6776:	
;ADC.c: 53: {
;ADC.c: 54: CurrentCnt=200;
	movlw	low(0C8h)
	movwf	(_CurrentCnt)
	line	55
	
l6778:	
;ADC.c: 55: IovFlag=1;
	bsf	(_IovFlag/8),(_IovFlag)&7
	line	56
	
l6780:	
;ADC.c: 56: LedIovFlag=1;
	bsf	(_LedIovFlag/8),(_LedIovFlag)&7
	line	57
	
l6782:	
;ADC.c: 57: WorkFlag=0;
	bcf	(_WorkFlag/8),(_WorkFlag)&7
	line	58
	
l6784:	
;ADC.c: 58: WorkMin=0;
	clrf	(_WorkMin)
	goto	l588
	line	63
	
l6786:	
;ADC.c: 61: else
;ADC.c: 62: {
;ADC.c: 63: CurrentCnt=0;
	clrf	(_CurrentCnt)
	line	64
	
l6788:	
;ADC.c: 64: IovFlag=0;
	bcf	(_IovFlag/8),(_IovFlag)&7
	line	66
	
l588:	
	return
	opt stack 0
GLOBAL	__end_of_ADCPro
	__end_of_ADCPro:
	signat	_ADCPro,89
	global	_ADCRead

;; *************** function _ADCRead *****************
;; Defined at:
;;		line 178 in file "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
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
psect	text21,local,class=CODE,delta=2,merge=1,group=0
	line	178
global __ptext21
__ptext21:	;psect for function _ADCRead
psect	text21
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	178
	global	__size_of_ADCRead
	__size_of_ADCRead	equ	__end_of_ADCRead-_ADCRead
	
_ADCRead:	
;incstack = 0
	opt	stack 2
; Regs used in _ADCRead: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;ADCRead@ch stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(ADCRead@ch)^080h
	line	182
	
l6530:	
;ADC.c: 180: unsigned int ad_temp,AD_H,AD_L;
;ADC.c: 182: if(ADSample(ch))
	movf	(ADCRead@ch)^080h,w
	fcall	_ADSample
	xorlw	0
	skipnz
	goto	u3861
	goto	u3860
u3861:
	goto	l634
u3860:
	line	184
	
l6532:	
;ADC.c: 183: {
;ADC.c: 184: AD_H=ADRESH;
	movf	(30),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(ADCRead@AD_H)^080h
	clrf	(ADCRead@AD_H+1)^080h
	line	185
;ADC.c: 185: AD_L=ADRESL;
	movf	(158)^080h,w	;volatile
	movwf	(ADCRead@AD_L)^080h
	clrf	(ADCRead@AD_L+1)^080h
	line	186
;ADC.c: 186: ad_temp=(AD_H<<4)|(AD_L>>4);
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
	
l6534:	
	movf	(ADCRead@AD_L+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_ADCRead+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	movf	(ADCRead@AD_L)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_ADCRead+0)+0
	movlw	04h
u3875:
	clrc
	rrf	(??_ADCRead+0)+1,f
	rrf	(??_ADCRead+0)+0,f
	addlw	-1
	skipz
	goto	u3875
	movf	0+(??_ADCRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(ADCRead@ad_temp)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_ADCRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(ADCRead@ad_temp+1)^080h,f
	line	187
	
l6536:	
;ADC.c: 187: ADsum += ad_temp;
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
	goto	u3881
	addwf	(_ADsum+1),f
u3881:
	movf	2+(??_ADCRead+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3882
	addwf	(_ADsum+2),f
u3882:
	movf	3+(??_ADCRead+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3883
	addwf	(_ADsum+3),f
u3883:

	line	188
	
l6538:	
;ADC.c: 188: ADcnt++;
	incf	(_ADcnt),f
	line	189
;ADC.c: 189: if(ADcnt >= 10)
	movlw	low(0Ah)
	subwf	(_ADcnt),w
	skipc
	goto	u3891
	goto	u3890
u3891:
	goto	l634
u3890:
	line	191
	
l6540:	
;ADC.c: 190: {
;ADC.c: 191: ADcnt = 0;
	clrf	(_ADcnt)
	line	192
	
l6542:	
;ADC.c: 192: ADsum /=10;
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

	line	193
;ADC.c: 193: switch (ADCState)
	goto	l6552
	line	196
	
l6544:	
;ADC.c: 196: *Val=ADsum;
	movf	(ADCRead@Val),w
	movwf	fsr0
	movf	(_ADsum),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(_ADsum+1),w
	movwf	indf
	line	197
;ADC.c: 197: break;
	goto	l630
	line	200
	
l6546:	
;ADC.c: 200: *Val=ADsum*1000/(*(Val-1));
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
	line	201
;ADC.c: 201: break;
	goto	l630
	line	204
	
l6548:	
;ADC.c: 204: *Val=ADsum*100/(*(Val-2));
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
	line	205
;ADC.c: 205: break;
	goto	l630
	line	193
	
l6552:	
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
goto l630
movlw high(S7342)
movwf pclath
	movlw low(S7342)
	addwf fsr,w
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S7342:
	ljmp	l6544
	ljmp	l6546
	ljmp	l6548
psect	text21

	line	206
	
l630:	
	line	207
;ADC.c: 207: ADsum = 0;
	clrf	(_ADsum)
	clrf	(_ADsum+1)
	clrf	(_ADsum+2)
	clrf	(_ADsum+3)
	line	208
	
l6554:	
;ADC.c: 208: ADCState++;
	incf	(_ADCState),f
	line	209
	
l6556:	
;ADC.c: 209: if(ADCState>=3)
	movlw	low(03h)
	subwf	(_ADCState),w
	skipc
	goto	u3901
	goto	u3900
u3901:
	goto	l634
u3900:
	line	211
	
l6558:	
;ADC.c: 210: {
;ADC.c: 211: ADCState=0;
	clrf	(_ADCState)
	line	215
	
l634:	
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
psect	text22,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul32.c"
	line	15
global __ptext22
__ptext22:	;psect for function ___lmul
psect	text22
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul32.c"
	line	15
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
;incstack = 0
	opt	stack 2
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
l6450:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	120
	
l4251:	
	line	121
	btfss	(___lmul@multiplier),(0)&7
	goto	u3721
	goto	u3720
u3721:
	goto	l6454
u3720:
	line	122
	
l6452:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3731
	addwf	(___lmul@product+1),f
u3731:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3732
	addwf	(___lmul@product+2),f
u3732:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3733
	addwf	(___lmul@product+3),f
u3733:

	line	123
	
l6454:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	124
	
l6456:	
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
	goto	u3741
	goto	u3740
u3741:
	goto	l4251
u3740:
	line	128
	
l6458:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	129
	
l4254:	
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
psect	text23,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lldiv.c"
	line	6
global __ptext23
__ptext23:	;psect for function ___lldiv
psect	text23
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lldiv.c"
	line	6
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	14
	
l6504:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	15
	
l6506:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u3821
	goto	u3820
u3821:
	goto	l6526
u3820:
	line	16
	
l6508:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	l6512
	line	18
	
l6510:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	19
	incf	(___lldiv@counter),f
	line	17
	
l6512:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u3831
	goto	u3830
u3831:
	goto	l6510
u3830:
	line	22
	
l6514:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	23
	
l6516:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u3845
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u3845
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u3845
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u3845:
	skipc
	goto	u3841
	goto	u3840
u3841:
	goto	l6522
u3840:
	line	24
	
l6518:	
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
	
l6520:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	27
	
l6522:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	28
	
l6524:	
	decfsz	(___lldiv@counter),f
	goto	u3851
	goto	u3850
u3851:
	goto	l6514
u3850:
	line	30
	
l6526:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	31
	
l4526:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_ADSample

;; *************** function _ADSample *****************
;; Defined at:
;;		line 224 in file "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
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
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	224
global __ptext24
__ptext24:	;psect for function _ADSample
psect	text24
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
	line	224
	global	__size_of_ADSample
	__size_of_ADSample	equ	__end_of_ADSample-_ADSample
	
_ADSample:	
;incstack = 0
	opt	stack 2
; Regs used in _ADSample: [wreg+status,2+status,0]
;ADSample@ch stored from wreg
	movwf	(ADSample@ch)
	line	226
	
l6434:	
;ADC.c: 226: ADCON1 = 0x00;
	clrf	(159)^080h	;volatile
	line	227
	
l6436:	
;ADC.c: 227: ADCON0 = 0X41 | ( ch << 2);
	movf	(ADSample@ch),w
	movwf	(??_ADSample+0)+0
	movlw	(02h)-1
u3695:
	clrc
	rlf	(??_ADSample+0)+0,f
	addlw	-1
	skipz
	goto	u3695
	clrc
	rlf	(??_ADSample+0)+0,w
	iorlw	041h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	228
# 228 "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
nop ;# 
	line	229
# 229 "C:\Users\Administrator\Desktop\project\K13-01\code\ADC.c"
nop ;# 
psect	text24
	line	230
	
l6438:	
;ADC.c: 230: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7	;volatile
	line	231
	
l6440:	
;ADC.c: 231: volatile unsigned char i = 0;
	clrf	(ADSample@i)	;volatile
	line	232
;ADC.c: 232: while(GODONE)
	goto	l637
	
l638:	
	line	234
;ADC.c: 233: {
;ADC.c: 234: if(0 == (--i))
	decfsz	(ADSample@i),f	;volatile
	goto	u3701
	goto	u3700
u3701:
	goto	l637
u3700:
	line	235
	
l6442:	
;ADC.c: 235: return 0;
	movlw	low(0)
	goto	l640
	line	236
	
l637:	
	line	232
	btfsc	(249/8),(249)&7	;volatile
	goto	u3711
	goto	u3710
u3711:
	goto	l638
u3710:
	line	237
	
l6446:	
;ADC.c: 236: }
;ADC.c: 237: return 1;
	movlw	low(01h)
	line	238
	
l640:	
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
psect	text25,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\even.c"
	line	8
global __ptext25
__ptext25:	;psect for function _Isr_Timer
psect	text25
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
psect	text25
	line	10
	
i1l6352:	
;even.c: 10: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7	;volatile
	line	11
	
i1l6354:	
;even.c: 11: cnt2ms++;
	incf	(_cnt2ms),f
	line	12
;even.c: 12: cnt10ms++;
	incf	(_cnt10ms),f
	line	13
	
i1l6356:	
;even.c: 13: if(cnt2ms>=10)
	movlw	low(0Ah)
	subwf	(_cnt2ms),w
	skipc
	goto	u367_21
	goto	u367_20
u367_21:
	goto	i1l6364
u367_20:
	line	15
	
i1l6358:	
;even.c: 14: {
;even.c: 15: LEDScan();
	fcall	_LEDScan
	line	16
	
i1l6360:	
;even.c: 16: cnt2ms=0;
	clrf	(_cnt2ms)
	line	17
	
i1l6362:	
;even.c: 17: time2ms=1;
	bsf	(_time2ms/8),(_time2ms)&7
	line	19
	
i1l6364:	
;even.c: 18: }
;even.c: 19: if(cnt10ms>=50)
	movlw	low(032h)
	subwf	(_cnt10ms),w
	skipc
	goto	u368_21
	goto	u368_20
u368_21:
	goto	i1l1194
u368_20:
	line	21
	
i1l6366:	
;even.c: 20: {
;even.c: 21: cnt10ms=0;
	clrf	(_cnt10ms)
	line	22
	
i1l6368:	
;even.c: 22: time10ms=1;
	bsf	(_time10ms/8),(_time10ms)&7
	line	24
	
i1l1194:	
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
;;		line 18 in file "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
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
psect	text26,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	18
global __ptext26
__ptext26:	;psect for function _LEDScan
psect	text26
	file	"C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
	line	18
	global	__size_of_LEDScan
	__size_of_LEDScan	equ	__end_of_LEDScan-_LEDScan
	
_LEDScan:	
;incstack = 0
	opt	stack 2
; Regs used in _LEDScan: [wreg-fsr0h+status,2+status,0]
	line	22
	
i1l6264:	
;LED.c: 20: static unsigned char LEDScanIndex=0;
;LED.c: 22: TRISB5=1,WPUB5=0;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	line	23
;LED.c: 23: TRISB4=1,WPUB4=0;
	bsf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	line	24
;LED.c: 24: TRISB3=1,WPUB3=0;
	bsf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	line	25
;LED.c: 25: TRISC3=1,WPUC3=0;
	bsf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	line	26
;LED.c: 26: TRISC2=1,WPUC2=0;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	line	27
# 27 "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
nop ;# 
# 27 "C:\Users\Administrator\Desktop\project\K13-01\code\LED.c"
nop ;# 
psect	text26
	line	29
;LED.c: 29: switch(LEDScanIndex)
	goto	i1l6300
	line	31
;LED.c: 30: {
;LED.c: 31: case 0:
	
i1l2997:	
	line	32
;LED.c: 32: if(LEDArrMap[0]&0x02)
	btfss	(_LEDArrMap),(1)&7
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l2998
u341_20:
	line	34
	
i1l6266:	
;LED.c: 33: {
;LED.c: 34: TRISB4=0,WPUB4=0;RB4=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7	;volatile
	line	35
	
i1l2998:	
	line	36
;LED.c: 35: }
;LED.c: 36: if(LEDArrMap[0]&0x04)
	btfss	(_LEDArrMap),(2)&7
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l2999
u342_20:
	line	38
	
i1l6268:	
;LED.c: 37: {
;LED.c: 38: TRISB3=0,WPUB3=0;RB3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	39
	
i1l2999:	
	line	40
;LED.c: 39: }
;LED.c: 40: if(LEDArrMap[0]&0x08)
	btfss	(_LEDArrMap),(3)&7
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l3000
u343_20:
	line	42
	
i1l6270:	
;LED.c: 41: {
;LED.c: 42: TRISC3=0,WPUC3=0;RC3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	43
	
i1l3000:	
	line	44
;LED.c: 43: }
;LED.c: 44: if(LEDArrMap[0]&0x10)
	btfss	(_LEDArrMap),(4)&7
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l3001
u344_20:
	line	46
	
i1l6272:	
;LED.c: 45: {
;LED.c: 46: TRISC2=0,WPUC2=0;RC2=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7	;volatile
	line	47
	
i1l3001:	
	line	48
;LED.c: 47: }
;LED.c: 48: TRISB5=0,WPUB5=0;RB5=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bsf	(53/8),(53)&7	;volatile
	line	49
;LED.c: 49: break;
	goto	i1l6302
	line	51
;LED.c: 51: case 1:
	
i1l3003:	
	line	52
;LED.c: 52: if(LEDArrMap[1]&0x01)
	btfss	0+(_LEDArrMap)+01h,(0)&7
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l3004
u345_20:
	line	54
	
i1l6274:	
;LED.c: 53: {
;LED.c: 54: TRISB5=0,WPUB5=0;RB5=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7	;volatile
	line	55
	
i1l3004:	
	line	56
;LED.c: 55: }
;LED.c: 56: if(LEDArrMap[1]&0x04)
	btfss	0+(_LEDArrMap)+01h,(2)&7
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l3005
u346_20:
	line	58
	
i1l6276:	
;LED.c: 57: {
;LED.c: 58: TRISB3=0,WPUB3=0;RB3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	59
	
i1l3005:	
	line	60
;LED.c: 59: }
;LED.c: 60: if(LEDArrMap[1]&0x08)
	btfss	0+(_LEDArrMap)+01h,(3)&7
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l3006
u347_20:
	line	62
	
i1l6278:	
;LED.c: 61: {
;LED.c: 62: TRISC3=0,WPUC3=0;RC3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	63
	
i1l3006:	
	line	64
;LED.c: 63: }
;LED.c: 64: if(LEDArrMap[1]&0x10)
	btfss	0+(_LEDArrMap)+01h,(4)&7
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l3007
u348_20:
	line	66
	
i1l6280:	
;LED.c: 65: {
;LED.c: 66: TRISC2=0,WPUC2=0;RC2=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7	;volatile
	line	67
	
i1l3007:	
	line	68
;LED.c: 67: }
;LED.c: 68: TRISB4=0,WPUB4=0; RB4=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7	;volatile
	line	69
;LED.c: 69: break;
	goto	i1l6302
	line	71
;LED.c: 71: case 2:
	
i1l3008:	
	line	72
;LED.c: 72: if(LEDArrMap[2]&0x01)
	btfss	0+(_LEDArrMap)+02h,(0)&7
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l3009
u349_20:
	line	74
	
i1l6282:	
;LED.c: 73: {
;LED.c: 74: TRISB5=0,WPUB5=0;RB5=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7	;volatile
	line	75
	
i1l3009:	
	line	76
;LED.c: 75: }
;LED.c: 76: if(LEDArrMap[2]&0x02)
	btfss	0+(_LEDArrMap)+02h,(1)&7
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l3010
u350_20:
	line	78
	
i1l6284:	
;LED.c: 77: {
;LED.c: 78: TRISB4=0,WPUB4=0;RB4=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7	;volatile
	line	79
	
i1l3010:	
	line	80
;LED.c: 79: }
;LED.c: 80: if(LEDArrMap[2]&0x08)
	btfss	0+(_LEDArrMap)+02h,(3)&7
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l3011
u351_20:
	line	82
	
i1l6286:	
;LED.c: 81: {
;LED.c: 82: TRISC3=0,WPUC3=0;RC3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	83
	
i1l3011:	
	line	84
;LED.c: 83: }
;LED.c: 84: if(LEDArrMap[2]&0x10)
	btfss	0+(_LEDArrMap)+02h,(4)&7
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l3012
u352_20:
	line	86
	
i1l6288:	
;LED.c: 85: {
;LED.c: 86: TRISC2=0,WPUC2=0;RC2=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7	;volatile
	line	87
	
i1l3012:	
	line	88
;LED.c: 87: }
;LED.c: 88: TRISB3=0,WPUB3=0;RB3=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bsf	(51/8),(51)&7	;volatile
	line	89
;LED.c: 89: break;
	goto	i1l6302
	line	91
;LED.c: 91: case 3:
	
i1l3013:	
	line	92
;LED.c: 92: if(LEDArrMap[3]&0x01)
	btfss	0+(_LEDArrMap)+03h,(0)&7
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l3014
u353_20:
	line	94
	
i1l6290:	
;LED.c: 93: {
;LED.c: 94: TRISB5=0,WPUB5=0;RB5=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7	;volatile
	line	95
	
i1l3014:	
	line	96
;LED.c: 95: }
;LED.c: 96: if(LEDArrMap[3]&0x02)
	btfss	0+(_LEDArrMap)+03h,(1)&7
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l3015
u354_20:
	line	98
	
i1l6292:	
;LED.c: 97: {
;LED.c: 98: TRISB4=0,WPUB4=0;RB4=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	bcf	(1196/8)^080h,(1196)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7	;volatile
	line	99
	
i1l3015:	
	line	100
;LED.c: 99: }
;LED.c: 100: if(LEDArrMap[3]&0x04)
	btfss	0+(_LEDArrMap)+03h,(2)&7
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l3016
u355_20:
	line	102
	
i1l6294:	
;LED.c: 101: {
;LED.c: 102: TRISB3=0,WPUB3=0;RB3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	103
	
i1l3016:	
	line	104
;LED.c: 103: }
;LED.c: 104: TRISC3=0,WPUC3=0;RC3=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3195/8)^0180h,(3195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7	;volatile
	line	105
;LED.c: 105: break;
	goto	i1l6302
	line	107
;LED.c: 107: case 4:
	
i1l3017:	
	line	108
;LED.c: 108: if(LEDArrMap[4]&0x01)
	btfss	0+(_LEDArrMap)+04h,(0)&7
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l3018
u356_20:
	line	110
	
i1l6296:	
;LED.c: 109: {
;LED.c: 110: TRISB5=0,WPUB5=0;RB5=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bcf	(1197/8)^080h,(1197)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7	;volatile
	line	111
	
i1l3018:	
	line	112
;LED.c: 111: }
;LED.c: 112: if(LEDArrMap[4]&0x04)
	btfss	0+(_LEDArrMap)+04h,(2)&7
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l3019
u357_20:
	line	114
	
i1l6298:	
;LED.c: 113: {
;LED.c: 114: TRISB3=0,WPUB3=0;RB3=0 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7	;volatile
	bcf	(1195/8)^080h,(1195)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7	;volatile
	line	115
	
i1l3019:	
	line	116
;LED.c: 115: }
;LED.c: 116: TRISC2=0,WPUC2=0;RC2=1 ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1082/8)^080h,(1082)&7	;volatile
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3194/8)^0180h,(3194)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7	;volatile
	line	117
;LED.c: 117: }
	goto	i1l6302
	line	29
	
i1l6300:	
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
goto i1l6302
movlw high(i1S7344)
movwf pclath
	movlw low(i1S7344)
	addwf fsr,w
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
i1S7344:
	ljmp	i1l2997
	ljmp	i1l3003
	ljmp	i1l3008
	ljmp	i1l3013
	ljmp	i1l3017
psect	text26

	line	118
	
i1l6302:	
;LED.c: 118: LEDScanIndex++;
	incf	(LEDScan@LEDScanIndex),f
	line	119
	
i1l6304:	
;LED.c: 119: if(LEDScanIndex>=5)
	movlw	low(05h)
	subwf	(LEDScan@LEDScanIndex),w
	skipc
	goto	u358_21
	goto	u358_20
u358_21:
	goto	i1l3021
u358_20:
	line	121
	
i1l6306:	
;LED.c: 120: {
;LED.c: 121: LEDScanIndex=0;
	clrf	(LEDScan@LEDScanIndex)
	line	123
	
i1l3021:	
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
