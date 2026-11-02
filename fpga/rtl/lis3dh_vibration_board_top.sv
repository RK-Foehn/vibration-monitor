`timescale 1ns/1ps

// Navigator ZYNQ XC7Z020 board wrapper for real LIS3DH -> FIFO -> raw-X
// Peak/Sum-of-Squares validation. No PS, DMA, FFT, or extra package pins.
module lis3dh_vibration_board_top (
    input  wire sys_clk,
    input  wire sys_rst_n,
    output wire lis3dh_cs_n,
    output wire lis3dh_sclk,
    output wire lis3dh_mosi,
    input  wire lis3dh_miso
);
    // Same external PL_RESET treatment as the validated XYZ-only board top.
    (* ASYNC_REG = "TRUE" *) reg [1:0] reset_sync;
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) reset_sync <= 2'b00;
        else reset_sync <= {reset_sync[0], 1'b1};
    end
    wire rst_n_sync = reset_sync[1];

    // Internal ILA candidates, not extra external outputs. The results use
    // raw X-axis counts and include gravity/DC; they are not vibration RMS.
    (* mark_debug = "true" *) wire [7:0] who_am_i_data;
    (* mark_debug = "true" *) wire init_done;
    (* mark_debug = "true" *) wire init_error;
    (* mark_debug = "true" *) wire xyz_valid;
    (* mark_debug = "true" *) wire signed [15:0] xyz_x;
    (* mark_debug = "true" *) wire signed [15:0] xyz_y;
    (* mark_debug = "true" *) wire signed [15:0] xyz_z;
    (* mark_debug = "true" *) wire sample_ready;
    (* mark_debug = "true" *) wire sample_accepted;
    (* mark_debug = "true" *) wire sample_drop;
    (* mark_debug = "true" *) wire [31:0] sample_drop_count;
    (* mark_debug = "true" *) wire sensor_overrun;
    (* mark_debug = "true" *) wire fifo_full;
    (* mark_debug = "true" *) wire fifo_empty;
    (* mark_debug = "true" *) wire [3:0] fifo_level;
    (* mark_debug = "true" *) wire fifo_overflow;
    (* mark_debug = "true" *) wire result_valid;
    (* mark_debug = "true" *) wire [15:0] result_peak;
    (* mark_debug = "true" *) wire [34:0] result_sum_squares;
    (* mark_debug = "true" *) wire [4:0] result_sample_count;
    (* mark_debug = "true" *) wire spi_busy;
    (* mark_debug = "true" *) wire lis3dh_cs_n_debug;
    (* mark_debug = "true" *) wire lis3dh_sclk_debug;
    (* mark_debug = "true" *) wire lis3dh_mosi_debug;
    (* mark_debug = "true" *) wire lis3dh_miso_debug;

    assign lis3dh_cs_n = lis3dh_cs_n_debug;
    assign lis3dh_sclk = lis3dh_sclk_debug;
    assign lis3dh_mosi = lis3dh_mosi_debug;
    assign lis3dh_miso_debug = lis3dh_miso;

    lis3dh_vibration_pipeline #(
        .FIFO_DEPTH(8), .WINDOW_SIZE(16)
    ) pipeline (
        .clk(sys_clk), .rst_n(rst_n_sync),
        .lis3dh_cs_n(lis3dh_cs_n_debug),
        .lis3dh_sclk(lis3dh_sclk_debug),
        .lis3dh_mosi(lis3dh_mosi_debug),
        .lis3dh_miso(lis3dh_miso_debug),
        .xyz_x(xyz_x), .xyz_y(xyz_y), .xyz_z(xyz_z),
        .xyz_valid(xyz_valid), .sample_ready(sample_ready),
        .sample_accepted(sample_accepted), .sample_drop(sample_drop),
        .sample_drop_count(sample_drop_count),
        .sensor_overrun(sensor_overrun), .who_am_i_data(who_am_i_data),
        .init_done(init_done), .init_error(init_error), .spi_busy(spi_busy),
        .fifo_full(fifo_full), .fifo_empty(fifo_empty),
        .fifo_level(fifo_level), .fifo_overflow(fifo_overflow),
        .fifo_frame_valid(), .fifo_frame_ready(),
        .fifo_frame_x(), .fifo_frame_y(), .fifo_frame_z(),
        .result_valid(result_valid), .result_peak(result_peak),
        .result_sum_squares(result_sum_squares),
        .result_sample_count(result_sample_count)
    );
endmodule
