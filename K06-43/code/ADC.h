#ifndef __ADC_H__
#define __ADC_H__

#include "K06-43.h"

typedef struct 
{
    uint16 *ADCmax;
    uint16 *ADCmin;
    uint16 *ADCSum;
    uint8 *ADCCnt;
}TYPE_STRUCT_AD;

uint8 ADSample(uint8);
void ADCPro();
void ADCRead(uint8 ,TYPE_STRUCT_AD ,uint16 *);

#endif