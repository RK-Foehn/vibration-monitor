`timescale 1ns/1ps

// Minimal board-level wrapper for the ALIENTEK Navigator ZYNQ-7020.
//
// The external PL reset is asserted asynchronously. Its release is passed
// through two flip-flops so all downstream logic leaves reset synchronously.
// After reset release, the wrapper waits once for the LIS3DH power-up boot
// interval and emits exactly one clk-wide start pulse.
module lis3dh_board_top #(
    // 10 ms at the board's 50 MHz PL clock. The LIS3DH datasheet states that
    // boot completes about 5 ms after power-up, so this is conservative.
    parameter integer POWER_UP_DELAY_CYCLES = 500_000,

    // 50 MHz / (2 * 25) = 1 MHz SPI clock.
    parameter integer SPI_HALF_PERIOD_CYCLES = 25
) (
    input  wire sys_clk,
    input  wire sys_rst_n,

    output wire lis3dh_cs_n,
    output wire lis3dh_sclk,
    output wire lis3dh_mosi,
    input  wire lis3dh_miso
);

    localparam integer POWER_UP_COUNTER_WIDTH =
        (POWER_UP_DELAY_CYCLES <= 1) ? 1 : $clog2(POWER_UP_DELAY_CYCLES);

    reg [1:0] reset_sync;

    // Async assertion from PL_RESET; synchronous release on sys_clk.
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            reset_sync <= 2'b00;
        end else begin
            reset_sync <= {reset_sync[0], 1'b1};
        end
    end

    wire rst_n_sync;
    assign rst_n_sync = reset_sync[1];

    reg [POWER_UP_COUNTER_WIDTH-1:0] power_up_counter;
    reg                              start_issued;

    (* mark_debug = "true" *) reg        start_pulse;
    (* mark_debug = "true" *) wire [7:0] who_am_i_data;
    (* mark_debug = "true" *) wire       busy;
    (* mark_debug = "true" *) wire       done;
    (* mark_debug = "true" *) wire       error;
    (* mark_debug = "true" *) wire       lis3dh_cs_n_debug;
    (* mark_debug = "true" *) wire       lis3dh_sclk_debug;
    (* mark_debug = "true" *) wire       lis3dh_mosi_debug;
    (* mark_debug = "true" *) wire       lis3dh_miso_debug;

    assign lis3dh_cs_n       = lis3dh_cs_n_debug;
    assign lis3dh_sclk       = lis3dh_sclk_debug;
    assign lis3dh_mosi       = lis3dh_mosi_debug;
    assign lis3dh_miso_debug = lis3dh_miso;

    // POWER_UP_DELAY_CYCLES must be at least one. Once start_issued is set,
    // neither the counter nor start pulse can run again until the next reset.
    always @(posedge sys_clk or negedge rst_n_sync) begin
        if (!rst_n_sync) begin
            power_up_counter <= {POWER_UP_COUNTER_WIDTH{1'b0}};
            start_issued     <= 1'b0;
            start_pulse      <= 1'b0;
        end else begin
            start_pulse <= 1'b0;

            if (!start_issued) begin
                if ((POWER_UP_DELAY_CYCLES <= 1) ||
                    (power_up_counter == POWER_UP_DELAY_CYCLES - 1)) begin
                    start_pulse  <= 1'b1;
                    start_issued <= 1'b1;
                end else begin
                    power_up_counter <= power_up_counter + 1'b1;
                end
            end
        end
    end

    lis3dh_who_am_i_top #(
        .HALF_PERIOD_CYCLES(SPI_HALF_PERIOD_CYCLES)
    ) who_am_i_reader (
        .clk(sys_clk),
        .rst_n(rst_n_sync),
        .start(start_pulse),
        .who_am_i_data(who_am_i_data),
        .busy(busy),
        .done(done),
        .error(error),
        .lis3dh_cs_n(lis3dh_cs_n_debug),
        .lis3dh_sclk(lis3dh_sclk_debug),
        .lis3dh_mosi(lis3dh_mosi_debug),
        .lis3dh_miso(lis3dh_miso_debug)
    );

endmodule
