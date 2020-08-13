#ifndef __ADC_H__
#define __ADC_H__

#include "K13-01.h"

uint8 ADSample(uint8);
void ADCPro();
void ADCRead(uint8,uint16 *);
void Sec1sPro();

#endif