#include "initialization.h"
#include "FreeRTOS.h"
#include "task.h"

typedef struct{
    int pin_number;
    int delay_ms;
}PinParams;

void blink(void *params);

int main(void){

    /*Initialize processor*/
    Initialize();
    /*Create a FreeRTOS Task*/
    xTaskCreate(blink,"blink_task",256,&(PinParams){.pin_number = 6, .delay_ms = 500},1,NULL);
    xTaskCreate(blink,"blink_task",256,&(PinParams){.pin_number = 7, .delay_ms = 400},1,NULL);
    xTaskCreate(blink,"blink_task",256,&(PinParams){.pin_number = 8, .delay_ms = 300},1,NULL);
    xTaskCreate(blink,"blink_task",256,&(PinParams){.pin_number = 9, .delay_ms = 600},1,NULL);

    while(1){
        /*Start FreeRTOS scheduler*/
        vTaskStartScheduler();
    }

    return EXIT_FAILURE;
}

void blink(void *params)
{
    PinParams *p = (PinParams*)params;
    while(1){
        /*Toggle pin B6 every ~500ms*/
        LATBINV = 1 << p->pin_number;
        vTaskDelay(p->delay_ms);
    }
}