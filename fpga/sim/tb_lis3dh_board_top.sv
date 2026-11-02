`timescale 1ns/1ps

module tb_lis3dh_board_top;

    localparam integer POWER_UP_DELAY_CYCLES  = 6;
    localparam integer SPI_HALF_PERIOD_CYCLES = 3;
    localparam [7:0]   WHO_AM_I_VALUE         = 8'h33;
    localparam [7:0]   EXPECTED_COMMAND       = 8'h8F;

    reg  sys_clk;
    reg  sys_rst_n;
    reg  lis3dh_miso;
    wire lis3dh_cs_n;
    wire lis3dh_sclk;
    wire lis3dh_mosi;

    reg [15:0] captured_mosi;
    integer falling_edge_count;
    integer rising_edge_count;
    integer cs_assert_count;
    integer cs_deassert_count;
    integer start_pulse_count;
    integer done_pulse_count;
    integer delay_cycle;
    reg     done_seen;
    reg     test_completed;

    lis3dh_board_top #(
        .POWER_UP_DELAY_CYCLES(POWER_UP_DELAY_CYCLES),
        .SPI_HALF_PERIOD_CYCLES(SPI_HALF_PERIOD_CYCLES)
    ) dut (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .lis3dh_cs_n(lis3dh_cs_n),
        .lis3dh_sclk(lis3dh_sclk),
        .lis3dh_mosi(lis3dh_mosi),
        .lis3dh_miso(lis3dh_miso)
    );

    // Board PL clock: 50 MHz.
    always #10 sys_clk = ~sys_clk;

    always @(posedge sys_clk) begin
        if (dut.start_pulse) begin
            start_pulse_count = start_pulse_count + 1;
        end
    end

    // Record completion from the beginning of simulation. Waiting directly on
    // the one-cycle done level later in the main test thread is fragile: a
    // pulse that has already completed carries no history. This sticky flag
    // preserves that history while done_pulse_count still checks uniqueness.
    always @(posedge dut.done or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            done_seen        = 1'b0;
            done_pulse_count = 0;
        end else begin
            done_seen        = 1'b1;
            done_pulse_count = done_pulse_count + 1;
        end
    end

    // Minimal four-wire LIS3DH model. SDO changes on falling SPC edges and is
    // sampled by the controller on rising SPC edges.
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

            if (falling_edge_count >= 8) begin
                lis3dh_miso = WHO_AM_I_VALUE[15 - falling_edge_count];
            end else begin
                lis3dh_miso = 1'b0;
            end

            falling_edge_count = falling_edge_count + 1;
        end else if (dut.rst_n_sync) begin
            $fatal(1, "Falling SCLK edge occurred while CS was high");
        end
    end

    always @(posedge lis3dh_sclk) begin
        if (!lis3dh_cs_n) begin
            rising_edge_count = rising_edge_count + 1;
        end else if (dut.rst_n_sync) begin
            $fatal(1, "Rising SCLK edge occurred while CS was high");
        end
    end

    always @(posedge lis3dh_cs_n) begin
        if (dut.rst_n_sync) begin
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
        sys_clk            = 1'b0;
        sys_rst_n          = 1'b0;
        lis3dh_miso        = 1'b0;
        captured_mosi      = 16'h0000;
        falling_edge_count = 0;
        rising_edge_count  = 0;
        cs_assert_count    = 0;
        cs_deassert_count  = 0;
        start_pulse_count  = 0;
        done_seen           = 1'b0;
        done_pulse_count    = 0;
        test_completed      = 1'b0;

        // Reset assertion is asynchronous and must immediately clear the
        // synchronized reset state and leave the SPI bus idle.
        #7;
        if (dut.rst_n_sync !== 1'b0) begin
            $fatal(1, "Synchronized reset was not asserted asynchronously");
        end
        if ((lis3dh_cs_n !== 1'b1) || (lis3dh_sclk !== 1'b1)) begin
            $fatal(1, "SPI bus was not idle during reset");
        end

        @(negedge sys_clk);
        sys_rst_n = 1'b1;

        // Release must take two rising sys_clk edges.
        @(posedge sys_clk);
        #1;
        if (dut.rst_n_sync !== 1'b0) begin
            $fatal(1, "Reset released before the second synchronizer edge");
        end
        @(posedge sys_clk);
        #1;
        if (dut.rst_n_sync !== 1'b1) begin
            $fatal(1, "Reset did not release on the second synchronizer edge");
        end

        // No start may occur before the complete programmed wait interval.
        for (delay_cycle = 1;
             delay_cycle <= POWER_UP_DELAY_CYCLES;
             delay_cycle = delay_cycle + 1) begin
            @(posedge sys_clk);
            #1;
            if ((delay_cycle < POWER_UP_DELAY_CYCLES) && dut.start_pulse) begin
                $fatal(1, "Start asserted early at delay cycle %0d", delay_cycle);
            end
        end

        if (dut.start_pulse !== 1'b1) begin
            $fatal(1, "Start did not assert after the programmed delay");
        end

        @(posedge sys_clk);
        #1;
        if (dut.start_pulse !== 1'b0) begin
            $fatal(1, "Start pulse was wider than one sys_clk cycle");
        end

        // done is only one sys_clk cycle wide. Use the sticky observation
        // recorded above so the check is independent of when this thread
        // reaches the wait statement.
        wait (done_seen == 1'b1);

        if (dut.who_am_i_data !== WHO_AM_I_VALUE) begin
            $fatal(1, "WHO_AM_I mismatch: expected 0x33, got 0x%02h",
                   dut.who_am_i_data);
        end
        if (dut.error !== 1'b0) begin
            $fatal(1, "Error flag asserted for expected WHO_AM_I data");
        end
        if (dut.busy !== 1'b0) begin
            $fatal(1, "Busy remained asserted when read completed");
        end
        if ((cs_assert_count != 1) || (cs_deassert_count != 1)) begin
            $fatal(1, "Expected one SPI transaction, assertions=%0d releases=%0d",
                   cs_assert_count, cs_deassert_count);
        end
        if (done_pulse_count != 1) begin
            $fatal(1, "Expected one done pulse, got %0d", done_pulse_count);
        end

        // Leave the wrapper running long enough to detect accidental retrigger.
        repeat (POWER_UP_DELAY_CYCLES + 10) @(posedge sys_clk);
        #1;
        if (start_pulse_count != 1) begin
            $fatal(1, "Expected one start pulse, got %0d", start_pulse_count);
        end
        if ((cs_assert_count != 1) || (cs_deassert_count != 1)) begin
            $fatal(1, "SPI transaction repeated unexpectedly");
        end
        if (done_pulse_count != 1) begin
            $fatal(1, "Done pulse repeated unexpectedly: count=%0d",
                   done_pulse_count);
        end

        test_completed = 1'b1;
        $display("PASS: LIS3DH board-level reset, wait and one-shot read verified.");
        $display("      delay=%0d starts=%0d done=%0d cs_assert=%0d cs_release=%0d command=0x%02h data=0x%02h",
                 POWER_UP_DELAY_CYCLES, start_pulse_count, done_pulse_count,
                 cs_assert_count, cs_deassert_count,
                 captured_mosi[15:8], dut.who_am_i_data);
        $finish;
    end

    initial begin
        #100000;
        if (!test_completed) begin
            $display("TIMEOUT DIAGNOSTICS: start=%0d done=%0d cs_assert=%0d cs_release=%0d busy=%0b data=0x%02h",
                     start_pulse_count, done_pulse_count, cs_assert_count,
                     cs_deassert_count, dut.busy, dut.who_am_i_data);
            $fatal(1, "Simulation timeout");
        end
    end

endmodule
