#include <xc.h>
#include "initialization.h"
#include "delay.h"


int main(void)
{
    /*Initialize processor and pin B6*/
    Initialize();

    while(1){
        /*toggle pin b6 every ~500ms*/
        LATBINV = 1<<6;
        _delay_ms(500);
    }
}