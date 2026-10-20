#include "mock_window.h"

void mock_window_init(mock_window_t *mock)
{
    mock->snapshot = (vibration_snapshot_t){0U, 0U, 0U, 0U};
    mock->status = VIB_STATUS_INIT_DONE_MASK;
    mock->drops = 0U;
}

void mock_window_publish(mock_window_t *mock)
{
    /* Synthetic raw X counts, deliberately not physical mg or AC RMS.
     * Contains INT16_MIN to exercise unsigned Peak. The self-test separately
     * checks a 35-bit SUMSQ boundary. */
    static const int16_t samples[16] = {
        -32768, 32767, -100, 100, -200, 200, -300, 300,
        -400, 400, -500, 500, -600, 600, -700, 700
    };
    uint32_t peak = 0U;
    uint64_t sum = 0U;
    unsigned int i;
    for (i = 0U; i < 16U; ++i) {
        int32_t x = samples[i];
        uint32_t magnitude = (uint32_t)(x < 0 ? -x : x);
        if (magnitude > peak) peak = magnitude;
        sum += (uint64_t)((int64_t)x * (int64_t)x);
    }
    mock->snapshot.peak = peak;
    mock->snapshot.sum_squares = sum;
    mock->snapshot.sample_count = 16U;
    mock->snapshot.sequence++;
    mock->status |= VIB_STATUS_RESULT_AVAILABLE_MASK;
}

uint32_t mock_window_read32(void *context, uintptr_t offset)
{
    const mock_window_t *mock = (const mock_window_t *)context;
    switch (offset) {
    case VIB_REG_DEVICE_ID_OFFSET: return VIB_DEVICE_ID_VALUE;
    case VIB_REG_VERSION_OFFSET: return VIB_VERSION_VALUE;
    case VIB_REG_CONTROL_OFFSET: return 0U;
    case VIB_REG_RESULT_SEQ_OFFSET: return mock->snapshot.sequence;
    case VIB_REG_PEAK_OFFSET: return mock->snapshot.peak;
    case VIB_REG_SUMSQ_LO_OFFSET: return (uint32_t)mock->snapshot.sum_squares;
    case VIB_REG_SUMSQ_HI_OFFSET: return (uint32_t)(mock->snapshot.sum_squares >> 32);
    case VIB_REG_SAMPLE_COUNT_OFFSET: return mock->snapshot.sample_count;
    case VIB_REG_STATUS_OFFSET: return mock->status;
    case VIB_REG_DROP_COUNT_OFFSET: return mock->drops;
    default: return 0U; /* RAM model only: does not emulate AXI responses. */
    }
}

static uint32_t changing_read(void *context, uintptr_t offset)
{
    mock_window_t *mock = (mock_window_t *)context;
    if (offset == VIB_REG_SUMSQ_HI_OFFSET) mock_window_publish(mock);
    return mock_window_read32(mock, offset);
}

int mock_window_selftest(void)
{
    mock_window_t mock;
    vibration_snapshot_t out = {123U, 456U, 789U, 10U};
    mock_window_init(&mock);
    if (vibration_read_snapshot(mock_window_read32, &mock, 0U, 3U, &out)
        != VIB_SNAPSHOT_NOT_AVAILABLE || out.sequence != 123U) return 1;
    mock_window_publish(&mock);
    if (vibration_read_snapshot(mock_window_read32, &mock, 0U, 3U, &out)
        != VIB_SNAPSHOT_OK || out.sequence != 1U || out.peak != 32768U ||
        out.sample_count != 16U || out.sum_squares != UINT64_C(2150218113)) return 2;
    if (vibration_read_snapshot(changing_read, &mock, 0U, 3U, &out)
        != VIB_SNAPSHOT_RETRY_EXHAUSTED || out.sequence != 1U ||
        out.sum_squares != UINT64_C(2150218113)) return 3;
    mock.snapshot.sequence = UINT32_MAX;
    mock_window_publish(&mock);
    if (vibration_sequence_delta(mock.snapshot.sequence, UINT32_MAX) != 1U) return 4;
    mock.snapshot.sum_squares = UINT64_C(1) << 34;
    if (vibration_read_snapshot(mock_window_read32, &mock, 0U, 3U, &out)
        != VIB_SNAPSHOT_OK || out.sum_squares != (UINT64_C(1) << 34)) return 5;
    return 0;
}
