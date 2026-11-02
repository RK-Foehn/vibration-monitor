/* Real MMIO probe. Requires matching PL bitstream and initialized PS/DDR.
 * Do NOT run with the earlier PS-only hardware configuration. */
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xil_cache.h"
#include "xil_mmu.h"
#include "sleep.h"
#include "hardware_address.h"
#include "vibration_regs.h"

/* Only this owned, cache-line-aligned allocation is written by DDR smoke test.
 * This is NOT a full DDR qualification or a test of memory before C startup. */
static volatile uint32_t ddr_scratch[256] __attribute__((aligned(64)));

static uint32_t read32(void *context, uintptr_t address)
{
    uint32_t value;
    (void)context;
    __asm__ volatile("dsb sy" ::: "memory");
    value = Xil_In32((UINTPTR)address);
    __asm__ volatile("dsb sy" ::: "memory");
    return value;
}

static int ddr_smoke_test(void)
{
    static const uint32_t patterns[] = {0U, 0xffffffffU, 0xaaaaaaaaU, 0x55555555U};
    unsigned int p, i;
    UINTPTR address = (UINTPTR)ddr_scratch;
    if (address < 0x00100000U || address + sizeof(ddr_scratch) > 0x40000000U)
        return 0;
    xil_printf("# DDR_SMOKE_BEGIN address=0x%08x bytes=%u\r\n",
               (unsigned int)address, (unsigned int)sizeof(ddr_scratch));
    for (p = 0U; p < 4U; ++p) {
        for (i = 0U; i < 256U; ++i) ddr_scratch[i] = patterns[p] ^ i;
        Xil_DCacheFlushRange(address, sizeof(ddr_scratch));
        Xil_DCacheInvalidateRange(address, sizeof(ddr_scratch));
        for (i = 0U; i < 256U; ++i) {
            if (ddr_scratch[i] != (patterns[p] ^ i)) {
                xil_printf("# DDR_SMOKE_FAIL pattern=%u index=%u\r\n", p, i);
                return 0;
            }
        }
    }
    xil_printf("# DDR_SMOKE_PASS limited_1KiB_only\r\n");
    return 1;
}

int main(void)
{
    uint32_t id, version;
    init_platform();
    xil_printf("Hello Zynq\r\n");
    xil_printf("# AXI hardware probe; console=" VIB_CONSOLE "\r\n");
    xil_printf("# DDR candidate; no hardware validation claimed\r\n");
    if (!ddr_smoke_test()) return 1;
    /* 1MiB MMU section: device registers must never be cached/speculated. */
    Xil_SetTlbAttributes((UINTPTR)VIB_AXI_BASE, STRONG_ORDERED);
    xil_printf("# BEFORE_DEVICE_ID base=0x%08x\r\n", (unsigned int)VIB_AXI_BASE);
    /* A stalled AXI transaction can block here; retry limits do not time it out. */
    id = read32(NULL, VIB_AXI_BASE + VIB_REG_DEVICE_ID_OFFSET);
    xil_printf("DEVICE_ID=0x%08x expected=0x%08x\r\n",
               (unsigned int)id, (unsigned int)VIB_DEVICE_ID_VALUE);
    if (id != VIB_DEVICE_ID_VALUE) {
        xil_printf("# STOP: DEVICE_ID mismatch; no window reads\r\n");
        return 2;
    }
    xil_printf("# BEFORE_VERSION\r\n");
    version = read32(NULL, VIB_AXI_BASE + VIB_REG_VERSION_OFFSET);
    xil_printf("VERSION=0x%08x expected=0x%08x\r\n",
               (unsigned int)version, (unsigned int)VIB_VERSION_VALUE);
    if (version != VIB_VERSION_VALUE) {
        xil_printf("# STOP: VERSION mismatch; no window reads\r\n");
        return 3;
    }
    xil_printf("# PROBE_ID_VERSION_PASS; source=PL; axis=X; unit=raw_count\r\n");
    for (;;) {
        vibration_snapshot_t snapshot;
        vibration_snapshot_status_t rc = vibration_read_snapshot(
            read32, NULL, VIB_AXI_BASE, 8U, &snapshot);
        uint32_t status = read32(NULL, VIB_AXI_BASE + VIB_REG_STATUS_OFFSET);
        uint32_t drops = read32(NULL, VIB_AXI_BASE + VIB_REG_DROP_COUNT_OFFSET);
        if (rc == VIB_SNAPSHOT_OK) {
            xil_printf("seq=%u peak=%u sumsq=0x%08x%08x count=%u status_live=0x%08x drop_count_live=%u\r\n",
                (unsigned int)snapshot.sequence, (unsigned int)snapshot.peak,
                (unsigned int)(snapshot.sum_squares >> 32), (unsigned int)snapshot.sum_squares,
                (unsigned int)snapshot.sample_count, (unsigned int)status, (unsigned int)drops);
            if (snapshot.sample_count != 16U || snapshot.peak > 32768U ||
                snapshot.sum_squares > (UINT64_C(1) << 34))
                xil_printf("# WARNING: unexpected current-v1 window range\r\n");
        } else {
            xil_printf("snapshot_rc=%u status_live=0x%08x drop_count_live=%u\r\n",
                       (unsigned int)rc, (unsigned int)status, (unsigned int)drops);
        }
        usleep(500000U);
    }
}
