# Standalone LIS3DH XYZ validation, Navigator ZYNQ baseboard V2.6 and
# XC7Z020 core board V1.5, part xc7z020clg400-2.
# Use ONLY this XDC for lis3dh_xyz_board_top. Disable both WHO_AM_I XDCs;
# lis3dh_board_navigator_v2_6.xdc contains ILA net names from the old top.
# Add the XYZ ILA through Vivado Set Up Debug after synthesis.

# Core-board X1 PL_GCLK, 50 MHz, Bank 34 VCCO = 3.3 V (core schematic p.3,6).
set_property PACKAGE_PIN U18 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
create_clock -period 20.000 -name sys_clk [get_ports sys_clk]

# Baseboard PL_RESET, active low, Bank 35 VCCO = 3.3 V (baseboard p.1,5;
# core p.3,6,9). N16 is an LCD signal, not PL_RESET on this board revision.
set_property PACKAGE_PIN J15 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]

# J3 signals are shared with the camera connector P2. P2 must remain empty.
# CS: J3-9, CMOS_D7, Bank 34 VCCO = 3.3 V (baseboard p.1,5; core p.3,6).
set_property PACKAGE_PIN T14 [get_ports lis3dh_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_cs_n]

# SCLK: J3-11, CMOS_D5, Bank 34 VCCO = 3.3 V.
set_property PACKAGE_PIN V12 [get_ports lis3dh_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_sclk]

# MOSI: J3-13, CMOS_D3, Bank 34 VCCO = 3.3 V.
set_property PACKAGE_PIN T12 [get_ports lis3dh_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_mosi]

# MISO: J3-15, CMOS_D1, Bank 34 VCCO = 3.3 V.
set_property PACKAGE_PIN V15 [get_ports lis3dh_miso]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_miso]

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
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {xyz_x[0]} {xyz_x[1]} {xyz_x[2]} {xyz_x[3]} {xyz_x[4]} {xyz_x[5]} {xyz_x[6]} {xyz_x[7]} {xyz_x[8]} {xyz_x[9]} {xyz_x[10]} {xyz_x[11]} {xyz_x[12]} {xyz_x[13]} {xyz_x[14]} {xyz_x[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {xyz_y[0]} {xyz_y[1]} {xyz_y[2]} {xyz_y[3]} {xyz_y[4]} {xyz_y[5]} {xyz_y[6]} {xyz_y[7]} {xyz_y[8]} {xyz_y[9]} {xyz_y[10]} {xyz_y[11]} {xyz_y[12]} {xyz_y[13]} {xyz_y[14]} {xyz_y[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 16 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {xyz_z[0]} {xyz_z[1]} {xyz_z[2]} {xyz_z[3]} {xyz_z[4]} {xyz_z[5]} {xyz_z[6]} {xyz_z[7]} {xyz_z[8]} {xyz_z[9]} {xyz_z[10]} {xyz_z[11]} {xyz_z[12]} {xyz_z[13]} {xyz_z[14]} {xyz_z[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list init_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list init_error]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list lis3dh_cs_n_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list lis3dh_miso_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list lis3dh_mosi_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list lis3dh_sclk_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list xyz_valid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets sys_clk_IBUF_BUFG]
