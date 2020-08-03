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
	FNCALL	_main,_LCD_DISP
	FNCALL	_LCD_DISP,_SET_DISP
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	LCD_DISP@dcount
	global	_tcount
	global	_INTCON
psect	text120,local,class=CODE,delta=2
global __ptext120
__ptext120:
_INTCON	set	11
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_PORTE
_PORTE	set	9
	global	_T2CON
_T2CON	set	18
	global	_TMR2
_TMR2	set	17
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_TMR2IF
_TMR2IF	set	97
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_TRISE
_TRISE	set	137
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC3
_TRISC3	set	1083
	global	_COMEN
_COMEN	set	407
	global	_LCDCON0
_LCDCON0	set	400
	file	"LCD_DEMO.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
LCD_DISP@dcount:
       ds      1

_tcount:
       ds      1

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_LCD_DISP
?_LCD_DISP:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_SET_DISP
?_SET_DISP:	; 0 bytes @ 0x0
	ds	5
	global	??_SET_DISP
??_SET_DISP:	; 0 bytes @ 0x5
	ds	1
	global	SET_DISP@RDATA
SET_DISP@RDATA:	; 1 bytes @ 0x6
	ds	1
	global	??_LCD_DISP
??_LCD_DISP:	; 0 bytes @ 0x7
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x9
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	LCD_DISP@display
LCD_DISP@display:	; 4 bytes @ 0x0
	ds	4
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      4       6
;; BANK1           80      0       0

;;
;; Pointer list with targets:

;; SET_DISP@RDATA	PTR unsigned char  size(1) Largest target is 4
;;		 -> LCD_DISP@display(BANK0[4]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_LCD_DISP
;;   _LCD_DISP->_SET_DISP
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_LCD_DISP
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    1574
;;                           _LCD_DISP
;; ---------------------------------------------------------------------------------
;; (1) _LCD_DISP                                             6     6      0    1574
;;                                              7 COMMON     2     2      0
;;                                              0 BANK0      4     4      0
;;                           _SET_DISP
;; ---------------------------------------------------------------------------------
;; (2) _SET_DISP                                             2     2      0      88
;;                                              5 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _isr                                                  5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _LCD_DISP
;;     _SET_DISP
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       9       1       64.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       F       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      4       6       5        7.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;DATA                 0      0      11       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 17 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_LCD_DISP
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
	line	17
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	18
	
l2290:	
# 18 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
clrwdt ;#
psect	maintext
	line	19
	
l2292:	
;LCD.c: 19: OSCCON = 0x71;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	20
	
l2294:	
;LCD.c: 20: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	21
	
l2296:	
;LCD.c: 21: TRISA = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	22
	
l2298:	
;LCD.c: 22: PORTC = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	23
	
l2300:	
;LCD.c: 23: TRISC = 0XF;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	24
;LCD.c: 24: PORTE = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(9)	;volatile
	line	25
;LCD.c: 25: TRISE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(137)^080h	;volatile
	line	26
;LCD.c: 26: OPTION_REG = 0;
	clrf	(129)^080h	;volatile
	line	27
;LCD.c: 27: INTCON = 0;
	clrf	(11)	;volatile
	line	28
	
l2302:	
;LCD.c: 28: TMR2 = 124;
	movlw	(07Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(17)	;volatile
	line	29
	
l2304:	
;LCD.c: 29: T2CON = 4;
	movlw	(04h)
	movwf	(18)	;volatile
	line	30
	
l2306:	
;LCD.c: 30: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	31
	
l2308:	
;LCD.c: 31: PEIE = 1;
	bsf	(94/8),(94)&7
	line	32
	
l2310:	
;LCD.c: 32: GIE = 1;
	bsf	(95/8),(95)&7
	goto	l2312
	line	33
;LCD.c: 33: while (1)
	
l543:	
	line	35
	
l2312:	
# 35 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
clrwdt ;#
psect	maintext
	line	36
	
l2314:	
;LCD.c: 36: if(tcount>15)
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_tcount),w
	skipc
	goto	u3451
	goto	u3450
u3451:
	goto	l2312
u3450:
	line	38
	
l2316:	
;LCD.c: 37: {
;LCD.c: 38: tcount=0;
	clrf	(_tcount)
	line	39
	
l2318:	
;LCD.c: 39: LCD_DISP();
	fcall	_LCD_DISP
	goto	l2312
	line	40
	
l544:	
	goto	l2312
	line	41
	
l545:	
	line	33
	goto	l2312
	
l546:	
	line	42
	
l547:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_LCD_DISP
psect	text121,local,class=CODE,delta=2
global __ptext121
__ptext121:

;; *************** function _LCD_DISP *****************
;; Defined at:
;;		line 71 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  display         4    0[BANK0 ] unsigned char [4]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       4       0
;;      Temps:          2       0       0
;;      Totals:         2       4       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_SET_DISP
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text121
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
	line	71
	global	__size_of_LCD_DISP
	__size_of_LCD_DISP	equ	__end_of_LCD_DISP-_LCD_DISP
	
_LCD_DISP:	
	opt	stack 5
; Regs used in _LCD_DISP: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	74
	
l2124:	
;LCD.c: 72: static unsigned char dcount;
;LCD.c: 73: unsigned char display[4];
;LCD.c: 74: SET_DISP(display);
	movlw	(LCD_DISP@display)&0ffh
	fcall	_SET_DISP
	line	76
	
l2126:	
;LCD.c: 76: LCDCON0 = 0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(400)^0180h	;volatile
	line	77
	
l2128:	
;LCD.c: 77: TRISC = 0B00001111;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	78
	
l2130:	
;LCD.c: 78: COMEN = 0B00001111;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	79
	
l2132:	
;LCD.c: 79: dcount++;
	movlw	(01h)
	movwf	(??_LCD_DISP+0)+0
	movf	(??_LCD_DISP+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(LCD_DISP@dcount),f
	line	81
;LCD.c: 81: switch(dcount&7)
	goto	l2280
	line	83
;LCD.c: 82: {
;LCD.c: 83: case 0:
	
l560:	
	line	84
;LCD.c: 84: if(display[0] & 0x01) {RA1 = 1;} else {RA1 = 0;}
	btfss	(LCD_DISP@display),(0)&7
	goto	u2811
	goto	u2810
u2811:
	goto	l561
u2810:
	
l2134:	
	bsf	(41/8),(41)&7
	goto	l562
	
l561:	
	bcf	(41/8),(41)&7
	
l562:	
	line	85
;LCD.c: 85: if(display[0] & 0x02) {RA2 = 1;} else {RA2 = 0;}
	btfss	(LCD_DISP@display),(1)&7
	goto	u2821
	goto	u2820
u2821:
	goto	l563
u2820:
	
l2136:	
	bsf	(42/8),(42)&7
	goto	l564
	
l563:	
	bcf	(42/8),(42)&7
	
l564:	
	line	86
;LCD.c: 86: if(display[0] & 0x04) {RA3 = 1;} else {RA3 = 0;}
	btfss	(LCD_DISP@display),(2)&7
	goto	u2831
	goto	u2830
u2831:
	goto	l565
u2830:
	
l2138:	
	bsf	(43/8),(43)&7
	goto	l566
	
l565:	
	bcf	(43/8),(43)&7
	
l566:	
	line	87
;LCD.c: 87: if(display[0] & 0x08) {RA4 = 1;} else {RA4 = 0;}
	btfss	(LCD_DISP@display),(3)&7
	goto	u2841
	goto	u2840
u2841:
	goto	l567
u2840:
	
l2140:	
	bsf	(44/8),(44)&7
	goto	l568
	
l567:	
	bcf	(44/8),(44)&7
	
l568:	
	line	88
;LCD.c: 88: if(display[0] & 0x10) {RA5 = 1;} else {RA5 = 0;}
	btfss	(LCD_DISP@display),(4)&7
	goto	u2851
	goto	u2850
u2851:
	goto	l569
u2850:
	
l2142:	
	bsf	(45/8),(45)&7
	goto	l570
	
l569:	
	bcf	(45/8),(45)&7
	
l570:	
	line	89
;LCD.c: 89: if(display[0] & 0x20) {RB1 = 1;} else {RB1 = 0;}
	btfss	(LCD_DISP@display),(5)&7
	goto	u2861
	goto	u2860
u2861:
	goto	l571
u2860:
	
l2144:	
	bsf	(49/8),(49)&7
	goto	l572
	
l571:	
	bcf	(49/8),(49)&7
	
l572:	
	line	90
;LCD.c: 90: if(display[0] & 0x40) {RB2 = 1;} else {RB2 = 0;}
	btfss	(LCD_DISP@display),(6)&7
	goto	u2871
	goto	u2870
u2871:
	goto	l573
u2870:
	
l2146:	
	bsf	(50/8),(50)&7
	goto	l574
	
l573:	
	bcf	(50/8),(50)&7
	
l574:	
	line	91
;LCD.c: 91: if(display[0] & 0x80) {RB3 = 1;} else {RB3 = 0;}
	btfss	(LCD_DISP@display),(7)&7
	goto	u2881
	goto	u2880
u2881:
	goto	l575
u2880:
	
l2148:	
	bsf	(51/8),(51)&7
	goto	l576
	
l575:	
	bcf	(51/8),(51)&7
	
l576:	
	line	93
;LCD.c: 93: RC0=0;
	bcf	(56/8),(56)&7
	line	94
;LCD.c: 94: TRISC0=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1080/8)^080h,(1080)&7
	line	95
	
l2150:	
;LCD.c: 95: COMEN&=~(1<<0);
	movlw	(0FEh)
	movwf	(??_LCD_DISP+0)+0
	movf	(??_LCD_DISP+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(407)^0180h,f	;volatile
	line	96
;LCD.c: 96: break;
	goto	l697
	line	97
;LCD.c: 97: case 1:
	
l578:	
	line	98
;LCD.c: 98: if(display[1] & 0x01) {RA1 = 1;} else {RA1 = 0;}
	btfss	0+(LCD_DISP@display)+01h,(0)&7
	goto	u2891
	goto	u2890
u2891:
	goto	l579
u2890:
	
l2152:	
	bsf	(41/8),(41)&7
	goto	l580
	
l579:	
	bcf	(41/8),(41)&7
	
l580:	
	line	99
;LCD.c: 99: if(display[1] & 0x02) {RA2 = 1;} else {RA2 = 0;}
	btfss	0+(LCD_DISP@display)+01h,(1)&7
	goto	u2901
	goto	u2900
u2901:
	goto	l581
u2900:
	
l2154:	
	bsf	(42/8),(42)&7
	goto	l582
	
l581:	
	bcf	(42/8),(42)&7
	
l582:	
	line	100
;LCD.c: 100: if(display[1] & 0x04) {RA3 = 1;} else {RA3 = 0;}
	btfss	0+(LCD_DISP@display)+01h,(2)&7
	goto	u2911
	goto	u2910
u2911:
	goto	l583
u2910:
	
l2156:	
	bsf	(43/8),(43)&7
	goto	l584
	
l583:	
	bcf	(43/8),(43)&7
	
l584:	
	line	101
;LCD.c: 101: if(display[1] & 0x08) {RA4 = 1;} else {RA4 = 0;}
	btfss	0+(LCD_DISP@display)+01h,(3)&7
	goto	u2921
	goto	u2920
u2921:
	goto	l585
u2920:
	
l2158:	
	bsf	(44/8),(44)&7
	goto	l586
	
l585:	
	bcf	(44/8),(44)&7
	
l586:	
	line	102
;LCD.c: 102: if(display[1] & 0x10) {RA5 = 1;} else {RA5 = 0;}
	btfss	0+(LCD_DISP@display)+01h,(4)&7
	goto	u2931
	goto	u2930
u2931:
	goto	l587
u2930:
	
l2160:	
	bsf	(45/8),(45)&7
	goto	l588
	
l587:	
	bcf	(45/8),(45)&7
	
l588:	
	line	103
;LCD.c: 103: if(display[1] & 0x20) {RB1 = 1;} else {RB1 = 0;}
	btfss	0+(LCD_DISP@display)+01h,(5)&7
	goto	u2941
	goto	u2940
u2941:
	goto	l589
u2940:
	
l2162:	
	bsf	(49/8),(49)&7
	goto	l590
	
l589:	
	bcf	(49/8),(49)&7
	
l590:	
	line	104
;LCD.c: 104: if(display[1] & 0x40) {RB2 = 1;} else {RB2 = 0;}
	btfss	0+(LCD_DISP@display)+01h,(6)&7
	goto	u2951
	goto	u2950
u2951:
	goto	l591
u2950:
	
l2164:	
	bsf	(50/8),(50)&7
	goto	l592
	
l591:	
	bcf	(50/8),(50)&7
	
l592:	
	line	105
;LCD.c: 105: if(display[1] & 0x80) {RB3 = 1;} else {RB3 = 0;}
	btfss	0+(LCD_DISP@display)+01h,(7)&7
	goto	u2961
	goto	u2960
u2961:
	goto	l593
u2960:
	
l2166:	
	bsf	(51/8),(51)&7
	goto	l594
	
l593:	
	bcf	(51/8),(51)&7
	
l594:	
	line	107
;LCD.c: 107: RC1=0;
	bcf	(57/8),(57)&7
	line	108
;LCD.c: 108: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	109
	
l2168:	
;LCD.c: 109: COMEN&=~(1<<1);
	movlw	(0FDh)
	movwf	(??_LCD_DISP+0)+0
	movf	(??_LCD_DISP+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(407)^0180h,f	;volatile
	line	110
;LCD.c: 110: break;
	goto	l697
	line	111
;LCD.c: 111: case 2:
	
l595:	
	line	112
;LCD.c: 112: if(display[2] & 0x01) {RA1 = 1;} else {RA1 = 0;}
	btfss	0+(LCD_DISP@display)+02h,(0)&7
	goto	u2971
	goto	u2970
u2971:
	goto	l596
u2970:
	
l2170:	
	bsf	(41/8),(41)&7
	goto	l597
	
l596:	
	bcf	(41/8),(41)&7
	
l597:	
	line	113
;LCD.c: 113: if(display[2] & 0x02) {RA2 = 1;} else {RA2 = 0;}
	btfss	0+(LCD_DISP@display)+02h,(1)&7
	goto	u2981
	goto	u2980
u2981:
	goto	l598
u2980:
	
l2172:	
	bsf	(42/8),(42)&7
	goto	l599
	
l598:	
	bcf	(42/8),(42)&7
	
l599:	
	line	114
;LCD.c: 114: if(display[2] & 0x04) {RA3 = 1;} else {RA3 = 0;}
	btfss	0+(LCD_DISP@display)+02h,(2)&7
	goto	u2991
	goto	u2990
u2991:
	goto	l600
u2990:
	
l2174:	
	bsf	(43/8),(43)&7
	goto	l601
	
l600:	
	bcf	(43/8),(43)&7
	
l601:	
	line	115
;LCD.c: 115: if(display[2] & 0x08) {RA4 = 1;} else {RA4 = 0;}
	btfss	0+(LCD_DISP@display)+02h,(3)&7
	goto	u3001
	goto	u3000
u3001:
	goto	l602
u3000:
	
l2176:	
	bsf	(44/8),(44)&7
	goto	l603
	
l602:	
	bcf	(44/8),(44)&7
	
l603:	
	line	116
;LCD.c: 116: if(display[2] & 0x10) {RA5 = 1;} else {RA5 = 0;}
	btfss	0+(LCD_DISP@display)+02h,(4)&7
	goto	u3011
	goto	u3010
u3011:
	goto	l604
u3010:
	
l2178:	
	bsf	(45/8),(45)&7
	goto	l605
	
l604:	
	bcf	(45/8),(45)&7
	
l605:	
	line	117
;LCD.c: 117: if(display[2] & 0x20) {RB1 = 1;} else {RB1 = 0;}
	btfss	0+(LCD_DISP@display)+02h,(5)&7
	goto	u3021
	goto	u3020
u3021:
	goto	l606
u3020:
	
l2180:	
	bsf	(49/8),(49)&7
	goto	l607
	
l606:	
	bcf	(49/8),(49)&7
	
l607:	
	line	118
;LCD.c: 118: if(display[2] & 0x40) {RB2 = 1;} else {RB2 = 0;}
	btfss	0+(LCD_DISP@display)+02h,(6)&7
	goto	u3031
	goto	u3030
u3031:
	goto	l608
u3030:
	
l2182:	
	bsf	(50/8),(50)&7
	goto	l609
	
l608:	
	bcf	(50/8),(50)&7
	
l609:	
	line	119
;LCD.c: 119: if(display[2] & 0x80) {RB3 = 1;} else {RB3 = 0;}
	btfss	0+(LCD_DISP@display)+02h,(7)&7
	goto	u3041
	goto	u3040
u3041:
	goto	l610
u3040:
	
l2184:	
	bsf	(51/8),(51)&7
	goto	l611
	
l610:	
	bcf	(51/8),(51)&7
	
l611:	
	line	121
;LCD.c: 121: RC2=0;
	bcf	(58/8),(58)&7
	line	122
;LCD.c: 122: TRISC2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	line	123
	
l2186:	
;LCD.c: 123: COMEN&=~(1<<2);
	movlw	(0FBh)
	movwf	(??_LCD_DISP+0)+0
	movf	(??_LCD_DISP+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(407)^0180h,f	;volatile
	line	124
;LCD.c: 124: break;
	goto	l697
	line	125
;LCD.c: 125: case 3:
	
l612:	
	line	126
;LCD.c: 126: if(display[3] & 0x01) {RA1 = 1;} else {RA1 = 0;}
	btfss	0+(LCD_DISP@display)+03h,(0)&7
	goto	u3051
	goto	u3050
u3051:
	goto	l613
u3050:
	
l2188:	
	bsf	(41/8),(41)&7
	goto	l614
	
l613:	
	bcf	(41/8),(41)&7
	
l614:	
	line	127
;LCD.c: 127: if(display[3] & 0x02) {RA2 = 1;} else {RA2 = 0;}
	btfss	0+(LCD_DISP@display)+03h,(1)&7
	goto	u3061
	goto	u3060
u3061:
	goto	l615
u3060:
	
l2190:	
	bsf	(42/8),(42)&7
	goto	l616
	
l615:	
	bcf	(42/8),(42)&7
	
l616:	
	line	128
;LCD.c: 128: if(display[3] & 0x04) {RA3 = 1;} else {RA3 = 0;}
	btfss	0+(LCD_DISP@display)+03h,(2)&7
	goto	u3071
	goto	u3070
u3071:
	goto	l617
u3070:
	
l2192:	
	bsf	(43/8),(43)&7
	goto	l618
	
l617:	
	bcf	(43/8),(43)&7
	
l618:	
	line	129
;LCD.c: 129: if(display[3] & 0x08) {RA4 = 1;} else {RA4 = 0;}
	btfss	0+(LCD_DISP@display)+03h,(3)&7
	goto	u3081
	goto	u3080
u3081:
	goto	l619
u3080:
	
l2194:	
	bsf	(44/8),(44)&7
	goto	l620
	
l619:	
	bcf	(44/8),(44)&7
	
l620:	
	line	130
;LCD.c: 130: if(display[3] & 0x10) {RA5 = 1;} else {RA5 = 0;}
	btfss	0+(LCD_DISP@display)+03h,(4)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l621
u3090:
	
l2196:	
	bsf	(45/8),(45)&7
	goto	l622
	
l621:	
	bcf	(45/8),(45)&7
	
l622:	
	line	131
;LCD.c: 131: if(display[3] & 0x20) {RB1 = 1;} else {RB1 = 0;}
	btfss	0+(LCD_DISP@display)+03h,(5)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l623
u3100:
	
l2198:	
	bsf	(49/8),(49)&7
	goto	l624
	
l623:	
	bcf	(49/8),(49)&7
	
l624:	
	line	132
;LCD.c: 132: if(display[3] & 0x40) {RB2 = 1;} else {RB2 = 0;}
	btfss	0+(LCD_DISP@display)+03h,(6)&7
	goto	u3111
	goto	u3110
u3111:
	goto	l625
u3110:
	
l2200:	
	bsf	(50/8),(50)&7
	goto	l626
	
l625:	
	bcf	(50/8),(50)&7
	
l626:	
	line	133
;LCD.c: 133: if(display[3] & 0x80) {RB3 = 1;} else {RB3 = 0;}
	btfss	0+(LCD_DISP@display)+03h,(7)&7
	goto	u3121
	goto	u3120
u3121:
	goto	l627
u3120:
	
l2202:	
	bsf	(51/8),(51)&7
	goto	l628
	
l627:	
	bcf	(51/8),(51)&7
	
l628:	
	line	135
;LCD.c: 135: RC3=0;
	bcf	(59/8),(59)&7
	line	136
;LCD.c: 136: TRISC3=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	137
	
l2204:	
;LCD.c: 137: COMEN&=~(1<<3);
	movlw	(0F7h)
	movwf	(??_LCD_DISP+0)+0
	movf	(??_LCD_DISP+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(407)^0180h,f	;volatile
	line	138
;LCD.c: 138: break;
	goto	l697
	line	139
;LCD.c: 139: case 4:
	
l629:	
	line	140
;LCD.c: 140: if(display[0] & 0x01) {RA1 = 0;} else {RA1 = 1;}
	btfss	(LCD_DISP@display),(0)&7
	goto	u3131
	goto	u3130
u3131:
	goto	l630
u3130:
	
l2206:	
	bcf	(41/8),(41)&7
	goto	l631
	
l630:	
	bsf	(41/8),(41)&7
	
l631:	
	line	141
;LCD.c: 141: if(display[0] & 0x02) {RA2 = 0;} else {RA2 = 1;}
	btfss	(LCD_DISP@display),(1)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l632
u3140:
	
l2208:	
	bcf	(42/8),(42)&7
	goto	l633
	
l632:	
	bsf	(42/8),(42)&7
	
l633:	
	line	142
;LCD.c: 142: if(display[0] & 0x04) {RA3 = 0;} else {RA3 = 1;}
	btfss	(LCD_DISP@display),(2)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l634
u3150:
	
l2210:	
	bcf	(43/8),(43)&7
	goto	l635
	
l634:	
	bsf	(43/8),(43)&7
	
l635:	
	line	143
;LCD.c: 143: if(display[0] & 0x08) {RA4 = 0;} else {RA4 = 1;}
	btfss	(LCD_DISP@display),(3)&7
	goto	u3161
	goto	u3160
u3161:
	goto	l636
u3160:
	
l2212:	
	bcf	(44/8),(44)&7
	goto	l637
	
l636:	
	bsf	(44/8),(44)&7
	
l637:	
	line	144
;LCD.c: 144: if(display[0] & 0x10) {RA5 = 0;} else {RA5 = 1;}
	btfss	(LCD_DISP@display),(4)&7
	goto	u3171
	goto	u3170
u3171:
	goto	l638
u3170:
	
l2214:	
	bcf	(45/8),(45)&7
	goto	l639
	
l638:	
	bsf	(45/8),(45)&7
	
l639:	
	line	145
;LCD.c: 145: if(display[0] & 0x20) {RB1 = 0;} else {RB1 = 1;}
	btfss	(LCD_DISP@display),(5)&7
	goto	u3181
	goto	u3180
u3181:
	goto	l640
u3180:
	
l2216:	
	bcf	(49/8),(49)&7
	goto	l641
	
l640:	
	bsf	(49/8),(49)&7
	
l641:	
	line	146
;LCD.c: 146: if(display[0] & 0x40) {RB2 = 0;} else {RB2 = 1;}
	btfss	(LCD_DISP@display),(6)&7
	goto	u3191
	goto	u3190
u3191:
	goto	l642
u3190:
	
l2218:	
	bcf	(50/8),(50)&7
	goto	l643
	
l642:	
	bsf	(50/8),(50)&7
	
l643:	
	line	147
;LCD.c: 147: if(display[0] & 0x80) {RB3 = 0;} else {RB3 = 1;}
	btfss	(LCD_DISP@display),(7)&7
	goto	u3201
	goto	u3200
u3201:
	goto	l644
u3200:
	
l2220:	
	bcf	(51/8),(51)&7
	goto	l645
	
l644:	
	bsf	(51/8),(51)&7
	
l645:	
	line	149
;LCD.c: 149: RC0=1;
	bsf	(56/8),(56)&7
	line	150
;LCD.c: 150: TRISC0=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1080/8)^080h,(1080)&7
	line	151
	
l2222:	
;LCD.c: 151: COMEN&=~(1<<0);
	movlw	(0FEh)
	movwf	(??_LCD_DISP+0)+0
	movf	(??_LCD_DISP+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(407)^0180h,f	;volatile
	line	152
;LCD.c: 152: break;
	goto	l697
	line	153
;LCD.c: 153: case 5:
	
l646:	
	line	154
;LCD.c: 154: if(display[1] & 0x01) {RA1 = 0;} else {RA1 = 1;}
	btfss	0+(LCD_DISP@display)+01h,(0)&7
	goto	u3211
	goto	u3210
u3211:
	goto	l647
u3210:
	
l2224:	
	bcf	(41/8),(41)&7
	goto	l648
	
l647:	
	bsf	(41/8),(41)&7
	
l648:	
	line	155
;LCD.c: 155: if(display[1] & 0x02) {RA2 = 0;} else {RA2 = 1;}
	btfss	0+(LCD_DISP@display)+01h,(1)&7
	goto	u3221
	goto	u3220
u3221:
	goto	l649
u3220:
	
l2226:	
	bcf	(42/8),(42)&7
	goto	l650
	
l649:	
	bsf	(42/8),(42)&7
	
l650:	
	line	156
;LCD.c: 156: if(display[1] & 0x04) {RA3 = 0;} else {RA3 = 1;}
	btfss	0+(LCD_DISP@display)+01h,(2)&7
	goto	u3231
	goto	u3230
u3231:
	goto	l651
u3230:
	
l2228:	
	bcf	(43/8),(43)&7
	goto	l652
	
l651:	
	bsf	(43/8),(43)&7
	
l652:	
	line	157
;LCD.c: 157: if(display[1] & 0x08) {RA4 = 0;} else {RA4 = 1;}
	btfss	0+(LCD_DISP@display)+01h,(3)&7
	goto	u3241
	goto	u3240
u3241:
	goto	l653
u3240:
	
l2230:	
	bcf	(44/8),(44)&7
	goto	l654
	
l653:	
	bsf	(44/8),(44)&7
	
l654:	
	line	158
;LCD.c: 158: if(display[1] & 0x10) {RA5 = 0;} else {RA5 = 1;}
	btfss	0+(LCD_DISP@display)+01h,(4)&7
	goto	u3251
	goto	u3250
u3251:
	goto	l655
u3250:
	
l2232:	
	bcf	(45/8),(45)&7
	goto	l656
	
l655:	
	bsf	(45/8),(45)&7
	
l656:	
	line	159
;LCD.c: 159: if(display[1] & 0x20) {RB1 = 0;} else {RB1 = 1;}
	btfss	0+(LCD_DISP@display)+01h,(5)&7
	goto	u3261
	goto	u3260
u3261:
	goto	l657
u3260:
	
l2234:	
	bcf	(49/8),(49)&7
	goto	l658
	
l657:	
	bsf	(49/8),(49)&7
	
l658:	
	line	160
;LCD.c: 160: if(display[1] & 0x40) {RB2 = 0;} else {RB2 = 1;}
	btfss	0+(LCD_DISP@display)+01h,(6)&7
	goto	u3271
	goto	u3270
u3271:
	goto	l659
u3270:
	
l2236:	
	bcf	(50/8),(50)&7
	goto	l660
	
l659:	
	bsf	(50/8),(50)&7
	
l660:	
	line	161
;LCD.c: 161: if(display[1] & 0x80) {RB3 = 0;} else {RB3 = 1;}
	btfss	0+(LCD_DISP@display)+01h,(7)&7
	goto	u3281
	goto	u3280
u3281:
	goto	l661
u3280:
	
l2238:	
	bcf	(51/8),(51)&7
	goto	l662
	
l661:	
	bsf	(51/8),(51)&7
	
l662:	
	line	163
;LCD.c: 163: RC1=1;
	bsf	(57/8),(57)&7
	line	164
;LCD.c: 164: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	165
	
l2240:	
;LCD.c: 165: COMEN&=~(1<<1);
	movlw	(0FDh)
	movwf	(??_LCD_DISP+0)+0
	movf	(??_LCD_DISP+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(407)^0180h,f	;volatile
	line	166
;LCD.c: 166: break;
	goto	l697
	line	167
;LCD.c: 167: case 6:
	
l663:	
	line	168
;LCD.c: 168: if(display[2] & 0x01) {RA1 = 0;} else {RA1 = 1;}
	btfss	0+(LCD_DISP@display)+02h,(0)&7
	goto	u3291
	goto	u3290
u3291:
	goto	l664
u3290:
	
l2242:	
	bcf	(41/8),(41)&7
	goto	l665
	
l664:	
	bsf	(41/8),(41)&7
	
l665:	
	line	169
;LCD.c: 169: if(display[2] & 0x02) {RA2 = 0;} else {RA2 = 1;}
	btfss	0+(LCD_DISP@display)+02h,(1)&7
	goto	u3301
	goto	u3300
u3301:
	goto	l666
u3300:
	
l2244:	
	bcf	(42/8),(42)&7
	goto	l667
	
l666:	
	bsf	(42/8),(42)&7
	
l667:	
	line	170
;LCD.c: 170: if(display[2] & 0x04) {RA3 = 0;} else {RA3 = 1;}
	btfss	0+(LCD_DISP@display)+02h,(2)&7
	goto	u3311
	goto	u3310
u3311:
	goto	l668
u3310:
	
l2246:	
	bcf	(43/8),(43)&7
	goto	l669
	
l668:	
	bsf	(43/8),(43)&7
	
l669:	
	line	171
;LCD.c: 171: if(display[2] & 0x08) {RA4 = 0;} else {RA4 = 1;}
	btfss	0+(LCD_DISP@display)+02h,(3)&7
	goto	u3321
	goto	u3320
u3321:
	goto	l670
u3320:
	
l2248:	
	bcf	(44/8),(44)&7
	goto	l671
	
l670:	
	bsf	(44/8),(44)&7
	
l671:	
	line	172
;LCD.c: 172: if(display[2] & 0x10) {RA5 = 0;} else {RA5 = 1;}
	btfss	0+(LCD_DISP@display)+02h,(4)&7
	goto	u3331
	goto	u3330
u3331:
	goto	l672
u3330:
	
l2250:	
	bcf	(45/8),(45)&7
	goto	l673
	
l672:	
	bsf	(45/8),(45)&7
	
l673:	
	line	173
;LCD.c: 173: if(display[2] & 0x20) {RB1 = 0;} else {RB1 = 1;}
	btfss	0+(LCD_DISP@display)+02h,(5)&7
	goto	u3341
	goto	u3340
u3341:
	goto	l674
u3340:
	
l2252:	
	bcf	(49/8),(49)&7
	goto	l675
	
l674:	
	bsf	(49/8),(49)&7
	
l675:	
	line	174
;LCD.c: 174: if(display[2] & 0x40) {RB2 = 0;} else {RB2 = 1;}
	btfss	0+(LCD_DISP@display)+02h,(6)&7
	goto	u3351
	goto	u3350
u3351:
	goto	l676
u3350:
	
l2254:	
	bcf	(50/8),(50)&7
	goto	l677
	
l676:	
	bsf	(50/8),(50)&7
	
l677:	
	line	175
;LCD.c: 175: if(display[2] & 0x80) {RB3 = 0;} else {RB3 = 1;}
	btfss	0+(LCD_DISP@display)+02h,(7)&7
	goto	u3361
	goto	u3360
u3361:
	goto	l678
u3360:
	
l2256:	
	bcf	(51/8),(51)&7
	goto	l679
	
l678:	
	bsf	(51/8),(51)&7
	
l679:	
	line	177
;LCD.c: 177: RC2=1;
	bsf	(58/8),(58)&7
	line	178
;LCD.c: 178: TRISC2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	line	179
	
l2258:	
;LCD.c: 179: COMEN&=~(1<<2);
	movlw	(0FBh)
	movwf	(??_LCD_DISP+0)+0
	movf	(??_LCD_DISP+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(407)^0180h,f	;volatile
	line	180
;LCD.c: 180: break;
	goto	l697
	line	181
;LCD.c: 181: case 7:
	
l680:	
	line	182
;LCD.c: 182: if(display[3] & 0x01) {RA1 = 0;} else {RA1 = 1;}
	btfss	0+(LCD_DISP@display)+03h,(0)&7
	goto	u3371
	goto	u3370
u3371:
	goto	l681
u3370:
	
l2260:	
	bcf	(41/8),(41)&7
	goto	l682
	
l681:	
	bsf	(41/8),(41)&7
	
l682:	
	line	183
;LCD.c: 183: if(display[3] & 0x02) {RA2 = 0;} else {RA2 = 1;}
	btfss	0+(LCD_DISP@display)+03h,(1)&7
	goto	u3381
	goto	u3380
u3381:
	goto	l683
u3380:
	
l2262:	
	bcf	(42/8),(42)&7
	goto	l684
	
l683:	
	bsf	(42/8),(42)&7
	
l684:	
	line	184
;LCD.c: 184: if(display[3] & 0x04) {RA3 = 0;} else {RA3 = 1;}
	btfss	0+(LCD_DISP@display)+03h,(2)&7
	goto	u3391
	goto	u3390
u3391:
	goto	l685
u3390:
	
l2264:	
	bcf	(43/8),(43)&7
	goto	l686
	
l685:	
	bsf	(43/8),(43)&7
	
l686:	
	line	185
;LCD.c: 185: if(display[3] & 0x08) {RA4 = 0;} else {RA4 = 1;}
	btfss	0+(LCD_DISP@display)+03h,(3)&7
	goto	u3401
	goto	u3400
u3401:
	goto	l687
u3400:
	
l2266:	
	bcf	(44/8),(44)&7
	goto	l688
	
l687:	
	bsf	(44/8),(44)&7
	
l688:	
	line	186
;LCD.c: 186: if(display[3] & 0x10) {RA5 = 0;} else {RA5 = 1;}
	btfss	0+(LCD_DISP@display)+03h,(4)&7
	goto	u3411
	goto	u3410
u3411:
	goto	l689
u3410:
	
l2268:	
	bcf	(45/8),(45)&7
	goto	l690
	
l689:	
	bsf	(45/8),(45)&7
	
l690:	
	line	187
;LCD.c: 187: if(display[3] & 0x20) {RB1 = 0;} else {RB1 = 1;}
	btfss	0+(LCD_DISP@display)+03h,(5)&7
	goto	u3421
	goto	u3420
u3421:
	goto	l691
u3420:
	
l2270:	
	bcf	(49/8),(49)&7
	goto	l692
	
l691:	
	bsf	(49/8),(49)&7
	
l692:	
	line	188
;LCD.c: 188: if(display[3] & 0x40) {RB2 = 0;} else {RB2 = 1;}
	btfss	0+(LCD_DISP@display)+03h,(6)&7
	goto	u3431
	goto	u3430
u3431:
	goto	l693
u3430:
	
l2272:	
	bcf	(50/8),(50)&7
	goto	l694
	
l693:	
	bsf	(50/8),(50)&7
	
l694:	
	line	189
;LCD.c: 189: if(display[3] & 0x80) {RB3 = 0;} else {RB3 = 1;}
	btfss	0+(LCD_DISP@display)+03h,(7)&7
	goto	u3441
	goto	u3440
u3441:
	goto	l695
u3440:
	
l2274:	
	bcf	(51/8),(51)&7
	goto	l696
	
l695:	
	bsf	(51/8),(51)&7
	
l696:	
	line	191
;LCD.c: 191: RC3=1;
	bsf	(59/8),(59)&7
	line	192
;LCD.c: 192: TRISC3=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	193
	
l2276:	
;LCD.c: 193: COMEN&=~(1<<3);
	movlw	(0F7h)
	movwf	(??_LCD_DISP+0)+0
	movf	(??_LCD_DISP+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(407)^0180h,f	;volatile
	line	194
;LCD.c: 194: break;
	goto	l697
	line	195
	
l2278:	
;LCD.c: 195: }
	goto	l697
	line	81
	
l559:	
	
l2280:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(LCD_DISP@dcount),w
	andlw	07h
	movwf	(??_LCD_DISP+0)+0
	clrf	(??_LCD_DISP+0)+0+1
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            7     6 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf 1+(??_LCD_DISP+0)+0,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l2360
	goto	l697
	opt asmopt_on
	
l2360:	
; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 7
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           14     6 (fixed)
; simple_byte           25    13 (average)
; jumptable            260     6 (fixed)
; rangetable            12     6 (fixed)
; spacedrange           22     9 (fixed)
; locatedrange           8     3 (fixed)
;	Chosen strategy is direct_byte

	movf 0+(??_LCD_DISP+0)+0,w
	movwf fsr
	movlw	8
	subwf	fsr,w
skipnc
goto l697
movlw high(S2362)
movwf pclath
	movlw low(S2362)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S2362:
	ljmp	l560
	ljmp	l578
	ljmp	l595
	ljmp	l612
	ljmp	l629
	ljmp	l646
	ljmp	l663
	ljmp	l680
psect	text121

	line	195
	
l577:	
	line	196
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_DISP
	__end_of_LCD_DISP:
;; =============== function _LCD_DISP ends ============

	signat	_LCD_DISP,88
	global	_SET_DISP
psect	text122,local,class=CODE,delta=2
global __ptext122
__ptext122:

;; *************** function _SET_DISP *****************
;; Defined at:
;;		line 61 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
;; Parameters:    Size  Location     Type
;;  RDATA           1    wreg     PTR unsigned char 
;;		 -> LCD_DISP@display(4), 
;; Auto vars:     Size  Location     Type
;;  RDATA           1    6[COMMON] PTR unsigned char 
;;		 -> LCD_DISP@display(4), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          1       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LCD_DISP
;; This function uses a non-reentrant model
;;
psect	text122
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
	line	61
	global	__size_of_SET_DISP
	__size_of_SET_DISP	equ	__end_of_SET_DISP-_SET_DISP
	
_SET_DISP:	
	opt	stack 5
; Regs used in _SET_DISP: [wreg-fsr0h+status,2+status,0]
;SET_DISP@RDATA stored from wreg
	movwf	(SET_DISP@RDATA)
	line	62
	
l2116:	
;LCD.c: 62: *RDATA=0x1;
	movf	(SET_DISP@RDATA),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	bsf	status,0
	rlf	indf,f
	line	63
	
l2118:	
;LCD.c: 63: *(RDATA+1)=0x2;
	movlw	(02h)
	movwf	(??_SET_DISP+0)+0
	movf	(SET_DISP@RDATA),w
	addlw	01h
	movwf	fsr0
	movf	(??_SET_DISP+0)+0,w
	movwf	indf
	line	64
	
l2120:	
;LCD.c: 64: *(RDATA+2)=0x4;
	movlw	(04h)
	movwf	(??_SET_DISP+0)+0
	movf	(SET_DISP@RDATA),w
	addlw	02h
	movwf	fsr0
	movf	(??_SET_DISP+0)+0,w
	movwf	indf
	line	65
	
l2122:	
;LCD.c: 65: *(RDATA+3)=0x8;
	movlw	(08h)
	movwf	(??_SET_DISP+0)+0
	movf	(SET_DISP@RDATA),w
	addlw	03h
	movwf	fsr0
	movf	(??_SET_DISP+0)+0,w
	movwf	indf
	line	66
	
l554:	
	return
	opt stack 0
GLOBAL	__end_of_SET_DISP
	__end_of_SET_DISP:
;; =============== function _SET_DISP ends ============

	signat	_SET_DISP,4216
	global	_isr
psect	text123,local,class=CODE,delta=2
global __ptext123
__ptext123:

;; *************** function _isr *****************
;; Defined at:
;;		line 48 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
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
psect	text123
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\LCD_Demo\LCD.c"
	line	48
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 5
; Regs used in _isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_isr+1)
	movf	fsr0,w
	movwf	(??_isr+2)
	movf	pclath,w
	movwf	(??_isr+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr+4)
	ljmp	_isr
psect	text123
	line	49
	
i1l2110:	
;LCD.c: 49: if(TMR2IF)
	btfss	(97/8),(97)&7
	goto	u280_21
	goto	u280_20
u280_21:
	goto	i1l551
u280_20:
	line	51
	
i1l2112:	
;LCD.c: 50: {
;LCD.c: 51: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	52
	
i1l2114:	
;LCD.c: 52: tcount++;
	movlw	(01h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	addwf	(_tcount),f
	goto	i1l551
	line	53
	
i1l550:	
	line	54
	
i1l551:	
	movf	(??_isr+4),w
	movwf	btemp+1
	movf	(??_isr+3),w
	movwf	pclath
	movf	(??_isr+2),w
	movwf	fsr0
	swapf	(??_isr+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
psect	text124,local,class=CODE,delta=2
global __ptext124
__ptext124:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
