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
	FNROOT	_main
psect	text41,local,class=CODE,delta=2
global __ptext41
__ptext41:
	file	"Delay.as"
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
	global	?_DelayXms
?_DelayXms:	; 0 bytes @ 0x0
	global	??_DelayXms
??_DelayXms:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	DelayXms@x
DelayXms@x:	; 1 bytes @ 0x0
	ds	1
	global	DelayXms@i
DelayXms@i:	; 1 bytes @ 0x1
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	2
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
;;   _main->_DelayXms
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0      30
;;                                              2 COMMON     2     2      0
;;                           _DelayXms
;; ---------------------------------------------------------------------------------
;; (1) _DelayXms                                             2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DelayXms
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
;;STACK                0      0       1       2        0.0%
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
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 36 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayXms
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
	line	36
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	37
	
l1706:	
;Delay.c: 37: DelayXms(50);
	movlw	(032h)
	fcall	_DelayXms
	goto	l1708
	line	38
;Delay.c: 38: while(1)
	
l558:	
	line	40
	
l1708:	
;Delay.c: 39: {
;Delay.c: 40: _nop();
	nop
	line	41
	
l1710:	
;Delay.c: 41: _delay(1000);
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u2177:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u2177
	nop2	;nop
	clrwdt
opt asmopt_on

	line	42
	
l1712:	
# 42 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
clrwdt ;#
psect	maintext
	line	43
	
l1714:	
;Delay.c: 43: _delay((unsigned long)((400)*(8000000/4000000.0)));
	opt asmopt_off
movlw	199
movwf	(??_main+0)+0,f
u2187:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u2187
	nop2	;nop
	clrwdt
opt asmopt_on

	line	44
	
l1716:	
# 44 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
clrwdt ;#
psect	maintext
	line	45
	
l1718:	
;Delay.c: 45: _delay((unsigned long)((2)*(8000000/4000.0)));
	opt asmopt_off
movlw	6
movwf	((??_main+0)+0+1),f
	movlw	48
movwf	((??_main+0)+0),f
u2197:
	decfsz	((??_main+0)+0),f
	goto	u2197
	decfsz	((??_main+0)+0+1),f
	goto	u2197
	clrwdt
opt asmopt_on

	line	46
	
l1720:	
# 46 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
clrwdt ;#
psect	maintext
	goto	l1708
	line	47
	
l559:	
	line	38
	goto	l1708
	
l560:	
	line	48
	
l561:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DelayXms
psect	text42,local,class=CODE,delta=2
global __ptext42
__ptext42:

;; *************** function _DelayXms *****************
;; Defined at:
;;		line 19 in file "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    0[COMMON] unsigned char 
;;  i               1    1[COMMON] unsigned char 
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
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text42
	file	"E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
	line	19
	global	__size_of_DelayXms
	__size_of_DelayXms	equ	__end_of_DelayXms-_DelayXms
	
_DelayXms:	
	opt	stack 7
; Regs used in _DelayXms: [wreg+status,2+status,0]
;DelayXms@x stored from wreg
	movwf	(DelayXms@x)
	line	20
	
l934:	
;Delay.c: 20: unsigned char i = 0;;
	clrf	(DelayXms@i)
	line	22
;Delay.c: 22: while(--x)
	goto	l938
	
l550:	
	line	24
# 24 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
clrwdt ;#
psect	text42
	line	25
;Delay.c: 25: while(--i)
	goto	l936
	
l552:	
	line	27
# 27 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
nop ;#
	line	28
# 28 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
nop ;#
	line	29
# 29 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
nop ;#
	line	30
# 30 "E:\中微资料\公司资料\程序和推广资料\89示例程序\示例程序\Delay_Demo\Delay.c"
nop ;#
psect	text42
	goto	l936
	line	31
	
l551:	
	line	25
	
l936:	
	movlw	low(01h)
	subwf	(DelayXms@i),f
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l552
u20:
	goto	l938
	
l553:	
	goto	l938
	line	32
	
l549:	
	line	22
	
l938:	
	movlw	low(01h)
	subwf	(DelayXms@x),f
	btfss	status,2
	goto	u31
	goto	u30
u31:
	goto	l550
u30:
	goto	l555
	
l554:	
	line	33
	
l555:	
	return
	opt stack 0
GLOBAL	__end_of_DelayXms
	__end_of_DelayXms:
;; =============== function _DelayXms ends ============

	signat	_DelayXms,4216
psect	text43,local,class=CODE,delta=2
global __ptext43
__ptext43:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
