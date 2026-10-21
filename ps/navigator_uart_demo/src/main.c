/* ALIENTEK Navigator XC7Z020CLG400-2, Vitis 2023.2 standalone.
 * Integrate into the generated Hello World template; retain platform.c/.h.
 * XSA must configure PS UART0 on MIO14 (RX) / MIO15 (TX).
 * BSP stdout and its baud setting must match UART0 and the PC terminal.
 * No PL, AXI, DMA or sensor is accessed by this program.
 */
#include "platform.h"
#include "xil_printf.h"
#include "xil_types.h"
#include "sleep.h"

/* Set to 0 for Hello-only acceptance; 1 adds synthetic XYZ streaming. */
#ifndef DEMO_ENABLE_XYZ
#define DEMO_ENABLE_XYZ 1
#endif

#if DEMO_ENABLE_XYZ
#define SAMPLE_COUNT 16U
#define DELAY_US 100000U
static const int waveform[SAMPLE_COUNT] = {
    0, 38, 71, 92, 100, 92, 71, 38,
    0, -38, -71, -92, -100, -92, -71, -38
};
#endif

int main(void)
{
#if DEMO_ENABLE_XYZ
    u32 sequence = 0U;
    unsigned int index = 0U;
#endif

    init_platform();
    xil_printf("Hello Zynq\r\n");

#if DEMO_ENABLE_XYZ
    xil_printf("# source=SIMULATED; unit=mg; delay_us=%u\r\n",
               (unsigned int)DELAY_US);
    xil_printf("seq,x_mg,y_mg,z_mg\r\n");
    for (;;) {
        int x_mg = waveform[index];
        int y_mg = waveform[(index + 4U) % SAMPLE_COUNT] / 2;
        int z_mg = 1000 + waveform[(index + 8U) % SAMPLE_COUNT] / 4;
        xil_printf("%u,%d,%d,%d\r\n",
                   (unsigned int)sequence, x_mg, y_mg, z_mg);
        sequence++;
        index = (index + 1U) % SAMPLE_COUNT;
        /* Printing adds overhead; this is not a precision 10 Hz sampler. */
        usleep(DELAY_US);
    }
#else
    for (;;) {
        usleep(1000000U);
    }
#endif
}
