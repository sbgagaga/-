opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	SC8P1713S
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
	FNCALL	_main,_Init_System
	FNCALL	_main,_source_v
	FNCALL	_main,_Ad_testing
	FNCALL	_main,_PID_control
	FNCALL	_main,_Temp_setdeal
	FNCALL	_main,_Set_disp
	FNCALL	_main,_Kscan
	FNCALL	_main,_Kdeal
	FNCALL	_main,_Disp_Lcd
	FNCALL	_PID_control,_PID_operation
	FNCALL	_PID_control,___lwdiv
	FNCALL	_PID_operation,___wmul
	FNCALL	_Kscan,_Delay
	FNCALL	_source_v,_Ad_sample
	FNCALL	_Ad_testing,_Ad_sample
	FNCALL	_Ad_testing,_Check_Ntc
	FNCALL	_Disp_Lcd,_disf
	FNCALL	_Set_disp,___lwdiv
	FNCALL	_Set_disp,___lwmod
	FNROOT	_main
	FNCALL	_Isr_Timer,_AcTestZero
	FNCALL	_Isr_Timer,_ScrControl
	FNCALL	_Isr_Timer,_Tmper_pro
	FNCALL	intlevel1,_Isr_Timer
	global	intlevel1
	FNROOT	intlevel1
	global	_Temptab
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
;	global	stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:
	movf btemp+1,w
andlw 7Fh
movwf	pclath
	movf	fsr,w
incf fsr
skipnz
incf btemp+1
	movwf pc
__stringbase:
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\global_variable.h"
	line	129
_Temptab:
	retlw	01Dh
	retlw	0

	retlw	01Eh
	retlw	0

	retlw	020h
	retlw	0

	retlw	022h
	retlw	0

	retlw	023h
	retlw	0

	retlw	025h
	retlw	0

	retlw	027h
	retlw	0

	retlw	029h
	retlw	0

	retlw	02Bh
	retlw	0

	retlw	02Dh
	retlw	0

	retlw	02Fh
	retlw	0

	retlw	031h
	retlw	0

	retlw	034h
	retlw	0

	retlw	036h
	retlw	0

	retlw	039h
	retlw	0

	retlw	03Bh
	retlw	0

	retlw	03Eh
	retlw	0

	retlw	041h
	retlw	0

	retlw	044h
	retlw	0

	retlw	047h
	retlw	0

	retlw	04Ah
	retlw	0

	retlw	04Dh
	retlw	0

	retlw	051h
	retlw	0

	retlw	054h
	retlw	0

	retlw	058h
	retlw	0

	retlw	05Bh
	retlw	0

	retlw	05Fh
	retlw	0

	retlw	063h
	retlw	0

	retlw	067h
	retlw	0

	retlw	06Bh
	retlw	0

	retlw	06Fh
	retlw	0

	retlw	073h
	retlw	0

	retlw	078h
	retlw	0

	retlw	07Ch
	retlw	0

	retlw	081h
	retlw	0

	retlw	085h
	retlw	0

	retlw	08Ah
	retlw	0

	retlw	08Fh
	retlw	0

	retlw	094h
	retlw	0

	retlw	09Ah
	retlw	0

	retlw	09Fh
	retlw	0

	retlw	0A4h
	retlw	0

	retlw	0AAh
	retlw	0

	retlw	0B0h
	retlw	0

	retlw	0B5h
	retlw	0

	retlw	0BBh
	retlw	0

	retlw	0C1h
	retlw	0

	retlw	0C8h
	retlw	0

	retlw	0CEh
	retlw	0

	retlw	0D4h
	retlw	0

	retlw	0DBh
	retlw	0

	retlw	0E1h
	retlw	0

	retlw	0E8h
	retlw	0

	retlw	0EFh
	retlw	0

	retlw	0F6h
	retlw	0

	retlw	0FDh
	retlw	0

	retlw	04h
	retlw	01h

	retlw	0Bh
	retlw	01h

	retlw	012h
	retlw	01h

	retlw	01Ah
	retlw	01h

	retlw	021h
	retlw	01h

	retlw	028h
	retlw	01h

	retlw	030h
	retlw	01h

	retlw	038h
	retlw	01h

	retlw	03Fh
	retlw	01h

	retlw	047h
	retlw	01h

	retlw	04Fh
	retlw	01h

	retlw	057h
	retlw	01h

	retlw	05Fh
	retlw	01h

	retlw	067h
	retlw	01h

	retlw	06Fh
	retlw	01h

	retlw	077h
	retlw	01h

	retlw	07Fh
	retlw	01h

	retlw	087h
	retlw	01h

	retlw	08Fh
	retlw	01h

	retlw	098h
	retlw	01h

	retlw	0A0h
	retlw	01h

	retlw	0A8h
	retlw	01h

	retlw	0B0h
	retlw	01h

	retlw	0B8h
	retlw	01h

	retlw	0C1h
	retlw	01h

	retlw	0C9h
	retlw	01h

	retlw	0D1h
	retlw	01h

	retlw	0D9h
	retlw	01h

	retlw	0E1h
	retlw	01h

	retlw	0EAh
	retlw	01h

	retlw	0F2h
	retlw	01h

	retlw	0FAh
	retlw	01h

	retlw	02h
	retlw	02h

	retlw	0Ah
	retlw	02h

	retlw	012h
	retlw	02h

	retlw	01Ah
	retlw	02h

	retlw	022h
	retlw	02h

	retlw	029h
	retlw	02h

	retlw	031h
	retlw	02h

	retlw	039h
	retlw	02h

	retlw	040h
	retlw	02h

	retlw	048h
	retlw	02h

	retlw	050h
	retlw	02h

	retlw	057h
	retlw	02h

	retlw	05Eh
	retlw	02h

	retlw	066h
	retlw	02h

	retlw	06Dh
	retlw	02h

	retlw	074h
	retlw	02h

	retlw	07Bh
	retlw	02h

	retlw	082h
	retlw	02h

	retlw	089h
	retlw	02h

	retlw	090h
	retlw	02h

	retlw	096h
	retlw	02h

	retlw	09Dh
	retlw	02h

	retlw	0A4h
	retlw	02h

	retlw	0AAh
	retlw	02h

	retlw	0B0h
	retlw	02h

	retlw	0B7h
	retlw	02h

	retlw	0BDh
	retlw	02h

	retlw	0C3h
	retlw	02h

	retlw	0C9h
	retlw	02h

	retlw	0CFh
	retlw	02h

	retlw	0D5h
	retlw	02h

	retlw	0DBh
	retlw	02h

	retlw	0E0h
	retlw	02h

	retlw	0E6h
	retlw	02h

	retlw	0EBh
	retlw	02h

	retlw	0F1h
	retlw	02h

	retlw	0F6h
	retlw	02h

	retlw	0FBh
	retlw	02h

	retlw	0
	retlw	03h

	retlw	05h
	retlw	03h

	retlw	0Ah
	retlw	03h

	retlw	0Fh
	retlw	03h

	retlw	014h
	retlw	03h

	retlw	018h
	retlw	03h

	retlw	01Dh
	retlw	03h

	retlw	022h
	retlw	03h

	retlw	026h
	retlw	03h

	retlw	02Ah
	retlw	03h

	retlw	02Fh
	retlw	03h

	retlw	033h
	retlw	03h

	retlw	037h
	retlw	03h

	retlw	03Bh
	retlw	03h

	retlw	03Fh
	retlw	03h

	retlw	043h
	retlw	03h

	retlw	046h
	retlw	03h

	retlw	04Ah
	retlw	03h

	retlw	04Eh
	retlw	03h

	retlw	051h
	retlw	03h

	retlw	055h
	retlw	03h

	retlw	058h
	retlw	03h

	retlw	05Ch
	retlw	03h

	retlw	05Fh
	retlw	03h

	retlw	062h
	retlw	03h

	retlw	065h
	retlw	03h

	retlw	068h
	retlw	03h

	retlw	06Bh
	retlw	03h

	retlw	06Eh
	retlw	03h

	retlw	071h
	retlw	03h

	retlw	074h
	retlw	03h

	retlw	077h
	retlw	03h

	retlw	079h
	retlw	03h

	retlw	07Ch
	retlw	03h

	retlw	07Fh
	retlw	03h

	retlw	081h
	retlw	03h

	retlw	084h
	retlw	03h

	retlw	086h
	retlw	03h

	retlw	089h
	retlw	03h

	retlw	08Bh
	retlw	03h

	retlw	08Dh
	retlw	03h

	retlw	090h
	retlw	03h

	retlw	092h
	retlw	03h

	retlw	094h
	retlw	03h

	retlw	096h
	retlw	03h

	retlw	098h
	retlw	03h

	retlw	09Ah
	retlw	03h

	retlw	09Ch
	retlw	03h

	retlw	09Eh
	retlw	03h

	retlw	0A0h
	retlw	03h

	retlw	0A2h
	retlw	03h

	retlw	0A4h
	retlw	03h

	retlw	0A5h
	retlw	03h

	retlw	0A7h
	retlw	03h

	retlw	0A9h
	retlw	03h

	retlw	0AAh
	retlw	03h

	retlw	0ACh
	retlw	03h

	retlw	0AEh
	retlw	03h

	retlw	0AFh
	retlw	03h

	retlw	0B1h
	retlw	03h

	retlw	0B2h
	retlw	03h

	retlw	0B4h
	retlw	03h

	retlw	0B5h
	retlw	03h

	retlw	0B6h
	retlw	03h

	retlw	0B8h
	retlw	03h

	retlw	0B9h
	retlw	03h

	retlw	0BBh
	retlw	03h

	retlw	0BCh
	retlw	03h

	retlw	0BDh
	retlw	03h

	retlw	0BEh
	retlw	03h

	retlw	0C0h
	retlw	03h

	retlw	0C1h
	retlw	03h

	retlw	0C2h
	retlw	03h

	retlw	0C3h
	retlw	03h

	retlw	0C4h
	retlw	03h

	retlw	0C5h
	retlw	03h

	retlw	0C6h
	retlw	03h

	retlw	0C7h
	retlw	03h

	retlw	0C8h
	retlw	03h

	retlw	0C9h
	retlw	03h

	retlw	0CAh
	retlw	03h

	retlw	0CBh
	retlw	03h

	retlw	0CCh
	retlw	03h

	retlw	0CDh
	retlw	03h

	retlw	0CEh
	retlw	03h

	retlw	0CFh
	retlw	03h

	retlw	0D0h
	retlw	03h

	retlw	0D1h
	retlw	03h

	retlw	0D1h
	retlw	03h

	retlw	0D2h
	retlw	03h

	retlw	0D3h
	retlw	03h

	retlw	0D4h
	retlw	03h

	retlw	0D5h
	retlw	03h

	retlw	0D5h
	retlw	03h

	retlw	0D6h
	retlw	03h

	retlw	0D7h
	retlw	03h

	retlw	0D7h
	retlw	03h

	retlw	0D8h
	retlw	03h

	retlw	0D9h
	retlw	03h

	retlw	0D9h
	retlw	03h

	retlw	0DAh
	retlw	03h

	retlw	0DBh
	retlw	03h

	retlw	0DBh
	retlw	03h

	retlw	0DCh
	retlw	03h

	retlw	0DDh
	retlw	03h

	retlw	0DDh
	retlw	03h

	retlw	0DEh
	retlw	03h

	retlw	0DEh
	retlw	03h

	retlw	0DFh
	retlw	03h

	retlw	0DFh
	retlw	03h

	retlw	0E0h
	retlw	03h

	global	_LCDCode
psect	stringtext
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\global_variable.h"
	line	105
_LCDCode:
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
	retlw	077h
	retlw	07Ch
	retlw	039h
	retlw	05Eh
	retlw	079h
	retlw	071h
	global	_Temptab
	global	_LCDCode
	global	_PID
	global	_Display
	global	Tmper_pro@n
	global	_Admax
	global	_Admin
	global	_Adresult
	global	_Adsum
	global	_Keyc1
	global	_Pid_count
	global	_Tempr_rank
	global	_Tempr_setdata
	global	_Tmper_temp
	global	_count1
	global	_Adtimes
	global	_Keyc
	global	_Keyflash
	global	_Keyold
	global	_Kkg_dly
	global	_Maintime
	global	_Ntcnormaldely
	global	_Ntcopendely
	global	_Ntcshortdely
	global	_Tempr_tdata
	global	_Dcount
	global	_Flag_HV
	global	_Flag_ach
	global	_Flag_bit
	global	_Flag_en
	global	_Flag_err
	global	_Flag_first
	global	_Flag_hot
	global	_Flag_keyf
	global	_Flag_mainloop
	global	_Flag_ntc_onead
	global	_Flag_onoff
	global	_Flag_rt_open
	global	_Flag_rt_short
	global	_Flag_step
	global	_Flag_temprdir
	global	_Flag_temprok
	global	_Flag_vtemp
	global	_Flag_zero
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_INTCON
_INTCON	set	11
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_T2CON
_T2CON	set	18
	global	_GODONE
_GODONE	set	249
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RB2
_RB2	set	50
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RE0
_RE0	set	72
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISE
_TRISE	set	137
	global	_COMEN
_COMEN	set	407
	global	_LCDCON0
_LCDCON0	set	400
	global	_WPUA
_WPUA	set	398
	file	"XLD-DLZFQ-20180105_V1.0.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_Flag_HV:
       ds      1

_Flag_ach:
       ds      1

_Flag_bit:
       ds      1

_Flag_en:
       ds      1

_Flag_err:
       ds      1

_Flag_first:
       ds      1

_Flag_hot:
       ds      1

_Flag_keyf:
       ds      1

_Flag_mainloop:
       ds      1

_Flag_ntc_onead:
       ds      1

_Flag_onoff:
       ds      1

_Flag_rt_open:
       ds      1

_Flag_rt_short:
       ds      1

_Flag_step:
       ds      1

_Flag_temprdir:
       ds      1

_Flag_temprok:
       ds      1

_Flag_vtemp:
       ds      1

_Flag_zero:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_Tempr_tdata:
       ds      2

_Dcount:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_PID:
       ds      18

_Display:
       ds      4

Tmper_pro@n:
       ds      2

_Admax:
       ds      2

_Admin:
       ds      2

_Adresult:
       ds      2

_Adsum:
       ds      2

_Keyc1:
       ds      2

_Pid_count:
       ds      2

_Tempr_rank:
       ds      2

_Tempr_setdata:
       ds      2

_Tmper_temp:
       ds      2

_count1:
       ds      2

_Adtimes:
       ds      1

_Keyc:
       ds      1

_Keyflash:
       ds      1

_Keyold:
       ds      1

_Kkg_dly:
       ds      1

_Maintime:
       ds      1

_Ntcnormaldely:
       ds      1

_Ntcopendely:
       ds      1

_Ntcshortdely:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
	clrf	((__pbitbssCOMMON/8)+1)&07Fh
	clrf	((__pbitbssCOMMON/8)+2)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+035h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_disf
?_disf:	; 0 bytes @ 0x0
	global	?_Check_Ntc
?_Check_Ntc:	; 0 bytes @ 0x0
	global	?_Tmper_pro
?_Tmper_pro:	; 0 bytes @ 0x0
	global	??_Tmper_pro
??_Tmper_pro:	; 0 bytes @ 0x0
	global	?_PID_control
?_PID_control:	; 0 bytes @ 0x0
	global	?_Temp_setdeal
?_Temp_setdeal:	; 0 bytes @ 0x0
	global	?_Kscan
?_Kscan:	; 0 bytes @ 0x0
	global	?_Kdeal
?_Kdeal:	; 0 bytes @ 0x0
	global	?_PID_operation
?_PID_operation:	; 0 bytes @ 0x0
	global	?_Delay
?_Delay:	; 0 bytes @ 0x0
	global	?_Set_disp
?_Set_disp:	; 0 bytes @ 0x0
	global	?_Disp_Lcd
?_Disp_Lcd:	; 0 bytes @ 0x0
	global	?_Ad_testing
?_Ad_testing:	; 0 bytes @ 0x0
	global	?_source_v
?_source_v:	; 0 bytes @ 0x0
	global	?_Init_System
?_Init_System:	; 0 bytes @ 0x0
	global	?_AcTestZero
?_AcTestZero:	; 0 bytes @ 0x0
	global	??_AcTestZero
??_AcTestZero:	; 0 bytes @ 0x0
	global	?_ScrControl
?_ScrControl:	; 0 bytes @ 0x0
	global	??_ScrControl
??_ScrControl:	; 0 bytes @ 0x0
	global	?_Isr_Timer
?_Isr_Timer:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_Ad_sample
?_Ad_sample:	; 1 bytes @ 0x0
	ds	4
	global	??_Isr_Timer
??_Isr_Timer:	; 0 bytes @ 0x4
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_disf
??_disf:	; 0 bytes @ 0x0
	global	??_Check_Ntc
??_Check_Ntc:	; 0 bytes @ 0x0
	global	??_Temp_setdeal
??_Temp_setdeal:	; 0 bytes @ 0x0
	global	??_Kdeal
??_Kdeal:	; 0 bytes @ 0x0
	global	??_Delay
??_Delay:	; 0 bytes @ 0x0
	global	??_Ad_sample
??_Ad_sample:	; 0 bytes @ 0x0
	global	??_Init_System
??_Init_System:	; 0 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	disf@a
disf@a:	; 1 bytes @ 0x0
	global	Delay@k
Delay@k:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_Disp_Lcd
??_Disp_Lcd:	; 0 bytes @ 0x1
	global	Ad_sample@adch
Ad_sample@adch:	; 1 bytes @ 0x1
	global	Delay@i
Delay@i:	; 1 bytes @ 0x1
	ds	1
	global	??_Kscan
??_Kscan:	; 0 bytes @ 0x2
	global	Ad_sample@i
Ad_sample@i:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_Ad_testing
??_Ad_testing:	; 0 bytes @ 0x3
	global	??_source_v
??_source_v:	; 0 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x5
	global	Ad_testing@i
Ad_testing@i:	; 1 bytes @ 0x5
	global	source_v@i
source_v@i:	; 1 bytes @ 0x5
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x5
	ds	1
	global	??_PID_operation
??_PID_operation:	; 0 bytes @ 0x6
	global	Ad_testing@Ad_temp
Ad_testing@Ad_temp:	; 2 bytes @ 0x6
	global	source_v@vsum
source_v@vsum:	; 2 bytes @ 0x6
	ds	1
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x7
	ds	1
	global	source_v@vtimes
source_v@vtimes:	; 1 bytes @ 0x8
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x9
	global	source_v@k
source_v@k:	; 2 bytes @ 0x9
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x9
	ds	1
	global	PID_operation@NegSum
PID_operation@NegSum:	; 2 bytes @ 0xA
	ds	1
	global	source_v@vresult
source_v@vresult:	; 1 bytes @ 0xB
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xB
	ds	1
	global	??_Set_disp
??_Set_disp:	; 0 bytes @ 0xC
	global	Set_disp@smg_data2
Set_disp@smg_data2:	; 1 bytes @ 0xC
	global	source_v@vmax
source_v@vmax:	; 1 bytes @ 0xC
	global	PID_operation@PostSum
PID_operation@PostSum:	; 2 bytes @ 0xC
	ds	1
	global	Set_disp@smg_data3
Set_disp@smg_data3:	; 1 bytes @ 0xD
	ds	1
	global	Set_disp@smg_data1
Set_disp@smg_data1:	; 1 bytes @ 0xE
	global	PID_operation@Temp
PID_operation@Temp:	; 6 bytes @ 0xE
	ds	6
	global	??_PID_control
??_PID_control:	; 0 bytes @ 0x14
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x16
;;Data sizes: Strings 0, constant 490, data 0, bss 56, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      14
;; BANK0           80     22      75
;; BANK1           80      0       0

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _Isr_Timer in COMMON
;;
;;   _Isr_Timer->_Tmper_pro
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_PID_control
;;   _PID_control->_PID_operation
;;   _PID_operation->___wmul
;;   _Kscan->_Delay
;;   _source_v->_Ad_sample
;;   _Ad_testing->_Ad_sample
;;   _Disp_Lcd->_disf
;;   _Set_disp->___lwdiv
;;   ___lwdiv->___lwmod
;;
;; Critical Paths under _Isr_Timer in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _Isr_Timer in BANK1
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
;; (0) _main                                                 0     0      0    2189
;;                        _Init_System
;;                           _source_v
;;                         _Ad_testing
;;                        _PID_control
;;                       _Temp_setdeal
;;                           _Set_disp
;;                              _Kscan
;;                              _Kdeal
;;                           _Disp_Lcd
;; ---------------------------------------------------------------------------------
;; (1) _PID_control                                          2     2      0     770
;;                                             20 BANK0      2     2      0
;;                      _PID_operation
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (2) _PID_operation                                       14    14      0     608
;;                                              6 BANK0     14    14      0
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (1) _Kscan                                                0     0      0      46
;;                              _Delay
;; ---------------------------------------------------------------------------------
;; (1) _source_v                                            10    10      0     253
;;                                              3 BANK0     10    10      0
;;                          _Ad_sample
;; ---------------------------------------------------------------------------------
;; (1) _Ad_testing                                           5     5      0     180
;;                                              3 BANK0      5     5      0
;;                          _Ad_sample
;;                          _Check_Ntc
;; ---------------------------------------------------------------------------------
;; (1) _Disp_Lcd                                             0     0      0     132
;;                               _disf
;; ---------------------------------------------------------------------------------
;; (1) _Set_disp                                             3     3      0     808
;;                                             12 BANK0      3     3      0
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (2) ___lwmod                                              5     1      4     159
;;                                              0 BANK0      5     1      4
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              7     3      4     162
;;                                              5 BANK0      7     3      4
;;                            ___lwmod (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___wmul                                               6     2      4      92
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (2) _Delay                                                2     2      0      46
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _Kdeal                                                2     2      0       0
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _Temp_setdeal                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Init_System                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Check_Ntc                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Ad_sample                                            3     3      0      45
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _disf                                                 1     1      0     132
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _Isr_Timer                                            4     4      0       0
;;                                              4 COMMON     4     4      0
;;                         _AcTestZero
;;                         _ScrControl
;;                          _Tmper_pro
;; ---------------------------------------------------------------------------------
;; (6) _Tmper_pro                                            4     4      0       0
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (5) _ScrControl                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (5) _AcTestZero                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Init_System
;;   _source_v
;;     _Ad_sample
;;   _Ad_testing
;;     _Ad_sample
;;     _Check_Ntc
;;   _PID_control
;;     _PID_operation
;;       ___wmul
;;     ___lwdiv
;;       ___lwmod (ARG)
;;   _Temp_setdeal
;;   _Set_disp
;;     ___lwdiv
;;       ___lwmod (ARG)
;;     ___lwmod
;;   _Kscan
;;     _Delay
;;   _Kdeal
;;   _Disp_Lcd
;;     _disf
;;
;; _Isr_Timer (ROOT)
;;   _AcTestZero
;;   _ScrControl
;;   _Tmper_pro
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       3       0       21.4%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       9       2        0.0%
;;ABS                  0      0      59       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     16      4B       5       93.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;DATA                 0      0      62       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 130 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_Init_System
;;		_source_v
;;		_Ad_testing
;;		_PID_control
;;		_Temp_setdeal
;;		_Set_disp
;;		_Kscan
;;		_Kdeal
;;		_Disp_Lcd
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
	line	130
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	131
	
l4673:	
;XLD-DLZFQ-20180105_V1.0.C: 131: Init_System();
	fcall	_Init_System
	line	133
;XLD-DLZFQ-20180105_V1.0.C: 133: source_v(9);
	movlw	(09h)
	fcall	_source_v
	line	135
	
l4675:	
;XLD-DLZFQ-20180105_V1.0.C: 135: PIE1=2;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(140)^080h	;volatile
	line	136
	
l4677:	
;XLD-DLZFQ-20180105_V1.0.C: 136: PR2=250;
	movlw	(0FAh)
	movwf	(146)^080h	;volatile
	line	137
	
l4679:	
;XLD-DLZFQ-20180105_V1.0.C: 137: T2CON=4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	138
	
l4681:	
;XLD-DLZFQ-20180105_V1.0.C: 138: INTCON=0XC0;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	140
	
l4683:	
;XLD-DLZFQ-20180105_V1.0.C: 140: PID.uKP_Coe=1;
	clrf	0+(_PID)+09h
	incf	0+(_PID)+09h,f
	line	141
	
l4685:	
;XLD-DLZFQ-20180105_V1.0.C: 141: PID.uKI_Coe=1;
	clrf	0+(_PID)+0Ah
	incf	0+(_PID)+0Ah,f
	line	142
	
l4687:	
;XLD-DLZFQ-20180105_V1.0.C: 142: PID.uKD_Coe=20;
	movlw	(014h)
	movwf	0+(_PID)+0Bh
	line	144
	
l4689:	
;XLD-DLZFQ-20180105_V1.0.C: 144: PID.iPriVal=0;
	clrf	0+(_PID)+0Ch
	clrf	1+(_PID)+0Ch
	line	145
	
l4691:	
;XLD-DLZFQ-20180105_V1.0.C: 145: Tempr_setdata=180;
	movlw	0B4h
	movwf	(_Tempr_setdata)
	clrf	(_Tempr_setdata+1)
	line	149
	
l4693:	
;XLD-DLZFQ-20180105_V1.0.C: 148: {
;XLD-DLZFQ-20180105_V1.0.C: 149: if(Flag_mainloop)
	btfss	(_Flag_mainloop/8),(_Flag_mainloop)&7
	goto	u2661
	goto	u2660
u2661:
	goto	l4693
u2660:
	line	151
	
l4695:	
;XLD-DLZFQ-20180105_V1.0.C: 150: {
;XLD-DLZFQ-20180105_V1.0.C: 151: Flag_mainloop = 0;
	bcf	(_Flag_mainloop/8),(_Flag_mainloop)&7
	line	152
# 152 "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
clrwdt ;#
psect	maintext
	line	153
	
l4697:	
;XLD-DLZFQ-20180105_V1.0.C: 153: Ad_testing(11);
	movlw	(0Bh)
	fcall	_Ad_testing
	line	156
	
l4699:	
;XLD-DLZFQ-20180105_V1.0.C: 156: PID_control();
	fcall	_PID_control
	line	157
	
l4701:	
;XLD-DLZFQ-20180105_V1.0.C: 157: Temp_setdeal();
	fcall	_Temp_setdeal
	line	158
;XLD-DLZFQ-20180105_V1.0.C: 158: Set_disp();
	fcall	_Set_disp
	line	159
	
l4703:	
;XLD-DLZFQ-20180105_V1.0.C: 159: Kscan();
	fcall	_Kscan
	line	160
	
l4705:	
;XLD-DLZFQ-20180105_V1.0.C: 160: Kdeal();
	fcall	_Kdeal
	line	161
	
l4707:	
;XLD-DLZFQ-20180105_V1.0.C: 161: Disp_Lcd();
	fcall	_Disp_Lcd
	goto	l4693
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	164
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_PID_control
psect	text437,local,class=CODE,delta=2
global __ptext437
__ptext437:

;; *************** function _PID_control *****************
;; Defined at:
;;		line 170 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       2       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_PID_operation
;;		___lwdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text437
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
	line	170
	global	__size_of_PID_control
	__size_of_PID_control	equ	__end_of_PID_control-_PID_control
	
_PID_control:	
	opt	stack 2
; Regs used in _PID_control: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	171
	
l4649:	
;XLD-DLZFQ-20180105_V1.0.C: 171: if(Flag_onoff)
	btfss	(_Flag_onoff/8),(_Flag_onoff)&7
	goto	u2611
	goto	u2610
u2611:
	goto	l4669
u2610:
	line	173
	
l4651:	
;XLD-DLZFQ-20180105_V1.0.C: 172: {
;XLD-DLZFQ-20180105_V1.0.C: 173: Pid_count++;
	incf	(_Pid_count),f
	skipnz
	incf	(_Pid_count+1),f
	line	174
	
l4653:	
;XLD-DLZFQ-20180105_V1.0.C: 174: if(Pid_count>=400)
	movlw	high(0190h)
	subwf	(_Pid_count+1),w
	movlw	low(0190h)
	skipnz
	subwf	(_Pid_count),w
	skipc
	goto	u2621
	goto	u2620
u2621:
	goto	l4659
u2620:
	line	176
	
l4655:	
;XLD-DLZFQ-20180105_V1.0.C: 175: {
;XLD-DLZFQ-20180105_V1.0.C: 176: Pid_count=0;
	clrf	(_Pid_count)
	clrf	(_Pid_count+1)
	line	177
	
l4657:	
;XLD-DLZFQ-20180105_V1.0.C: 177: PID_operation();
	fcall	_PID_operation
	line	179
	
l4659:	
;XLD-DLZFQ-20180105_V1.0.C: 178: }
;XLD-DLZFQ-20180105_V1.0.C: 179: if(Flag_err==0)
	btfsc	(_Flag_err/8),(_Flag_err)&7
	goto	u2631
	goto	u2630
u2631:
	goto	l4663
u2630:
	line	181
	
l4661:	
;XLD-DLZFQ-20180105_V1.0.C: 180: {
;XLD-DLZFQ-20180105_V1.0.C: 181: if(PID.iPriVal==0)
	movf	(1+(_PID)+0Ch),w
	iorwf	(0+(_PID)+0Ch),w
	skipz
	goto	u2641
	goto	u2640
u2641:
	goto	l4665
u2640:
	line	183
	
l4663:	
;XLD-DLZFQ-20180105_V1.0.C: 182: {
;XLD-DLZFQ-20180105_V1.0.C: 183: Flag_hot=0;
	bcf	(_Flag_hot/8),(_Flag_hot)&7
	line	184
;XLD-DLZFQ-20180105_V1.0.C: 184: }
	goto	l2031
	line	185
	
l4665:	
;XLD-DLZFQ-20180105_V1.0.C: 185: else if((Pid_count>>3)<(PID.iPriVal/10))
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	1+(_PID)+0Ch,w
	movwf	1+(?___lwdiv)+02h
	movf	0+(_PID)+0Ch,w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(_Pid_count+1),w
	movwf	(??_PID_control+0)+0+1
	movf	(_Pid_count),w
	movwf	(??_PID_control+0)+0
	clrc
	rrf	(??_PID_control+0)+1,f
	rrf	(??_PID_control+0)+0,f
	clrc
	rrf	(??_PID_control+0)+1,f
	rrf	(??_PID_control+0)+0,f
	clrc
	rrf	(??_PID_control+0)+1,f
	rrf	(??_PID_control+0)+0,f
	movf	(1+(?___lwdiv)),w
	subwf	1+(??_PID_control+0)+0,w
	skipz
	goto	u2655
	movf	(0+(?___lwdiv)),w
	subwf	0+(??_PID_control+0)+0,w
u2655:
	skipnc
	goto	u2651
	goto	u2650
u2651:
	goto	l4663
u2650:
	line	187
	
l4667:	
;XLD-DLZFQ-20180105_V1.0.C: 186: {
;XLD-DLZFQ-20180105_V1.0.C: 187: Flag_hot=1;
	bsf	(_Flag_hot/8),(_Flag_hot)&7
	line	188
;XLD-DLZFQ-20180105_V1.0.C: 188: }
	goto	l2031
	line	201
	
l4669:	
;XLD-DLZFQ-20180105_V1.0.C: 199: else
;XLD-DLZFQ-20180105_V1.0.C: 200: {
;XLD-DLZFQ-20180105_V1.0.C: 201: Pid_count=0;
	clrf	(_Pid_count)
	clrf	(_Pid_count+1)
	line	202
;XLD-DLZFQ-20180105_V1.0.C: 202: PID.iPriVal=0;
	clrf	0+(_PID)+0Ch
	clrf	1+(_PID)+0Ch
	goto	l4663
	line	206
	
l2031:	
	return
	opt stack 0
GLOBAL	__end_of_PID_control
	__end_of_PID_control:
;; =============== function _PID_control ends ============

	signat	_PID_control,88
	global	_PID_operation
psect	text438,local,class=CODE,delta=2
global __ptext438
__ptext438:

;; *************** function _PID_operation *****************
;; Defined at:
;;		line 211 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  Temp            6   14[BANK0 ] unsigned int [3]
;;  PostSum         2   12[BANK0 ] unsigned int 
;;  NegSum          2   10[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      10       0
;;      Temps:          0       4       0
;;      Totals:         0      14       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_PID_control
;; This function uses a non-reentrant model
;;
psect	text438
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
	line	211
	global	__size_of_PID_operation
	__size_of_PID_operation	equ	__end_of_PID_operation-_PID_operation
	
_PID_operation:	
	opt	stack 2
; Regs used in _PID_operation: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	212
	
l4573:	
;XLD-DLZFQ-20180105_V1.0.C: 212: unsigned int Temp[3] = {0};
	movlw	(PID_operation@Temp)&0ffh
	movwf	fsr0
	movlw	6
	movwf	btemp+1
u2510:
	bcf	status, 7	;select IRP bank0
	clrf	indf
	incf	fsr0,f
	decfsz	btemp+1,f
	goto	u2510
	line	213
	
l4575:	
;XLD-DLZFQ-20180105_V1.0.C: 213: unsigned int PostSum = 0;
	clrf	(PID_operation@PostSum)
	clrf	(PID_operation@PostSum+1)
	line	214
	
l4577:	
;XLD-DLZFQ-20180105_V1.0.C: 214: unsigned int NegSum = 0;
	clrf	(PID_operation@NegSum)
	clrf	(PID_operation@NegSum+1)
	line	215
	
l4579:	
;XLD-DLZFQ-20180105_V1.0.C: 215: if(PID.iSetVal > PID.iCurVal)
	movf	1+(_PID)+0Eh,w
	subwf	1+(_PID)+010h,w
	skipz
	goto	u2525
	movf	0+(_PID)+0Eh,w
	subwf	0+(_PID)+010h,w
u2525:
	skipnc
	goto	u2521
	goto	u2520
u2521:
	goto	l4645
u2520:
	line	217
	
l4581:	
;XLD-DLZFQ-20180105_V1.0.C: 216: {
;XLD-DLZFQ-20180105_V1.0.C: 217: if(PID.iSetVal - PID.iCurVal > 100)
	movf	0+(_PID)+010h,w
	subwf	0+(_PID)+0Eh,w
	movwf	(??_PID_operation+0)+0
	movf	1+(_PID)+010h,w
	skipc
	incf	1+(_PID)+010h,w
	subwf	1+(_PID)+0Eh,w
	movwf	1+(??_PID_operation+0)+0
	movlw	high(065h)
	subwf	1+(??_PID_operation+0)+0,w
	movlw	low(065h)
	skipnz
	subwf	0+(??_PID_operation+0)+0,w
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l4585
u2530:
	line	218
	
l4583:	
;XLD-DLZFQ-20180105_V1.0.C: 218: PID.iPriVal = 500;
	movlw	low(01F4h)
	movwf	0+(_PID)+0Ch
	movlw	high(01F4h)
	movwf	(0+(_PID)+0Ch)+1
	goto	l2054
	line	221
	
l4585:	
;XLD-DLZFQ-20180105_V1.0.C: 219: else
;XLD-DLZFQ-20180105_V1.0.C: 220: {
;XLD-DLZFQ-20180105_V1.0.C: 221: Temp[0] = PID.iSetVal - PID.iCurVal;
	movf	0+(_PID)+010h,w
	subwf	0+(_PID)+0Eh,w
	movwf	(PID_operation@Temp)
	movf	1+(_PID)+010h,w
	skipc
	incf	1+(_PID)+010h,w
	subwf	1+(_PID)+0Eh,w
	movwf	1+(PID_operation@Temp)
	line	222
	
l4587:	
;XLD-DLZFQ-20180105_V1.0.C: 222: PID.uEkFlag[1] = 0;
	clrf	0+(_PID)+07h
	line	224
	
l4589:	
;XLD-DLZFQ-20180105_V1.0.C: 224: PID.liEkVal[2] = PID.liEkVal[1];
	movf	1+(_PID)+02h,w
	movwf	1+(_PID)+04h
	movf	0+(_PID)+02h,w
	movwf	0+(_PID)+04h
	line	225
	
l4591:	
;XLD-DLZFQ-20180105_V1.0.C: 225: PID.liEkVal[1] = PID.liEkVal[0];
	movf	(_PID+1),w
	movwf	1+(_PID)+02h
	movf	(_PID),w
	movwf	0+(_PID)+02h
	line	226
	
l4593:	
;XLD-DLZFQ-20180105_V1.0.C: 226: PID.liEkVal[0] = Temp[0];
	movf	(PID_operation@Temp+1),w
	movwf	(_PID+1)
	movf	(PID_operation@Temp),w
	movwf	(_PID)
	line	228
	
l4595:	
;XLD-DLZFQ-20180105_V1.0.C: 228: if(PID.liEkVal[0] > PID.liEkVal[1])
	movf	(_PID+1),w
	subwf	1+(_PID)+02h,w
	skipz
	goto	u2545
	movf	(_PID),w
	subwf	0+(_PID)+02h,w
u2545:
	skipnc
	goto	u2541
	goto	u2540
u2541:
	goto	l4601
u2540:
	line	230
	
l4597:	
;XLD-DLZFQ-20180105_V1.0.C: 229: {
;XLD-DLZFQ-20180105_V1.0.C: 230: Temp[0] = PID.liEkVal[0] - PID.liEkVal[1];
	movf	0+(_PID)+02h,w
	subwf	(_PID),w
	movwf	(PID_operation@Temp)
	movf	1+(_PID)+02h,w
	skipc
	incf	1+(_PID)+02h,w
	subwf	(_PID+1),w
	movwf	1+(PID_operation@Temp)
	line	231
	
l4599:	
;XLD-DLZFQ-20180105_V1.0.C: 231: PID.uEkFlag[0] = 0;
	clrf	0+(_PID)+06h
	line	232
;XLD-DLZFQ-20180105_V1.0.C: 232: }
	goto	l4605
	line	235
	
l4601:	
;XLD-DLZFQ-20180105_V1.0.C: 233: else
;XLD-DLZFQ-20180105_V1.0.C: 234: {
;XLD-DLZFQ-20180105_V1.0.C: 235: Temp[0] = PID.liEkVal[1] - PID.liEkVal[0];
	movf	(_PID),w
	subwf	0+(_PID)+02h,w
	movwf	(PID_operation@Temp)
	movf	(_PID+1),w
	skipc
	incf	(_PID+1),w
	subwf	1+(_PID)+02h,w
	movwf	1+(PID_operation@Temp)
	line	236
	
l4603:	
;XLD-DLZFQ-20180105_V1.0.C: 236: PID.uEkFlag[0] = 1;
	clrf	0+(_PID)+06h
	incf	0+(_PID)+06h,f
	line	239
	
l4605:	
;XLD-DLZFQ-20180105_V1.0.C: 237: }
;XLD-DLZFQ-20180105_V1.0.C: 239: Temp[2] = PID.liEkVal[1] << 1;
	clrc
	rlf	0+(_PID)+02h,w
	movwf	0+(PID_operation@Temp)+04h
	rlf	1+(_PID)+02h,w
	movwf	1+0+(PID_operation@Temp)+04h
	line	240
	
l4607:	
;XLD-DLZFQ-20180105_V1.0.C: 240: if((PID.liEkVal[0] + PID.liEkVal[2]) > Temp[2])
	movf	(_PID),w
	addwf	0+(_PID)+04h,w
	movwf	(??_PID_operation+0)+0
	movf	(_PID+1),w
	skipnc
	incf	(_PID+1),w
	addwf	1+(_PID)+04h,w
	movwf	1+(??_PID_operation+0)+0
	movf	1+(??_PID_operation+0)+0,w
	subwf	1+(PID_operation@Temp)+04h,w
	skipz
	goto	u2555
	movf	0+(??_PID_operation+0)+0,w
	subwf	0+(PID_operation@Temp)+04h,w
u2555:
	skipnc
	goto	u2551
	goto	u2550
u2551:
	goto	l4613
u2550:
	line	242
	
l4609:	
;XLD-DLZFQ-20180105_V1.0.C: 241: {
;XLD-DLZFQ-20180105_V1.0.C: 242: Temp[2] = (PID.liEkVal[0] + PID.liEkVal[2]) - Temp[2];
	movf	0+(PID_operation@Temp)+04h,w
	subwf	0+(_PID)+04h,w
	movwf	(??_PID_operation+0)+0
	movf	1+(PID_operation@Temp)+04h,w
	skipc
	incf	1+(PID_operation@Temp)+04h,w
	subwf	1+(_PID)+04h,w
	movwf	1+(??_PID_operation+0)+0
	movf	(_PID),w
	addwf	0+(??_PID_operation+0)+0,w
	movwf	0+(PID_operation@Temp)+04h
	movf	(_PID+1),w
	skipnc
	incf	(_PID+1),w
	addwf	1+(??_PID_operation+0)+0,w
	movwf	1+0+(PID_operation@Temp)+04h
	line	243
	
l4611:	
;XLD-DLZFQ-20180105_V1.0.C: 243: PID.uEkFlag[2]=0;
	clrf	0+(_PID)+08h
	line	244
;XLD-DLZFQ-20180105_V1.0.C: 244: }
	goto	l4617
	line	247
	
l4613:	
;XLD-DLZFQ-20180105_V1.0.C: 245: else
;XLD-DLZFQ-20180105_V1.0.C: 246: {
;XLD-DLZFQ-20180105_V1.0.C: 247: Temp[2] = Temp[2] - (PID.liEkVal[0] + PID.liEkVal[2]);
	comf	(_PID),w
	movwf	(??_PID_operation+0)+0
	comf	(_PID+1),w
	movwf	((??_PID_operation+0)+0+1)
	incf	(??_PID_operation+0)+0,f
	skipnz
	incf	((??_PID_operation+0)+0+1),f
	movf	0+(_PID)+04h,w
	subwf	0+(??_PID_operation+0)+0,w
	movwf	(??_PID_operation+2)+0
	movf	1+(_PID)+04h,w
	skipc
	incf	1+(_PID)+04h,w
	subwf	1+(??_PID_operation+0)+0,w
	movwf	1+(??_PID_operation+2)+0
	movf	0+(PID_operation@Temp)+04h,w
	addwf	0+(??_PID_operation+2)+0,w
	movwf	0+(PID_operation@Temp)+04h
	movf	1+(PID_operation@Temp)+04h,w
	skipnc
	incf	1+(PID_operation@Temp)+04h,w
	addwf	1+(??_PID_operation+2)+0,w
	movwf	1+0+(PID_operation@Temp)+04h
	line	248
	
l4615:	
;XLD-DLZFQ-20180105_V1.0.C: 248: PID.uEkFlag[2] = 1;
	clrf	0+(_PID)+08h
	incf	0+(_PID)+08h,f
	line	251
	
l4617:	
;XLD-DLZFQ-20180105_V1.0.C: 249: }
;XLD-DLZFQ-20180105_V1.0.C: 251: Temp[0] = PID.uKP_Coe * Temp[0];
	movf	0+(_PID)+09h,w
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movf	(PID_operation@Temp+1),w
	movwf	1+(?___wmul)+02h
	movf	(PID_operation@Temp),w
	movwf	0+(?___wmul)+02h
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(PID_operation@Temp+1)
	movf	(0+(?___wmul)),w
	movwf	(PID_operation@Temp)
	line	252
	
l4619:	
;XLD-DLZFQ-20180105_V1.0.C: 252: Temp[1] = PID.uKI_Coe * PID.liEkVal[0];
	movf	0+(_PID)+0Ah,w
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movf	(_PID+1),w
	movwf	1+(?___wmul)+02h
	movf	(_PID),w
	movwf	0+(?___wmul)+02h
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	1+(PID_operation@Temp)+02h
	movf	(0+(?___wmul)),w
	movwf	0+(PID_operation@Temp)+02h
	line	253
	
l4621:	
;XLD-DLZFQ-20180105_V1.0.C: 253: Temp[2] = PID.uKD_Coe * Temp[2];
	movf	0+(_PID)+0Bh,w
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movf	1+(PID_operation@Temp)+04h,w
	movwf	1+(?___wmul)+02h
	movf	0+(PID_operation@Temp)+04h,w
	movwf	0+(?___wmul)+02h
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	1+(PID_operation@Temp)+04h
	movf	(0+(?___wmul)),w
	movwf	0+(PID_operation@Temp)+04h
	line	255
	
l4623:	
;XLD-DLZFQ-20180105_V1.0.C: 255: if(PID.uEkFlag[0] == 0)
	movf	0+(_PID)+06h,f
	skipz
	goto	u2561
	goto	u2560
u2561:
	goto	l4627
u2560:
	line	256
	
l4625:	
;XLD-DLZFQ-20180105_V1.0.C: 256: PostSum += Temp[0];
	movf	(PID_operation@Temp),w
	addwf	(PID_operation@PostSum),f
	skipnc
	incf	(PID_operation@PostSum+1),f
	movf	(PID_operation@Temp+1),w
	addwf	(PID_operation@PostSum+1),f
	goto	l4629
	line	258
	
l4627:	
;XLD-DLZFQ-20180105_V1.0.C: 257: else
;XLD-DLZFQ-20180105_V1.0.C: 258: NegSum += Temp[0];
	movf	(PID_operation@Temp),w
	addwf	(PID_operation@NegSum),f
	skipnc
	incf	(PID_operation@NegSum+1),f
	movf	(PID_operation@Temp+1),w
	addwf	(PID_operation@NegSum+1),f
	line	260
	
l4629:	
;XLD-DLZFQ-20180105_V1.0.C: 260: if(PID.uEkFlag[1] == 0)
	movf	0+(_PID)+07h,f
	skipz
	goto	u2571
	goto	u2570
u2571:
	goto	l4633
u2570:
	line	261
	
l4631:	
;XLD-DLZFQ-20180105_V1.0.C: 261: PostSum += Temp[1];
	movf	0+(PID_operation@Temp)+02h,w
	addwf	(PID_operation@PostSum),f
	skipnc
	incf	(PID_operation@PostSum+1),f
	movf	1+(PID_operation@Temp)+02h,w
	addwf	(PID_operation@PostSum+1),f
	goto	l2046
	line	264
	
l4633:	
;XLD-DLZFQ-20180105_V1.0.C: 262: else
;XLD-DLZFQ-20180105_V1.0.C: 264: if(PID.uEkFlag[2]==0)
	movf	0+(_PID)+08h,f
	skipz
	goto	u2581
	goto	u2580
u2581:
	goto	l4637
u2580:
	line	265
	
l4635:	
;XLD-DLZFQ-20180105_V1.0.C: 265: PostSum += Temp[2];
	movf	0+(PID_operation@Temp)+04h,w
	addwf	(PID_operation@PostSum),f
	skipnc
	incf	(PID_operation@PostSum+1),f
	movf	1+(PID_operation@Temp)+04h,w
	addwf	(PID_operation@PostSum+1),f
	goto	l2046
	line	267
	
l4637:	
;XLD-DLZFQ-20180105_V1.0.C: 266: else
;XLD-DLZFQ-20180105_V1.0.C: 267: NegSum += Temp[2];
	movf	0+(PID_operation@Temp)+04h,w
	addwf	(PID_operation@NegSum),f
	skipnc
	incf	(PID_operation@NegSum+1),f
	movf	1+(PID_operation@Temp)+04h,w
	addwf	(PID_operation@NegSum+1),f
	
l2046:	
	line	269
;XLD-DLZFQ-20180105_V1.0.C: 269: PostSum += PID.iPriVal;
	movf	0+(_PID)+0Ch,w
	addwf	(PID_operation@PostSum),f
	skipnc
	incf	(PID_operation@PostSum+1),f
	movf	1+(_PID)+0Ch,w
	addwf	(PID_operation@PostSum+1),f
	line	270
;XLD-DLZFQ-20180105_V1.0.C: 270: if(PostSum > NegSum)
	movf	(PID_operation@PostSum+1),w
	subwf	(PID_operation@NegSum+1),w
	skipz
	goto	u2595
	movf	(PID_operation@PostSum),w
	subwf	(PID_operation@NegSum),w
u2595:
	skipnc
	goto	u2591
	goto	u2590
u2591:
	goto	l4645
u2590:
	line	272
	
l4639:	
;XLD-DLZFQ-20180105_V1.0.C: 271: {
;XLD-DLZFQ-20180105_V1.0.C: 272: Temp[0] = PostSum - NegSum;
	movf	(PID_operation@PostSum+1),w
	movwf	(PID_operation@Temp+1)
	movf	(PID_operation@PostSum),w
	movwf	(PID_operation@Temp)
	movf	(PID_operation@NegSum),w
	subwf	(PID_operation@Temp),f
	movf	(PID_operation@NegSum+1),w
	skipc
	decf	(PID_operation@Temp+1),f
	subwf	(PID_operation@Temp+1),f
	line	273
;XLD-DLZFQ-20180105_V1.0.C: 273: if(Temp[0] < 500 )
	movlw	high(01F4h)
	subwf	(PID_operation@Temp+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(PID_operation@Temp),w
	skipnc
	goto	u2601
	goto	u2600
u2601:
	goto	l4583
u2600:
	line	274
	
l4641:	
;XLD-DLZFQ-20180105_V1.0.C: 274: PID.iPriVal = Temp[0];
	movf	(PID_operation@Temp+1),w
	movwf	1+(_PID)+0Ch
	movf	(PID_operation@Temp),w
	movwf	0+(_PID)+0Ch
	goto	l2054
	line	279
	
l4645:	
;XLD-DLZFQ-20180105_V1.0.C: 278: else
;XLD-DLZFQ-20180105_V1.0.C: 279: PID.iPriVal = 0;
	clrf	0+(_PID)+0Ch
	clrf	1+(_PID)+0Ch
	line	284
	
l2054:	
	return
	opt stack 0
GLOBAL	__end_of_PID_operation
	__end_of_PID_operation:
;; =============== function _PID_operation ends ============

	signat	_PID_operation,88
	global	_Kscan
psect	text439,local,class=CODE,delta=2
global __ptext439
__ptext439:

;; *************** function _Kscan *****************
;; Defined at:
;;		line 4 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Kscan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text439
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Kscan.c"
	line	4
	global	__size_of_Kscan
	__size_of_Kscan	equ	__end_of_Kscan-_Kscan
	
_Kscan:	
	opt	stack 3
; Regs used in _Kscan: [wreg+status,2+status,0+pclath+cstack]
	line	5
	
l4525:	
;Kscan.c: 5: COMEN = 0B00001111;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	6
	
l4527:	
;Kscan.c: 6: TRISA|=0x0F;
	movlw	(0Fh)
	bcf	status, 6	;RP1=0, select bank1
	iorwf	(133)^080h,f	;volatile
	line	7
	
l4529:	
;Kscan.c: 7: WPUA=0X0E;
	movlw	(0Eh)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(398)^0180h	;volatile
	line	9
;Kscan.c: 9: TRISC|=0X0F;
	movlw	(0Fh)
	bcf	status, 6	;RP1=0, select bank1
	iorwf	(135)^080h,f	;volatile
	line	11
	
l4531:	
;Kscan.c: 11: Delay(10);
	movlw	(0Ah)
	fcall	_Delay
	line	13
	
l4533:	
;Kscan.c: 13: Keyflash=0;
	clrf	(_Keyflash)
	line	14
	
l4535:	
;Kscan.c: 14: if(!RA3)
	btfsc	(43/8),(43)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l2708
u2410:
	line	16
	
l4537:	
;Kscan.c: 15: {
;Kscan.c: 16: Keyflash=1;
	clrf	(_Keyflash)
	incf	(_Keyflash),f
	line	17
;Kscan.c: 17: }
	goto	l2709
	line	18
	
l2708:	
;Kscan.c: 18: else if(!RA1)
	btfsc	(41/8),(41)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l2710
u2420:
	line	20
	
l4539:	
;Kscan.c: 19: {
;Kscan.c: 20: Keyflash=2;
	movlw	(02h)
	movwf	(_Keyflash)
	line	21
;Kscan.c: 21: }
	goto	l2709
	line	22
	
l2710:	
;Kscan.c: 22: else if(!RA2)
	btfsc	(42/8),(42)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l2709
u2430:
	line	24
	
l4541:	
;Kscan.c: 23: {
;Kscan.c: 24: Keyflash=3;
	movlw	(03h)
	movwf	(_Keyflash)
	line	27
	
l2709:	
;Kscan.c: 25: }
;Kscan.c: 27: if(Keyflash)
	movf	(_Keyflash),w
	skipz
	goto	u2440
	goto	l2713
u2440:
	line	29
	
l4543:	
;Kscan.c: 28: {
;Kscan.c: 29: if(Keyflash==Keyold)
	movf	(_Keyflash),w
	xorwf	(_Keyold),w
	skipz
	goto	u2451
	goto	u2450
u2451:
	goto	l4561
u2450:
	line	32
	
l4545:	
;Kscan.c: 30: {
;Kscan.c: 32: if(Keyflash!=1)
	decf	(_Keyflash),w
	skipnz
	goto	u2461
	goto	u2460
u2461:
	goto	l2715
u2460:
	line	34
	
l4547:	
;Kscan.c: 33: {
;Kscan.c: 34: if(!Flag_en)
	btfsc	(_Flag_en/8),(_Flag_en)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l2723
u2470:
	line	36
	
l4549:	
;Kscan.c: 35: {
;Kscan.c: 36: Flag_keyf=1;
	bsf	(_Flag_keyf/8),(_Flag_keyf)&7
	line	37
;Kscan.c: 37: Flag_en=1;
	bsf	(_Flag_en/8),(_Flag_en)&7
	goto	l2723
	line	41
	
l2715:	
	line	43
;Kscan.c: 41: else
;Kscan.c: 42: {
;Kscan.c: 43: if(!Flag_en)
	btfsc	(_Flag_en/8),(_Flag_en)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l2720
u2480:
	line	45
	
l4551:	
;Kscan.c: 44: {
;Kscan.c: 45: Keyc1++;
	incf	(_Keyc1),f
	skipnz
	incf	(_Keyc1+1),f
	line	46
	
l4553:	
;Kscan.c: 46: if(Keyc1>=400)
	movlw	high(0190h)
	subwf	(_Keyc1+1),w
	movlw	low(0190h)
	skipnz
	subwf	(_Keyc1),w
	skipc
	goto	u2491
	goto	u2490
u2491:
	goto	l2720
u2490:
	line	48
	
l4555:	
;Kscan.c: 47: {
;Kscan.c: 48: Keyc1=0;
	clrf	(_Keyc1)
	clrf	(_Keyc1+1)
	line	49
	
l4557:	
;Kscan.c: 49: Flag_keyf=1;
	bsf	(_Flag_keyf/8),(_Flag_keyf)&7
	line	50
	
l4559:	
;Kscan.c: 50: Flag_en=1;
	bsf	(_Flag_en/8),(_Flag_en)&7
	goto	l2723
	line	61
	
l4561:	
;Kscan.c: 59: else
;Kscan.c: 60: {
;Kscan.c: 61: Keyc1=0;
	clrf	(_Keyc1)
	clrf	(_Keyc1+1)
	line	62
	
l4563:	
;Kscan.c: 62: Keyc++;
	incf	(_Keyc),f
	line	63
	
l4565:	
;Kscan.c: 63: if(Keyc>=5)
	movlw	(05h)
	subwf	(_Keyc),w
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l2723
u2500:
	line	65
	
l4567:	
;Kscan.c: 64: {
;Kscan.c: 65: Keyc=0;
	clrf	(_Keyc)
	line	66
	
l4569:	
;Kscan.c: 66: Keyold=Keyflash;
	movf	(_Keyflash),w
	movwf	(_Keyold)
	goto	l2723
	line	68
	
l2720:	
	line	71
;Kscan.c: 67: }
;Kscan.c: 68: }
;Kscan.c: 71: }
	goto	l2723
	line	72
	
l2713:	
	line	74
;Kscan.c: 72: else
;Kscan.c: 73: {
;Kscan.c: 74: Flag_en=0;
	bcf	(_Flag_en/8),(_Flag_en)&7
	line	75
;Kscan.c: 75: Flag_keyf=0;
	bcf	(_Flag_keyf/8),(_Flag_keyf)&7
	line	76
	
l4571:	
;Kscan.c: 76: Keyc=0;
	clrf	(_Keyc)
	line	77
;Kscan.c: 77: Keyc1=0;
	clrf	(_Keyc1)
	clrf	(_Keyc1+1)
	line	82
	
l2723:	
	return
	opt stack 0
GLOBAL	__end_of_Kscan
	__end_of_Kscan:
;; =============== function _Kscan ends ============

	signat	_Kscan,88
	global	_source_v
psect	text440,local,class=CODE,delta=2
global __ptext440
__ptext440:

;; *************** function _source_v *****************
;; Defined at:
;;		line 134 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
;; Parameters:    Size  Location     Type
;;  i               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  i               1    5[BANK0 ] unsigned char 
;;  k               2    9[BANK0 ] unsigned int 
;;  vsum            2    6[BANK0 ] unsigned int 
;;  vmax            1   12[BANK0 ] unsigned char 
;;  vresult         1   11[BANK0 ] unsigned char 
;;  vtimes          1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       8       0
;;      Temps:          0       2       0
;;      Totals:         0      10       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Ad_sample
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text440
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
	line	134
	global	__size_of_source_v
	__size_of_source_v	equ	__end_of_source_v-_source_v
	
_source_v:	
	opt	stack 3
; Regs used in _source_v: [wreg+status,2+status,0+pclath+cstack]
;source_v@i stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(source_v@i)
	line	135
	
l4493:	
;AD.c: 135: unsigned int k,vsum=0;
	clrf	(source_v@vsum)
	clrf	(source_v@vsum+1)
	line	136
;AD.c: 136: unsigned char vresult,vmax=0,vtimes=0;
	clrf	(source_v@vmax)
	clrf	(source_v@vtimes)
	line	137
;AD.c: 137: for(k=0;k<2000;k++)
	clrf	(source_v@k)
	clrf	(source_v@k+1)
	line	139
	
l4499:	
;AD.c: 138: {
;AD.c: 139: if(Ad_sample(i))
	movf	(source_v@i),w
	fcall	_Ad_sample
	xorlw	0
	skipnz
	goto	u2361
	goto	u2360
u2361:
	goto	l4517
u2360:
	line	141
	
l4501:	
;AD.c: 140: {
;AD.c: 141: vsum += ADRESH;
	movf	(30),w	;volatile
	addwf	(source_v@vsum),f
	skipnc
	incf	(source_v@vsum+1),f
	line	142
	
l4503:	
;AD.c: 142: if(++vtimes >= 4)
	movlw	(04h)
	incf	(source_v@vtimes),f
	subwf	((source_v@vtimes)),w
	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l4517
u2370:
	line	144
	
l4505:	
;AD.c: 143: {
;AD.c: 144: vresult = vsum >> 2;
	movf	(source_v@vsum+1),w
	movwf	(??_source_v+0)+0+1
	movf	(source_v@vsum),w
	movwf	(??_source_v+0)+0
	clrc
	rrf	(??_source_v+0)+1,f
	rrf	(??_source_v+0)+0,f
	clrc
	rrf	(??_source_v+0)+1,f
	rrf	(??_source_v+0)+0,f
	movf	0+(??_source_v+0)+0,w
	movwf	(source_v@vresult)
	line	145
	
l4507:	
;AD.c: 145: if(vresult>vmax)
	movf	(source_v@vresult),w
	subwf	(source_v@vmax),w
	skipnc
	goto	u2381
	goto	u2380
u2381:
	goto	l4511
u2380:
	line	147
	
l4509:	
;AD.c: 146: {
;AD.c: 147: vmax=vresult;
	movf	(source_v@vresult),w
	movwf	(source_v@vmax)
	line	149
	
l4511:	
;AD.c: 148: }
;AD.c: 149: vsum = 0;
	clrf	(source_v@vsum)
	clrf	(source_v@vsum+1)
	line	150
	
l4513:	
;AD.c: 150: vtimes = 0;
	clrf	(source_v@vtimes)
	line	151
	
l4515:	
# 151 "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
clrwdt ;#
psect	text440
	line	137
	
l4517:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(source_v@k),f
	skipnz
	incf	(source_v@k+1),f
	
l4519:	
	movlw	high(07D0h)
	subwf	(source_v@k+1),w
	movlw	low(07D0h)
	skipnz
	subwf	(source_v@k),w
	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l4499
u2390:
	line	156
	
l4521:	
;AD.c: 152: }
;AD.c: 153: }
;AD.c: 154: }
;AD.c: 156: if(vmax>130)
	movlw	(083h)
	subwf	(source_v@vmax),w
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l1344
u2400:
	line	158
	
l4523:	
;AD.c: 157: {
;AD.c: 158: Flag_HV=1;
	bsf	(_Flag_HV/8),(_Flag_HV)&7
	line	159
;AD.c: 159: }
	goto	l1346
	line	160
	
l1344:	
	line	162
;AD.c: 160: else
;AD.c: 161: {
;AD.c: 162: Flag_HV=0;
	bcf	(_Flag_HV/8),(_Flag_HV)&7
	line	165
	
l1346:	
	return
	opt stack 0
GLOBAL	__end_of_source_v
	__end_of_source_v:
;; =============== function _source_v ends ============

	signat	_source_v,4216
	global	_Ad_testing
psect	text441,local,class=CODE,delta=2
global __ptext441
__ptext441:

;; *************** function _Ad_testing *****************
;; Defined at:
;;		line 36 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
;; Parameters:    Size  Location     Type
;;  i               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  i               1    5[BANK0 ] unsigned char 
;;  Ad_temp         2    6[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       2       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Ad_sample
;;		_Check_Ntc
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text441
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
	line	36
	global	__size_of_Ad_testing
	__size_of_Ad_testing	equ	__end_of_Ad_testing-_Ad_testing
	
_Ad_testing:	
	opt	stack 3
; Regs used in _Ad_testing: [wreg+status,2+status,0+pclath+cstack]
;Ad_testing@i stored from wreg
	line	40
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Ad_testing@i)
	
l4453:	
;AD.c: 38: unsigned int Ad_temp;
;AD.c: 40: if(Ad_sample(i))
	movf	(Ad_testing@i),w
	fcall	_Ad_sample
	xorlw	0
	skipnz
	goto	u2301
	goto	u2300
u2301:
	goto	l4489
u2300:
	line	42
	
l4455:	
;AD.c: 41: {
;AD.c: 42: Ad_temp=(ADRESH<<2)+(ADRESL>>6);
	movf	(30),w	;volatile
	movwf	(Ad_testing@Ad_temp)
	clrf	(Ad_testing@Ad_temp+1)
	
l4457:	
	clrc
	rlf	(Ad_testing@Ad_temp),f
	rlf	(Ad_testing@Ad_temp+1),f
	clrc
	rlf	(Ad_testing@Ad_temp),f
	rlf	(Ad_testing@Ad_temp+1),f
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_Ad_testing+0)+0
	movlw	06h
u2315:
	clrc
	rrf	(??_Ad_testing+0)+0,f
	addlw	-1
	skipz
	goto	u2315
	movf	0+(??_Ad_testing+0)+0,w
	addwf	(Ad_testing@Ad_temp),f
	skipnc
	incf	(Ad_testing@Ad_temp+1),f
	line	44
	
l4459:	
;AD.c: 44: if(0 == Adtimes)
	movf	(_Adtimes),f
	skipz
	goto	u2321
	goto	u2320
u2321:
	goto	l4465
u2320:
	line	46
	
l4461:	
;AD.c: 45: {
;AD.c: 46: Admax = 0x0000;
	clrf	(_Admax)
	clrf	(_Admax+1)
	line	47
	
l4463:	
;AD.c: 47: Admin = 0xffff;
	movlw	low(0FFFFh)
	movwf	(_Admin)
	movlw	high(0FFFFh)
	movwf	((_Admin))+1
	line	48
;AD.c: 48: }
	goto	l1316
	line	49
	
l4465:	
;AD.c: 49: else if(Ad_temp > Admax)
	movf	(Ad_testing@Ad_temp+1),w
	subwf	(_Admax+1),w
	skipz
	goto	u2335
	movf	(Ad_testing@Ad_temp),w
	subwf	(_Admax),w
u2335:
	skipnc
	goto	u2331
	goto	u2330
u2331:
	goto	l4469
u2330:
	line	50
	
l4467:	
;AD.c: 50: Admax = Ad_temp;
	movf	(Ad_testing@Ad_temp+1),w
	movwf	(_Admax+1)
	movf	(Ad_testing@Ad_temp),w
	movwf	(_Admax)
	goto	l1316
	line	51
	
l4469:	
;AD.c: 51: else if(Ad_temp < Admin)
	movf	(_Admin+1),w
	subwf	(Ad_testing@Ad_temp+1),w
	skipz
	goto	u2345
	movf	(_Admin),w
	subwf	(Ad_testing@Ad_temp),w
u2345:
	skipnc
	goto	u2341
	goto	u2340
u2341:
	goto	l1316
u2340:
	line	52
	
l4471:	
;AD.c: 52: Admin = Ad_temp;
	movf	(Ad_testing@Ad_temp+1),w
	movwf	(_Admin+1)
	movf	(Ad_testing@Ad_temp),w
	movwf	(_Admin)
	line	54
	
l1316:	
;AD.c: 54: Adsum += Ad_temp;
	movf	(Ad_testing@Ad_temp),w
	addwf	(_Adsum),f
	skipnc
	incf	(_Adsum+1),f
	movf	(Ad_testing@Ad_temp+1),w
	addwf	(_Adsum+1),f
	line	55
	
l4473:	
;AD.c: 55: if(++Adtimes >= 10)
	movlw	(0Ah)
	incf	(_Adtimes),f
	subwf	((_Adtimes)),w
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l4491
u2350:
	line	57
	
l4475:	
;AD.c: 56: {
;AD.c: 57: Adsum -= Admax;
	movf	(_Admax),w
	subwf	(_Adsum),f
	movf	(_Admax+1),w
	skipc
	decf	(_Adsum+1),f
	subwf	(_Adsum+1),f
	line	58
;AD.c: 58: Adsum -= Admin;
	movf	(_Admin),w
	subwf	(_Adsum),f
	movf	(_Admin+1),w
	skipc
	decf	(_Adsum+1),f
	subwf	(_Adsum+1),f
	line	59
;AD.c: 59: Adresult = Adsum >> 3;
	movf	(_Adsum+1),w
	movwf	(_Adresult+1)
	movf	(_Adsum),w
	movwf	(_Adresult)
	
l4477:	
	clrc
	rrf	(_Adresult+1),f
	rrf	(_Adresult),f
	clrc
	rrf	(_Adresult+1),f
	rrf	(_Adresult),f
	clrc
	rrf	(_Adresult+1),f
	rrf	(_Adresult),f
	line	61
	
l4479:	
;AD.c: 61: Adsum = 0;
	clrf	(_Adsum)
	clrf	(_Adsum+1)
	line	62
	
l4481:	
;AD.c: 62: Admin = 0;
	clrf	(_Admin)
	clrf	(_Admin+1)
	line	63
	
l4483:	
;AD.c: 63: Admax = 0;
	clrf	(_Admax)
	clrf	(_Admax+1)
	line	64
	
l4485:	
;AD.c: 64: Adtimes = 0;
	clrf	(_Adtimes)
	line	65
;AD.c: 65: PID.iCurVal=1023-Adresult;
	movlw	low(03FFh)
	movwf	(??_Ad_testing+0)+0
	movlw	high(03FFh)
	movwf	(??_Ad_testing+0)+0+1
	movf	(_Adresult),w
	subwf	0+(??_Ad_testing+0)+0,w
	movwf	0+(_PID)+010h
	movf	(_Adresult+1),w
	skipc
	incf	(_Adresult+1),w
	subwf	1+(??_Ad_testing+0)+0,w
	movwf	1+0+(_PID)+010h
	line	66
	
l4487:	
;AD.c: 66: Flag_ntc_onead=1;
	bsf	(_Flag_ntc_onead/8),(_Flag_ntc_onead)&7
	goto	l4491
	line	71
	
l4489:	
;AD.c: 69: else
;AD.c: 70: {
;AD.c: 71: Adsum = 0;
	clrf	(_Adsum)
	clrf	(_Adsum+1)
	line	72
;AD.c: 72: Admin = 0;
	clrf	(_Admin)
	clrf	(_Admin+1)
	line	73
;AD.c: 73: Admax = 0;
	clrf	(_Admax)
	clrf	(_Admax+1)
	line	74
;AD.c: 74: Adtimes = 0;
	clrf	(_Adtimes)
	line	76
	
l4491:	
;AD.c: 75: }
;AD.c: 76: Check_Ntc();
	fcall	_Check_Ntc
	line	77
	
l1322:	
	return
	opt stack 0
GLOBAL	__end_of_Ad_testing
	__end_of_Ad_testing:
;; =============== function _Ad_testing ends ============

	signat	_Ad_testing,4216
	global	_Disp_Lcd
psect	text442,local,class=CODE,delta=2
global __ptext442
__ptext442:

;; *************** function _Disp_Lcd *****************
;; Defined at:
;;		line 109 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Display_lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_disf
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text442
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Display_lcd.c"
	line	109
	global	__size_of_Disp_Lcd
	__size_of_Disp_Lcd	equ	__end_of_Disp_Lcd-_Disp_Lcd
	
_Disp_Lcd:	
	opt	stack 3
; Regs used in _Disp_Lcd: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	112
	
l4357:	
;Display_lcd.c: 112: LCDCON0=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(400)^0180h	;volatile
	line	113
;Display_lcd.c: 113: COMEN=0B00001111;
	movlw	(0Fh)
	movwf	(407)^0180h	;volatile
	line	116
	
l4359:	
;Display_lcd.c: 116: WPUA=0X00;
	clrf	(398)^0180h	;volatile
	line	117
	
l4361:	
;Display_lcd.c: 117: TRISA&=0XF1;
	movlw	(0F1h)
	bcf	status, 6	;RP1=0, select bank1
	andwf	(133)^080h,f	;volatile
	line	119
	
l4363:	
;Display_lcd.c: 119: TRISC=0XFF;
	movlw	(0FFh)
	movwf	(135)^080h	;volatile
	line	121
	
l4365:	
;Display_lcd.c: 121: if(Flag_onoff)
	btfss	(_Flag_onoff/8),(_Flag_onoff)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l654
u2260:
	line	123
	
l4367:	
;Display_lcd.c: 122: {
;Display_lcd.c: 123: RE0=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(72/8),(72)&7
	line	124
;Display_lcd.c: 124: }
	goto	l655
	line	125
	
l654:	
	line	127
;Display_lcd.c: 125: else
;Display_lcd.c: 126: {
;Display_lcd.c: 127: RE0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(72/8),(72)&7
	line	128
	
l655:	
	line	130
;Display_lcd.c: 128: }
;Display_lcd.c: 130: if(Dcount & 0x01)
	btfss	(_Dcount),(0)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l656
u2270:
	line	132
	
l4369:	
;Display_lcd.c: 131: {
;Display_lcd.c: 132: RB7 = 1;
	bsf	(55/8),(55)&7
	line	133
;Display_lcd.c: 133: RA1 = 1;
	bsf	(41/8),(41)&7
	line	134
;Display_lcd.c: 134: RA2 = 1;
	bsf	(42/8),(42)&7
	line	135
;Display_lcd.c: 135: RA3 = 1;
	bsf	(43/8),(43)&7
	line	136
;Display_lcd.c: 136: RA4 = 1;
	bsf	(44/8),(44)&7
	line	137
;Display_lcd.c: 137: RB6 = 1;
	bsf	(54/8),(54)&7
	line	139
;Display_lcd.c: 139: }
	goto	l4437
	line	140
	
l656:	
	line	142
;Display_lcd.c: 140: else
;Display_lcd.c: 141: {
;Display_lcd.c: 142: RB7 = 0;
	bcf	(55/8),(55)&7
	line	143
;Display_lcd.c: 143: RA1 = 0;
	bcf	(41/8),(41)&7
	line	144
;Display_lcd.c: 144: RA2 = 0;
	bcf	(42/8),(42)&7
	line	145
;Display_lcd.c: 145: RA3 = 0;
	bcf	(43/8),(43)&7
	line	146
;Display_lcd.c: 146: RA4 = 0;
	bcf	(44/8),(44)&7
	line	147
;Display_lcd.c: 147: RB6 = 0;
	bcf	(54/8),(54)&7
	goto	l4437
	line	154
	
l4371:	
;Display_lcd.c: 154: disf(0);
	movlw	(0)
	fcall	_disf
	line	157
	
l4373:	
;Display_lcd.c: 157: COMEN =0B00001110;
	movlw	(0Eh)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	158
	
l4375:	
;Display_lcd.c: 158: TRISC =0B10011110;
	movlw	(09Eh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	159
	
l4377:	
;Display_lcd.c: 159: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	160
;Display_lcd.c: 160: break;
	goto	l4439
	line	163
	
l4379:	
;Display_lcd.c: 163: disf(0);
	movlw	(0)
	fcall	_disf
	line	166
	
l4381:	
;Display_lcd.c: 166: COMEN=0B10001110;
	movlw	(08Eh)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	167
	
l4383:	
;Display_lcd.c: 167: TRISC=0B10011110;
	movlw	(09Eh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	168
	
l4385:	
;Display_lcd.c: 168: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	169
;Display_lcd.c: 169: break;
	goto	l4439
	line	173
	
l4387:	
;Display_lcd.c: 173: disf(1);
	movlw	(01h)
	fcall	_disf
	line	176
	
l4389:	
;Display_lcd.c: 176: COMEN=0B00001101;
	movlw	(0Dh)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	177
	
l4391:	
;Display_lcd.c: 177: TRISC=0B10011101;
	movlw	(09Dh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	178
	
l4393:	
;Display_lcd.c: 178: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	179
;Display_lcd.c: 179: break;
	goto	l4439
	line	182
	
l4395:	
;Display_lcd.c: 182: disf(1);
	movlw	(01h)
	fcall	_disf
	line	184
	
l4397:	
;Display_lcd.c: 184: COMEN=0B00001101;
	movlw	(0Dh)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	185
	
l4399:	
;Display_lcd.c: 185: TRISC=0B10011101;
	movlw	(09Dh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	186
	
l4401:	
;Display_lcd.c: 186: RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	187
;Display_lcd.c: 187: break;
	goto	l4439
	line	191
	
l4403:	
;Display_lcd.c: 191: disf(2);
	movlw	(02h)
	fcall	_disf
	line	193
	
l4405:	
;Display_lcd.c: 193: COMEN=0B00001011;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	194
	
l4407:	
;Display_lcd.c: 194: TRISC=0B10011011;
	movlw	(09Bh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	195
	
l4409:	
;Display_lcd.c: 195: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(58/8),(58)&7
	line	196
;Display_lcd.c: 196: break;
	goto	l4439
	line	199
	
l4411:	
;Display_lcd.c: 199: disf(2);
	movlw	(02h)
	fcall	_disf
	line	201
	
l4413:	
;Display_lcd.c: 201: COMEN=0B00001011;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	202
	
l4415:	
;Display_lcd.c: 202: TRISC=0B10011011;
	movlw	(09Bh)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	203
	
l4417:	
;Display_lcd.c: 203: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(58/8),(58)&7
	line	204
;Display_lcd.c: 204: break;
	goto	l4439
	line	208
	
l4419:	
;Display_lcd.c: 208: disf(3);
	movlw	(03h)
	fcall	_disf
	line	210
	
l4421:	
;Display_lcd.c: 210: COMEN=0B00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	211
	
l4423:	
;Display_lcd.c: 211: TRISC=0B10010111;
	movlw	(097h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	212
	
l4425:	
;Display_lcd.c: 212: RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(59/8),(59)&7
	line	213
;Display_lcd.c: 213: break;
	goto	l4439
	line	216
	
l4427:	
;Display_lcd.c: 216: disf(3);
	movlw	(03h)
	fcall	_disf
	line	218
	
l4429:	
;Display_lcd.c: 218: COMEN=0B00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	219
	
l4431:	
;Display_lcd.c: 219: TRISC=0B10010111;
	movlw	(097h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	220
	
l4433:	
;Display_lcd.c: 220: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(59/8),(59)&7
	line	221
;Display_lcd.c: 221: break;
	goto	l4439
	line	150
	
l4437:	
	movf	(_Dcount),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 6
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           13     6 (fixed)
; simple_byte           22    12 (average)
; jumptable            260     6 (fixed)
; rangetable            11     6 (fixed)
; spacedrange           20     9 (fixed)
; locatedrange           7     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	7
	subwf	fsr,w
skipnc
goto l4427
movlw high(S4729)
movwf pclath
	movlw low(S4729)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4729:
	ljmp	l4371
	ljmp	l4379
	ljmp	l4387
	ljmp	l4395
	ljmp	l4403
	ljmp	l4411
	ljmp	l4419
psect	text442

	line	225
	
l4439:	
;Display_lcd.c: 225: Dcount++; if(8 <= Dcount) {Dcount = 0;}
	incf	(_Dcount),f
	
l4441:	
	movlw	(08h)
	subwf	(_Dcount),w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l4445
u2280:
	
l4443:	
	clrf	(_Dcount)
	line	226
	
l4445:	
;Display_lcd.c: 226: if(Dcount&0x01)
	btfss	(_Dcount),(0)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l669
u2290:
	line	227
	
l4447:	
;Display_lcd.c: 227: Flag_bit=0;
	bcf	(_Flag_bit/8),(_Flag_bit)&7
	goto	l671
	line	228
	
l669:	
	line	229
;Display_lcd.c: 228: else
;Display_lcd.c: 229: Flag_bit=1;
	bsf	(_Flag_bit/8),(_Flag_bit)&7
	line	230
	
l671:	
	return
	opt stack 0
GLOBAL	__end_of_Disp_Lcd
	__end_of_Disp_Lcd:
;; =============== function _Disp_Lcd ends ============

	signat	_Disp_Lcd,88
	global	_Set_disp
psect	text443,local,class=CODE,delta=2
global __ptext443
__ptext443:

;; *************** function _Set_disp *****************
;; Defined at:
;;		line 7 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Display_lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  smg_data1       1   14[BANK0 ] unsigned char 
;;  smg_data3       1   13[BANK0 ] unsigned char 
;;  smg_data2       1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text443
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Display_lcd.c"
	line	7
	global	__size_of_Set_disp
	__size_of_Set_disp	equ	__end_of_Set_disp-_Set_disp
	
_Set_disp:	
	opt	stack 3
; Regs used in _Set_disp: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	11
	
l4295:	
;Display_lcd.c: 9: unsigned char smg_data1, smg_data2, smg_data3;
;Display_lcd.c: 11: Display[0]=0;
	clrf	(_Display)
	line	12
;Display_lcd.c: 12: Display[1]=0;
	clrf	0+(_Display)+01h
	line	13
;Display_lcd.c: 13: Display[2]=0;
	clrf	0+(_Display)+02h
	line	14
;Display_lcd.c: 14: Display[3]=0;
	clrf	0+(_Display)+03h
	line	16
	
l4297:	
;Display_lcd.c: 16: smg_data1 = LCDCode[Tempr_rank/100];
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(_Tempr_rank+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(_Tempr_rank),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(Set_disp@smg_data1)
	line	17
	
l4299:	
;Display_lcd.c: 17: smg_data2 = LCDCode[Tempr_rank%100/10];
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(_Tempr_rank+1),w
	movwf	1+(?___lwmod)+02h
	movf	(_Tempr_rank),w
	movwf	0+(?___lwmod)+02h
	movlw	064h
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	movwf	1+(?___lwdiv)+02h
	movf	(0+(?___lwmod)),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(Set_disp@smg_data2)
	line	18
	
l4301:	
;Display_lcd.c: 18: smg_data3 = LCDCode[Tempr_rank%10];
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movf	(_Tempr_rank+1),w
	movwf	1+(?___lwmod)+02h
	movf	(_Tempr_rank),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(Set_disp@smg_data3)
	line	21
	
l4303:	
;Display_lcd.c: 21: if(Flag_onoff)
	btfss	(_Flag_onoff/8),(_Flag_onoff)&7
	goto	u2031
	goto	u2030
u2031:
	goto	l4355
u2030:
	line	23
	
l4305:	
;Display_lcd.c: 22: {
;Display_lcd.c: 23: if(smg_data1 & 0x01)
	btfss	(Set_disp@smg_data1),(0)&7
	goto	u2041
	goto	u2040
u2041:
	goto	l628
u2040:
	line	24
	
l4307:	
;Display_lcd.c: 24: Display[3]|=(1<<1);
	bsf	0+(_Display)+03h+(1/8),(1)&7
	
l628:	
	line	25
;Display_lcd.c: 25: if(smg_data1 & 0x02)
	btfss	(Set_disp@smg_data1),(1)&7
	goto	u2051
	goto	u2050
u2051:
	goto	l629
u2050:
	line	26
	
l4309:	
;Display_lcd.c: 26: Display[2]|=(1<<1);
	bsf	0+(_Display)+02h+(1/8),(1)&7
	
l629:	
	line	27
;Display_lcd.c: 27: if(smg_data1 & 0x04)
	btfss	(Set_disp@smg_data1),(2)&7
	goto	u2061
	goto	u2060
u2061:
	goto	l630
u2060:
	line	28
	
l4311:	
;Display_lcd.c: 28: Display[1]|=(1<<1);
	bsf	0+(_Display)+01h+(1/8),(1)&7
	
l630:	
	line	29
;Display_lcd.c: 29: if(smg_data1 & 0x08)
	btfss	(Set_disp@smg_data1),(3)&7
	goto	u2071
	goto	u2070
u2071:
	goto	l631
u2070:
	line	30
	
l4313:	
;Display_lcd.c: 30: Display[0]|=(1<<1);
	bsf	(_Display)+(1/8),(1)&7
	
l631:	
	line	31
;Display_lcd.c: 31: if(smg_data1 & 0x10)
	btfss	(Set_disp@smg_data1),(4)&7
	goto	u2081
	goto	u2080
u2081:
	goto	l632
u2080:
	line	32
	
l4315:	
;Display_lcd.c: 32: Display[0]|=(1<<0);
	bsf	(_Display)+(0/8),(0)&7
	
l632:	
	line	33
;Display_lcd.c: 33: if(smg_data1 & 0x20)
	btfss	(Set_disp@smg_data1),(5)&7
	goto	u2091
	goto	u2090
u2091:
	goto	l633
u2090:
	line	34
	
l4317:	
;Display_lcd.c: 34: Display[2]|=(1<<0);
	bsf	0+(_Display)+02h+(0/8),(0)&7
	
l633:	
	line	35
;Display_lcd.c: 35: if(smg_data1 & 0x40)
	btfss	(Set_disp@smg_data1),(6)&7
	goto	u2101
	goto	u2100
u2101:
	goto	l634
u2100:
	line	36
	
l4319:	
;Display_lcd.c: 36: Display[1]|=(1<<0);
	bsf	0+(_Display)+01h+(0/8),(0)&7
	
l634:	
	line	39
;Display_lcd.c: 39: if(smg_data2 & 0x01)
	btfss	(Set_disp@smg_data2),(0)&7
	goto	u2111
	goto	u2110
u2111:
	goto	l635
u2110:
	line	40
	
l4321:	
;Display_lcd.c: 40: Display[3]|=(1<<3);
	bsf	0+(_Display)+03h+(3/8),(3)&7
	
l635:	
	line	41
;Display_lcd.c: 41: if(smg_data2 & 0x02)
	btfss	(Set_disp@smg_data2),(1)&7
	goto	u2121
	goto	u2120
u2121:
	goto	l636
u2120:
	line	42
	
l4323:	
;Display_lcd.c: 42: Display[2]|=(1<<3);
	bsf	0+(_Display)+02h+(3/8),(3)&7
	
l636:	
	line	43
;Display_lcd.c: 43: if(smg_data2 & 0x04)
	btfss	(Set_disp@smg_data2),(2)&7
	goto	u2131
	goto	u2130
u2131:
	goto	l637
u2130:
	line	44
	
l4325:	
;Display_lcd.c: 44: Display[1]|=(1<<3);
	bsf	0+(_Display)+01h+(3/8),(3)&7
	
l637:	
	line	45
;Display_lcd.c: 45: if(smg_data2 & 0x08)
	btfss	(Set_disp@smg_data2),(3)&7
	goto	u2141
	goto	u2140
u2141:
	goto	l638
u2140:
	line	46
	
l4327:	
;Display_lcd.c: 46: Display[0]|=(1<<3);
	bsf	(_Display)+(3/8),(3)&7
	
l638:	
	line	47
;Display_lcd.c: 47: if(smg_data2 & 0x10)
	btfss	(Set_disp@smg_data2),(4)&7
	goto	u2151
	goto	u2150
u2151:
	goto	l639
u2150:
	line	48
	
l4329:	
;Display_lcd.c: 48: Display[0]|=(1<<2);
	bsf	(_Display)+(2/8),(2)&7
	
l639:	
	line	49
;Display_lcd.c: 49: if(smg_data2 & 0x20)
	btfss	(Set_disp@smg_data2),(5)&7
	goto	u2161
	goto	u2160
u2161:
	goto	l640
u2160:
	line	50
	
l4331:	
;Display_lcd.c: 50: Display[2]|=(1<<2);
	bsf	0+(_Display)+02h+(2/8),(2)&7
	
l640:	
	line	51
;Display_lcd.c: 51: if(smg_data2 & 0x40)
	btfss	(Set_disp@smg_data2),(6)&7
	goto	u2171
	goto	u2170
u2171:
	goto	l641
u2170:
	line	52
	
l4333:	
;Display_lcd.c: 52: Display[1]|=(1<<2);
	bsf	0+(_Display)+01h+(2/8),(2)&7
	
l641:	
	line	55
;Display_lcd.c: 55: if(smg_data3 & 0x01)
	btfss	(Set_disp@smg_data3),(0)&7
	goto	u2181
	goto	u2180
u2181:
	goto	l642
u2180:
	line	56
	
l4335:	
;Display_lcd.c: 56: Display[3]|=(1<<5);
	bsf	0+(_Display)+03h+(5/8),(5)&7
	
l642:	
	line	57
;Display_lcd.c: 57: if(smg_data3 & 0x02)
	btfss	(Set_disp@smg_data3),(1)&7
	goto	u2191
	goto	u2190
u2191:
	goto	l643
u2190:
	line	58
	
l4337:	
;Display_lcd.c: 58: Display[2]|=(1<<5);
	bsf	0+(_Display)+02h+(5/8),(5)&7
	
l643:	
	line	59
;Display_lcd.c: 59: if(smg_data3 & 0x04)
	btfss	(Set_disp@smg_data3),(2)&7
	goto	u2201
	goto	u2200
u2201:
	goto	l644
u2200:
	line	60
	
l4339:	
;Display_lcd.c: 60: Display[1]|=(1<<5);
	bsf	0+(_Display)+01h+(5/8),(5)&7
	
l644:	
	line	61
;Display_lcd.c: 61: if(smg_data3 & 0x08)
	btfss	(Set_disp@smg_data3),(3)&7
	goto	u2211
	goto	u2210
u2211:
	goto	l645
u2210:
	line	62
	
l4341:	
;Display_lcd.c: 62: Display[0]|=(1<<5);
	bsf	(_Display)+(5/8),(5)&7
	
l645:	
	line	63
;Display_lcd.c: 63: if(smg_data3 & 0x10)
	btfss	(Set_disp@smg_data3),(4)&7
	goto	u2221
	goto	u2220
u2221:
	goto	l646
u2220:
	line	64
	
l4343:	
;Display_lcd.c: 64: Display[0]|=(1<<4);
	bsf	(_Display)+(4/8),(4)&7
	
l646:	
	line	65
;Display_lcd.c: 65: if(smg_data3 & 0x20)
	btfss	(Set_disp@smg_data3),(5)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l647
u2230:
	line	66
	
l4345:	
;Display_lcd.c: 66: Display[2]|=(1<<4);
	bsf	0+(_Display)+02h+(4/8),(4)&7
	
l647:	
	line	67
;Display_lcd.c: 67: if(smg_data3 & 0x40)
	btfss	(Set_disp@smg_data3),(6)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l648
u2240:
	line	68
	
l4347:	
;Display_lcd.c: 68: Display[1]|=(1<<4);
	bsf	0+(_Display)+01h+(4/8),(4)&7
	
l648:	
	line	70
;Display_lcd.c: 70: Display[3]|=(1<<4);
	bsf	0+(_Display)+03h+(4/8),(4)&7
	line	71
;Display_lcd.c: 71: Display[3]|=(1<<2);
	bsf	0+(_Display)+03h+(2/8),(2)&7
	line	73
	
l4349:	
;Display_lcd.c: 73: if(smg_data1==0x3f)
	movf	(Set_disp@smg_data1),w
	xorlw	03Fh
	skipz
	goto	u2251
	goto	u2250
u2251:
	goto	l651
u2250:
	line	75
	
l4351:	
;Display_lcd.c: 74: {
;Display_lcd.c: 75: Display[0]&=0xfc;
	movlw	(0FCh)
	andwf	(_Display),f
	line	76
;Display_lcd.c: 76: Display[1]&=0xfc;
	movlw	(0FCh)
	andwf	0+(_Display)+01h,f
	line	77
;Display_lcd.c: 77: Display[2]&=0xfc;
	movlw	(0FCh)
	andwf	0+(_Display)+02h,f
	line	78
	
l4353:	
;Display_lcd.c: 78: Display[3]&=0xfd;
	bcf	0+(_Display)+03h+(1/8),(1)&7
	goto	l651
	line	85
	
l4355:	
;Display_lcd.c: 83: else
;Display_lcd.c: 84: {
;Display_lcd.c: 85: Display[0]=0X17;
	movlw	(017h)
	movwf	(_Display)
	line	86
;Display_lcd.c: 86: Display[1]=0X16;
	movlw	(016h)
	movwf	0+(_Display)+01h
	line	87
;Display_lcd.c: 87: Display[2]=0X17;
	movlw	(017h)
	movwf	0+(_Display)+02h
	line	88
;Display_lcd.c: 88: Display[3]=0X2A;
	movlw	(02Ah)
	movwf	0+(_Display)+03h
	line	96
	
l651:	
	return
	opt stack 0
GLOBAL	__end_of_Set_disp
	__end_of_Set_disp:
;; =============== function _Set_disp ends ============

	signat	_Set_disp,88
	global	___lwmod
psect	text444,local,class=CODE,delta=2
global __ptext444
__ptext444:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "D:\SCMCU_IDE_V1.11.01_20180525\data\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Set_disp
;; This function uses a non-reentrant model
;;
psect	text444
	file	"D:\SCMCU_IDE_V1.11.01_20180525\data\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 3
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l4275:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u1991
	goto	u1990
u1991:
	goto	l4291
u1990:
	line	9
	
l4277:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	10
	goto	l4281
	line	11
	
l4279:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	12
	incf	(___lwmod@counter),f
	line	10
	
l4281:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2001
	goto	u2000
u2001:
	goto	l4279
u2000:
	line	15
	
l4283:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2015
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2015:
	skipc
	goto	u2011
	goto	u2010
u2011:
	goto	l4287
u2010:
	line	16
	
l4285:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	17
	
l4287:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	18
	
l4289:	
	decfsz	(___lwmod@counter),f
	goto	u2021
	goto	u2020
u2021:
	goto	l4283
u2020:
	line	20
	
l4291:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	21
	
l2772:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text445,local,class=CODE,delta=2
global __ptext445
__ptext445:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "D:\SCMCU_IDE_V1.11.01_20180525\data\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    5[BANK0 ] unsigned int 
;;  dividend        2    7[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    9[BANK0 ] unsigned int 
;;  counter         1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    5[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
;;		_Set_disp
;;		_PID_control
;; This function uses a non-reentrant model
;;
psect	text445
	file	"D:\SCMCU_IDE_V1.11.01_20180525\data\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 3
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l4249:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l4251:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u1951
	goto	u1950
u1951:
	goto	l4271
u1950:
	line	11
	
l4253:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l4257
	line	13
	
l4255:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l4257:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u1961
	goto	u1960
u1961:
	goto	l4255
u1960:
	line	17
	
l4259:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l4261:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u1975
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u1975:
	skipc
	goto	u1971
	goto	u1970
u1971:
	goto	l4267
u1970:
	line	19
	
l4263:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l4265:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l4267:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l4269:	
	decfsz	(___lwdiv@counter),f
	goto	u1981
	goto	u1980
u1981:
	goto	l4259
u1980:
	line	25
	
l4271:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l2762:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text446,local,class=CODE,delta=2
global __ptext446
__ptext446:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "D:\SCMCU_IDE_V1.11.01_20180525\data\sources\wmul.c"
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
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_PID_operation
;; This function uses a non-reentrant model
;;
psect	text446
	file	"D:\SCMCU_IDE_V1.11.01_20180525\data\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 2
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l4233:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	7
	
l4235:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u1931
	goto	u1930
u1931:
	goto	l4239
u1930:
	line	8
	
l4237:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	9
	
l4239:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	10
	
l4241:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	11
	
l4243:	
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u1941
	goto	u1940
u1941:
	goto	l4235
u1940:
	line	12
	
l4245:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	13
	
l2752:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_Delay
psect	text447,local,class=CODE,delta=2
global __ptext447
__ptext447:

;; *************** function _Delay *****************
;; Defined at:
;;		line 128 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Kscan.c"
;; Parameters:    Size  Location     Type
;;  k               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  k               1    0[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Kscan
;; This function uses a non-reentrant model
;;
psect	text447
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Kscan.c"
	line	128
	global	__size_of_Delay
	__size_of_Delay	equ	__end_of_Delay-_Delay
	
_Delay:	
	opt	stack 3
; Regs used in _Delay: [wreg+status,2+status,0]
;Delay@k stored from wreg
	line	130
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Delay@k)
	
l4227:	
;Kscan.c: 129: unsigned char i;
;Kscan.c: 130: for(i=0;i<k;i++)
	clrf	(Delay@i)
	goto	l4231
	line	131
	
l2738:	
	line	132
# 132 "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Kscan.c"
nop ;#
psect	text447
	line	130
	
l4229:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Delay@i),f
	
l4231:	
	movf	(Delay@k),w
	subwf	(Delay@i),w
	skipc
	goto	u1921
	goto	u1920
u1921:
	goto	l2738
u1920:
	line	134
	
l2740:	
	return
	opt stack 0
GLOBAL	__end_of_Delay
	__end_of_Delay:
;; =============== function _Delay ends ============

	signat	_Delay,4216
	global	_Kdeal
psect	text448,local,class=CODE,delta=2
global __ptext448
__ptext448:

;; *************** function _Kdeal *****************
;; Defined at:
;;		line 86 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Kscan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       2       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text448
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Kscan.c"
	line	86
	global	__size_of_Kdeal
	__size_of_Kdeal	equ	__end_of_Kdeal-_Kdeal
	
_Kdeal:	
	opt	stack 4
; Regs used in _Kdeal: [wreg-fsr0h+status,2+status,0+btemp+1+pclath]
	line	87
	
l4197:	
;Kscan.c: 87: if(Flag_keyf)
	btfss	(_Flag_keyf/8),(_Flag_keyf)&7
	goto	u1891
	goto	u1890
u1891:
	goto	l2734
u1890:
	line	89
	
l4199:	
;Kscan.c: 88: {
;Kscan.c: 89: Flag_keyf=0;
	bcf	(_Flag_keyf/8),(_Flag_keyf)&7
	line	91
;Kscan.c: 91: switch(Keyflash)
	goto	l4223
	line	95
	
l4201:	
;Kscan.c: 95: Flag_onoff=~Flag_onoff;
	movlw	1<<((_Flag_onoff)&7)
	xorwf	((_Flag_onoff)/8),f
	line	96
;Kscan.c: 96: Tempr_setdata=180;
	movlw	0B4h
	movwf	(_Tempr_setdata)
	clrf	(_Tempr_setdata+1)
	line	97
	
l4203:	
;Kscan.c: 97: Flag_first=0;
	bcf	(_Flag_first/8),(_Flag_first)&7
	line	98
	
l4205:	
;Kscan.c: 98: Flag_temprok=0;
	bcf	(_Flag_temprok/8),(_Flag_temprok)&7
	line	100
;Kscan.c: 100: break;
	goto	l4225
	line	103
	
l4207:	
;Kscan.c: 103: if(Tempr_setdata<230)
	movlw	high(0E6h)
	subwf	(_Tempr_setdata+1),w
	movlw	low(0E6h)
	skipnz
	subwf	(_Tempr_setdata),w
	skipnc
	goto	u1901
	goto	u1900
u1901:
	goto	l4225
u1900:
	line	105
	
l4209:	
;Kscan.c: 104: {
;Kscan.c: 105: Tempr_setdata+=5;
	movlw	05h
	addwf	(_Tempr_setdata),f
	skipnc
	incf	(_Tempr_setdata+1),f
	goto	l4203
	line	111
	
l4215:	
;Kscan.c: 111: if(Tempr_setdata>80)
	movlw	high(051h)
	subwf	(_Tempr_setdata+1),w
	movlw	low(051h)
	skipnz
	subwf	(_Tempr_setdata),w
	skipc
	goto	u1911
	goto	u1910
u1911:
	goto	l4225
u1910:
	line	113
	
l4217:	
;Kscan.c: 112: {
;Kscan.c: 113: Tempr_setdata-=5;
	movlw	low(05h)
	subwf	(_Tempr_setdata),f
	movlw	high(05h)
	skipc
	decf	(_Tempr_setdata+1),f
	subwf	(_Tempr_setdata+1),f
	goto	l4203
	line	91
	
l4223:	
	movf	(_Keyflash),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           12     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l4201
	xorlw	2^1	; case 2
	skipnz
	goto	l4207
	xorlw	3^2	; case 3
	skipnz
	goto	l4215
	goto	l4225
	opt asmopt_on

	line	119
	
l4225:	
;Kscan.c: 119: PID.iSetVal=Temptab[Tempr_setdata];
	movf	(_Tempr_setdata+1),w
	movwf	(??_Kdeal+0)+0+1
	movf	(_Tempr_setdata),w
	movwf	(??_Kdeal+0)+0
	clrc
	rlf	(??_Kdeal+0)+0,f
	rlf	(??_Kdeal+0)+1,f
	movlw	high(_Temptab|8000h)
	addwf	1+(??_Kdeal+0)+0,w
	movwf	btemp+1
	movlw	low(_Temptab|8000h)
	addwf	0+(??_Kdeal+0)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	0+(_PID)+0Eh
	fcall	stringtab
	movwf	1+(_PID)+0Eh
	line	121
	
l2734:	
	return
	opt stack 0
GLOBAL	__end_of_Kdeal
	__end_of_Kdeal:
;; =============== function _Kdeal ends ============

	signat	_Kdeal,88
	global	_Temp_setdeal
psect	text449,local,class=CODE,delta=2
global __ptext449
__ptext449:

;; *************** function _Temp_setdeal *****************
;; Defined at:
;;		line 288 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text449
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
	line	288
	global	__size_of_Temp_setdeal
	__size_of_Temp_setdeal	equ	__end_of_Temp_setdeal-_Temp_setdeal
	
_Temp_setdeal:	
	opt	stack 4
; Regs used in _Temp_setdeal: [wreg+status,2+status,0]
	line	289
	
l4159:	
;XLD-DLZFQ-20180105_V1.0.C: 289: if(Flag_onoff)
	btfss	(_Flag_onoff/8),(_Flag_onoff)&7
	goto	u1811
	goto	u1810
u1811:
	goto	l4193
u1810:
	line	292
	
l4161:	
;XLD-DLZFQ-20180105_V1.0.C: 290: {
;XLD-DLZFQ-20180105_V1.0.C: 292: if(!Flag_first)
	btfsc	(_Flag_first/8),(_Flag_first)&7
	goto	u1821
	goto	u1820
u1821:
	goto	l4171
u1820:
	line	294
	
l4163:	
;XLD-DLZFQ-20180105_V1.0.C: 293: {
;XLD-DLZFQ-20180105_V1.0.C: 294: Tempr_rank=Tempr_setdata;
	movf	(_Tempr_setdata+1),w
	movwf	(_Tempr_rank+1)
	movf	(_Tempr_setdata),w
	movwf	(_Tempr_rank)
	line	295
;XLD-DLZFQ-20180105_V1.0.C: 295: if(Tempr_tdata>=Tempr_setdata)
	movf	(_Tempr_setdata+1),w
	subwf	(_Tempr_tdata+1),w
	skipz
	goto	u1835
	movf	(_Tempr_setdata),w
	subwf	(_Tempr_tdata),w
u1835:
	skipc
	goto	u1831
	goto	u1830
u1831:
	goto	l2059
u1830:
	line	297
	
l4165:	
;XLD-DLZFQ-20180105_V1.0.C: 296: {
;XLD-DLZFQ-20180105_V1.0.C: 297: Flag_temprdir=0;
	bcf	(_Flag_temprdir/8),(_Flag_temprdir)&7
	line	298
;XLD-DLZFQ-20180105_V1.0.C: 298: }
	goto	l4167
	line	299
	
l2059:	
	line	301
;XLD-DLZFQ-20180105_V1.0.C: 299: else
;XLD-DLZFQ-20180105_V1.0.C: 300: {
;XLD-DLZFQ-20180105_V1.0.C: 301: Flag_temprdir=1;
	bsf	(_Flag_temprdir/8),(_Flag_temprdir)&7
	line	304
	
l4167:	
;XLD-DLZFQ-20180105_V1.0.C: 302: }
;XLD-DLZFQ-20180105_V1.0.C: 304: count1=0;
	clrf	(_count1)
	clrf	(_count1+1)
	line	305
	
l4169:	
;XLD-DLZFQ-20180105_V1.0.C: 305: Flag_first=1;
	bsf	(_Flag_first/8),(_Flag_first)&7
	line	306
;XLD-DLZFQ-20180105_V1.0.C: 306: }
	goto	l2070
	line	310
	
l4171:	
;XLD-DLZFQ-20180105_V1.0.C: 307: else
;XLD-DLZFQ-20180105_V1.0.C: 308: {
;XLD-DLZFQ-20180105_V1.0.C: 310: count1++;
	incf	(_count1),f
	skipnz
	incf	(_count1+1),f
	line	311
	
l4173:	
;XLD-DLZFQ-20180105_V1.0.C: 311: if(count1>=400)
	movlw	high(0190h)
	subwf	(_count1+1),w
	movlw	low(0190h)
	skipnz
	subwf	(_count1),w
	skipc
	goto	u1841
	goto	u1840
u1841:
	goto	l2070
u1840:
	line	313
	
l4175:	
;XLD-DLZFQ-20180105_V1.0.C: 312: {
;XLD-DLZFQ-20180105_V1.0.C: 313: count1=0;
	clrf	(_count1)
	clrf	(_count1+1)
	line	314
	
l4177:	
;XLD-DLZFQ-20180105_V1.0.C: 314: if(!Flag_temprok)
	btfsc	(_Flag_temprok/8),(_Flag_temprok)&7
	goto	u1851
	goto	u1850
u1851:
	goto	l4191
u1850:
	line	316
	
l4179:	
;XLD-DLZFQ-20180105_V1.0.C: 315: {
;XLD-DLZFQ-20180105_V1.0.C: 316: Tempr_rank=Tempr_tdata;
	movf	(_Tempr_tdata+1),w
	movwf	(_Tempr_rank+1)
	movf	(_Tempr_tdata),w
	movwf	(_Tempr_rank)
	line	318
	
l4181:	
;XLD-DLZFQ-20180105_V1.0.C: 318: if(Flag_temprdir==0)
	btfsc	(_Flag_temprdir/8),(_Flag_temprdir)&7
	goto	u1861
	goto	u1860
u1861:
	goto	l4187
u1860:
	line	320
	
l4183:	
;XLD-DLZFQ-20180105_V1.0.C: 319: {
;XLD-DLZFQ-20180105_V1.0.C: 320: if(Tempr_tdata<=Tempr_setdata)
	movf	(_Tempr_tdata+1),w
	subwf	(_Tempr_setdata+1),w
	skipz
	goto	u1875
	movf	(_Tempr_tdata),w
	subwf	(_Tempr_setdata),w
u1875:
	skipc
	goto	u1871
	goto	u1870
u1871:
	goto	l2062
u1870:
	line	322
	
l4185:	
;XLD-DLZFQ-20180105_V1.0.C: 321: {
;XLD-DLZFQ-20180105_V1.0.C: 322: Flag_temprok=1;
	bsf	(_Flag_temprok/8),(_Flag_temprok)&7
	goto	l2070
	line	327
	
l4187:	
;XLD-DLZFQ-20180105_V1.0.C: 325: else
;XLD-DLZFQ-20180105_V1.0.C: 326: {
;XLD-DLZFQ-20180105_V1.0.C: 327: if(Tempr_tdata>=Tempr_setdata)
	movf	(_Tempr_setdata+1),w
	subwf	(_Tempr_tdata+1),w
	skipz
	goto	u1885
	movf	(_Tempr_setdata),w
	subwf	(_Tempr_tdata),w
u1885:
	skipc
	goto	u1881
	goto	u1880
u1881:
	goto	l2062
u1880:
	goto	l4185
	line	335
	
l4191:	
;XLD-DLZFQ-20180105_V1.0.C: 333: else
;XLD-DLZFQ-20180105_V1.0.C: 334: {
;XLD-DLZFQ-20180105_V1.0.C: 335: Tempr_rank=Tempr_setdata;
	movf	(_Tempr_setdata+1),w
	movwf	(_Tempr_rank+1)
	movf	(_Tempr_setdata),w
	movwf	(_Tempr_rank)
	goto	l2070
	line	338
	
l2062:	
	goto	l2070
	line	345
	
l4193:	
;XLD-DLZFQ-20180105_V1.0.C: 343: else
;XLD-DLZFQ-20180105_V1.0.C: 344: {
;XLD-DLZFQ-20180105_V1.0.C: 345: count1=0;
	clrf	(_count1)
	clrf	(_count1+1)
	line	346
	
l4195:	
;XLD-DLZFQ-20180105_V1.0.C: 346: Flag_first=0;
	bcf	(_Flag_first/8),(_Flag_first)&7
	line	349
	
l2070:	
	return
	opt stack 0
GLOBAL	__end_of_Temp_setdeal
	__end_of_Temp_setdeal:
;; =============== function _Temp_setdeal ends ============

	signat	_Temp_setdeal,88
	global	_Init_System
psect	text450,local,class=CODE,delta=2
global __ptext450
__ptext450:

;; *************** function _Init_System *****************
;; Defined at:
;;		line 5 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
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
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
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
psect	text450
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
	line	5
	global	__size_of_Init_System
	__size_of_Init_System	equ	__end_of_Init_System-_Init_System
	
_Init_System:	
	opt	stack 4
; Regs used in _Init_System: [wreg+status,2]
	line	6
	
l4065:	
# 6 "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
nop ;#
	line	7
# 7 "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
clrwdt ;#
psect	text450
	line	9
	
l4067:	
;XLD-DLZFQ-20180105_V1.0.C: 9: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	10
;XLD-DLZFQ-20180105_V1.0.C: 10: PORTB = 0;
	clrf	(6)	;volatile
	line	11
;XLD-DLZFQ-20180105_V1.0.C: 11: PORTC = 0;
	clrf	(7)	;volatile
	line	13
	
l4069:	
;XLD-DLZFQ-20180105_V1.0.C: 13: TRISC =0XFF;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	14
	
l4071:	
;XLD-DLZFQ-20180105_V1.0.C: 14: TRISB =0X3B;
	movlw	(03Bh)
	movwf	(134)^080h	;volatile
	line	15
;XLD-DLZFQ-20180105_V1.0.C: 15: TRISA =0X00;
	clrf	(133)^080h	;volatile
	line	16
;XLD-DLZFQ-20180105_V1.0.C: 16: TRISE=0X00;
	clrf	(137)^080h	;volatile
	line	18
;XLD-DLZFQ-20180105_V1.0.C: 18: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	19
;XLD-DLZFQ-20180105_V1.0.C: 19: PORTB = 0;
	clrf	(6)	;volatile
	line	20
;XLD-DLZFQ-20180105_V1.0.C: 20: PORTC = 0;
	clrf	(7)	;volatile
	line	21
;XLD-DLZFQ-20180105_V1.0.C: 21: LCDCON0 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(400)^0180h	;volatile
	line	23
;XLD-DLZFQ-20180105_V1.0.C: 23: INTCON=0;
	clrf	(11)	;volatile
	line	24
	
l4073:	
;XLD-DLZFQ-20180105_V1.0.C: 24: OSCCON=0X71;
	movlw	(071h)
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	28
	
l1991:	
	return
	opt stack 0
GLOBAL	__end_of_Init_System
	__end_of_Init_System:
;; =============== function _Init_System ends ============

	signat	_Init_System,88
	global	_Check_Ntc
psect	text451,local,class=CODE,delta=2
global __ptext451
__ptext451:

;; *************** function _Check_Ntc *****************
;; Defined at:
;;		line 82 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
;;		_Ad_testing
;; This function uses a non-reentrant model
;;
psect	text451
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
	line	82
	global	__size_of_Check_Ntc
	__size_of_Check_Ntc	equ	__end_of_Check_Ntc-_Check_Ntc
	
_Check_Ntc:	
	opt	stack 3
; Regs used in _Check_Ntc: [wreg+status,2+status,0]
	line	84
	
l4029:	
;AD.c: 84: if(Flag_ntc_onead)
	btfss	(_Flag_ntc_onead/8),(_Flag_ntc_onead)&7
	goto	u1541
	goto	u1540
u1541:
	goto	l1336
u1540:
	line	87
	
l4031:	
;AD.c: 85: {
;AD.c: 87: if(Adresult>0X3FA)
	movlw	high(03FBh)
	subwf	(_Adresult+1),w
	movlw	low(03FBh)
	skipnz
	subwf	(_Adresult),w
	skipc
	goto	u1551
	goto	u1550
u1551:
	goto	l4045
u1550:
	line	89
	
l4033:	
;AD.c: 88: {
;AD.c: 89: Ntcnormaldely=0;
	clrf	(_Ntcnormaldely)
	line	90
	
l4035:	
;AD.c: 90: if(++Ntcopendely>100)
	movlw	(065h)
	incf	(_Ntcopendely),f
	subwf	((_Ntcopendely)),w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l1336
u1560:
	line	92
	
l4037:	
;AD.c: 91: {
;AD.c: 92: Flag_rt_open=1;
	bsf	(_Flag_rt_open/8),(_Flag_rt_open)&7
	line	93
	
l4039:	
;AD.c: 93: Ntcopendely=0;
	clrf	(_Ntcopendely)
	line	94
	
l4041:	
;AD.c: 94: Flag_hot = 0;
	bcf	(_Flag_hot/8),(_Flag_hot)&7
	line	96
	
l4043:	
;AD.c: 96: Flag_err=1;
	bsf	(_Flag_err/8),(_Flag_err)&7
	goto	l1336
	line	100
	
l4045:	
;AD.c: 100: else if(Adresult<20)
	movlw	high(014h)
	subwf	(_Adresult+1),w
	movlw	low(014h)
	skipnz
	subwf	(_Adresult),w
	skipnc
	goto	u1571
	goto	u1570
u1571:
	goto	l1329
u1570:
	line	102
	
l4047:	
;AD.c: 101: {
;AD.c: 102: Ntcnormaldely=0;
	clrf	(_Ntcnormaldely)
	line	103
	
l4049:	
;AD.c: 103: if(++Ntcshortdely>100)
	movlw	(065h)
	incf	(_Ntcshortdely),f
	subwf	((_Ntcshortdely)),w
	skipc
	goto	u1581
	goto	u1580
u1581:
	goto	l1336
u1580:
	line	105
	
l4051:	
;AD.c: 104: {
;AD.c: 105: Flag_rt_short=1;
	bsf	(_Flag_rt_short/8),(_Flag_rt_short)&7
	line	106
	
l4053:	
;AD.c: 106: Ntcshortdely=0;
	clrf	(_Ntcshortdely)
	goto	l4041
	line	111
	
l1329:	
	line	114
;AD.c: 111: else
;AD.c: 112: {
;AD.c: 114: if ( Flag_rt_short || Flag_rt_open )
	btfsc	(_Flag_rt_short/8),(_Flag_rt_short)&7
	goto	u1591
	goto	u1590
u1591:
	goto	l4061
u1590:
	
l4059:	
	btfss	(_Flag_rt_open/8),(_Flag_rt_open)&7
	goto	u1601
	goto	u1600
u1601:
	goto	l1328
u1600:
	line	116
	
l4061:	
;AD.c: 115: {
;AD.c: 116: if(++Ntcnormaldely>5)
	movlw	(06h)
	incf	(_Ntcnormaldely),f
	subwf	((_Ntcnormaldely)),w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l1336
u1610:
	line	118
	
l4063:	
;AD.c: 117: {
;AD.c: 118: Flag_rt_short= 0;
	bcf	(_Flag_rt_short/8),(_Flag_rt_short)&7
	line	119
;AD.c: 119: Flag_rt_open = 0;
	bcf	(_Flag_rt_open/8),(_Flag_rt_open)&7
	line	120
;AD.c: 120: Flag_err=0;
	bcf	(_Flag_err/8),(_Flag_err)&7
	goto	l1336
	line	123
	
l1328:	
	line	129
	
l1336:	
	return
	opt stack 0
GLOBAL	__end_of_Check_Ntc
	__end_of_Check_Ntc:
;; =============== function _Check_Ntc ends ============

	signat	_Check_Ntc,88
	global	_Ad_sample
psect	text452,local,class=CODE,delta=2
global __ptext452
__ptext452:

;; *************** function _Ad_sample *****************
;; Defined at:
;;		line 12 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1    1[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] volatile unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Ad_testing
;;		_source_v
;; This function uses a non-reentrant model
;;
psect	text452
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
	line	12
	global	__size_of_Ad_sample
	__size_of_Ad_sample	equ	__end_of_Ad_sample-_Ad_sample
	
_Ad_sample:	
	opt	stack 3
; Regs used in _Ad_sample: [wreg+status,2+status,0]
;Ad_sample@adch stored from wreg
	line	14
	movwf	(Ad_sample@adch)
	
l4009:	
;AD.c: 14: ADCON1 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	15
	
l4011:	
;AD.c: 15: ADCON0 = 0X41 | (adch << 2);
	bcf	status, 5	;RP0=0, select bank0
	movf	(Ad_sample@adch),w
	movwf	(??_Ad_sample+0)+0
	clrc
	rlf	(??_Ad_sample+0)+0,f
	clrc
	rlf	(??_Ad_sample+0)+0,w
	iorlw	041h
	movwf	(31)	;volatile
	line	16
	
l4013:	
# 16 "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
nop ;#
psect	text452
	line	17
	
l4015:	
# 17 "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\AD.c"
nop ;#
psect	text452
	line	18
	
l4017:	
;AD.c: 18: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	19
	
l4019:	
;AD.c: 19: volatile unsigned char i = 0;
	clrf	(Ad_sample@i)	;volatile
	line	20
;AD.c: 20: while(GODONE)
	goto	l1307
	
l1308:	
	line	22
;AD.c: 21: {
;AD.c: 22: if(0 == (--i))
	decfsz	(Ad_sample@i),f	;volatile
	goto	u1521
	goto	u1520
u1521:
	goto	l1307
u1520:
	line	23
	
l4021:	
;AD.c: 23: return 0;
	movlw	(0)
	goto	l1310
	line	24
	
l1307:	
	line	20
	btfsc	(249/8),(249)&7
	goto	u1531
	goto	u1530
u1531:
	goto	l1308
u1530:
	line	25
	
l4025:	
;AD.c: 24: }
;AD.c: 25: return 1;
	movlw	(01h)
	line	26
	
l1310:	
	return
	opt stack 0
GLOBAL	__end_of_Ad_sample
	__end_of_Ad_sample:
;; =============== function _Ad_sample ends ============

	signat	_Ad_sample,4217
	global	_disf
psect	text453,local,class=CODE,delta=2
global __ptext453
__ptext453:

;; *************** function _disf *****************
;; Defined at:
;;		line 235 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Display_lcd.c"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  a               1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Disp_Lcd
;; This function uses a non-reentrant model
;;
psect	text453
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\Display_lcd.c"
	line	235
	global	__size_of_disf
	__size_of_disf	equ	__end_of_disf-_disf
	
_disf:	
	opt	stack 3
; Regs used in _disf: [wreg-fsr0h+status,2+status,0]
;disf@a stored from wreg
	line	238
	movwf	(disf@a)
	
l3985:	
;Display_lcd.c: 238: if(Display[a] & 0x01) {RB6 = Flag_bit;}
	movf	(disf@a),w
	addlw	_Display&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfss	indf,(0)&7
	goto	u1341
	goto	u1340
u1341:
	goto	l3989
u1340:
	
l3987:	
	btfsc	(_Flag_bit/8),(_Flag_bit)&7
	goto	u1351
	goto	u1350
	
u1351:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	goto	u1364
u1350:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(54/8),(54)&7
u1364:
	line	239
	
l3989:	
;Display_lcd.c: 239: if(Display[a] & 0x02) {RB7 = Flag_bit;}
	movf	(disf@a),w
	addlw	_Display&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfss	indf,(1)&7
	goto	u1371
	goto	u1370
u1371:
	goto	l3993
u1370:
	
l3991:	
	btfsc	(_Flag_bit/8),(_Flag_bit)&7
	goto	u1381
	goto	u1380
	
u1381:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(55/8),(55)&7
	goto	u1394
u1380:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
u1394:
	line	240
	
l3993:	
;Display_lcd.c: 240: if(Display[a] & 0x04) {RA1 = Flag_bit;}
	movf	(disf@a),w
	addlw	_Display&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfss	indf,(2)&7
	goto	u1401
	goto	u1400
u1401:
	goto	l3997
u1400:
	
l3995:	
	btfsc	(_Flag_bit/8),(_Flag_bit)&7
	goto	u1411
	goto	u1410
	
u1411:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	goto	u1424
u1410:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(41/8),(41)&7
u1424:
	line	241
	
l3997:	
;Display_lcd.c: 241: if(Display[a] & 0x08) {RA2 = Flag_bit;}
	movf	(disf@a),w
	addlw	_Display&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfss	indf,(3)&7
	goto	u1431
	goto	u1430
u1431:
	goto	l4001
u1430:
	
l3999:	
	btfsc	(_Flag_bit/8),(_Flag_bit)&7
	goto	u1441
	goto	u1440
	
u1441:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	goto	u1454
u1440:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
u1454:
	line	242
	
l4001:	
;Display_lcd.c: 242: if(Display[a] & 0x010) {RA3 = Flag_bit;}
	movf	(disf@a),w
	addlw	_Display&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfss	indf,(4)&7
	goto	u1461
	goto	u1460
u1461:
	goto	l4005
u1460:
	
l4003:	
	btfsc	(_Flag_bit/8),(_Flag_bit)&7
	goto	u1471
	goto	u1470
	
u1471:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	goto	u1484
u1470:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(43/8),(43)&7
u1484:
	line	243
	
l4005:	
;Display_lcd.c: 243: if(Display[a] & 0x020) {RA4 = Flag_bit;}
	movf	(disf@a),w
	addlw	_Display&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	btfss	indf,(5)&7
	goto	u1491
	goto	u1490
u1491:
	goto	l680
u1490:
	
l4007:	
	btfsc	(_Flag_bit/8),(_Flag_bit)&7
	goto	u1501
	goto	u1500
	
u1501:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(44/8),(44)&7
	goto	u1514
u1500:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(44/8),(44)&7
u1514:
	line	247
	
l680:	
	return
	opt stack 0
GLOBAL	__end_of_disf
	__end_of_disf:
;; =============== function _disf ends ============

	signat	_disf,4216
	global	_Isr_Timer
psect	text454,local,class=CODE,delta=2
global __ptext454
__ptext454:

;; *************** function _Isr_Timer *****************
;; Defined at:
;;		line 109 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          4       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_AcTestZero
;;		_ScrControl
;;		_Tmper_pro
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text454
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
	line	109
	global	__size_of_Isr_Timer
	__size_of_Isr_Timer	equ	__end_of_Isr_Timer-_Isr_Timer
	
_Isr_Timer:	
	opt	stack 2
; Regs used in _Isr_Timer: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_Isr_Timer+3)
	ljmp	_Isr_Timer
psect	text454
	line	110
	
i1l4115:	
;XLD-DLZFQ-20180105_V1.0.C: 110: if(TMR2IF&&TMR2ON)
	btfss	(97/8),(97)&7
	goto	u174_21
	goto	u174_20
u174_21:
	goto	i1l2012
u174_20:
	
i1l4117:	
	btfss	(146/8),(146)&7
	goto	u175_21
	goto	u175_20
u175_21:
	goto	i1l2012
u175_20:
	line	112
	
i1l4119:	
;XLD-DLZFQ-20180105_V1.0.C: 111: {
;XLD-DLZFQ-20180105_V1.0.C: 112: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	113
	
i1l4121:	
;XLD-DLZFQ-20180105_V1.0.C: 113: Maintime++;
	incf	(_Maintime),f
	line	114
	
i1l4123:	
;XLD-DLZFQ-20180105_V1.0.C: 114: if(Maintime >= 20)
	movlw	(014h)
	subwf	(_Maintime),w
	skipc
	goto	u176_21
	goto	u176_20
u176_21:
	goto	i1l4129
u176_20:
	line	116
	
i1l4125:	
;XLD-DLZFQ-20180105_V1.0.C: 115: {
;XLD-DLZFQ-20180105_V1.0.C: 116: Maintime = 0;
	clrf	(_Maintime)
	line	117
	
i1l4127:	
;XLD-DLZFQ-20180105_V1.0.C: 117: Flag_mainloop = 1;
	bsf	(_Flag_mainloop/8),(_Flag_mainloop)&7
	line	119
	
i1l4129:	
;XLD-DLZFQ-20180105_V1.0.C: 118: }
;XLD-DLZFQ-20180105_V1.0.C: 119: AcTestZero();
	fcall	_AcTestZero
	line	120
	
i1l4131:	
;XLD-DLZFQ-20180105_V1.0.C: 120: ScrControl();
	fcall	_ScrControl
	line	122
	
i1l4133:	
;XLD-DLZFQ-20180105_V1.0.C: 122: Tmper_pro();
	fcall	_Tmper_pro
	line	124
	
i1l2012:	
	movf	(??_Isr_Timer+3),w
	movwf	btemp+1
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
;; =============== function _Isr_Timer ends ============

	signat	_Isr_Timer,88
	global	_Tmper_pro
psect	text455,local,class=CODE,delta=2
global __ptext455
__ptext455:

;; *************** function _Tmper_pro *****************
;; Defined at:
;;		line 355 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          4       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Isr_Timer
;; This function uses a non-reentrant model
;;
psect	text455
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
	line	355
	global	__size_of_Tmper_pro
	__size_of_Tmper_pro	equ	__end_of_Tmper_pro-_Tmper_pro
	
_Tmper_pro:	
	opt	stack 2
; Regs used in _Tmper_pro: [wreg-fsr0h+status,2+status,0+btemp+1+pclath]
	line	357
	
i1l4135:	
;XLD-DLZFQ-20180105_V1.0.C: 356: static unsigned int n=0;
;XLD-DLZFQ-20180105_V1.0.C: 357: if(Flag_ntc_onead)
	btfss	(_Flag_ntc_onead/8),(_Flag_ntc_onead)&7
	goto	u177_21
	goto	u177_20
u177_21:
	goto	i1l2081
u177_20:
	line	359
	
i1l4137:	
;XLD-DLZFQ-20180105_V1.0.C: 358: {
;XLD-DLZFQ-20180105_V1.0.C: 359: if(!Flag_step)
	btfsc	(_Flag_step/8),(_Flag_step)&7
	goto	u178_21
	goto	u178_20
u178_21:
	goto	i1l4143
u178_20:
	line	361
	
i1l4139:	
;XLD-DLZFQ-20180105_V1.0.C: 360: {
;XLD-DLZFQ-20180105_V1.0.C: 361: Tmper_temp=PID.iCurVal;
	movf	1+(_PID)+010h,w
	movwf	(_Tmper_temp+1)
	movf	0+(_PID)+010h,w
	movwf	(_Tmper_temp)
	line	362
	
i1l4141:	
;XLD-DLZFQ-20180105_V1.0.C: 362: Flag_step=1;
	bsf	(_Flag_step/8),(_Flag_step)&7
	line	363
;XLD-DLZFQ-20180105_V1.0.C: 363: }
	goto	i1l2081
	line	367
	
i1l4143:	
;XLD-DLZFQ-20180105_V1.0.C: 364: else
;XLD-DLZFQ-20180105_V1.0.C: 365: {
;XLD-DLZFQ-20180105_V1.0.C: 367: if(Tmper_temp>Temptab[n])
	movf	(Tmper_pro@n+1),w
	movwf	(??_Tmper_pro+0)+0+1
	movf	(Tmper_pro@n),w
	movwf	(??_Tmper_pro+0)+0
	clrc
	rlf	(??_Tmper_pro+0)+0,f
	rlf	(??_Tmper_pro+0)+1,f
	movlw	high(_Temptab|8000h)
	addwf	1+(??_Tmper_pro+0)+0,w
	movwf	btemp+1
	movlw	low(_Temptab|8000h)
	addwf	0+(??_Tmper_pro+0)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_Tmper_pro+2)+0
	fcall	stringtab
	movwf	(??_Tmper_pro+2)+0+1
	movf	(_Tmper_temp+1),w
	subwf	1+(??_Tmper_pro+2)+0,w
	skipz
	goto	u179_25
	movf	(_Tmper_temp),w
	subwf	0+(??_Tmper_pro+2)+0,w
u179_25:
	skipnc
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l4153
u179_20:
	line	369
	
i1l4145:	
;XLD-DLZFQ-20180105_V1.0.C: 368: {
;XLD-DLZFQ-20180105_V1.0.C: 369: n++;
	incf	(Tmper_pro@n),f
	skipnz
	incf	(Tmper_pro@n+1),f
	line	370
	
i1l4147:	
;XLD-DLZFQ-20180105_V1.0.C: 370: if(n>=236)
	movlw	high(0ECh)
	subwf	(Tmper_pro@n+1),w
	movlw	low(0ECh)
	skipnz
	subwf	(Tmper_pro@n),w
	skipc
	goto	u180_21
	goto	u180_20
u180_21:
	goto	i1l2077
u180_20:
	line	372
	
i1l4149:	
;XLD-DLZFQ-20180105_V1.0.C: 371: {
;XLD-DLZFQ-20180105_V1.0.C: 372: n=236;
	movlw	0ECh
	movwf	(Tmper_pro@n)
	clrf	(Tmper_pro@n+1)
	line	373
;XLD-DLZFQ-20180105_V1.0.C: 373: Tempr_tdata=236;
	movlw	0ECh
	movwf	(_Tempr_tdata)
	clrf	(_Tempr_tdata+1)
	line	374
	
i1l4151:	
;XLD-DLZFQ-20180105_V1.0.C: 374: Flag_step=0;
	bcf	(_Flag_step/8),(_Flag_step)&7
	goto	i1l2081
	line	379
	
i1l4153:	
;XLD-DLZFQ-20180105_V1.0.C: 377: else
;XLD-DLZFQ-20180105_V1.0.C: 378: {
;XLD-DLZFQ-20180105_V1.0.C: 379: Tempr_tdata=n;
	movf	(Tmper_pro@n+1),w
	movwf	(_Tempr_tdata+1)
	movf	(Tmper_pro@n),w
	movwf	(_Tempr_tdata)
	line	380
	
i1l4155:	
;XLD-DLZFQ-20180105_V1.0.C: 380: n=0;
	clrf	(Tmper_pro@n)
	clrf	(Tmper_pro@n+1)
	goto	i1l4151
	line	383
	
i1l2077:	
	line	386
	
i1l2081:	
	return
	opt stack 0
GLOBAL	__end_of_Tmper_pro
	__end_of_Tmper_pro:
;; =============== function _Tmper_pro ends ============

	signat	_Tmper_pro,88
	global	_ScrControl
psect	text456,local,class=CODE,delta=2
global __ptext456
__ptext456:

;; *************** function _ScrControl *****************
;; Defined at:
;;		line 71 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text456
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
	line	71
	global	__size_of_ScrControl
	__size_of_ScrControl	equ	__end_of_ScrControl-_ScrControl
	
_ScrControl:	
	opt	stack 3
; Regs used in _ScrControl: [wreg+status,2+status,0]
	line	73
	
i1l4091:	
;XLD-DLZFQ-20180105_V1.0.C: 73: if(Flag_hot&&Flag_zero)
	btfss	(_Flag_hot/8),(_Flag_hot)&7
	goto	u169_21
	goto	u169_20
u169_21:
	goto	i1l2001
u169_20:
	
i1l4093:	
	btfss	(_Flag_zero/8),(_Flag_zero)&7
	goto	u170_21
	goto	u170_20
u170_21:
	goto	i1l2001
u170_20:
	line	75
	
i1l4095:	
;XLD-DLZFQ-20180105_V1.0.C: 74: {
;XLD-DLZFQ-20180105_V1.0.C: 75: if(Flag_HV)
	btfss	(_Flag_HV/8),(_Flag_HV)&7
	goto	u171_21
	goto	u171_20
u171_21:
	goto	i1l4099
u171_20:
	line	77
	
i1l4097:	
;XLD-DLZFQ-20180105_V1.0.C: 76: {
;XLD-DLZFQ-20180105_V1.0.C: 77: if(Flag_vtemp)
	btfss	(_Flag_vtemp/8),(_Flag_vtemp)&7
	goto	u172_21
	goto	u172_20
u172_21:
	goto	i1l4101
u172_20:
	line	78
	
i1l4099:	
;XLD-DLZFQ-20180105_V1.0.C: 78: RB2=0;
	bcf	(50/8),(50)&7
	line	83
	
i1l4101:	
;XLD-DLZFQ-20180105_V1.0.C: 83: Kkg_dly++;
	incf	(_Kkg_dly),f
	line	84
	
i1l4103:	
;XLD-DLZFQ-20180105_V1.0.C: 84: if(Kkg_dly>=5)
	movlw	(05h)
	subwf	(_Kkg_dly),w
	skipc
	goto	u173_21
	goto	u173_20
u173_21:
	goto	i1l2007
u173_20:
	line	86
	
i1l4105:	
;XLD-DLZFQ-20180105_V1.0.C: 85: {
;XLD-DLZFQ-20180105_V1.0.C: 86: Flag_vtemp=~Flag_vtemp;
	movlw	1<<((_Flag_vtemp)&7)
	xorwf	((_Flag_vtemp)/8),f
	line	87
	
i1l4107:	
;XLD-DLZFQ-20180105_V1.0.C: 87: Flag_zero=0;
	bcf	(_Flag_zero/8),(_Flag_zero)&7
	line	88
	
i1l4109:	
;XLD-DLZFQ-20180105_V1.0.C: 88: Kkg_dly=0;
	clrf	(_Kkg_dly)
	line	89
	
i1l4111:	
;XLD-DLZFQ-20180105_V1.0.C: 89: RB2=1;
	bsf	(50/8),(50)&7
	goto	i1l2007
	line	92
	
i1l2001:	
	line	94
;XLD-DLZFQ-20180105_V1.0.C: 92: else
;XLD-DLZFQ-20180105_V1.0.C: 93: {
;XLD-DLZFQ-20180105_V1.0.C: 94: RB2=1;
	bsf	(50/8),(50)&7
	line	95
;XLD-DLZFQ-20180105_V1.0.C: 95: Flag_zero=0;
	bcf	(_Flag_zero/8),(_Flag_zero)&7
	line	96
	
i1l4113:	
;XLD-DLZFQ-20180105_V1.0.C: 96: Kkg_dly=0;
	clrf	(_Kkg_dly)
	line	98
	
i1l2007:	
	return
	opt stack 0
GLOBAL	__end_of_ScrControl
	__end_of_ScrControl:
;; =============== function _ScrControl ends ============

	signat	_ScrControl,88
	global	_AcTestZero
psect	text457,local,class=CODE,delta=2
global __ptext457
__ptext457:

;; *************** function _AcTestZero *****************
;; Defined at:
;;		line 39 in file "E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text457
	file	"E:\Elec DataSheet\单片机\中微单片机\SC8P171X_开发工具软件及Demo 程序 -- 电压表\ZFQ-Demo-Code -20180105_V1.0-1713s\XLD-DLZFQ-20180105_V1.0源程序\XLD-DLZFQ-20180105_V1.0.C"
	line	39
	global	__size_of_AcTestZero
	__size_of_AcTestZero	equ	__end_of_AcTestZero-_AcTestZero
	
_AcTestZero:	
	opt	stack 3
; Regs used in _AcTestZero: []
	line	40
	
i1l4075:	
;XLD-DLZFQ-20180105_V1.0.C: 40: if(Flag_ach)
	btfss	(_Flag_ach/8),(_Flag_ach)&7
	goto	u162_21
	goto	u162_20
u162_21:
	goto	i1l1994
u162_20:
	line	42
	
i1l4077:	
;XLD-DLZFQ-20180105_V1.0.C: 41: {
;XLD-DLZFQ-20180105_V1.0.C: 42: if ((!RB5)&&(!RB5)&&(!RB5))
	btfsc	(53/8),(53)&7
	goto	u163_21
	goto	u163_20
u163_21:
	goto	i1l1998
u163_20:
	
i1l4079:	
	btfsc	(53/8),(53)&7
	goto	u164_21
	goto	u164_20
u164_21:
	goto	i1l1998
u164_20:
	
i1l4081:	
	btfsc	(53/8),(53)&7
	goto	u165_21
	goto	u165_20
u165_21:
	goto	i1l1998
u165_20:
	line	44
	
i1l4083:	
;XLD-DLZFQ-20180105_V1.0.C: 43: {
;XLD-DLZFQ-20180105_V1.0.C: 44: Flag_ach=0;
	bcf	(_Flag_ach/8),(_Flag_ach)&7
	line	45
;XLD-DLZFQ-20180105_V1.0.C: 45: Flag_zero=1;
	bsf	(_Flag_zero/8),(_Flag_zero)&7
	goto	i1l1998
	line	48
	
i1l1994:	
	line	50
;XLD-DLZFQ-20180105_V1.0.C: 48: else
;XLD-DLZFQ-20180105_V1.0.C: 49: {
;XLD-DLZFQ-20180105_V1.0.C: 50: if (RB5&&RB5&&RB5)
	btfss	(53/8),(53)&7
	goto	u166_21
	goto	u166_20
u166_21:
	goto	i1l1998
u166_20:
	
i1l4085:	
	btfss	(53/8),(53)&7
	goto	u167_21
	goto	u167_20
u167_21:
	goto	i1l1998
u167_20:
	
i1l4087:	
	btfss	(53/8),(53)&7
	goto	u168_21
	goto	u168_20
u168_21:
	goto	i1l1998
u168_20:
	line	52
	
i1l4089:	
;XLD-DLZFQ-20180105_V1.0.C: 51: {
;XLD-DLZFQ-20180105_V1.0.C: 52: Flag_ach=1;
	bsf	(_Flag_ach/8),(_Flag_ach)&7
	line	53
;XLD-DLZFQ-20180105_V1.0.C: 53: Flag_zero=1;
	bsf	(_Flag_zero/8),(_Flag_zero)&7
	line	57
	
i1l1998:	
	return
	opt stack 0
GLOBAL	__end_of_AcTestZero
	__end_of_AcTestZero:
;; =============== function _AcTestZero ends ============

	signat	_AcTestZero,88
psect	text458,local,class=CODE,delta=2
global __ptext458
__ptext458:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
