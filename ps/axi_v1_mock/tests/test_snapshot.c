#include "mock_window.h"

typedef struct {
    mock_window_t mock;
    unsigned int reads;
    unsigned int mutations;
    int mode;
} fixture_t;

static uint32_t injected_read(void *context, uintptr_t offset)
{
    fixture_t *f = (fixture_t *)context;
    f->reads++;
    if (offset == VIB_REG_SUMSQ_HI_OFFSET &&
        (f->mode == 2 || (f->mode == 1 && f->mutations == 0U))) {
        f->mutations++;
        f->mock.snapshot.sequence++;
        f->mock.snapshot.peak = 32768U;
        f->mock.snapshot.sum_squares = UINT64_C(1) << 34;
        f->mock.snapshot.sample_count = 16U;
    }
    if (offset == VIB_REG_SAMPLE_COUNT_OFFSET && f->mode == 3)
        f->mock.status &= ~VIB_STATUS_RESULT_AVAILABLE_MASK;
    return mock_window_read32(&f->mock, offset);
}

/* Each case is called independently by the ARM emulator. */
int run_case(unsigned int id)
{
    fixture_t f;
    vibration_snapshot_t out = {77U, 88U, 99U, 11U};
    vibration_snapshot_status_t rc;
    mock_window_init(&f.mock);
    f.reads = 0U;
    f.mutations = 0U;
    f.mode = 0;
    switch (id) {
    case 0:
        return mock_window_selftest();
    case 1:
        rc = vibration_read_snapshot(injected_read, &f, 0U, 2U, &out);
        return !(rc == VIB_SNAPSHOT_NOT_AVAILABLE && out.sequence == 77U &&
                 out.peak == 88U && out.sum_squares == 99U && out.sample_count == 11U);
    case 2:
        return vibration_read_snapshot(0, &f, 0U, 1U, &out) != VIB_SNAPSHOT_BAD_ARGUMENT;
    case 3:
        return vibration_read_snapshot(injected_read, &f, 0U, 1U, 0) != VIB_SNAPSHOT_BAD_ARGUMENT;
    case 4:
        rc = vibration_read_snapshot(injected_read, &f, 0U, 0U, &out);
        return !(rc == VIB_SNAPSHOT_BAD_ARGUMENT && f.reads == 0U);
    case 5:
        mock_window_publish(&f.mock);
        f.mode = 1;
        rc = vibration_read_snapshot(injected_read, &f, 0U, 2U, &out);
        return !(rc == VIB_SNAPSHOT_OK && f.reads == 16U &&
                 out.sequence == 2U && out.peak == 32768U &&
                 out.sum_squares == (UINT64_C(1) << 34) && out.sample_count == 16U);
    case 6:
        mock_window_publish(&f.mock);
        f.mode = 2;
        rc = vibration_read_snapshot(injected_read, &f, 0U, 3U, &out);
        return !(rc == VIB_SNAPSHOT_RETRY_EXHAUSTED && f.reads == 24U &&
                 out.sequence == 77U && out.peak == 88U &&
                 out.sum_squares == 99U && out.sample_count == 11U);
    case 7:
        mock_window_publish(&f.mock);
        f.mode = 3;
        rc = vibration_read_snapshot(injected_read, &f, 0U, 1U, &out);
        return !(rc == VIB_SNAPSHOT_RETRY_EXHAUSTED && out.sequence == 77U);
    case 8:
        f.mock.snapshot.sequence = UINT32_MAX;
        mock_window_publish(&f.mock);
        rc = vibration_read_snapshot(injected_read, &f, 0U, 2U, &out);
        return !(rc == VIB_SNAPSHOT_OK && out.sequence == 0U &&
                 vibration_sequence_delta(out.sequence, UINT32_MAX) == 1U);
    case 9:
        return !(vibration_sequence_delta(5U, 2U) == 3U &&
                 vibration_sequence_delta(5U, 5U) == 0U);
    case 10:
        return vibration_sumsq_combine(UINT32_MAX, 7U) != UINT64_C(0x7ffffffff);
    case 11:
        mock_window_publish(&f.mock);
        f.mock.status |= VIB_STATUS_FIFO_OVERFLOW_MASK | VIB_STATUS_SENSOR_OVERRUN_MASK;
        f.mock.drops = UINT32_MAX;
        rc = vibration_read_snapshot(injected_read, &f, 0U, 2U, &out);
        return !(rc == VIB_SNAPSHOT_OK && out.sequence == 1U &&
                 mock_window_read32(&f.mock, VIB_REG_DROP_COUNT_OFFSET) == UINT32_MAX &&
                 mock_window_read32(&f.mock, VIB_REG_STATUS_OFFSET) == 29U);
    default: return 100;
    }
}
