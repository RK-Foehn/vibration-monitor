`timescale 1ns/1ps

// Standalone XYZ hardware-validation top for the Navigator ZYNQ XC7Z020.
// It intentionally does not connect the FIFO or replace lis3dh_board_top.
// Use lis3dh_xyz_board_navigator_v2_6.xdc, not the WHO_AM_I ILA XDC.
module lis3dh_xyz_board_top #(
    parameter integer POWER_UP_DELAY_CYCLES  = 500_000,
    parameter integer SETTLE_DELAY_CYCLES    = 5_000_000,
    parameter integer POLL_PERIOD_CYCLES     = 50_000,
    parameter integer SPI_HALF_PERIOD_CYCLES = 25
) (
    input  wire sys_clk,
    input  wire sys_rst_n,
    output wire lis3dh_cs_n,
    output wire lis3dh_sclk,
    output wire lis3dh_mosi,
    input  wire lis3dh_miso
);
    // Match the reset strategy of the previously validated WHO_AM_I top:
    // asynchronous assertion from PL_RESET and two-clock synchronous release.
    (* ASYNC_REG = "TRUE" *) reg [1:0] reset_sync;
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n)
            reset_sync <= 2'b00;
        else
            reset_sync <= {reset_sync[0], 1'b1};
    end
    wire rst_n_sync = reset_sync[1];

    // These nets are internal observability points, not new package pins.
    // In Vivado Set Up Debug, probe these and use sys_clk as the ILA clock.
    (* mark_debug = "true" *) wire [7:0] who_am_i_data;
    (* mark_debug = "true" *) wire init_done;
    (* mark_debug = "true" *) wire init_error;
    (* mark_debug = "true" *) wire signed [15:0] xyz_x;
    (* mark_debug = "true" *) wire signed [15:0] xyz_y;
    (* mark_debug = "true" *) wire signed [15:0] xyz_z;
    (* mark_debug = "true" *) wire xyz_valid;
    (* mark_debug = "true" *) wire sample_drop;
    (* mark_debug = "true" *) wire [31:0] sample_drop_count;
    (* mark_debug = "true" *) wire sensor_overrun;
    (* mark_debug = "true" *) wire spi_busy;
    (* mark_debug = "true" *) wire lis3dh_cs_n_debug;
    (* mark_debug = "true" *) wire lis3dh_sclk_debug;
    (* mark_debug = "true" *) wire lis3dh_mosi_debug;
    (* mark_debug = "true" *) wire lis3dh_miso_debug;

    assign lis3dh_cs_n = lis3dh_cs_n_debug;
    assign lis3dh_sclk = lis3dh_sclk_debug;
    assign lis3dh_mosi = lis3dh_mosi_debug;
    assign lis3dh_miso_debug = lis3dh_miso;

    lis3dh_xyz_acquisition #(
        .POWER_UP_DELAY_CYCLES(POWER_UP_DELAY_CYCLES),
        .SETTLE_DELAY_CYCLES(SETTLE_DELAY_CYCLES),
        .POLL_PERIOD_CYCLES(POLL_PERIOD_CYCLES),
        .SPI_HALF_PERIOD_CYCLES(SPI_HALF_PERIOD_CYCLES)
    ) xyz_reader (
        .clk(sys_clk),
        .rst_n(rst_n_sync),
        .xyz_ready(1'b1), // No FIFO yet: never backpressure the test output.
        .xyz_x(xyz_x),
        .xyz_y(xyz_y),
        .xyz_z(xyz_z),
        .xyz_valid(xyz_valid),
        .sample_drop(sample_drop),
        .sample_drop_count(sample_drop_count),
        .sensor_overrun(sensor_overrun),
        .who_am_i_data(who_am_i_data),
        .init_done(init_done),
        .error(init_error),
        .spi_busy(spi_busy),
        .lis3dh_cs_n(lis3dh_cs_n_debug),
        .lis3dh_sclk(lis3dh_sclk_debug),
        .lis3dh_mosi(lis3dh_mosi_debug),
        .lis3dh_miso(lis3dh_miso_debug)
    );
endmodule
