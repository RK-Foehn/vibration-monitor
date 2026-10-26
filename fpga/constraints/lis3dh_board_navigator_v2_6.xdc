# ALIENTEK Navigator ZYNQ baseboard V2.6 + XC7Z020 core board V1.5.
# FPGA part: xc7z020clg400-2. Use this file instead of lis3dh_board.xdc,
# never simultaneously with it: the old file assigns different pins.
# J3 SPI nets are also routed to the unpopulated camera connector P2.

# Core-board X1 50 MHz oscillator, PL_GCLK, Bank 34, VCCO_34 = 3.3 V.
set_property PACKAGE_PIN U18 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
create_clock -period 20.000 -name sys_clk [get_ports sys_clk]

# Baseboard PL_RESET push button, active low, Bank 35, VCCO_35 = 3.3 V.
# J15 is PL_RESET; N16 is an LCD signal on this board revision.
set_property PACKAGE_PIN J15 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]

# LIS3DH four-wire SPI via baseboard J3. All four signals are Bank 34, 3.3 V.
# CS   -> J3 pin 9  -> CMOS_D7 -> core-board J1 pin 24 -> T14.
set_property PACKAGE_PIN T14 [get_ports lis3dh_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_cs_n]

# SCLK -> J3 pin 11 -> CMOS_D5 -> core-board J1 pin 18 -> V12.
set_property PACKAGE_PIN V12 [get_ports lis3dh_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_sclk]

# MOSI -> J3 pin 13 -> CMOS_D3 -> core-board J1 pin 14 -> T12.
set_property PACKAGE_PIN T12 [get_ports lis3dh_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_mosi]

# MISO -> J3 pin 15 -> CMOS_D1 -> core-board J1 pin 10 -> V15.
set_property PACKAGE_PIN V15 [get_ports lis3dh_miso]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_miso]

# Retain the existing WHO_AM_I ILA probes and debug-hub clock connection.
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list sys_clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {who_am_i_data[0]} {who_am_i_data[1]} {who_am_i_data[2]} {who_am_i_data[3]} {who_am_i_data[4]} {who_am_i_data[5]} {who_am_i_data[6]} {who_am_i_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list error]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list lis3dh_cs_n_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list lis3dh_miso_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list lis3dh_mosi_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list lis3dh_sclk_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list start_pulse]]
# The debug hub is clocked from the same 50 MHz PL oscillator.
set_property C_CLK_INPUT_FREQ_HZ 50000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets sys_clk_IBUF_BUFG]
