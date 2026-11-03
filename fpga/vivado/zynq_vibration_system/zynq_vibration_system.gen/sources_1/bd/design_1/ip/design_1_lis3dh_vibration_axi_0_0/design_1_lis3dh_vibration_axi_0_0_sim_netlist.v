// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Oct 26 10:19:37 2026
// Host        : LAPTOP-SINKEN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/vibration-monitor/fpga/vivado/zynq_vibration_system/zynq_vibration_system.gen/sources_1/bd/design_1/ip/design_1_lis3dh_vibration_axi_0_0/design_1_lis3dh_vibration_axi_0_0_sim_netlist.v
// Design      : design_1_lis3dh_vibration_axi_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_lis3dh_vibration_axi_0_0,lis3dh_vibration_axi_wrapper,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "lis3dh_vibration_axi_wrapper,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module design_1_lis3dh_vibration_axi_0_0
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    lis3dh_cs_n,
    lis3dh_sclk,
    lis3dh_mosi,
    lis3dh_miso);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [11:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [11:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 12, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_rready;
  output lis3dh_cs_n;
  output lis3dh_sclk;
  output lis3dh_mosi;
  input lis3dh_miso;

  wire \<const0> ;
  wire lis3dh_cs_n;
  wire lis3dh_miso;
  wire lis3dh_mosi;
  wire lis3dh_sclk;
  wire s_axi_aclk;
  wire [11:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [11:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:1]\^s_axi_bresp ;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [1:1]\^s_axi_rresp ;
  wire s_axi_rvalid;
  wire s_axi_wready;
  wire s_axi_wvalid;

  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_wrapper inst
       (.lis3dh_cs_n(lis3dh_cs_n),
        .lis3dh_miso(lis3dh_miso),
        .lis3dh_mosi(lis3dh_mosi),
        .lis3dh_sclk(lis3dh_sclk),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(\^s_axi_bresp ),
        .s_axi_bvalid_reg(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(\^s_axi_rresp ),
        .s_axi_rvalid_reg(s_axi_rvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "lis3dh_spi_burst_reader" *) 
module design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_burst_reader
   (s_axi_aresetn,
    done_reg_0,
    D,
    \read_data_reg[23]_0 ,
    \read_data_reg[7]_0 ,
    done_reg_1,
    burst_cs_n,
    burst_sclk,
    burst_mosi,
    clk,
    out,
    lis3dh_miso,
    xyz_x,
    xyz_y,
    xyz_z,
    rst_n,
    Q);
  output s_axi_aresetn;
  output done_reg_0;
  output [15:0]D;
  output [15:0]\read_data_reg[23]_0 ;
  output [15:0]\read_data_reg[7]_0 ;
  output done_reg_1;
  output burst_cs_n;
  output burst_sclk;
  output burst_mosi;
  input clk;
  input [3:0]out;
  input lis3dh_miso;
  input [15:0]xyz_x;
  input [15:0]xyz_y;
  input [15:0]xyz_z;
  input rst_n;
  input [3:0]Q;

  wire [15:0]D;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[0]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire [3:0]Q;
  wire [5:0]bit_count;
  wire \bit_count[1]_i_1__0_n_0 ;
  wire \bit_count[5]_i_1_n_0 ;
  wire \bit_count[5]_i_3_n_0 ;
  wire \bit_count_reg_n_0_[0] ;
  wire \bit_count_reg_n_0_[1] ;
  wire \bit_count_reg_n_0_[2] ;
  wire \bit_count_reg_n_0_[3] ;
  wire \bit_count_reg_n_0_[4] ;
  wire \bit_count_reg_n_0_[5] ;
  wire burst_cs_n;
  wire burst_done;
  wire burst_mosi;
  wire burst_sclk;
  wire clk;
  wire decoded_x0;
  wire decoded_y0;
  wire decoded_z0;
  wire [4:0]div_counter;
  wire \div_counter[2]_i_1__0_n_0 ;
  wire \div_counter[4]_i_2__0_n_0 ;
  wire \div_counter_reg_n_0_[0] ;
  wire \div_counter_reg_n_0_[1] ;
  wire \div_counter_reg_n_0_[2] ;
  wire \div_counter_reg_n_0_[3] ;
  wire \div_counter_reg_n_0_[4] ;
  wire done_i_1__0_n_0;
  wire done_reg_0;
  wire done_reg_1;
  wire lis3dh_cs_n_i_1_n_0;
  wire lis3dh_miso;
  wire lis3dh_mosi_i_1_n_0;
  wire lis3dh_mosi_i_2_n_0;
  wire lis3dh_mosi_i_3_n_0;
  wire lis3dh_sclk_i_1_n_0;
  wire [3:0]out;
  wire [47:1]p_0_in__1;
  wire \read_data[47]_i_1_n_0 ;
  wire \read_data[47]_i_2_n_0 ;
  wire [15:0]\read_data_reg[23]_0 ;
  wire [15:0]\read_data_reg[7]_0 ;
  wire \read_data_reg_n_0_[0] ;
  wire \read_data_reg_n_0_[12] ;
  wire \read_data_reg_n_0_[13] ;
  wire \read_data_reg_n_0_[14] ;
  wire \read_data_reg_n_0_[15] ;
  wire \read_data_reg_n_0_[16] ;
  wire \read_data_reg_n_0_[17] ;
  wire \read_data_reg_n_0_[18] ;
  wire \read_data_reg_n_0_[19] ;
  wire \read_data_reg_n_0_[1] ;
  wire \read_data_reg_n_0_[20] ;
  wire \read_data_reg_n_0_[21] ;
  wire \read_data_reg_n_0_[22] ;
  wire \read_data_reg_n_0_[28] ;
  wire \read_data_reg_n_0_[29] ;
  wire \read_data_reg_n_0_[2] ;
  wire \read_data_reg_n_0_[30] ;
  wire \read_data_reg_n_0_[31] ;
  wire \read_data_reg_n_0_[32] ;
  wire \read_data_reg_n_0_[33] ;
  wire \read_data_reg_n_0_[34] ;
  wire \read_data_reg_n_0_[35] ;
  wire \read_data_reg_n_0_[36] ;
  wire \read_data_reg_n_0_[37] ;
  wire \read_data_reg_n_0_[38] ;
  wire \read_data_reg_n_0_[3] ;
  wire \read_data_reg_n_0_[44] ;
  wire \read_data_reg_n_0_[45] ;
  wire \read_data_reg_n_0_[46] ;
  wire \read_data_reg_n_0_[47] ;
  wire \read_data_reg_n_0_[4] ;
  wire \read_data_reg_n_0_[5] ;
  wire \read_data_reg_n_0_[6] ;
  wire rst_n;
  wire [46:0]rx_shift;
  wire \rx_shift[46]_i_1_n_0 ;
  wire \rx_shift[46]_i_3_n_0 ;
  wire \rx_shift[46]_i_4_n_0 ;
  wire s_axi_aresetn;
  wire [1:0]state;
  wire [15:0]xyz_x;
  wire [15:0]xyz_y;
  wire [15:0]xyz_z;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[3]_i_3 
       (.I0(rst_n),
        .O(s_axi_aresetn));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h55B8)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[1]_i_3_n_0 ),
        .I1(state[1]),
        .I2(\FSM_sequential_state[0]_i_2_n_0 ),
        .I3(state[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[3]),
        .O(\FSM_sequential_state[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h34CC)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(state[1]),
        .I2(state[0]),
        .I3(\FSM_sequential_state[1]_i_3_n_0 ),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF7FFFFFFF)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(\bit_count_reg_n_0_[4] ),
        .I1(\bit_count_reg_n_0_[1] ),
        .I2(\bit_count_reg_n_0_[0] ),
        .I3(\bit_count_reg_n_0_[2] ),
        .I4(\bit_count_reg_n_0_[5] ),
        .I5(\bit_count_reg_n_0_[3] ),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00001000)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(\div_counter_reg_n_0_[1] ),
        .I1(\div_counter_reg_n_0_[0] ),
        .I2(\div_counter_reg_n_0_[3] ),
        .I3(\div_counter_reg_n_0_[4] ),
        .I4(\div_counter_reg_n_0_[2] ),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:00,SAMPLE_RISE:10,DRIVE_FALL:01,CS_HOLD:11" *) 
  FDCE \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axi_aresetn),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "IDLE:00,SAMPLE_RISE:10,DRIVE_FALL:01,CS_HOLD:11" *) 
  FDCE \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axi_aresetn),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \bit_count[0]_i_1__0 
       (.I0(state[1]),
        .I1(\bit_count_reg_n_0_[0] ),
        .O(bit_count[0]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \bit_count[1]_i_1__0 
       (.I0(\bit_count_reg_n_0_[1] ),
        .I1(\bit_count_reg_n_0_[0] ),
        .I2(state[1]),
        .O(\bit_count[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \bit_count[2]_i_1__0 
       (.I0(state[1]),
        .I1(\bit_count_reg_n_0_[0] ),
        .I2(\bit_count_reg_n_0_[1] ),
        .I3(\bit_count_reg_n_0_[2] ),
        .O(bit_count[2]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \bit_count[3]_i_1__0 
       (.I0(state[1]),
        .I1(\bit_count_reg_n_0_[1] ),
        .I2(\bit_count_reg_n_0_[0] ),
        .I3(\bit_count_reg_n_0_[2] ),
        .I4(\bit_count_reg_n_0_[3] ),
        .O(bit_count[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \bit_count[4]_i_1__0 
       (.I0(state[1]),
        .I1(\bit_count_reg_n_0_[2] ),
        .I2(\bit_count_reg_n_0_[0] ),
        .I3(\bit_count_reg_n_0_[1] ),
        .I4(\bit_count_reg_n_0_[3] ),
        .I5(\bit_count_reg_n_0_[4] ),
        .O(bit_count[4]));
  LUT5 #(
    .INIT(32'h51114000)) 
    \bit_count[5]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(\FSM_sequential_state[1]_i_3_n_0 ),
        .I3(\FSM_sequential_state[1]_i_2_n_0 ),
        .I4(\FSM_sequential_state[0]_i_2_n_0 ),
        .O(\bit_count[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'hA2AA0800)) 
    \bit_count[5]_i_2 
       (.I0(state[1]),
        .I1(\bit_count_reg_n_0_[3] ),
        .I2(\bit_count[5]_i_3_n_0 ),
        .I3(\bit_count_reg_n_0_[4] ),
        .I4(\bit_count_reg_n_0_[5] ),
        .O(bit_count[5]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \bit_count[5]_i_3 
       (.I0(\bit_count_reg_n_0_[1] ),
        .I1(\bit_count_reg_n_0_[0] ),
        .I2(\bit_count_reg_n_0_[2] ),
        .O(\bit_count[5]_i_3_n_0 ));
  FDCE \bit_count_reg[0] 
       (.C(clk),
        .CE(\bit_count[5]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(bit_count[0]),
        .Q(\bit_count_reg_n_0_[0] ));
  FDCE \bit_count_reg[1] 
       (.C(clk),
        .CE(\bit_count[5]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(\bit_count[1]_i_1__0_n_0 ),
        .Q(\bit_count_reg_n_0_[1] ));
  FDCE \bit_count_reg[2] 
       (.C(clk),
        .CE(\bit_count[5]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(bit_count[2]),
        .Q(\bit_count_reg_n_0_[2] ));
  FDCE \bit_count_reg[3] 
       (.C(clk),
        .CE(\bit_count[5]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(bit_count[3]),
        .Q(\bit_count_reg_n_0_[3] ));
  FDCE \bit_count_reg[4] 
       (.C(clk),
        .CE(\bit_count[5]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(bit_count[4]),
        .Q(\bit_count_reg_n_0_[4] ));
  FDCE \bit_count_reg[5] 
       (.C(clk),
        .CE(\bit_count[5]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(bit_count[5]),
        .Q(\bit_count_reg_n_0_[5] ));
  LUT6 #(
    .INIT(64'h000000000000FFBF)) 
    \div_counter[0]_i_1__0 
       (.I0(\div_counter_reg_n_0_[1] ),
        .I1(\div_counter_reg_n_0_[3] ),
        .I2(\div_counter_reg_n_0_[4] ),
        .I3(\div_counter_reg_n_0_[2] ),
        .I4(\div_counter[4]_i_2__0_n_0 ),
        .I5(\div_counter_reg_n_0_[0] ),
        .O(div_counter[0]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h6660)) 
    \div_counter[1]_i_1__0 
       (.I0(\div_counter_reg_n_0_[1] ),
        .I1(\div_counter_reg_n_0_[0] ),
        .I2(state[0]),
        .I3(state[1]),
        .O(div_counter[1]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h0EEEE000)) 
    \div_counter[2]_i_1__0 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(\div_counter_reg_n_0_[0] ),
        .I3(\div_counter_reg_n_0_[1] ),
        .I4(\div_counter_reg_n_0_[2] ),
        .O(\div_counter[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0333333130000000)) 
    \div_counter[3]_i_1__0 
       (.I0(\div_counter_reg_n_0_[4] ),
        .I1(\div_counter[4]_i_2__0_n_0 ),
        .I2(\div_counter_reg_n_0_[1] ),
        .I3(\div_counter_reg_n_0_[0] ),
        .I4(\div_counter_reg_n_0_[2] ),
        .I5(\div_counter_reg_n_0_[3] ),
        .O(div_counter[3]));
  LUT6 #(
    .INIT(64'h1555555140000000)) 
    \div_counter[4]_i_1__0 
       (.I0(\div_counter[4]_i_2__0_n_0 ),
        .I1(\div_counter_reg_n_0_[3] ),
        .I2(\div_counter_reg_n_0_[2] ),
        .I3(\div_counter_reg_n_0_[0] ),
        .I4(\div_counter_reg_n_0_[1] ),
        .I5(\div_counter_reg_n_0_[4] ),
        .O(div_counter[4]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \div_counter[4]_i_2__0 
       (.I0(state[1]),
        .I1(state[0]),
        .O(\div_counter[4]_i_2__0_n_0 ));
  FDCE \div_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axi_aresetn),
        .D(div_counter[0]),
        .Q(\div_counter_reg_n_0_[0] ));
  FDCE \div_counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axi_aresetn),
        .D(div_counter[1]),
        .Q(\div_counter_reg_n_0_[1] ));
  FDCE \div_counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axi_aresetn),
        .D(\div_counter[2]_i_1__0_n_0 ),
        .Q(\div_counter_reg_n_0_[2] ));
  FDCE \div_counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axi_aresetn),
        .D(div_counter[3]),
        .Q(\div_counter_reg_n_0_[3] ));
  FDCE \div_counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axi_aresetn),
        .D(div_counter[4]),
        .Q(\div_counter_reg_n_0_[4] ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h80)) 
    done_i_1__0
       (.I0(\FSM_sequential_state[1]_i_3_n_0 ),
        .I1(state[0]),
        .I2(state[1]),
        .O(done_i_1__0_n_0));
  FDCE done_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axi_aresetn),
        .D(done_i_1__0_n_0),
        .Q(burst_done));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'hFFF5C005)) 
    lis3dh_cs_n_i_1
       (.I0(\FSM_sequential_state[0]_i_2_n_0 ),
        .I1(\FSM_sequential_state[1]_i_3_n_0 ),
        .I2(state[0]),
        .I3(state[1]),
        .I4(burst_cs_n),
        .O(lis3dh_cs_n_i_1_n_0));
  FDPE lis3dh_cs_n_reg
       (.C(clk),
        .CE(1'b1),
        .D(lis3dh_cs_n_i_1_n_0),
        .PRE(s_axi_aresetn),
        .Q(burst_cs_n));
  LUT6 #(
    .INIT(64'h0F8FFF0000800000)) 
    lis3dh_mosi_i_1
       (.I0(lis3dh_mosi_i_2_n_0),
        .I1(lis3dh_mosi_i_3_n_0),
        .I2(\FSM_sequential_state[1]_i_3_n_0 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(burst_mosi),
        .O(lis3dh_mosi_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h17)) 
    lis3dh_mosi_i_2
       (.I0(\bit_count_reg_n_0_[2] ),
        .I1(\bit_count_reg_n_0_[1] ),
        .I2(\bit_count_reg_n_0_[0] ),
        .O(lis3dh_mosi_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h01)) 
    lis3dh_mosi_i_3
       (.I0(\bit_count_reg_n_0_[3] ),
        .I1(\bit_count_reg_n_0_[4] ),
        .I2(\bit_count_reg_n_0_[5] ),
        .O(lis3dh_mosi_i_3_n_0));
  FDCE lis3dh_mosi_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axi_aresetn),
        .D(lis3dh_mosi_i_1_n_0),
        .Q(burst_mosi));
  LUT4 #(
    .INIT(16'hF3AB)) 
    lis3dh_sclk_i_1
       (.I0(burst_sclk),
        .I1(state[0]),
        .I2(state[1]),
        .I3(\FSM_sequential_state[1]_i_3_n_0 ),
        .O(lis3dh_sclk_i_1_n_0));
  FDPE lis3dh_sclk_reg
       (.C(clk),
        .CE(1'b1),
        .D(lis3dh_sclk_i_1_n_0),
        .PRE(s_axi_aresetn),
        .Q(burst_sclk));
  LUT6 #(
    .INIT(64'h0000000000002000)) 
    \read_data[47]_i_1 
       (.I0(\read_data[47]_i_2_n_0 ),
        .I1(\div_counter_reg_n_0_[2] ),
        .I2(\div_counter_reg_n_0_[4] ),
        .I3(\div_counter_reg_n_0_[3] ),
        .I4(\div_counter_reg_n_0_[0] ),
        .I5(\div_counter_reg_n_0_[1] ),
        .O(\read_data[47]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \read_data[47]_i_2 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(\bit_count_reg_n_0_[3] ),
        .I3(\bit_count_reg_n_0_[5] ),
        .I4(\bit_count[5]_i_3_n_0 ),
        .I5(\bit_count_reg_n_0_[4] ),
        .O(\read_data[47]_i_2_n_0 ));
  FDCE \read_data_reg[0] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(lis3dh_miso),
        .Q(\read_data_reg_n_0_[0] ));
  FDCE \read_data_reg[12] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[12]),
        .Q(\read_data_reg_n_0_[12] ));
  FDCE \read_data_reg[13] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[13]),
        .Q(\read_data_reg_n_0_[13] ));
  FDCE \read_data_reg[14] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[14]),
        .Q(\read_data_reg_n_0_[14] ));
  FDCE \read_data_reg[15] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[15]),
        .Q(\read_data_reg_n_0_[15] ));
  FDCE \read_data_reg[16] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[16]),
        .Q(\read_data_reg_n_0_[16] ));
  FDCE \read_data_reg[17] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[17]),
        .Q(\read_data_reg_n_0_[17] ));
  FDCE \read_data_reg[18] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[18]),
        .Q(\read_data_reg_n_0_[18] ));
  FDCE \read_data_reg[19] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[19]),
        .Q(\read_data_reg_n_0_[19] ));
  FDCE \read_data_reg[1] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[1]),
        .Q(\read_data_reg_n_0_[1] ));
  FDCE \read_data_reg[20] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[20]),
        .Q(\read_data_reg_n_0_[20] ));
  FDCE \read_data_reg[21] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[21]),
        .Q(\read_data_reg_n_0_[21] ));
  FDCE \read_data_reg[22] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[22]),
        .Q(\read_data_reg_n_0_[22] ));
  FDCE \read_data_reg[23] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[23]),
        .Q(decoded_y0));
  FDCE \read_data_reg[28] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[28]),
        .Q(\read_data_reg_n_0_[28] ));
  FDCE \read_data_reg[29] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[29]),
        .Q(\read_data_reg_n_0_[29] ));
  FDCE \read_data_reg[2] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[2]),
        .Q(\read_data_reg_n_0_[2] ));
  FDCE \read_data_reg[30] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[30]),
        .Q(\read_data_reg_n_0_[30] ));
  FDCE \read_data_reg[31] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[31]),
        .Q(\read_data_reg_n_0_[31] ));
  FDCE \read_data_reg[32] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[32]),
        .Q(\read_data_reg_n_0_[32] ));
  FDCE \read_data_reg[33] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[33]),
        .Q(\read_data_reg_n_0_[33] ));
  FDCE \read_data_reg[34] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[34]),
        .Q(\read_data_reg_n_0_[34] ));
  FDCE \read_data_reg[35] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[35]),
        .Q(\read_data_reg_n_0_[35] ));
  FDCE \read_data_reg[36] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[36]),
        .Q(\read_data_reg_n_0_[36] ));
  FDCE \read_data_reg[37] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[37]),
        .Q(\read_data_reg_n_0_[37] ));
  FDCE \read_data_reg[38] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[38]),
        .Q(\read_data_reg_n_0_[38] ));
  FDCE \read_data_reg[39] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[39]),
        .Q(decoded_x0));
  FDCE \read_data_reg[3] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[3]),
        .Q(\read_data_reg_n_0_[3] ));
  FDCE \read_data_reg[44] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[44]),
        .Q(\read_data_reg_n_0_[44] ));
  FDCE \read_data_reg[45] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[45]),
        .Q(\read_data_reg_n_0_[45] ));
  FDCE \read_data_reg[46] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[46]),
        .Q(\read_data_reg_n_0_[46] ));
  FDCE \read_data_reg[47] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[47]),
        .Q(\read_data_reg_n_0_[47] ));
  FDCE \read_data_reg[4] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[4]),
        .Q(\read_data_reg_n_0_[4] ));
  FDCE \read_data_reg[5] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[5]),
        .Q(\read_data_reg_n_0_[5] ));
  FDCE \read_data_reg[6] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[6]),
        .Q(\read_data_reg_n_0_[6] ));
  FDCE \read_data_reg[7] 
       (.C(clk),
        .CE(\read_data[47]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(p_0_in__1[7]),
        .Q(decoded_z0));
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[0]_i_1__0 
       (.I0(state[1]),
        .I1(lis3dh_miso),
        .O(rx_shift[0]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[10]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[10]),
        .O(rx_shift[10]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[11]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[11]),
        .O(rx_shift[11]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[12]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[12]),
        .O(rx_shift[12]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[13]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[13]),
        .O(rx_shift[13]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[14]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[14]),
        .O(rx_shift[14]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[15]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[15]),
        .O(rx_shift[15]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[16]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[16]),
        .O(rx_shift[16]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[17]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[17]),
        .O(rx_shift[17]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[18]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[18]),
        .O(rx_shift[18]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[19]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[19]),
        .O(rx_shift[19]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[1]_i_1__0 
       (.I0(state[1]),
        .I1(p_0_in__1[1]),
        .O(rx_shift[1]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[20]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[20]),
        .O(rx_shift[20]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[21]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[21]),
        .O(rx_shift[21]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[22]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[22]),
        .O(rx_shift[22]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[23]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[23]),
        .O(rx_shift[23]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[24]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[24]),
        .O(rx_shift[24]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[25]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[25]),
        .O(rx_shift[25]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[26]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[26]),
        .O(rx_shift[26]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[27]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[27]),
        .O(rx_shift[27]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[28]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[28]),
        .O(rx_shift[28]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[29]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[29]),
        .O(rx_shift[29]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[2]_i_1__0 
       (.I0(state[1]),
        .I1(p_0_in__1[2]),
        .O(rx_shift[2]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[30]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[30]),
        .O(rx_shift[30]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[31]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[31]),
        .O(rx_shift[31]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[32]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[32]),
        .O(rx_shift[32]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[33]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[33]),
        .O(rx_shift[33]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[34]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[34]),
        .O(rx_shift[34]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[35]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[35]),
        .O(rx_shift[35]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[36]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[36]),
        .O(rx_shift[36]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[37]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[37]),
        .O(rx_shift[37]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[38]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[38]),
        .O(rx_shift[38]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[39]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[39]),
        .O(rx_shift[39]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[3]_i_1__0 
       (.I0(state[1]),
        .I1(p_0_in__1[3]),
        .O(rx_shift[3]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[40]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[40]),
        .O(rx_shift[40]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[41]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[41]),
        .O(rx_shift[41]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[42]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[42]),
        .O(rx_shift[42]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[43]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[43]),
        .O(rx_shift[43]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[44]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[44]),
        .O(rx_shift[44]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[45]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[45]),
        .O(rx_shift[45]));
  LUT6 #(
    .INIT(64'h4444444055555555)) 
    \rx_shift[46]_i_1 
       (.I0(state[0]),
        .I1(\rx_shift[46]_i_3_n_0 ),
        .I2(\bit_count_reg_n_0_[5] ),
        .I3(\bit_count_reg_n_0_[4] ),
        .I4(\bit_count_reg_n_0_[3] ),
        .I5(\rx_shift[46]_i_4_n_0 ),
        .O(\rx_shift[46]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[46]_i_2 
       (.I0(state[1]),
        .I1(p_0_in__1[46]),
        .O(rx_shift[46]));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    \rx_shift[46]_i_3 
       (.I0(\div_counter_reg_n_0_[2] ),
        .I1(\div_counter_reg_n_0_[4] ),
        .I2(\div_counter_reg_n_0_[3] ),
        .I3(\div_counter_reg_n_0_[0] ),
        .I4(\div_counter_reg_n_0_[1] ),
        .I5(state[1]),
        .O(\rx_shift[46]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFBFFFFFF)) 
    \rx_shift[46]_i_4 
       (.I0(state[1]),
        .I1(out[3]),
        .I2(out[2]),
        .I3(out[0]),
        .I4(out[1]),
        .O(\rx_shift[46]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[4]_i_1__0 
       (.I0(state[1]),
        .I1(p_0_in__1[4]),
        .O(rx_shift[4]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[5]_i_1__0 
       (.I0(state[1]),
        .I1(p_0_in__1[5]),
        .O(rx_shift[5]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[6]_i_1__0 
       (.I0(state[1]),
        .I1(p_0_in__1[6]),
        .O(rx_shift[6]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[7]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[7]),
        .O(rx_shift[7]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[8]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[8]),
        .O(rx_shift[8]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[9]_i_1 
       (.I0(state[1]),
        .I1(p_0_in__1[9]),
        .O(rx_shift[9]));
  FDCE \rx_shift_reg[0] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[0]),
        .Q(p_0_in__1[1]));
  FDCE \rx_shift_reg[10] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[10]),
        .Q(p_0_in__1[11]));
  FDCE \rx_shift_reg[11] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[11]),
        .Q(p_0_in__1[12]));
  FDCE \rx_shift_reg[12] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[12]),
        .Q(p_0_in__1[13]));
  FDCE \rx_shift_reg[13] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[13]),
        .Q(p_0_in__1[14]));
  FDCE \rx_shift_reg[14] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[14]),
        .Q(p_0_in__1[15]));
  FDCE \rx_shift_reg[15] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[15]),
        .Q(p_0_in__1[16]));
  FDCE \rx_shift_reg[16] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[16]),
        .Q(p_0_in__1[17]));
  FDCE \rx_shift_reg[17] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[17]),
        .Q(p_0_in__1[18]));
  FDCE \rx_shift_reg[18] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[18]),
        .Q(p_0_in__1[19]));
  FDCE \rx_shift_reg[19] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[19]),
        .Q(p_0_in__1[20]));
  FDCE \rx_shift_reg[1] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[1]),
        .Q(p_0_in__1[2]));
  FDCE \rx_shift_reg[20] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[20]),
        .Q(p_0_in__1[21]));
  FDCE \rx_shift_reg[21] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[21]),
        .Q(p_0_in__1[22]));
  FDCE \rx_shift_reg[22] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[22]),
        .Q(p_0_in__1[23]));
  FDCE \rx_shift_reg[23] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[23]),
        .Q(p_0_in__1[24]));
  FDCE \rx_shift_reg[24] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[24]),
        .Q(p_0_in__1[25]));
  FDCE \rx_shift_reg[25] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[25]),
        .Q(p_0_in__1[26]));
  FDCE \rx_shift_reg[26] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[26]),
        .Q(p_0_in__1[27]));
  FDCE \rx_shift_reg[27] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[27]),
        .Q(p_0_in__1[28]));
  FDCE \rx_shift_reg[28] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[28]),
        .Q(p_0_in__1[29]));
  FDCE \rx_shift_reg[29] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[29]),
        .Q(p_0_in__1[30]));
  FDCE \rx_shift_reg[2] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[2]),
        .Q(p_0_in__1[3]));
  FDCE \rx_shift_reg[30] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[30]),
        .Q(p_0_in__1[31]));
  FDCE \rx_shift_reg[31] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[31]),
        .Q(p_0_in__1[32]));
  FDCE \rx_shift_reg[32] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[32]),
        .Q(p_0_in__1[33]));
  FDCE \rx_shift_reg[33] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[33]),
        .Q(p_0_in__1[34]));
  FDCE \rx_shift_reg[34] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[34]),
        .Q(p_0_in__1[35]));
  FDCE \rx_shift_reg[35] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[35]),
        .Q(p_0_in__1[36]));
  FDCE \rx_shift_reg[36] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[36]),
        .Q(p_0_in__1[37]));
  FDCE \rx_shift_reg[37] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[37]),
        .Q(p_0_in__1[38]));
  FDCE \rx_shift_reg[38] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[38]),
        .Q(p_0_in__1[39]));
  FDCE \rx_shift_reg[39] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[39]),
        .Q(p_0_in__1[40]));
  FDCE \rx_shift_reg[3] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[3]),
        .Q(p_0_in__1[4]));
  FDCE \rx_shift_reg[40] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[40]),
        .Q(p_0_in__1[41]));
  FDCE \rx_shift_reg[41] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[41]),
        .Q(p_0_in__1[42]));
  FDCE \rx_shift_reg[42] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[42]),
        .Q(p_0_in__1[43]));
  FDCE \rx_shift_reg[43] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[43]),
        .Q(p_0_in__1[44]));
  FDCE \rx_shift_reg[44] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[44]),
        .Q(p_0_in__1[45]));
  FDCE \rx_shift_reg[45] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[45]),
        .Q(p_0_in__1[46]));
  FDCE \rx_shift_reg[46] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[46]),
        .Q(p_0_in__1[47]));
  FDCE \rx_shift_reg[4] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[4]),
        .Q(p_0_in__1[5]));
  FDCE \rx_shift_reg[5] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[5]),
        .Q(p_0_in__1[6]));
  FDCE \rx_shift_reg[6] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[6]),
        .Q(p_0_in__1[7]));
  FDCE \rx_shift_reg[7] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[7]),
        .Q(p_0_in__1[8]));
  FDCE \rx_shift_reg[8] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[8]),
        .Q(p_0_in__1[9]));
  FDCE \rx_shift_reg[9] 
       (.C(clk),
        .CE(\rx_shift[46]_i_1_n_0 ),
        .CLR(s_axi_aresetn),
        .D(rx_shift[9]),
        .Q(p_0_in__1[10]));
  LUT5 #(
    .INIT(32'h0008FFFF)) 
    \state[0]_i_18 
       (.I0(burst_done),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .O(done_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    xyz_valid_i_1
       (.I0(burst_done),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[2]),
        .I4(out[3]),
        .O(done_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[0]_i_1 
       (.I0(\read_data_reg_n_0_[44] ),
        .I1(burst_done),
        .I2(xyz_x[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[10]_i_1 
       (.I0(\read_data_reg_n_0_[38] ),
        .I1(burst_done),
        .I2(xyz_x[10]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[11]_i_1 
       (.I0(decoded_x0),
        .I1(burst_done),
        .I2(xyz_x[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[12]_i_1 
       (.I0(decoded_x0),
        .I1(burst_done),
        .I2(xyz_x[12]),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[13]_i_1 
       (.I0(decoded_x0),
        .I1(burst_done),
        .I2(xyz_x[13]),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[14]_i_1 
       (.I0(decoded_x0),
        .I1(burst_done),
        .I2(xyz_x[14]),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[15]_i_2 
       (.I0(decoded_x0),
        .I1(burst_done),
        .I2(xyz_x[15]),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[1]_i_1 
       (.I0(\read_data_reg_n_0_[45] ),
        .I1(burst_done),
        .I2(xyz_x[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[2]_i_1 
       (.I0(\read_data_reg_n_0_[46] ),
        .I1(burst_done),
        .I2(xyz_x[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[3]_i_1 
       (.I0(\read_data_reg_n_0_[47] ),
        .I1(burst_done),
        .I2(xyz_x[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[4]_i_1 
       (.I0(\read_data_reg_n_0_[32] ),
        .I1(burst_done),
        .I2(xyz_x[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[5]_i_1 
       (.I0(\read_data_reg_n_0_[33] ),
        .I1(burst_done),
        .I2(xyz_x[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[6]_i_1 
       (.I0(\read_data_reg_n_0_[34] ),
        .I1(burst_done),
        .I2(xyz_x[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[7]_i_1 
       (.I0(\read_data_reg_n_0_[35] ),
        .I1(burst_done),
        .I2(xyz_x[7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[8]_i_1 
       (.I0(\read_data_reg_n_0_[36] ),
        .I1(burst_done),
        .I2(xyz_x[8]),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_x[9]_i_1 
       (.I0(\read_data_reg_n_0_[37] ),
        .I1(burst_done),
        .I2(xyz_x[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[0]_i_1 
       (.I0(\read_data_reg_n_0_[28] ),
        .I1(burst_done),
        .I2(xyz_y[0]),
        .O(\read_data_reg[23]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[10]_i_1 
       (.I0(\read_data_reg_n_0_[22] ),
        .I1(burst_done),
        .I2(xyz_y[10]),
        .O(\read_data_reg[23]_0 [10]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[11]_i_1 
       (.I0(decoded_y0),
        .I1(burst_done),
        .I2(xyz_y[11]),
        .O(\read_data_reg[23]_0 [11]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[12]_i_1 
       (.I0(decoded_y0),
        .I1(burst_done),
        .I2(xyz_y[12]),
        .O(\read_data_reg[23]_0 [12]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[13]_i_1 
       (.I0(decoded_y0),
        .I1(burst_done),
        .I2(xyz_y[13]),
        .O(\read_data_reg[23]_0 [13]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[14]_i_1 
       (.I0(decoded_y0),
        .I1(burst_done),
        .I2(xyz_y[14]),
        .O(\read_data_reg[23]_0 [14]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[15]_i_1 
       (.I0(decoded_y0),
        .I1(burst_done),
        .I2(xyz_y[15]),
        .O(\read_data_reg[23]_0 [15]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[1]_i_1 
       (.I0(\read_data_reg_n_0_[29] ),
        .I1(burst_done),
        .I2(xyz_y[1]),
        .O(\read_data_reg[23]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[2]_i_1 
       (.I0(\read_data_reg_n_0_[30] ),
        .I1(burst_done),
        .I2(xyz_y[2]),
        .O(\read_data_reg[23]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[3]_i_1 
       (.I0(\read_data_reg_n_0_[31] ),
        .I1(burst_done),
        .I2(xyz_y[3]),
        .O(\read_data_reg[23]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[4]_i_1 
       (.I0(\read_data_reg_n_0_[16] ),
        .I1(burst_done),
        .I2(xyz_y[4]),
        .O(\read_data_reg[23]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[5]_i_1 
       (.I0(\read_data_reg_n_0_[17] ),
        .I1(burst_done),
        .I2(xyz_y[5]),
        .O(\read_data_reg[23]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[6]_i_1 
       (.I0(\read_data_reg_n_0_[18] ),
        .I1(burst_done),
        .I2(xyz_y[6]),
        .O(\read_data_reg[23]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[7]_i_1 
       (.I0(\read_data_reg_n_0_[19] ),
        .I1(burst_done),
        .I2(xyz_y[7]),
        .O(\read_data_reg[23]_0 [7]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[8]_i_1 
       (.I0(\read_data_reg_n_0_[20] ),
        .I1(burst_done),
        .I2(xyz_y[8]),
        .O(\read_data_reg[23]_0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_y[9]_i_1 
       (.I0(\read_data_reg_n_0_[21] ),
        .I1(burst_done),
        .I2(xyz_y[9]),
        .O(\read_data_reg[23]_0 [9]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[0]_i_1 
       (.I0(\read_data_reg_n_0_[12] ),
        .I1(burst_done),
        .I2(xyz_z[0]),
        .O(\read_data_reg[7]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[10]_i_1 
       (.I0(\read_data_reg_n_0_[6] ),
        .I1(burst_done),
        .I2(xyz_z[10]),
        .O(\read_data_reg[7]_0 [10]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[11]_i_1 
       (.I0(decoded_z0),
        .I1(burst_done),
        .I2(xyz_z[11]),
        .O(\read_data_reg[7]_0 [11]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[12]_i_1 
       (.I0(decoded_z0),
        .I1(burst_done),
        .I2(xyz_z[12]),
        .O(\read_data_reg[7]_0 [12]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[13]_i_1 
       (.I0(decoded_z0),
        .I1(burst_done),
        .I2(xyz_z[13]),
        .O(\read_data_reg[7]_0 [13]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[14]_i_1 
       (.I0(decoded_z0),
        .I1(burst_done),
        .I2(xyz_z[14]),
        .O(\read_data_reg[7]_0 [14]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[15]_i_1 
       (.I0(decoded_z0),
        .I1(burst_done),
        .I2(xyz_z[15]),
        .O(\read_data_reg[7]_0 [15]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[1]_i_1 
       (.I0(\read_data_reg_n_0_[13] ),
        .I1(burst_done),
        .I2(xyz_z[1]),
        .O(\read_data_reg[7]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[2]_i_1 
       (.I0(\read_data_reg_n_0_[14] ),
        .I1(burst_done),
        .I2(xyz_z[2]),
        .O(\read_data_reg[7]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[3]_i_1 
       (.I0(\read_data_reg_n_0_[15] ),
        .I1(burst_done),
        .I2(xyz_z[3]),
        .O(\read_data_reg[7]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[4]_i_1 
       (.I0(\read_data_reg_n_0_[0] ),
        .I1(burst_done),
        .I2(xyz_z[4]),
        .O(\read_data_reg[7]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[5]_i_1 
       (.I0(\read_data_reg_n_0_[1] ),
        .I1(burst_done),
        .I2(xyz_z[5]),
        .O(\read_data_reg[7]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[6]_i_1 
       (.I0(\read_data_reg_n_0_[2] ),
        .I1(burst_done),
        .I2(xyz_z[6]),
        .O(\read_data_reg[7]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[7]_i_1 
       (.I0(\read_data_reg_n_0_[3] ),
        .I1(burst_done),
        .I2(xyz_z[7]),
        .O(\read_data_reg[7]_0 [7]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[8]_i_1 
       (.I0(\read_data_reg_n_0_[4] ),
        .I1(burst_done),
        .I2(xyz_z[8]),
        .O(\read_data_reg[7]_0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \xyz_z[9]_i_1 
       (.I0(\read_data_reg_n_0_[5] ),
        .I1(burst_done),
        .I2(xyz_z[9]),
        .O(\read_data_reg[7]_0 [9]));
endmodule

(* ORIG_REF_NAME = "lis3dh_spi_controller" *) 
module design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_controller
   (sensor_overrun_reg,
    \state_reg[3] ,
    lis3dh_mosi,
    lis3dh_sclk,
    lis3dh_cs_n,
    \state_reg[0] ,
    \state_reg[1] ,
    E,
    D,
    \wait_count_reg[15] ,
    \wait_count_reg[11] ,
    \wait_count_reg[18] ,
    \wait_count_reg[31] ,
    \wait_count_reg[22] ,
    \wait_count_reg[15]_0 ,
    \wait_count_reg[16] ,
    \wait_count_reg[2] ,
    \wait_count_reg[21] ,
    \wait_count_reg[24] ,
    \wait_count_reg[27] ,
    \read_data_reg[7]_0 ,
    clk,
    lis3dh_cs_n_reg_0,
    sensor_overrun,
    in0,
    out,
    burst_mosi,
    burst_sclk,
    burst_cs_n,
    error,
    Q,
    \wait_count[31]_i_4 ,
    \state[0]_i_5_0 ,
    lis3dh_miso,
    who_am_i_data);
  output sensor_overrun_reg;
  output \state_reg[3] ;
  output lis3dh_mosi;
  output lis3dh_sclk;
  output lis3dh_cs_n;
  output \state_reg[0] ;
  output \state_reg[1] ;
  output [0:0]E;
  output [3:0]D;
  output \wait_count_reg[15] ;
  output \wait_count_reg[11] ;
  output \wait_count_reg[18] ;
  output \wait_count_reg[31] ;
  output \wait_count_reg[22] ;
  output \wait_count_reg[15]_0 ;
  output \wait_count_reg[16] ;
  output \wait_count_reg[2] ;
  output \wait_count_reg[21] ;
  output \wait_count_reg[24] ;
  output \wait_count_reg[27] ;
  output [7:0]\read_data_reg[7]_0 ;
  input clk;
  input lis3dh_cs_n_reg_0;
  input sensor_overrun;
  input in0;
  input [3:0]out;
  input burst_mosi;
  input burst_sclk;
  input burst_cs_n;
  input error;
  input [3:0]Q;
  input [31:0]\wait_count[31]_i_4 ;
  input \state[0]_i_5_0 ;
  input lis3dh_miso;
  input [7:0]who_am_i_data;

  wire [3:0]D;
  wire [0:0]E;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_2_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_2_n_0 ;
  wire \FSM_onehot_state[3]_i_4_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire [3:0]Q;
  wire [4:0]bit_count;
  wire \bit_count[1]_i_1_n_0 ;
  wire \bit_count[4]_i_1_n_0 ;
  wire \bit_count[4]_i_3_n_0 ;
  wire \bit_count[4]_i_4_n_0 ;
  wire \bit_count_reg_n_0_[0] ;
  wire \bit_count_reg_n_0_[1] ;
  wire \bit_count_reg_n_0_[2] ;
  wire \bit_count_reg_n_0_[3] ;
  wire \bit_count_reg_n_0_[4] ;
  wire burst_cs_n;
  wire burst_mosi;
  wire burst_sclk;
  wire clk;
  wire [4:0]div_counter;
  wire \div_counter[4]_i_2_n_0 ;
  wire \div_counter_reg_n_0_[0] ;
  wire \div_counter_reg_n_0_[1] ;
  wire \div_counter_reg_n_0_[2] ;
  wire \div_counter_reg_n_0_[3] ;
  wire \div_counter_reg_n_0_[4] ;
  wire done_i_1_n_0;
  wire error;
  wire in0;
  wire [7:1]in10;
  wire [15:1]in9;
  wire lis3dh_cs_n;
  wire lis3dh_cs_n_i_1_n_0;
  wire lis3dh_cs_n_i_2_n_0;
  wire lis3dh_cs_n_reg_0;
  wire lis3dh_miso;
  wire lis3dh_mosi;
  wire lis3dh_mosi_i_1_n_0;
  wire lis3dh_sclk;
  wire lis3dh_sclk_i_1_n_0;
  wire [3:0]out;
  wire p_0_in;
  wire \read_data[7]_i_1_n_0 ;
  wire [7:0]\read_data_reg[7]_0 ;
  wire [6:0]rx_shift;
  wire \rx_shift[6]_i_1_n_0 ;
  wire sensor_overrun;
  wire sensor_overrun_i_3_n_0;
  wire sensor_overrun_reg;
  wire single_cs_n;
  wire [7:0]single_data;
  wire single_done;
  wire single_mosi;
  wire single_sclk;
  wire \state[0]_i_11_n_0 ;
  wire \state[0]_i_14_n_0 ;
  wire \state[0]_i_15_n_0 ;
  wire \state[0]_i_16_n_0 ;
  wire \state[0]_i_17_n_0 ;
  wire \state[0]_i_2_n_0 ;
  wire \state[0]_i_3_n_0 ;
  wire \state[0]_i_4_n_0 ;
  wire \state[0]_i_5_0 ;
  wire \state[0]_i_5_n_0 ;
  wire \state[0]_i_6_n_0 ;
  wire \state[0]_i_7_n_0 ;
  wire \state[0]_i_8_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[1]_i_3_n_0 ;
  wire \state[1]_i_4_n_0 ;
  wire \state[1]_i_5_n_0 ;
  wire \state[1]_i_7_n_0 ;
  wire \state[1]_i_8_n_0 ;
  wire \state[2]_i_4_n_0 ;
  wire \state[2]_i_5_n_0 ;
  wire \state[3]_i_10_n_0 ;
  wire \state[3]_i_11_n_0 ;
  wire \state[3]_i_12_n_0 ;
  wire \state[3]_i_3_n_0 ;
  wire \state[3]_i_4_n_0 ;
  wire \state[3]_i_5_n_0 ;
  wire \state[3]_i_7_n_0 ;
  wire \state[3]_i_8_n_0 ;
  wire \state_reg[0] ;
  wire \state_reg[1] ;
  wire \state_reg[3] ;
  wire [15:0]tx_shift;
  wire \tx_shift[10]_i_2_n_0 ;
  wire \tx_shift[10]_i_3_n_0 ;
  wire \tx_shift[13]_i_2_n_0 ;
  wire \tx_shift[15]_i_1_n_0 ;
  wire \tx_shift[15]_i_3_n_0 ;
  wire \tx_shift[9]_i_2_n_0 ;
  wire [31:0]\wait_count[31]_i_4 ;
  wire \wait_count_reg[11] ;
  wire \wait_count_reg[15] ;
  wire \wait_count_reg[15]_0 ;
  wire \wait_count_reg[16] ;
  wire \wait_count_reg[18] ;
  wire \wait_count_reg[21] ;
  wire \wait_count_reg[22] ;
  wire \wait_count_reg[24] ;
  wire \wait_count_reg[27] ;
  wire \wait_count_reg[2] ;
  wire \wait_count_reg[31] ;
  wire [7:0]who_am_i_data;

  LUT3 #(
    .INIT(8'hBA)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_state[1]_i_2_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \FSM_onehot_state[1]_i_2 
       (.I0(\bit_count_reg_n_0_[4] ),
        .I1(\bit_count_reg_n_0_[3] ),
        .I2(\bit_count_reg_n_0_[1] ),
        .I3(\bit_count_reg_n_0_[0] ),
        .I4(\bit_count_reg_n_0_[2] ),
        .O(\FSM_onehot_state[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hAFAE)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\rx_shift[6]_i_1_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state[3]_i_4_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \FSM_onehot_state[3]_i_2 
       (.I0(\bit_count_reg_n_0_[2] ),
        .I1(\bit_count_reg_n_0_[0] ),
        .I2(\bit_count_reg_n_0_[1] ),
        .I3(\bit_count_reg_n_0_[3] ),
        .I4(\bit_count_reg_n_0_[4] ),
        .I5(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\FSM_onehot_state[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFF7)) 
    \FSM_onehot_state[3]_i_4 
       (.I0(\div_counter_reg_n_0_[3] ),
        .I1(\div_counter_reg_n_0_[4] ),
        .I2(\div_counter_reg_n_0_[2] ),
        .I3(\div_counter_reg_n_0_[1] ),
        .I4(\div_counter_reg_n_0_[0] ),
        .O(\FSM_onehot_state[3]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "STATE_IDLE:0001,STATE_SAMPLE_RISE:0100,STATE_DRIVE_FALL:0010,STATE_CS_HOLD:1000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(\FSM_onehot_state[3]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .PRE(lis3dh_cs_n_reg_0),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "STATE_IDLE:0001,STATE_SAMPLE_RISE:0100,STATE_DRIVE_FALL:0010,STATE_CS_HOLD:1000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(\FSM_onehot_state[3]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "STATE_IDLE:0001,STATE_SAMPLE_RISE:0100,STATE_DRIVE_FALL:0010,STATE_CS_HOLD:1000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(\FSM_onehot_state[3]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(\FSM_onehot_state_reg_n_0_[1] ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "STATE_IDLE:0001,STATE_SAMPLE_RISE:0100,STATE_DRIVE_FALL:0010,STATE_CS_HOLD:1000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk),
        .CE(\FSM_onehot_state[3]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(\FSM_onehot_state[3]_i_2_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \bit_count[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\bit_count_reg_n_0_[0] ),
        .O(bit_count[0]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \bit_count[1]_i_1 
       (.I0(\bit_count_reg_n_0_[1] ),
        .I1(\bit_count_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\bit_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \bit_count[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\bit_count_reg_n_0_[0] ),
        .I2(\bit_count_reg_n_0_[1] ),
        .I3(\bit_count_reg_n_0_[2] ),
        .O(bit_count[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \bit_count[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\bit_count_reg_n_0_[1] ),
        .I2(\bit_count_reg_n_0_[0] ),
        .I3(\bit_count_reg_n_0_[2] ),
        .I4(\bit_count_reg_n_0_[3] ),
        .O(bit_count[3]));
  LUT3 #(
    .INIT(8'hBA)) 
    \bit_count[4]_i_1 
       (.I0(\bit_count[4]_i_3_n_0 ),
        .I1(\FSM_onehot_state[1]_i_2_n_0 ),
        .I2(\bit_count[4]_i_4_n_0 ),
        .O(\bit_count[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \bit_count[4]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\bit_count_reg_n_0_[2] ),
        .I2(\bit_count_reg_n_0_[0] ),
        .I3(\bit_count_reg_n_0_[1] ),
        .I4(\bit_count_reg_n_0_[3] ),
        .I5(\bit_count_reg_n_0_[4] ),
        .O(bit_count[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h17000000)) 
    \bit_count[4]_i_3 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[2]),
        .I3(out[0]),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\bit_count[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \bit_count[4]_i_4 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\div_counter_reg_n_0_[0] ),
        .I2(\div_counter_reg_n_0_[1] ),
        .I3(\div_counter_reg_n_0_[2] ),
        .I4(\div_counter_reg_n_0_[4] ),
        .I5(\div_counter_reg_n_0_[3] ),
        .O(\bit_count[4]_i_4_n_0 ));
  FDCE \bit_count_reg[0] 
       (.C(clk),
        .CE(\bit_count[4]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(bit_count[0]),
        .Q(\bit_count_reg_n_0_[0] ));
  FDCE \bit_count_reg[1] 
       (.C(clk),
        .CE(\bit_count[4]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(\bit_count[1]_i_1_n_0 ),
        .Q(\bit_count_reg_n_0_[1] ));
  FDCE \bit_count_reg[2] 
       (.C(clk),
        .CE(\bit_count[4]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(bit_count[2]),
        .Q(\bit_count_reg_n_0_[2] ));
  FDCE \bit_count_reg[3] 
       (.C(clk),
        .CE(\bit_count[4]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(bit_count[3]),
        .Q(\bit_count_reg_n_0_[3] ));
  FDCE \bit_count_reg[4] 
       (.C(clk),
        .CE(\bit_count[4]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(bit_count[4]),
        .Q(\bit_count_reg_n_0_[4] ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000FE00)) 
    \div_counter[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_state[3]_i_4_n_0 ),
        .I4(\div_counter_reg_n_0_[0] ),
        .O(div_counter[0]));
  LUT5 #(
    .INIT(32'h66666660)) 
    \div_counter[1]_i_1 
       (.I0(\div_counter_reg_n_0_[1] ),
        .I1(\div_counter_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(\FSM_onehot_state_reg_n_0_[3] ),
        .O(div_counter[1]));
  LUT6 #(
    .INIT(64'h7878787878787800)) 
    \div_counter[2]_i_1 
       (.I0(\div_counter_reg_n_0_[0] ),
        .I1(\div_counter_reg_n_0_[1] ),
        .I2(\div_counter_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .I5(\FSM_onehot_state_reg_n_0_[3] ),
        .O(div_counter[2]));
  LUT6 #(
    .INIT(64'h0555555150000000)) 
    \div_counter[3]_i_1 
       (.I0(\div_counter[4]_i_2_n_0 ),
        .I1(\div_counter_reg_n_0_[4] ),
        .I2(\div_counter_reg_n_0_[2] ),
        .I3(\div_counter_reg_n_0_[1] ),
        .I4(\div_counter_reg_n_0_[0] ),
        .I5(\div_counter_reg_n_0_[3] ),
        .O(div_counter[3]));
  LUT6 #(
    .INIT(64'h1555555140000000)) 
    \div_counter[4]_i_1 
       (.I0(\div_counter[4]_i_2_n_0 ),
        .I1(\div_counter_reg_n_0_[3] ),
        .I2(\div_counter_reg_n_0_[0] ),
        .I3(\div_counter_reg_n_0_[1] ),
        .I4(\div_counter_reg_n_0_[2] ),
        .I5(\div_counter_reg_n_0_[4] ),
        .O(div_counter[4]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \div_counter[4]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\div_counter[4]_i_2_n_0 ));
  FDCE \div_counter_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(lis3dh_cs_n_reg_0),
        .D(div_counter[0]),
        .Q(\div_counter_reg_n_0_[0] ));
  FDCE \div_counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(lis3dh_cs_n_reg_0),
        .D(div_counter[1]),
        .Q(\div_counter_reg_n_0_[1] ));
  FDCE \div_counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(lis3dh_cs_n_reg_0),
        .D(div_counter[2]),
        .Q(\div_counter_reg_n_0_[2] ));
  FDCE \div_counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(lis3dh_cs_n_reg_0),
        .D(div_counter[3]),
        .Q(\div_counter_reg_n_0_[3] ));
  FDCE \div_counter_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(lis3dh_cs_n_reg_0),
        .D(div_counter[4]),
        .Q(\div_counter_reg_n_0_[4] ));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    done_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\div_counter_reg_n_0_[0] ),
        .I2(\div_counter_reg_n_0_[1] ),
        .I3(\div_counter_reg_n_0_[2] ),
        .I4(\div_counter_reg_n_0_[4] ),
        .I5(\div_counter_reg_n_0_[3] ),
        .O(done_i_1_n_0));
  FDCE done_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(lis3dh_cs_n_reg_0),
        .D(done_i_1_n_0),
        .Q(single_done));
  LUT6 #(
    .INIT(64'hFFFFFFFFC0000008)) 
    error_i_1
       (.I0(\state[3]_i_3_n_0 ),
        .I1(out[1]),
        .I2(out[0]),
        .I3(out[3]),
        .I4(out[2]),
        .I5(error),
        .O(\state_reg[1] ));
  LUT6 #(
    .INIT(64'hABEAAAAAA82AAAAA)) 
    lis3dh_cs_n_INST_0
       (.I0(single_cs_n),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[2]),
        .I4(out[3]),
        .I5(burst_cs_n),
        .O(lis3dh_cs_n));
  LUT6 #(
    .INIT(64'hFFFFFDFFFFFFFD00)) 
    lis3dh_cs_n_i_1
       (.I0(lis3dh_cs_n_i_2_n_0),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(done_i_1_n_0),
        .I5(single_cs_n),
        .O(lis3dh_cs_n_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h022A)) 
    lis3dh_cs_n_i_2
       (.I0(out[0]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[3]),
        .O(lis3dh_cs_n_i_2_n_0));
  FDPE lis3dh_cs_n_reg
       (.C(clk),
        .CE(1'b1),
        .D(lis3dh_cs_n_i_1_n_0),
        .PRE(lis3dh_cs_n_reg_0),
        .Q(single_cs_n));
  LUT6 #(
    .INIT(64'hABEAAAAAA82AAAAA)) 
    lis3dh_mosi_INST_0
       (.I0(single_mosi),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[2]),
        .I4(out[3]),
        .I5(burst_mosi),
        .O(lis3dh_mosi));
  LUT6 #(
    .INIT(64'hB3A0B3A380A080A0)) 
    lis3dh_mosi_i_1
       (.I0(p_0_in),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_state[3]_i_4_n_0 ),
        .I4(\FSM_onehot_state_reg_n_0_[3] ),
        .I5(single_mosi),
        .O(lis3dh_mosi_i_1_n_0));
  FDCE lis3dh_mosi_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(lis3dh_cs_n_reg_0),
        .D(lis3dh_mosi_i_1_n_0),
        .Q(single_mosi));
  LUT6 #(
    .INIT(64'hABEAAAAAA82AAAAA)) 
    lis3dh_sclk_INST_0
       (.I0(single_sclk),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[2]),
        .I4(out[3]),
        .I5(burst_sclk),
        .O(lis3dh_sclk));
  LUT6 #(
    .INIT(64'hFFFFFFFDCFCFCFCC)) 
    lis3dh_sclk_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state[3]_i_4_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .I5(single_sclk),
        .O(lis3dh_sclk_i_1_n_0));
  FDPE lis3dh_sclk_reg
       (.C(clk),
        .CE(1'b1),
        .D(lis3dh_sclk_i_1_n_0),
        .PRE(lis3dh_cs_n_reg_0),
        .Q(single_sclk));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \read_data[7]_i_1 
       (.I0(\bit_count_reg_n_0_[2] ),
        .I1(\bit_count_reg_n_0_[0] ),
        .I2(\bit_count_reg_n_0_[1] ),
        .I3(\bit_count_reg_n_0_[3] ),
        .I4(\bit_count_reg_n_0_[4] ),
        .I5(\bit_count[4]_i_4_n_0 ),
        .O(\read_data[7]_i_1_n_0 ));
  FDCE \read_data_reg[0] 
       (.C(clk),
        .CE(\read_data[7]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(lis3dh_miso),
        .Q(single_data[0]));
  FDCE \read_data_reg[1] 
       (.C(clk),
        .CE(\read_data[7]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(in10[1]),
        .Q(single_data[1]));
  FDCE \read_data_reg[2] 
       (.C(clk),
        .CE(\read_data[7]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(in10[2]),
        .Q(single_data[2]));
  FDCE \read_data_reg[3] 
       (.C(clk),
        .CE(\read_data[7]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(in10[3]),
        .Q(single_data[3]));
  FDCE \read_data_reg[4] 
       (.C(clk),
        .CE(\read_data[7]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(in10[4]),
        .Q(single_data[4]));
  FDCE \read_data_reg[5] 
       (.C(clk),
        .CE(\read_data[7]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(in10[5]),
        .Q(single_data[5]));
  FDCE \read_data_reg[6] 
       (.C(clk),
        .CE(\read_data[7]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(in10[6]),
        .Q(single_data[6]));
  FDCE \read_data_reg[7] 
       (.C(clk),
        .CE(\read_data[7]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(in10[7]),
        .Q(single_data[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(lis3dh_miso),
        .O(rx_shift[0]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[1]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(in10[1]),
        .O(rx_shift[1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(in10[2]),
        .O(rx_shift[2]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(in10[3]),
        .O(rx_shift[3]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[4]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(in10[4]),
        .O(rx_shift[4]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[5]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(in10[5]),
        .O(rx_shift[5]));
  LUT6 #(
    .INIT(64'hAAAAAAEAAAEAEAEA)) 
    \rx_shift[6]_i_1 
       (.I0(\bit_count[4]_i_4_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(out[0]),
        .I3(out[2]),
        .I4(out[1]),
        .I5(out[3]),
        .O(\rx_shift[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rx_shift[6]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(in10[6]),
        .O(rx_shift[6]));
  FDCE \rx_shift_reg[0] 
       (.C(clk),
        .CE(\rx_shift[6]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(rx_shift[0]),
        .Q(in10[1]));
  FDCE \rx_shift_reg[1] 
       (.C(clk),
        .CE(\rx_shift[6]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(rx_shift[1]),
        .Q(in10[2]));
  FDCE \rx_shift_reg[2] 
       (.C(clk),
        .CE(\rx_shift[6]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(rx_shift[2]),
        .Q(in10[3]));
  FDCE \rx_shift_reg[3] 
       (.C(clk),
        .CE(\rx_shift[6]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(rx_shift[3]),
        .Q(in10[4]));
  FDCE \rx_shift_reg[4] 
       (.C(clk),
        .CE(\rx_shift[6]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(rx_shift[4]),
        .Q(in10[5]));
  FDCE \rx_shift_reg[5] 
       (.C(clk),
        .CE(\rx_shift[6]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(rx_shift[5]),
        .Q(in10[6]));
  FDCE \rx_shift_reg[6] 
       (.C(clk),
        .CE(\rx_shift[6]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(rx_shift[6]),
        .Q(in10[7]));
  LUT6 #(
    .INIT(64'hFFFFEAFF0000EA00)) 
    sensor_overrun_i_1
       (.I0(sensor_overrun),
        .I1(single_data[7]),
        .I2(single_done),
        .I3(\state_reg[3] ),
        .I4(sensor_overrun_i_3_n_0),
        .I5(in0),
        .O(sensor_overrun_reg));
  LUT2 #(
    .INIT(4'h2)) 
    sensor_overrun_i_2
       (.I0(out[3]),
        .I1(out[2]),
        .O(\state_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'hB)) 
    sensor_overrun_i_3
       (.I0(out[0]),
        .I1(out[1]),
        .O(sensor_overrun_i_3_n_0));
  LUT6 #(
    .INIT(64'h00000000F8F8FFF8)) 
    \state[0]_i_1 
       (.I0(\wait_count_reg[15] ),
        .I1(\state[0]_i_2_n_0 ),
        .I2(\state[0]_i_3_n_0 ),
        .I3(\state[0]_i_4_n_0 ),
        .I4(Q[2]),
        .I5(\state[0]_i_5_n_0 ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \state[0]_i_10 
       (.I0(\state[3]_i_5_n_0 ),
        .I1(\wait_count[31]_i_4 [22]),
        .I2(\wait_count[31]_i_4 [20]),
        .I3(\wait_count[31]_i_4 [21]),
        .I4(\wait_count[31]_i_4 [23]),
        .O(\wait_count_reg[22] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF7FFFF)) 
    \state[0]_i_11 
       (.I0(\wait_count[31]_i_4 [6]),
        .I1(\wait_count[31]_i_4 [14]),
        .I2(Q[1]),
        .I3(\wait_count[31]_i_4 [7]),
        .I4(\wait_count[31]_i_4 [15]),
        .I5(\state[0]_i_17_n_0 ),
        .O(\state[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[0]_i_12 
       (.I0(\wait_count[31]_i_4 [11]),
        .I1(\wait_count[31]_i_4 [10]),
        .I2(\wait_count[31]_i_4 [13]),
        .I3(\wait_count[31]_i_4 [12]),
        .O(\wait_count_reg[11] ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \state[0]_i_13 
       (.I0(\state[3]_i_10_n_0 ),
        .I1(\wait_count[31]_i_4 [18]),
        .I2(\wait_count[31]_i_4 [4]),
        .I3(\wait_count[31]_i_4 [5]),
        .I4(\wait_count[31]_i_4 [19]),
        .O(\wait_count_reg[18] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000080)) 
    \state[0]_i_14 
       (.I0(single_done),
        .I1(single_data[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(\state[0]_i_5_0 ),
        .O(\state[0]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF7)) 
    \state[0]_i_15 
       (.I0(\wait_count[31]_i_4 [4]),
        .I1(\wait_count[31]_i_4 [18]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\wait_count[31]_i_4 [10]),
        .I5(\wait_count[31]_i_4 [11]),
        .O(\state[0]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \state[0]_i_16 
       (.I0(\wait_count[31]_i_4 [7]),
        .I1(\wait_count[31]_i_4 [6]),
        .I2(\wait_count[31]_i_4 [17]),
        .I3(\wait_count[31]_i_4 [5]),
        .O(\state[0]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \state[0]_i_17 
       (.I0(Q[0]),
        .I1(Q[2]),
        .O(\state[0]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \state[0]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hBAAA)) 
    \state[0]_i_3 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(single_done),
        .I3(Q[2]),
        .O(\state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h444444444444444F)) 
    \state[0]_i_4 
       (.I0(\state[0]_i_6_n_0 ),
        .I1(\state[0]_i_7_n_0 ),
        .I2(\state[0]_i_8_n_0 ),
        .I3(\wait_count_reg[16] ),
        .I4(\wait_count_reg[31] ),
        .I5(\wait_count_reg[22] ),
        .O(\state[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFFFFE)) 
    \state[0]_i_5 
       (.I0(\state[0]_i_11_n_0 ),
        .I1(\wait_count_reg[11] ),
        .I2(\wait_count_reg[18] ),
        .I3(\wait_count_reg[31] ),
        .I4(\wait_count_reg[22] ),
        .I5(\state[0]_i_14_n_0 ),
        .O(\state[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \state[0]_i_6 
       (.I0(single_done),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(\state[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \state[0]_i_7 
       (.I0(single_data[0]),
        .I1(single_data[1]),
        .I2(single_data[3]),
        .I3(single_data[2]),
        .I4(\state[3]_i_8_n_0 ),
        .O(\state[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \state[0]_i_8 
       (.I0(\wait_count[31]_i_4 [12]),
        .I1(\wait_count[31]_i_4 [19]),
        .I2(\wait_count[31]_i_4 [9]),
        .I3(\wait_count[31]_i_4 [14]),
        .I4(\state[0]_i_15_n_0 ),
        .O(\state[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \state[0]_i_9 
       (.I0(\wait_count[31]_i_4 [16]),
        .I1(\wait_count[31]_i_4 [13]),
        .I2(\wait_count[31]_i_4 [15]),
        .I3(\wait_count[31]_i_4 [8]),
        .I4(\state[0]_i_16_n_0 ),
        .O(\wait_count_reg[16] ));
  LUT5 #(
    .INIT(32'hB8BBBBB8)) 
    \state[1]_i_1 
       (.I0(\state[1]_i_2_n_0 ),
        .I1(Q[3]),
        .I2(\state[1]_i_3_n_0 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h9C9C989C)) 
    \state[1]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(single_done),
        .I4(single_data[3]),
        .O(\state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFE000000000000)) 
    \state[1]_i_3 
       (.I0(\state[1]_i_4_n_0 ),
        .I1(\state[1]_i_5_n_0 ),
        .I2(\wait_count_reg[31] ),
        .I3(\state[1]_i_7_n_0 ),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\state[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \state[1]_i_4 
       (.I0(\wait_count_reg[2] ),
        .I1(\wait_count[31]_i_4 [10]),
        .I2(\wait_count[31]_i_4 [23]),
        .I3(\wait_count[31]_i_4 [21]),
        .I4(\wait_count[31]_i_4 [20]),
        .O(\state[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFBFFFFF)) 
    \state[1]_i_5 
       (.I0(\state[2]_i_5_n_0 ),
        .I1(\wait_count[31]_i_4 [5]),
        .I2(\wait_count[31]_i_4 [22]),
        .I3(\wait_count[31]_i_4 [15]),
        .I4(\wait_count[31]_i_4 [19]),
        .O(\state[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \state[1]_i_6 
       (.I0(\wait_count[31]_i_4 [31]),
        .I1(\wait_count[31]_i_4 [29]),
        .I2(\wait_count[31]_i_4 [28]),
        .I3(\wait_count[31]_i_4 [27]),
        .I4(\wait_count_reg[24] ),
        .O(\wait_count_reg[31] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF7FFF)) 
    \state[1]_i_7 
       (.I0(\wait_count[31]_i_4 [9]),
        .I1(\wait_count[31]_i_4 [8]),
        .I2(\wait_count[31]_i_4 [11]),
        .I3(\wait_count[31]_i_4 [14]),
        .I4(\state[1]_i_8_n_0 ),
        .I5(\state[3]_i_11_n_0 ),
        .O(\state[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \state[1]_i_8 
       (.I0(\wait_count[31]_i_4 [16]),
        .I1(\wait_count[31]_i_4 [17]),
        .O(\state[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FF000CFFFFA00)) 
    \state[2]_i_1 
       (.I0(\state[3]_i_3_n_0 ),
        .I1(\wait_count_reg[15] ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    \state[2]_i_2 
       (.I0(\state[3]_i_4_n_0 ),
        .I1(\wait_count_reg[21] ),
        .I2(\wait_count[31]_i_4 [15]),
        .I3(\wait_count[31]_i_4 [19]),
        .I4(\wait_count_reg[2] ),
        .I5(\state[2]_i_4_n_0 ),
        .O(\wait_count_reg[15] ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \state[2]_i_3 
       (.I0(\wait_count[31]_i_4 [2]),
        .I1(\wait_count[31]_i_4 [1]),
        .I2(\wait_count[31]_i_4 [0]),
        .I3(\wait_count[31]_i_4 [18]),
        .O(\wait_count_reg[2] ));
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \state[2]_i_4 
       (.I0(\state[2]_i_5_n_0 ),
        .I1(\wait_count[31]_i_4 [23]),
        .I2(\wait_count[31]_i_4 [5]),
        .I3(\wait_count[31]_i_4 [10]),
        .I4(\wait_count[31]_i_4 [22]),
        .O(\state[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \state[2]_i_5 
       (.I0(\wait_count[31]_i_4 [3]),
        .I1(\wait_count[31]_i_4 [4]),
        .I2(\wait_count[31]_i_4 [13]),
        .I3(\wait_count[31]_i_4 [12]),
        .O(\state[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFA00C0000)) 
    \state[3]_i_1 
       (.I0(\wait_count_reg[15]_0 ),
        .I1(\state[3]_i_3_n_0 ),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    \state[3]_i_10 
       (.I0(\wait_count[31]_i_4 [8]),
        .I1(\wait_count[31]_i_4 [9]),
        .I2(\wait_count[31]_i_4 [17]),
        .I3(\wait_count[31]_i_4 [16]),
        .O(\state[3]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \state[3]_i_11 
       (.I0(\wait_count[31]_i_4 [6]),
        .I1(\wait_count[31]_i_4 [7]),
        .O(\state[3]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \state[3]_i_12 
       (.I0(\wait_count[31]_i_4 [22]),
        .I1(\wait_count[31]_i_4 [10]),
        .I2(\wait_count[31]_i_4 [4]),
        .I3(\wait_count[31]_i_4 [18]),
        .O(\state[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \state[3]_i_2 
       (.I0(\state[3]_i_4_n_0 ),
        .I1(\state[3]_i_5_n_0 ),
        .I2(\wait_count_reg[21] ),
        .I3(\wait_count[31]_i_4 [15]),
        .I4(\wait_count[31]_i_4 [19]),
        .I5(\state[3]_i_7_n_0 ),
        .O(\wait_count_reg[15]_0 ));
  LUT6 #(
    .INIT(64'hAAA8AAAAAAAAAAAA)) 
    \state[3]_i_3 
       (.I0(single_done),
        .I1(\state[3]_i_8_n_0 ),
        .I2(single_data[2]),
        .I3(single_data[3]),
        .I4(single_data[1]),
        .I5(single_data[0]),
        .O(\state[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFFFF)) 
    \state[3]_i_4 
       (.I0(\wait_count_reg[24] ),
        .I1(\wait_count_reg[27] ),
        .I2(\state[3]_i_10_n_0 ),
        .I3(\wait_count[31]_i_4 [14]),
        .I4(\wait_count[31]_i_4 [11]),
        .I5(\state[3]_i_11_n_0 ),
        .O(\state[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \state[3]_i_5 
       (.I0(\wait_count[31]_i_4 [2]),
        .I1(\wait_count[31]_i_4 [1]),
        .I2(\wait_count[31]_i_4 [3]),
        .I3(\wait_count[31]_i_4 [0]),
        .O(\state[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \state[3]_i_6 
       (.I0(\wait_count[31]_i_4 [21]),
        .I1(\wait_count[31]_i_4 [20]),
        .O(\wait_count_reg[21] ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \state[3]_i_7 
       (.I0(\wait_count[31]_i_4 [13]),
        .I1(\wait_count[31]_i_4 [5]),
        .I2(\wait_count[31]_i_4 [12]),
        .I3(\wait_count[31]_i_4 [23]),
        .I4(\state[3]_i_12_n_0 ),
        .O(\state[3]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \state[3]_i_8 
       (.I0(single_data[6]),
        .I1(single_data[7]),
        .I2(single_data[5]),
        .I3(single_data[4]),
        .O(\state[3]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[3]_i_9 
       (.I0(\wait_count[31]_i_4 [24]),
        .I1(\wait_count[31]_i_4 [25]),
        .I2(\wait_count[31]_i_4 [30]),
        .I3(\wait_count[31]_i_4 [26]),
        .O(\wait_count_reg[24] ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hA8AAAAAA)) 
    \tx_shift[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(out[2]),
        .I2(out[3]),
        .I3(out[0]),
        .I4(out[1]),
        .O(tx_shift[0]));
  LUT5 #(
    .INIT(32'h888F8888)) 
    \tx_shift[10]_i_1 
       (.I0(in9[10]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\tx_shift[10]_i_2_n_0 ),
        .I3(\tx_shift[10]_i_3_n_0 ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(tx_shift[10]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \tx_shift[10]_i_2 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(out[3]),
        .I3(out[2]),
        .O(\tx_shift[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \tx_shift[10]_i_3 
       (.I0(out[1]),
        .I1(out[3]),
        .I2(out[0]),
        .I3(out[2]),
        .O(\tx_shift[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \tx_shift[11]_i_1 
       (.I0(in9[11]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\tx_shift[13]_i_2_n_0 ),
        .O(tx_shift[11]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tx_shift[12]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(in9[12]),
        .O(tx_shift[12]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \tx_shift[13]_i_1 
       (.I0(in9[13]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\tx_shift[13]_i_2_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .O(tx_shift[13]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFDD7)) 
    \tx_shift[13]_i_2 
       (.I0(out[0]),
        .I1(out[3]),
        .I2(out[1]),
        .I3(out[2]),
        .O(\tx_shift[13]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tx_shift[14]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(in9[14]),
        .O(tx_shift[14]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00080888)) 
    \tx_shift[15]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[1]),
        .I4(out[3]),
        .I5(\tx_shift[15]_i_3_n_0 ),
        .O(\tx_shift[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h888888888F888888)) 
    \tx_shift[15]_i_2 
       (.I0(in9[15]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(out[1]),
        .I3(out[0]),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(out[2]),
        .O(tx_shift[15]));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \tx_shift[15]_i_3 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\div_counter_reg_n_0_[0] ),
        .I2(\div_counter_reg_n_0_[1] ),
        .I3(\div_counter_reg_n_0_[2] ),
        .I4(\div_counter_reg_n_0_[4] ),
        .I5(\div_counter_reg_n_0_[3] ),
        .O(\tx_shift[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \tx_shift[1]_i_1 
       (.I0(tx_shift[0]),
        .I1(in9[1]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .O(tx_shift[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \tx_shift[2]_i_1 
       (.I0(tx_shift[0]),
        .I1(in9[2]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .O(tx_shift[2]));
  LUT6 #(
    .INIT(64'hFFFF000800080008)) 
    \tx_shift[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\state_reg[0] ),
        .I2(out[3]),
        .I3(out[2]),
        .I4(in9[3]),
        .I5(\FSM_onehot_state_reg_n_0_[1] ),
        .O(tx_shift[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \tx_shift[4]_i_1 
       (.I0(tx_shift[0]),
        .I1(in9[4]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .O(tx_shift[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \tx_shift[5]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(in9[5]),
        .O(tx_shift[5]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \tx_shift[6]_i_1 
       (.I0(in9[6]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(tx_shift[0]),
        .O(tx_shift[6]));
  LUT6 #(
    .INIT(64'h888888888888F888)) 
    \tx_shift[7]_i_1 
       (.I0(in9[7]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\state_reg[0] ),
        .I4(out[3]),
        .I5(out[2]),
        .O(tx_shift[7]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \tx_shift[7]_i_2 
       (.I0(out[0]),
        .I1(out[1]),
        .O(\state_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \tx_shift[8]_i_1 
       (.I0(\tx_shift[9]_i_2_n_0 ),
        .I1(in9[8]),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .O(tx_shift[8]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \tx_shift[9]_i_1 
       (.I0(in9[9]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\tx_shift[9]_i_2_n_0 ),
        .O(tx_shift[9]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hAAAAAA2A)) 
    \tx_shift[9]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(out[2]),
        .I2(out[0]),
        .I3(out[3]),
        .I4(out[1]),
        .O(\tx_shift[9]_i_2_n_0 ));
  FDCE \tx_shift_reg[0] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[0]),
        .Q(in9[1]));
  FDCE \tx_shift_reg[10] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[10]),
        .Q(in9[11]));
  FDCE \tx_shift_reg[11] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[11]),
        .Q(in9[12]));
  FDCE \tx_shift_reg[12] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[12]),
        .Q(in9[13]));
  FDCE \tx_shift_reg[13] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[13]),
        .Q(in9[14]));
  FDCE \tx_shift_reg[14] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[14]),
        .Q(in9[15]));
  FDCE \tx_shift_reg[15] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[15]),
        .Q(p_0_in));
  FDCE \tx_shift_reg[1] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[1]),
        .Q(in9[2]));
  FDCE \tx_shift_reg[2] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[2]),
        .Q(in9[3]));
  FDCE \tx_shift_reg[3] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[3]),
        .Q(in9[4]));
  FDCE \tx_shift_reg[4] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[4]),
        .Q(in9[5]));
  FDCE \tx_shift_reg[5] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[5]),
        .Q(in9[6]));
  FDCE \tx_shift_reg[6] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[6]),
        .Q(in9[7]));
  FDCE \tx_shift_reg[7] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[7]),
        .Q(in9[8]));
  FDCE \tx_shift_reg[8] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[8]),
        .Q(in9[9]));
  FDCE \tx_shift_reg[9] 
       (.C(clk),
        .CE(\tx_shift[15]_i_1_n_0 ),
        .CLR(lis3dh_cs_n_reg_0),
        .D(tx_shift[9]),
        .Q(in9[10]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h5040A00F)) 
    \wait_count[31]_i_1 
       (.I0(out[3]),
        .I1(single_done),
        .I2(out[2]),
        .I3(out[0]),
        .I4(out[1]),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_count[31]_i_7 
       (.I0(\wait_count[31]_i_4 [27]),
        .I1(\wait_count[31]_i_4 [28]),
        .I2(\wait_count[31]_i_4 [29]),
        .I3(\wait_count[31]_i_4 [31]),
        .O(\wait_count_reg[27] ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \who_am_i_data[0]_i_1 
       (.I0(single_data[0]),
        .I1(single_done),
        .I2(who_am_i_data[0]),
        .O(\read_data_reg[7]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \who_am_i_data[1]_i_1 
       (.I0(single_data[1]),
        .I1(single_done),
        .I2(who_am_i_data[1]),
        .O(\read_data_reg[7]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \who_am_i_data[2]_i_1 
       (.I0(single_data[2]),
        .I1(single_done),
        .I2(who_am_i_data[2]),
        .O(\read_data_reg[7]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \who_am_i_data[3]_i_1 
       (.I0(single_data[3]),
        .I1(single_done),
        .I2(who_am_i_data[3]),
        .O(\read_data_reg[7]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \who_am_i_data[4]_i_1 
       (.I0(single_data[4]),
        .I1(single_done),
        .I2(who_am_i_data[4]),
        .O(\read_data_reg[7]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \who_am_i_data[5]_i_1 
       (.I0(single_data[5]),
        .I1(single_done),
        .I2(who_am_i_data[5]),
        .O(\read_data_reg[7]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \who_am_i_data[6]_i_1 
       (.I0(single_data[6]),
        .I1(single_done),
        .I2(who_am_i_data[6]),
        .O(\read_data_reg[7]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \who_am_i_data[7]_i_2 
       (.I0(single_data[7]),
        .I1(single_done),
        .I2(who_am_i_data[7]),
        .O(\read_data_reg[7]_0 [7]));
endmodule

(* ORIG_REF_NAME = "lis3dh_vibration_axi_peripheral" *) 
module design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_peripheral
   (lis3dh_cs_n,
    lis3dh_sclk,
    lis3dh_mosi,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_bvalid_reg,
    s_axi_wready,
    s_axi_awready,
    s_axi_rvalid_reg,
    s_axi_arready,
    s_axi_bresp,
    s_axi_aclk,
    s_axi_aresetn,
    lis3dh_miso,
    s_axi_awaddr,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_arvalid,
    s_axi_araddr,
    s_axi_bready,
    s_axi_rready);
  output lis3dh_cs_n;
  output lis3dh_sclk;
  output lis3dh_mosi;
  output [31:0]s_axi_rdata;
  output [0:0]s_axi_rresp;
  output s_axi_bvalid_reg;
  output s_axi_wready;
  output s_axi_awready;
  output s_axi_rvalid_reg;
  output s_axi_arready;
  output [0:0]s_axi_bresp;
  input s_axi_aclk;
  input s_axi_aresetn;
  input lis3dh_miso;
  input [11:0]s_axi_awaddr;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input [11:0]s_axi_araddr;
  input s_axi_bready;
  input s_axi_rready;

  wire init_done;
  wire init_error;
  wire lis3dh_cs_n;
  wire lis3dh_miso;
  wire lis3dh_mosi;
  wire lis3dh_sclk;
  wire overflow;
  wire registers_n_0;
  wire [15:0]result_peak;
  wire [4:4]result_sample_count;
  wire [34:0]result_sum_squares;
  wire s_axi_aclk;
  wire [11:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [11:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire s_axi_bvalid_reg;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire s_axi_rvalid_reg;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [31:0]sample_drop_count;
  wire sample_ready;
  wire sensor_overrun;
  wire snapshot_seq0;
  wire xyz_valid;
  wire [15:0]xyz_x;
  wire NLW_sensor_sample_drop_UNCONNECTED;
  wire NLW_sensor_spi_busy_UNCONNECTED;
  wire [7:0]NLW_sensor_who_am_i_data_UNCONNECTED;
  wire [15:0]NLW_sensor_xyz_y_UNCONNECTED;
  wire [15:0]NLW_sensor_xyz_z_UNCONNECTED;

  design_1_lis3dh_vibration_axi_0_0_vibration_processing_pipeline processing
       (.D(xyz_x),
        .Q(result_peak),
        .overflow(overflow),
        .result_sample_count(result_sample_count),
        .\result_sum_squares_reg[34] (result_sum_squares),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .snapshot_seq0(snapshot_seq0),
        .\sum_squares_accumulator_reg[0] (registers_n_0),
        .xyz_ready(sample_ready),
        .xyz_valid(xyz_valid));
  design_1_lis3dh_vibration_axi_0_0_vibration_axi_lite_slave registers
       (.D(result_peak),
        .error(init_error),
        .init_done(init_done),
        .overflow(overflow),
        .result_sample_count(result_sample_count),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(registers_n_0),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid_reg_0(s_axi_bvalid_reg),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid_reg_0(s_axi_rvalid_reg),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid),
        .sample_drop_count(sample_drop_count),
        .sensor_overrun(sensor_overrun),
        .snapshot_seq0(snapshot_seq0),
        .\snapshot_sumsq_reg[34]_0 (result_sum_squares));
  (* BOOT_WAIT = "4'b0000" *) 
  (* BURST_START = "4'b1011" *) 
  (* BURST_WAIT = "4'b1100" *) 
  (* CFG1_START = "4'b0101" *) 
  (* CFG1_WAIT = "4'b0110" *) 
  (* CFG4_START = "4'b0011" *) 
  (* CFG4_WAIT = "4'b0100" *) 
  (* CTRL_REG1_ADDR = "6'b100000" *) 
  (* CTRL_REG1_VALUE = "8'b01010111" *) 
  (* CTRL_REG4_ADDR = "6'b100011" *) 
  (* CTRL_REG4_VALUE = "8'b10001000" *) 
  (* FATAL = "4'b1110" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* OUTPUT_SAMPLE = "4'b1101" *) 
  (* POLL_PERIOD_CYCLES = "50000" *) 
  (* POLL_WAIT = "4'b1000" *) 
  (* POWER_UP_DELAY_CYCLES = "500000" *) 
  (* SETTLE_DELAY_CYCLES = "5000000" *) 
  (* SETTLE_WAIT = "4'b0111" *) 
  (* SPI_HALF_PERIOD_CYCLES = "25" *) 
  (* STATUS_REG_ADDR = "6'b100111" *) 
  (* STATUS_START = "4'b1001" *) 
  (* STATUS_WAIT = "4'b1010" *) 
  (* WHO_AM_I_ADDR = "6'b001111" *) 
  (* WHO_AM_I_EXPECTED = "8'b00110011" *) 
  (* WHO_START = "4'b0001" *) 
  (* WHO_WAIT = "4'b0010" *) 
  design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition sensor
       (.clk(s_axi_aclk),
        .error(init_error),
        .init_done(init_done),
        .lis3dh_cs_n(lis3dh_cs_n),
        .lis3dh_miso(lis3dh_miso),
        .lis3dh_mosi(lis3dh_mosi),
        .lis3dh_sclk(lis3dh_sclk),
        .rst_n(s_axi_aresetn),
        .sample_drop(NLW_sensor_sample_drop_UNCONNECTED),
        .sample_drop_count(sample_drop_count),
        .sensor_overrun(sensor_overrun),
        .spi_busy(NLW_sensor_spi_busy_UNCONNECTED),
        .who_am_i_data(NLW_sensor_who_am_i_data_UNCONNECTED[7:0]),
        .xyz_ready(sample_ready),
        .xyz_valid(xyz_valid),
        .xyz_x(xyz_x),
        .xyz_y(NLW_sensor_xyz_y_UNCONNECTED[15:0]),
        .xyz_z(NLW_sensor_xyz_z_UNCONNECTED[15:0]));
endmodule

(* ORIG_REF_NAME = "lis3dh_vibration_axi_wrapper" *) 
module design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_wrapper
   (lis3dh_cs_n,
    lis3dh_sclk,
    lis3dh_mosi,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_bvalid_reg,
    s_axi_wready,
    s_axi_awready,
    s_axi_rvalid_reg,
    s_axi_arready,
    s_axi_bresp,
    s_axi_aclk,
    s_axi_aresetn,
    lis3dh_miso,
    s_axi_awaddr,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_arvalid,
    s_axi_araddr,
    s_axi_bready,
    s_axi_rready);
  output lis3dh_cs_n;
  output lis3dh_sclk;
  output lis3dh_mosi;
  output [31:0]s_axi_rdata;
  output [0:0]s_axi_rresp;
  output s_axi_bvalid_reg;
  output s_axi_wready;
  output s_axi_awready;
  output s_axi_rvalid_reg;
  output s_axi_arready;
  output [0:0]s_axi_bresp;
  input s_axi_aclk;
  input s_axi_aresetn;
  input lis3dh_miso;
  input [11:0]s_axi_awaddr;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input [11:0]s_axi_araddr;
  input s_axi_bready;
  input s_axi_rready;

  wire lis3dh_cs_n;
  wire lis3dh_miso;
  wire lis3dh_mosi;
  wire lis3dh_sclk;
  wire s_axi_aclk;
  wire [11:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [11:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire s_axi_bvalid_reg;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire s_axi_rvalid_reg;
  wire s_axi_wready;
  wire s_axi_wvalid;

  design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_peripheral peripheral
       (.lis3dh_cs_n(lis3dh_cs_n),
        .lis3dh_miso(lis3dh_miso),
        .lis3dh_mosi(lis3dh_mosi),
        .lis3dh_sclk(lis3dh_sclk),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid_reg(s_axi_bvalid_reg),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid_reg(s_axi_rvalid_reg),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* BOOT_WAIT = "4'b0000" *) (* BURST_START = "4'b1011" *) (* BURST_WAIT = "4'b1100" *) 
(* CFG1_START = "4'b0101" *) (* CFG1_WAIT = "4'b0110" *) (* CFG4_START = "4'b0011" *) 
(* CFG4_WAIT = "4'b0100" *) (* CTRL_REG1_ADDR = "6'b100000" *) (* CTRL_REG1_VALUE = "8'b01010111" *) 
(* CTRL_REG4_ADDR = "6'b100011" *) (* CTRL_REG4_VALUE = "8'b10001000" *) (* FATAL = "4'b1110" *) 
(* ORIG_REF_NAME = "lis3dh_xyz_acquisition" *) (* OUTPUT_SAMPLE = "4'b1101" *) (* POLL_PERIOD_CYCLES = "50000" *) 
(* POLL_WAIT = "4'b1000" *) (* POWER_UP_DELAY_CYCLES = "500000" *) (* SETTLE_DELAY_CYCLES = "5000000" *) 
(* SETTLE_WAIT = "4'b0111" *) (* SPI_HALF_PERIOD_CYCLES = "25" *) (* STATUS_REG_ADDR = "6'b100111" *) 
(* STATUS_START = "4'b1001" *) (* STATUS_WAIT = "4'b1010" *) (* WHO_AM_I_ADDR = "6'b001111" *) 
(* WHO_AM_I_EXPECTED = "8'b00110011" *) (* WHO_START = "4'b0001" *) (* WHO_WAIT = "4'b0010" *) 
(* keep_hierarchy = "soft" *) 
module design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition
   (clk,
    rst_n,
    xyz_ready,
    xyz_x,
    xyz_y,
    xyz_z,
    xyz_valid,
    sample_drop,
    sample_drop_count,
    sensor_overrun,
    who_am_i_data,
    init_done,
    error,
    spi_busy,
    lis3dh_cs_n,
    lis3dh_sclk,
    lis3dh_mosi,
    lis3dh_miso);
  input clk;
  input rst_n;
  input xyz_ready;
  (* mark_debug = "true" *) output [15:0]xyz_x;
  (* mark_debug = "true" *) output [15:0]xyz_y;
  (* mark_debug = "true" *) output [15:0]xyz_z;
  (* mark_debug = "true" *) output xyz_valid;
  (* mark_debug = "true" *) output sample_drop;
  (* mark_debug = "true" *) output [31:0]sample_drop_count;
  (* mark_debug = "true" *) output sensor_overrun;
  (* mark_debug = "true" *) output [7:0]who_am_i_data;
  (* mark_debug = "true" *) output init_done;
  (* mark_debug = "true" *) output error;
  output spi_busy;
  output lis3dh_cs_n;
  output lis3dh_sclk;
  output lis3dh_mosi;
  input lis3dh_miso;

  wire \<const0> ;
  wire burst_cs_n;
  wire burst_mosi;
  wire burst_sclk;
  wire clk;
  wire [31:1]data0;
  (* MARK_DEBUG *) wire error;
  (* MARK_DEBUG *) wire init_done;
  wire init_done_i_1_n_0;
  wire lis3dh_cs_n;
  wire lis3dh_miso;
  wire lis3dh_mosi;
  wire lis3dh_sclk;
  wire [3:0]p_0_in__0;
  wire [15:0]p_0_in__2;
  wire [31:0]p_1_in__0;
  wire rst_n;
  (* MARK_DEBUG *) wire sample_drop;
  (* MARK_DEBUG *) wire [31:0]sample_drop_count;
  wire [31:1]sample_drop_count0;
  wire \sample_drop_count[31]_i_10_n_0 ;
  wire \sample_drop_count[31]_i_11_n_0 ;
  wire \sample_drop_count[31]_i_12_n_0 ;
  wire \sample_drop_count[31]_i_1_n_0 ;
  wire \sample_drop_count[31]_i_4_n_0 ;
  wire \sample_drop_count[31]_i_5_n_0 ;
  wire \sample_drop_count[31]_i_6_n_0 ;
  wire \sample_drop_count[31]_i_7_n_0 ;
  wire \sample_drop_count[31]_i_8_n_0 ;
  wire \sample_drop_count[31]_i_9_n_0 ;
  wire \sample_drop_count_reg[12]_i_2_n_0 ;
  wire \sample_drop_count_reg[12]_i_2_n_1 ;
  wire \sample_drop_count_reg[12]_i_2_n_2 ;
  wire \sample_drop_count_reg[12]_i_2_n_3 ;
  wire \sample_drop_count_reg[16]_i_2_n_0 ;
  wire \sample_drop_count_reg[16]_i_2_n_1 ;
  wire \sample_drop_count_reg[16]_i_2_n_2 ;
  wire \sample_drop_count_reg[16]_i_2_n_3 ;
  wire \sample_drop_count_reg[20]_i_2_n_0 ;
  wire \sample_drop_count_reg[20]_i_2_n_1 ;
  wire \sample_drop_count_reg[20]_i_2_n_2 ;
  wire \sample_drop_count_reg[20]_i_2_n_3 ;
  wire \sample_drop_count_reg[24]_i_2_n_0 ;
  wire \sample_drop_count_reg[24]_i_2_n_1 ;
  wire \sample_drop_count_reg[24]_i_2_n_2 ;
  wire \sample_drop_count_reg[24]_i_2_n_3 ;
  wire \sample_drop_count_reg[28]_i_2_n_0 ;
  wire \sample_drop_count_reg[28]_i_2_n_1 ;
  wire \sample_drop_count_reg[28]_i_2_n_2 ;
  wire \sample_drop_count_reg[28]_i_2_n_3 ;
  wire \sample_drop_count_reg[31]_i_3_n_2 ;
  wire \sample_drop_count_reg[31]_i_3_n_3 ;
  wire \sample_drop_count_reg[4]_i_2_n_0 ;
  wire \sample_drop_count_reg[4]_i_2_n_1 ;
  wire \sample_drop_count_reg[4]_i_2_n_2 ;
  wire \sample_drop_count_reg[4]_i_2_n_3 ;
  wire \sample_drop_count_reg[8]_i_2_n_0 ;
  wire \sample_drop_count_reg[8]_i_2_n_1 ;
  wire \sample_drop_count_reg[8]_i_2_n_2 ;
  wire \sample_drop_count_reg[8]_i_2_n_3 ;
  wire sample_drop_i_1_n_0;
  (* MARK_DEBUG *) wire sensor_overrun;
  wire single_register_spi_n_0;
  wire single_register_spi_n_1;
  wire single_register_spi_n_12;
  wire single_register_spi_n_13;
  wire single_register_spi_n_14;
  wire single_register_spi_n_15;
  wire single_register_spi_n_16;
  wire single_register_spi_n_17;
  wire single_register_spi_n_18;
  wire single_register_spi_n_19;
  wire single_register_spi_n_20;
  wire single_register_spi_n_21;
  wire single_register_spi_n_22;
  wire single_register_spi_n_23;
  wire single_register_spi_n_24;
  wire single_register_spi_n_25;
  wire single_register_spi_n_26;
  wire single_register_spi_n_27;
  wire single_register_spi_n_28;
  wire single_register_spi_n_29;
  wire single_register_spi_n_30;
  wire single_register_spi_n_5;
  wire single_register_spi_n_6;
  wire single_register_spi_n_7;
  (* MARK_DEBUG *) wire [3:0]state;
  wire \wait_count[0]_i_1_n_0 ;
  wire \wait_count[10]_i_1_n_0 ;
  wire \wait_count[11]_i_1_n_0 ;
  wire \wait_count[12]_i_1_n_0 ;
  wire \wait_count[13]_i_1_n_0 ;
  wire \wait_count[14]_i_1_n_0 ;
  wire \wait_count[15]_i_1_n_0 ;
  wire \wait_count[16]_i_1_n_0 ;
  wire \wait_count[17]_i_1_n_0 ;
  wire \wait_count[18]_i_1_n_0 ;
  wire \wait_count[19]_i_1_n_0 ;
  wire \wait_count[1]_i_1_n_0 ;
  wire \wait_count[20]_i_1_n_0 ;
  wire \wait_count[21]_i_1_n_0 ;
  wire \wait_count[22]_i_1_n_0 ;
  wire \wait_count[23]_i_1_n_0 ;
  wire \wait_count[24]_i_1_n_0 ;
  wire \wait_count[25]_i_1_n_0 ;
  wire \wait_count[26]_i_1_n_0 ;
  wire \wait_count[27]_i_1_n_0 ;
  wire \wait_count[28]_i_1_n_0 ;
  wire \wait_count[29]_i_1_n_0 ;
  wire \wait_count[2]_i_1_n_0 ;
  wire \wait_count[30]_i_1_n_0 ;
  wire \wait_count[31]_i_10_n_0 ;
  wire \wait_count[31]_i_2_n_0 ;
  wire \wait_count[31]_i_4_n_0 ;
  wire \wait_count[31]_i_5_n_0 ;
  wire \wait_count[31]_i_6_n_0 ;
  wire \wait_count[31]_i_8_n_0 ;
  wire \wait_count[31]_i_9_n_0 ;
  wire \wait_count[3]_i_1_n_0 ;
  wire \wait_count[4]_i_1_n_0 ;
  wire \wait_count[5]_i_1_n_0 ;
  wire \wait_count[6]_i_1_n_0 ;
  wire \wait_count[7]_i_1_n_0 ;
  wire \wait_count[8]_i_1_n_0 ;
  wire \wait_count[9]_i_1_n_0 ;
  wire \wait_count_reg[12]_i_2_n_0 ;
  wire \wait_count_reg[12]_i_2_n_1 ;
  wire \wait_count_reg[12]_i_2_n_2 ;
  wire \wait_count_reg[12]_i_2_n_3 ;
  wire \wait_count_reg[16]_i_2_n_0 ;
  wire \wait_count_reg[16]_i_2_n_1 ;
  wire \wait_count_reg[16]_i_2_n_2 ;
  wire \wait_count_reg[16]_i_2_n_3 ;
  wire \wait_count_reg[20]_i_2_n_0 ;
  wire \wait_count_reg[20]_i_2_n_1 ;
  wire \wait_count_reg[20]_i_2_n_2 ;
  wire \wait_count_reg[20]_i_2_n_3 ;
  wire \wait_count_reg[24]_i_2_n_0 ;
  wire \wait_count_reg[24]_i_2_n_1 ;
  wire \wait_count_reg[24]_i_2_n_2 ;
  wire \wait_count_reg[24]_i_2_n_3 ;
  wire \wait_count_reg[28]_i_2_n_0 ;
  wire \wait_count_reg[28]_i_2_n_1 ;
  wire \wait_count_reg[28]_i_2_n_2 ;
  wire \wait_count_reg[28]_i_2_n_3 ;
  wire \wait_count_reg[31]_i_3_n_2 ;
  wire \wait_count_reg[31]_i_3_n_3 ;
  wire \wait_count_reg[4]_i_2_n_0 ;
  wire \wait_count_reg[4]_i_2_n_1 ;
  wire \wait_count_reg[4]_i_2_n_2 ;
  wire \wait_count_reg[4]_i_2_n_3 ;
  wire \wait_count_reg[8]_i_2_n_0 ;
  wire \wait_count_reg[8]_i_2_n_1 ;
  wire \wait_count_reg[8]_i_2_n_2 ;
  wire \wait_count_reg[8]_i_2_n_3 ;
  wire \wait_count_reg_n_0_[0] ;
  wire \wait_count_reg_n_0_[10] ;
  wire \wait_count_reg_n_0_[11] ;
  wire \wait_count_reg_n_0_[12] ;
  wire \wait_count_reg_n_0_[13] ;
  wire \wait_count_reg_n_0_[14] ;
  wire \wait_count_reg_n_0_[15] ;
  wire \wait_count_reg_n_0_[16] ;
  wire \wait_count_reg_n_0_[17] ;
  wire \wait_count_reg_n_0_[18] ;
  wire \wait_count_reg_n_0_[19] ;
  wire \wait_count_reg_n_0_[1] ;
  wire \wait_count_reg_n_0_[20] ;
  wire \wait_count_reg_n_0_[21] ;
  wire \wait_count_reg_n_0_[22] ;
  wire \wait_count_reg_n_0_[23] ;
  wire \wait_count_reg_n_0_[24] ;
  wire \wait_count_reg_n_0_[25] ;
  wire \wait_count_reg_n_0_[26] ;
  wire \wait_count_reg_n_0_[27] ;
  wire \wait_count_reg_n_0_[28] ;
  wire \wait_count_reg_n_0_[29] ;
  wire \wait_count_reg_n_0_[2] ;
  wire \wait_count_reg_n_0_[30] ;
  wire \wait_count_reg_n_0_[31] ;
  wire \wait_count_reg_n_0_[3] ;
  wire \wait_count_reg_n_0_[4] ;
  wire \wait_count_reg_n_0_[5] ;
  wire \wait_count_reg_n_0_[6] ;
  wire \wait_count_reg_n_0_[7] ;
  wire \wait_count_reg_n_0_[8] ;
  wire \wait_count_reg_n_0_[9] ;
  (* MARK_DEBUG *) wire [7:0]who_am_i_data;
  wire \who_am_i_data[7]_i_1_n_0 ;
  wire xyz_burst_spi_n_0;
  wire xyz_burst_spi_n_1;
  wire xyz_burst_spi_n_18;
  wire xyz_burst_spi_n_19;
  wire xyz_burst_spi_n_20;
  wire xyz_burst_spi_n_21;
  wire xyz_burst_spi_n_22;
  wire xyz_burst_spi_n_23;
  wire xyz_burst_spi_n_24;
  wire xyz_burst_spi_n_25;
  wire xyz_burst_spi_n_26;
  wire xyz_burst_spi_n_27;
  wire xyz_burst_spi_n_28;
  wire xyz_burst_spi_n_29;
  wire xyz_burst_spi_n_30;
  wire xyz_burst_spi_n_31;
  wire xyz_burst_spi_n_32;
  wire xyz_burst_spi_n_33;
  wire xyz_burst_spi_n_34;
  wire xyz_burst_spi_n_35;
  wire xyz_burst_spi_n_36;
  wire xyz_burst_spi_n_37;
  wire xyz_burst_spi_n_38;
  wire xyz_burst_spi_n_39;
  wire xyz_burst_spi_n_40;
  wire xyz_burst_spi_n_41;
  wire xyz_burst_spi_n_42;
  wire xyz_burst_spi_n_43;
  wire xyz_burst_spi_n_44;
  wire xyz_burst_spi_n_45;
  wire xyz_burst_spi_n_46;
  wire xyz_burst_spi_n_47;
  wire xyz_burst_spi_n_48;
  wire xyz_burst_spi_n_49;
  wire xyz_burst_spi_n_50;
  wire xyz_ready;
  (* MARK_DEBUG *) wire xyz_valid;
  (* MARK_DEBUG *) wire [15:0]xyz_x;
  wire \xyz_x[15]_i_1_n_0 ;
  (* MARK_DEBUG *) wire [15:0]xyz_y;
  (* MARK_DEBUG *) wire [15:0]xyz_z;
  wire [3:2]\NLW_sample_drop_count_reg[31]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_sample_drop_count_reg[31]_i_3_O_UNCONNECTED ;
  wire [3:2]\NLW_wait_count_reg[31]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_wait_count_reg[31]_i_3_O_UNCONNECTED ;

  assign spi_busy = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* KEEP = "yes" *) 
  FDCE error_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_6),
        .Q(error));
  LUT6 #(
    .INIT(64'hFFFFEFFF0000E000)) 
    init_done_i_1
       (.I0(init_done),
        .I1(single_register_spi_n_17),
        .I2(single_register_spi_n_5),
        .I3(state[2]),
        .I4(state[3]),
        .I5(init_done),
        .O(init_done_i_1_n_0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE init_done_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(xyz_burst_spi_n_0),
        .D(init_done_i_1_n_0),
        .Q(init_done));
  LUT2 #(
    .INIT(4'h6)) 
    \sample_drop_count[0]_i_1 
       (.I0(sample_drop_count[0]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .O(p_1_in__0[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[10]_i_1 
       (.I0(sample_drop_count0[10]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[10]),
        .O(p_1_in__0[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[11]_i_1 
       (.I0(sample_drop_count0[11]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[11]),
        .O(p_1_in__0[11]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[12]_i_1 
       (.I0(sample_drop_count0[12]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[12]),
        .O(p_1_in__0[12]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[13]_i_1 
       (.I0(sample_drop_count0[13]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[13]),
        .O(p_1_in__0[13]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[14]_i_1 
       (.I0(sample_drop_count0[14]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[14]),
        .O(p_1_in__0[14]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[15]_i_1 
       (.I0(sample_drop_count0[15]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[15]),
        .O(p_1_in__0[15]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[16]_i_1 
       (.I0(sample_drop_count0[16]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[16]),
        .O(p_1_in__0[16]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[17]_i_1 
       (.I0(sample_drop_count0[17]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[17]),
        .O(p_1_in__0[17]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[18]_i_1 
       (.I0(sample_drop_count0[18]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[18]),
        .O(p_1_in__0[18]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[19]_i_1 
       (.I0(sample_drop_count0[19]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[19]),
        .O(p_1_in__0[19]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[1]_i_1 
       (.I0(sample_drop_count0[1]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[1]),
        .O(p_1_in__0[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[20]_i_1 
       (.I0(sample_drop_count0[20]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[20]),
        .O(p_1_in__0[20]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[21]_i_1 
       (.I0(sample_drop_count0[21]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[21]),
        .O(p_1_in__0[21]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[22]_i_1 
       (.I0(sample_drop_count0[22]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[22]),
        .O(p_1_in__0[22]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[23]_i_1 
       (.I0(sample_drop_count0[23]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[23]),
        .O(p_1_in__0[23]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[24]_i_1 
       (.I0(sample_drop_count0[24]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[24]),
        .O(p_1_in__0[24]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[25]_i_1 
       (.I0(sample_drop_count0[25]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[25]),
        .O(p_1_in__0[25]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[26]_i_1 
       (.I0(sample_drop_count0[26]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[26]),
        .O(p_1_in__0[26]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[27]_i_1 
       (.I0(sample_drop_count0[27]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[27]),
        .O(p_1_in__0[27]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[28]_i_1 
       (.I0(sample_drop_count0[28]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[28]),
        .O(p_1_in__0[28]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[29]_i_1 
       (.I0(sample_drop_count0[29]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[29]),
        .O(p_1_in__0[29]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[2]_i_1 
       (.I0(sample_drop_count0[2]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[2]),
        .O(p_1_in__0[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[30]_i_1 
       (.I0(sample_drop_count0[30]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[30]),
        .O(p_1_in__0[30]));
  LUT4 #(
    .INIT(16'h0080)) 
    \sample_drop_count[31]_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .O(\sample_drop_count[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \sample_drop_count[31]_i_10 
       (.I0(sample_drop_count[8]),
        .I1(sample_drop_count[9]),
        .I2(sample_drop_count[1]),
        .I3(sample_drop_count[16]),
        .O(\sample_drop_count[31]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \sample_drop_count[31]_i_11 
       (.I0(sample_drop_count[6]),
        .I1(sample_drop_count[7]),
        .I2(sample_drop_count[5]),
        .I3(sample_drop_count[26]),
        .O(\sample_drop_count[31]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \sample_drop_count[31]_i_12 
       (.I0(sample_drop_count[2]),
        .I1(sample_drop_count[19]),
        .I2(sample_drop_count[3]),
        .I3(sample_drop_count[24]),
        .O(\sample_drop_count[31]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[31]_i_2 
       (.I0(sample_drop_count0[31]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[31]),
        .O(p_1_in__0[31]));
  LUT5 #(
    .INIT(32'h55555455)) 
    \sample_drop_count[31]_i_4 
       (.I0(xyz_ready),
        .I1(\sample_drop_count[31]_i_5_n_0 ),
        .I2(\sample_drop_count[31]_i_6_n_0 ),
        .I3(\sample_drop_count[31]_i_7_n_0 ),
        .I4(\sample_drop_count[31]_i_8_n_0 ),
        .O(\sample_drop_count[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \sample_drop_count[31]_i_5 
       (.I0(sample_drop_count[18]),
        .I1(sample_drop_count[28]),
        .I2(sample_drop_count[11]),
        .I3(sample_drop_count[12]),
        .I4(\sample_drop_count[31]_i_9_n_0 ),
        .O(\sample_drop_count[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \sample_drop_count[31]_i_6 
       (.I0(sample_drop_count[30]),
        .I1(sample_drop_count[14]),
        .I2(sample_drop_count[21]),
        .I3(sample_drop_count[20]),
        .I4(\sample_drop_count[31]_i_10_n_0 ),
        .O(\sample_drop_count[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \sample_drop_count[31]_i_7 
       (.I0(sample_drop_count[31]),
        .I1(sample_drop_count[4]),
        .I2(sample_drop_count[17]),
        .I3(sample_drop_count[15]),
        .I4(\sample_drop_count[31]_i_11_n_0 ),
        .O(\sample_drop_count[31]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \sample_drop_count[31]_i_8 
       (.I0(sample_drop_count[25]),
        .I1(sample_drop_count[10]),
        .I2(sample_drop_count[23]),
        .I3(sample_drop_count[22]),
        .I4(\sample_drop_count[31]_i_12_n_0 ),
        .O(\sample_drop_count[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \sample_drop_count[31]_i_9 
       (.I0(sample_drop_count[0]),
        .I1(sample_drop_count[29]),
        .I2(sample_drop_count[13]),
        .I3(sample_drop_count[27]),
        .O(\sample_drop_count[31]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[3]_i_1 
       (.I0(sample_drop_count0[3]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[3]),
        .O(p_1_in__0[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[4]_i_1 
       (.I0(sample_drop_count0[4]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[4]),
        .O(p_1_in__0[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[5]_i_1 
       (.I0(sample_drop_count0[5]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[5]),
        .O(p_1_in__0[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[6]_i_1 
       (.I0(sample_drop_count0[6]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[6]),
        .O(p_1_in__0[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[7]_i_1 
       (.I0(sample_drop_count0[7]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[7]),
        .O(p_1_in__0[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[8]_i_1 
       (.I0(sample_drop_count0[8]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[8]),
        .O(p_1_in__0[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sample_drop_count[9]_i_1 
       (.I0(sample_drop_count0[9]),
        .I1(\sample_drop_count[31]_i_4_n_0 ),
        .I2(sample_drop_count[9]),
        .O(p_1_in__0[9]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[0] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[0]),
        .Q(sample_drop_count[0]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[10] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[10]),
        .Q(sample_drop_count[10]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[11] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[11]),
        .Q(sample_drop_count[11]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[12] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[12]),
        .Q(sample_drop_count[12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \sample_drop_count_reg[12]_i_2 
       (.CI(\sample_drop_count_reg[8]_i_2_n_0 ),
        .CO({\sample_drop_count_reg[12]_i_2_n_0 ,\sample_drop_count_reg[12]_i_2_n_1 ,\sample_drop_count_reg[12]_i_2_n_2 ,\sample_drop_count_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_drop_count0[12:9]),
        .S(sample_drop_count[12:9]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[13] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[13]),
        .Q(sample_drop_count[13]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[14] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[14]),
        .Q(sample_drop_count[14]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[15] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[15]),
        .Q(sample_drop_count[15]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[16] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[16]),
        .Q(sample_drop_count[16]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \sample_drop_count_reg[16]_i_2 
       (.CI(\sample_drop_count_reg[12]_i_2_n_0 ),
        .CO({\sample_drop_count_reg[16]_i_2_n_0 ,\sample_drop_count_reg[16]_i_2_n_1 ,\sample_drop_count_reg[16]_i_2_n_2 ,\sample_drop_count_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_drop_count0[16:13]),
        .S(sample_drop_count[16:13]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[17] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[17]),
        .Q(sample_drop_count[17]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[18] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[18]),
        .Q(sample_drop_count[18]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[19] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[19]),
        .Q(sample_drop_count[19]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[1] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[1]),
        .Q(sample_drop_count[1]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[20] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[20]),
        .Q(sample_drop_count[20]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \sample_drop_count_reg[20]_i_2 
       (.CI(\sample_drop_count_reg[16]_i_2_n_0 ),
        .CO({\sample_drop_count_reg[20]_i_2_n_0 ,\sample_drop_count_reg[20]_i_2_n_1 ,\sample_drop_count_reg[20]_i_2_n_2 ,\sample_drop_count_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_drop_count0[20:17]),
        .S(sample_drop_count[20:17]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[21] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[21]),
        .Q(sample_drop_count[21]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[22] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[22]),
        .Q(sample_drop_count[22]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[23] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[23]),
        .Q(sample_drop_count[23]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[24] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[24]),
        .Q(sample_drop_count[24]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \sample_drop_count_reg[24]_i_2 
       (.CI(\sample_drop_count_reg[20]_i_2_n_0 ),
        .CO({\sample_drop_count_reg[24]_i_2_n_0 ,\sample_drop_count_reg[24]_i_2_n_1 ,\sample_drop_count_reg[24]_i_2_n_2 ,\sample_drop_count_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_drop_count0[24:21]),
        .S(sample_drop_count[24:21]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[25] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[25]),
        .Q(sample_drop_count[25]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[26] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[26]),
        .Q(sample_drop_count[26]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[27] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[27]),
        .Q(sample_drop_count[27]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[28] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[28]),
        .Q(sample_drop_count[28]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \sample_drop_count_reg[28]_i_2 
       (.CI(\sample_drop_count_reg[24]_i_2_n_0 ),
        .CO({\sample_drop_count_reg[28]_i_2_n_0 ,\sample_drop_count_reg[28]_i_2_n_1 ,\sample_drop_count_reg[28]_i_2_n_2 ,\sample_drop_count_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_drop_count0[28:25]),
        .S(sample_drop_count[28:25]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[29] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[29]),
        .Q(sample_drop_count[29]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[2] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[2]),
        .Q(sample_drop_count[2]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[30] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[30]),
        .Q(sample_drop_count[30]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[31] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[31]),
        .Q(sample_drop_count[31]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \sample_drop_count_reg[31]_i_3 
       (.CI(\sample_drop_count_reg[28]_i_2_n_0 ),
        .CO({\NLW_sample_drop_count_reg[31]_i_3_CO_UNCONNECTED [3:2],\sample_drop_count_reg[31]_i_3_n_2 ,\sample_drop_count_reg[31]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_sample_drop_count_reg[31]_i_3_O_UNCONNECTED [3],sample_drop_count0[31:29]}),
        .S({1'b0,sample_drop_count[31:29]}));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[3] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[3]),
        .Q(sample_drop_count[3]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[4] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[4]),
        .Q(sample_drop_count[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \sample_drop_count_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\sample_drop_count_reg[4]_i_2_n_0 ,\sample_drop_count_reg[4]_i_2_n_1 ,\sample_drop_count_reg[4]_i_2_n_2 ,\sample_drop_count_reg[4]_i_2_n_3 }),
        .CYINIT(sample_drop_count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_drop_count0[4:1]),
        .S(sample_drop_count[4:1]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[5] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[5]),
        .Q(sample_drop_count[5]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[6] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[6]),
        .Q(sample_drop_count[6]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[7] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[7]),
        .Q(sample_drop_count[7]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[8] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[8]),
        .Q(sample_drop_count[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \sample_drop_count_reg[8]_i_2 
       (.CI(\sample_drop_count_reg[4]_i_2_n_0 ),
        .CO({\sample_drop_count_reg[8]_i_2_n_0 ,\sample_drop_count_reg[8]_i_2_n_1 ,\sample_drop_count_reg[8]_i_2_n_2 ,\sample_drop_count_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_drop_count0[8:5]),
        .S(sample_drop_count[8:5]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \sample_drop_count_reg[9] 
       (.C(clk),
        .CE(\sample_drop_count[31]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_1_in__0[9]),
        .Q(sample_drop_count[9]));
  LUT5 #(
    .INIT(32'h00004000)) 
    sample_drop_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[3]),
        .I4(xyz_ready),
        .O(sample_drop_i_1_n_0));
  (* KEEP = "yes" *) 
  FDCE sample_drop_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(xyz_burst_spi_n_0),
        .D(sample_drop_i_1_n_0),
        .Q(sample_drop));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE sensor_overrun_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_0),
        .Q(sensor_overrun));
  design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_controller single_register_spi
       (.D(p_0_in__0),
        .E(single_register_spi_n_7),
        .Q(state),
        .burst_cs_n(burst_cs_n),
        .burst_mosi(burst_mosi),
        .burst_sclk(burst_sclk),
        .clk(clk),
        .error(error),
        .in0(sensor_overrun),
        .lis3dh_cs_n(lis3dh_cs_n),
        .lis3dh_cs_n_reg_0(xyz_burst_spi_n_0),
        .lis3dh_miso(lis3dh_miso),
        .lis3dh_mosi(lis3dh_mosi),
        .lis3dh_sclk(lis3dh_sclk),
        .out(state),
        .\read_data_reg[7]_0 ({single_register_spi_n_23,single_register_spi_n_24,single_register_spi_n_25,single_register_spi_n_26,single_register_spi_n_27,single_register_spi_n_28,single_register_spi_n_29,single_register_spi_n_30}),
        .sensor_overrun(sensor_overrun),
        .sensor_overrun_reg(single_register_spi_n_0),
        .\state[0]_i_5_0 (xyz_burst_spi_n_50),
        .\state_reg[0] (single_register_spi_n_5),
        .\state_reg[1] (single_register_spi_n_6),
        .\state_reg[3] (single_register_spi_n_1),
        .\wait_count[31]_i_4 ({\wait_count_reg_n_0_[31] ,\wait_count_reg_n_0_[30] ,\wait_count_reg_n_0_[29] ,\wait_count_reg_n_0_[28] ,\wait_count_reg_n_0_[27] ,\wait_count_reg_n_0_[26] ,\wait_count_reg_n_0_[25] ,\wait_count_reg_n_0_[24] ,\wait_count_reg_n_0_[23] ,\wait_count_reg_n_0_[22] ,\wait_count_reg_n_0_[21] ,\wait_count_reg_n_0_[20] ,\wait_count_reg_n_0_[19] ,\wait_count_reg_n_0_[18] ,\wait_count_reg_n_0_[17] ,\wait_count_reg_n_0_[16] ,\wait_count_reg_n_0_[15] ,\wait_count_reg_n_0_[14] ,\wait_count_reg_n_0_[13] ,\wait_count_reg_n_0_[12] ,\wait_count_reg_n_0_[11] ,\wait_count_reg_n_0_[10] ,\wait_count_reg_n_0_[9] ,\wait_count_reg_n_0_[8] ,\wait_count_reg_n_0_[7] ,\wait_count_reg_n_0_[6] ,\wait_count_reg_n_0_[5] ,\wait_count_reg_n_0_[4] ,\wait_count_reg_n_0_[3] ,\wait_count_reg_n_0_[2] ,\wait_count_reg_n_0_[1] ,\wait_count_reg_n_0_[0] }),
        .\wait_count_reg[11] (single_register_spi_n_13),
        .\wait_count_reg[15] (single_register_spi_n_12),
        .\wait_count_reg[15]_0 (single_register_spi_n_17),
        .\wait_count_reg[16] (single_register_spi_n_18),
        .\wait_count_reg[18] (single_register_spi_n_14),
        .\wait_count_reg[21] (single_register_spi_n_20),
        .\wait_count_reg[22] (single_register_spi_n_16),
        .\wait_count_reg[24] (single_register_spi_n_21),
        .\wait_count_reg[27] (single_register_spi_n_22),
        .\wait_count_reg[2] (single_register_spi_n_19),
        .\wait_count_reg[31] (single_register_spi_n_15),
        .who_am_i_data(who_am_i_data));
  (* FSM_ENCODED_STATES = "BOOT_WAIT:0000,WHO_START:0001,WHO_WAIT:0010,CFG4_START:0011,CFG4_WAIT:0100,CFG1_START:0101,CFG1_WAIT:0110,SETTLE_WAIT:0111,POLL_WAIT:1000,STATUS_START:1001,STATUS_WAIT:1010,BURST_START:1011,BURST_WAIT:1100,OUTPUT_SAMPLE:1101,FATAL:1110" *) 
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__0[0]),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "BOOT_WAIT:0000,WHO_START:0001,WHO_WAIT:0010,CFG4_START:0011,CFG4_WAIT:0100,CFG1_START:0101,CFG1_WAIT:0110,SETTLE_WAIT:0111,POLL_WAIT:1000,STATUS_START:1001,STATUS_WAIT:1010,BURST_START:1011,BURST_WAIT:1100,OUTPUT_SAMPLE:1101,FATAL:1110" *) 
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__0[1]),
        .Q(state[1]));
  (* FSM_ENCODED_STATES = "BOOT_WAIT:0000,WHO_START:0001,WHO_WAIT:0010,CFG4_START:0011,CFG4_WAIT:0100,CFG1_START:0101,CFG1_WAIT:0110,SETTLE_WAIT:0111,POLL_WAIT:1000,STATUS_START:1001,STATUS_WAIT:1010,BURST_START:1011,BURST_WAIT:1100,OUTPUT_SAMPLE:1101,FATAL:1110" *) 
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__0[2]),
        .Q(state[2]));
  (* FSM_ENCODED_STATES = "BOOT_WAIT:0000,WHO_START:0001,WHO_WAIT:0010,CFG4_START:0011,CFG4_WAIT:0100,CFG1_START:0101,CFG1_WAIT:0110,SETTLE_WAIT:0111,POLL_WAIT:1000,STATUS_START:1001,STATUS_WAIT:1010,BURST_START:1011,BURST_WAIT:1100,OUTPUT_SAMPLE:1101,FATAL:1110" *) 
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \state_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__0[3]),
        .Q(state[3]));
  LUT6 #(
    .INIT(64'h4544444455555555)) 
    \wait_count[0]_i_1 
       (.I0(\wait_count_reg_n_0_[0] ),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[10]_i_1 
       (.I0(data0[10]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[11]_i_1 
       (.I0(data0[11]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[12]_i_1 
       (.I0(data0[12]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[13]_i_1 
       (.I0(data0[13]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[14]_i_1 
       (.I0(data0[14]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[15]_i_1 
       (.I0(data0[15]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[16]_i_1 
       (.I0(data0[16]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[17]_i_1 
       (.I0(data0[17]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[18]_i_1 
       (.I0(data0[18]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[19]_i_1 
       (.I0(data0[19]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[1]_i_1 
       (.I0(data0[1]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[20]_i_1 
       (.I0(data0[20]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[21]_i_1 
       (.I0(data0[21]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[22]_i_1 
       (.I0(data0[22]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[23]_i_1 
       (.I0(data0[23]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[24]_i_1 
       (.I0(data0[24]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[25]_i_1 
       (.I0(data0[25]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[26]_i_1 
       (.I0(data0[26]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[27]_i_1 
       (.I0(data0[27]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[28]_i_1 
       (.I0(data0[28]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[29]_i_1 
       (.I0(data0[29]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[2]_i_1 
       (.I0(data0[2]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[30]_i_1 
       (.I0(data0[30]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFF)) 
    \wait_count[31]_i_10 
       (.I0(\wait_count_reg_n_0_[11] ),
        .I1(\wait_count_reg_n_0_[10] ),
        .I2(\wait_count_reg_n_0_[4] ),
        .I3(\wait_count_reg_n_0_[3] ),
        .I4(\wait_count_reg_n_0_[12] ),
        .I5(\wait_count_reg_n_0_[23] ),
        .O(\wait_count[31]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[31]_i_2 
       (.I0(data0[31]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \wait_count[31]_i_4 
       (.I0(single_register_spi_n_1),
        .I1(single_register_spi_n_14),
        .I2(single_register_spi_n_22),
        .I3(single_register_spi_n_13),
        .I4(\wait_count[31]_i_8_n_0 ),
        .I5(single_register_spi_n_16),
        .O(\wait_count[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \wait_count[31]_i_5 
       (.I0(state[3]),
        .I1(state[2]),
        .O(\wait_count[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEEEEEEEEFE)) 
    \wait_count[31]_i_6 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(\wait_count[31]_i_9_n_0 ),
        .I3(single_register_spi_n_15),
        .I4(\wait_count[31]_i_10_n_0 ),
        .I5(single_register_spi_n_18),
        .O(\wait_count[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hEFFFFFFF)) 
    \wait_count[31]_i_8 
       (.I0(single_register_spi_n_21),
        .I1(\wait_count_reg_n_0_[7] ),
        .I2(\wait_count_reg_n_0_[15] ),
        .I3(\wait_count_reg_n_0_[6] ),
        .I4(\wait_count_reg_n_0_[14] ),
        .O(\wait_count[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \wait_count[31]_i_9 
       (.I0(\wait_count_reg_n_0_[19] ),
        .I1(\wait_count_reg_n_0_[14] ),
        .I2(\wait_count_reg_n_0_[9] ),
        .I3(\wait_count_reg_n_0_[22] ),
        .I4(single_register_spi_n_20),
        .I5(single_register_spi_n_19),
        .O(\wait_count[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[3]_i_1 
       (.I0(data0[3]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[4]_i_1 
       (.I0(data0[4]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[5]_i_1 
       (.I0(data0[5]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[6]_i_1 
       (.I0(data0[6]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[7]_i_1 
       (.I0(data0[7]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[8]_i_1 
       (.I0(data0[8]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A888888AAAAAAAA)) 
    \wait_count[9]_i_1 
       (.I0(data0[9]),
        .I1(\wait_count[31]_i_4_n_0 ),
        .I2(\wait_count[31]_i_5_n_0 ),
        .I3(state[0]),
        .I4(single_register_spi_n_12),
        .I5(\wait_count[31]_i_6_n_0 ),
        .O(\wait_count[9]_i_1_n_0 ));
  FDCE \wait_count_reg[0] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[0]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[0] ));
  FDCE \wait_count_reg[10] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[10]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[10] ));
  FDCE \wait_count_reg[11] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[11]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[11] ));
  FDCE \wait_count_reg[12] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[12]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[12] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wait_count_reg[12]_i_2 
       (.CI(\wait_count_reg[8]_i_2_n_0 ),
        .CO({\wait_count_reg[12]_i_2_n_0 ,\wait_count_reg[12]_i_2_n_1 ,\wait_count_reg[12]_i_2_n_2 ,\wait_count_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S({\wait_count_reg_n_0_[12] ,\wait_count_reg_n_0_[11] ,\wait_count_reg_n_0_[10] ,\wait_count_reg_n_0_[9] }));
  FDCE \wait_count_reg[13] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[13]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[13] ));
  FDCE \wait_count_reg[14] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[14]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[14] ));
  FDCE \wait_count_reg[15] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[15]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[15] ));
  FDCE \wait_count_reg[16] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[16]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[16] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wait_count_reg[16]_i_2 
       (.CI(\wait_count_reg[12]_i_2_n_0 ),
        .CO({\wait_count_reg[16]_i_2_n_0 ,\wait_count_reg[16]_i_2_n_1 ,\wait_count_reg[16]_i_2_n_2 ,\wait_count_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S({\wait_count_reg_n_0_[16] ,\wait_count_reg_n_0_[15] ,\wait_count_reg_n_0_[14] ,\wait_count_reg_n_0_[13] }));
  FDCE \wait_count_reg[17] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[17]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[17] ));
  FDCE \wait_count_reg[18] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[18]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[18] ));
  FDCE \wait_count_reg[19] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[19]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[19] ));
  FDCE \wait_count_reg[1] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[1]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[1] ));
  FDCE \wait_count_reg[20] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[20]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[20] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wait_count_reg[20]_i_2 
       (.CI(\wait_count_reg[16]_i_2_n_0 ),
        .CO({\wait_count_reg[20]_i_2_n_0 ,\wait_count_reg[20]_i_2_n_1 ,\wait_count_reg[20]_i_2_n_2 ,\wait_count_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S({\wait_count_reg_n_0_[20] ,\wait_count_reg_n_0_[19] ,\wait_count_reg_n_0_[18] ,\wait_count_reg_n_0_[17] }));
  FDCE \wait_count_reg[21] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[21]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[21] ));
  FDCE \wait_count_reg[22] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[22]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[22] ));
  FDCE \wait_count_reg[23] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[23]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[23] ));
  FDCE \wait_count_reg[24] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[24]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[24] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wait_count_reg[24]_i_2 
       (.CI(\wait_count_reg[20]_i_2_n_0 ),
        .CO({\wait_count_reg[24]_i_2_n_0 ,\wait_count_reg[24]_i_2_n_1 ,\wait_count_reg[24]_i_2_n_2 ,\wait_count_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S({\wait_count_reg_n_0_[24] ,\wait_count_reg_n_0_[23] ,\wait_count_reg_n_0_[22] ,\wait_count_reg_n_0_[21] }));
  FDCE \wait_count_reg[25] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[25]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[25] ));
  FDCE \wait_count_reg[26] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[26]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[26] ));
  FDCE \wait_count_reg[27] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[27]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[27] ));
  FDCE \wait_count_reg[28] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[28]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[28] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wait_count_reg[28]_i_2 
       (.CI(\wait_count_reg[24]_i_2_n_0 ),
        .CO({\wait_count_reg[28]_i_2_n_0 ,\wait_count_reg[28]_i_2_n_1 ,\wait_count_reg[28]_i_2_n_2 ,\wait_count_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[28:25]),
        .S({\wait_count_reg_n_0_[28] ,\wait_count_reg_n_0_[27] ,\wait_count_reg_n_0_[26] ,\wait_count_reg_n_0_[25] }));
  FDCE \wait_count_reg[29] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[29]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[29] ));
  FDCE \wait_count_reg[2] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[2]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[2] ));
  FDCE \wait_count_reg[30] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[30]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[30] ));
  FDCE \wait_count_reg[31] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[31]_i_2_n_0 ),
        .Q(\wait_count_reg_n_0_[31] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wait_count_reg[31]_i_3 
       (.CI(\wait_count_reg[28]_i_2_n_0 ),
        .CO({\NLW_wait_count_reg[31]_i_3_CO_UNCONNECTED [3:2],\wait_count_reg[31]_i_3_n_2 ,\wait_count_reg[31]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wait_count_reg[31]_i_3_O_UNCONNECTED [3],data0[31:29]}),
        .S({1'b0,\wait_count_reg_n_0_[31] ,\wait_count_reg_n_0_[30] ,\wait_count_reg_n_0_[29] }));
  FDCE \wait_count_reg[3] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[3]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[3] ));
  FDCE \wait_count_reg[4] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[4]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[4] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wait_count_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\wait_count_reg[4]_i_2_n_0 ,\wait_count_reg[4]_i_2_n_1 ,\wait_count_reg[4]_i_2_n_2 ,\wait_count_reg[4]_i_2_n_3 }),
        .CYINIT(\wait_count_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S({\wait_count_reg_n_0_[4] ,\wait_count_reg_n_0_[3] ,\wait_count_reg_n_0_[2] ,\wait_count_reg_n_0_[1] }));
  FDCE \wait_count_reg[5] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[5]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[5] ));
  FDCE \wait_count_reg[6] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[6]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[6] ));
  FDCE \wait_count_reg[7] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[7]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[7] ));
  FDCE \wait_count_reg[8] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[8]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[8] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \wait_count_reg[8]_i_2 
       (.CI(\wait_count_reg[4]_i_2_n_0 ),
        .CO({\wait_count_reg[8]_i_2_n_0 ,\wait_count_reg[8]_i_2_n_1 ,\wait_count_reg[8]_i_2_n_2 ,\wait_count_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S({\wait_count_reg_n_0_[8] ,\wait_count_reg_n_0_[7] ,\wait_count_reg_n_0_[6] ,\wait_count_reg_n_0_[5] }));
  FDCE \wait_count_reg[9] 
       (.C(clk),
        .CE(single_register_spi_n_7),
        .CLR(xyz_burst_spi_n_0),
        .D(\wait_count[9]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[9] ));
  LUT4 #(
    .INIT(16'h0010)) 
    \who_am_i_data[7]_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(\who_am_i_data[7]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \who_am_i_data_reg[0] 
       (.C(clk),
        .CE(\who_am_i_data[7]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_30),
        .Q(who_am_i_data[0]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \who_am_i_data_reg[1] 
       (.C(clk),
        .CE(\who_am_i_data[7]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_29),
        .Q(who_am_i_data[1]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \who_am_i_data_reg[2] 
       (.C(clk),
        .CE(\who_am_i_data[7]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_28),
        .Q(who_am_i_data[2]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \who_am_i_data_reg[3] 
       (.C(clk),
        .CE(\who_am_i_data[7]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_27),
        .Q(who_am_i_data[3]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \who_am_i_data_reg[4] 
       (.C(clk),
        .CE(\who_am_i_data[7]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_26),
        .Q(who_am_i_data[4]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \who_am_i_data_reg[5] 
       (.C(clk),
        .CE(\who_am_i_data[7]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_25),
        .Q(who_am_i_data[5]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \who_am_i_data_reg[6] 
       (.C(clk),
        .CE(\who_am_i_data[7]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_24),
        .Q(who_am_i_data[6]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \who_am_i_data_reg[7] 
       (.C(clk),
        .CE(\who_am_i_data[7]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(single_register_spi_n_23),
        .Q(who_am_i_data[7]));
  design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_burst_reader xyz_burst_spi
       (.D(p_0_in__2),
        .Q(state),
        .burst_cs_n(burst_cs_n),
        .burst_mosi(burst_mosi),
        .burst_sclk(burst_sclk),
        .clk(clk),
        .done_reg_0(xyz_burst_spi_n_1),
        .done_reg_1(xyz_burst_spi_n_50),
        .lis3dh_miso(lis3dh_miso),
        .out(state),
        .\read_data_reg[23]_0 ({xyz_burst_spi_n_18,xyz_burst_spi_n_19,xyz_burst_spi_n_20,xyz_burst_spi_n_21,xyz_burst_spi_n_22,xyz_burst_spi_n_23,xyz_burst_spi_n_24,xyz_burst_spi_n_25,xyz_burst_spi_n_26,xyz_burst_spi_n_27,xyz_burst_spi_n_28,xyz_burst_spi_n_29,xyz_burst_spi_n_30,xyz_burst_spi_n_31,xyz_burst_spi_n_32,xyz_burst_spi_n_33}),
        .\read_data_reg[7]_0 ({xyz_burst_spi_n_34,xyz_burst_spi_n_35,xyz_burst_spi_n_36,xyz_burst_spi_n_37,xyz_burst_spi_n_38,xyz_burst_spi_n_39,xyz_burst_spi_n_40,xyz_burst_spi_n_41,xyz_burst_spi_n_42,xyz_burst_spi_n_43,xyz_burst_spi_n_44,xyz_burst_spi_n_45,xyz_burst_spi_n_46,xyz_burst_spi_n_47,xyz_burst_spi_n_48,xyz_burst_spi_n_49}),
        .rst_n(rst_n),
        .s_axi_aresetn(xyz_burst_spi_n_0),
        .xyz_x(xyz_x),
        .xyz_y(xyz_y),
        .xyz_z(xyz_z));
  (* KEEP = "yes" *) 
  FDCE xyz_valid_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_1),
        .Q(xyz_valid));
  LUT4 #(
    .INIT(16'h0008)) 
    \xyz_x[15]_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(\xyz_x[15]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[0] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[0]),
        .Q(xyz_x[0]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[10] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[10]),
        .Q(xyz_x[10]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[11] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[11]),
        .Q(xyz_x[11]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[12] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[12]),
        .Q(xyz_x[12]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[13] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[13]),
        .Q(xyz_x[13]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[14] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[14]),
        .Q(xyz_x[14]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[15] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[15]),
        .Q(xyz_x[15]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[1] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[1]),
        .Q(xyz_x[1]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[2] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[2]),
        .Q(xyz_x[2]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[3] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[3]),
        .Q(xyz_x[3]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[4] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[4]),
        .Q(xyz_x[4]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[5] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[5]),
        .Q(xyz_x[5]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[6] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[6]),
        .Q(xyz_x[6]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[7] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[7]),
        .Q(xyz_x[7]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[8] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[8]),
        .Q(xyz_x[8]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_x_reg[9] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(p_0_in__2[9]),
        .Q(xyz_x[9]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[0] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_33),
        .Q(xyz_y[0]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[10] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_23),
        .Q(xyz_y[10]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[11] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_22),
        .Q(xyz_y[11]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[12] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_21),
        .Q(xyz_y[12]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[13] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_20),
        .Q(xyz_y[13]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[14] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_19),
        .Q(xyz_y[14]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[15] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_18),
        .Q(xyz_y[15]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[1] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_32),
        .Q(xyz_y[1]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[2] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_31),
        .Q(xyz_y[2]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[3] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_30),
        .Q(xyz_y[3]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[4] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_29),
        .Q(xyz_y[4]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[5] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_28),
        .Q(xyz_y[5]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[6] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_27),
        .Q(xyz_y[6]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[7] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_26),
        .Q(xyz_y[7]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[8] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_25),
        .Q(xyz_y[8]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_y_reg[9] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_24),
        .Q(xyz_y[9]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[0] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_49),
        .Q(xyz_z[0]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[10] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_39),
        .Q(xyz_z[10]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[11] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_38),
        .Q(xyz_z[11]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[12] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_37),
        .Q(xyz_z[12]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[13] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_36),
        .Q(xyz_z[13]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[14] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_35),
        .Q(xyz_z[14]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[15] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_34),
        .Q(xyz_z[15]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[1] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_48),
        .Q(xyz_z[1]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[2] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_47),
        .Q(xyz_z[2]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[3] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_46),
        .Q(xyz_z[3]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[4] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_45),
        .Q(xyz_z[4]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[5] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_44),
        .Q(xyz_z[5]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[6] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_43),
        .Q(xyz_z[6]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[7] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_42),
        .Q(xyz_z[7]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[8] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_41),
        .Q(xyz_z[8]));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDCE \xyz_z_reg[9] 
       (.C(clk),
        .CE(\xyz_x[15]_i_1_n_0 ),
        .CLR(xyz_burst_spi_n_0),
        .D(xyz_burst_spi_n_40),
        .Q(xyz_z[9]));
endmodule

(* ORIG_REF_NAME = "vibration_axi_lite_slave" *) 
module design_1_lis3dh_vibration_axi_0_0_vibration_axi_lite_slave
   (s_axi_aresetn_0,
    s_axi_rresp,
    s_axi_bvalid_reg_0,
    s_axi_bresp,
    s_axi_rvalid_reg_0,
    s_axi_wready,
    s_axi_awready,
    s_axi_arready,
    s_axi_rdata,
    snapshot_seq0,
    result_sample_count,
    s_axi_aclk,
    sample_drop_count,
    s_axi_wvalid,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_arvalid,
    init_done,
    overflow,
    s_axi_araddr,
    sensor_overrun,
    error,
    s_axi_awaddr,
    s_axi_bready,
    s_axi_rready,
    D,
    \snapshot_sumsq_reg[34]_0 );
  output s_axi_aresetn_0;
  output [0:0]s_axi_rresp;
  output s_axi_bvalid_reg_0;
  output [0:0]s_axi_bresp;
  output s_axi_rvalid_reg_0;
  output s_axi_wready;
  output s_axi_awready;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  input snapshot_seq0;
  input [0:0]result_sample_count;
  input s_axi_aclk;
  input [31:0]sample_drop_count;
  input s_axi_wvalid;
  input s_axi_aresetn;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input init_done;
  input overflow;
  input [11:0]s_axi_araddr;
  input sensor_overrun;
  input error;
  input [11:0]s_axi_awaddr;
  input s_axi_bready;
  input s_axi_rready;
  input [15:0]D;
  input [34:0]\snapshot_sumsq_reg[34]_0 ;

  wire [15:0]D;
  wire [11:0]aw_addr_hold;
  wire aw_fire;
  wire aw_pending_i_1_n_0;
  wire aw_pending_reg_n_0;
  wire [2:0]data3;
  wire error;
  wire init_done;
  wire overflow;
  wire result_available;
  wire [0:0]result_sample_count;
  wire s_axi_aclk;
  wire [11:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [11:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire \s_axi_bresp[1]_i_1_n_0 ;
  wire \s_axi_bresp[1]_i_3_n_0 ;
  wire \s_axi_bresp[1]_i_4_n_0 ;
  wire \s_axi_bresp[1]_i_5_n_0 ;
  wire \s_axi_bresp[1]_i_7_n_0 ;
  wire \s_axi_bresp[1]_i_8_n_0 ;
  wire \s_axi_bresp[1]_i_9_n_0 ;
  wire s_axi_bvalid_i_1_n_0;
  wire s_axi_bvalid_reg_0;
  wire [31:0]s_axi_rdata;
  wire s_axi_rdata0;
  wire \s_axi_rdata[0]_i_1_n_0 ;
  wire \s_axi_rdata[0]_i_2_n_0 ;
  wire \s_axi_rdata[0]_i_3_n_0 ;
  wire \s_axi_rdata[0]_i_4_n_0 ;
  wire \s_axi_rdata[0]_i_5_n_0 ;
  wire \s_axi_rdata[10]_i_1_n_0 ;
  wire \s_axi_rdata[10]_i_2_n_0 ;
  wire \s_axi_rdata[11]_i_1_n_0 ;
  wire \s_axi_rdata[11]_i_2_n_0 ;
  wire \s_axi_rdata[12]_i_1_n_0 ;
  wire \s_axi_rdata[12]_i_2_n_0 ;
  wire \s_axi_rdata[13]_i_1_n_0 ;
  wire \s_axi_rdata[13]_i_2_n_0 ;
  wire \s_axi_rdata[14]_i_1_n_0 ;
  wire \s_axi_rdata[14]_i_2_n_0 ;
  wire \s_axi_rdata[14]_i_3_n_0 ;
  wire \s_axi_rdata[14]_i_4_n_0 ;
  wire \s_axi_rdata[15]_i_1_n_0 ;
  wire \s_axi_rdata[15]_i_2_n_0 ;
  wire \s_axi_rdata[15]_i_3_n_0 ;
  wire \s_axi_rdata[15]_i_4_n_0 ;
  wire \s_axi_rdata[16]_i_1_n_0 ;
  wire \s_axi_rdata[16]_i_2_n_0 ;
  wire \s_axi_rdata[16]_i_3_n_0 ;
  wire \s_axi_rdata[16]_i_4_n_0 ;
  wire \s_axi_rdata[17]_i_1_n_0 ;
  wire \s_axi_rdata[17]_i_2_n_0 ;
  wire \s_axi_rdata[18]_i_1_n_0 ;
  wire \s_axi_rdata[18]_i_2_n_0 ;
  wire \s_axi_rdata[19]_i_1_n_0 ;
  wire \s_axi_rdata[19]_i_2_n_0 ;
  wire \s_axi_rdata[1]_i_1_n_0 ;
  wire \s_axi_rdata[1]_i_2_n_0 ;
  wire \s_axi_rdata[1]_i_3_n_0 ;
  wire \s_axi_rdata[20]_i_1_n_0 ;
  wire \s_axi_rdata[20]_i_2_n_0 ;
  wire \s_axi_rdata[21]_i_1_n_0 ;
  wire \s_axi_rdata[21]_i_2_n_0 ;
  wire \s_axi_rdata[22]_i_1_n_0 ;
  wire \s_axi_rdata[22]_i_2_n_0 ;
  wire \s_axi_rdata[23]_i_1_n_0 ;
  wire \s_axi_rdata[23]_i_2_n_0 ;
  wire \s_axi_rdata[24]_i_1_n_0 ;
  wire \s_axi_rdata[24]_i_2_n_0 ;
  wire \s_axi_rdata[25]_i_1_n_0 ;
  wire \s_axi_rdata[25]_i_2_n_0 ;
  wire \s_axi_rdata[26]_i_1_n_0 ;
  wire \s_axi_rdata[26]_i_2_n_0 ;
  wire \s_axi_rdata[27]_i_1_n_0 ;
  wire \s_axi_rdata[27]_i_2_n_0 ;
  wire \s_axi_rdata[28]_i_1_n_0 ;
  wire \s_axi_rdata[28]_i_2_n_0 ;
  wire \s_axi_rdata[29]_i_1_n_0 ;
  wire \s_axi_rdata[29]_i_2_n_0 ;
  wire \s_axi_rdata[2]_i_1_n_0 ;
  wire \s_axi_rdata[2]_i_2_n_0 ;
  wire \s_axi_rdata[2]_i_3_n_0 ;
  wire \s_axi_rdata[30]_i_1_n_0 ;
  wire \s_axi_rdata[30]_i_2_n_0 ;
  wire \s_axi_rdata[30]_i_3_n_0 ;
  wire \s_axi_rdata[30]_i_4_n_0 ;
  wire \s_axi_rdata[30]_i_5_n_0 ;
  wire \s_axi_rdata[30]_i_6_n_0 ;
  wire \s_axi_rdata[31]_i_2_n_0 ;
  wire \s_axi_rdata[31]_i_3_n_0 ;
  wire \s_axi_rdata[31]_i_4_n_0 ;
  wire \s_axi_rdata[31]_i_5_n_0 ;
  wire \s_axi_rdata[31]_i_6_n_0 ;
  wire \s_axi_rdata[3]_i_1_n_0 ;
  wire \s_axi_rdata[3]_i_2_n_0 ;
  wire \s_axi_rdata[3]_i_3_n_0 ;
  wire \s_axi_rdata[4]_i_1_n_0 ;
  wire \s_axi_rdata[4]_i_2_n_0 ;
  wire \s_axi_rdata[4]_i_3_n_0 ;
  wire \s_axi_rdata[4]_i_4_n_0 ;
  wire \s_axi_rdata[4]_i_5_n_0 ;
  wire \s_axi_rdata[5]_i_1_n_0 ;
  wire \s_axi_rdata[5]_i_2_n_0 ;
  wire \s_axi_rdata[6]_i_1_n_0 ;
  wire \s_axi_rdata[6]_i_2_n_0 ;
  wire \s_axi_rdata[7]_i_1_n_0 ;
  wire \s_axi_rdata[7]_i_2_n_0 ;
  wire \s_axi_rdata[8]_i_1_n_0 ;
  wire \s_axi_rdata[8]_i_2_n_0 ;
  wire \s_axi_rdata[9]_i_1_n_0 ;
  wire \s_axi_rdata[9]_i_2_n_0 ;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire \s_axi_rresp[1]_i_1_n_0 ;
  wire s_axi_rvalid_i_1_n_0;
  wire s_axi_rvalid_reg_0;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [31:0]sample_drop_count;
  wire sensor_overrun;
  wire [4:4]snapshot_count;
  wire [15:0]snapshot_peak;
  wire snapshot_seq0;
  wire \snapshot_seq[0]_i_2_n_0 ;
  wire [31:0]snapshot_seq_reg;
  wire \snapshot_seq_reg[0]_i_1_n_0 ;
  wire \snapshot_seq_reg[0]_i_1_n_1 ;
  wire \snapshot_seq_reg[0]_i_1_n_2 ;
  wire \snapshot_seq_reg[0]_i_1_n_3 ;
  wire \snapshot_seq_reg[0]_i_1_n_4 ;
  wire \snapshot_seq_reg[0]_i_1_n_5 ;
  wire \snapshot_seq_reg[0]_i_1_n_6 ;
  wire \snapshot_seq_reg[0]_i_1_n_7 ;
  wire \snapshot_seq_reg[12]_i_1_n_0 ;
  wire \snapshot_seq_reg[12]_i_1_n_1 ;
  wire \snapshot_seq_reg[12]_i_1_n_2 ;
  wire \snapshot_seq_reg[12]_i_1_n_3 ;
  wire \snapshot_seq_reg[12]_i_1_n_4 ;
  wire \snapshot_seq_reg[12]_i_1_n_5 ;
  wire \snapshot_seq_reg[12]_i_1_n_6 ;
  wire \snapshot_seq_reg[12]_i_1_n_7 ;
  wire \snapshot_seq_reg[16]_i_1_n_0 ;
  wire \snapshot_seq_reg[16]_i_1_n_1 ;
  wire \snapshot_seq_reg[16]_i_1_n_2 ;
  wire \snapshot_seq_reg[16]_i_1_n_3 ;
  wire \snapshot_seq_reg[16]_i_1_n_4 ;
  wire \snapshot_seq_reg[16]_i_1_n_5 ;
  wire \snapshot_seq_reg[16]_i_1_n_6 ;
  wire \snapshot_seq_reg[16]_i_1_n_7 ;
  wire \snapshot_seq_reg[20]_i_1_n_0 ;
  wire \snapshot_seq_reg[20]_i_1_n_1 ;
  wire \snapshot_seq_reg[20]_i_1_n_2 ;
  wire \snapshot_seq_reg[20]_i_1_n_3 ;
  wire \snapshot_seq_reg[20]_i_1_n_4 ;
  wire \snapshot_seq_reg[20]_i_1_n_5 ;
  wire \snapshot_seq_reg[20]_i_1_n_6 ;
  wire \snapshot_seq_reg[20]_i_1_n_7 ;
  wire \snapshot_seq_reg[24]_i_1_n_0 ;
  wire \snapshot_seq_reg[24]_i_1_n_1 ;
  wire \snapshot_seq_reg[24]_i_1_n_2 ;
  wire \snapshot_seq_reg[24]_i_1_n_3 ;
  wire \snapshot_seq_reg[24]_i_1_n_4 ;
  wire \snapshot_seq_reg[24]_i_1_n_5 ;
  wire \snapshot_seq_reg[24]_i_1_n_6 ;
  wire \snapshot_seq_reg[24]_i_1_n_7 ;
  wire \snapshot_seq_reg[28]_i_1_n_1 ;
  wire \snapshot_seq_reg[28]_i_1_n_2 ;
  wire \snapshot_seq_reg[28]_i_1_n_3 ;
  wire \snapshot_seq_reg[28]_i_1_n_4 ;
  wire \snapshot_seq_reg[28]_i_1_n_5 ;
  wire \snapshot_seq_reg[28]_i_1_n_6 ;
  wire \snapshot_seq_reg[28]_i_1_n_7 ;
  wire \snapshot_seq_reg[4]_i_1_n_0 ;
  wire \snapshot_seq_reg[4]_i_1_n_1 ;
  wire \snapshot_seq_reg[4]_i_1_n_2 ;
  wire \snapshot_seq_reg[4]_i_1_n_3 ;
  wire \snapshot_seq_reg[4]_i_1_n_4 ;
  wire \snapshot_seq_reg[4]_i_1_n_5 ;
  wire \snapshot_seq_reg[4]_i_1_n_6 ;
  wire \snapshot_seq_reg[4]_i_1_n_7 ;
  wire \snapshot_seq_reg[8]_i_1_n_0 ;
  wire \snapshot_seq_reg[8]_i_1_n_1 ;
  wire \snapshot_seq_reg[8]_i_1_n_2 ;
  wire \snapshot_seq_reg[8]_i_1_n_3 ;
  wire \snapshot_seq_reg[8]_i_1_n_4 ;
  wire \snapshot_seq_reg[8]_i_1_n_5 ;
  wire \snapshot_seq_reg[8]_i_1_n_6 ;
  wire \snapshot_seq_reg[8]_i_1_n_7 ;
  wire [34:0]\snapshot_sumsq_reg[34]_0 ;
  wire \snapshot_sumsq_reg_n_0_[0] ;
  wire \snapshot_sumsq_reg_n_0_[10] ;
  wire \snapshot_sumsq_reg_n_0_[11] ;
  wire \snapshot_sumsq_reg_n_0_[12] ;
  wire \snapshot_sumsq_reg_n_0_[13] ;
  wire \snapshot_sumsq_reg_n_0_[14] ;
  wire \snapshot_sumsq_reg_n_0_[15] ;
  wire \snapshot_sumsq_reg_n_0_[16] ;
  wire \snapshot_sumsq_reg_n_0_[17] ;
  wire \snapshot_sumsq_reg_n_0_[18] ;
  wire \snapshot_sumsq_reg_n_0_[19] ;
  wire \snapshot_sumsq_reg_n_0_[1] ;
  wire \snapshot_sumsq_reg_n_0_[20] ;
  wire \snapshot_sumsq_reg_n_0_[21] ;
  wire \snapshot_sumsq_reg_n_0_[22] ;
  wire \snapshot_sumsq_reg_n_0_[23] ;
  wire \snapshot_sumsq_reg_n_0_[24] ;
  wire \snapshot_sumsq_reg_n_0_[25] ;
  wire \snapshot_sumsq_reg_n_0_[26] ;
  wire \snapshot_sumsq_reg_n_0_[27] ;
  wire \snapshot_sumsq_reg_n_0_[28] ;
  wire \snapshot_sumsq_reg_n_0_[29] ;
  wire \snapshot_sumsq_reg_n_0_[2] ;
  wire \snapshot_sumsq_reg_n_0_[30] ;
  wire \snapshot_sumsq_reg_n_0_[31] ;
  wire \snapshot_sumsq_reg_n_0_[3] ;
  wire \snapshot_sumsq_reg_n_0_[4] ;
  wire \snapshot_sumsq_reg_n_0_[5] ;
  wire \snapshot_sumsq_reg_n_0_[6] ;
  wire \snapshot_sumsq_reg_n_0_[7] ;
  wire \snapshot_sumsq_reg_n_0_[8] ;
  wire \snapshot_sumsq_reg_n_0_[9] ;
  wire w_pending_i_1_n_0;
  wire w_pending_reg_n_0;
  wire write_commit;
  wire [3:3]\NLW_snapshot_seq_reg[28]_i_1_CO_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h0400)) 
    \aw_addr_hold[11]_i_1 
       (.I0(aw_pending_reg_n_0),
        .I1(s_axi_aresetn),
        .I2(s_axi_bvalid_reg_0),
        .I3(s_axi_awvalid),
        .O(aw_fire));
  FDCE \aw_addr_hold_reg[0] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[0]),
        .Q(aw_addr_hold[0]));
  FDCE \aw_addr_hold_reg[10] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[10]),
        .Q(aw_addr_hold[10]));
  FDCE \aw_addr_hold_reg[11] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[11]),
        .Q(aw_addr_hold[11]));
  FDCE \aw_addr_hold_reg[1] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[1]),
        .Q(aw_addr_hold[1]));
  FDCE \aw_addr_hold_reg[2] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[2]),
        .Q(aw_addr_hold[2]));
  FDCE \aw_addr_hold_reg[3] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[3]),
        .Q(aw_addr_hold[3]));
  FDCE \aw_addr_hold_reg[4] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[4]),
        .Q(aw_addr_hold[4]));
  FDCE \aw_addr_hold_reg[5] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[5]),
        .Q(aw_addr_hold[5]));
  FDCE \aw_addr_hold_reg[6] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[6]),
        .Q(aw_addr_hold[6]));
  FDCE \aw_addr_hold_reg[7] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[7]),
        .Q(aw_addr_hold[7]));
  FDCE \aw_addr_hold_reg[8] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[8]),
        .Q(aw_addr_hold[8]));
  FDCE \aw_addr_hold_reg[9] 
       (.C(s_axi_aclk),
        .CE(aw_fire),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_awaddr[9]),
        .Q(aw_addr_hold[9]));
  LUT6 #(
    .INIT(64'hFF11FF5500100000)) 
    aw_pending_i_1
       (.I0(w_pending_reg_n_0),
        .I1(s_axi_wvalid),
        .I2(s_axi_awvalid),
        .I3(s_axi_bvalid_reg_0),
        .I4(s_axi_aresetn),
        .I5(aw_pending_reg_n_0),
        .O(aw_pending_i_1_n_0));
  FDCE aw_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(aw_pending_i_1_n_0),
        .Q(aw_pending_reg_n_0));
  FDCE result_available_reg
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(1'b1),
        .Q(result_available));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_arready_INST_0
       (.I0(s_axi_aresetn),
        .I1(s_axi_rvalid_reg_0),
        .O(s_axi_arready));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s_axi_awready_INST_0
       (.I0(s_axi_bvalid_reg_0),
        .I1(s_axi_aresetn),
        .I2(aw_pending_reg_n_0),
        .O(s_axi_awready));
  LUT5 #(
    .INIT(32'hFEFFFE00)) 
    \s_axi_bresp[1]_i_1 
       (.I0(\s_axi_bresp[1]_i_3_n_0 ),
        .I1(\s_axi_bresp[1]_i_4_n_0 ),
        .I2(\s_axi_bresp[1]_i_5_n_0 ),
        .I3(write_commit),
        .I4(s_axi_bresp),
        .O(\s_axi_bresp[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \s_axi_bresp[1]_i_2 
       (.I0(s_axi_aresetn),
        .O(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'hFAFAFAFAFAFAFAEA)) 
    \s_axi_bresp[1]_i_3 
       (.I0(\s_axi_bresp[1]_i_7_n_0 ),
        .I1(aw_addr_hold[5]),
        .I2(aw_pending_reg_n_0),
        .I3(aw_addr_hold[6]),
        .I4(aw_addr_hold[11]),
        .I5(aw_addr_hold[4]),
        .O(\s_axi_bresp[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF0FFF0FFFFFFFE)) 
    \s_axi_bresp[1]_i_4 
       (.I0(s_axi_awaddr[4]),
        .I1(s_axi_awaddr[11]),
        .I2(\s_axi_bresp[1]_i_8_n_0 ),
        .I3(\s_axi_bresp[1]_i_9_n_0 ),
        .I4(s_axi_awaddr[7]),
        .I5(aw_pending_reg_n_0),
        .O(\s_axi_bresp[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCCFFCCFA)) 
    \s_axi_bresp[1]_i_5 
       (.I0(s_axi_awaddr[0]),
        .I1(aw_addr_hold[7]),
        .I2(s_axi_awaddr[2]),
        .I3(aw_pending_reg_n_0),
        .I4(s_axi_awaddr[1]),
        .O(\s_axi_bresp[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000EEC00000E0C0)) 
    \s_axi_bresp[1]_i_6 
       (.I0(s_axi_wvalid),
        .I1(w_pending_reg_n_0),
        .I2(aw_pending_reg_n_0),
        .I3(s_axi_aresetn),
        .I4(s_axi_bvalid_reg_0),
        .I5(s_axi_awvalid),
        .O(write_commit));
  LUT6 #(
    .INIT(64'hFFFFFCFCFFAAFCFC)) 
    \s_axi_bresp[1]_i_7 
       (.I0(aw_addr_hold[0]),
        .I1(s_axi_awaddr[5]),
        .I2(s_axi_awaddr[6]),
        .I3(aw_addr_hold[2]),
        .I4(aw_pending_reg_n_0),
        .I5(aw_addr_hold[1]),
        .O(\s_axi_bresp[1]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hF0F0E0F0)) 
    \s_axi_bresp[1]_i_8 
       (.I0(aw_addr_hold[9]),
        .I1(aw_addr_hold[8]),
        .I2(aw_pending_reg_n_0),
        .I3(aw_addr_hold[3]),
        .I4(aw_addr_hold[10]),
        .O(\s_axi_bresp[1]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h00FF00EF)) 
    \s_axi_bresp[1]_i_9 
       (.I0(s_axi_awaddr[9]),
        .I1(s_axi_awaddr[8]),
        .I2(s_axi_awaddr[3]),
        .I3(aw_pending_reg_n_0),
        .I4(s_axi_awaddr[10]),
        .O(\s_axi_bresp[1]_i_9_n_0 ));
  FDCE \s_axi_bresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_bresp[1]_i_1_n_0 ),
        .Q(s_axi_bresp));
  LUT3 #(
    .INIT(8'hF2)) 
    s_axi_bvalid_i_1
       (.I0(s_axi_bvalid_reg_0),
        .I1(s_axi_bready),
        .I2(write_commit),
        .O(s_axi_bvalid_i_1_n_0));
  FDCE s_axi_bvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_bvalid_i_1_n_0),
        .Q(s_axi_bvalid_reg_0));
  LUT6 #(
    .INIT(64'h00000000AAEEFAAA)) 
    \s_axi_rdata[0]_i_1 
       (.I0(\s_axi_rdata[0]_i_2_n_0 ),
        .I1(init_done),
        .I2(sample_drop_count[0]),
        .I3(\s_axi_rdata[4]_i_2_n_0 ),
        .I4(\s_axi_rdata[30]_i_2_n_0 ),
        .I5(\s_axi_rdata[4]_i_4_n_0 ),
        .O(\s_axi_rdata[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAA808080)) 
    \s_axi_rdata[0]_i_2 
       (.I0(\s_axi_rdata[0]_i_3_n_0 ),
        .I1(snapshot_peak[0]),
        .I2(\s_axi_rdata[15]_i_4_n_0 ),
        .I3(\snapshot_sumsq_reg_n_0_[0] ),
        .I4(\s_axi_rdata[30]_i_6_n_0 ),
        .I5(\s_axi_rdata[0]_i_4_n_0 ),
        .O(\s_axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000001200000031)) 
    \s_axi_rdata[0]_i_3 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[5]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[0]),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFD5D5D5)) 
    \s_axi_rdata[0]_i_4 
       (.I0(\s_axi_rdata[16]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_5_n_0 ),
        .I2(snapshot_seq_reg[0]),
        .I3(data3[0]),
        .I4(\s_axi_rdata[0]_i_5_n_0 ),
        .O(\s_axi_rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF4FFFCFFF4)) 
    \s_axi_rdata[0]_i_5 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[5]),
        .I5(s_axi_araddr[4]),
        .O(\s_axi_rdata[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[10]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[15]_i_2_n_0 ),
        .I3(\s_axi_rdata[10]_i_2_n_0 ),
        .I4(sample_drop_count[10]),
        .O(\s_axi_rdata[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \s_axi_rdata[10]_i_2 
       (.I0(\s_axi_rdata[30]_i_5_n_0 ),
        .I1(snapshot_seq_reg[10]),
        .I2(\s_axi_rdata[30]_i_6_n_0 ),
        .I3(\snapshot_sumsq_reg_n_0_[10] ),
        .I4(snapshot_peak[10]),
        .I5(\s_axi_rdata[15]_i_4_n_0 ),
        .O(\s_axi_rdata[10]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[11]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[15]_i_2_n_0 ),
        .I3(\s_axi_rdata[11]_i_2_n_0 ),
        .I4(sample_drop_count[11]),
        .O(\s_axi_rdata[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \s_axi_rdata[11]_i_2 
       (.I0(\s_axi_rdata[30]_i_5_n_0 ),
        .I1(snapshot_seq_reg[11]),
        .I2(\s_axi_rdata[30]_i_6_n_0 ),
        .I3(\snapshot_sumsq_reg_n_0_[11] ),
        .I4(snapshot_peak[11]),
        .I5(\s_axi_rdata[15]_i_4_n_0 ),
        .O(\s_axi_rdata[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[12]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[15]_i_2_n_0 ),
        .I3(\s_axi_rdata[12]_i_2_n_0 ),
        .I4(sample_drop_count[12]),
        .O(\s_axi_rdata[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \s_axi_rdata[12]_i_2 
       (.I0(\s_axi_rdata[30]_i_5_n_0 ),
        .I1(snapshot_seq_reg[12]),
        .I2(\s_axi_rdata[30]_i_6_n_0 ),
        .I3(\snapshot_sumsq_reg_n_0_[12] ),
        .I4(snapshot_peak[12]),
        .I5(\s_axi_rdata[15]_i_4_n_0 ),
        .O(\s_axi_rdata[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[13]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[15]_i_2_n_0 ),
        .I3(\s_axi_rdata[13]_i_2_n_0 ),
        .I4(sample_drop_count[13]),
        .O(\s_axi_rdata[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \s_axi_rdata[13]_i_2 
       (.I0(\s_axi_rdata[30]_i_5_n_0 ),
        .I1(snapshot_seq_reg[13]),
        .I2(\s_axi_rdata[30]_i_6_n_0 ),
        .I3(\snapshot_sumsq_reg_n_0_[13] ),
        .I4(snapshot_peak[13]),
        .I5(\s_axi_rdata[15]_i_4_n_0 ),
        .O(\s_axi_rdata[13]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[14]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(\s_axi_rdata[14]_i_2_n_0 ),
        .I4(sample_drop_count[14]),
        .O(\s_axi_rdata[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FCFAFFF0FCFAF0F)) 
    \s_axi_rdata[14]_i_2 
       (.I0(\snapshot_sumsq_reg_n_0_[14] ),
        .I1(snapshot_peak[14]),
        .I2(\s_axi_rdata[16]_i_4_n_0 ),
        .I3(\s_axi_rdata[14]_i_3_n_0 ),
        .I4(\s_axi_rdata[14]_i_4_n_0 ),
        .I5(snapshot_seq_reg[14]),
        .O(\s_axi_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFCFFFFFFFFFFF8)) 
    \s_axi_rdata[14]_i_3 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDFFFDFFFDFDFD)) 
    \s_axi_rdata[14]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[5]),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[4]),
        .O(\s_axi_rdata[14]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[15]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[15]_i_2_n_0 ),
        .I3(\s_axi_rdata[15]_i_3_n_0 ),
        .I4(sample_drop_count[15]),
        .O(\s_axi_rdata[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0001010001000100)) 
    \s_axi_rdata[15]_i_2 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[2]),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \s_axi_rdata[15]_i_3 
       (.I0(\s_axi_rdata[30]_i_5_n_0 ),
        .I1(snapshot_seq_reg[15]),
        .I2(\s_axi_rdata[30]_i_6_n_0 ),
        .I3(\snapshot_sumsq_reg_n_0_[15] ),
        .I4(snapshot_peak[15]),
        .I5(\s_axi_rdata[15]_i_4_n_0 ),
        .O(\s_axi_rdata[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100010001)) 
    \s_axi_rdata[15]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[5]),
        .I5(s_axi_araddr[4]),
        .O(\s_axi_rdata[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8A0AAA2A8000A020)) 
    \s_axi_rdata[16]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[16]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata[16]_i_3_n_0 ),
        .I4(\s_axi_rdata[16]_i_4_n_0 ),
        .I5(sample_drop_count[16]),
        .O(\s_axi_rdata[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000F00010009)) 
    \s_axi_rdata[16]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[5]),
        .I5(s_axi_araddr[4]),
        .O(\s_axi_rdata[16]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFD5D5D5)) 
    \s_axi_rdata[16]_i_3 
       (.I0(\s_axi_rdata[16]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_5_n_0 ),
        .I2(snapshot_seq_reg[16]),
        .I3(\snapshot_sumsq_reg_n_0_[16] ),
        .I4(\s_axi_rdata[30]_i_6_n_0 ),
        .O(\s_axi_rdata[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFAFFFFFF7A)) 
    \s_axi_rdata[16]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[0]),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[16]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[17]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[17]_i_2_n_0 ),
        .O(\s_axi_rdata[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \s_axi_rdata[17]_i_2 
       (.I0(sample_drop_count[17]),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(snapshot_seq_reg[17]),
        .I4(\snapshot_sumsq_reg_n_0_[17] ),
        .I5(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[18]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[18]_i_2_n_0 ),
        .O(\s_axi_rdata[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \s_axi_rdata[18]_i_2 
       (.I0(sample_drop_count[18]),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(snapshot_seq_reg[18]),
        .I4(\snapshot_sumsq_reg_n_0_[18] ),
        .I5(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[18]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[19]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(\s_axi_rdata[19]_i_2_n_0 ),
        .I4(sample_drop_count[19]),
        .O(\s_axi_rdata[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFD5D5D5)) 
    \s_axi_rdata[19]_i_2 
       (.I0(\s_axi_rdata[16]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_5_n_0 ),
        .I2(snapshot_seq_reg[19]),
        .I3(\snapshot_sumsq_reg_n_0_[19] ),
        .I4(\s_axi_rdata[30]_i_6_n_0 ),
        .O(\s_axi_rdata[19]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata[1]_i_1 
       (.I0(\s_axi_rdata[1]_i_2_n_0 ),
        .I1(\s_axi_rdata[4]_i_4_n_0 ),
        .O(\s_axi_rdata[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF444444A0A0A0A0)) 
    \s_axi_rdata[1]_i_2 
       (.I0(\s_axi_rdata[30]_i_2_n_0 ),
        .I1(sample_drop_count[1]),
        .I2(error),
        .I3(\s_axi_rdata[1]_i_3_n_0 ),
        .I4(\s_axi_rdata[15]_i_2_n_0 ),
        .I5(\s_axi_rdata[4]_i_2_n_0 ),
        .O(\s_axi_rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCAFFCAF0CA0FCA00)) 
    \s_axi_rdata[1]_i_3 
       (.I0(snapshot_peak[1]),
        .I1(data3[1]),
        .I2(\s_axi_rdata[14]_i_3_n_0 ),
        .I3(\s_axi_rdata[14]_i_4_n_0 ),
        .I4(snapshot_seq_reg[1]),
        .I5(\snapshot_sumsq_reg_n_0_[1] ),
        .O(\s_axi_rdata[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[20]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[20]_i_2_n_0 ),
        .O(\s_axi_rdata[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \s_axi_rdata[20]_i_2 
       (.I0(sample_drop_count[20]),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(snapshot_seq_reg[20]),
        .I4(\snapshot_sumsq_reg_n_0_[20] ),
        .I5(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[20]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[21]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[21]_i_2_n_0 ),
        .O(\s_axi_rdata[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \s_axi_rdata[21]_i_2 
       (.I0(sample_drop_count[21]),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(snapshot_seq_reg[21]),
        .I4(\snapshot_sumsq_reg_n_0_[21] ),
        .I5(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[22]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(\s_axi_rdata[22]_i_2_n_0 ),
        .I4(sample_drop_count[22]),
        .O(\s_axi_rdata[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFD5D5D5)) 
    \s_axi_rdata[22]_i_2 
       (.I0(\s_axi_rdata[16]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_5_n_0 ),
        .I2(snapshot_seq_reg[22]),
        .I3(\snapshot_sumsq_reg_n_0_[22] ),
        .I4(\s_axi_rdata[30]_i_6_n_0 ),
        .O(\s_axi_rdata[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[23]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[23]_i_2_n_0 ),
        .O(\s_axi_rdata[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \s_axi_rdata[23]_i_2 
       (.I0(sample_drop_count[23]),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(snapshot_seq_reg[23]),
        .I4(\snapshot_sumsq_reg_n_0_[23] ),
        .I5(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[24]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[24]_i_2_n_0 ),
        .O(\s_axi_rdata[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \s_axi_rdata[24]_i_2 
       (.I0(sample_drop_count[24]),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(snapshot_seq_reg[24]),
        .I4(\snapshot_sumsq_reg_n_0_[24] ),
        .I5(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[24]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[25]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(\s_axi_rdata[25]_i_2_n_0 ),
        .I4(sample_drop_count[25]),
        .O(\s_axi_rdata[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFD5D5D5)) 
    \s_axi_rdata[25]_i_2 
       (.I0(\s_axi_rdata[16]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_5_n_0 ),
        .I2(snapshot_seq_reg[25]),
        .I3(\snapshot_sumsq_reg_n_0_[25] ),
        .I4(\s_axi_rdata[30]_i_6_n_0 ),
        .O(\s_axi_rdata[25]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[26]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(\s_axi_rdata[26]_i_2_n_0 ),
        .I4(sample_drop_count[26]),
        .O(\s_axi_rdata[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFD5D5D5)) 
    \s_axi_rdata[26]_i_2 
       (.I0(\s_axi_rdata[16]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_5_n_0 ),
        .I2(snapshot_seq_reg[26]),
        .I3(\snapshot_sumsq_reg_n_0_[26] ),
        .I4(\s_axi_rdata[30]_i_6_n_0 ),
        .O(\s_axi_rdata[26]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[27]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[27]_i_2_n_0 ),
        .O(\s_axi_rdata[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \s_axi_rdata[27]_i_2 
       (.I0(sample_drop_count[27]),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(snapshot_seq_reg[27]),
        .I4(\snapshot_sumsq_reg_n_0_[27] ),
        .I5(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[27]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[28]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(\s_axi_rdata[28]_i_2_n_0 ),
        .I4(sample_drop_count[28]),
        .O(\s_axi_rdata[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFD5D5D5)) 
    \s_axi_rdata[28]_i_2 
       (.I0(\s_axi_rdata[16]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_5_n_0 ),
        .I2(snapshot_seq_reg[28]),
        .I3(\snapshot_sumsq_reg_n_0_[28] ),
        .I4(\s_axi_rdata[30]_i_6_n_0 ),
        .O(\s_axi_rdata[28]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[29]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[29]_i_2_n_0 ),
        .O(\s_axi_rdata[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \s_axi_rdata[29]_i_2 
       (.I0(sample_drop_count[29]),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(snapshot_seq_reg[29]),
        .I4(\snapshot_sumsq_reg_n_0_[29] ),
        .I5(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[29]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata[2]_i_1 
       (.I0(\s_axi_rdata[2]_i_2_n_0 ),
        .I1(\s_axi_rdata[4]_i_4_n_0 ),
        .O(\s_axi_rdata[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF444444A0A0A0A0)) 
    \s_axi_rdata[2]_i_2 
       (.I0(\s_axi_rdata[30]_i_2_n_0 ),
        .I1(sample_drop_count[2]),
        .I2(sensor_overrun),
        .I3(\s_axi_rdata[2]_i_3_n_0 ),
        .I4(\s_axi_rdata[15]_i_2_n_0 ),
        .I5(\s_axi_rdata[4]_i_2_n_0 ),
        .O(\s_axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCAFFCAF0CA0FCA00)) 
    \s_axi_rdata[2]_i_3 
       (.I0(snapshot_peak[2]),
        .I1(data3[2]),
        .I2(\s_axi_rdata[14]_i_3_n_0 ),
        .I3(\s_axi_rdata[14]_i_4_n_0 ),
        .I4(snapshot_seq_reg[2]),
        .I5(\snapshot_sumsq_reg_n_0_[2] ),
        .O(\s_axi_rdata[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[30]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(\s_axi_rdata[30]_i_4_n_0 ),
        .I4(sample_drop_count[30]),
        .O(\s_axi_rdata[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFDFFFFFFFFFF)) 
    \s_axi_rdata[30]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[5]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0001000200020007)) 
    \s_axi_rdata[30]_i_3 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[30]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFD5D5D5)) 
    \s_axi_rdata[30]_i_4 
       (.I0(\s_axi_rdata[16]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_5_n_0 ),
        .I2(snapshot_seq_reg[30]),
        .I3(\snapshot_sumsq_reg_n_0_[30] ),
        .I4(\s_axi_rdata[30]_i_6_n_0 ),
        .O(\s_axi_rdata[30]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \s_axi_rdata[30]_i_5 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[5]),
        .O(\s_axi_rdata[30]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000001300000000)) 
    \s_axi_rdata[30]_i_6 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[0]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[30]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \s_axi_rdata[31]_i_1 
       (.I0(s_axi_aresetn),
        .I1(s_axi_arvalid),
        .I2(s_axi_rvalid_reg_0),
        .O(s_axi_rdata0));
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[31]_i_2 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[31]_i_4_n_0 ),
        .O(\s_axi_rdata[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata[31]_i_3 
       (.I0(\s_axi_rdata[4]_i_2_n_0 ),
        .I1(\s_axi_rdata[4]_i_4_n_0 ),
        .O(\s_axi_rdata[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \s_axi_rdata[31]_i_4 
       (.I0(sample_drop_count[31]),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[31]_i_5_n_0 ),
        .I3(snapshot_seq_reg[31]),
        .I4(\snapshot_sumsq_reg_n_0_[31] ),
        .I5(\s_axi_rdata[31]_i_6_n_0 ),
        .O(\s_axi_rdata[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \s_axi_rdata[31]_i_5 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \s_axi_rdata[31]_i_6 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[5]),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[4]),
        .O(\s_axi_rdata[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAEEFAAA)) 
    \s_axi_rdata[3]_i_1 
       (.I0(\s_axi_rdata[3]_i_2_n_0 ),
        .I1(overflow),
        .I2(sample_drop_count[3]),
        .I3(\s_axi_rdata[4]_i_2_n_0 ),
        .I4(\s_axi_rdata[30]_i_2_n_0 ),
        .I5(\s_axi_rdata[4]_i_4_n_0 ),
        .O(\s_axi_rdata[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2A0A220228082000)) 
    \s_axi_rdata[3]_i_2 
       (.I0(\s_axi_rdata[3]_i_3_n_0 ),
        .I1(\s_axi_rdata[14]_i_3_n_0 ),
        .I2(\s_axi_rdata[14]_i_4_n_0 ),
        .I3(snapshot_peak[3]),
        .I4(\snapshot_sumsq_reg_n_0_[3] ),
        .I5(snapshot_seq_reg[3]),
        .O(\s_axi_rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000001200000030)) 
    \s_axi_rdata[3]_i_3 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[5]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[0]),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF00B8)) 
    \s_axi_rdata[4]_i_1 
       (.I0(sample_drop_count[4]),
        .I1(\s_axi_rdata[4]_i_2_n_0 ),
        .I2(snapshot_count),
        .I3(\s_axi_rdata[30]_i_2_n_0 ),
        .I4(\s_axi_rdata[4]_i_3_n_0 ),
        .I5(\s_axi_rdata[4]_i_4_n_0 ),
        .O(\s_axi_rdata[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFDFFFFFEFFFF)) 
    \s_axi_rdata[4]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[5]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8888F000)) 
    \s_axi_rdata[4]_i_3 
       (.I0(\s_axi_rdata[4]_i_5_n_0 ),
        .I1(\s_axi_rdata[30]_i_3_n_0 ),
        .I2(result_available),
        .I3(\s_axi_rdata[30]_i_2_n_0 ),
        .I4(\s_axi_rdata[4]_i_2_n_0 ),
        .O(\s_axi_rdata[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \s_axi_rdata[4]_i_4 
       (.I0(s_axi_araddr[11]),
        .I1(s_axi_araddr[10]),
        .I2(s_axi_araddr[9]),
        .I3(s_axi_araddr[8]),
        .I4(s_axi_araddr[6]),
        .I5(s_axi_araddr[7]),
        .O(\s_axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0FCFAFFF0FCFAF0F)) 
    \s_axi_rdata[4]_i_5 
       (.I0(\snapshot_sumsq_reg_n_0_[4] ),
        .I1(snapshot_peak[4]),
        .I2(\s_axi_rdata[16]_i_4_n_0 ),
        .I3(\s_axi_rdata[14]_i_3_n_0 ),
        .I4(\s_axi_rdata[14]_i_4_n_0 ),
        .I5(snapshot_seq_reg[4]),
        .O(\s_axi_rdata[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[5]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(\s_axi_rdata[5]_i_2_n_0 ),
        .I4(sample_drop_count[5]),
        .O(\s_axi_rdata[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FCFAFFF0FCFAF0F)) 
    \s_axi_rdata[5]_i_2 
       (.I0(\snapshot_sumsq_reg_n_0_[5] ),
        .I1(snapshot_peak[5]),
        .I2(\s_axi_rdata[16]_i_4_n_0 ),
        .I3(\s_axi_rdata[14]_i_3_n_0 ),
        .I4(\s_axi_rdata[14]_i_4_n_0 ),
        .I5(snapshot_seq_reg[5]),
        .O(\s_axi_rdata[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[6]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[15]_i_2_n_0 ),
        .I3(\s_axi_rdata[6]_i_2_n_0 ),
        .I4(sample_drop_count[6]),
        .O(\s_axi_rdata[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \s_axi_rdata[6]_i_2 
       (.I0(\s_axi_rdata[30]_i_5_n_0 ),
        .I1(snapshot_seq_reg[6]),
        .I2(\s_axi_rdata[30]_i_6_n_0 ),
        .I3(\snapshot_sumsq_reg_n_0_[6] ),
        .I4(snapshot_peak[6]),
        .I5(\s_axi_rdata[15]_i_4_n_0 ),
        .O(\s_axi_rdata[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[7]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[15]_i_2_n_0 ),
        .I3(\s_axi_rdata[7]_i_2_n_0 ),
        .I4(sample_drop_count[7]),
        .O(\s_axi_rdata[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \s_axi_rdata[7]_i_2 
       (.I0(\s_axi_rdata[30]_i_5_n_0 ),
        .I1(snapshot_seq_reg[7]),
        .I2(\s_axi_rdata[30]_i_6_n_0 ),
        .I3(\snapshot_sumsq_reg_n_0_[7] ),
        .I4(snapshot_peak[7]),
        .I5(\s_axi_rdata[15]_i_4_n_0 ),
        .O(\s_axi_rdata[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[8]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[15]_i_2_n_0 ),
        .I3(\s_axi_rdata[8]_i_2_n_0 ),
        .I4(sample_drop_count[8]),
        .O(\s_axi_rdata[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \s_axi_rdata[8]_i_2 
       (.I0(\s_axi_rdata[30]_i_5_n_0 ),
        .I1(snapshot_seq_reg[8]),
        .I2(\s_axi_rdata[30]_i_6_n_0 ),
        .I3(\snapshot_sumsq_reg_n_0_[8] ),
        .I4(snapshot_peak[8]),
        .I5(\s_axi_rdata[15]_i_4_n_0 ),
        .O(\s_axi_rdata[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA222A000)) 
    \s_axi_rdata[9]_i_1 
       (.I0(\s_axi_rdata[31]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_3_n_0 ),
        .I3(\s_axi_rdata[9]_i_2_n_0 ),
        .I4(sample_drop_count[9]),
        .O(\s_axi_rdata[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FCFAFFF0FCFAF0F)) 
    \s_axi_rdata[9]_i_2 
       (.I0(\snapshot_sumsq_reg_n_0_[9] ),
        .I1(snapshot_peak[9]),
        .I2(\s_axi_rdata[16]_i_4_n_0 ),
        .I3(\s_axi_rdata[14]_i_3_n_0 ),
        .I4(\s_axi_rdata[14]_i_4_n_0 ),
        .I5(snapshot_seq_reg[9]),
        .O(\s_axi_rdata[9]_i_2_n_0 ));
  FDCE \s_axi_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[0]_i_1_n_0 ),
        .Q(s_axi_rdata[0]));
  FDCE \s_axi_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[10]_i_1_n_0 ),
        .Q(s_axi_rdata[10]));
  FDCE \s_axi_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[11]_i_1_n_0 ),
        .Q(s_axi_rdata[11]));
  FDCE \s_axi_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[12]_i_1_n_0 ),
        .Q(s_axi_rdata[12]));
  FDCE \s_axi_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[13]_i_1_n_0 ),
        .Q(s_axi_rdata[13]));
  FDCE \s_axi_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[14]_i_1_n_0 ),
        .Q(s_axi_rdata[14]));
  FDCE \s_axi_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[15]_i_1_n_0 ),
        .Q(s_axi_rdata[15]));
  FDCE \s_axi_rdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[16]_i_1_n_0 ),
        .Q(s_axi_rdata[16]));
  FDCE \s_axi_rdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[17]_i_1_n_0 ),
        .Q(s_axi_rdata[17]));
  FDCE \s_axi_rdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[18]_i_1_n_0 ),
        .Q(s_axi_rdata[18]));
  FDCE \s_axi_rdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[19]_i_1_n_0 ),
        .Q(s_axi_rdata[19]));
  FDCE \s_axi_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[1]_i_1_n_0 ),
        .Q(s_axi_rdata[1]));
  FDCE \s_axi_rdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[20]_i_1_n_0 ),
        .Q(s_axi_rdata[20]));
  FDCE \s_axi_rdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[21]_i_1_n_0 ),
        .Q(s_axi_rdata[21]));
  FDCE \s_axi_rdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[22]_i_1_n_0 ),
        .Q(s_axi_rdata[22]));
  FDCE \s_axi_rdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[23]_i_1_n_0 ),
        .Q(s_axi_rdata[23]));
  FDCE \s_axi_rdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[24]_i_1_n_0 ),
        .Q(s_axi_rdata[24]));
  FDCE \s_axi_rdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[25]_i_1_n_0 ),
        .Q(s_axi_rdata[25]));
  FDCE \s_axi_rdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[26]_i_1_n_0 ),
        .Q(s_axi_rdata[26]));
  FDCE \s_axi_rdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[27]_i_1_n_0 ),
        .Q(s_axi_rdata[27]));
  FDCE \s_axi_rdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[28]_i_1_n_0 ),
        .Q(s_axi_rdata[28]));
  FDCE \s_axi_rdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[29]_i_1_n_0 ),
        .Q(s_axi_rdata[29]));
  FDCE \s_axi_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[2]_i_1_n_0 ),
        .Q(s_axi_rdata[2]));
  FDCE \s_axi_rdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[30]_i_1_n_0 ),
        .Q(s_axi_rdata[30]));
  FDCE \s_axi_rdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[31]_i_2_n_0 ),
        .Q(s_axi_rdata[31]));
  FDCE \s_axi_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[3]_i_1_n_0 ),
        .Q(s_axi_rdata[3]));
  FDCE \s_axi_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[4]_i_1_n_0 ),
        .Q(s_axi_rdata[4]));
  FDCE \s_axi_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[5]_i_1_n_0 ),
        .Q(s_axi_rdata[5]));
  FDCE \s_axi_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[6]_i_1_n_0 ),
        .Q(s_axi_rdata[6]));
  FDCE \s_axi_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[7]_i_1_n_0 ),
        .Q(s_axi_rdata[7]));
  FDCE \s_axi_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[8]_i_1_n_0 ),
        .Q(s_axi_rdata[8]));
  FDCE \s_axi_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rdata[9]_i_1_n_0 ),
        .Q(s_axi_rdata[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFE0)) 
    \s_axi_rresp[1]_i_1 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[1]),
        .I5(\s_axi_rdata[4]_i_4_n_0 ),
        .O(\s_axi_rresp[1]_i_1_n_0 ));
  FDCE \s_axi_rresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rdata0),
        .CLR(s_axi_aresetn_0),
        .D(\s_axi_rresp[1]_i_1_n_0 ),
        .Q(s_axi_rresp));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'h7444)) 
    s_axi_rvalid_i_1
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid_reg_0),
        .I2(s_axi_arvalid),
        .I3(s_axi_aresetn),
        .O(s_axi_rvalid_i_1_n_0));
  FDCE s_axi_rvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_rvalid_i_1_n_0),
        .Q(s_axi_rvalid_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'h04)) 
    s_axi_wready_INST_0
       (.I0(s_axi_bvalid_reg_0),
        .I1(s_axi_aresetn),
        .I2(w_pending_reg_n_0),
        .O(s_axi_wready));
  FDCE \snapshot_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(result_sample_count),
        .Q(snapshot_count));
  FDCE \snapshot_peak_reg[0] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[0]),
        .Q(snapshot_peak[0]));
  FDCE \snapshot_peak_reg[10] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[10]),
        .Q(snapshot_peak[10]));
  FDCE \snapshot_peak_reg[11] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[11]),
        .Q(snapshot_peak[11]));
  FDCE \snapshot_peak_reg[12] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[12]),
        .Q(snapshot_peak[12]));
  FDCE \snapshot_peak_reg[13] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[13]),
        .Q(snapshot_peak[13]));
  FDCE \snapshot_peak_reg[14] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[14]),
        .Q(snapshot_peak[14]));
  FDCE \snapshot_peak_reg[15] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[15]),
        .Q(snapshot_peak[15]));
  FDCE \snapshot_peak_reg[1] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[1]),
        .Q(snapshot_peak[1]));
  FDCE \snapshot_peak_reg[2] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[2]),
        .Q(snapshot_peak[2]));
  FDCE \snapshot_peak_reg[3] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[3]),
        .Q(snapshot_peak[3]));
  FDCE \snapshot_peak_reg[4] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[4]),
        .Q(snapshot_peak[4]));
  FDCE \snapshot_peak_reg[5] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[5]),
        .Q(snapshot_peak[5]));
  FDCE \snapshot_peak_reg[6] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[6]),
        .Q(snapshot_peak[6]));
  FDCE \snapshot_peak_reg[7] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[7]),
        .Q(snapshot_peak[7]));
  FDCE \snapshot_peak_reg[8] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[8]),
        .Q(snapshot_peak[8]));
  FDCE \snapshot_peak_reg[9] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(D[9]),
        .Q(snapshot_peak[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \snapshot_seq[0]_i_2 
       (.I0(snapshot_seq_reg[0]),
        .O(\snapshot_seq[0]_i_2_n_0 ));
  FDCE \snapshot_seq_reg[0] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[0]_i_1_n_7 ),
        .Q(snapshot_seq_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \snapshot_seq_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\snapshot_seq_reg[0]_i_1_n_0 ,\snapshot_seq_reg[0]_i_1_n_1 ,\snapshot_seq_reg[0]_i_1_n_2 ,\snapshot_seq_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\snapshot_seq_reg[0]_i_1_n_4 ,\snapshot_seq_reg[0]_i_1_n_5 ,\snapshot_seq_reg[0]_i_1_n_6 ,\snapshot_seq_reg[0]_i_1_n_7 }),
        .S({snapshot_seq_reg[3:1],\snapshot_seq[0]_i_2_n_0 }));
  FDCE \snapshot_seq_reg[10] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[8]_i_1_n_5 ),
        .Q(snapshot_seq_reg[10]));
  FDCE \snapshot_seq_reg[11] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[8]_i_1_n_4 ),
        .Q(snapshot_seq_reg[11]));
  FDCE \snapshot_seq_reg[12] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[12]_i_1_n_7 ),
        .Q(snapshot_seq_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \snapshot_seq_reg[12]_i_1 
       (.CI(\snapshot_seq_reg[8]_i_1_n_0 ),
        .CO({\snapshot_seq_reg[12]_i_1_n_0 ,\snapshot_seq_reg[12]_i_1_n_1 ,\snapshot_seq_reg[12]_i_1_n_2 ,\snapshot_seq_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\snapshot_seq_reg[12]_i_1_n_4 ,\snapshot_seq_reg[12]_i_1_n_5 ,\snapshot_seq_reg[12]_i_1_n_6 ,\snapshot_seq_reg[12]_i_1_n_7 }),
        .S(snapshot_seq_reg[15:12]));
  FDCE \snapshot_seq_reg[13] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[12]_i_1_n_6 ),
        .Q(snapshot_seq_reg[13]));
  FDCE \snapshot_seq_reg[14] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[12]_i_1_n_5 ),
        .Q(snapshot_seq_reg[14]));
  FDCE \snapshot_seq_reg[15] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[12]_i_1_n_4 ),
        .Q(snapshot_seq_reg[15]));
  FDCE \snapshot_seq_reg[16] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[16]_i_1_n_7 ),
        .Q(snapshot_seq_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \snapshot_seq_reg[16]_i_1 
       (.CI(\snapshot_seq_reg[12]_i_1_n_0 ),
        .CO({\snapshot_seq_reg[16]_i_1_n_0 ,\snapshot_seq_reg[16]_i_1_n_1 ,\snapshot_seq_reg[16]_i_1_n_2 ,\snapshot_seq_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\snapshot_seq_reg[16]_i_1_n_4 ,\snapshot_seq_reg[16]_i_1_n_5 ,\snapshot_seq_reg[16]_i_1_n_6 ,\snapshot_seq_reg[16]_i_1_n_7 }),
        .S(snapshot_seq_reg[19:16]));
  FDCE \snapshot_seq_reg[17] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[16]_i_1_n_6 ),
        .Q(snapshot_seq_reg[17]));
  FDCE \snapshot_seq_reg[18] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[16]_i_1_n_5 ),
        .Q(snapshot_seq_reg[18]));
  FDCE \snapshot_seq_reg[19] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[16]_i_1_n_4 ),
        .Q(snapshot_seq_reg[19]));
  FDCE \snapshot_seq_reg[1] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[0]_i_1_n_6 ),
        .Q(snapshot_seq_reg[1]));
  FDCE \snapshot_seq_reg[20] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[20]_i_1_n_7 ),
        .Q(snapshot_seq_reg[20]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \snapshot_seq_reg[20]_i_1 
       (.CI(\snapshot_seq_reg[16]_i_1_n_0 ),
        .CO({\snapshot_seq_reg[20]_i_1_n_0 ,\snapshot_seq_reg[20]_i_1_n_1 ,\snapshot_seq_reg[20]_i_1_n_2 ,\snapshot_seq_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\snapshot_seq_reg[20]_i_1_n_4 ,\snapshot_seq_reg[20]_i_1_n_5 ,\snapshot_seq_reg[20]_i_1_n_6 ,\snapshot_seq_reg[20]_i_1_n_7 }),
        .S(snapshot_seq_reg[23:20]));
  FDCE \snapshot_seq_reg[21] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[20]_i_1_n_6 ),
        .Q(snapshot_seq_reg[21]));
  FDCE \snapshot_seq_reg[22] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[20]_i_1_n_5 ),
        .Q(snapshot_seq_reg[22]));
  FDCE \snapshot_seq_reg[23] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[20]_i_1_n_4 ),
        .Q(snapshot_seq_reg[23]));
  FDCE \snapshot_seq_reg[24] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[24]_i_1_n_7 ),
        .Q(snapshot_seq_reg[24]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \snapshot_seq_reg[24]_i_1 
       (.CI(\snapshot_seq_reg[20]_i_1_n_0 ),
        .CO({\snapshot_seq_reg[24]_i_1_n_0 ,\snapshot_seq_reg[24]_i_1_n_1 ,\snapshot_seq_reg[24]_i_1_n_2 ,\snapshot_seq_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\snapshot_seq_reg[24]_i_1_n_4 ,\snapshot_seq_reg[24]_i_1_n_5 ,\snapshot_seq_reg[24]_i_1_n_6 ,\snapshot_seq_reg[24]_i_1_n_7 }),
        .S(snapshot_seq_reg[27:24]));
  FDCE \snapshot_seq_reg[25] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[24]_i_1_n_6 ),
        .Q(snapshot_seq_reg[25]));
  FDCE \snapshot_seq_reg[26] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[24]_i_1_n_5 ),
        .Q(snapshot_seq_reg[26]));
  FDCE \snapshot_seq_reg[27] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[24]_i_1_n_4 ),
        .Q(snapshot_seq_reg[27]));
  FDCE \snapshot_seq_reg[28] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[28]_i_1_n_7 ),
        .Q(snapshot_seq_reg[28]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \snapshot_seq_reg[28]_i_1 
       (.CI(\snapshot_seq_reg[24]_i_1_n_0 ),
        .CO({\NLW_snapshot_seq_reg[28]_i_1_CO_UNCONNECTED [3],\snapshot_seq_reg[28]_i_1_n_1 ,\snapshot_seq_reg[28]_i_1_n_2 ,\snapshot_seq_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\snapshot_seq_reg[28]_i_1_n_4 ,\snapshot_seq_reg[28]_i_1_n_5 ,\snapshot_seq_reg[28]_i_1_n_6 ,\snapshot_seq_reg[28]_i_1_n_7 }),
        .S(snapshot_seq_reg[31:28]));
  FDCE \snapshot_seq_reg[29] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[28]_i_1_n_6 ),
        .Q(snapshot_seq_reg[29]));
  FDCE \snapshot_seq_reg[2] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[0]_i_1_n_5 ),
        .Q(snapshot_seq_reg[2]));
  FDCE \snapshot_seq_reg[30] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[28]_i_1_n_5 ),
        .Q(snapshot_seq_reg[30]));
  FDCE \snapshot_seq_reg[31] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[28]_i_1_n_4 ),
        .Q(snapshot_seq_reg[31]));
  FDCE \snapshot_seq_reg[3] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[0]_i_1_n_4 ),
        .Q(snapshot_seq_reg[3]));
  FDCE \snapshot_seq_reg[4] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[4]_i_1_n_7 ),
        .Q(snapshot_seq_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \snapshot_seq_reg[4]_i_1 
       (.CI(\snapshot_seq_reg[0]_i_1_n_0 ),
        .CO({\snapshot_seq_reg[4]_i_1_n_0 ,\snapshot_seq_reg[4]_i_1_n_1 ,\snapshot_seq_reg[4]_i_1_n_2 ,\snapshot_seq_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\snapshot_seq_reg[4]_i_1_n_4 ,\snapshot_seq_reg[4]_i_1_n_5 ,\snapshot_seq_reg[4]_i_1_n_6 ,\snapshot_seq_reg[4]_i_1_n_7 }),
        .S(snapshot_seq_reg[7:4]));
  FDCE \snapshot_seq_reg[5] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[4]_i_1_n_6 ),
        .Q(snapshot_seq_reg[5]));
  FDCE \snapshot_seq_reg[6] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[4]_i_1_n_5 ),
        .Q(snapshot_seq_reg[6]));
  FDCE \snapshot_seq_reg[7] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[4]_i_1_n_4 ),
        .Q(snapshot_seq_reg[7]));
  FDCE \snapshot_seq_reg[8] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[8]_i_1_n_7 ),
        .Q(snapshot_seq_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \snapshot_seq_reg[8]_i_1 
       (.CI(\snapshot_seq_reg[4]_i_1_n_0 ),
        .CO({\snapshot_seq_reg[8]_i_1_n_0 ,\snapshot_seq_reg[8]_i_1_n_1 ,\snapshot_seq_reg[8]_i_1_n_2 ,\snapshot_seq_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\snapshot_seq_reg[8]_i_1_n_4 ,\snapshot_seq_reg[8]_i_1_n_5 ,\snapshot_seq_reg[8]_i_1_n_6 ,\snapshot_seq_reg[8]_i_1_n_7 }),
        .S(snapshot_seq_reg[11:8]));
  FDCE \snapshot_seq_reg[9] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_seq_reg[8]_i_1_n_6 ),
        .Q(snapshot_seq_reg[9]));
  FDCE \snapshot_sumsq_reg[0] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [0]),
        .Q(\snapshot_sumsq_reg_n_0_[0] ));
  FDCE \snapshot_sumsq_reg[10] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [10]),
        .Q(\snapshot_sumsq_reg_n_0_[10] ));
  FDCE \snapshot_sumsq_reg[11] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [11]),
        .Q(\snapshot_sumsq_reg_n_0_[11] ));
  FDCE \snapshot_sumsq_reg[12] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [12]),
        .Q(\snapshot_sumsq_reg_n_0_[12] ));
  FDCE \snapshot_sumsq_reg[13] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [13]),
        .Q(\snapshot_sumsq_reg_n_0_[13] ));
  FDCE \snapshot_sumsq_reg[14] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [14]),
        .Q(\snapshot_sumsq_reg_n_0_[14] ));
  FDCE \snapshot_sumsq_reg[15] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [15]),
        .Q(\snapshot_sumsq_reg_n_0_[15] ));
  FDCE \snapshot_sumsq_reg[16] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [16]),
        .Q(\snapshot_sumsq_reg_n_0_[16] ));
  FDCE \snapshot_sumsq_reg[17] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [17]),
        .Q(\snapshot_sumsq_reg_n_0_[17] ));
  FDCE \snapshot_sumsq_reg[18] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [18]),
        .Q(\snapshot_sumsq_reg_n_0_[18] ));
  FDCE \snapshot_sumsq_reg[19] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [19]),
        .Q(\snapshot_sumsq_reg_n_0_[19] ));
  FDCE \snapshot_sumsq_reg[1] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [1]),
        .Q(\snapshot_sumsq_reg_n_0_[1] ));
  FDCE \snapshot_sumsq_reg[20] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [20]),
        .Q(\snapshot_sumsq_reg_n_0_[20] ));
  FDCE \snapshot_sumsq_reg[21] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [21]),
        .Q(\snapshot_sumsq_reg_n_0_[21] ));
  FDCE \snapshot_sumsq_reg[22] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [22]),
        .Q(\snapshot_sumsq_reg_n_0_[22] ));
  FDCE \snapshot_sumsq_reg[23] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [23]),
        .Q(\snapshot_sumsq_reg_n_0_[23] ));
  FDCE \snapshot_sumsq_reg[24] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [24]),
        .Q(\snapshot_sumsq_reg_n_0_[24] ));
  FDCE \snapshot_sumsq_reg[25] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [25]),
        .Q(\snapshot_sumsq_reg_n_0_[25] ));
  FDCE \snapshot_sumsq_reg[26] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [26]),
        .Q(\snapshot_sumsq_reg_n_0_[26] ));
  FDCE \snapshot_sumsq_reg[27] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [27]),
        .Q(\snapshot_sumsq_reg_n_0_[27] ));
  FDCE \snapshot_sumsq_reg[28] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [28]),
        .Q(\snapshot_sumsq_reg_n_0_[28] ));
  FDCE \snapshot_sumsq_reg[29] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [29]),
        .Q(\snapshot_sumsq_reg_n_0_[29] ));
  FDCE \snapshot_sumsq_reg[2] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [2]),
        .Q(\snapshot_sumsq_reg_n_0_[2] ));
  FDCE \snapshot_sumsq_reg[30] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [30]),
        .Q(\snapshot_sumsq_reg_n_0_[30] ));
  FDCE \snapshot_sumsq_reg[31] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [31]),
        .Q(\snapshot_sumsq_reg_n_0_[31] ));
  FDCE \snapshot_sumsq_reg[32] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [32]),
        .Q(data3[0]));
  FDCE \snapshot_sumsq_reg[33] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [33]),
        .Q(data3[1]));
  FDCE \snapshot_sumsq_reg[34] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [34]),
        .Q(data3[2]));
  FDCE \snapshot_sumsq_reg[3] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [3]),
        .Q(\snapshot_sumsq_reg_n_0_[3] ));
  FDCE \snapshot_sumsq_reg[4] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [4]),
        .Q(\snapshot_sumsq_reg_n_0_[4] ));
  FDCE \snapshot_sumsq_reg[5] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [5]),
        .Q(\snapshot_sumsq_reg_n_0_[5] ));
  FDCE \snapshot_sumsq_reg[6] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [6]),
        .Q(\snapshot_sumsq_reg_n_0_[6] ));
  FDCE \snapshot_sumsq_reg[7] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [7]),
        .Q(\snapshot_sumsq_reg_n_0_[7] ));
  FDCE \snapshot_sumsq_reg[8] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [8]),
        .Q(\snapshot_sumsq_reg_n_0_[8] ));
  FDCE \snapshot_sumsq_reg[9] 
       (.C(s_axi_aclk),
        .CE(snapshot_seq0),
        .CLR(s_axi_aresetn_0),
        .D(\snapshot_sumsq_reg[34]_0 [9]),
        .Q(\snapshot_sumsq_reg_n_0_[9] ));
  LUT6 #(
    .INIT(64'hFF11FF3300100000)) 
    w_pending_i_1
       (.I0(s_axi_awvalid),
        .I1(aw_pending_reg_n_0),
        .I2(s_axi_wvalid),
        .I3(s_axi_bvalid_reg_0),
        .I4(s_axi_aresetn),
        .I5(w_pending_reg_n_0),
        .O(w_pending_i_1_n_0));
  FDCE w_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(w_pending_i_1_n_0),
        .Q(w_pending_reg_n_0));
endmodule

(* ORIG_REF_NAME = "vibration_frame_fifo" *) 
module design_1_lis3dh_vibration_axi_0_0_vibration_frame_fifo
   (overflow,
    D,
    S,
    DI,
    \peak_accumulator_reg[15] ,
    B,
    \peak_accumulator_reg[7] ,
    \peak_accumulator_reg[6] ,
    sample_data__0,
    E,
    \level_reg[1]_0 ,
    xyz_ready,
    s_axi_aresetn_0,
    s_axi_aclk,
    \level_reg[3]_0 ,
    CO,
    Q,
    last_sample__3,
    xyz_valid,
    result_valid,
    s_axi_aresetn,
    \frame_memory_reg[0][47]_0 );
  output overflow;
  output [15:0]D;
  output [3:0]S;
  output [3:0]DI;
  output [8:0]\peak_accumulator_reg[15] ;
  output [14:0]B;
  output [3:0]\peak_accumulator_reg[7] ;
  output [3:0]\peak_accumulator_reg[6] ;
  output [0:0]sample_data__0;
  output [0:0]E;
  output [0:0]\level_reg[1]_0 ;
  output xyz_ready;
  output s_axi_aresetn_0;
  input s_axi_aclk;
  input \level_reg[3]_0 ;
  input [0:0]CO;
  input [15:0]Q;
  input last_sample__3;
  input xyz_valid;
  input result_valid;
  input s_axi_aresetn;
  input [15:0]\frame_memory_reg[0][47]_0 ;

  wire [14:0]B;
  wire [0:0]CO;
  wire [15:0]D;
  wire [3:0]DI;
  wire [0:0]E;
  wire [15:0]Q;
  wire [3:0]S;
  wire \frame_memory[0][47]_i_1_n_0 ;
  wire \frame_memory[1][47]_i_1_n_0 ;
  wire \frame_memory[2][47]_i_1_n_0 ;
  wire \frame_memory[3][47]_i_1_n_0 ;
  wire \frame_memory[4][47]_i_1_n_0 ;
  wire \frame_memory[5][47]_i_1_n_0 ;
  wire \frame_memory[6][47]_i_1_n_0 ;
  wire \frame_memory[7][47]_i_1_n_0 ;
  wire [47:32]\frame_memory_reg[0] ;
  wire [15:0]\frame_memory_reg[0][47]_0 ;
  wire [47:32]\frame_memory_reg[1] ;
  wire [47:32]\frame_memory_reg[2] ;
  wire [47:32]\frame_memory_reg[3] ;
  wire [47:32]\frame_memory_reg[4] ;
  wire [47:32]\frame_memory_reg[5] ;
  wire [47:32]\frame_memory_reg[6] ;
  wire [47:32]\frame_memory_reg[7] ;
  wire last_sample__3;
  wire [3:0]level;
  wire \level[3]_i_1_n_0 ;
  wire [3:0]level_reg;
  wire [0:0]\level_reg[1]_0 ;
  wire \level_reg[3]_0 ;
  wire overflow;
  wire overflow_i_1_n_0;
  wire [1:1]p_0_in;
  wire \peak_accumulator[11]_i_4_n_0 ;
  wire \peak_accumulator[11]_i_5_n_0 ;
  wire \peak_accumulator[11]_i_6_n_0 ;
  wire \peak_accumulator[11]_i_7_n_0 ;
  wire \peak_accumulator[11]_i_8_n_0 ;
  wire \peak_accumulator[11]_i_9_n_0 ;
  wire \peak_accumulator[13]_i_3_n_0 ;
  wire \peak_accumulator[13]_i_4_n_0 ;
  wire \peak_accumulator[14]_i_3_n_0 ;
  wire \peak_accumulator[14]_i_4_n_0 ;
  wire \peak_accumulator[15]_i_5_n_0 ;
  wire \peak_accumulator[15]_i_6_n_0 ;
  wire \peak_accumulator[15]_i_7_n_0 ;
  wire \peak_accumulator[15]_i_8_n_0 ;
  wire \peak_accumulator[15]_i_9_n_0 ;
  wire \peak_accumulator[1]_i_3_n_0 ;
  wire \peak_accumulator[1]_i_4_n_0 ;
  wire \peak_accumulator[3]_i_10_n_0 ;
  wire \peak_accumulator[3]_i_4_n_0 ;
  wire \peak_accumulator[3]_i_5_n_0 ;
  wire \peak_accumulator[3]_i_6_n_0 ;
  wire \peak_accumulator[3]_i_7_n_0 ;
  wire \peak_accumulator[3]_i_8_n_0 ;
  wire \peak_accumulator[3]_i_9_n_0 ;
  wire \peak_accumulator[5]_i_3_n_0 ;
  wire \peak_accumulator[5]_i_4_n_0 ;
  wire \peak_accumulator[7]_i_4_n_0 ;
  wire \peak_accumulator[7]_i_5_n_0 ;
  wire \peak_accumulator[7]_i_6_n_0 ;
  wire \peak_accumulator[7]_i_7_n_0 ;
  wire \peak_accumulator[7]_i_8_n_0 ;
  wire \peak_accumulator[7]_i_9_n_0 ;
  wire \peak_accumulator[9]_i_3_n_0 ;
  wire \peak_accumulator[9]_i_4_n_0 ;
  wire \peak_accumulator_reg[11]_i_2_n_0 ;
  wire \peak_accumulator_reg[11]_i_2_n_1 ;
  wire \peak_accumulator_reg[11]_i_2_n_2 ;
  wire \peak_accumulator_reg[11]_i_2_n_3 ;
  wire [8:0]\peak_accumulator_reg[15] ;
  wire \peak_accumulator_reg[15]_i_2_n_2 ;
  wire \peak_accumulator_reg[15]_i_2_n_3 ;
  wire \peak_accumulator_reg[3]_i_2_n_0 ;
  wire \peak_accumulator_reg[3]_i_2_n_1 ;
  wire \peak_accumulator_reg[3]_i_2_n_2 ;
  wire \peak_accumulator_reg[3]_i_2_n_3 ;
  wire [3:0]\peak_accumulator_reg[6] ;
  wire [3:0]\peak_accumulator_reg[7] ;
  wire \peak_accumulator_reg[7]_i_2_n_0 ;
  wire \peak_accumulator_reg[7]_i_2_n_1 ;
  wire \peak_accumulator_reg[7]_i_2_n_2 ;
  wire \peak_accumulator_reg[7]_i_2_n_3 ;
  wire [2:0]read_pointer;
  wire \read_pointer[0]_i_1_n_0 ;
  wire \read_pointer[1]_i_1_n_0 ;
  wire \read_pointer[2]_i_2_n_0 ;
  wire result_valid;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire [15:1]sample_data;
  wire [0:0]sample_data__0;
  wire [15:1]sample_magnitude0;
  wire sample_square_full_i_23_n_0;
  wire sample_square_full_i_24_n_0;
  wire sample_square_full_i_25_n_0;
  wire sample_square_full_i_26_n_0;
  wire sample_square_full_i_27_n_0;
  wire sample_square_full_i_28_n_0;
  wire sample_square_full_i_29_n_0;
  wire sample_square_full_i_30_n_0;
  wire sample_square_full_i_31_n_0;
  wire sample_square_full_i_32_n_0;
  wire sample_square_full_i_33_n_0;
  wire sample_square_full_i_34_n_0;
  wire sample_square_full_i_35_n_0;
  wire sample_square_full_i_36_n_0;
  wire [2:0]write_pointer;
  wire \write_pointer[0]_i_1_n_0 ;
  wire \write_pointer[1]_i_1_n_0 ;
  wire \write_pointer[2]_i_1_n_0 ;
  wire xyz_ready;
  wire xyz_valid;
  wire [3:2]\NLW_peak_accumulator_reg[15]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_peak_accumulator_reg[15]_i_2_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'h01000000)) 
    \frame_memory[0][47]_i_1 
       (.I0(write_pointer[2]),
        .I1(write_pointer[0]),
        .I2(write_pointer[1]),
        .I3(p_0_in),
        .I4(s_axi_aresetn),
        .O(\frame_memory[0][47]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \frame_memory[1][47]_i_1 
       (.I0(write_pointer[2]),
        .I1(write_pointer[0]),
        .I2(write_pointer[1]),
        .I3(p_0_in),
        .I4(s_axi_aresetn),
        .O(\frame_memory[1][47]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h10000000)) 
    \frame_memory[2][47]_i_1 
       (.I0(write_pointer[2]),
        .I1(write_pointer[0]),
        .I2(write_pointer[1]),
        .I3(p_0_in),
        .I4(s_axi_aresetn),
        .O(\frame_memory[2][47]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \frame_memory[3][47]_i_1 
       (.I0(write_pointer[2]),
        .I1(write_pointer[0]),
        .I2(write_pointer[1]),
        .I3(p_0_in),
        .I4(s_axi_aresetn),
        .O(\frame_memory[3][47]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \frame_memory[4][47]_i_1 
       (.I0(write_pointer[0]),
        .I1(write_pointer[2]),
        .I2(write_pointer[1]),
        .I3(p_0_in),
        .I4(s_axi_aresetn),
        .O(\frame_memory[4][47]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \frame_memory[5][47]_i_1 
       (.I0(write_pointer[1]),
        .I1(p_0_in),
        .I2(s_axi_aresetn),
        .I3(write_pointer[2]),
        .I4(write_pointer[0]),
        .O(\frame_memory[5][47]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \frame_memory[6][47]_i_1 
       (.I0(write_pointer[0]),
        .I1(write_pointer[2]),
        .I2(write_pointer[1]),
        .I3(p_0_in),
        .I4(s_axi_aresetn),
        .O(\frame_memory[6][47]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \frame_memory[7][47]_i_1 
       (.I0(write_pointer[1]),
        .I1(p_0_in),
        .I2(s_axi_aresetn),
        .I3(write_pointer[2]),
        .I4(write_pointer[0]),
        .O(\frame_memory[7][47]_i_1_n_0 ));
  FDRE \frame_memory_reg[0][32] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [0]),
        .Q(\frame_memory_reg[0] [32]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][33] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [1]),
        .Q(\frame_memory_reg[0] [33]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][34] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [2]),
        .Q(\frame_memory_reg[0] [34]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][35] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [3]),
        .Q(\frame_memory_reg[0] [35]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][36] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [4]),
        .Q(\frame_memory_reg[0] [36]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][37] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [5]),
        .Q(\frame_memory_reg[0] [37]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][38] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [6]),
        .Q(\frame_memory_reg[0] [38]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][39] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [7]),
        .Q(\frame_memory_reg[0] [39]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][40] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [8]),
        .Q(\frame_memory_reg[0] [40]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][41] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [9]),
        .Q(\frame_memory_reg[0] [41]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][42] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [10]),
        .Q(\frame_memory_reg[0] [42]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][43] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [11]),
        .Q(\frame_memory_reg[0] [43]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][44] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [12]),
        .Q(\frame_memory_reg[0] [44]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][45] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [13]),
        .Q(\frame_memory_reg[0] [45]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][46] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [14]),
        .Q(\frame_memory_reg[0] [46]),
        .R(1'b0));
  FDRE \frame_memory_reg[0][47] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[0][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [15]),
        .Q(\frame_memory_reg[0] [47]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][32] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [0]),
        .Q(\frame_memory_reg[1] [32]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][33] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [1]),
        .Q(\frame_memory_reg[1] [33]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][34] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [2]),
        .Q(\frame_memory_reg[1] [34]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][35] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [3]),
        .Q(\frame_memory_reg[1] [35]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][36] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [4]),
        .Q(\frame_memory_reg[1] [36]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][37] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [5]),
        .Q(\frame_memory_reg[1] [37]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][38] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [6]),
        .Q(\frame_memory_reg[1] [38]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][39] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [7]),
        .Q(\frame_memory_reg[1] [39]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][40] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [8]),
        .Q(\frame_memory_reg[1] [40]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][41] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [9]),
        .Q(\frame_memory_reg[1] [41]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][42] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [10]),
        .Q(\frame_memory_reg[1] [42]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][43] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [11]),
        .Q(\frame_memory_reg[1] [43]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][44] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [12]),
        .Q(\frame_memory_reg[1] [44]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][45] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [13]),
        .Q(\frame_memory_reg[1] [45]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][46] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [14]),
        .Q(\frame_memory_reg[1] [46]),
        .R(1'b0));
  FDRE \frame_memory_reg[1][47] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[1][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [15]),
        .Q(\frame_memory_reg[1] [47]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][32] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [0]),
        .Q(\frame_memory_reg[2] [32]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][33] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [1]),
        .Q(\frame_memory_reg[2] [33]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][34] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [2]),
        .Q(\frame_memory_reg[2] [34]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][35] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [3]),
        .Q(\frame_memory_reg[2] [35]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][36] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [4]),
        .Q(\frame_memory_reg[2] [36]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][37] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [5]),
        .Q(\frame_memory_reg[2] [37]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][38] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [6]),
        .Q(\frame_memory_reg[2] [38]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][39] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [7]),
        .Q(\frame_memory_reg[2] [39]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][40] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [8]),
        .Q(\frame_memory_reg[2] [40]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][41] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [9]),
        .Q(\frame_memory_reg[2] [41]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][42] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [10]),
        .Q(\frame_memory_reg[2] [42]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][43] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [11]),
        .Q(\frame_memory_reg[2] [43]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][44] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [12]),
        .Q(\frame_memory_reg[2] [44]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][45] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [13]),
        .Q(\frame_memory_reg[2] [45]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][46] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [14]),
        .Q(\frame_memory_reg[2] [46]),
        .R(1'b0));
  FDRE \frame_memory_reg[2][47] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[2][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [15]),
        .Q(\frame_memory_reg[2] [47]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][32] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [0]),
        .Q(\frame_memory_reg[3] [32]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][33] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [1]),
        .Q(\frame_memory_reg[3] [33]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][34] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [2]),
        .Q(\frame_memory_reg[3] [34]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][35] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [3]),
        .Q(\frame_memory_reg[3] [35]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][36] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [4]),
        .Q(\frame_memory_reg[3] [36]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][37] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [5]),
        .Q(\frame_memory_reg[3] [37]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][38] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [6]),
        .Q(\frame_memory_reg[3] [38]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][39] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [7]),
        .Q(\frame_memory_reg[3] [39]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][40] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [8]),
        .Q(\frame_memory_reg[3] [40]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][41] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [9]),
        .Q(\frame_memory_reg[3] [41]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][42] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [10]),
        .Q(\frame_memory_reg[3] [42]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][43] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [11]),
        .Q(\frame_memory_reg[3] [43]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][44] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [12]),
        .Q(\frame_memory_reg[3] [44]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][45] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [13]),
        .Q(\frame_memory_reg[3] [45]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][46] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [14]),
        .Q(\frame_memory_reg[3] [46]),
        .R(1'b0));
  FDRE \frame_memory_reg[3][47] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[3][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [15]),
        .Q(\frame_memory_reg[3] [47]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][32] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [0]),
        .Q(\frame_memory_reg[4] [32]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][33] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [1]),
        .Q(\frame_memory_reg[4] [33]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][34] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [2]),
        .Q(\frame_memory_reg[4] [34]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][35] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [3]),
        .Q(\frame_memory_reg[4] [35]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][36] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [4]),
        .Q(\frame_memory_reg[4] [36]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][37] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [5]),
        .Q(\frame_memory_reg[4] [37]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][38] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [6]),
        .Q(\frame_memory_reg[4] [38]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][39] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [7]),
        .Q(\frame_memory_reg[4] [39]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][40] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [8]),
        .Q(\frame_memory_reg[4] [40]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][41] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [9]),
        .Q(\frame_memory_reg[4] [41]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][42] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [10]),
        .Q(\frame_memory_reg[4] [42]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][43] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [11]),
        .Q(\frame_memory_reg[4] [43]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][44] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [12]),
        .Q(\frame_memory_reg[4] [44]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][45] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [13]),
        .Q(\frame_memory_reg[4] [45]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][46] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [14]),
        .Q(\frame_memory_reg[4] [46]),
        .R(1'b0));
  FDRE \frame_memory_reg[4][47] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[4][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [15]),
        .Q(\frame_memory_reg[4] [47]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][32] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [0]),
        .Q(\frame_memory_reg[5] [32]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][33] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [1]),
        .Q(\frame_memory_reg[5] [33]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][34] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [2]),
        .Q(\frame_memory_reg[5] [34]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][35] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [3]),
        .Q(\frame_memory_reg[5] [35]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][36] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [4]),
        .Q(\frame_memory_reg[5] [36]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][37] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [5]),
        .Q(\frame_memory_reg[5] [37]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][38] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [6]),
        .Q(\frame_memory_reg[5] [38]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][39] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [7]),
        .Q(\frame_memory_reg[5] [39]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][40] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [8]),
        .Q(\frame_memory_reg[5] [40]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][41] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [9]),
        .Q(\frame_memory_reg[5] [41]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][42] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [10]),
        .Q(\frame_memory_reg[5] [42]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][43] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [11]),
        .Q(\frame_memory_reg[5] [43]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][44] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [12]),
        .Q(\frame_memory_reg[5] [44]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][45] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [13]),
        .Q(\frame_memory_reg[5] [45]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][46] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [14]),
        .Q(\frame_memory_reg[5] [46]),
        .R(1'b0));
  FDRE \frame_memory_reg[5][47] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[5][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [15]),
        .Q(\frame_memory_reg[5] [47]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][32] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [0]),
        .Q(\frame_memory_reg[6] [32]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][33] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [1]),
        .Q(\frame_memory_reg[6] [33]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][34] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [2]),
        .Q(\frame_memory_reg[6] [34]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][35] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [3]),
        .Q(\frame_memory_reg[6] [35]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][36] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [4]),
        .Q(\frame_memory_reg[6] [36]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][37] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [5]),
        .Q(\frame_memory_reg[6] [37]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][38] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [6]),
        .Q(\frame_memory_reg[6] [38]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][39] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [7]),
        .Q(\frame_memory_reg[6] [39]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][40] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [8]),
        .Q(\frame_memory_reg[6] [40]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][41] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [9]),
        .Q(\frame_memory_reg[6] [41]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][42] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [10]),
        .Q(\frame_memory_reg[6] [42]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][43] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [11]),
        .Q(\frame_memory_reg[6] [43]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][44] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [12]),
        .Q(\frame_memory_reg[6] [44]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][45] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [13]),
        .Q(\frame_memory_reg[6] [45]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][46] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [14]),
        .Q(\frame_memory_reg[6] [46]),
        .R(1'b0));
  FDRE \frame_memory_reg[6][47] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[6][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [15]),
        .Q(\frame_memory_reg[6] [47]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][32] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [0]),
        .Q(\frame_memory_reg[7] [32]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][33] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [1]),
        .Q(\frame_memory_reg[7] [33]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][34] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [2]),
        .Q(\frame_memory_reg[7] [34]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][35] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [3]),
        .Q(\frame_memory_reg[7] [35]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][36] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [4]),
        .Q(\frame_memory_reg[7] [36]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][37] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [5]),
        .Q(\frame_memory_reg[7] [37]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][38] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [6]),
        .Q(\frame_memory_reg[7] [38]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][39] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [7]),
        .Q(\frame_memory_reg[7] [39]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][40] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [8]),
        .Q(\frame_memory_reg[7] [40]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][41] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [9]),
        .Q(\frame_memory_reg[7] [41]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][42] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [10]),
        .Q(\frame_memory_reg[7] [42]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][43] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [11]),
        .Q(\frame_memory_reg[7] [43]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][44] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [12]),
        .Q(\frame_memory_reg[7] [44]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][45] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [13]),
        .Q(\frame_memory_reg[7] [45]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][46] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [14]),
        .Q(\frame_memory_reg[7] [46]),
        .R(1'b0));
  FDRE \frame_memory_reg[7][47] 
       (.C(s_axi_aclk),
        .CE(\frame_memory[7][47]_i_1_n_0 ),
        .D(\frame_memory_reg[0][47]_0 [15]),
        .Q(\frame_memory_reg[7] [47]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \level[0]_i_1 
       (.I0(level_reg[0]),
        .O(level[0]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'h0FF0F20F)) 
    \level[1]_i_1 
       (.I0(level_reg[3]),
        .I1(level_reg[2]),
        .I2(level_reg[0]),
        .I3(xyz_valid),
        .I4(level_reg[1]),
        .O(level[1]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'h5FFAA00D)) 
    \level[2]_i_1 
       (.I0(xyz_valid),
        .I1(level_reg[3]),
        .I2(level_reg[0]),
        .I3(level_reg[1]),
        .I4(level_reg[2]),
        .O(level[2]));
  LUT6 #(
    .INIT(64'hAAAAAAA755555554)) 
    \level[3]_i_1 
       (.I0(result_valid),
        .I1(level_reg[3]),
        .I2(level_reg[1]),
        .I3(level_reg[2]),
        .I4(level_reg[0]),
        .I5(xyz_valid),
        .O(\level[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'h7F80FA01)) 
    \level[3]_i_2 
       (.I0(level_reg[1]),
        .I1(xyz_valid),
        .I2(level_reg[0]),
        .I3(level_reg[3]),
        .I4(level_reg[2]),
        .O(level[3]));
  FDCE \level_reg[0] 
       (.C(s_axi_aclk),
        .CE(\level[3]_i_1_n_0 ),
        .CLR(\level_reg[3]_0 ),
        .D(level[0]),
        .Q(level_reg[0]));
  FDCE \level_reg[1] 
       (.C(s_axi_aclk),
        .CE(\level[3]_i_1_n_0 ),
        .CLR(\level_reg[3]_0 ),
        .D(level[1]),
        .Q(level_reg[1]));
  FDCE \level_reg[2] 
       (.C(s_axi_aclk),
        .CE(\level[3]_i_1_n_0 ),
        .CLR(\level_reg[3]_0 ),
        .D(level[2]),
        .Q(level_reg[2]));
  FDCE \level_reg[3] 
       (.C(s_axi_aclk),
        .CE(\level[3]_i_1_n_0 ),
        .CLR(\level_reg[3]_0 ),
        .D(level[3]),
        .Q(level_reg[3]));
  LUT6 #(
    .INIT(64'h0088CCFC000000B8)) 
    next_peak1_carry__0_i_1
       (.I0(sample_magnitude0[14]),
        .I1(sample_data[15]),
        .I2(sample_data[14]),
        .I3(Q[14]),
        .I4(Q[15]),
        .I5(sample_magnitude0[15]),
        .O(DI[3]));
  LUT6 #(
    .INIT(64'h0000B800B8B8FFB8)) 
    next_peak1_carry__0_i_2
       (.I0(sample_magnitude0[13]),
        .I1(sample_data[15]),
        .I2(sample_data[13]),
        .I3(B[11]),
        .I4(Q[12]),
        .I5(Q[13]),
        .O(DI[2]));
  LUT6 #(
    .INIT(64'h0000B800B8B8FFB8)) 
    next_peak1_carry__0_i_3
       (.I0(sample_magnitude0[11]),
        .I1(sample_data[15]),
        .I2(sample_data[11]),
        .I3(B[9]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(DI[1]));
  LUT6 #(
    .INIT(64'h0000B800B8B8FFB8)) 
    next_peak1_carry__0_i_4
       (.I0(sample_magnitude0[9]),
        .I1(sample_data[15]),
        .I2(sample_data[9]),
        .I3(B[7]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(DI[0]));
  LUT6 #(
    .INIT(64'h883000B844030047)) 
    next_peak1_carry__0_i_5
       (.I0(sample_magnitude0[14]),
        .I1(sample_data[15]),
        .I2(sample_data[14]),
        .I3(Q[15]),
        .I4(sample_magnitude0[15]),
        .I5(Q[14]),
        .O(S[3]));
  LUT6 #(
    .INIT(64'hB84700000000B847)) 
    next_peak1_carry__0_i_6
       (.I0(sample_magnitude0[13]),
        .I1(sample_data[15]),
        .I2(sample_data[13]),
        .I3(Q[13]),
        .I4(B[11]),
        .I5(Q[12]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'hB84700000000B847)) 
    next_peak1_carry__0_i_7
       (.I0(sample_magnitude0[11]),
        .I1(sample_data[15]),
        .I2(sample_data[11]),
        .I3(Q[11]),
        .I4(B[9]),
        .I5(Q[10]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'hB84700000000B847)) 
    next_peak1_carry__0_i_8
       (.I0(sample_magnitude0[9]),
        .I1(sample_data[15]),
        .I2(sample_data[9]),
        .I3(Q[9]),
        .I4(B[7]),
        .I5(Q[8]),
        .O(S[0]));
  LUT6 #(
    .INIT(64'h0000B800B8B8FFB8)) 
    next_peak1_carry_i_1
       (.I0(sample_magnitude0[7]),
        .I1(sample_data[15]),
        .I2(sample_data[7]),
        .I3(B[5]),
        .I4(Q[6]),
        .I5(Q[7]),
        .O(\peak_accumulator_reg[6] [3]));
  LUT6 #(
    .INIT(64'h0000B800B8B8FFB8)) 
    next_peak1_carry_i_2
       (.I0(sample_magnitude0[5]),
        .I1(sample_data[15]),
        .I2(sample_data[5]),
        .I3(B[3]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(\peak_accumulator_reg[6] [2]));
  LUT6 #(
    .INIT(64'h0000B800B8B8FFB8)) 
    next_peak1_carry_i_3
       (.I0(sample_magnitude0[3]),
        .I1(sample_data[15]),
        .I2(sample_data[3]),
        .I3(B[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(\peak_accumulator_reg[6] [1]));
  LUT6 #(
    .INIT(64'h0000B800B8B8FFB8)) 
    next_peak1_carry_i_4
       (.I0(sample_magnitude0[1]),
        .I1(sample_data[15]),
        .I2(sample_data[1]),
        .I3(sample_data__0),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\peak_accumulator_reg[6] [0]));
  LUT6 #(
    .INIT(64'hB84700000000B847)) 
    next_peak1_carry_i_5
       (.I0(sample_magnitude0[7]),
        .I1(sample_data[15]),
        .I2(sample_data[7]),
        .I3(Q[7]),
        .I4(B[5]),
        .I5(Q[6]),
        .O(\peak_accumulator_reg[7] [3]));
  LUT6 #(
    .INIT(64'hB84700000000B847)) 
    next_peak1_carry_i_6
       (.I0(sample_magnitude0[5]),
        .I1(sample_data[15]),
        .I2(sample_data[5]),
        .I3(Q[5]),
        .I4(B[3]),
        .I5(Q[4]),
        .O(\peak_accumulator_reg[7] [2]));
  LUT6 #(
    .INIT(64'hB84700000000B847)) 
    next_peak1_carry_i_7
       (.I0(sample_magnitude0[3]),
        .I1(sample_data[15]),
        .I2(sample_data[3]),
        .I3(Q[3]),
        .I4(B[1]),
        .I5(Q[2]),
        .O(\peak_accumulator_reg[7] [1]));
  LUT6 #(
    .INIT(64'hB84700000000B847)) 
    next_peak1_carry_i_8
       (.I0(sample_magnitude0[1]),
        .I1(sample_data[15]),
        .I2(sample_data[1]),
        .I3(Q[1]),
        .I4(sample_data__0),
        .I5(Q[0]),
        .O(\peak_accumulator_reg[7] [0]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    overflow_i_1
       (.I0(level_reg[3]),
        .I1(level_reg[1]),
        .I2(level_reg[2]),
        .I3(level_reg[0]),
        .I4(xyz_valid),
        .I5(overflow),
        .O(overflow_i_1_n_0));
  FDCE overflow_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\level_reg[3]_0 ),
        .D(overflow_i_1_n_0),
        .Q(overflow));
  LUT6 #(
    .INIT(64'h00000000B8B8FF00)) 
    \peak_accumulator[11]_i_1 
       (.I0(sample_magnitude0[11]),
        .I1(sample_data[15]),
        .I2(sample_data[11]),
        .I3(Q[11]),
        .I4(CO),
        .I5(last_sample__3),
        .O(\peak_accumulator_reg[15] [5]));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[11]_i_4 
       (.I0(sample_data[12]),
        .O(\peak_accumulator[11]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[11]_i_5 
       (.I0(sample_data[11]),
        .O(\peak_accumulator[11]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[11]_i_6 
       (.I0(sample_data[10]),
        .O(\peak_accumulator[11]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[11]_i_7 
       (.I0(sample_data[9]),
        .O(\peak_accumulator[11]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[11]_i_8 
       (.I0(\frame_memory_reg[1] [43]),
        .I1(\frame_memory_reg[3] [43]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [43]),
        .I5(\frame_memory_reg[2] [43]),
        .O(\peak_accumulator[11]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[11]_i_9 
       (.I0(\frame_memory_reg[5] [43]),
        .I1(\frame_memory_reg[7] [43]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [43]),
        .I5(\frame_memory_reg[6] [43]),
        .O(\peak_accumulator[11]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B8B8FF00)) 
    \peak_accumulator[13]_i_1 
       (.I0(sample_magnitude0[13]),
        .I1(sample_data[15]),
        .I2(sample_data[13]),
        .I3(Q[13]),
        .I4(CO),
        .I5(last_sample__3),
        .O(\peak_accumulator_reg[15] [6]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[13]_i_3 
       (.I0(\frame_memory_reg[1] [45]),
        .I1(\frame_memory_reg[3] [45]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [45]),
        .I5(\frame_memory_reg[2] [45]),
        .O(\peak_accumulator[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[13]_i_4 
       (.I0(\frame_memory_reg[5] [45]),
        .I1(\frame_memory_reg[7] [45]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [45]),
        .I5(\frame_memory_reg[6] [45]),
        .O(\peak_accumulator[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B8B8FF00)) 
    \peak_accumulator[14]_i_1 
       (.I0(sample_magnitude0[14]),
        .I1(sample_data[15]),
        .I2(sample_data[14]),
        .I3(Q[14]),
        .I4(CO),
        .I5(last_sample__3),
        .O(\peak_accumulator_reg[15] [7]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[14]_i_3 
       (.I0(\frame_memory_reg[1] [46]),
        .I1(\frame_memory_reg[3] [46]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [46]),
        .I5(\frame_memory_reg[2] [46]),
        .O(\peak_accumulator[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[14]_i_4 
       (.I0(\frame_memory_reg[5] [46]),
        .I1(\frame_memory_reg[7] [46]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [46]),
        .I5(\frame_memory_reg[6] [46]),
        .O(\peak_accumulator[14]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT5 #(
    .INIT(32'h0000E222)) 
    \peak_accumulator[15]_i_1 
       (.I0(Q[15]),
        .I1(CO),
        .I2(sample_magnitude0[15]),
        .I3(sample_data[15]),
        .I4(last_sample__3),
        .O(\peak_accumulator_reg[15] [8]));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[15]_i_5 
       (.I0(sample_data[15]),
        .O(\peak_accumulator[15]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[15]_i_6 
       (.I0(sample_data[14]),
        .O(\peak_accumulator[15]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[15]_i_7 
       (.I0(sample_data[13]),
        .O(\peak_accumulator[15]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[15]_i_8 
       (.I0(\frame_memory_reg[1] [47]),
        .I1(\frame_memory_reg[3] [47]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [47]),
        .I5(\frame_memory_reg[2] [47]),
        .O(\peak_accumulator[15]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[15]_i_9 
       (.I0(\frame_memory_reg[5] [47]),
        .I1(\frame_memory_reg[7] [47]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [47]),
        .I5(\frame_memory_reg[6] [47]),
        .O(\peak_accumulator[15]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B8B8FF00)) 
    \peak_accumulator[1]_i_1 
       (.I0(sample_magnitude0[1]),
        .I1(sample_data[15]),
        .I2(sample_data[1]),
        .I3(Q[1]),
        .I4(CO),
        .I5(last_sample__3),
        .O(\peak_accumulator_reg[15] [0]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[1]_i_3 
       (.I0(\frame_memory_reg[1] [33]),
        .I1(\frame_memory_reg[3] [33]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [33]),
        .I5(\frame_memory_reg[2] [33]),
        .O(\peak_accumulator[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[1]_i_4 
       (.I0(\frame_memory_reg[5] [33]),
        .I1(\frame_memory_reg[7] [33]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [33]),
        .I5(\frame_memory_reg[6] [33]),
        .O(\peak_accumulator[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B8B8FF00)) 
    \peak_accumulator[3]_i_1 
       (.I0(sample_magnitude0[3]),
        .I1(sample_data[15]),
        .I2(sample_data[3]),
        .I3(Q[3]),
        .I4(CO),
        .I5(last_sample__3),
        .O(\peak_accumulator_reg[15] [1]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[3]_i_10 
       (.I0(\frame_memory_reg[5] [35]),
        .I1(\frame_memory_reg[7] [35]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [35]),
        .I5(\frame_memory_reg[6] [35]),
        .O(\peak_accumulator[3]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[3]_i_4 
       (.I0(sample_data__0),
        .O(\peak_accumulator[3]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[3]_i_5 
       (.I0(sample_data[4]),
        .O(\peak_accumulator[3]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[3]_i_6 
       (.I0(sample_data[3]),
        .O(\peak_accumulator[3]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[3]_i_7 
       (.I0(sample_data[2]),
        .O(\peak_accumulator[3]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[3]_i_8 
       (.I0(sample_data[1]),
        .O(\peak_accumulator[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[3]_i_9 
       (.I0(\frame_memory_reg[1] [35]),
        .I1(\frame_memory_reg[3] [35]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [35]),
        .I5(\frame_memory_reg[2] [35]),
        .O(\peak_accumulator[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B8B8FF00)) 
    \peak_accumulator[5]_i_1 
       (.I0(sample_magnitude0[5]),
        .I1(sample_data[15]),
        .I2(sample_data[5]),
        .I3(Q[5]),
        .I4(CO),
        .I5(last_sample__3),
        .O(\peak_accumulator_reg[15] [2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[5]_i_3 
       (.I0(\frame_memory_reg[1] [37]),
        .I1(\frame_memory_reg[3] [37]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [37]),
        .I5(\frame_memory_reg[2] [37]),
        .O(\peak_accumulator[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[5]_i_4 
       (.I0(\frame_memory_reg[5] [37]),
        .I1(\frame_memory_reg[7] [37]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [37]),
        .I5(\frame_memory_reg[6] [37]),
        .O(\peak_accumulator[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B8B8FF00)) 
    \peak_accumulator[7]_i_1 
       (.I0(sample_magnitude0[7]),
        .I1(sample_data[15]),
        .I2(sample_data[7]),
        .I3(Q[7]),
        .I4(CO),
        .I5(last_sample__3),
        .O(\peak_accumulator_reg[15] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[7]_i_4 
       (.I0(sample_data[8]),
        .O(\peak_accumulator[7]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[7]_i_5 
       (.I0(sample_data[7]),
        .O(\peak_accumulator[7]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[7]_i_6 
       (.I0(sample_data[6]),
        .O(\peak_accumulator[7]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \peak_accumulator[7]_i_7 
       (.I0(sample_data[5]),
        .O(\peak_accumulator[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[7]_i_8 
       (.I0(\frame_memory_reg[1] [39]),
        .I1(\frame_memory_reg[3] [39]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [39]),
        .I5(\frame_memory_reg[2] [39]),
        .O(\peak_accumulator[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[7]_i_9 
       (.I0(\frame_memory_reg[5] [39]),
        .I1(\frame_memory_reg[7] [39]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [39]),
        .I5(\frame_memory_reg[6] [39]),
        .O(\peak_accumulator[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B8B8FF00)) 
    \peak_accumulator[9]_i_1 
       (.I0(sample_magnitude0[9]),
        .I1(sample_data[15]),
        .I2(sample_data[9]),
        .I3(Q[9]),
        .I4(CO),
        .I5(last_sample__3),
        .O(\peak_accumulator_reg[15] [4]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[9]_i_3 
       (.I0(\frame_memory_reg[1] [41]),
        .I1(\frame_memory_reg[3] [41]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [41]),
        .I5(\frame_memory_reg[2] [41]),
        .O(\peak_accumulator[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \peak_accumulator[9]_i_4 
       (.I0(\frame_memory_reg[5] [41]),
        .I1(\frame_memory_reg[7] [41]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [41]),
        .I5(\frame_memory_reg[6] [41]),
        .O(\peak_accumulator[9]_i_4_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \peak_accumulator_reg[11]_i_2 
       (.CI(\peak_accumulator_reg[7]_i_2_n_0 ),
        .CO({\peak_accumulator_reg[11]_i_2_n_0 ,\peak_accumulator_reg[11]_i_2_n_1 ,\peak_accumulator_reg[11]_i_2_n_2 ,\peak_accumulator_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_magnitude0[12:9]),
        .S({\peak_accumulator[11]_i_4_n_0 ,\peak_accumulator[11]_i_5_n_0 ,\peak_accumulator[11]_i_6_n_0 ,\peak_accumulator[11]_i_7_n_0 }));
  MUXF7 \peak_accumulator_reg[11]_i_3 
       (.I0(\peak_accumulator[11]_i_8_n_0 ),
        .I1(\peak_accumulator[11]_i_9_n_0 ),
        .O(sample_data[11]),
        .S(read_pointer[2]));
  MUXF7 \peak_accumulator_reg[13]_i_2 
       (.I0(\peak_accumulator[13]_i_3_n_0 ),
        .I1(\peak_accumulator[13]_i_4_n_0 ),
        .O(sample_data[13]),
        .S(read_pointer[2]));
  MUXF7 \peak_accumulator_reg[14]_i_2 
       (.I0(\peak_accumulator[14]_i_3_n_0 ),
        .I1(\peak_accumulator[14]_i_4_n_0 ),
        .O(sample_data[14]),
        .S(read_pointer[2]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \peak_accumulator_reg[15]_i_2 
       (.CI(\peak_accumulator_reg[11]_i_2_n_0 ),
        .CO({\NLW_peak_accumulator_reg[15]_i_2_CO_UNCONNECTED [3:2],\peak_accumulator_reg[15]_i_2_n_2 ,\peak_accumulator_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_peak_accumulator_reg[15]_i_2_O_UNCONNECTED [3],sample_magnitude0[15:13]}),
        .S({1'b0,\peak_accumulator[15]_i_5_n_0 ,\peak_accumulator[15]_i_6_n_0 ,\peak_accumulator[15]_i_7_n_0 }));
  MUXF7 \peak_accumulator_reg[15]_i_3 
       (.I0(\peak_accumulator[15]_i_8_n_0 ),
        .I1(\peak_accumulator[15]_i_9_n_0 ),
        .O(sample_data[15]),
        .S(read_pointer[2]));
  MUXF7 \peak_accumulator_reg[1]_i_2 
       (.I0(\peak_accumulator[1]_i_3_n_0 ),
        .I1(\peak_accumulator[1]_i_4_n_0 ),
        .O(sample_data[1]),
        .S(read_pointer[2]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \peak_accumulator_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\peak_accumulator_reg[3]_i_2_n_0 ,\peak_accumulator_reg[3]_i_2_n_1 ,\peak_accumulator_reg[3]_i_2_n_2 ,\peak_accumulator_reg[3]_i_2_n_3 }),
        .CYINIT(\peak_accumulator[3]_i_4_n_0 ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_magnitude0[4:1]),
        .S({\peak_accumulator[3]_i_5_n_0 ,\peak_accumulator[3]_i_6_n_0 ,\peak_accumulator[3]_i_7_n_0 ,\peak_accumulator[3]_i_8_n_0 }));
  MUXF7 \peak_accumulator_reg[3]_i_3 
       (.I0(\peak_accumulator[3]_i_9_n_0 ),
        .I1(\peak_accumulator[3]_i_10_n_0 ),
        .O(sample_data[3]),
        .S(read_pointer[2]));
  MUXF7 \peak_accumulator_reg[5]_i_2 
       (.I0(\peak_accumulator[5]_i_3_n_0 ),
        .I1(\peak_accumulator[5]_i_4_n_0 ),
        .O(sample_data[5]),
        .S(read_pointer[2]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \peak_accumulator_reg[7]_i_2 
       (.CI(\peak_accumulator_reg[3]_i_2_n_0 ),
        .CO({\peak_accumulator_reg[7]_i_2_n_0 ,\peak_accumulator_reg[7]_i_2_n_1 ,\peak_accumulator_reg[7]_i_2_n_2 ,\peak_accumulator_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sample_magnitude0[8:5]),
        .S({\peak_accumulator[7]_i_4_n_0 ,\peak_accumulator[7]_i_5_n_0 ,\peak_accumulator[7]_i_6_n_0 ,\peak_accumulator[7]_i_7_n_0 }));
  MUXF7 \peak_accumulator_reg[7]_i_3 
       (.I0(\peak_accumulator[7]_i_8_n_0 ),
        .I1(\peak_accumulator[7]_i_9_n_0 ),
        .O(sample_data[7]),
        .S(read_pointer[2]));
  MUXF7 \peak_accumulator_reg[9]_i_2 
       (.I0(\peak_accumulator[9]_i_3_n_0 ),
        .I1(\peak_accumulator[9]_i_4_n_0 ),
        .O(sample_data[9]),
        .S(read_pointer[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \read_pointer[0]_i_1 
       (.I0(read_pointer[0]),
        .O(\read_pointer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \read_pointer[1]_i_1 
       (.I0(read_pointer[0]),
        .I1(read_pointer[1]),
        .O(\read_pointer[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    \read_pointer[2]_i_1 
       (.I0(level_reg[1]),
        .I1(level_reg[2]),
        .I2(level_reg[0]),
        .I3(level_reg[3]),
        .I4(result_valid),
        .O(\level_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \read_pointer[2]_i_2 
       (.I0(read_pointer[0]),
        .I1(read_pointer[1]),
        .I2(read_pointer[2]),
        .O(\read_pointer[2]_i_2_n_0 ));
  FDCE \read_pointer_reg[0] 
       (.C(s_axi_aclk),
        .CE(\level_reg[1]_0 ),
        .CLR(\level_reg[3]_0 ),
        .D(\read_pointer[0]_i_1_n_0 ),
        .Q(read_pointer[0]));
  FDCE \read_pointer_reg[1] 
       (.C(s_axi_aclk),
        .CE(\level_reg[1]_0 ),
        .CLR(\level_reg[3]_0 ),
        .D(\read_pointer[1]_i_1_n_0 ),
        .Q(read_pointer[1]));
  FDCE \read_pointer_reg[2] 
       (.C(s_axi_aclk),
        .CE(\level_reg[1]_0 ),
        .CLR(\level_reg[3]_0 ),
        .D(\read_pointer[2]_i_2_n_0 ),
        .Q(read_pointer[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \result_peak[0]_i_1 
       (.I0(sample_data__0),
        .I1(CO),
        .I2(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_peak[10]_i_1 
       (.I0(B[9]),
        .I1(CO),
        .I2(Q[10]),
        .O(D[10]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \result_peak[11]_i_1 
       (.I0(sample_magnitude0[11]),
        .I1(sample_data[15]),
        .I2(sample_data[11]),
        .I3(CO),
        .I4(Q[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_peak[12]_i_1 
       (.I0(B[11]),
        .I1(CO),
        .I2(Q[12]),
        .O(D[12]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \result_peak[13]_i_1 
       (.I0(sample_magnitude0[13]),
        .I1(sample_data[15]),
        .I2(sample_data[13]),
        .I3(CO),
        .I4(Q[13]),
        .O(D[13]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \result_peak[14]_i_1 
       (.I0(sample_magnitude0[14]),
        .I1(sample_data[15]),
        .I2(sample_data[14]),
        .I3(CO),
        .I4(Q[14]),
        .O(D[14]));
  LUT6 #(
    .INIT(64'h5555555400000000)) 
    \result_peak[15]_i_1 
       (.I0(result_valid),
        .I1(level_reg[3]),
        .I2(level_reg[0]),
        .I3(level_reg[2]),
        .I4(level_reg[1]),
        .I5(last_sample__3),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \result_peak[15]_i_2 
       (.I0(sample_data[15]),
        .I1(sample_magnitude0[15]),
        .I2(CO),
        .I3(Q[15]),
        .O(D[15]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \result_peak[1]_i_1 
       (.I0(sample_magnitude0[1]),
        .I1(sample_data[15]),
        .I2(sample_data[1]),
        .I3(CO),
        .I4(Q[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_peak[2]_i_1 
       (.I0(B[1]),
        .I1(CO),
        .I2(Q[2]),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \result_peak[3]_i_1 
       (.I0(sample_magnitude0[3]),
        .I1(sample_data[15]),
        .I2(sample_data[3]),
        .I3(CO),
        .I4(Q[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_peak[4]_i_1 
       (.I0(B[3]),
        .I1(CO),
        .I2(Q[4]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \result_peak[5]_i_1 
       (.I0(sample_magnitude0[5]),
        .I1(sample_data[15]),
        .I2(sample_data[5]),
        .I3(CO),
        .I4(Q[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_peak[6]_i_1 
       (.I0(B[5]),
        .I1(CO),
        .I2(Q[6]),
        .O(D[6]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \result_peak[7]_i_1 
       (.I0(sample_magnitude0[7]),
        .I1(sample_data[15]),
        .I2(sample_data[7]),
        .I3(CO),
        .I4(Q[7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_peak[8]_i_1 
       (.I0(B[7]),
        .I1(CO),
        .I2(Q[8]),
        .O(D[8]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \result_peak[9]_i_1 
       (.I0(sample_magnitude0[9]),
        .I1(sample_data[15]),
        .I2(sample_data[9]),
        .I3(CO),
        .I4(Q[9]),
        .O(D[9]));
  LUT3 #(
    .INIT(8'hBA)) 
    result_valid_i_1
       (.I0(E),
        .I1(s_axi_aresetn),
        .I2(result_valid),
        .O(s_axi_aresetn_0));
  LUT2 #(
    .INIT(4'h8)) 
    sample_square_full_i_1
       (.I0(sample_data[15]),
        .I1(sample_magnitude0[15]),
        .O(B[14]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_10
       (.I0(sample_magnitude0[6]),
        .I1(sample_data[15]),
        .I2(sample_data[6]),
        .O(B[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_11
       (.I0(sample_magnitude0[5]),
        .I1(sample_data[15]),
        .I2(sample_data[5]),
        .O(B[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_12
       (.I0(sample_magnitude0[4]),
        .I1(sample_data[15]),
        .I2(sample_data[4]),
        .O(B[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_13
       (.I0(sample_magnitude0[3]),
        .I1(sample_data[15]),
        .I2(sample_data[3]),
        .O(B[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_14
       (.I0(sample_magnitude0[2]),
        .I1(sample_data[15]),
        .I2(sample_data[2]),
        .O(B[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_15
       (.I0(sample_magnitude0[1]),
        .I1(sample_data[15]),
        .I2(sample_data[1]),
        .O(B[0]));
  MUXF7 sample_square_full_i_16
       (.I0(sample_square_full_i_23_n_0),
        .I1(sample_square_full_i_24_n_0),
        .O(sample_data__0),
        .S(read_pointer[2]));
  MUXF7 sample_square_full_i_17
       (.I0(sample_square_full_i_25_n_0),
        .I1(sample_square_full_i_26_n_0),
        .O(sample_data[12]),
        .S(read_pointer[2]));
  MUXF7 sample_square_full_i_18
       (.I0(sample_square_full_i_27_n_0),
        .I1(sample_square_full_i_28_n_0),
        .O(sample_data[10]),
        .S(read_pointer[2]));
  MUXF7 sample_square_full_i_19
       (.I0(sample_square_full_i_29_n_0),
        .I1(sample_square_full_i_30_n_0),
        .O(sample_data[8]),
        .S(read_pointer[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_2
       (.I0(sample_magnitude0[14]),
        .I1(sample_data[15]),
        .I2(sample_data[14]),
        .O(B[13]));
  MUXF7 sample_square_full_i_20
       (.I0(sample_square_full_i_31_n_0),
        .I1(sample_square_full_i_32_n_0),
        .O(sample_data[6]),
        .S(read_pointer[2]));
  MUXF7 sample_square_full_i_21
       (.I0(sample_square_full_i_33_n_0),
        .I1(sample_square_full_i_34_n_0),
        .O(sample_data[4]),
        .S(read_pointer[2]));
  MUXF7 sample_square_full_i_22
       (.I0(sample_square_full_i_35_n_0),
        .I1(sample_square_full_i_36_n_0),
        .O(sample_data[2]),
        .S(read_pointer[2]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_23
       (.I0(\frame_memory_reg[1] [32]),
        .I1(\frame_memory_reg[3] [32]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [32]),
        .I5(\frame_memory_reg[2] [32]),
        .O(sample_square_full_i_23_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_24
       (.I0(\frame_memory_reg[5] [32]),
        .I1(\frame_memory_reg[7] [32]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [32]),
        .I5(\frame_memory_reg[6] [32]),
        .O(sample_square_full_i_24_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_25
       (.I0(\frame_memory_reg[1] [44]),
        .I1(\frame_memory_reg[3] [44]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [44]),
        .I5(\frame_memory_reg[2] [44]),
        .O(sample_square_full_i_25_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_26
       (.I0(\frame_memory_reg[5] [44]),
        .I1(\frame_memory_reg[7] [44]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [44]),
        .I5(\frame_memory_reg[6] [44]),
        .O(sample_square_full_i_26_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_27
       (.I0(\frame_memory_reg[1] [42]),
        .I1(\frame_memory_reg[3] [42]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [42]),
        .I5(\frame_memory_reg[2] [42]),
        .O(sample_square_full_i_27_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_28
       (.I0(\frame_memory_reg[5] [42]),
        .I1(\frame_memory_reg[7] [42]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [42]),
        .I5(\frame_memory_reg[6] [42]),
        .O(sample_square_full_i_28_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_29
       (.I0(\frame_memory_reg[1] [40]),
        .I1(\frame_memory_reg[3] [40]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [40]),
        .I5(\frame_memory_reg[2] [40]),
        .O(sample_square_full_i_29_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_3
       (.I0(sample_magnitude0[13]),
        .I1(sample_data[15]),
        .I2(sample_data[13]),
        .O(B[12]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_30
       (.I0(\frame_memory_reg[5] [40]),
        .I1(\frame_memory_reg[7] [40]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [40]),
        .I5(\frame_memory_reg[6] [40]),
        .O(sample_square_full_i_30_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_31
       (.I0(\frame_memory_reg[1] [38]),
        .I1(\frame_memory_reg[3] [38]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [38]),
        .I5(\frame_memory_reg[2] [38]),
        .O(sample_square_full_i_31_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_32
       (.I0(\frame_memory_reg[5] [38]),
        .I1(\frame_memory_reg[7] [38]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [38]),
        .I5(\frame_memory_reg[6] [38]),
        .O(sample_square_full_i_32_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_33
       (.I0(\frame_memory_reg[1] [36]),
        .I1(\frame_memory_reg[3] [36]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [36]),
        .I5(\frame_memory_reg[2] [36]),
        .O(sample_square_full_i_33_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_34
       (.I0(\frame_memory_reg[5] [36]),
        .I1(\frame_memory_reg[7] [36]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [36]),
        .I5(\frame_memory_reg[6] [36]),
        .O(sample_square_full_i_34_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_35
       (.I0(\frame_memory_reg[1] [34]),
        .I1(\frame_memory_reg[3] [34]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[0] [34]),
        .I5(\frame_memory_reg[2] [34]),
        .O(sample_square_full_i_35_n_0));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    sample_square_full_i_36
       (.I0(\frame_memory_reg[5] [34]),
        .I1(\frame_memory_reg[7] [34]),
        .I2(read_pointer[0]),
        .I3(read_pointer[1]),
        .I4(\frame_memory_reg[4] [34]),
        .I5(\frame_memory_reg[6] [34]),
        .O(sample_square_full_i_36_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_4
       (.I0(sample_magnitude0[12]),
        .I1(sample_data[15]),
        .I2(sample_data[12]),
        .O(B[11]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_5
       (.I0(sample_magnitude0[11]),
        .I1(sample_data[15]),
        .I2(sample_data[11]),
        .O(B[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_6
       (.I0(sample_magnitude0[10]),
        .I1(sample_data[15]),
        .I2(sample_data[10]),
        .O(B[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_7
       (.I0(sample_magnitude0[9]),
        .I1(sample_data[15]),
        .I2(sample_data[9]),
        .O(B[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_8
       (.I0(sample_magnitude0[8]),
        .I1(sample_data[15]),
        .I2(sample_data[8]),
        .O(B[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    sample_square_full_i_9
       (.I0(sample_magnitude0[7]),
        .I1(sample_data[15]),
        .I2(sample_data[7]),
        .O(B[6]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    sensor_i_1
       (.I0(level_reg[3]),
        .I1(level_reg[1]),
        .I2(level_reg[2]),
        .I3(level_reg[0]),
        .O(xyz_ready));
  LUT2 #(
    .INIT(4'h6)) 
    \write_pointer[0]_i_1 
       (.I0(p_0_in),
        .I1(write_pointer[0]),
        .O(\write_pointer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \write_pointer[1]_i_1 
       (.I0(write_pointer[0]),
        .I1(p_0_in),
        .I2(write_pointer[1]),
        .O(\write_pointer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \write_pointer[2]_i_1 
       (.I0(write_pointer[0]),
        .I1(write_pointer[1]),
        .I2(p_0_in),
        .I3(write_pointer[2]),
        .O(\write_pointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'hAAA8AAAA)) 
    \write_pointer[2]_i_2 
       (.I0(xyz_valid),
        .I1(level_reg[0]),
        .I2(level_reg[2]),
        .I3(level_reg[1]),
        .I4(level_reg[3]),
        .O(p_0_in));
  FDCE \write_pointer_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\level_reg[3]_0 ),
        .D(\write_pointer[0]_i_1_n_0 ),
        .Q(write_pointer[0]));
  FDCE \write_pointer_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\level_reg[3]_0 ),
        .D(\write_pointer[1]_i_1_n_0 ),
        .Q(write_pointer[1]));
  FDCE \write_pointer_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\level_reg[3]_0 ),
        .D(\write_pointer[2]_i_1_n_0 ),
        .Q(write_pointer[2]));
endmodule

(* ORIG_REF_NAME = "vibration_processing_pipeline" *) 
module design_1_lis3dh_vibration_axi_0_0_vibration_processing_pipeline
   (result_sample_count,
    overflow,
    xyz_ready,
    snapshot_seq0,
    Q,
    \result_sum_squares_reg[34] ,
    s_axi_aclk,
    \sum_squares_accumulator_reg[0] ,
    xyz_valid,
    s_axi_aresetn,
    D);
  output [0:0]result_sample_count;
  output overflow;
  output xyz_ready;
  output snapshot_seq0;
  output [15:0]Q;
  output [34:0]\result_sum_squares_reg[34] ;
  input s_axi_aclk;
  input \sum_squares_accumulator_reg[0] ;
  input xyz_valid;
  input s_axi_aresetn;
  input [15:0]D;

  wire [15:1]B;
  wire [15:0]D;
  wire [15:0]Q;
  wire frame_fifo_n_17;
  wire frame_fifo_n_18;
  wire frame_fifo_n_19;
  wire frame_fifo_n_20;
  wire frame_fifo_n_21;
  wire frame_fifo_n_22;
  wire frame_fifo_n_23;
  wire frame_fifo_n_24;
  wire frame_fifo_n_25;
  wire frame_fifo_n_26;
  wire frame_fifo_n_27;
  wire frame_fifo_n_28;
  wire frame_fifo_n_29;
  wire frame_fifo_n_30;
  wire frame_fifo_n_31;
  wire frame_fifo_n_32;
  wire frame_fifo_n_33;
  wire frame_fifo_n_49;
  wire frame_fifo_n_50;
  wire frame_fifo_n_51;
  wire frame_fifo_n_52;
  wire frame_fifo_n_53;
  wire frame_fifo_n_54;
  wire frame_fifo_n_55;
  wire frame_fifo_n_56;
  wire frame_fifo_n_58;
  wire frame_fifo_n_61;
  wire last_sample__3;
  wire [15:0]next_peak;
  wire overflow;
  wire [15:0]peak_accumulator;
  wire [0:0]result_sample_count;
  wire [34:0]\result_sum_squares_reg[34] ;
  wire result_valid;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire sample_accept;
  wire [0:0]sample_data__0;
  wire snapshot_seq0;
  wire \sum_squares_accumulator_reg[0] ;
  wire x_axis_features_n_1;
  wire xyz_ready;
  wire xyz_valid;

  design_1_lis3dh_vibration_axi_0_0_vibration_frame_fifo frame_fifo
       (.B(B),
        .CO(x_axis_features_n_1),
        .D(next_peak),
        .DI({frame_fifo_n_21,frame_fifo_n_22,frame_fifo_n_23,frame_fifo_n_24}),
        .E(frame_fifo_n_58),
        .Q(peak_accumulator),
        .S({frame_fifo_n_17,frame_fifo_n_18,frame_fifo_n_19,frame_fifo_n_20}),
        .\frame_memory_reg[0][47]_0 (D),
        .last_sample__3(last_sample__3),
        .\level_reg[1]_0 (sample_accept),
        .\level_reg[3]_0 (\sum_squares_accumulator_reg[0] ),
        .overflow(overflow),
        .\peak_accumulator_reg[15] ({frame_fifo_n_25,frame_fifo_n_26,frame_fifo_n_27,frame_fifo_n_28,frame_fifo_n_29,frame_fifo_n_30,frame_fifo_n_31,frame_fifo_n_32,frame_fifo_n_33}),
        .\peak_accumulator_reg[6] ({frame_fifo_n_53,frame_fifo_n_54,frame_fifo_n_55,frame_fifo_n_56}),
        .\peak_accumulator_reg[7] ({frame_fifo_n_49,frame_fifo_n_50,frame_fifo_n_51,frame_fifo_n_52}),
        .result_valid(result_valid),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(frame_fifo_n_61),
        .sample_data__0(sample_data__0),
        .xyz_ready(xyz_ready),
        .xyz_valid(xyz_valid));
  design_1_lis3dh_vibration_axi_0_0_vibration_window_features x_axis_features
       (.A({B,sample_data__0}),
        .CO(x_axis_features_n_1),
        .D({frame_fifo_n_25,frame_fifo_n_26,frame_fifo_n_27,frame_fifo_n_28,frame_fifo_n_29,frame_fifo_n_30,frame_fifo_n_31,frame_fifo_n_32,frame_fifo_n_33}),
        .DI({frame_fifo_n_21,frame_fifo_n_22,frame_fifo_n_23,frame_fifo_n_24}),
        .E(frame_fifo_n_58),
        .Q(peak_accumulator),
        .S({frame_fifo_n_17,frame_fifo_n_18,frame_fifo_n_19,frame_fifo_n_20}),
        .last_sample__3(last_sample__3),
        .next_peak1_carry__0_0({frame_fifo_n_53,frame_fifo_n_54,frame_fifo_n_55,frame_fifo_n_56}),
        .next_peak1_carry__0_1({frame_fifo_n_49,frame_fifo_n_50,frame_fifo_n_51,frame_fifo_n_52}),
        .\peak_accumulator_reg[15]_0 (sample_accept),
        .\result_peak_reg[15]_0 (Q),
        .\result_peak_reg[15]_1 (next_peak),
        .result_sample_count(result_sample_count),
        .\result_sum_squares_reg[34]_0 (\result_sum_squares_reg[34] ),
        .result_valid(result_valid),
        .result_valid_reg_0(frame_fifo_n_61),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .snapshot_seq0(snapshot_seq0),
        .\sum_squares_accumulator_reg[0]_0 (\sum_squares_accumulator_reg[0] ));
endmodule

(* ORIG_REF_NAME = "vibration_window_features" *) 
module design_1_lis3dh_vibration_axi_0_0_vibration_window_features
   (result_sample_count,
    CO,
    result_valid,
    Q,
    last_sample__3,
    snapshot_seq0,
    \result_peak_reg[15]_0 ,
    \result_sum_squares_reg[34]_0 ,
    A,
    E,
    s_axi_aclk,
    \sum_squares_accumulator_reg[0]_0 ,
    \peak_accumulator_reg[15]_0 ,
    next_peak1_carry__0_0,
    next_peak1_carry__0_1,
    DI,
    S,
    result_valid_reg_0,
    s_axi_aresetn,
    D,
    \result_peak_reg[15]_1 );
  output [0:0]result_sample_count;
  output [0:0]CO;
  output result_valid;
  output [15:0]Q;
  output last_sample__3;
  output snapshot_seq0;
  output [15:0]\result_peak_reg[15]_0 ;
  output [34:0]\result_sum_squares_reg[34]_0 ;
  input [15:0]A;
  input [0:0]E;
  input s_axi_aclk;
  input \sum_squares_accumulator_reg[0]_0 ;
  input [0:0]\peak_accumulator_reg[15]_0 ;
  input [3:0]next_peak1_carry__0_0;
  input [3:0]next_peak1_carry__0_1;
  input [3:0]DI;
  input [3:0]S;
  input result_valid_reg_0;
  input s_axi_aresetn;
  input [8:0]D;
  input [15:0]\result_peak_reg[15]_1 ;

  wire [15:0]A;
  wire [0:0]CO;
  wire [8:0]D;
  wire [3:0]DI;
  wire [0:0]E;
  wire [15:0]Q;
  wire [3:0]S;
  wire last_sample__3;
  wire [3:0]next_peak1_carry__0_0;
  wire [3:0]next_peak1_carry__0_1;
  wire next_peak1_carry__0_n_1;
  wire next_peak1_carry__0_n_2;
  wire next_peak1_carry__0_n_3;
  wire next_peak1_carry_n_0;
  wire next_peak1_carry_n_1;
  wire next_peak1_carry_n_2;
  wire next_peak1_carry_n_3;
  wire [34:0]next_sum_squares;
  wire [4:0]p_0_in;
  wire \peak_accumulator[0]_i_1_n_0 ;
  wire \peak_accumulator[10]_i_1_n_0 ;
  wire \peak_accumulator[12]_i_1_n_0 ;
  wire \peak_accumulator[2]_i_1_n_0 ;
  wire \peak_accumulator[4]_i_1_n_0 ;
  wire \peak_accumulator[6]_i_1_n_0 ;
  wire \peak_accumulator[8]_i_1_n_0 ;
  wire [0:0]\peak_accumulator_reg[15]_0 ;
  wire [15:0]\result_peak_reg[15]_0 ;
  wire [15:0]\result_peak_reg[15]_1 ;
  wire [0:0]result_sample_count;
  wire \result_sum_squares[11]_i_2_n_0 ;
  wire \result_sum_squares[11]_i_3_n_0 ;
  wire \result_sum_squares[11]_i_4_n_0 ;
  wire \result_sum_squares[11]_i_5_n_0 ;
  wire \result_sum_squares[15]_i_2_n_0 ;
  wire \result_sum_squares[15]_i_3_n_0 ;
  wire \result_sum_squares[15]_i_4_n_0 ;
  wire \result_sum_squares[15]_i_5_n_0 ;
  wire \result_sum_squares[19]_i_2_n_0 ;
  wire \result_sum_squares[19]_i_3_n_0 ;
  wire \result_sum_squares[19]_i_4_n_0 ;
  wire \result_sum_squares[19]_i_5_n_0 ;
  wire \result_sum_squares[23]_i_2_n_0 ;
  wire \result_sum_squares[23]_i_3_n_0 ;
  wire \result_sum_squares[23]_i_4_n_0 ;
  wire \result_sum_squares[23]_i_5_n_0 ;
  wire \result_sum_squares[27]_i_2_n_0 ;
  wire \result_sum_squares[27]_i_3_n_0 ;
  wire \result_sum_squares[27]_i_4_n_0 ;
  wire \result_sum_squares[27]_i_5_n_0 ;
  wire \result_sum_squares[31]_i_2_n_0 ;
  wire \result_sum_squares[31]_i_3_n_0 ;
  wire \result_sum_squares[31]_i_4_n_0 ;
  wire \result_sum_squares[3]_i_2_n_0 ;
  wire \result_sum_squares[3]_i_3_n_0 ;
  wire \result_sum_squares[3]_i_4_n_0 ;
  wire \result_sum_squares[3]_i_5_n_0 ;
  wire \result_sum_squares[7]_i_2_n_0 ;
  wire \result_sum_squares[7]_i_3_n_0 ;
  wire \result_sum_squares[7]_i_4_n_0 ;
  wire \result_sum_squares[7]_i_5_n_0 ;
  wire \result_sum_squares_reg[11]_i_1_n_0 ;
  wire \result_sum_squares_reg[11]_i_1_n_1 ;
  wire \result_sum_squares_reg[11]_i_1_n_2 ;
  wire \result_sum_squares_reg[11]_i_1_n_3 ;
  wire \result_sum_squares_reg[15]_i_1_n_0 ;
  wire \result_sum_squares_reg[15]_i_1_n_1 ;
  wire \result_sum_squares_reg[15]_i_1_n_2 ;
  wire \result_sum_squares_reg[15]_i_1_n_3 ;
  wire \result_sum_squares_reg[19]_i_1_n_0 ;
  wire \result_sum_squares_reg[19]_i_1_n_1 ;
  wire \result_sum_squares_reg[19]_i_1_n_2 ;
  wire \result_sum_squares_reg[19]_i_1_n_3 ;
  wire \result_sum_squares_reg[23]_i_1_n_0 ;
  wire \result_sum_squares_reg[23]_i_1_n_1 ;
  wire \result_sum_squares_reg[23]_i_1_n_2 ;
  wire \result_sum_squares_reg[23]_i_1_n_3 ;
  wire \result_sum_squares_reg[27]_i_1_n_0 ;
  wire \result_sum_squares_reg[27]_i_1_n_1 ;
  wire \result_sum_squares_reg[27]_i_1_n_2 ;
  wire \result_sum_squares_reg[27]_i_1_n_3 ;
  wire \result_sum_squares_reg[31]_i_1_n_0 ;
  wire \result_sum_squares_reg[31]_i_1_n_1 ;
  wire \result_sum_squares_reg[31]_i_1_n_2 ;
  wire \result_sum_squares_reg[31]_i_1_n_3 ;
  wire [34:0]\result_sum_squares_reg[34]_0 ;
  wire \result_sum_squares_reg[34]_i_1_n_2 ;
  wire \result_sum_squares_reg[34]_i_1_n_3 ;
  wire \result_sum_squares_reg[3]_i_1_n_0 ;
  wire \result_sum_squares_reg[3]_i_1_n_1 ;
  wire \result_sum_squares_reg[3]_i_1_n_2 ;
  wire \result_sum_squares_reg[3]_i_1_n_3 ;
  wire \result_sum_squares_reg[7]_i_1_n_0 ;
  wire \result_sum_squares_reg[7]_i_1_n_1 ;
  wire \result_sum_squares_reg[7]_i_1_n_2 ;
  wire \result_sum_squares_reg[7]_i_1_n_3 ;
  wire result_valid;
  wire result_valid_reg_0;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [4:0]sample_count_reg;
  wire [30:0]\^sample_square_full ;
  wire sample_square_full_n_74;
  wire snapshot_seq0;
  wire \sum_squares_accumulator[0]_i_2_n_0 ;
  wire \sum_squares_accumulator[0]_i_3_n_0 ;
  wire \sum_squares_accumulator[0]_i_4_n_0 ;
  wire \sum_squares_accumulator[0]_i_5_n_0 ;
  wire \sum_squares_accumulator[0]_i_6_n_0 ;
  wire \sum_squares_accumulator[0]_i_7_n_0 ;
  wire \sum_squares_accumulator[0]_i_8_n_0 ;
  wire \sum_squares_accumulator[0]_i_9_n_0 ;
  wire \sum_squares_accumulator[12]_i_2_n_0 ;
  wire \sum_squares_accumulator[12]_i_3_n_0 ;
  wire \sum_squares_accumulator[12]_i_4_n_0 ;
  wire \sum_squares_accumulator[12]_i_5_n_0 ;
  wire \sum_squares_accumulator[12]_i_6_n_0 ;
  wire \sum_squares_accumulator[12]_i_7_n_0 ;
  wire \sum_squares_accumulator[12]_i_8_n_0 ;
  wire \sum_squares_accumulator[12]_i_9_n_0 ;
  wire \sum_squares_accumulator[16]_i_2_n_0 ;
  wire \sum_squares_accumulator[16]_i_3_n_0 ;
  wire \sum_squares_accumulator[16]_i_4_n_0 ;
  wire \sum_squares_accumulator[16]_i_5_n_0 ;
  wire \sum_squares_accumulator[16]_i_6_n_0 ;
  wire \sum_squares_accumulator[16]_i_7_n_0 ;
  wire \sum_squares_accumulator[16]_i_8_n_0 ;
  wire \sum_squares_accumulator[16]_i_9_n_0 ;
  wire \sum_squares_accumulator[20]_i_2_n_0 ;
  wire \sum_squares_accumulator[20]_i_3_n_0 ;
  wire \sum_squares_accumulator[20]_i_4_n_0 ;
  wire \sum_squares_accumulator[20]_i_5_n_0 ;
  wire \sum_squares_accumulator[20]_i_6_n_0 ;
  wire \sum_squares_accumulator[20]_i_7_n_0 ;
  wire \sum_squares_accumulator[20]_i_8_n_0 ;
  wire \sum_squares_accumulator[20]_i_9_n_0 ;
  wire \sum_squares_accumulator[24]_i_2_n_0 ;
  wire \sum_squares_accumulator[24]_i_3_n_0 ;
  wire \sum_squares_accumulator[24]_i_4_n_0 ;
  wire \sum_squares_accumulator[24]_i_5_n_0 ;
  wire \sum_squares_accumulator[24]_i_6_n_0 ;
  wire \sum_squares_accumulator[24]_i_7_n_0 ;
  wire \sum_squares_accumulator[24]_i_8_n_0 ;
  wire \sum_squares_accumulator[24]_i_9_n_0 ;
  wire \sum_squares_accumulator[28]_i_2_n_0 ;
  wire \sum_squares_accumulator[28]_i_3_n_0 ;
  wire \sum_squares_accumulator[28]_i_4_n_0 ;
  wire \sum_squares_accumulator[28]_i_5_n_0 ;
  wire \sum_squares_accumulator[28]_i_6_n_0 ;
  wire \sum_squares_accumulator[28]_i_7_n_0 ;
  wire \sum_squares_accumulator[28]_i_8_n_0 ;
  wire \sum_squares_accumulator[32]_i_2_n_0 ;
  wire \sum_squares_accumulator[32]_i_3_n_0 ;
  wire \sum_squares_accumulator[32]_i_4_n_0 ;
  wire \sum_squares_accumulator[4]_i_2_n_0 ;
  wire \sum_squares_accumulator[4]_i_3_n_0 ;
  wire \sum_squares_accumulator[4]_i_4_n_0 ;
  wire \sum_squares_accumulator[4]_i_5_n_0 ;
  wire \sum_squares_accumulator[4]_i_6_n_0 ;
  wire \sum_squares_accumulator[4]_i_7_n_0 ;
  wire \sum_squares_accumulator[4]_i_8_n_0 ;
  wire \sum_squares_accumulator[4]_i_9_n_0 ;
  wire \sum_squares_accumulator[8]_i_2_n_0 ;
  wire \sum_squares_accumulator[8]_i_3_n_0 ;
  wire \sum_squares_accumulator[8]_i_4_n_0 ;
  wire \sum_squares_accumulator[8]_i_5_n_0 ;
  wire \sum_squares_accumulator[8]_i_6_n_0 ;
  wire \sum_squares_accumulator[8]_i_7_n_0 ;
  wire \sum_squares_accumulator[8]_i_8_n_0 ;
  wire \sum_squares_accumulator[8]_i_9_n_0 ;
  wire [34:0]sum_squares_accumulator_reg;
  wire \sum_squares_accumulator_reg[0]_0 ;
  wire \sum_squares_accumulator_reg[0]_i_1_n_0 ;
  wire \sum_squares_accumulator_reg[0]_i_1_n_1 ;
  wire \sum_squares_accumulator_reg[0]_i_1_n_2 ;
  wire \sum_squares_accumulator_reg[0]_i_1_n_3 ;
  wire \sum_squares_accumulator_reg[0]_i_1_n_4 ;
  wire \sum_squares_accumulator_reg[0]_i_1_n_5 ;
  wire \sum_squares_accumulator_reg[0]_i_1_n_6 ;
  wire \sum_squares_accumulator_reg[0]_i_1_n_7 ;
  wire \sum_squares_accumulator_reg[12]_i_1_n_0 ;
  wire \sum_squares_accumulator_reg[12]_i_1_n_1 ;
  wire \sum_squares_accumulator_reg[12]_i_1_n_2 ;
  wire \sum_squares_accumulator_reg[12]_i_1_n_3 ;
  wire \sum_squares_accumulator_reg[12]_i_1_n_4 ;
  wire \sum_squares_accumulator_reg[12]_i_1_n_5 ;
  wire \sum_squares_accumulator_reg[12]_i_1_n_6 ;
  wire \sum_squares_accumulator_reg[12]_i_1_n_7 ;
  wire \sum_squares_accumulator_reg[16]_i_1_n_0 ;
  wire \sum_squares_accumulator_reg[16]_i_1_n_1 ;
  wire \sum_squares_accumulator_reg[16]_i_1_n_2 ;
  wire \sum_squares_accumulator_reg[16]_i_1_n_3 ;
  wire \sum_squares_accumulator_reg[16]_i_1_n_4 ;
  wire \sum_squares_accumulator_reg[16]_i_1_n_5 ;
  wire \sum_squares_accumulator_reg[16]_i_1_n_6 ;
  wire \sum_squares_accumulator_reg[16]_i_1_n_7 ;
  wire \sum_squares_accumulator_reg[20]_i_1_n_0 ;
  wire \sum_squares_accumulator_reg[20]_i_1_n_1 ;
  wire \sum_squares_accumulator_reg[20]_i_1_n_2 ;
  wire \sum_squares_accumulator_reg[20]_i_1_n_3 ;
  wire \sum_squares_accumulator_reg[20]_i_1_n_4 ;
  wire \sum_squares_accumulator_reg[20]_i_1_n_5 ;
  wire \sum_squares_accumulator_reg[20]_i_1_n_6 ;
  wire \sum_squares_accumulator_reg[20]_i_1_n_7 ;
  wire \sum_squares_accumulator_reg[24]_i_1_n_0 ;
  wire \sum_squares_accumulator_reg[24]_i_1_n_1 ;
  wire \sum_squares_accumulator_reg[24]_i_1_n_2 ;
  wire \sum_squares_accumulator_reg[24]_i_1_n_3 ;
  wire \sum_squares_accumulator_reg[24]_i_1_n_4 ;
  wire \sum_squares_accumulator_reg[24]_i_1_n_5 ;
  wire \sum_squares_accumulator_reg[24]_i_1_n_6 ;
  wire \sum_squares_accumulator_reg[24]_i_1_n_7 ;
  wire \sum_squares_accumulator_reg[28]_i_1_n_0 ;
  wire \sum_squares_accumulator_reg[28]_i_1_n_1 ;
  wire \sum_squares_accumulator_reg[28]_i_1_n_2 ;
  wire \sum_squares_accumulator_reg[28]_i_1_n_3 ;
  wire \sum_squares_accumulator_reg[28]_i_1_n_4 ;
  wire \sum_squares_accumulator_reg[28]_i_1_n_5 ;
  wire \sum_squares_accumulator_reg[28]_i_1_n_6 ;
  wire \sum_squares_accumulator_reg[28]_i_1_n_7 ;
  wire \sum_squares_accumulator_reg[32]_i_1_n_2 ;
  wire \sum_squares_accumulator_reg[32]_i_1_n_3 ;
  wire \sum_squares_accumulator_reg[32]_i_1_n_5 ;
  wire \sum_squares_accumulator_reg[32]_i_1_n_6 ;
  wire \sum_squares_accumulator_reg[32]_i_1_n_7 ;
  wire \sum_squares_accumulator_reg[4]_i_1_n_0 ;
  wire \sum_squares_accumulator_reg[4]_i_1_n_1 ;
  wire \sum_squares_accumulator_reg[4]_i_1_n_2 ;
  wire \sum_squares_accumulator_reg[4]_i_1_n_3 ;
  wire \sum_squares_accumulator_reg[4]_i_1_n_4 ;
  wire \sum_squares_accumulator_reg[4]_i_1_n_5 ;
  wire \sum_squares_accumulator_reg[4]_i_1_n_6 ;
  wire \sum_squares_accumulator_reg[4]_i_1_n_7 ;
  wire \sum_squares_accumulator_reg[8]_i_1_n_0 ;
  wire \sum_squares_accumulator_reg[8]_i_1_n_1 ;
  wire \sum_squares_accumulator_reg[8]_i_1_n_2 ;
  wire \sum_squares_accumulator_reg[8]_i_1_n_3 ;
  wire \sum_squares_accumulator_reg[8]_i_1_n_4 ;
  wire \sum_squares_accumulator_reg[8]_i_1_n_5 ;
  wire \sum_squares_accumulator_reg[8]_i_1_n_6 ;
  wire \sum_squares_accumulator_reg[8]_i_1_n_7 ;
  wire [3:0]NLW_next_peak1_carry_O_UNCONNECTED;
  wire [3:0]NLW_next_peak1_carry__0_O_UNCONNECTED;
  wire [3:2]\NLW_result_sum_squares_reg[34]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_result_sum_squares_reg[34]_i_1_O_UNCONNECTED ;
  wire NLW_sample_square_full_CARRYCASCOUT_UNCONNECTED;
  wire NLW_sample_square_full_MULTSIGNOUT_UNCONNECTED;
  wire NLW_sample_square_full_OVERFLOW_UNCONNECTED;
  wire NLW_sample_square_full_PATTERNBDETECT_UNCONNECTED;
  wire NLW_sample_square_full_PATTERNDETECT_UNCONNECTED;
  wire NLW_sample_square_full_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_sample_square_full_ACOUT_UNCONNECTED;
  wire [17:0]NLW_sample_square_full_BCOUT_UNCONNECTED;
  wire [3:0]NLW_sample_square_full_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_sample_square_full_P_UNCONNECTED;
  wire [47:0]NLW_sample_square_full_PCOUT_UNCONNECTED;
  wire [3:2]\NLW_sum_squares_accumulator_reg[32]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_sum_squares_accumulator_reg[32]_i_1_O_UNCONNECTED ;

  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 next_peak1_carry
       (.CI(1'b0),
        .CO({next_peak1_carry_n_0,next_peak1_carry_n_1,next_peak1_carry_n_2,next_peak1_carry_n_3}),
        .CYINIT(1'b0),
        .DI(next_peak1_carry__0_0),
        .O(NLW_next_peak1_carry_O_UNCONNECTED[3:0]),
        .S(next_peak1_carry__0_1));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 next_peak1_carry__0
       (.CI(next_peak1_carry_n_0),
        .CO({CO,next_peak1_carry__0_n_1,next_peak1_carry__0_n_2,next_peak1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(DI),
        .O(NLW_next_peak1_carry__0_O_UNCONNECTED[3:0]),
        .S(S));
  LUT4 #(
    .INIT(16'h00E2)) 
    \peak_accumulator[0]_i_1 
       (.I0(Q[0]),
        .I1(CO),
        .I2(A[0]),
        .I3(last_sample__3),
        .O(\peak_accumulator[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \peak_accumulator[10]_i_1 
       (.I0(Q[10]),
        .I1(CO),
        .I2(A[10]),
        .I3(last_sample__3),
        .O(\peak_accumulator[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \peak_accumulator[12]_i_1 
       (.I0(Q[12]),
        .I1(CO),
        .I2(A[12]),
        .I3(last_sample__3),
        .O(\peak_accumulator[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    \peak_accumulator[15]_i_4 
       (.I0(sample_count_reg[0]),
        .I1(sample_count_reg[1]),
        .I2(sample_count_reg[2]),
        .I3(sample_count_reg[4]),
        .I4(sample_count_reg[3]),
        .O(last_sample__3));
  LUT4 #(
    .INIT(16'h00E2)) 
    \peak_accumulator[2]_i_1 
       (.I0(Q[2]),
        .I1(CO),
        .I2(A[2]),
        .I3(last_sample__3),
        .O(\peak_accumulator[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \peak_accumulator[4]_i_1 
       (.I0(Q[4]),
        .I1(CO),
        .I2(A[4]),
        .I3(last_sample__3),
        .O(\peak_accumulator[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \peak_accumulator[6]_i_1 
       (.I0(Q[6]),
        .I1(CO),
        .I2(A[6]),
        .I3(last_sample__3),
        .O(\peak_accumulator[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \peak_accumulator[8]_i_1 
       (.I0(Q[8]),
        .I1(CO),
        .I2(A[8]),
        .I3(last_sample__3),
        .O(\peak_accumulator[8]_i_1_n_0 ));
  FDCE \peak_accumulator_reg[0] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\peak_accumulator[0]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE \peak_accumulator_reg[10] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\peak_accumulator[10]_i_1_n_0 ),
        .Q(Q[10]));
  FDCE \peak_accumulator_reg[11] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(D[5]),
        .Q(Q[11]));
  FDCE \peak_accumulator_reg[12] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\peak_accumulator[12]_i_1_n_0 ),
        .Q(Q[12]));
  FDCE \peak_accumulator_reg[13] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(D[6]),
        .Q(Q[13]));
  FDCE \peak_accumulator_reg[14] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(D[7]),
        .Q(Q[14]));
  FDCE \peak_accumulator_reg[15] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(D[8]),
        .Q(Q[15]));
  FDCE \peak_accumulator_reg[1] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(D[0]),
        .Q(Q[1]));
  FDCE \peak_accumulator_reg[2] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\peak_accumulator[2]_i_1_n_0 ),
        .Q(Q[2]));
  FDCE \peak_accumulator_reg[3] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(D[1]),
        .Q(Q[3]));
  FDCE \peak_accumulator_reg[4] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\peak_accumulator[4]_i_1_n_0 ),
        .Q(Q[4]));
  FDCE \peak_accumulator_reg[5] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(D[2]),
        .Q(Q[5]));
  FDCE \peak_accumulator_reg[6] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\peak_accumulator[6]_i_1_n_0 ),
        .Q(Q[6]));
  FDCE \peak_accumulator_reg[7] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(D[3]),
        .Q(Q[7]));
  FDCE \peak_accumulator_reg[8] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\peak_accumulator[8]_i_1_n_0 ),
        .Q(Q[8]));
  FDCE \peak_accumulator_reg[9] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(D[4]),
        .Q(Q[9]));
  FDCE \result_peak_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [0]),
        .Q(\result_peak_reg[15]_0 [0]));
  FDCE \result_peak_reg[10] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [10]),
        .Q(\result_peak_reg[15]_0 [10]));
  FDCE \result_peak_reg[11] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [11]),
        .Q(\result_peak_reg[15]_0 [11]));
  FDCE \result_peak_reg[12] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [12]),
        .Q(\result_peak_reg[15]_0 [12]));
  FDCE \result_peak_reg[13] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [13]),
        .Q(\result_peak_reg[15]_0 [13]));
  FDCE \result_peak_reg[14] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [14]),
        .Q(\result_peak_reg[15]_0 [14]));
  FDCE \result_peak_reg[15] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [15]),
        .Q(\result_peak_reg[15]_0 [15]));
  FDCE \result_peak_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [1]),
        .Q(\result_peak_reg[15]_0 [1]));
  FDCE \result_peak_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [2]),
        .Q(\result_peak_reg[15]_0 [2]));
  FDCE \result_peak_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [3]),
        .Q(\result_peak_reg[15]_0 [3]));
  FDCE \result_peak_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [4]),
        .Q(\result_peak_reg[15]_0 [4]));
  FDCE \result_peak_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [5]),
        .Q(\result_peak_reg[15]_0 [5]));
  FDCE \result_peak_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [6]),
        .Q(\result_peak_reg[15]_0 [6]));
  FDCE \result_peak_reg[7] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [7]),
        .Q(\result_peak_reg[15]_0 [7]));
  FDCE \result_peak_reg[8] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [8]),
        .Q(\result_peak_reg[15]_0 [8]));
  FDCE \result_peak_reg[9] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\result_peak_reg[15]_1 [9]),
        .Q(\result_peak_reg[15]_0 [9]));
  FDCE \result_sample_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(1'b1),
        .Q(result_sample_count));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[11]_i_2 
       (.I0(sum_squares_accumulator_reg[11]),
        .I1(\^sample_square_full [11]),
        .O(\result_sum_squares[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[11]_i_3 
       (.I0(sum_squares_accumulator_reg[10]),
        .I1(\^sample_square_full [10]),
        .O(\result_sum_squares[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[11]_i_4 
       (.I0(sum_squares_accumulator_reg[9]),
        .I1(\^sample_square_full [9]),
        .O(\result_sum_squares[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[11]_i_5 
       (.I0(sum_squares_accumulator_reg[8]),
        .I1(\^sample_square_full [8]),
        .O(\result_sum_squares[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[15]_i_2 
       (.I0(sum_squares_accumulator_reg[15]),
        .I1(\^sample_square_full [15]),
        .O(\result_sum_squares[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[15]_i_3 
       (.I0(sum_squares_accumulator_reg[14]),
        .I1(\^sample_square_full [14]),
        .O(\result_sum_squares[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[15]_i_4 
       (.I0(sum_squares_accumulator_reg[13]),
        .I1(\^sample_square_full [13]),
        .O(\result_sum_squares[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[15]_i_5 
       (.I0(sum_squares_accumulator_reg[12]),
        .I1(\^sample_square_full [12]),
        .O(\result_sum_squares[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[19]_i_2 
       (.I0(sum_squares_accumulator_reg[19]),
        .I1(\^sample_square_full [19]),
        .O(\result_sum_squares[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[19]_i_3 
       (.I0(sum_squares_accumulator_reg[18]),
        .I1(\^sample_square_full [18]),
        .O(\result_sum_squares[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[19]_i_4 
       (.I0(sum_squares_accumulator_reg[17]),
        .I1(\^sample_square_full [17]),
        .O(\result_sum_squares[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[19]_i_5 
       (.I0(sum_squares_accumulator_reg[16]),
        .I1(\^sample_square_full [16]),
        .O(\result_sum_squares[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[23]_i_2 
       (.I0(sum_squares_accumulator_reg[23]),
        .I1(\^sample_square_full [23]),
        .O(\result_sum_squares[23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[23]_i_3 
       (.I0(sum_squares_accumulator_reg[22]),
        .I1(\^sample_square_full [22]),
        .O(\result_sum_squares[23]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[23]_i_4 
       (.I0(sum_squares_accumulator_reg[21]),
        .I1(\^sample_square_full [21]),
        .O(\result_sum_squares[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[23]_i_5 
       (.I0(sum_squares_accumulator_reg[20]),
        .I1(\^sample_square_full [20]),
        .O(\result_sum_squares[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[27]_i_2 
       (.I0(sum_squares_accumulator_reg[27]),
        .I1(\^sample_square_full [27]),
        .O(\result_sum_squares[27]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[27]_i_3 
       (.I0(sum_squares_accumulator_reg[26]),
        .I1(\^sample_square_full [26]),
        .O(\result_sum_squares[27]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[27]_i_4 
       (.I0(sum_squares_accumulator_reg[25]),
        .I1(\^sample_square_full [25]),
        .O(\result_sum_squares[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[27]_i_5 
       (.I0(sum_squares_accumulator_reg[24]),
        .I1(\^sample_square_full [24]),
        .O(\result_sum_squares[27]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[31]_i_2 
       (.I0(sum_squares_accumulator_reg[30]),
        .I1(\^sample_square_full [30]),
        .O(\result_sum_squares[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[31]_i_3 
       (.I0(sum_squares_accumulator_reg[29]),
        .I1(\^sample_square_full [29]),
        .O(\result_sum_squares[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[31]_i_4 
       (.I0(sum_squares_accumulator_reg[28]),
        .I1(\^sample_square_full [28]),
        .O(\result_sum_squares[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[3]_i_2 
       (.I0(sum_squares_accumulator_reg[3]),
        .I1(\^sample_square_full [3]),
        .O(\result_sum_squares[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[3]_i_3 
       (.I0(sum_squares_accumulator_reg[2]),
        .I1(\^sample_square_full [2]),
        .O(\result_sum_squares[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[3]_i_4 
       (.I0(sum_squares_accumulator_reg[1]),
        .I1(\^sample_square_full [1]),
        .O(\result_sum_squares[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[3]_i_5 
       (.I0(sum_squares_accumulator_reg[0]),
        .I1(\^sample_square_full [0]),
        .O(\result_sum_squares[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[7]_i_2 
       (.I0(sum_squares_accumulator_reg[7]),
        .I1(\^sample_square_full [7]),
        .O(\result_sum_squares[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[7]_i_3 
       (.I0(sum_squares_accumulator_reg[6]),
        .I1(\^sample_square_full [6]),
        .O(\result_sum_squares[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[7]_i_4 
       (.I0(sum_squares_accumulator_reg[5]),
        .I1(\^sample_square_full [5]),
        .O(\result_sum_squares[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_sum_squares[7]_i_5 
       (.I0(sum_squares_accumulator_reg[4]),
        .I1(\^sample_square_full [4]),
        .O(\result_sum_squares[7]_i_5_n_0 ));
  FDCE \result_sum_squares_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[0]),
        .Q(\result_sum_squares_reg[34]_0 [0]));
  FDCE \result_sum_squares_reg[10] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[10]),
        .Q(\result_sum_squares_reg[34]_0 [10]));
  FDCE \result_sum_squares_reg[11] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[11]),
        .Q(\result_sum_squares_reg[34]_0 [11]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_sum_squares_reg[11]_i_1 
       (.CI(\result_sum_squares_reg[7]_i_1_n_0 ),
        .CO({\result_sum_squares_reg[11]_i_1_n_0 ,\result_sum_squares_reg[11]_i_1_n_1 ,\result_sum_squares_reg[11]_i_1_n_2 ,\result_sum_squares_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(sum_squares_accumulator_reg[11:8]),
        .O(next_sum_squares[11:8]),
        .S({\result_sum_squares[11]_i_2_n_0 ,\result_sum_squares[11]_i_3_n_0 ,\result_sum_squares[11]_i_4_n_0 ,\result_sum_squares[11]_i_5_n_0 }));
  FDCE \result_sum_squares_reg[12] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[12]),
        .Q(\result_sum_squares_reg[34]_0 [12]));
  FDCE \result_sum_squares_reg[13] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[13]),
        .Q(\result_sum_squares_reg[34]_0 [13]));
  FDCE \result_sum_squares_reg[14] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[14]),
        .Q(\result_sum_squares_reg[34]_0 [14]));
  FDCE \result_sum_squares_reg[15] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[15]),
        .Q(\result_sum_squares_reg[34]_0 [15]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_sum_squares_reg[15]_i_1 
       (.CI(\result_sum_squares_reg[11]_i_1_n_0 ),
        .CO({\result_sum_squares_reg[15]_i_1_n_0 ,\result_sum_squares_reg[15]_i_1_n_1 ,\result_sum_squares_reg[15]_i_1_n_2 ,\result_sum_squares_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(sum_squares_accumulator_reg[15:12]),
        .O(next_sum_squares[15:12]),
        .S({\result_sum_squares[15]_i_2_n_0 ,\result_sum_squares[15]_i_3_n_0 ,\result_sum_squares[15]_i_4_n_0 ,\result_sum_squares[15]_i_5_n_0 }));
  FDCE \result_sum_squares_reg[16] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[16]),
        .Q(\result_sum_squares_reg[34]_0 [16]));
  FDCE \result_sum_squares_reg[17] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[17]),
        .Q(\result_sum_squares_reg[34]_0 [17]));
  FDCE \result_sum_squares_reg[18] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[18]),
        .Q(\result_sum_squares_reg[34]_0 [18]));
  FDCE \result_sum_squares_reg[19] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[19]),
        .Q(\result_sum_squares_reg[34]_0 [19]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_sum_squares_reg[19]_i_1 
       (.CI(\result_sum_squares_reg[15]_i_1_n_0 ),
        .CO({\result_sum_squares_reg[19]_i_1_n_0 ,\result_sum_squares_reg[19]_i_1_n_1 ,\result_sum_squares_reg[19]_i_1_n_2 ,\result_sum_squares_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(sum_squares_accumulator_reg[19:16]),
        .O(next_sum_squares[19:16]),
        .S({\result_sum_squares[19]_i_2_n_0 ,\result_sum_squares[19]_i_3_n_0 ,\result_sum_squares[19]_i_4_n_0 ,\result_sum_squares[19]_i_5_n_0 }));
  FDCE \result_sum_squares_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[1]),
        .Q(\result_sum_squares_reg[34]_0 [1]));
  FDCE \result_sum_squares_reg[20] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[20]),
        .Q(\result_sum_squares_reg[34]_0 [20]));
  FDCE \result_sum_squares_reg[21] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[21]),
        .Q(\result_sum_squares_reg[34]_0 [21]));
  FDCE \result_sum_squares_reg[22] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[22]),
        .Q(\result_sum_squares_reg[34]_0 [22]));
  FDCE \result_sum_squares_reg[23] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[23]),
        .Q(\result_sum_squares_reg[34]_0 [23]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_sum_squares_reg[23]_i_1 
       (.CI(\result_sum_squares_reg[19]_i_1_n_0 ),
        .CO({\result_sum_squares_reg[23]_i_1_n_0 ,\result_sum_squares_reg[23]_i_1_n_1 ,\result_sum_squares_reg[23]_i_1_n_2 ,\result_sum_squares_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(sum_squares_accumulator_reg[23:20]),
        .O(next_sum_squares[23:20]),
        .S({\result_sum_squares[23]_i_2_n_0 ,\result_sum_squares[23]_i_3_n_0 ,\result_sum_squares[23]_i_4_n_0 ,\result_sum_squares[23]_i_5_n_0 }));
  FDCE \result_sum_squares_reg[24] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[24]),
        .Q(\result_sum_squares_reg[34]_0 [24]));
  FDCE \result_sum_squares_reg[25] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[25]),
        .Q(\result_sum_squares_reg[34]_0 [25]));
  FDCE \result_sum_squares_reg[26] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[26]),
        .Q(\result_sum_squares_reg[34]_0 [26]));
  FDCE \result_sum_squares_reg[27] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[27]),
        .Q(\result_sum_squares_reg[34]_0 [27]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_sum_squares_reg[27]_i_1 
       (.CI(\result_sum_squares_reg[23]_i_1_n_0 ),
        .CO({\result_sum_squares_reg[27]_i_1_n_0 ,\result_sum_squares_reg[27]_i_1_n_1 ,\result_sum_squares_reg[27]_i_1_n_2 ,\result_sum_squares_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(sum_squares_accumulator_reg[27:24]),
        .O(next_sum_squares[27:24]),
        .S({\result_sum_squares[27]_i_2_n_0 ,\result_sum_squares[27]_i_3_n_0 ,\result_sum_squares[27]_i_4_n_0 ,\result_sum_squares[27]_i_5_n_0 }));
  FDCE \result_sum_squares_reg[28] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[28]),
        .Q(\result_sum_squares_reg[34]_0 [28]));
  FDCE \result_sum_squares_reg[29] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[29]),
        .Q(\result_sum_squares_reg[34]_0 [29]));
  FDCE \result_sum_squares_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[2]),
        .Q(\result_sum_squares_reg[34]_0 [2]));
  FDCE \result_sum_squares_reg[30] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[30]),
        .Q(\result_sum_squares_reg[34]_0 [30]));
  FDCE \result_sum_squares_reg[31] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[31]),
        .Q(\result_sum_squares_reg[34]_0 [31]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_sum_squares_reg[31]_i_1 
       (.CI(\result_sum_squares_reg[27]_i_1_n_0 ),
        .CO({\result_sum_squares_reg[31]_i_1_n_0 ,\result_sum_squares_reg[31]_i_1_n_1 ,\result_sum_squares_reg[31]_i_1_n_2 ,\result_sum_squares_reg[31]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,sum_squares_accumulator_reg[30:28]}),
        .O(next_sum_squares[31:28]),
        .S({sum_squares_accumulator_reg[31],\result_sum_squares[31]_i_2_n_0 ,\result_sum_squares[31]_i_3_n_0 ,\result_sum_squares[31]_i_4_n_0 }));
  FDCE \result_sum_squares_reg[32] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[32]),
        .Q(\result_sum_squares_reg[34]_0 [32]));
  FDCE \result_sum_squares_reg[33] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[33]),
        .Q(\result_sum_squares_reg[34]_0 [33]));
  FDCE \result_sum_squares_reg[34] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[34]),
        .Q(\result_sum_squares_reg[34]_0 [34]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_sum_squares_reg[34]_i_1 
       (.CI(\result_sum_squares_reg[31]_i_1_n_0 ),
        .CO({\NLW_result_sum_squares_reg[34]_i_1_CO_UNCONNECTED [3:2],\result_sum_squares_reg[34]_i_1_n_2 ,\result_sum_squares_reg[34]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_result_sum_squares_reg[34]_i_1_O_UNCONNECTED [3],next_sum_squares[34:32]}),
        .S({1'b0,sum_squares_accumulator_reg[34:32]}));
  FDCE \result_sum_squares_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[3]),
        .Q(\result_sum_squares_reg[34]_0 [3]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_sum_squares_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\result_sum_squares_reg[3]_i_1_n_0 ,\result_sum_squares_reg[3]_i_1_n_1 ,\result_sum_squares_reg[3]_i_1_n_2 ,\result_sum_squares_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(sum_squares_accumulator_reg[3:0]),
        .O(next_sum_squares[3:0]),
        .S({\result_sum_squares[3]_i_2_n_0 ,\result_sum_squares[3]_i_3_n_0 ,\result_sum_squares[3]_i_4_n_0 ,\result_sum_squares[3]_i_5_n_0 }));
  FDCE \result_sum_squares_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[4]),
        .Q(\result_sum_squares_reg[34]_0 [4]));
  FDCE \result_sum_squares_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[5]),
        .Q(\result_sum_squares_reg[34]_0 [5]));
  FDCE \result_sum_squares_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[6]),
        .Q(\result_sum_squares_reg[34]_0 [6]));
  FDCE \result_sum_squares_reg[7] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[7]),
        .Q(\result_sum_squares_reg[34]_0 [7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_sum_squares_reg[7]_i_1 
       (.CI(\result_sum_squares_reg[3]_i_1_n_0 ),
        .CO({\result_sum_squares_reg[7]_i_1_n_0 ,\result_sum_squares_reg[7]_i_1_n_1 ,\result_sum_squares_reg[7]_i_1_n_2 ,\result_sum_squares_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(sum_squares_accumulator_reg[7:4]),
        .O(next_sum_squares[7:4]),
        .S({\result_sum_squares[7]_i_2_n_0 ,\result_sum_squares[7]_i_3_n_0 ,\result_sum_squares[7]_i_4_n_0 ,\result_sum_squares[7]_i_5_n_0 }));
  FDCE \result_sum_squares_reg[8] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[8]),
        .Q(\result_sum_squares_reg[34]_0 [8]));
  FDCE \result_sum_squares_reg[9] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(next_sum_squares[9]),
        .Q(\result_sum_squares_reg[34]_0 [9]));
  FDCE result_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(result_valid_reg_0),
        .Q(result_valid));
  LUT1 #(
    .INIT(2'h1)) 
    \sample_count[0]_i_1 
       (.I0(sample_count_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sample_count[1]_i_1 
       (.I0(sample_count_reg[0]),
        .I1(sample_count_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \sample_count[2]_i_1 
       (.I0(sample_count_reg[0]),
        .I1(sample_count_reg[1]),
        .I2(sample_count_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \sample_count[3]_i_1 
       (.I0(sample_count_reg[0]),
        .I1(sample_count_reg[1]),
        .I2(sample_count_reg[2]),
        .I3(sample_count_reg[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT5 #(
    .INIT(32'h7FFF0000)) 
    \sample_count[4]_i_1 
       (.I0(sample_count_reg[3]),
        .I1(sample_count_reg[0]),
        .I2(sample_count_reg[1]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[4]),
        .O(p_0_in[4]));
  FDCE \sample_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(p_0_in[0]),
        .Q(sample_count_reg[0]));
  FDCE \sample_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(p_0_in[1]),
        .Q(sample_count_reg[1]));
  FDCE \sample_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(p_0_in[2]),
        .Q(sample_count_reg[2]));
  FDCE \sample_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(p_0_in[3]),
        .Q(sample_count_reg[3]));
  FDCE \sample_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(p_0_in[4]),
        .Q(sample_count_reg[4]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    sample_square_full
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_sample_square_full_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,A}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_sample_square_full_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_sample_square_full_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_sample_square_full_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_sample_square_full_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_sample_square_full_OVERFLOW_UNCONNECTED),
        .P({NLW_sample_square_full_P_UNCONNECTED[47:32],sample_square_full_n_74,\^sample_square_full }),
        .PATTERNBDETECT(NLW_sample_square_full_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_sample_square_full_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_sample_square_full_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_sample_square_full_UNDERFLOW_UNCONNECTED));
  LUT2 #(
    .INIT(4'h8)) 
    \snapshot_peak[15]_i_1 
       (.I0(result_valid),
        .I1(s_axi_aresetn),
        .O(snapshot_seq0));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[0]_i_2 
       (.I0(\^sample_square_full [3]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[0]_i_3 
       (.I0(\^sample_square_full [2]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[0]_i_4 
       (.I0(\^sample_square_full [1]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[0]_i_5 
       (.I0(\^sample_square_full [0]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[0]_i_6 
       (.I0(\^sample_square_full [3]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[3]),
        .O(\sum_squares_accumulator[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[0]_i_7 
       (.I0(\^sample_square_full [2]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[2]),
        .O(\sum_squares_accumulator[0]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[0]_i_8 
       (.I0(\^sample_square_full [1]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[1]),
        .O(\sum_squares_accumulator[0]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[0]_i_9 
       (.I0(\^sample_square_full [0]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[0]),
        .O(\sum_squares_accumulator[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[12]_i_2 
       (.I0(\^sample_square_full [15]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[12]_i_3 
       (.I0(\^sample_square_full [14]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[12]_i_4 
       (.I0(\^sample_square_full [13]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[12]_i_5 
       (.I0(\^sample_square_full [12]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[12]_i_6 
       (.I0(\^sample_square_full [15]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[15]),
        .O(\sum_squares_accumulator[12]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[12]_i_7 
       (.I0(\^sample_square_full [14]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[14]),
        .O(\sum_squares_accumulator[12]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[12]_i_8 
       (.I0(\^sample_square_full [13]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[13]),
        .O(\sum_squares_accumulator[12]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[12]_i_9 
       (.I0(\^sample_square_full [12]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[12]),
        .O(\sum_squares_accumulator[12]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[16]_i_2 
       (.I0(\^sample_square_full [19]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[16]_i_3 
       (.I0(\^sample_square_full [18]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[16]_i_4 
       (.I0(\^sample_square_full [17]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[16]_i_5 
       (.I0(\^sample_square_full [16]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[16]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[16]_i_6 
       (.I0(\^sample_square_full [19]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[19]),
        .O(\sum_squares_accumulator[16]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[16]_i_7 
       (.I0(\^sample_square_full [18]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[18]),
        .O(\sum_squares_accumulator[16]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[16]_i_8 
       (.I0(\^sample_square_full [17]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[17]),
        .O(\sum_squares_accumulator[16]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[16]_i_9 
       (.I0(\^sample_square_full [16]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[16]),
        .O(\sum_squares_accumulator[16]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[20]_i_2 
       (.I0(\^sample_square_full [23]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[20]_i_3 
       (.I0(\^sample_square_full [22]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[20]_i_4 
       (.I0(\^sample_square_full [21]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[20]_i_5 
       (.I0(\^sample_square_full [20]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[20]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[20]_i_6 
       (.I0(\^sample_square_full [23]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[23]),
        .O(\sum_squares_accumulator[20]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[20]_i_7 
       (.I0(\^sample_square_full [22]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[22]),
        .O(\sum_squares_accumulator[20]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[20]_i_8 
       (.I0(\^sample_square_full [21]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[21]),
        .O(\sum_squares_accumulator[20]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[20]_i_9 
       (.I0(\^sample_square_full [20]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[20]),
        .O(\sum_squares_accumulator[20]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[24]_i_2 
       (.I0(\^sample_square_full [27]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[24]_i_3 
       (.I0(\^sample_square_full [26]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[24]_i_4 
       (.I0(\^sample_square_full [25]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[24]_i_5 
       (.I0(\^sample_square_full [24]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[24]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[24]_i_6 
       (.I0(\^sample_square_full [27]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[27]),
        .O(\sum_squares_accumulator[24]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[24]_i_7 
       (.I0(\^sample_square_full [26]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[26]),
        .O(\sum_squares_accumulator[24]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[24]_i_8 
       (.I0(\^sample_square_full [25]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[25]),
        .O(\sum_squares_accumulator[24]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[24]_i_9 
       (.I0(\^sample_square_full [24]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[24]),
        .O(\sum_squares_accumulator[24]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[28]_i_2 
       (.I0(\^sample_square_full [30]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[28]_i_3 
       (.I0(\^sample_square_full [29]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[28]_i_4 
       (.I0(\^sample_square_full [28]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[28]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[28]_i_5 
       (.I0(sum_squares_accumulator_reg[31]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[28]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[28]_i_6 
       (.I0(\^sample_square_full [30]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[30]),
        .O(\sum_squares_accumulator[28]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[28]_i_7 
       (.I0(\^sample_square_full [29]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[29]),
        .O(\sum_squares_accumulator[28]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[28]_i_8 
       (.I0(\^sample_square_full [28]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[28]),
        .O(\sum_squares_accumulator[28]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[32]_i_2 
       (.I0(sum_squares_accumulator_reg[34]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[32]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[32]_i_3 
       (.I0(sum_squares_accumulator_reg[33]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[32]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[32]_i_4 
       (.I0(sum_squares_accumulator_reg[32]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[32]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[4]_i_2 
       (.I0(\^sample_square_full [7]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[4]_i_3 
       (.I0(\^sample_square_full [6]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[4]_i_4 
       (.I0(\^sample_square_full [5]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[4]_i_5 
       (.I0(\^sample_square_full [4]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[4]_i_6 
       (.I0(\^sample_square_full [7]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[7]),
        .O(\sum_squares_accumulator[4]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[4]_i_7 
       (.I0(\^sample_square_full [6]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[6]),
        .O(\sum_squares_accumulator[4]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[4]_i_8 
       (.I0(\^sample_square_full [5]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[5]),
        .O(\sum_squares_accumulator[4]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[4]_i_9 
       (.I0(\^sample_square_full [4]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[4]),
        .O(\sum_squares_accumulator[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[8]_i_2 
       (.I0(\^sample_square_full [11]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[8]_i_3 
       (.I0(\^sample_square_full [10]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[8]_i_4 
       (.I0(\^sample_square_full [9]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA2AAAAAAAAAAAAAA)) 
    \sum_squares_accumulator[8]_i_5 
       (.I0(\^sample_square_full [8]),
        .I1(sample_count_reg[3]),
        .I2(sample_count_reg[4]),
        .I3(sample_count_reg[2]),
        .I4(sample_count_reg[1]),
        .I5(sample_count_reg[0]),
        .O(\sum_squares_accumulator[8]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[8]_i_6 
       (.I0(\^sample_square_full [11]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[11]),
        .O(\sum_squares_accumulator[8]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[8]_i_7 
       (.I0(\^sample_square_full [10]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[10]),
        .O(\sum_squares_accumulator[8]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[8]_i_8 
       (.I0(\^sample_square_full [9]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[9]),
        .O(\sum_squares_accumulator[8]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \sum_squares_accumulator[8]_i_9 
       (.I0(\^sample_square_full [8]),
        .I1(last_sample__3),
        .I2(sum_squares_accumulator_reg[8]),
        .O(\sum_squares_accumulator[8]_i_9_n_0 ));
  FDCE \sum_squares_accumulator_reg[0] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[0]_i_1_n_7 ),
        .Q(sum_squares_accumulator_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sum_squares_accumulator_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\sum_squares_accumulator_reg[0]_i_1_n_0 ,\sum_squares_accumulator_reg[0]_i_1_n_1 ,\sum_squares_accumulator_reg[0]_i_1_n_2 ,\sum_squares_accumulator_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\sum_squares_accumulator[0]_i_2_n_0 ,\sum_squares_accumulator[0]_i_3_n_0 ,\sum_squares_accumulator[0]_i_4_n_0 ,\sum_squares_accumulator[0]_i_5_n_0 }),
        .O({\sum_squares_accumulator_reg[0]_i_1_n_4 ,\sum_squares_accumulator_reg[0]_i_1_n_5 ,\sum_squares_accumulator_reg[0]_i_1_n_6 ,\sum_squares_accumulator_reg[0]_i_1_n_7 }),
        .S({\sum_squares_accumulator[0]_i_6_n_0 ,\sum_squares_accumulator[0]_i_7_n_0 ,\sum_squares_accumulator[0]_i_8_n_0 ,\sum_squares_accumulator[0]_i_9_n_0 }));
  FDCE \sum_squares_accumulator_reg[10] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[8]_i_1_n_5 ),
        .Q(sum_squares_accumulator_reg[10]));
  FDCE \sum_squares_accumulator_reg[11] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[8]_i_1_n_4 ),
        .Q(sum_squares_accumulator_reg[11]));
  FDCE \sum_squares_accumulator_reg[12] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[12]_i_1_n_7 ),
        .Q(sum_squares_accumulator_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sum_squares_accumulator_reg[12]_i_1 
       (.CI(\sum_squares_accumulator_reg[8]_i_1_n_0 ),
        .CO({\sum_squares_accumulator_reg[12]_i_1_n_0 ,\sum_squares_accumulator_reg[12]_i_1_n_1 ,\sum_squares_accumulator_reg[12]_i_1_n_2 ,\sum_squares_accumulator_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\sum_squares_accumulator[12]_i_2_n_0 ,\sum_squares_accumulator[12]_i_3_n_0 ,\sum_squares_accumulator[12]_i_4_n_0 ,\sum_squares_accumulator[12]_i_5_n_0 }),
        .O({\sum_squares_accumulator_reg[12]_i_1_n_4 ,\sum_squares_accumulator_reg[12]_i_1_n_5 ,\sum_squares_accumulator_reg[12]_i_1_n_6 ,\sum_squares_accumulator_reg[12]_i_1_n_7 }),
        .S({\sum_squares_accumulator[12]_i_6_n_0 ,\sum_squares_accumulator[12]_i_7_n_0 ,\sum_squares_accumulator[12]_i_8_n_0 ,\sum_squares_accumulator[12]_i_9_n_0 }));
  FDCE \sum_squares_accumulator_reg[13] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[12]_i_1_n_6 ),
        .Q(sum_squares_accumulator_reg[13]));
  FDCE \sum_squares_accumulator_reg[14] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[12]_i_1_n_5 ),
        .Q(sum_squares_accumulator_reg[14]));
  FDCE \sum_squares_accumulator_reg[15] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[12]_i_1_n_4 ),
        .Q(sum_squares_accumulator_reg[15]));
  FDCE \sum_squares_accumulator_reg[16] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[16]_i_1_n_7 ),
        .Q(sum_squares_accumulator_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sum_squares_accumulator_reg[16]_i_1 
       (.CI(\sum_squares_accumulator_reg[12]_i_1_n_0 ),
        .CO({\sum_squares_accumulator_reg[16]_i_1_n_0 ,\sum_squares_accumulator_reg[16]_i_1_n_1 ,\sum_squares_accumulator_reg[16]_i_1_n_2 ,\sum_squares_accumulator_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\sum_squares_accumulator[16]_i_2_n_0 ,\sum_squares_accumulator[16]_i_3_n_0 ,\sum_squares_accumulator[16]_i_4_n_0 ,\sum_squares_accumulator[16]_i_5_n_0 }),
        .O({\sum_squares_accumulator_reg[16]_i_1_n_4 ,\sum_squares_accumulator_reg[16]_i_1_n_5 ,\sum_squares_accumulator_reg[16]_i_1_n_6 ,\sum_squares_accumulator_reg[16]_i_1_n_7 }),
        .S({\sum_squares_accumulator[16]_i_6_n_0 ,\sum_squares_accumulator[16]_i_7_n_0 ,\sum_squares_accumulator[16]_i_8_n_0 ,\sum_squares_accumulator[16]_i_9_n_0 }));
  FDCE \sum_squares_accumulator_reg[17] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[16]_i_1_n_6 ),
        .Q(sum_squares_accumulator_reg[17]));
  FDCE \sum_squares_accumulator_reg[18] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[16]_i_1_n_5 ),
        .Q(sum_squares_accumulator_reg[18]));
  FDCE \sum_squares_accumulator_reg[19] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[16]_i_1_n_4 ),
        .Q(sum_squares_accumulator_reg[19]));
  FDCE \sum_squares_accumulator_reg[1] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[0]_i_1_n_6 ),
        .Q(sum_squares_accumulator_reg[1]));
  FDCE \sum_squares_accumulator_reg[20] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[20]_i_1_n_7 ),
        .Q(sum_squares_accumulator_reg[20]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sum_squares_accumulator_reg[20]_i_1 
       (.CI(\sum_squares_accumulator_reg[16]_i_1_n_0 ),
        .CO({\sum_squares_accumulator_reg[20]_i_1_n_0 ,\sum_squares_accumulator_reg[20]_i_1_n_1 ,\sum_squares_accumulator_reg[20]_i_1_n_2 ,\sum_squares_accumulator_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\sum_squares_accumulator[20]_i_2_n_0 ,\sum_squares_accumulator[20]_i_3_n_0 ,\sum_squares_accumulator[20]_i_4_n_0 ,\sum_squares_accumulator[20]_i_5_n_0 }),
        .O({\sum_squares_accumulator_reg[20]_i_1_n_4 ,\sum_squares_accumulator_reg[20]_i_1_n_5 ,\sum_squares_accumulator_reg[20]_i_1_n_6 ,\sum_squares_accumulator_reg[20]_i_1_n_7 }),
        .S({\sum_squares_accumulator[20]_i_6_n_0 ,\sum_squares_accumulator[20]_i_7_n_0 ,\sum_squares_accumulator[20]_i_8_n_0 ,\sum_squares_accumulator[20]_i_9_n_0 }));
  FDCE \sum_squares_accumulator_reg[21] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[20]_i_1_n_6 ),
        .Q(sum_squares_accumulator_reg[21]));
  FDCE \sum_squares_accumulator_reg[22] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[20]_i_1_n_5 ),
        .Q(sum_squares_accumulator_reg[22]));
  FDCE \sum_squares_accumulator_reg[23] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[20]_i_1_n_4 ),
        .Q(sum_squares_accumulator_reg[23]));
  FDCE \sum_squares_accumulator_reg[24] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[24]_i_1_n_7 ),
        .Q(sum_squares_accumulator_reg[24]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sum_squares_accumulator_reg[24]_i_1 
       (.CI(\sum_squares_accumulator_reg[20]_i_1_n_0 ),
        .CO({\sum_squares_accumulator_reg[24]_i_1_n_0 ,\sum_squares_accumulator_reg[24]_i_1_n_1 ,\sum_squares_accumulator_reg[24]_i_1_n_2 ,\sum_squares_accumulator_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\sum_squares_accumulator[24]_i_2_n_0 ,\sum_squares_accumulator[24]_i_3_n_0 ,\sum_squares_accumulator[24]_i_4_n_0 ,\sum_squares_accumulator[24]_i_5_n_0 }),
        .O({\sum_squares_accumulator_reg[24]_i_1_n_4 ,\sum_squares_accumulator_reg[24]_i_1_n_5 ,\sum_squares_accumulator_reg[24]_i_1_n_6 ,\sum_squares_accumulator_reg[24]_i_1_n_7 }),
        .S({\sum_squares_accumulator[24]_i_6_n_0 ,\sum_squares_accumulator[24]_i_7_n_0 ,\sum_squares_accumulator[24]_i_8_n_0 ,\sum_squares_accumulator[24]_i_9_n_0 }));
  FDCE \sum_squares_accumulator_reg[25] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[24]_i_1_n_6 ),
        .Q(sum_squares_accumulator_reg[25]));
  FDCE \sum_squares_accumulator_reg[26] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[24]_i_1_n_5 ),
        .Q(sum_squares_accumulator_reg[26]));
  FDCE \sum_squares_accumulator_reg[27] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[24]_i_1_n_4 ),
        .Q(sum_squares_accumulator_reg[27]));
  FDCE \sum_squares_accumulator_reg[28] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[28]_i_1_n_7 ),
        .Q(sum_squares_accumulator_reg[28]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sum_squares_accumulator_reg[28]_i_1 
       (.CI(\sum_squares_accumulator_reg[24]_i_1_n_0 ),
        .CO({\sum_squares_accumulator_reg[28]_i_1_n_0 ,\sum_squares_accumulator_reg[28]_i_1_n_1 ,\sum_squares_accumulator_reg[28]_i_1_n_2 ,\sum_squares_accumulator_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\sum_squares_accumulator[28]_i_2_n_0 ,\sum_squares_accumulator[28]_i_3_n_0 ,\sum_squares_accumulator[28]_i_4_n_0 }),
        .O({\sum_squares_accumulator_reg[28]_i_1_n_4 ,\sum_squares_accumulator_reg[28]_i_1_n_5 ,\sum_squares_accumulator_reg[28]_i_1_n_6 ,\sum_squares_accumulator_reg[28]_i_1_n_7 }),
        .S({\sum_squares_accumulator[28]_i_5_n_0 ,\sum_squares_accumulator[28]_i_6_n_0 ,\sum_squares_accumulator[28]_i_7_n_0 ,\sum_squares_accumulator[28]_i_8_n_0 }));
  FDCE \sum_squares_accumulator_reg[29] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[28]_i_1_n_6 ),
        .Q(sum_squares_accumulator_reg[29]));
  FDCE \sum_squares_accumulator_reg[2] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[0]_i_1_n_5 ),
        .Q(sum_squares_accumulator_reg[2]));
  FDCE \sum_squares_accumulator_reg[30] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[28]_i_1_n_5 ),
        .Q(sum_squares_accumulator_reg[30]));
  FDCE \sum_squares_accumulator_reg[31] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[28]_i_1_n_4 ),
        .Q(sum_squares_accumulator_reg[31]));
  FDCE \sum_squares_accumulator_reg[32] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[32]_i_1_n_7 ),
        .Q(sum_squares_accumulator_reg[32]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sum_squares_accumulator_reg[32]_i_1 
       (.CI(\sum_squares_accumulator_reg[28]_i_1_n_0 ),
        .CO({\NLW_sum_squares_accumulator_reg[32]_i_1_CO_UNCONNECTED [3:2],\sum_squares_accumulator_reg[32]_i_1_n_2 ,\sum_squares_accumulator_reg[32]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_sum_squares_accumulator_reg[32]_i_1_O_UNCONNECTED [3],\sum_squares_accumulator_reg[32]_i_1_n_5 ,\sum_squares_accumulator_reg[32]_i_1_n_6 ,\sum_squares_accumulator_reg[32]_i_1_n_7 }),
        .S({1'b0,\sum_squares_accumulator[32]_i_2_n_0 ,\sum_squares_accumulator[32]_i_3_n_0 ,\sum_squares_accumulator[32]_i_4_n_0 }));
  FDCE \sum_squares_accumulator_reg[33] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[32]_i_1_n_6 ),
        .Q(sum_squares_accumulator_reg[33]));
  FDCE \sum_squares_accumulator_reg[34] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[32]_i_1_n_5 ),
        .Q(sum_squares_accumulator_reg[34]));
  FDCE \sum_squares_accumulator_reg[3] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[0]_i_1_n_4 ),
        .Q(sum_squares_accumulator_reg[3]));
  FDCE \sum_squares_accumulator_reg[4] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[4]_i_1_n_7 ),
        .Q(sum_squares_accumulator_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sum_squares_accumulator_reg[4]_i_1 
       (.CI(\sum_squares_accumulator_reg[0]_i_1_n_0 ),
        .CO({\sum_squares_accumulator_reg[4]_i_1_n_0 ,\sum_squares_accumulator_reg[4]_i_1_n_1 ,\sum_squares_accumulator_reg[4]_i_1_n_2 ,\sum_squares_accumulator_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\sum_squares_accumulator[4]_i_2_n_0 ,\sum_squares_accumulator[4]_i_3_n_0 ,\sum_squares_accumulator[4]_i_4_n_0 ,\sum_squares_accumulator[4]_i_5_n_0 }),
        .O({\sum_squares_accumulator_reg[4]_i_1_n_4 ,\sum_squares_accumulator_reg[4]_i_1_n_5 ,\sum_squares_accumulator_reg[4]_i_1_n_6 ,\sum_squares_accumulator_reg[4]_i_1_n_7 }),
        .S({\sum_squares_accumulator[4]_i_6_n_0 ,\sum_squares_accumulator[4]_i_7_n_0 ,\sum_squares_accumulator[4]_i_8_n_0 ,\sum_squares_accumulator[4]_i_9_n_0 }));
  FDCE \sum_squares_accumulator_reg[5] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[4]_i_1_n_6 ),
        .Q(sum_squares_accumulator_reg[5]));
  FDCE \sum_squares_accumulator_reg[6] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[4]_i_1_n_5 ),
        .Q(sum_squares_accumulator_reg[6]));
  FDCE \sum_squares_accumulator_reg[7] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[4]_i_1_n_4 ),
        .Q(sum_squares_accumulator_reg[7]));
  FDCE \sum_squares_accumulator_reg[8] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[8]_i_1_n_7 ),
        .Q(sum_squares_accumulator_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sum_squares_accumulator_reg[8]_i_1 
       (.CI(\sum_squares_accumulator_reg[4]_i_1_n_0 ),
        .CO({\sum_squares_accumulator_reg[8]_i_1_n_0 ,\sum_squares_accumulator_reg[8]_i_1_n_1 ,\sum_squares_accumulator_reg[8]_i_1_n_2 ,\sum_squares_accumulator_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\sum_squares_accumulator[8]_i_2_n_0 ,\sum_squares_accumulator[8]_i_3_n_0 ,\sum_squares_accumulator[8]_i_4_n_0 ,\sum_squares_accumulator[8]_i_5_n_0 }),
        .O({\sum_squares_accumulator_reg[8]_i_1_n_4 ,\sum_squares_accumulator_reg[8]_i_1_n_5 ,\sum_squares_accumulator_reg[8]_i_1_n_6 ,\sum_squares_accumulator_reg[8]_i_1_n_7 }),
        .S({\sum_squares_accumulator[8]_i_6_n_0 ,\sum_squares_accumulator[8]_i_7_n_0 ,\sum_squares_accumulator[8]_i_8_n_0 ,\sum_squares_accumulator[8]_i_9_n_0 }));
  FDCE \sum_squares_accumulator_reg[9] 
       (.C(s_axi_aclk),
        .CE(\peak_accumulator_reg[15]_0 ),
        .CLR(\sum_squares_accumulator_reg[0]_0 ),
        .D(\sum_squares_accumulator_reg[8]_i_1_n_6 ),
        .Q(sum_squares_accumulator_reg[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
