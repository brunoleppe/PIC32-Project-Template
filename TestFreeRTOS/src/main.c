#include <stdlib.h>
#include <string.h>

#include "initialization.h"
#include "FreeRTOS.h"
#include "task.h"


void blink(void *params);

int main(void){
    
    /*Initialize processor*/
    Initialize();
    /*Create a FreeRTOS Task*/
    xTaskCreate(blink,"blink_task",256,NULL,1,NULL);
    
    while(1){
        /*Start FreeRTOS scheduler*/
        vTaskStartScheduler();
    }
    
    return EXIT_SUCCESS;
}

void blink(void *params)
{
    while(1){
        /*Toggle pin B6 every ~500ms*/
        LATBINV = 1 << 6;
        vTaskDelay(500);
    }
}