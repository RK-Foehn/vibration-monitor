#ifndef HARDWARE_ADDRESS_H
#define HARDWARE_ADDRESS_H
#include "xparameters.h"
#include "console_config.h"
#ifndef XPAR_LIS3DH_VIBRATION_AXI_0_BASEADDR
#error "Missing vibration AXI peripheral in generated xparameters.h"
#endif
#if XPAR_LIS3DH_VIBRATION_AXI_0_BASEADDR != 0x40000000U
#error "AXI address differs from reviewed integration; inspect new XSA"
#endif
#define VIB_AXI_BASE ((uintptr_t)XPAR_LIS3DH_VIBRATION_AXI_0_BASEADDR)
#endif
