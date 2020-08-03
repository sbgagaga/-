
;ע������
;�Ĵ�����KEYF��KEYF1��
;��־λ��B_KEY_EN��B_KEY_LONG��B_KEY_UP��B_KEY_SLP��B_KEY_WAKE	
;ΪBANK0�Ŀռ䣬ʹ��ʱ��Ҫע��ҳ���л�

;**********************************************
;**********************************************

GPR0		EQU 		0EH	        ;�ж��ֳ������Ĵ���������BANK1,BANK0���üĴ���
GPR1		EQU 		0FH         ;�ж��ֳ������Ĵ���������BANK1,BANK0���üĴ���
TCOUNT		EQU 		��	;ϵͳ��ʱ��125US��1
;--------------------------------------------
;����RAM
;**************************************

;;********************************************************
;*********************************************************
		ORG 		00H
   		JP  		START
		ORG 		01H
;--------------------------------------------
INT_IN:
		LD  		GPR0,A			;�ж��ֳ�����
		SWAPR		GPR0
		SWAPA		FLAGS
		LD  		GPR1,A
;--------------------------------------------
INT_TMR1:							;ֻ�õ�1���жϣ�TMR1�ж�ÿ125US��һ��
        BANKSEL_BANK0
		INCR		TCOUNT
		CLR 		INT_FLAG
;--------------------------------------------							
INT_BACK:
		SWAPA		GPR1
		LD  		FLAGS,A
		SWAPA		GPR0			;�жϷ���
		RETI
;********************************************

;********************************************
;********************************************
		
;********************************************
START:
		NOP
		CLRWDT								;�ϵ���WDT����Ҫ��
;-----------��ʼ��I/O------------------------;����IO�ڵĳ�ʼ״̬
		CLR 		P0
		SET			P1
		LDIA		03H
		LD			P2,A
		
		LDIA		B'11111111'
		LD  		P0CH,A			
		LDIA		B'11111111'		;P0,0-P0,7Ϊ������������
		LD  		P0CL,A	

		LDIA		B'01110010'		;P1,6 ���AD�������ȵ��ڣ�
		LD  		P1CH,A			;P1.5 �����ȵ��ݣ�������ͷŵ�
		LDIA  		B'10101010'		;P1,0 BCD���λ��������δ��
		LD  		P1CL,A

		LDIA		B'00010010'		;P2.0�������
		LD  		P2C,A			;P2.2 Ϊ��ˮ/������ѡ��
		
;-----------��Ĵ��� BANK0--------------------------
CLR_RAM:								;���Ѱַ�������RAM
		BANKSEL_BANK0
		LDIA		0FH
		LD  		MP,A
CLR_LOOP:
		INCR		MP
		CLR 		IAR
		LDIA		07FH
		SUBA		MP
		SNZB		FLAGS,C
		JP  		CLR_LOOP
;***************��Ĵ��� BANK1************************
CLR_RAM_1:
        BANKSEL_BANK1
		LDIA		02FH
		LD  		MP,A
CLR_LOOP_1:
		INCR		MP
		CLR 		IAR
		LDIA		07FH
		SUBA		MP
		SNZB		FLAGS,C
		JP  		CLR_LOOP_1
		
;-------------�ϵ���ʱ-----------------------
INIT_DELAY:
        BANKSEL_BANK0
		LDIA		.0
		LD  		TCOUNT,A
INIT_LOOP:								;�ϵ���ʱ3*256*256*5/2=500MS
		CLRWDT
		SZDECR	    TCOUNT
		JP  		INIT_LOOP
;---------------------------------------------
;-----------��ʼ��RAM-------------------------
INIT_RAM:
        BANKSEL_BANK0
        CLR         TCOUNT
 		CLR			PWM8DATA
		CLR			PWM10DATA
		CLR			TABLE_SPL	;
		CLR			BUZCON
		CLR			INT_EXT		;
		CLR			TABLE_SPH	;
		CLR         08H
		CLR         0EH
		CLR         0FH
		CLR         25H
		CLR         26H
		CLR         27H
		CLR         2AH
		CLR         2BH

		LDIA		.6
		LD  		TMR1,A				; TMR1��ֵ�趨
		LDIA		80H					; TMR1�趨Ϊ��ʱ������Ƶ��1��1
		LD  		TMR1C,A
		SETB		TMR1C,4				; TMR1����
		
		LDIA		03H
		LD  		SYS_GEN,A			;�ж�ʹ�ܣ�AD��ֹ
		LDIA		08H					;TMR1�ж�ʹ�ܣ������жϹر�
		LD  		INT_EN,A

;********************************************
;********************************************
;********************************************
MAIN:
        CALL        SET_SYS_1
        BANKSEL_BANK0
		LDIA		.20					;125us*10=1.25msһ����ѭ��
		SUBA		TCOUNT
		SNZB		FLAGS,C
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
        BANKSEL_BANK0
		LDIA		B'11111111'
		LD  		P0CH,A			
		LDIA		B'11111111'		;P0,0-P0,7Ϊ������������
		LD  		P0CL,A	
		LDIA		B'10010001'		;P1,6 ���AD�������ȵ��ڣ�
		LD  		P1CH,A			;P1.5 �����ȵ��ݣ�������ͷŵ�
		CLR			28H
		CLR			29H
SET_SYS_1:		
		LDIA		03H
		LD  		SYS_GEN,A		;�ж�ʹ�ܣ�AD��ֹ
		LDIA		08H					; TMR1�ж�ʹ�ܣ������жϹر�
		LD  		INT_EN,A
		LDIA		.6
		LD  		TMR1,A				; TMR1��ֵ�趨
		LDIA		90H
		SUBA		TMR1C				;TMR1��û���ҵ�����²�����д����������Ӱ�춨ʱ
		SZB 		FLAGS,Z
		JP  		SET_SYS_BACK
		LDIA		80H					; TMR1�趨Ϊ��ʱ������Ƶ��1��1
		LD  		TMR1C,A
		SETB		TMR1C,4				; TMR1����
SET_SYS_BACK:
		RET
;*****************************************
		;ORG			0100H
;*****************************************
;*****************************************

;*****************************************
MAINK:
		SNZB		 B_KEY_EN			;�а������봦��
		JP			 MAINK_BACK
		CLRB		 B_KEY_EN
		
		SZB			 B_KEY_LONG			;������
		JP			 MAINK_LONG
		
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
MAINK_LONG:
MAINK_BACK:
        RET
;********************************************
		;ORG			0500H
KSCAN��
        #INCLUDE	"Touch_Kscan_Library.lib"
;********************************************
		END
