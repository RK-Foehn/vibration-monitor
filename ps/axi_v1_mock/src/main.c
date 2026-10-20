#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"
#include "mock_window.h"

int main(void)
{
    mock_window_t mock;
    uint32_t previous = 0U;
    int have_previous = 0;
    int test;
    init_platform();
    xil_printf("Hello Zynq\r\n");
    xil_printf("# source=SIMULATED; axis=X; unit=raw_count; no_MMIO\r\n");
    test = mock_window_selftest();
    if (test != 0) {
        xil_printf("# selftest=FAIL; case=%d\r\n", test);
        cleanup_platform();
        return 1;
    }
    xil_printf("# selftest=PASS\r\n");
    mock_window_init(&mock);
    xil_printf("seq,peak_raw,sumsq_hi_hex,sumsq_lo_hex,n,skipped,status_live_hex,drops_live\r\n");
    for (;;) {
        vibration_snapshot_t snapshot;
        vibration_snapshot_status_t rc;
        mock_window_publish(&mock);
        rc = vibration_read_snapshot(mock_window_read32, &mock, 0U, 8U, &snapshot);
        if (rc == VIB_SNAPSHOT_OK) {
            uint32_t delta = have_previous
                ? vibration_sequence_delta(snapshot.sequence, previous) : 1U;
            if (!have_previous || delta != 0U) {
                /* Hex halves avoid unsupported 64-bit/float xil_printf formats.
                 * sum_squares = (hex_hi << 32) | hex_lo.
                 * Diagnostics below are live, NOT atomic window fields. */
                xil_printf("%u,%u,%08x,%08x,%u,%u,%08x,%u\r\n",
                    (unsigned int)snapshot.sequence, (unsigned int)snapshot.peak,
                    (unsigned int)(snapshot.sum_squares >> 32),
                    (unsigned int)snapshot.sum_squares,
                    (unsigned int)snapshot.sample_count,
                    (unsigned int)(delta > 1U ? delta - 1U : 0U),
                    (unsigned int)mock_window_read32(&mock, VIB_REG_STATUS_OFFSET),
                    (unsigned int)mock_window_read32(&mock, VIB_REG_DROP_COUNT_OFFSET));
                previous = snapshot.sequence;
                have_previous = 1;
            }
        } else {
            xil_printf("# snapshot_read_status=%u\r\n", (unsigned int)rc);
        }
        usleep(500000U); /* Demo pacing, not a sensor sampling clock. */
    }
}
