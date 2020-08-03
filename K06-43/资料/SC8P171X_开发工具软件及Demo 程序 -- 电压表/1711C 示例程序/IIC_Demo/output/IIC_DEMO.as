opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	SC8P1713
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
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_I2C_WriteStart
	FNCALL	_main,_I2C_Write1Byte
	FNCALL	_main,_I2C_WriteStop
	FNCALL	_main,_I2C_Read1Byte
	FNCALL	_I2C_Read1Byte,_I2C_WaitMoment
	FNCALL	_I2C_WriteStop,_I2C_WaitMoment
	FNCALL	_I2C_Write1Byte,_I2C_WaitMoment
	FNCALL	_I2C_WriteStart,_I2C_WaitMoment
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_Recebuffer
	global	_Sendbuffer
	global	ISR@tcount
	global	_B_MainLoop
	global	_INTCON
psect	text250,local,class=CODE,delta=2
global __ptext250
__ptext250:
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PIR2
_PIR2	set	13
	global	_PORTB
_PORTB	set	6
	global	_T2CON
_T2CON	set	18
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_TMR2IF
_TMR2IF	set	97
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PIE2
_PIE2	set	141
	global	_PR2
_PR2	set	146
	global	_TRISB
_TRISB	set	134
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	file	"IIC_DEMO.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_B_MainLoop:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
ISR@tcount:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_Recebuffer:
       ds      5

_Sendbuffer:
       ds      5

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_I2C_WriteStart
?_I2C_WriteStart:	; 0 bytes @ 0x0
	global	?_I2C_WriteStop
?_I2C_WriteStop:	; 0 bytes @ 0x0
	global	?_I2C_WaitMoment
?_I2C_WaitMoment:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_I2C_Write1Byte
?_I2C_Write1Byte:	; 1 bytes @ 0x0
	global	?_I2C_Read1Byte
?_I2C_Read1Byte:	; 1 bytes @ 0x0
	ds	5
	global	??_I2C_WriteStart
??_I2C_WriteStart:	; 0 bytes @ 0x5
	global	??_I2C_Write1Byte
??_I2C_Write1Byte:	; 0 bytes @ 0x5
	global	??_I2C_WriteStop
??_I2C_WriteStop:	; 0 bytes @ 0x5
	global	??_I2C_Read1Byte
??_I2C_Read1Byte:	; 0 bytes @ 0x5
	global	??_I2C_WaitMoment
??_I2C_WaitMoment:	; 0 bytes @ 0x5
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	I2C_Write1Byte@data
I2C_Write1Byte@data:	; 1 bytes @ 0x0
	global	I2C_Read1Byte@ack
I2C_Read1Byte@ack:	; 1 bytes @ 0x0
	ds	1
	global	I2C_Write1Byte@i
I2C_Write1Byte@i:	; 1 bytes @ 0x1
	global	I2C_Read1Byte@data
I2C_Read1Byte@data:	; 1 bytes @ 0x1
	ds	1
	global	I2C_Read1Byte@i
I2C_Read1Byte@i:	; 1 bytes @ 0x2
	ds	1
	global	main@time1s
main@time1s:	; 1 bytes @ 0x3
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 11, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       9
;; BANK0           80      4      14
;; BANK1           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_I2C_Write1Byte
;;   _main->_I2C_Read1Byte
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_I2C_Read1Byte
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     254
;;                                              6 COMMON     1     1      0
;;                                              3 BANK0      1     1      0
;;                     _I2C_WriteStart
;;                     _I2C_Write1Byte
;;                      _I2C_WriteStop
;;                      _I2C_Read1Byte
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Read1Byte                                        4     4      0     142
;;                                              5 COMMON     1     1      0
;;                                              0 BANK0      3     3      0
;;                     _I2C_WaitMoment
;; ---------------------------------------------------------------------------------
;; (1) _I2C_WriteStop                                        0     0      0       0
;;                     _I2C_WaitMoment
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Write1Byte                                       3     3      0      78
;;                                              5 COMMON     1     1      0
;;                                              0 BANK0      2     2      0
;;                     _I2C_WaitMoment
;; ---------------------------------------------------------------------------------
;; (1) _I2C_WriteStart                                       0     0      0       0
;;                     _I2C_WaitMoment
;; ---------------------------------------------------------------------------------
;; (2) _I2C_WaitMoment                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_WriteStart
;;     _I2C_WaitMoment
;;   _I2C_Write1Byte
;;     _I2C_WaitMoment
;;   _I2C_WriteStop
;;     _I2C_WaitMoment
;;   _I2C_Read1Byte
;;     _I2C_WaitMoment
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       9       1       64.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      17       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      4       E       5       17.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;DATA                 0      0      19       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 31 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  time1s          1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          1       0       0
;;      Totals:         1       1       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_I2C_WriteStart
;;		_I2C_Write1Byte
;;		_I2C_WriteStop
;;		_I2C_Read1Byte
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
	line	31
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	32
	
l2153:	
;IIC_Soft_Master.c: 32: _nop();
	nop
	line	33
# 33 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
clrwdt ;#
psect	maintext
	line	34
	
l2155:	
;IIC_Soft_Master.c: 34: OSCCON = 0x71;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	36
	
l2157:	
;IIC_Soft_Master.c: 36: INTCON = 0;
	clrf	(11)	;volatile
	line	37
	
l2159:	
;IIC_Soft_Master.c: 37: TRISB = 0;
	clrf	(134)^080h	;volatile
	line	38
	
l2161:	
;IIC_Soft_Master.c: 38: PORTB = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	40
	
l2163:	
;IIC_Soft_Master.c: 40: PIR1 = 0;
	clrf	(12)	;volatile
	line	41
	
l2165:	
;IIC_Soft_Master.c: 41: PIR2 = 0;
	clrf	(13)	;volatile
	line	42
	
l2167:	
;IIC_Soft_Master.c: 42: PIE1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(140)^080h	;volatile
	line	43
	
l2169:	
;IIC_Soft_Master.c: 43: PIE2 = 0;
	clrf	(141)^080h	;volatile
	line	46
	
l2171:	
;IIC_Soft_Master.c: 46: PR2 = 250;
	movlw	(0FAh)
	movwf	(146)^080h	;volatile
	line	47
	
l2173:	
;IIC_Soft_Master.c: 47: T2CON = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	48
	
l2175:	
;IIC_Soft_Master.c: 48: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	50
	
l2177:	
;IIC_Soft_Master.c: 50: INTCON = 0XC0;
	movlw	(0C0h)
	movwf	(11)	;volatile
	goto	l2179
	line	54
;IIC_Soft_Master.c: 52: unsigned char time1s;
;IIC_Soft_Master.c: 54: while(1)
	
l557:	
	line	56
	
l2179:	
;IIC_Soft_Master.c: 55: {
;IIC_Soft_Master.c: 56: if(B_MainLoop)
	btfss	(_B_MainLoop/8),(_B_MainLoop)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l2179
u2440:
	line	58
	
l2181:	
;IIC_Soft_Master.c: 57: {
;IIC_Soft_Master.c: 58: B_MainLoop = 0;
	bcf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	59
# 59 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
clrwdt ;#
psect	maintext
	line	61
	
l2183:	
;IIC_Soft_Master.c: 61: if(++time1s >= 200)
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@time1s),f
	movlw	(0C8h)
	subwf	((main@time1s)),w
	skipc
	goto	u2451
	goto	u2450
u2451:
	goto	l2179
u2450:
	line	63
	
l2185:	
;IIC_Soft_Master.c: 62: {
;IIC_Soft_Master.c: 63: time1s = 0;
	clrf	(main@time1s)
	line	64
	
l2187:	
;IIC_Soft_Master.c: 64: Sendbuffer[0]++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(_Sendbuffer),f	;volatile
	line	67
	
l2189:	
;IIC_Soft_Master.c: 67: I2C_WriteStart();
	fcall	_I2C_WriteStart
	line	68
	
l2191:	
;IIC_Soft_Master.c: 68: I2C_Write1Byte(0xa0);
	movlw	(0A0h)
	fcall	_I2C_Write1Byte
	line	69
	
l2193:	
;IIC_Soft_Master.c: 69: I2C_Write1Byte(0x4);
	movlw	(04h)
	fcall	_I2C_Write1Byte
	line	70
	
l2195:	
;IIC_Soft_Master.c: 70: I2C_Write1Byte(Sendbuffer[0]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Sendbuffer),w	;volatile
	fcall	_I2C_Write1Byte
	line	71
	
l2197:	
;IIC_Soft_Master.c: 71: I2C_Write1Byte(~Sendbuffer[0]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(_Sendbuffer),w	;volatile
	fcall	_I2C_Write1Byte
	line	72
	
l2199:	
;IIC_Soft_Master.c: 72: I2C_Write1Byte(0x3);
	movlw	(03h)
	fcall	_I2C_Write1Byte
	line	73
	
l2201:	
;IIC_Soft_Master.c: 73: I2C_WriteStop();
	fcall	_I2C_WriteStop
	line	76
	
l2203:	
;IIC_Soft_Master.c: 76: I2C_WriteStart();
	fcall	_I2C_WriteStart
	line	77
	
l2205:	
;IIC_Soft_Master.c: 77: I2C_Write1Byte(0xa1);
	movlw	(0A1h)
	fcall	_I2C_Write1Byte
	line	78
	
l2207:	
;IIC_Soft_Master.c: 78: Recebuffer[0] = I2C_Read1Byte(0);
	movlw	(0)
	fcall	_I2C_Read1Byte
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Recebuffer)	;volatile
	line	79
	
l2209:	
;IIC_Soft_Master.c: 79: Recebuffer[1] = I2C_Read1Byte(0);
	movlw	(0)
	fcall	_I2C_Read1Byte
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_Recebuffer)+01h	;volatile
	line	80
	
l2211:	
;IIC_Soft_Master.c: 80: Recebuffer[2] = I2C_Read1Byte(0);
	movlw	(0)
	fcall	_I2C_Read1Byte
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_Recebuffer)+02h	;volatile
	line	81
	
l2213:	
;IIC_Soft_Master.c: 81: Recebuffer[3] = I2C_Read1Byte(1);
	movlw	(01h)
	fcall	_I2C_Read1Byte
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_Recebuffer)+03h	;volatile
	line	82
	
l2215:	
;IIC_Soft_Master.c: 82: I2C_WriteStop();
	fcall	_I2C_WriteStop
	goto	l2179
	line	83
	
l559:	
	goto	l2179
	line	84
	
l558:	
	goto	l2179
	line	85
	
l560:	
	line	54
	goto	l2179
	
l561:	
	line	86
	
l562:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_I2C_Read1Byte
psect	text251,local,class=CODE,delta=2
global __ptext251
__ptext251:

;; *************** function _I2C_Read1Byte *****************
;; Defined at:
;;		line 197 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
;; Parameters:    Size  Location     Type
;;  ack             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ack             1    0[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
;;  data            1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          1       0       0
;;      Totals:         1       3       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_WaitMoment
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text251
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
	line	197
	global	__size_of_I2C_Read1Byte
	__size_of_I2C_Read1Byte	equ	__end_of_I2C_Read1Byte-_I2C_Read1Byte
	
_I2C_Read1Byte:	
	opt	stack 5
; Regs used in _I2C_Read1Byte: [wreg+status,2+status,0+pclath+cstack]
;I2C_Read1Byte@ack stored from wreg
	line	199
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(I2C_Read1Byte@ack)
	
l2113:	
;IIC_Soft_Master.c: 198: unsigned char i,data;
;IIC_Soft_Master.c: 199: TRISC1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1081/8)^080h,(1081)&7
	line	200
;IIC_Soft_Master.c: 200: TRISC0 = 1;
	bsf	(1080/8)^080h,(1080)&7
	line	201
	
l2115:	
;IIC_Soft_Master.c: 201: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	203
;IIC_Soft_Master.c: 203: while(!RC0);
	goto	l586
	
l587:	
	
l586:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(56/8),(56)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l586
u2380:
	
l588:	
	line	204
;IIC_Soft_Master.c: 204: TRISC0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1080/8)^080h,(1080)&7
	line	205
;IIC_Soft_Master.c: 205: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	206
	
l2117:	
;IIC_Soft_Master.c: 206: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	208
	
l2119:	
;IIC_Soft_Master.c: 208: data <<= 1;
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rlf	(I2C_Read1Byte@data),f

	line	209
	
l2121:	
;IIC_Soft_Master.c: 209: if(RC1) data |= 0x1;
	btfss	(57/8),(57)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l589
u2390:
	
l2123:	
	bsf	(I2C_Read1Byte@data)+(0/8),(0)&7
	
l589:	
	line	212
;IIC_Soft_Master.c: 212: for(i = 0; i < 7; i++)
	clrf	(I2C_Read1Byte@i)
	
l2125:	
	movlw	(07h)
	subwf	(I2C_Read1Byte@i),w
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l590
u2400:
	goto	l591
	
l2127:	
	goto	l591
	line	213
	
l590:	
	line	214
;IIC_Soft_Master.c: 213: {
;IIC_Soft_Master.c: 214: RC0 = 1;
	bsf	(56/8),(56)&7
	line	215
	
l2129:	
;IIC_Soft_Master.c: 215: data <<= 1;
	clrc
	rlf	(I2C_Read1Byte@data),f

	line	216
	
l2131:	
;IIC_Soft_Master.c: 216: if(RC1) data |= 0x1;
	btfss	(57/8),(57)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l592
u2410:
	
l2133:	
	bsf	(I2C_Read1Byte@data)+(0/8),(0)&7
	
l592:	
	line	217
;IIC_Soft_Master.c: 217: RC0 = 0;
	bcf	(56/8),(56)&7
	line	212
	
l2135:	
	movlw	(01h)
	movwf	(??_I2C_Read1Byte+0)+0
	movf	(??_I2C_Read1Byte+0)+0,w
	addwf	(I2C_Read1Byte@i),f
	
l2137:	
	movlw	(07h)
	subwf	(I2C_Read1Byte@i),w
	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l590
u2420:
	
l591:	
	line	220
;IIC_Soft_Master.c: 218: }
;IIC_Soft_Master.c: 220: TRISC1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	222
	
l2139:	
;IIC_Soft_Master.c: 222: if(ack)RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(I2C_Read1Byte@ack),w
	skipz
	goto	u2430
	goto	l593
u2430:
	
l2141:	
	bsf	(57/8),(57)&7
	goto	l2143
	line	223
	
l593:	
;IIC_Soft_Master.c: 223: else RC1 = 0;
	bcf	(57/8),(57)&7
	goto	l2143
	
l594:	
	line	225
	
l2143:	
;IIC_Soft_Master.c: 225: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	226
	
l2145:	
;IIC_Soft_Master.c: 226: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	227
;IIC_Soft_Master.c: 227: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	228
	
l2147:	
;IIC_Soft_Master.c: 228: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	229
	
l2149:	
;IIC_Soft_Master.c: 229: return data;
	movf	(I2C_Read1Byte@data),w
	goto	l595
	
l2151:	
	line	230
	
l595:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Read1Byte
	__end_of_I2C_Read1Byte:
;; =============== function _I2C_Read1Byte ends ============

	signat	_I2C_Read1Byte,4217
	global	_I2C_WriteStop
psect	text252,local,class=CODE,delta=2
global __ptext252
__ptext252:

;; *************** function _I2C_WriteStop *****************
;; Defined at:
;;		line 138 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
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
;;		_I2C_WaitMoment
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text252
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
	line	138
	global	__size_of_I2C_WriteStop
	__size_of_I2C_WriteStop	equ	__end_of_I2C_WriteStop-_I2C_WriteStop
	
_I2C_WriteStop:	
	opt	stack 5
; Regs used in _I2C_WriteStop: [status,2+status,0+pclath+cstack]
	line	139
	
l2101:	
;IIC_Soft_Master.c: 139: TRISC1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	140
;IIC_Soft_Master.c: 140: TRISC0 = 0;
	bcf	(1080/8)^080h,(1080)&7
	line	141
	
l2103:	
;IIC_Soft_Master.c: 141: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	143
	
l2105:	
;IIC_Soft_Master.c: 143: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
	line	144
	
l2107:	
;IIC_Soft_Master.c: 144: RC0 = 1;
	bsf	(56/8),(56)&7
	line	145
;IIC_Soft_Master.c: 145: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	146
	
l2109:	
;IIC_Soft_Master.c: 146: RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	line	148
;IIC_Soft_Master.c: 148: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	149
	
l2111:	
;IIC_Soft_Master.c: 149: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	150
;IIC_Soft_Master.c: 150: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	151
	
l576:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_WriteStop
	__end_of_I2C_WriteStop:
;; =============== function _I2C_WriteStop ends ============

	signat	_I2C_WriteStop,88
	global	_I2C_Write1Byte
psect	text253,local,class=CODE,delta=2
global __ptext253
__ptext253:

;; *************** function _I2C_Write1Byte *****************
;; Defined at:
;;		line 160 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          1       0       0
;;      Totals:         1       2       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_WaitMoment
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text253
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
	line	160
	global	__size_of_I2C_Write1Byte
	__size_of_I2C_Write1Byte	equ	__end_of_I2C_Write1Byte-_I2C_Write1Byte
	
_I2C_Write1Byte:	
	opt	stack 5
; Regs used in _I2C_Write1Byte: [wreg+status,2+status,0+pclath+cstack]
;I2C_Write1Byte@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(I2C_Write1Byte@data)
	line	161
	
l2073:	
;IIC_Soft_Master.c: 161: unsigned char i = 8;
	movlw	(08h)
	movwf	(??_I2C_Write1Byte+0)+0
	movf	(??_I2C_Write1Byte+0)+0,w
	movwf	(I2C_Write1Byte@i)
	line	162
	
l2075:	
;IIC_Soft_Master.c: 162: TRISC1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	163
	
l2077:	
;IIC_Soft_Master.c: 163: TRISC0 = 0;
	bcf	(1080/8)^080h,(1080)&7
	goto	l2079
	line	164
;IIC_Soft_Master.c: 164: do
	
l579:	
	line	166
	
l2079:	
;IIC_Soft_Master.c: 165: {
;IIC_Soft_Master.c: 166: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	167
	
l2081:	
;IIC_Soft_Master.c: 167: if(data&0x80)
	btfss	(I2C_Write1Byte@data),(7)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l580
u2360:
	line	168
	
l2083:	
;IIC_Soft_Master.c: 168: RC1 = 1;
	bsf	(57/8),(57)&7
	goto	l581
	line	169
	
l580:	
	line	170
;IIC_Soft_Master.c: 169: else
;IIC_Soft_Master.c: 170: RC1 = 0;
	bcf	(57/8),(57)&7
	
l581:	
	line	172
;IIC_Soft_Master.c: 172: RC0 = 1;
	bsf	(56/8),(56)&7
	line	173
	
l2085:	
;IIC_Soft_Master.c: 173: data <<= 1;
	clrc
	rlf	(I2C_Write1Byte@data),f

	line	175
	
l2087:	
;IIC_Soft_Master.c: 174: }
;IIC_Soft_Master.c: 175: while(--i);
	movlw	low(01h)
	subwf	(I2C_Write1Byte@i),f
	btfss	status,2
	goto	u2371
	goto	u2370
u2371:
	goto	l2079
u2370:
	
l582:	
	line	176
;IIC_Soft_Master.c: 176: RC0 = 0;
	bcf	(56/8),(56)&7
	line	178
;IIC_Soft_Master.c: 178: TRISC1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1081/8)^080h,(1081)&7
	line	180
	
l2089:	
;IIC_Soft_Master.c: 180: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	181
	
l2091:	
;IIC_Soft_Master.c: 181: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	182
;IIC_Soft_Master.c: 182: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	184
	
l2093:	
;IIC_Soft_Master.c: 184: i = RC1;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(57/8),(57)&7
	movlw	1
	movwf	(??_I2C_Write1Byte+0)+0
	movf	(??_I2C_Write1Byte+0)+0,w
	movwf	(I2C_Write1Byte@i)
	line	185
	
l2095:	
;IIC_Soft_Master.c: 185: RC0 = 0;
	bcf	(56/8),(56)&7
	line	186
	
l2097:	
;IIC_Soft_Master.c: 186: TRISC1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1081/8)^080h,(1081)&7
	goto	l583
	line	187
	
l2099:	
	line	188
;IIC_Soft_Master.c: 187: return i;
;	Return value of _I2C_Write1Byte is never used
	
l583:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Write1Byte
	__end_of_I2C_Write1Byte:
;; =============== function _I2C_Write1Byte ends ============

	signat	_I2C_Write1Byte,4217
	global	_I2C_WriteStart
psect	text254,local,class=CODE,delta=2
global __ptext254
__ptext254:

;; *************** function _I2C_WriteStart *****************
;; Defined at:
;;		line 116 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
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
;;		_I2C_WaitMoment
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text254
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
	line	116
	global	__size_of_I2C_WriteStart
	__size_of_I2C_WriteStart	equ	__end_of_I2C_WriteStart-_I2C_WriteStart
	
_I2C_WriteStart:	
	opt	stack 5
; Regs used in _I2C_WriteStart: [status,2+status,0+pclath+cstack]
	line	117
	
l2061:	
;IIC_Soft_Master.c: 117: TRISC1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	118
;IIC_Soft_Master.c: 118: TRISC0 = 0;
	bcf	(1080/8)^080h,(1080)&7
	line	119
	
l2063:	
;IIC_Soft_Master.c: 119: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	121
	
l2065:	
;IIC_Soft_Master.c: 121: RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	line	122
	
l2067:	
;IIC_Soft_Master.c: 122: RC0 = 1;
	bsf	(56/8),(56)&7
	line	123
;IIC_Soft_Master.c: 123: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	124
	
l2069:	
;IIC_Soft_Master.c: 124: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
	line	126
;IIC_Soft_Master.c: 126: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	127
	
l2071:	
;IIC_Soft_Master.c: 127: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	128
;IIC_Soft_Master.c: 128: I2C_WaitMoment();
	fcall	_I2C_WaitMoment
	line	129
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_WriteStart
	__end_of_I2C_WriteStart:
;; =============== function _I2C_WriteStart ends ============

	signat	_I2C_WriteStart,88
	global	_I2C_WaitMoment
psect	text255,local,class=CODE,delta=2
global __ptext255
__ptext255:

;; *************** function _I2C_WaitMoment *****************
;; Defined at:
;;		line 234 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_WriteStart
;;		_I2C_WriteStop
;;		_I2C_Write1Byte
;;		_I2C_Read1Byte
;; This function uses a non-reentrant model
;;
psect	text255
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
	line	234
	global	__size_of_I2C_WaitMoment
	__size_of_I2C_WaitMoment	equ	__end_of_I2C_WaitMoment-_I2C_WaitMoment
	
_I2C_WaitMoment:	
	opt	stack 5
; Regs used in _I2C_WaitMoment: []
	line	235
	
l2059:	
# 235 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
nop ;#
	line	236
# 236 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
nop ;#
psect	text255
	line	237
	
l598:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_WaitMoment
	__end_of_I2C_WaitMoment:
;; =============== function _I2C_WaitMoment ends ============

	signat	_I2C_WaitMoment,88
	global	_ISR
psect	text256,local,class=CODE,delta=2
global __ptext256
__ptext256:

;; *************** function _ISR *****************
;; Defined at:
;;		line 90 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          5       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text256
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\IIC_Demo\IIC_Soft_Master.c"
	line	90
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 5
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+1)
	movf	fsr0,w
	movwf	(??_ISR+2)
	movf	pclath,w
	movwf	(??_ISR+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ISR+4)
	ljmp	_ISR
psect	text256
	line	92
	
i1l967:	
;IIC_Soft_Master.c: 91: static unsigned char tcount;
;IIC_Soft_Master.c: 92: if(TMR2IF)
	btfss	(97/8),(97)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l975
u1_20:
	line	94
	
i1l969:	
;IIC_Soft_Master.c: 93: {
;IIC_Soft_Master.c: 94: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	96
	
i1l971:	
;IIC_Soft_Master.c: 96: if(++tcount >= 40)
	movlw	(01h)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	addwf	(ISR@tcount),f
	movlw	(028h)
	subwf	((ISR@tcount)),w
	skipc
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l570
u2_20:
	line	98
	
i1l973:	
;IIC_Soft_Master.c: 97: {
;IIC_Soft_Master.c: 98: tcount = 0;
	clrf	(ISR@tcount)
	line	99
;IIC_Soft_Master.c: 99: B_MainLoop = 1;
	bsf	(_B_MainLoop/8),(_B_MainLoop)&7
	goto	i1l570
	line	100
	
i1l568:	
	line	101
;IIC_Soft_Master.c: 100: }
;IIC_Soft_Master.c: 101: }
	goto	i1l570
	line	102
	
i1l567:	
	line	104
	
i1l975:	
;IIC_Soft_Master.c: 102: else
;IIC_Soft_Master.c: 103: {
;IIC_Soft_Master.c: 104: PIR1 = 0;
	clrf	(12)	;volatile
	line	105
;IIC_Soft_Master.c: 105: PIR2 = 0;
	clrf	(13)	;volatile
	goto	i1l570
	line	106
	
i1l569:	
	line	107
	
i1l570:	
	movf	(??_ISR+4),w
	movwf	btemp+1
	movf	(??_ISR+3),w
	movwf	pclath
	movf	(??_ISR+2),w
	movwf	fsr0
	swapf	(??_ISR+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text257,local,class=CODE,delta=2
global __ptext257
__ptext257:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
