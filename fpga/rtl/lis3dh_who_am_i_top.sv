`timescale 1ns/1ps

// Minimal LIS3DH bring-up wrapper.
//
// One accepted start pulse performs a four-wire SPI read of WHO_AM_I (0x0F).
// The underlying controller transmits 0x8F followed by one dummy byte and
// samples the returned byte from MISO. No sensor configuration is performed.
module lis3dh_who_am_i_top #(
    // Number of clk cycles in one half-period of lis3dh_sclk.
    // At 50 MHz, the default value produces a 1 MHz SPI clock.
    parameter integer HALF_PERIOD_CYCLES = 25
) (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       start,

    output reg  [7:0] who_am_i_data,
    output wire       busy,
    output reg        done,
    output reg        error,

    output wire       lis3dh_cs_n,
    output wire       lis3dh_sclk,
    output wire       lis3dh_mosi,
    input  wire       lis3dh_miso
);

    localparam [5:0] WHO_AM_I_ADDRESS  = 6'h0F;
    localparam [7:0] WHO_AM_I_EXPECTED = 8'h33;

    wire [7:0] spi_read_data;
    wire       spi_busy;
    wire       spi_done;

    assign busy = spi_busy;

    lis3dh_spi_controller #(
        .HALF_PERIOD_CYCLES(HALF_PERIOD_CYCLES)
    ) spi_controller (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .read_not_write(1'b1),
        .reg_addr(WHO_AM_I_ADDRESS),
        .write_data(8'h00),
        .read_data(spi_read_data),
        .busy(spi_busy),
        .done(spi_done),
        .lis3dh_cs_n(lis3dh_cs_n),
        .lis3dh_sclk(lis3dh_sclk),
        .lis3dh_mosi(lis3dh_mosi),
        .lis3dh_miso(lis3dh_miso)
    );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            who_am_i_data <= 8'h00;
            done          <= 1'b0;
            error         <= 1'b0;
        end else begin
            // Top-level done is a one-clk pulse. Data and error are already
            // stable when it is asserted.
            done <= 1'b0;

            if (start && !spi_busy) begin
                error <= 1'b0;
            end

            if (spi_done) begin
                who_am_i_data <= spi_read_data;
                error         <= (spi_read_data != WHO_AM_I_EXPECTED);
                done          <= 1'b1;
            end
        end
    end

endmodule
