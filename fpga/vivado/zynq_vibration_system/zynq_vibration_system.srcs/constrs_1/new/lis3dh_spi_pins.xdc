# LIS3DH SPI - ALIENTEK Zynq Navigator V2.6
# CS:   J3-9  -> T14
# SCLK: J3-11 -> V12
# MOSI: J3-13 -> T12
# MISO: J3-15 -> V15

set_property PACKAGE_PIN T14 [get_ports lis3dh_cs_n_0]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_cs_n_0]

set_property PACKAGE_PIN V12 [get_ports lis3dh_sclk_0]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_sclk_0]

set_property PACKAGE_PIN T12 [get_ports lis3dh_mosi_0]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_mosi_0]

set_property PACKAGE_PIN V15 [get_ports lis3dh_miso_0]
set_property IOSTANDARD LVCMOS33 [get_ports lis3dh_miso_0]