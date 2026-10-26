`timescale 1ns/1ps

module tb_lis3dh_who_am_i_top;

    localparam integer HALF_PERIOD_CYCLES = 3;
    localparam [7:0]   WHO_AM_I_VALUE     = 8'h33;
    localparam [7:0]   EXPECTED_COMMAND   = 8'h8F;

    reg clk;
    reg rst_n;
    reg start;
    reg lis3dh_miso;

    wire [7:0] who_am_i_data;
    wire busy;
    wire done;
    wire error;
    wire lis3dh_cs_n;
    wire lis3dh_sclk;
    wire lis3dh_mosi;

    reg [15:0] captured_mosi;
    integer falling_edge_count;
    integer rising_edge_count;
    integer cs_assert_count;
    integer cs_deassert_count;

    lis3dh_who_am_i_top #(
        .HALF_PERIOD_CYCLES(HALF_PERIOD_CYCLES)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .who_am_i_data(who_am_i_data),
        .busy(busy),
        .done(done),
        .error(error),
        .lis3dh_cs_n(lis3dh_cs_n),
        .lis3dh_sclk(lis3dh_sclk),
        .lis3dh_mosi(lis3dh_mosi),
        .lis3dh_miso(lis3dh_miso)
    );

    // 50 MHz PL clock. HALF_PERIOD_CYCLES=3 gives an 8.33 MHz SPI clock,
    // which remains below the LIS3DH 10 MHz maximum.
    always #10 clk = ~clk;

    // Minimal four-wire LIS3DH model. The sensor changes SDO on falling SPC
    // edges; the master samples it on the following rising edges.
    always @(negedge lis3dh_cs_n) begin
        if (lis3dh_sclk !== 1'b1) begin
            $fatal(1, "SCLK was not high when CS was asserted");
        end

        captured_mosi      = 16'h0000;
        falling_edge_count = 0;
        rising_edge_count  = 0;
        lis3dh_miso        = 1'b0;
        cs_assert_count    = cs_assert_count + 1;
    end

    always @(negedge lis3dh_sclk) begin
        if (!lis3dh_cs_n) begin
            captured_mosi = {captured_mosi[14:0], lis3dh_mosi};

            // Edges 9 through 16 return DO7 through DO0.
            if (falling_edge_count >= 8) begin
                lis3dh_miso = WHO_AM_I_VALUE[15 - falling_edge_count];
            end else begin
                lis3dh_miso = 1'b0;
            end

            falling_edge_count = falling_edge_count + 1;
        end else if (rst_n) begin
            $fatal(1, "Falling SCLK edge occurred while CS was high");
        end
    end

    always @(posedge lis3dh_sclk) begin
        if (!lis3dh_cs_n) begin
            rising_edge_count = rising_edge_count + 1;
        end else if (rst_n) begin
            $fatal(1, "Rising SCLK edge occurred while CS was high");
        end
    end

    always @(posedge lis3dh_cs_n) begin
        if (rst_n) begin
            cs_deassert_count = cs_deassert_count + 1;

            if (lis3dh_sclk !== 1'b1) begin
                $fatal(1, "SCLK was not high when CS was released");
            end
            if (falling_edge_count != 16) begin
                $fatal(1, "Expected 16 falling SCLK edges, got %0d",
                       falling_edge_count);
            end
            if (rising_edge_count != 16) begin
                $fatal(1, "Expected 16 rising SCLK edges, got %0d",
                       rising_edge_count);
            end
            if (captured_mosi[15:8] !== EXPECTED_COMMAND) begin
                $fatal(1, "Command mismatch: expected 0x%02h, got 0x%02h",
                       EXPECTED_COMMAND, captured_mosi[15:8]);
            end
            if (captured_mosi[7:0] !== 8'h00) begin
                $fatal(1, "Read dummy byte was not zero: got 0x%02h",
                       captured_mosi[7:0]);
            end
        end

        lis3dh_miso = 1'b0;
    end

    initial begin
        clk                = 1'b0;
        rst_n              = 1'b0;
        start              = 1'b0;
        lis3dh_miso        = 1'b0;
        captured_mosi      = 16'h0000;
        falling_edge_count = 0;
        rising_edge_count  = 0;
        cs_assert_count    = 0;
        cs_deassert_count  = 0;

        repeat (4) @(negedge clk);
        rst_n = 1'b1;

        if ((lis3dh_cs_n !== 1'b1) || (lis3dh_sclk !== 1'b1)) begin
            $fatal(1, "SPI bus did not enter the required idle state");
        end

        @(negedge clk);
        start = 1'b1;
        @(negedge clk);
        start = 1'b0;

        wait (done == 1'b1);

        if (who_am_i_data !== WHO_AM_I_VALUE) begin
            $fatal(1, "WHO_AM_I mismatch: expected 0x33, got 0x%02h",
                   who_am_i_data);
        end
        if (error !== 1'b0) begin
            $fatal(1, "Error flag asserted for the expected WHO_AM_I value");
        end
        if (busy !== 1'b0) begin
            $fatal(1, "Busy remained asserted when the result completed");
        end
        if ((cs_assert_count != 1) || (cs_deassert_count != 1)) begin
            $fatal(1, "Expected one CS transaction, got assertions=%0d releases=%0d",
                   cs_assert_count, cs_deassert_count);
        end

        @(posedge clk);
        #1;
        if (done !== 1'b0) begin
            $fatal(1, "Done must be a one-clock pulse");
        end

        $display("PASS: LIS3DH WHO_AM_I SPI transaction verified.");
        $display("      command=0x%02h clocks=%0d data=0x%02h error=%0b",
                 captured_mosi[15:8], falling_edge_count,
                 who_am_i_data, error);
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "Simulation timeout");
    end

endmodule
