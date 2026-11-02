`timescale 1ns/1ps

module tb_lis3dh_spi_controller;

    // With the 50 MHz test clock, this produces an 8.33 MHz SPI clock,
    // below the LIS3DH 10 MHz maximum.
    localparam integer HALF_PERIOD_CYCLES = 3;
    localparam [7:0] WHO_AM_I_ADDRESS = 8'h0F;
    localparam [7:0] WHO_AM_I_VALUE   = 8'h33;

    reg clk;
    reg rst_n;
    reg start;
    reg read_not_write;
    reg [5:0] reg_addr;
    reg [7:0] write_data;
    reg lis3dh_miso;

    wire [7:0] read_data;
    wire busy;
    wire done;
    wire lis3dh_cs_n;
    wire lis3dh_sclk;
    wire lis3dh_mosi;

    reg [7:0] slave_response;
    reg [15:0] observed_tx_word;
    reg [15:0] completed_tx_word;
    integer falling_edge_count;
    integer completed_edge_count;

    lis3dh_spi_controller #(
        .HALF_PERIOD_CYCLES(HALF_PERIOD_CYCLES)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .read_not_write(read_not_write),
        .reg_addr(reg_addr),
        .write_data(write_data),
        .read_data(read_data),
        .busy(busy),
        .done(done),
        .lis3dh_cs_n(lis3dh_cs_n),
        .lis3dh_sclk(lis3dh_sclk),
        .lis3dh_mosi(lis3dh_mosi),
        .lis3dh_miso(lis3dh_miso)
    );

    // 50 MHz system clock.
    always #10 clk = ~clk;

    // Minimal four-wire SPI slave model.
    // It records MOSI and changes MISO on falling SCLK edges, matching the
    // timing required by the LIS3DH. The controller samples MISO on rising
    // edges.
    always @(negedge lis3dh_cs_n) begin
        observed_tx_word  = 16'd0;
        falling_edge_count = 0;
        lis3dh_miso        = 1'b0;
    end

    always @(negedge lis3dh_sclk) begin
        if (!lis3dh_cs_n) begin
            observed_tx_word = {
                observed_tx_word[14:0],
                lis3dh_mosi
            };

            // The first eight clocks carry the command. During the second
            // byte, return slave_response MSB first.
            if (falling_edge_count >= 8) begin
                lis3dh_miso = slave_response[15 - falling_edge_count];
            end else begin
                lis3dh_miso = 1'b0;
            end

            falling_edge_count = falling_edge_count + 1;
        end
    end

    always @(posedge lis3dh_cs_n) begin
        completed_tx_word    = observed_tx_word;
        completed_edge_count = falling_edge_count;
        lis3dh_miso           = 1'b0;
    end

    task start_transaction;
        input       task_read_not_write;
        input [5:0] task_reg_addr;
        input [7:0] task_write_data;
        begin
            @(negedge clk);
            read_not_write = task_read_not_write;
            reg_addr       = task_reg_addr;
            write_data     = task_write_data;
            start          = 1'b1;

            @(negedge clk);
            start = 1'b0;
        end
    endtask

    task wait_for_done;
        begin
            wait (done == 1'b1);
            @(negedge clk);
        end
    endtask

    initial begin
        clk                  = 1'b0;
        rst_n                = 1'b0;
        start                = 1'b0;
        read_not_write       = 1'b0;
        reg_addr             = 6'd0;
        write_data           = 8'd0;
        lis3dh_miso          = 1'b0;
        slave_response       = 8'd0;
        observed_tx_word     = 16'd0;
        completed_tx_word    = 16'd0;
        falling_edge_count   = 0;
        completed_edge_count = 0;

        repeat (4) @(negedge clk);
        rst_n = 1'b1;

        // Test 1: read WHO_AM_I. Command must be 0x8F and the returned byte
        // must be 0x33.
        slave_response = WHO_AM_I_VALUE;
        start_transaction(1'b1, WHO_AM_I_ADDRESS[5:0], 8'h00);
        wait_for_done();

        if (completed_tx_word !== 16'h8F00) begin
            $fatal(1, "WHO_AM_I command mismatch: got 0x%04h", completed_tx_word);
        end
        if (read_data !== WHO_AM_I_VALUE) begin
            $fatal(1, "WHO_AM_I data mismatch: got 0x%02h", read_data);
        end
        if (completed_edge_count != 16) begin
            $fatal(1, "Expected 16 falling SCLK edges, got %0d", completed_edge_count);
        end
        if ((lis3dh_cs_n !== 1'b1) || (lis3dh_sclk !== 1'b1)) begin
            $fatal(1, "SPI bus did not return to idle after read");
        end

        // Test 2: write 0x57 to CTRL_REG1 (0x20). This verifies RW=0 and
        // confirms that the second transmitted byte is the requested data.
        slave_response = 8'h00;
        start_transaction(1'b0, 6'h20, 8'h57);
        wait_for_done();

        if (completed_tx_word !== 16'h2057) begin
            $fatal(1, "CTRL_REG1 write mismatch: got 0x%04h", completed_tx_word);
        end
        if (completed_edge_count != 16) begin
            $fatal(1, "Expected 16 falling SCLK edges, got %0d", completed_edge_count);
        end

        $display("PASS: LIS3DH single-register SPI read/write transactions verified.");
        $finish;
    end

    initial begin
        // Prevent a broken controller from hanging the simulation forever.
        #100000;
        $fatal(1, "Simulation timeout");
    end

endmodule
