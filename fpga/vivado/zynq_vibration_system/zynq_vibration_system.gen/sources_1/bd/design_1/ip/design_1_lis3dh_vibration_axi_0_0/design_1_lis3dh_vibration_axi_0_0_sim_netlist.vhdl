-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Mon Oct 26 10:19:38 2026
-- Host        : LAPTOP-SINKEN running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/vibration-monitor/fpga/vivado/zynq_vibration_system/zynq_vibration_system.gen/sources_1/bd/design_1/ip/design_1_lis3dh_vibration_axi_0_0/design_1_lis3dh_vibration_axi_0_0_sim_netlist.vhdl
-- Design      : design_1_lis3dh_vibration_axi_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_burst_reader is
  port (
    s_axi_aresetn : out STD_LOGIC;
    done_reg_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \read_data_reg[23]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \read_data_reg[7]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    done_reg_1 : out STD_LOGIC;
    burst_cs_n : out STD_LOGIC;
    burst_sclk : out STD_LOGIC;
    burst_mosi : out STD_LOGIC;
    clk : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    lis3dh_miso : in STD_LOGIC;
    xyz_x : in STD_LOGIC_VECTOR ( 15 downto 0 );
    xyz_y : in STD_LOGIC_VECTOR ( 15 downto 0 );
    xyz_z : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rst_n : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_burst_reader : entity is "lis3dh_spi_burst_reader";
end design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_burst_reader;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_burst_reader is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_3_n_0\ : STD_LOGIC;
  signal bit_count : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \bit_count[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \bit_count[5]_i_1_n_0\ : STD_LOGIC;
  signal \bit_count[5]_i_3_n_0\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[4]\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[5]\ : STD_LOGIC;
  signal \^burst_cs_n\ : STD_LOGIC;
  signal burst_done : STD_LOGIC;
  signal \^burst_mosi\ : STD_LOGIC;
  signal \^burst_sclk\ : STD_LOGIC;
  signal decoded_x0 : STD_LOGIC;
  signal decoded_y0 : STD_LOGIC;
  signal decoded_z0 : STD_LOGIC;
  signal div_counter : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \div_counter[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \div_counter[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \done_i_1__0_n_0\ : STD_LOGIC;
  signal lis3dh_cs_n_i_1_n_0 : STD_LOGIC;
  signal lis3dh_mosi_i_1_n_0 : STD_LOGIC;
  signal lis3dh_mosi_i_2_n_0 : STD_LOGIC;
  signal lis3dh_mosi_i_3_n_0 : STD_LOGIC;
  signal lis3dh_sclk_i_1_n_0 : STD_LOGIC;
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 47 downto 1 );
  signal \read_data[47]_i_1_n_0\ : STD_LOGIC;
  signal \read_data[47]_i_2_n_0\ : STD_LOGIC;
  signal \read_data_reg_n_0_[0]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[12]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[13]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[14]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[15]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[16]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[17]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[18]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[19]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[1]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[20]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[21]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[22]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[28]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[29]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[30]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[31]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[32]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[33]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[34]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[35]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[36]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[37]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[38]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[44]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[45]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[46]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[47]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[5]\ : STD_LOGIC;
  signal \read_data_reg_n_0_[6]\ : STD_LOGIC;
  signal rx_shift : STD_LOGIC_VECTOR ( 46 downto 0 );
  signal \rx_shift[46]_i_1_n_0\ : STD_LOGIC;
  signal \rx_shift[46]_i_3_n_0\ : STD_LOGIC;
  signal \rx_shift[46]_i_4_n_0\ : STD_LOGIC;
  signal \^s_axi_aresetn\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_2\ : label is "soft_lutpair27";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "IDLE:00,SAMPLE_RISE:10,DRIVE_FALL:01,CS_HOLD:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "IDLE:00,SAMPLE_RISE:10,DRIVE_FALL:01,CS_HOLD:11";
  attribute SOFT_HLUTNM of \bit_count[0]_i_1__0\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \bit_count[1]_i_1__0\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \bit_count[2]_i_1__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \bit_count[3]_i_1__0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \bit_count[5]_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \bit_count[5]_i_3\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \div_counter[1]_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \div_counter[2]_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \div_counter[4]_i_2__0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \done_i_1__0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of lis3dh_cs_n_i_1 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of lis3dh_mosi_i_2 : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of lis3dh_mosi_i_3 : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rx_shift[10]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \rx_shift[11]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \rx_shift[12]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \rx_shift[13]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \rx_shift[14]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \rx_shift[15]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \rx_shift[16]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \rx_shift[17]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \rx_shift[18]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \rx_shift[19]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \rx_shift[1]_i_1__0\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \rx_shift[20]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \rx_shift[21]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \rx_shift[22]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \rx_shift[23]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \rx_shift[24]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \rx_shift[25]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \rx_shift[26]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \rx_shift[27]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \rx_shift[28]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \rx_shift[29]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \rx_shift[2]_i_1__0\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \rx_shift[30]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \rx_shift[31]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \rx_shift[32]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \rx_shift[33]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \rx_shift[34]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \rx_shift[35]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \rx_shift[36]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \rx_shift[37]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \rx_shift[38]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \rx_shift[39]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \rx_shift[3]_i_1__0\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \rx_shift[40]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \rx_shift[41]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \rx_shift[42]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \rx_shift[43]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \rx_shift[44]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \rx_shift[45]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \rx_shift[46]_i_2\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \rx_shift[4]_i_1__0\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \rx_shift[5]_i_1__0\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \rx_shift[6]_i_1__0\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \rx_shift[7]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \rx_shift[8]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \rx_shift[9]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of xyz_valid_i_1 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \xyz_x[0]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \xyz_x[10]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \xyz_x[11]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \xyz_x[12]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \xyz_x[13]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \xyz_x[14]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \xyz_x[15]_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \xyz_x[1]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \xyz_x[2]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \xyz_x[3]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \xyz_x[4]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \xyz_x[5]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \xyz_x[6]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \xyz_x[7]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \xyz_x[8]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \xyz_x[9]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \xyz_y[0]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \xyz_y[10]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \xyz_y[11]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \xyz_y[12]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \xyz_y[13]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \xyz_y[14]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \xyz_y[15]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \xyz_y[1]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \xyz_y[2]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \xyz_y[3]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \xyz_y[4]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \xyz_y[5]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \xyz_y[6]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \xyz_y[7]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \xyz_y[8]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \xyz_y[9]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \xyz_z[0]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \xyz_z[10]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \xyz_z[11]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \xyz_z[12]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \xyz_z[13]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \xyz_z[14]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \xyz_z[15]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \xyz_z[1]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \xyz_z[2]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \xyz_z[3]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \xyz_z[4]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \xyz_z[5]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \xyz_z[6]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \xyz_z[7]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \xyz_z[8]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \xyz_z[9]_i_1\ : label is "soft_lutpair53";
begin
  burst_cs_n <= \^burst_cs_n\;
  burst_mosi <= \^burst_mosi\;
  burst_sclk <= \^burst_sclk\;
  s_axi_aresetn <= \^s_axi_aresetn\;
\FSM_onehot_state[3]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => \^s_axi_aresetn\
    );
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55B8"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_3_n_0\,
      I1 => state(1),
      I2 => \FSM_sequential_state[0]_i_2_n_0\,
      I3 => state(0),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(0),
      I2 => \out\(2),
      I3 => \out\(3),
      O => \FSM_sequential_state[0]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"34CC"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_2_n_0\,
      I1 => state(1),
      I2 => state(0),
      I3 => \FSM_sequential_state[1]_i_3_n_0\,
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFFFFF"
    )
        port map (
      I0 => \bit_count_reg_n_0_[4]\,
      I1 => \bit_count_reg_n_0_[1]\,
      I2 => \bit_count_reg_n_0_[0]\,
      I3 => \bit_count_reg_n_0_[2]\,
      I4 => \bit_count_reg_n_0_[5]\,
      I5 => \bit_count_reg_n_0_[3]\,
      O => \FSM_sequential_state[1]_i_2_n_0\
    );
\FSM_sequential_state[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => \div_counter_reg_n_0_[1]\,
      I1 => \div_counter_reg_n_0_[0]\,
      I2 => \div_counter_reg_n_0_[3]\,
      I3 => \div_counter_reg_n_0_[4]\,
      I4 => \div_counter_reg_n_0_[2]\,
      O => \FSM_sequential_state[1]_i_3_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^s_axi_aresetn\,
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => state(0)
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^s_axi_aresetn\,
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => state(1)
    );
\bit_count[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(1),
      I1 => \bit_count_reg_n_0_[0]\,
      O => bit_count(0)
    );
\bit_count[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \bit_count_reg_n_0_[1]\,
      I1 => \bit_count_reg_n_0_[0]\,
      I2 => state(1),
      O => \bit_count[1]_i_1__0_n_0\
    );
\bit_count[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => state(1),
      I1 => \bit_count_reg_n_0_[0]\,
      I2 => \bit_count_reg_n_0_[1]\,
      I3 => \bit_count_reg_n_0_[2]\,
      O => bit_count(2)
    );
\bit_count[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => state(1),
      I1 => \bit_count_reg_n_0_[1]\,
      I2 => \bit_count_reg_n_0_[0]\,
      I3 => \bit_count_reg_n_0_[2]\,
      I4 => \bit_count_reg_n_0_[3]\,
      O => bit_count(3)
    );
\bit_count[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => state(1),
      I1 => \bit_count_reg_n_0_[2]\,
      I2 => \bit_count_reg_n_0_[0]\,
      I3 => \bit_count_reg_n_0_[1]\,
      I4 => \bit_count_reg_n_0_[3]\,
      I5 => \bit_count_reg_n_0_[4]\,
      O => bit_count(4)
    );
\bit_count[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"51114000"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \FSM_sequential_state[1]_i_3_n_0\,
      I3 => \FSM_sequential_state[1]_i_2_n_0\,
      I4 => \FSM_sequential_state[0]_i_2_n_0\,
      O => \bit_count[5]_i_1_n_0\
    );
\bit_count[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2AA0800"
    )
        port map (
      I0 => state(1),
      I1 => \bit_count_reg_n_0_[3]\,
      I2 => \bit_count[5]_i_3_n_0\,
      I3 => \bit_count_reg_n_0_[4]\,
      I4 => \bit_count_reg_n_0_[5]\,
      O => bit_count(5)
    );
\bit_count[5]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \bit_count_reg_n_0_[1]\,
      I1 => \bit_count_reg_n_0_[0]\,
      I2 => \bit_count_reg_n_0_[2]\,
      O => \bit_count[5]_i_3_n_0\
    );
\bit_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[5]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => bit_count(0),
      Q => \bit_count_reg_n_0_[0]\
    );
\bit_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[5]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \bit_count[1]_i_1__0_n_0\,
      Q => \bit_count_reg_n_0_[1]\
    );
\bit_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[5]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => bit_count(2),
      Q => \bit_count_reg_n_0_[2]\
    );
\bit_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[5]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => bit_count(3),
      Q => \bit_count_reg_n_0_[3]\
    );
\bit_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[5]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => bit_count(4),
      Q => \bit_count_reg_n_0_[4]\
    );
\bit_count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[5]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => bit_count(5),
      Q => \bit_count_reg_n_0_[5]\
    );
\div_counter[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFBF"
    )
        port map (
      I0 => \div_counter_reg_n_0_[1]\,
      I1 => \div_counter_reg_n_0_[3]\,
      I2 => \div_counter_reg_n_0_[4]\,
      I3 => \div_counter_reg_n_0_[2]\,
      I4 => \div_counter[4]_i_2__0_n_0\,
      I5 => \div_counter_reg_n_0_[0]\,
      O => div_counter(0)
    );
\div_counter[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6660"
    )
        port map (
      I0 => \div_counter_reg_n_0_[1]\,
      I1 => \div_counter_reg_n_0_[0]\,
      I2 => state(0),
      I3 => state(1),
      O => div_counter(1)
    );
\div_counter[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0EEEE000"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \div_counter_reg_n_0_[0]\,
      I3 => \div_counter_reg_n_0_[1]\,
      I4 => \div_counter_reg_n_0_[2]\,
      O => \div_counter[2]_i_1__0_n_0\
    );
\div_counter[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0333333130000000"
    )
        port map (
      I0 => \div_counter_reg_n_0_[4]\,
      I1 => \div_counter[4]_i_2__0_n_0\,
      I2 => \div_counter_reg_n_0_[1]\,
      I3 => \div_counter_reg_n_0_[0]\,
      I4 => \div_counter_reg_n_0_[2]\,
      I5 => \div_counter_reg_n_0_[3]\,
      O => div_counter(3)
    );
\div_counter[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555140000000"
    )
        port map (
      I0 => \div_counter[4]_i_2__0_n_0\,
      I1 => \div_counter_reg_n_0_[3]\,
      I2 => \div_counter_reg_n_0_[2]\,
      I3 => \div_counter_reg_n_0_[0]\,
      I4 => \div_counter_reg_n_0_[1]\,
      I5 => \div_counter_reg_n_0_[4]\,
      O => div_counter(4)
    );
\div_counter[4]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      O => \div_counter[4]_i_2__0_n_0\
    );
\div_counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^s_axi_aresetn\,
      D => div_counter(0),
      Q => \div_counter_reg_n_0_[0]\
    );
\div_counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^s_axi_aresetn\,
      D => div_counter(1),
      Q => \div_counter_reg_n_0_[1]\
    );
\div_counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^s_axi_aresetn\,
      D => \div_counter[2]_i_1__0_n_0\,
      Q => \div_counter_reg_n_0_[2]\
    );
\div_counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^s_axi_aresetn\,
      D => div_counter(3),
      Q => \div_counter_reg_n_0_[3]\
    );
\div_counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^s_axi_aresetn\,
      D => div_counter(4),
      Q => \div_counter_reg_n_0_[4]\
    );
\done_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \FSM_sequential_state[1]_i_3_n_0\,
      I1 => state(0),
      I2 => state(1),
      O => \done_i_1__0_n_0\
    );
done_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^s_axi_aresetn\,
      D => \done_i_1__0_n_0\,
      Q => burst_done
    );
lis3dh_cs_n_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF5C005"
    )
        port map (
      I0 => \FSM_sequential_state[0]_i_2_n_0\,
      I1 => \FSM_sequential_state[1]_i_3_n_0\,
      I2 => state(0),
      I3 => state(1),
      I4 => \^burst_cs_n\,
      O => lis3dh_cs_n_i_1_n_0
    );
lis3dh_cs_n_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => lis3dh_cs_n_i_1_n_0,
      PRE => \^s_axi_aresetn\,
      Q => \^burst_cs_n\
    );
lis3dh_mosi_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F8FFF0000800000"
    )
        port map (
      I0 => lis3dh_mosi_i_2_n_0,
      I1 => lis3dh_mosi_i_3_n_0,
      I2 => \FSM_sequential_state[1]_i_3_n_0\,
      I3 => state(1),
      I4 => state(0),
      I5 => \^burst_mosi\,
      O => lis3dh_mosi_i_1_n_0
    );
lis3dh_mosi_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"17"
    )
        port map (
      I0 => \bit_count_reg_n_0_[2]\,
      I1 => \bit_count_reg_n_0_[1]\,
      I2 => \bit_count_reg_n_0_[0]\,
      O => lis3dh_mosi_i_2_n_0
    );
lis3dh_mosi_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \bit_count_reg_n_0_[3]\,
      I1 => \bit_count_reg_n_0_[4]\,
      I2 => \bit_count_reg_n_0_[5]\,
      O => lis3dh_mosi_i_3_n_0
    );
lis3dh_mosi_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^s_axi_aresetn\,
      D => lis3dh_mosi_i_1_n_0,
      Q => \^burst_mosi\
    );
lis3dh_sclk_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F3AB"
    )
        port map (
      I0 => \^burst_sclk\,
      I1 => state(0),
      I2 => state(1),
      I3 => \FSM_sequential_state[1]_i_3_n_0\,
      O => lis3dh_sclk_i_1_n_0
    );
lis3dh_sclk_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => lis3dh_sclk_i_1_n_0,
      PRE => \^s_axi_aresetn\,
      Q => \^burst_sclk\
    );
\read_data[47]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002000"
    )
        port map (
      I0 => \read_data[47]_i_2_n_0\,
      I1 => \div_counter_reg_n_0_[2]\,
      I2 => \div_counter_reg_n_0_[4]\,
      I3 => \div_counter_reg_n_0_[3]\,
      I4 => \div_counter_reg_n_0_[0]\,
      I5 => \div_counter_reg_n_0_[1]\,
      O => \read_data[47]_i_1_n_0\
    );
\read_data[47]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000040000000000"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => \bit_count_reg_n_0_[3]\,
      I3 => \bit_count_reg_n_0_[5]\,
      I4 => \bit_count[5]_i_3_n_0\,
      I5 => \bit_count_reg_n_0_[4]\,
      O => \read_data[47]_i_2_n_0\
    );
\read_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => lis3dh_miso,
      Q => \read_data_reg_n_0_[0]\
    );
\read_data_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(12),
      Q => \read_data_reg_n_0_[12]\
    );
\read_data_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(13),
      Q => \read_data_reg_n_0_[13]\
    );
\read_data_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(14),
      Q => \read_data_reg_n_0_[14]\
    );
\read_data_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(15),
      Q => \read_data_reg_n_0_[15]\
    );
\read_data_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(16),
      Q => \read_data_reg_n_0_[16]\
    );
\read_data_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(17),
      Q => \read_data_reg_n_0_[17]\
    );
\read_data_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(18),
      Q => \read_data_reg_n_0_[18]\
    );
\read_data_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(19),
      Q => \read_data_reg_n_0_[19]\
    );
\read_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(1),
      Q => \read_data_reg_n_0_[1]\
    );
\read_data_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(20),
      Q => \read_data_reg_n_0_[20]\
    );
\read_data_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(21),
      Q => \read_data_reg_n_0_[21]\
    );
\read_data_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(22),
      Q => \read_data_reg_n_0_[22]\
    );
\read_data_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(23),
      Q => decoded_y0
    );
\read_data_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(28),
      Q => \read_data_reg_n_0_[28]\
    );
\read_data_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(29),
      Q => \read_data_reg_n_0_[29]\
    );
\read_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(2),
      Q => \read_data_reg_n_0_[2]\
    );
\read_data_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(30),
      Q => \read_data_reg_n_0_[30]\
    );
\read_data_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(31),
      Q => \read_data_reg_n_0_[31]\
    );
\read_data_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(32),
      Q => \read_data_reg_n_0_[32]\
    );
\read_data_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(33),
      Q => \read_data_reg_n_0_[33]\
    );
\read_data_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(34),
      Q => \read_data_reg_n_0_[34]\
    );
\read_data_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(35),
      Q => \read_data_reg_n_0_[35]\
    );
\read_data_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(36),
      Q => \read_data_reg_n_0_[36]\
    );
\read_data_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(37),
      Q => \read_data_reg_n_0_[37]\
    );
\read_data_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(38),
      Q => \read_data_reg_n_0_[38]\
    );
\read_data_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(39),
      Q => decoded_x0
    );
\read_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(3),
      Q => \read_data_reg_n_0_[3]\
    );
\read_data_reg[44]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(44),
      Q => \read_data_reg_n_0_[44]\
    );
\read_data_reg[45]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(45),
      Q => \read_data_reg_n_0_[45]\
    );
\read_data_reg[46]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(46),
      Q => \read_data_reg_n_0_[46]\
    );
\read_data_reg[47]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(47),
      Q => \read_data_reg_n_0_[47]\
    );
\read_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(4),
      Q => \read_data_reg_n_0_[4]\
    );
\read_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(5),
      Q => \read_data_reg_n_0_[5]\
    );
\read_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(6),
      Q => \read_data_reg_n_0_[6]\
    );
\read_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[47]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => \p_0_in__1\(7),
      Q => decoded_z0
    );
\rx_shift[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => lis3dh_miso,
      O => rx_shift(0)
    );
\rx_shift[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(10),
      O => rx_shift(10)
    );
\rx_shift[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(11),
      O => rx_shift(11)
    );
\rx_shift[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(12),
      O => rx_shift(12)
    );
\rx_shift[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(13),
      O => rx_shift(13)
    );
\rx_shift[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(14),
      O => rx_shift(14)
    );
\rx_shift[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(15),
      O => rx_shift(15)
    );
\rx_shift[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(16),
      O => rx_shift(16)
    );
\rx_shift[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(17),
      O => rx_shift(17)
    );
\rx_shift[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(18),
      O => rx_shift(18)
    );
\rx_shift[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(19),
      O => rx_shift(19)
    );
\rx_shift[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(1),
      O => rx_shift(1)
    );
\rx_shift[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(20),
      O => rx_shift(20)
    );
\rx_shift[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(21),
      O => rx_shift(21)
    );
\rx_shift[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(22),
      O => rx_shift(22)
    );
\rx_shift[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(23),
      O => rx_shift(23)
    );
\rx_shift[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(24),
      O => rx_shift(24)
    );
\rx_shift[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(25),
      O => rx_shift(25)
    );
\rx_shift[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(26),
      O => rx_shift(26)
    );
\rx_shift[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(27),
      O => rx_shift(27)
    );
\rx_shift[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(28),
      O => rx_shift(28)
    );
\rx_shift[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(29),
      O => rx_shift(29)
    );
\rx_shift[2]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(2),
      O => rx_shift(2)
    );
\rx_shift[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(30),
      O => rx_shift(30)
    );
\rx_shift[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(31),
      O => rx_shift(31)
    );
\rx_shift[32]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(32),
      O => rx_shift(32)
    );
\rx_shift[33]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(33),
      O => rx_shift(33)
    );
\rx_shift[34]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(34),
      O => rx_shift(34)
    );
\rx_shift[35]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(35),
      O => rx_shift(35)
    );
\rx_shift[36]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(36),
      O => rx_shift(36)
    );
\rx_shift[37]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(37),
      O => rx_shift(37)
    );
\rx_shift[38]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(38),
      O => rx_shift(38)
    );
\rx_shift[39]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(39),
      O => rx_shift(39)
    );
\rx_shift[3]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(3),
      O => rx_shift(3)
    );
\rx_shift[40]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(40),
      O => rx_shift(40)
    );
\rx_shift[41]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(41),
      O => rx_shift(41)
    );
\rx_shift[42]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(42),
      O => rx_shift(42)
    );
\rx_shift[43]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(43),
      O => rx_shift(43)
    );
\rx_shift[44]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(44),
      O => rx_shift(44)
    );
\rx_shift[45]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(45),
      O => rx_shift(45)
    );
\rx_shift[46]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444055555555"
    )
        port map (
      I0 => state(0),
      I1 => \rx_shift[46]_i_3_n_0\,
      I2 => \bit_count_reg_n_0_[5]\,
      I3 => \bit_count_reg_n_0_[4]\,
      I4 => \bit_count_reg_n_0_[3]\,
      I5 => \rx_shift[46]_i_4_n_0\,
      O => \rx_shift[46]_i_1_n_0\
    );
\rx_shift[46]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(46),
      O => rx_shift(46)
    );
\rx_shift[46]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000004000000000"
    )
        port map (
      I0 => \div_counter_reg_n_0_[2]\,
      I1 => \div_counter_reg_n_0_[4]\,
      I2 => \div_counter_reg_n_0_[3]\,
      I3 => \div_counter_reg_n_0_[0]\,
      I4 => \div_counter_reg_n_0_[1]\,
      I5 => state(1),
      O => \rx_shift[46]_i_3_n_0\
    );
\rx_shift[46]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFFFFFF"
    )
        port map (
      I0 => state(1),
      I1 => \out\(3),
      I2 => \out\(2),
      I3 => \out\(0),
      I4 => \out\(1),
      O => \rx_shift[46]_i_4_n_0\
    );
\rx_shift[4]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(4),
      O => rx_shift(4)
    );
\rx_shift[5]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(5),
      O => rx_shift(5)
    );
\rx_shift[6]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(6),
      O => rx_shift(6)
    );
\rx_shift[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(7),
      O => rx_shift(7)
    );
\rx_shift[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(8),
      O => rx_shift(8)
    );
\rx_shift[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => \p_0_in__1\(9),
      O => rx_shift(9)
    );
\rx_shift_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(0),
      Q => \p_0_in__1\(1)
    );
\rx_shift_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(10),
      Q => \p_0_in__1\(11)
    );
\rx_shift_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(11),
      Q => \p_0_in__1\(12)
    );
\rx_shift_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(12),
      Q => \p_0_in__1\(13)
    );
\rx_shift_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(13),
      Q => \p_0_in__1\(14)
    );
\rx_shift_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(14),
      Q => \p_0_in__1\(15)
    );
\rx_shift_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(15),
      Q => \p_0_in__1\(16)
    );
\rx_shift_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(16),
      Q => \p_0_in__1\(17)
    );
\rx_shift_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(17),
      Q => \p_0_in__1\(18)
    );
\rx_shift_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(18),
      Q => \p_0_in__1\(19)
    );
\rx_shift_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(19),
      Q => \p_0_in__1\(20)
    );
\rx_shift_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(1),
      Q => \p_0_in__1\(2)
    );
\rx_shift_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(20),
      Q => \p_0_in__1\(21)
    );
\rx_shift_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(21),
      Q => \p_0_in__1\(22)
    );
\rx_shift_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(22),
      Q => \p_0_in__1\(23)
    );
\rx_shift_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(23),
      Q => \p_0_in__1\(24)
    );
\rx_shift_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(24),
      Q => \p_0_in__1\(25)
    );
\rx_shift_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(25),
      Q => \p_0_in__1\(26)
    );
\rx_shift_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(26),
      Q => \p_0_in__1\(27)
    );
\rx_shift_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(27),
      Q => \p_0_in__1\(28)
    );
\rx_shift_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(28),
      Q => \p_0_in__1\(29)
    );
\rx_shift_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(29),
      Q => \p_0_in__1\(30)
    );
\rx_shift_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(2),
      Q => \p_0_in__1\(3)
    );
\rx_shift_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(30),
      Q => \p_0_in__1\(31)
    );
\rx_shift_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(31),
      Q => \p_0_in__1\(32)
    );
\rx_shift_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(32),
      Q => \p_0_in__1\(33)
    );
\rx_shift_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(33),
      Q => \p_0_in__1\(34)
    );
\rx_shift_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(34),
      Q => \p_0_in__1\(35)
    );
\rx_shift_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(35),
      Q => \p_0_in__1\(36)
    );
\rx_shift_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(36),
      Q => \p_0_in__1\(37)
    );
\rx_shift_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(37),
      Q => \p_0_in__1\(38)
    );
\rx_shift_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(38),
      Q => \p_0_in__1\(39)
    );
\rx_shift_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(39),
      Q => \p_0_in__1\(40)
    );
\rx_shift_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(3),
      Q => \p_0_in__1\(4)
    );
\rx_shift_reg[40]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(40),
      Q => \p_0_in__1\(41)
    );
\rx_shift_reg[41]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(41),
      Q => \p_0_in__1\(42)
    );
\rx_shift_reg[42]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(42),
      Q => \p_0_in__1\(43)
    );
\rx_shift_reg[43]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(43),
      Q => \p_0_in__1\(44)
    );
\rx_shift_reg[44]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(44),
      Q => \p_0_in__1\(45)
    );
\rx_shift_reg[45]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(45),
      Q => \p_0_in__1\(46)
    );
\rx_shift_reg[46]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(46),
      Q => \p_0_in__1\(47)
    );
\rx_shift_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(4),
      Q => \p_0_in__1\(5)
    );
\rx_shift_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(5),
      Q => \p_0_in__1\(6)
    );
\rx_shift_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(6),
      Q => \p_0_in__1\(7)
    );
\rx_shift_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(7),
      Q => \p_0_in__1\(8)
    );
\rx_shift_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(8),
      Q => \p_0_in__1\(9)
    );
\rx_shift_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[46]_i_1_n_0\,
      CLR => \^s_axi_aresetn\,
      D => rx_shift(9),
      Q => \p_0_in__1\(10)
    );
\state[0]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0008FFFF"
    )
        port map (
      I0 => burst_done,
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(3),
      O => done_reg_1
    );
xyz_valid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => burst_done,
      I1 => \out\(0),
      I2 => \out\(1),
      I3 => \out\(2),
      I4 => \out\(3),
      O => done_reg_0
    );
\xyz_x[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[44]\,
      I1 => burst_done,
      I2 => xyz_x(0),
      O => D(0)
    );
\xyz_x[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[38]\,
      I1 => burst_done,
      I2 => xyz_x(10),
      O => D(10)
    );
\xyz_x[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_x0,
      I1 => burst_done,
      I2 => xyz_x(11),
      O => D(11)
    );
\xyz_x[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_x0,
      I1 => burst_done,
      I2 => xyz_x(12),
      O => D(12)
    );
\xyz_x[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_x0,
      I1 => burst_done,
      I2 => xyz_x(13),
      O => D(13)
    );
\xyz_x[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_x0,
      I1 => burst_done,
      I2 => xyz_x(14),
      O => D(14)
    );
\xyz_x[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_x0,
      I1 => burst_done,
      I2 => xyz_x(15),
      O => D(15)
    );
\xyz_x[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[45]\,
      I1 => burst_done,
      I2 => xyz_x(1),
      O => D(1)
    );
\xyz_x[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[46]\,
      I1 => burst_done,
      I2 => xyz_x(2),
      O => D(2)
    );
\xyz_x[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[47]\,
      I1 => burst_done,
      I2 => xyz_x(3),
      O => D(3)
    );
\xyz_x[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[32]\,
      I1 => burst_done,
      I2 => xyz_x(4),
      O => D(4)
    );
\xyz_x[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[33]\,
      I1 => burst_done,
      I2 => xyz_x(5),
      O => D(5)
    );
\xyz_x[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[34]\,
      I1 => burst_done,
      I2 => xyz_x(6),
      O => D(6)
    );
\xyz_x[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[35]\,
      I1 => burst_done,
      I2 => xyz_x(7),
      O => D(7)
    );
\xyz_x[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[36]\,
      I1 => burst_done,
      I2 => xyz_x(8),
      O => D(8)
    );
\xyz_x[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[37]\,
      I1 => burst_done,
      I2 => xyz_x(9),
      O => D(9)
    );
\xyz_y[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[28]\,
      I1 => burst_done,
      I2 => xyz_y(0),
      O => \read_data_reg[23]_0\(0)
    );
\xyz_y[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[22]\,
      I1 => burst_done,
      I2 => xyz_y(10),
      O => \read_data_reg[23]_0\(10)
    );
\xyz_y[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_y0,
      I1 => burst_done,
      I2 => xyz_y(11),
      O => \read_data_reg[23]_0\(11)
    );
\xyz_y[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_y0,
      I1 => burst_done,
      I2 => xyz_y(12),
      O => \read_data_reg[23]_0\(12)
    );
\xyz_y[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_y0,
      I1 => burst_done,
      I2 => xyz_y(13),
      O => \read_data_reg[23]_0\(13)
    );
\xyz_y[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_y0,
      I1 => burst_done,
      I2 => xyz_y(14),
      O => \read_data_reg[23]_0\(14)
    );
\xyz_y[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_y0,
      I1 => burst_done,
      I2 => xyz_y(15),
      O => \read_data_reg[23]_0\(15)
    );
\xyz_y[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[29]\,
      I1 => burst_done,
      I2 => xyz_y(1),
      O => \read_data_reg[23]_0\(1)
    );
\xyz_y[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[30]\,
      I1 => burst_done,
      I2 => xyz_y(2),
      O => \read_data_reg[23]_0\(2)
    );
\xyz_y[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[31]\,
      I1 => burst_done,
      I2 => xyz_y(3),
      O => \read_data_reg[23]_0\(3)
    );
\xyz_y[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[16]\,
      I1 => burst_done,
      I2 => xyz_y(4),
      O => \read_data_reg[23]_0\(4)
    );
\xyz_y[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[17]\,
      I1 => burst_done,
      I2 => xyz_y(5),
      O => \read_data_reg[23]_0\(5)
    );
\xyz_y[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[18]\,
      I1 => burst_done,
      I2 => xyz_y(6),
      O => \read_data_reg[23]_0\(6)
    );
\xyz_y[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[19]\,
      I1 => burst_done,
      I2 => xyz_y(7),
      O => \read_data_reg[23]_0\(7)
    );
\xyz_y[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[20]\,
      I1 => burst_done,
      I2 => xyz_y(8),
      O => \read_data_reg[23]_0\(8)
    );
\xyz_y[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[21]\,
      I1 => burst_done,
      I2 => xyz_y(9),
      O => \read_data_reg[23]_0\(9)
    );
\xyz_z[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[12]\,
      I1 => burst_done,
      I2 => xyz_z(0),
      O => \read_data_reg[7]_0\(0)
    );
\xyz_z[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[6]\,
      I1 => burst_done,
      I2 => xyz_z(10),
      O => \read_data_reg[7]_0\(10)
    );
\xyz_z[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_z0,
      I1 => burst_done,
      I2 => xyz_z(11),
      O => \read_data_reg[7]_0\(11)
    );
\xyz_z[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_z0,
      I1 => burst_done,
      I2 => xyz_z(12),
      O => \read_data_reg[7]_0\(12)
    );
\xyz_z[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_z0,
      I1 => burst_done,
      I2 => xyz_z(13),
      O => \read_data_reg[7]_0\(13)
    );
\xyz_z[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_z0,
      I1 => burst_done,
      I2 => xyz_z(14),
      O => \read_data_reg[7]_0\(14)
    );
\xyz_z[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => decoded_z0,
      I1 => burst_done,
      I2 => xyz_z(15),
      O => \read_data_reg[7]_0\(15)
    );
\xyz_z[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[13]\,
      I1 => burst_done,
      I2 => xyz_z(1),
      O => \read_data_reg[7]_0\(1)
    );
\xyz_z[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[14]\,
      I1 => burst_done,
      I2 => xyz_z(2),
      O => \read_data_reg[7]_0\(2)
    );
\xyz_z[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[15]\,
      I1 => burst_done,
      I2 => xyz_z(3),
      O => \read_data_reg[7]_0\(3)
    );
\xyz_z[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[0]\,
      I1 => burst_done,
      I2 => xyz_z(4),
      O => \read_data_reg[7]_0\(4)
    );
\xyz_z[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[1]\,
      I1 => burst_done,
      I2 => xyz_z(5),
      O => \read_data_reg[7]_0\(5)
    );
\xyz_z[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[2]\,
      I1 => burst_done,
      I2 => xyz_z(6),
      O => \read_data_reg[7]_0\(6)
    );
\xyz_z[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[3]\,
      I1 => burst_done,
      I2 => xyz_z(7),
      O => \read_data_reg[7]_0\(7)
    );
\xyz_z[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[4]\,
      I1 => burst_done,
      I2 => xyz_z(8),
      O => \read_data_reg[7]_0\(8)
    );
\xyz_z[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_data_reg_n_0_[5]\,
      I1 => burst_done,
      I2 => xyz_z(9),
      O => \read_data_reg[7]_0\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_controller is
  port (
    sensor_overrun_reg : out STD_LOGIC;
    \state_reg[3]\ : out STD_LOGIC;
    lis3dh_mosi : out STD_LOGIC;
    lis3dh_sclk : out STD_LOGIC;
    lis3dh_cs_n : out STD_LOGIC;
    \state_reg[0]\ : out STD_LOGIC;
    \state_reg[1]\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wait_count_reg[15]\ : out STD_LOGIC;
    \wait_count_reg[11]\ : out STD_LOGIC;
    \wait_count_reg[18]\ : out STD_LOGIC;
    \wait_count_reg[31]\ : out STD_LOGIC;
    \wait_count_reg[22]\ : out STD_LOGIC;
    \wait_count_reg[15]_0\ : out STD_LOGIC;
    \wait_count_reg[16]\ : out STD_LOGIC;
    \wait_count_reg[2]\ : out STD_LOGIC;
    \wait_count_reg[21]\ : out STD_LOGIC;
    \wait_count_reg[24]\ : out STD_LOGIC;
    \wait_count_reg[27]\ : out STD_LOGIC;
    \read_data_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    lis3dh_cs_n_reg_0 : in STD_LOGIC;
    sensor_overrun : in STD_LOGIC;
    in0 : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    burst_mosi : in STD_LOGIC;
    burst_sclk : in STD_LOGIC;
    burst_cs_n : in STD_LOGIC;
    error : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wait_count[31]_i_4\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \state[0]_i_5_0\ : in STD_LOGIC;
    lis3dh_miso : in STD_LOGIC;
    who_am_i_data : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_controller : entity is "lis3dh_spi_controller";
end design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_controller;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_controller is
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[3]\ : STD_LOGIC;
  signal bit_count : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \bit_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \bit_count[4]_i_3_n_0\ : STD_LOGIC;
  signal \bit_count[4]_i_4_n_0\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \bit_count_reg_n_0_[4]\ : STD_LOGIC;
  signal div_counter : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \div_counter[4]_i_2_n_0\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \div_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal in10 : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal in9 : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal lis3dh_cs_n_i_1_n_0 : STD_LOGIC;
  signal lis3dh_cs_n_i_2_n_0 : STD_LOGIC;
  signal lis3dh_mosi_i_1_n_0 : STD_LOGIC;
  signal lis3dh_sclk_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \read_data[7]_i_1_n_0\ : STD_LOGIC;
  signal rx_shift : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \rx_shift[6]_i_1_n_0\ : STD_LOGIC;
  signal sensor_overrun_i_3_n_0 : STD_LOGIC;
  signal single_cs_n : STD_LOGIC;
  signal single_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal single_done : STD_LOGIC;
  signal single_mosi : STD_LOGIC;
  signal single_sclk : STD_LOGIC;
  signal \state[0]_i_11_n_0\ : STD_LOGIC;
  signal \state[0]_i_14_n_0\ : STD_LOGIC;
  signal \state[0]_i_15_n_0\ : STD_LOGIC;
  signal \state[0]_i_16_n_0\ : STD_LOGIC;
  signal \state[0]_i_17_n_0\ : STD_LOGIC;
  signal \state[0]_i_2_n_0\ : STD_LOGIC;
  signal \state[0]_i_3_n_0\ : STD_LOGIC;
  signal \state[0]_i_4_n_0\ : STD_LOGIC;
  signal \state[0]_i_5_n_0\ : STD_LOGIC;
  signal \state[0]_i_6_n_0\ : STD_LOGIC;
  signal \state[0]_i_7_n_0\ : STD_LOGIC;
  signal \state[0]_i_8_n_0\ : STD_LOGIC;
  signal \state[1]_i_2_n_0\ : STD_LOGIC;
  signal \state[1]_i_3_n_0\ : STD_LOGIC;
  signal \state[1]_i_4_n_0\ : STD_LOGIC;
  signal \state[1]_i_5_n_0\ : STD_LOGIC;
  signal \state[1]_i_7_n_0\ : STD_LOGIC;
  signal \state[1]_i_8_n_0\ : STD_LOGIC;
  signal \state[2]_i_4_n_0\ : STD_LOGIC;
  signal \state[2]_i_5_n_0\ : STD_LOGIC;
  signal \state[3]_i_10_n_0\ : STD_LOGIC;
  signal \state[3]_i_11_n_0\ : STD_LOGIC;
  signal \state[3]_i_12_n_0\ : STD_LOGIC;
  signal \state[3]_i_3_n_0\ : STD_LOGIC;
  signal \state[3]_i_4_n_0\ : STD_LOGIC;
  signal \state[3]_i_5_n_0\ : STD_LOGIC;
  signal \state[3]_i_7_n_0\ : STD_LOGIC;
  signal \state[3]_i_8_n_0\ : STD_LOGIC;
  signal \^state_reg[0]\ : STD_LOGIC;
  signal \^state_reg[3]\ : STD_LOGIC;
  signal tx_shift : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \tx_shift[10]_i_2_n_0\ : STD_LOGIC;
  signal \tx_shift[10]_i_3_n_0\ : STD_LOGIC;
  signal \tx_shift[13]_i_2_n_0\ : STD_LOGIC;
  signal \tx_shift[15]_i_1_n_0\ : STD_LOGIC;
  signal \tx_shift[15]_i_3_n_0\ : STD_LOGIC;
  signal \tx_shift[9]_i_2_n_0\ : STD_LOGIC;
  signal \^wait_count_reg[11]\ : STD_LOGIC;
  signal \^wait_count_reg[15]\ : STD_LOGIC;
  signal \^wait_count_reg[15]_0\ : STD_LOGIC;
  signal \^wait_count_reg[16]\ : STD_LOGIC;
  signal \^wait_count_reg[18]\ : STD_LOGIC;
  signal \^wait_count_reg[21]\ : STD_LOGIC;
  signal \^wait_count_reg[22]\ : STD_LOGIC;
  signal \^wait_count_reg[24]\ : STD_LOGIC;
  signal \^wait_count_reg[27]\ : STD_LOGIC;
  signal \^wait_count_reg[2]\ : STD_LOGIC;
  signal \^wait_count_reg[31]\ : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "STATE_IDLE:0001,STATE_SAMPLE_RISE:0100,STATE_DRIVE_FALL:0010,STATE_CS_HOLD:1000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "STATE_IDLE:0001,STATE_SAMPLE_RISE:0100,STATE_DRIVE_FALL:0010,STATE_CS_HOLD:1000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "STATE_IDLE:0001,STATE_SAMPLE_RISE:0100,STATE_DRIVE_FALL:0010,STATE_CS_HOLD:1000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "STATE_IDLE:0001,STATE_SAMPLE_RISE:0100,STATE_DRIVE_FALL:0010,STATE_CS_HOLD:1000";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bit_count[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \bit_count[1]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \bit_count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \bit_count[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \bit_count[4]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \div_counter[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \div_counter[4]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of lis3dh_cs_n_i_2 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rx_shift[1]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rx_shift[2]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rx_shift[3]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \rx_shift[4]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \rx_shift[5]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \rx_shift[6]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of sensor_overrun_i_3 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \state[0]_i_10\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \state[0]_i_16\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \state[0]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \state[0]_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \state[0]_i_6\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \state[1]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \state[1]_i_6\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \state[1]_i_8\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \state[2]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \state[3]_i_10\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \state[3]_i_11\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \state[3]_i_5\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \state[3]_i_6\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \tx_shift[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \tx_shift[10]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \tx_shift[10]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \tx_shift[11]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \tx_shift[12]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \tx_shift[13]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \tx_shift[13]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \tx_shift[14]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \tx_shift[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \tx_shift[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \tx_shift[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \tx_shift[6]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \tx_shift[7]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \tx_shift[8]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \tx_shift[9]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \tx_shift[9]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \wait_count[31]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \wait_count[31]_i_7\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \who_am_i_data[0]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \who_am_i_data[1]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \who_am_i_data[2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \who_am_i_data[3]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \who_am_i_data[4]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \who_am_i_data[5]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \who_am_i_data[6]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \who_am_i_data[7]_i_2\ : label is "soft_lutpair17";
begin
  \state_reg[0]\ <= \^state_reg[0]\;
  \state_reg[3]\ <= \^state_reg[3]\;
  \wait_count_reg[11]\ <= \^wait_count_reg[11]\;
  \wait_count_reg[15]\ <= \^wait_count_reg[15]\;
  \wait_count_reg[15]_0\ <= \^wait_count_reg[15]_0\;
  \wait_count_reg[16]\ <= \^wait_count_reg[16]\;
  \wait_count_reg[18]\ <= \^wait_count_reg[18]\;
  \wait_count_reg[21]\ <= \^wait_count_reg[21]\;
  \wait_count_reg[22]\ <= \^wait_count_reg[22]\;
  \wait_count_reg[24]\ <= \^wait_count_reg[24]\;
  \wait_count_reg[27]\ <= \^wait_count_reg[27]\;
  \wait_count_reg[2]\ <= \^wait_count_reg[2]\;
  \wait_count_reg[31]\ <= \^wait_count_reg[31]\;
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => \FSM_onehot_state[1]_i_2_n_0\,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \bit_count_reg_n_0_[4]\,
      I1 => \bit_count_reg_n_0_[3]\,
      I2 => \bit_count_reg_n_0_[1]\,
      I3 => \bit_count_reg_n_0_[0]\,
      I4 => \bit_count_reg_n_0_[2]\,
      O => \FSM_onehot_state[1]_i_2_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AFAE"
    )
        port map (
      I0 => \rx_shift[6]_i_1_n_0\,
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => \FSM_onehot_state[3]_i_4_n_0\,
      I3 => \FSM_onehot_state_reg_n_0_[3]\,
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => \bit_count_reg_n_0_[2]\,
      I1 => \bit_count_reg_n_0_[0]\,
      I2 => \bit_count_reg_n_0_[1]\,
      I3 => \bit_count_reg_n_0_[3]\,
      I4 => \bit_count_reg_n_0_[4]\,
      I5 => \FSM_onehot_state_reg_n_0_[2]\,
      O => \FSM_onehot_state[3]_i_2_n_0\
    );
\FSM_onehot_state[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF7"
    )
        port map (
      I0 => \div_counter_reg_n_0_[3]\,
      I1 => \div_counter_reg_n_0_[4]\,
      I2 => \div_counter_reg_n_0_[2]\,
      I3 => \div_counter_reg_n_0_[1]\,
      I4 => \div_counter_reg_n_0_[0]\,
      O => \FSM_onehot_state[3]_i_4_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_state[3]_i_1_n_0\,
      D => \FSM_onehot_state_reg_n_0_[3]\,
      PRE => lis3dh_cs_n_reg_0,
      Q => \FSM_onehot_state_reg_n_0_[0]\
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_state[3]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[1]\
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_state[3]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => \FSM_onehot_state_reg_n_0_[1]\,
      Q => \FSM_onehot_state_reg_n_0_[2]\
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_state[3]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => \FSM_onehot_state[3]_i_2_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[3]\
    );
\bit_count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \bit_count_reg_n_0_[0]\,
      O => bit_count(0)
    );
\bit_count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \bit_count_reg_n_0_[1]\,
      I1 => \bit_count_reg_n_0_[0]\,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      O => \bit_count[1]_i_1_n_0\
    );
\bit_count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \bit_count_reg_n_0_[0]\,
      I2 => \bit_count_reg_n_0_[1]\,
      I3 => \bit_count_reg_n_0_[2]\,
      O => bit_count(2)
    );
\bit_count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \bit_count_reg_n_0_[1]\,
      I2 => \bit_count_reg_n_0_[0]\,
      I3 => \bit_count_reg_n_0_[2]\,
      I4 => \bit_count_reg_n_0_[3]\,
      O => bit_count(3)
    );
\bit_count[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \bit_count[4]_i_3_n_0\,
      I1 => \FSM_onehot_state[1]_i_2_n_0\,
      I2 => \bit_count[4]_i_4_n_0\,
      O => \bit_count[4]_i_1_n_0\
    );
\bit_count[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \bit_count_reg_n_0_[2]\,
      I2 => \bit_count_reg_n_0_[0]\,
      I3 => \bit_count_reg_n_0_[1]\,
      I4 => \bit_count_reg_n_0_[3]\,
      I5 => \bit_count_reg_n_0_[4]\,
      O => bit_count(4)
    );
\bit_count[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"17000000"
    )
        port map (
      I0 => \out\(3),
      I1 => \out\(1),
      I2 => \out\(2),
      I3 => \out\(0),
      I4 => \FSM_onehot_state_reg_n_0_[0]\,
      O => \bit_count[4]_i_3_n_0\
    );
\bit_count[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \div_counter_reg_n_0_[0]\,
      I2 => \div_counter_reg_n_0_[1]\,
      I3 => \div_counter_reg_n_0_[2]\,
      I4 => \div_counter_reg_n_0_[4]\,
      I5 => \div_counter_reg_n_0_[3]\,
      O => \bit_count[4]_i_4_n_0\
    );
\bit_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[4]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => bit_count(0),
      Q => \bit_count_reg_n_0_[0]\
    );
\bit_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[4]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => \bit_count[1]_i_1_n_0\,
      Q => \bit_count_reg_n_0_[1]\
    );
\bit_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[4]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => bit_count(2),
      Q => \bit_count_reg_n_0_[2]\
    );
\bit_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[4]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => bit_count(3),
      Q => \bit_count_reg_n_0_[3]\
    );
\bit_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \bit_count[4]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => bit_count(4),
      Q => \bit_count_reg_n_0_[4]\
    );
\div_counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FE00"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      I3 => \FSM_onehot_state[3]_i_4_n_0\,
      I4 => \div_counter_reg_n_0_[0]\,
      O => div_counter(0)
    );
\div_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66666660"
    )
        port map (
      I0 => \div_counter_reg_n_0_[1]\,
      I1 => \div_counter_reg_n_0_[0]\,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      I4 => \FSM_onehot_state_reg_n_0_[3]\,
      O => div_counter(1)
    );
\div_counter[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7878787878787800"
    )
        port map (
      I0 => \div_counter_reg_n_0_[0]\,
      I1 => \div_counter_reg_n_0_[1]\,
      I2 => \div_counter_reg_n_0_[2]\,
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_state_reg_n_0_[1]\,
      I5 => \FSM_onehot_state_reg_n_0_[3]\,
      O => div_counter(2)
    );
\div_counter[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0555555150000000"
    )
        port map (
      I0 => \div_counter[4]_i_2_n_0\,
      I1 => \div_counter_reg_n_0_[4]\,
      I2 => \div_counter_reg_n_0_[2]\,
      I3 => \div_counter_reg_n_0_[1]\,
      I4 => \div_counter_reg_n_0_[0]\,
      I5 => \div_counter_reg_n_0_[3]\,
      O => div_counter(3)
    );
\div_counter[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555140000000"
    )
        port map (
      I0 => \div_counter[4]_i_2_n_0\,
      I1 => \div_counter_reg_n_0_[3]\,
      I2 => \div_counter_reg_n_0_[0]\,
      I3 => \div_counter_reg_n_0_[1]\,
      I4 => \div_counter_reg_n_0_[2]\,
      I5 => \div_counter_reg_n_0_[4]\,
      O => div_counter(4)
    );
\div_counter[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      O => \div_counter[4]_i_2_n_0\
    );
\div_counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => lis3dh_cs_n_reg_0,
      D => div_counter(0),
      Q => \div_counter_reg_n_0_[0]\
    );
\div_counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => lis3dh_cs_n_reg_0,
      D => div_counter(1),
      Q => \div_counter_reg_n_0_[1]\
    );
\div_counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => lis3dh_cs_n_reg_0,
      D => div_counter(2),
      Q => \div_counter_reg_n_0_[2]\
    );
\div_counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => lis3dh_cs_n_reg_0,
      D => div_counter(3),
      Q => \div_counter_reg_n_0_[3]\
    );
\div_counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => lis3dh_cs_n_reg_0,
      D => div_counter(4),
      Q => \div_counter_reg_n_0_[4]\
    );
done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[3]\,
      I1 => \div_counter_reg_n_0_[0]\,
      I2 => \div_counter_reg_n_0_[1]\,
      I3 => \div_counter_reg_n_0_[2]\,
      I4 => \div_counter_reg_n_0_[4]\,
      I5 => \div_counter_reg_n_0_[3]\,
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => lis3dh_cs_n_reg_0,
      D => done_i_1_n_0,
      Q => single_done
    );
error_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0000008"
    )
        port map (
      I0 => \state[3]_i_3_n_0\,
      I1 => \out\(1),
      I2 => \out\(0),
      I3 => \out\(3),
      I4 => \out\(2),
      I5 => error,
      O => \state_reg[1]\
    );
lis3dh_cs_n_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABEAAAAAA82AAAAA"
    )
        port map (
      I0 => single_cs_n,
      I1 => \out\(0),
      I2 => \out\(1),
      I3 => \out\(2),
      I4 => \out\(3),
      I5 => burst_cs_n,
      O => lis3dh_cs_n
    );
lis3dh_cs_n_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDFFFFFFFD00"
    )
        port map (
      I0 => lis3dh_cs_n_i_2_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[2]\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => \FSM_onehot_state_reg_n_0_[0]\,
      I4 => done_i_1_n_0,
      I5 => single_cs_n,
      O => lis3dh_cs_n_i_1_n_0
    );
lis3dh_cs_n_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"022A"
    )
        port map (
      I0 => \out\(0),
      I1 => \out\(2),
      I2 => \out\(1),
      I3 => \out\(3),
      O => lis3dh_cs_n_i_2_n_0
    );
lis3dh_cs_n_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => lis3dh_cs_n_i_1_n_0,
      PRE => lis3dh_cs_n_reg_0,
      Q => single_cs_n
    );
lis3dh_mosi_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABEAAAAAA82AAAAA"
    )
        port map (
      I0 => single_mosi,
      I1 => \out\(0),
      I2 => \out\(1),
      I3 => \out\(2),
      I4 => \out\(3),
      I5 => burst_mosi,
      O => lis3dh_mosi
    );
lis3dh_mosi_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B3A0B3A380A080A0"
    )
        port map (
      I0 => p_0_in,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => \FSM_onehot_state[3]_i_4_n_0\,
      I4 => \FSM_onehot_state_reg_n_0_[3]\,
      I5 => single_mosi,
      O => lis3dh_mosi_i_1_n_0
    );
lis3dh_mosi_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => lis3dh_cs_n_reg_0,
      D => lis3dh_mosi_i_1_n_0,
      Q => single_mosi
    );
lis3dh_sclk_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABEAAAAAA82AAAAA"
    )
        port map (
      I0 => single_sclk,
      I1 => \out\(0),
      I2 => \out\(1),
      I3 => \out\(2),
      I4 => \out\(3),
      I5 => burst_sclk,
      O => lis3dh_sclk
    );
lis3dh_sclk_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFDCFCFCFCC"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => \FSM_onehot_state[3]_i_4_n_0\,
      I3 => \FSM_onehot_state_reg_n_0_[3]\,
      I4 => \FSM_onehot_state_reg_n_0_[2]\,
      I5 => single_sclk,
      O => lis3dh_sclk_i_1_n_0
    );
lis3dh_sclk_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => lis3dh_sclk_i_1_n_0,
      PRE => lis3dh_cs_n_reg_0,
      Q => single_sclk
    );
\read_data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => \bit_count_reg_n_0_[2]\,
      I1 => \bit_count_reg_n_0_[0]\,
      I2 => \bit_count_reg_n_0_[1]\,
      I3 => \bit_count_reg_n_0_[3]\,
      I4 => \bit_count_reg_n_0_[4]\,
      I5 => \bit_count[4]_i_4_n_0\,
      O => \read_data[7]_i_1_n_0\
    );
\read_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[7]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => lis3dh_miso,
      Q => single_data(0)
    );
\read_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[7]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => in10(1),
      Q => single_data(1)
    );
\read_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[7]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => in10(2),
      Q => single_data(2)
    );
\read_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[7]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => in10(3),
      Q => single_data(3)
    );
\read_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[7]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => in10(4),
      Q => single_data(4)
    );
\read_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[7]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => in10(5),
      Q => single_data(5)
    );
\read_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[7]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => in10(6),
      Q => single_data(6)
    );
\read_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \read_data[7]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => in10(7),
      Q => single_data(7)
    );
\rx_shift[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => lis3dh_miso,
      O => rx_shift(0)
    );
\rx_shift[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => in10(1),
      O => rx_shift(1)
    );
\rx_shift[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => in10(2),
      O => rx_shift(2)
    );
\rx_shift[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => in10(3),
      O => rx_shift(3)
    );
\rx_shift[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => in10(4),
      O => rx_shift(4)
    );
\rx_shift[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => in10(5),
      O => rx_shift(5)
    );
\rx_shift[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAEAAAEAEAEA"
    )
        port map (
      I0 => \bit_count[4]_i_4_n_0\,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => \out\(0),
      I3 => \out\(2),
      I4 => \out\(1),
      I5 => \out\(3),
      O => \rx_shift[6]_i_1_n_0\
    );
\rx_shift[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => in10(6),
      O => rx_shift(6)
    );
\rx_shift_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[6]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => rx_shift(0),
      Q => in10(1)
    );
\rx_shift_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[6]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => rx_shift(1),
      Q => in10(2)
    );
\rx_shift_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[6]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => rx_shift(2),
      Q => in10(3)
    );
\rx_shift_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[6]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => rx_shift(3),
      Q => in10(4)
    );
\rx_shift_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[6]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => rx_shift(4),
      Q => in10(5)
    );
\rx_shift_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[6]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => rx_shift(5),
      Q => in10(6)
    );
\rx_shift_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \rx_shift[6]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => rx_shift(6),
      Q => in10(7)
    );
sensor_overrun_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEAFF0000EA00"
    )
        port map (
      I0 => sensor_overrun,
      I1 => single_data(7),
      I2 => single_done,
      I3 => \^state_reg[3]\,
      I4 => sensor_overrun_i_3_n_0,
      I5 => in0,
      O => sensor_overrun_reg
    );
sensor_overrun_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \out\(3),
      I1 => \out\(2),
      O => \^state_reg[3]\
    );
sensor_overrun_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \out\(0),
      I1 => \out\(1),
      O => sensor_overrun_i_3_n_0
    );
\state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F8F8FFF8"
    )
        port map (
      I0 => \^wait_count_reg[15]\,
      I1 => \state[0]_i_2_n_0\,
      I2 => \state[0]_i_3_n_0\,
      I3 => \state[0]_i_4_n_0\,
      I4 => Q(2),
      I5 => \state[0]_i_5_n_0\,
      O => D(0)
    );
\state[0]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \state[3]_i_5_n_0\,
      I1 => \wait_count[31]_i_4\(22),
      I2 => \wait_count[31]_i_4\(20),
      I3 => \wait_count[31]_i_4\(21),
      I4 => \wait_count[31]_i_4\(23),
      O => \^wait_count_reg[22]\
    );
\state[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFF7FFFF"
    )
        port map (
      I0 => \wait_count[31]_i_4\(6),
      I1 => \wait_count[31]_i_4\(14),
      I2 => Q(1),
      I3 => \wait_count[31]_i_4\(7),
      I4 => \wait_count[31]_i_4\(15),
      I5 => \state[0]_i_17_n_0\,
      O => \state[0]_i_11_n_0\
    );
\state[0]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_count[31]_i_4\(11),
      I1 => \wait_count[31]_i_4\(10),
      I2 => \wait_count[31]_i_4\(13),
      I3 => \wait_count[31]_i_4\(12),
      O => \^wait_count_reg[11]\
    );
\state[0]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \state[3]_i_10_n_0\,
      I1 => \wait_count[31]_i_4\(18),
      I2 => \wait_count[31]_i_4\(4),
      I3 => \wait_count[31]_i_4\(5),
      I4 => \wait_count[31]_i_4\(19),
      O => \^wait_count_reg[18]\
    );
\state[0]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000080"
    )
        port map (
      I0 => single_done,
      I1 => single_data(3),
      I2 => Q(1),
      I3 => Q(2),
      I4 => Q(0),
      I5 => \state[0]_i_5_0\,
      O => \state[0]_i_14_n_0\
    );
\state[0]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF7"
    )
        port map (
      I0 => \wait_count[31]_i_4\(4),
      I1 => \wait_count[31]_i_4\(18),
      I2 => Q(0),
      I3 => Q(1),
      I4 => \wait_count[31]_i_4\(10),
      I5 => \wait_count[31]_i_4\(11),
      O => \state[0]_i_15_n_0\
    );
\state[0]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \wait_count[31]_i_4\(7),
      I1 => \wait_count[31]_i_4\(6),
      I2 => \wait_count[31]_i_4\(17),
      I3 => \wait_count[31]_i_4\(5),
      O => \state[0]_i_16_n_0\
    );
\state[0]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Q(0),
      I1 => Q(2),
      O => \state[0]_i_17_n_0\
    );
\state[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => Q(0),
      O => \state[0]_i_2_n_0\
    );
\state[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BAAA"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => single_done,
      I3 => Q(2),
      O => \state[0]_i_3_n_0\
    );
\state[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"444444444444444F"
    )
        port map (
      I0 => \state[0]_i_6_n_0\,
      I1 => \state[0]_i_7_n_0\,
      I2 => \state[0]_i_8_n_0\,
      I3 => \^wait_count_reg[16]\,
      I4 => \^wait_count_reg[31]\,
      I5 => \^wait_count_reg[22]\,
      O => \state[0]_i_4_n_0\
    );
\state[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFE"
    )
        port map (
      I0 => \state[0]_i_11_n_0\,
      I1 => \^wait_count_reg[11]\,
      I2 => \^wait_count_reg[18]\,
      I3 => \^wait_count_reg[31]\,
      I4 => \^wait_count_reg[22]\,
      I5 => \state[0]_i_14_n_0\,
      O => \state[0]_i_5_n_0\
    );
\state[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => single_done,
      I1 => Q(0),
      I2 => Q(1),
      O => \state[0]_i_6_n_0\
    );
\state[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => single_data(0),
      I1 => single_data(1),
      I2 => single_data(3),
      I3 => single_data(2),
      I4 => \state[3]_i_8_n_0\,
      O => \state[0]_i_7_n_0\
    );
\state[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \wait_count[31]_i_4\(12),
      I1 => \wait_count[31]_i_4\(19),
      I2 => \wait_count[31]_i_4\(9),
      I3 => \wait_count[31]_i_4\(14),
      I4 => \state[0]_i_15_n_0\,
      O => \state[0]_i_8_n_0\
    );
\state[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => \wait_count[31]_i_4\(16),
      I1 => \wait_count[31]_i_4\(13),
      I2 => \wait_count[31]_i_4\(15),
      I3 => \wait_count[31]_i_4\(8),
      I4 => \state[0]_i_16_n_0\,
      O => \^wait_count_reg[16]\
    );
\state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBBBB8"
    )
        port map (
      I0 => \state[1]_i_2_n_0\,
      I1 => Q(3),
      I2 => \state[1]_i_3_n_0\,
      I3 => Q(1),
      I4 => Q(0),
      O => D(1)
    );
\state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9C9C989C"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => Q(0),
      I3 => single_done,
      I4 => single_data(3),
      O => \state[1]_i_2_n_0\
    );
\state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE000000000000"
    )
        port map (
      I0 => \state[1]_i_4_n_0\,
      I1 => \state[1]_i_5_n_0\,
      I2 => \^wait_count_reg[31]\,
      I3 => \state[1]_i_7_n_0\,
      I4 => Q(2),
      I5 => Q(0),
      O => \state[1]_i_3_n_0\
    );
\state[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^wait_count_reg[2]\,
      I1 => \wait_count[31]_i_4\(10),
      I2 => \wait_count[31]_i_4\(23),
      I3 => \wait_count[31]_i_4\(21),
      I4 => \wait_count[31]_i_4\(20),
      O => \state[1]_i_4_n_0\
    );
\state[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFFFFF"
    )
        port map (
      I0 => \state[2]_i_5_n_0\,
      I1 => \wait_count[31]_i_4\(5),
      I2 => \wait_count[31]_i_4\(22),
      I3 => \wait_count[31]_i_4\(15),
      I4 => \wait_count[31]_i_4\(19),
      O => \state[1]_i_5_n_0\
    );
\state[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \wait_count[31]_i_4\(31),
      I1 => \wait_count[31]_i_4\(29),
      I2 => \wait_count[31]_i_4\(28),
      I3 => \wait_count[31]_i_4\(27),
      I4 => \^wait_count_reg[24]\,
      O => \^wait_count_reg[31]\
    );
\state[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF7FFF"
    )
        port map (
      I0 => \wait_count[31]_i_4\(9),
      I1 => \wait_count[31]_i_4\(8),
      I2 => \wait_count[31]_i_4\(11),
      I3 => \wait_count[31]_i_4\(14),
      I4 => \state[1]_i_8_n_0\,
      I5 => \state[3]_i_11_n_0\,
      O => \state[1]_i_7_n_0\
    );
\state[1]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \wait_count[31]_i_4\(16),
      I1 => \wait_count[31]_i_4\(17),
      O => \state[1]_i_8_n_0\
    );
\state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0FF000CFFFFA00"
    )
        port map (
      I0 => \state[3]_i_3_n_0\,
      I1 => \^wait_count_reg[15]\,
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(2),
      I5 => Q(3),
      O => D(2)
    );
\state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => \state[3]_i_4_n_0\,
      I1 => \^wait_count_reg[21]\,
      I2 => \wait_count[31]_i_4\(15),
      I3 => \wait_count[31]_i_4\(19),
      I4 => \^wait_count_reg[2]\,
      I5 => \state[2]_i_4_n_0\,
      O => \^wait_count_reg[15]\
    );
\state[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \wait_count[31]_i_4\(2),
      I1 => \wait_count[31]_i_4\(1),
      I2 => \wait_count[31]_i_4\(0),
      I3 => \wait_count[31]_i_4\(18),
      O => \^wait_count_reg[2]\
    );
\state[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFFFFF"
    )
        port map (
      I0 => \state[2]_i_5_n_0\,
      I1 => \wait_count[31]_i_4\(23),
      I2 => \wait_count[31]_i_4\(5),
      I3 => \wait_count[31]_i_4\(10),
      I4 => \wait_count[31]_i_4\(22),
      O => \state[2]_i_4_n_0\
    );
\state[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \wait_count[31]_i_4\(3),
      I1 => \wait_count[31]_i_4\(4),
      I2 => \wait_count[31]_i_4\(13),
      I3 => \wait_count[31]_i_4\(12),
      O => \state[2]_i_5_n_0\
    );
\state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFA00C0000"
    )
        port map (
      I0 => \^wait_count_reg[15]_0\,
      I1 => \state[3]_i_3_n_0\,
      I2 => Q(0),
      I3 => Q(2),
      I4 => Q(1),
      I5 => Q(3),
      O => D(3)
    );
\state[3]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => \wait_count[31]_i_4\(8),
      I1 => \wait_count[31]_i_4\(9),
      I2 => \wait_count[31]_i_4\(17),
      I3 => \wait_count[31]_i_4\(16),
      O => \state[3]_i_10_n_0\
    );
\state[3]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \wait_count[31]_i_4\(6),
      I1 => \wait_count[31]_i_4\(7),
      O => \state[3]_i_11_n_0\
    );
\state[3]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => \wait_count[31]_i_4\(22),
      I1 => \wait_count[31]_i_4\(10),
      I2 => \wait_count[31]_i_4\(4),
      I3 => \wait_count[31]_i_4\(18),
      O => \state[3]_i_12_n_0\
    );
\state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => \state[3]_i_4_n_0\,
      I1 => \state[3]_i_5_n_0\,
      I2 => \^wait_count_reg[21]\,
      I3 => \wait_count[31]_i_4\(15),
      I4 => \wait_count[31]_i_4\(19),
      I5 => \state[3]_i_7_n_0\,
      O => \^wait_count_reg[15]_0\
    );
\state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA8AAAAAAAAAAAA"
    )
        port map (
      I0 => single_done,
      I1 => \state[3]_i_8_n_0\,
      I2 => single_data(2),
      I3 => single_data(3),
      I4 => single_data(1),
      I5 => single_data(0),
      O => \state[3]_i_3_n_0\
    );
\state[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFFFF"
    )
        port map (
      I0 => \^wait_count_reg[24]\,
      I1 => \^wait_count_reg[27]\,
      I2 => \state[3]_i_10_n_0\,
      I3 => \wait_count[31]_i_4\(14),
      I4 => \wait_count[31]_i_4\(11),
      I5 => \state[3]_i_11_n_0\,
      O => \state[3]_i_4_n_0\
    );
\state[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \wait_count[31]_i_4\(2),
      I1 => \wait_count[31]_i_4\(1),
      I2 => \wait_count[31]_i_4\(3),
      I3 => \wait_count[31]_i_4\(0),
      O => \state[3]_i_5_n_0\
    );
\state[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \wait_count[31]_i_4\(21),
      I1 => \wait_count[31]_i_4\(20),
      O => \^wait_count_reg[21]\
    );
\state[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => \wait_count[31]_i_4\(13),
      I1 => \wait_count[31]_i_4\(5),
      I2 => \wait_count[31]_i_4\(12),
      I3 => \wait_count[31]_i_4\(23),
      I4 => \state[3]_i_12_n_0\,
      O => \state[3]_i_7_n_0\
    );
\state[3]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => single_data(6),
      I1 => single_data(7),
      I2 => single_data(5),
      I3 => single_data(4),
      O => \state[3]_i_8_n_0\
    );
\state[3]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_count[31]_i_4\(24),
      I1 => \wait_count[31]_i_4\(25),
      I2 => \wait_count[31]_i_4\(30),
      I3 => \wait_count[31]_i_4\(26),
      O => \^wait_count_reg[24]\
    );
\tx_shift[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8AAAAAA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => \out\(2),
      I2 => \out\(3),
      I3 => \out\(0),
      I4 => \out\(1),
      O => tx_shift(0)
    );
\tx_shift[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888F8888"
    )
        port map (
      I0 => in9(10),
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => \tx_shift[10]_i_2_n_0\,
      I3 => \tx_shift[10]_i_3_n_0\,
      I4 => \FSM_onehot_state_reg_n_0_[0]\,
      O => tx_shift(10)
    );
\tx_shift[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(0),
      I2 => \out\(3),
      I3 => \out\(2),
      O => \tx_shift[10]_i_2_n_0\
    );
\tx_shift[10]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(3),
      I2 => \out\(0),
      I3 => \out\(2),
      O => \tx_shift[10]_i_3_n_0\
    );
\tx_shift[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => in9(11),
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => \FSM_onehot_state_reg_n_0_[0]\,
      I3 => \tx_shift[13]_i_2_n_0\,
      O => tx_shift(11)
    );
\tx_shift[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => in9(12),
      O => tx_shift(12)
    );
\tx_shift[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => in9(13),
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => \tx_shift[13]_i_2_n_0\,
      I3 => \FSM_onehot_state_reg_n_0_[0]\,
      O => tx_shift(13)
    );
\tx_shift[13]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDD7"
    )
        port map (
      I0 => \out\(0),
      I1 => \out\(3),
      I2 => \out\(1),
      I3 => \out\(2),
      O => \tx_shift[13]_i_2_n_0\
    );
\tx_shift[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => in9(14),
      O => tx_shift(14)
    );
\tx_shift[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00080888"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => \out\(0),
      I2 => \out\(2),
      I3 => \out\(1),
      I4 => \out\(3),
      I5 => \tx_shift[15]_i_3_n_0\,
      O => \tx_shift[15]_i_1_n_0\
    );
\tx_shift[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888888888F888888"
    )
        port map (
      I0 => in9(15),
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => \out\(1),
      I3 => \out\(0),
      I4 => \FSM_onehot_state_reg_n_0_[0]\,
      I5 => \out\(2),
      O => tx_shift(15)
    );
\tx_shift[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \div_counter_reg_n_0_[0]\,
      I2 => \div_counter_reg_n_0_[1]\,
      I3 => \div_counter_reg_n_0_[2]\,
      I4 => \div_counter_reg_n_0_[4]\,
      I5 => \div_counter_reg_n_0_[3]\,
      O => \tx_shift[15]_i_3_n_0\
    );
\tx_shift[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => tx_shift(0),
      I1 => in9(1),
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      O => tx_shift(1)
    );
\tx_shift[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => tx_shift(0),
      I1 => in9(2),
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      O => tx_shift(2)
    );
\tx_shift[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF000800080008"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => \^state_reg[0]\,
      I2 => \out\(3),
      I3 => \out\(2),
      I4 => in9(3),
      I5 => \FSM_onehot_state_reg_n_0_[1]\,
      O => tx_shift(3)
    );
\tx_shift[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => tx_shift(0),
      I1 => in9(4),
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      O => tx_shift(4)
    );
\tx_shift[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => in9(5),
      O => tx_shift(5)
    );
\tx_shift[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => in9(6),
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => tx_shift(0),
      O => tx_shift(6)
    );
\tx_shift[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888888888888F888"
    )
        port map (
      I0 => in9(7),
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => \FSM_onehot_state_reg_n_0_[0]\,
      I3 => \^state_reg[0]\,
      I4 => \out\(3),
      I5 => \out\(2),
      O => tx_shift(7)
    );
\tx_shift[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \out\(0),
      I1 => \out\(1),
      O => \^state_reg[0]\
    );
\tx_shift[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \tx_shift[9]_i_2_n_0\,
      I1 => in9(8),
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      O => tx_shift(8)
    );
\tx_shift[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => in9(9),
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => \tx_shift[9]_i_2_n_0\,
      O => tx_shift(9)
    );
\tx_shift[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAA2A"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => \out\(2),
      I2 => \out\(0),
      I3 => \out\(3),
      I4 => \out\(1),
      O => \tx_shift[9]_i_2_n_0\
    );
\tx_shift_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(0),
      Q => in9(1)
    );
\tx_shift_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(10),
      Q => in9(11)
    );
\tx_shift_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(11),
      Q => in9(12)
    );
\tx_shift_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(12),
      Q => in9(13)
    );
\tx_shift_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(13),
      Q => in9(14)
    );
\tx_shift_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(14),
      Q => in9(15)
    );
\tx_shift_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(15),
      Q => p_0_in
    );
\tx_shift_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(1),
      Q => in9(2)
    );
\tx_shift_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(2),
      Q => in9(3)
    );
\tx_shift_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(3),
      Q => in9(4)
    );
\tx_shift_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(4),
      Q => in9(5)
    );
\tx_shift_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(5),
      Q => in9(6)
    );
\tx_shift_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(6),
      Q => in9(7)
    );
\tx_shift_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(7),
      Q => in9(8)
    );
\tx_shift_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(8),
      Q => in9(9)
    );
\tx_shift_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \tx_shift[15]_i_1_n_0\,
      CLR => lis3dh_cs_n_reg_0,
      D => tx_shift(9),
      Q => in9(10)
    );
\wait_count[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5040A00F"
    )
        port map (
      I0 => \out\(3),
      I1 => single_done,
      I2 => \out\(2),
      I3 => \out\(0),
      I4 => \out\(1),
      O => E(0)
    );
\wait_count[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_count[31]_i_4\(27),
      I1 => \wait_count[31]_i_4\(28),
      I2 => \wait_count[31]_i_4\(29),
      I3 => \wait_count[31]_i_4\(31),
      O => \^wait_count_reg[27]\
    );
\who_am_i_data[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => single_data(0),
      I1 => single_done,
      I2 => who_am_i_data(0),
      O => \read_data_reg[7]_0\(0)
    );
\who_am_i_data[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => single_data(1),
      I1 => single_done,
      I2 => who_am_i_data(1),
      O => \read_data_reg[7]_0\(1)
    );
\who_am_i_data[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => single_data(2),
      I1 => single_done,
      I2 => who_am_i_data(2),
      O => \read_data_reg[7]_0\(2)
    );
\who_am_i_data[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => single_data(3),
      I1 => single_done,
      I2 => who_am_i_data(3),
      O => \read_data_reg[7]_0\(3)
    );
\who_am_i_data[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => single_data(4),
      I1 => single_done,
      I2 => who_am_i_data(4),
      O => \read_data_reg[7]_0\(4)
    );
\who_am_i_data[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => single_data(5),
      I1 => single_done,
      I2 => who_am_i_data(5),
      O => \read_data_reg[7]_0\(5)
    );
\who_am_i_data[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => single_data(6),
      I1 => single_done,
      I2 => who_am_i_data(6),
      O => \read_data_reg[7]_0\(6)
    );
\who_am_i_data[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => single_data(7),
      I1 => single_done,
      I2 => who_am_i_data(7),
      O => \read_data_reg[7]_0\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0_vibration_axi_lite_slave is
  port (
    s_axi_aresetn_0 : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid_reg_0 : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid_reg_0 : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    snapshot_seq0 : in STD_LOGIC;
    result_sample_count : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    sample_drop_count : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    init_done : in STD_LOGIC;
    overflow : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    sensor_overrun : in STD_LOGIC;
    error : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \snapshot_sumsq_reg[34]_0\ : in STD_LOGIC_VECTOR ( 34 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_lis3dh_vibration_axi_0_0_vibration_axi_lite_slave : entity is "vibration_axi_lite_slave";
end design_1_lis3dh_vibration_axi_0_0_vibration_axi_lite_slave;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0_vibration_axi_lite_slave is
  signal aw_addr_hold : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal aw_fire : STD_LOGIC;
  signal aw_pending_i_1_n_0 : STD_LOGIC;
  signal aw_pending_reg_n_0 : STD_LOGIC;
  signal data3 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal result_available : STD_LOGIC;
  signal \^s_axi_aresetn_0\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \s_axi_bresp[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_7_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_8_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_9_n_0\ : STD_LOGIC;
  signal s_axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_bvalid_reg_0\ : STD_LOGIC;
  signal s_axi_rdata0 : STD_LOGIC;
  signal \s_axi_rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rresp[1]_i_1_n_0\ : STD_LOGIC;
  signal s_axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_rvalid_reg_0\ : STD_LOGIC;
  signal snapshot_count : STD_LOGIC_VECTOR ( 4 to 4 );
  signal snapshot_peak : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \snapshot_seq[0]_i_2_n_0\ : STD_LOGIC;
  signal snapshot_seq_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \snapshot_seq_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \snapshot_seq_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \snapshot_seq_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \snapshot_seq_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \snapshot_seq_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \snapshot_seq_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \snapshot_seq_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \snapshot_seq_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \snapshot_seq_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \snapshot_seq_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \snapshot_seq_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \snapshot_seq_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \snapshot_seq_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \snapshot_seq_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \snapshot_seq_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \snapshot_seq_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \snapshot_seq_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \snapshot_seq_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \snapshot_seq_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \snapshot_seq_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \snapshot_seq_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \snapshot_seq_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \snapshot_seq_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \snapshot_seq_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \snapshot_seq_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \snapshot_seq_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \snapshot_seq_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \snapshot_seq_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \snapshot_seq_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \snapshot_seq_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \snapshot_seq_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \snapshot_seq_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \snapshot_seq_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \snapshot_seq_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \snapshot_seq_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \snapshot_seq_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \snapshot_seq_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \snapshot_seq_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \snapshot_seq_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \snapshot_seq_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \snapshot_seq_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \snapshot_seq_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \snapshot_seq_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \snapshot_seq_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \snapshot_seq_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \snapshot_seq_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \snapshot_seq_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \snapshot_seq_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \snapshot_seq_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \snapshot_seq_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \snapshot_seq_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \snapshot_seq_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \snapshot_seq_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \snapshot_seq_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \snapshot_seq_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \snapshot_seq_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \snapshot_seq_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \snapshot_seq_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \snapshot_seq_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \snapshot_seq_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \snapshot_seq_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \snapshot_seq_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \snapshot_seq_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[0]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[10]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[11]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[12]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[13]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[14]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[15]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[16]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[17]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[18]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[19]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[1]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[20]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[21]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[22]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[23]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[24]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[25]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[26]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[27]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[28]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[29]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[2]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[30]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[31]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[3]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[4]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[5]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[6]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[7]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[8]\ : STD_LOGIC;
  signal \snapshot_sumsq_reg_n_0_[9]\ : STD_LOGIC;
  signal w_pending_i_1_n_0 : STD_LOGIC;
  signal w_pending_reg_n_0 : STD_LOGIC;
  signal write_commit : STD_LOGIC;
  signal \NLW_snapshot_seq_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of s_axi_arready_INST_0 : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of s_axi_awready_INST_0 : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \s_axi_rdata[17]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \s_axi_rdata[18]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \s_axi_rdata[1]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \s_axi_rdata[20]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \s_axi_rdata[21]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \s_axi_rdata[23]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \s_axi_rdata[24]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \s_axi_rdata[27]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \s_axi_rdata[29]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \s_axi_rdata[2]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of s_axi_rvalid_i_1 : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of s_axi_wready_INST_0 : label is "soft_lutpair94";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \snapshot_seq_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \snapshot_seq_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \snapshot_seq_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \snapshot_seq_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \snapshot_seq_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \snapshot_seq_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \snapshot_seq_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \snapshot_seq_reg[8]_i_1\ : label is 11;
begin
  s_axi_aresetn_0 <= \^s_axi_aresetn_0\;
  s_axi_bresp(0) <= \^s_axi_bresp\(0);
  s_axi_bvalid_reg_0 <= \^s_axi_bvalid_reg_0\;
  s_axi_rvalid_reg_0 <= \^s_axi_rvalid_reg_0\;
\aw_addr_hold[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => aw_pending_reg_n_0,
      I1 => s_axi_aresetn,
      I2 => \^s_axi_bvalid_reg_0\,
      I3 => s_axi_awvalid,
      O => aw_fire
    );
\aw_addr_hold_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(0),
      Q => aw_addr_hold(0)
    );
\aw_addr_hold_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(10),
      Q => aw_addr_hold(10)
    );
\aw_addr_hold_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(11),
      Q => aw_addr_hold(11)
    );
\aw_addr_hold_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(1),
      Q => aw_addr_hold(1)
    );
\aw_addr_hold_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(2),
      Q => aw_addr_hold(2)
    );
\aw_addr_hold_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(3),
      Q => aw_addr_hold(3)
    );
\aw_addr_hold_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(4),
      Q => aw_addr_hold(4)
    );
\aw_addr_hold_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(5),
      Q => aw_addr_hold(5)
    );
\aw_addr_hold_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(6),
      Q => aw_addr_hold(6)
    );
\aw_addr_hold_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(7),
      Q => aw_addr_hold(7)
    );
\aw_addr_hold_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(8),
      Q => aw_addr_hold(8)
    );
\aw_addr_hold_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => aw_fire,
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_awaddr(9),
      Q => aw_addr_hold(9)
    );
aw_pending_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF11FF5500100000"
    )
        port map (
      I0 => w_pending_reg_n_0,
      I1 => s_axi_wvalid,
      I2 => s_axi_awvalid,
      I3 => \^s_axi_bvalid_reg_0\,
      I4 => s_axi_aresetn,
      I5 => aw_pending_reg_n_0,
      O => aw_pending_i_1_n_0
    );
aw_pending_reg: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \^s_axi_aresetn_0\,
      D => aw_pending_i_1_n_0,
      Q => aw_pending_reg_n_0
    );
result_available_reg: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => '1',
      Q => result_available
    );
s_axi_arready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => \^s_axi_rvalid_reg_0\,
      O => s_axi_arready
    );
s_axi_awready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^s_axi_bvalid_reg_0\,
      I1 => s_axi_aresetn,
      I2 => aw_pending_reg_n_0,
      O => s_axi_awready
    );
\s_axi_bresp[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFE00"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_3_n_0\,
      I1 => \s_axi_bresp[1]_i_4_n_0\,
      I2 => \s_axi_bresp[1]_i_5_n_0\,
      I3 => write_commit,
      I4 => \^s_axi_bresp\(0),
      O => \s_axi_bresp[1]_i_1_n_0\
    );
\s_axi_bresp[1]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \^s_axi_aresetn_0\
    );
\s_axi_bresp[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAFAFAFAFAFAEA"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_7_n_0\,
      I1 => aw_addr_hold(5),
      I2 => aw_pending_reg_n_0,
      I3 => aw_addr_hold(6),
      I4 => aw_addr_hold(11),
      I5 => aw_addr_hold(4),
      O => \s_axi_bresp[1]_i_3_n_0\
    );
\s_axi_bresp[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF0FFF0FFFFFFFE"
    )
        port map (
      I0 => s_axi_awaddr(4),
      I1 => s_axi_awaddr(11),
      I2 => \s_axi_bresp[1]_i_8_n_0\,
      I3 => \s_axi_bresp[1]_i_9_n_0\,
      I4 => s_axi_awaddr(7),
      I5 => aw_pending_reg_n_0,
      O => \s_axi_bresp[1]_i_4_n_0\
    );
\s_axi_bresp[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCFFCCFA"
    )
        port map (
      I0 => s_axi_awaddr(0),
      I1 => aw_addr_hold(7),
      I2 => s_axi_awaddr(2),
      I3 => aw_pending_reg_n_0,
      I4 => s_axi_awaddr(1),
      O => \s_axi_bresp[1]_i_5_n_0\
    );
\s_axi_bresp[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000EEC00000E0C0"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => w_pending_reg_n_0,
      I2 => aw_pending_reg_n_0,
      I3 => s_axi_aresetn,
      I4 => \^s_axi_bvalid_reg_0\,
      I5 => s_axi_awvalid,
      O => write_commit
    );
\s_axi_bresp[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFCFFAAFCFC"
    )
        port map (
      I0 => aw_addr_hold(0),
      I1 => s_axi_awaddr(5),
      I2 => s_axi_awaddr(6),
      I3 => aw_addr_hold(2),
      I4 => aw_pending_reg_n_0,
      I5 => aw_addr_hold(1),
      O => \s_axi_bresp[1]_i_7_n_0\
    );
\s_axi_bresp[1]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0E0F0"
    )
        port map (
      I0 => aw_addr_hold(9),
      I1 => aw_addr_hold(8),
      I2 => aw_pending_reg_n_0,
      I3 => aw_addr_hold(3),
      I4 => aw_addr_hold(10),
      O => \s_axi_bresp[1]_i_8_n_0\
    );
\s_axi_bresp[1]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF00EF"
    )
        port map (
      I0 => s_axi_awaddr(9),
      I1 => s_axi_awaddr(8),
      I2 => s_axi_awaddr(3),
      I3 => aw_pending_reg_n_0,
      I4 => s_axi_awaddr(10),
      O => \s_axi_bresp[1]_i_9_n_0\
    );
\s_axi_bresp_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_bresp[1]_i_1_n_0\,
      Q => \^s_axi_bresp\(0)
    );
s_axi_bvalid_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F2"
    )
        port map (
      I0 => \^s_axi_bvalid_reg_0\,
      I1 => s_axi_bready,
      I2 => write_commit,
      O => s_axi_bvalid_i_1_n_0
    );
s_axi_bvalid_reg: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_bvalid_i_1_n_0,
      Q => \^s_axi_bvalid_reg_0\
    );
\s_axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAEEFAAA"
    )
        port map (
      I0 => \s_axi_rdata[0]_i_2_n_0\,
      I1 => init_done,
      I2 => sample_drop_count(0),
      I3 => \s_axi_rdata[4]_i_2_n_0\,
      I4 => \s_axi_rdata[30]_i_2_n_0\,
      I5 => \s_axi_rdata[4]_i_4_n_0\,
      O => \s_axi_rdata[0]_i_1_n_0\
    );
\s_axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \s_axi_rdata[0]_i_3_n_0\,
      I1 => snapshot_peak(0),
      I2 => \s_axi_rdata[15]_i_4_n_0\,
      I3 => \snapshot_sumsq_reg_n_0_[0]\,
      I4 => \s_axi_rdata[30]_i_6_n_0\,
      I5 => \s_axi_rdata[0]_i_4_n_0\,
      O => \s_axi_rdata[0]_i_2_n_0\
    );
\s_axi_rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001200000031"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(5),
      I2 => s_axi_araddr(4),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(0),
      I5 => s_axi_araddr(3),
      O => \s_axi_rdata[0]_i_3_n_0\
    );
\s_axi_rdata[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD5D5D5"
    )
        port map (
      I0 => \s_axi_rdata[16]_i_4_n_0\,
      I1 => \s_axi_rdata[30]_i_5_n_0\,
      I2 => snapshot_seq_reg(0),
      I3 => data3(0),
      I4 => \s_axi_rdata[0]_i_5_n_0\,
      O => \s_axi_rdata[0]_i_4_n_0\
    );
\s_axi_rdata[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF4FFFCFFF4"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(5),
      I5 => s_axi_araddr(4),
      O => \s_axi_rdata[0]_i_5_n_0\
    );
\s_axi_rdata[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[15]_i_2_n_0\,
      I3 => \s_axi_rdata[10]_i_2_n_0\,
      I4 => sample_drop_count(10),
      O => \s_axi_rdata[10]_i_1_n_0\
    );
\s_axi_rdata[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_5_n_0\,
      I1 => snapshot_seq_reg(10),
      I2 => \s_axi_rdata[30]_i_6_n_0\,
      I3 => \snapshot_sumsq_reg_n_0_[10]\,
      I4 => snapshot_peak(10),
      I5 => \s_axi_rdata[15]_i_4_n_0\,
      O => \s_axi_rdata[10]_i_2_n_0\
    );
\s_axi_rdata[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[15]_i_2_n_0\,
      I3 => \s_axi_rdata[11]_i_2_n_0\,
      I4 => sample_drop_count(11),
      O => \s_axi_rdata[11]_i_1_n_0\
    );
\s_axi_rdata[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_5_n_0\,
      I1 => snapshot_seq_reg(11),
      I2 => \s_axi_rdata[30]_i_6_n_0\,
      I3 => \snapshot_sumsq_reg_n_0_[11]\,
      I4 => snapshot_peak(11),
      I5 => \s_axi_rdata[15]_i_4_n_0\,
      O => \s_axi_rdata[11]_i_2_n_0\
    );
\s_axi_rdata[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[15]_i_2_n_0\,
      I3 => \s_axi_rdata[12]_i_2_n_0\,
      I4 => sample_drop_count(12),
      O => \s_axi_rdata[12]_i_1_n_0\
    );
\s_axi_rdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_5_n_0\,
      I1 => snapshot_seq_reg(12),
      I2 => \s_axi_rdata[30]_i_6_n_0\,
      I3 => \snapshot_sumsq_reg_n_0_[12]\,
      I4 => snapshot_peak(12),
      I5 => \s_axi_rdata[15]_i_4_n_0\,
      O => \s_axi_rdata[12]_i_2_n_0\
    );
\s_axi_rdata[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[15]_i_2_n_0\,
      I3 => \s_axi_rdata[13]_i_2_n_0\,
      I4 => sample_drop_count(13),
      O => \s_axi_rdata[13]_i_1_n_0\
    );
\s_axi_rdata[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_5_n_0\,
      I1 => snapshot_seq_reg(13),
      I2 => \s_axi_rdata[30]_i_6_n_0\,
      I3 => \snapshot_sumsq_reg_n_0_[13]\,
      I4 => snapshot_peak(13),
      I5 => \s_axi_rdata[15]_i_4_n_0\,
      O => \s_axi_rdata[13]_i_2_n_0\
    );
\s_axi_rdata[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => \s_axi_rdata[14]_i_2_n_0\,
      I4 => sample_drop_count(14),
      O => \s_axi_rdata[14]_i_1_n_0\
    );
\s_axi_rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FCFAFFF0FCFAF0F"
    )
        port map (
      I0 => \snapshot_sumsq_reg_n_0_[14]\,
      I1 => snapshot_peak(14),
      I2 => \s_axi_rdata[16]_i_4_n_0\,
      I3 => \s_axi_rdata[14]_i_3_n_0\,
      I4 => \s_axi_rdata[14]_i_4_n_0\,
      I5 => snapshot_seq_reg(14),
      O => \s_axi_rdata[14]_i_2_n_0\
    );
\s_axi_rdata[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCFFFFFFFFFFF8"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_araddr(5),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(3),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[14]_i_3_n_0\
    );
\s_axi_rdata[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFDFFFDFFFDFDFD"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(5),
      I4 => s_axi_araddr(3),
      I5 => s_axi_araddr(4),
      O => \s_axi_rdata[14]_i_4_n_0\
    );
\s_axi_rdata[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[15]_i_2_n_0\,
      I3 => \s_axi_rdata[15]_i_3_n_0\,
      I4 => sample_drop_count(15),
      O => \s_axi_rdata[15]_i_1_n_0\
    );
\s_axi_rdata[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001010001000100"
    )
        port map (
      I0 => s_axi_araddr(5),
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(4),
      I4 => s_axi_araddr(2),
      I5 => s_axi_araddr(3),
      O => \s_axi_rdata[15]_i_2_n_0\
    );
\s_axi_rdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_5_n_0\,
      I1 => snapshot_seq_reg(15),
      I2 => \s_axi_rdata[30]_i_6_n_0\,
      I3 => \snapshot_sumsq_reg_n_0_[15]\,
      I4 => snapshot_peak(15),
      I5 => \s_axi_rdata[15]_i_4_n_0\,
      O => \s_axi_rdata[15]_i_3_n_0\
    );
\s_axi_rdata[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100010001"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(5),
      I5 => s_axi_araddr(4),
      O => \s_axi_rdata[15]_i_4_n_0\
    );
\s_axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0AAA2A8000A020"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[16]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_2_n_0\,
      I3 => \s_axi_rdata[16]_i_3_n_0\,
      I4 => \s_axi_rdata[16]_i_4_n_0\,
      I5 => sample_drop_count(16),
      O => \s_axi_rdata[16]_i_1_n_0\
    );
\s_axi_rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000F00010009"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(5),
      I5 => s_axi_araddr(4),
      O => \s_axi_rdata[16]_i_2_n_0\
    );
\s_axi_rdata[16]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD5D5D5"
    )
        port map (
      I0 => \s_axi_rdata[16]_i_4_n_0\,
      I1 => \s_axi_rdata[30]_i_5_n_0\,
      I2 => snapshot_seq_reg(16),
      I3 => \snapshot_sumsq_reg_n_0_[16]\,
      I4 => \s_axi_rdata[30]_i_6_n_0\,
      O => \s_axi_rdata[16]_i_3_n_0\
    );
\s_axi_rdata[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFAFFFFFF7A"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(2),
      I2 => s_axi_araddr(4),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(0),
      I5 => s_axi_araddr(5),
      O => \s_axi_rdata[16]_i_4_n_0\
    );
\s_axi_rdata[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[17]_i_2_n_0\,
      O => \s_axi_rdata[17]_i_1_n_0\
    );
\s_axi_rdata[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => sample_drop_count(17),
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => snapshot_seq_reg(17),
      I4 => \snapshot_sumsq_reg_n_0_[17]\,
      I5 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[17]_i_2_n_0\
    );
\s_axi_rdata[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[18]_i_2_n_0\,
      O => \s_axi_rdata[18]_i_1_n_0\
    );
\s_axi_rdata[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => sample_drop_count(18),
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => snapshot_seq_reg(18),
      I4 => \snapshot_sumsq_reg_n_0_[18]\,
      I5 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[18]_i_2_n_0\
    );
\s_axi_rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => \s_axi_rdata[19]_i_2_n_0\,
      I4 => sample_drop_count(19),
      O => \s_axi_rdata[19]_i_1_n_0\
    );
\s_axi_rdata[19]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD5D5D5"
    )
        port map (
      I0 => \s_axi_rdata[16]_i_4_n_0\,
      I1 => \s_axi_rdata[30]_i_5_n_0\,
      I2 => snapshot_seq_reg(19),
      I3 => \snapshot_sumsq_reg_n_0_[19]\,
      I4 => \s_axi_rdata[30]_i_6_n_0\,
      O => \s_axi_rdata[19]_i_2_n_0\
    );
\s_axi_rdata[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \s_axi_rdata[1]_i_2_n_0\,
      I1 => \s_axi_rdata[4]_i_4_n_0\,
      O => \s_axi_rdata[1]_i_1_n_0\
    );
\s_axi_rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF444444A0A0A0A0"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_2_n_0\,
      I1 => sample_drop_count(1),
      I2 => error,
      I3 => \s_axi_rdata[1]_i_3_n_0\,
      I4 => \s_axi_rdata[15]_i_2_n_0\,
      I5 => \s_axi_rdata[4]_i_2_n_0\,
      O => \s_axi_rdata[1]_i_2_n_0\
    );
\s_axi_rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CAFFCAF0CA0FCA00"
    )
        port map (
      I0 => snapshot_peak(1),
      I1 => data3(1),
      I2 => \s_axi_rdata[14]_i_3_n_0\,
      I3 => \s_axi_rdata[14]_i_4_n_0\,
      I4 => snapshot_seq_reg(1),
      I5 => \snapshot_sumsq_reg_n_0_[1]\,
      O => \s_axi_rdata[1]_i_3_n_0\
    );
\s_axi_rdata[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[20]_i_2_n_0\,
      O => \s_axi_rdata[20]_i_1_n_0\
    );
\s_axi_rdata[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => sample_drop_count(20),
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => snapshot_seq_reg(20),
      I4 => \snapshot_sumsq_reg_n_0_[20]\,
      I5 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[20]_i_2_n_0\
    );
\s_axi_rdata[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[21]_i_2_n_0\,
      O => \s_axi_rdata[21]_i_1_n_0\
    );
\s_axi_rdata[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => sample_drop_count(21),
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => snapshot_seq_reg(21),
      I4 => \snapshot_sumsq_reg_n_0_[21]\,
      I5 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[21]_i_2_n_0\
    );
\s_axi_rdata[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => \s_axi_rdata[22]_i_2_n_0\,
      I4 => sample_drop_count(22),
      O => \s_axi_rdata[22]_i_1_n_0\
    );
\s_axi_rdata[22]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD5D5D5"
    )
        port map (
      I0 => \s_axi_rdata[16]_i_4_n_0\,
      I1 => \s_axi_rdata[30]_i_5_n_0\,
      I2 => snapshot_seq_reg(22),
      I3 => \snapshot_sumsq_reg_n_0_[22]\,
      I4 => \s_axi_rdata[30]_i_6_n_0\,
      O => \s_axi_rdata[22]_i_2_n_0\
    );
\s_axi_rdata[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[23]_i_2_n_0\,
      O => \s_axi_rdata[23]_i_1_n_0\
    );
\s_axi_rdata[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => sample_drop_count(23),
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => snapshot_seq_reg(23),
      I4 => \snapshot_sumsq_reg_n_0_[23]\,
      I5 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[23]_i_2_n_0\
    );
\s_axi_rdata[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[24]_i_2_n_0\,
      O => \s_axi_rdata[24]_i_1_n_0\
    );
\s_axi_rdata[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => sample_drop_count(24),
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => snapshot_seq_reg(24),
      I4 => \snapshot_sumsq_reg_n_0_[24]\,
      I5 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[24]_i_2_n_0\
    );
\s_axi_rdata[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => \s_axi_rdata[25]_i_2_n_0\,
      I4 => sample_drop_count(25),
      O => \s_axi_rdata[25]_i_1_n_0\
    );
\s_axi_rdata[25]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD5D5D5"
    )
        port map (
      I0 => \s_axi_rdata[16]_i_4_n_0\,
      I1 => \s_axi_rdata[30]_i_5_n_0\,
      I2 => snapshot_seq_reg(25),
      I3 => \snapshot_sumsq_reg_n_0_[25]\,
      I4 => \s_axi_rdata[30]_i_6_n_0\,
      O => \s_axi_rdata[25]_i_2_n_0\
    );
\s_axi_rdata[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => \s_axi_rdata[26]_i_2_n_0\,
      I4 => sample_drop_count(26),
      O => \s_axi_rdata[26]_i_1_n_0\
    );
\s_axi_rdata[26]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD5D5D5"
    )
        port map (
      I0 => \s_axi_rdata[16]_i_4_n_0\,
      I1 => \s_axi_rdata[30]_i_5_n_0\,
      I2 => snapshot_seq_reg(26),
      I3 => \snapshot_sumsq_reg_n_0_[26]\,
      I4 => \s_axi_rdata[30]_i_6_n_0\,
      O => \s_axi_rdata[26]_i_2_n_0\
    );
\s_axi_rdata[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[27]_i_2_n_0\,
      O => \s_axi_rdata[27]_i_1_n_0\
    );
\s_axi_rdata[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => sample_drop_count(27),
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => snapshot_seq_reg(27),
      I4 => \snapshot_sumsq_reg_n_0_[27]\,
      I5 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[27]_i_2_n_0\
    );
\s_axi_rdata[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => \s_axi_rdata[28]_i_2_n_0\,
      I4 => sample_drop_count(28),
      O => \s_axi_rdata[28]_i_1_n_0\
    );
\s_axi_rdata[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD5D5D5"
    )
        port map (
      I0 => \s_axi_rdata[16]_i_4_n_0\,
      I1 => \s_axi_rdata[30]_i_5_n_0\,
      I2 => snapshot_seq_reg(28),
      I3 => \snapshot_sumsq_reg_n_0_[28]\,
      I4 => \s_axi_rdata[30]_i_6_n_0\,
      O => \s_axi_rdata[28]_i_2_n_0\
    );
\s_axi_rdata[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[29]_i_2_n_0\,
      O => \s_axi_rdata[29]_i_1_n_0\
    );
\s_axi_rdata[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => sample_drop_count(29),
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => snapshot_seq_reg(29),
      I4 => \snapshot_sumsq_reg_n_0_[29]\,
      I5 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[29]_i_2_n_0\
    );
\s_axi_rdata[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \s_axi_rdata[2]_i_2_n_0\,
      I1 => \s_axi_rdata[4]_i_4_n_0\,
      O => \s_axi_rdata[2]_i_1_n_0\
    );
\s_axi_rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF444444A0A0A0A0"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_2_n_0\,
      I1 => sample_drop_count(2),
      I2 => sensor_overrun,
      I3 => \s_axi_rdata[2]_i_3_n_0\,
      I4 => \s_axi_rdata[15]_i_2_n_0\,
      I5 => \s_axi_rdata[4]_i_2_n_0\,
      O => \s_axi_rdata[2]_i_2_n_0\
    );
\s_axi_rdata[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CAFFCAF0CA0FCA00"
    )
        port map (
      I0 => snapshot_peak(2),
      I1 => data3(2),
      I2 => \s_axi_rdata[14]_i_3_n_0\,
      I3 => \s_axi_rdata[14]_i_4_n_0\,
      I4 => snapshot_seq_reg(2),
      I5 => \snapshot_sumsq_reg_n_0_[2]\,
      O => \s_axi_rdata[2]_i_3_n_0\
    );
\s_axi_rdata[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => \s_axi_rdata[30]_i_4_n_0\,
      I4 => sample_drop_count(30),
      O => \s_axi_rdata[30]_i_1_n_0\
    );
\s_axi_rdata[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFDFFFFFFFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(4),
      I4 => s_axi_araddr(5),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[30]_i_2_n_0\
    );
\s_axi_rdata[30]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000200020007"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_araddr(5),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(3),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[30]_i_3_n_0\
    );
\s_axi_rdata[30]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD5D5D5"
    )
        port map (
      I0 => \s_axi_rdata[16]_i_4_n_0\,
      I1 => \s_axi_rdata[30]_i_5_n_0\,
      I2 => snapshot_seq_reg(30),
      I3 => \snapshot_sumsq_reg_n_0_[30]\,
      I4 => \s_axi_rdata[30]_i_6_n_0\,
      O => \s_axi_rdata[30]_i_4_n_0\
    );
\s_axi_rdata[30]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(5),
      O => \s_axi_rdata[30]_i_5_n_0\
    );
\s_axi_rdata[30]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001300000000"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(5),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(0),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[30]_i_6_n_0\
    );
\s_axi_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => s_axi_arvalid,
      I2 => \^s_axi_rvalid_reg_0\,
      O => s_axi_rdata0
    );
\s_axi_rdata[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[31]_i_4_n_0\,
      O => \s_axi_rdata[31]_i_2_n_0\
    );
\s_axi_rdata[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \s_axi_rdata[4]_i_2_n_0\,
      I1 => \s_axi_rdata[4]_i_4_n_0\,
      O => \s_axi_rdata[31]_i_3_n_0\
    );
\s_axi_rdata[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => sample_drop_count(31),
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[31]_i_5_n_0\,
      I3 => snapshot_seq_reg(31),
      I4 => \snapshot_sumsq_reg_n_0_[31]\,
      I5 => \s_axi_rdata[31]_i_6_n_0\,
      O => \s_axi_rdata[31]_i_4_n_0\
    );
\s_axi_rdata[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_araddr(5),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(3),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[31]_i_5_n_0\
    );
\s_axi_rdata[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(5),
      I4 => s_axi_araddr(3),
      I5 => s_axi_araddr(4),
      O => \s_axi_rdata[31]_i_6_n_0\
    );
\s_axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAEEFAAA"
    )
        port map (
      I0 => \s_axi_rdata[3]_i_2_n_0\,
      I1 => overflow,
      I2 => sample_drop_count(3),
      I3 => \s_axi_rdata[4]_i_2_n_0\,
      I4 => \s_axi_rdata[30]_i_2_n_0\,
      I5 => \s_axi_rdata[4]_i_4_n_0\,
      O => \s_axi_rdata[3]_i_1_n_0\
    );
\s_axi_rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2A0A220228082000"
    )
        port map (
      I0 => \s_axi_rdata[3]_i_3_n_0\,
      I1 => \s_axi_rdata[14]_i_3_n_0\,
      I2 => \s_axi_rdata[14]_i_4_n_0\,
      I3 => snapshot_peak(3),
      I4 => \snapshot_sumsq_reg_n_0_[3]\,
      I5 => snapshot_seq_reg(3),
      O => \s_axi_rdata[3]_i_2_n_0\
    );
\s_axi_rdata[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001200000030"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(5),
      I2 => s_axi_araddr(4),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(0),
      I5 => s_axi_araddr(3),
      O => \s_axi_rdata[3]_i_3_n_0\
    );
\s_axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF00B8"
    )
        port map (
      I0 => sample_drop_count(4),
      I1 => \s_axi_rdata[4]_i_2_n_0\,
      I2 => snapshot_count(4),
      I3 => \s_axi_rdata[30]_i_2_n_0\,
      I4 => \s_axi_rdata[4]_i_3_n_0\,
      I5 => \s_axi_rdata[4]_i_4_n_0\,
      O => \s_axi_rdata[4]_i_1_n_0\
    );
\s_axi_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDFFFFFEFFFF"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(4),
      I4 => s_axi_araddr(5),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[4]_i_2_n_0\
    );
\s_axi_rdata[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8888F000"
    )
        port map (
      I0 => \s_axi_rdata[4]_i_5_n_0\,
      I1 => \s_axi_rdata[30]_i_3_n_0\,
      I2 => result_available,
      I3 => \s_axi_rdata[30]_i_2_n_0\,
      I4 => \s_axi_rdata[4]_i_2_n_0\,
      O => \s_axi_rdata[4]_i_3_n_0\
    );
\s_axi_rdata[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => s_axi_araddr(11),
      I1 => s_axi_araddr(10),
      I2 => s_axi_araddr(9),
      I3 => s_axi_araddr(8),
      I4 => s_axi_araddr(6),
      I5 => s_axi_araddr(7),
      O => \s_axi_rdata[4]_i_4_n_0\
    );
\s_axi_rdata[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FCFAFFF0FCFAF0F"
    )
        port map (
      I0 => \snapshot_sumsq_reg_n_0_[4]\,
      I1 => snapshot_peak(4),
      I2 => \s_axi_rdata[16]_i_4_n_0\,
      I3 => \s_axi_rdata[14]_i_3_n_0\,
      I4 => \s_axi_rdata[14]_i_4_n_0\,
      I5 => snapshot_seq_reg(4),
      O => \s_axi_rdata[4]_i_5_n_0\
    );
\s_axi_rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => \s_axi_rdata[5]_i_2_n_0\,
      I4 => sample_drop_count(5),
      O => \s_axi_rdata[5]_i_1_n_0\
    );
\s_axi_rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FCFAFFF0FCFAF0F"
    )
        port map (
      I0 => \snapshot_sumsq_reg_n_0_[5]\,
      I1 => snapshot_peak(5),
      I2 => \s_axi_rdata[16]_i_4_n_0\,
      I3 => \s_axi_rdata[14]_i_3_n_0\,
      I4 => \s_axi_rdata[14]_i_4_n_0\,
      I5 => snapshot_seq_reg(5),
      O => \s_axi_rdata[5]_i_2_n_0\
    );
\s_axi_rdata[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[15]_i_2_n_0\,
      I3 => \s_axi_rdata[6]_i_2_n_0\,
      I4 => sample_drop_count(6),
      O => \s_axi_rdata[6]_i_1_n_0\
    );
\s_axi_rdata[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_5_n_0\,
      I1 => snapshot_seq_reg(6),
      I2 => \s_axi_rdata[30]_i_6_n_0\,
      I3 => \snapshot_sumsq_reg_n_0_[6]\,
      I4 => snapshot_peak(6),
      I5 => \s_axi_rdata[15]_i_4_n_0\,
      O => \s_axi_rdata[6]_i_2_n_0\
    );
\s_axi_rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[15]_i_2_n_0\,
      I3 => \s_axi_rdata[7]_i_2_n_0\,
      I4 => sample_drop_count(7),
      O => \s_axi_rdata[7]_i_1_n_0\
    );
\s_axi_rdata[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_5_n_0\,
      I1 => snapshot_seq_reg(7),
      I2 => \s_axi_rdata[30]_i_6_n_0\,
      I3 => \snapshot_sumsq_reg_n_0_[7]\,
      I4 => snapshot_peak(7),
      I5 => \s_axi_rdata[15]_i_4_n_0\,
      O => \s_axi_rdata[7]_i_2_n_0\
    );
\s_axi_rdata[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[15]_i_2_n_0\,
      I3 => \s_axi_rdata[8]_i_2_n_0\,
      I4 => sample_drop_count(8),
      O => \s_axi_rdata[8]_i_1_n_0\
    );
\s_axi_rdata[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \s_axi_rdata[30]_i_5_n_0\,
      I1 => snapshot_seq_reg(8),
      I2 => \s_axi_rdata[30]_i_6_n_0\,
      I3 => \snapshot_sumsq_reg_n_0_[8]\,
      I4 => snapshot_peak(8),
      I5 => \s_axi_rdata[15]_i_4_n_0\,
      O => \s_axi_rdata[8]_i_2_n_0\
    );
\s_axi_rdata[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A222A000"
    )
        port map (
      I0 => \s_axi_rdata[31]_i_3_n_0\,
      I1 => \s_axi_rdata[30]_i_2_n_0\,
      I2 => \s_axi_rdata[30]_i_3_n_0\,
      I3 => \s_axi_rdata[9]_i_2_n_0\,
      I4 => sample_drop_count(9),
      O => \s_axi_rdata[9]_i_1_n_0\
    );
\s_axi_rdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FCFAFFF0FCFAF0F"
    )
        port map (
      I0 => \snapshot_sumsq_reg_n_0_[9]\,
      I1 => snapshot_peak(9),
      I2 => \s_axi_rdata[16]_i_4_n_0\,
      I3 => \s_axi_rdata[14]_i_3_n_0\,
      I4 => \s_axi_rdata[14]_i_4_n_0\,
      I5 => snapshot_seq_reg(9),
      O => \s_axi_rdata[9]_i_2_n_0\
    );
\s_axi_rdata_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[0]_i_1_n_0\,
      Q => s_axi_rdata(0)
    );
\s_axi_rdata_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[10]_i_1_n_0\,
      Q => s_axi_rdata(10)
    );
\s_axi_rdata_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[11]_i_1_n_0\,
      Q => s_axi_rdata(11)
    );
\s_axi_rdata_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[12]_i_1_n_0\,
      Q => s_axi_rdata(12)
    );
\s_axi_rdata_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[13]_i_1_n_0\,
      Q => s_axi_rdata(13)
    );
\s_axi_rdata_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[14]_i_1_n_0\,
      Q => s_axi_rdata(14)
    );
\s_axi_rdata_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[15]_i_1_n_0\,
      Q => s_axi_rdata(15)
    );
\s_axi_rdata_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[16]_i_1_n_0\,
      Q => s_axi_rdata(16)
    );
\s_axi_rdata_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[17]_i_1_n_0\,
      Q => s_axi_rdata(17)
    );
\s_axi_rdata_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[18]_i_1_n_0\,
      Q => s_axi_rdata(18)
    );
\s_axi_rdata_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[19]_i_1_n_0\,
      Q => s_axi_rdata(19)
    );
\s_axi_rdata_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[1]_i_1_n_0\,
      Q => s_axi_rdata(1)
    );
\s_axi_rdata_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[20]_i_1_n_0\,
      Q => s_axi_rdata(20)
    );
\s_axi_rdata_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[21]_i_1_n_0\,
      Q => s_axi_rdata(21)
    );
\s_axi_rdata_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[22]_i_1_n_0\,
      Q => s_axi_rdata(22)
    );
\s_axi_rdata_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[23]_i_1_n_0\,
      Q => s_axi_rdata(23)
    );
\s_axi_rdata_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[24]_i_1_n_0\,
      Q => s_axi_rdata(24)
    );
\s_axi_rdata_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[25]_i_1_n_0\,
      Q => s_axi_rdata(25)
    );
\s_axi_rdata_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[26]_i_1_n_0\,
      Q => s_axi_rdata(26)
    );
\s_axi_rdata_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[27]_i_1_n_0\,
      Q => s_axi_rdata(27)
    );
\s_axi_rdata_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[28]_i_1_n_0\,
      Q => s_axi_rdata(28)
    );
\s_axi_rdata_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[29]_i_1_n_0\,
      Q => s_axi_rdata(29)
    );
\s_axi_rdata_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[2]_i_1_n_0\,
      Q => s_axi_rdata(2)
    );
\s_axi_rdata_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[30]_i_1_n_0\,
      Q => s_axi_rdata(30)
    );
\s_axi_rdata_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[31]_i_2_n_0\,
      Q => s_axi_rdata(31)
    );
\s_axi_rdata_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[3]_i_1_n_0\,
      Q => s_axi_rdata(3)
    );
\s_axi_rdata_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[4]_i_1_n_0\,
      Q => s_axi_rdata(4)
    );
\s_axi_rdata_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[5]_i_1_n_0\,
      Q => s_axi_rdata(5)
    );
\s_axi_rdata_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[6]_i_1_n_0\,
      Q => s_axi_rdata(6)
    );
\s_axi_rdata_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[7]_i_1_n_0\,
      Q => s_axi_rdata(7)
    );
\s_axi_rdata_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[8]_i_1_n_0\,
      Q => s_axi_rdata(8)
    );
\s_axi_rdata_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rdata[9]_i_1_n_0\,
      Q => s_axi_rdata(9)
    );
\s_axi_rresp[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFE0"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(5),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(1),
      I5 => \s_axi_rdata[4]_i_4_n_0\,
      O => \s_axi_rresp[1]_i_1_n_0\
    );
\s_axi_rresp_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => s_axi_rdata0,
      CLR => \^s_axi_aresetn_0\,
      D => \s_axi_rresp[1]_i_1_n_0\,
      Q => s_axi_rresp(0)
    );
s_axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7444"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^s_axi_rvalid_reg_0\,
      I2 => s_axi_arvalid,
      I3 => s_axi_aresetn,
      O => s_axi_rvalid_i_1_n_0
    );
s_axi_rvalid_reg: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \^s_axi_aresetn_0\,
      D => s_axi_rvalid_i_1_n_0,
      Q => \^s_axi_rvalid_reg_0\
    );
s_axi_wready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^s_axi_bvalid_reg_0\,
      I1 => s_axi_aresetn,
      I2 => w_pending_reg_n_0,
      O => s_axi_wready
    );
\snapshot_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => result_sample_count(0),
      Q => snapshot_count(4)
    );
\snapshot_peak_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(0),
      Q => snapshot_peak(0)
    );
\snapshot_peak_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(10),
      Q => snapshot_peak(10)
    );
\snapshot_peak_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(11),
      Q => snapshot_peak(11)
    );
\snapshot_peak_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(12),
      Q => snapshot_peak(12)
    );
\snapshot_peak_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(13),
      Q => snapshot_peak(13)
    );
\snapshot_peak_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(14),
      Q => snapshot_peak(14)
    );
\snapshot_peak_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(15),
      Q => snapshot_peak(15)
    );
\snapshot_peak_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(1),
      Q => snapshot_peak(1)
    );
\snapshot_peak_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(2),
      Q => snapshot_peak(2)
    );
\snapshot_peak_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(3),
      Q => snapshot_peak(3)
    );
\snapshot_peak_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(4),
      Q => snapshot_peak(4)
    );
\snapshot_peak_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(5),
      Q => snapshot_peak(5)
    );
\snapshot_peak_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(6),
      Q => snapshot_peak(6)
    );
\snapshot_peak_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(7),
      Q => snapshot_peak(7)
    );
\snapshot_peak_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(8),
      Q => snapshot_peak(8)
    );
\snapshot_peak_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => D(9),
      Q => snapshot_peak(9)
    );
\snapshot_seq[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => snapshot_seq_reg(0),
      O => \snapshot_seq[0]_i_2_n_0\
    );
\snapshot_seq_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[0]_i_1_n_7\,
      Q => snapshot_seq_reg(0)
    );
\snapshot_seq_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \snapshot_seq_reg[0]_i_1_n_0\,
      CO(2) => \snapshot_seq_reg[0]_i_1_n_1\,
      CO(1) => \snapshot_seq_reg[0]_i_1_n_2\,
      CO(0) => \snapshot_seq_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \snapshot_seq_reg[0]_i_1_n_4\,
      O(2) => \snapshot_seq_reg[0]_i_1_n_5\,
      O(1) => \snapshot_seq_reg[0]_i_1_n_6\,
      O(0) => \snapshot_seq_reg[0]_i_1_n_7\,
      S(3 downto 1) => snapshot_seq_reg(3 downto 1),
      S(0) => \snapshot_seq[0]_i_2_n_0\
    );
\snapshot_seq_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[8]_i_1_n_5\,
      Q => snapshot_seq_reg(10)
    );
\snapshot_seq_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[8]_i_1_n_4\,
      Q => snapshot_seq_reg(11)
    );
\snapshot_seq_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[12]_i_1_n_7\,
      Q => snapshot_seq_reg(12)
    );
\snapshot_seq_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \snapshot_seq_reg[8]_i_1_n_0\,
      CO(3) => \snapshot_seq_reg[12]_i_1_n_0\,
      CO(2) => \snapshot_seq_reg[12]_i_1_n_1\,
      CO(1) => \snapshot_seq_reg[12]_i_1_n_2\,
      CO(0) => \snapshot_seq_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \snapshot_seq_reg[12]_i_1_n_4\,
      O(2) => \snapshot_seq_reg[12]_i_1_n_5\,
      O(1) => \snapshot_seq_reg[12]_i_1_n_6\,
      O(0) => \snapshot_seq_reg[12]_i_1_n_7\,
      S(3 downto 0) => snapshot_seq_reg(15 downto 12)
    );
\snapshot_seq_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[12]_i_1_n_6\,
      Q => snapshot_seq_reg(13)
    );
\snapshot_seq_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[12]_i_1_n_5\,
      Q => snapshot_seq_reg(14)
    );
\snapshot_seq_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[12]_i_1_n_4\,
      Q => snapshot_seq_reg(15)
    );
\snapshot_seq_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[16]_i_1_n_7\,
      Q => snapshot_seq_reg(16)
    );
\snapshot_seq_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \snapshot_seq_reg[12]_i_1_n_0\,
      CO(3) => \snapshot_seq_reg[16]_i_1_n_0\,
      CO(2) => \snapshot_seq_reg[16]_i_1_n_1\,
      CO(1) => \snapshot_seq_reg[16]_i_1_n_2\,
      CO(0) => \snapshot_seq_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \snapshot_seq_reg[16]_i_1_n_4\,
      O(2) => \snapshot_seq_reg[16]_i_1_n_5\,
      O(1) => \snapshot_seq_reg[16]_i_1_n_6\,
      O(0) => \snapshot_seq_reg[16]_i_1_n_7\,
      S(3 downto 0) => snapshot_seq_reg(19 downto 16)
    );
\snapshot_seq_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[16]_i_1_n_6\,
      Q => snapshot_seq_reg(17)
    );
\snapshot_seq_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[16]_i_1_n_5\,
      Q => snapshot_seq_reg(18)
    );
\snapshot_seq_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[16]_i_1_n_4\,
      Q => snapshot_seq_reg(19)
    );
\snapshot_seq_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[0]_i_1_n_6\,
      Q => snapshot_seq_reg(1)
    );
\snapshot_seq_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[20]_i_1_n_7\,
      Q => snapshot_seq_reg(20)
    );
\snapshot_seq_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \snapshot_seq_reg[16]_i_1_n_0\,
      CO(3) => \snapshot_seq_reg[20]_i_1_n_0\,
      CO(2) => \snapshot_seq_reg[20]_i_1_n_1\,
      CO(1) => \snapshot_seq_reg[20]_i_1_n_2\,
      CO(0) => \snapshot_seq_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \snapshot_seq_reg[20]_i_1_n_4\,
      O(2) => \snapshot_seq_reg[20]_i_1_n_5\,
      O(1) => \snapshot_seq_reg[20]_i_1_n_6\,
      O(0) => \snapshot_seq_reg[20]_i_1_n_7\,
      S(3 downto 0) => snapshot_seq_reg(23 downto 20)
    );
\snapshot_seq_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[20]_i_1_n_6\,
      Q => snapshot_seq_reg(21)
    );
\snapshot_seq_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[20]_i_1_n_5\,
      Q => snapshot_seq_reg(22)
    );
\snapshot_seq_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[20]_i_1_n_4\,
      Q => snapshot_seq_reg(23)
    );
\snapshot_seq_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[24]_i_1_n_7\,
      Q => snapshot_seq_reg(24)
    );
\snapshot_seq_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \snapshot_seq_reg[20]_i_1_n_0\,
      CO(3) => \snapshot_seq_reg[24]_i_1_n_0\,
      CO(2) => \snapshot_seq_reg[24]_i_1_n_1\,
      CO(1) => \snapshot_seq_reg[24]_i_1_n_2\,
      CO(0) => \snapshot_seq_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \snapshot_seq_reg[24]_i_1_n_4\,
      O(2) => \snapshot_seq_reg[24]_i_1_n_5\,
      O(1) => \snapshot_seq_reg[24]_i_1_n_6\,
      O(0) => \snapshot_seq_reg[24]_i_1_n_7\,
      S(3 downto 0) => snapshot_seq_reg(27 downto 24)
    );
\snapshot_seq_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[24]_i_1_n_6\,
      Q => snapshot_seq_reg(25)
    );
\snapshot_seq_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[24]_i_1_n_5\,
      Q => snapshot_seq_reg(26)
    );
\snapshot_seq_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[24]_i_1_n_4\,
      Q => snapshot_seq_reg(27)
    );
\snapshot_seq_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[28]_i_1_n_7\,
      Q => snapshot_seq_reg(28)
    );
\snapshot_seq_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \snapshot_seq_reg[24]_i_1_n_0\,
      CO(3) => \NLW_snapshot_seq_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \snapshot_seq_reg[28]_i_1_n_1\,
      CO(1) => \snapshot_seq_reg[28]_i_1_n_2\,
      CO(0) => \snapshot_seq_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \snapshot_seq_reg[28]_i_1_n_4\,
      O(2) => \snapshot_seq_reg[28]_i_1_n_5\,
      O(1) => \snapshot_seq_reg[28]_i_1_n_6\,
      O(0) => \snapshot_seq_reg[28]_i_1_n_7\,
      S(3 downto 0) => snapshot_seq_reg(31 downto 28)
    );
\snapshot_seq_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[28]_i_1_n_6\,
      Q => snapshot_seq_reg(29)
    );
\snapshot_seq_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[0]_i_1_n_5\,
      Q => snapshot_seq_reg(2)
    );
\snapshot_seq_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[28]_i_1_n_5\,
      Q => snapshot_seq_reg(30)
    );
\snapshot_seq_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[28]_i_1_n_4\,
      Q => snapshot_seq_reg(31)
    );
\snapshot_seq_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[0]_i_1_n_4\,
      Q => snapshot_seq_reg(3)
    );
\snapshot_seq_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[4]_i_1_n_7\,
      Q => snapshot_seq_reg(4)
    );
\snapshot_seq_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \snapshot_seq_reg[0]_i_1_n_0\,
      CO(3) => \snapshot_seq_reg[4]_i_1_n_0\,
      CO(2) => \snapshot_seq_reg[4]_i_1_n_1\,
      CO(1) => \snapshot_seq_reg[4]_i_1_n_2\,
      CO(0) => \snapshot_seq_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \snapshot_seq_reg[4]_i_1_n_4\,
      O(2) => \snapshot_seq_reg[4]_i_1_n_5\,
      O(1) => \snapshot_seq_reg[4]_i_1_n_6\,
      O(0) => \snapshot_seq_reg[4]_i_1_n_7\,
      S(3 downto 0) => snapshot_seq_reg(7 downto 4)
    );
\snapshot_seq_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[4]_i_1_n_6\,
      Q => snapshot_seq_reg(5)
    );
\snapshot_seq_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[4]_i_1_n_5\,
      Q => snapshot_seq_reg(6)
    );
\snapshot_seq_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[4]_i_1_n_4\,
      Q => snapshot_seq_reg(7)
    );
\snapshot_seq_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[8]_i_1_n_7\,
      Q => snapshot_seq_reg(8)
    );
\snapshot_seq_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \snapshot_seq_reg[4]_i_1_n_0\,
      CO(3) => \snapshot_seq_reg[8]_i_1_n_0\,
      CO(2) => \snapshot_seq_reg[8]_i_1_n_1\,
      CO(1) => \snapshot_seq_reg[8]_i_1_n_2\,
      CO(0) => \snapshot_seq_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \snapshot_seq_reg[8]_i_1_n_4\,
      O(2) => \snapshot_seq_reg[8]_i_1_n_5\,
      O(1) => \snapshot_seq_reg[8]_i_1_n_6\,
      O(0) => \snapshot_seq_reg[8]_i_1_n_7\,
      S(3 downto 0) => snapshot_seq_reg(11 downto 8)
    );
\snapshot_seq_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_seq_reg[8]_i_1_n_6\,
      Q => snapshot_seq_reg(9)
    );
\snapshot_sumsq_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(0),
      Q => \snapshot_sumsq_reg_n_0_[0]\
    );
\snapshot_sumsq_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(10),
      Q => \snapshot_sumsq_reg_n_0_[10]\
    );
\snapshot_sumsq_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(11),
      Q => \snapshot_sumsq_reg_n_0_[11]\
    );
\snapshot_sumsq_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(12),
      Q => \snapshot_sumsq_reg_n_0_[12]\
    );
\snapshot_sumsq_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(13),
      Q => \snapshot_sumsq_reg_n_0_[13]\
    );
\snapshot_sumsq_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(14),
      Q => \snapshot_sumsq_reg_n_0_[14]\
    );
\snapshot_sumsq_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(15),
      Q => \snapshot_sumsq_reg_n_0_[15]\
    );
\snapshot_sumsq_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(16),
      Q => \snapshot_sumsq_reg_n_0_[16]\
    );
\snapshot_sumsq_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(17),
      Q => \snapshot_sumsq_reg_n_0_[17]\
    );
\snapshot_sumsq_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(18),
      Q => \snapshot_sumsq_reg_n_0_[18]\
    );
\snapshot_sumsq_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(19),
      Q => \snapshot_sumsq_reg_n_0_[19]\
    );
\snapshot_sumsq_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(1),
      Q => \snapshot_sumsq_reg_n_0_[1]\
    );
\snapshot_sumsq_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(20),
      Q => \snapshot_sumsq_reg_n_0_[20]\
    );
\snapshot_sumsq_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(21),
      Q => \snapshot_sumsq_reg_n_0_[21]\
    );
\snapshot_sumsq_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(22),
      Q => \snapshot_sumsq_reg_n_0_[22]\
    );
\snapshot_sumsq_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(23),
      Q => \snapshot_sumsq_reg_n_0_[23]\
    );
\snapshot_sumsq_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(24),
      Q => \snapshot_sumsq_reg_n_0_[24]\
    );
\snapshot_sumsq_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(25),
      Q => \snapshot_sumsq_reg_n_0_[25]\
    );
\snapshot_sumsq_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(26),
      Q => \snapshot_sumsq_reg_n_0_[26]\
    );
\snapshot_sumsq_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(27),
      Q => \snapshot_sumsq_reg_n_0_[27]\
    );
\snapshot_sumsq_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(28),
      Q => \snapshot_sumsq_reg_n_0_[28]\
    );
\snapshot_sumsq_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(29),
      Q => \snapshot_sumsq_reg_n_0_[29]\
    );
\snapshot_sumsq_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(2),
      Q => \snapshot_sumsq_reg_n_0_[2]\
    );
\snapshot_sumsq_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(30),
      Q => \snapshot_sumsq_reg_n_0_[30]\
    );
\snapshot_sumsq_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(31),
      Q => \snapshot_sumsq_reg_n_0_[31]\
    );
\snapshot_sumsq_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(32),
      Q => data3(0)
    );
\snapshot_sumsq_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(33),
      Q => data3(1)
    );
\snapshot_sumsq_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(34),
      Q => data3(2)
    );
\snapshot_sumsq_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(3),
      Q => \snapshot_sumsq_reg_n_0_[3]\
    );
\snapshot_sumsq_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(4),
      Q => \snapshot_sumsq_reg_n_0_[4]\
    );
\snapshot_sumsq_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(5),
      Q => \snapshot_sumsq_reg_n_0_[5]\
    );
\snapshot_sumsq_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(6),
      Q => \snapshot_sumsq_reg_n_0_[6]\
    );
\snapshot_sumsq_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(7),
      Q => \snapshot_sumsq_reg_n_0_[7]\
    );
\snapshot_sumsq_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(8),
      Q => \snapshot_sumsq_reg_n_0_[8]\
    );
\snapshot_sumsq_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => snapshot_seq0,
      CLR => \^s_axi_aresetn_0\,
      D => \snapshot_sumsq_reg[34]_0\(9),
      Q => \snapshot_sumsq_reg_n_0_[9]\
    );
w_pending_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF11FF3300100000"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => aw_pending_reg_n_0,
      I2 => s_axi_wvalid,
      I3 => \^s_axi_bvalid_reg_0\,
      I4 => s_axi_aresetn,
      I5 => w_pending_reg_n_0,
      O => w_pending_i_1_n_0
    );
w_pending_reg: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \^s_axi_aresetn_0\,
      D => w_pending_i_1_n_0,
      Q => w_pending_reg_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0_vibration_frame_fifo is
  port (
    overflow : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \peak_accumulator_reg[15]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    B : out STD_LOGIC_VECTOR ( 14 downto 0 );
    \peak_accumulator_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \peak_accumulator_reg[6]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \sample_data__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \level_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    xyz_ready : out STD_LOGIC;
    s_axi_aresetn_0 : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \level_reg[3]_0\ : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \last_sample__3\ : in STD_LOGIC;
    xyz_valid : in STD_LOGIC;
    result_valid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \frame_memory_reg[0][47]_0\ : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_lis3dh_vibration_axi_0_0_vibration_frame_fifo : entity is "vibration_frame_fifo";
end design_1_lis3dh_vibration_axi_0_0_vibration_frame_fifo;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0_vibration_frame_fifo is
  signal \^b\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \frame_memory[0][47]_i_1_n_0\ : STD_LOGIC;
  signal \frame_memory[1][47]_i_1_n_0\ : STD_LOGIC;
  signal \frame_memory[2][47]_i_1_n_0\ : STD_LOGIC;
  signal \frame_memory[3][47]_i_1_n_0\ : STD_LOGIC;
  signal \frame_memory[4][47]_i_1_n_0\ : STD_LOGIC;
  signal \frame_memory[5][47]_i_1_n_0\ : STD_LOGIC;
  signal \frame_memory[6][47]_i_1_n_0\ : STD_LOGIC;
  signal \frame_memory[7][47]_i_1_n_0\ : STD_LOGIC;
  signal \frame_memory_reg[0]\ : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal \frame_memory_reg[1]\ : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal \frame_memory_reg[2]\ : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal \frame_memory_reg[3]\ : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal \frame_memory_reg[4]\ : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal \frame_memory_reg[5]\ : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal \frame_memory_reg[6]\ : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal \frame_memory_reg[7]\ : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal level : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \level[3]_i_1_n_0\ : STD_LOGIC;
  signal level_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^level_reg[1]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^overflow\ : STD_LOGIC;
  signal overflow_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \peak_accumulator[11]_i_4_n_0\ : STD_LOGIC;
  signal \peak_accumulator[11]_i_5_n_0\ : STD_LOGIC;
  signal \peak_accumulator[11]_i_6_n_0\ : STD_LOGIC;
  signal \peak_accumulator[11]_i_7_n_0\ : STD_LOGIC;
  signal \peak_accumulator[11]_i_8_n_0\ : STD_LOGIC;
  signal \peak_accumulator[11]_i_9_n_0\ : STD_LOGIC;
  signal \peak_accumulator[13]_i_3_n_0\ : STD_LOGIC;
  signal \peak_accumulator[13]_i_4_n_0\ : STD_LOGIC;
  signal \peak_accumulator[14]_i_3_n_0\ : STD_LOGIC;
  signal \peak_accumulator[14]_i_4_n_0\ : STD_LOGIC;
  signal \peak_accumulator[15]_i_5_n_0\ : STD_LOGIC;
  signal \peak_accumulator[15]_i_6_n_0\ : STD_LOGIC;
  signal \peak_accumulator[15]_i_7_n_0\ : STD_LOGIC;
  signal \peak_accumulator[15]_i_8_n_0\ : STD_LOGIC;
  signal \peak_accumulator[15]_i_9_n_0\ : STD_LOGIC;
  signal \peak_accumulator[1]_i_3_n_0\ : STD_LOGIC;
  signal \peak_accumulator[1]_i_4_n_0\ : STD_LOGIC;
  signal \peak_accumulator[3]_i_10_n_0\ : STD_LOGIC;
  signal \peak_accumulator[3]_i_4_n_0\ : STD_LOGIC;
  signal \peak_accumulator[3]_i_5_n_0\ : STD_LOGIC;
  signal \peak_accumulator[3]_i_6_n_0\ : STD_LOGIC;
  signal \peak_accumulator[3]_i_7_n_0\ : STD_LOGIC;
  signal \peak_accumulator[3]_i_8_n_0\ : STD_LOGIC;
  signal \peak_accumulator[3]_i_9_n_0\ : STD_LOGIC;
  signal \peak_accumulator[5]_i_3_n_0\ : STD_LOGIC;
  signal \peak_accumulator[5]_i_4_n_0\ : STD_LOGIC;
  signal \peak_accumulator[7]_i_4_n_0\ : STD_LOGIC;
  signal \peak_accumulator[7]_i_5_n_0\ : STD_LOGIC;
  signal \peak_accumulator[7]_i_6_n_0\ : STD_LOGIC;
  signal \peak_accumulator[7]_i_7_n_0\ : STD_LOGIC;
  signal \peak_accumulator[7]_i_8_n_0\ : STD_LOGIC;
  signal \peak_accumulator[7]_i_9_n_0\ : STD_LOGIC;
  signal \peak_accumulator[9]_i_3_n_0\ : STD_LOGIC;
  signal \peak_accumulator[9]_i_4_n_0\ : STD_LOGIC;
  signal \peak_accumulator_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \peak_accumulator_reg[11]_i_2_n_1\ : STD_LOGIC;
  signal \peak_accumulator_reg[11]_i_2_n_2\ : STD_LOGIC;
  signal \peak_accumulator_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \peak_accumulator_reg[15]_i_2_n_2\ : STD_LOGIC;
  signal \peak_accumulator_reg[15]_i_2_n_3\ : STD_LOGIC;
  signal \peak_accumulator_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \peak_accumulator_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \peak_accumulator_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \peak_accumulator_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \peak_accumulator_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \peak_accumulator_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \peak_accumulator_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \peak_accumulator_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal read_pointer : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \read_pointer[0]_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[1]_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[2]_i_2_n_0\ : STD_LOGIC;
  signal sample_data : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \^sample_data__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal sample_magnitude0 : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal sample_square_full_i_23_n_0 : STD_LOGIC;
  signal sample_square_full_i_24_n_0 : STD_LOGIC;
  signal sample_square_full_i_25_n_0 : STD_LOGIC;
  signal sample_square_full_i_26_n_0 : STD_LOGIC;
  signal sample_square_full_i_27_n_0 : STD_LOGIC;
  signal sample_square_full_i_28_n_0 : STD_LOGIC;
  signal sample_square_full_i_29_n_0 : STD_LOGIC;
  signal sample_square_full_i_30_n_0 : STD_LOGIC;
  signal sample_square_full_i_31_n_0 : STD_LOGIC;
  signal sample_square_full_i_32_n_0 : STD_LOGIC;
  signal sample_square_full_i_33_n_0 : STD_LOGIC;
  signal sample_square_full_i_34_n_0 : STD_LOGIC;
  signal sample_square_full_i_35_n_0 : STD_LOGIC;
  signal sample_square_full_i_36_n_0 : STD_LOGIC;
  signal write_pointer : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \write_pointer[0]_i_1_n_0\ : STD_LOGIC;
  signal \write_pointer[1]_i_1_n_0\ : STD_LOGIC;
  signal \write_pointer[2]_i_1_n_0\ : STD_LOGIC;
  signal \NLW_peak_accumulator_reg[15]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_peak_accumulator_reg[15]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \level[0]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \level[1]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \level[2]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \level[3]_i_2\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \peak_accumulator[15]_i_1\ : label is "soft_lutpair84";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \peak_accumulator_reg[11]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \peak_accumulator_reg[15]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \peak_accumulator_reg[3]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \peak_accumulator_reg[7]_i_2\ : label is 35;
  attribute SOFT_HLUTNM of \read_pointer[1]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \read_pointer[2]_i_2\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \result_peak[10]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \result_peak[12]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \result_peak[15]_i_2\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \result_peak[2]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \result_peak[4]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \result_peak[6]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \result_peak[8]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of sensor_i_1 : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \write_pointer[1]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \write_pointer[2]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \write_pointer[2]_i_2\ : label is "soft_lutpair83";
begin
  B(14 downto 0) <= \^b\(14 downto 0);
  E(0) <= \^e\(0);
  \level_reg[1]_0\(0) <= \^level_reg[1]_0\(0);
  overflow <= \^overflow\;
  \sample_data__0\(0) <= \^sample_data__0\(0);
\frame_memory[0][47]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => write_pointer(2),
      I1 => write_pointer(0),
      I2 => write_pointer(1),
      I3 => p_0_in(1),
      I4 => s_axi_aresetn,
      O => \frame_memory[0][47]_i_1_n_0\
    );
\frame_memory[1][47]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => write_pointer(2),
      I1 => write_pointer(0),
      I2 => write_pointer(1),
      I3 => p_0_in(1),
      I4 => s_axi_aresetn,
      O => \frame_memory[1][47]_i_1_n_0\
    );
\frame_memory[2][47]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => write_pointer(2),
      I1 => write_pointer(0),
      I2 => write_pointer(1),
      I3 => p_0_in(1),
      I4 => s_axi_aresetn,
      O => \frame_memory[2][47]_i_1_n_0\
    );
\frame_memory[3][47]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => write_pointer(2),
      I1 => write_pointer(0),
      I2 => write_pointer(1),
      I3 => p_0_in(1),
      I4 => s_axi_aresetn,
      O => \frame_memory[3][47]_i_1_n_0\
    );
\frame_memory[4][47]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => write_pointer(0),
      I1 => write_pointer(2),
      I2 => write_pointer(1),
      I3 => p_0_in(1),
      I4 => s_axi_aresetn,
      O => \frame_memory[4][47]_i_1_n_0\
    );
\frame_memory[5][47]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => write_pointer(1),
      I1 => p_0_in(1),
      I2 => s_axi_aresetn,
      I3 => write_pointer(2),
      I4 => write_pointer(0),
      O => \frame_memory[5][47]_i_1_n_0\
    );
\frame_memory[6][47]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => write_pointer(0),
      I1 => write_pointer(2),
      I2 => write_pointer(1),
      I3 => p_0_in(1),
      I4 => s_axi_aresetn,
      O => \frame_memory[6][47]_i_1_n_0\
    );
\frame_memory[7][47]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => write_pointer(1),
      I1 => p_0_in(1),
      I2 => s_axi_aresetn,
      I3 => write_pointer(2),
      I4 => write_pointer(0),
      O => \frame_memory[7][47]_i_1_n_0\
    );
\frame_memory_reg[0][32]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(0),
      Q => \frame_memory_reg[0]\(32),
      R => '0'
    );
\frame_memory_reg[0][33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(1),
      Q => \frame_memory_reg[0]\(33),
      R => '0'
    );
\frame_memory_reg[0][34]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(2),
      Q => \frame_memory_reg[0]\(34),
      R => '0'
    );
\frame_memory_reg[0][35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(3),
      Q => \frame_memory_reg[0]\(35),
      R => '0'
    );
\frame_memory_reg[0][36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(4),
      Q => \frame_memory_reg[0]\(36),
      R => '0'
    );
\frame_memory_reg[0][37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(5),
      Q => \frame_memory_reg[0]\(37),
      R => '0'
    );
\frame_memory_reg[0][38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(6),
      Q => \frame_memory_reg[0]\(38),
      R => '0'
    );
\frame_memory_reg[0][39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(7),
      Q => \frame_memory_reg[0]\(39),
      R => '0'
    );
\frame_memory_reg[0][40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(8),
      Q => \frame_memory_reg[0]\(40),
      R => '0'
    );
\frame_memory_reg[0][41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(9),
      Q => \frame_memory_reg[0]\(41),
      R => '0'
    );
\frame_memory_reg[0][42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(10),
      Q => \frame_memory_reg[0]\(42),
      R => '0'
    );
\frame_memory_reg[0][43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(11),
      Q => \frame_memory_reg[0]\(43),
      R => '0'
    );
\frame_memory_reg[0][44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(12),
      Q => \frame_memory_reg[0]\(44),
      R => '0'
    );
\frame_memory_reg[0][45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(13),
      Q => \frame_memory_reg[0]\(45),
      R => '0'
    );
\frame_memory_reg[0][46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(14),
      Q => \frame_memory_reg[0]\(46),
      R => '0'
    );
\frame_memory_reg[0][47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[0][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(15),
      Q => \frame_memory_reg[0]\(47),
      R => '0'
    );
\frame_memory_reg[1][32]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(0),
      Q => \frame_memory_reg[1]\(32),
      R => '0'
    );
\frame_memory_reg[1][33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(1),
      Q => \frame_memory_reg[1]\(33),
      R => '0'
    );
\frame_memory_reg[1][34]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(2),
      Q => \frame_memory_reg[1]\(34),
      R => '0'
    );
\frame_memory_reg[1][35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(3),
      Q => \frame_memory_reg[1]\(35),
      R => '0'
    );
\frame_memory_reg[1][36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(4),
      Q => \frame_memory_reg[1]\(36),
      R => '0'
    );
\frame_memory_reg[1][37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(5),
      Q => \frame_memory_reg[1]\(37),
      R => '0'
    );
\frame_memory_reg[1][38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(6),
      Q => \frame_memory_reg[1]\(38),
      R => '0'
    );
\frame_memory_reg[1][39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(7),
      Q => \frame_memory_reg[1]\(39),
      R => '0'
    );
\frame_memory_reg[1][40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(8),
      Q => \frame_memory_reg[1]\(40),
      R => '0'
    );
\frame_memory_reg[1][41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(9),
      Q => \frame_memory_reg[1]\(41),
      R => '0'
    );
\frame_memory_reg[1][42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(10),
      Q => \frame_memory_reg[1]\(42),
      R => '0'
    );
\frame_memory_reg[1][43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(11),
      Q => \frame_memory_reg[1]\(43),
      R => '0'
    );
\frame_memory_reg[1][44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(12),
      Q => \frame_memory_reg[1]\(44),
      R => '0'
    );
\frame_memory_reg[1][45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(13),
      Q => \frame_memory_reg[1]\(45),
      R => '0'
    );
\frame_memory_reg[1][46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(14),
      Q => \frame_memory_reg[1]\(46),
      R => '0'
    );
\frame_memory_reg[1][47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[1][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(15),
      Q => \frame_memory_reg[1]\(47),
      R => '0'
    );
\frame_memory_reg[2][32]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(0),
      Q => \frame_memory_reg[2]\(32),
      R => '0'
    );
\frame_memory_reg[2][33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(1),
      Q => \frame_memory_reg[2]\(33),
      R => '0'
    );
\frame_memory_reg[2][34]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(2),
      Q => \frame_memory_reg[2]\(34),
      R => '0'
    );
\frame_memory_reg[2][35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(3),
      Q => \frame_memory_reg[2]\(35),
      R => '0'
    );
\frame_memory_reg[2][36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(4),
      Q => \frame_memory_reg[2]\(36),
      R => '0'
    );
\frame_memory_reg[2][37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(5),
      Q => \frame_memory_reg[2]\(37),
      R => '0'
    );
\frame_memory_reg[2][38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(6),
      Q => \frame_memory_reg[2]\(38),
      R => '0'
    );
\frame_memory_reg[2][39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(7),
      Q => \frame_memory_reg[2]\(39),
      R => '0'
    );
\frame_memory_reg[2][40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(8),
      Q => \frame_memory_reg[2]\(40),
      R => '0'
    );
\frame_memory_reg[2][41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(9),
      Q => \frame_memory_reg[2]\(41),
      R => '0'
    );
\frame_memory_reg[2][42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(10),
      Q => \frame_memory_reg[2]\(42),
      R => '0'
    );
\frame_memory_reg[2][43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(11),
      Q => \frame_memory_reg[2]\(43),
      R => '0'
    );
\frame_memory_reg[2][44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(12),
      Q => \frame_memory_reg[2]\(44),
      R => '0'
    );
\frame_memory_reg[2][45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(13),
      Q => \frame_memory_reg[2]\(45),
      R => '0'
    );
\frame_memory_reg[2][46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(14),
      Q => \frame_memory_reg[2]\(46),
      R => '0'
    );
\frame_memory_reg[2][47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[2][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(15),
      Q => \frame_memory_reg[2]\(47),
      R => '0'
    );
\frame_memory_reg[3][32]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(0),
      Q => \frame_memory_reg[3]\(32),
      R => '0'
    );
\frame_memory_reg[3][33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(1),
      Q => \frame_memory_reg[3]\(33),
      R => '0'
    );
\frame_memory_reg[3][34]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(2),
      Q => \frame_memory_reg[3]\(34),
      R => '0'
    );
\frame_memory_reg[3][35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(3),
      Q => \frame_memory_reg[3]\(35),
      R => '0'
    );
\frame_memory_reg[3][36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(4),
      Q => \frame_memory_reg[3]\(36),
      R => '0'
    );
\frame_memory_reg[3][37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(5),
      Q => \frame_memory_reg[3]\(37),
      R => '0'
    );
\frame_memory_reg[3][38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(6),
      Q => \frame_memory_reg[3]\(38),
      R => '0'
    );
\frame_memory_reg[3][39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(7),
      Q => \frame_memory_reg[3]\(39),
      R => '0'
    );
\frame_memory_reg[3][40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(8),
      Q => \frame_memory_reg[3]\(40),
      R => '0'
    );
\frame_memory_reg[3][41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(9),
      Q => \frame_memory_reg[3]\(41),
      R => '0'
    );
\frame_memory_reg[3][42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(10),
      Q => \frame_memory_reg[3]\(42),
      R => '0'
    );
\frame_memory_reg[3][43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(11),
      Q => \frame_memory_reg[3]\(43),
      R => '0'
    );
\frame_memory_reg[3][44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(12),
      Q => \frame_memory_reg[3]\(44),
      R => '0'
    );
\frame_memory_reg[3][45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(13),
      Q => \frame_memory_reg[3]\(45),
      R => '0'
    );
\frame_memory_reg[3][46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(14),
      Q => \frame_memory_reg[3]\(46),
      R => '0'
    );
\frame_memory_reg[3][47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[3][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(15),
      Q => \frame_memory_reg[3]\(47),
      R => '0'
    );
\frame_memory_reg[4][32]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(0),
      Q => \frame_memory_reg[4]\(32),
      R => '0'
    );
\frame_memory_reg[4][33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(1),
      Q => \frame_memory_reg[4]\(33),
      R => '0'
    );
\frame_memory_reg[4][34]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(2),
      Q => \frame_memory_reg[4]\(34),
      R => '0'
    );
\frame_memory_reg[4][35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(3),
      Q => \frame_memory_reg[4]\(35),
      R => '0'
    );
\frame_memory_reg[4][36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(4),
      Q => \frame_memory_reg[4]\(36),
      R => '0'
    );
\frame_memory_reg[4][37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(5),
      Q => \frame_memory_reg[4]\(37),
      R => '0'
    );
\frame_memory_reg[4][38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(6),
      Q => \frame_memory_reg[4]\(38),
      R => '0'
    );
\frame_memory_reg[4][39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(7),
      Q => \frame_memory_reg[4]\(39),
      R => '0'
    );
\frame_memory_reg[4][40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(8),
      Q => \frame_memory_reg[4]\(40),
      R => '0'
    );
\frame_memory_reg[4][41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(9),
      Q => \frame_memory_reg[4]\(41),
      R => '0'
    );
\frame_memory_reg[4][42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(10),
      Q => \frame_memory_reg[4]\(42),
      R => '0'
    );
\frame_memory_reg[4][43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(11),
      Q => \frame_memory_reg[4]\(43),
      R => '0'
    );
\frame_memory_reg[4][44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(12),
      Q => \frame_memory_reg[4]\(44),
      R => '0'
    );
\frame_memory_reg[4][45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(13),
      Q => \frame_memory_reg[4]\(45),
      R => '0'
    );
\frame_memory_reg[4][46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(14),
      Q => \frame_memory_reg[4]\(46),
      R => '0'
    );
\frame_memory_reg[4][47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[4][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(15),
      Q => \frame_memory_reg[4]\(47),
      R => '0'
    );
\frame_memory_reg[5][32]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(0),
      Q => \frame_memory_reg[5]\(32),
      R => '0'
    );
\frame_memory_reg[5][33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(1),
      Q => \frame_memory_reg[5]\(33),
      R => '0'
    );
\frame_memory_reg[5][34]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(2),
      Q => \frame_memory_reg[5]\(34),
      R => '0'
    );
\frame_memory_reg[5][35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(3),
      Q => \frame_memory_reg[5]\(35),
      R => '0'
    );
\frame_memory_reg[5][36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(4),
      Q => \frame_memory_reg[5]\(36),
      R => '0'
    );
\frame_memory_reg[5][37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(5),
      Q => \frame_memory_reg[5]\(37),
      R => '0'
    );
\frame_memory_reg[5][38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(6),
      Q => \frame_memory_reg[5]\(38),
      R => '0'
    );
\frame_memory_reg[5][39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(7),
      Q => \frame_memory_reg[5]\(39),
      R => '0'
    );
\frame_memory_reg[5][40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(8),
      Q => \frame_memory_reg[5]\(40),
      R => '0'
    );
\frame_memory_reg[5][41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(9),
      Q => \frame_memory_reg[5]\(41),
      R => '0'
    );
\frame_memory_reg[5][42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(10),
      Q => \frame_memory_reg[5]\(42),
      R => '0'
    );
\frame_memory_reg[5][43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(11),
      Q => \frame_memory_reg[5]\(43),
      R => '0'
    );
\frame_memory_reg[5][44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(12),
      Q => \frame_memory_reg[5]\(44),
      R => '0'
    );
\frame_memory_reg[5][45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(13),
      Q => \frame_memory_reg[5]\(45),
      R => '0'
    );
\frame_memory_reg[5][46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(14),
      Q => \frame_memory_reg[5]\(46),
      R => '0'
    );
\frame_memory_reg[5][47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[5][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(15),
      Q => \frame_memory_reg[5]\(47),
      R => '0'
    );
\frame_memory_reg[6][32]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(0),
      Q => \frame_memory_reg[6]\(32),
      R => '0'
    );
\frame_memory_reg[6][33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(1),
      Q => \frame_memory_reg[6]\(33),
      R => '0'
    );
\frame_memory_reg[6][34]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(2),
      Q => \frame_memory_reg[6]\(34),
      R => '0'
    );
\frame_memory_reg[6][35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(3),
      Q => \frame_memory_reg[6]\(35),
      R => '0'
    );
\frame_memory_reg[6][36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(4),
      Q => \frame_memory_reg[6]\(36),
      R => '0'
    );
\frame_memory_reg[6][37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(5),
      Q => \frame_memory_reg[6]\(37),
      R => '0'
    );
\frame_memory_reg[6][38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(6),
      Q => \frame_memory_reg[6]\(38),
      R => '0'
    );
\frame_memory_reg[6][39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(7),
      Q => \frame_memory_reg[6]\(39),
      R => '0'
    );
\frame_memory_reg[6][40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(8),
      Q => \frame_memory_reg[6]\(40),
      R => '0'
    );
\frame_memory_reg[6][41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(9),
      Q => \frame_memory_reg[6]\(41),
      R => '0'
    );
\frame_memory_reg[6][42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(10),
      Q => \frame_memory_reg[6]\(42),
      R => '0'
    );
\frame_memory_reg[6][43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(11),
      Q => \frame_memory_reg[6]\(43),
      R => '0'
    );
\frame_memory_reg[6][44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(12),
      Q => \frame_memory_reg[6]\(44),
      R => '0'
    );
\frame_memory_reg[6][45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(13),
      Q => \frame_memory_reg[6]\(45),
      R => '0'
    );
\frame_memory_reg[6][46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(14),
      Q => \frame_memory_reg[6]\(46),
      R => '0'
    );
\frame_memory_reg[6][47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[6][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(15),
      Q => \frame_memory_reg[6]\(47),
      R => '0'
    );
\frame_memory_reg[7][32]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(0),
      Q => \frame_memory_reg[7]\(32),
      R => '0'
    );
\frame_memory_reg[7][33]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(1),
      Q => \frame_memory_reg[7]\(33),
      R => '0'
    );
\frame_memory_reg[7][34]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(2),
      Q => \frame_memory_reg[7]\(34),
      R => '0'
    );
\frame_memory_reg[7][35]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(3),
      Q => \frame_memory_reg[7]\(35),
      R => '0'
    );
\frame_memory_reg[7][36]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(4),
      Q => \frame_memory_reg[7]\(36),
      R => '0'
    );
\frame_memory_reg[7][37]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(5),
      Q => \frame_memory_reg[7]\(37),
      R => '0'
    );
\frame_memory_reg[7][38]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(6),
      Q => \frame_memory_reg[7]\(38),
      R => '0'
    );
\frame_memory_reg[7][39]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(7),
      Q => \frame_memory_reg[7]\(39),
      R => '0'
    );
\frame_memory_reg[7][40]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(8),
      Q => \frame_memory_reg[7]\(40),
      R => '0'
    );
\frame_memory_reg[7][41]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(9),
      Q => \frame_memory_reg[7]\(41),
      R => '0'
    );
\frame_memory_reg[7][42]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(10),
      Q => \frame_memory_reg[7]\(42),
      R => '0'
    );
\frame_memory_reg[7][43]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(11),
      Q => \frame_memory_reg[7]\(43),
      R => '0'
    );
\frame_memory_reg[7][44]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(12),
      Q => \frame_memory_reg[7]\(44),
      R => '0'
    );
\frame_memory_reg[7][45]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(13),
      Q => \frame_memory_reg[7]\(45),
      R => '0'
    );
\frame_memory_reg[7][46]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(14),
      Q => \frame_memory_reg[7]\(46),
      R => '0'
    );
\frame_memory_reg[7][47]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \frame_memory[7][47]_i_1_n_0\,
      D => \frame_memory_reg[0][47]_0\(15),
      Q => \frame_memory_reg[7]\(47),
      R => '0'
    );
\level[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => level_reg(0),
      O => level(0)
    );
\level[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FF0F20F"
    )
        port map (
      I0 => level_reg(3),
      I1 => level_reg(2),
      I2 => level_reg(0),
      I3 => xyz_valid,
      I4 => level_reg(1),
      O => level(1)
    );
\level[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5FFAA00D"
    )
        port map (
      I0 => xyz_valid,
      I1 => level_reg(3),
      I2 => level_reg(0),
      I3 => level_reg(1),
      I4 => level_reg(2),
      O => level(2)
    );
\level[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA755555554"
    )
        port map (
      I0 => result_valid,
      I1 => level_reg(3),
      I2 => level_reg(1),
      I3 => level_reg(2),
      I4 => level_reg(0),
      I5 => xyz_valid,
      O => \level[3]_i_1_n_0\
    );
\level[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F80FA01"
    )
        port map (
      I0 => level_reg(1),
      I1 => xyz_valid,
      I2 => level_reg(0),
      I3 => level_reg(3),
      I4 => level_reg(2),
      O => level(3)
    );
\level_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \level[3]_i_1_n_0\,
      CLR => \level_reg[3]_0\,
      D => level(0),
      Q => level_reg(0)
    );
\level_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \level[3]_i_1_n_0\,
      CLR => \level_reg[3]_0\,
      D => level(1),
      Q => level_reg(1)
    );
\level_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \level[3]_i_1_n_0\,
      CLR => \level_reg[3]_0\,
      D => level(2),
      Q => level_reg(2)
    );
\level_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \level[3]_i_1_n_0\,
      CLR => \level_reg[3]_0\,
      D => level(3),
      Q => level_reg(3)
    );
\next_peak1_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088CCFC000000B8"
    )
        port map (
      I0 => sample_magnitude0(14),
      I1 => sample_data(15),
      I2 => sample_data(14),
      I3 => Q(14),
      I4 => Q(15),
      I5 => sample_magnitude0(15),
      O => DI(3)
    );
\next_peak1_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B800B8B8FFB8"
    )
        port map (
      I0 => sample_magnitude0(13),
      I1 => sample_data(15),
      I2 => sample_data(13),
      I3 => \^b\(11),
      I4 => Q(12),
      I5 => Q(13),
      O => DI(2)
    );
\next_peak1_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B800B8B8FFB8"
    )
        port map (
      I0 => sample_magnitude0(11),
      I1 => sample_data(15),
      I2 => sample_data(11),
      I3 => \^b\(9),
      I4 => Q(10),
      I5 => Q(11),
      O => DI(1)
    );
\next_peak1_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B800B8B8FFB8"
    )
        port map (
      I0 => sample_magnitude0(9),
      I1 => sample_data(15),
      I2 => sample_data(9),
      I3 => \^b\(7),
      I4 => Q(8),
      I5 => Q(9),
      O => DI(0)
    );
\next_peak1_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"883000B844030047"
    )
        port map (
      I0 => sample_magnitude0(14),
      I1 => sample_data(15),
      I2 => sample_data(14),
      I3 => Q(15),
      I4 => sample_magnitude0(15),
      I5 => Q(14),
      O => S(3)
    );
\next_peak1_carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B84700000000B847"
    )
        port map (
      I0 => sample_magnitude0(13),
      I1 => sample_data(15),
      I2 => sample_data(13),
      I3 => Q(13),
      I4 => \^b\(11),
      I5 => Q(12),
      O => S(2)
    );
\next_peak1_carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B84700000000B847"
    )
        port map (
      I0 => sample_magnitude0(11),
      I1 => sample_data(15),
      I2 => sample_data(11),
      I3 => Q(11),
      I4 => \^b\(9),
      I5 => Q(10),
      O => S(1)
    );
\next_peak1_carry__0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B84700000000B847"
    )
        port map (
      I0 => sample_magnitude0(9),
      I1 => sample_data(15),
      I2 => sample_data(9),
      I3 => Q(9),
      I4 => \^b\(7),
      I5 => Q(8),
      O => S(0)
    );
next_peak1_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B800B8B8FFB8"
    )
        port map (
      I0 => sample_magnitude0(7),
      I1 => sample_data(15),
      I2 => sample_data(7),
      I3 => \^b\(5),
      I4 => Q(6),
      I5 => Q(7),
      O => \peak_accumulator_reg[6]\(3)
    );
next_peak1_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B800B8B8FFB8"
    )
        port map (
      I0 => sample_magnitude0(5),
      I1 => sample_data(15),
      I2 => sample_data(5),
      I3 => \^b\(3),
      I4 => Q(4),
      I5 => Q(5),
      O => \peak_accumulator_reg[6]\(2)
    );
next_peak1_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B800B8B8FFB8"
    )
        port map (
      I0 => sample_magnitude0(3),
      I1 => sample_data(15),
      I2 => sample_data(3),
      I3 => \^b\(1),
      I4 => Q(2),
      I5 => Q(3),
      O => \peak_accumulator_reg[6]\(1)
    );
next_peak1_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B800B8B8FFB8"
    )
        port map (
      I0 => sample_magnitude0(1),
      I1 => sample_data(15),
      I2 => sample_data(1),
      I3 => \^sample_data__0\(0),
      I4 => Q(0),
      I5 => Q(1),
      O => \peak_accumulator_reg[6]\(0)
    );
next_peak1_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B84700000000B847"
    )
        port map (
      I0 => sample_magnitude0(7),
      I1 => sample_data(15),
      I2 => sample_data(7),
      I3 => Q(7),
      I4 => \^b\(5),
      I5 => Q(6),
      O => \peak_accumulator_reg[7]\(3)
    );
next_peak1_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B84700000000B847"
    )
        port map (
      I0 => sample_magnitude0(5),
      I1 => sample_data(15),
      I2 => sample_data(5),
      I3 => Q(5),
      I4 => \^b\(3),
      I5 => Q(4),
      O => \peak_accumulator_reg[7]\(2)
    );
next_peak1_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B84700000000B847"
    )
        port map (
      I0 => sample_magnitude0(3),
      I1 => sample_data(15),
      I2 => sample_data(3),
      I3 => Q(3),
      I4 => \^b\(1),
      I5 => Q(2),
      O => \peak_accumulator_reg[7]\(1)
    );
next_peak1_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B84700000000B847"
    )
        port map (
      I0 => sample_magnitude0(1),
      I1 => sample_data(15),
      I2 => sample_data(1),
      I3 => Q(1),
      I4 => \^sample_data__0\(0),
      I5 => Q(0),
      O => \peak_accumulator_reg[7]\(0)
    );
overflow_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00020000"
    )
        port map (
      I0 => level_reg(3),
      I1 => level_reg(1),
      I2 => level_reg(2),
      I3 => level_reg(0),
      I4 => xyz_valid,
      I5 => \^overflow\,
      O => overflow_i_1_n_0
    );
overflow_reg: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \level_reg[3]_0\,
      D => overflow_i_1_n_0,
      Q => \^overflow\
    );
\peak_accumulator[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8B8FF00"
    )
        port map (
      I0 => sample_magnitude0(11),
      I1 => sample_data(15),
      I2 => sample_data(11),
      I3 => Q(11),
      I4 => CO(0),
      I5 => \last_sample__3\,
      O => \peak_accumulator_reg[15]\(5)
    );
\peak_accumulator[11]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(12),
      O => \peak_accumulator[11]_i_4_n_0\
    );
\peak_accumulator[11]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(11),
      O => \peak_accumulator[11]_i_5_n_0\
    );
\peak_accumulator[11]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(10),
      O => \peak_accumulator[11]_i_6_n_0\
    );
\peak_accumulator[11]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(9),
      O => \peak_accumulator[11]_i_7_n_0\
    );
\peak_accumulator[11]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(43),
      I1 => \frame_memory_reg[3]\(43),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(43),
      I5 => \frame_memory_reg[2]\(43),
      O => \peak_accumulator[11]_i_8_n_0\
    );
\peak_accumulator[11]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(43),
      I1 => \frame_memory_reg[7]\(43),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(43),
      I5 => \frame_memory_reg[6]\(43),
      O => \peak_accumulator[11]_i_9_n_0\
    );
\peak_accumulator[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8B8FF00"
    )
        port map (
      I0 => sample_magnitude0(13),
      I1 => sample_data(15),
      I2 => sample_data(13),
      I3 => Q(13),
      I4 => CO(0),
      I5 => \last_sample__3\,
      O => \peak_accumulator_reg[15]\(6)
    );
\peak_accumulator[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(45),
      I1 => \frame_memory_reg[3]\(45),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(45),
      I5 => \frame_memory_reg[2]\(45),
      O => \peak_accumulator[13]_i_3_n_0\
    );
\peak_accumulator[13]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(45),
      I1 => \frame_memory_reg[7]\(45),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(45),
      I5 => \frame_memory_reg[6]\(45),
      O => \peak_accumulator[13]_i_4_n_0\
    );
\peak_accumulator[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8B8FF00"
    )
        port map (
      I0 => sample_magnitude0(14),
      I1 => sample_data(15),
      I2 => sample_data(14),
      I3 => Q(14),
      I4 => CO(0),
      I5 => \last_sample__3\,
      O => \peak_accumulator_reg[15]\(7)
    );
\peak_accumulator[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(46),
      I1 => \frame_memory_reg[3]\(46),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(46),
      I5 => \frame_memory_reg[2]\(46),
      O => \peak_accumulator[14]_i_3_n_0\
    );
\peak_accumulator[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(46),
      I1 => \frame_memory_reg[7]\(46),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(46),
      I5 => \frame_memory_reg[6]\(46),
      O => \peak_accumulator[14]_i_4_n_0\
    );
\peak_accumulator[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000E222"
    )
        port map (
      I0 => Q(15),
      I1 => CO(0),
      I2 => sample_magnitude0(15),
      I3 => sample_data(15),
      I4 => \last_sample__3\,
      O => \peak_accumulator_reg[15]\(8)
    );
\peak_accumulator[15]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(15),
      O => \peak_accumulator[15]_i_5_n_0\
    );
\peak_accumulator[15]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(14),
      O => \peak_accumulator[15]_i_6_n_0\
    );
\peak_accumulator[15]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(13),
      O => \peak_accumulator[15]_i_7_n_0\
    );
\peak_accumulator[15]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(47),
      I1 => \frame_memory_reg[3]\(47),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(47),
      I5 => \frame_memory_reg[2]\(47),
      O => \peak_accumulator[15]_i_8_n_0\
    );
\peak_accumulator[15]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(47),
      I1 => \frame_memory_reg[7]\(47),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(47),
      I5 => \frame_memory_reg[6]\(47),
      O => \peak_accumulator[15]_i_9_n_0\
    );
\peak_accumulator[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8B8FF00"
    )
        port map (
      I0 => sample_magnitude0(1),
      I1 => sample_data(15),
      I2 => sample_data(1),
      I3 => Q(1),
      I4 => CO(0),
      I5 => \last_sample__3\,
      O => \peak_accumulator_reg[15]\(0)
    );
\peak_accumulator[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(33),
      I1 => \frame_memory_reg[3]\(33),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(33),
      I5 => \frame_memory_reg[2]\(33),
      O => \peak_accumulator[1]_i_3_n_0\
    );
\peak_accumulator[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(33),
      I1 => \frame_memory_reg[7]\(33),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(33),
      I5 => \frame_memory_reg[6]\(33),
      O => \peak_accumulator[1]_i_4_n_0\
    );
\peak_accumulator[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8B8FF00"
    )
        port map (
      I0 => sample_magnitude0(3),
      I1 => sample_data(15),
      I2 => sample_data(3),
      I3 => Q(3),
      I4 => CO(0),
      I5 => \last_sample__3\,
      O => \peak_accumulator_reg[15]\(1)
    );
\peak_accumulator[3]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(35),
      I1 => \frame_memory_reg[7]\(35),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(35),
      I5 => \frame_memory_reg[6]\(35),
      O => \peak_accumulator[3]_i_10_n_0\
    );
\peak_accumulator[3]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^sample_data__0\(0),
      O => \peak_accumulator[3]_i_4_n_0\
    );
\peak_accumulator[3]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(4),
      O => \peak_accumulator[3]_i_5_n_0\
    );
\peak_accumulator[3]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(3),
      O => \peak_accumulator[3]_i_6_n_0\
    );
\peak_accumulator[3]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(2),
      O => \peak_accumulator[3]_i_7_n_0\
    );
\peak_accumulator[3]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(1),
      O => \peak_accumulator[3]_i_8_n_0\
    );
\peak_accumulator[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(35),
      I1 => \frame_memory_reg[3]\(35),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(35),
      I5 => \frame_memory_reg[2]\(35),
      O => \peak_accumulator[3]_i_9_n_0\
    );
\peak_accumulator[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8B8FF00"
    )
        port map (
      I0 => sample_magnitude0(5),
      I1 => sample_data(15),
      I2 => sample_data(5),
      I3 => Q(5),
      I4 => CO(0),
      I5 => \last_sample__3\,
      O => \peak_accumulator_reg[15]\(2)
    );
\peak_accumulator[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(37),
      I1 => \frame_memory_reg[3]\(37),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(37),
      I5 => \frame_memory_reg[2]\(37),
      O => \peak_accumulator[5]_i_3_n_0\
    );
\peak_accumulator[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(37),
      I1 => \frame_memory_reg[7]\(37),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(37),
      I5 => \frame_memory_reg[6]\(37),
      O => \peak_accumulator[5]_i_4_n_0\
    );
\peak_accumulator[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8B8FF00"
    )
        port map (
      I0 => sample_magnitude0(7),
      I1 => sample_data(15),
      I2 => sample_data(7),
      I3 => Q(7),
      I4 => CO(0),
      I5 => \last_sample__3\,
      O => \peak_accumulator_reg[15]\(3)
    );
\peak_accumulator[7]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(8),
      O => \peak_accumulator[7]_i_4_n_0\
    );
\peak_accumulator[7]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(7),
      O => \peak_accumulator[7]_i_5_n_0\
    );
\peak_accumulator[7]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(6),
      O => \peak_accumulator[7]_i_6_n_0\
    );
\peak_accumulator[7]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_data(5),
      O => \peak_accumulator[7]_i_7_n_0\
    );
\peak_accumulator[7]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(39),
      I1 => \frame_memory_reg[3]\(39),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(39),
      I5 => \frame_memory_reg[2]\(39),
      O => \peak_accumulator[7]_i_8_n_0\
    );
\peak_accumulator[7]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(39),
      I1 => \frame_memory_reg[7]\(39),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(39),
      I5 => \frame_memory_reg[6]\(39),
      O => \peak_accumulator[7]_i_9_n_0\
    );
\peak_accumulator[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8B8FF00"
    )
        port map (
      I0 => sample_magnitude0(9),
      I1 => sample_data(15),
      I2 => sample_data(9),
      I3 => Q(9),
      I4 => CO(0),
      I5 => \last_sample__3\,
      O => \peak_accumulator_reg[15]\(4)
    );
\peak_accumulator[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(41),
      I1 => \frame_memory_reg[3]\(41),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(41),
      I5 => \frame_memory_reg[2]\(41),
      O => \peak_accumulator[9]_i_3_n_0\
    );
\peak_accumulator[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(41),
      I1 => \frame_memory_reg[7]\(41),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(41),
      I5 => \frame_memory_reg[6]\(41),
      O => \peak_accumulator[9]_i_4_n_0\
    );
\peak_accumulator_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \peak_accumulator_reg[7]_i_2_n_0\,
      CO(3) => \peak_accumulator_reg[11]_i_2_n_0\,
      CO(2) => \peak_accumulator_reg[11]_i_2_n_1\,
      CO(1) => \peak_accumulator_reg[11]_i_2_n_2\,
      CO(0) => \peak_accumulator_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_magnitude0(12 downto 9),
      S(3) => \peak_accumulator[11]_i_4_n_0\,
      S(2) => \peak_accumulator[11]_i_5_n_0\,
      S(1) => \peak_accumulator[11]_i_6_n_0\,
      S(0) => \peak_accumulator[11]_i_7_n_0\
    );
\peak_accumulator_reg[11]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \peak_accumulator[11]_i_8_n_0\,
      I1 => \peak_accumulator[11]_i_9_n_0\,
      O => sample_data(11),
      S => read_pointer(2)
    );
\peak_accumulator_reg[13]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \peak_accumulator[13]_i_3_n_0\,
      I1 => \peak_accumulator[13]_i_4_n_0\,
      O => sample_data(13),
      S => read_pointer(2)
    );
\peak_accumulator_reg[14]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \peak_accumulator[14]_i_3_n_0\,
      I1 => \peak_accumulator[14]_i_4_n_0\,
      O => sample_data(14),
      S => read_pointer(2)
    );
\peak_accumulator_reg[15]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \peak_accumulator_reg[11]_i_2_n_0\,
      CO(3 downto 2) => \NLW_peak_accumulator_reg[15]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \peak_accumulator_reg[15]_i_2_n_2\,
      CO(0) => \peak_accumulator_reg[15]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_peak_accumulator_reg[15]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => sample_magnitude0(15 downto 13),
      S(3) => '0',
      S(2) => \peak_accumulator[15]_i_5_n_0\,
      S(1) => \peak_accumulator[15]_i_6_n_0\,
      S(0) => \peak_accumulator[15]_i_7_n_0\
    );
\peak_accumulator_reg[15]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \peak_accumulator[15]_i_8_n_0\,
      I1 => \peak_accumulator[15]_i_9_n_0\,
      O => sample_data(15),
      S => read_pointer(2)
    );
\peak_accumulator_reg[1]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \peak_accumulator[1]_i_3_n_0\,
      I1 => \peak_accumulator[1]_i_4_n_0\,
      O => sample_data(1),
      S => read_pointer(2)
    );
\peak_accumulator_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \peak_accumulator_reg[3]_i_2_n_0\,
      CO(2) => \peak_accumulator_reg[3]_i_2_n_1\,
      CO(1) => \peak_accumulator_reg[3]_i_2_n_2\,
      CO(0) => \peak_accumulator_reg[3]_i_2_n_3\,
      CYINIT => \peak_accumulator[3]_i_4_n_0\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_magnitude0(4 downto 1),
      S(3) => \peak_accumulator[3]_i_5_n_0\,
      S(2) => \peak_accumulator[3]_i_6_n_0\,
      S(1) => \peak_accumulator[3]_i_7_n_0\,
      S(0) => \peak_accumulator[3]_i_8_n_0\
    );
\peak_accumulator_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \peak_accumulator[3]_i_9_n_0\,
      I1 => \peak_accumulator[3]_i_10_n_0\,
      O => sample_data(3),
      S => read_pointer(2)
    );
\peak_accumulator_reg[5]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \peak_accumulator[5]_i_3_n_0\,
      I1 => \peak_accumulator[5]_i_4_n_0\,
      O => sample_data(5),
      S => read_pointer(2)
    );
\peak_accumulator_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \peak_accumulator_reg[3]_i_2_n_0\,
      CO(3) => \peak_accumulator_reg[7]_i_2_n_0\,
      CO(2) => \peak_accumulator_reg[7]_i_2_n_1\,
      CO(1) => \peak_accumulator_reg[7]_i_2_n_2\,
      CO(0) => \peak_accumulator_reg[7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_magnitude0(8 downto 5),
      S(3) => \peak_accumulator[7]_i_4_n_0\,
      S(2) => \peak_accumulator[7]_i_5_n_0\,
      S(1) => \peak_accumulator[7]_i_6_n_0\,
      S(0) => \peak_accumulator[7]_i_7_n_0\
    );
\peak_accumulator_reg[7]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \peak_accumulator[7]_i_8_n_0\,
      I1 => \peak_accumulator[7]_i_9_n_0\,
      O => sample_data(7),
      S => read_pointer(2)
    );
\peak_accumulator_reg[9]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \peak_accumulator[9]_i_3_n_0\,
      I1 => \peak_accumulator[9]_i_4_n_0\,
      O => sample_data(9),
      S => read_pointer(2)
    );
\read_pointer[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => read_pointer(0),
      O => \read_pointer[0]_i_1_n_0\
    );
\read_pointer[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => read_pointer(0),
      I1 => read_pointer(1),
      O => \read_pointer[1]_i_1_n_0\
    );
\read_pointer[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => level_reg(1),
      I1 => level_reg(2),
      I2 => level_reg(0),
      I3 => level_reg(3),
      I4 => result_valid,
      O => \^level_reg[1]_0\(0)
    );
\read_pointer[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => read_pointer(0),
      I1 => read_pointer(1),
      I2 => read_pointer(2),
      O => \read_pointer[2]_i_2_n_0\
    );
\read_pointer_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \^level_reg[1]_0\(0),
      CLR => \level_reg[3]_0\,
      D => \read_pointer[0]_i_1_n_0\,
      Q => read_pointer(0)
    );
\read_pointer_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \^level_reg[1]_0\(0),
      CLR => \level_reg[3]_0\,
      D => \read_pointer[1]_i_1_n_0\,
      Q => read_pointer(1)
    );
\read_pointer_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \^level_reg[1]_0\(0),
      CLR => \level_reg[3]_0\,
      D => \read_pointer[2]_i_2_n_0\,
      Q => read_pointer(2)
    );
\result_peak[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^sample_data__0\(0),
      I1 => CO(0),
      I2 => Q(0),
      O => D(0)
    );
\result_peak[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^b\(9),
      I1 => CO(0),
      I2 => Q(10),
      O => D(10)
    );
\result_peak[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => sample_magnitude0(11),
      I1 => sample_data(15),
      I2 => sample_data(11),
      I3 => CO(0),
      I4 => Q(11),
      O => D(11)
    );
\result_peak[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^b\(11),
      I1 => CO(0),
      I2 => Q(12),
      O => D(12)
    );
\result_peak[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => sample_magnitude0(13),
      I1 => sample_data(15),
      I2 => sample_data(13),
      I3 => CO(0),
      I4 => Q(13),
      O => D(13)
    );
\result_peak[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => sample_magnitude0(14),
      I1 => sample_data(15),
      I2 => sample_data(14),
      I3 => CO(0),
      I4 => Q(14),
      O => D(14)
    );
\result_peak[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555400000000"
    )
        port map (
      I0 => result_valid,
      I1 => level_reg(3),
      I2 => level_reg(0),
      I3 => level_reg(2),
      I4 => level_reg(1),
      I5 => \last_sample__3\,
      O => \^e\(0)
    );
\result_peak[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => sample_data(15),
      I1 => sample_magnitude0(15),
      I2 => CO(0),
      I3 => Q(15),
      O => D(15)
    );
\result_peak[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => sample_magnitude0(1),
      I1 => sample_data(15),
      I2 => sample_data(1),
      I3 => CO(0),
      I4 => Q(1),
      O => D(1)
    );
\result_peak[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^b\(1),
      I1 => CO(0),
      I2 => Q(2),
      O => D(2)
    );
\result_peak[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => sample_magnitude0(3),
      I1 => sample_data(15),
      I2 => sample_data(3),
      I3 => CO(0),
      I4 => Q(3),
      O => D(3)
    );
\result_peak[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^b\(3),
      I1 => CO(0),
      I2 => Q(4),
      O => D(4)
    );
\result_peak[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => sample_magnitude0(5),
      I1 => sample_data(15),
      I2 => sample_data(5),
      I3 => CO(0),
      I4 => Q(5),
      O => D(5)
    );
\result_peak[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^b\(5),
      I1 => CO(0),
      I2 => Q(6),
      O => D(6)
    );
\result_peak[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => sample_magnitude0(7),
      I1 => sample_data(15),
      I2 => sample_data(7),
      I3 => CO(0),
      I4 => Q(7),
      O => D(7)
    );
\result_peak[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^b\(7),
      I1 => CO(0),
      I2 => Q(8),
      O => D(8)
    );
\result_peak[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => sample_magnitude0(9),
      I1 => sample_data(15),
      I2 => sample_data(9),
      I3 => CO(0),
      I4 => Q(9),
      O => D(9)
    );
result_valid_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^e\(0),
      I1 => s_axi_aresetn,
      I2 => result_valid,
      O => s_axi_aresetn_0
    );
sample_square_full_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sample_data(15),
      I1 => sample_magnitude0(15),
      O => \^b\(14)
    );
sample_square_full_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(6),
      I1 => sample_data(15),
      I2 => sample_data(6),
      O => \^b\(5)
    );
sample_square_full_i_11: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(5),
      I1 => sample_data(15),
      I2 => sample_data(5),
      O => \^b\(4)
    );
sample_square_full_i_12: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(4),
      I1 => sample_data(15),
      I2 => sample_data(4),
      O => \^b\(3)
    );
sample_square_full_i_13: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(3),
      I1 => sample_data(15),
      I2 => sample_data(3),
      O => \^b\(2)
    );
sample_square_full_i_14: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(2),
      I1 => sample_data(15),
      I2 => sample_data(2),
      O => \^b\(1)
    );
sample_square_full_i_15: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(1),
      I1 => sample_data(15),
      I2 => sample_data(1),
      O => \^b\(0)
    );
sample_square_full_i_16: unisim.vcomponents.MUXF7
     port map (
      I0 => sample_square_full_i_23_n_0,
      I1 => sample_square_full_i_24_n_0,
      O => \^sample_data__0\(0),
      S => read_pointer(2)
    );
sample_square_full_i_17: unisim.vcomponents.MUXF7
     port map (
      I0 => sample_square_full_i_25_n_0,
      I1 => sample_square_full_i_26_n_0,
      O => sample_data(12),
      S => read_pointer(2)
    );
sample_square_full_i_18: unisim.vcomponents.MUXF7
     port map (
      I0 => sample_square_full_i_27_n_0,
      I1 => sample_square_full_i_28_n_0,
      O => sample_data(10),
      S => read_pointer(2)
    );
sample_square_full_i_19: unisim.vcomponents.MUXF7
     port map (
      I0 => sample_square_full_i_29_n_0,
      I1 => sample_square_full_i_30_n_0,
      O => sample_data(8),
      S => read_pointer(2)
    );
sample_square_full_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(14),
      I1 => sample_data(15),
      I2 => sample_data(14),
      O => \^b\(13)
    );
sample_square_full_i_20: unisim.vcomponents.MUXF7
     port map (
      I0 => sample_square_full_i_31_n_0,
      I1 => sample_square_full_i_32_n_0,
      O => sample_data(6),
      S => read_pointer(2)
    );
sample_square_full_i_21: unisim.vcomponents.MUXF7
     port map (
      I0 => sample_square_full_i_33_n_0,
      I1 => sample_square_full_i_34_n_0,
      O => sample_data(4),
      S => read_pointer(2)
    );
sample_square_full_i_22: unisim.vcomponents.MUXF7
     port map (
      I0 => sample_square_full_i_35_n_0,
      I1 => sample_square_full_i_36_n_0,
      O => sample_data(2),
      S => read_pointer(2)
    );
sample_square_full_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(32),
      I1 => \frame_memory_reg[3]\(32),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(32),
      I5 => \frame_memory_reg[2]\(32),
      O => sample_square_full_i_23_n_0
    );
sample_square_full_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(32),
      I1 => \frame_memory_reg[7]\(32),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(32),
      I5 => \frame_memory_reg[6]\(32),
      O => sample_square_full_i_24_n_0
    );
sample_square_full_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(44),
      I1 => \frame_memory_reg[3]\(44),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(44),
      I5 => \frame_memory_reg[2]\(44),
      O => sample_square_full_i_25_n_0
    );
sample_square_full_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(44),
      I1 => \frame_memory_reg[7]\(44),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(44),
      I5 => \frame_memory_reg[6]\(44),
      O => sample_square_full_i_26_n_0
    );
sample_square_full_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(42),
      I1 => \frame_memory_reg[3]\(42),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(42),
      I5 => \frame_memory_reg[2]\(42),
      O => sample_square_full_i_27_n_0
    );
sample_square_full_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(42),
      I1 => \frame_memory_reg[7]\(42),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(42),
      I5 => \frame_memory_reg[6]\(42),
      O => sample_square_full_i_28_n_0
    );
sample_square_full_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(40),
      I1 => \frame_memory_reg[3]\(40),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(40),
      I5 => \frame_memory_reg[2]\(40),
      O => sample_square_full_i_29_n_0
    );
sample_square_full_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(13),
      I1 => sample_data(15),
      I2 => sample_data(13),
      O => \^b\(12)
    );
sample_square_full_i_30: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(40),
      I1 => \frame_memory_reg[7]\(40),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(40),
      I5 => \frame_memory_reg[6]\(40),
      O => sample_square_full_i_30_n_0
    );
sample_square_full_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(38),
      I1 => \frame_memory_reg[3]\(38),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(38),
      I5 => \frame_memory_reg[2]\(38),
      O => sample_square_full_i_31_n_0
    );
sample_square_full_i_32: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(38),
      I1 => \frame_memory_reg[7]\(38),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(38),
      I5 => \frame_memory_reg[6]\(38),
      O => sample_square_full_i_32_n_0
    );
sample_square_full_i_33: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(36),
      I1 => \frame_memory_reg[3]\(36),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(36),
      I5 => \frame_memory_reg[2]\(36),
      O => sample_square_full_i_33_n_0
    );
sample_square_full_i_34: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(36),
      I1 => \frame_memory_reg[7]\(36),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(36),
      I5 => \frame_memory_reg[6]\(36),
      O => sample_square_full_i_34_n_0
    );
sample_square_full_i_35: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[1]\(34),
      I1 => \frame_memory_reg[3]\(34),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[0]\(34),
      I5 => \frame_memory_reg[2]\(34),
      O => sample_square_full_i_35_n_0
    );
sample_square_full_i_36: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \frame_memory_reg[5]\(34),
      I1 => \frame_memory_reg[7]\(34),
      I2 => read_pointer(0),
      I3 => read_pointer(1),
      I4 => \frame_memory_reg[4]\(34),
      I5 => \frame_memory_reg[6]\(34),
      O => sample_square_full_i_36_n_0
    );
sample_square_full_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(12),
      I1 => sample_data(15),
      I2 => sample_data(12),
      O => \^b\(11)
    );
sample_square_full_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(11),
      I1 => sample_data(15),
      I2 => sample_data(11),
      O => \^b\(10)
    );
sample_square_full_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(10),
      I1 => sample_data(15),
      I2 => sample_data(10),
      O => \^b\(9)
    );
sample_square_full_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(9),
      I1 => sample_data(15),
      I2 => sample_data(9),
      O => \^b\(8)
    );
sample_square_full_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(8),
      I1 => sample_data(15),
      I2 => sample_data(8),
      O => \^b\(7)
    );
sample_square_full_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_magnitude0(7),
      I1 => sample_data(15),
      I2 => sample_data(7),
      O => \^b\(6)
    );
sensor_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => level_reg(3),
      I1 => level_reg(1),
      I2 => level_reg(2),
      I3 => level_reg(0),
      O => xyz_ready
    );
\write_pointer[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_0_in(1),
      I1 => write_pointer(0),
      O => \write_pointer[0]_i_1_n_0\
    );
\write_pointer[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => write_pointer(0),
      I1 => p_0_in(1),
      I2 => write_pointer(1),
      O => \write_pointer[1]_i_1_n_0\
    );
\write_pointer[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => write_pointer(0),
      I1 => write_pointer(1),
      I2 => p_0_in(1),
      I3 => write_pointer(2),
      O => \write_pointer[2]_i_1_n_0\
    );
\write_pointer[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => xyz_valid,
      I1 => level_reg(0),
      I2 => level_reg(2),
      I3 => level_reg(1),
      I4 => level_reg(3),
      O => p_0_in(1)
    );
\write_pointer_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \level_reg[3]_0\,
      D => \write_pointer[0]_i_1_n_0\,
      Q => write_pointer(0)
    );
\write_pointer_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \level_reg[3]_0\,
      D => \write_pointer[1]_i_1_n_0\,
      Q => write_pointer(1)
    );
\write_pointer_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \level_reg[3]_0\,
      D => \write_pointer[2]_i_1_n_0\,
      Q => write_pointer(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0_vibration_window_features is
  port (
    result_sample_count : out STD_LOGIC_VECTOR ( 0 to 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    result_valid : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \last_sample__3\ : out STD_LOGIC;
    snapshot_seq0 : out STD_LOGIC;
    \result_peak_reg[15]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \result_sum_squares_reg[34]_0\ : out STD_LOGIC_VECTOR ( 34 downto 0 );
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    \sum_squares_accumulator_reg[0]_0\ : in STD_LOGIC;
    \peak_accumulator_reg[15]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \next_peak1_carry__0_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \next_peak1_carry__0_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    result_valid_reg_0 : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \result_peak_reg[15]_1\ : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_lis3dh_vibration_axi_0_0_vibration_window_features : entity is "vibration_window_features";
end design_1_lis3dh_vibration_axi_0_0_vibration_window_features;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0_vibration_window_features is
  signal \^co\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^last_sample__3\ : STD_LOGIC;
  signal \next_peak1_carry__0_n_1\ : STD_LOGIC;
  signal \next_peak1_carry__0_n_2\ : STD_LOGIC;
  signal \next_peak1_carry__0_n_3\ : STD_LOGIC;
  signal next_peak1_carry_n_0 : STD_LOGIC;
  signal next_peak1_carry_n_1 : STD_LOGIC;
  signal next_peak1_carry_n_2 : STD_LOGIC;
  signal next_peak1_carry_n_3 : STD_LOGIC;
  signal next_sum_squares : STD_LOGIC_VECTOR ( 34 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \peak_accumulator[0]_i_1_n_0\ : STD_LOGIC;
  signal \peak_accumulator[10]_i_1_n_0\ : STD_LOGIC;
  signal \peak_accumulator[12]_i_1_n_0\ : STD_LOGIC;
  signal \peak_accumulator[2]_i_1_n_0\ : STD_LOGIC;
  signal \peak_accumulator[4]_i_1_n_0\ : STD_LOGIC;
  signal \peak_accumulator[6]_i_1_n_0\ : STD_LOGIC;
  signal \peak_accumulator[8]_i_1_n_0\ : STD_LOGIC;
  signal \result_sum_squares[11]_i_2_n_0\ : STD_LOGIC;
  signal \result_sum_squares[11]_i_3_n_0\ : STD_LOGIC;
  signal \result_sum_squares[11]_i_4_n_0\ : STD_LOGIC;
  signal \result_sum_squares[11]_i_5_n_0\ : STD_LOGIC;
  signal \result_sum_squares[15]_i_2_n_0\ : STD_LOGIC;
  signal \result_sum_squares[15]_i_3_n_0\ : STD_LOGIC;
  signal \result_sum_squares[15]_i_4_n_0\ : STD_LOGIC;
  signal \result_sum_squares[15]_i_5_n_0\ : STD_LOGIC;
  signal \result_sum_squares[19]_i_2_n_0\ : STD_LOGIC;
  signal \result_sum_squares[19]_i_3_n_0\ : STD_LOGIC;
  signal \result_sum_squares[19]_i_4_n_0\ : STD_LOGIC;
  signal \result_sum_squares[19]_i_5_n_0\ : STD_LOGIC;
  signal \result_sum_squares[23]_i_2_n_0\ : STD_LOGIC;
  signal \result_sum_squares[23]_i_3_n_0\ : STD_LOGIC;
  signal \result_sum_squares[23]_i_4_n_0\ : STD_LOGIC;
  signal \result_sum_squares[23]_i_5_n_0\ : STD_LOGIC;
  signal \result_sum_squares[27]_i_2_n_0\ : STD_LOGIC;
  signal \result_sum_squares[27]_i_3_n_0\ : STD_LOGIC;
  signal \result_sum_squares[27]_i_4_n_0\ : STD_LOGIC;
  signal \result_sum_squares[27]_i_5_n_0\ : STD_LOGIC;
  signal \result_sum_squares[31]_i_2_n_0\ : STD_LOGIC;
  signal \result_sum_squares[31]_i_3_n_0\ : STD_LOGIC;
  signal \result_sum_squares[31]_i_4_n_0\ : STD_LOGIC;
  signal \result_sum_squares[3]_i_2_n_0\ : STD_LOGIC;
  signal \result_sum_squares[3]_i_3_n_0\ : STD_LOGIC;
  signal \result_sum_squares[3]_i_4_n_0\ : STD_LOGIC;
  signal \result_sum_squares[3]_i_5_n_0\ : STD_LOGIC;
  signal \result_sum_squares[7]_i_2_n_0\ : STD_LOGIC;
  signal \result_sum_squares[7]_i_3_n_0\ : STD_LOGIC;
  signal \result_sum_squares[7]_i_4_n_0\ : STD_LOGIC;
  signal \result_sum_squares[7]_i_5_n_0\ : STD_LOGIC;
  signal \result_sum_squares_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \result_sum_squares_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \result_sum_squares_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \result_sum_squares_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \result_sum_squares_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \result_sum_squares_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \result_sum_squares_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \result_sum_squares_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \result_sum_squares_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \result_sum_squares_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \result_sum_squares_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \result_sum_squares_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \result_sum_squares_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \result_sum_squares_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \result_sum_squares_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \result_sum_squares_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \result_sum_squares_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \result_sum_squares_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \result_sum_squares_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \result_sum_squares_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \result_sum_squares_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \result_sum_squares_reg[31]_i_1_n_1\ : STD_LOGIC;
  signal \result_sum_squares_reg[31]_i_1_n_2\ : STD_LOGIC;
  signal \result_sum_squares_reg[31]_i_1_n_3\ : STD_LOGIC;
  signal \result_sum_squares_reg[34]_i_1_n_2\ : STD_LOGIC;
  signal \result_sum_squares_reg[34]_i_1_n_3\ : STD_LOGIC;
  signal \result_sum_squares_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \result_sum_squares_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \result_sum_squares_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \result_sum_squares_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \result_sum_squares_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \result_sum_squares_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \result_sum_squares_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \result_sum_squares_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \^result_valid\ : STD_LOGIC;
  signal sample_count_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^sample_square_full\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal sample_square_full_n_74 : STD_LOGIC;
  signal \sum_squares_accumulator[0]_i_2_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[0]_i_3_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[0]_i_4_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[0]_i_5_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[0]_i_6_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[0]_i_7_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[0]_i_8_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[0]_i_9_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[12]_i_2_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[12]_i_3_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[12]_i_4_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[12]_i_5_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[12]_i_6_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[12]_i_7_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[12]_i_8_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[12]_i_9_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[16]_i_2_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[16]_i_3_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[16]_i_4_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[16]_i_5_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[16]_i_6_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[16]_i_7_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[16]_i_8_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[16]_i_9_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[20]_i_2_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[20]_i_3_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[20]_i_4_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[20]_i_5_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[20]_i_6_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[20]_i_7_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[20]_i_8_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[20]_i_9_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[24]_i_2_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[24]_i_3_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[24]_i_4_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[24]_i_5_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[24]_i_6_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[24]_i_7_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[24]_i_8_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[24]_i_9_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[28]_i_2_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[28]_i_3_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[28]_i_4_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[28]_i_5_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[28]_i_6_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[28]_i_7_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[28]_i_8_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[32]_i_2_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[32]_i_3_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[32]_i_4_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[4]_i_2_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[4]_i_3_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[4]_i_4_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[4]_i_5_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[4]_i_6_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[4]_i_7_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[4]_i_8_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[4]_i_9_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[8]_i_2_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[8]_i_3_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[8]_i_4_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[8]_i_5_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[8]_i_6_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[8]_i_7_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[8]_i_8_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator[8]_i_9_n_0\ : STD_LOGIC;
  signal sum_squares_accumulator_reg : STD_LOGIC_VECTOR ( 34 downto 0 );
  signal \sum_squares_accumulator_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[32]_i_1_n_2\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[32]_i_1_n_3\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[32]_i_1_n_5\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[32]_i_1_n_6\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[32]_i_1_n_7\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \sum_squares_accumulator_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal NLW_next_peak1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_next_peak1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_result_sum_squares_reg[34]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_result_sum_squares_reg[34]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_sample_square_full_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_sample_square_full_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_sample_square_full_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_sample_square_full_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_sample_square_full_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_sample_square_full_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_sample_square_full_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_sample_square_full_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_sample_square_full_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_sample_square_full_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal NLW_sample_square_full_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_sum_squares_accumulator_reg[32]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_sum_squares_accumulator_reg[32]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of next_peak1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \next_peak1_carry__0\ : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \result_sum_squares_reg[11]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \result_sum_squares_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \result_sum_squares_reg[19]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \result_sum_squares_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \result_sum_squares_reg[27]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \result_sum_squares_reg[31]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \result_sum_squares_reg[34]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \result_sum_squares_reg[3]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \result_sum_squares_reg[7]_i_1\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \sample_count[1]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \sample_count[2]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \sample_count[3]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \sample_count[4]_i_1\ : label is "soft_lutpair91";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of sample_square_full : label is "{SYNTH-13 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \sum_squares_accumulator_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \sum_squares_accumulator_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \sum_squares_accumulator_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \sum_squares_accumulator_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \sum_squares_accumulator_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \sum_squares_accumulator_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \sum_squares_accumulator_reg[32]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \sum_squares_accumulator_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \sum_squares_accumulator_reg[8]_i_1\ : label is 11;
begin
  CO(0) <= \^co\(0);
  Q(15 downto 0) <= \^q\(15 downto 0);
  \last_sample__3\ <= \^last_sample__3\;
  result_valid <= \^result_valid\;
next_peak1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => next_peak1_carry_n_0,
      CO(2) => next_peak1_carry_n_1,
      CO(1) => next_peak1_carry_n_2,
      CO(0) => next_peak1_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => \next_peak1_carry__0_0\(3 downto 0),
      O(3 downto 0) => NLW_next_peak1_carry_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => \next_peak1_carry__0_1\(3 downto 0)
    );
\next_peak1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => next_peak1_carry_n_0,
      CO(3) => \^co\(0),
      CO(2) => \next_peak1_carry__0_n_1\,
      CO(1) => \next_peak1_carry__0_n_2\,
      CO(0) => \next_peak1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => DI(3 downto 0),
      O(3 downto 0) => \NLW_next_peak1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => S(3 downto 0)
    );
\peak_accumulator[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^co\(0),
      I2 => A(0),
      I3 => \^last_sample__3\,
      O => \peak_accumulator[0]_i_1_n_0\
    );
\peak_accumulator[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \^q\(10),
      I1 => \^co\(0),
      I2 => A(10),
      I3 => \^last_sample__3\,
      O => \peak_accumulator[10]_i_1_n_0\
    );
\peak_accumulator[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \^q\(12),
      I1 => \^co\(0),
      I2 => A(12),
      I3 => \^last_sample__3\,
      O => \peak_accumulator[12]_i_1_n_0\
    );
\peak_accumulator[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => sample_count_reg(0),
      I1 => sample_count_reg(1),
      I2 => sample_count_reg(2),
      I3 => sample_count_reg(4),
      I4 => sample_count_reg(3),
      O => \^last_sample__3\
    );
\peak_accumulator[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^co\(0),
      I2 => A(2),
      I3 => \^last_sample__3\,
      O => \peak_accumulator[2]_i_1_n_0\
    );
\peak_accumulator[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^co\(0),
      I2 => A(4),
      I3 => \^last_sample__3\,
      O => \peak_accumulator[4]_i_1_n_0\
    );
\peak_accumulator[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^co\(0),
      I2 => A(6),
      I3 => \^last_sample__3\,
      O => \peak_accumulator[6]_i_1_n_0\
    );
\peak_accumulator[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \^q\(8),
      I1 => \^co\(0),
      I2 => A(8),
      I3 => \^last_sample__3\,
      O => \peak_accumulator[8]_i_1_n_0\
    );
\peak_accumulator_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \peak_accumulator[0]_i_1_n_0\,
      Q => \^q\(0)
    );
\peak_accumulator_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \peak_accumulator[10]_i_1_n_0\,
      Q => \^q\(10)
    );
\peak_accumulator_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => D(5),
      Q => \^q\(11)
    );
\peak_accumulator_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \peak_accumulator[12]_i_1_n_0\,
      Q => \^q\(12)
    );
\peak_accumulator_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => D(6),
      Q => \^q\(13)
    );
\peak_accumulator_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => D(7),
      Q => \^q\(14)
    );
\peak_accumulator_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => D(8),
      Q => \^q\(15)
    );
\peak_accumulator_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => D(0),
      Q => \^q\(1)
    );
\peak_accumulator_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \peak_accumulator[2]_i_1_n_0\,
      Q => \^q\(2)
    );
\peak_accumulator_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => D(1),
      Q => \^q\(3)
    );
\peak_accumulator_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \peak_accumulator[4]_i_1_n_0\,
      Q => \^q\(4)
    );
\peak_accumulator_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => D(2),
      Q => \^q\(5)
    );
\peak_accumulator_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \peak_accumulator[6]_i_1_n_0\,
      Q => \^q\(6)
    );
\peak_accumulator_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => D(3),
      Q => \^q\(7)
    );
\peak_accumulator_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \peak_accumulator[8]_i_1_n_0\,
      Q => \^q\(8)
    );
\peak_accumulator_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => D(4),
      Q => \^q\(9)
    );
\result_peak_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(0),
      Q => \result_peak_reg[15]_0\(0)
    );
\result_peak_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(10),
      Q => \result_peak_reg[15]_0\(10)
    );
\result_peak_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(11),
      Q => \result_peak_reg[15]_0\(11)
    );
\result_peak_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(12),
      Q => \result_peak_reg[15]_0\(12)
    );
\result_peak_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(13),
      Q => \result_peak_reg[15]_0\(13)
    );
\result_peak_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(14),
      Q => \result_peak_reg[15]_0\(14)
    );
\result_peak_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(15),
      Q => \result_peak_reg[15]_0\(15)
    );
\result_peak_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(1),
      Q => \result_peak_reg[15]_0\(1)
    );
\result_peak_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(2),
      Q => \result_peak_reg[15]_0\(2)
    );
\result_peak_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(3),
      Q => \result_peak_reg[15]_0\(3)
    );
\result_peak_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(4),
      Q => \result_peak_reg[15]_0\(4)
    );
\result_peak_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(5),
      Q => \result_peak_reg[15]_0\(5)
    );
\result_peak_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(6),
      Q => \result_peak_reg[15]_0\(6)
    );
\result_peak_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(7),
      Q => \result_peak_reg[15]_0\(7)
    );
\result_peak_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(8),
      Q => \result_peak_reg[15]_0\(8)
    );
\result_peak_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \result_peak_reg[15]_1\(9),
      Q => \result_peak_reg[15]_0\(9)
    );
\result_sample_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => '1',
      Q => result_sample_count(0)
    );
\result_sum_squares[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(11),
      I1 => \^sample_square_full\(11),
      O => \result_sum_squares[11]_i_2_n_0\
    );
\result_sum_squares[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(10),
      I1 => \^sample_square_full\(10),
      O => \result_sum_squares[11]_i_3_n_0\
    );
\result_sum_squares[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(9),
      I1 => \^sample_square_full\(9),
      O => \result_sum_squares[11]_i_4_n_0\
    );
\result_sum_squares[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(8),
      I1 => \^sample_square_full\(8),
      O => \result_sum_squares[11]_i_5_n_0\
    );
\result_sum_squares[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(15),
      I1 => \^sample_square_full\(15),
      O => \result_sum_squares[15]_i_2_n_0\
    );
\result_sum_squares[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(14),
      I1 => \^sample_square_full\(14),
      O => \result_sum_squares[15]_i_3_n_0\
    );
\result_sum_squares[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(13),
      I1 => \^sample_square_full\(13),
      O => \result_sum_squares[15]_i_4_n_0\
    );
\result_sum_squares[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(12),
      I1 => \^sample_square_full\(12),
      O => \result_sum_squares[15]_i_5_n_0\
    );
\result_sum_squares[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(19),
      I1 => \^sample_square_full\(19),
      O => \result_sum_squares[19]_i_2_n_0\
    );
\result_sum_squares[19]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(18),
      I1 => \^sample_square_full\(18),
      O => \result_sum_squares[19]_i_3_n_0\
    );
\result_sum_squares[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(17),
      I1 => \^sample_square_full\(17),
      O => \result_sum_squares[19]_i_4_n_0\
    );
\result_sum_squares[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(16),
      I1 => \^sample_square_full\(16),
      O => \result_sum_squares[19]_i_5_n_0\
    );
\result_sum_squares[23]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(23),
      I1 => \^sample_square_full\(23),
      O => \result_sum_squares[23]_i_2_n_0\
    );
\result_sum_squares[23]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(22),
      I1 => \^sample_square_full\(22),
      O => \result_sum_squares[23]_i_3_n_0\
    );
\result_sum_squares[23]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(21),
      I1 => \^sample_square_full\(21),
      O => \result_sum_squares[23]_i_4_n_0\
    );
\result_sum_squares[23]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(20),
      I1 => \^sample_square_full\(20),
      O => \result_sum_squares[23]_i_5_n_0\
    );
\result_sum_squares[27]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(27),
      I1 => \^sample_square_full\(27),
      O => \result_sum_squares[27]_i_2_n_0\
    );
\result_sum_squares[27]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(26),
      I1 => \^sample_square_full\(26),
      O => \result_sum_squares[27]_i_3_n_0\
    );
\result_sum_squares[27]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(25),
      I1 => \^sample_square_full\(25),
      O => \result_sum_squares[27]_i_4_n_0\
    );
\result_sum_squares[27]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(24),
      I1 => \^sample_square_full\(24),
      O => \result_sum_squares[27]_i_5_n_0\
    );
\result_sum_squares[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(30),
      I1 => \^sample_square_full\(30),
      O => \result_sum_squares[31]_i_2_n_0\
    );
\result_sum_squares[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(29),
      I1 => \^sample_square_full\(29),
      O => \result_sum_squares[31]_i_3_n_0\
    );
\result_sum_squares[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(28),
      I1 => \^sample_square_full\(28),
      O => \result_sum_squares[31]_i_4_n_0\
    );
\result_sum_squares[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(3),
      I1 => \^sample_square_full\(3),
      O => \result_sum_squares[3]_i_2_n_0\
    );
\result_sum_squares[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(2),
      I1 => \^sample_square_full\(2),
      O => \result_sum_squares[3]_i_3_n_0\
    );
\result_sum_squares[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(1),
      I1 => \^sample_square_full\(1),
      O => \result_sum_squares[3]_i_4_n_0\
    );
\result_sum_squares[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(0),
      I1 => \^sample_square_full\(0),
      O => \result_sum_squares[3]_i_5_n_0\
    );
\result_sum_squares[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(7),
      I1 => \^sample_square_full\(7),
      O => \result_sum_squares[7]_i_2_n_0\
    );
\result_sum_squares[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(6),
      I1 => \^sample_square_full\(6),
      O => \result_sum_squares[7]_i_3_n_0\
    );
\result_sum_squares[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(5),
      I1 => \^sample_square_full\(5),
      O => \result_sum_squares[7]_i_4_n_0\
    );
\result_sum_squares[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sum_squares_accumulator_reg(4),
      I1 => \^sample_square_full\(4),
      O => \result_sum_squares[7]_i_5_n_0\
    );
\result_sum_squares_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(0),
      Q => \result_sum_squares_reg[34]_0\(0)
    );
\result_sum_squares_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(10),
      Q => \result_sum_squares_reg[34]_0\(10)
    );
\result_sum_squares_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(11),
      Q => \result_sum_squares_reg[34]_0\(11)
    );
\result_sum_squares_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \result_sum_squares_reg[7]_i_1_n_0\,
      CO(3) => \result_sum_squares_reg[11]_i_1_n_0\,
      CO(2) => \result_sum_squares_reg[11]_i_1_n_1\,
      CO(1) => \result_sum_squares_reg[11]_i_1_n_2\,
      CO(0) => \result_sum_squares_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => sum_squares_accumulator_reg(11 downto 8),
      O(3 downto 0) => next_sum_squares(11 downto 8),
      S(3) => \result_sum_squares[11]_i_2_n_0\,
      S(2) => \result_sum_squares[11]_i_3_n_0\,
      S(1) => \result_sum_squares[11]_i_4_n_0\,
      S(0) => \result_sum_squares[11]_i_5_n_0\
    );
\result_sum_squares_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(12),
      Q => \result_sum_squares_reg[34]_0\(12)
    );
\result_sum_squares_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(13),
      Q => \result_sum_squares_reg[34]_0\(13)
    );
\result_sum_squares_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(14),
      Q => \result_sum_squares_reg[34]_0\(14)
    );
\result_sum_squares_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(15),
      Q => \result_sum_squares_reg[34]_0\(15)
    );
\result_sum_squares_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \result_sum_squares_reg[11]_i_1_n_0\,
      CO(3) => \result_sum_squares_reg[15]_i_1_n_0\,
      CO(2) => \result_sum_squares_reg[15]_i_1_n_1\,
      CO(1) => \result_sum_squares_reg[15]_i_1_n_2\,
      CO(0) => \result_sum_squares_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => sum_squares_accumulator_reg(15 downto 12),
      O(3 downto 0) => next_sum_squares(15 downto 12),
      S(3) => \result_sum_squares[15]_i_2_n_0\,
      S(2) => \result_sum_squares[15]_i_3_n_0\,
      S(1) => \result_sum_squares[15]_i_4_n_0\,
      S(0) => \result_sum_squares[15]_i_5_n_0\
    );
\result_sum_squares_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(16),
      Q => \result_sum_squares_reg[34]_0\(16)
    );
\result_sum_squares_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(17),
      Q => \result_sum_squares_reg[34]_0\(17)
    );
\result_sum_squares_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(18),
      Q => \result_sum_squares_reg[34]_0\(18)
    );
\result_sum_squares_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(19),
      Q => \result_sum_squares_reg[34]_0\(19)
    );
\result_sum_squares_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \result_sum_squares_reg[15]_i_1_n_0\,
      CO(3) => \result_sum_squares_reg[19]_i_1_n_0\,
      CO(2) => \result_sum_squares_reg[19]_i_1_n_1\,
      CO(1) => \result_sum_squares_reg[19]_i_1_n_2\,
      CO(0) => \result_sum_squares_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => sum_squares_accumulator_reg(19 downto 16),
      O(3 downto 0) => next_sum_squares(19 downto 16),
      S(3) => \result_sum_squares[19]_i_2_n_0\,
      S(2) => \result_sum_squares[19]_i_3_n_0\,
      S(1) => \result_sum_squares[19]_i_4_n_0\,
      S(0) => \result_sum_squares[19]_i_5_n_0\
    );
\result_sum_squares_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(1),
      Q => \result_sum_squares_reg[34]_0\(1)
    );
\result_sum_squares_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(20),
      Q => \result_sum_squares_reg[34]_0\(20)
    );
\result_sum_squares_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(21),
      Q => \result_sum_squares_reg[34]_0\(21)
    );
\result_sum_squares_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(22),
      Q => \result_sum_squares_reg[34]_0\(22)
    );
\result_sum_squares_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(23),
      Q => \result_sum_squares_reg[34]_0\(23)
    );
\result_sum_squares_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \result_sum_squares_reg[19]_i_1_n_0\,
      CO(3) => \result_sum_squares_reg[23]_i_1_n_0\,
      CO(2) => \result_sum_squares_reg[23]_i_1_n_1\,
      CO(1) => \result_sum_squares_reg[23]_i_1_n_2\,
      CO(0) => \result_sum_squares_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => sum_squares_accumulator_reg(23 downto 20),
      O(3 downto 0) => next_sum_squares(23 downto 20),
      S(3) => \result_sum_squares[23]_i_2_n_0\,
      S(2) => \result_sum_squares[23]_i_3_n_0\,
      S(1) => \result_sum_squares[23]_i_4_n_0\,
      S(0) => \result_sum_squares[23]_i_5_n_0\
    );
\result_sum_squares_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(24),
      Q => \result_sum_squares_reg[34]_0\(24)
    );
\result_sum_squares_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(25),
      Q => \result_sum_squares_reg[34]_0\(25)
    );
\result_sum_squares_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(26),
      Q => \result_sum_squares_reg[34]_0\(26)
    );
\result_sum_squares_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(27),
      Q => \result_sum_squares_reg[34]_0\(27)
    );
\result_sum_squares_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \result_sum_squares_reg[23]_i_1_n_0\,
      CO(3) => \result_sum_squares_reg[27]_i_1_n_0\,
      CO(2) => \result_sum_squares_reg[27]_i_1_n_1\,
      CO(1) => \result_sum_squares_reg[27]_i_1_n_2\,
      CO(0) => \result_sum_squares_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => sum_squares_accumulator_reg(27 downto 24),
      O(3 downto 0) => next_sum_squares(27 downto 24),
      S(3) => \result_sum_squares[27]_i_2_n_0\,
      S(2) => \result_sum_squares[27]_i_3_n_0\,
      S(1) => \result_sum_squares[27]_i_4_n_0\,
      S(0) => \result_sum_squares[27]_i_5_n_0\
    );
\result_sum_squares_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(28),
      Q => \result_sum_squares_reg[34]_0\(28)
    );
\result_sum_squares_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(29),
      Q => \result_sum_squares_reg[34]_0\(29)
    );
\result_sum_squares_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(2),
      Q => \result_sum_squares_reg[34]_0\(2)
    );
\result_sum_squares_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(30),
      Q => \result_sum_squares_reg[34]_0\(30)
    );
\result_sum_squares_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(31),
      Q => \result_sum_squares_reg[34]_0\(31)
    );
\result_sum_squares_reg[31]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \result_sum_squares_reg[27]_i_1_n_0\,
      CO(3) => \result_sum_squares_reg[31]_i_1_n_0\,
      CO(2) => \result_sum_squares_reg[31]_i_1_n_1\,
      CO(1) => \result_sum_squares_reg[31]_i_1_n_2\,
      CO(0) => \result_sum_squares_reg[31]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => sum_squares_accumulator_reg(30 downto 28),
      O(3 downto 0) => next_sum_squares(31 downto 28),
      S(3) => sum_squares_accumulator_reg(31),
      S(2) => \result_sum_squares[31]_i_2_n_0\,
      S(1) => \result_sum_squares[31]_i_3_n_0\,
      S(0) => \result_sum_squares[31]_i_4_n_0\
    );
\result_sum_squares_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(32),
      Q => \result_sum_squares_reg[34]_0\(32)
    );
\result_sum_squares_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(33),
      Q => \result_sum_squares_reg[34]_0\(33)
    );
\result_sum_squares_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(34),
      Q => \result_sum_squares_reg[34]_0\(34)
    );
\result_sum_squares_reg[34]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \result_sum_squares_reg[31]_i_1_n_0\,
      CO(3 downto 2) => \NLW_result_sum_squares_reg[34]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \result_sum_squares_reg[34]_i_1_n_2\,
      CO(0) => \result_sum_squares_reg[34]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_result_sum_squares_reg[34]_i_1_O_UNCONNECTED\(3),
      O(2 downto 0) => next_sum_squares(34 downto 32),
      S(3) => '0',
      S(2 downto 0) => sum_squares_accumulator_reg(34 downto 32)
    );
\result_sum_squares_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(3),
      Q => \result_sum_squares_reg[34]_0\(3)
    );
\result_sum_squares_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \result_sum_squares_reg[3]_i_1_n_0\,
      CO(2) => \result_sum_squares_reg[3]_i_1_n_1\,
      CO(1) => \result_sum_squares_reg[3]_i_1_n_2\,
      CO(0) => \result_sum_squares_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => sum_squares_accumulator_reg(3 downto 0),
      O(3 downto 0) => next_sum_squares(3 downto 0),
      S(3) => \result_sum_squares[3]_i_2_n_0\,
      S(2) => \result_sum_squares[3]_i_3_n_0\,
      S(1) => \result_sum_squares[3]_i_4_n_0\,
      S(0) => \result_sum_squares[3]_i_5_n_0\
    );
\result_sum_squares_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(4),
      Q => \result_sum_squares_reg[34]_0\(4)
    );
\result_sum_squares_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(5),
      Q => \result_sum_squares_reg[34]_0\(5)
    );
\result_sum_squares_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(6),
      Q => \result_sum_squares_reg[34]_0\(6)
    );
\result_sum_squares_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(7),
      Q => \result_sum_squares_reg[34]_0\(7)
    );
\result_sum_squares_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \result_sum_squares_reg[3]_i_1_n_0\,
      CO(3) => \result_sum_squares_reg[7]_i_1_n_0\,
      CO(2) => \result_sum_squares_reg[7]_i_1_n_1\,
      CO(1) => \result_sum_squares_reg[7]_i_1_n_2\,
      CO(0) => \result_sum_squares_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => sum_squares_accumulator_reg(7 downto 4),
      O(3 downto 0) => next_sum_squares(7 downto 4),
      S(3) => \result_sum_squares[7]_i_2_n_0\,
      S(2) => \result_sum_squares[7]_i_3_n_0\,
      S(1) => \result_sum_squares[7]_i_4_n_0\,
      S(0) => \result_sum_squares[7]_i_5_n_0\
    );
\result_sum_squares_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(8),
      Q => \result_sum_squares_reg[34]_0\(8)
    );
\result_sum_squares_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => E(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => next_sum_squares(9),
      Q => \result_sum_squares_reg[34]_0\(9)
    );
result_valid_reg: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => '1',
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => result_valid_reg_0,
      Q => \^result_valid\
    );
\sample_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sample_count_reg(0),
      O => p_0_in(0)
    );
\sample_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sample_count_reg(0),
      I1 => sample_count_reg(1),
      O => p_0_in(1)
    );
\sample_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => sample_count_reg(0),
      I1 => sample_count_reg(1),
      I2 => sample_count_reg(2),
      O => p_0_in(2)
    );
\sample_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => sample_count_reg(0),
      I1 => sample_count_reg(1),
      I2 => sample_count_reg(2),
      I3 => sample_count_reg(3),
      O => p_0_in(3)
    );
\sample_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF0000"
    )
        port map (
      I0 => sample_count_reg(3),
      I1 => sample_count_reg(0),
      I2 => sample_count_reg(1),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(4),
      O => p_0_in(4)
    );
\sample_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => p_0_in(0),
      Q => sample_count_reg(0)
    );
\sample_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => p_0_in(1),
      Q => sample_count_reg(1)
    );
\sample_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => p_0_in(2),
      Q => sample_count_reg(2)
    );
\sample_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => p_0_in(3),
      Q => sample_count_reg(3)
    );
\sample_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => p_0_in(4),
      Q => sample_count_reg(4)
    );
sample_square_full: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 16) => B"00000000000000",
      A(15 downto 0) => A(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_sample_square_full_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 16) => B"00",
      B(15 downto 0) => A(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_sample_square_full_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_sample_square_full_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_sample_square_full_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => '0',
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_sample_square_full_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_sample_square_full_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_sample_square_full_P_UNCONNECTED(47 downto 32),
      P(31) => sample_square_full_n_74,
      P(30 downto 0) => \^sample_square_full\(30 downto 0),
      PATTERNBDETECT => NLW_sample_square_full_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_sample_square_full_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_sample_square_full_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_sample_square_full_UNDERFLOW_UNCONNECTED
    );
\snapshot_peak[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^result_valid\,
      I1 => s_axi_aresetn,
      O => snapshot_seq0
    );
\sum_squares_accumulator[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(3),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[0]_i_2_n_0\
    );
\sum_squares_accumulator[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(2),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[0]_i_3_n_0\
    );
\sum_squares_accumulator[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(1),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[0]_i_4_n_0\
    );
\sum_squares_accumulator[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(0),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[0]_i_5_n_0\
    );
\sum_squares_accumulator[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(3),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(3),
      O => \sum_squares_accumulator[0]_i_6_n_0\
    );
\sum_squares_accumulator[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(2),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(2),
      O => \sum_squares_accumulator[0]_i_7_n_0\
    );
\sum_squares_accumulator[0]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(1),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(1),
      O => \sum_squares_accumulator[0]_i_8_n_0\
    );
\sum_squares_accumulator[0]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(0),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(0),
      O => \sum_squares_accumulator[0]_i_9_n_0\
    );
\sum_squares_accumulator[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(15),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[12]_i_2_n_0\
    );
\sum_squares_accumulator[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(14),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[12]_i_3_n_0\
    );
\sum_squares_accumulator[12]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(13),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[12]_i_4_n_0\
    );
\sum_squares_accumulator[12]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(12),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[12]_i_5_n_0\
    );
\sum_squares_accumulator[12]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(15),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(15),
      O => \sum_squares_accumulator[12]_i_6_n_0\
    );
\sum_squares_accumulator[12]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(14),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(14),
      O => \sum_squares_accumulator[12]_i_7_n_0\
    );
\sum_squares_accumulator[12]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(13),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(13),
      O => \sum_squares_accumulator[12]_i_8_n_0\
    );
\sum_squares_accumulator[12]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(12),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(12),
      O => \sum_squares_accumulator[12]_i_9_n_0\
    );
\sum_squares_accumulator[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(19),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[16]_i_2_n_0\
    );
\sum_squares_accumulator[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(18),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[16]_i_3_n_0\
    );
\sum_squares_accumulator[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(17),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[16]_i_4_n_0\
    );
\sum_squares_accumulator[16]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(16),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[16]_i_5_n_0\
    );
\sum_squares_accumulator[16]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(19),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(19),
      O => \sum_squares_accumulator[16]_i_6_n_0\
    );
\sum_squares_accumulator[16]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(18),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(18),
      O => \sum_squares_accumulator[16]_i_7_n_0\
    );
\sum_squares_accumulator[16]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(17),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(17),
      O => \sum_squares_accumulator[16]_i_8_n_0\
    );
\sum_squares_accumulator[16]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(16),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(16),
      O => \sum_squares_accumulator[16]_i_9_n_0\
    );
\sum_squares_accumulator[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(23),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[20]_i_2_n_0\
    );
\sum_squares_accumulator[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(22),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[20]_i_3_n_0\
    );
\sum_squares_accumulator[20]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(21),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[20]_i_4_n_0\
    );
\sum_squares_accumulator[20]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(20),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[20]_i_5_n_0\
    );
\sum_squares_accumulator[20]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(23),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(23),
      O => \sum_squares_accumulator[20]_i_6_n_0\
    );
\sum_squares_accumulator[20]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(22),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(22),
      O => \sum_squares_accumulator[20]_i_7_n_0\
    );
\sum_squares_accumulator[20]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(21),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(21),
      O => \sum_squares_accumulator[20]_i_8_n_0\
    );
\sum_squares_accumulator[20]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(20),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(20),
      O => \sum_squares_accumulator[20]_i_9_n_0\
    );
\sum_squares_accumulator[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(27),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[24]_i_2_n_0\
    );
\sum_squares_accumulator[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(26),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[24]_i_3_n_0\
    );
\sum_squares_accumulator[24]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(25),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[24]_i_4_n_0\
    );
\sum_squares_accumulator[24]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(24),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[24]_i_5_n_0\
    );
\sum_squares_accumulator[24]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(27),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(27),
      O => \sum_squares_accumulator[24]_i_6_n_0\
    );
\sum_squares_accumulator[24]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(26),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(26),
      O => \sum_squares_accumulator[24]_i_7_n_0\
    );
\sum_squares_accumulator[24]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(25),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(25),
      O => \sum_squares_accumulator[24]_i_8_n_0\
    );
\sum_squares_accumulator[24]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(24),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(24),
      O => \sum_squares_accumulator[24]_i_9_n_0\
    );
\sum_squares_accumulator[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(30),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[28]_i_2_n_0\
    );
\sum_squares_accumulator[28]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(29),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[28]_i_3_n_0\
    );
\sum_squares_accumulator[28]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(28),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[28]_i_4_n_0\
    );
\sum_squares_accumulator[28]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => sum_squares_accumulator_reg(31),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[28]_i_5_n_0\
    );
\sum_squares_accumulator[28]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(30),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(30),
      O => \sum_squares_accumulator[28]_i_6_n_0\
    );
\sum_squares_accumulator[28]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(29),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(29),
      O => \sum_squares_accumulator[28]_i_7_n_0\
    );
\sum_squares_accumulator[28]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(28),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(28),
      O => \sum_squares_accumulator[28]_i_8_n_0\
    );
\sum_squares_accumulator[32]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => sum_squares_accumulator_reg(34),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[32]_i_2_n_0\
    );
\sum_squares_accumulator[32]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => sum_squares_accumulator_reg(33),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[32]_i_3_n_0\
    );
\sum_squares_accumulator[32]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => sum_squares_accumulator_reg(32),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[32]_i_4_n_0\
    );
\sum_squares_accumulator[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(7),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[4]_i_2_n_0\
    );
\sum_squares_accumulator[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(6),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[4]_i_3_n_0\
    );
\sum_squares_accumulator[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(5),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[4]_i_4_n_0\
    );
\sum_squares_accumulator[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(4),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[4]_i_5_n_0\
    );
\sum_squares_accumulator[4]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(7),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(7),
      O => \sum_squares_accumulator[4]_i_6_n_0\
    );
\sum_squares_accumulator[4]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(6),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(6),
      O => \sum_squares_accumulator[4]_i_7_n_0\
    );
\sum_squares_accumulator[4]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(5),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(5),
      O => \sum_squares_accumulator[4]_i_8_n_0\
    );
\sum_squares_accumulator[4]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(4),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(4),
      O => \sum_squares_accumulator[4]_i_9_n_0\
    );
\sum_squares_accumulator[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(11),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[8]_i_2_n_0\
    );
\sum_squares_accumulator[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(10),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[8]_i_3_n_0\
    );
\sum_squares_accumulator[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(9),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[8]_i_4_n_0\
    );
\sum_squares_accumulator[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^sample_square_full\(8),
      I1 => sample_count_reg(3),
      I2 => sample_count_reg(4),
      I3 => sample_count_reg(2),
      I4 => sample_count_reg(1),
      I5 => sample_count_reg(0),
      O => \sum_squares_accumulator[8]_i_5_n_0\
    );
\sum_squares_accumulator[8]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(11),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(11),
      O => \sum_squares_accumulator[8]_i_6_n_0\
    );
\sum_squares_accumulator[8]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(10),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(10),
      O => \sum_squares_accumulator[8]_i_7_n_0\
    );
\sum_squares_accumulator[8]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(9),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(9),
      O => \sum_squares_accumulator[8]_i_8_n_0\
    );
\sum_squares_accumulator[8]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => \^sample_square_full\(8),
      I1 => \^last_sample__3\,
      I2 => sum_squares_accumulator_reg(8),
      O => \sum_squares_accumulator[8]_i_9_n_0\
    );
\sum_squares_accumulator_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[0]_i_1_n_7\,
      Q => sum_squares_accumulator_reg(0)
    );
\sum_squares_accumulator_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \sum_squares_accumulator_reg[0]_i_1_n_0\,
      CO(2) => \sum_squares_accumulator_reg[0]_i_1_n_1\,
      CO(1) => \sum_squares_accumulator_reg[0]_i_1_n_2\,
      CO(0) => \sum_squares_accumulator_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \sum_squares_accumulator[0]_i_2_n_0\,
      DI(2) => \sum_squares_accumulator[0]_i_3_n_0\,
      DI(1) => \sum_squares_accumulator[0]_i_4_n_0\,
      DI(0) => \sum_squares_accumulator[0]_i_5_n_0\,
      O(3) => \sum_squares_accumulator_reg[0]_i_1_n_4\,
      O(2) => \sum_squares_accumulator_reg[0]_i_1_n_5\,
      O(1) => \sum_squares_accumulator_reg[0]_i_1_n_6\,
      O(0) => \sum_squares_accumulator_reg[0]_i_1_n_7\,
      S(3) => \sum_squares_accumulator[0]_i_6_n_0\,
      S(2) => \sum_squares_accumulator[0]_i_7_n_0\,
      S(1) => \sum_squares_accumulator[0]_i_8_n_0\,
      S(0) => \sum_squares_accumulator[0]_i_9_n_0\
    );
\sum_squares_accumulator_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[8]_i_1_n_5\,
      Q => sum_squares_accumulator_reg(10)
    );
\sum_squares_accumulator_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[8]_i_1_n_4\,
      Q => sum_squares_accumulator_reg(11)
    );
\sum_squares_accumulator_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[12]_i_1_n_7\,
      Q => sum_squares_accumulator_reg(12)
    );
\sum_squares_accumulator_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sum_squares_accumulator_reg[8]_i_1_n_0\,
      CO(3) => \sum_squares_accumulator_reg[12]_i_1_n_0\,
      CO(2) => \sum_squares_accumulator_reg[12]_i_1_n_1\,
      CO(1) => \sum_squares_accumulator_reg[12]_i_1_n_2\,
      CO(0) => \sum_squares_accumulator_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \sum_squares_accumulator[12]_i_2_n_0\,
      DI(2) => \sum_squares_accumulator[12]_i_3_n_0\,
      DI(1) => \sum_squares_accumulator[12]_i_4_n_0\,
      DI(0) => \sum_squares_accumulator[12]_i_5_n_0\,
      O(3) => \sum_squares_accumulator_reg[12]_i_1_n_4\,
      O(2) => \sum_squares_accumulator_reg[12]_i_1_n_5\,
      O(1) => \sum_squares_accumulator_reg[12]_i_1_n_6\,
      O(0) => \sum_squares_accumulator_reg[12]_i_1_n_7\,
      S(3) => \sum_squares_accumulator[12]_i_6_n_0\,
      S(2) => \sum_squares_accumulator[12]_i_7_n_0\,
      S(1) => \sum_squares_accumulator[12]_i_8_n_0\,
      S(0) => \sum_squares_accumulator[12]_i_9_n_0\
    );
\sum_squares_accumulator_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[12]_i_1_n_6\,
      Q => sum_squares_accumulator_reg(13)
    );
\sum_squares_accumulator_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[12]_i_1_n_5\,
      Q => sum_squares_accumulator_reg(14)
    );
\sum_squares_accumulator_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[12]_i_1_n_4\,
      Q => sum_squares_accumulator_reg(15)
    );
\sum_squares_accumulator_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[16]_i_1_n_7\,
      Q => sum_squares_accumulator_reg(16)
    );
\sum_squares_accumulator_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sum_squares_accumulator_reg[12]_i_1_n_0\,
      CO(3) => \sum_squares_accumulator_reg[16]_i_1_n_0\,
      CO(2) => \sum_squares_accumulator_reg[16]_i_1_n_1\,
      CO(1) => \sum_squares_accumulator_reg[16]_i_1_n_2\,
      CO(0) => \sum_squares_accumulator_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \sum_squares_accumulator[16]_i_2_n_0\,
      DI(2) => \sum_squares_accumulator[16]_i_3_n_0\,
      DI(1) => \sum_squares_accumulator[16]_i_4_n_0\,
      DI(0) => \sum_squares_accumulator[16]_i_5_n_0\,
      O(3) => \sum_squares_accumulator_reg[16]_i_1_n_4\,
      O(2) => \sum_squares_accumulator_reg[16]_i_1_n_5\,
      O(1) => \sum_squares_accumulator_reg[16]_i_1_n_6\,
      O(0) => \sum_squares_accumulator_reg[16]_i_1_n_7\,
      S(3) => \sum_squares_accumulator[16]_i_6_n_0\,
      S(2) => \sum_squares_accumulator[16]_i_7_n_0\,
      S(1) => \sum_squares_accumulator[16]_i_8_n_0\,
      S(0) => \sum_squares_accumulator[16]_i_9_n_0\
    );
\sum_squares_accumulator_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[16]_i_1_n_6\,
      Q => sum_squares_accumulator_reg(17)
    );
\sum_squares_accumulator_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[16]_i_1_n_5\,
      Q => sum_squares_accumulator_reg(18)
    );
\sum_squares_accumulator_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[16]_i_1_n_4\,
      Q => sum_squares_accumulator_reg(19)
    );
\sum_squares_accumulator_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[0]_i_1_n_6\,
      Q => sum_squares_accumulator_reg(1)
    );
\sum_squares_accumulator_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[20]_i_1_n_7\,
      Q => sum_squares_accumulator_reg(20)
    );
\sum_squares_accumulator_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sum_squares_accumulator_reg[16]_i_1_n_0\,
      CO(3) => \sum_squares_accumulator_reg[20]_i_1_n_0\,
      CO(2) => \sum_squares_accumulator_reg[20]_i_1_n_1\,
      CO(1) => \sum_squares_accumulator_reg[20]_i_1_n_2\,
      CO(0) => \sum_squares_accumulator_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \sum_squares_accumulator[20]_i_2_n_0\,
      DI(2) => \sum_squares_accumulator[20]_i_3_n_0\,
      DI(1) => \sum_squares_accumulator[20]_i_4_n_0\,
      DI(0) => \sum_squares_accumulator[20]_i_5_n_0\,
      O(3) => \sum_squares_accumulator_reg[20]_i_1_n_4\,
      O(2) => \sum_squares_accumulator_reg[20]_i_1_n_5\,
      O(1) => \sum_squares_accumulator_reg[20]_i_1_n_6\,
      O(0) => \sum_squares_accumulator_reg[20]_i_1_n_7\,
      S(3) => \sum_squares_accumulator[20]_i_6_n_0\,
      S(2) => \sum_squares_accumulator[20]_i_7_n_0\,
      S(1) => \sum_squares_accumulator[20]_i_8_n_0\,
      S(0) => \sum_squares_accumulator[20]_i_9_n_0\
    );
\sum_squares_accumulator_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[20]_i_1_n_6\,
      Q => sum_squares_accumulator_reg(21)
    );
\sum_squares_accumulator_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[20]_i_1_n_5\,
      Q => sum_squares_accumulator_reg(22)
    );
\sum_squares_accumulator_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[20]_i_1_n_4\,
      Q => sum_squares_accumulator_reg(23)
    );
\sum_squares_accumulator_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[24]_i_1_n_7\,
      Q => sum_squares_accumulator_reg(24)
    );
\sum_squares_accumulator_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sum_squares_accumulator_reg[20]_i_1_n_0\,
      CO(3) => \sum_squares_accumulator_reg[24]_i_1_n_0\,
      CO(2) => \sum_squares_accumulator_reg[24]_i_1_n_1\,
      CO(1) => \sum_squares_accumulator_reg[24]_i_1_n_2\,
      CO(0) => \sum_squares_accumulator_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \sum_squares_accumulator[24]_i_2_n_0\,
      DI(2) => \sum_squares_accumulator[24]_i_3_n_0\,
      DI(1) => \sum_squares_accumulator[24]_i_4_n_0\,
      DI(0) => \sum_squares_accumulator[24]_i_5_n_0\,
      O(3) => \sum_squares_accumulator_reg[24]_i_1_n_4\,
      O(2) => \sum_squares_accumulator_reg[24]_i_1_n_5\,
      O(1) => \sum_squares_accumulator_reg[24]_i_1_n_6\,
      O(0) => \sum_squares_accumulator_reg[24]_i_1_n_7\,
      S(3) => \sum_squares_accumulator[24]_i_6_n_0\,
      S(2) => \sum_squares_accumulator[24]_i_7_n_0\,
      S(1) => \sum_squares_accumulator[24]_i_8_n_0\,
      S(0) => \sum_squares_accumulator[24]_i_9_n_0\
    );
\sum_squares_accumulator_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[24]_i_1_n_6\,
      Q => sum_squares_accumulator_reg(25)
    );
\sum_squares_accumulator_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[24]_i_1_n_5\,
      Q => sum_squares_accumulator_reg(26)
    );
\sum_squares_accumulator_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[24]_i_1_n_4\,
      Q => sum_squares_accumulator_reg(27)
    );
\sum_squares_accumulator_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[28]_i_1_n_7\,
      Q => sum_squares_accumulator_reg(28)
    );
\sum_squares_accumulator_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sum_squares_accumulator_reg[24]_i_1_n_0\,
      CO(3) => \sum_squares_accumulator_reg[28]_i_1_n_0\,
      CO(2) => \sum_squares_accumulator_reg[28]_i_1_n_1\,
      CO(1) => \sum_squares_accumulator_reg[28]_i_1_n_2\,
      CO(0) => \sum_squares_accumulator_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \sum_squares_accumulator[28]_i_2_n_0\,
      DI(1) => \sum_squares_accumulator[28]_i_3_n_0\,
      DI(0) => \sum_squares_accumulator[28]_i_4_n_0\,
      O(3) => \sum_squares_accumulator_reg[28]_i_1_n_4\,
      O(2) => \sum_squares_accumulator_reg[28]_i_1_n_5\,
      O(1) => \sum_squares_accumulator_reg[28]_i_1_n_6\,
      O(0) => \sum_squares_accumulator_reg[28]_i_1_n_7\,
      S(3) => \sum_squares_accumulator[28]_i_5_n_0\,
      S(2) => \sum_squares_accumulator[28]_i_6_n_0\,
      S(1) => \sum_squares_accumulator[28]_i_7_n_0\,
      S(0) => \sum_squares_accumulator[28]_i_8_n_0\
    );
\sum_squares_accumulator_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[28]_i_1_n_6\,
      Q => sum_squares_accumulator_reg(29)
    );
\sum_squares_accumulator_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[0]_i_1_n_5\,
      Q => sum_squares_accumulator_reg(2)
    );
\sum_squares_accumulator_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[28]_i_1_n_5\,
      Q => sum_squares_accumulator_reg(30)
    );
\sum_squares_accumulator_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[28]_i_1_n_4\,
      Q => sum_squares_accumulator_reg(31)
    );
\sum_squares_accumulator_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[32]_i_1_n_7\,
      Q => sum_squares_accumulator_reg(32)
    );
\sum_squares_accumulator_reg[32]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sum_squares_accumulator_reg[28]_i_1_n_0\,
      CO(3 downto 2) => \NLW_sum_squares_accumulator_reg[32]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \sum_squares_accumulator_reg[32]_i_1_n_2\,
      CO(0) => \sum_squares_accumulator_reg[32]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_sum_squares_accumulator_reg[32]_i_1_O_UNCONNECTED\(3),
      O(2) => \sum_squares_accumulator_reg[32]_i_1_n_5\,
      O(1) => \sum_squares_accumulator_reg[32]_i_1_n_6\,
      O(0) => \sum_squares_accumulator_reg[32]_i_1_n_7\,
      S(3) => '0',
      S(2) => \sum_squares_accumulator[32]_i_2_n_0\,
      S(1) => \sum_squares_accumulator[32]_i_3_n_0\,
      S(0) => \sum_squares_accumulator[32]_i_4_n_0\
    );
\sum_squares_accumulator_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[32]_i_1_n_6\,
      Q => sum_squares_accumulator_reg(33)
    );
\sum_squares_accumulator_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[32]_i_1_n_5\,
      Q => sum_squares_accumulator_reg(34)
    );
\sum_squares_accumulator_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[0]_i_1_n_4\,
      Q => sum_squares_accumulator_reg(3)
    );
\sum_squares_accumulator_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[4]_i_1_n_7\,
      Q => sum_squares_accumulator_reg(4)
    );
\sum_squares_accumulator_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sum_squares_accumulator_reg[0]_i_1_n_0\,
      CO(3) => \sum_squares_accumulator_reg[4]_i_1_n_0\,
      CO(2) => \sum_squares_accumulator_reg[4]_i_1_n_1\,
      CO(1) => \sum_squares_accumulator_reg[4]_i_1_n_2\,
      CO(0) => \sum_squares_accumulator_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \sum_squares_accumulator[4]_i_2_n_0\,
      DI(2) => \sum_squares_accumulator[4]_i_3_n_0\,
      DI(1) => \sum_squares_accumulator[4]_i_4_n_0\,
      DI(0) => \sum_squares_accumulator[4]_i_5_n_0\,
      O(3) => \sum_squares_accumulator_reg[4]_i_1_n_4\,
      O(2) => \sum_squares_accumulator_reg[4]_i_1_n_5\,
      O(1) => \sum_squares_accumulator_reg[4]_i_1_n_6\,
      O(0) => \sum_squares_accumulator_reg[4]_i_1_n_7\,
      S(3) => \sum_squares_accumulator[4]_i_6_n_0\,
      S(2) => \sum_squares_accumulator[4]_i_7_n_0\,
      S(1) => \sum_squares_accumulator[4]_i_8_n_0\,
      S(0) => \sum_squares_accumulator[4]_i_9_n_0\
    );
\sum_squares_accumulator_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[4]_i_1_n_6\,
      Q => sum_squares_accumulator_reg(5)
    );
\sum_squares_accumulator_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[4]_i_1_n_5\,
      Q => sum_squares_accumulator_reg(6)
    );
\sum_squares_accumulator_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[4]_i_1_n_4\,
      Q => sum_squares_accumulator_reg(7)
    );
\sum_squares_accumulator_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[8]_i_1_n_7\,
      Q => sum_squares_accumulator_reg(8)
    );
\sum_squares_accumulator_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sum_squares_accumulator_reg[4]_i_1_n_0\,
      CO(3) => \sum_squares_accumulator_reg[8]_i_1_n_0\,
      CO(2) => \sum_squares_accumulator_reg[8]_i_1_n_1\,
      CO(1) => \sum_squares_accumulator_reg[8]_i_1_n_2\,
      CO(0) => \sum_squares_accumulator_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \sum_squares_accumulator[8]_i_2_n_0\,
      DI(2) => \sum_squares_accumulator[8]_i_3_n_0\,
      DI(1) => \sum_squares_accumulator[8]_i_4_n_0\,
      DI(0) => \sum_squares_accumulator[8]_i_5_n_0\,
      O(3) => \sum_squares_accumulator_reg[8]_i_1_n_4\,
      O(2) => \sum_squares_accumulator_reg[8]_i_1_n_5\,
      O(1) => \sum_squares_accumulator_reg[8]_i_1_n_6\,
      O(0) => \sum_squares_accumulator_reg[8]_i_1_n_7\,
      S(3) => \sum_squares_accumulator[8]_i_6_n_0\,
      S(2) => \sum_squares_accumulator[8]_i_7_n_0\,
      S(1) => \sum_squares_accumulator[8]_i_8_n_0\,
      S(0) => \sum_squares_accumulator[8]_i_9_n_0\
    );
\sum_squares_accumulator_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_axi_aclk,
      CE => \peak_accumulator_reg[15]_0\(0),
      CLR => \sum_squares_accumulator_reg[0]_0\,
      D => \sum_squares_accumulator_reg[8]_i_1_n_6\,
      Q => sum_squares_accumulator_reg(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    xyz_ready : in STD_LOGIC;
    xyz_x : out STD_LOGIC_VECTOR ( 15 downto 0 );
    xyz_y : out STD_LOGIC_VECTOR ( 15 downto 0 );
    xyz_z : out STD_LOGIC_VECTOR ( 15 downto 0 );
    xyz_valid : out STD_LOGIC;
    sample_drop : out STD_LOGIC;
    sample_drop_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sensor_overrun : out STD_LOGIC;
    who_am_i_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    init_done : out STD_LOGIC;
    error : out STD_LOGIC;
    spi_busy : out STD_LOGIC;
    lis3dh_cs_n : out STD_LOGIC;
    lis3dh_sclk : out STD_LOGIC;
    lis3dh_mosi : out STD_LOGIC;
    lis3dh_miso : in STD_LOGIC
  );
  attribute BOOT_WAIT : string;
  attribute BOOT_WAIT of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b0000";
  attribute BURST_START : string;
  attribute BURST_START of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b1011";
  attribute BURST_WAIT : string;
  attribute BURST_WAIT of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b1100";
  attribute CFG1_START : string;
  attribute CFG1_START of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b0101";
  attribute CFG1_WAIT : string;
  attribute CFG1_WAIT of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b0110";
  attribute CFG4_START : string;
  attribute CFG4_START of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b0011";
  attribute CFG4_WAIT : string;
  attribute CFG4_WAIT of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b0100";
  attribute CTRL_REG1_ADDR : string;
  attribute CTRL_REG1_ADDR of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "6'b100000";
  attribute CTRL_REG1_VALUE : string;
  attribute CTRL_REG1_VALUE of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "8'b01010111";
  attribute CTRL_REG4_ADDR : string;
  attribute CTRL_REG4_ADDR of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "6'b100011";
  attribute CTRL_REG4_VALUE : string;
  attribute CTRL_REG4_VALUE of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "8'b10001000";
  attribute FATAL : string;
  attribute FATAL of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b1110";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "lis3dh_xyz_acquisition";
  attribute OUTPUT_SAMPLE : string;
  attribute OUTPUT_SAMPLE of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b1101";
  attribute POLL_PERIOD_CYCLES : integer;
  attribute POLL_PERIOD_CYCLES of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is 50000;
  attribute POLL_WAIT : string;
  attribute POLL_WAIT of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b1000";
  attribute POWER_UP_DELAY_CYCLES : integer;
  attribute POWER_UP_DELAY_CYCLES of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is 500000;
  attribute SETTLE_DELAY_CYCLES : integer;
  attribute SETTLE_DELAY_CYCLES of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is 5000000;
  attribute SETTLE_WAIT : string;
  attribute SETTLE_WAIT of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b0111";
  attribute SPI_HALF_PERIOD_CYCLES : integer;
  attribute SPI_HALF_PERIOD_CYCLES of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is 25;
  attribute STATUS_REG_ADDR : string;
  attribute STATUS_REG_ADDR of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "6'b100111";
  attribute STATUS_START : string;
  attribute STATUS_START of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b1001";
  attribute STATUS_WAIT : string;
  attribute STATUS_WAIT of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b1010";
  attribute WHO_AM_I_ADDR : string;
  attribute WHO_AM_I_ADDR of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "6'b001111";
  attribute WHO_AM_I_EXPECTED : string;
  attribute WHO_AM_I_EXPECTED of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "8'b00110011";
  attribute WHO_START : string;
  attribute WHO_START of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b0001";
  attribute WHO_WAIT : string;
  attribute WHO_WAIT of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "4'b0010";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition : entity is "soft";
end design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition is
  signal \<const0>\ : STD_LOGIC;
  signal burst_cs_n : STD_LOGIC;
  signal burst_mosi : STD_LOGIC;
  signal burst_sclk : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \^error\ : STD_LOGIC;
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of error : signal is std.standard.true;
  signal \^init_done\ : STD_LOGIC;
  attribute MARK_DEBUG of init_done : signal is std.standard.true;
  signal init_done_i_1_n_0 : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \p_0_in__2\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \p_1_in__0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^sample_drop_count\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of \^sample_drop_count\ : signal is std.standard.true;
  signal sample_drop_count0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \sample_drop_count[31]_i_10_n_0\ : STD_LOGIC;
  signal \sample_drop_count[31]_i_11_n_0\ : STD_LOGIC;
  signal \sample_drop_count[31]_i_12_n_0\ : STD_LOGIC;
  signal \sample_drop_count[31]_i_1_n_0\ : STD_LOGIC;
  signal \sample_drop_count[31]_i_4_n_0\ : STD_LOGIC;
  signal \sample_drop_count[31]_i_5_n_0\ : STD_LOGIC;
  signal \sample_drop_count[31]_i_6_n_0\ : STD_LOGIC;
  signal \sample_drop_count[31]_i_7_n_0\ : STD_LOGIC;
  signal \sample_drop_count[31]_i_8_n_0\ : STD_LOGIC;
  signal \sample_drop_count[31]_i_9_n_0\ : STD_LOGIC;
  signal \sample_drop_count_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \sample_drop_count_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \sample_drop_count_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \sample_drop_count_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \sample_drop_count_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \sample_drop_count_reg[16]_i_2_n_1\ : STD_LOGIC;
  signal \sample_drop_count_reg[16]_i_2_n_2\ : STD_LOGIC;
  signal \sample_drop_count_reg[16]_i_2_n_3\ : STD_LOGIC;
  signal \sample_drop_count_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \sample_drop_count_reg[20]_i_2_n_1\ : STD_LOGIC;
  signal \sample_drop_count_reg[20]_i_2_n_2\ : STD_LOGIC;
  signal \sample_drop_count_reg[20]_i_2_n_3\ : STD_LOGIC;
  signal \sample_drop_count_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \sample_drop_count_reg[24]_i_2_n_1\ : STD_LOGIC;
  signal \sample_drop_count_reg[24]_i_2_n_2\ : STD_LOGIC;
  signal \sample_drop_count_reg[24]_i_2_n_3\ : STD_LOGIC;
  signal \sample_drop_count_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \sample_drop_count_reg[28]_i_2_n_1\ : STD_LOGIC;
  signal \sample_drop_count_reg[28]_i_2_n_2\ : STD_LOGIC;
  signal \sample_drop_count_reg[28]_i_2_n_3\ : STD_LOGIC;
  signal \sample_drop_count_reg[31]_i_3_n_2\ : STD_LOGIC;
  signal \sample_drop_count_reg[31]_i_3_n_3\ : STD_LOGIC;
  signal \sample_drop_count_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \sample_drop_count_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \sample_drop_count_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \sample_drop_count_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \sample_drop_count_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \sample_drop_count_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \sample_drop_count_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \sample_drop_count_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal sample_drop_i_1_n_0 : STD_LOGIC;
  signal \^sensor_overrun\ : STD_LOGIC;
  attribute MARK_DEBUG of sensor_overrun : signal is std.standard.true;
  signal single_register_spi_n_0 : STD_LOGIC;
  signal single_register_spi_n_1 : STD_LOGIC;
  signal single_register_spi_n_12 : STD_LOGIC;
  signal single_register_spi_n_13 : STD_LOGIC;
  signal single_register_spi_n_14 : STD_LOGIC;
  signal single_register_spi_n_15 : STD_LOGIC;
  signal single_register_spi_n_16 : STD_LOGIC;
  signal single_register_spi_n_17 : STD_LOGIC;
  signal single_register_spi_n_18 : STD_LOGIC;
  signal single_register_spi_n_19 : STD_LOGIC;
  signal single_register_spi_n_20 : STD_LOGIC;
  signal single_register_spi_n_21 : STD_LOGIC;
  signal single_register_spi_n_22 : STD_LOGIC;
  signal single_register_spi_n_23 : STD_LOGIC;
  signal single_register_spi_n_24 : STD_LOGIC;
  signal single_register_spi_n_25 : STD_LOGIC;
  signal single_register_spi_n_26 : STD_LOGIC;
  signal single_register_spi_n_27 : STD_LOGIC;
  signal single_register_spi_n_28 : STD_LOGIC;
  signal single_register_spi_n_29 : STD_LOGIC;
  signal single_register_spi_n_30 : STD_LOGIC;
  signal single_register_spi_n_5 : STD_LOGIC;
  signal single_register_spi_n_6 : STD_LOGIC;
  signal single_register_spi_n_7 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute MARK_DEBUG of state : signal is std.standard.true;
  signal \wait_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[10]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[11]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[12]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[13]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[14]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[15]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[16]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[17]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[18]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[19]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[20]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[21]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[22]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[23]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[24]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[25]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[26]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[27]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[28]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[29]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[2]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[30]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_10_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_2_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_4_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_5_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_6_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_8_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_9_n_0\ : STD_LOGIC;
  signal \wait_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[5]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[6]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[7]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[9]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \wait_count_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \wait_count_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \wait_count_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \wait_count_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \wait_count_reg[16]_i_2_n_1\ : STD_LOGIC;
  signal \wait_count_reg[16]_i_2_n_2\ : STD_LOGIC;
  signal \wait_count_reg[16]_i_2_n_3\ : STD_LOGIC;
  signal \wait_count_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \wait_count_reg[20]_i_2_n_1\ : STD_LOGIC;
  signal \wait_count_reg[20]_i_2_n_2\ : STD_LOGIC;
  signal \wait_count_reg[20]_i_2_n_3\ : STD_LOGIC;
  signal \wait_count_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \wait_count_reg[24]_i_2_n_1\ : STD_LOGIC;
  signal \wait_count_reg[24]_i_2_n_2\ : STD_LOGIC;
  signal \wait_count_reg[24]_i_2_n_3\ : STD_LOGIC;
  signal \wait_count_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \wait_count_reg[28]_i_2_n_1\ : STD_LOGIC;
  signal \wait_count_reg[28]_i_2_n_2\ : STD_LOGIC;
  signal \wait_count_reg[28]_i_2_n_3\ : STD_LOGIC;
  signal \wait_count_reg[31]_i_3_n_2\ : STD_LOGIC;
  signal \wait_count_reg[31]_i_3_n_3\ : STD_LOGIC;
  signal \wait_count_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \wait_count_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \wait_count_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \wait_count_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \wait_count_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \wait_count_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \wait_count_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \wait_count_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[10]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[11]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[12]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[13]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[14]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[15]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[16]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[17]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[18]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[19]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[20]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[21]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[22]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[23]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[24]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[25]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[26]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[27]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[28]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[29]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[30]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[31]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[4]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[5]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[6]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[7]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[8]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[9]\ : STD_LOGIC;
  signal \^who_am_i_data\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute MARK_DEBUG of \^who_am_i_data\ : signal is std.standard.true;
  signal \who_am_i_data[7]_i_1_n_0\ : STD_LOGIC;
  signal xyz_burst_spi_n_0 : STD_LOGIC;
  signal xyz_burst_spi_n_1 : STD_LOGIC;
  signal xyz_burst_spi_n_18 : STD_LOGIC;
  signal xyz_burst_spi_n_19 : STD_LOGIC;
  signal xyz_burst_spi_n_20 : STD_LOGIC;
  signal xyz_burst_spi_n_21 : STD_LOGIC;
  signal xyz_burst_spi_n_22 : STD_LOGIC;
  signal xyz_burst_spi_n_23 : STD_LOGIC;
  signal xyz_burst_spi_n_24 : STD_LOGIC;
  signal xyz_burst_spi_n_25 : STD_LOGIC;
  signal xyz_burst_spi_n_26 : STD_LOGIC;
  signal xyz_burst_spi_n_27 : STD_LOGIC;
  signal xyz_burst_spi_n_28 : STD_LOGIC;
  signal xyz_burst_spi_n_29 : STD_LOGIC;
  signal xyz_burst_spi_n_30 : STD_LOGIC;
  signal xyz_burst_spi_n_31 : STD_LOGIC;
  signal xyz_burst_spi_n_32 : STD_LOGIC;
  signal xyz_burst_spi_n_33 : STD_LOGIC;
  signal xyz_burst_spi_n_34 : STD_LOGIC;
  signal xyz_burst_spi_n_35 : STD_LOGIC;
  signal xyz_burst_spi_n_36 : STD_LOGIC;
  signal xyz_burst_spi_n_37 : STD_LOGIC;
  signal xyz_burst_spi_n_38 : STD_LOGIC;
  signal xyz_burst_spi_n_39 : STD_LOGIC;
  signal xyz_burst_spi_n_40 : STD_LOGIC;
  signal xyz_burst_spi_n_41 : STD_LOGIC;
  signal xyz_burst_spi_n_42 : STD_LOGIC;
  signal xyz_burst_spi_n_43 : STD_LOGIC;
  signal xyz_burst_spi_n_44 : STD_LOGIC;
  signal xyz_burst_spi_n_45 : STD_LOGIC;
  signal xyz_burst_spi_n_46 : STD_LOGIC;
  signal xyz_burst_spi_n_47 : STD_LOGIC;
  signal xyz_burst_spi_n_48 : STD_LOGIC;
  signal xyz_burst_spi_n_49 : STD_LOGIC;
  signal xyz_burst_spi_n_50 : STD_LOGIC;
  signal \^xyz_x\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of \^xyz_x\ : signal is std.standard.true;
  signal \xyz_x[15]_i_1_n_0\ : STD_LOGIC;
  signal \^xyz_y\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of \^xyz_y\ : signal is std.standard.true;
  signal \^xyz_z\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of \^xyz_z\ : signal is std.standard.true;
  signal \NLW_sample_drop_count_reg[31]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_sample_drop_count_reg[31]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wait_count_reg[31]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_wait_count_reg[31]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute KEEP : string;
  attribute KEEP of error_reg : label is "yes";
  attribute KEEP of init_done_reg : label is "yes";
  attribute mark_debug_string : string;
  attribute mark_debug_string of init_done_reg : label is "true";
  attribute KEEP of \sample_drop_count_reg[0]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[0]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[10]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[10]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[11]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[11]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[12]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[12]\ : label is "true";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \sample_drop_count_reg[12]_i_2\ : label is 35;
  attribute KEEP of \sample_drop_count_reg[13]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[13]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[14]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[14]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[15]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[15]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[16]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[16]\ : label is "true";
  attribute ADDER_THRESHOLD of \sample_drop_count_reg[16]_i_2\ : label is 35;
  attribute KEEP of \sample_drop_count_reg[17]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[17]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[18]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[18]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[19]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[19]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[1]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[1]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[20]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[20]\ : label is "true";
  attribute ADDER_THRESHOLD of \sample_drop_count_reg[20]_i_2\ : label is 35;
  attribute KEEP of \sample_drop_count_reg[21]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[21]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[22]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[22]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[23]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[23]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[24]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[24]\ : label is "true";
  attribute ADDER_THRESHOLD of \sample_drop_count_reg[24]_i_2\ : label is 35;
  attribute KEEP of \sample_drop_count_reg[25]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[25]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[26]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[26]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[27]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[27]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[28]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[28]\ : label is "true";
  attribute ADDER_THRESHOLD of \sample_drop_count_reg[28]_i_2\ : label is 35;
  attribute KEEP of \sample_drop_count_reg[29]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[29]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[2]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[2]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[30]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[30]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[31]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[31]\ : label is "true";
  attribute ADDER_THRESHOLD of \sample_drop_count_reg[31]_i_3\ : label is 35;
  attribute KEEP of \sample_drop_count_reg[3]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[3]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[4]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[4]\ : label is "true";
  attribute ADDER_THRESHOLD of \sample_drop_count_reg[4]_i_2\ : label is 35;
  attribute KEEP of \sample_drop_count_reg[5]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[5]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[6]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[6]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[7]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[7]\ : label is "true";
  attribute KEEP of \sample_drop_count_reg[8]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[8]\ : label is "true";
  attribute ADDER_THRESHOLD of \sample_drop_count_reg[8]_i_2\ : label is 35;
  attribute KEEP of \sample_drop_count_reg[9]\ : label is "yes";
  attribute mark_debug_string of \sample_drop_count_reg[9]\ : label is "true";
  attribute KEEP of sample_drop_reg : label is "yes";
  attribute KEEP of sensor_overrun_reg : label is "yes";
  attribute mark_debug_string of sensor_overrun_reg : label is "true";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \state_reg[0]\ : label is "BOOT_WAIT:0000,WHO_START:0001,WHO_WAIT:0010,CFG4_START:0011,CFG4_WAIT:0100,CFG1_START:0101,CFG1_WAIT:0110,SETTLE_WAIT:0111,POLL_WAIT:1000,STATUS_START:1001,STATUS_WAIT:1010,BURST_START:1011,BURST_WAIT:1100,OUTPUT_SAMPLE:1101,FATAL:1110";
  attribute KEEP of \state_reg[0]\ : label is "yes";
  attribute mark_debug_string of \state_reg[0]\ : label is "true";
  attribute FSM_ENCODED_STATES of \state_reg[1]\ : label is "BOOT_WAIT:0000,WHO_START:0001,WHO_WAIT:0010,CFG4_START:0011,CFG4_WAIT:0100,CFG1_START:0101,CFG1_WAIT:0110,SETTLE_WAIT:0111,POLL_WAIT:1000,STATUS_START:1001,STATUS_WAIT:1010,BURST_START:1011,BURST_WAIT:1100,OUTPUT_SAMPLE:1101,FATAL:1110";
  attribute KEEP of \state_reg[1]\ : label is "yes";
  attribute mark_debug_string of \state_reg[1]\ : label is "true";
  attribute FSM_ENCODED_STATES of \state_reg[2]\ : label is "BOOT_WAIT:0000,WHO_START:0001,WHO_WAIT:0010,CFG4_START:0011,CFG4_WAIT:0100,CFG1_START:0101,CFG1_WAIT:0110,SETTLE_WAIT:0111,POLL_WAIT:1000,STATUS_START:1001,STATUS_WAIT:1010,BURST_START:1011,BURST_WAIT:1100,OUTPUT_SAMPLE:1101,FATAL:1110";
  attribute KEEP of \state_reg[2]\ : label is "yes";
  attribute mark_debug_string of \state_reg[2]\ : label is "true";
  attribute FSM_ENCODED_STATES of \state_reg[3]\ : label is "BOOT_WAIT:0000,WHO_START:0001,WHO_WAIT:0010,CFG4_START:0011,CFG4_WAIT:0100,CFG1_START:0101,CFG1_WAIT:0110,SETTLE_WAIT:0111,POLL_WAIT:1000,STATUS_START:1001,STATUS_WAIT:1010,BURST_START:1011,BURST_WAIT:1100,OUTPUT_SAMPLE:1101,FATAL:1110";
  attribute KEEP of \state_reg[3]\ : label is "yes";
  attribute mark_debug_string of \state_reg[3]\ : label is "true";
  attribute ADDER_THRESHOLD of \wait_count_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count_reg[16]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count_reg[20]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count_reg[24]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count_reg[28]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count_reg[31]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count_reg[8]_i_2\ : label is 35;
  attribute KEEP of \who_am_i_data_reg[0]\ : label is "yes";
  attribute mark_debug_string of \who_am_i_data_reg[0]\ : label is "true";
  attribute KEEP of \who_am_i_data_reg[1]\ : label is "yes";
  attribute mark_debug_string of \who_am_i_data_reg[1]\ : label is "true";
  attribute KEEP of \who_am_i_data_reg[2]\ : label is "yes";
  attribute mark_debug_string of \who_am_i_data_reg[2]\ : label is "true";
  attribute KEEP of \who_am_i_data_reg[3]\ : label is "yes";
  attribute mark_debug_string of \who_am_i_data_reg[3]\ : label is "true";
  attribute KEEP of \who_am_i_data_reg[4]\ : label is "yes";
  attribute mark_debug_string of \who_am_i_data_reg[4]\ : label is "true";
  attribute KEEP of \who_am_i_data_reg[5]\ : label is "yes";
  attribute mark_debug_string of \who_am_i_data_reg[5]\ : label is "true";
  attribute KEEP of \who_am_i_data_reg[6]\ : label is "yes";
  attribute mark_debug_string of \who_am_i_data_reg[6]\ : label is "true";
  attribute KEEP of \who_am_i_data_reg[7]\ : label is "yes";
  attribute mark_debug_string of \who_am_i_data_reg[7]\ : label is "true";
  attribute KEEP of xyz_valid_reg : label is "yes";
  attribute KEEP of \xyz_x_reg[0]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[0]\ : label is "true";
  attribute KEEP of \xyz_x_reg[10]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[10]\ : label is "true";
  attribute KEEP of \xyz_x_reg[11]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[11]\ : label is "true";
  attribute KEEP of \xyz_x_reg[12]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[12]\ : label is "true";
  attribute KEEP of \xyz_x_reg[13]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[13]\ : label is "true";
  attribute KEEP of \xyz_x_reg[14]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[14]\ : label is "true";
  attribute KEEP of \xyz_x_reg[15]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[15]\ : label is "true";
  attribute KEEP of \xyz_x_reg[1]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[1]\ : label is "true";
  attribute KEEP of \xyz_x_reg[2]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[2]\ : label is "true";
  attribute KEEP of \xyz_x_reg[3]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[3]\ : label is "true";
  attribute KEEP of \xyz_x_reg[4]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[4]\ : label is "true";
  attribute KEEP of \xyz_x_reg[5]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[5]\ : label is "true";
  attribute KEEP of \xyz_x_reg[6]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[6]\ : label is "true";
  attribute KEEP of \xyz_x_reg[7]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[7]\ : label is "true";
  attribute KEEP of \xyz_x_reg[8]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[8]\ : label is "true";
  attribute KEEP of \xyz_x_reg[9]\ : label is "yes";
  attribute mark_debug_string of \xyz_x_reg[9]\ : label is "true";
  attribute KEEP of \xyz_y_reg[0]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[0]\ : label is "true";
  attribute KEEP of \xyz_y_reg[10]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[10]\ : label is "true";
  attribute KEEP of \xyz_y_reg[11]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[11]\ : label is "true";
  attribute KEEP of \xyz_y_reg[12]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[12]\ : label is "true";
  attribute KEEP of \xyz_y_reg[13]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[13]\ : label is "true";
  attribute KEEP of \xyz_y_reg[14]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[14]\ : label is "true";
  attribute KEEP of \xyz_y_reg[15]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[15]\ : label is "true";
  attribute KEEP of \xyz_y_reg[1]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[1]\ : label is "true";
  attribute KEEP of \xyz_y_reg[2]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[2]\ : label is "true";
  attribute KEEP of \xyz_y_reg[3]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[3]\ : label is "true";
  attribute KEEP of \xyz_y_reg[4]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[4]\ : label is "true";
  attribute KEEP of \xyz_y_reg[5]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[5]\ : label is "true";
  attribute KEEP of \xyz_y_reg[6]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[6]\ : label is "true";
  attribute KEEP of \xyz_y_reg[7]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[7]\ : label is "true";
  attribute KEEP of \xyz_y_reg[8]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[8]\ : label is "true";
  attribute KEEP of \xyz_y_reg[9]\ : label is "yes";
  attribute mark_debug_string of \xyz_y_reg[9]\ : label is "true";
  attribute KEEP of \xyz_z_reg[0]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[0]\ : label is "true";
  attribute KEEP of \xyz_z_reg[10]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[10]\ : label is "true";
  attribute KEEP of \xyz_z_reg[11]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[11]\ : label is "true";
  attribute KEEP of \xyz_z_reg[12]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[12]\ : label is "true";
  attribute KEEP of \xyz_z_reg[13]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[13]\ : label is "true";
  attribute KEEP of \xyz_z_reg[14]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[14]\ : label is "true";
  attribute KEEP of \xyz_z_reg[15]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[15]\ : label is "true";
  attribute KEEP of \xyz_z_reg[1]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[1]\ : label is "true";
  attribute KEEP of \xyz_z_reg[2]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[2]\ : label is "true";
  attribute KEEP of \xyz_z_reg[3]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[3]\ : label is "true";
  attribute KEEP of \xyz_z_reg[4]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[4]\ : label is "true";
  attribute KEEP of \xyz_z_reg[5]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[5]\ : label is "true";
  attribute KEEP of \xyz_z_reg[6]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[6]\ : label is "true";
  attribute KEEP of \xyz_z_reg[7]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[7]\ : label is "true";
  attribute KEEP of \xyz_z_reg[8]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[8]\ : label is "true";
  attribute KEEP of \xyz_z_reg[9]\ : label is "yes";
  attribute mark_debug_string of \xyz_z_reg[9]\ : label is "true";
  attribute mark_debug_string of error : signal is "true";
  attribute mark_debug_string of init_done : signal is "true";
  attribute mark_debug_string of sample_drop : signal is "true";
  attribute mark_debug_string of sensor_overrun : signal is "true";
  attribute mark_debug_string of xyz_valid : signal is "true";
  attribute mark_debug_string of sample_drop_count : signal is "true";
  attribute mark_debug_string of who_am_i_data : signal is "true";
  attribute mark_debug_string of xyz_x : signal is "true";
  attribute mark_debug_string of xyz_y : signal is "true";
  attribute mark_debug_string of xyz_z : signal is "true";
begin
  error <= \^error\;
  init_done <= \^init_done\;
  sample_drop_count(31 downto 0) <= \^sample_drop_count\(31 downto 0);
  sensor_overrun <= \^sensor_overrun\;
  spi_busy <= \<const0>\;
  who_am_i_data(7 downto 0) <= \^who_am_i_data\(7 downto 0);
  xyz_x(15 downto 0) <= \^xyz_x\(15 downto 0);
  xyz_y(15 downto 0) <= \^xyz_y\(15 downto 0);
  xyz_z(15 downto 0) <= \^xyz_z\(15 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
error_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_6,
      Q => \^error\
    );
init_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF0000E000"
    )
        port map (
      I0 => \^init_done\,
      I1 => single_register_spi_n_17,
      I2 => single_register_spi_n_5,
      I3 => state(2),
      I4 => state(3),
      I5 => \^init_done\,
      O => init_done_i_1_n_0
    );
init_done_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xyz_burst_spi_n_0,
      D => init_done_i_1_n_0,
      Q => \^init_done\
    );
\sample_drop_count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^sample_drop_count\(0),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      O => \p_1_in__0\(0)
    );
\sample_drop_count[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(10),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(10),
      O => \p_1_in__0\(10)
    );
\sample_drop_count[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(11),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(11),
      O => \p_1_in__0\(11)
    );
\sample_drop_count[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(12),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(12),
      O => \p_1_in__0\(12)
    );
\sample_drop_count[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(13),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(13),
      O => \p_1_in__0\(13)
    );
\sample_drop_count[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(14),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(14),
      O => \p_1_in__0\(14)
    );
\sample_drop_count[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(15),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(15),
      O => \p_1_in__0\(15)
    );
\sample_drop_count[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(16),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(16),
      O => \p_1_in__0\(16)
    );
\sample_drop_count[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(17),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(17),
      O => \p_1_in__0\(17)
    );
\sample_drop_count[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(18),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(18),
      O => \p_1_in__0\(18)
    );
\sample_drop_count[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(19),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(19),
      O => \p_1_in__0\(19)
    );
\sample_drop_count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(1),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(1),
      O => \p_1_in__0\(1)
    );
\sample_drop_count[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(20),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(20),
      O => \p_1_in__0\(20)
    );
\sample_drop_count[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(21),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(21),
      O => \p_1_in__0\(21)
    );
\sample_drop_count[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(22),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(22),
      O => \p_1_in__0\(22)
    );
\sample_drop_count[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(23),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(23),
      O => \p_1_in__0\(23)
    );
\sample_drop_count[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(24),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(24),
      O => \p_1_in__0\(24)
    );
\sample_drop_count[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(25),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(25),
      O => \p_1_in__0\(25)
    );
\sample_drop_count[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(26),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(26),
      O => \p_1_in__0\(26)
    );
\sample_drop_count[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(27),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(27),
      O => \p_1_in__0\(27)
    );
\sample_drop_count[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(28),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(28),
      O => \p_1_in__0\(28)
    );
\sample_drop_count[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(29),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(29),
      O => \p_1_in__0\(29)
    );
\sample_drop_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(2),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(2),
      O => \p_1_in__0\(2)
    );
\sample_drop_count[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(30),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(30),
      O => \p_1_in__0\(30)
    );
\sample_drop_count[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      O => \sample_drop_count[31]_i_1_n_0\
    );
\sample_drop_count[31]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^sample_drop_count\(8),
      I1 => \^sample_drop_count\(9),
      I2 => \^sample_drop_count\(1),
      I3 => \^sample_drop_count\(16),
      O => \sample_drop_count[31]_i_10_n_0\
    );
\sample_drop_count[31]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^sample_drop_count\(6),
      I1 => \^sample_drop_count\(7),
      I2 => \^sample_drop_count\(5),
      I3 => \^sample_drop_count\(26),
      O => \sample_drop_count[31]_i_11_n_0\
    );
\sample_drop_count[31]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^sample_drop_count\(2),
      I1 => \^sample_drop_count\(19),
      I2 => \^sample_drop_count\(3),
      I3 => \^sample_drop_count\(24),
      O => \sample_drop_count[31]_i_12_n_0\
    );
\sample_drop_count[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(31),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(31),
      O => \p_1_in__0\(31)
    );
\sample_drop_count[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555455"
    )
        port map (
      I0 => xyz_ready,
      I1 => \sample_drop_count[31]_i_5_n_0\,
      I2 => \sample_drop_count[31]_i_6_n_0\,
      I3 => \sample_drop_count[31]_i_7_n_0\,
      I4 => \sample_drop_count[31]_i_8_n_0\,
      O => \sample_drop_count[31]_i_4_n_0\
    );
\sample_drop_count[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => \^sample_drop_count\(18),
      I1 => \^sample_drop_count\(28),
      I2 => \^sample_drop_count\(11),
      I3 => \^sample_drop_count\(12),
      I4 => \sample_drop_count[31]_i_9_n_0\,
      O => \sample_drop_count[31]_i_5_n_0\
    );
\sample_drop_count[31]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => \^sample_drop_count\(30),
      I1 => \^sample_drop_count\(14),
      I2 => \^sample_drop_count\(21),
      I3 => \^sample_drop_count\(20),
      I4 => \sample_drop_count[31]_i_10_n_0\,
      O => \sample_drop_count[31]_i_6_n_0\
    );
\sample_drop_count[31]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \^sample_drop_count\(31),
      I1 => \^sample_drop_count\(4),
      I2 => \^sample_drop_count\(17),
      I3 => \^sample_drop_count\(15),
      I4 => \sample_drop_count[31]_i_11_n_0\,
      O => \sample_drop_count[31]_i_7_n_0\
    );
\sample_drop_count[31]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => \^sample_drop_count\(25),
      I1 => \^sample_drop_count\(10),
      I2 => \^sample_drop_count\(23),
      I3 => \^sample_drop_count\(22),
      I4 => \sample_drop_count[31]_i_12_n_0\,
      O => \sample_drop_count[31]_i_8_n_0\
    );
\sample_drop_count[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^sample_drop_count\(0),
      I1 => \^sample_drop_count\(29),
      I2 => \^sample_drop_count\(13),
      I3 => \^sample_drop_count\(27),
      O => \sample_drop_count[31]_i_9_n_0\
    );
\sample_drop_count[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(3),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(3),
      O => \p_1_in__0\(3)
    );
\sample_drop_count[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(4),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(4),
      O => \p_1_in__0\(4)
    );
\sample_drop_count[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(5),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(5),
      O => \p_1_in__0\(5)
    );
\sample_drop_count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(6),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(6),
      O => \p_1_in__0\(6)
    );
\sample_drop_count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(7),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(7),
      O => \p_1_in__0\(7)
    );
\sample_drop_count[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(8),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(8),
      O => \p_1_in__0\(8)
    );
\sample_drop_count[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => sample_drop_count0(9),
      I1 => \sample_drop_count[31]_i_4_n_0\,
      I2 => \^sample_drop_count\(9),
      O => \p_1_in__0\(9)
    );
\sample_drop_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(0),
      Q => \^sample_drop_count\(0)
    );
\sample_drop_count_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(10),
      Q => \^sample_drop_count\(10)
    );
\sample_drop_count_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(11),
      Q => \^sample_drop_count\(11)
    );
\sample_drop_count_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(12),
      Q => \^sample_drop_count\(12)
    );
\sample_drop_count_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_drop_count_reg[8]_i_2_n_0\,
      CO(3) => \sample_drop_count_reg[12]_i_2_n_0\,
      CO(2) => \sample_drop_count_reg[12]_i_2_n_1\,
      CO(1) => \sample_drop_count_reg[12]_i_2_n_2\,
      CO(0) => \sample_drop_count_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_drop_count0(12 downto 9),
      S(3 downto 0) => \^sample_drop_count\(12 downto 9)
    );
\sample_drop_count_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(13),
      Q => \^sample_drop_count\(13)
    );
\sample_drop_count_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(14),
      Q => \^sample_drop_count\(14)
    );
\sample_drop_count_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(15),
      Q => \^sample_drop_count\(15)
    );
\sample_drop_count_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(16),
      Q => \^sample_drop_count\(16)
    );
\sample_drop_count_reg[16]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_drop_count_reg[12]_i_2_n_0\,
      CO(3) => \sample_drop_count_reg[16]_i_2_n_0\,
      CO(2) => \sample_drop_count_reg[16]_i_2_n_1\,
      CO(1) => \sample_drop_count_reg[16]_i_2_n_2\,
      CO(0) => \sample_drop_count_reg[16]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_drop_count0(16 downto 13),
      S(3 downto 0) => \^sample_drop_count\(16 downto 13)
    );
\sample_drop_count_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(17),
      Q => \^sample_drop_count\(17)
    );
\sample_drop_count_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(18),
      Q => \^sample_drop_count\(18)
    );
\sample_drop_count_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(19),
      Q => \^sample_drop_count\(19)
    );
\sample_drop_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(1),
      Q => \^sample_drop_count\(1)
    );
\sample_drop_count_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(20),
      Q => \^sample_drop_count\(20)
    );
\sample_drop_count_reg[20]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_drop_count_reg[16]_i_2_n_0\,
      CO(3) => \sample_drop_count_reg[20]_i_2_n_0\,
      CO(2) => \sample_drop_count_reg[20]_i_2_n_1\,
      CO(1) => \sample_drop_count_reg[20]_i_2_n_2\,
      CO(0) => \sample_drop_count_reg[20]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_drop_count0(20 downto 17),
      S(3 downto 0) => \^sample_drop_count\(20 downto 17)
    );
\sample_drop_count_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(21),
      Q => \^sample_drop_count\(21)
    );
\sample_drop_count_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(22),
      Q => \^sample_drop_count\(22)
    );
\sample_drop_count_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(23),
      Q => \^sample_drop_count\(23)
    );
\sample_drop_count_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(24),
      Q => \^sample_drop_count\(24)
    );
\sample_drop_count_reg[24]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_drop_count_reg[20]_i_2_n_0\,
      CO(3) => \sample_drop_count_reg[24]_i_2_n_0\,
      CO(2) => \sample_drop_count_reg[24]_i_2_n_1\,
      CO(1) => \sample_drop_count_reg[24]_i_2_n_2\,
      CO(0) => \sample_drop_count_reg[24]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_drop_count0(24 downto 21),
      S(3 downto 0) => \^sample_drop_count\(24 downto 21)
    );
\sample_drop_count_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(25),
      Q => \^sample_drop_count\(25)
    );
\sample_drop_count_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(26),
      Q => \^sample_drop_count\(26)
    );
\sample_drop_count_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(27),
      Q => \^sample_drop_count\(27)
    );
\sample_drop_count_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(28),
      Q => \^sample_drop_count\(28)
    );
\sample_drop_count_reg[28]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_drop_count_reg[24]_i_2_n_0\,
      CO(3) => \sample_drop_count_reg[28]_i_2_n_0\,
      CO(2) => \sample_drop_count_reg[28]_i_2_n_1\,
      CO(1) => \sample_drop_count_reg[28]_i_2_n_2\,
      CO(0) => \sample_drop_count_reg[28]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_drop_count0(28 downto 25),
      S(3 downto 0) => \^sample_drop_count\(28 downto 25)
    );
\sample_drop_count_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(29),
      Q => \^sample_drop_count\(29)
    );
\sample_drop_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(2),
      Q => \^sample_drop_count\(2)
    );
\sample_drop_count_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(30),
      Q => \^sample_drop_count\(30)
    );
\sample_drop_count_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(31),
      Q => \^sample_drop_count\(31)
    );
\sample_drop_count_reg[31]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_drop_count_reg[28]_i_2_n_0\,
      CO(3 downto 2) => \NLW_sample_drop_count_reg[31]_i_3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \sample_drop_count_reg[31]_i_3_n_2\,
      CO(0) => \sample_drop_count_reg[31]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_sample_drop_count_reg[31]_i_3_O_UNCONNECTED\(3),
      O(2 downto 0) => sample_drop_count0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => \^sample_drop_count\(31 downto 29)
    );
\sample_drop_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(3),
      Q => \^sample_drop_count\(3)
    );
\sample_drop_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(4),
      Q => \^sample_drop_count\(4)
    );
\sample_drop_count_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \sample_drop_count_reg[4]_i_2_n_0\,
      CO(2) => \sample_drop_count_reg[4]_i_2_n_1\,
      CO(1) => \sample_drop_count_reg[4]_i_2_n_2\,
      CO(0) => \sample_drop_count_reg[4]_i_2_n_3\,
      CYINIT => \^sample_drop_count\(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_drop_count0(4 downto 1),
      S(3 downto 0) => \^sample_drop_count\(4 downto 1)
    );
\sample_drop_count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(5),
      Q => \^sample_drop_count\(5)
    );
\sample_drop_count_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(6),
      Q => \^sample_drop_count\(6)
    );
\sample_drop_count_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(7),
      Q => \^sample_drop_count\(7)
    );
\sample_drop_count_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(8),
      Q => \^sample_drop_count\(8)
    );
\sample_drop_count_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \sample_drop_count_reg[4]_i_2_n_0\,
      CO(3) => \sample_drop_count_reg[8]_i_2_n_0\,
      CO(2) => \sample_drop_count_reg[8]_i_2_n_1\,
      CO(1) => \sample_drop_count_reg[8]_i_2_n_2\,
      CO(0) => \sample_drop_count_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => sample_drop_count0(8 downto 5),
      S(3 downto 0) => \^sample_drop_count\(8 downto 5)
    );
\sample_drop_count_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \sample_drop_count[31]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_1_in__0\(9),
      Q => \^sample_drop_count\(9)
    );
sample_drop_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => state(2),
      I3 => state(3),
      I4 => xyz_ready,
      O => sample_drop_i_1_n_0
    );
sample_drop_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xyz_burst_spi_n_0,
      D => sample_drop_i_1_n_0,
      Q => sample_drop
    );
sensor_overrun_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_0,
      Q => \^sensor_overrun\
    );
single_register_spi: entity work.design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_controller
     port map (
      D(3 downto 0) => \p_0_in__0\(3 downto 0),
      E(0) => single_register_spi_n_7,
      Q(3 downto 0) => state(3 downto 0),
      burst_cs_n => burst_cs_n,
      burst_mosi => burst_mosi,
      burst_sclk => burst_sclk,
      clk => clk,
      error => \^error\,
      in0 => \^sensor_overrun\,
      lis3dh_cs_n => lis3dh_cs_n,
      lis3dh_cs_n_reg_0 => xyz_burst_spi_n_0,
      lis3dh_miso => lis3dh_miso,
      lis3dh_mosi => lis3dh_mosi,
      lis3dh_sclk => lis3dh_sclk,
      \out\(3 downto 0) => state(3 downto 0),
      \read_data_reg[7]_0\(7) => single_register_spi_n_23,
      \read_data_reg[7]_0\(6) => single_register_spi_n_24,
      \read_data_reg[7]_0\(5) => single_register_spi_n_25,
      \read_data_reg[7]_0\(4) => single_register_spi_n_26,
      \read_data_reg[7]_0\(3) => single_register_spi_n_27,
      \read_data_reg[7]_0\(2) => single_register_spi_n_28,
      \read_data_reg[7]_0\(1) => single_register_spi_n_29,
      \read_data_reg[7]_0\(0) => single_register_spi_n_30,
      sensor_overrun => \^sensor_overrun\,
      sensor_overrun_reg => single_register_spi_n_0,
      \state[0]_i_5_0\ => xyz_burst_spi_n_50,
      \state_reg[0]\ => single_register_spi_n_5,
      \state_reg[1]\ => single_register_spi_n_6,
      \state_reg[3]\ => single_register_spi_n_1,
      \wait_count[31]_i_4\(31) => \wait_count_reg_n_0_[31]\,
      \wait_count[31]_i_4\(30) => \wait_count_reg_n_0_[30]\,
      \wait_count[31]_i_4\(29) => \wait_count_reg_n_0_[29]\,
      \wait_count[31]_i_4\(28) => \wait_count_reg_n_0_[28]\,
      \wait_count[31]_i_4\(27) => \wait_count_reg_n_0_[27]\,
      \wait_count[31]_i_4\(26) => \wait_count_reg_n_0_[26]\,
      \wait_count[31]_i_4\(25) => \wait_count_reg_n_0_[25]\,
      \wait_count[31]_i_4\(24) => \wait_count_reg_n_0_[24]\,
      \wait_count[31]_i_4\(23) => \wait_count_reg_n_0_[23]\,
      \wait_count[31]_i_4\(22) => \wait_count_reg_n_0_[22]\,
      \wait_count[31]_i_4\(21) => \wait_count_reg_n_0_[21]\,
      \wait_count[31]_i_4\(20) => \wait_count_reg_n_0_[20]\,
      \wait_count[31]_i_4\(19) => \wait_count_reg_n_0_[19]\,
      \wait_count[31]_i_4\(18) => \wait_count_reg_n_0_[18]\,
      \wait_count[31]_i_4\(17) => \wait_count_reg_n_0_[17]\,
      \wait_count[31]_i_4\(16) => \wait_count_reg_n_0_[16]\,
      \wait_count[31]_i_4\(15) => \wait_count_reg_n_0_[15]\,
      \wait_count[31]_i_4\(14) => \wait_count_reg_n_0_[14]\,
      \wait_count[31]_i_4\(13) => \wait_count_reg_n_0_[13]\,
      \wait_count[31]_i_4\(12) => \wait_count_reg_n_0_[12]\,
      \wait_count[31]_i_4\(11) => \wait_count_reg_n_0_[11]\,
      \wait_count[31]_i_4\(10) => \wait_count_reg_n_0_[10]\,
      \wait_count[31]_i_4\(9) => \wait_count_reg_n_0_[9]\,
      \wait_count[31]_i_4\(8) => \wait_count_reg_n_0_[8]\,
      \wait_count[31]_i_4\(7) => \wait_count_reg_n_0_[7]\,
      \wait_count[31]_i_4\(6) => \wait_count_reg_n_0_[6]\,
      \wait_count[31]_i_4\(5) => \wait_count_reg_n_0_[5]\,
      \wait_count[31]_i_4\(4) => \wait_count_reg_n_0_[4]\,
      \wait_count[31]_i_4\(3) => \wait_count_reg_n_0_[3]\,
      \wait_count[31]_i_4\(2) => \wait_count_reg_n_0_[2]\,
      \wait_count[31]_i_4\(1) => \wait_count_reg_n_0_[1]\,
      \wait_count[31]_i_4\(0) => \wait_count_reg_n_0_[0]\,
      \wait_count_reg[11]\ => single_register_spi_n_13,
      \wait_count_reg[15]\ => single_register_spi_n_12,
      \wait_count_reg[15]_0\ => single_register_spi_n_17,
      \wait_count_reg[16]\ => single_register_spi_n_18,
      \wait_count_reg[18]\ => single_register_spi_n_14,
      \wait_count_reg[21]\ => single_register_spi_n_20,
      \wait_count_reg[22]\ => single_register_spi_n_16,
      \wait_count_reg[24]\ => single_register_spi_n_21,
      \wait_count_reg[27]\ => single_register_spi_n_22,
      \wait_count_reg[2]\ => single_register_spi_n_19,
      \wait_count_reg[31]\ => single_register_spi_n_15,
      who_am_i_data(7 downto 0) => \^who_am_i_data\(7 downto 0)
    );
\state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__0\(0),
      Q => state(0)
    );
\state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__0\(1),
      Q => state(1)
    );
\state_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__0\(2),
      Q => state(2)
    );
\state_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__0\(3),
      Q => state(3)
    );
\wait_count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4544444455555555"
    )
        port map (
      I0 => \wait_count_reg_n_0_[0]\,
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[0]_i_1_n_0\
    );
\wait_count[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(10),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[10]_i_1_n_0\
    );
\wait_count[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(11),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[11]_i_1_n_0\
    );
\wait_count[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(12),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[12]_i_1_n_0\
    );
\wait_count[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(13),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[13]_i_1_n_0\
    );
\wait_count[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(14),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[14]_i_1_n_0\
    );
\wait_count[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(15),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[15]_i_1_n_0\
    );
\wait_count[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(16),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[16]_i_1_n_0\
    );
\wait_count[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(17),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[17]_i_1_n_0\
    );
\wait_count[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(18),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[18]_i_1_n_0\
    );
\wait_count[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(19),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[19]_i_1_n_0\
    );
\wait_count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(1),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[1]_i_1_n_0\
    );
\wait_count[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(20),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[20]_i_1_n_0\
    );
\wait_count[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(21),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[21]_i_1_n_0\
    );
\wait_count[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(22),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[22]_i_1_n_0\
    );
\wait_count[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(23),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[23]_i_1_n_0\
    );
\wait_count[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(24),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[24]_i_1_n_0\
    );
\wait_count[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(25),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[25]_i_1_n_0\
    );
\wait_count[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(26),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[26]_i_1_n_0\
    );
\wait_count[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(27),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[27]_i_1_n_0\
    );
\wait_count[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(28),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[28]_i_1_n_0\
    );
\wait_count[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(29),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[29]_i_1_n_0\
    );
\wait_count[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(2),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[2]_i_1_n_0\
    );
\wait_count[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(30),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[30]_i_1_n_0\
    );
\wait_count[31]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFF"
    )
        port map (
      I0 => \wait_count_reg_n_0_[11]\,
      I1 => \wait_count_reg_n_0_[10]\,
      I2 => \wait_count_reg_n_0_[4]\,
      I3 => \wait_count_reg_n_0_[3]\,
      I4 => \wait_count_reg_n_0_[12]\,
      I5 => \wait_count_reg_n_0_[23]\,
      O => \wait_count[31]_i_10_n_0\
    );
\wait_count[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(31),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[31]_i_2_n_0\
    );
\wait_count[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA8"
    )
        port map (
      I0 => single_register_spi_n_1,
      I1 => single_register_spi_n_14,
      I2 => single_register_spi_n_22,
      I3 => single_register_spi_n_13,
      I4 => \wait_count[31]_i_8_n_0\,
      I5 => single_register_spi_n_16,
      O => \wait_count[31]_i_4_n_0\
    );
\wait_count[31]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      O => \wait_count[31]_i_5_n_0\
    );
\wait_count[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEEEEEEEFE"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => \wait_count[31]_i_9_n_0\,
      I3 => single_register_spi_n_15,
      I4 => \wait_count[31]_i_10_n_0\,
      I5 => single_register_spi_n_18,
      O => \wait_count[31]_i_6_n_0\
    );
\wait_count[31]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFFFFF"
    )
        port map (
      I0 => single_register_spi_n_21,
      I1 => \wait_count_reg_n_0_[7]\,
      I2 => \wait_count_reg_n_0_[15]\,
      I3 => \wait_count_reg_n_0_[6]\,
      I4 => \wait_count_reg_n_0_[14]\,
      O => \wait_count[31]_i_8_n_0\
    );
\wait_count[31]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \wait_count_reg_n_0_[19]\,
      I1 => \wait_count_reg_n_0_[14]\,
      I2 => \wait_count_reg_n_0_[9]\,
      I3 => \wait_count_reg_n_0_[22]\,
      I4 => single_register_spi_n_20,
      I5 => single_register_spi_n_19,
      O => \wait_count[31]_i_9_n_0\
    );
\wait_count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(3),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[3]_i_1_n_0\
    );
\wait_count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(4),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[4]_i_1_n_0\
    );
\wait_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(5),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[5]_i_1_n_0\
    );
\wait_count[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(6),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[6]_i_1_n_0\
    );
\wait_count[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(7),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[7]_i_1_n_0\
    );
\wait_count[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(8),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[8]_i_1_n_0\
    );
\wait_count[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888888AAAAAAAA"
    )
        port map (
      I0 => data0(9),
      I1 => \wait_count[31]_i_4_n_0\,
      I2 => \wait_count[31]_i_5_n_0\,
      I3 => state(0),
      I4 => single_register_spi_n_12,
      I5 => \wait_count[31]_i_6_n_0\,
      O => \wait_count[9]_i_1_n_0\
    );
\wait_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[0]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[0]\
    );
\wait_count_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[10]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[10]\
    );
\wait_count_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[11]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[11]\
    );
\wait_count_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[12]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[12]\
    );
\wait_count_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count_reg[8]_i_2_n_0\,
      CO(3) => \wait_count_reg[12]_i_2_n_0\,
      CO(2) => \wait_count_reg[12]_i_2_n_1\,
      CO(1) => \wait_count_reg[12]_i_2_n_2\,
      CO(0) => \wait_count_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3) => \wait_count_reg_n_0_[12]\,
      S(2) => \wait_count_reg_n_0_[11]\,
      S(1) => \wait_count_reg_n_0_[10]\,
      S(0) => \wait_count_reg_n_0_[9]\
    );
\wait_count_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[13]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[13]\
    );
\wait_count_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[14]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[14]\
    );
\wait_count_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[15]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[15]\
    );
\wait_count_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[16]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[16]\
    );
\wait_count_reg[16]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count_reg[12]_i_2_n_0\,
      CO(3) => \wait_count_reg[16]_i_2_n_0\,
      CO(2) => \wait_count_reg[16]_i_2_n_1\,
      CO(1) => \wait_count_reg[16]_i_2_n_2\,
      CO(0) => \wait_count_reg[16]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3) => \wait_count_reg_n_0_[16]\,
      S(2) => \wait_count_reg_n_0_[15]\,
      S(1) => \wait_count_reg_n_0_[14]\,
      S(0) => \wait_count_reg_n_0_[13]\
    );
\wait_count_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[17]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[17]\
    );
\wait_count_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[18]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[18]\
    );
\wait_count_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[19]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[19]\
    );
\wait_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[1]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[1]\
    );
\wait_count_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[20]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[20]\
    );
\wait_count_reg[20]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count_reg[16]_i_2_n_0\,
      CO(3) => \wait_count_reg[20]_i_2_n_0\,
      CO(2) => \wait_count_reg[20]_i_2_n_1\,
      CO(1) => \wait_count_reg[20]_i_2_n_2\,
      CO(0) => \wait_count_reg[20]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3) => \wait_count_reg_n_0_[20]\,
      S(2) => \wait_count_reg_n_0_[19]\,
      S(1) => \wait_count_reg_n_0_[18]\,
      S(0) => \wait_count_reg_n_0_[17]\
    );
\wait_count_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[21]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[21]\
    );
\wait_count_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[22]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[22]\
    );
\wait_count_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[23]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[23]\
    );
\wait_count_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[24]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[24]\
    );
\wait_count_reg[24]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count_reg[20]_i_2_n_0\,
      CO(3) => \wait_count_reg[24]_i_2_n_0\,
      CO(2) => \wait_count_reg[24]_i_2_n_1\,
      CO(1) => \wait_count_reg[24]_i_2_n_2\,
      CO(0) => \wait_count_reg[24]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3) => \wait_count_reg_n_0_[24]\,
      S(2) => \wait_count_reg_n_0_[23]\,
      S(1) => \wait_count_reg_n_0_[22]\,
      S(0) => \wait_count_reg_n_0_[21]\
    );
\wait_count_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[25]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[25]\
    );
\wait_count_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[26]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[26]\
    );
\wait_count_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[27]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[27]\
    );
\wait_count_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[28]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[28]\
    );
\wait_count_reg[28]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count_reg[24]_i_2_n_0\,
      CO(3) => \wait_count_reg[28]_i_2_n_0\,
      CO(2) => \wait_count_reg[28]_i_2_n_1\,
      CO(1) => \wait_count_reg[28]_i_2_n_2\,
      CO(0) => \wait_count_reg[28]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3) => \wait_count_reg_n_0_[28]\,
      S(2) => \wait_count_reg_n_0_[27]\,
      S(1) => \wait_count_reg_n_0_[26]\,
      S(0) => \wait_count_reg_n_0_[25]\
    );
\wait_count_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[29]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[29]\
    );
\wait_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[2]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[2]\
    );
\wait_count_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[30]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[30]\
    );
\wait_count_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[31]_i_2_n_0\,
      Q => \wait_count_reg_n_0_[31]\
    );
\wait_count_reg[31]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count_reg[28]_i_2_n_0\,
      CO(3 downto 2) => \NLW_wait_count_reg[31]_i_3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \wait_count_reg[31]_i_3_n_2\,
      CO(0) => \wait_count_reg[31]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_wait_count_reg[31]_i_3_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2) => \wait_count_reg_n_0_[31]\,
      S(1) => \wait_count_reg_n_0_[30]\,
      S(0) => \wait_count_reg_n_0_[29]\
    );
\wait_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[3]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[3]\
    );
\wait_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[4]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[4]\
    );
\wait_count_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_count_reg[4]_i_2_n_0\,
      CO(2) => \wait_count_reg[4]_i_2_n_1\,
      CO(1) => \wait_count_reg[4]_i_2_n_2\,
      CO(0) => \wait_count_reg[4]_i_2_n_3\,
      CYINIT => \wait_count_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3) => \wait_count_reg_n_0_[4]\,
      S(2) => \wait_count_reg_n_0_[3]\,
      S(1) => \wait_count_reg_n_0_[2]\,
      S(0) => \wait_count_reg_n_0_[1]\
    );
\wait_count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[5]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[5]\
    );
\wait_count_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[6]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[6]\
    );
\wait_count_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[7]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[7]\
    );
\wait_count_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[8]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[8]\
    );
\wait_count_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count_reg[4]_i_2_n_0\,
      CO(3) => \wait_count_reg[8]_i_2_n_0\,
      CO(2) => \wait_count_reg[8]_i_2_n_1\,
      CO(1) => \wait_count_reg[8]_i_2_n_2\,
      CO(0) => \wait_count_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3) => \wait_count_reg_n_0_[8]\,
      S(2) => \wait_count_reg_n_0_[7]\,
      S(1) => \wait_count_reg_n_0_[6]\,
      S(0) => \wait_count_reg_n_0_[5]\
    );
\wait_count_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => single_register_spi_n_7,
      CLR => xyz_burst_spi_n_0,
      D => \wait_count[9]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[9]\
    );
\who_am_i_data[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(1),
      I3 => state(0),
      O => \who_am_i_data[7]_i_1_n_0\
    );
\who_am_i_data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \who_am_i_data[7]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_30,
      Q => \^who_am_i_data\(0)
    );
\who_am_i_data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \who_am_i_data[7]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_29,
      Q => \^who_am_i_data\(1)
    );
\who_am_i_data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \who_am_i_data[7]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_28,
      Q => \^who_am_i_data\(2)
    );
\who_am_i_data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \who_am_i_data[7]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_27,
      Q => \^who_am_i_data\(3)
    );
\who_am_i_data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \who_am_i_data[7]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_26,
      Q => \^who_am_i_data\(4)
    );
\who_am_i_data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \who_am_i_data[7]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_25,
      Q => \^who_am_i_data\(5)
    );
\who_am_i_data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \who_am_i_data[7]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_24,
      Q => \^who_am_i_data\(6)
    );
\who_am_i_data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \who_am_i_data[7]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => single_register_spi_n_23,
      Q => \^who_am_i_data\(7)
    );
xyz_burst_spi: entity work.design_1_lis3dh_vibration_axi_0_0_lis3dh_spi_burst_reader
     port map (
      D(15 downto 0) => \p_0_in__2\(15 downto 0),
      Q(3 downto 0) => state(3 downto 0),
      burst_cs_n => burst_cs_n,
      burst_mosi => burst_mosi,
      burst_sclk => burst_sclk,
      clk => clk,
      done_reg_0 => xyz_burst_spi_n_1,
      done_reg_1 => xyz_burst_spi_n_50,
      lis3dh_miso => lis3dh_miso,
      \out\(3 downto 0) => state(3 downto 0),
      \read_data_reg[23]_0\(15) => xyz_burst_spi_n_18,
      \read_data_reg[23]_0\(14) => xyz_burst_spi_n_19,
      \read_data_reg[23]_0\(13) => xyz_burst_spi_n_20,
      \read_data_reg[23]_0\(12) => xyz_burst_spi_n_21,
      \read_data_reg[23]_0\(11) => xyz_burst_spi_n_22,
      \read_data_reg[23]_0\(10) => xyz_burst_spi_n_23,
      \read_data_reg[23]_0\(9) => xyz_burst_spi_n_24,
      \read_data_reg[23]_0\(8) => xyz_burst_spi_n_25,
      \read_data_reg[23]_0\(7) => xyz_burst_spi_n_26,
      \read_data_reg[23]_0\(6) => xyz_burst_spi_n_27,
      \read_data_reg[23]_0\(5) => xyz_burst_spi_n_28,
      \read_data_reg[23]_0\(4) => xyz_burst_spi_n_29,
      \read_data_reg[23]_0\(3) => xyz_burst_spi_n_30,
      \read_data_reg[23]_0\(2) => xyz_burst_spi_n_31,
      \read_data_reg[23]_0\(1) => xyz_burst_spi_n_32,
      \read_data_reg[23]_0\(0) => xyz_burst_spi_n_33,
      \read_data_reg[7]_0\(15) => xyz_burst_spi_n_34,
      \read_data_reg[7]_0\(14) => xyz_burst_spi_n_35,
      \read_data_reg[7]_0\(13) => xyz_burst_spi_n_36,
      \read_data_reg[7]_0\(12) => xyz_burst_spi_n_37,
      \read_data_reg[7]_0\(11) => xyz_burst_spi_n_38,
      \read_data_reg[7]_0\(10) => xyz_burst_spi_n_39,
      \read_data_reg[7]_0\(9) => xyz_burst_spi_n_40,
      \read_data_reg[7]_0\(8) => xyz_burst_spi_n_41,
      \read_data_reg[7]_0\(7) => xyz_burst_spi_n_42,
      \read_data_reg[7]_0\(6) => xyz_burst_spi_n_43,
      \read_data_reg[7]_0\(5) => xyz_burst_spi_n_44,
      \read_data_reg[7]_0\(4) => xyz_burst_spi_n_45,
      \read_data_reg[7]_0\(3) => xyz_burst_spi_n_46,
      \read_data_reg[7]_0\(2) => xyz_burst_spi_n_47,
      \read_data_reg[7]_0\(1) => xyz_burst_spi_n_48,
      \read_data_reg[7]_0\(0) => xyz_burst_spi_n_49,
      rst_n => rst_n,
      s_axi_aresetn => xyz_burst_spi_n_0,
      xyz_x(15 downto 0) => \^xyz_x\(15 downto 0),
      xyz_y(15 downto 0) => \^xyz_y\(15 downto 0),
      xyz_z(15 downto 0) => \^xyz_z\(15 downto 0)
    );
xyz_valid_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_1,
      Q => xyz_valid
    );
\xyz_x[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(1),
      I3 => state(0),
      O => \xyz_x[15]_i_1_n_0\
    );
\xyz_x_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(0),
      Q => \^xyz_x\(0)
    );
\xyz_x_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(10),
      Q => \^xyz_x\(10)
    );
\xyz_x_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(11),
      Q => \^xyz_x\(11)
    );
\xyz_x_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(12),
      Q => \^xyz_x\(12)
    );
\xyz_x_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(13),
      Q => \^xyz_x\(13)
    );
\xyz_x_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(14),
      Q => \^xyz_x\(14)
    );
\xyz_x_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(15),
      Q => \^xyz_x\(15)
    );
\xyz_x_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(1),
      Q => \^xyz_x\(1)
    );
\xyz_x_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(2),
      Q => \^xyz_x\(2)
    );
\xyz_x_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(3),
      Q => \^xyz_x\(3)
    );
\xyz_x_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(4),
      Q => \^xyz_x\(4)
    );
\xyz_x_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(5),
      Q => \^xyz_x\(5)
    );
\xyz_x_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(6),
      Q => \^xyz_x\(6)
    );
\xyz_x_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(7),
      Q => \^xyz_x\(7)
    );
\xyz_x_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(8),
      Q => \^xyz_x\(8)
    );
\xyz_x_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => \p_0_in__2\(9),
      Q => \^xyz_x\(9)
    );
\xyz_y_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_33,
      Q => \^xyz_y\(0)
    );
\xyz_y_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_23,
      Q => \^xyz_y\(10)
    );
\xyz_y_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_22,
      Q => \^xyz_y\(11)
    );
\xyz_y_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_21,
      Q => \^xyz_y\(12)
    );
\xyz_y_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_20,
      Q => \^xyz_y\(13)
    );
\xyz_y_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_19,
      Q => \^xyz_y\(14)
    );
\xyz_y_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_18,
      Q => \^xyz_y\(15)
    );
\xyz_y_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_32,
      Q => \^xyz_y\(1)
    );
\xyz_y_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_31,
      Q => \^xyz_y\(2)
    );
\xyz_y_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_30,
      Q => \^xyz_y\(3)
    );
\xyz_y_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_29,
      Q => \^xyz_y\(4)
    );
\xyz_y_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_28,
      Q => \^xyz_y\(5)
    );
\xyz_y_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_27,
      Q => \^xyz_y\(6)
    );
\xyz_y_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_26,
      Q => \^xyz_y\(7)
    );
\xyz_y_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_25,
      Q => \^xyz_y\(8)
    );
\xyz_y_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_24,
      Q => \^xyz_y\(9)
    );
\xyz_z_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_49,
      Q => \^xyz_z\(0)
    );
\xyz_z_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_39,
      Q => \^xyz_z\(10)
    );
\xyz_z_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_38,
      Q => \^xyz_z\(11)
    );
\xyz_z_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_37,
      Q => \^xyz_z\(12)
    );
\xyz_z_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_36,
      Q => \^xyz_z\(13)
    );
\xyz_z_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_35,
      Q => \^xyz_z\(14)
    );
\xyz_z_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_34,
      Q => \^xyz_z\(15)
    );
\xyz_z_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_48,
      Q => \^xyz_z\(1)
    );
\xyz_z_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_47,
      Q => \^xyz_z\(2)
    );
\xyz_z_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_46,
      Q => \^xyz_z\(3)
    );
\xyz_z_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_45,
      Q => \^xyz_z\(4)
    );
\xyz_z_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_44,
      Q => \^xyz_z\(5)
    );
\xyz_z_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_43,
      Q => \^xyz_z\(6)
    );
\xyz_z_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_42,
      Q => \^xyz_z\(7)
    );
\xyz_z_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_41,
      Q => \^xyz_z\(8)
    );
\xyz_z_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \xyz_x[15]_i_1_n_0\,
      CLR => xyz_burst_spi_n_0,
      D => xyz_burst_spi_n_40,
      Q => \^xyz_z\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0_vibration_processing_pipeline is
  port (
    result_sample_count : out STD_LOGIC_VECTOR ( 0 to 0 );
    overflow : out STD_LOGIC;
    xyz_ready : out STD_LOGIC;
    snapshot_seq0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \result_sum_squares_reg[34]\ : out STD_LOGIC_VECTOR ( 34 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    \sum_squares_accumulator_reg[0]\ : in STD_LOGIC;
    xyz_valid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_lis3dh_vibration_axi_0_0_vibration_processing_pipeline : entity is "vibration_processing_pipeline";
end design_1_lis3dh_vibration_axi_0_0_vibration_processing_pipeline;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0_vibration_processing_pipeline is
  signal B : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal frame_fifo_n_17 : STD_LOGIC;
  signal frame_fifo_n_18 : STD_LOGIC;
  signal frame_fifo_n_19 : STD_LOGIC;
  signal frame_fifo_n_20 : STD_LOGIC;
  signal frame_fifo_n_21 : STD_LOGIC;
  signal frame_fifo_n_22 : STD_LOGIC;
  signal frame_fifo_n_23 : STD_LOGIC;
  signal frame_fifo_n_24 : STD_LOGIC;
  signal frame_fifo_n_25 : STD_LOGIC;
  signal frame_fifo_n_26 : STD_LOGIC;
  signal frame_fifo_n_27 : STD_LOGIC;
  signal frame_fifo_n_28 : STD_LOGIC;
  signal frame_fifo_n_29 : STD_LOGIC;
  signal frame_fifo_n_30 : STD_LOGIC;
  signal frame_fifo_n_31 : STD_LOGIC;
  signal frame_fifo_n_32 : STD_LOGIC;
  signal frame_fifo_n_33 : STD_LOGIC;
  signal frame_fifo_n_49 : STD_LOGIC;
  signal frame_fifo_n_50 : STD_LOGIC;
  signal frame_fifo_n_51 : STD_LOGIC;
  signal frame_fifo_n_52 : STD_LOGIC;
  signal frame_fifo_n_53 : STD_LOGIC;
  signal frame_fifo_n_54 : STD_LOGIC;
  signal frame_fifo_n_55 : STD_LOGIC;
  signal frame_fifo_n_56 : STD_LOGIC;
  signal frame_fifo_n_58 : STD_LOGIC;
  signal frame_fifo_n_61 : STD_LOGIC;
  signal \last_sample__3\ : STD_LOGIC;
  signal next_peak : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal peak_accumulator : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal result_valid : STD_LOGIC;
  signal sample_accept : STD_LOGIC;
  signal \sample_data__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal x_axis_features_n_1 : STD_LOGIC;
begin
frame_fifo: entity work.design_1_lis3dh_vibration_axi_0_0_vibration_frame_fifo
     port map (
      B(14 downto 0) => B(15 downto 1),
      CO(0) => x_axis_features_n_1,
      D(15 downto 0) => next_peak(15 downto 0),
      DI(3) => frame_fifo_n_21,
      DI(2) => frame_fifo_n_22,
      DI(1) => frame_fifo_n_23,
      DI(0) => frame_fifo_n_24,
      E(0) => frame_fifo_n_58,
      Q(15 downto 0) => peak_accumulator(15 downto 0),
      S(3) => frame_fifo_n_17,
      S(2) => frame_fifo_n_18,
      S(1) => frame_fifo_n_19,
      S(0) => frame_fifo_n_20,
      \frame_memory_reg[0][47]_0\(15 downto 0) => D(15 downto 0),
      \last_sample__3\ => \last_sample__3\,
      \level_reg[1]_0\(0) => sample_accept,
      \level_reg[3]_0\ => \sum_squares_accumulator_reg[0]\,
      overflow => overflow,
      \peak_accumulator_reg[15]\(8) => frame_fifo_n_25,
      \peak_accumulator_reg[15]\(7) => frame_fifo_n_26,
      \peak_accumulator_reg[15]\(6) => frame_fifo_n_27,
      \peak_accumulator_reg[15]\(5) => frame_fifo_n_28,
      \peak_accumulator_reg[15]\(4) => frame_fifo_n_29,
      \peak_accumulator_reg[15]\(3) => frame_fifo_n_30,
      \peak_accumulator_reg[15]\(2) => frame_fifo_n_31,
      \peak_accumulator_reg[15]\(1) => frame_fifo_n_32,
      \peak_accumulator_reg[15]\(0) => frame_fifo_n_33,
      \peak_accumulator_reg[6]\(3) => frame_fifo_n_53,
      \peak_accumulator_reg[6]\(2) => frame_fifo_n_54,
      \peak_accumulator_reg[6]\(1) => frame_fifo_n_55,
      \peak_accumulator_reg[6]\(0) => frame_fifo_n_56,
      \peak_accumulator_reg[7]\(3) => frame_fifo_n_49,
      \peak_accumulator_reg[7]\(2) => frame_fifo_n_50,
      \peak_accumulator_reg[7]\(1) => frame_fifo_n_51,
      \peak_accumulator_reg[7]\(0) => frame_fifo_n_52,
      result_valid => result_valid,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_aresetn_0 => frame_fifo_n_61,
      \sample_data__0\(0) => \sample_data__0\(0),
      xyz_ready => xyz_ready,
      xyz_valid => xyz_valid
    );
x_axis_features: entity work.design_1_lis3dh_vibration_axi_0_0_vibration_window_features
     port map (
      A(15 downto 1) => B(15 downto 1),
      A(0) => \sample_data__0\(0),
      CO(0) => x_axis_features_n_1,
      D(8) => frame_fifo_n_25,
      D(7) => frame_fifo_n_26,
      D(6) => frame_fifo_n_27,
      D(5) => frame_fifo_n_28,
      D(4) => frame_fifo_n_29,
      D(3) => frame_fifo_n_30,
      D(2) => frame_fifo_n_31,
      D(1) => frame_fifo_n_32,
      D(0) => frame_fifo_n_33,
      DI(3) => frame_fifo_n_21,
      DI(2) => frame_fifo_n_22,
      DI(1) => frame_fifo_n_23,
      DI(0) => frame_fifo_n_24,
      E(0) => frame_fifo_n_58,
      Q(15 downto 0) => peak_accumulator(15 downto 0),
      S(3) => frame_fifo_n_17,
      S(2) => frame_fifo_n_18,
      S(1) => frame_fifo_n_19,
      S(0) => frame_fifo_n_20,
      \last_sample__3\ => \last_sample__3\,
      \next_peak1_carry__0_0\(3) => frame_fifo_n_53,
      \next_peak1_carry__0_0\(2) => frame_fifo_n_54,
      \next_peak1_carry__0_0\(1) => frame_fifo_n_55,
      \next_peak1_carry__0_0\(0) => frame_fifo_n_56,
      \next_peak1_carry__0_1\(3) => frame_fifo_n_49,
      \next_peak1_carry__0_1\(2) => frame_fifo_n_50,
      \next_peak1_carry__0_1\(1) => frame_fifo_n_51,
      \next_peak1_carry__0_1\(0) => frame_fifo_n_52,
      \peak_accumulator_reg[15]_0\(0) => sample_accept,
      \result_peak_reg[15]_0\(15 downto 0) => Q(15 downto 0),
      \result_peak_reg[15]_1\(15 downto 0) => next_peak(15 downto 0),
      result_sample_count(0) => result_sample_count(0),
      \result_sum_squares_reg[34]_0\(34 downto 0) => \result_sum_squares_reg[34]\(34 downto 0),
      result_valid => result_valid,
      result_valid_reg_0 => frame_fifo_n_61,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      snapshot_seq0 => snapshot_seq0,
      \sum_squares_accumulator_reg[0]_0\ => \sum_squares_accumulator_reg[0]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_peripheral is
  port (
    lis3dh_cs_n : out STD_LOGIC;
    lis3dh_sclk : out STD_LOGIC;
    lis3dh_mosi : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid_reg : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_rvalid_reg : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    lis3dh_miso : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_peripheral : entity is "lis3dh_vibration_axi_peripheral";
end design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_peripheral;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_peripheral is
  signal init_done : STD_LOGIC;
  signal init_error : STD_LOGIC;
  signal overflow : STD_LOGIC;
  signal registers_n_0 : STD_LOGIC;
  signal result_peak : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal result_sample_count : STD_LOGIC_VECTOR ( 4 to 4 );
  signal result_sum_squares : STD_LOGIC_VECTOR ( 34 downto 0 );
  signal sample_drop_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sample_ready : STD_LOGIC;
  signal sensor_overrun : STD_LOGIC;
  signal snapshot_seq0 : STD_LOGIC;
  signal xyz_valid : STD_LOGIC;
  signal xyz_x : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_sensor_sample_drop_UNCONNECTED : STD_LOGIC;
  signal NLW_sensor_spi_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_sensor_who_am_i_data_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_sensor_xyz_y_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_sensor_xyz_z_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOOT_WAIT : string;
  attribute BOOT_WAIT of sensor : label is "4'b0000";
  attribute BURST_START : string;
  attribute BURST_START of sensor : label is "4'b1011";
  attribute BURST_WAIT : string;
  attribute BURST_WAIT of sensor : label is "4'b1100";
  attribute CFG1_START : string;
  attribute CFG1_START of sensor : label is "4'b0101";
  attribute CFG1_WAIT : string;
  attribute CFG1_WAIT of sensor : label is "4'b0110";
  attribute CFG4_START : string;
  attribute CFG4_START of sensor : label is "4'b0011";
  attribute CFG4_WAIT : string;
  attribute CFG4_WAIT of sensor : label is "4'b0100";
  attribute CTRL_REG1_ADDR : string;
  attribute CTRL_REG1_ADDR of sensor : label is "6'b100000";
  attribute CTRL_REG1_VALUE : string;
  attribute CTRL_REG1_VALUE of sensor : label is "8'b01010111";
  attribute CTRL_REG4_ADDR : string;
  attribute CTRL_REG4_ADDR of sensor : label is "6'b100011";
  attribute CTRL_REG4_VALUE : string;
  attribute CTRL_REG4_VALUE of sensor : label is "8'b10001000";
  attribute FATAL : string;
  attribute FATAL of sensor : label is "4'b1110";
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of sensor : label is "soft";
  attribute OUTPUT_SAMPLE : string;
  attribute OUTPUT_SAMPLE of sensor : label is "4'b1101";
  attribute POLL_PERIOD_CYCLES : integer;
  attribute POLL_PERIOD_CYCLES of sensor : label is 50000;
  attribute POLL_WAIT : string;
  attribute POLL_WAIT of sensor : label is "4'b1000";
  attribute POWER_UP_DELAY_CYCLES : integer;
  attribute POWER_UP_DELAY_CYCLES of sensor : label is 500000;
  attribute SETTLE_DELAY_CYCLES : integer;
  attribute SETTLE_DELAY_CYCLES of sensor : label is 5000000;
  attribute SETTLE_WAIT : string;
  attribute SETTLE_WAIT of sensor : label is "4'b0111";
  attribute SPI_HALF_PERIOD_CYCLES : integer;
  attribute SPI_HALF_PERIOD_CYCLES of sensor : label is 25;
  attribute STATUS_REG_ADDR : string;
  attribute STATUS_REG_ADDR of sensor : label is "6'b100111";
  attribute STATUS_START : string;
  attribute STATUS_START of sensor : label is "4'b1001";
  attribute STATUS_WAIT : string;
  attribute STATUS_WAIT of sensor : label is "4'b1010";
  attribute WHO_AM_I_ADDR : string;
  attribute WHO_AM_I_ADDR of sensor : label is "6'b001111";
  attribute WHO_AM_I_EXPECTED : string;
  attribute WHO_AM_I_EXPECTED of sensor : label is "8'b00110011";
  attribute WHO_START : string;
  attribute WHO_START of sensor : label is "4'b0001";
  attribute WHO_WAIT : string;
  attribute WHO_WAIT of sensor : label is "4'b0010";
begin
processing: entity work.design_1_lis3dh_vibration_axi_0_0_vibration_processing_pipeline
     port map (
      D(15 downto 0) => xyz_x(15 downto 0),
      Q(15 downto 0) => result_peak(15 downto 0),
      overflow => overflow,
      result_sample_count(0) => result_sample_count(4),
      \result_sum_squares_reg[34]\(34 downto 0) => result_sum_squares(34 downto 0),
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      snapshot_seq0 => snapshot_seq0,
      \sum_squares_accumulator_reg[0]\ => registers_n_0,
      xyz_ready => sample_ready,
      xyz_valid => xyz_valid
    );
registers: entity work.design_1_lis3dh_vibration_axi_0_0_vibration_axi_lite_slave
     port map (
      D(15 downto 0) => result_peak(15 downto 0),
      error => init_error,
      init_done => init_done,
      overflow => overflow,
      result_sample_count(0) => result_sample_count(4),
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(11 downto 0) => s_axi_araddr(11 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_aresetn_0 => registers_n_0,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(11 downto 0) => s_axi_awaddr(11 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => s_axi_bresp(0),
      s_axi_bvalid_reg_0 => s_axi_bvalid_reg,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => s_axi_rresp(0),
      s_axi_rvalid_reg_0 => s_axi_rvalid_reg,
      s_axi_wready => s_axi_wready,
      s_axi_wvalid => s_axi_wvalid,
      sample_drop_count(31 downto 0) => sample_drop_count(31 downto 0),
      sensor_overrun => sensor_overrun,
      snapshot_seq0 => snapshot_seq0,
      \snapshot_sumsq_reg[34]_0\(34 downto 0) => result_sum_squares(34 downto 0)
    );
sensor: entity work.design_1_lis3dh_vibration_axi_0_0_lis3dh_xyz_acquisition
     port map (
      clk => s_axi_aclk,
      error => init_error,
      init_done => init_done,
      lis3dh_cs_n => lis3dh_cs_n,
      lis3dh_miso => lis3dh_miso,
      lis3dh_mosi => lis3dh_mosi,
      lis3dh_sclk => lis3dh_sclk,
      rst_n => s_axi_aresetn,
      sample_drop => NLW_sensor_sample_drop_UNCONNECTED,
      sample_drop_count(31 downto 0) => sample_drop_count(31 downto 0),
      sensor_overrun => sensor_overrun,
      spi_busy => NLW_sensor_spi_busy_UNCONNECTED,
      who_am_i_data(7 downto 0) => NLW_sensor_who_am_i_data_UNCONNECTED(7 downto 0),
      xyz_ready => sample_ready,
      xyz_valid => xyz_valid,
      xyz_x(15 downto 0) => xyz_x(15 downto 0),
      xyz_y(15 downto 0) => NLW_sensor_xyz_y_UNCONNECTED(15 downto 0),
      xyz_z(15 downto 0) => NLW_sensor_xyz_z_UNCONNECTED(15 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_wrapper is
  port (
    lis3dh_cs_n : out STD_LOGIC;
    lis3dh_sclk : out STD_LOGIC;
    lis3dh_mosi : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid_reg : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_rvalid_reg : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    lis3dh_miso : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bready : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_wrapper : entity is "lis3dh_vibration_axi_wrapper";
end design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_wrapper;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_wrapper is
begin
peripheral: entity work.design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_peripheral
     port map (
      lis3dh_cs_n => lis3dh_cs_n,
      lis3dh_miso => lis3dh_miso,
      lis3dh_mosi => lis3dh_mosi,
      lis3dh_sclk => lis3dh_sclk,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(11 downto 0) => s_axi_araddr(11 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(11 downto 0) => s_axi_awaddr(11 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => s_axi_bresp(0),
      s_axi_bvalid_reg => s_axi_bvalid_reg,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => s_axi_rresp(0),
      s_axi_rvalid_reg => s_axi_rvalid_reg,
      s_axi_wready => s_axi_wready,
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_lis3dh_vibration_axi_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    lis3dh_cs_n : out STD_LOGIC;
    lis3dh_sclk : out STD_LOGIC;
    lis3dh_mosi : out STD_LOGIC;
    lis3dh_miso : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_lis3dh_vibration_axi_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_lis3dh_vibration_axi_0_0 : entity is "design_1_lis3dh_vibration_axi_0_0,lis3dh_vibration_axi_wrapper,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_lis3dh_vibration_axi_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_lis3dh_vibration_axi_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_lis3dh_vibration_axi_0_0 : entity is "lis3dh_vibration_axi_wrapper,Vivado 2023.2";
end design_1_lis3dh_vibration_axi_0_0;

architecture STRUCTURE of design_1_lis3dh_vibration_axi_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_axi_aclk : signal is "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s_axi_aresetn : signal is "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s_axi_rready : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 12, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute X_INTERFACE_INFO of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute X_INTERFACE_INFO of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  attribute X_INTERFACE_INFO of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute X_INTERFACE_INFO of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  attribute X_INTERFACE_INFO of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute X_INTERFACE_INFO of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute X_INTERFACE_INFO of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute X_INTERFACE_INFO of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
  s_axi_bresp(1) <= \^s_axi_bresp\(1);
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \^s_axi_rresp\(1);
  s_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_lis3dh_vibration_axi_0_0_lis3dh_vibration_axi_wrapper
     port map (
      lis3dh_cs_n => lis3dh_cs_n,
      lis3dh_miso => lis3dh_miso,
      lis3dh_mosi => lis3dh_mosi,
      lis3dh_sclk => lis3dh_sclk,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(11 downto 0) => s_axi_araddr(11 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(11 downto 0) => s_axi_awaddr(11 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => \^s_axi_bresp\(1),
      s_axi_bvalid_reg => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => \^s_axi_rresp\(1),
      s_axi_rvalid_reg => s_axi_rvalid,
      s_axi_wready => s_axi_wready,
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
