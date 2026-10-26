`timescale 1ns/1ps

// First PL processing-chain integration:
//   signed XYZ source -> frame FIFO -> X-axis window features
//
// Y and Z remain part of the FIFO frame and are exposed as observation ports,
// but are not consumed by the feature accumulator in this version.
module vibration_processing_pipeline #(
    parameter integer SAMPLE_WIDTH = 16,
    parameter integer FIFO_DEPTH   = 8,
    parameter integer WINDOW_SIZE  = 16
) (
    input  wire                           clk,
    input  wire                           rst_n,

    input  wire                           sample_valid,
    output wire                           sample_ready,
    input  wire signed [SAMPLE_WIDTH-1:0] sample_x,
    input  wire signed [SAMPLE_WIDTH-1:0] sample_y,
    input  wire signed [SAMPLE_WIDTH-1:0] sample_z,

    output wire                           result_valid,
    input  wire                           result_ready,
    output wire [SAMPLE_WIDTH-1:0]         result_peak,
    output wire [(2*SAMPLE_WIDTH-1)+
                 ((WINDOW_SIZE <= 1) ? 0 : $clog2(WINDOW_SIZE))-1:0]
                                                result_sum_squares,
    output wire [$clog2(WINDOW_SIZE+1)-1:0] result_sample_count,

    output wire                           fifo_full,
    output wire                           fifo_empty,
    output wire [$clog2(FIFO_DEPTH+1)-1:0] fifo_level,
    output wire                           fifo_overflow,

    // Observation ports for integration simulation and future ILA probing.
    output wire                           fifo_frame_valid,
    output wire                           fifo_frame_ready,
    output wire signed [SAMPLE_WIDTH-1:0] fifo_frame_x,
    output wire signed [SAMPLE_WIDTH-1:0] fifo_frame_y,
    output wire signed [SAMPLE_WIDTH-1:0] fifo_frame_z
);

    vibration_frame_fifo #(
        .SAMPLE_WIDTH(SAMPLE_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) frame_fifo (
        .clk(clk),
        .rst_n(rst_n),
        .sample_valid(sample_valid),
        .sample_ready(sample_ready),
        .sample_x(sample_x),
        .sample_y(sample_y),
        .sample_z(sample_z),
        .frame_valid(fifo_frame_valid),
        .frame_ready(fifo_frame_ready),
        .frame_x(fifo_frame_x),
        .frame_y(fifo_frame_y),
        .frame_z(fifo_frame_z),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty),
        .fifo_level(fifo_level),
        .overflow(fifo_overflow)
    );

    vibration_window_features #(
        .SAMPLE_WIDTH(SAMPLE_WIDTH),
        .WINDOW_SIZE(WINDOW_SIZE)
    ) x_axis_features (
        .clk(clk),
        .rst_n(rst_n),
        .sample_valid(fifo_frame_valid),
        .sample_ready(fifo_frame_ready),
        .sample_data(fifo_frame_x),
        .result_valid(result_valid),
        .result_ready(result_ready),
        .result_peak(result_peak),
        .result_sum_squares(result_sum_squares),
        .result_sample_count(result_sample_count)
    );

endmodule
