opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8P1713S
opt include "C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\include\sc8p1713s.cgen.inc"
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
	FNCALL	_main,_AdProc
	FNCALL	_main,_AppChr
	FNCALL	_main,_AppMotor
	FNCALL	_main,_BeepProc
	FNCALL	_main,_BtnScan
	FNCALL	_main,_Init_System
	FNCALL	_main,_LedRamUpdate
	FNCALL	_main,_LockSet
	FNCALL	_main,_SysSleep
	FNCALL	_main,_TimeAddDec
	FNCALL	_TimeAddDec,___bmul
	FNCALL	_TimeAddDec,___lwdiv
	FNCALL	_SysSleep,_Init_System
	FNCALL	_SysSleep,_SysSleepSet
	FNCALL	_Init_System,_Btn_Init
	FNCALL	_Init_System,_GPIO_Init
	FNCALL	_LedRamUpdate,_DisPlayIcon
	FNCALL	_LedRamUpdate,_DisPlayNum
	FNCALL	_DisPlayNum,___lbdiv
	FNCALL	_DisPlayNum,___lbmod
	FNCALL	_AppMotor,_ADSample
	FNCALL	_AdProc,_AdRead
	FNCALL	_AdProc,___lldiv
	FNCALL	_AdProc,___lmul
	FNCALL	_AdRead,_ADSample
	FNROOT	_main
	FNCALL	_Isr_Timer,_LedScan
	FNCALL	_LedScan,_LedIndex
	FNCALL	intlevel1,_Isr_Timer
	global	intlevel1
	FNROOT	intlevel1
	global	_LEDCode
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
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\source_h\display.h"
	line	39
_LEDCode:
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	06Fh
	retlw	071h
	retlw	035h
	retlw	038h
	retlw	037h
	retlw	079h
	retlw	040h
	retlw	low(0)
	global __end_of_LEDCode
__end_of_LEDCode:
	global	_LEDCode
	global	_Flag_key_set
	global	_Flag_key_usb
	global	_Flag_key_long
	global	_Flag_Btn_Release
	global	_Flag_ad_done
	global	_Flag_RtSleep
	global	_Flag_mainloop
	global	_Flag_usb
	global	_Flag_chr_boot
	global	_Flag_chr
	global	_Flag_beep_boot
	global	_Flag_beep
	global	_Flag_stop
	global	_Flag_low_alarm
	global	_Flag_low
	global	_Flag_xi_alarm
	global	_Flag_xi
	global	_Flag_iov
	global	_Flag_lk_alarm
	global	_Flag_lk_set
	global	_Flag_lk
	global	_Flag_on_boot
	global	_Flag_off
	global	_Flag_on
	global	_LED_RAM
	global	_bat_val
	global	_ad_val
	global	_ad_bg
	global	_timer_beep
	global	_timer_lock
	global	_sta_lock
	global	_debance_usb_cnt
	global	_timer_chr
	global	_sta_chr
	global	_debance_scp_cnt
	global	_debance_iov_cnt
	global	_debance_hiov_cnt
	global	_debance_low_cnt
	global	_timer_motor
	global	_sta_m
	global	LedRamUpdate@timer_xi
	global	LedRamUpdate@timer_lk
	global	LedRamUpdate@timer_add
	global	LedRamUpdate@timer_off
	global	LedRamUpdate@chr_boot_cnt
	global	LedRamUpdate@timer_chr_boot
	global	LedRamUpdate@alarm_low_cnt
	global	LedRamUpdate@alarm_xi_cnt
	global	LedRamUpdate@alarm_lk_cnt
	global	LedRamUpdate@led_boot_cnt
	global	LedRamUpdate@led_cp
	global	LedRamUpdate@led_cp_cnt
	global	LedScan@led_scan_index
	global	_lock_count_down
	global	_RSleepCnt
	global	_sta_ad
	global	AdRead@adtimes
	global	_ReadKeyOld
	global	_ReadKeyTmp
	global	_ReadKey
	global	_Rt10ms_cnt
	global	_Rt2ms_cnt
	global	_timer_boot_cnt
	global	_timer_1s
	global	_time_minute
	global	_time_second
	global	_time_dec_cnt
	global	_time_chr_add
	global	_speed_beep
	global	_alarm_beep_cnt
	global	_bat_percent
	global	_actual_percent
	global	_Flag_ledcp_dir
	global	_Flag_scan_dir
	global	_Flag_dig2
	global	_Flag_dig1
	global	_LED_RAM_R
	global	_time_chr_cnt
	global	_ad_scp
	global	_time_motor_cnt
	global	_ad_current
	global	_current_scp
	global	_current_val
	global	_adsum
	global	_admin
	global	_admax
	global	_Flag_boot
psect	bitnvCOMMON,class=COMMON,bit,space=1,noexec
global __pbitnvCOMMON
__pbitnvCOMMON:
_Flag_boot:
       ds      1

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CCP2CON
_CCP2CON	set	29
	global	_CCP1CON
_CCP1CON	set	23
	global	_T2CON
_T2CON	set	18
	global	_PIR1
_PIR1	set	12
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
	global	_TMR2ON
_TMR2ON	set	146
	global	_TMR2IF
_TMR2IF	set	97
	global	_GIE
_GIE	set	95
	global	_RBIE
_RBIE	set	91
	global	_RBIF
_RBIF	set	88
	global	_RE0
_RE0	set	72
	global	_RC3
_RC3	set	59
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
	global	_RB3
_RB3	set	51
	global	_RB2
_RB2	set	50
	global	_RB1
_RB1	set	49
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
	global	_TRISE
_TRISE	set	137
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
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISA2
_TRISA2	set	1066
	global	_TRISA1
_TRISA1	set	1065
	global	_RBPU
_RBPU	set	1039
	global	_WPUE
_WPUE	set	282
	global	_KEYCON0
_KEYCON0	set	275
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
	global	_WPUA2
_WPUA2	set	3186
	global	_WPUA1
_WPUA1	set	3185
; #config settings
	file	"Code_Prj.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bitbssCOMMON,class=COMMON,bit,space=1,noexec
global __pbitbssCOMMON
__pbitbssCOMMON:
_Flag_key_set:
       ds      1

_Flag_key_usb:
       ds      1

_Flag_key_long:
       ds      1

_Flag_Btn_Release:
       ds      1

_Flag_ad_done:
       ds      1

_Flag_RtSleep:
       ds      1

_Flag_mainloop:
       ds      1

_Flag_usb:
       ds      1

_Flag_chr_boot:
       ds      1

_Flag_chr:
       ds      1

_Flag_beep_boot:
       ds      1

_Flag_beep:
       ds      1

_Flag_stop:
       ds      1

_Flag_low_alarm:
       ds      1

_Flag_low:
       ds      1

_Flag_xi_alarm:
       ds      1

_Flag_xi:
       ds      1

_Flag_iov:
       ds      1

_Flag_lk_alarm:
       ds      1

_Flag_lk_set:
       ds      1

_Flag_lk:
       ds      1

_Flag_on_boot:
       ds      1

_Flag_off:
       ds      1

_Flag_on:
       ds      1

psect	bitbssBANK0,class=BANK0,bit,space=1,noexec
global __pbitbssBANK0
__pbitbssBANK0:
_Flag_ledcp_dir:
       ds      1

_Flag_scan_dir:
       ds      1

_Flag_dig2:
       ds      1

_Flag_dig1:
       ds      1

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_LED_RAM:
       ds      4

_bat_val:
       ds      2

_ad_val:
       ds      2

_ad_bg:
       ds      2

_timer_beep:
       ds      1

_timer_lock:
       ds      1

_sta_lock:
       ds      1

_debance_usb_cnt:
       ds      1

_timer_chr:
       ds      1

_sta_chr:
       ds      1

_debance_scp_cnt:
       ds      1

_debance_iov_cnt:
       ds      1

_debance_hiov_cnt:
       ds      1

_debance_low_cnt:
       ds      1

_timer_motor:
       ds      1

_sta_m:
       ds      1

LedRamUpdate@timer_xi:
       ds      1

LedRamUpdate@timer_lk:
       ds      1

LedRamUpdate@timer_add:
       ds      1

LedRamUpdate@timer_off:
       ds      1

LedRamUpdate@chr_boot_cnt:
       ds      1

LedRamUpdate@timer_chr_boot:
       ds      1

LedRamUpdate@alarm_low_cnt:
       ds      1

LedRamUpdate@alarm_xi_cnt:
       ds      1

LedRamUpdate@alarm_lk_cnt:
       ds      1

LedRamUpdate@led_boot_cnt:
       ds      1

LedRamUpdate@led_cp:
       ds      1

LedRamUpdate@led_cp_cnt:
       ds      1

LedScan@led_scan_index:
       ds      1

_lock_count_down:
       ds      1

_RSleepCnt:
       ds      1

_sta_ad:
       ds      1

AdRead@adtimes:
       ds      1

_ReadKeyOld:
       ds      1

_ReadKeyTmp:
       ds      1

_ReadKey:
       ds      1

_Rt10ms_cnt:
       ds      1

_Rt2ms_cnt:
       ds      1

_timer_boot_cnt:
       ds      1

_timer_1s:
       ds      1

_time_minute:
       ds      1

_time_second:
       ds      1

_time_dec_cnt:
       ds      1

_time_chr_add:
       ds      1

_speed_beep:
       ds      1

_alarm_beep_cnt:
       ds      1

_bat_percent:
       ds      1

_actual_percent:
       ds      1

psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_LED_RAM_R:
       ds      4

_time_chr_cnt:
       ds      2

_ad_scp:
       ds      2

_time_motor_cnt:
       ds      2

_ad_current:
       ds      2

_current_scp:
       ds      2

_current_val:
       ds      2

_adsum:
       ds      2

_admin:
       ds      2

_admax:
       ds      2

	file	"Code_Prj.as"
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

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
	clrf	((__pbitbssCOMMON/8)+1)&07Fh
	clrf	((__pbitbssCOMMON/8)+2)&07Fh
; Clear objects allocated to BITBANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	((__pbitbssBANK0/8)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+036h)
	fcall	clear_ram0
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+016h)
	fcall	clear_ram0
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
	global	AdProc@dat_tmp
AdProc@dat_tmp:	; 4 bytes @ 0x0
	ds	4
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_Btn_Init:	; 1 bytes @ 0x0
?_GPIO_Init:	; 1 bytes @ 0x0
?_LedScan:	; 1 bytes @ 0x0
?_AdProc:	; 1 bytes @ 0x0
?_BeepProc:	; 1 bytes @ 0x0
?_BtnScan:	; 1 bytes @ 0x0
?_AppMotor:	; 1 bytes @ 0x0
?_AppChr:	; 1 bytes @ 0x0
?_LockSet:	; 1 bytes @ 0x0
?_LedRamUpdate:	; 1 bytes @ 0x0
?_SysSleep:	; 1 bytes @ 0x0
?_SysSleepSet:	; 1 bytes @ 0x0
?_Init_System:	; 1 bytes @ 0x0
?_Isr_Timer:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_ADSample:	; 1 bytes @ 0x0
?_AdRead:	; 1 bytes @ 0x0
?_LedIndex:	; 1 bytes @ 0x0
??_LedIndex:	; 1 bytes @ 0x0
	global	LedIndex@led_index
LedIndex@led_index:	; 1 bytes @ 0x0
	ds	1
??_LedScan:	; 1 bytes @ 0x1
??_Isr_Timer:	; 1 bytes @ 0x1
	ds	3
??_Btn_Init:	; 1 bytes @ 0x4
??_GPIO_Init:	; 1 bytes @ 0x4
??_BeepProc:	; 1 bytes @ 0x4
??_BtnScan:	; 1 bytes @ 0x4
??_AppChr:	; 1 bytes @ 0x4
??_LockSet:	; 1 bytes @ 0x4
??_SysSleep:	; 1 bytes @ 0x4
??_SysSleepSet:	; 1 bytes @ 0x4
??_Init_System:	; 1 bytes @ 0x4
??_ADSample:	; 1 bytes @ 0x4
?_DisPlayIcon:	; 1 bytes @ 0x4
??___lmul:	; 1 bytes @ 0x4
?___bmul:	; 1 bytes @ 0x4
?___lbdiv:	; 1 bytes @ 0x4
?___lbmod:	; 1 bytes @ 0x4
??___lldiv:	; 1 bytes @ 0x4
??___lwdiv:	; 1 bytes @ 0x4
	global	DisPlayIcon@icon_sel
DisPlayIcon@icon_sel:	; 1 bytes @ 0x4
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x4
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x4
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x4
	ds	1
??_AdProc:	; 1 bytes @ 0x5
??___bmul:	; 1 bytes @ 0x5
??___lbdiv:	; 1 bytes @ 0x5
??___lbmod:	; 1 bytes @ 0x5
	global	DisPlayIcon@icon_sta
DisPlayIcon@icon_sta:	; 1 bytes @ 0x5
	ds	1
??_LedRamUpdate:	; 1 bytes @ 0x6
??_main:	; 1 bytes @ 0x6
??_DisPlayNum:	; 1 bytes @ 0x6
??_DisPlayIcon:	; 1 bytes @ 0x6
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	ADSample@adch
ADSample@adch:	; 1 bytes @ 0x0
	global	DisPlayIcon@icon_seg
DisPlayIcon@icon_seg:	; 1 bytes @ 0x0
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x0
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x0
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	1
	global	ADSample@i
ADSample@i:	; 1 bytes @ 0x1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x1
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x1
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x1
	ds	1
??_AppMotor:	; 1 bytes @ 0x2
??_AdRead:	; 1 bytes @ 0x2
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x2
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	1
?_DisPlayNum:	; 1 bytes @ 0x3
	global	DisPlayNum@dig_sel
DisPlayNum@dig_sel:	; 1 bytes @ 0x3
	ds	1
	global	AdRead@ad_ch
AdRead@ad_ch:	; 1 bytes @ 0x4
	global	DisPlayNum@dis_num
DisPlayNum@dis_num:	; 1 bytes @ 0x4
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	1
	global	AdRead@ad_temp
AdRead@ad_temp:	; 2 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
?_TimeAddDec:	; 1 bytes @ 0x7
	global	TimeAddDec@bat_value
TimeAddDec@bat_value:	; 2 bytes @ 0x7
	ds	1
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
	ds	1
??_TimeAddDec:	; 1 bytes @ 0x9
	ds	2
	global	TimeAddDec@percent_err
TimeAddDec@percent_err:	; 1 bytes @ 0xB
	ds	1
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0xC
	global	TimeAddDec@tmp_percent
TimeAddDec@tmp_percent:	; 2 bytes @ 0xC
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0xC
	ds	4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x10
	ds	4
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x14
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0x18
	ds	1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    17
;!    Data        0
;!    BSS         76
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      6      10
;!    BANK0            80     25      80
;!    BANK1            80      4      26

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    _main->_AppChr
;!    _TimeAddDec->___bmul
;!    _LedRamUpdate->_DisPlayIcon
;!    _DisPlayNum->___lbmod
;!    _AppMotor->_ADSample
;!    _AdRead->_ADSample
;!
;!Critical Paths under _Isr_Timer in COMMON
;!
;!    _LedScan->_LedIndex
;!
;!Critical Paths under _main in BANK0
;!
;!    _TimeAddDec->___lwdiv
;!    _LedRamUpdate->_DisPlayNum
;!    _DisPlayNum->___lbdiv
;!    _DisPlayNum->___lbmod
;!    _AppMotor->_ADSample
;!    _AdProc->___lldiv
;!    ___lldiv->___lmul
;!    _AdRead->_ADSample
;!
;!Critical Paths under _Isr_Timer in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    _main->_AdProc
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
;! (0) _main                                                 0     0      0    6848
;!                             _AdProc
;!                             _AppChr
;!                           _AppMotor
;!                           _BeepProc
;!                            _BtnScan
;!                        _Init_System
;!                       _LedRamUpdate
;!                            _LockSet
;!                           _SysSleep
;!                         _TimeAddDec
;! ---------------------------------------------------------------------------------
;! (1) _TimeAddDec                                           7     5      2    1268
;!                                              7 BANK0      7     5      2
;!                             ___bmul
;!                            ___lwdiv
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4     371
;!                                              0 BANK0      7     3      4
;! ---------------------------------------------------------------------------------
;! (2) ___bmul                                               3     2      1     266
;!                                              4 COMMON     1     0      1
;!                                              0 BANK0      2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _SysSleep                                             0     0      0       0
;!                        _Init_System
;!                        _SysSleepSet
;! ---------------------------------------------------------------------------------
;! (2) _SysSleepSet                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _Init_System                                          0     0      0       0
;!                           _Btn_Init
;!                          _GPIO_Init
;! ---------------------------------------------------------------------------------
;! (3) _GPIO_Init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _Btn_Init                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _LockSet                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _LedRamUpdate                                         0     0      0    4290
;!                        _DisPlayIcon
;!                         _DisPlayNum
;! ---------------------------------------------------------------------------------
;! (2) _DisPlayNum                                           2     1      1    1312
;!                                              3 BANK0      2     1      1
;!                            ___lbdiv
;!                            ___lbmod
;! ---------------------------------------------------------------------------------
;! (3) ___lbmod                                              5     4      1     297
;!                                              4 COMMON     2     1      1
;!                                              0 BANK0      3     3      0
;! ---------------------------------------------------------------------------------
;! (3) ___lbdiv                                              4     3      1     306
;!                                              4 COMMON     1     0      1
;!                                              0 BANK0      3     3      0
;! ---------------------------------------------------------------------------------
;! (2) _DisPlayIcon                                          3     1      2    2978
;!                                              4 COMMON     2     0      2
;!                                              0 BANK0      1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _BtnScan                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _BeepProc                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _AppMotor                                             2     2      0      65
;!                                              2 BANK0      2     2      0
;!                           _ADSample
;! ---------------------------------------------------------------------------------
;! (1) _AppChr                                               2     2      0       0
;!                                              4 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _AdProc                                               4     4      0    1225
;!                                              0 BANK1      4     4      0
;!                             _AdRead
;!                            ___lldiv
;!                             ___lmul
;! ---------------------------------------------------------------------------------
;! (2) ___lmul                                              12     4      8     396
;!                                              0 BANK0     12     4      8
;! ---------------------------------------------------------------------------------
;! (2) ___lldiv                                             13     5      8     501
;!                                             12 BANK0     13     5      8
;!                             ___lmul (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _AdRead                                               5     5      0     260
;!                                              2 BANK0      5     5      0
;!                           _ADSample
;! ---------------------------------------------------------------------------------
;! (2) _ADSample                                             3     3      0      65
;!                                              4 COMMON     1     1      0
;!                                              0 BANK0      2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (4) _Isr_Timer                                            3     3      0      23
;!                                              1 COMMON     3     3      0
;!                            _LedScan
;! ---------------------------------------------------------------------------------
;! (5) _LedScan                                              0     0      0      23
;!                           _LedIndex
;! ---------------------------------------------------------------------------------
;! (6) _LedIndex                                             1     1      0      23
;!                                              0 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _AdProc
;!     _AdRead
;!       _ADSample
;!     ___lldiv
;!       ___lmul (ARG)
;!     ___lmul
;!   _AppChr
;!   _AppMotor
;!     _ADSample
;!   _BeepProc
;!   _BtnScan
;!   _Init_System
;!     _Btn_Init
;!     _GPIO_Init
;!   _LedRamUpdate
;!     _DisPlayIcon
;!     _DisPlayNum
;!       ___lbdiv
;!       ___lbmod
;!   _LockSet
;!   _SysSleep
;!     _Init_System
;!       _Btn_Init
;!       _GPIO_Init
;!     _SysSleepSet
;!   _TimeAddDec
;!     ___bmul
;!     ___lwdiv
;!
;! _Isr_Timer (ROOT)
;!   _LedScan
;!     _LedIndex
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       4       0       28.6%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      6       A       1       71.4%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!ABS                  0      0      74       3        0.0%
;!BITBANK0            50      0       1       4        1.3%
;!BITSFR3              0      0       0       4        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BANK0               50     19      50       5      100.0%
;!BITSFR2              0      0       0       5        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITBANK1            50      0       0       6        0.0%
;!BANK1               50      4      1A       7       32.5%
;!DATA                 0      0      74       8        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 64 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_AdProc
;;		_AppChr
;;		_AppMotor
;;		_BeepProc
;;		_BtnScan
;;		_Init_System
;;		_LedRamUpdate
;;		_LockSet
;;		_SysSleep
;;		_TimeAddDec
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
	line	64
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
	line	64
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	66
	
l7170:	
;main.C: 66: Init_System();
	fcall	_Init_System
	line	67
	
l7172:	
;main.C: 67: Flag_boot =1;
	bsf	(_Flag_boot/8),(_Flag_boot)&7
	line	68
	
l7174:	
;main.C: 68: timer_boot_cnt =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_timer_boot_cnt)
	line	71
	
l7176:	
;main.C: 70: {
;main.C: 71: if(Flag_mainloop&&Flag_boot)
	btfss	(_Flag_mainloop/8),(_Flag_mainloop)&7
	goto	u5441
	goto	u5440
u5441:
	goto	l7208
u5440:
	
l7178:	
	btfss	(_Flag_boot/8),(_Flag_boot)&7
	goto	u5451
	goto	u5450
u5451:
	goto	l7208
u5450:
	line	73
	
l7180:	
;main.C: 72: {
;main.C: 73: Flag_mainloop = 0;
	bcf	(_Flag_mainloop/8),(_Flag_mainloop)&7
	line	75
# 75 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
clrwdt ;# 
psect	maintext
	line	76
	
l7182:	
;main.C: 76: LED_RAM[0]=0XFF;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_LED_RAM)
	line	77
;main.C: 77: LED_RAM[1]=0XFF;
	movlw	low(0FFh)
	movwf	0+(_LED_RAM)+01h
	line	78
;main.C: 78: LED_RAM[2]=0XFF;
	movlw	low(0FFh)
	movwf	0+(_LED_RAM)+02h
	line	79
;main.C: 79: LED_RAM[3]=0XFF;
	movlw	low(0FFh)
	movwf	0+(_LED_RAM)+03h
	line	80
	
l7184:	
;main.C: 80: AdProc();
	fcall	_AdProc
	line	81
	
l7186:	
;main.C: 81: alarm_beep_cnt=1,speed_beep=50;
	clrf	(_alarm_beep_cnt)
	incf	(_alarm_beep_cnt),f
	
l7188:	
	movlw	low(032h)
	movwf	(_speed_beep)
	line	82
	
l7190:	
;main.C: 82: BeepProc();
	fcall	_BeepProc
	line	83
	
l7192:	
;main.C: 83: timer_boot_cnt++; if(timer_boot_cnt>100) Flag_boot=0;
	incf	(_timer_boot_cnt),f
	
l7194:	
	movlw	low(065h)
	subwf	(_timer_boot_cnt),w
	skipc
	goto	u5461
	goto	u5460
u5461:
	goto	l7198
u5460:
	
l7196:	
	bcf	(_Flag_boot/8),(_Flag_boot)&7
	line	85
	
l7198:	
;main.C: 85: if(bat_val<267) bat_percent=0;
	movlw	01h
	subwf	(_bat_val+1),w
	movlw	0Bh
	skipnz
	subwf	(_bat_val),w
	skipnc
	goto	u5471
	goto	u5470
u5471:
	goto	l7202
u5470:
	
l7200:	
	clrf	(_bat_percent)
	goto	l7208
	line	86
	
l7202:	
;main.C: 86: else if(bat_val>350) bat_percent=99;
	movlw	01h
	subwf	(_bat_val+1),w
	movlw	05Fh
	skipnz
	subwf	(_bat_val),w
	skipc
	goto	u5481
	goto	u5480
u5481:
	goto	l7206
u5480:
	
l7204:	
	movlw	low(063h)
	movwf	(_bat_percent)
	goto	l7208
	line	87
	
l7206:	
;main.C: 87: else bat_percent=bat_val-267;
	movf	(_bat_val),w
	addlw	0F5h
	movwf	(_bat_percent)
	line	91
	
l7208:	
;main.C: 90: }
;main.C: 91: if(Flag_mainloop&&(!Flag_boot))
	btfss	(_Flag_mainloop/8),(_Flag_mainloop)&7
	goto	u5491
	goto	u5490
u5491:
	goto	l7176
u5490:
	
l7210:	
	btfsc	(_Flag_boot/8),(_Flag_boot)&7
	goto	u5501
	goto	u5500
u5501:
	goto	l7176
u5500:
	line	93
	
l7212:	
;main.C: 92: {
;main.C: 93: Flag_mainloop = 0;
	bcf	(_Flag_mainloop/8),(_Flag_mainloop)&7
	line	95
# 95 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
clrwdt ;# 
psect	maintext
	line	96
	
l7214:	
;main.C: 96: BtnScan();
	fcall	_BtnScan
	line	97
	
l7216:	
;main.C: 97: AppMotor();
	fcall	_AppMotor
	line	98
	
l7218:	
;main.C: 98: AppChr();
	fcall	_AppChr
	line	99
	
l7220:	
;main.C: 99: if(!Flag_usb) LockSet();
	btfsc	(_Flag_usb/8),(_Flag_usb)&7
	goto	u5511
	goto	u5510
u5511:
	goto	l7224
u5510:
	
l7222:	
	fcall	_LockSet
	line	100
	
l7224:	
;main.C: 100: BeepProc();
	fcall	_BeepProc
	line	101
	
l7226:	
;main.C: 101: timer_1s++; if(timer_1s>100) { timer_1s=0; TimeAddDec(bat_val); }
	incf	(_timer_1s),f
	
l7228:	
	movlw	low(065h)
	subwf	(_timer_1s),w
	skipc
	goto	u5521
	goto	u5520
u5521:
	goto	l7234
u5520:
	
l7230:	
	clrf	(_timer_1s)
	
l7232:	
	movf	(_bat_val+1),w
	movwf	(TimeAddDec@bat_value+1)
	movf	(_bat_val),w
	movwf	(TimeAddDec@bat_value)
	fcall	_TimeAddDec
	line	102
	
l7234:	
;main.C: 102: LedRamUpdate();
	fcall	_LedRamUpdate
	line	103
	
l7236:	
;main.C: 103: AdProc();
	fcall	_AdProc
	line	104
	
l7238:	
;main.C: 104: SysSleep();
	fcall	_SysSleep
	goto	l7176
	global	start
	ljmp	start
	opt stack 0
	line	107
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_TimeAddDec

;; *************** function _TimeAddDec *****************
;; Defined at:
;;		line 240 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
;; Parameters:    Size  Location     Type
;;  bat_value       2    7[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  tmp_percent     2   12[BANK0 ] unsigned int 
;;  percent_err     1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       3       0
;;      Temps:          0       2       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___bmul
;;		___lwdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
	line	240
global __ptext1
__ptext1:	;psect for function _TimeAddDec
psect	text1
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
	line	240
	global	__size_of_TimeAddDec
	__size_of_TimeAddDec	equ	__end_of_TimeAddDec-_TimeAddDec
	
_TimeAddDec:	
;incstack = 0
	opt	stack 3
; Regs used in _TimeAddDec: [wreg+status,2+status,0+pclath+cstack]
	line	245
	
l6866:	
;AppProc.C: 242: unsigned char percent_err;
;AppProc.C: 243: unsigned int tmp_percent;
;AppProc.C: 245: if(Flag_usb)
	btfss	(_Flag_usb/8),(_Flag_usb)&7
	goto	u4831
	goto	u4830
u4831:
	goto	l6904
u4830:
	line	247
	
l6868:	
;AppProc.C: 246: {
;AppProc.C: 247: if(bat_value<275) tmp_percent=0;
	movlw	01h
	subwf	(TimeAddDec@bat_value+1),w
	movlw	013h
	skipnz
	subwf	(TimeAddDec@bat_value),w
	skipnc
	goto	u4841
	goto	u4840
u4841:
	goto	l6872
u4840:
	
l6870:	
	clrf	(TimeAddDec@tmp_percent)
	clrf	(TimeAddDec@tmp_percent+1)
	goto	l6880
	line	248
	
l6872:	
;AppProc.C: 248: else if(bat_value>350) tmp_percent=96;
	movlw	01h
	subwf	(TimeAddDec@bat_value+1),w
	movlw	05Fh
	skipnz
	subwf	(TimeAddDec@bat_value),w
	skipc
	goto	u4851
	goto	u4850
u4851:
	goto	l6876
u4850:
	
l6874:	
	movlw	060h
	movwf	(TimeAddDec@tmp_percent)
	clrf	(TimeAddDec@tmp_percent+1)
	goto	l6880
	line	251
	
l6876:	
;AppProc.C: 249: else
;AppProc.C: 250: {
;AppProc.C: 251: tmp_percent=bat_value-275;
	movf	(TimeAddDec@bat_value),w
	addlw	low(0FEEDh)
	movwf	(TimeAddDec@tmp_percent)
	movf	(TimeAddDec@bat_value+1),w
	skipnc
	addlw	1
	addlw	high(0FEEDh)
	movwf	1+(TimeAddDec@tmp_percent)
	line	255
	
l6878:	
;AppProc.C: 255: tmp_percent=tmp_percent*4/3;
	movlw	03h
	movwf	(___lwdiv@divisor)
	clrf	(___lwdiv@divisor+1)
	movf	(TimeAddDec@tmp_percent+1),w
	movwf	(??_TimeAddDec+0)+0+1
	movf	(TimeAddDec@tmp_percent),w
	movwf	(??_TimeAddDec+0)+0
	clrc
	rlf	(??_TimeAddDec+0)+0,f
	rlf	(??_TimeAddDec+0)+1,f
	clrc
	rlf	(??_TimeAddDec+0)+0,f
	rlf	(??_TimeAddDec+0)+1,f
	movf	0+(??_TimeAddDec+0)+0,w
	movwf	(___lwdiv@dividend)
	movf	1+(??_TimeAddDec+0)+0,w
	movwf	(___lwdiv@dividend+1)
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(TimeAddDec@tmp_percent+1)
	movf	(0+(?___lwdiv)),w
	movwf	(TimeAddDec@tmp_percent)
	line	259
	
l6880:	
;AppProc.C: 257: }
;AppProc.C: 259: if(actual_percent>tmp_percent) { if(actual_percent) actual_percent--; }
	movf	(_actual_percent),w
	movwf	(??_TimeAddDec+0)+0
	clrf	(??_TimeAddDec+0)+0+1
	movf	1+(??_TimeAddDec+0)+0,w
	subwf	(TimeAddDec@tmp_percent+1),w
	skipz
	goto	u4865
	movf	0+(??_TimeAddDec+0)+0,w
	subwf	(TimeAddDec@tmp_percent),w
u4865:
	skipnc
	goto	u4861
	goto	u4860
u4861:
	goto	l6886
u4860:
	
l6882:	
	movf	((_actual_percent)),w
	btfsc	status,2
	goto	u4871
	goto	u4870
u4871:
	goto	l6886
u4870:
	
l6884:	
	decf	(_actual_percent),f
	line	260
	
l6886:	
;AppProc.C: 260: if(actual_percent<tmp_percent) { if(actual_percent<99) actual_percent++; }
	movf	(_actual_percent),w
	movwf	(??_TimeAddDec+0)+0
	clrf	(??_TimeAddDec+0)+0+1
	movf	(TimeAddDec@tmp_percent+1),w
	subwf	1+(??_TimeAddDec+0)+0,w
	skipz
	goto	u4885
	movf	(TimeAddDec@tmp_percent),w
	subwf	0+(??_TimeAddDec+0)+0,w
u4885:
	skipnc
	goto	u4881
	goto	u4880
u4881:
	goto	l6892
u4880:
	
l6888:	
	movlw	low(063h)
	subwf	(_actual_percent),w
	skipnc
	goto	u4891
	goto	u4890
u4891:
	goto	l6892
u4890:
	
l6890:	
	incf	(_actual_percent),f
	line	262
	
l6892:	
;AppProc.C: 262: if(actual_percent>bat_percent)
	movf	(_actual_percent),w
	subwf	(_bat_percent),w
	skipnc
	goto	u4901
	goto	u4900
u4901:
	goto	l6902
u4900:
	line	264
	
l6894:	
;AppProc.C: 263: {
;AppProc.C: 264: percent_err=actual_percent-bat_percent;
	movf	(_bat_percent),w
	subwf	(_actual_percent),w
	movwf	(TimeAddDec@percent_err)
	line	265
	
l6896:	
;AppProc.C: 265: if(percent_err<5) time_chr_add=90-15*percent_err; else time_chr_add=15;
	movlw	low(05h)
	subwf	(TimeAddDec@percent_err),w
	skipnc
	goto	u4911
	goto	u4910
u4911:
	goto	l6900
u4910:
	
l6898:	
	movlw	low(0F1h)
	movwf	(___bmul@multiplicand)
	movf	(TimeAddDec@percent_err),w
	fcall	___bmul
	addlw	05Ah
	movwf	(_time_chr_add)
	goto	l6904
	
l6900:	
	movlw	low(0Fh)
	movwf	(_time_chr_add)
	goto	l6904
	line	267
	
l6902:	
;AppProc.C: 267: else time_chr_add=240;
	movlw	low(0F0h)
	movwf	(_time_chr_add)
	line	270
	
l6904:	
;AppProc.C: 268: }
;AppProc.C: 270: if(sta_m)
	movf	((_sta_m)),w
	btfsc	status,2
	goto	u4921
	goto	u4920
u4921:
	goto	l6950
u4920:
	line	272
	
l6906:	
;AppProc.C: 271: {
;AppProc.C: 272: if(bat_value<267) tmp_percent=0;
	movlw	01h
	subwf	(TimeAddDec@bat_value+1),w
	movlw	0Bh
	skipnz
	subwf	(TimeAddDec@bat_value),w
	skipnc
	goto	u4931
	goto	u4930
u4931:
	goto	l6910
u4930:
	
l6908:	
	clrf	(TimeAddDec@tmp_percent)
	clrf	(TimeAddDec@tmp_percent+1)
	goto	l6928
	line	273
	
l6910:	
;AppProc.C: 273: else if(bat_value>333) tmp_percent=99;
	movlw	01h
	subwf	(TimeAddDec@bat_value+1),w
	movlw	04Eh
	skipnz
	subwf	(TimeAddDec@bat_value),w
	skipc
	goto	u4941
	goto	u4940
u4941:
	goto	l6914
u4940:
	
l6912:	
	movlw	063h
	movwf	(TimeAddDec@tmp_percent)
	clrf	(TimeAddDec@tmp_percent+1)
	goto	l6928
	line	276
	
l6914:	
;AppProc.C: 274: else
;AppProc.C: 275: {
;AppProc.C: 276: tmp_percent=bat_value-267;
	movf	(TimeAddDec@bat_value),w
	addlw	low(0FEF5h)
	movwf	(TimeAddDec@tmp_percent)
	movf	(TimeAddDec@bat_value+1),w
	skipnc
	addlw	1
	addlw	high(0FEF5h)
	movwf	1+(TimeAddDec@tmp_percent)
	line	281
	
l6916:	
;AppProc.C: 281: if(tmp_percent<33) tmp_percent=tmp_percent;
	movlw	0
	subwf	(TimeAddDec@tmp_percent+1),w
	movlw	021h
	skipnz
	subwf	(TimeAddDec@tmp_percent),w
	skipnc
	goto	u4951
	goto	u4950
u4951:
	goto	l6920
u4950:
	goto	l6928
	line	282
	
l6920:	
;AppProc.C: 282: else tmp_percent=33+(bat_value-300)*2;
	movf	(TimeAddDec@bat_value+1),w
	movwf	(TimeAddDec@tmp_percent+1)
	movf	(TimeAddDec@bat_value),w
	movwf	(TimeAddDec@tmp_percent)
	
l6922:	
	clrc
	rlf	(TimeAddDec@tmp_percent),f
	rlf	(TimeAddDec@tmp_percent+1),f
	
l6924:	
	movlw	0A8h
	addwf	(TimeAddDec@tmp_percent),f
	skipnc
	incf	(TimeAddDec@tmp_percent+1),f
	movlw	0FDh
	addwf	(TimeAddDec@tmp_percent+1),f
	
l6926:	
	movlw	021h
	addwf	(TimeAddDec@tmp_percent),f
	skipnc
	incf	(TimeAddDec@tmp_percent+1),f
	line	286
	
l6928:	
;AppProc.C: 284: }
;AppProc.C: 286: if(actual_percent>tmp_percent) { if(actual_percent) actual_percent--; }
	movf	(_actual_percent),w
	movwf	(??_TimeAddDec+0)+0
	clrf	(??_TimeAddDec+0)+0+1
	movf	1+(??_TimeAddDec+0)+0,w
	subwf	(TimeAddDec@tmp_percent+1),w
	skipz
	goto	u4965
	movf	0+(??_TimeAddDec+0)+0,w
	subwf	(TimeAddDec@tmp_percent),w
u4965:
	skipnc
	goto	u4961
	goto	u4960
u4961:
	goto	l6934
u4960:
	
l6930:	
	movf	((_actual_percent)),w
	btfsc	status,2
	goto	u4971
	goto	u4970
u4971:
	goto	l6934
u4970:
	
l6932:	
	decf	(_actual_percent),f
	line	287
	
l6934:	
;AppProc.C: 287: if(actual_percent<tmp_percent) { if(actual_percent<99) actual_percent++; }
	movf	(_actual_percent),w
	movwf	(??_TimeAddDec+0)+0
	clrf	(??_TimeAddDec+0)+0+1
	movf	(TimeAddDec@tmp_percent+1),w
	subwf	1+(??_TimeAddDec+0)+0,w
	skipz
	goto	u4985
	movf	(TimeAddDec@tmp_percent),w
	subwf	0+(??_TimeAddDec+0)+0,w
u4985:
	skipnc
	goto	u4981
	goto	u4980
u4981:
	goto	l6940
u4980:
	
l6936:	
	movlw	low(063h)
	subwf	(_actual_percent),w
	skipnc
	goto	u4991
	goto	u4990
u4991:
	goto	l6940
u4990:
	
l6938:	
	incf	(_actual_percent),f
	line	289
	
l6940:	
;AppProc.C: 289: if(actual_percent<bat_percent)
	movf	(_bat_percent),w
	subwf	(_actual_percent),w
	skipnc
	goto	u5001
	goto	u5000
u5001:
	goto	l6950
u5000:
	line	291
	
l6942:	
;AppProc.C: 290: {
;AppProc.C: 291: percent_err=bat_percent-actual_percent;
	movf	(_actual_percent),w
	subwf	(_bat_percent),w
	movwf	(TimeAddDec@percent_err)
	line	292
;AppProc.C: 292: if(actual_percent&&(percent_err<5)) time_dec_cnt=75-15*percent_err; else time_dec_cnt=8;
	movf	((_actual_percent)),w
	btfsc	status,2
	goto	u5011
	goto	u5010
u5011:
	goto	l6948
u5010:
	
l6944:	
	movlw	low(05h)
	subwf	(TimeAddDec@percent_err),w
	skipnc
	goto	u5021
	goto	u5020
u5021:
	goto	l6948
u5020:
	
l6946:	
	movlw	low(0F1h)
	movwf	(___bmul@multiplicand)
	movf	(TimeAddDec@percent_err),w
	fcall	___bmul
	addlw	04Bh
	movwf	(_time_dec_cnt)
	goto	l3628
	
l6948:	
	movlw	low(08h)
	movwf	(_time_dec_cnt)
	goto	l3628
	line	294
	
l6950:	
;AppProc.C: 294: else time_dec_cnt=210;
	movlw	low(0D2h)
	movwf	(_time_dec_cnt)
	line	298
	
l3628:	
	return
	opt stack 0
GLOBAL	__end_of_TimeAddDec
	__end_of_TimeAddDec:
	signat	_TimeAddDec,4217
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 6 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[BANK0 ] unsigned int 
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_TimeAddDec
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
	line	6
global __ptext2
__ptext2:	;psect for function ___lwdiv
psect	text2
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 3
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l6656:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
l6658:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u4481
	goto	u4480
u4481:
	goto	l6678
u4480:
	line	16
	
l6660:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	l6664
	line	18
	
l6662:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	19
	incf	(___lwdiv@counter),f
	line	17
	
l6664:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4491
	goto	u4490
u4491:
	goto	l6662
u4490:
	line	22
	
l6666:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	23
	
l6668:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4505
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4505:
	skipc
	goto	u4501
	goto	u4500
u4501:
	goto	l6674
u4500:
	line	24
	
l6670:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
l6672:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	27
	
l6674:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	28
	
l6676:	
	decfsz	(___lwdiv@counter),f
	goto	u4511
	goto	u4510
u4511:
	goto	l6666
u4510:
	line	30
	
l6678:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	31
	
l3971:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	___bmul

;; *************** function ___bmul *****************
;; Defined at:
;;		line 4 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul8.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    1[BANK0 ] unsigned char 
;;  product         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         1       2       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_TimeAddDec
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul8.c"
	line	4
global __ptext3
__ptext3:	;psect for function ___bmul
psect	text3
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul8.c"
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
	
l6616:	
	clrf	(___bmul@product)
	line	43
	
l6618:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u4421
	goto	u4420
u4421:
	goto	l6622
u4420:
	line	44
	
l6620:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	45
	
l6622:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	46
	
l6624:	
	clrc
	rrf	(___bmul@multiplier),f
	line	47
	movf	((___bmul@multiplier)),w
	btfss	status,2
	goto	u4431
	goto	u4430
u4431:
	goto	l6618
u4430:
	line	50
	
l6626:	
	movf	(___bmul@product),w
	line	51
	
l3652:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
	signat	___bmul,8313
	global	_SysSleep

;; *************** function _SysSleep *****************
;; Defined at:
;;		line 169 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
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
;;		On exit  : 200/0
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
;;		_Init_System
;;		_SysSleepSet
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	169
global __ptext4
__ptext4:	;psect for function _SysSleep
psect	text4
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	169
	global	__size_of_SysSleep
	__size_of_SysSleep	equ	__end_of_SysSleep-_SysSleep
	
_SysSleep:	
;incstack = 0
	opt	stack 2
; Regs used in _SysSleep: [wreg+status,2+status,0+pclath+cstack]
	line	171
	
l6244:	
;sc8p1711c.c: 171: if(Flag_on||Flag_usb||Flag_off||Flag_low_alarm||Flag_lk_alarm||Flag_xi_alarm||ReadKey) RSleepCnt=0;
	btfsc	(_Flag_on/8),(_Flag_on)&7
	goto	u3911
	goto	u3910
u3911:
	goto	l6258
u3910:
	
l6246:	
	btfsc	(_Flag_usb/8),(_Flag_usb)&7
	goto	u3921
	goto	u3920
u3921:
	goto	l6258
u3920:
	
l6248:	
	btfsc	(_Flag_off/8),(_Flag_off)&7
	goto	u3931
	goto	u3930
u3931:
	goto	l6258
u3930:
	
l6250:	
	btfsc	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	goto	u3941
	goto	u3940
u3941:
	goto	l6258
u3940:
	
l6252:	
	btfsc	(_Flag_lk_alarm/8),(_Flag_lk_alarm)&7
	goto	u3951
	goto	u3950
u3951:
	goto	l6258
u3950:
	
l6254:	
	btfsc	(_Flag_xi_alarm/8),(_Flag_xi_alarm)&7
	goto	u3961
	goto	u3960
u3961:
	goto	l6258
u3960:
	
l6256:	
	movf	((_ReadKey)),w
	btfsc	status,2
	goto	u3971
	goto	u3970
u3971:
	goto	l6260
u3970:
	
l6258:	
	clrf	(_RSleepCnt)
	line	172
	
l6260:	
;sc8p1711c.c: 172: if(Flag_RtSleep) { Flag_RtSleep=0; RSleepCnt++; }
	btfss	(_Flag_RtSleep/8),(_Flag_RtSleep)&7
	goto	u3981
	goto	u3980
u3981:
	goto	l6266
u3980:
	
l6262:	
	bcf	(_Flag_RtSleep/8),(_Flag_RtSleep)&7
	
l6264:	
	incf	(_RSleepCnt),f
	line	173
	
l6266:	
;sc8p1711c.c: 173: if(RSleepCnt>=200)
	movlw	low(0C8h)
	subwf	(_RSleepCnt),w
	skipc
	goto	u3991
	goto	u3990
u3991:
	goto	l1381
u3990:
	line	175
	
l6268:	
;sc8p1711c.c: 174: {
;sc8p1711c.c: 175: RSleepCnt=0;
	clrf	(_RSleepCnt)
	line	176
# 176 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
clrwdt ;# 
psect	text4
	line	178
;sc8p1711c.c: 178: INTCON=0;
	clrf	(11)	;volatile
	line	179
;sc8p1711c.c: 179: PIE1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(140)^080h	;volatile
	line	180
;sc8p1711c.c: 180: PIE2 = 0;
	clrf	(141)^080h	;volatile
	line	181
;sc8p1711c.c: 181: PIR1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	183
;sc8p1711c.c: 183: ADCON0 = 0;
	clrf	(31)	;volatile
	line	184
;sc8p1711c.c: 184: KEYCON0 = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(275)^0100h	;volatile
	line	185
;sc8p1711c.c: 185: CCP1CON = 0;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(23)	;volatile
	line	186
;sc8p1711c.c: 186: CCP2CON = 0;
	clrf	(29)	;volatile
	line	188
	
l6270:	
;sc8p1711c.c: 188: SysSleepSet();
	fcall	_SysSleepSet
	line	190
	
l6272:	
;sc8p1711c.c: 190: WDTCON=0x00;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(261)^0100h	;volatile
	line	191
	
l6274:	
;sc8p1711c.c: 191: RBIE=1;
	bsf	(91/8),(91)&7	;volatile
	line	192
	
l6276:	
;sc8p1711c.c: 192: GIE =0;
	bcf	(95/8),(95)&7	;volatile
	line	193
	
l6278:	
;sc8p1711c.c: 193: IOCB = 0B00110000;
	movlw	low(030h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(150)^080h	;volatile
	line	194
	
l6280:	
;sc8p1711c.c: 194: OSCCON=0X01;
	movlw	low(01h)
	movwf	(143)^080h	;volatile
	line	195
	
l6282:	
;sc8p1711c.c: 195: RBIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	196
	
l6284:	
;sc8p1711c.c: 196: PORTB;
	bcf	status, 5	;RP0=0, select bank0
	movf	(6),w	;volatile
	line	197
# 197 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
sleep ;# 
	line	198
# 198 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
nop ;# 
psect	text4
	line	199
	
l6286:	
;sc8p1711c.c: 199: Init_System();
	fcall	_Init_System
	line	201
	
l1381:	
	return
	opt stack 0
GLOBAL	__end_of_SysSleep
	__end_of_SysSleep:
	signat	_SysSleep,89
	global	_SysSleepSet

;; *************** function _SysSleepSet *****************
;; Defined at:
;;		line 209 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
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
;;		Nothing
;; This function is called by:
;;		_SysSleep
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	209
global __ptext5
__ptext5:	;psect for function _SysSleepSet
psect	text5
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	209
	global	__size_of_SysSleepSet
	__size_of_SysSleepSet	equ	__end_of_SysSleepSet-_SysSleepSet
	
_SysSleepSet:	
;incstack = 0
	opt	stack 3
; Regs used in _SysSleepSet: [wreg+status,2]
	line	211
	
l5360:	
;sc8p1711c.c: 211: RBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1039/8)^080h,(1039)&7	;volatile
	line	213
	
l5362:	
;sc8p1711c.c: 213: TRISC =0X00;
	clrf	(135)^080h	;volatile
	line	214
;sc8p1711c.c: 214: TRISB =0X00;
	clrf	(134)^080h	;volatile
	line	215
;sc8p1711c.c: 215: TRISA =0X00;
	clrf	(133)^080h	;volatile
	line	216
;sc8p1711c.c: 216: TRISE =0X00;
	clrf	(137)^080h	;volatile
	line	218
	
l5364:	
;sc8p1711c.c: 218: WPUA = 0xFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	219
	
l5366:	
;sc8p1711c.c: 219: WPUB = 0xFF;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	220
	
l5368:	
;sc8p1711c.c: 220: WPUC = 0xFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(399)^0180h	;volatile
	line	221
	
l5370:	
;sc8p1711c.c: 221: WPUE = 0xFF;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank2
	movwf	(282)^0100h	;volatile
	line	223
	
l5372:	
;sc8p1711c.c: 223: PORTA = 0X80;
	movlw	low(080h)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	224
	
l5374:	
;sc8p1711c.c: 224: PORTB = 0X80;
	movlw	low(080h)
	movwf	(6)	;volatile
	line	225
;sc8p1711c.c: 225: PORTC = 0;
	clrf	(7)	;volatile
	line	226
;sc8p1711c.c: 226: PORTE = 0;
	clrf	(9)	;volatile
	line	228
	
l5376:	
;sc8p1711c.c: 228: RA1=1;
	bsf	(41/8),(41)&7	;volatile
	line	229
	
l5378:	
;sc8p1711c.c: 229: RA2=1;
	bsf	(42/8),(42)&7	;volatile
	line	230
	
l5380:	
;sc8p1711c.c: 230: RA0=1;
	bsf	(40/8),(40)&7	;volatile
	line	231
	
l5382:	
;sc8p1711c.c: 231: RA4 =0;
	bcf	(44/8),(44)&7	;volatile
	line	233
	
l5384:	
;sc8p1711c.c: 233: TRISB4=1,WPUB4=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7	;volatile
	
l5386:	
	bsf	(1196/8)^080h,(1196)&7	;volatile
	line	234
	
l5388:	
;sc8p1711c.c: 234: TRISB5=1,WPUB5=1;
	bsf	(1077/8)^080h,(1077)&7	;volatile
	
l5390:	
	bsf	(1197/8)^080h,(1197)&7	;volatile
	line	235
	
l1384:	
	return
	opt stack 0
GLOBAL	__end_of_SysSleepSet
	__end_of_SysSleepSet:
	signat	_SysSleepSet,89
	global	_Init_System

;; *************** function _Init_System *****************
;; Defined at:
;;		line 3 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
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
;;		On exit  : 300/100
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
;;		_Btn_Init
;;		_GPIO_Init
;; This function is called by:
;;		_main
;;		_SysSleep
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
	line	3
global __ptext6
__ptext6:	;psect for function _Init_System
psect	text6
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
	line	3
	global	__size_of_Init_System
	__size_of_Init_System	equ	__end_of_Init_System-_Init_System
	
_Init_System:	
;incstack = 0
	opt	stack 2
; Regs used in _Init_System: [wreg+status,2+status,0+pclath+cstack]
	line	5
	
l5322:	
# 5 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
nop ;# 
	line	6
# 6 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
clrwdt ;# 
psect	text6
	line	8
	
l5324:	
;main.C: 8: Btn_Init();
	fcall	_Btn_Init
	line	9
	
l5326:	
;main.C: 9: GPIO_Init();
	fcall	_GPIO_Init
	line	10
;main.C: 10: WDTCON=0x01;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank2
	movwf	(261)^0100h	;volatile
	line	11
	
l5328:	
;main.C: 11: TRISB =0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	12
	
l5330:	
;main.C: 12: TRISC =0X00;
	clrf	(135)^080h	;volatile
	line	14
;main.C: 14: OSCCON=0X61;
	movlw	low(061h)
	movwf	(143)^080h	;volatile
	line	15
;main.C: 15: INTCON=0B11000000;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	16
;main.C: 16: PIE1=0B00000010;
	movlw	low(02h)
	movwf	(140)^080h	;volatile
	line	17
;main.C: 17: T2CON=0B00000100;
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	18
;main.C: 18: PR2 = 200;
	movlw	low(0C8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	19
	
l663:	
	return
	opt stack 0
GLOBAL	__end_of_Init_System
	__end_of_Init_System:
	signat	_Init_System,89
	global	_GPIO_Init

;; *************** function _GPIO_Init *****************
;; Defined at:
;;		line 10 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Init_System
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	10
global __ptext7
__ptext7:	;psect for function _GPIO_Init
psect	text7
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	10
	global	__size_of_GPIO_Init
	__size_of_GPIO_Init	equ	__end_of_GPIO_Init-_GPIO_Init
	
_GPIO_Init:	
;incstack = 0
	opt	stack 2
; Regs used in _GPIO_Init: [wreg+status,2]
	line	12
	
l5232:	
;sc8p1711c.c: 12: RBPU=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1039/8)^080h,(1039)&7	;volatile
	line	15
	
l5234:	
;sc8p1711c.c: 15: TRISA =0X00;
	clrf	(133)^080h	;volatile
	line	16
;sc8p1711c.c: 16: TRISB =0X00;
	clrf	(134)^080h	;volatile
	line	17
;sc8p1711c.c: 17: TRISC =0X00;
	clrf	(135)^080h	;volatile
	line	18
;sc8p1711c.c: 18: TRISE =0X00;
	clrf	(137)^080h	;volatile
	line	19
	
l5236:	
;sc8p1711c.c: 19: WPUA =0XFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	20
	
l5238:	
;sc8p1711c.c: 20: WPUB =0XFF;
	movlw	low(0FFh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	21
	
l5240:	
;sc8p1711c.c: 21: WPUC =0XFF;
	movlw	low(0FFh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(399)^0180h	;volatile
	line	22
	
l5242:	
;sc8p1711c.c: 22: WPUE =0XFF;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank2
	movwf	(282)^0100h	;volatile
	line	23
	
l5244:	
;sc8p1711c.c: 23: PORTA = 0X80;
	movlw	low(080h)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	24
	
l5246:	
;sc8p1711c.c: 24: PORTB = 0X80;
	movlw	low(080h)
	movwf	(6)	;volatile
	line	25
;sc8p1711c.c: 25: PORTC = 0;
	clrf	(7)	;volatile
	line	26
;sc8p1711c.c: 26: PORTE = 0;
	clrf	(9)	;volatile
	line	28
	
l5248:	
;sc8p1711c.c: 28: RA0=0;
	bcf	(40/8),(40)&7	;volatile
	line	29
	
l5250:	
;sc8p1711c.c: 29: RA4 =1;
	bsf	(44/8),(44)&7	;volatile
	line	33
	
l5252:	
;sc8p1711c.c: 33: TRISA2=1,WPUA2=0; ANS2=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1066/8)^080h,(1066)&7	;volatile
	
l5254:	
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3186/8)^0180h,(3186)&7	;volatile
	
l5256:	
	bsf	(3138/8)^0180h,(3138)&7	;volatile
	line	34
	
l5258:	
;sc8p1711c.c: 34: TRISA1=1,WPUA1=0; ANS1=1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1065/8)^080h,(1065)&7	;volatile
	
l5260:	
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3185/8)^0180h,(3185)&7	;volatile
	
l5262:	
	bsf	(3137/8)^0180h,(3137)&7	;volatile
	line	35
	
l1335:	
	return
	opt stack 0
GLOBAL	__end_of_GPIO_Init
	__end_of_GPIO_Init:
	signat	_GPIO_Init,89
	global	_Btn_Init

;; *************** function _Btn_Init *****************
;; Defined at:
;;		line 7 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\Kscan.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Init_System
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\Kscan.C"
	line	7
global __ptext8
__ptext8:	;psect for function _Btn_Init
psect	text8
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\Kscan.C"
	line	7
	global	__size_of_Btn_Init
	__size_of_Btn_Init	equ	__end_of_Btn_Init-_Btn_Init
	
_Btn_Init:	
;incstack = 0
	opt	stack 2
; Regs used in _Btn_Init: []
	line	10
	
l2832:	
	return
	opt stack 0
GLOBAL	__end_of_Btn_Init
	__end_of_Btn_Init:
	signat	_Btn_Init,89
	global	_LockSet

;; *************** function _LockSet *****************
;; Defined at:
;;		line 164 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
	line	164
global __ptext9
__ptext9:	;psect for function _LockSet
psect	text9
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
	line	164
	global	__size_of_LockSet
	__size_of_LockSet	equ	__end_of_LockSet-_LockSet
	
_LockSet:	
;incstack = 0
	opt	stack 4
; Regs used in _LockSet: [wreg-fsr0h+status,2+status,0]
	line	166
	
l5884:	
;AppProc.C: 166: switch(sta_lock)
	goto	l5936
	line	168
;AppProc.C: 167: {
;AppProc.C: 168: case 0:
	
l3572:	
	line	169
;AppProc.C: 169: Flag_lk_set =0;
	bcf	(_Flag_lk_set/8),(_Flag_lk_set)&7
	line	170
	
l5886:	
;AppProc.C: 170: timer_lock =0;
	clrf	(_timer_lock)
	line	172
	
l5888:	
;AppProc.C: 172: if(ReadKey&0x02)
	btfss	(_ReadKey),(1)&7
	goto	u3231
	goto	u3230
u3231:
	goto	l5902
u3230:
	line	174
	
l5890:	
;AppProc.C: 173: {
;AppProc.C: 174: if(Flag_lk){ Flag_lk_alarm=1; Flag_lk_set=1; lock_count_down=3;}else lock_count_down=4;
	btfss	(_Flag_lk/8),(_Flag_lk)&7
	goto	u3241
	goto	u3240
u3241:
	goto	l5896
u3240:
	
l5892:	
	bsf	(_Flag_lk_alarm/8),(_Flag_lk_alarm)&7
	bsf	(_Flag_lk_set/8),(_Flag_lk_set)&7
	
l5894:	
	movlw	low(03h)
	movwf	(_lock_count_down)
	goto	l5898
	
l5896:	
	movlw	low(04h)
	movwf	(_lock_count_down)
	line	175
	
l5898:	
;AppProc.C: 175: Flag_key_long = 1;
	bsf	(_Flag_key_long/8),(_Flag_key_long)&7
	line	176
	
l5900:	
;AppProc.C: 176: sta_lock=1;
	clrf	(_sta_lock)
	incf	(_sta_lock),f
	line	179
	
l5902:	
;AppProc.C: 179: if(ReadKey&0x02)
	btfss	(_ReadKey),(1)&7
	goto	u3251
	goto	u3250
u3251:
	goto	l5930
u3250:
	line	181
	
l5904:	
;AppProc.C: 180: {
;AppProc.C: 181: timer_lock++;
	incf	(_timer_lock),f
	line	182
	
l5906:	
;AppProc.C: 182: if(timer_lock>=100)
	movlw	low(064h)
	subwf	(_timer_lock),w
	skipc
	goto	u3261
	goto	u3260
u3261:
	goto	l3586
u3260:
	line	184
	
l5908:	
;AppProc.C: 183: {
;AppProc.C: 184: timer_lock = 0;
	clrf	(_timer_lock)
	line	185
	
l5910:	
;AppProc.C: 185: if(lock_count_down)
	movf	((_lock_count_down)),w
	btfsc	status,2
	goto	u3271
	goto	u3270
u3271:
	goto	l3586
u3270:
	line	187
	
l5912:	
;AppProc.C: 186: {
;AppProc.C: 187: Flag_lk_set=1;
	bsf	(_Flag_lk_set/8),(_Flag_lk_set)&7
	line	188
	
l5914:	
;AppProc.C: 188: lock_count_down--;
	decf	(_lock_count_down),f
	line	189
	
l5916:	
;AppProc.C: 189: if(lock_count_down==0)
	movf	((_lock_count_down)),w
	btfss	status,2
	goto	u3281
	goto	u3280
u3281:
	goto	l3583
u3280:
	line	191
	
l5918:	
;AppProc.C: 190: {
;AppProc.C: 191: Flag_lk=~Flag_lk;
	movlw	1<<((_Flag_lk)&7)
	xorwf	((_Flag_lk)/8),f
	line	192
	
l5920:	
;AppProc.C: 192: if(Flag_lk) Flag_lk_alarm=1; else Flag_lk_alarm=0;
	btfss	(_Flag_lk/8),(_Flag_lk)&7
	goto	u3291
	goto	u3290
u3291:
	goto	l3581
u3290:
	
l5922:	
	bsf	(_Flag_lk_alarm/8),(_Flag_lk_alarm)&7
	goto	l3582
	
l3581:	
	bcf	(_Flag_lk_alarm/8),(_Flag_lk_alarm)&7
	
l3582:	
	line	193
;AppProc.C: 193: Flag_lk_set=0;
	bcf	(_Flag_lk_set/8),(_Flag_lk_set)&7
	line	194
	
l5924:	
;AppProc.C: 194: timer_lock=0;
	clrf	(_timer_lock)
	line	195
	
l5926:	
;AppProc.C: 195: alarm_beep_cnt=3,speed_beep=25;
	movlw	low(03h)
	movwf	(_alarm_beep_cnt)
	
l5928:	
	movlw	low(019h)
	movwf	(_speed_beep)
	goto	l3586
	line	200
	
l5930:	
;AppProc.C: 200: else sta_lock=0;
	clrf	(_sta_lock)
	goto	l3586
	
l3583:	
	line	201
;AppProc.C: 201: break;
	goto	l3586
	line	166
	
l5936:	
	movf	(_sta_lock),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 1
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte            8     6 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3572
	xorlw	1^0	; case 1
	skipnz
	goto	l5902
	goto	l5930
	opt asmopt_pop

	line	206
	
l3586:	
	return
	opt stack 0
GLOBAL	__end_of_LockSet
	__end_of_LockSet:
	signat	_LockSet,89
	global	_LedRamUpdate

;; *************** function _LedRamUpdate *****************
;; Defined at:
;;		line 139 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_DisPlayIcon
;;		_DisPlayNum
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
	line	139
global __ptext10
__ptext10:	;psect for function _LedRamUpdate
psect	text10
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
	line	139
	global	__size_of_LedRamUpdate
	__size_of_LedRamUpdate	equ	__end_of_LedRamUpdate-_LedRamUpdate
	
_LedRamUpdate:	
;incstack = 0
	opt	stack 2
; Regs used in _LedRamUpdate: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	155
	
l6954:	
;display.c: 141: static unsigned char led_cp_cnt,
;display.c: 142: led_cp,
;display.c: 143: led_boot_cnt,
;display.c: 144: alarm_lk_cnt,
;display.c: 145: alarm_xi_cnt,
;display.c: 146: alarm_low_cnt,
;display.c: 147: timer_chr_boot,
;display.c: 148: chr_boot_cnt;
;display.c: 149: static unsigned char timer_off,
;display.c: 150: timer_add,
;display.c: 151: timer_chr,
;display.c: 152: timer_lk,
;display.c: 153: timer_xi;
;display.c: 155: LED_RAM_R[0]=0; LED_RAM_R[1]=0; LED_RAM_R[2]=0; LED_RAM_R[3]=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED_RAM_R)^080h
	clrf	0+(_LED_RAM_R)^080h+01h
	clrf	0+(_LED_RAM_R)^080h+02h
	clrf	0+(_LED_RAM_R)^080h+03h
	line	157
	
l6956:	
;display.c: 157: if(Flag_usb) { Flag_off=0; Flag_lk_set=0; Flag_lk_alarm=0; }
	btfss	(_Flag_usb/8),(_Flag_usb)&7
	goto	u5031
	goto	u5030
u5031:
	goto	l2131
u5030:
	
l6958:	
	bcf	(_Flag_off/8),(_Flag_off)&7
	bcf	(_Flag_lk_set/8),(_Flag_lk_set)&7
	bcf	(_Flag_lk_alarm/8),(_Flag_lk_alarm)&7
	
l2131:	
	line	158
;display.c: 158: if(Flag_lk_set) { Flag_on=0; Flag_off=0; Flag_low_alarm=0; }
	btfss	(_Flag_lk_set/8),(_Flag_lk_set)&7
	goto	u5041
	goto	u5040
u5041:
	goto	l2132
u5040:
	
l6960:	
	bcf	(_Flag_on/8),(_Flag_on)&7
	bcf	(_Flag_off/8),(_Flag_off)&7
	bcf	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	
l2132:	
	line	159
;display.c: 159: if(Flag_on||Flag_low_alarm) Flag_usb=0;
	btfsc	(_Flag_on/8),(_Flag_on)&7
	goto	u5051
	goto	u5050
u5051:
	goto	l2135
u5050:
	
l6962:	
	btfss	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	goto	u5061
	goto	u5060
u5061:
	goto	l2133
u5060:
	
l2135:	
	bcf	(_Flag_usb/8),(_Flag_usb)&7
	
l2133:	
	line	162
;display.c: 162: if(Flag_usb)
	btfss	(_Flag_usb/8),(_Flag_usb)&7
	goto	u5071
	goto	u5070
u5071:
	goto	l2136
u5070:
	line	164
	
l6964:	
;display.c: 163: {
;display.c: 164: if(Flag_chr_boot)
	btfss	(_Flag_chr_boot/8),(_Flag_chr_boot)&7
	goto	u5081
	goto	u5080
u5081:
	goto	l7000
u5080:
	line	166
	
l6966:	
;display.c: 165: {
;display.c: 166: timer_chr_boot++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(LedRamUpdate@timer_chr_boot),f
	line	167
	
l6968:	
;display.c: 167: if(timer_chr_boot>=30)
	movlw	low(01Eh)
	subwf	(LedRamUpdate@timer_chr_boot),w
	skipc
	goto	u5091
	goto	u5090
u5091:
	goto	l6998
u5090:
	line	169
	
l6970:	
;display.c: 168: {
;display.c: 169: timer_chr_boot=0;
	clrf	(LedRamUpdate@timer_chr_boot)
	line	170
	
l6972:	
;display.c: 170: if(Flag_scan_dir)
	btfss	(_Flag_scan_dir/8),(_Flag_scan_dir)&7
	goto	u5101
	goto	u5100
u5101:
	goto	l6980
u5100:
	line	171
	
l6974:	
;display.c: 171: { chr_boot_cnt++; if(chr_boot_cnt>5) Flag_scan_dir=0; }
	incf	(LedRamUpdate@chr_boot_cnt),f
	
l6976:	
	movlw	low(06h)
	subwf	(LedRamUpdate@chr_boot_cnt),w
	skipc
	goto	u5111
	goto	u5110
u5111:
	goto	l2138
u5110:
	
l6978:	
	bcf	(_Flag_scan_dir/8),(_Flag_scan_dir)&7
	goto	l6998
	line	173
	
l6980:	
;display.c: 172: else
;display.c: 173: { chr_boot_cnt--; if(chr_boot_cnt==0) Flag_chr_boot=0; }
	decf	(LedRamUpdate@chr_boot_cnt),f
	
l6982:	
	movf	((LedRamUpdate@chr_boot_cnt)),w
	btfss	status,2
	goto	u5121
	goto	u5120
u5121:
	goto	l2138
u5120:
	
l6984:	
	bcf	(_Flag_chr_boot/8),(_Flag_chr_boot)&7
	goto	l6998
	line	174
	
l2138:	
	line	175
;display.c: 174: }
;display.c: 175: switch(chr_boot_cnt)
	goto	l6998
	line	177
	
l6986:	
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(03Ch)
	fcall	_DisPlayIcon
	goto	l7010
	line	178
	
l6988:	
	clrf	(DisPlayIcon@icon_sel)
	incf	(DisPlayIcon@icon_sel),f
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(070h)
	fcall	_DisPlayIcon
	goto	l7010
	line	179
	
l6990:	
	clrf	(DisPlayIcon@icon_sel)
	incf	(DisPlayIcon@icon_sel),f
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(08h)
	fcall	_DisPlayIcon
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(03h)
	fcall	_DisPlayIcon
	goto	l7010
	line	180
	
l6992:	
	movlw	low(03h)
	movwf	(DisPlayNum@dig_sel)
	movlw	low(058h)
	fcall	_DisPlayNum
	goto	l7010
	line	181
	
l6994:	
	clrf	(DisPlayIcon@icon_sel)
	incf	(DisPlayIcon@icon_sel),f
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(07h)
	fcall	_DisPlayIcon
	goto	l7010
	line	175
	
l6998:	
	movf	(LedRamUpdate@chr_boot_cnt),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 1 to 5
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           14     9 (fixed)
; simple_byte           16     9 (average)
; jumptable            263     9 (fixed)
;	Chosen strategy is direct_byte

	addlw	-1
	skipc
goto l2151
	movwf fsr
	movlw	5
	subwf	fsr,w
skipnc
goto l2151
movlw high(S7340)
movwf pclath
	movlw low(S7340)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S7340:
	ljmp	l6986
	ljmp	l6988
	ljmp	l6990
	ljmp	l6992
	ljmp	l6994
psect	text10

	line	187
	
l7000:	
;display.c: 185: else
;display.c: 186: {
;display.c: 187: DisPlayNum(bat_percent,0X03);
	movlw	low(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(DisPlayNum@dig_sel)
	movf	(_bat_percent),w
	fcall	_DisPlayNum
	line	188
;display.c: 188: DisPlayIcon(0X08,1,1);
	clrf	(DisPlayIcon@icon_sel)
	incf	(DisPlayIcon@icon_sel),f
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(08h)
	fcall	_DisPlayIcon
	line	189
;display.c: 189: DisPlayIcon(0X02,2,1);
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(02h)
	fcall	_DisPlayIcon
	line	190
	
l7002:	
;display.c: 190: if(Flag_chr)
	btfss	(_Flag_chr/8),(_Flag_chr)&7
	goto	u5131
	goto	u5130
u5131:
	goto	l7006
u5130:
	line	191
	
l7004:	
;display.c: 191: { DisPlayIcon(0X08,2,1); }
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(08h)
	fcall	_DisPlayIcon
	goto	l7010
	line	193
	
l7006:	
;display.c: 192: else
;display.c: 193: { DisPlayIcon(0X04,2,1); }
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(04h)
	fcall	_DisPlayIcon
	goto	l7010
	line	194
	
l2151:	
	line	195
;display.c: 194: }
;display.c: 195: }
	goto	l7010
	line	196
	
l2136:	
	line	198
;display.c: 196: else
;display.c: 197: {
;display.c: 198: Flag_chr_boot=1;
	bsf	(_Flag_chr_boot/8),(_Flag_chr_boot)&7
	line	199
;display.c: 199: Flag_scan_dir=1; timer_chr_boot=0; chr_boot_cnt=0;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_Flag_scan_dir/8),(_Flag_scan_dir)&7
	
l7008:	
	clrf	(LedRamUpdate@timer_chr_boot)
	clrf	(LedRamUpdate@chr_boot_cnt)
	line	202
	
l7010:	
;display.c: 200: }
;display.c: 202: if(Flag_xi_alarm)
	btfss	(_Flag_xi_alarm/8),(_Flag_xi_alarm)&7
	goto	u5141
	goto	u5140
u5141:
	goto	l7032
u5140:
	line	204
	
l7012:	
;display.c: 203: {
;display.c: 204: if(timer_xi<50) { DisPlayIcon(0X20,2,1); }
	movlw	low(032h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(LedRamUpdate@timer_xi),w
	skipnc
	goto	u5151
	goto	u5150
u5151:
	goto	l7016
u5150:
	
l7014:	
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(020h)
	fcall	_DisPlayIcon
	line	205
	
l7016:	
;display.c: 205: timer_xi++; if(timer_xi>100) { timer_xi=0; alarm_xi_cnt++; }
	bcf	status, 5	;RP0=0, select bank0
	incf	(LedRamUpdate@timer_xi),f
	
l7018:	
	movlw	low(065h)
	subwf	(LedRamUpdate@timer_xi),w
	skipc
	goto	u5161
	goto	u5160
u5161:
	goto	l7024
u5160:
	
l7020:	
	clrf	(LedRamUpdate@timer_xi)
	
l7022:	
	incf	(LedRamUpdate@alarm_xi_cnt),f
	line	206
	
l7024:	
;display.c: 206: if(Flag_xi) alarm_xi_cnt=0;
	btfss	(_Flag_xi/8),(_Flag_xi)&7
	goto	u5171
	goto	u5170
u5171:
	goto	l7028
u5170:
	
l7026:	
	clrf	(LedRamUpdate@alarm_xi_cnt)
	line	207
	
l7028:	
;display.c: 207: if(alarm_xi_cnt>=5) Flag_xi_alarm=0;
	movlw	low(05h)
	subwf	(LedRamUpdate@alarm_xi_cnt),w
	skipc
	goto	u5181
	goto	u5180
u5181:
	goto	l7034
u5180:
	
l7030:	
	bcf	(_Flag_xi_alarm/8),(_Flag_xi_alarm)&7
	goto	l7034
	line	209
	
l7032:	
;display.c: 209: else{ alarm_xi_cnt=0; timer_xi=0; }
	bcf	status, 5	;RP0=0, select bank0
	clrf	(LedRamUpdate@alarm_xi_cnt)
	clrf	(LedRamUpdate@timer_xi)
	line	211
	
l7034:	
;display.c: 211: if(Flag_lk_alarm)
	btfss	(_Flag_lk_alarm/8),(_Flag_lk_alarm)&7
	goto	u5191
	goto	u5190
u5191:
	goto	l7058
u5190:
	line	213
	
l7036:	
;display.c: 212: {
;display.c: 213: Flag_low_alarm=0;
	bcf	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	line	214
;display.c: 214: Flag_on=0;
	bcf	(_Flag_on/8),(_Flag_on)&7
	line	215
	
l7038:	
;display.c: 215: if(timer_lk<50) { DisPlayIcon(0X10,2,1); }
	movlw	low(032h)
	subwf	(LedRamUpdate@timer_lk),w
	skipnc
	goto	u5201
	goto	u5200
u5201:
	goto	l7042
u5200:
	
l7040:	
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(010h)
	fcall	_DisPlayIcon
	line	216
	
l7042:	
;display.c: 216: timer_lk++; if(timer_lk>100) { timer_lk=0; alarm_lk_cnt++; }
	bcf	status, 5	;RP0=0, select bank0
	incf	(LedRamUpdate@timer_lk),f
	
l7044:	
	movlw	low(065h)
	subwf	(LedRamUpdate@timer_lk),w
	skipc
	goto	u5211
	goto	u5210
u5211:
	goto	l7050
u5210:
	
l7046:	
	clrf	(LedRamUpdate@timer_lk)
	
l7048:	
	incf	(LedRamUpdate@alarm_lk_cnt),f
	line	217
	
l7050:	
;display.c: 217: if(Flag_key_long) alarm_lk_cnt=0;
	btfss	(_Flag_key_long/8),(_Flag_key_long)&7
	goto	u5221
	goto	u5220
u5221:
	goto	l7054
u5220:
	
l7052:	
	clrf	(LedRamUpdate@alarm_lk_cnt)
	line	218
	
l7054:	
;display.c: 218: if(alarm_lk_cnt>=5) Flag_lk_alarm=0;
	movlw	low(05h)
	subwf	(LedRamUpdate@alarm_lk_cnt),w
	skipc
	goto	u5231
	goto	u5230
u5231:
	goto	l7060
u5230:
	
l7056:	
	bcf	(_Flag_lk_alarm/8),(_Flag_lk_alarm)&7
	goto	l7060
	line	221
	
l7058:	
;display.c: 220: else
;display.c: 221: { alarm_lk_cnt=0; timer_lk=0; }
	clrf	(LedRamUpdate@alarm_lk_cnt)
	clrf	(LedRamUpdate@timer_lk)
	line	223
	
l7060:	
;display.c: 223: if(Flag_lk_set){
	btfss	(_Flag_lk_set/8),(_Flag_lk_set)&7
	goto	u5241
	goto	u5240
u5241:
	goto	l7066
u5240:
	line	224
	
l7062:	
;display.c: 224: if(Flag_lk) DisPlayIcon(0X70,1,1);
	btfss	(_Flag_lk/8),(_Flag_lk)&7
	goto	u5251
	goto	u5250
u5251:
	goto	l2168
u5250:
	
l7064:	
	clrf	(DisPlayIcon@icon_sel)
	incf	(DisPlayIcon@icon_sel),f
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(070h)
	fcall	_DisPlayIcon
	
l2168:	
	line	225
;display.c: 225: DisPlayIcon(0X01,2,1);
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(01h)
	fcall	_DisPlayIcon
	line	226
;display.c: 226: DisPlayNum(lock_count_down,0X02);
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(DisPlayNum@dig_sel)
	movf	(_lock_count_down),w
	fcall	_DisPlayNum
	line	229
	
l7066:	
;display.c: 227: }
;display.c: 229: if(Flag_on)
	btfss	(_Flag_on/8),(_Flag_on)&7
	goto	u5261
	goto	u5260
u5261:
	goto	l2169
u5260:
	line	231
	
l7068:	
;display.c: 230: {
;display.c: 231: DisPlayIcon(0X08,1,1);
	clrf	(DisPlayIcon@icon_sel)
	incf	(DisPlayIcon@icon_sel),f
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(08h)
	fcall	_DisPlayIcon
	line	232
;display.c: 232: DisPlayIcon(0X02,2,1);
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(02h)
	fcall	_DisPlayIcon
	line	233
	
l7070:	
;display.c: 233: if(Flag_on_boot)
	btfss	(_Flag_on_boot/8),(_Flag_on_boot)&7
	goto	u5271
	goto	u5270
u5271:
	goto	l7116
u5270:
	line	235
	
l7072:	
;display.c: 234: {
;display.c: 235: timer_add++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(LedRamUpdate@timer_add),f
	line	236
	
l7074:	
;display.c: 236: if(timer_add>=20)
	movlw	low(014h)
	subwf	(LedRamUpdate@timer_add),w
	skipc
	goto	u5281
	goto	u5280
u5281:
	goto	l7114
u5280:
	line	238
	
l7076:	
;display.c: 237: {
;display.c: 238: timer_add=0;
	clrf	(LedRamUpdate@timer_add)
	line	239
	
l7078:	
;display.c: 239: if(Flag_ledcp_dir)
	btfss	(_Flag_ledcp_dir/8),(_Flag_ledcp_dir)&7
	goto	u5291
	goto	u5290
u5291:
	goto	l7090
u5290:
	line	240
	
l7080:	
;display.c: 240: { led_cp_cnt++;if(led_cp_cnt>2){led_cp_cnt=2;Flag_ledcp_dir=0;led_boot_cnt++;} }
	incf	(LedRamUpdate@led_cp_cnt),f
	
l7082:	
	movlw	low(03h)
	subwf	(LedRamUpdate@led_cp_cnt),w
	skipc
	goto	u5301
	goto	u5300
u5301:
	goto	l7098
u5300:
	
l7084:	
	movlw	low(02h)
	movwf	(LedRamUpdate@led_cp_cnt)
	
l7086:	
	bcf	(_Flag_ledcp_dir/8),(_Flag_ledcp_dir)&7
	
l7088:	
	incf	(LedRamUpdate@led_boot_cnt),f
	goto	l7098
	line	242
	
l7090:	
;display.c: 241: else
;display.c: 242: { led_cp_cnt--;if(led_cp_cnt==0){ led_cp_cnt=0; Flag_ledcp_dir=1;} }
	decf	(LedRamUpdate@led_cp_cnt),f
	
l7092:	
	movf	((LedRamUpdate@led_cp_cnt)),w
	btfss	status,2
	goto	u5311
	goto	u5310
u5311:
	goto	l7098
u5310:
	
l7094:	
	clrf	(LedRamUpdate@led_cp_cnt)
	
l7096:	
	bsf	(_Flag_ledcp_dir/8),(_Flag_ledcp_dir)&7
	line	243
	
l7098:	
;display.c: 243: if(led_boot_cnt>=3) Flag_on_boot=0;
	movlw	low(03h)
	subwf	(LedRamUpdate@led_boot_cnt),w
	skipc
	goto	u5321
	goto	u5320
u5321:
	goto	l7102
u5320:
	
l7100:	
	bcf	(_Flag_on_boot/8),(_Flag_on_boot)&7
	line	245
	
l7102:	
;display.c: 245: if(led_cp_cnt==0) led_cp=0X00;
	movf	((LedRamUpdate@led_cp_cnt)),w
	btfss	status,2
	goto	u5331
	goto	u5330
u5331:
	goto	l7106
u5330:
	
l7104:	
	clrf	(LedRamUpdate@led_cp)
	line	246
	
l7106:	
;display.c: 246: if(led_cp_cnt==1) led_cp=0X02;
		decf	((LedRamUpdate@led_cp_cnt)),w
	btfss	status,2
	goto	u5341
	goto	u5340
u5341:
	goto	l7110
u5340:
	
l7108:	
	movlw	low(02h)
	movwf	(LedRamUpdate@led_cp)
	line	247
	
l7110:	
;display.c: 247: if(led_cp_cnt==2) led_cp=0X02|0X01;
		movlw	2
	xorwf	((LedRamUpdate@led_cp_cnt)),w
	btfss	status,2
	goto	u5351
	goto	u5350
u5351:
	goto	l7114
u5350:
	
l7112:	
	movlw	low(03h)
	movwf	(LedRamUpdate@led_cp)
	line	249
	
l7114:	
;display.c: 248: }
;display.c: 249: DisPlayNum(bat_percent,led_cp);
	movf	(LedRamUpdate@led_cp),w
	movwf	(DisPlayNum@dig_sel)
	movf	(_bat_percent),w
	fcall	_DisPlayNum
	line	250
;display.c: 250: }
	goto	l7140
	line	251
	
l7116:	
;display.c: 251: else { DisPlayNum(bat_percent,0X03); }
	movlw	low(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(DisPlayNum@dig_sel)
	movf	(_bat_percent),w
	fcall	_DisPlayNum
	goto	l7140
	line	255
	
l2169:	
;display.c: 255: else if(Flag_low_alarm)
	btfss	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	goto	u5361
	goto	u5360
u5361:
	goto	l2182
u5360:
	line	257
	
l7118:	
;display.c: 256: {
;display.c: 257: DisPlayIcon(0X08,1,1);
	clrf	(DisPlayIcon@icon_sel)
	incf	(DisPlayIcon@icon_sel),f
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(08h)
	fcall	_DisPlayIcon
	line	258
;display.c: 258: DisPlayIcon(0X02,2,1);
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(02h)
	fcall	_DisPlayIcon
	line	259
	
l7120:	
;display.c: 259: if(timer_add<100) { DisPlayNum(bat_percent,0X03); DisPlayIcon(0X08,2,1); }
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(LedRamUpdate@timer_add),w
	skipnc
	goto	u5371
	goto	u5370
u5371:
	goto	l7124
u5370:
	
l7122:	
	movlw	low(03h)
	movwf	(DisPlayNum@dig_sel)
	movf	(_bat_percent),w
	fcall	_DisPlayNum
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(08h)
	fcall	_DisPlayIcon
	line	260
	
l7124:	
;display.c: 260: timer_add++; if(timer_add>200) { timer_add=0; alarm_low_cnt++; }
	bcf	status, 5	;RP0=0, select bank0
	incf	(LedRamUpdate@timer_add),f
	
l7126:	
	movlw	low(0C9h)
	subwf	(LedRamUpdate@timer_add),w
	skipc
	goto	u5381
	goto	u5380
u5381:
	goto	l7132
u5380:
	
l7128:	
	clrf	(LedRamUpdate@timer_add)
	
l7130:	
	incf	(LedRamUpdate@alarm_low_cnt),f
	line	261
	
l7132:	
;display.c: 261: if(alarm_low_cnt>4) Flag_low_alarm=0;
	movlw	low(05h)
	subwf	(LedRamUpdate@alarm_low_cnt),w
	skipc
	goto	u5391
	goto	u5390
u5391:
	goto	l2185
u5390:
	
l7134:	
	bcf	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	
l2185:	
	line	262
;display.c: 262: if(Flag_low) alarm_low_cnt=0;
	btfss	(_Flag_low/8),(_Flag_low)&7
	goto	u5401
	goto	u5400
u5401:
	goto	l7140
u5400:
	
l7136:	
	clrf	(LedRamUpdate@alarm_low_cnt)
	goto	l7140
	line	264
	
l2182:	
	line	266
;display.c: 264: else
;display.c: 265: {
;display.c: 266: Flag_on_boot=1; Flag_ledcp_dir=1; led_cp=0; led_cp_cnt=0; led_boot_cnt=0;
	bsf	(_Flag_on_boot/8),(_Flag_on_boot)&7
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_Flag_ledcp_dir/8),(_Flag_ledcp_dir)&7
	
l7138:	
	clrf	(LedRamUpdate@led_cp)
	clrf	(LedRamUpdate@led_cp_cnt)
	clrf	(LedRamUpdate@led_boot_cnt)
	line	267
;display.c: 267: timer_add=0; alarm_low_cnt=0;
	clrf	(LedRamUpdate@timer_add)
	clrf	(LedRamUpdate@alarm_low_cnt)
	line	270
	
l7140:	
;display.c: 268: }
;display.c: 270: if(Flag_off)
	btfss	(_Flag_off/8),(_Flag_off)&7
	goto	u5411
	goto	u5410
u5411:
	goto	l7156
u5410:
	line	272
	
l7142:	
;display.c: 271: {
;display.c: 272: timer_off++; if(timer_off>=250) Flag_off=0;
	bcf	status, 5	;RP0=0, select bank0
	incf	(LedRamUpdate@timer_off),f
	
l7144:	
	movlw	low(0FAh)
	subwf	(LedRamUpdate@timer_off),w
	skipc
	goto	u5421
	goto	u5420
u5421:
	goto	l7148
u5420:
	
l7146:	
	bcf	(_Flag_off/8),(_Flag_off)&7
	line	273
	
l7148:	
;display.c: 273: DisPlayIcon(0X07,1,1);
	clrf	(DisPlayIcon@icon_sel)
	incf	(DisPlayIcon@icon_sel),f
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(07h)
	fcall	_DisPlayIcon
	line	274
	
l7150:	
;display.c: 274: if(time_minute)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_time_minute)),w
	btfsc	status,2
	goto	u5431
	goto	u5430
u5431:
	goto	l7154
u5430:
	line	276
	
l7152:	
;display.c: 275: {
;display.c: 276: DisPlayNum(time_minute,0X03);
	movlw	low(03h)
	movwf	(DisPlayNum@dig_sel)
	movf	(_time_minute),w
	fcall	_DisPlayNum
	line	277
;display.c: 277: DisPlayIcon(0X02,2,1);
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(02h)
	fcall	_DisPlayIcon
	line	278
;display.c: 278: }
	goto	l7158
	line	281
	
l7154:	
;display.c: 279: else
;display.c: 280: {
;display.c: 281: DisPlayNum(time_second,0X03);
	movlw	low(03h)
	movwf	(DisPlayNum@dig_sel)
	movf	(_time_second),w
	fcall	_DisPlayNum
	line	282
;display.c: 282: DisPlayIcon(0X01,2,1);
	movlw	low(02h)
	movwf	(DisPlayIcon@icon_sel)
	clrf	(DisPlayIcon@icon_sta)
	incf	(DisPlayIcon@icon_sta),f
	movlw	low(01h)
	fcall	_DisPlayIcon
	goto	l7158
	line	285
	
l7156:	
;display.c: 285: else timer_off=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(LedRamUpdate@timer_off)
	line	287
	
l7158:	
;display.c: 287: LED_RAM[0]=LED_RAM_R[0];
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED_RAM_R)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_LED_RAM)
	line	288
	
l7160:	
;display.c: 288: LED_RAM[1]=LED_RAM_R[1];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_LED_RAM_R)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_LED_RAM)+01h
	line	289
	
l7162:	
;display.c: 289: LED_RAM[2]=LED_RAM_R[2];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_LED_RAM_R)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_LED_RAM)+02h
	line	290
	
l7164:	
;display.c: 290: LED_RAM[3]=LED_RAM_R[3];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_LED_RAM_R)^080h+03h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_LED_RAM)+03h
	line	291
	
l2193:	
	return
	opt stack 0
GLOBAL	__end_of_LedRamUpdate
	__end_of_LedRamUpdate:
	signat	_LedRamUpdate,89
	global	_DisPlayNum

;; *************** function _DisPlayNum *****************
;; Defined at:
;;		line 98 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
;; Parameters:    Size  Location     Type
;;  dis_num         1    wreg     unsigned char 
;;  dig_sel         1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dis_num         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___lbdiv
;;		___lbmod
;; This function is called by:
;;		_LedRamUpdate
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	line	98
global __ptext11
__ptext11:	;psect for function _DisPlayNum
psect	text11
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
	line	98
	global	__size_of_DisPlayNum
	__size_of_DisPlayNum	equ	__end_of_DisPlayNum-_DisPlayNum
	
_DisPlayNum:	
;incstack = 0
	opt	stack 2
; Regs used in _DisPlayNum: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;DisPlayNum@dis_num stored from wreg
	movwf	(DisPlayNum@dis_num)
	line	101
	
l6552:	
;display.c: 101: if(dis_num>99) dis_num=99;
	movlw	low(064h)
	subwf	(DisPlayNum@dis_num),w
	skipc
	goto	u4301
	goto	u4300
u4301:
	goto	l6556
u4300:
	
l6554:	
	movlw	low(063h)
	movwf	(DisPlayNum@dis_num)
	line	103
	
l6556:	
;display.c: 103: Flag_dig1=1;
	bsf	(_Flag_dig1/8),(_Flag_dig1)&7
	line	104
	
l6558:	
;display.c: 104: Flag_dig2=1;
	bsf	(_Flag_dig2/8),(_Flag_dig2)&7
	line	107
	
l6560:	
;display.c: 107: if(dig_sel==0) { Flag_dig1=0; Flag_dig2=0; }
	movf	((DisPlayNum@dig_sel)),w
	btfss	status,2
	goto	u4311
	goto	u4310
u4311:
	goto	l2081
u4310:
	
l6562:	
	bcf	(_Flag_dig1/8),(_Flag_dig1)&7
	bcf	(_Flag_dig2/8),(_Flag_dig2)&7
	
l2081:	
	line	108
;display.c: 108: if(Flag_dig1&&(dig_sel&0x01)) LED_RAM_R[0]=LEDCode[dis_num/10]; else LED_RAM_R[0]=0;
	btfss	(_Flag_dig1/8),(_Flag_dig1)&7
	goto	u4321
	goto	u4320
u4321:
	goto	l6568
u4320:
	
l6564:	
	btfss	(DisPlayNum@dig_sel),(0)&7
	goto	u4331
	goto	u4330
u4331:
	goto	l6568
u4330:
	
l6566:	
	movlw	low(0Ah)
	movwf	(___lbdiv@divisor)
	movf	(DisPlayNum@dis_num),w
	fcall	___lbdiv
	addlw	low((((_LEDCode)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LED_RAM_R)^080h
	goto	l6570
	
l6568:	
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED_RAM_R)^080h
	line	109
	
l6570:	
;display.c: 109: if(Flag_dig2&&(dig_sel&0x02)) LED_RAM_R[1]=LEDCode[dis_num%10]; else LED_RAM_R[1]=0;
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_Flag_dig2/8),(_Flag_dig2)&7
	goto	u4341
	goto	u4340
u4341:
	goto	l6576
u4340:
	
l6572:	
	btfss	(DisPlayNum@dig_sel),(1)&7
	goto	u4351
	goto	u4350
u4351:
	goto	l6576
u4350:
	
l6574:	
	movlw	low(0Ah)
	movwf	(___lbmod@divisor)
	movf	(DisPlayNum@dis_num),w
	fcall	___lbmod
	addlw	low((((_LEDCode)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_LED_RAM_R)^080h+01h
	goto	l2086
	
l6576:	
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_LED_RAM_R)^080h+01h
	line	111
	
l2086:	
	return
	opt stack 0
GLOBAL	__end_of_DisPlayNum
	__end_of_DisPlayNum:
	signat	_DisPlayNum,8313
	global	___lbmod

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 4 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    0[BANK0 ] unsigned char 
;;  rem             1    2[BANK0 ] unsigned char 
;;  counter         1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       3       0
;;      Temps:          1       0       0
;;      Totals:         2       3       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisPlayNum
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbmod.c"
	line	4
global __ptext12
__ptext12:	;psect for function ___lbmod
psect	text12
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbmod.c"
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
	
l6506:	
	movlw	low(08h)
	movwf	(___lbmod@counter)
	line	10
	
l6508:	
	clrf	(___lbmod@rem)
	line	12
	
l6510:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u4225:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u4225
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l6512:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l6514:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u4231
	goto	u4230
u4231:
	goto	l6518
u4230:
	line	15
	
l6516:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l6518:	
	decfsz	(___lbmod@counter),f
	goto	u4241
	goto	u4240
u4241:
	goto	l6510
u4240:
	line	17
	
l6520:	
	movf	(___lbmod@rem),w
	line	18
	
l3903:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
	signat	___lbmod,8313
	global	___lbdiv

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 4 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    0[BANK0 ] unsigned char 
;;  quotient        1    2[BANK0 ] unsigned char 
;;  counter         1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         1       3       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisPlayNum
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbdiv.c"
	line	4
global __ptext13
__ptext13:	;psect for function ___lbdiv
psect	text13
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lbdiv.c"
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
	
l6482:	
	clrf	(___lbdiv@quotient)
	line	10
	
l6484:	
	movf	((___lbdiv@divisor)),w
	btfsc	status,2
	goto	u4181
	goto	u4180
u4181:
	goto	l6502
u4180:
	line	11
	
l6486:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l6490
	
l3892:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l6488:	
	incf	(___lbdiv@counter),f
	line	12
	
l6490:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u4191
	goto	u4190
u4191:
	goto	l3892
u4190:
	line	16
	
l3894:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l6492:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u4201
	goto	u4200
u4201:
	goto	l6498
u4200:
	line	19
	
l6494:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l6496:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l6498:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l6500:	
	decfsz	(___lbdiv@counter),f
	goto	u4211
	goto	u4210
u4211:
	goto	l3894
u4210:
	line	25
	
l6502:	
	movf	(___lbdiv@quotient),w
	line	26
	
l3897:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_DisPlayIcon

;; *************** function _DisPlayIcon *****************
;; Defined at:
;;		line 120 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
;; Parameters:    Size  Location     Type
;;  icon_seg        1    wreg     unsigned char 
;;  icon_sel        1    4[COMMON] unsigned char 
;;  icon_sta        1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  icon_seg        1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         2       1       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LedRamUpdate
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
	line	120
global __ptext14
__ptext14:	;psect for function _DisPlayIcon
psect	text14
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
	line	120
	global	__size_of_DisPlayIcon
	__size_of_DisPlayIcon	equ	__end_of_DisPlayIcon-_DisPlayIcon
	
_DisPlayIcon:	
;incstack = 0
	opt	stack 3
; Regs used in _DisPlayIcon: [wreg-fsr0h+status,2+status,0]
;DisPlayIcon@icon_seg stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(DisPlayIcon@icon_seg)
	line	122
	
l6578:	
;display.c: 122: switch(icon_sel)
	goto	l6594
	line	124
	
l6580:	
	movf	((DisPlayIcon@icon_sta)),w
	btfsc	status,2
	goto	u4361
	goto	u4360
u4361:
	goto	l2098
u4360:
	
l6582:	
	movf	(DisPlayIcon@icon_seg),w
	bsf	status, 5	;RP0=1, select bank1
	iorwf	0+(_LED_RAM_R)^080h+02h,f
	bcf	status, 5	;RP0=0, select bank0
	movf	(DisPlayIcon@icon_seg),w
	bsf	status, 5	;RP0=1, select bank1
	iorwf	0+(_LED_RAM_R)^080h+03h,f
	goto	l2098
	line	125
	
l6584:	
	movf	((DisPlayIcon@icon_sta)),w
	btfsc	status,2
	goto	u4371
	goto	u4370
u4371:
	goto	l2098
u4370:
	
l6586:	
	movf	(DisPlayIcon@icon_seg),w
	bsf	status, 5	;RP0=1, select bank1
	iorwf	0+(_LED_RAM_R)^080h+02h,f
	goto	l2098
	line	126
	
l6588:	
	movf	((DisPlayIcon@icon_sta)),w
	btfsc	status,2
	goto	u4381
	goto	u4380
u4381:
	goto	l2098
u4380:
	
l6590:	
	movf	(DisPlayIcon@icon_seg),w
	bsf	status, 5	;RP0=1, select bank1
	iorwf	0+(_LED_RAM_R)^080h+03h,f
	goto	l2098
	line	122
	
l6594:	
	movf	(DisPlayIcon@icon_sel),w
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
goto l2098
movlw high(S7342)
movwf pclath
	movlw low(S7342)
	addwf fsr,w
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S7342:
	ljmp	l6580
	ljmp	l6584
	ljmp	l6588
psect	text14

	line	129
	
l2098:	
	return
	opt stack 0
GLOBAL	__end_of_DisPlayIcon
	__end_of_DisPlayIcon:
	signat	_DisPlayIcon,12409
	global	_BtnScan

;; *************** function _BtnScan *****************
;; Defined at:
;;		line 16 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\Kscan.C"
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\Kscan.C"
	line	16
global __ptext15
__ptext15:	;psect for function _BtnScan
psect	text15
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\Kscan.C"
	line	16
	global	__size_of_BtnScan
	__size_of_BtnScan	equ	__end_of_BtnScan-_BtnScan
	
_BtnScan:	
;incstack = 0
	opt	stack 4
; Regs used in _BtnScan: [wreg+status,2]
	line	18
	
l5678:	
;Kscan.C: 18: ReadKeyTmp=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_ReadKeyTmp)
	line	20
	
l5680:	
;Kscan.C: 20: if(Flag_key_usb) ReadKeyTmp&=~(1<<0); else ReadKeyTmp|=(1<<0);
	btfss	(_Flag_key_usb/8),(_Flag_key_usb)&7
	goto	u2841
	goto	u2840
u2841:
	goto	l2835
u2840:
	
l5682:	
	bcf	(_ReadKeyTmp)+(0/8),(0)&7
	goto	l2836
	
l2835:	
	bsf	(_ReadKeyTmp)+(0/8),(0)&7
	
l2836:	
	line	21
;Kscan.C: 21: if(Flag_key_set) ReadKeyTmp&=~(1<<1); else ReadKeyTmp|=(1<<1);
	btfss	(_Flag_key_set/8),(_Flag_key_set)&7
	goto	u2851
	goto	u2850
u2851:
	goto	l2837
u2850:
	
l5684:	
	bcf	(_ReadKeyTmp)+(1/8),(1)&7
	goto	l5686
	
l2837:	
	bsf	(_ReadKeyTmp)+(1/8),(1)&7
	line	24
	
l5686:	
;Kscan.C: 24: if(ReadKeyOld==ReadKeyTmp)
	movf	(_ReadKeyOld),w
	xorwf	(_ReadKeyTmp),w
	skipz
	goto	u2861
	goto	u2860
u2861:
	goto	l5694
u2860:
	line	27
	
l5688:	
;Kscan.C: 25: {
;Kscan.C: 27: ReadKey=ReadKeyTmp;
	movf	(_ReadKeyTmp),w
	movwf	(_ReadKey)
	line	28
	
l5690:	
;Kscan.C: 28: if((ReadKey&0x02)!=0x02) { Flag_Btn_Release=1; Flag_key_long=0;}
	btfsc	(_ReadKey),(1)&7
	goto	u2871
	goto	u2870
u2871:
	goto	l5694
u2870:
	
l5692:	
	bsf	(_Flag_Btn_Release/8),(_Flag_Btn_Release)&7
	bcf	(_Flag_key_long/8),(_Flag_key_long)&7
	line	30
	
l5694:	
;Kscan.C: 29: }
;Kscan.C: 30: ReadKeyOld=ReadKeyTmp;
	movf	(_ReadKeyTmp),w
	movwf	(_ReadKeyOld)
	line	31
	
l2841:	
	return
	opt stack 0
GLOBAL	__end_of_BtnScan
	__end_of_BtnScan:
	signat	_BtnScan,89
	global	_BeepProc

;; *************** function _BeepProc *****************
;; Defined at:
;;		line 215 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
	line	215
global __ptext16
__ptext16:	;psect for function _BeepProc
psect	text16
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
	line	215
	global	__size_of_BeepProc
	__size_of_BeepProc	equ	__end_of_BeepProc-_BeepProc
	
_BeepProc:	
;incstack = 0
	opt	stack 4
; Regs used in _BeepProc: [wreg+status,2+status,0]
	line	217
	
l5652:	
;AppProc.C: 217: if(alarm_beep_cnt)
	movf	((_alarm_beep_cnt)),w
	btfsc	status,2
	goto	u2801
	goto	u2800
u2801:
	goto	l5670
u2800:
	line	219
	
l5654:	
;AppProc.C: 218: {
;AppProc.C: 219: if(Flag_beep_boot) { Flag_beep_boot=0; Flag_beep=1; }
	btfss	(_Flag_beep_boot/8),(_Flag_beep_boot)&7
	goto	u2811
	goto	u2810
u2811:
	goto	l5658
u2810:
	
l5656:	
	bcf	(_Flag_beep_boot/8),(_Flag_beep_boot)&7
	bsf	(_Flag_beep/8),(_Flag_beep)&7
	line	221
	
l5658:	
;AppProc.C: 221: timer_beep++;
	incf	(_timer_beep),f
	line	222
	
l5660:	
;AppProc.C: 222: if(timer_beep>speed_beep) { timer_beep=0; Flag_beep=~Flag_beep; if(!Flag_beep) alarm_beep_cnt--; }
	movf	(_timer_beep),w
	subwf	(_speed_beep),w
	skipnc
	goto	u2821
	goto	u2820
u2821:
	goto	l3596
u2820:
	
l5662:	
	clrf	(_timer_beep)
	
l5664:	
	movlw	1<<((_Flag_beep)&7)
	xorwf	((_Flag_beep)/8),f
	
l5666:	
	btfsc	(_Flag_beep/8),(_Flag_beep)&7
	goto	u2831
	goto	u2830
u2831:
	goto	l3596
u2830:
	
l5668:	
	decf	(_alarm_beep_cnt),f
	goto	l3596
	line	226
	
l5670:	
;AppProc.C: 224: else
;AppProc.C: 225: {
;AppProc.C: 226: timer_beep=0;
	clrf	(_timer_beep)
	line	227
	
l5672:	
;AppProc.C: 227: Flag_beep=0;
	bcf	(_Flag_beep/8),(_Flag_beep)&7
	line	228
	
l5674:	
;AppProc.C: 228: Flag_xi =0;
	bcf	(_Flag_xi/8),(_Flag_xi)&7
	line	229
	
l5676:	
;AppProc.C: 229: Flag_beep_boot=1;
	bsf	(_Flag_beep_boot/8),(_Flag_beep_boot)&7
	line	232
	
l3596:	
	return
	opt stack 0
GLOBAL	__end_of_BeepProc
	__end_of_BeepProc:
	signat	_BeepProc,89
	global	_AppMotor

;; *************** function _AppMotor *****************
;; Defined at:
;;		line 18 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
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
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       2       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ADSample
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	line	18
global __ptext17
__ptext17:	;psect for function _AppMotor
psect	text17
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
	line	18
	global	__size_of_AppMotor
	__size_of_AppMotor	equ	__end_of_AppMotor-_AppMotor
	
_AppMotor:	
;incstack = 0
	opt	stack 3
; Regs used in _AppMotor: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	20
	
l6736:	
;AppProc.C: 20: switch(sta_m)
	goto	l6864
	line	22
;AppProc.C: 21: {
;AppProc.C: 22: case 0:
	
l3499:	
	line	23
;AppProc.C: 23: Flag_on =0;
	bcf	(_Flag_on/8),(_Flag_on)&7
	line	24
;AppProc.C: 24: Flag_low =0;
	bcf	(_Flag_low/8),(_Flag_low)&7
	line	25
;AppProc.C: 25: Flag_xi =0;
	bcf	(_Flag_xi/8),(_Flag_xi)&7
	line	26
;AppProc.C: 26: Flag_iov =0;
	bcf	(_Flag_iov/8),(_Flag_iov)&7
	line	27
;AppProc.C: 27: RA3=0; RB7=1;
	bcf	(43/8),(43)&7	;volatile
	bsf	(55/8),(55)&7	;volatile
	line	28
;AppProc.C: 28: if((ReadKey&0x02)&&Flag_Btn_Release&&(!Flag_lk))
	btfss	(_ReadKey),(1)&7
	goto	u4571
	goto	u4570
u4571:
	goto	l3534
u4570:
	
l6738:	
	btfss	(_Flag_Btn_Release/8),(_Flag_Btn_Release)&7
	goto	u4581
	goto	u4580
u4581:
	goto	l3534
u4580:
	
l6740:	
	btfsc	(_Flag_lk/8),(_Flag_lk)&7
	goto	u4591
	goto	u4590
u4591:
	goto	l3534
u4590:
	line	30
	
l6742:	
;AppProc.C: 29: {
;AppProc.C: 30: Flag_Btn_Release = 0;
	bcf	(_Flag_Btn_Release/8),(_Flag_Btn_Release)&7
	line	31
	
l6744:	
;AppProc.C: 31: debance_hiov_cnt = 0;
	clrf	(_debance_hiov_cnt)
	line	32
;AppProc.C: 32: debance_iov_cnt = 0;
	clrf	(_debance_iov_cnt)
	line	33
;AppProc.C: 33: debance_scp_cnt = 0;
	clrf	(_debance_scp_cnt)
	line	34
;AppProc.C: 34: debance_low_cnt = 0;
	clrf	(_debance_low_cnt)
	line	35
	
l6746:	
;AppProc.C: 35: if(Flag_stop) Flag_low_alarm=1; else { sta_m = 1; RA3=1; RB7=0; }
	btfss	(_Flag_stop/8),(_Flag_stop)&7
	goto	u4601
	goto	u4600
u4601:
	goto	l3501
u4600:
	
l6748:	
	bsf	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	goto	l6750
	
l3501:	
	clrf	(_sta_m)
	incf	(_sta_m),f
	bsf	(43/8),(43)&7	;volatile
	bcf	(55/8),(55)&7	;volatile
	line	36
	
l6750:	
;AppProc.C: 36: time_second=0;
	clrf	(_time_second)
	line	37
;AppProc.C: 37: time_minute=0;
	clrf	(_time_minute)
	line	38
	
l6752:	
;AppProc.C: 38: Flag_off=0;
	bcf	(_Flag_off/8),(_Flag_off)&7
	line	39
;AppProc.C: 39: current_val=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_current_val)^080h
	clrf	(_current_val+1)^080h
	goto	l3534
	line	42
;AppProc.C: 42: case 1:
	
l3504:	
	line	43
;AppProc.C: 43: RA3=1; RB7=0;
	bsf	(43/8),(43)&7	;volatile
	bcf	(55/8),(55)&7	;volatile
	line	44
	
l6754:	
;AppProc.C: 44: timer_motor++;
	incf	(_timer_motor),f
	line	45
	
l6756:	
;AppProc.C: 45: if(timer_motor>=100)
	movlw	low(064h)
	subwf	(_timer_motor),w
	skipc
	goto	u4611
	goto	u4610
u4611:
	goto	l6778
u4610:
	line	47
	
l6758:	
;AppProc.C: 46: {
;AppProc.C: 47: timer_motor=0;
	clrf	(_timer_motor)
	line	48
	
l6760:	
;AppProc.C: 48: time_motor_cnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_time_motor_cnt)^080h,f
	skipnz
	incf	(_time_motor_cnt+1)^080h,f
	line	49
	
l6762:	
;AppProc.C: 49: if(time_motor_cnt>=time_dec_cnt)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_time_dec_cnt),w
	movwf	(??_AppMotor+0)+0
	clrf	(??_AppMotor+0)+0+1
	movf	1+(??_AppMotor+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_time_motor_cnt+1)^080h,w
	skipz
	goto	u4625
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(??_AppMotor+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_time_motor_cnt)^080h,w
u4625:
	skipc
	goto	u4621
	goto	u4620
u4621:
	goto	l3506
u4620:
	line	51
	
l6764:	
;AppProc.C: 50: {
;AppProc.C: 51: time_motor_cnt=0; if(bat_percent) bat_percent--;
	clrf	(_time_motor_cnt)^080h
	clrf	(_time_motor_cnt+1)^080h
	
l6766:	
	bcf	status, 5	;RP0=0, select bank0
	movf	((_bat_percent)),w
	btfsc	status,2
	goto	u4631
	goto	u4630
u4631:
	goto	l3506
u4630:
	
l6768:	
	decf	(_bat_percent),f
	line	52
	
l3506:	
	line	53
;AppProc.C: 52: }
;AppProc.C: 53: time_second++; if(time_second>=60) { time_second=0; if(time_minute<60) time_minute++; }
	bcf	status, 5	;RP0=0, select bank0
	incf	(_time_second),f
	
l6770:	
	movlw	low(03Ch)
	subwf	(_time_second),w
	skipc
	goto	u4641
	goto	u4640
u4641:
	goto	l6778
u4640:
	
l6772:	
	clrf	(_time_second)
	
l6774:	
	movlw	low(03Ch)
	subwf	(_time_minute),w
	skipnc
	goto	u4651
	goto	u4650
u4651:
	goto	l6778
u4650:
	
l6776:	
	incf	(_time_minute),f
	line	56
	
l6778:	
;AppProc.C: 54: }
;AppProc.C: 56: if(bat_percent) { Flag_low=0; Flag_on=1; }
	movf	((_bat_percent)),w
	btfsc	status,2
	goto	u4661
	goto	u4660
u4661:
	goto	l3510
u4660:
	
l6780:	
	bcf	(_Flag_low/8),(_Flag_low)&7
	bsf	(_Flag_on/8),(_Flag_on)&7
	goto	l3511
	line	57
	
l3510:	
	line	58
;AppProc.C: 57: else {
;AppProc.C: 58: if(!Flag_low) { alarm_beep_cnt=3,speed_beep=50; Flag_low=1; }
	btfsc	(_Flag_low/8),(_Flag_low)&7
	goto	u4671
	goto	u4670
u4671:
	goto	l6786
u4670:
	
l6782:	
	movlw	low(03h)
	movwf	(_alarm_beep_cnt)
	movlw	low(032h)
	movwf	(_speed_beep)
	
l6784:	
	bsf	(_Flag_low/8),(_Flag_low)&7
	line	59
	
l6786:	
;AppProc.C: 59: Flag_on=0; Flag_low_alarm=1;
	bcf	(_Flag_on/8),(_Flag_on)&7
	
l6788:	
	bsf	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	line	60
	
l3511:	
	line	63
;AppProc.C: 60: }
;AppProc.C: 63: if(bat_val<250) debance_low_cnt++; else debance_low_cnt=0;
	movlw	0
	subwf	(_bat_val+1),w
	movlw	0FAh
	skipnz
	subwf	(_bat_val),w
	skipnc
	goto	u4681
	goto	u4680
u4681:
	goto	l6792
u4680:
	
l6790:	
	incf	(_debance_low_cnt),f
	goto	l6794
	
l6792:	
	clrf	(_debance_low_cnt)
	line	64
	
l6794:	
;AppProc.C: 64: if(debance_low_cnt>200) { Flag_stop=1; bat_percent=0; }
	movlw	low(0C9h)
	subwf	(_debance_low_cnt),w
	skipc
	goto	u4691
	goto	u4690
u4691:
	goto	l6800
u4690:
	
l6796:	
	bsf	(_Flag_stop/8),(_Flag_stop)&7
	
l6798:	
	clrf	(_bat_percent)
	line	67
	
l6800:	
;AppProc.C: 67: if(current_val>38) debance_hiov_cnt++; else debance_hiov_cnt=0;
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_current_val+1)^080h,w
	movlw	027h
	skipnz
	subwf	(_current_val)^080h,w
	skipc
	goto	u4701
	goto	u4700
u4701:
	goto	l6804
u4700:
	
l6802:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(_debance_hiov_cnt),f
	goto	l6806
	
l6804:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_debance_hiov_cnt)
	line	68
	
l6806:	
;AppProc.C: 68: if(debance_hiov_cnt>250) { Flag_xi_alarm=1; Flag_xi=1; alarm_beep_cnt=3,speed_beep=50; }
	movlw	low(0FBh)
	subwf	(_debance_hiov_cnt),w
	skipc
	goto	u4711
	goto	u4710
u4711:
	goto	l3518
u4710:
	
l6808:	
	bsf	(_Flag_xi_alarm/8),(_Flag_xi_alarm)&7
	bsf	(_Flag_xi/8),(_Flag_xi)&7
	
l6810:	
	movlw	low(03h)
	movwf	(_alarm_beep_cnt)
	movlw	low(032h)
	movwf	(_speed_beep)
	
l3518:	
	line	71
;AppProc.C: 71: if(current_scp>58) debance_iov_cnt++; else debance_iov_cnt=0;
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_current_scp+1)^080h,w
	movlw	03Bh
	skipnz
	subwf	(_current_scp)^080h,w
	skipc
	goto	u4721
	goto	u4720
u4721:
	goto	l6814
u4720:
	
l6812:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(_debance_iov_cnt),f
	goto	l6816
	
l6814:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_debance_iov_cnt)
	line	72
	
l6816:	
;AppProc.C: 72: if(debance_iov_cnt>200) Flag_iov=1;
	movlw	low(0C9h)
	subwf	(_debance_iov_cnt),w
	skipc
	goto	u4731
	goto	u4730
u4731:
	goto	l6820
u4730:
	
l6818:	
	bsf	(_Flag_iov/8),(_Flag_iov)&7
	line	75
	
l6820:	
;AppProc.C: 75: if(ADSample(0b00000010))
	movlw	low(02h)
	fcall	_ADSample
	xorlw	0
	skipnz
	goto	u4741
	goto	u4740
u4741:
	goto	l6832
u4740:
	line	77
	
l6822:	
;AppProc.C: 76: {
;AppProc.C: 77: ad_scp=(ADRESH<<4)+(ADRESL>>4);
	movf	(30),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_ad_scp)^080h
	clrf	(_ad_scp+1)^080h
	swapf	(_ad_scp)^080h,f
	swapf	(_ad_scp+1)^080h,f
	movlw	0f0h
	andwf	(_ad_scp+1)^080h,f
	movf	(_ad_scp)^080h,w
	andlw	0fh
	iorwf	(_ad_scp+1)^080h,f
	movlw	0f0h
	andwf	(_ad_scp)^080h,f
	
l6824:	
	swapf	(158)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	addwf	(_ad_scp)^080h,f
	skipnc
	incf	(_ad_scp+1)^080h,f
	line	78
;AppProc.C: 78: ad_scp=ad_scp<<1;
	clrc
	rlf	(_ad_scp)^080h,f
	rlf	(_ad_scp+1)^080h,f
	line	79
	
l6826:	
;AppProc.C: 79: if(ad_scp>ad_bg) debance_scp_cnt++; else debance_scp_cnt=0;
	movf	(_ad_scp+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_ad_bg+1),w
	skipz
	goto	u4755
	bsf	status, 5	;RP0=1, select bank1
	movf	(_ad_scp)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_ad_bg),w
u4755:
	skipnc
	goto	u4751
	goto	u4750
u4751:
	goto	l6830
u4750:
	
l6828:	
	incf	(_debance_scp_cnt),f
	goto	l6832
	
l6830:	
	clrf	(_debance_scp_cnt)
	line	81
	
l6832:	
;AppProc.C: 80: }
;AppProc.C: 81: if(debance_scp_cnt) { sta_m = 0; alarm_beep_cnt=1,speed_beep=10; }
	movf	((_debance_scp_cnt)),w
	btfsc	status,2
	goto	u4761
	goto	u4760
u4761:
	goto	l6840
u4760:
	
l6834:	
	clrf	(_sta_m)
	
l6836:	
	clrf	(_alarm_beep_cnt)
	incf	(_alarm_beep_cnt),f
	
l6838:	
	movlw	low(0Ah)
	movwf	(_speed_beep)
	line	83
	
l6840:	
;AppProc.C: 83: if(((ReadKey&0x02)&&Flag_Btn_Release)||Flag_iov||Flag_stop||Flag_lk)
	btfss	(_ReadKey),(1)&7
	goto	u4771
	goto	u4770
u4771:
	goto	l3530
u4770:
	
l6842:	
	btfsc	(_Flag_Btn_Release/8),(_Flag_Btn_Release)&7
	goto	u4781
	goto	u4780
u4781:
	goto	l3528
u4780:
	
l3530:	
	btfsc	(_Flag_iov/8),(_Flag_iov)&7
	goto	u4791
	goto	u4790
u4791:
	goto	l3528
u4790:
	
l6844:	
	btfsc	(_Flag_stop/8),(_Flag_stop)&7
	goto	u4801
	goto	u4800
u4801:
	goto	l3528
u4800:
	
l6846:	
	btfss	(_Flag_lk/8),(_Flag_lk)&7
	goto	u4811
	goto	u4810
u4811:
	goto	l3534
u4810:
	
l3528:	
	line	85
;AppProc.C: 84: {
;AppProc.C: 85: Flag_Btn_Release = 0;
	bcf	(_Flag_Btn_Release/8),(_Flag_Btn_Release)&7
	line	86
	
l6848:	
;AppProc.C: 86: sta_m = 0;
	clrf	(_sta_m)
	line	87
	
l6850:	
;AppProc.C: 87: Flag_low_alarm=0;
	bcf	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	line	88
	
l6852:	
;AppProc.C: 88: if(Flag_lk) alarm_beep_cnt=3,speed_beep=25; else { Flag_off= 1; alarm_beep_cnt=0,speed_beep=25; }
	btfss	(_Flag_lk/8),(_Flag_lk)&7
	goto	u4821
	goto	u4820
u4821:
	goto	l3531
u4820:
	
l6854:	
	movlw	low(03h)
	movwf	(_alarm_beep_cnt)
	movlw	low(019h)
	movwf	(_speed_beep)
	goto	l3534
	
l3531:	
	bsf	(_Flag_off/8),(_Flag_off)&7
	
l6856:	
	clrf	(_alarm_beep_cnt)
	
l6858:	
	movlw	low(019h)
	movwf	(_speed_beep)
	goto	l3534
	line	92
	
l6860:	
;AppProc.C: 92: sta_m = 0;
	clrf	(_sta_m)
	line	93
;AppProc.C: 93: break;
	goto	l3534
	line	20
	
l6864:	
	movf	(_sta_m),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 1
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte            8     6 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3499
	xorlw	1^0	; case 1
	skipnz
	goto	l3504
	goto	l6860
	opt asmopt_pop

	line	95
	
l3534:	
	return
	opt stack 0
GLOBAL	__end_of_AppMotor
	__end_of_AppMotor:
	signat	_AppMotor,89
	global	_AppChr

;; *************** function _AppChr *****************
;; Defined at:
;;		line 107 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	line	107
global __ptext18
__ptext18:	;psect for function _AppChr
psect	text18
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\AppProc.C"
	line	107
	global	__size_of_AppChr
	__size_of_AppChr	equ	__end_of_AppChr-_AppChr
	
_AppChr:	
;incstack = 0
	opt	stack 4
; Regs used in _AppChr: [wreg-fsr0h+status,2+status,0]
	line	109
	
l5826:	
;AppProc.C: 109: switch(sta_chr)
	goto	l5882
	line	111
;AppProc.C: 110: {
;AppProc.C: 111: case 0:
	
l3546:	
	line	112
;AppProc.C: 112: Flag_usb =0;
	bcf	(_Flag_usb/8),(_Flag_usb)&7
	line	113
;AppProc.C: 113: if(ReadKey&0x01)
	btfss	(_ReadKey),(0)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l3562
u3140:
	line	115
	
l5828:	
;AppProc.C: 114: {
;AppProc.C: 115: debance_usb_cnt++;
	incf	(_debance_usb_cnt),f
	line	116
	
l5830:	
;AppProc.C: 116: if(debance_usb_cnt>20)
	movlw	low(015h)
	subwf	(_debance_usb_cnt),w
	skipc
	goto	u3151
	goto	u3150
u3151:
	goto	l3562
u3150:
	line	118
	
l5832:	
;AppProc.C: 117: {
;AppProc.C: 118: sta_chr =1;
	clrf	(_sta_chr)
	incf	(_sta_chr),f
	line	120
	
l5834:	
;AppProc.C: 120: time_chr_cnt=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_time_chr_cnt)^080h
	clrf	(_time_chr_cnt+1)^080h
	line	122
	
l5836:	
;AppProc.C: 122: alarm_beep_cnt=2,speed_beep=10;
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_alarm_beep_cnt)
	
l5838:	
	movlw	low(0Ah)
	movwf	(_speed_beep)
	line	123
	
l5840:	
;AppProc.C: 123: Flag_low_alarm=0;
	bcf	(_Flag_low_alarm/8),(_Flag_low_alarm)&7
	goto	l3562
	line	128
;AppProc.C: 128: case 1:
	
l3550:	
	line	129
;AppProc.C: 129: Flag_usb=1;
	bsf	(_Flag_usb/8),(_Flag_usb)&7
	line	130
;AppProc.C: 130: Flag_lk=0;
	bcf	(_Flag_lk/8),(_Flag_lk)&7
	line	131
;AppProc.C: 131: Flag_stop=0;
	bcf	(_Flag_stop/8),(_Flag_stop)&7
	line	132
	
l5842:	
;AppProc.C: 132: timer_chr++;
	incf	(_timer_chr),f
	line	133
	
l5844:	
;AppProc.C: 133: if(timer_chr>=100)
	movlw	low(064h)
	subwf	(_timer_chr),w
	skipc
	goto	u3161
	goto	u3160
u3161:
	goto	l5862
u3160:
	line	135
	
l5846:	
;AppProc.C: 134: {
;AppProc.C: 135: timer_chr=0;
	clrf	(_timer_chr)
	line	136
	
l5848:	
;AppProc.C: 136: time_chr_cnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_time_chr_cnt)^080h,f
	skipnz
	incf	(_time_chr_cnt+1)^080h,f
	line	137
	
l5850:	
;AppProc.C: 137: if(time_chr_cnt>=time_chr_add)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_time_chr_add),w
	movwf	(??_AppChr+0)+0
	clrf	(??_AppChr+0)+0+1
	movf	1+(??_AppChr+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_time_chr_cnt+1)^080h,w
	skipz
	goto	u3175
	movf	0+(??_AppChr+0)+0,w
	subwf	(_time_chr_cnt)^080h,w
u3175:
	skipc
	goto	u3171
	goto	u3170
u3171:
	goto	l5858
u3170:
	line	139
	
l5852:	
;AppProc.C: 138: {
;AppProc.C: 139: time_chr_cnt=0;
	clrf	(_time_chr_cnt)^080h
	clrf	(_time_chr_cnt+1)^080h
	line	140
	
l5854:	
;AppProc.C: 140: if(bat_percent<99) bat_percent++;
	movlw	low(063h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_bat_percent),w
	skipnc
	goto	u3181
	goto	u3180
u3181:
	goto	l5858
u3180:
	
l5856:	
	incf	(_bat_percent),f
	line	142
	
l5858:	
;AppProc.C: 141: }
;AppProc.C: 142: if(bat_val<=250) RA4=0; else RA4=1;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_bat_val+1),w
	movlw	0FBh
	skipnz
	subwf	(_bat_val),w
	skipnc
	goto	u3191
	goto	u3190
u3191:
	goto	l3554
u3190:
	
l5860:	
	bcf	(44/8),(44)&7	;volatile
	goto	l5862
	
l3554:	
	bsf	(44/8),(44)&7	;volatile
	line	144
	
l5862:	
;AppProc.C: 143: }
;AppProc.C: 144: if(bat_percent<99) Flag_chr=1; else Flag_chr=0;
	movlw	low(063h)
	subwf	(_bat_percent),w
	skipnc
	goto	u3201
	goto	u3200
u3201:
	goto	l3556
u3200:
	
l5864:	
	bsf	(_Flag_chr/8),(_Flag_chr)&7
	goto	l3557
	
l3556:	
	bcf	(_Flag_chr/8),(_Flag_chr)&7
	
l3557:	
	line	146
;AppProc.C: 146: if(ReadKey&0x01) debance_usb_cnt=0; else debance_usb_cnt++;
	btfss	(_ReadKey),(0)&7
	goto	u3211
	goto	u3210
u3211:
	goto	l5868
u3210:
	
l5866:	
	clrf	(_debance_usb_cnt)
	goto	l5870
	
l5868:	
	incf	(_debance_usb_cnt),f
	line	147
	
l5870:	
;AppProc.C: 147: if(debance_usb_cnt>=10) { sta_chr=0; RA4=1; time_motor_cnt=0; alarm_beep_cnt=0,speed_beep=10; }
	movlw	low(0Ah)
	subwf	(_debance_usb_cnt),w
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l3562
u3220:
	
l5872:	
	clrf	(_sta_chr)
	
l5874:	
	bsf	(44/8),(44)&7	;volatile
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_time_motor_cnt)^080h
	clrf	(_time_motor_cnt+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_alarm_beep_cnt)
	
l5876:	
	movlw	low(0Ah)
	movwf	(_speed_beep)
	goto	l3562
	line	150
	
l5878:	
;AppProc.C: 150: sta_chr=0;
	clrf	(_sta_chr)
	line	151
;AppProc.C: 151: break;
	goto	l3562
	line	109
	
l5882:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sta_chr),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 1
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte            8     6 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_push
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3546
	xorlw	1^0	; case 1
	skipnz
	goto	l3550
	goto	l5878
	opt asmopt_pop

	line	153
	
l3562:	
	return
	opt stack 0
GLOBAL	__end_of_AppChr
	__end_of_AppChr:
	signat	_AppChr,89
	global	_AdProc

;; *************** function _AdProc *****************
;; Defined at:
;;		line 105 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  dat_tmp         4    0[BANK1 ] unsigned long 
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
;;      Locals:         0       0       4
;;      Temps:          0       0       0
;;      Totals:         0       0       4
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_AdRead
;;		___lldiv
;;		___lmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	105
global __ptext19
__ptext19:	;psect for function _AdProc
psect	text19
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	105
	global	__size_of_AdProc
	__size_of_AdProc	equ	__end_of_AdProc-_AdProc
	
_AdProc:	
;incstack = 0
	opt	stack 2
; Regs used in _AdProc: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	109
	
l6682:	
;sc8p1711c.c: 107: unsigned long dat_tmp;
;sc8p1711c.c: 109: switch(sta_ad)
	goto	l6730
	line	112
	
l6684:	
;sc8p1711c.c: 112: AdRead(0b00001111);
	movlw	low(0Fh)
	fcall	_AdRead
	line	113
	
l6686:	
;sc8p1711c.c: 113: if(Flag_ad_done){ Flag_ad_done=0; ad_bg=ad_val; sta_ad=1; }
	btfss	(_Flag_ad_done/8),(_Flag_ad_done)&7
	goto	u4521
	goto	u4520
u4521:
	goto	l1371
u4520:
	
l6688:	
	bcf	(_Flag_ad_done/8),(_Flag_ad_done)&7
	
l6690:	
	movf	(_ad_val+1),w
	movwf	(_ad_bg+1)
	movf	(_ad_val),w
	movwf	(_ad_bg)
	
l6692:	
	clrf	(_sta_ad)
	incf	(_sta_ad),f
	goto	l1371
	line	116
	
l6694:	
;sc8p1711c.c: 116: AdRead(0b00000010);
	movlw	low(02h)
	fcall	_AdRead
	line	117
	
l6696:	
;sc8p1711c.c: 117: if(Flag_ad_done)
	btfss	(_Flag_ad_done/8),(_Flag_ad_done)&7
	goto	u4531
	goto	u4530
u4531:
	goto	l1371
u4530:
	line	119
	
l6698:	
;sc8p1711c.c: 118: {
;sc8p1711c.c: 119: Flag_ad_done=0;
	bcf	(_Flag_ad_done/8),(_Flag_ad_done)&7
	line	120
	
l6700:	
;sc8p1711c.c: 120: dat_tmp=ad_val;
	movf	(_ad_val),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(AdProc@dat_tmp)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ad_val+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	((AdProc@dat_tmp)^080h)+1
	clrf	2+((AdProc@dat_tmp)^080h)
	clrf	3+((AdProc@dat_tmp)^080h)
	line	121
	
l6702:	
;sc8p1711c.c: 121: ad_current=dat_tmp*1000/ad_bg;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ad_bg),w
	movwf	(___lldiv@divisor)
	movf	(_ad_bg+1),w
	movwf	((___lldiv@divisor))+1
	clrf	2+((___lldiv@divisor))
	clrf	3+((___lldiv@divisor))
	bsf	status, 5	;RP0=1, select bank1
	movf	(AdProc@dat_tmp+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lmul@multiplier+3)
	bsf	status, 5	;RP0=1, select bank1
	movf	(AdProc@dat_tmp+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lmul@multiplier+2)
	bsf	status, 5	;RP0=1, select bank1
	movf	(AdProc@dat_tmp+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lmul@multiplier+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(AdProc@dat_tmp)^080h,w
	bcf	status, 5	;RP0=0, select bank0
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
	movf	(1+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_ad_current+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_ad_current)^080h
	line	122
	
l6704:	
;sc8p1711c.c: 122: current_scp=ad_current;
	movf	(_ad_current+1)^080h,w
	movwf	(_current_scp+1)^080h
	movf	(_ad_current)^080h,w
	movwf	(_current_scp)^080h
	line	123
	
l6706:	
;sc8p1711c.c: 123: if(ad_current>current_val) current_val++; else { if(current_val) current_val--; }
	movf	(_ad_current+1)^080h,w
	subwf	(_current_val+1)^080h,w
	skipz
	goto	u4545
	movf	(_ad_current)^080h,w
	subwf	(_current_val)^080h,w
u4545:
	skipnc
	goto	u4541
	goto	u4540
u4541:
	goto	l6710
u4540:
	
l6708:	
	incf	(_current_val)^080h,f
	skipnz
	incf	(_current_val+1)^080h,f
	goto	l1366
	
l6710:	
	movf	((_current_val)^080h),w
iorwf	((_current_val+1)^080h),w
	btfsc	status,2
	goto	u4551
	goto	u4550
u4551:
	goto	l1366
u4550:
	
l6712:	
	movlw	01h
	subwf	(_current_val)^080h,f
	movlw	0
	skipc
	decf	(_current_val+1)^080h,f
	subwf	(_current_val+1)^080h,f
	
l1366:	
	line	124
;sc8p1711c.c: 124: sta_ad=2;
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_sta_ad)
	goto	l1371
	line	128
	
l6714:	
;sc8p1711c.c: 128: AdRead(0b00000001);
	movlw	low(01h)
	fcall	_AdRead
	line	129
	
l6716:	
;sc8p1711c.c: 129: if(Flag_ad_done)
	btfss	(_Flag_ad_done/8),(_Flag_ad_done)&7
	goto	u4561
	goto	u4560
u4561:
	goto	l1371
u4560:
	line	131
	
l6718:	
;sc8p1711c.c: 130: {
;sc8p1711c.c: 131: Flag_ad_done=0;
	bcf	(_Flag_ad_done/8),(_Flag_ad_done)&7
	line	133
	
l6720:	
;sc8p1711c.c: 133: dat_tmp=ad_val;
	movf	(_ad_val),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(AdProc@dat_tmp)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ad_val+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	((AdProc@dat_tmp)^080h)+1
	clrf	2+((AdProc@dat_tmp)^080h)
	clrf	3+((AdProc@dat_tmp)^080h)
	line	134
	
l6722:	
;sc8p1711c.c: 134: bat_val=dat_tmp*100/ad_bg;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ad_bg),w
	movwf	(___lldiv@divisor)
	movf	(_ad_bg+1),w
	movwf	((___lldiv@divisor))+1
	clrf	2+((___lldiv@divisor))
	clrf	3+((___lldiv@divisor))
	bsf	status, 5	;RP0=1, select bank1
	movf	(AdProc@dat_tmp+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lmul@multiplier+3)
	bsf	status, 5	;RP0=1, select bank1
	movf	(AdProc@dat_tmp+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lmul@multiplier+2)
	bsf	status, 5	;RP0=1, select bank1
	movf	(AdProc@dat_tmp+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lmul@multiplier+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(AdProc@dat_tmp)^080h,w
	bcf	status, 5	;RP0=0, select bank0
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
	movf	(1+(?___lldiv)),w
	movwf	(_bat_val+1)
	movf	(0+(?___lldiv)),w
	movwf	(_bat_val)
	line	135
	
l6724:	
;sc8p1711c.c: 135: sta_ad=0;
	clrf	(_sta_ad)
	goto	l1371
	line	109
	
l6730:	
	movf	(_sta_ad),w
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
goto l6724
movlw high(S7344)
movwf pclath
	movlw low(S7344)
	addwf fsr,w
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S7344:
	ljmp	l6684
	ljmp	l6694
	ljmp	l6714
psect	text19

	line	142
	
l1371:	
	return
	opt stack 0
GLOBAL	__end_of_AdProc
	__end_of_AdProc:
	signat	_AdProc,89
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 15 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    8[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       8       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         0      12       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AdProc
;; This function uses a non-reentrant model
;;
psect	text20,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul32.c"
	line	15
global __ptext20
__ptext20:	;psect for function ___lmul
psect	text20
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\Umul32.c"
	line	15
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
;incstack = 0
	opt	stack 3
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
l6604:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	120
	
l3643:	
	line	121
	btfss	(___lmul@multiplier),(0)&7
	goto	u4391
	goto	u4390
u4391:
	goto	l6608
u4390:
	line	122
	
l6606:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u4401
	addwf	(___lmul@product+1),f
u4401:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u4402
	addwf	(___lmul@product+2),f
u4402:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u4403
	addwf	(___lmul@product+3),f
u4403:

	line	123
	
l6608:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	124
	
l6610:	
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
	goto	u4411
	goto	u4410
u4411:
	goto	l3643
u4410:
	line	128
	
l6612:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	129
	
l3646:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
	signat	___lmul,8316
	global	___lldiv

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 6 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4   12[BANK0 ] unsigned long 
;;  dividend        4   16[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   20[BANK0 ] unsigned long 
;;  counter         1   24[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   12[BANK0 ] unsigned long 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AdProc
;; This function uses a non-reentrant model
;;
psect	text21,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lldiv.c"
	line	6
global __ptext21
__ptext21:	;psect for function ___lldiv
psect	text21
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\SC8P171X_开发工具软件及Demo 程序 -- 电压表\SCMCU_IDE_V2.00.08_Beta9\SCMCU_IDE_V2.00.08_Beta9\data\sources\common\lldiv.c"
	line	6
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
;incstack = 0
	opt	stack 3
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	14
	
l6630:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	15
	
l6632:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u4441
	goto	u4440
u4441:
	goto	l6652
u4440:
	line	16
	
l6634:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	l6638
	line	18
	
l6636:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	19
	incf	(___lldiv@counter),f
	line	17
	
l6638:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u4451
	goto	u4450
u4451:
	goto	l6636
u4450:
	line	22
	
l6640:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	23
	
l6642:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u4465
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u4465
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u4465
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u4465:
	skipc
	goto	u4461
	goto	u4460
u4461:
	goto	l6648
u4460:
	line	24
	
l6644:	
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
	
l6646:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	27
	
l6648:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	28
	
l6650:	
	decfsz	(___lldiv@counter),f
	goto	u4471
	goto	u4470
u4471:
	goto	l6640
u4470:
	line	30
	
l6652:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	31
	
l3918:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_AdRead

;; *************** function _AdRead *****************
;; Defined at:
;;		line 67 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
;; Parameters:    Size  Location     Type
;;  ad_ch           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ad_ch           1    4[BANK0 ] unsigned char 
;;  ad_temp         2    5[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ADSample
;; This function is called by:
;;		_AdProc
;; This function uses a non-reentrant model
;;
psect	text22,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	67
global __ptext22
__ptext22:	;psect for function _AdRead
psect	text22
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	67
	global	__size_of_AdRead
	__size_of_AdRead	equ	__end_of_AdRead-_AdRead
	
_AdRead:	
;incstack = 0
	opt	stack 2
; Regs used in _AdRead: [wreg+status,2+status,0+pclath+cstack]
;AdRead@ad_ch stored from wreg
	movwf	(AdRead@ad_ch)
	line	72
	
l6524:	
;sc8p1711c.c: 69: static unsigned char adtimes;
;sc8p1711c.c: 70: unsigned int ad_temp;
;sc8p1711c.c: 72: if(ADSample(ad_ch))
	movf	(AdRead@ad_ch),w
	fcall	_ADSample
	xorlw	0
	skipnz
	goto	u4251
	goto	u4250
u4251:
	goto	l1352
u4250:
	line	74
	
l6526:	
;sc8p1711c.c: 73: {
;sc8p1711c.c: 74: ad_temp=(ADRESH<<4)+(ADRESL>>4);
	movf	(30),w	;volatile
	movwf	(AdRead@ad_temp)
	clrf	(AdRead@ad_temp+1)
	swapf	(AdRead@ad_temp),f
	swapf	(AdRead@ad_temp+1),f
	movlw	0f0h
	andwf	(AdRead@ad_temp+1),f
	movf	(AdRead@ad_temp),w
	andlw	0fh
	iorwf	(AdRead@ad_temp+1),f
	movlw	0f0h
	andwf	(AdRead@ad_temp),f
	
l6528:	
	bsf	status, 5	;RP0=1, select bank1
	swapf	(158)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	addwf	(AdRead@ad_temp),f
	skipnc
	incf	(AdRead@ad_temp+1),f
	line	76
	
l6530:	
;sc8p1711c.c: 76: if(adtimes==0)
	movf	((AdRead@adtimes)),w
	btfss	status,2
	goto	u4261
	goto	u4260
u4261:
	goto	l1348
u4260:
	line	78
	
l6532:	
;sc8p1711c.c: 77: {
;sc8p1711c.c: 78: admax = 0x0000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_admax)^080h
	clrf	(_admax+1)^080h
	line	79
	
l6534:	
;sc8p1711c.c: 79: admin = 0xffff;
	movlw	0FFh
	movwf	(_admin)^080h
	movlw	0FFh
	movwf	((_admin)^080h)+1
	line	80
	
l6536:	
;sc8p1711c.c: 80: adsum = 0;
	clrf	(_adsum)^080h
	clrf	(_adsum+1)^080h
	line	81
	
l1348:	
	line	82
;sc8p1711c.c: 81: }
;sc8p1711c.c: 82: if(ad_temp > admax) admax = ad_temp;
	bcf	status, 5	;RP0=0, select bank0
	movf	(AdRead@ad_temp+1),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_admax+1)^080h,w
	skipz
	goto	u4275
	bcf	status, 5	;RP0=0, select bank0
	movf	(AdRead@ad_temp),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_admax)^080h,w
u4275:
	skipnc
	goto	u4271
	goto	u4270
u4271:
	goto	l1349
u4270:
	
l6538:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(AdRead@ad_temp+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_admax+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(AdRead@ad_temp),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_admax)^080h
	
l1349:	
	line	83
;sc8p1711c.c: 83: if(ad_temp < admin) admin = ad_temp;
	movf	(_admin+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(AdRead@ad_temp+1),w
	skipz
	goto	u4285
	bsf	status, 5	;RP0=1, select bank1
	movf	(_admin)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(AdRead@ad_temp),w
u4285:
	skipnc
	goto	u4281
	goto	u4280
u4281:
	goto	l1350
u4280:
	
l6540:	
	movf	(AdRead@ad_temp+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_admin+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(AdRead@ad_temp),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_admin)^080h
	
l1350:	
	line	85
;sc8p1711c.c: 85: adsum += ad_temp;
	bcf	status, 5	;RP0=0, select bank0
	movf	(AdRead@ad_temp),w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(_adsum)^080h,f
	skipnc
	incf	(_adsum+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	movf	(AdRead@ad_temp+1),w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(_adsum+1)^080h,f
	line	86
	
l6542:	
;sc8p1711c.c: 86: adtimes++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(AdRead@adtimes),f
	line	87
	
l6544:	
;sc8p1711c.c: 87: if(adtimes >= 10)
	movlw	low(0Ah)
	subwf	(AdRead@adtimes),w
	skipc
	goto	u4291
	goto	u4290
u4291:
	goto	l1352
u4290:
	line	89
	
l6546:	
;sc8p1711c.c: 88: {
;sc8p1711c.c: 89: adsum = adsum - admax - admin;
	bsf	status, 5	;RP0=1, select bank1
	movf	(_admin)^080h,w
	addwf	(_admax)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_AdRead+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(_admin+1)^080h,w
	skipnc
	incf	(_admin+1)^080h,w
	addwf	(_admax+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	1+(??_AdRead+0)+0
	comf	(??_AdRead+0)+0,f
	comf	(??_AdRead+0)+1,f
	incf	(??_AdRead+0)+0,f
	skipnz
	incf	(??_AdRead+0)+1,f
	movf	0+(??_AdRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(_adsum)^080h,f
	skipnc
	incf	(_adsum+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_AdRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(_adsum+1)^080h,f
	line	90
;sc8p1711c.c: 90: ad_val = adsum >> 3;
	movf	(_adsum+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_AdRead+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adsum)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_AdRead+0)+0
	clrc
	rrf	(??_AdRead+0)+1,f
	rrf	(??_AdRead+0)+0,f
	clrc
	rrf	(??_AdRead+0)+1,f
	rrf	(??_AdRead+0)+0,f
	clrc
	rrf	(??_AdRead+0)+1,f
	rrf	(??_AdRead+0)+0,f
	movf	0+(??_AdRead+0)+0,w
	movwf	(_ad_val)
	movf	1+(??_AdRead+0)+0,w
	movwf	(_ad_val+1)
	line	91
	
l6548:	
;sc8p1711c.c: 91: adtimes = 0;
	clrf	(AdRead@adtimes)
	line	92
	
l6550:	
;sc8p1711c.c: 92: Flag_ad_done=1;
	bsf	(_Flag_ad_done/8),(_Flag_ad_done)&7
	line	95
	
l1352:	
	return
	opt stack 0
GLOBAL	__end_of_AdRead
	__end_of_AdRead:
	signat	_AdRead,4217
	global	_ADSample

;; *************** function _ADSample *****************
;; Defined at:
;;		line 44 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1    0[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] volatile unsigned char 
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
;;      Temps:          1       0       0
;;      Totals:         1       2       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AdRead
;;		_AppMotor
;; This function uses a non-reentrant model
;;
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	line	44
global __ptext23
__ptext23:	;psect for function _ADSample
psect	text23
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
	line	44
	global	__size_of_ADSample
	__size_of_ADSample	equ	__end_of_ADSample-_ADSample
	
_ADSample:	
;incstack = 0
	opt	stack 3
; Regs used in _ADSample: [wreg+status,2+status,0]
;ADSample@adch stored from wreg
	movwf	(ADSample@adch)
	line	46
	
l6466:	
;sc8p1711c.c: 46: ADCON1 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	47
	
l6468:	
;sc8p1711c.c: 47: ADCON0 = 0X41 | ( adch << 2);
	bcf	status, 5	;RP0=0, select bank0
	movf	(ADSample@adch),w
	movwf	(??_ADSample+0)+0
	movlw	(02h)-1
u4155:
	clrc
	rlf	(??_ADSample+0)+0,f
	addlw	-1
	skipz
	goto	u4155
	clrc
	rlf	(??_ADSample+0)+0,w
	iorlw	041h
	movwf	(31)	;volatile
	line	48
# 48 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
nop ;# 
	line	49
# 49 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\sc8p1711c.c"
nop ;# 
psect	text23
	line	50
	
l6470:	
;sc8p1711c.c: 50: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7	;volatile
	line	51
	
l6472:	
;sc8p1711c.c: 51: volatile unsigned char i = 0;
	clrf	(ADSample@i)	;volatile
	line	52
;sc8p1711c.c: 52: while(GODONE)
	goto	l1338
	
l1339:	
	line	54
;sc8p1711c.c: 53: {
;sc8p1711c.c: 54: if(0 == (--i))
	decfsz	(ADSample@i),f	;volatile
	goto	u4161
	goto	u4160
u4161:
	goto	l1338
u4160:
	line	55
	
l6474:	
;sc8p1711c.c: 55: return 0;
	movlw	low(0)
	goto	l1341
	line	56
	
l1338:	
	line	52
	btfsc	(249/8),(249)&7	;volatile
	goto	u4171
	goto	u4170
u4171:
	goto	l1339
u4170:
	line	57
	
l6478:	
;sc8p1711c.c: 56: }
;sc8p1711c.c: 57: return 1;
	movlw	low(01h)
	line	58
	
l1341:	
	return
	opt stack 0
GLOBAL	__end_of_ADSample
	__end_of_ADSample:
	signat	_ADSample,4217
	global	_Isr_Timer

;; *************** function _Isr_Timer *****************
;; Defined at:
;;		line 29 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_LedScan
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
	line	29
global __ptext24
__ptext24:	;psect for function _Isr_Timer
psect	text24
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\main.C"
	line	29
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
	line	31
	
i1l6288:	
;main.C: 31: if(TMR2IF&&TMR2ON)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(97/8),(97)&7	;volatile
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l675
u400_20:
	
i1l6290:	
	btfss	(146/8),(146)&7	;volatile
	goto	u401_21
	goto	u401_20
u401_21:
	goto	i1l675
u401_20:
	line	33
	
i1l6292:	
;main.C: 32: {
;main.C: 33: TMR2IF = 0;
	bcf	(97/8),(97)&7	;volatile
	line	35
;main.C: 35: if(Flag_beep){
	btfss	(_Flag_beep/8),(_Flag_beep)&7
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l6296
u402_20:
	line	36
	
i1l6294:	
;main.C: 36: if(RB6) RB6=0; else RB6=1;
	btfss	(54/8),(54)&7	;volatile
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l670
u403_20:
	
i1l6296:	
	bcf	(54/8),(54)&7	;volatile
	goto	i1l6298
	
i1l670:	
	bsf	(54/8),(54)&7	;volatile
	line	40
	
i1l6298:	
;main.C: 40: Rt2ms_cnt++;
	incf	(_Rt2ms_cnt),f
	line	41
	
i1l6300:	
;main.C: 41: if(Rt2ms_cnt>=10)
	movlw	low(0Ah)
	subwf	(_Rt2ms_cnt),w
	skipc
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l6306
u404_20:
	line	43
	
i1l6302:	
;main.C: 42: {
;main.C: 43: Rt2ms_cnt=0;
	clrf	(_Rt2ms_cnt)
	line	44
	
i1l6304:	
;main.C: 44: LedScan();
	fcall	_LedScan
	line	46
	
i1l6306:	
;main.C: 45: }
;main.C: 46: Rt10ms_cnt++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_Rt10ms_cnt),f
	line	47
	
i1l6308:	
;main.C: 47: if(Rt10ms_cnt>=50)
	movlw	low(032h)
	subwf	(_Rt10ms_cnt),w
	skipc
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l675
u405_20:
	line	49
	
i1l6310:	
;main.C: 48: {
;main.C: 49: Rt10ms_cnt=0;
	clrf	(_Rt10ms_cnt)
	line	50
	
i1l6312:	
;main.C: 50: Flag_mainloop=1;
	bsf	(_Flag_mainloop/8),(_Flag_mainloop)&7
	line	51
	
i1l6314:	
;main.C: 51: Flag_RtSleep=1;
	bsf	(_Flag_RtSleep/8),(_Flag_RtSleep)&7
	line	54
	
i1l675:	
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
	global	_LedScan

;; *************** function _LedScan *****************
;; Defined at:
;;		line 78 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
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
;;		On exit  : 200/0
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
;;		_LedIndex
;; This function is called by:
;;		_Isr_Timer
;; This function uses a non-reentrant model
;;
psect	text25,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
	line	78
global __ptext25
__ptext25:	;psect for function _LedScan
psect	text25
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
	line	78
	global	__size_of_LedScan
	__size_of_LedScan	equ	__end_of_LedScan-_LedScan
	
_LedScan:	
;incstack = 0
	opt	stack 2
; Regs used in _LedScan: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	83
	
i1l5590:	
;display.c: 80: static unsigned char led_scan_index;
;display.c: 83: led_scan_index++; if(led_scan_index>4) led_scan_index=0;
	incf	(LedScan@led_scan_index),f
	
i1l5592:	
	movlw	low(05h)
	subwf	(LedScan@led_scan_index),w
	skipc
	goto	u274_21
	goto	u274_20
u274_21:
	goto	i1l5596
u274_20:
	
i1l5594:	
	clrf	(LedScan@led_scan_index)
	line	85
	
i1l5596:	
;display.c: 85: LedIndex(led_scan_index);
	movf	(LedScan@led_scan_index),w
	fcall	_LedIndex
	line	86
	
i1l2071:	
	return
	opt stack 0
GLOBAL	__end_of_LedScan
	__end_of_LedScan:
	signat	_LedScan,89
	global	_LedIndex

;; *************** function _LedIndex *****************
;; Defined at:
;;		line 10 in file "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
;; Parameters:    Size  Location     Type
;;  led_index       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  led_index       1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LedScan
;; This function uses a non-reentrant model
;;
psect	text26,local,class=CODE,delta=2,merge=1,group=0
	line	10
global __ptext26
__ptext26:	;psect for function _LedIndex
psect	text26
	file	"C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
	line	10
	global	__size_of_LedIndex
	__size_of_LedIndex	equ	__end_of_LedIndex-_LedIndex
	
_LedIndex:	
;incstack = 0
	opt	stack 2
; Regs used in _LedIndex: [wreg-fsr0h+status,2+status,0]
;LedIndex@led_index stored from wreg
	movwf	(LedIndex@led_index)
	line	12
	
i1l5392:	
;display.c: 12: RB1=0; RC3=0; RC2=0; RC1=0; RC0=0; RE0=0; RA5=0;
	bcf	(49/8),(49)&7	;volatile
	bcf	(59/8),(59)&7	;volatile
	bcf	(58/8),(58)&7	;volatile
	bcf	(57/8),(57)&7	;volatile
	bcf	(56/8),(56)&7	;volatile
	bcf	(72/8),(72)&7	;volatile
	bcf	(45/8),(45)&7	;volatile
	line	13
;display.c: 13: RB5=1; RB4=1; RB3=1; RB2=1;
	bsf	(53/8),(53)&7	;volatile
	bsf	(52/8),(52)&7	;volatile
	bsf	(51/8),(51)&7	;volatile
	bsf	(50/8),(50)&7	;volatile
	line	14
;display.c: 14: switch(led_index)
	goto	i1l5458
	line	16
;display.c: 15: {
;display.c: 16: case 0:
	
i1l2026:	
	line	17
;display.c: 17: TRISB5=1,WPUB5=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7	;volatile
	bsf	(1197/8)^080h,(1197)&7	;volatile
	line	18
;display.c: 18: TRISB4=1,WPUB4=1;
	bsf	(1076/8)^080h,(1076)&7	;volatile
	bsf	(1196/8)^080h,(1196)&7	;volatile
	line	19
# 19 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
nop ;# 
# 19 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
nop ;# 
psect	text26
	line	20
;display.c: 20: if(RB4) Flag_key_usb=1; else Flag_key_usb=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(52/8),(52)&7	;volatile
	goto	u222_21
	goto	u222_20
u222_21:
	goto	i1l2027
u222_20:
	
i1l5394:	
	bsf	(_Flag_key_usb/8),(_Flag_key_usb)&7
	goto	i1l2028
	
i1l2027:	
	bcf	(_Flag_key_usb/8),(_Flag_key_usb)&7
	
i1l2028:	
	line	21
;display.c: 21: if(RB5) Flag_key_set=1; else Flag_key_set=0;
	btfss	(53/8),(53)&7	;volatile
	goto	u223_21
	goto	u223_20
u223_21:
	goto	i1l2029
u223_20:
	
i1l5396:	
	bsf	(_Flag_key_set/8),(_Flag_key_set)&7
	goto	i1l2030
	
i1l2029:	
	bcf	(_Flag_key_set/8),(_Flag_key_set)&7
	
i1l2030:	
	line	22
# 22 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
nop ;# 
# 22 "C:\Users\Administrator\Desktop\project\K06-43\资料\K06-43\Code_Prj_1\source\display.c"
nop ;# 
psect	text26
	line	23
;display.c: 23: TRISB5=0,WPUB5=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1077/8)^080h,(1077)&7	;volatile
	bsf	(1197/8)^080h,(1197)&7	;volatile
	line	24
;display.c: 24: TRISB4=0,WPUB4=1;
	bcf	(1076/8)^080h,(1076)&7	;volatile
	bsf	(1196/8)^080h,(1196)&7	;volatile
	line	25
;display.c: 25: break;
	goto	i1l2065
	line	26
;display.c: 26: case 1:
	
i1l2032:	
	line	27
;display.c: 27: if(LED_RAM[0]&0x01) RB1=1;
	btfss	(_LED_RAM),(0)&7
	goto	u224_21
	goto	u224_20
u224_21:
	goto	i1l2033
u224_20:
	
i1l5398:	
	bsf	(49/8),(49)&7	;volatile
	
i1l2033:	
	line	28
;display.c: 28: if(LED_RAM[0]&0x02) RC3=1;
	btfss	(_LED_RAM),(1)&7
	goto	u225_21
	goto	u225_20
u225_21:
	goto	i1l2034
u225_20:
	
i1l5400:	
	bsf	(59/8),(59)&7	;volatile
	
i1l2034:	
	line	29
;display.c: 29: if(LED_RAM[0]&0x04) RC2=1;
	btfss	(_LED_RAM),(2)&7
	goto	u226_21
	goto	u226_20
u226_21:
	goto	i1l2035
u226_20:
	
i1l5402:	
	bsf	(58/8),(58)&7	;volatile
	
i1l2035:	
	line	30
;display.c: 30: if(LED_RAM[0]&0x08) RC1=1;
	btfss	(_LED_RAM),(3)&7
	goto	u227_21
	goto	u227_20
u227_21:
	goto	i1l2036
u227_20:
	
i1l5404:	
	bsf	(57/8),(57)&7	;volatile
	
i1l2036:	
	line	31
;display.c: 31: if(LED_RAM[0]&0x10) RC0=1;
	btfss	(_LED_RAM),(4)&7
	goto	u228_21
	goto	u228_20
u228_21:
	goto	i1l2037
u228_20:
	
i1l5406:	
	bsf	(56/8),(56)&7	;volatile
	
i1l2037:	
	line	32
;display.c: 32: if(LED_RAM[0]&0x20) RE0=1;
	btfss	(_LED_RAM),(5)&7
	goto	u229_21
	goto	u229_20
u229_21:
	goto	i1l2038
u229_20:
	
i1l5408:	
	bsf	(72/8),(72)&7	;volatile
	
i1l2038:	
	line	33
;display.c: 33: if(LED_RAM[0]&0x40) RA5=1;
	btfss	(_LED_RAM),(6)&7
	goto	u230_21
	goto	u230_20
u230_21:
	goto	i1l2039
u230_20:
	
i1l5410:	
	bsf	(45/8),(45)&7	;volatile
	
i1l2039:	
	line	34
;display.c: 34: RB5=0;
	bcf	(53/8),(53)&7	;volatile
	line	35
;display.c: 35: break;
	goto	i1l2065
	line	36
;display.c: 36: case 2:
	
i1l2040:	
	line	37
;display.c: 37: if(LED_RAM[1]&0x01) RB1=1;
	btfss	0+(_LED_RAM)+01h,(0)&7
	goto	u231_21
	goto	u231_20
u231_21:
	goto	i1l2041
u231_20:
	
i1l5412:	
	bsf	(49/8),(49)&7	;volatile
	
i1l2041:	
	line	38
;display.c: 38: if(LED_RAM[1]&0x02) RC3=1;
	btfss	0+(_LED_RAM)+01h,(1)&7
	goto	u232_21
	goto	u232_20
u232_21:
	goto	i1l2042
u232_20:
	
i1l5414:	
	bsf	(59/8),(59)&7	;volatile
	
i1l2042:	
	line	39
;display.c: 39: if(LED_RAM[1]&0x04) RC2=1;
	btfss	0+(_LED_RAM)+01h,(2)&7
	goto	u233_21
	goto	u233_20
u233_21:
	goto	i1l2043
u233_20:
	
i1l5416:	
	bsf	(58/8),(58)&7	;volatile
	
i1l2043:	
	line	40
;display.c: 40: if(LED_RAM[1]&0x08) RC1=1;
	btfss	0+(_LED_RAM)+01h,(3)&7
	goto	u234_21
	goto	u234_20
u234_21:
	goto	i1l2044
u234_20:
	
i1l5418:	
	bsf	(57/8),(57)&7	;volatile
	
i1l2044:	
	line	41
;display.c: 41: if(LED_RAM[1]&0x10) RC0=1;
	btfss	0+(_LED_RAM)+01h,(4)&7
	goto	u235_21
	goto	u235_20
u235_21:
	goto	i1l2045
u235_20:
	
i1l5420:	
	bsf	(56/8),(56)&7	;volatile
	
i1l2045:	
	line	42
;display.c: 42: if(LED_RAM[1]&0x20) RE0=1;
	btfss	0+(_LED_RAM)+01h,(5)&7
	goto	u236_21
	goto	u236_20
u236_21:
	goto	i1l2046
u236_20:
	
i1l5422:	
	bsf	(72/8),(72)&7	;volatile
	
i1l2046:	
	line	43
;display.c: 43: if(LED_RAM[1]&0x40) RA5=1;
	btfss	0+(_LED_RAM)+01h,(6)&7
	goto	u237_21
	goto	u237_20
u237_21:
	goto	i1l2047
u237_20:
	
i1l5424:	
	bsf	(45/8),(45)&7	;volatile
	
i1l2047:	
	line	44
;display.c: 44: RB4=0;
	bcf	(52/8),(52)&7	;volatile
	line	45
;display.c: 45: break;
	goto	i1l2065
	line	46
;display.c: 46: case 3:
	
i1l2048:	
	line	47
;display.c: 47: if(LED_RAM[2]&0x01) RB1=1;
	btfss	0+(_LED_RAM)+02h,(0)&7
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l2049
u238_20:
	
i1l5426:	
	bsf	(49/8),(49)&7	;volatile
	
i1l2049:	
	line	48
;display.c: 48: if(LED_RAM[2]&0x02) RC3=1;
	btfss	0+(_LED_RAM)+02h,(1)&7
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l2050
u239_20:
	
i1l5428:	
	bsf	(59/8),(59)&7	;volatile
	
i1l2050:	
	line	49
;display.c: 49: if(LED_RAM[2]&0x04) RC2=1;
	btfss	0+(_LED_RAM)+02h,(2)&7
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l2051
u240_20:
	
i1l5430:	
	bsf	(58/8),(58)&7	;volatile
	
i1l2051:	
	line	50
;display.c: 50: if(LED_RAM[2]&0x08) RC1=1;
	btfss	0+(_LED_RAM)+02h,(3)&7
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l2052
u241_20:
	
i1l5432:	
	bsf	(57/8),(57)&7	;volatile
	
i1l2052:	
	line	51
;display.c: 51: if(LED_RAM[2]&0x10) RC0=1;
	btfss	0+(_LED_RAM)+02h,(4)&7
	goto	u242_21
	goto	u242_20
u242_21:
	goto	i1l2053
u242_20:
	
i1l5434:	
	bsf	(56/8),(56)&7	;volatile
	
i1l2053:	
	line	52
;display.c: 52: if(LED_RAM[2]&0x20) RE0=1;
	btfss	0+(_LED_RAM)+02h,(5)&7
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l2054
u243_20:
	
i1l5436:	
	bsf	(72/8),(72)&7	;volatile
	
i1l2054:	
	line	53
;display.c: 53: if(LED_RAM[2]&0x40) RA5=1;
	btfss	0+(_LED_RAM)+02h,(6)&7
	goto	u244_21
	goto	u244_20
u244_21:
	goto	i1l2055
u244_20:
	
i1l5438:	
	bsf	(45/8),(45)&7	;volatile
	
i1l2055:	
	line	54
;display.c: 54: RB3=0;
	bcf	(51/8),(51)&7	;volatile
	line	55
;display.c: 55: break;
	goto	i1l2065
	line	56
;display.c: 56: case 4:
	
i1l2056:	
	line	57
;display.c: 57: if(LED_RAM[3]&0x01) RB1=1;
	btfss	0+(_LED_RAM)+03h,(0)&7
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l2057
u245_20:
	
i1l5440:	
	bsf	(49/8),(49)&7	;volatile
	
i1l2057:	
	line	58
;display.c: 58: if(LED_RAM[3]&0x02) RC3=1;
	btfss	0+(_LED_RAM)+03h,(1)&7
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l2058
u246_20:
	
i1l5442:	
	bsf	(59/8),(59)&7	;volatile
	
i1l2058:	
	line	59
;display.c: 59: if(LED_RAM[3]&0x04) RC2=1;
	btfss	0+(_LED_RAM)+03h,(2)&7
	goto	u247_21
	goto	u247_20
u247_21:
	goto	i1l2059
u247_20:
	
i1l5444:	
	bsf	(58/8),(58)&7	;volatile
	
i1l2059:	
	line	60
;display.c: 60: if(LED_RAM[3]&0x08) RC1=1;
	btfss	0+(_LED_RAM)+03h,(3)&7
	goto	u248_21
	goto	u248_20
u248_21:
	goto	i1l2060
u248_20:
	
i1l5446:	
	bsf	(57/8),(57)&7	;volatile
	
i1l2060:	
	line	61
;display.c: 61: if(LED_RAM[3]&0x10) RC0=1;
	btfss	0+(_LED_RAM)+03h,(4)&7
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l2061
u249_20:
	
i1l5448:	
	bsf	(56/8),(56)&7	;volatile
	
i1l2061:	
	line	62
;display.c: 62: if(LED_RAM[3]&0x20) RE0=1;
	btfss	0+(_LED_RAM)+03h,(5)&7
	goto	u250_21
	goto	u250_20
u250_21:
	goto	i1l2062
u250_20:
	
i1l5450:	
	bsf	(72/8),(72)&7	;volatile
	
i1l2062:	
	line	63
;display.c: 63: if(LED_RAM[3]&0x40) RA5=1;
	btfss	0+(_LED_RAM)+03h,(6)&7
	goto	u251_21
	goto	u251_20
u251_21:
	goto	i1l2063
u251_20:
	
i1l5452:	
	bsf	(45/8),(45)&7	;volatile
	
i1l2063:	
	line	64
;display.c: 64: RB2=0;
	bcf	(50/8),(50)&7	;volatile
	line	65
;display.c: 65: break;
	goto	i1l2065
	line	67
	
i1l5454:	
	line	68
;display.c: 68: break;
	goto	i1l2065
	line	14
	
i1l5458:	
	movf	(LedIndex@led_index),w
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
goto i1l5454
movlw high(i1S7346)
movwf pclath
	movlw low(i1S7346)
	addwf fsr,w
	movwf pc
psect	swtext4,local,class=CONST,delta=2
global __pswtext4
__pswtext4:
i1S7346:
	ljmp	i1l2026
	ljmp	i1l2032
	ljmp	i1l2040
	ljmp	i1l2048
	ljmp	i1l2056
psect	text26

	line	70
	
i1l2065:	
	return
	opt stack 0
GLOBAL	__end_of_LedIndex
	__end_of_LedIndex:
	signat	_LedIndex,4217
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
