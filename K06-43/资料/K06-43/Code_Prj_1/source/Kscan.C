#include "source_h\common.h"

/**********************************************************************************                                   
* ����: ������ʼ����
* �ʼ�: 
***********************************************************************************/
void Btn_Init(void)
{
	
}

/**********************************************************************************                                   
* ����: �����⣬�������
* �ʼ�: 
***********************************************************************************/
void BtnScan(void)
{
	ReadKeyTmp=0;

	if(Flag_key_usb) ReadKeyTmp&=~(1<<0); else ReadKeyTmp|=(1<<0);
	if(Flag_key_set) ReadKeyTmp&=~(1<<1); else ReadKeyTmp|=(1<<1);
	//Flag_PIN_BANK=0;

	if(ReadKeyOld==ReadKeyTmp)//������
	{
	//	KeyTrg=ReadKeyTmp&(ReadKeyTmp^ReadKey);
		ReadKey=ReadKeyTmp;
		if((ReadKey&KEY_SET)!=KEY_SET) { Flag_Btn_Release=1; Flag_key_long=0;}//�����ͷ�״̬,��������־Ϊ0��
	}
	ReadKeyOld=ReadKeyTmp;
}



