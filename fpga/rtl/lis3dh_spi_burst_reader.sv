`timescale 1ns/1ps

// Reads OUT_X_L..OUT_Z_H in one four-wire SPI transaction.
// This extends the verified single-register controller's edge timing:
// SCLK idles high, MOSI changes on falling edges, MISO is sampled on rising
// edges, and CS stays low for one extra half-period after the last bit.
module lis3dh_spi_burst_reader #(
    parameter integer HALF_PERIOD_CYCLES = 25
) (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        start,
    output reg  [47:0] read_data,
    output reg         busy,
    output reg         done,
    output reg         lis3dh_cs_n,
    output reg         lis3dh_sclk,
    output reg         lis3dh_mosi,
    input  wire        lis3dh_miso
);
    // R/W=1, MS=1, address=0x28: six auto-incremented output bytes.
    localparam [7:0] READ_XYZ_COMMAND = 8'hE8;
    localparam integer TOTAL_BITS = 8 + 6 * 8;
    localparam integer DIV_WIDTH =
        (HALF_PERIOD_CYCLES <= 1) ? 1 : $clog2(HALF_PERIOD_CYCLES);

    localparam [1:0] IDLE = 2'd0;
    localparam [1:0] DRIVE_FALL = 2'd1;
    localparam [1:0] SAMPLE_RISE = 2'd2;
    localparam [1:0] CS_HOLD = 2'd3;

    reg [1:0] state;
    reg [DIV_WIDTH-1:0] div_counter;
    reg [5:0] bit_count;
    reg [47:0] rx_shift;
    wire half_period_elapsed = (div_counter == HALF_PERIOD_CYCLES - 1);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            div_counter <= {DIV_WIDTH{1'b0}};
            bit_count <= 6'd0;
            rx_shift <= 48'd0;
            read_data <= 48'd0;
            busy <= 1'b0;
            done <= 1'b0;
            lis3dh_cs_n <= 1'b1;
            lis3dh_sclk <= 1'b1;
            lis3dh_mosi <= 1'b0;
        end else begin
            done <= 1'b0;
            case (state)
                IDLE: begin
                    busy <= 1'b0;
                    lis3dh_cs_n <= 1'b1;
                    lis3dh_sclk <= 1'b1;
                    lis3dh_mosi <= 1'b0;
                    div_counter <= {DIV_WIDTH{1'b0}};
                    if (start) begin
                        bit_count <= 6'd0;
                        rx_shift <= 48'd0;
                        busy <= 1'b1;
                        lis3dh_cs_n <= 1'b0;
                        state <= DRIVE_FALL;
                    end
                end
                DRIVE_FALL: begin
                    if (half_period_elapsed) begin
                        div_counter <= {DIV_WIDTH{1'b0}};
                        lis3dh_sclk <= 1'b0;
                        lis3dh_mosi <= (bit_count < 6'd8)
                            ? READ_XYZ_COMMAND[7-bit_count[2:0]] : 1'b0;
                        state <= SAMPLE_RISE;
                    end else begin
                        div_counter <= div_counter + 1'b1;
                    end
                end
                SAMPLE_RISE: begin
                    if (half_period_elapsed) begin
                        div_counter <= {DIV_WIDTH{1'b0}};
                        lis3dh_sclk <= 1'b1;
                        if (bit_count >= 6'd8)
                            rx_shift <= {rx_shift[46:0], lis3dh_miso};
                        if (bit_count == TOTAL_BITS - 1) begin
                            read_data <= {rx_shift[46:0], lis3dh_miso};
                            state <= CS_HOLD;
                        end else begin
                            bit_count <= bit_count + 1'b1;
                            state <= DRIVE_FALL;
                        end
                    end else begin
                        div_counter <= div_counter + 1'b1;
                    end
                end
                CS_HOLD: begin
                    if (half_period_elapsed) begin
                        div_counter <= {DIV_WIDTH{1'b0}};
                        lis3dh_cs_n <= 1'b1;
                        lis3dh_sclk <= 1'b1;
                        lis3dh_mosi <= 1'b0;
                        busy <= 1'b0;
                        done <= 1'b1;
                        state <= IDLE;
                    end else begin
                        div_counter <= div_counter + 1'b1;
                    end
                end
                default: state <= IDLE;
            endcase
        end
    end
endmodule
