#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

int main(void)
{
    init_platform();
    xil_printf("Hello Zynq\r\n");
    xil_printf("# PS-only; UART0; DDR candidate: board validation pending\r\n");
    for (;;) {
        usleep(1000000U);
    }
}
