`timescale 1ns/1ps

// Checks the new board wrapper's reset release and connection to the
// previously simulated acquisition engine. MISO=0 deliberately makes
// WHO_AM_I fail; successful XYZ behavior is covered by the independent
// tb_lis3dh_xyz_acquisition sensor model.
module tb_lis3dh_xyz_board_top;
    reg sys_clk = 1'b0;
    always #10 sys_clk = ~sys_clk;
    reg sys_rst_n = 1'b0;
    reg lis3dh_miso = 1'b0;
    wire lis3dh_cs_n, lis3dh_sclk, lis3dh_mosi;

    lis3dh_xyz_board_top #(
        .POWER_UP_DELAY_CYCLES(4),
        .SETTLE_DELAY_CYCLES(8),
        .POLL_PERIOD_CYCLES(4),
        .SPI_HALF_PERIOD_CYCLES(2)
    ) dut (
        .sys_clk(sys_clk), .sys_rst_n(sys_rst_n),
        .lis3dh_cs_n(lis3dh_cs_n), .lis3dh_sclk(lis3dh_sclk),
        .lis3dh_mosi(lis3dh_mosi), .lis3dh_miso(lis3dh_miso)
    );

    initial begin
        #100_000;
        $fatal(1, "FAIL: XYZ board wrapper timeout");
    end

    initial begin
        repeat (3) @(negedge sys_clk);
        if (dut.rst_n_sync !== 1'b0 || lis3dh_cs_n !== 1'b1)
            $fatal(1, "reset state incorrect");

        sys_rst_n = 1'b1;
        @(posedge sys_clk); #1;
        if (dut.reset_sync !== 2'b01 || dut.rst_n_sync !== 1'b0)
            $fatal(1, "reset released too early");
        @(posedge sys_clk); #1;
        if (dut.reset_sync !== 2'b11 || dut.rst_n_sync !== 1'b1)
            $fatal(1, "reset did not release after two clocks");
        if (dut.xyz_reader.xyz_ready !== 1'b1)
            $fatal(1, "xyz_ready is not tied high");

        wait (lis3dh_cs_n == 1'b0);
        wait (dut.init_error == 1'b1);
        if (dut.who_am_i_data !== 8'h00 || dut.init_done !== 1'b0 ||
            dut.xyz_valid !== 1'b0)
            $fatal(1, "bad WHO_AM_I was not rejected by board wrapper");

        @(negedge sys_clk);
        sys_rst_n = 1'b0;
        #1;
        if (dut.rst_n_sync !== 1'b0 || dut.init_error !== 1'b0 ||
            dut.who_am_i_data !== 8'h00 || lis3dh_cs_n !== 1'b1)
            $fatal(1, "asynchronous reset assertion failed");

        $display("PASS: XYZ board top reset assertion/release, SPI wiring, ready tie-high, bad WHO stop");
        $finish;
    end
endmodule
