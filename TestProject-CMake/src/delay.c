#include <xc.h>
#include "delay.h"
#include "initialization.h"

static uint32_t _msec = (CPU_CLOCK_FREQUENCY/2)/MILI_SECONDS;

void _delay_ms(uint32_t msec){
    uint32_t t_wait = _msec * msec;
    uint32_t t_start = _CP0_GET_COUNT();
    t_start=_CP0_GET_COUNT();
    while((_CP0_GET_COUNT()-t_start)<t_wait);
}