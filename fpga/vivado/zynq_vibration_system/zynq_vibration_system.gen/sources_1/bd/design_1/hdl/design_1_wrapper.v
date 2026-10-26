//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Mon Oct 26 11:37:58 2026
//Host        : LAPTOP-SINKEN running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (lis3dh_cs_n_0,
    lis3dh_miso_0,
    lis3dh_mosi_0,
    lis3dh_sclk_0);
  output lis3dh_cs_n_0;
  input lis3dh_miso_0;
  output lis3dh_mosi_0;
  output lis3dh_sclk_0;

  wire lis3dh_cs_n_0;
  wire lis3dh_miso_0;
  wire lis3dh_mosi_0;
  wire lis3dh_sclk_0;

  design_1 design_1_i
       (.lis3dh_cs_n_0(lis3dh_cs_n_0),
        .lis3dh_miso_0(lis3dh_miso_0),
        .lis3dh_mosi_0(lis3dh_mosi_0),
        .lis3dh_sclk_0(lis3dh_sclk_0));
endmodule
