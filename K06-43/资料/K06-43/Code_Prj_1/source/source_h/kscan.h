#ifndef _KSCAN_H_
#define _KSCAN_H_

#define KEY_USB  0x01
#define KEY_SET  0x02

bit Flag_Btn_Release;	// ���ذ���״̬��1Ϊ�ͷ�״̬��0Ϊ����״̬
bit Flag_key_long;		// ��������־
bit Flag_key_usb;
bit Flag_key_set;

extern void Btn_Init(void);

uchar	ReadKey,	//����ֵ��
//		KeyTrg,		//�ĸ���������
		ReadKeyTmp,
		ReadKeyOld;
extern void BtnScan(void);



#endif