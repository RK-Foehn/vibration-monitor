#ifndef VIBRATION_REGS_H
#define VIBRATION_REGS_H

/* AXI4-Lite register contract v1, implemented by vibration_axi_lite_slave.sv.
 * The base address must come from the Vivado Address Editor/Vitis platform;
 * this header deliberately does not define one.
 */

#include <stddef.h>
#include <stdint.h>

#define VIB_REG_DEVICE_ID_OFFSET       UINT32_C(0x00)
#define VIB_REG_VERSION_OFFSET         UINT32_C(0x04)
#define VIB_REG_CONTROL_OFFSET         UINT32_C(0x08)
#define VIB_REG_RESULT_SEQ_OFFSET      UINT32_C(0x0C)
#define VIB_REG_PEAK_OFFSET            UINT32_C(0x10)
#define VIB_REG_SUMSQ_LO_OFFSET        UINT32_C(0x14)
#define VIB_REG_SUMSQ_HI_OFFSET        UINT32_C(0x18)
#define VIB_REG_SAMPLE_COUNT_OFFSET    UINT32_C(0x1C)
#define VIB_REG_STATUS_OFFSET          UINT32_C(0x20)
#define VIB_REG_DROP_COUNT_OFFSET      UINT32_C(0x24)

#define VIB_DEVICE_ID_VALUE           UINT32_C(0x56494231)
#define VIB_VERSION_VALUE             UINT32_C(0x00010000)

#define VIB_STATUS_INIT_DONE_MASK        (UINT32_C(1) << 0)
#define VIB_STATUS_INIT_ERROR_MASK       (UINT32_C(1) << 1)
#define VIB_STATUS_SENSOR_OVERRUN_MASK   (UINT32_C(1) << 2)
#define VIB_STATUS_FIFO_OVERFLOW_MASK    (UINT32_C(1) << 3)
#define VIB_STATUS_RESULT_AVAILABLE_MASK (UINT32_C(1) << 4)

static inline uint64_t vibration_sumsq_combine(uint32_t low, uint32_t high)
{
    return ((uint64_t)high << 32) | (uint64_t)low;
}

/* Adapter for a target-specific 32-bit MMIO read, for example Xil_In32().
 * address is the absolute byte address (base + register offset).
 */
typedef uint32_t (*vibration_read32_fn)(void *context, uintptr_t address);

typedef struct {
    uint32_t sequence;
    uint32_t peak;
    uint64_t sum_squares;
    uint32_t sample_count;
} vibration_snapshot_t;

typedef enum {
    VIB_SNAPSHOT_OK = 0,
    VIB_SNAPSHOT_NOT_AVAILABLE,
    VIB_SNAPSHOT_RETRY_EXHAUSTED,
    VIB_SNAPSHOT_BAD_ARGUMENT
} vibration_snapshot_status_t;

/* Read one coherent window snapshot. STATUS diagnostics and DROP_COUNT are
 * separate live registers, not members of this atomic snapshot.
 * Assumes fewer than 2^32 result updates and no reset between the two
 * sequence reads. max_attempts bounds retry time if PL updates rapidly.
 * On failure, *out is unchanged.
 */
static inline vibration_snapshot_status_t vibration_read_snapshot(
    vibration_read32_fn read32,
    void *context,
    uintptr_t base,
    unsigned int max_attempts,
    vibration_snapshot_t *out)
{
    unsigned int attempt;

    if (read32 == NULL || out == NULL || max_attempts == 0U) {
        return VIB_SNAPSHOT_BAD_ARGUMENT;
    }

    for (attempt = 0U; attempt < max_attempts; ++attempt) {
        vibration_snapshot_t candidate;
        uint32_t before = read32(context, base + VIB_REG_RESULT_SEQ_OFFSET);
        uint32_t status = read32(context, base + VIB_REG_STATUS_OFFSET);
        uint32_t low;
        uint32_t high;
        uint32_t after;

        if ((status & VIB_STATUS_RESULT_AVAILABLE_MASK) == 0U) {
            return VIB_SNAPSHOT_NOT_AVAILABLE;
        }

        candidate.peak = read32(context, base + VIB_REG_PEAK_OFFSET);
        low = read32(context, base + VIB_REG_SUMSQ_LO_OFFSET);
        high = read32(context, base + VIB_REG_SUMSQ_HI_OFFSET);
        candidate.sum_squares = vibration_sumsq_combine(low, high);
        candidate.sample_count = read32(context, base + VIB_REG_SAMPLE_COUNT_OFFSET);
        after = read32(context, base + VIB_REG_RESULT_SEQ_OFFSET);
        status = read32(context, base + VIB_REG_STATUS_OFFSET);

        if (before == after &&
            (status & VIB_STATUS_RESULT_AVAILABLE_MASK) != 0U) {
            candidate.sequence = after;
            *out = candidate;
            return VIB_SNAPSHOT_OK;
        }
    }

    return VIB_SNAPSHOT_RETRY_EXHAUSTED;
}

/* Modulo-2^32 distance between two accepted snapshots. A value >1 suggests
 * skipped results, except that a full 2^32 wraps cannot be detected here.
 */
static inline uint32_t vibration_sequence_delta(uint32_t current,
                                                uint32_t previous)
{
    return current - previous;
}

/* Vitis adapter example (place in the application .c file):
 *
 * #include "xil_io.h"
 * static uint32_t board_read32(void *context, uintptr_t address)
 * {
 *     (void)context;
 *     return Xil_In32((UINTPTR)address);
 * }
 *
 * vibration_snapshot_t snap;
 * vibration_snapshot_status_t rc = vibration_read_snapshot(
 *     board_read32, NULL, (uintptr_t)base_from_xparameters, 8U, &snap);
 */

#endif /* VIBRATION_REGS_H */
