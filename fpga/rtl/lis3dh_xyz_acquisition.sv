`timescale 1ns/1ps

// Independent LIS3DH bring-up and periodic XYZ acquisition engine.
// clk defaults to 50 MHz. Parameters shorten delays only in simulation.
// xyz_valid is a one-clk pulse for each complete burst. If xyz_ready is low
// on that pulse, the sample is explicitly dropped and counted (saturating).
module lis3dh_xyz_acquisition #(
    parameter integer POWER_UP_DELAY_CYCLES = 500_000,  // 10 ms
    parameter integer SETTLE_DELAY_CYCLES   = 5_000_000, // 100 ms > 7/100 Hz
    parameter integer POLL_PERIOD_CYCLES    = 50_000,   // 1 ms
    parameter integer SPI_HALF_PERIOD_CYCLES = 25       // 1 MHz SCLK
) (
    input  wire               clk,
    input  wire               rst_n,
    input  wire               xyz_ready,
    (* mark_debug = "true" *) output reg  signed [15:0] xyz_x,
    (* mark_debug = "true" *) output reg  signed [15:0] xyz_y,
    (* mark_debug = "true" *) output reg  signed [15:0] xyz_z,
    (* mark_debug = "true" *) output reg                xyz_valid,
    (* mark_debug = "true" *) output reg                sample_drop,
    (* mark_debug = "true" *) output reg         [31:0] sample_drop_count,
    (* mark_debug = "true" *) output reg                sensor_overrun,
    (* mark_debug = "true" *) output reg         [7:0]  who_am_i_data,
    (* mark_debug = "true" *) output reg                init_done,
    (* mark_debug = "true" *) output reg                error,
    output wire               spi_busy,
    output wire               lis3dh_cs_n,
    output wire               lis3dh_sclk,
    output wire               lis3dh_mosi,
    input  wire               lis3dh_miso
);
    localparam [5:0] WHO_AM_I_ADDR = 6'h0F;
    localparam [7:0] WHO_AM_I_EXPECTED = 8'h33;
    localparam [5:0] CTRL_REG1_ADDR = 6'h20;
    localparam [5:0] CTRL_REG4_ADDR = 6'h23;
    localparam [5:0] STATUS_REG_ADDR = 6'h27;
    // CTRL_REG4: BDU=1, BLE=0 (LSB at lower address), FS=00 (+/-2g),
    // HR=1 (12-bit), ST=00, SIM=0 (four-wire SPI).
    localparam [7:0] CTRL_REG4_VALUE = 8'h88;
    // CTRL_REG1: ODR=0101 (100 Hz), LPen=0, XYZ enabled.
    localparam [7:0] CTRL_REG1_VALUE = 8'h57;

    localparam [3:0] BOOT_WAIT = 4'd0;
    localparam [3:0] WHO_START = 4'd1;
    localparam [3:0] WHO_WAIT = 4'd2;
    localparam [3:0] CFG4_START = 4'd3;
    localparam [3:0] CFG4_WAIT = 4'd4;
    localparam [3:0] CFG1_START = 4'd5;
    localparam [3:0] CFG1_WAIT = 4'd6;
    localparam [3:0] SETTLE_WAIT = 4'd7;
    localparam [3:0] POLL_WAIT = 4'd8;
    localparam [3:0] STATUS_START = 4'd9;
    localparam [3:0] STATUS_WAIT = 4'd10;
    localparam [3:0] BURST_START = 4'd11;
    localparam [3:0] BURST_WAIT = 4'd12;
    localparam [3:0] OUTPUT_SAMPLE = 4'd13;
    localparam [3:0] FATAL = 4'd14;

    (* mark_debug = "true" *) reg [3:0] state;
    reg [31:0] wait_count;

    wire single_start = (state == WHO_START || state == CFG4_START ||
                         state == CFG1_START || state == STATUS_START);
    wire single_read = (state == WHO_START || state == STATUS_START);
    wire [5:0] single_addr =
        (state == CFG4_START) ? CTRL_REG4_ADDR :
        (state == CFG1_START) ? CTRL_REG1_ADDR :
        (state == STATUS_START) ? STATUS_REG_ADDR : WHO_AM_I_ADDR;
    wire [7:0] single_write_data =
        (state == CFG4_START) ? CTRL_REG4_VALUE : CTRL_REG1_VALUE;
    wire burst_start = (state == BURST_START);
    wire burst_selected = (state == BURST_START || state == BURST_WAIT);

    wire [7:0] single_data;
    wire single_busy, single_done;
    wire single_cs_n, single_sclk, single_mosi;
    wire [47:0] burst_data;
    wire burst_busy, burst_done;
    wire burst_cs_n, burst_sclk, burst_mosi;

    lis3dh_spi_controller #(
        .HALF_PERIOD_CYCLES(SPI_HALF_PERIOD_CYCLES)
    ) single_register_spi (
        .clk(clk), .rst_n(rst_n), .start(single_start),
        .read_not_write(single_read), .reg_addr(single_addr),
        .write_data(single_write_data), .read_data(single_data),
        .busy(single_busy), .done(single_done),
        .lis3dh_cs_n(single_cs_n), .lis3dh_sclk(single_sclk),
        .lis3dh_mosi(single_mosi), .lis3dh_miso(lis3dh_miso)
    );

    lis3dh_spi_burst_reader #(
        .HALF_PERIOD_CYCLES(SPI_HALF_PERIOD_CYCLES)
    ) xyz_burst_spi (
        .clk(clk), .rst_n(rst_n), .start(burst_start),
        .read_data(burst_data), .busy(burst_busy), .done(burst_done),
        .lis3dh_cs_n(burst_cs_n), .lis3dh_sclk(burst_sclk),
        .lis3dh_mosi(burst_mosi), .lis3dh_miso(lis3dh_miso)
    );

    assign lis3dh_cs_n = burst_selected ? burst_cs_n : single_cs_n;
    assign lis3dh_sclk = burst_selected ? burst_sclk : single_sclk;
    assign lis3dh_mosi = burst_selected ? burst_mosi : single_mosi;
    assign spi_busy = single_busy | burst_busy;

    // Each pair is LSB first. High-resolution output is signed 12-bit,
    // left-justified in 16 bits, so discard four low padding bits and
    // sign-extend the remaining 12 bits to signed 16-bit sensor counts.
    wire signed [15:0] decoded_x =
        {{4{burst_data[39]}}, burst_data[39:32], burst_data[47:44]};
    wire signed [15:0] decoded_y =
        {{4{burst_data[23]}}, burst_data[23:16], burst_data[31:28]};
    wire signed [15:0] decoded_z =
        {{4{burst_data[7]}}, burst_data[7:0], burst_data[15:12]};

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= BOOT_WAIT;
            wait_count <= 32'd0;
            xyz_x <= 16'sd0;
            xyz_y <= 16'sd0;
            xyz_z <= 16'sd0;
            xyz_valid <= 1'b0;
            sample_drop <= 1'b0;
            sample_drop_count <= 32'd0;
            sensor_overrun <= 1'b0;
            who_am_i_data <= 8'd0;
            init_done <= 1'b0;
            error <= 1'b0;
        end else begin
            xyz_valid <= 1'b0;
            sample_drop <= 1'b0;
            case (state)
                BOOT_WAIT: begin
                    if (wait_count == POWER_UP_DELAY_CYCLES - 1) begin
                        wait_count <= 32'd0;
                        state <= WHO_START;
                    end else wait_count <= wait_count + 1'b1;
                end
                WHO_START: state <= WHO_WAIT;
                WHO_WAIT: if (single_done) begin
                    who_am_i_data <= single_data;
                    if (single_data == WHO_AM_I_EXPECTED) state <= CFG4_START;
                    else begin error <= 1'b1; state <= FATAL; end
                end
                CFG4_START: state <= CFG4_WAIT;
                CFG4_WAIT: if (single_done) state <= CFG1_START;
                CFG1_START: state <= CFG1_WAIT;
                CFG1_WAIT: if (single_done) begin
                    wait_count <= 32'd0;
                    state <= SETTLE_WAIT;
                end
                SETTLE_WAIT: begin
                    if (wait_count == SETTLE_DELAY_CYCLES - 1) begin
                        init_done <= 1'b1;
                        wait_count <= 32'd0;
                        state <= POLL_WAIT;
                    end else wait_count <= wait_count + 1'b1;
                end
                POLL_WAIT: begin
                    if (wait_count == POLL_PERIOD_CYCLES - 1) begin
                        wait_count <= 32'd0;
                        state <= STATUS_START;
                    end else wait_count <= wait_count + 1'b1;
                end
                STATUS_START: state <= STATUS_WAIT;
                STATUS_WAIT: if (single_done) begin
                    // Every STATUS_REG bit is defined. 8'hFF can mean that
                    // all axes have fresh data and have overrun; it is not a
                    // dedicated SPI error code. Read the available sample.
                    if (single_data[7]) sensor_overrun <= 1'b1;
                    state <= single_data[3] ? BURST_START : POLL_WAIT;
                end
                BURST_START: state <= BURST_WAIT;
                BURST_WAIT: if (burst_done) begin
                    xyz_x <= decoded_x;
                    xyz_y <= decoded_y;
                    xyz_z <= decoded_z;
                    xyz_valid <= 1'b1;
                    state <= OUTPUT_SAMPLE;
                end
                OUTPUT_SAMPLE: begin
                    if (!xyz_ready) begin
                        sample_drop <= 1'b1;
                        if (sample_drop_count != 32'hFFFF_FFFF)
                            sample_drop_count <= sample_drop_count + 1'b1;
                    end
                    wait_count <= 32'd0;
                    state <= POLL_WAIT;
                end
                FATAL: state <= FATAL;
                default: begin error <= 1'b1; state <= FATAL; end
            endcase
        end
    end
endmodule
