#ifndef _MAIN_H_
#define _MAIN_H_

#include <sc.h>
#include "display.h"
#include "adc.h"
#include "mytype.h"

#define V_ADCH 1
#define F_ADCH 15
#define I_ADCH 8
uchar Dis_step,Adtimes_v,Adtimes_f,
	  Code1_bak,Code2_bak,Code3_bak,
	  Code1,Code2,Code3,Tcount,Flash_count,Adtimes_i,IV_count,
	  Code3_bakv,Code2_bakv,Code1_bakv,Code3_baki,Code2_baki,Code1_baki;


uint Admax_v,Admin_v,Adsum_v,Adresult_v,
	 Admax_f,Admin_f,Adsum_f,Adresult_f,
	 Ad_v,Ad_f,V_value,Dis_updata_count,
	 Ad_f_bak,Ad_v_bak,
	 I_value,Adresult_i,Adsum_i,Admin_i,Admax_i,conv_time;
ulong Ad_i,I_value_sum,V_value_sum;


bit  Flag_flash,Flag_update,Flag_shan,Flag_conv,Flag_mode,Ad_i_bak,Flag_adok;


#endif