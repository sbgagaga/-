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
	FNCALL	_main,_DelayXms
	FNCALL	_main,_ADC_Sample
	FNCALL	_main,_ADC_Result
	FNROOT	_main
	global	ADC_Sample@adsum
	global	ADC_Sample@admin
	global	_adresult
	global	ADC_Sample@admax
	global	ADC_Sample@adtimes
	global	_ADCON0
psect	text140,local,class=CODE,delta=2
global __ptext140
__ptext140:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_INTCON
_INTCON	set	11
	global	_GODONE
_GODONE	set	249
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_OSCCON
_OSCCON	set	143
	global	_TRISB5
_TRISB5	set	1077
	global	_ANSELH
_ANSELH	set	393
	file	"ADC_DEMO.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
ADC_Sample@admax:
       ds      2

ADC_Sample@adtimes:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
ADC_Sample@adsum:
       ds      4

ADC_Sample@admin:
       ds      2

_adresult:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
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
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_ADC_Sample
?_ADC_Sample:	; 0 bytes @ 0x0
	global	??_ADC_Sample
??_ADC_Sample:	; 0 bytes @ 0x0
	global	??_ADC_Result
??_ADC_Result:	; 0 bytes @ 0x0
	global	?_DelayXms
?_DelayXms:	; 0 bytes @ 0x0
	global	??_DelayXms
??_DelayXms:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ADC_Result
?_ADC_Result:	; 1 bytes @ 0x0
	ds	1
	global	ADC_Result@adch
ADC_Result@adch:	; 1 bytes @ 0x1
	global	DelayXms@x
DelayXms@x:	; 1 bytes @ 0x1
	ds	1
	global	ADC_Result@i
ADC_Result@i:	; 1 bytes @ 0x2
	global	DelayXms@i
DelayXms@i:	; 1 bytes @ 0x2
	ds	1
	global	DelayXms@j
DelayXms@j:	; 1 bytes @ 0x3
	ds	1
	global	ADC_Sample@adch
ADC_Sample@adch:	; 1 bytes @ 0x4
	ds	1
	global	ADC_Sample@i
ADC_Sample@i:	; 1 bytes @ 0x5
	ds	1
	global	ADC_Sample@ad_temp
ADC_Sample@ad_temp:	; 2 bytes @ 0x6
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x8
	ds	1
	global	main@result
main@result:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 11, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      13
;; BANK0           80      0       8
;; BANK1           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_ADC_Sample
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
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
;; (0) _main                                                 2     2      0     306
;;                                              8 COMMON     2     2      0
;;                           _DelayXms
;;                         _ADC_Sample
;;                         _ADC_Result
;; ---------------------------------------------------------------------------------
;; (1) _DelayXms                                             4     4      0      75
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _ADC_Result                                           3     3      0      30
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _ADC_Sample                                           8     8      0     200
;;                                              0 COMMON     8     8      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DelayXms
;;   _ADC_Sample
;;   _ADC_Result
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       D       1       92.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0      15       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       8       5       10.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;DATA                 0      0      16       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 106 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  result          1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          1       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayXms
;;		_ADC_Sample
;;		_ADC_Result
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
	line	106
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	107
	
l1870:	
# 107 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
nop ;#
	line	108
# 108 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
clrwdt ;#
psect	maintext
	line	109
	
l1872:	
;ADC.c: 109: INTCON = 0;
	clrf	(11)	;volatile
	line	110
	
l1874:	
;ADC.c: 110: OSCCON = 0X71;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	goto	l1876
	line	112
;ADC.c: 112: while(1)
	
l576:	
	line	114
	
l1876:	
# 114 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
clrwdt ;#
psect	maintext
	line	115
	
l1878:	
;ADC.c: 115: DelayXms(1);
	movlw	(01h)
	fcall	_DelayXms
	line	118
	
l1880:	
;ADC.c: 118: ANSELH = 0X20;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(393)^0180h	;volatile
	line	119
	
l1882:	
;ADC.c: 119: TRISB5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1077/8)^080h,(1077)&7
	line	120
	
l1884:	
;ADC.c: 120: ADC_Sample(13);
	movlw	(0Dh)
	fcall	_ADC_Sample
	line	124
	
l1886:	
;ADC.c: 122: unsigned char result;
;ADC.c: 124: result = ADC_Result(13);
	movlw	(0Dh)
	fcall	_ADC_Result
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@result)
	goto	l1876
	line	126
	
l577:	
	line	112
	goto	l1876
	
l578:	
	line	127
	
l579:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DelayXms
psect	text141,local,class=CODE,delta=2
global __ptext141
__ptext141:

;; *************** function _DelayXms *****************
;; Defined at:
;;		line 96 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    1[COMMON] unsigned char 
;;  j               1    3[COMMON] unsigned char 
;;  i               1    2[COMMON] unsigned char 
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
;;      Locals:         3       0       0
;;      Temps:          1       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text141
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
	line	96
	global	__size_of_DelayXms
	__size_of_DelayXms	equ	__end_of_DelayXms-_DelayXms
	
_DelayXms:	
	opt	stack 7
; Regs used in _DelayXms: [wreg+status,2+status,0]
;DelayXms@x stored from wreg
	line	98
	movwf	(DelayXms@x)
	
l1020:	
;ADC.c: 97: unsigned char i,j;
;ADC.c: 98: for(i=x;i>0;i--)
	movf	(DelayXms@x),w
	movwf	(??_DelayXms+0)+0
	movf	(??_DelayXms+0)+0,w
	movwf	(DelayXms@i)
	
l1022:	
	movf	(DelayXms@i),f
	skipz
	goto	u171
	goto	u170
u171:
	goto	l1026
u170:
	goto	l573
	
l1024:	
	goto	l573
	line	99
	
l569:	
	
l1026:	
;ADC.c: 99: for(j=153;j>0;j--);
	movlw	(099h)
	movwf	(??_DelayXms+0)+0
	movf	(??_DelayXms+0)+0,w
	movwf	(DelayXms@j)
	
l1028:	
	movf	(DelayXms@j),f
	skipz
	goto	u181
	goto	u180
u181:
	goto	l1032
u180:
	goto	l1036
	
l1030:	
	goto	l1036
	
l571:	
	
l1032:	
	movlw	low(01h)
	subwf	(DelayXms@j),f
	
l1034:	
	movf	(DelayXms@j),f
	skipz
	goto	u191
	goto	u190
u191:
	goto	l1032
u190:
	goto	l1036
	
l572:	
	line	98
	
l1036:	
	movlw	low(01h)
	subwf	(DelayXms@i),f
	
l1038:	
	movf	(DelayXms@i),f
	skipz
	goto	u201
	goto	u200
u201:
	goto	l1026
u200:
	goto	l573
	
l570:	
	line	100
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_DelayXms
	__end_of_DelayXms:
;; =============== function _DelayXms ends ============

	signat	_DelayXms,4216
	global	_ADC_Result
psect	text142,local,class=CODE,delta=2
global __ptext142
__ptext142:

;; *************** function _ADC_Result *****************
;; Defined at:
;;		line 73 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1    1[COMMON] unsigned char 
;;  i               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text142
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
	line	73
	global	__size_of_ADC_Result
	__size_of_ADC_Result	equ	__end_of_ADC_Result-_ADC_Result
	
_ADC_Result:	
	opt	stack 7
; Regs used in _ADC_Result: [wreg+status,2+status,0]
;ADC_Result@adch stored from wreg
	movwf	(ADC_Result@adch)
	line	74
	
l998:	
;ADC.c: 74: ADCON1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(159)^080h	;volatile
	line	75
	
l1000:	
;ADC.c: 75: ADCON0 = 0X41 | (adch << 2);
	movf	(ADC_Result@adch),w
	movwf	(??_ADC_Result+0)+0
	movlw	(02h)-1
u145:
	clrc
	rlf	(??_ADC_Result+0)+0,f
	addlw	-1
	skipz
	goto	u145
	clrc
	rlf	(??_ADC_Result+0)+0,w
	iorlw	041h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	76
	
l1002:	
# 76 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
nop ;#
psect	text142
	line	77
	
l1004:	
# 77 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
nop ;#
psect	text142
	line	78
	
l1006:	
;ADC.c: 78: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	80
	
l1008:	
;ADC.c: 80: unsigned char i = 0;
	clrf	(ADC_Result@i)
	line	81
;ADC.c: 81: while(GODONE)
	goto	l562
	
l563:	
	line	83
	
l1010:	
;ADC.c: 82: {
;ADC.c: 83: if(0 == (--i))
	movlw	low(01h)
	subwf	(ADC_Result@i),f
	btfss	status,2
	goto	u151
	goto	u150
u151:
	goto	l562
u150:
	line	84
	
l1012:	
;ADC.c: 84: return 0;
	movlw	(0)
	goto	l565
	
l1014:	
	goto	l565
	
l564:	
	line	85
	
l562:	
	line	81
	btfsc	(249/8),(249)&7
	goto	u161
	goto	u160
u161:
	goto	l1010
u160:
	goto	l1016
	
l566:	
	line	86
	
l1016:	
;ADC.c: 85: }
;ADC.c: 86: return ADRESH;
	movf	(30),w	;volatile
	goto	l565
	
l1018:	
	line	87
	
l565:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Result
	__end_of_ADC_Result:
;; =============== function _ADC_Result ends ============

	signat	_ADC_Result,4217
	global	_ADC_Sample
psect	text143,local,class=CODE,delta=2
global __ptext143
__ptext143:

;; *************** function _ADC_Sample *****************
;; Defined at:
;;		line 25 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1    4[COMMON] unsigned char 
;;  ad_temp         2    6[COMMON] volatile unsigned int 
;;  i               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         4       0       0
;;      Temps:          4       0       0
;;      Totals:         8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text143
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
	line	25
	global	__size_of_ADC_Sample
	__size_of_ADC_Sample	equ	__end_of_ADC_Sample-_ADC_Sample
	
_ADC_Sample:	
	opt	stack 7
; Regs used in _ADC_Sample: [wreg+status,2+status,0+btemp+1]
;ADC_Sample@adch stored from wreg
	line	30
	movwf	(ADC_Sample@adch)
	
l1824:	
;ADC.c: 26: static unsigned long adsum = 0;
;ADC.c: 27: static unsigned int admin = 0,admax = 0;
;ADC.c: 28: static unsigned char adtimes = 0;
;ADC.c: 29: volatile unsigned int ad_temp;
;ADC.c: 30: ADCON1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(159)^080h	;volatile
	line	31
	
l1826:	
;ADC.c: 31: ADCON0 = 0X41 | (adch << 2);
	movf	(ADC_Sample@adch),w
	movwf	(??_ADC_Sample+0)+0
	movlw	(02h)-1
u2345:
	clrc
	rlf	(??_ADC_Sample+0)+0,f
	addlw	-1
	skipz
	goto	u2345
	clrc
	rlf	(??_ADC_Sample+0)+0,w
	iorlw	041h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	32
	
l1828:	
# 32 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
nop ;#
psect	text143
	line	33
	
l1830:	
# 33 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\ADC_Demo\ADC.c"
nop ;#
psect	text143
	line	34
	
l1832:	
;ADC.c: 34: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	36
	
l1834:	
;ADC.c: 36: unsigned char i = 0;
	clrf	(ADC_Sample@i)
	line	37
;ADC.c: 37: while(GODONE)
	goto	l549
	
l550:	
	line	39
	
l1836:	
;ADC.c: 38: {
;ADC.c: 39: if(0 == (--i))
	movlw	low(01h)
	subwf	(ADC_Sample@i),f
	btfss	status,2
	goto	u2351
	goto	u2350
u2351:
	goto	l549
u2350:
	goto	l552
	line	40
	
l1838:	
;ADC.c: 40: return;
	goto	l552
	
l551:	
	line	41
	
l549:	
	line	37
	btfsc	(249/8),(249)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l1836
u2360:
	goto	l1840
	
l553:	
	line	43
	
l1840:	
;ADC.c: 41: }
;ADC.c: 43: ad_temp=(ADRESH<<4)+(ADRESL>>4);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_ADC_Sample+0)+0
	movlw	04h
u2375:
	clrc
	rrf	(??_ADC_Sample+0)+0,f
	addlw	-1
	skipz
	goto	u2375
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??_ADC_Sample+1)+0
	clrf	(??_ADC_Sample+1)+0+1
	movlw	04h
	movwf	btemp+1
u2385:
	clrc
	rlf	(??_ADC_Sample+1)+0,f
	rlf	(??_ADC_Sample+1)+1,f
	decfsz	btemp+1,f
	goto	u2385
	movf	0+(??_ADC_Sample+0)+0,w
	addwf	0+(??_ADC_Sample+1)+0,w
	movwf	(ADC_Sample@ad_temp)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_ADC_Sample+1)+0,w
	movwf	1+(ADC_Sample@ad_temp)
	line	45
	
l1842:	
;ADC.c: 45: if(0 == admax)
	movf	((ADC_Sample@admax+1)),w
	iorwf	((ADC_Sample@admax)),w
	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l1846
u2390:
	line	47
	
l1844:	
;ADC.c: 46: {
;ADC.c: 47: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	clrf	(ADC_Sample@admax+1)
	addwf	(ADC_Sample@admax+1)
	movf	(ADC_Sample@ad_temp),w	;volatile
	clrf	(ADC_Sample@admax)
	addwf	(ADC_Sample@admax)

	line	48
;ADC.c: 48: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	clrf	(ADC_Sample@admin+1)
	addwf	(ADC_Sample@admin+1)
	movf	(ADC_Sample@ad_temp),w	;volatile
	clrf	(ADC_Sample@admin)
	addwf	(ADC_Sample@admin)

	line	49
;ADC.c: 49: }
	goto	l1854
	line	50
	
l554:	
	
l1846:	
;ADC.c: 50: else if(ad_temp > admax)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	subwf	(ADC_Sample@admax+1),w
	skipz
	goto	u2405
	movf	(ADC_Sample@ad_temp),w	;volatile
	subwf	(ADC_Sample@admax),w
u2405:
	skipnc
	goto	u2401
	goto	u2400
u2401:
	goto	l1850
u2400:
	line	51
	
l1848:	
;ADC.c: 51: admax = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	clrf	(ADC_Sample@admax+1)
	addwf	(ADC_Sample@admax+1)
	movf	(ADC_Sample@ad_temp),w	;volatile
	clrf	(ADC_Sample@admax)
	addwf	(ADC_Sample@admax)

	goto	l1854
	line	52
	
l556:	
	
l1850:	
;ADC.c: 52: else if(ad_temp < admin)
	movf	(ADC_Sample@admin+1),w
	subwf	(ADC_Sample@ad_temp+1),w	;volatile
	skipz
	goto	u2415
	movf	(ADC_Sample@admin),w
	subwf	(ADC_Sample@ad_temp),w	;volatile
u2415:
	skipnc
	goto	u2411
	goto	u2410
u2411:
	goto	l1854
u2410:
	line	53
	
l1852:	
;ADC.c: 53: admin = ad_temp;
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	clrf	(ADC_Sample@admin+1)
	addwf	(ADC_Sample@admin+1)
	movf	(ADC_Sample@ad_temp),w	;volatile
	clrf	(ADC_Sample@admin)
	addwf	(ADC_Sample@admin)

	goto	l1854
	
l558:	
	goto	l1854
	line	55
	
l557:	
	goto	l1854
	
l555:	
	
l1854:	
;ADC.c: 55: adsum += ad_temp;
	movf	(ADC_Sample@ad_temp),w	;volatile
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@ad_temp+1),w	;volatile
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	0+(??_ADC_Sample+0)+0,w
	addwf	(ADC_Sample@adsum),f
	movf	1+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2421
	addwf	(ADC_Sample@adsum+1),f
u2421:
	movf	2+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2422
	addwf	(ADC_Sample@adsum+2),f
u2422:
	movf	3+(??_ADC_Sample+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2423
	addwf	(ADC_Sample@adsum+3),f
u2423:

	line	56
	
l1856:	
;ADC.c: 56: if(++adtimes >= 10)
	movlw	(01h)
	movwf	(??_ADC_Sample+0)+0
	movf	(??_ADC_Sample+0)+0,w
	addwf	(ADC_Sample@adtimes),f
	movlw	(0Ah)
	subwf	((ADC_Sample@adtimes)),w
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l552
u2430:
	line	58
	
l1858:	
;ADC.c: 57: {
;ADC.c: 58: adsum -= admax;
	movf	(ADC_Sample@admax),w
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admax+1),w
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),f
	movf	1+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	1+(??_ADC_Sample+0)+0,w
	goto	u2445
	goto	u2446
u2445:
	subwf	(ADC_Sample@adsum+1),f
u2446:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u2447
	goto	u2448
u2447:
	subwf	(ADC_Sample@adsum+2),f
u2448:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u2449
	goto	u2440
u2449:
	subwf	(ADC_Sample@adsum+3),f
u2440:

	line	59
;ADC.c: 59: adsum -= admin;
	movf	(ADC_Sample@admin),w
	movwf	((??_ADC_Sample+0)+0)
	movf	(ADC_Sample@admin+1),w
	movwf	((??_ADC_Sample+0)+0+1)
	clrf	((??_ADC_Sample+0)+0+2)
	clrf	((??_ADC_Sample+0)+0+3)
	movf	0+(??_ADC_Sample+0)+0,w
	subwf	(ADC_Sample@adsum),f
	movf	1+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	1+(??_ADC_Sample+0)+0,w
	goto	u2455
	goto	u2456
u2455:
	subwf	(ADC_Sample@adsum+1),f
u2456:
	movf	2+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	2+(??_ADC_Sample+0)+0,w
	goto	u2457
	goto	u2458
u2457:
	subwf	(ADC_Sample@adsum+2),f
u2458:
	movf	3+(??_ADC_Sample+0)+0,w
	skipc
	incfsz	3+(??_ADC_Sample+0)+0,w
	goto	u2459
	goto	u2450
u2459:
	subwf	(ADC_Sample@adsum+3),f
u2450:

	line	61
	
l1860:	
;ADC.c: 61: adresult = adsum >> 3;
	movf	(ADC_Sample@adsum),w
	movwf	(??_ADC_Sample+0)+0
	movf	(ADC_Sample@adsum+1),w
	movwf	((??_ADC_Sample+0)+0+1)
	movf	(ADC_Sample@adsum+2),w
	movwf	((??_ADC_Sample+0)+0+2)
	movf	(ADC_Sample@adsum+3),w
	movwf	((??_ADC_Sample+0)+0+3)
	movlw	03h
u2465:
	clrc
	rrf	(??_ADC_Sample+0)+3,f
	rrf	(??_ADC_Sample+0)+2,f
	rrf	(??_ADC_Sample+0)+1,f
	rrf	(??_ADC_Sample+0)+0,f
u2460:
	addlw	-1
	skipz
	goto	u2465
	movf	1+(??_ADC_Sample+0)+0,w
	clrf	(_adresult+1)	;volatile
	addwf	(_adresult+1)	;volatile
	movf	0+(??_ADC_Sample+0)+0,w
	clrf	(_adresult)	;volatile
	addwf	(_adresult)	;volatile

	line	63
	
l1862:	
;ADC.c: 63: adsum = 0;
	movlw	0
	movwf	(ADC_Sample@adsum+3)
	movlw	0
	movwf	(ADC_Sample@adsum+2)
	movlw	0
	movwf	(ADC_Sample@adsum+1)
	movlw	0
	movwf	(ADC_Sample@adsum)

	line	64
	
l1864:	
;ADC.c: 64: admin = 0;
	clrf	(ADC_Sample@admin)
	clrf	(ADC_Sample@admin+1)
	line	65
	
l1866:	
;ADC.c: 65: admax = 0;
	clrf	(ADC_Sample@admax)
	clrf	(ADC_Sample@admax+1)
	line	66
	
l1868:	
;ADC.c: 66: adtimes = 0;
	clrf	(ADC_Sample@adtimes)
	goto	l552
	line	67
	
l559:	
	line	68
	
l552:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Sample
	__end_of_ADC_Sample:
;; =============== function _ADC_Sample ends ============

	signat	_ADC_Sample,4216
psect	text144,local,class=CODE,delta=2
global __ptext144
__ptext144:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
