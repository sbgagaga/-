;ע�����
;1��SC8P8022 �� PIN2 ���� RE0��RB7 �Ϸ���һ���ڴ�������Ӧ�ù����� TRISB,7 ��������Ϊ1����RB7Ϊ����״̬��
;2��SC8P8022 �� PIN7 ���� RA1��RA2��RC2 �Ϸ���һ��Ӧ�ù����н�δʹ�õ�2���ܽŹ̶�����Ϊ����״̬��
;**********************************************
;**********************************************

GPR0		EQU 		?	       
GPR1		EQU 		?        
TCOUNT		EQU 		?	
TEMP        EQU         ?
TEMPL		EQU			?
COUNT       EQU         ?

KEYF_OLD	EQU			?
;--------------------------------------------
;����RAM
;**************************************
;*********************************************************
		ORG 		00H
   		JP  		START
		ORG 		04H
;***************************************************

        LD  		GPR0,A			;�ж��ֳ���9��
		SWAPR		GPR0
		SWAPA		STATUS
		LD  		GPR1,A
INT_TMR2:
		CLR 		PIR1			;���ж���Ӧ��־λ
		INCR		TCOUNT
;*****************************************
INT_EXIT:
		SWAPA		GPR1
		LD  		STATUS,A
		SWAPA		GPR0
		RETI
;********************************************

;********************************************
;********************************************
		
;********************************************
START:
		NOP
		CLRWDT
		NOP
		NOP
		NOP
;-----------��ʼ��I/O------------------------
		LDIA		071H
		LD			OSCCON,A
		LDIA		000H
		LD  		PORTA,A	    ;�ϵ�رռ̵��� PA.6 PA.7			
		LDIA		B'00000000'
		LD  		TRISA,A
	    LDIA		080H
		LD  		PORTA,A	
		
		LDIA		B'11111111'			
		LD  		PORTB,A
		LDIA		B'11111111'	
		LD  		TRISB,A
		LDIA		B'11111111'			
		LD  		PORTB,A	
		LDIA		B'11111111'
		LD  		PORTC,A
		LDIA		B'01000000'		
		LD  		TRISC,A			
	    LDIA		B'11111111'
		LD  		PORTC,A
		
;		LDIA		00H
;		LD  		PORTE,A
;		LDIA		B'00001111'		
;		LD  		TRISE,A
;		LDIA		0H
;		LD  		PORTE,A

		CLR			INTCON
;-----------��Ĵ���10~7FH--------------------------
		CLRB		STATUS,IRP
CLR_RAM��
		LDIA		1FH					;��20H��ʼ
		LD  		FSR,A
CLR_RAM_LOOP:
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
INIT_LOOP:						;�ϵ���ʱ3*256*256/2=100MS
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
;************************************************
;-----------------------------------------------
INIT_RAM:
		LDIA		.250			;8M��125US
		LD  		PR2,A			;TMR2���ó�250US
		LDIA		B'00000100'
		LD  		T2CON,A
		LDIA		02H
		LD			PIE1,A
		LDIA		0C0H
		LD  		INTCON,A		;��ʱ2�ж�ʹ��

;********************************************
;********************************************
;********************************************
MAIN:
        CALL        SYS_SET_1
		LDIA		.32					;125us*32=4msһ����ѭ��
		SUBA		TCOUNT
		SNZB		STATUS,C
		JP  		MAIN
;********************************************
		CLR 		TCOUNT
		CLRWDT
;********************************************
;********************************************
MAIN_SUB:
		CALL		SET_SYS		
		CALL  		KSCAN           ;����ɨ�����	
		CALL        MAINK	
		JP  		MAIN
;********************************************
;********************************************
SET_SYS:		
 	    LDIA		B'00000000'
		LD  		TRISA,A
		LDIA		B'00000000'	
		CLRA
		LD  		TRISB,A
		LDIA		B'00000000'		
		LD  		TRISC,A			
;		LDIA		B'00001000'		
;		LD  		TRISE,A
;		CLRB		PORTE,0
		LDIA		B'00000000'
		LD			ADRESL,A
		
        CLR         T1CON
        CLR         CCP1CON
        CLR         CCP2CON
        CLR         WPUB
;        CLR         IOCB
;        CLR         VRCON                      
SYS_SET_1:		
		LDIA		.250
		LD  		PR2,A
		LDIA		02H
		LD			PIE1,A
		LDIA		0C0H
		LD  		INTCON,A		;��ʱ2�ж�ʹ��
		LDIA		04H
		SUBA		T2CON			;T2CONΪ04ʱ��д
		SZB 		STATUS,Z
		JP  		SYS_BACK
		LDIA		00H				;д������Ӱ���ʱ����T2CONû���ҵ�ʱ��д
		LD  		T2CON,A
		SETB		T2CON,2	
SYS_BACK:
		RET
;*****************************************

;*****************************************

;*****************************************
MAINK:
		LD			A,KEYF
		SZB			STATUS,Z
		JP			MAINK_NO			;û�а���
		XORA		KEYF_OLD
		SZB			STATUS,Z
		JP			MAINK_BACK			;��ͬ�������ڴ���
		
		LD			A,KEYF
		LD			KEYF_OLD,A
		
		SZB			KEYF,0
		JP			MAINK_KEY1
		SZB			KEYF,1
		JP			MAINK_KEY2
		SZB			KEYF,2
		JP			MAINK_KEY3
		JP			MAINK_BACK
MAINK_KEY1:
		;������밴��1�Ĵ������
		JP			MAINK_BACK
MAINK_KEY2:
		;������밴��2�Ĵ������
		JP			MAINK_BACK
MAINK_KEY3:
		;������밴��3�Ĵ������
		JP			MAINK_BACK
MAINK_NO:
		CLR			KEYF_OLD
MAINK_BACK:
        RET
;********************************************
KSCAN��
        #INCLUDE	"Touch_Kscan_Library.lib"
;********************************************
		END

