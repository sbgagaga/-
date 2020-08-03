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
	global	_CCP1CON
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_T2CKPS0
_T2CKPS0	set	144
	global	_T2CKPS1
_T2CKPS1	set	145
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_OSCCON
_OSCCON	set	143
	global	_PR2
_PR2	set	146
	global	_TRISC2
_TRISC2	set	1082
	file	"CCP_DEMO.as"
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
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	1
	global	main@delaycnt
main@delaycnt:	; 2 bytes @ 0x1
	ds	2
	global	main@pwmbuf
main@pwmbuf:	; 1 bytes @ 0x3
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       4
;; BANK0           80      0       0
;; BANK1           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
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
;; (0) _main                                                 4     4      0      30
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       4       1       28.6%
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
;;		line 6 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\CCP_Demo\CCP1_PWM.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  delaycnt        2    1[COMMON] unsigned int 
;;  pwmbuf          1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         3       0       0
;;      Temps:          1       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\CCP_Demo\CCP1_PWM.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0]
	line	7
	
l912:	
;CCP1_PWM.c: 7: unsigned int delaycnt = 0;
	clrf	(main@delaycnt)
	clrf	(main@delaycnt+1)
	line	8
	
l914:	
;CCP1_PWM.c: 8: unsigned char pwmbuf = 0;
	clrf	(main@pwmbuf)
	line	10
	
l916:	
# 10 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\CCP_Demo\CCP1_PWM.c"
nop ;#
psect	maintext
	line	11
	
l918:	
# 11 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\CCP_Demo\CCP1_PWM.c"
clrwdt ;#
psect	maintext
	line	12
	
l920:	
;CCP1_PWM.c: 12: OSCCON = 0X71;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	15
	
l922:	
;CCP1_PWM.c: 15: PR2 = 0xFF;
	movlw	(0FFh)
	movwf	(146)^080h	;volatile
	line	16
	
l924:	
;CCP1_PWM.c: 16: CCP1CON = 0x0C;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(23)	;volatile
	line	17
	
l926:	
;CCP1_PWM.c: 17: CCPR1L = 0xCD;
	movlw	(0CDh)
	movwf	(21)	;volatile
	line	19
	
l928:	
;CCP1_PWM.c: 19: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	20
	
l930:	
;CCP1_PWM.c: 20: T2CKPS0 = 0;
	bcf	(144/8),(144)&7
	line	21
	
l932:	
;CCP1_PWM.c: 21: T2CKPS1 = 0;
	bcf	(145/8),(145)&7
	line	22
	
l934:	
;CCP1_PWM.c: 22: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	23
	
l936:	
;CCP1_PWM.c: 23: TRISC2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	goto	l938
	line	25
;CCP1_PWM.c: 25: while(1)
	
l539:	
	line	27
	
l938:	
;CCP1_PWM.c: 26: {
;CCP1_PWM.c: 27: if(++delaycnt > 1000)
	movlw	low(01h)
	addwf	(main@delaycnt),f
	skipnc
	incf	(main@delaycnt+1),f
	movlw	high(01h)
	addwf	(main@delaycnt+1),f
	movlw	high(03E9h)
	subwf	((main@delaycnt+1)),w
	movlw	low(03E9h)
	skipnz
	subwf	((main@delaycnt)),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l938
u10:
	line	29
	
l940:	
;CCP1_PWM.c: 28: {
;CCP1_PWM.c: 29: delaycnt = 0;
	clrf	(main@delaycnt)
	clrf	(main@delaycnt+1)
	line	30
	
l942:	
;CCP1_PWM.c: 30: pwmbuf++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@pwmbuf),f
	line	31
	
l944:	
;CCP1_PWM.c: 31: CCPR1L = pwmbuf;
	movf	(main@pwmbuf),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	goto	l938
	line	32
	
l540:	
	goto	l938
	line	33
	
l541:	
	line	25
	goto	l938
	
l542:	
	line	34
	
l543:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
