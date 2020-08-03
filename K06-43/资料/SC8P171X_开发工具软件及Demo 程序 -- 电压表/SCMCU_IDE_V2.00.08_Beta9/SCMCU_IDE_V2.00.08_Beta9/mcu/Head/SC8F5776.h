INDF        EQU      H'0000'
TMR0        EQU      H'0001'
PCL     EQU      H'0002'
STATUS      EQU      H'0003'
FSR     EQU      H'0004'
PORTA       EQU      H'0005'
PORTB       EQU      H'0006'
WPUA        EQU      H'0007'
WPUB        EQU      H'0008'
IOCB        EQU      H'0009'
PCLATH      EQU      H'000A'
INTCON      EQU      H'000B'
PIR1        EQU      H'000C'
PIE1        EQU      H'000D'
PWMD23H     EQU      H'000E'
PWM01DT     EQU      H'000F'
PWM23DT     EQU      H'0010'
TMR2        EQU      H'0011'
T2CON       EQU      H'0012'
PWMCON0     EQU      H'0013'
PWMCON1     EQU      H'0014'
PWMTL       EQU      H'0015'
PWMTH       EQU      H'0016'
PWMD0L      EQU      H'0017'
PWMD1L      EQU      H'0018'
PWMD2L      EQU      H'0019'
PWMD3L      EQU      H'001A'
PWMD4L      EQU      H'001B'
PWMD01H     EQU      H'001C'
PWMCON2     EQU      H'001D'
PWM4TL      EQU      H'001E'
OPTION_REG      EQU      H'0081'
TRISA       EQU      H'0085'
TRISB       EQU      H'0086'
WPDB        EQU      H'0087'
OSCCON      EQU      H'0088'
EECON1      EQU      H'008C'
EECON2      EQU      H'008D'
EEDAT       EQU      H'008E'
EEDATH      EQU      H'008F'
EEADR       EQU      H'0090'
PR2     EQU      H'0091'
PORTC       EQU      H'0092'
TRISC       EQU      H'0093'
IOCC        EQU      H'0094'
IOCA        EQU      H'0095'
EEADRH      EQU      H'0096'
WPDA        EQU      H'0097'
WPDC        EQU      H'0098'
WPUC        EQU      H'0099'
PGACON      EQU      H'009A'
ECIGCON     EQU      H'009B'
ADCON1      EQU      H'009C'
ADCON0      EQU      H'009D'
ADRESH      EQU      H'009E'
ADRESL      EQU      H'009F'
PIR2        EQU      H'0107'
PIE2        EQU      H'0108'
IICADD      EQU      H'0109'
IICCON      EQU      H'010C'
IICCON2     EQU      H'010D'
IICBUF      EQU      H'010E'
IICSTAT     EQU      H'010F'
ANSEL0      EQU      H'0110'
ANSEL1      EQU      H'0111'
ANSEL2      EQU      H'0112'
TXSTA       EQU      H'0117'
RCSTA       EQU      H'0118'
SPBRG       EQU      H'0119'
TXREG       EQU      H'011A'
RCREG       EQU      H'011B'
SPIBUF      EQU      H'011C'
SPICON      EQU      H'011D'
SPICON2     EQU      H'011E'
LVDCON      EQU      H'011F'

KEYCON0     EQU      H'018C'
KEYCON1     EQU      H'018D'
KEYCON2     EQU      H'018E'
     
KEYDATL     EQU      H'0190'
KEYDATH     EQU      H'0191'        
        
        
        
;------------------------STATUS  Bits-------------------------------        
IRP    EQU      H'0007'
RP1    EQU      H'0006'
RP0    EQU      H'0005'
TO     EQU      H'0004'
PD     EQU      H'0003'
Z      EQU      H'0002'
DC     EQU      H'0001'
C      EQU      H'0000'
        
        
;------------------------PORTA  Bits-------------------------------     
RA7    EQU      H'0007'
RA6    EQU      H'0006'
RA5    EQU      H'0005'
RA4    EQU      H'0004'
RA3    EQU      H'0003'
RA2    EQU      H'0002'
RA1    EQU      H'0001'
RA0    EQU      H'0000'
        
        
;------------------------PORTB  Bits-------------------------------     
RB7    EQU      H'0007'
RB6    EQU      H'0006'
RB5    EQU      H'0005'
RB4    EQU      H'0004'
RB3    EQU      H'0003'
RB2    EQU      H'0002'
RB1    EQU      H'0001'
RB0    EQU      H'0000'
        
        
;------------------------WPUA  Bits-------------------------------      
WPUA7      EQU      H'0007'
WPUA6      EQU      H'0006'
WPUA5      EQU      H'0005'
WPUA4      EQU      H'0004'
WPUA3      EQU      H'0003'
WPUA2      EQU      H'0002'
WPUA1      EQU      H'0001'
WPUA0      EQU      H'0000'
        
        
;------------------------WPUB  Bits-------------------------------      
WPUB7      EQU      H'0007'
WPUB6      EQU      H'0006'
WPUB5      EQU      H'0005'
WPUB4      EQU      H'0004'
WPUB3      EQU      H'0003'
WPUB2      EQU      H'0002'
WPUB1      EQU      H'0001'
WPUB0      EQU      H'0000'
        
        
;------------------------IOCB  Bits-------------------------------      
IOCB7      EQU      H'0007'
IOCB6      EQU      H'0006'
IOCB5      EQU      H'0005'
IOCB4      EQU      H'0004'
IOCB3      EQU      H'0003'
IOCB2      EQU      H'0002'
IOCB1      EQU      H'0001'
IOCB0      EQU      H'0000'
        
        
;------------------------INTCON  Bits-------------------------------        
GIE    EQU      H'0007'
PEIE       EQU      H'0006'
T0IE       EQU      H'0005'
INTE       EQU      H'0004'
RBIE       EQU      H'0003'
T0IF       EQU      H'0002'
INTF       EQU      H'0001'
RBIF       EQU      H'0000'
        
        
;------------------------PIR1  Bits-------------------------------      
EEIF       EQU      H'0006'
RCIF       EQU      H'0005'
TXIF       EQU      H'0004'
SPIIF      EQU      H'0003'
PWMIF      EQU      H'0002'
TMR2IF     EQU      H'0001'
ADIF       EQU      H'0000'
        
        
;------------------------PIE1  Bits-------------------------------      
EEIE       EQU      H'0006'
RCIE       EQU      H'0005'
TXIE       EQU      H'0004'
SPIIE      EQU      H'0003'
PWMIE      EQU      H'0002'
TMR2IE     EQU      H'0001'
ADIE       EQU      H'0000'
        
        
;------------------------PWMD23H  Bits-------------------------------       
PWMD39     EQU      H'0005'
PWMD38     EQU      H'0004'
PWMD29     EQU      H'0001'
PWMD28     EQU      H'0000'
        
        
;------------------------T2CON  Bits-------------------------------     
CLK_SEL    EQU      H'0007'
TOUTPS3    EQU      H'0006'
TOUTPS2    EQU      H'0005'
TOUTPS1    EQU      H'0004'
TOUTPS0    EQU      H'0003'
TMR2ON     EQU      H'0002'
T2CKPS1    EQU      H'0001'
T2CKPS0    EQU      H'0000'
        
        
;------------------------PWMCON0  Bits-------------------------------       
CLKDIV2    EQU      H'0007'
CLKDIV1    EQU      H'0006'
CLKDIV0    EQU      H'0005'
PWM4EN     EQU      H'0004'
PWM3EN     EQU      H'0003'
PWM2EN     EQU      H'0002'
PWM1EN     EQU      H'0001'
PWM0EN     EQU      H'0000'
        
        
;------------------------PWMCON1  Bits-------------------------------       
PWMIO_SEL1     EQU      H'0007'
PWMIO_SEL0     EQU      H'0006'
PWM2DTEN       EQU      H'0005'
PWM0DTEN       EQU      H'0004'
DT_DIV1    EQU      H'0001'
DT_DIV0    EQU      H'0000'
        
        
;------------------------PWMTH  Bits-------------------------------     
PWMD49     EQU      H'0005'
PWMD48     EQU      H'0004'
PWM4T9     EQU      H'0003'
PWM4T8     EQU      H'0002'
PWMT9      EQU      H'0001'
PWMT8      EQU      H'0000'
        
        
;------------------------PWMD01H  Bits-------------------------------       
PWMD19     EQU      H'0005'
PWMD18     EQU      H'0004'
PWMD09     EQU      H'0001'
PWMD08     EQU      H'0000'
        
        
;------------------------PWMCON2  Bits-------------------------------       
PWM4DIR    EQU      H'0004'
PWM3DIR    EQU      H'0003'
PWM2DIR    EQU      H'0002'
PWM1DIR    EQU      H'0001'
PWM0DIR    EQU      H'0000'
        
        
;------------------------OPTION_REG  Bits-------------------------------        
INTEDG     EQU      H'0006'
T0CS       EQU      H'0005'
T0SE       EQU      H'0004'
PSA    EQU      H'0003'
PS2    EQU      H'0002'
PS1    EQU      H'0001'
PS0    EQU      H'0000'
        
        
;------------------------TRISA  Bits-------------------------------     
TRISA7     EQU      H'0007'
TRISA6     EQU      H'0006'
TRISA5     EQU      H'0005'
TRISA4     EQU      H'0004'
TRISA3     EQU      H'0003'
TRISA2     EQU      H'0002'
TRISA1     EQU      H'0001'
TRISA0     EQU      H'0000'
        
        
;------------------------TRISB  Bits-------------------------------     
TRISB7     EQU      H'0007'
TRISB6     EQU      H'0006'
TRISB5     EQU      H'0005'
TRISB4     EQU      H'0004'
TRISB3     EQU      H'0003'
TRISB2     EQU      H'0002'
TRISB1     EQU      H'0001'
TRISB0     EQU      H'0000'
        
        
;------------------------WPDB  Bits-------------------------------      
WPDB7      EQU      H'0007'
WPDB6      EQU      H'0006'
WPDB5      EQU      H'0005'
WPDB4      EQU      H'0004'
WPDB3      EQU      H'0003'
WPDB2      EQU      H'0002'
WPDB1      EQU      H'0001'
WPDB0      EQU      H'0000'
        
        
;------------------------OSCCON  Bits-------------------------------        
IRCF2      EQU      H'0006'
IRCF1      EQU      H'0005'
IRCF0      EQU      H'0004'
SWDTEN     EQU      H'0001'
        
        
;------------------------EECON1  Bits-------------------------------        
EEPGD      EQU      H'0007'
EETIME     EQU      H'0004'
WRERR      EQU      H'0003'
WREN       EQU      H'0002'
WR     EQU      H'0001'
RD     EQU      H'0000'
        
        
;------------------------EEDAT  Bits-------------------------------     
EEDAT7     EQU      H'0007'
EEDAT6     EQU      H'0006'
EEDAT5     EQU      H'0005'
EEDAT4     EQU      H'0004'
EEDAT3     EQU      H'0003'
EEDAT2     EQU      H'0002'
EEDAT1     EQU      H'0001'
EEDAT0     EQU      H'0000'
        
        
;------------------------EEDATH  Bits-------------------------------        
EEDATH7    EQU      H'0007'
EEDATH6    EQU      H'0006'
EEDATH5    EQU      H'0005'
EEDATH4    EQU      H'0004'
EEDATH3    EQU      H'0003'
EEDATH2    EQU      H'0002'
EEDATH1    EQU      H'0001'
EEDATH0    EQU      H'0000'
        
        
;------------------------EEADR  Bits-------------------------------     
EEADR7     EQU      H'0007'
EEADR6     EQU      H'0006'
EEADR5     EQU      H'0005'
EEADR4     EQU      H'0004'
EEADR3     EQU      H'0003'
EEADR2     EQU      H'0002'
EEADR1     EQU      H'0001'
EEADR0     EQU      H'0000'
        
        
;------------------------PORTC  Bits-------------------------------     
RC3    EQU      H'0003'
RC2    EQU      H'0002'
RC1    EQU      H'0001'
RC0    EQU      H'0000'
        
        
;------------------------TRISC  Bits-------------------------------     
TRISC3     EQU      H'0003'
TRISC2     EQU      H'0002'
TRISC1     EQU      H'0001'
TRISC0     EQU      H'0000'
        
        
;------------------------IOCC  Bits-------------------------------      
IOCC3      EQU      H'0003'
IOCC2      EQU      H'0002'
IOCC1      EQU      H'0001'
IOCC0      EQU      H'0000'
        
        
;------------------------IOCA  Bits-------------------------------      
IOCA7      EQU      H'0007'
IOCA6      EQU      H'0006'
IOCA5      EQU      H'0005'
IOCA4      EQU      H'0004'
IOCA3      EQU      H'0003'
IOCA2      EQU      H'0002'
IOCA1      EQU      H'0001'
IOCA0      EQU      H'0000'
        
        
;------------------------EEADRH  Bits-------------------------------        
EEADRH3    EQU      H'0003'
EEADRH2    EQU      H'0002'
EEADRH1    EQU      H'0001'
EEADRH0    EQU      H'0000'
        
        
;------------------------WPDA  Bits-------------------------------      
WPDA7      EQU      H'0007'
WPDA6      EQU      H'0006'
WPDA5      EQU      H'0005'
WPDA4      EQU      H'0004'
WPDA3      EQU      H'0003'
WPDA2      EQU      H'0002'
WPDA1      EQU      H'0001'
WPDA0      EQU      H'0000'
        
        
;------------------------WPDC  Bits-------------------------------      
WPDC3      EQU      H'0003'
WPDC2      EQU      H'0002'
WPDC1      EQU      H'0001'
WPDC0      EQU      H'0000'
        
        
;------------------------WPUC  Bits-------------------------------      
WPUC3      EQU      H'0003'
WPUC2      EQU      H'0002'
WPUC1      EQU      H'0001'
WPUC0      EQU      H'0000'
        
        
;------------------------PGACON  Bits-------------------------------        
PGAEN      EQU      H'0007'
PGACH      EQU      H'0006'
GAIN1      EQU      H'0001'
GAIN0      EQU      H'0000'
        
        
;------------------------ECIGCON  Bits-------------------------------       
ECIGEN     EQU      H'0007'
ECIGADJ5       EQU      H'0005'
ECIGADJ4       EQU      H'0004'
ECIGADJ3       EQU      H'0003'
ECIGADJ2       EQU      H'0002'
ECIGADJ1       EQU      H'0001'
ECIGADJ0       EQU      H'0000'
        
        
;------------------------ADCON1  Bits-------------------------------        
ADFM       EQU      H'0007'
CHS4       EQU      H'0006'
ADCS2      EQU      H'0005'
LDO_EN     EQU      H'0002'
LDO_SEL1       EQU      H'0001'
LDO_SEL0       EQU      H'0000'
        
        
;------------------------ADCON0  Bits-------------------------------        
ADCS1      EQU      H'0007'
ADCS0      EQU      H'0006'
CHS3       EQU      H'0005'
CHS2       EQU      H'0004'
CHS1       EQU      H'0003'
CHS0       EQU      H'0002'
GODONE     EQU      H'0001'
ADON       EQU      H'0000'
        
        
;------------------------PIR2  Bits-------------------------------      
TKIF       EQU      H'0006'
COMPIF     EQU      H'0005'
IICIF      EQU      H'0004'
BCLIF      EQU      H'0003'
RCCIF      EQU      H'0002'
RACIF      EQU      H'0001'
LVDIF      EQU      H'0000'
        
        
;------------------------PIE2  Bits-------------------------------      
TKIE       EQU      H'0006'
COMPIE     EQU      H'0005'
IICIE      EQU      H'0004'
BCLIE      EQU      H'0003'
RCCIE      EQU      H'0002'
RACIE      EQU      H'0001'
LVDIE      EQU      H'0000'
        
        
;------------------------IICCON  Bits-------------------------------        
IICWCOL    EQU      H'0007'
SSPOV      EQU      H'0006'
IICEN      EQU      H'0005'
IICCKP     EQU      H'0004'
IICM1      EQU      H'0001'
IICM0      EQU      H'0000'
        
        
;------------------------IICCON2  Bits-------------------------------       
GCEN       EQU      H'0007'
ACKSTAT    EQU      H'0006'
ACKDT      EQU      H'0005'
ACKEN      EQU      H'0004'
RCEN       EQU      H'0003'
PEN    EQU      H'0002'
RSEN       EQU      H'0001'
SEN    EQU      H'0000'
        
        
;------------------------IICSTAT  Bits-------------------------------       
IDLE       EQU      H'0006'
DA     EQU      H'0005'
P      EQU      H'0004'
S      EQU      H'0003'
RW     EQU      H'0002'
BF     EQU      H'0000'
        
        
;------------------------ANSEL0  Bits-------------------------------        
ANS7       EQU      H'0007'
ANS6       EQU      H'0006'
ANS5       EQU      H'0005'
ANS4       EQU      H'0004'
ANS3       EQU      H'0003'
ANS2       EQU      H'0002'
ANS1       EQU      H'0001'
ANS0       EQU      H'0000'
        
        
;------------------------ANSEL1  Bits-------------------------------        
ANS15      EQU      H'0007'
ANS14      EQU      H'0006'
ANS13      EQU      H'0005'
ANS12      EQU      H'0004'
ANS11      EQU      H'0003'
ANS10      EQU      H'0002'
ANS9       EQU      H'0001'
ANS8       EQU      H'0000'
        
        
;------------------------ANSEL2  Bits-------------------------------        
ANS18      EQU      H'0002'
ANS17      EQU      H'0001'
ANS16      EQU      H'0000'

      
;------------------------TXSTA  Bits-------------------------------     
CSRC       EQU      H'0007'
TX9EN      EQU      H'0006'
TXEN       EQU      H'0005'
SYNC       EQU      H'0004'
SCKP       EQU      H'0003'
STOPBIT    EQU      H'0002'
TRMT       EQU      H'0001'
TX9D       EQU      H'0000'
        
        
;------------------------RCSTA  Bits-------------------------------     
SPEN       EQU      H'0007'
RX9EN      EQU      H'0006'
SREN       EQU      H'0005'
CREN       EQU      H'0004'
RCIDL      EQU      H'0003'
FERR       EQU      H'0002'
OERR       EQU      H'0001'
RX9D       EQU      H'0000'
        
        
;------------------------SPICON  Bits-------------------------------        
SPIWCOL    EQU      H'0007'
SPIOV      EQU      H'0006'
SPIEN      EQU      H'0005'
SPICKP     EQU      H'0004'
SPIM3      EQU      H'0003'
SPIM2      EQU      H'0002'
SPIM1      EQU      H'0001'
SPIM0      EQU      H'0000'
        
        
;------------------------SPICON2  Bits-------------------------------       
SMP    EQU      H'0007'
CKE    EQU      H'0006'
MODE       EQU      H'0005'
SPIBF      EQU      H'0000'
        
        
;------------------------LVDCON  Bits-------------------------------        
LVD_RES    EQU      H'0007'
LVD_SEL2       EQU      H'0003'
LVD_SEL1       EQU      H'0002'
LVD_SEL0       EQU      H'0001'
LVDEN      EQU      H'0000'

;------------------------KEYCON0  Bits-------------------------------        
KDONE   EQU      H'0007'
CAPK2   EQU      H'0005'
CAPK1   EQU      H'0004'
CAPK0   EQU      H'0003'
KTOUT   EQU      H'0002'
KCAP    EQU      H'0001'
KEN     EQU      H'0000'

;------------------------KEYCON1  Bits-------------------------------        
KVREF1  EQU      H'0007'
KVREF0  EQU      H'0006'
KCLK1   EQU      H'0005'
KCLK0   EQU      H'0004'
KCHS3   EQU      H'0003'
KCHS2   EQU      H'0002'
KCHS1   EQU      H'0001'
KCHS0   EQU      H'0000'

;------------------------KEYCON2  Bits-------------------------------        
CAP_LVBO2  EQU      H'0007'
CAP_LVBO1  EQU      H'0006'
CAP_LVBO0  EQU      H'0005'
LDOEN      EQU      H'0003'
TKEN       EQU      H'0000'
