#ifndef _SC_CHIP_SELECT_H_
#define _SC_CHIP_SELECT_H_

#define _HEADER_NOT_FOUND


#if defined(_SC8F2910) || defined(_SC8F2912) || defined(_SC8F2913) || defined(_SC8F2913S) ||\
    defined(_SC8F3010) || defined(_SC8F3012) || defined(_SC8F3013) || defined(_SC8F3013S)
    #include    <sc8f291x.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8P1710) || defined(_SC8P1711) || defined(_SC8P8022) || defined(_SC8P8023) 
    #include    <SC8P1713.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8P1710C) || defined(_SC8P1711C) || defined(_SC8P1712C) || defined(_SC8P1713S)
    #include    <SC8P1713C.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8P1813S)
    #include    <SC8P1813S.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8P1153) || defined(_SC8P1152) || defined(_SC8P1153A) || defined(_SC8P1152A) || defined(_SC8P1151A)
    #include    <SC8P1153.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8F2752) || defined(_SC8F2750) || defined(_SC8F2751) 
    #include    <SC8F2752.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8F2852) || defined(_SC8F2850) 
    #include    <SC8F2852.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8P1710D) || defined(_SC8P1711D) || defined(_SC8P1712D) 
    #include    <SC8P1712D.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8P1762E) 
    #include    <SC8P1762E.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8P8022D)
    #include    <SC8P8022D.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8F2790) || defined(_SC8F2792) 
    #include    <SC8F2792.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8F2892)
    #include    <SC8F2892.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8F3752) || defined(_SC8F3751) || defined(_SC8F3792) 
    #include    <SC8F3752.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8F3892) 
    #include    <SC8F3892.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8P1715)
    #include    <SC8P1715.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8F8122) || defined(_SC8F8121) 
    #include    <SC8F8122.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8F5773) || defined(_SC8F5776) 
    #include    <SC8F5776.h>
    #undef _HEADER_NOT_FOUND
#endif


#if defined(_EC8F27M10) 
    #include    <EC8F27M10.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_EC75M10) 
    #include    <EC75M10.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_EC79Q20) || defined(_EC79Q24) 
    #include    <EC79Q24.h>
    #undef _HEADER_NOT_FOUND
#endif

#if defined(_SC8F3715) || defined(_SC8F3710)
    #include    <sc8f3715.h>
    #undef _HEADER_NOT_FOUND
#endif

#ifdef _HEADER_NOT_FOUND
#error Device-specific header could not be found for target chip
#endif

#endif // _PIC_CHIP_SELECT_H_
