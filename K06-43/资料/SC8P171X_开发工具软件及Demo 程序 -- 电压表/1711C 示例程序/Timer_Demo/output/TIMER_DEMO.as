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
	FNROOT	_main
	FNCALL	intlevel1,_Timer0_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	_PORTB
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_PORTB	set	6
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISB
_TRISB	set	134
	file	"TIMER_DEMO.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_Timer0_Isr
?_Timer0_Isr:	; 0 bytes @ 0x0
	global	??_Timer0_Isr
??_Timer0_Isr:	; 0 bytes @ 0x0
	ds	5
	global	??_main
??_main:	; 0 bytes @ 0x5
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80      0       0
;; BANK1           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _Timer0_Isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _Timer0_Isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _Timer0_Isr in BANK1
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
;; (0) _main                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _Timer0_Isr                                           5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;
;; _Timer0_Isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       5       1       35.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       0       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;DATA                 0      0       0       8        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 4 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Timer_Demo\Timer0.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Timer_Demo\Timer0.c"
	line	4
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2]
	line	5
	
l915:	
# 5 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Timer_Demo\Timer0.c"
nop ;#
	line	6
# 6 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Timer_Demo\Timer0.c"
clrwdt ;#
psect	maintext
	line	7
	
l917:	
;Timer0.c: 7: OSCCON = 0X71;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	9
	
l919:	
;Timer0.c: 9: TRISB = 0;
	clrf	(134)^080h	;volatile
	line	11
	
l921:	
;Timer0.c: 11: OPTION_REG = 0B11010000;
	movlw	(0D0h)
	movwf	(129)^080h	;volatile
	line	13
	
l923:	
;Timer0.c: 13: TMR0 = 6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	14
	
l925:	
;Timer0.c: 14: T0IF = 0;
	bcf	(90/8),(90)&7
	line	15
	
l927:	
;Timer0.c: 15: T0IE = 1;
	bsf	(93/8),(93)&7
	line	17
	
l929:	
;Timer0.c: 17: GIE = 1;
	bsf	(95/8),(95)&7
	goto	l931
	line	19
;Timer0.c: 19: while(1)
	
l539:	
	line	21
	
l931:	
# 21 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Timer_Demo\Timer0.c"
clrwdt ;#
psect	maintext
	goto	l931
	line	22
	
l540:	
	line	19
	goto	l931
	
l541:	
	line	23
	
l542:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Timer0_Isr
psect	text55,local,class=CODE,delta=2
global __ptext55
__ptext55:

;; *************** function _Timer0_Isr *****************
;; Defined at:
;;		line 26 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Timer_Demo\Timer0.c"
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
psect	text55
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Timer_Demo\Timer0.c"
	line	26
	global	__size_of_Timer0_Isr
	__size_of_Timer0_Isr	equ	__end_of_Timer0_Isr-_Timer0_Isr
	
_Timer0_Isr:	
	opt	stack 7
; Regs used in _Timer0_Isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_Timer0_Isr+1)
	movf	fsr0,w
	movwf	(??_Timer0_Isr+2)
	movf	pclath,w
	movwf	(??_Timer0_Isr+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_Timer0_Isr+4)
	ljmp	_Timer0_Isr
psect	text55
	line	27
	
i1l933:	
;Timer0.c: 27: if(T0IF)
	btfss	(90/8),(90)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l546
u1_20:
	line	29
	
i1l935:	
;Timer0.c: 28: {
;Timer0.c: 29: TMR0 += 6;
	movlw	(06h)
	movwf	(??_Timer0_Isr+0)+0
	movf	(??_Timer0_Isr+0)+0,w
	addwf	(1),f	;volatile
	line	30
	
i1l937:	
;Timer0.c: 30: T0IF = 0;
	bcf	(90/8),(90)&7
	line	32
;Timer0.c: 32: PORTB ^= 0XFF;
	movlw	(0FFh)
	movwf	(??_Timer0_Isr+0)+0
	movf	(??_Timer0_Isr+0)+0,w
	xorwf	(6),f	;volatile
	goto	i1l546
	line	33
	
i1l545:	
	line	34
	
i1l546:	
	movf	(??_Timer0_Isr+4),w
	movwf	btemp+1
	movf	(??_Timer0_Isr+3),w
	movwf	pclath
	movf	(??_Timer0_Isr+2),w
	movwf	fsr0
	swapf	(??_Timer0_Isr+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Timer0_Isr
	__end_of_Timer0_Isr:
;; =============== function _Timer0_Isr ends ============

	signat	_Timer0_Isr,88
psect	text56,local,class=CODE,delta=2
global __ptext56
__ptext56:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
