`timescale 1ns/1ps

// Independent PS/PL integration candidate. Use one 50 MHz FCLK0 domain for
// AXI, sensor sampling and feature processing; s_axi_aresetn must be a reset
// synchronized to that clock (for example proc_sys_reset/peripheral_aresetn).
// This does not replace the hardware-verified ILA board top.
module lis3dh_vibration_axi_peripheral (
    input  wire        s_axi_aclk,
    input  wire        s_axi_aresetn,
    input  wire [11:0] s_axi_awaddr,
    input  wire [2:0]  s_axi_awprot,
    input  wire        s_axi_awvalid,
    output wire        s_axi_awready,
    input  wire [31:0] s_axi_wdata,
    input  wire [3:0]  s_axi_wstrb,
    input  wire        s_axi_wvalid,
    output wire        s_axi_wready,
    output wire [1:0]  s_axi_bresp,
    output wire        s_axi_bvalid,
    input  wire        s_axi_bready,
    input  wire [11:0] s_axi_araddr,
    input  wire [2:0]  s_axi_arprot,
    input  wire        s_axi_arvalid,
    output wire        s_axi_arready,
    output wire [31:0] s_axi_rdata,
    output wire [1:0]  s_axi_rresp,
    output wire        s_axi_rvalid,
    input  wire        s_axi_rready,
    output wire        lis3dh_cs_n,
    output wire        lis3dh_sclk,
    output wire        lis3dh_mosi,
    input  wire        lis3dh_miso
);
    wire signed [15:0] xyz_x, xyz_y, xyz_z;
    wire xyz_valid, sample_ready;
    wire [31:0] sample_drop_count;
    wire sensor_overrun, init_done, init_error, fifo_overflow;
    wire result_valid, result_ready;
    wire [15:0] result_peak;
    wire [34:0] result_sum_squares;
    wire [4:0] result_sample_count;

    lis3dh_xyz_acquisition sensor (
        .clk(s_axi_aclk), .rst_n(s_axi_aresetn),
        .lis3dh_cs_n(lis3dh_cs_n), .lis3dh_sclk(lis3dh_sclk),
        .lis3dh_mosi(lis3dh_mosi), .lis3dh_miso(lis3dh_miso),
        .xyz_ready(sample_ready), .xyz_x(xyz_x), .xyz_y(xyz_y),
        .xyz_z(xyz_z), .xyz_valid(xyz_valid),
        .sample_drop(), .sample_drop_count(sample_drop_count),
        .sensor_overrun(sensor_overrun), .who_am_i_data(),
        .init_done(init_done), .error(init_error), .spi_busy()
    );

    vibration_processing_pipeline #(
        .SAMPLE_WIDTH(16), .FIFO_DEPTH(8), .WINDOW_SIZE(16)
    ) processing (
        .clk(s_axi_aclk), .rst_n(s_axi_aresetn),
        .sample_valid(xyz_valid), .sample_ready(sample_ready),
        .sample_x(xyz_x), .sample_y(xyz_y), .sample_z(xyz_z),
        .result_valid(result_valid), .result_ready(result_ready),
        .result_peak(result_peak), .result_sum_squares(result_sum_squares),
        .result_sample_count(result_sample_count),
        .fifo_full(), .fifo_empty(), .fifo_level(),
        .fifo_overflow(fifo_overflow),
        .fifo_frame_valid(), .fifo_frame_ready(),
        .fifo_frame_x(), .fifo_frame_y(), .fifo_frame_z()
    );

    vibration_axi_lite_slave registers (
        .s_axi_aclk(s_axi_aclk), .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_axi_awaddr), .s_axi_awprot(s_axi_awprot),
        .s_axi_awvalid(s_axi_awvalid), .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata), .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid), .s_axi_wready(s_axi_wready),
        .s_axi_bresp(s_axi_bresp), .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr), .s_axi_arprot(s_axi_arprot),
        .s_axi_arvalid(s_axi_arvalid), .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata), .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid), .s_axi_rready(s_axi_rready),
        .result_valid(result_valid), .result_ready(result_ready),
        .result_peak(result_peak),
        .result_sum_squares(result_sum_squares),
        .result_sample_count(result_sample_count),
        .init_done(init_done), .init_error(init_error),
        .sensor_overrun(sensor_overrun), .fifo_overflow(fifo_overflow),
        .sample_drop_count(sample_drop_count)
    );
endmodule
