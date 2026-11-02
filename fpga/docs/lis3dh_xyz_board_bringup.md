# LIS3DH XYZ board bring-up (Navigator ZYNQ V2.6)

This is a manual Vivado 2023.2 procedure. The standalone top is
`lis3dh_xyz_board_top` for part `xc7z020clg400-2`; it does not use the FIFO.
The existing WHO_AM_I top/project files are retained. Passing XSim or RTL
elaboration does not prove real XYZ acquisition.

## Source and constraints switch

1. Add `fpga/rtl/lis3dh_spi_burst_reader.sv`,
   `fpga/rtl/lis3dh_xyz_acquisition.sv`, and
   `fpga/rtl/lis3dh_xyz_board_top.sv` as Design Sources. Keep the existing
   `fpga/rtl/lis3dh_spi_controller.sv` in Design Sources.
2. Set `lis3dh_xyz_board_top` as the synthesis top. Do not remove the old
   `lis3dh_board_top` source.
3. Add `fpga/constraints/lis3dh_xyz_board_navigator_v2_6.xdc` to the active
   constraint set. Disable both `lis3dh_board.xdc` and
   `lis3dh_board_navigator_v2_6.xdc` for this build. The latter has ILA net
   bindings specific to the old WHO_AM_I top. Never enable two of these XDCs
   together: each constrains the same six physical ports.
4. Confirm the six top-level ports and pin map before synthesis:
   `sys_clk=U18`, `sys_rst_n=J15`, `lis3dh_cs_n=T14`,
   `lis3dh_sclk=V12`, `lis3dh_mosi=T12`, `lis3dh_miso=V15`.
   All use `LVCMOS33`; the clock period is 20 ns. Camera connector P2 must
   remain empty because its data lines share the J3 SPI nets.

## ILA setup after synthesis

Run Synthesis, open the synthesized design, then use Vivado **Set Up Debug**
to add one ILA clocked by the 50 MHz `sys_clk` global clock. Select the
`mark_debug` nets in/under `lis3dh_xyz_board_top`:

- `who_am_i_data[7:0]`, `init_done`, `init_error`;
- `xyz_valid`, `xyz_x[15:0]`, `xyz_y[15:0]`, `xyz_z[15:0]`;
- `lis3dh_cs_n_debug`, `lis3dh_sclk_debug`, `lis3dh_mosi_debug`,
  `lis3dh_miso_debug`;
- `sample_drop`, `sample_drop_count[31:0]`, `sensor_overrun`, `spi_busy`.

With `xyz_ready` tied to 1, `sample_drop` and `sample_drop_count` must stay
zero. Vivado may constant-fold these nets despite debug marking; if they are
not selectable, record that fact rather than changing the acquisition RTL or
claiming they were observed. A later backpressure test can make them active.

Choose 8192 samples (or more if resources permit). At 50 MHz, 2048 samples
span only 40.96 us, while the 100 Hz accelerometer updates about every 10 ms.
An 8192-sample buffer spans 163.84 us: sufficient to inspect one 56-clock
1 MHz XYZ burst (~56 us) and its preceding 16-clock status read (~16 us).

- To verify initialization, arm the ILA, trigger on falling `lis3dh_cs_n`,
  then press and release PL_RESET. Inspect the `0x8F` WHO read and the two
  register writes. Separately trigger on rising `init_done` to confirm the
  post-configuration wait. The initial 10 ms boot wait and 100 ms settling
  wait cannot fit in one short full-rate trace.
- To verify one XYZ sample, trigger on rising `xyz_valid` and place about
  75% of the buffer before the trigger. Check that `who_am_i_data=0x33`,
  `init_done=1`, `init_error=0`, and XYZ values update on the trigger.
  The pre-trigger region should show the status read and `0xE8` burst.
- Re-arm for multiple events. Even 8192 full-rate samples cannot display
  two 100 Hz updates in one capture. The XYZ registers hold their last value
  between `xyz_valid` pulses; do not mistake a held value for a new sample.

After Set Up Debug, save the debug setup, run Implementation and Generate
Bitstream. In Hardware Manager, program the `.bit` and load the `.ltx` from
the same build. Do not mix them with the previous WHO_AM_I build. This step
is manual and has not been performed by this task.
