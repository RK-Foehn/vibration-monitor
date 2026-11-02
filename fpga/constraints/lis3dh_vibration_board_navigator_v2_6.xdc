# Navigator ZYNQ XC7Z020 CLG400-2: core V1.5, baseboard V2.6.
# Pin assignments match the already hardware-validated XYZ-only XDC.
# For this top enable ONLY this XDC; disable old WHO/XYZ XDCs, which also
# contain top-specific ILA bindings. Add ILA via Set Up Debug after synthesis.

# Core PL_GCLK, 50 MHz, Bank 34 VCCO 3.3 V (core schematic pp.3,6).
set_property PACKAGE_PIN U18 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
create_clock -period 20.000 -name sys_clk [get_ports sys_clk]

# Baseboard PL_RESET active low, Bank 35 VCCO 3.3 V (baseboard p.5; core pp.3,6).
set_property PACKAGE_PIN J15 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]

# J3 shared with camera P2; keep P2 empty (baseboard pp.1,5; core pp.3,6).
# CS: J3-9, CMOS_D7, Bank 34 VCCO 3.3 V.
set_property PACKAGE_PIN T14 [get_ports lis3dh_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_cs_n]
# SCLK: J3-11, CMOS_D5, Bank 34 VCCO 3.3 V.
set_property PACKAGE_PIN V12 [get_ports lis3dh_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_sclk]
# MOSI: J3-13, CMOS_D3, Bank 34 VCCO 3.3 V.
set_property PACKAGE_PIN T12 [get_ports lis3dh_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_mosi]
# MISO: J3-15, CMOS_D1, Bank 34 VCCO 3.3 V.
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
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {xyz_y[0]} {xyz_y[1]} {xyz_y[2]} {xyz_y[3]} {xyz_y[4]} {xyz_y[5]} {xyz_y[6]} {xyz_y[7]} {xyz_y[8]} {xyz_y[9]} {xyz_y[10]} {xyz_y[11]} {xyz_y[12]} {xyz_y[13]} {xyz_y[14]} {xyz_y[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {who_am_i_data[0]} {who_am_i_data[1]} {who_am_i_data[2]} {who_am_i_data[3]} {who_am_i_data[4]} {who_am_i_data[5]} {who_am_i_data[6]} {who_am_i_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {result_peak[0]} {result_peak[1]} {result_peak[2]} {result_peak[3]} {result_peak[4]} {result_peak[5]} {result_peak[6]} {result_peak[7]} {result_peak[8]} {result_peak[9]} {result_peak[10]} {result_peak[11]} {result_peak[12]} {result_peak[13]} {result_peak[14]} {result_peak[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {sample_drop_count[0]} {sample_drop_count[1]} {sample_drop_count[2]} {sample_drop_count[3]} {sample_drop_count[4]} {sample_drop_count[5]} {sample_drop_count[6]} {sample_drop_count[7]} {sample_drop_count[8]} {sample_drop_count[9]} {sample_drop_count[10]} {sample_drop_count[11]} {sample_drop_count[12]} {sample_drop_count[13]} {sample_drop_count[14]} {sample_drop_count[15]} {sample_drop_count[16]} {sample_drop_count[17]} {sample_drop_count[18]} {sample_drop_count[19]} {sample_drop_count[20]} {sample_drop_count[21]} {sample_drop_count[22]} {sample_drop_count[23]} {sample_drop_count[24]} {sample_drop_count[25]} {sample_drop_count[26]} {sample_drop_count[27]} {sample_drop_count[28]} {sample_drop_count[29]} {sample_drop_count[30]} {sample_drop_count[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {xyz_z[0]} {xyz_z[1]} {xyz_z[2]} {xyz_z[3]} {xyz_z[4]} {xyz_z[5]} {xyz_z[6]} {xyz_z[7]} {xyz_z[8]} {xyz_z[9]} {xyz_z[10]} {xyz_z[11]} {xyz_z[12]} {xyz_z[13]} {xyz_z[14]} {xyz_z[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 4 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {fifo_level[0]} {fifo_level[1]} {fifo_level[2]} {fifo_level[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 16 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {xyz_x[0]} {xyz_x[1]} {xyz_x[2]} {xyz_x[3]} {xyz_x[4]} {xyz_x[5]} {xyz_x[6]} {xyz_x[7]} {xyz_x[8]} {xyz_x[9]} {xyz_x[10]} {xyz_x[11]} {xyz_x[12]} {xyz_x[13]} {xyz_x[14]} {xyz_x[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 35 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {result_sum_squares[0]} {result_sum_squares[1]} {result_sum_squares[2]} {result_sum_squares[3]} {result_sum_squares[4]} {result_sum_squares[5]} {result_sum_squares[6]} {result_sum_squares[7]} {result_sum_squares[8]} {result_sum_squares[9]} {result_sum_squares[10]} {result_sum_squares[11]} {result_sum_squares[12]} {result_sum_squares[13]} {result_sum_squares[14]} {result_sum_squares[15]} {result_sum_squares[16]} {result_sum_squares[17]} {result_sum_squares[18]} {result_sum_squares[19]} {result_sum_squares[20]} {result_sum_squares[21]} {result_sum_squares[22]} {result_sum_squares[23]} {result_sum_squares[24]} {result_sum_squares[25]} {result_sum_squares[26]} {result_sum_squares[27]} {result_sum_squares[28]} {result_sum_squares[29]} {result_sum_squares[30]} {result_sum_squares[31]} {result_sum_squares[32]} {result_sum_squares[33]} {result_sum_squares[34]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {result_sample_count[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 4 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {pipeline/sensor/state[0]} {pipeline/sensor/state[1]} {pipeline/sensor/state[2]} {pipeline/sensor/state[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 16 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {pipeline/sensor/xyz_z[0]} {pipeline/sensor/xyz_z[1]} {pipeline/sensor/xyz_z[2]} {pipeline/sensor/xyz_z[3]} {pipeline/sensor/xyz_z[4]} {pipeline/sensor/xyz_z[5]} {pipeline/sensor/xyz_z[6]} {pipeline/sensor/xyz_z[7]} {pipeline/sensor/xyz_z[8]} {pipeline/sensor/xyz_z[9]} {pipeline/sensor/xyz_z[10]} {pipeline/sensor/xyz_z[11]} {pipeline/sensor/xyz_z[12]} {pipeline/sensor/xyz_z[13]} {pipeline/sensor/xyz_z[14]} {pipeline/sensor/xyz_z[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 16 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {pipeline/sensor/xyz_y[0]} {pipeline/sensor/xyz_y[1]} {pipeline/sensor/xyz_y[2]} {pipeline/sensor/xyz_y[3]} {pipeline/sensor/xyz_y[4]} {pipeline/sensor/xyz_y[5]} {pipeline/sensor/xyz_y[6]} {pipeline/sensor/xyz_y[7]} {pipeline/sensor/xyz_y[8]} {pipeline/sensor/xyz_y[9]} {pipeline/sensor/xyz_y[10]} {pipeline/sensor/xyz_y[11]} {pipeline/sensor/xyz_y[12]} {pipeline/sensor/xyz_y[13]} {pipeline/sensor/xyz_y[14]} {pipeline/sensor/xyz_y[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list fifo_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list fifo_overflow]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list init_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list init_error]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list lis3dh_cs_n_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list lis3dh_miso_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list lis3dh_mosi_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list lis3dh_sclk_debug]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list result_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list sample_accepted]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list sample_drop]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list pipeline/sensor/sample_drop]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list sample_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list sensor_overrun]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list spi_busy]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list xyz_valid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets sys_clk_IBUF_BUFG]
