`timescale 1ns/1ps

// One clock domain: LIS3DH -> XYZ pulse -> FIFO -> raw X-axis window features.
// The sensor cannot be stalled. A pulse presented while sample_ready=0 is
// intentionally dropped and counted by lis3dh_xyz_acquisition; the FIFO does
// not accept it. result_ready is tied high for this first hardware bring-up.
module lis3dh_vibration_pipeline #(
    parameter integer FIFO_DEPTH = 8,
    parameter integer WINDOW_SIZE = 16,
    parameter integer POWER_UP_DELAY_CYCLES = 500_000,
    parameter integer SETTLE_DELAY_CYCLES = 5_000_000,
    parameter integer POLL_PERIOD_CYCLES = 50_000,
    parameter integer SPI_HALF_PERIOD_CYCLES = 25
) (
    input  wire clk,
    input  wire rst_n,
    output wire lis3dh_cs_n,
    output wire lis3dh_sclk,
    output wire lis3dh_mosi,
    input  wire lis3dh_miso,

    output wire signed [15:0] xyz_x,
    output wire signed [15:0] xyz_y,
    output wire signed [15:0] xyz_z,
    output wire xyz_valid,
    output wire sample_ready,
    output wire sample_accepted,
    output wire sample_drop,
    output wire [31:0] sample_drop_count,
    output wire sensor_overrun,
    output wire [7:0] who_am_i_data,
    output wire init_done,
    output wire init_error,
    output wire spi_busy,

    output wire fifo_full,
    output wire fifo_empty,
    output wire [$clog2(FIFO_DEPTH+1)-1:0] fifo_level,
    output wire fifo_overflow,
    output wire fifo_frame_valid,
    output wire fifo_frame_ready,
    output wire signed [15:0] fifo_frame_x,
    output wire signed [15:0] fifo_frame_y,
    output wire signed [15:0] fifo_frame_z,

    output wire result_valid,
    output wire [15:0] result_peak,
    output wire [30+((WINDOW_SIZE <= 1) ? 0 : $clog2(WINDOW_SIZE)):0]
                result_sum_squares,
    output wire [$clog2(WINDOW_SIZE+1)-1:0] result_sample_count
);
    assign sample_accepted = xyz_valid && sample_ready;

    lis3dh_xyz_acquisition #(
        .POWER_UP_DELAY_CYCLES(POWER_UP_DELAY_CYCLES),
        .SETTLE_DELAY_CYCLES(SETTLE_DELAY_CYCLES),
        .POLL_PERIOD_CYCLES(POLL_PERIOD_CYCLES),
        .SPI_HALF_PERIOD_CYCLES(SPI_HALF_PERIOD_CYCLES)
    ) sensor (
        .clk(clk), .rst_n(rst_n), .xyz_ready(sample_ready),
        .xyz_x(xyz_x), .xyz_y(xyz_y), .xyz_z(xyz_z),
        .xyz_valid(xyz_valid), .sample_drop(sample_drop),
        .sample_drop_count(sample_drop_count),
        .sensor_overrun(sensor_overrun), .who_am_i_data(who_am_i_data),
        .init_done(init_done), .error(init_error), .spi_busy(spi_busy),
        .lis3dh_cs_n(lis3dh_cs_n), .lis3dh_sclk(lis3dh_sclk),
        .lis3dh_mosi(lis3dh_mosi), .lis3dh_miso(lis3dh_miso)
    );

    vibration_processing_pipeline #(
        .SAMPLE_WIDTH(16), .FIFO_DEPTH(FIFO_DEPTH),
        .WINDOW_SIZE(WINDOW_SIZE)
    ) processing (
        .clk(clk), .rst_n(rst_n),
        .sample_valid(xyz_valid), .sample_ready(sample_ready),
        .sample_x(xyz_x), .sample_y(xyz_y), .sample_z(xyz_z),
        .result_valid(result_valid), .result_ready(1'b1),
        .result_peak(result_peak),
        .result_sum_squares(result_sum_squares),
        .result_sample_count(result_sample_count),
        .fifo_full(fifo_full), .fifo_empty(fifo_empty),
        .fifo_level(fifo_level), .fifo_overflow(fifo_overflow),
        .fifo_frame_valid(fifo_frame_valid),
        .fifo_frame_ready(fifo_frame_ready),
        .fifo_frame_x(fifo_frame_x), .fifo_frame_y(fifo_frame_y),
        .fifo_frame_z(fifo_frame_z)
    );
endmodule
