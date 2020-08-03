#ifndef	_global variable_H_
#define	_global variable_H_
#include "TypeDef.h"
//***************************************************
//***************************************************
#define		PI_ZERO		RB5//RB6
#define		PO_BT1		RB2//RA2
#define		P_LED		RA5//RA1
#define		P_LED1		RE0	
#define		P_COM0		RC0//RC0
#define		P_COM1		RC1//RC1
#define		P_COM2		RC2//RC2
#define		P_COM3		RC3//RC3

#define    	P_SEG0   	RB6// RA5
#define    	P_SEG1   	RB7// RA4
#define    	P_SEG2  	RA1// RA3
#define    	P_SEG3   	RA2// RB1
#define    	P_SEG4   	RA3// RB2
#define    	P_SEG5   	RA4// RB3

#define		KEY_POWER 	RA3
#define		KEY_ADD     RA1
#define		KEY_SUB     RA2



/*��������*/

uchar Display[4];  //LCD���봢��


bit	Flag_onoff,    //���ػ���־
	Flag_temprok,  //�ﵽ�趨�¶ȵ��־
	Flag_first,    //��������1S��־
	Flag_hot,	   //���ȱ�־
	Flag_keyf,	   //�а�����־λ
	Flag_en,	   //�������±�־
	Flag_mainloop, //������ѭ����־
	Flag_step,     //��ѯ��ʵ�¶Ȳ����־
	Flag_err,      //�����־
	Flag_bit,      //��LCD�˿ڸ�ֵ�Ĺ��ɱ���
	Flag_ntc_onead,//AD�����ɱ�־
	Flag_rt_open,  //ntc��·��־
	Flag_rt_short, //Ntc��·��־  
	Flag_ach,      //������������־
	Flag_zero,	   //�����־
	Flag_HV,       //���ѹ��־
	Flag_vtemp,	   //���ѹ�벨���ȱ�־
	Flag_temprdir;  //���½��±�־
	
	
	
uchar 
	  
	  
	  Keyflash,	   //������ֵ
	  Keyc,        //��������    
	  Keyold,	   //������ֵ
	  Dcount,      //LCD��ʾ�м����
	  Adtimes,     //ad�����ر���
	  Ntcnormaldely, //NTC��������
	  Ntcshortdely,  //NTC��·����
	  Ntcopendely,   //NTC��·���� 
	  Kkg_dly,	     //�ɿع败����ʱ
	  Maintime;		 //5ms�Ķ�ʱ����
	  
	  
uint Tempr_setdata,  //�¶��趨ֵ
	 Keyc1,
	 count1,		//PID 1S����;
	 Admax,       //AD�����ز���
	 Admin,
	 Adsum,
	 Adresult,
	  Pid_count,
	  Tempr_tdata,//ʵ���¶�; 
	  Tempr_rank,  //��ĻҪ��ʾ��ֵ  
	 Tmper_temp;  //��ѯʵ���¶ȹ��ɱ���
	 
	 



typedef struct PID_Value
{
    uint liEkVal[3];          //��ֵ���棬�����ͷ����Ĳ�ֵ
    uchar uEkFlag[3];          //���ţ�1���Ӧ��Ϊ������0Ϊ��Ӧ��Ϊ����    
    uchar uKP_Coe;             //����ϵ��
    uchar uKI_Coe;             //���ֳ���
    uchar uKD_Coe;             //΢�ֳ���
    uint  iPriVal;             //��һʱ��ֵ
    uint  iSetVal;             //�趨ֵ
    uint  iCurVal;             //ʵ��ֵ
}PID_ValueStr;


PID_ValueStr	PID;





//LCD�������ʾ���afbgce_d
const unsigned char LCDCode[]=
{
	0x3F,	// 0
	0x06,	// 1
	0x5B,	// 2
	0x4F,	// 3
	0x66,	// 4
	0x6D,	// 5
	0x7D,	// 6
	0x07,	// 7
	0x7F,	// 8
	0x6F,	// 9
	0x77,	// A
	0x7C,	// B
	0x39,	// C
	0x5E,	// D
	0x79,	// E
	0x71	// F
};


/***************************************************
�¶ȶ���
***************************************************/
const unsigned int Temptab[]={
29 	,
30 	,
32 	,
34 	,
35 	,
37 	,
39 	,
41 	,
43 	,
45 	,
47 	,
49 	,
52 	,
54 	,
57 	,
59 	,
62 	,
65 	,
68 	,
71 	,
74 	,
77 	,
81 	,
84 	,
88 	,
91 	,
95 	,
99 	,
103 	,
107 	,
111 	,
115 	,
120 	,
124 	,
129 	,
133 	,
138 	,
143 	,
148 	,
154 	,
159 	,
164 	,
170 	,
176 	,
181 	,
187 	,
193 	,
200 	,
206 	,
212 	,
219 	,
225 	,
232 	,
239 	,
246 	,
253 	,
260 	,
267 	,
274 	,
282 	,
289 	,
296 	,
304 	,
312 	,
319 	,
327 	,
335 	,
343 	,
351 	,
359 	,
367 	,
375 	,
383 	,
391 	,
399 	,
408 	,
416 	,
424 	,
432 	,
440 	,
449 	,
457 	,
465 	,
473 	,
481 	,
490 	,
498 	,
506 	,
514 	,
522 	,
530 	,
538 	,
546 	,
553 	,
561 	,
569 	,
576 	,
584 	,
592 	,
599 	,
606 	,
614 	,
621 	,
628 	,
635 	,
642 	,
649 	,
656 	,
662 	,
669 	,
676 	,
682 	,
688 	,
695 	,
701 	,
707 	,
713 	,
719 	,
725 	,
731 	,
736 	,
742 	,
747 	,
753 	,
758 	,
763 	,
768 	,
773 	,
778 	,
783 	,
788 	,
792 	,
797 	,
802 	,
806 	,
810 	,
815 	,
819 	,
823 	,
827 	,
831 	,
835 	,
838 	,
842 	,
846 	,
849 	,
853 	,
856 	,
860 	,
863 	,
866 	,
869 	,
872 	,
875 	,
878 	,
881 	,
884 	,
887 	,
889 	,
892 	,
895 	,
897 	,
900 	,
902 	,
905 	,
907 	,
909 	,
912 	,
914 	,
916 	,
918 	,
920 	,
922 	,
924 	,
926 	,
928 	,
930 	,
932 	,
933 	,
935 	,
937 	,
938 	,
940 	,
942 	,
943 	,
945 	,
946 	,
948 	,
949 	,
950 	,
952 	,
953 	,
955 	,
956 	,
957 	,
958 	,
960 	,
961 	,
962 	,
963 	,
964 	,
965 	,
966 	,
967 	,
968 	,
969 	,
970 	,
971 	,
972 	,
973 	,
974 	,
975 	,
976 	,
977 	,
977 	,
978 	,
979 	,
980 	,
981 	,
981 	,
982 	,
983 	,
983 	,
984 	,
985 	,
985 	,
986 	,
987 	,
987 	,
988 	,
989 	,
989 	,
990 	,
990 	,
991 	,
991 	,
992 	


};



//void AD_Sample(unsigned char adch);
#endif