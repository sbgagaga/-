;**********************************************
;���������ʹ�÷���,�˳�������ο�
;**********************************************

;����RAM
GPR0		EQU 		?
GPR1		EQU 		?        
TCOUNT		EQU 		��	
TEMP        EQU         ?
TEMPL		EQU			?
COUNT       EQU         ?

KEYF_OLD	EQU			?

TIME		EQU			?

WORK		EQU			?
F_ONOFF		EQU			WORK,0

;**********************************************
;**********************************************
		ORG 		00H
   		JP  		START
		ORG 		04H
;**********************************************
        LD  		GPR0,A			;�ж��ֳ�����
		SWAPR		GPR0
		SWAPA		STATUS
		LD  		GPR1,A
INT_TMR2:
		CLR 		PIR1			;���ж���Ӧ��־λ
		INCR		TCOUNT
;**********************************************
INT_EXIT:
		SWAPA		GPR1
		LD  		STATUS,A
		SWAPA		GPR0
		RETI
;**********************************************
;**********************************************

;**********************************************
;**********************************************
START:
		NOP
		CLRWDT
		
		LDIA		071H
		LD			OSCCON,A		;8MHz
		CLR			INTCON
		
;-----------��ʼ��I/O------------------------
		LDIA		00H
		LD  		PORTA,A
		LD  		TRISA,A
		LD  		PORTA,A	
				
		LD  		PORTB,A
		LD  		TRISB,A			
		LD  		PORTB,A	
		
		LD  		PORTC,A		
		LD  		TRISC,A
		LD  		PORTC,A
		
;-----------��Ĵ���10~7FH-------------------
		CLRB		STATUS,IRP
CLR_RAM��
		LDIA		1FH					;��20H��ʼ
		LD  		FSR,A
CLR_RAM_LOOP
		INCR		FSR
		CLR 		INDF
		LDIA		07FH
		ANDA		FSR
		SUBIA		07FH				;20-7F,A0-FF,120-17F,1A0-1FF
		SNZB 		STATUS,Z
		JP  		CLR_RAM_LOOP
		SZB 		FSR,7
		JP  		CLR_RAM_H
		LDIA		20H					;��ǰ��7FH������20H����ʼ��A0-FF
		ADDR		FSR
		JP  		CLR_RAM_LOOP
CLR_RAM_H:						
		SZB 		STATUS,IRP			;�ж��Ƿ��Ѿ��ǵ�3-4BANK
		JP  		CLR_RAM_BACK		;�Ѿ��ǵ�3-4BANK,��RAM����
		SETB		STATUS,IRP			;����3-4BANK,����BANK��־λ����ʼ��3-4BANK��RAM
		JP  		CLR_RAM
CLR_RAM_BACK:
		CLRB		STATUS,IRP
;----------------------------------------------
INIT_LOOP:							;�ϵ���ʱ3*256*256/2=100MS
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		SZDECR		COUNT
		JP  		INIT_LOOP
		CLRWDT
	
		SZDECR		TEMP
		JP  		INIT_LOOP
;**********************************************
;**********************************************
MAIN:
        CALL        SET_SYS
		LDIA		.32				;125us*32=4msһ����ѭ��
		SUBA		TCOUNT
		SNZB		STATUS,C
		JP  		MAIN
;**********************************************
		CLR 		TCOUNT
		CLRWDT
		
		CALL		SET_SYS		
		CALL  		KSCAN           ;����ɨ�����
		CALL        MAINK
		CALL		SET_WORK
		CALL		WORK_SLEPP
		JP  		MAIN


;**********************************************
;**********************************************
SET_SYS:
		LDIA		.250
		LD  		PR2,A
		LDIA		02H
		LD			PIE1,A
		LDIA		0C0H
		LD  		INTCON,A		;��ʱ2�ж�ʹ��
		LDIA		04H
		SUBA		T2CON			;T2CONΪ04ʱ��д
		LDIA		04H	
		SNZB 		STATUS,Z	
		LD  		T2CON,A			;д������Ӱ���ʱ����T2CONû���ҵ�ʱ��д	
		RET


;**********************************************
;�����������
;ÿ�μ�⵽������תIO�������ƽ
;**********************************************
MAINK:
		LD			A,KEYF
		SZB			STATUS,Z
		JP			MAINK_NO
		
		LD			A,KEYF
		XORA		KEYF_OLD		;��ͬ
		SZB			STATUS,Z
		JP			MAINK_BACK
		
		LD			KEYF_OLD,A
		
		LDIA		10H
		SNZB		KEYF_OLD,0
		JP			$+3
		SZB			KEYF,0
		XORR		PORTA
		
		LDIA		20H
		SNZB		KEYF_OLD,1
		JP			$+3
		SZB			KEYF,1
		XORR		PORTA
		
		LD			A,KEYF
		LD			KEYF_OLD,A

		JP			MAINK_BACK
MAINK_NO:
		CLR			KEYF_OLD
MAINK_BACK:
		RET

;**********************************************
;**********************************************
SET_WORK:
		LD			A,KEYF
		SZB			STATUS,Z
		JP			SET_WORK_BACK
		
		SNZB		KEYF,0
		JP			SET_WORK_ON
		
		CLRB		F_ONOFF
		SZB			PORTA,4
SET_WORK_ON:
		SETB		F_ONOFF
		
		SNZB		F_ONOFF
		CLRB		PORTA,4
		SZB			F_ONOFF
		SETB		PORTA,4
SET_WORK_BACK:
		RET

;**********************************************
;��������
;**********************************************
WORK_SLEPP:
#if 	C_KEY_WAKEUP != 0
		SZB			F_ONOFF
		CLR			TIME

		;�ػ�500MSϵͳ��������
		INCR		TIME
		LDIA		125					;4MS*125=500MS
		SUBA		TIME
		SNZB		STATUS,C
		RET
		CLR			TIME

		;��������ǰ�ص����й���ģ��,�Խ������ߵ���
		CLR			ADCON0
		CLR			KEYCON0
		CLR			CCP1CON
		CLR			CCP2CON
		
		
		;��������ǰ,����̶����ߵ�ƽ,���ȫ������͵�ƽ,���ر�������������
		CLR			TRISA
		CLR			PORTA
		CLR			TRISB
		CLR			PORTB
		CLR			TRISC
		CLR			PORTC
		
		CLR			WPUA
		CLR			WPUB
		CLR			WPUC
		
		CALL		_KSCAN_ENTER_SLEEP	;��������ģʽ
		
		;���߱�����,���������жϵ�SFR,ʹϵͳ������������
;		CALL		SET_SYS
#endif		
		RET

;**********************************************
;���ð������ļ�
;**********************************************
KSCAN:
        #INCLUDE	"Touch_Kscan_Library.lib"
;**********************************************
		END

