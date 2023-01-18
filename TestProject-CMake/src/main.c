#include <xc.h>
#include "initialization.h"
#include "delay.h"

extern void asmFunction(int bits);
extern unsigned int asmVariable;
volatile unsigned int cVariable = 0;
volatile unsigned int jak = 0;

int main(void)
{
    /*Initialize processor and pin B6*/
    Initialize();

    asmFunction(0xA55Au);
    asmVariable++;

    while(1){
        /*toggle pin b6 every ~500ms*/
        LATBINV = 1<<6;
        _delay_ms(500);
    }
}

void foo (void)
{
    jak++;
}