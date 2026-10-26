# LIS3DH WHO_AM_I SPI simulation (V0.2 stage 1)

This directory contains a simulation-only bring-up step for reading the
LIS3DH `WHO_AM_I` register. It does not claim that the sensor has been wired
or verified on hardware.

## Protocol used

- Four-wire SPI: `CS`, `SCLK/SPC`, `MOSI/SDI`, and `MISO/SDO`.
- `CS` is active low and `SCLK` is high while idle.
- Data changes on falling `SCLK` edges and is sampled on rising edges.
- A single-register read uses 16 clocks, MSB first.
- `WHO_AM_I` is address `0x0F`; with `RW=1` and `MS=0`, the command is
  `0x8F`. The expected response is `0x33`.
- The default RTL setting produces a 1 MHz SPI clock from the board's 50 MHz
  PL clock. The testbench uses 8.33 MHz, below the 10 MHz device maximum.

Reference: STMicroelectronics, LIS3DH datasheet, DocID17530 Rev 2,
sections 2.4.1, 6.2, 6.2.1, and Table 21.

## Run with Vivado 2023.2 XSim

From the `fpga` directory in a Vivado 2023.2 command prompt:

```powershell
xvlog --sv rtl/lis3dh_spi_controller.sv rtl/lis3dh_who_am_i_top.sv sim/tb_lis3dh_who_am_i_top.sv
xelab tb_lis3dh_who_am_i_top -s lis3dh_who_am_i_sim
xsim lis3dh_who_am_i_sim -runall
```

## PASS criteria

The self-checking testbench requires all of the following:

- one active-low `CS` transaction;
- `SCLK` high at bus idle and at both `CS` boundaries;
- exactly 16 rising and 16 falling `SCLK` edges while `CS` is low;
- transmitted command byte `0x8F` and dummy byte `0x00`;
- sampled result `0x33`;
- `done` asserted for one system-clock cycle and `error` remaining low.

A passing run ends with:

```text
PASS: LIS3DH WHO_AM_I SPI transaction verified.
```

## Before hardware use

Hardware testing remains blocked until the J4 pin orientation, 3.3 V supply,
ground, module supply wiring, solder joints, and all four SPI connections have
been checked on the unpowered hardware and with a multimeter. Pin constraints
and bitstream programming are outside this simulation stage.
