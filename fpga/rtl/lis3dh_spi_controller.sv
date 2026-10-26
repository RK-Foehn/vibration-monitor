`timescale 1ns/1ps

// Executes one 16-bit LIS3DH register transaction at a time.
//
// LIS3DH four-wire SPI timing:
//   * CS is active low.
//   * SCLK is high while idle.
//   * MOSI changes on each falling SCLK edge.
//   * MISO is sampled on each rising SCLK edge.
//   * Bits are transferred most-significant bit first.
//
// The first byte is {read_not_write, multi_byte, reg_addr[5:0]}.
// This controller intentionally fixes multi_byte to zero. The second byte is
// write_data for writes and a dummy byte for reads.
module lis3dh_spi_controller #(
    // Number of clk cycles in one half-period of lis3dh_sclk.
    // Example: 50 MHz clk and HALF_PERIOD_CYCLES=25 produce 1 MHz SCLK.
    parameter integer HALF_PERIOD_CYCLES = 25
) (
    input  wire       clk,
    input  wire       rst_n,

    input  wire       start,
    input  wire       read_not_write,
    input  wire [5:0] reg_addr,
    input  wire [7:0] write_data,

    output reg  [7:0] read_data,
    output reg        busy,
    output reg        done,

    output reg        lis3dh_cs_n,
    output reg        lis3dh_sclk,
    output reg        lis3dh_mosi,
    input  wire       lis3dh_miso
);

    localparam integer DIV_COUNTER_WIDTH =
        (HALF_PERIOD_CYCLES <= 1) ? 1 : $clog2(HALF_PERIOD_CYCLES);

    localparam [1:0] STATE_IDLE        = 2'd0;
    localparam [1:0] STATE_DRIVE_FALL  = 2'd1;
    localparam [1:0] STATE_SAMPLE_RISE = 2'd2;
    localparam [1:0] STATE_CS_HOLD     = 2'd3;

    reg [1:0] state;
    reg [DIV_COUNTER_WIDTH-1:0] div_counter;
    reg [4:0] bit_count;
    reg [15:0] tx_shift;
    reg [15:0] rx_shift;

    wire half_period_elapsed;

    assign half_period_elapsed =
        (div_counter == HALF_PERIOD_CYCLES - 1);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state        <= STATE_IDLE;
            div_counter  <= {DIV_COUNTER_WIDTH{1'b0}};
            bit_count    <= 5'd0;
            tx_shift     <= 16'd0;
            rx_shift     <= 16'd0;
            read_data    <= 8'd0;
            busy         <= 1'b0;
            done         <= 1'b0;
            lis3dh_cs_n  <= 1'b1;
            lis3dh_sclk  <= 1'b1;
            lis3dh_mosi  <= 1'b0;
        end else begin
            // done is a one-clk pulse when a transaction finishes.
            done <= 1'b0;

            case (state)
                STATE_IDLE: begin
                    busy        <= 1'b0;
                    lis3dh_cs_n <= 1'b1;
                    lis3dh_sclk <= 1'b1;
                    lis3dh_mosi <= 1'b0;
                    div_counter <= {DIV_COUNTER_WIDTH{1'b0}};

                    if (start) begin
                        // MS=0: this first version supports one register only.
                        tx_shift <= {
                            read_not_write,
                            1'b0,
                            reg_addr,
                            write_data
                        };
                        rx_shift    <= 16'd0;
                        bit_count   <= 5'd0;
                        busy        <= 1'b1;
                        lis3dh_cs_n <= 1'b0;
                        state       <= STATE_DRIVE_FALL;
                    end
                end

                STATE_DRIVE_FALL: begin
                    if (half_period_elapsed) begin
                        div_counter <= {DIV_COUNTER_WIDTH{1'b0}};
                        lis3dh_sclk <= 1'b0;

                        // Present the next MOSI bit on the falling edge.
                        lis3dh_mosi <= tx_shift[15];
                        tx_shift    <= {tx_shift[14:0], 1'b0};
                        state       <= STATE_SAMPLE_RISE;
                    end else begin
                        div_counter <= div_counter + 1'b1;
                    end
                end

                STATE_SAMPLE_RISE: begin
                    if (half_period_elapsed) begin
                        div_counter <= {DIV_COUNTER_WIDTH{1'b0}};
                        lis3dh_sclk <= 1'b1;

                        // Capture MISO on the rising edge.
                        rx_shift <= {rx_shift[14:0], lis3dh_miso};

                        if (bit_count == 5'd15) begin
                            // The useful read value is the final eight bits.
                            read_data <= {rx_shift[6:0], lis3dh_miso};
                            state     <= STATE_CS_HOLD;
                        end else begin
                            bit_count <= bit_count + 1'b1;
                            state     <= STATE_DRIVE_FALL;
                        end
                    end else begin
                        div_counter <= div_counter + 1'b1;
                    end
                end

                STATE_CS_HOLD: begin
                    // Keep CS low for one more half-period after the final
                    // rising edge, then return all bus signals to idle.
                    if (half_period_elapsed) begin
                        div_counter <= {DIV_COUNTER_WIDTH{1'b0}};
                        lis3dh_cs_n <= 1'b1;
                        lis3dh_sclk <= 1'b1;
                        lis3dh_mosi <= 1'b0;
                        busy        <= 1'b0;
                        done        <= 1'b1;
                        state       <= STATE_IDLE;
                    end else begin
                        div_counter <= div_counter + 1'b1;
                    end
                end

                default: begin
                    state <= STATE_IDLE;
                end
            endcase
        end
    end

endmodule
