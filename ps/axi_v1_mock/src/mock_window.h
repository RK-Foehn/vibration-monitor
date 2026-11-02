#ifndef MOCK_WINDOW_H
#define MOCK_WINDOW_H
#include "vibration_regs.h"

typedef struct {
    vibration_snapshot_t snapshot;
    uint32_t status;
    uint32_t drops;
} mock_window_t;

void mock_window_init(mock_window_t *mock);
void mock_window_publish(mock_window_t *mock);
/* base=0 is an offset token for this RAM model, NEVER an MMIO address. */
uint32_t mock_window_read32(void *context, uintptr_t offset);
int mock_window_selftest(void);
#endif
