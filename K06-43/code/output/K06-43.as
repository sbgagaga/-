opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8P1713S
opt include "E:\SCMCU_IDE_V2.00.08_Beta9\data\include\sc8p1713s.cgen.inc"
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
	FNCALL	_Apply,_BeepPro
	FNCALL	_Apply,_ChargePro
	FNCALL	_Apply,_KeyScan
	FNCALL	_Apply,_LEDScan
	FNCALL	_ADCPro,_ADCRead
	FNCALL	_ADCRead,_ADSample
	FNCALL	_ADCRead,___lwdiv
	FNCALL	_ADCRead,___wmul
	FNROOT	_main
	FNCALL	_Isr_Timer,___lwmod
	FNCALL	intlevel1,_Isr_Timer
	global	intlevel1
	FNROOT	intlevel1
	global	_ADCModule
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
	line	7

;initializer for _ADCModule
	retlw	low(_ADmax|((0x0)<<8))
	retlw	low(_ADmin|((0x0)<<8))
	retlw	low(_ADsum|((0x0)<<8))
	retlw	low(_ADcnt|((0x0)<<8))
	global	_KeyCnt
	global	_TimerTick
	global	LEDScan@LEDScanIndex
	global	_BeepFlag
	global	_USBLock
	global	_KeyLock
	global	_KeyFlag
	global	_KeyInBuf
	global	_USBInFlag
	global	_KeyInFlag
	global	_USBFlag
	global	_LED_RAM
	global	_USBCnt
	global	_VarPowerUpCount
	global	_BeepTemp
	global	_BeepCnt
	global	_ADCState
	global	_Time1sCnt
	global	_SystemONFlag
	global	_struct_TimerTick
	global	_ADCVal
	global	_ADsum
	global	_ADmin
	global	_ADmax
	global	_ADcnt
	global	_AllLedFlag
psect	bitnvCOMMON,class=COMMON,bit,space=1,noexec
global __pbitnvCOMMON
__pbitnvCOMMON:
_AllLedFlag:
       ds      1

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_INTCON
_INTCON	set	11
	global	_PORTE
_PORTE	set	9
	global	_PORTC
_PORTC	set	7
	global	_PORTB
_PORTB	set	6
	global	_PORTA
_PORTA	set	5
	global	_GODONE
_GODONE	set	249
	global	_TMR1IF
_TMR1IF	set	96
	global	_RE0
_RE0	set	72
	global	_RC2
_RC2	set	58
	global	_RC1
_RC1	set	57
	global	_RC0
_RC0	set	56
	global	_RB7
_RB7	set	55
	global	_RB6
_RB6	set	54
	global	_RB5
_RB5	set	53
	global	_RB4
_RB4	set	52
	global	_RA5
_RA5	set	45
	global	_RA4
_RA4	set	44
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
	global	_WPUB
_WPUB	set	149
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_TRISE
_TRISE	set	137
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
	global	_WPUB2
_WPUB2	set	1194
	global	_WPUB1
_WPUB1	set	1193
	global	_TRISB7
_TRISB7	set	1079
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISB2
_TRISB2	set	1074
	global	_TRISB1
_TRISB1	set	1073
	global	_RBPU
_RBPU	set	1039
	global	_WPUE
_WPUE	set	282
	global	_WDTCON
_WDTCON	set	261
	global	_WPUC
_WPUC	set	399
	global	_WPUA
_WPUA	set	398
	global	_ANS10
_ANS10	set	3146
	global	_ANS8
_ANS8	set	3144
; #config settings
	file	"K06-43.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bitbssCOMMON,class=COMMON,bit,space=1,noexec
global __pbitbssCOMMON
__pbitbssCOMMON:
_BeepFlag:
       ds      1

_USBLock:
       ds      1

_KeyLock:
       ds      1

_KeyFlag:
       ds      1

_KeyInBuf:
       ds      1

_USBInFlag:
       ds      1

_KeyInFlag:
       ds      1

_USBFlag:
       ds      1

psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_KeyCnt:
       ds      2

_TimerTick:
       ds      2

LEDScan@LEDScanIndex:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_LED_RAM:
       ds      4

_USBCnt:
       ds      2

_VarPowerUpCount:
       ds      2

_BeepTemp:
       ds      1

_BeepCnt:
       ds      1

_ADCState:
       ds      1

_Time1sCnt:
       ds      1

_SystemONFlag:
       ds      1

_struct_TimerTick:
       ds      1

_ADCVal:
       ds      6

_ADsum:
       ds      2

_ADmin:
       ds      2

_ADmax:
       ds      2

_ADcnt:
       ds      1

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
	line	7
_ADCModule:
       ds      4

	file	"K06-43.as"
	line	#
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
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Bh)
	fcall	clear_ram0
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssCOMMON)
	movwf	fsr
	movlw	low((__pbssCOMMON)+05h)
	fcall	clear_ram0
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_SystemInit:	; 1 bytes @ 0x0
?_Apply:	; 1 bytes @ 0x0
?_KeyScan:	; 1 bytes @ 0x0
?_LEDScan:	; 1 bytes @ 0x0
?_ADCPro:	; 1 bytes @ 0x0
?_BeepPro:	; 1 bytes @ 0x0
?_ChargePro:	; 1 bytes @ 0x0
?_GPIOInit:	; 1 bytes @ 0x0
?_TimerInit:	; 1 bytes @ 0x0
?_ADSample:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_Isr_Timer:	; 1 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
??___lwmod:	; 1 bytes @ 0x4
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x4
	ds	1
??_Isr_Timer:	; 1 bytes @ 0x5
	ds	2
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
??_SystemInit:	; 1 bytes @ 0x0
??_KeyScan:	; 1 bytes @ 0x0
??_LEDScan:	; 1 bytes @ 0x0
??_BeepPro:	; 1 bytes @ 0x0
??_ChargePro:	; 1 bytes @ 0x0
??_GPIOInit:	; 1 bytes @ 0x0
??_TimerInit:	; 1 bytes @ 0x0
??_ADSample:	; 1 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	ds	1
	global	ADSample@ch
ADSample@ch:	; 1 bytes @ 0x1
	ds	1
	global	ADSample@i
ADSample@i:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	2
??___wmul:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	2
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x6
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x6
	ds	2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
	ds	2
??___lwdiv:	; 1 bytes @ 0xA
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xA
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xB
	ds	2
?_ADCRead:	; 1 bytes @ 0xD
	global	ADCRead@Module
ADCRead@Module:	; 4 bytes @ 0xD
	ds	4
	global	ADCRead@Val
ADCRead@Val:	; 1 bytes @ 0x11
	ds	1
??_ADCRead:	; 1 bytes @ 0x12
	ds	10
	global	ADCRead@ch
ADCRead@ch:	; 1 bytes @ 0x1C
	ds	1
	global	ADCRead@AD_H
ADCRead@AD_H:	; 2 bytes @ 0x1D
	ds	2
	global	ADCRead@AD_L
ADCRead@AD_L:	; 2 bytes @ 0x1F
	ds	2
	global	ADCRead@ad_temp
ADCRead@ad_temp:	; 2 bytes @ 0x21
	ds	2
??_Apply:	; 1 bytes @ 0x23
??_ADCPro:	; 1 bytes @ 0x23
??_main:	; 1 bytes @ 0x23
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        4
;!    BSS         32
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      7      14
;!    BANK0            80     35      66
;!    BANK1            80      0       0

;!
;!Pointer List with Targets:
;!
;!    ADCRead@Val	PTR unsigned int  size(1) Largest target is 6
;!		 -> ADCVal(BANK0[6]), 
;!
;!    Module.ADCCnt	PTR unsigned char  size(1) Largest target is 1
;!		 -> ADcnt(BANK0[1]), 
;!
;!    Module.ADCSum	PTR unsigned int  size(1) Largest target is 2
;!		 -> ADsum(BANK0[2]), 
;!
;!    Module.ADCmin	PTR unsigned int  size(1) Largest target is 2
;!		 -> ADmin(BANK0[2]), 
;!
;!    Module.ADCmax	PTR unsigned int  size(1) Largest target is 2
;!		 -> ADmax(BANK0[2]), 
;!
;!    S918$ADCCnt	PTR unsigned char  size(1) Largest target is 1
;!		 -> ADcnt(BANK0[1]), 
;!
;!    ADCModule.ADCCnt	PTR unsigned char  size(1) Largest target is 1
;!		 -> ADcnt(BANK0[1]), 
;!
;!    S918$ADCSum	PTR unsigned int  size(1) Largest target is 2
;!		 -> ADsum(BANK0[2]), 
;!
;!    ADCModule.ADCSum	PTR unsigned int  size(1) Largest target is 2
;!		 -> ADsum(BANK0[2]), 
;!
;!    S918$ADCmin	PTR unsigned int  size(1) Largest target is 2
;!		 -> ADmin(BANK0[2]), 
;!
;!    ADCModule.ADCmin	PTR unsigned int  size(1) Largest target is 2
;!		 -> ADmin(BANK0[2]), 
;!
;!    S918$ADCmax	PTR unsigned int  size(1) Largest target is 2
;!		 -> ADmax(BANK0[2]), 
;!
;!    ADCModule.ADCmax	PTR unsigned int  size(1) Largest target is 2
;!		 -> ADmax(BANK0[2]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _Isr_Timer in COMMON
;!
;!    _Isr_Timer->___lwmod
;!
;!Critical Paths under _main in BANK0
;!
;!    _ADCPro->_ADCRead
;!    _ADCRead->___lwdiv
;!    ___lwdiv->___wmul
;!
;!Critical Paths under _Isr_Timer in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
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
;! (0) _main                                                 0     0      0    2449
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
;! (1) _Apply                                                0     0      0    2449
;!                             _ADCPro
;!                            _BeepPro
;!                          _ChargePro
;!                            _KeyScan
;!                            _LEDScan
;! ---------------------------------------------------------------------------------
;! (2) _LEDScan                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _KeyScan                                              1     1      0       0
;!                                              0 BANK0      1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _ChargePro                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _BeepPro                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _ADCPro                                               0     0      0    2449
;!                            _ADCRead
;! ---------------------------------------------------------------------------------
;! (3) _ADCRead                                             22    17      5    2449
;!                                             13 BANK0     22    17      5
;!                           _ADSample
;!                            ___lwdiv
;!                             ___wmul
;! ---------------------------------------------------------------------------------
;! (4) ___wmul                                               6     2      4     396
;!                                              0 BANK0      6     2      4
;! ---------------------------------------------------------------------------------
;! (4) ___lwdiv                                              7     3      4     501
;!                                              6 BANK0      7     3      4
;!                             ___wmul (ARG)
;! ---------------------------------------------------------------------------------
;! (4) _ADSample                                             3     3      0      45
;!                                              0 BANK0      3     3      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _Isr_Timer                                            2     2      0     795
;!                                              5 COMMON     2     2      0
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (6) ___lwmod                                              5     1      4     795
;!                                              0 COMMON     5     1      4
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
;!         ___lwdiv
;!           ___wmul (ARG)
;!         ___wmul
;!     _BeepPro
;!     _ChargePro
;!     _KeyScan
;!     _LEDScan
;!   _SystemInit
;!     _GPIOInit
;!     _TimerInit
;!
;! _Isr_Timer (ROOT)
;!   ___lwmod
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!SFR3                 0      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!BANK1               50      0       0       7        0.0%
;!BITBANK1            50      0       0       6        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     23      42       5       82.5%
;!BITBANK0            50      0       0       4        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      7       E       1      100.0%
;!BITCOMMON            E      0       2       0       14.3%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      50       8        0.0%
;!ABS                  0      0      50       3        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 3 in file "C:\Users\Administrator\Desktop\project\K06-43\code\main.c"
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
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\main.c"
	line	3
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\main.c"
	line	3
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	5
	
l6906:	
;main.c: 5: SystemInit();
	fcall	_SystemInit
	line	6
	
l6908:	
;main.c: 6: AllLedFlag=1;
	bsf	(_AllLedFlag/8),(_AllLedFlag)&7
	line	9
	
l6910:	
;main.c: 8: {
;main.c: 9: Apply();
	fcall	_Apply
	line	10
# 10 "C:\Users\Administrator\Desktop\project\K06-43\code\main.c"
clrwdt ;# 
psect	maintext
	goto	l6910
	global	start
	ljmp	start
	opt stack 0
	line	12
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_SystemInit

;; *************** function _SystemInit *****************
;; Defined at:
;;		line 89 in file "C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
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
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
	line	89
global __ptext1
__ptext1:	;psect for function _SystemInit
psect	text1
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
	line	89
	global	__size_of_SystemInit
	__size_of_SystemInit	equ	__end_of_SystemInit-_SystemInit
	
_SystemInit:	
;incstack = 0
	opt	stack 4
; Regs used in _SystemInit: [wreg+status,2+status,0+pclath+cstack]
	line	91
	
l6840:	
# 91 "C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
nop ;# 
	line	92
# 92 "C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
clrwdt ;# 
psect	text1
	line	93
	
l6842:	
;K06-43.c: 93: GPIOInit();
	fcall	_GPIOInit
	line	94
;K06-43.c: 94: TimerInit();
	fcall	_TimerInit
	line	95
	
l6844:	
;K06-43.c: 95: WDTCON=0x01;
	movlw	low(01h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(261)^0100h	;volatile
	line	96
	
l1702:	
	return
	opt stack 0
GLOBAL	__end_of_SystemInit
	__end_of_SystemInit:
	signat	_SystemInit,89
	global	_TimerInit

;; *************** function _TimerInit *****************
;; Defined at:
;;		line 123 in file "C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
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
;;		_SystemInit
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	123
global __ptext2
__ptext2:	;psect for function _TimerInit
psect	text2
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
	line	123
	global	__size_of_TimerInit
	__size_of_TimerInit	equ	__end_of_TimerInit-_TimerInit
	
_TimerInit:	
;incstack = 0
	opt	stack 4
; Regs used in _TimerInit: [wreg]
	line	125
	
l6838:	
;K06-43.c: 125: OSCCON=0X61;
	movlw	low(061h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	126
;K06-43.c: 126: INTCON=0B11000000;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	127
;K06-43.c: 127: PIE1=0B00000001;
	movlw	low(01h)
	movwf	(140)^080h	;volatile
	line	128
;K06-43.c: 128: TMR1H=0xFC;
	movlw	low(0FCh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(15)	;volatile
	line	129
;K06-43.c: 129: TMR1L=0x18;
	movlw	low(018h)
	movwf	(14)	;volatile
	line	130
;K06-43.c: 130: T1CON=0x31;
	movlw	low(031h)
	movwf	(16)	;volatile
	line	131
	
l1708:	
	return
	opt stack 0
GLOBAL	__end_of_TimerInit
	__end_of_TimerInit:
	signat	_TimerInit,89
	global	_GPIOInit

;; *************** function _GPIOInit *****************
;; Defined at:
;;		line 98 in file "C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
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
	line	98
global __ptext3
__ptext3:	;psect for function _GPIOInit
psect	text3
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
	line	98
	global	__size_of_GPIOInit
	__size_of_GPIOInit	equ	__end_of_GPIOInit-_GPIOInit
	
_GPIOInit:	
;incstack = 0
	opt	stack 4
; Regs used in _GPIOInit: [wreg+status,2]
	line	100
	
l6808:	
;K06-43.c: 100: RBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1039/8)^080h,(1039)&7	;volatile
	line	102
	
l6810:	
;K06-43.c: 102: TRISA =0X00;
	clrf	(133)^080h	;volatile
	line	103
;K06-43.c: 103: TRISB =0X00;
	clrf	(134)^080h	;volatile
	line	104
;K06-43.c: 104: TRISC =0X00;
	clrf	(135)^080h	;volatile
	line	105
;K06-43.c: 105: TRISE =0X00;
	clrf	(137)^080h	;volatile
	line	107
	
l6812:	
;K06-43.c: 107: WPUA =0XFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	108
	
l6814:	
;K06-43.c: 108: WPUB =0XFF;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	109
	
l6816:	
;K06-43.c: 109: WPUC =0XFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(399)^0180h	;volatile
	line	110
	
l6818:	
;K06-43.c: 110: WPUE =0XFF;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank2
	movwf	(282)^0100h	;volatile
	line	112
	
l6820:	
;K06-43.c: 112: PORTA = 0X80;
	movlw	low(080h)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	113
	
l6822:	
;K06-43.c: 113: PORTB = 0X80;
	movlw	low(080h)
	movwf	(6)	;volatile
	line	114
;K06-43.c: 114: PORTC = 0;
	clrf	(7)	;volatile
	line	115
;K06-43.c: 115: PORTE = 0;
	clrf	(9)	;volatile
	line	117
	
l6824:	
;K06-43.c: 117: RB5 =1;
	bsf	(53/8),(53)&7	;volatile
	line	119
	
l6826:	
;K06-43.c: 119: TRISB1=1,WPUB1=0; ANS8=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1073/8)^080h,(1073)&7	;volatile
	
l6828:	
	bcf	(1193/8)^080h,(1193)&7	;volatile
	
l6830:	
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3144/8)^0180h,(3144)&7	;volatile
	line	120
	
l6832:	
;K06-43.c: 120: TRISB2=1,WPUB2=0; ANS10=1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7	;volatile
	
l6834:	
	bcf	(1194/8)^080h,(1194)&7	;volatile
	
l6836:	
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3146/8)^0180h,(3146)&7	;volatile
	line	121
	
l1705:	
	return
	opt stack 0
GLOBAL	__end_of_GPIOInit
	__end_of_GPIOInit:
	signat	_GPIOInit,89
	global	_Apply

;; *************** function _Apply *****************
;; Defined at:
;;		line 18 in file "C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
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
;;		On exit  : 300/0
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
;;		_BeepPro
;;		_ChargePro
;;		_KeyScan
;;		_LEDScan
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	18
global __ptext4
__ptext4:	;psect for function _Apply
psect	text4
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\K06-43.c"
	line	18
	global	__size_of_Apply
	__size_of_Apply	equ	__end_of_Apply-_Apply
	
_Apply:	
;incstack = 0
	opt	stack 2
; Regs used in _Apply: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	20
	
l6846:	
;K06-43.c: 20: if((struct_TimerTick.flag_2mStick ) == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_struct_TimerTick),0
	goto	u2591
	goto	u2590
u2591:
	goto	l6856
u2590:
	line	22
	
l6848:	
;K06-43.c: 21: {
;K06-43.c: 22: (struct_TimerTick.flag_2mStick ) = 0;
	bcf	(_struct_TimerTick),0
	line	23
	
l6850:	
;K06-43.c: 23: if(SystemONFlag)
	movf	((_SystemONFlag)),w
	btfsc	status,2
	goto	u2601
	goto	u2600
u2601:
	goto	l6854
u2600:
	line	25
	
l6852:	
;K06-43.c: 24: {
;K06-43.c: 25: KeyScan();
	fcall	_KeyScan
	line	27
	
l6854:	
;K06-43.c: 26: }
;K06-43.c: 27: LEDScan();
	fcall	_LEDScan
	line	30
	
l6856:	
;K06-43.c: 28: }
;K06-43.c: 30: if((struct_TimerTick.flag_5mStick ) == 1)
	btfss	(_struct_TimerTick),1
	goto	u2611
	goto	u2610
u2611:
	goto	l1687
u2610:
	line	32
	
l6858:	
;K06-43.c: 31: {
;K06-43.c: 32: (struct_TimerTick.flag_5mStick ) = 0;
	bcf	(_struct_TimerTick),1
	line	33
	
l1687:	
	line	35
;K06-43.c: 33: }
;K06-43.c: 35: if((struct_TimerTick.flag_10mStick ) == 1)
	btfss	(_struct_TimerTick),2
	goto	u2621
	goto	u2620
u2621:
	goto	l6896
u2620:
	line	37
	
l6860:	
;K06-43.c: 36: {
;K06-43.c: 37: (struct_TimerTick.flag_10mStick ) = 0;
	bcf	(_struct_TimerTick),2
	line	39
	
l6862:	
;K06-43.c: 39: if(SystemONFlag==0&&VarPowerUpCount<100)
	movf	((_SystemONFlag)),w
	btfss	status,2
	goto	u2631
	goto	u2630
u2631:
	goto	l6872
u2630:
	
l6864:	
	movlw	0
	subwf	(_VarPowerUpCount+1),w
	movlw	064h
	skipnz
	subwf	(_VarPowerUpCount),w
	skipnc
	goto	u2641
	goto	u2640
u2641:
	goto	l6872
u2640:
	line	41
	
l6866:	
;K06-43.c: 40: {
;K06-43.c: 41: VarPowerUpCount++;
	incf	(_VarPowerUpCount),f
	skipnz
	incf	(_VarPowerUpCount+1),f
	line	42
	
l6868:	
;K06-43.c: 42: ADCPro();
	fcall	_ADCPro
	line	43
	
l6870:	
;K06-43.c: 43: BeepPro();
	fcall	_BeepPro
	line	44
;K06-43.c: 44: }
	goto	l6878
	line	45
	
l6872:	
;K06-43.c: 45: else if(VarPowerUpCount>=100)
	movlw	0
	subwf	(_VarPowerUpCount+1),w
	movlw	064h
	skipnz
	subwf	(_VarPowerUpCount),w
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l6878
u2650:
	line	47
	
l6874:	
;K06-43.c: 46: {
;K06-43.c: 47: SystemONFlag=1;
	clrf	(_SystemONFlag)
	incf	(_SystemONFlag),f
	line	48
	
l6876:	
;K06-43.c: 48: VarPowerUpCount=0;
	clrf	(_VarPowerUpCount)
	clrf	(_VarPowerUpCount+1)
	line	51
	
l6878:	
;K06-43.c: 49: }
;K06-43.c: 51: if(SystemONFlag)
	movf	((_SystemONFlag)),w
	btfsc	status,2
	goto	u2661
	goto	u2660
u2661:
	goto	l6886
u2660:
	line	53
	
l6880:	
;K06-43.c: 52: {
;K06-43.c: 53: ADCPro();
	fcall	_ADCPro
	line	54
	
l6882:	
;K06-43.c: 54: BeepPro();
	fcall	_BeepPro
	line	55
	
l6884:	
;K06-43.c: 55: ChargePro();
	fcall	_ChargePro
	line	57
	
l6886:	
;K06-43.c: 56: }
;K06-43.c: 57: if(AllLedFlag)
	btfss	(_AllLedFlag/8),(_AllLedFlag)&7
	goto	u2671
	goto	u2670
u2671:
	goto	l6896
u2670:
	line	59
	
l6888:	
;K06-43.c: 58: {
;K06-43.c: 59: Time1sCnt++;
	incf	(_Time1sCnt),f
	line	60
	
l6890:	
;K06-43.c: 60: if(Time1sCnt>=100)
	movlw	low(064h)
	subwf	(_Time1sCnt),w
	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l6896
u2680:
	line	62
	
l6892:	
;K06-43.c: 61: {
;K06-43.c: 62: Time1sCnt=0;
	clrf	(_Time1sCnt)
	line	63
	
l6894:	
;K06-43.c: 63: AllLedFlag=0;
	bcf	(_AllLedFlag/8),(_AllLedFlag)&7
	line	68
	
l6896:	
;K06-43.c: 64: }
;K06-43.c: 65: }
;K06-43.c: 66: }
;K06-43.c: 68: if((struct_TimerTick.flag_15mStick ) == 1)
	btfss	(_struct_TimerTick),3
	goto	u2691
	goto	u2690
u2691:
	goto	l1695
u2690:
	line	70
	
l6898:	
;K06-43.c: 69: {
;K06-43.c: 70: (struct_TimerTick.flag_15mStick ) = 0;
	bcf	(_struct_TimerTick),3
	line	71
	
l1695:	
	line	73
;K06-43.c: 71: }
;K06-43.c: 73: if((struct_TimerTick.flag_20mStick ) == 1)
	btfss	(_struct_TimerTick),4
	goto	u2701
	goto	u2700
u2701:
	goto	l1696
u2700:
	line	75
	
l6900:	
;K06-43.c: 74: {
;K06-43.c: 75: (struct_TimerTick.flag_20mStick ) = 0;
	bcf	(_struct_TimerTick),4
	line	76
	
l1696:	
	line	78
;K06-43.c: 76: }
;K06-43.c: 78: if((struct_TimerTick.flag_50mStick ) == 1)
	btfss	(_struct_TimerTick),5
	goto	u2711
	goto	u2710
u2711:
	goto	l1697
u2710:
	line	80
	
l6902:	
;K06-43.c: 79: {
;K06-43.c: 80: (struct_TimerTick.flag_50mStick ) = 0;
	bcf	(_struct_TimerTick),5
	line	81
	
l1697:	
	line	83
;K06-43.c: 81: }
;K06-43.c: 83: if((struct_TimerTick.flag_100mStick) == 1)
	btfss	(_struct_TimerTick),6
	goto	u2721
	goto	u2720
u2721:
	goto	l1699
u2720:
	line	85
	
l6904:	
;K06-43.c: 84: {
;K06-43.c: 85: (struct_TimerTick.flag_100mStick) = 0;
	bcf	(_struct_TimerTick),6
	line	87
	
l1699:	
	return
	opt stack 0
GLOBAL	__end_of_Apply
	__end_of_Apply:
	signat	_Apply,89
	global	_LEDScan

;; *************** function _LEDScan *****************
;; Defined at:
;;		line 7 in file "C:\Users\Administrator\Desktop\project\K06-43\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
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
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\LED.c"
	line	7
global __ptext5
__ptext5:	;psect for function _LEDScan
psect	text5
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\LED.c"
	line	7
	global	__size_of_LEDScan
	__size_of_LEDScan	equ	__end_of_LEDScan-_LEDScan
	
_LEDScan:	
;incstack = 0
	opt	stack 4
; Regs used in _LEDScan: [wreg-fsr0h+status,2+status,0]
	line	10
	
l6682:	
;LED.c: 9: static unsigned char LEDScanIndex=0;
;LED.c: 10: RC2=0; RC1=0; RC0=0; RE0=0; RA5=0; RA4=0; RA3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7	;volatile
	bcf	(57/8),(57)&7	;volatile
	bcf	(56/8),(56)&7	;volatile
	bcf	(72/8),(72)&7	;volatile
	bcf	(45/8),(45)&7	;volatile
	bcf	(44/8),(44)&7	;volatile
	bcf	(43/8),(43)&7	;volatile
	line	11
;LED.c: 11: RB6=1; RB7=1; RA0=1; RA1=1;
	bsf	(54/8),(54)&7	;volatile
	bsf	(55/8),(55)&7	;volatile
	bsf	(40/8),(40)&7	;volatile
	bsf	(41/8),(41)&7	;volatile
	line	12
;LED.c: 12: switch(LEDScanIndex)
	goto	l6748
	line	14
;LED.c: 13: {
;LED.c: 14: case 0:
	
l3449:	
	line	15
;LED.c: 15: if(LED_RAM[0]&0x01) RC2=1;
	btfss	(_LED_RAM),(0)&7
	goto	u2221
	goto	u2220
u2221:
	goto	l3450
u2220:
	
l6684:	
	bsf	(58/8),(58)&7	;volatile
	
l3450:	
	line	16
;LED.c: 16: if(LED_RAM[0]&0x02) RC1=1;
	btfss	(_LED_RAM),(1)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l3451
u2230:
	
l6686:	
	bsf	(57/8),(57)&7	;volatile
	
l3451:	
	line	17
;LED.c: 17: if(LED_RAM[0]&0x04) RC0=1;
	btfss	(_LED_RAM),(2)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l3452
u2240:
	
l6688:	
	bsf	(56/8),(56)&7	;volatile
	
l3452:	
	line	18
;LED.c: 18: if(LED_RAM[0]&0x08) RE0=1;
	btfss	(_LED_RAM),(3)&7
	goto	u2251
	goto	u2250
u2251:
	goto	l3453
u2250:
	
l6690:	
	bsf	(72/8),(72)&7	;volatile
	
l3453:	
	line	19
;LED.c: 19: if(LED_RAM[0]&0x10) RA5=1;
	btfss	(_LED_RAM),(4)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l3454
u2260:
	
l6692:	
	bsf	(45/8),(45)&7	;volatile
	
l3454:	
	line	20
;LED.c: 20: if(LED_RAM[0]&0x20) RA4=1;
	btfss	(_LED_RAM),(5)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l3455
u2270:
	
l6694:	
	bsf	(44/8),(44)&7	;volatile
	
l3455:	
	line	21
;LED.c: 21: if(LED_RAM[0]&0x40) RA3=1;
	btfss	(_LED_RAM),(6)&7
	goto	u2281
	goto	u2280
u2281:
	goto	l3456
u2280:
	
l6696:	
	bsf	(43/8),(43)&7	;volatile
	
l3456:	
	line	22
;LED.c: 22: if(LED_RAM[0]&0x80) RA2=1;
	btfss	(_LED_RAM),(7)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l3457
u2290:
	
l6698:	
	bsf	(42/8),(42)&7	;volatile
	
l3457:	
	line	23
;LED.c: 23: RB6=0;
	bcf	(54/8),(54)&7	;volatile
	line	24
;LED.c: 24: break;
	goto	l6750
	line	26
;LED.c: 26: case 1:
	
l3459:	
	line	27
;LED.c: 27: if(LED_RAM[1]&0x01) RC2=1;
	btfss	0+(_LED_RAM)+01h,(0)&7
	goto	u2301
	goto	u2300
u2301:
	goto	l3460
u2300:
	
l6700:	
	bsf	(58/8),(58)&7	;volatile
	
l3460:	
	line	28
;LED.c: 28: if(LED_RAM[1]&0x02) RC1=1;
	btfss	0+(_LED_RAM)+01h,(1)&7
	goto	u2311
	goto	u2310
u2311:
	goto	l3461
u2310:
	
l6702:	
	bsf	(57/8),(57)&7	;volatile
	
l3461:	
	line	29
;LED.c: 29: if(LED_RAM[1]&0x04) RC0=1;
	btfss	0+(_LED_RAM)+01h,(2)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l3462
u2320:
	
l6704:	
	bsf	(56/8),(56)&7	;volatile
	
l3462:	
	line	30
;LED.c: 30: if(LED_RAM[1]&0x08) RE0=1;
	btfss	0+(_LED_RAM)+01h,(3)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l3463
u2330:
	
l6706:	
	bsf	(72/8),(72)&7	;volatile
	
l3463:	
	line	31
;LED.c: 31: if(LED_RAM[1]&0x10) RA5=1;
	btfss	0+(_LED_RAM)+01h,(4)&7
	goto	u2341
	goto	u2340
u2341:
	goto	l3464
u2340:
	
l6708:	
	bsf	(45/8),(45)&7	;volatile
	
l3464:	
	line	32
;LED.c: 32: if(LED_RAM[1]&0x20) RA4=1;
	btfss	0+(_LED_RAM)+01h,(5)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l3465
u2350:
	
l6710:	
	bsf	(44/8),(44)&7	;volatile
	
l3465:	
	line	33
;LED.c: 33: if(LED_RAM[1]&0x40) RA3=1;
	btfss	0+(_LED_RAM)+01h,(6)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l3466
u2360:
	
l6712:	
	bsf	(43/8),(43)&7	;volatile
	
l3466:	
	line	34
;LED.c: 34: if(LED_RAM[1]&0x80) RA2=1;
	btfss	0+(_LED_RAM)+01h,(7)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l3467
u2370:
	
l6714:	
	bsf	(42/8),(42)&7	;volatile
	
l3467:	
	line	35
;LED.c: 35: RB7=0;
	bcf	(55/8),(55)&7	;volatile
	line	36
;LED.c: 36: break;
	goto	l6750
	line	38
;LED.c: 38: case 2:
	
l3468:	
	line	39
;LED.c: 39: if(LED_RAM[2]&0x01) RC2=1;
	btfss	0+(_LED_RAM)+02h,(0)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l3469
u2380:
	
l6716:	
	bsf	(58/8),(58)&7	;volatile
	
l3469:	
	line	40
;LED.c: 40: if(LED_RAM[2]&0x02) RC1=1;
	btfss	0+(_LED_RAM)+02h,(1)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l3470
u2390:
	
l6718:	
	bsf	(57/8),(57)&7	;volatile
	
l3470:	
	line	41
;LED.c: 41: if(LED_RAM[2]&0x04) RC0=1;
	btfss	0+(_LED_RAM)+02h,(2)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l3471
u2400:
	
l6720:	
	bsf	(56/8),(56)&7	;volatile
	
l3471:	
	line	42
;LED.c: 42: if(LED_RAM[2]&0x08) RE0=1;
	btfss	0+(_LED_RAM)+02h,(3)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l3472
u2410:
	
l6722:	
	bsf	(72/8),(72)&7	;volatile
	
l3472:	
	line	43
;LED.c: 43: if(LED_RAM[2]&0x10) RA5=1;
	btfss	0+(_LED_RAM)+02h,(4)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l3473
u2420:
	
l6724:	
	bsf	(45/8),(45)&7	;volatile
	
l3473:	
	line	44
;LED.c: 44: if(LED_RAM[2]&0x20) RA4=1;
	btfss	0+(_LED_RAM)+02h,(5)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l3474
u2430:
	
l6726:	
	bsf	(44/8),(44)&7	;volatile
	
l3474:	
	line	45
;LED.c: 45: if(LED_RAM[2]&0x40) RA3=1;
	btfss	0+(_LED_RAM)+02h,(6)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l3475
u2440:
	
l6728:	
	bsf	(43/8),(43)&7	;volatile
	
l3475:	
	line	46
;LED.c: 46: if(LED_RAM[2]&0x80) RA2=1;
	btfss	0+(_LED_RAM)+02h,(7)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l3476
u2450:
	
l6730:	
	bsf	(42/8),(42)&7	;volatile
	
l3476:	
	line	47
;LED.c: 47: RA0=0;
	bcf	(40/8),(40)&7	;volatile
	line	48
;LED.c: 48: break;
	goto	l6750
	line	50
;LED.c: 50: case 3:
	
l3477:	
	line	51
;LED.c: 51: if(LED_RAM[3]&0x01) RC2=1;
	btfss	0+(_LED_RAM)+03h,(0)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l3478
u2460:
	
l6732:	
	bsf	(58/8),(58)&7	;volatile
	
l3478:	
	line	52
;LED.c: 52: if(LED_RAM[3]&0x02) RC1=1;
	btfss	0+(_LED_RAM)+03h,(1)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l3479
u2470:
	
l6734:	
	bsf	(57/8),(57)&7	;volatile
	
l3479:	
	line	53
;LED.c: 53: if(LED_RAM[3]&0x04) RC0=1;
	btfss	0+(_LED_RAM)+03h,(2)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l3480
u2480:
	
l6736:	
	bsf	(56/8),(56)&7	;volatile
	
l3480:	
	line	54
;LED.c: 54: if(LED_RAM[3]&0x08) RE0=1;
	btfss	0+(_LED_RAM)+03h,(3)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l3481
u2490:
	
l6738:	
	bsf	(72/8),(72)&7	;volatile
	
l3481:	
	line	55
;LED.c: 55: if(LED_RAM[3]&0x10) RA5=1;
	btfss	0+(_LED_RAM)+03h,(4)&7
	goto	u2501
	goto	u2500
u2501:
	goto	l3482
u2500:
	
l6740:	
	bsf	(45/8),(45)&7	;volatile
	
l3482:	
	line	56
;LED.c: 56: if(LED_RAM[3]&0x20) RA4=1;
	btfss	0+(_LED_RAM)+03h,(5)&7
	goto	u2511
	goto	u2510
u2511:
	goto	l3483
u2510:
	
l6742:	
	bsf	(44/8),(44)&7	;volatile
	
l3483:	
	line	57
;LED.c: 57: if(LED_RAM[3]&0x40) RA3=1;
	btfss	0+(_LED_RAM)+03h,(6)&7
	goto	u2521
	goto	u2520
u2521:
	goto	l3484
u2520:
	
l6744:	
	bsf	(43/8),(43)&7	;volatile
	
l3484:	
	line	58
;LED.c: 58: RA1=0;
	bcf	(41/8),(41)&7	;volatile
	line	59
;LED.c: 59: break;
	goto	l6750
	line	12
	
l6748:	
	movf	(LEDScan@LEDScanIndex),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           10     6 (fixed)
; simple_byte           13     7 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	4
	subwf	fsr,w
skipnc
goto l6750
movlw high(S6972)
movwf pclath
	movlw low(S6972)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S6972:
	ljmp	l3449
	ljmp	l3459
	ljmp	l3468
	ljmp	l3477
psect	text5

	line	61
	
l6750:	
;LED.c: 61: LEDScanIndex++;
	incf	(LEDScan@LEDScanIndex),f
	line	62
	
l6752:	
;LED.c: 62: if(LEDScanIndex>=4)
	movlw	low(04h)
	subwf	(LEDScan@LEDScanIndex),w
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l3486
u2530:
	line	64
	
l6754:	
;LED.c: 63: {
;LED.c: 64: LEDScanIndex=0;
	clrf	(LEDScan@LEDScanIndex)
	line	66
	
l3486:	
	return
	opt stack 0
GLOBAL	__end_of_LEDScan
	__end_of_LEDScan:
	signat	_LEDScan,89
	global	_KeyScan

;; *************** function _KeyScan *****************
;; Defined at:
;;		line 10 in file "C:\Users\Administrator\Desktop\project\K06-43\code\Key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       1       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\Key.c"
	line	10
global __ptext6
__ptext6:	;psect for function _KeyScan
psect	text6
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\Key.c"
	line	10
	global	__size_of_KeyScan
	__size_of_KeyScan	equ	__end_of_KeyScan-_KeyScan
	
_KeyScan:	
;incstack = 0
	opt	stack 4
; Regs used in _KeyScan: [wreg+status,2+status,0+btemp+1]
	line	12
	
l6184:	
;Key.c: 12: TRISB6=1,WPUB6=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7	;volatile
	bsf	(1198/8)^080h,(1198)&7	;volatile
	line	13
;Key.c: 13: TRISB7=1,WPUB7=1;
	bsf	(1079/8)^080h,(1079)&7	;volatile
	bsf	(1199/8)^080h,(1199)&7	;volatile
	line	14
# 14 "C:\Users\Administrator\Desktop\project\K06-43\code\Key.c"
nop ;# 
# 14 "C:\Users\Administrator\Desktop\project\K06-43\code\Key.c"
nop ;# 
psect	text6
	line	15
;Key.c: 15: if(RB6)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7	;volatile
	goto	u1211
	goto	u1210
u1211:
	goto	l2870
u1210:
	line	17
	
l6186:	
;Key.c: 16: {
;Key.c: 17: KeyInFlag=0;
	bcf	(_KeyInFlag/8),(_KeyInFlag)&7
	line	18
;Key.c: 18: }
	goto	l2871
	line	19
	
l2870:	
	line	21
;Key.c: 19: else
;Key.c: 20: {
;Key.c: 21: KeyInFlag=1;
	bsf	(_KeyInFlag/8),(_KeyInFlag)&7
	line	22
	
l2871:	
	line	23
;Key.c: 22: }
;Key.c: 23: if(RB7)
	btfss	(55/8),(55)&7	;volatile
	goto	u1221
	goto	u1220
u1221:
	goto	l2872
u1220:
	line	25
	
l6188:	
;Key.c: 24: {
;Key.c: 25: USBInFlag=0;
	bcf	(_USBInFlag/8),(_USBInFlag)&7
	line	26
;Key.c: 26: }
	goto	l2873
	line	27
	
l2872:	
	line	29
;Key.c: 27: else
;Key.c: 28: {
;Key.c: 29: USBInFlag=1;
	bsf	(_USBInFlag/8),(_USBInFlag)&7
	line	30
	
l2873:	
	line	31
# 31 "C:\Users\Administrator\Desktop\project\K06-43\code\Key.c"
nop ;# 
# 31 "C:\Users\Administrator\Desktop\project\K06-43\code\Key.c"
nop ;# 
psect	text6
	line	32
;Key.c: 32: TRISB6=0,WPUB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1078/8)^080h,(1078)&7	;volatile
	bcf	(1198/8)^080h,(1198)&7	;volatile
	line	33
;Key.c: 33: TRISB7=0,WPUB7=0;
	bcf	(1079/8)^080h,(1079)&7	;volatile
	bcf	(1199/8)^080h,(1199)&7	;volatile
	line	36
;Key.c: 36: if(KeyInFlag&&KeyCnt<10&&KeyInBuf==KeyInFlag&&!KeyLock)
	btfss	(_KeyInFlag/8),(_KeyInFlag)&7
	goto	u1231
	goto	u1230
u1231:
	goto	l2874
u1230:
	
l6190:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipnc
	goto	u1241
	goto	u1240
u1241:
	goto	l2874
u1240:
	
l6192:	
	btfsc	(_KeyInFlag/8),(_KeyInFlag)&7
	goto	u1251
	goto	u1250
u1251:
	movlw	1
	goto	u1252
u1250:
	movlw	0
u1252:
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u1261
	goto	u1260
u1261:
	movlw	1
	goto	u1262
u1260:
	movlw	0
u1262:
	xorwf	(??_KeyScan+0)+0,w
	skipz
	goto	u1271
	goto	u1270
u1271:
	goto	l2874
u1270:
	
l6194:	
	btfsc	(_KeyLock/8),(_KeyLock)&7
	goto	u1281
	goto	u1280
u1281:
	goto	l2874
u1280:
	line	38
	
l6196:	
;Key.c: 37: {
;Key.c: 38: KeyCnt++;
	incf	(_KeyCnt),f
	skipnz
	incf	(_KeyCnt+1),f
	line	39
	
l6198:	
;Key.c: 39: if(KeyCnt>=10)
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u1291
	goto	u1290
u1291:
	goto	l2876
u1290:
	line	41
	
l6200:	
;Key.c: 40: {
;Key.c: 41: KeyLock=1;
	bsf	(_KeyLock/8),(_KeyLock)&7
	line	42
;Key.c: 42: KeyFlag=1;
	bsf	(_KeyFlag/8),(_KeyFlag)&7
	goto	l2876
	line	45
	
l2874:	
;Key.c: 45: else if(KeyInFlag&&KeyCnt>=10&&KeyInBuf==KeyInFlag)
	btfss	(_KeyInFlag/8),(_KeyInFlag)&7
	goto	u1301
	goto	u1300
u1301:
	goto	l2877
u1300:
	
l6202:	
	movlw	0
	subwf	(_KeyCnt+1),w
	movlw	0Ah
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u1311
	goto	u1310
u1311:
	goto	l2877
u1310:
	
l6204:	
	btfsc	(_KeyInFlag/8),(_KeyInFlag)&7
	goto	u1321
	goto	u1320
u1321:
	movlw	1
	goto	u1322
u1320:
	movlw	0
u1322:
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u1331
	goto	u1330
u1331:
	movlw	1
	goto	u1332
u1330:
	movlw	0
u1332:
	xorwf	(??_KeyScan+0)+0,w
	skipz
	goto	u1341
	goto	u1340
u1341:
	goto	l2877
u1340:
	line	47
	
l6206:	
;Key.c: 46: {
;Key.c: 47: KeyCnt++;
	incf	(_KeyCnt),f
	skipnz
	incf	(_KeyCnt+1),f
	line	48
	
l6208:	
;Key.c: 48: if(KeyCnt>=500)
	movlw	01h
	subwf	(_KeyCnt+1),w
	movlw	0F4h
	skipnz
	subwf	(_KeyCnt),w
	skipc
	goto	u1351
	goto	u1350
u1351:
	goto	l2876
u1350:
	line	50
	
l6210:	
;Key.c: 49: {
;Key.c: 50: KeyCnt=500;
	movlw	0F4h
	movwf	(_KeyCnt)
	movlw	01h
	movwf	((_KeyCnt))+1
	line	51
	
l6212:	
;Key.c: 52: KeyLongFlag=1;
	bcf	(_KeyFlag/8),(_KeyFlag)&7
	goto	l2876
	line	55
	
l2877:	
;Key.c: 55: else if(!KeyInFlag||KeyInBuf!=KeyInFlag)
	btfss	(_KeyInFlag/8),(_KeyInFlag)&7
	goto	u1361
	goto	u1360
u1361:
	goto	l6216
u1360:
	
l6214:	
	btfsc	(_KeyInFlag/8),(_KeyInFlag)&7
	goto	u1371
	goto	u1370
u1371:
	movlw	1
	goto	u1372
u1370:
	movlw	0
u1372:
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_KeyScan+0)+0
	btfsc	(_KeyInBuf/8),(_KeyInBuf)&7
	goto	u1381
	goto	u1380
u1381:
	movlw	1
	goto	u1382
u1380:
	movlw	0
u1382:
	xorwf	(??_KeyScan+0)+0,w
	skipnz
	goto	u1391
	goto	u1390
u1391:
	goto	l2876
u1390:
	line	57
	
l6216:	
;Key.c: 56: {
;Key.c: 57: KeyCnt=0;
	clrf	(_KeyCnt)
	clrf	(_KeyCnt+1)
	line	58
	
l6218:	
;Key.c: 59: KeyLongFlag=0;
	bcf	(_KeyLock/8),(_KeyLock)&7
	line	60
	
l6220:	
;Key.c: 60: if(KeyFlag==1)
	btfss	(_KeyFlag/8),(_KeyFlag)&7
	goto	u1401
	goto	u1400
u1401:
	goto	l2876
u1400:
	goto	l6212
	line	66
	
l2876:	
;Key.c: 64: }
;Key.c: 65: }
;Key.c: 66: KeyInBuf=KeyInFlag;
	bcf	(_KeyInBuf/8),(_KeyInBuf)&7
	btfss	(_KeyInFlag/8),(_KeyInFlag)&7
	goto	u1415
	bsf	(_KeyInBuf/8),(_KeyInBuf)&7
u1415:

	line	69
;Key.c: 69: if(USBInFlag&&!USBLock)
	btfss	(_USBInFlag/8),(_USBInFlag)&7
	goto	u1421
	goto	u1420
u1421:
	goto	l2884
u1420:
	
l6224:	
	btfsc	(_USBLock/8),(_USBLock)&7
	goto	u1431
	goto	u1430
u1431:
	goto	l2884
u1430:
	line	71
	
l6226:	
;Key.c: 70: {
;Key.c: 71: USBCnt++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(_USBCnt),f
	skipnz
	incf	(_USBCnt+1),f
	line	72
	
l6228:	
;Key.c: 72: if(USBCnt>=100)
	movf	(_USBCnt+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u1445
	movlw	064h
	subwf	(_USBCnt),w
u1445:

	skipc
	goto	u1441
	goto	u1440
u1441:
	goto	l2889
u1440:
	line	74
	
l6230:	
;Key.c: 73: {
;Key.c: 74: USBCnt=250;
	movlw	0FAh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_USBCnt)
	clrf	(_USBCnt+1)
	line	75
	
l6232:	
;Key.c: 75: USBFlag=1;
	bsf	(_USBFlag/8),(_USBFlag)&7
	line	76
	
l6234:	
;Key.c: 76: USBLock=1;
	bsf	(_USBLock/8),(_USBLock)&7
	line	77
	
l6236:	
;Key.c: 77: AllLedFlag=1;
	bsf	(_AllLedFlag/8),(_AllLedFlag)&7
	goto	l2889
	line	80
	
l2884:	
;Key.c: 80: else if(!USBInFlag)
	btfsc	(_USBInFlag/8),(_USBInFlag)&7
	goto	u1451
	goto	u1450
u1451:
	goto	l2889
u1450:
	line	82
	
l6238:	
;Key.c: 81: {
;Key.c: 82: USBCnt--;
	movlw	-1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_USBCnt),f
	skipc
	decf	(_USBCnt+1),f
	line	83
	
l6240:	
;Key.c: 83: if(USBCnt<=0)
	movf	(_USBCnt+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u1465
	movlw	01h
	subwf	(_USBCnt),w
u1465:

	skipnc
	goto	u1461
	goto	u1460
u1461:
	goto	l2889
u1460:
	line	85
	
l6242:	
;Key.c: 84: {
;Key.c: 85: USBCnt=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_USBCnt)
	clrf	(_USBCnt+1)
	line	86
	
l6244:	
;Key.c: 86: USBFlag=0;
	bcf	(_USBFlag/8),(_USBFlag)&7
	line	87
	
l6246:	
;Key.c: 87: USBLock=0;
	bcf	(_USBLock/8),(_USBLock)&7
	line	90
	
l2889:	
	return
	opt stack 0
GLOBAL	__end_of_KeyScan
	__end_of_KeyScan:
	signat	_KeyScan,89
	global	_ChargePro

;; *************** function _ChargePro *****************
;; Defined at:
;;		line 3 in file "C:\Users\Administrator\Desktop\project\K06-43\code\Charge.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
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
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\Charge.c"
	line	3
global __ptext7
__ptext7:	;psect for function _ChargePro
psect	text7
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\Charge.c"
	line	3
	global	__size_of_ChargePro
	__size_of_ChargePro	equ	__end_of_ChargePro-_ChargePro
	
_ChargePro:	
;incstack = 0
	opt	stack 4
; Regs used in _ChargePro: []
	line	5
	
l6806:	
	line	9
	
l5160:	
	return
	opt stack 0
GLOBAL	__end_of_ChargePro
	__end_of_ChargePro:
	signat	_ChargePro,89
	global	_BeepPro

;; *************** function _BeepPro *****************
;; Defined at:
;;		line 6 in file "C:\Users\Administrator\Desktop\project\K06-43\code\Beep.c"
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
;;		_Apply
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\Beep.c"
	line	6
global __ptext8
__ptext8:	;psect for function _BeepPro
psect	text8
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\Beep.c"
	line	6
	global	__size_of_BeepPro
	__size_of_BeepPro	equ	__end_of_BeepPro-_BeepPro
	
_BeepPro:	
;incstack = 0
	opt	stack 4
; Regs used in _BeepPro: [wreg+status,2+status,0]
	line	8
	
l6788:	
;Beep.c: 8: if(BeepCnt!=0)
	movf	((_BeepCnt)),w
	btfsc	status,2
	goto	u2551
	goto	u2550
u2551:
	goto	l4610
u2550:
	line	10
	
l6790:	
;Beep.c: 9: {
;Beep.c: 10: if(BeepFlag)
	btfss	(_BeepFlag/8),(_BeepFlag)&7
	goto	u2561
	goto	u2560
u2561:
	goto	l4611
u2560:
	line	12
	
l6792:	
;Beep.c: 11: {
;Beep.c: 12: RB4=1;
	bsf	(52/8),(52)&7	;volatile
	line	13
;Beep.c: 13: }
	goto	l6794
	line	14
	
l4611:	
	line	16
;Beep.c: 14: else
;Beep.c: 15: {
;Beep.c: 16: RB4=0;
	bcf	(52/8),(52)&7	;volatile
	line	18
	
l6794:	
;Beep.c: 17: }
;Beep.c: 18: BeepTemp++;
	incf	(_BeepTemp),f
	line	19
	
l6796:	
;Beep.c: 19: if(BeepTemp>BeepSpeed)
	movlw	low(033h)
	subwf	(_BeepTemp),w
	skipc
	goto	u2571
	goto	u2570
u2571:
	goto	l4616
u2570:
	line	21
	
l6798:	
;Beep.c: 20: {
;Beep.c: 21: BeepTemp=0;
	clrf	(_BeepTemp)
	line	22
	
l6800:	
;Beep.c: 22: BeepFlag=~BeepFlag;
	movlw	1<<((_BeepFlag)&7)
	xorwf	((_BeepFlag)/8),f
	line	23
	
l6802:	
;Beep.c: 23: if(!BeepFlag)
	btfsc	(_BeepFlag/8),(_BeepFlag)&7
	goto	u2581
	goto	u2580
u2581:
	goto	l4616
u2580:
	line	25
	
l6804:	
;Beep.c: 24: {
;Beep.c: 25: BeepCnt--;
	decf	(_BeepCnt),f
	goto	l4616
	line	29
	
l4610:	
	line	31
;Beep.c: 29: else
;Beep.c: 30: {
;Beep.c: 31: BeepFlag=1;
	bsf	(_BeepFlag/8),(_BeepFlag)&7
	line	34
	
l4616:	
	return
	opt stack 0
GLOBAL	__end_of_BeepPro
	__end_of_BeepPro:
	signat	_BeepPro,89
	global	_ADCPro

;; *************** function _ADCPro *****************
;; Defined at:
;;		line 9 in file "C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
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
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
	line	9
global __ptext9
__ptext9:	;psect for function _ADCPro
psect	text9
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
	line	9
	global	__size_of_ADCPro
	__size_of_ADCPro	equ	__end_of_ADCPro-_ADCPro
	
_ADCPro:	
;incstack = 0
	opt	stack 2
; Regs used in _ADCPro: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	11
	
l6760:	
;ADC.c: 11: switch (ADCState)
	goto	l6770
	line	14
	
l6762:	
;ADC.c: 14: ADCRead(0b00001111,ADCModule,ADCVal);
	movf	(_ADCModule+3),w
	movwf	(ADCRead@Module+3)
	movf	(_ADCModule+2),w
	movwf	(ADCRead@Module+2)
	movf	(_ADCModule+1),w
	movwf	(ADCRead@Module+1)
	movf	(_ADCModule),w
	movwf	(ADCRead@Module)

	movlw	(low(_ADCVal|((0x0)<<8)))&0ffh
	movwf	(ADCRead@Val)
	movlw	low(0Fh)
	fcall	_ADCRead
	line	15
;ADC.c: 15: break;
	goto	l6772
	line	18
	
l6764:	
;ADC.c: 18: ADCRead(0b00001010,ADCModule,ADCVal+1);
	movf	(_ADCModule+3),w
	movwf	(ADCRead@Module+3)
	movf	(_ADCModule+2),w
	movwf	(ADCRead@Module+2)
	movf	(_ADCModule+1),w
	movwf	(ADCRead@Module+1)
	movf	(_ADCModule),w
	movwf	(ADCRead@Module)

	movlw	(low(_ADCVal|((0x0)<<8)+02h))&0ffh
	movwf	(ADCRead@Val)
	movlw	low(0Ah)
	fcall	_ADCRead
	line	19
;ADC.c: 19: break;
	goto	l6772
	line	22
	
l6766:	
;ADC.c: 22: ADCRead(0b00001000,ADCModule,ADCVal+2);
	movf	(_ADCModule+3),w
	movwf	(ADCRead@Module+3)
	movf	(_ADCModule+2),w
	movwf	(ADCRead@Module+2)
	movf	(_ADCModule+1),w
	movwf	(ADCRead@Module+1)
	movf	(_ADCModule),w
	movwf	(ADCRead@Module)

	movlw	(low(_ADCVal|((0x0)<<8)+04h))&0ffh
	movwf	(ADCRead@Val)
	movlw	low(08h)
	fcall	_ADCRead
	line	23
;ADC.c: 23: break;
	goto	l6772
	line	11
	
l6770:	
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
goto l6772
movlw high(S6974)
movwf pclath
	movlw low(S6974)
	addwf fsr,w
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S6974:
	ljmp	l6762
	ljmp	l6764
	ljmp	l6766
psect	text9

	line	28
	
l6772:	
;ADC.c: 29: {
;ADC.c: 30: BatPercent=0;
	movlw	01h
	subwf	1+(_ADCVal)+04h,w
	movlw	0Bh
	skipnz
	subwf	0+(_ADCVal)+04h,w
	skipnc
	goto	u2541
	goto	u2540
u2541:
	goto	l6776
u2540:
	goto	l2283
	line	32
	
l6776:	
	line	48
	
l2283:	
	return
	opt stack 0
GLOBAL	__end_of_ADCPro
	__end_of_ADCPro:
	signat	_ADCPro,89
	global	_ADCRead

;; *************** function _ADCRead *****************
;; Defined at:
;;		line 50 in file "C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;;  Module          4   13[BANK0 ] struct .
;;  Val             1   17[BANK0 ] PTR unsigned int 
;;		 -> ADCVal(6), 
;; Auto vars:     Size  Location     Type
;;  ch              1   28[BANK0 ] unsigned char 
;;  ad_temp         2   33[BANK0 ] unsigned int 
;;  AD_L            2   31[BANK0 ] unsigned int 
;;  AD_H            2   29[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       5       0
;;      Locals:         0       7       0
;;      Temps:          0      10       0
;;      Totals:         0      22       0
;;Total ram usage:       22 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ADSample
;;		___lwdiv
;;		___wmul
;; This function is called by:
;;		_ADCPro
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	line	50
global __ptext10
__ptext10:	;psect for function _ADCRead
psect	text10
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
	line	50
	global	__size_of_ADCRead
	__size_of_ADCRead	equ	__end_of_ADCRead-_ADCRead
	
_ADCRead:	
;incstack = 0
	opt	stack 2
; Regs used in _ADCRead: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;ADCRead@ch stored from wreg
	movwf	(ADCRead@ch)
	line	54
	
l6634:	
;ADC.c: 52: unsigned int ad_temp,AD_H,AD_L;
;ADC.c: 54: if(ADSample(ch))
	movf	(ADCRead@ch),w
	fcall	_ADSample
	xorlw	0
	skipnz
	goto	u2151
	goto	u2150
u2151:
	goto	l2298
u2150:
	line	56
	
l6636:	
;ADC.c: 55: {
;ADC.c: 56: AD_H=ADRESH;
	movf	(30),w	;volatile
	movwf	(ADCRead@AD_H)
	clrf	(ADCRead@AD_H+1)
	line	57
;ADC.c: 57: AD_L=ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(ADCRead@AD_L)
	clrf	(ADCRead@AD_L+1)
	line	58
;ADC.c: 58: ad_temp=(AD_H<<4)|(AD_L>>4);
	movf	(ADCRead@AD_H+1),w
	movwf	(??_ADCRead+0)+0+1
	movf	(ADCRead@AD_H),w
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
	movwf	(ADCRead@ad_temp)
	movf	1+(??_ADCRead+0)+0,w
	movwf	(ADCRead@ad_temp+1)
	
l6638:	
	movf	(ADCRead@AD_L+1),w
	movwf	(??_ADCRead+0)+0+1
	movf	(ADCRead@AD_L),w
	movwf	(??_ADCRead+0)+0
	movlw	04h
u2165:
	clrc
	rrf	(??_ADCRead+0)+1,f
	rrf	(??_ADCRead+0)+0,f
	addlw	-1
	skipz
	goto	u2165
	movf	0+(??_ADCRead+0)+0,w
	iorwf	(ADCRead@ad_temp),f
	movf	1+(??_ADCRead+0)+0,w
	iorwf	(ADCRead@ad_temp+1),f
	line	60
	
l6640:	
;ADC.c: 60: if(*Module.ADCCnt==0)
	movf	(0+low(ADCRead@Module|((0x0)<<8)+03h)),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	(indf),w
	btfss	status,2
	goto	u2171
	goto	u2170
u2171:
	goto	l6644
u2170:
	line	62
	
l6642:	
;ADC.c: 61: {
;ADC.c: 62: *Module.ADCmax = 0x0000;
	movf	(ADCRead@Module),w
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	63
;ADC.c: 63: *Module.ADCmin = 0xffff;
	movf	(0+low(ADCRead@Module|((0x0)<<8)+01h)),w
	movwf	fsr0
	movlw	0FFh
	movwf	indf
	incf	fsr0,f
	movlw	0FFh
	movwf	indf
	line	64
;ADC.c: 64: *Module.ADCSum = 0;
	movf	(0+low(ADCRead@Module|((0x0)<<8)+02h)),w
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	66
	
l6644:	
;ADC.c: 65: }
;ADC.c: 66: if(ad_temp > *Module.ADCmax)
	movf	(ADCRead@Module),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_ADCRead+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADCRead+0)+0+1
	movf	(ADCRead@ad_temp+1),w
	subwf	1+(??_ADCRead+0)+0,w
	skipz
	goto	u2185
	movf	(ADCRead@ad_temp),w
	subwf	0+(??_ADCRead+0)+0,w
u2185:
	skipnc
	goto	u2181
	goto	u2180
u2181:
	goto	l2288
u2180:
	line	68
	
l6646:	
;ADC.c: 67: {
;ADC.c: 68: *Module.ADCmax = ad_temp;
	movf	(ADCRead@Module),w
	movwf	fsr0
	movf	(ADCRead@ad_temp),w
	movwf	indf
	incf	fsr0,f
	movf	(ADCRead@ad_temp+1),w
	movwf	indf
	line	69
	
l2288:	
	line	70
;ADC.c: 69: }
;ADC.c: 70: if(ad_temp < *Module.ADCmin)
	movf	(0+low(ADCRead@Module|((0x0)<<8)+01h)),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_ADCRead+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADCRead+0)+0+1
	movf	1+(??_ADCRead+0)+0,w
	subwf	(ADCRead@ad_temp+1),w
	skipz
	goto	u2195
	movf	0+(??_ADCRead+0)+0,w
	subwf	(ADCRead@ad_temp),w
u2195:
	skipnc
	goto	u2191
	goto	u2190
u2191:
	goto	l6650
u2190:
	line	72
	
l6648:	
;ADC.c: 71: {
;ADC.c: 72: *Module.ADCmin = ad_temp;
	movf	(0+low(ADCRead@Module|((0x0)<<8)+01h)),w
	movwf	fsr0
	movf	(ADCRead@ad_temp),w
	movwf	indf
	incf	fsr0,f
	movf	(ADCRead@ad_temp+1),w
	movwf	indf
	line	75
	
l6650:	
;ADC.c: 73: }
;ADC.c: 75: *Module.ADCSum += ad_temp;
	movf	(0+low(ADCRead@Module|((0x0)<<8)+02h)),w
	movwf	fsr0
	movf	(ADCRead@ad_temp),w
	addwf	indf,f
	incfsz	fsr0,f
	movf	indf,w
	skipnc
	incf	indf,w
	movwf	btemp+1
	movf	(ADCRead@ad_temp+1),w
	addwf	btemp+1,w
	movwf	indf
	decf	fsr0,f
	line	76
	
l6652:	
;ADC.c: 76: (*Module.ADCCnt)++;
	movf	(0+low(ADCRead@Module|((0x0)<<8)+03h)),w
	movwf	fsr0
	incf	indf,f
	line	77
	
l6654:	
;ADC.c: 77: if(*Module.ADCCnt >= 10)
	movf	(0+low(ADCRead@Module|((0x0)<<8)+03h)),w
	movwf	fsr0
	movlw	low(0Ah)
	subwf	indf,w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l2298
u2200:
	line	79
	
l6656:	
;ADC.c: 78: {
;ADC.c: 79: *Module.ADCCnt = 0;
	movf	(0+low(ADCRead@Module|((0x0)<<8)+03h)),w
	movwf	fsr0
	clrf	indf
	line	80
	
l6658:	
;ADC.c: 80: *Module.ADCSum = *Module.ADCSum - *Module.ADCmax - *Module.ADCmin;
	movf	(0+low(ADCRead@Module|((0x0)<<8)+02h)),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_ADCRead+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADCRead+0)+0+1
	movf	(0+low(ADCRead@Module|((0x0)<<8)+01h)),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_ADCRead+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADCRead+2)+0+1
	movf	(ADCRead@Module),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_ADCRead+4)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADCRead+4)+0+1
	comf	(??_ADCRead+4)+0,f
	comf	(??_ADCRead+4)+1,f
	incf	(??_ADCRead+4)+0,f
	skipnz
	incf	(??_ADCRead+4)+1,f
	movf	0+(??_ADCRead+2)+0,w
	subwf	0+(??_ADCRead+4)+0,w
	movwf	(??_ADCRead+6)+0
	movf	1+(??_ADCRead+2)+0,w
	skipc
	incf	1+(??_ADCRead+2)+0,w
	subwf	1+(??_ADCRead+4)+0,w
	movwf	1+(??_ADCRead+6)+0
	movf	0+(??_ADCRead+0)+0,w
	addwf	0+(??_ADCRead+6)+0,w
	movwf	(??_ADCRead+8)+0
	movf	1+(??_ADCRead+0)+0,w
	skipnc
	incf	1+(??_ADCRead+0)+0,w
	addwf	1+(??_ADCRead+6)+0,w
	movwf	1+(??_ADCRead+8)+0
	movf	(0+low(ADCRead@Module|((0x0)<<8)+02h)),w
	movwf	fsr0
	movf	0+(??_ADCRead+8)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_ADCRead+8)+0,w
	movwf	indf
	line	81
	
l6660:	
;ADC.c: 81: *Module.ADCSum = *Module.ADCSum >> 3;
	movf	(0+low(ADCRead@Module|((0x0)<<8)+02h)),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_ADCRead+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADCRead+0)+0+1
	clrc
	rrf	(??_ADCRead+0)+1,f
	rrf	(??_ADCRead+0)+0,f
	clrc
	rrf	(??_ADCRead+0)+1,f
	rrf	(??_ADCRead+0)+0,f
	clrc
	rrf	(??_ADCRead+0)+1,f
	rrf	(??_ADCRead+0)+0,f
	movf	(0+low(ADCRead@Module|((0x0)<<8)+02h)),w
	movwf	fsr0
	movf	0+(??_ADCRead+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_ADCRead+0)+0,w
	movwf	indf
	line	82
;ADC.c: 82: switch (ADCState)
	goto	l6670
	line	85
	
l6662:	
;ADC.c: 85: *Val=*Module.ADCSum;
	movf	(0+low(ADCRead@Module|((0x0)<<8)+02h)),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_ADCRead+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ADCRead+0)+0+1
	movf	(ADCRead@Val),w
	movwf	fsr0
	movf	0+(??_ADCRead+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_ADCRead+0)+0,w
	movwf	indf
	line	86
;ADC.c: 86: break;
	goto	l6672
	line	89
	
l6664:	
;ADC.c: 89: *Val=(*Module.ADCSum)*1000/(*(Val-1));
	movf	(ADCRead@Val),w
	addlw	-2
	movwf	fsr0
	movf	indf,w
	movwf	(___lwdiv@divisor)
	incf	fsr0,f
	movf	indf,w
	movwf	(___lwdiv@divisor+1)
	movf	(0+low(ADCRead@Module|((0x0)<<8)+02h)),w
	movwf	fsr0
	movf	indf,w
	movwf	(___wmul@multiplier)
	incf	fsr0,f
	movf	indf,w
	movwf	(___wmul@multiplier+1)
	movlw	0E8h
	movwf	(___wmul@multiplicand)
	movlw	03h
	movwf	((___wmul@multiplicand))+1
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(___lwdiv@dividend+1)
	movf	(0+(?___wmul)),w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(ADCRead@Val),w
	movwf	fsr0
	movf	(0+(?___lwdiv)),w
	movwf	indf
	incf	fsr0,f
	movf	(1+(?___lwdiv)),w
	movwf	indf
	line	90
;ADC.c: 90: break;
	goto	l6672
	line	93
	
l6666:	
;ADC.c: 93: *Val=(*Module.ADCSum)*100/(*(Val-2));
	movf	(ADCRead@Val),w
	addlw	-4
	movwf	fsr0
	movf	indf,w
	movwf	(___lwdiv@divisor)
	incf	fsr0,f
	movf	indf,w
	movwf	(___lwdiv@divisor+1)
	movf	(0+low(ADCRead@Module|((0x0)<<8)+02h)),w
	movwf	fsr0
	movf	indf,w
	movwf	(___wmul@multiplier)
	incf	fsr0,f
	movf	indf,w
	movwf	(___wmul@multiplier+1)
	movlw	064h
	movwf	(___wmul@multiplicand)
	clrf	(___wmul@multiplicand+1)
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(___lwdiv@dividend+1)
	movf	(0+(?___wmul)),w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(ADCRead@Val),w
	movwf	fsr0
	movf	(0+(?___lwdiv)),w
	movwf	indf
	incf	fsr0,f
	movf	(1+(?___lwdiv)),w
	movwf	indf
	line	94
;ADC.c: 94: break;
	goto	l6672
	line	82
	
l6670:	
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
goto l6672
movlw high(S6976)
movwf pclath
	movlw low(S6976)
	addwf fsr,w
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S6976:
	ljmp	l6662
	ljmp	l6664
	ljmp	l6666
psect	text10

	line	99
	
l6672:	
;ADC.c: 99: ADCState++;
	incf	(_ADCState),f
	line	100
	
l6674:	
;ADC.c: 100: if(ADCState==3)
		movlw	3
	xorwf	((_ADCState)),w
	btfss	status,2
	goto	u2211
	goto	u2210
u2211:
	goto	l2298
u2210:
	line	102
	
l6676:	
;ADC.c: 101: {
;ADC.c: 102: ADCState=0;
	clrf	(_ADCState)
	line	106
	
l2298:	
	return
	opt stack 0
GLOBAL	__end_of_ADCRead
	__end_of_ADCRead:
	signat	_ADCRead,12409
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[BANK0 ] unsigned int 
;;  multiplicand    2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCRead
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul16.c"
	line	15
global __ptext11
__ptext11:	;psect for function ___wmul
psect	text11
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul16.c"
	line	15
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
;incstack = 0
	opt	stack 2
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	43
	
l6592:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	45
	
l6594:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2091
	goto	u2090
u2091:
	goto	l6598
u2090:
	line	46
	
l6596:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	47
	
l6598:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	48
	
l6600:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	49
	
l6602:	
	movf	((___wmul@multiplier)),w
iorwf	((___wmul@multiplier+1)),w
	btfss	status,2
	goto	u2101
	goto	u2100
u2101:
	goto	l6594
u2100:
	line	52
	
l6604:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	53
	
l5166:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 6 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[BANK0 ] unsigned int 
;;  dividend        2    8[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   11[BANK0 ] unsigned int 
;;  counter         1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCRead
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
	line	6
global __ptext12
__ptext12:	;psect for function ___lwdiv
psect	text12
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l6608:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
l6610:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u2111
	goto	u2110
u2111:
	goto	l6630
u2110:
	line	16
	
l6612:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	l6616
	line	18
	
l6614:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	19
	incf	(___lwdiv@counter),f
	line	17
	
l6616:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2121
	goto	u2120
u2121:
	goto	l6614
u2120:
	line	22
	
l6618:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	23
	
l6620:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2135
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2135:
	skipc
	goto	u2131
	goto	u2130
u2131:
	goto	l6626
u2130:
	line	24
	
l6622:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
l6624:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	27
	
l6626:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	28
	
l6628:	
	decfsz	(___lwdiv@counter),f
	goto	u2141
	goto	u2140
u2141:
	goto	l6618
u2140:
	line	30
	
l6630:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	31
	
l5503:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_ADSample

;; *************** function _ADSample *****************
;; Defined at:
;;		line 115 in file "C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    1[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] volatile unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCRead
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
	line	115
global __ptext13
__ptext13:	;psect for function _ADSample
psect	text13
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
	line	115
	global	__size_of_ADSample
	__size_of_ADSample	equ	__end_of_ADSample-_ADSample
	
_ADSample:	
;incstack = 0
	opt	stack 2
; Regs used in _ADSample: [wreg+status,2+status,0]
;ADSample@ch stored from wreg
	movwf	(ADSample@ch)
	line	117
	
l6078:	
;ADC.c: 117: ADCON1 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	118
	
l6080:	
;ADC.c: 118: ADCON0 = 0X41 | ( ch << 2);
	bcf	status, 5	;RP0=0, select bank0
	movf	(ADSample@ch),w
	movwf	(??_ADSample+0)+0
	movlw	(02h)-1
u1055:
	clrc
	rlf	(??_ADSample+0)+0,f
	addlw	-1
	skipz
	goto	u1055
	clrc
	rlf	(??_ADSample+0)+0,w
	iorlw	041h
	movwf	(31)	;volatile
	line	119
# 119 "C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
nop ;# 
	line	120
# 120 "C:\Users\Administrator\Desktop\project\K06-43\code\ADC.c"
nop ;# 
psect	text13
	line	121
	
l6082:	
;ADC.c: 121: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7	;volatile
	line	122
	
l6084:	
;ADC.c: 122: volatile unsigned char i = 0;
	clrf	(ADSample@i)	;volatile
	line	123
;ADC.c: 123: while(GODONE)
	goto	l2301
	
l2302:	
	line	125
;ADC.c: 124: {
;ADC.c: 125: if(0 == (--i))
	decfsz	(ADSample@i),f	;volatile
	goto	u1061
	goto	u1060
u1061:
	goto	l2301
u1060:
	line	126
	
l6086:	
;ADC.c: 126: return 0;
	movlw	low(0)
	goto	l2304
	line	127
	
l2301:	
	line	123
	btfsc	(249/8),(249)&7	;volatile
	goto	u1071
	goto	u1070
u1071:
	goto	l2302
u1070:
	line	128
	
l6090:	
;ADC.c: 127: }
;ADC.c: 128: return 1;
	movlw	low(01h)
	line	129
	
l2304:	
	return
	opt stack 0
GLOBAL	__end_of_ADSample
	__end_of_ADSample:
	signat	_ADSample,4217
	global	_Isr_Timer

;; *************** function _Isr_Timer *****************
;; Defined at:
;;		line 6 in file "C:\Users\Administrator\Desktop\project\K06-43\code\even.c"
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
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwmod
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\even.c"
	line	6
global __ptext14
__ptext14:	;psect for function _Isr_Timer
psect	text14
	file	"C:\Users\Administrator\Desktop\project\K06-43\code\even.c"
	line	6
	global	__size_of_Isr_Timer
	__size_of_Isr_Timer	equ	__end_of_Isr_Timer-_Isr_Timer
	
_Isr_Timer:	
;incstack = 0
	opt	stack 2
; Regs used in _Isr_Timer: [wreg+status,2+status,0+pclath+cstack]
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
	movf	pclath,w
	movwf	(??_Isr_Timer+1)
	ljmp	_Isr_Timer
psect	text14
	line	8
	
i1l6498:	
;even.c: 8: TMR1IF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(96/8),(96)&7	;volatile
	line	9
	
i1l6500:	
;even.c: 9: TimerTick++;
	incf	(_TimerTick),f
	skipnz
	incf	(_TimerTick+1),f
	line	10
	
i1l6502:	
;even.c: 10: if(TimerTick % 2 == 0)
	btfsc	(_TimerTick),(0)&7
	goto	u202_21
	goto	u202_20
u202_21:
	goto	i1l6506
u202_20:
	line	12
	
i1l6504:	
;even.c: 11: {
;even.c: 12: struct_TimerTick.flag_2mStick = 1;
	bsf	(_struct_TimerTick),0
	line	14
	
i1l6506:	
;even.c: 13: }
;even.c: 14: if(TimerTick % 5 == 0)
	movlw	05h
	movwf	(___lwmod@divisor)
	clrf	(___lwmod@divisor+1)
	movf	(_TimerTick+1),w
	movwf	(___lwmod@dividend+1)
	movf	(_TimerTick),w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	((0+(?___lwmod))),w
iorwf	((1+(?___lwmod))),w
	btfss	status,2
	goto	u203_21
	goto	u203_20
u203_21:
	goto	i1l6510
u203_20:
	line	16
	
i1l6508:	
;even.c: 15: {
;even.c: 16: struct_TimerTick.flag_5mStick = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_struct_TimerTick),1
	line	18
	
i1l6510:	
;even.c: 17: }
;even.c: 18: if(TimerTick % 10 == 0)
	movlw	0Ah
	movwf	(___lwmod@divisor)
	clrf	(___lwmod@divisor+1)
	movf	(_TimerTick+1),w
	movwf	(___lwmod@dividend+1)
	movf	(_TimerTick),w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	((0+(?___lwmod))),w
iorwf	((1+(?___lwmod))),w
	btfss	status,2
	goto	u204_21
	goto	u204_20
u204_21:
	goto	i1l6514
u204_20:
	line	20
	
i1l6512:	
;even.c: 19: {
;even.c: 20: struct_TimerTick.flag_10mStick = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_struct_TimerTick),2
	line	22
	
i1l6514:	
;even.c: 21: }
;even.c: 22: if(TimerTick % 15 == 0)
	movlw	0Fh
	movwf	(___lwmod@divisor)
	clrf	(___lwmod@divisor+1)
	movf	(_TimerTick+1),w
	movwf	(___lwmod@dividend+1)
	movf	(_TimerTick),w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	((0+(?___lwmod))),w
iorwf	((1+(?___lwmod))),w
	btfss	status,2
	goto	u205_21
	goto	u205_20
u205_21:
	goto	i1l6518
u205_20:
	line	24
	
i1l6516:	
;even.c: 23: {
;even.c: 24: struct_TimerTick.flag_15mStick = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_struct_TimerTick),3
	line	26
	
i1l6518:	
;even.c: 25: }
;even.c: 26: if(TimerTick % 20 == 0)
	movlw	014h
	movwf	(___lwmod@divisor)
	clrf	(___lwmod@divisor+1)
	movf	(_TimerTick+1),w
	movwf	(___lwmod@dividend+1)
	movf	(_TimerTick),w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	((0+(?___lwmod))),w
iorwf	((1+(?___lwmod))),w
	btfss	status,2
	goto	u206_21
	goto	u206_20
u206_21:
	goto	i1l6522
u206_20:
	line	28
	
i1l6520:	
;even.c: 27: {
;even.c: 28: struct_TimerTick.flag_20mStick = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_struct_TimerTick),4
	line	30
	
i1l6522:	
;even.c: 29: }
;even.c: 30: if(TimerTick %50 == 0)
	movlw	032h
	movwf	(___lwmod@divisor)
	clrf	(___lwmod@divisor+1)
	movf	(_TimerTick+1),w
	movwf	(___lwmod@dividend+1)
	movf	(_TimerTick),w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	((0+(?___lwmod))),w
iorwf	((1+(?___lwmod))),w
	btfss	status,2
	goto	u207_21
	goto	u207_20
u207_21:
	goto	i1l6526
u207_20:
	line	32
	
i1l6524:	
;even.c: 31: {
;even.c: 32: struct_TimerTick.flag_50mStick = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_struct_TimerTick),5
	line	34
	
i1l6526:	
;even.c: 33: }
;even.c: 34: if(TimerTick % 100 == 0)
	movlw	064h
	movwf	(___lwmod@divisor)
	clrf	(___lwmod@divisor+1)
	movf	(_TimerTick+1),w
	movwf	(___lwmod@dividend+1)
	movf	(_TimerTick),w
	movwf	(___lwmod@dividend)
	fcall	___lwmod
	movf	((0+(?___lwmod))),w
iorwf	((1+(?___lwmod))),w
	btfss	status,2
	goto	u208_21
	goto	u208_20
u208_21:
	goto	i1l1106
u208_20:
	line	36
	
i1l6528:	
;even.c: 35: {
;even.c: 36: struct_TimerTick.flag_100mStick = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_struct_TimerTick),6
	line	37
	
i1l6530:	
;even.c: 37: TimerTick=0;
	clrf	(_TimerTick)
	clrf	(_TimerTick+1)
	line	39
	
i1l1106:	
	movf	(??_Isr_Timer+1),w
	movwf	pclath
	swapf	(??_Isr_Timer+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Isr_Timer
	__end_of_Isr_Timer:
	signat	_Isr_Timer,89
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 6 in file "E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Isr_Timer
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=1
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwmod.c"
	line	6
global __ptext15
__ptext15:	;psect for function ___lwmod
psect	text15
	file	"E:\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwmod.c"
	line	6
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;incstack = 0
	opt	stack 2
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	13
	
i1l6472:	
	movf	((___lwmod@divisor)),w
iorwf	((___lwmod@divisor+1)),w
	btfsc	status,2
	goto	u198_21
	goto	u198_20
u198_21:
	goto	i1l6488
u198_20:
	line	14
	
i1l6474:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	15
	goto	i1l6478
	line	16
	
i1l6476:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	17
	incf	(___lwmod@counter),f
	line	15
	
i1l6478:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u199_21
	goto	u199_20
u199_21:
	goto	i1l6476
u199_20:
	line	20
	
i1l6480:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u200_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u200_25:
	skipc
	goto	u200_21
	goto	u200_20
u200_21:
	goto	i1l6484
u200_20:
	line	21
	
i1l6482:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	22
	
i1l6484:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	23
	
i1l6486:	
	decfsz	(___lwmod@counter),f
	goto	u201_21
	goto	u201_20
u201_21:
	goto	i1l6480
u201_20:
	line	25
	
i1l6488:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	26
	
i1l5513:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
	signat	___lwmod,8314
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
