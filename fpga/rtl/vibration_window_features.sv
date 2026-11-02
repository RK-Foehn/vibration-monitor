`timescale 1ns/1ps

// Fixed-length window feature accumulator for one signed vibration channel.
//
// A sample is consumed only on sample_valid && sample_ready. One result is
// produced per WINDOW_SIZE accepted samples and is held until
// result_valid && result_ready. No square root is performed here.
module vibration_window_features #(
    parameter integer SAMPLE_WIDTH  = 16,
    parameter integer WINDOW_SIZE  = 16
) (
    input  wire clk,
    input  wire rst_n,

    input  wire                           sample_valid,
    output wire                           sample_ready,
    input  wire signed [SAMPLE_WIDTH-1:0] sample_data,

    output reg                            result_valid,
    input  wire                           result_ready,
    output reg [SAMPLE_WIDTH-1:0]         result_peak,
    output reg [(2*SAMPLE_WIDTH-1)+
                ((WINDOW_SIZE <= 1) ? 0 : $clog2(WINDOW_SIZE))-1:0]
                                               result_sum_squares,
    output reg [$clog2(WINDOW_SIZE+1)-1:0] result_sample_count
);

    localparam integer FULL_SQUARE_WIDTH = 2 * SAMPLE_WIDTH;
    localparam integer SQUARE_WIDTH = FULL_SQUARE_WIDTH - 1;
    localparam integer SUM_WIDTH =
        SQUARE_WIDTH + ((WINDOW_SIZE <= 1) ? 0 : $clog2(WINDOW_SIZE));
    localparam integer COUNT_WIDTH = $clog2(WINDOW_SIZE + 1);

    reg [SAMPLE_WIDTH-1:0] peak_accumulator;
    reg [SUM_WIDTH-1:0]    sum_squares_accumulator;
    reg [COUNT_WIDTH-1:0]  sample_count;

    wire [SAMPLE_WIDTH-1:0] sample_magnitude;
    wire [FULL_SQUARE_WIDTH-1:0] sample_square_full;
    wire [SQUARE_WIDTH-1:0] sample_square;
    wire [SAMPLE_WIDTH-1:0] next_peak;
    wire [SUM_WIDTH-1:0]    extended_square;
    wire [SUM_WIDTH-1:0]    next_sum_squares;
    wire                    sample_accept;
    wire                    last_sample;

    // Two's-complement magnitude in the original unsigned width. This maps
    // the most-negative input (for example 16'h8000) to unsigned 16'h8000,
    // rather than overflowing back to a negative signed value.
    assign sample_magnitude = sample_data[SAMPLE_WIDTH-1]
                            ? (~sample_data[SAMPLE_WIDTH-1:0] + 1'b1)
                            : sample_data[SAMPLE_WIDTH-1:0];

    // The maximum square is 2^(2*SAMPLE_WIDTH-2), which requires
    // 2*SAMPLE_WIDTH-1 value bits. The full multiplier's unused top bit is
    // therefore intentionally omitted from this unsigned result.
    assign sample_square_full = sample_magnitude * sample_magnitude;
    assign sample_square = sample_square_full[SQUARE_WIDTH-1:0];
    assign extended_square = {{(SUM_WIDTH-SQUARE_WIDTH){1'b0}}, sample_square};

    assign next_peak = (sample_magnitude > peak_accumulator)
                     ? sample_magnitude : peak_accumulator;
    assign next_sum_squares = sum_squares_accumulator + extended_square;

    // While a completed result is pending, input is backpressured so it cannot
    // overwrite the result or begin a new window prematurely.
    assign sample_ready  = !result_valid;
    assign sample_accept = sample_valid && sample_ready;
    assign last_sample   = (sample_count == WINDOW_SIZE - 1);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            peak_accumulator       <= {SAMPLE_WIDTH{1'b0}};
            sum_squares_accumulator <= {SUM_WIDTH{1'b0}};
            sample_count           <= {COUNT_WIDTH{1'b0}};
            result_valid           <= 1'b0;
            result_peak            <= {SAMPLE_WIDTH{1'b0}};
            result_sum_squares     <= {SUM_WIDTH{1'b0}};
            result_sample_count    <= {COUNT_WIDTH{1'b0}};
        end else begin
            if (result_valid && result_ready) begin
                result_valid <= 1'b0;
            end

            if (sample_accept) begin
                if (last_sample) begin
                    result_peak         <= next_peak;
                    result_sum_squares  <= next_sum_squares;
                    result_sample_count <= WINDOW_SIZE;
                    result_valid        <= 1'b1;

                    peak_accumulator        <= {SAMPLE_WIDTH{1'b0}};
                    sum_squares_accumulator <= {SUM_WIDTH{1'b0}};
                    sample_count            <= {COUNT_WIDTH{1'b0}};
                end else begin
                    peak_accumulator        <= next_peak;
                    sum_squares_accumulator <= next_sum_squares;
                    sample_count            <= sample_count + 1'b1;
                end
            end
        end
    end

endmodule
