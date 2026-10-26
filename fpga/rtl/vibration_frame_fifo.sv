`timescale 1ns/1ps

// Single-clock FIFO for three-axis signed vibration samples.
//
// Input transfer:  sample_valid && sample_ready
// Output transfer: frame_valid  && frame_ready
//
// An upstream producer must hold sample_valid and all three sample values
// stable while sample_ready is low. Output data remains stable while the
// downstream consumer holds frame_ready low.
module vibration_frame_fifo #(
    parameter integer SAMPLE_WIDTH = 16,
    parameter integer FIFO_DEPTH   = 8
) (
    input  wire                           clk,
    input  wire                           rst_n,

    input  wire                           sample_valid,
    output wire                           sample_ready,
    input  wire signed [SAMPLE_WIDTH-1:0] sample_x,
    input  wire signed [SAMPLE_WIDTH-1:0] sample_y,
    input  wire signed [SAMPLE_WIDTH-1:0] sample_z,

    output wire                           frame_valid,
    input  wire                           frame_ready,
    output wire signed [SAMPLE_WIDTH-1:0] frame_x,
    output wire signed [SAMPLE_WIDTH-1:0] frame_y,
    output wire signed [SAMPLE_WIDTH-1:0] frame_z,

    output wire                           fifo_full,
    output wire                           fifo_empty,
    output wire [$clog2(FIFO_DEPTH+1)-1:0] fifo_level,
    output reg                            overflow
);

    localparam integer FRAME_WIDTH = 3 * SAMPLE_WIDTH;
    localparam integer PTR_WIDTH =
        (FIFO_DEPTH <= 1) ? 1 : $clog2(FIFO_DEPTH);
    localparam integer LEVEL_WIDTH = $clog2(FIFO_DEPTH + 1);

    reg [FRAME_WIDTH-1:0] frame_memory [0:FIFO_DEPTH-1];
    reg [PTR_WIDTH-1:0]   write_pointer;
    reg [PTR_WIDTH-1:0]   read_pointer;
    reg [LEVEL_WIDTH-1:0] level;

    wire push;
    wire pop;
    wire [FRAME_WIDTH-1:0] output_frame;

    assign fifo_empty   = (level == 0);
    assign fifo_full    = (level == FIFO_DEPTH);
    assign fifo_level   = level;
    assign sample_ready = !fifo_full;
    assign frame_valid  = !fifo_empty;

    assign push = sample_valid && sample_ready;
    assign pop  = frame_valid && frame_ready;

    assign output_frame = frame_memory[read_pointer];
    assign frame_x = output_frame[FRAME_WIDTH-1 -: SAMPLE_WIDTH];
    assign frame_y = output_frame[(2*SAMPLE_WIDTH)-1 -: SAMPLE_WIDTH];
    assign frame_z = output_frame[SAMPLE_WIDTH-1:0];

    // Memory contents are intentionally not reset. They are invalid whenever
    // frame_valid is low, while avoiding reset logic on the storage array.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            write_pointer <= {PTR_WIDTH{1'b0}};
            read_pointer  <= {PTR_WIDTH{1'b0}};
            level         <= {LEVEL_WIDTH{1'b0}};
            overflow      <= 1'b0;
        end else begin
            // A full FIFO never overwrites unread data. This sticky diagnostic
            // records input pressure while full and clears only on reset.
            if (sample_valid && !sample_ready) begin
                overflow <= 1'b1;
            end

            if (push) begin
                frame_memory[write_pointer] <= {sample_x, sample_y, sample_z};

                if (write_pointer == FIFO_DEPTH - 1) begin
                    write_pointer <= {PTR_WIDTH{1'b0}};
                end else begin
                    write_pointer <= write_pointer + 1'b1;
                end
            end

            if (pop) begin
                if (read_pointer == FIFO_DEPTH - 1) begin
                    read_pointer <= {PTR_WIDTH{1'b0}};
                end else begin
                    read_pointer <= read_pointer + 1'b1;
                end
            end

            case ({push, pop})
                2'b10: level <= level + 1'b1;
                2'b01: level <= level - 1'b1;
                default: level <= level;
            endcase
        end
    end

endmodule
