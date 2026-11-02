`timescale 1ns/1ps

module tb_vibration_axi_lite_slave;
    reg clk = 1'b0;
    always #10 clk = ~clk; // 50 MHz, same clock for result producer and AXI.
    reg rst_n = 1'b0;

    reg [11:0] awaddr = 0;
    reg [2:0] awprot = 0;
    reg awvalid = 0;
    wire awready;
    reg [31:0] wdata = 0;
    reg [3:0] wstrb = 0;
    reg wvalid = 0;
    wire wready;
    wire [1:0] bresp;
    wire bvalid;
    reg bready = 0;
    reg [11:0] araddr = 0;
    reg [2:0] arprot = 0;
    reg arvalid = 0;
    wire arready;
    wire [31:0] rdata;
    wire [1:0] rresp;
    wire rvalid;
    reg rready = 0;

    reg result_valid = 0;
    wire result_ready;
    reg [15:0] peak = 0;
    reg [34:0] sumsq = 0;
    reg [4:0] count = 0;
    reg init_done = 0, init_error = 0;
    reg sensor_overrun = 0, fifo_overflow = 0;
    reg [31:0] drop_count = 0;
    integer checks = 0;

    vibration_axi_lite_slave dut (
        .s_axi_aclk(clk), .s_axi_aresetn(rst_n),
        .s_axi_awaddr(awaddr), .s_axi_awprot(awprot),
        .s_axi_awvalid(awvalid), .s_axi_awready(awready),
        .s_axi_wdata(wdata), .s_axi_wstrb(wstrb),
        .s_axi_wvalid(wvalid), .s_axi_wready(wready),
        .s_axi_bresp(bresp), .s_axi_bvalid(bvalid),
        .s_axi_bready(bready),
        .s_axi_araddr(araddr), .s_axi_arprot(arprot),
        .s_axi_arvalid(arvalid), .s_axi_arready(arready),
        .s_axi_rdata(rdata), .s_axi_rresp(rresp),
        .s_axi_rvalid(rvalid), .s_axi_rready(rready),
        .result_valid(result_valid), .result_ready(result_ready),
        .result_peak(peak), .result_sum_squares(sumsq),
        .result_sample_count(count), .init_done(init_done),
        .init_error(init_error), .sensor_overrun(sensor_overrun),
        .fifo_overflow(fifo_overflow), .sample_drop_count(drop_count)
    );

    task automatic fail(input string message);
        begin
            $display("FAIL %s at %0t", message, $time);
            $fatal(1);
        end
    endtask

    task automatic read_begin(input reg [11:0] address);
        begin
            @(negedge clk);
            araddr = address;
            arvalid = 1'b1;
            while (1) begin
                @(posedge clk);
                if (arready) break;
            end
            @(negedge clk);
            arvalid = 1'b0;
            if (!rvalid) fail("read response missing");
        end
    endtask

    task automatic read_finish;
        begin
            @(negedge clk);
            rready = 1'b1;
            @(posedge clk);
            @(negedge clk);
            rready = 1'b0;
            if (rvalid) fail("RVALID did not clear");
        end
    endtask

    task automatic check_read(input reg [11:0] address,
                              input reg [31:0] expected_data,
                              input reg [1:0] expected_resp);
        begin
            read_begin(address);
            if (rdata !== expected_data || rresp !== expected_resp) begin
                $display("read %02h: got %08h/%b expected %08h/%b",
                         address, rdata, rresp, expected_data, expected_resp);
                fail("read mismatch");
            end
            checks = checks + 1;
            read_finish();
        end
    endtask

    task automatic send_aw(input reg [11:0] address);
        begin
            @(negedge clk);
            awaddr = address;
            awvalid = 1'b1;
            while (1) begin
                @(posedge clk);
                if (awready) break;
            end
            @(negedge clk);
            awvalid = 1'b0;
        end
    endtask

    task automatic send_w(input reg [31:0] data,
                          input reg [3:0] strobes);
        begin
            @(negedge clk);
            wdata = data;
            wstrb = strobes;
            wvalid = 1'b1;
            while (1) begin
                @(posedge clk);
                if (wready) break;
            end
            @(negedge clk);
            wvalid = 1'b0;
        end
    endtask

    task automatic check_b(input reg [1:0] expected_resp);
        begin
            if (!bvalid || bresp !== expected_resp)
                fail("write response mismatch");
            // Response must remain until BREADY and block the next write.
            repeat (2) begin
                @(posedge clk);
                if (!bvalid || bresp !== expected_resp || awready || wready)
                    fail("write response/backpressure not stable");
            end
            checks = checks + 1;
            @(negedge clk);
            bready = 1'b1;
            @(posedge clk);
            @(negedge clk);
            bready = 1'b0;
            if (bvalid) fail("BVALID did not clear");
        end
    endtask

    task automatic push_result(input reg [15:0] p,
                               input reg [34:0] s,
                               input reg [4:0] n);
        begin
            @(negedge clk);
            if (!result_ready) fail("result not ready");
            peak = p;
            sumsq = s;
            count = n;
            result_valid = 1'b1;
            @(posedge clk);
            @(negedge clk);
            result_valid = 1'b0;
        end
    endtask

    initial begin
        #100000;
        fail("simulation timeout");
    end

    initial begin
        // A pulse while reset is active is not an accepted result.
        peak = 16'hffff;
        sumsq = 35'h7_ffff_ffff;
        count = 5'd16;
        result_valid = 1'b1;
        repeat (3) @(posedge clk);
        if (result_ready) fail("ready high during reset");
        @(negedge clk);
        result_valid = 1'b0;
        rst_n = 1'b1;

        check_read(6'h00, 32'h5649_4231, 2'b00);
        check_read(6'h04, 32'h0001_0000, 2'b00);
        check_read(6'h08, 32'd0, 2'b00);
        check_read(6'h0c, 32'd0, 2'b00);
        check_read(6'h10, 32'd0, 2'b00);
        check_read(6'h14, 32'd0, 2'b00);
        check_read(6'h18, 32'd0, 2'b00);
        check_read(6'h1c, 32'd0, 2'b00);
        check_read(6'h20, 32'd0, 2'b00);
        check_read(6'h24, 32'd0, 2'b00);

        // AW first, then W; CONTROL ignores even a nonzero write.
        send_aw(6'h08);
        if (bvalid) fail("BVALID before W handshake");
        send_w(32'hffff_ffff, 4'hf);
        check_b(2'b00);
        check_read(6'h08, 32'd0, 2'b00);
        // W first, then AW; zero WSTRB is still a legal ignored CONTROL write.
        send_w(32'h1234_5678, 4'h0);
        if (bvalid) fail("BVALID before AW handshake");
        send_aw(6'h08);
        check_b(2'b00);
        // Independent channels may also handshake on the same clock edge.
        fork
            send_aw(6'h08);
            send_w(32'h55aa_55aa, 4'hf);
        join
        check_b(2'b00);
        send_aw(6'h10);
        send_w(32'hdead_beef, 4'hf);
        check_b(2'b10); // RO write -> SLVERR.
        send_w(32'habcd_1234, 4'hf);
        send_aw(6'h28);
        check_b(2'b10); // Unmapped write -> SLVERR.
        send_aw(6'h09);
        send_w(32'd0, 4'hf);
        check_b(2'b10); // Misaligned write -> SLVERR.
        // Address bits above 0x3f must not alias a valid register.
        send_aw(12'h040);
        send_w(32'd0, 4'hf);
        check_b(2'b10);
        check_read(6'h09, 32'd0, 2'b10);
        check_read(6'h28, 32'd0, 2'b10);
        check_read(12'h040, 32'd0, 2'b10);

        init_done = 1'b1;
        sensor_overrun = 1'b1;
        fifo_overflow = 1'b1;
        drop_count = 32'd7;
        check_read(6'h20, 32'h0000_000d, 2'b00);
        check_read(6'h24, 32'd7, 2'b00);
        push_result(16'd5, 35'd50, 5'd16);
        check_read(6'h0c, 32'd1, 2'b00);
        check_read(6'h10, 32'd5, 2'b00);
        check_read(6'h14, 32'd50, 2'b00);
        check_read(6'h18, 32'd0, 2'b00);
        check_read(6'h1c, 32'd16, 2'b00);
        check_read(6'h20, 32'h0000_001d, 2'b00);

        // Hold a read response while the producer replaces the snapshot.
        read_begin(6'h10);
        if (rdata !== 32'd5 || rresp !== 2'b00)
            fail("initial stalled read");
        push_result(16'h8000, 35'h4_0000_0000, 5'd16);
        if (!rvalid || rdata !== 32'd5 || arready)
            fail("stalled RDATA changed after result update");
        checks = checks + 1;
        read_finish();
        check_read(6'h0c, 32'd2, 2'b00);
        check_read(6'h10, 32'h0000_8000, 2'b00);
        check_read(6'h14, 32'd0, 2'b00);
        check_read(6'h18, 32'd4, 2'b00);

        // Consecutive one-cycle result handshakes increment sequence once each.
        @(negedge clk);
        result_valid = 1'b1;
        peak = 16'd11; sumsq = 35'd121; count = 5'd16;
        @(posedge clk);
        @(negedge clk);
        peak = 16'd12; sumsq = 35'd144;
        @(posedge clk);
        @(negedge clk);
        result_valid = 1'b0;
        check_read(6'h0c, 32'd4, 2'b00);
        check_read(6'h10, 32'd12, 2'b00);
        check_read(6'h14, 32'd144, 2'b00);

        // RESULT_SEQ double-read detects an update between PS reads.
        check_read(6'h0c, 32'd4, 2'b00);
        push_result(16'd13, 35'd169, 5'd16);
        check_read(6'h0c, 32'd5, 2'b00);
        check_read(6'h10, 32'd13, 2'b00);
        init_error = 1'b1;
        check_read(6'h20, 32'h0000_001f, 2'b00);

        // Reset discards any pending responses and the complete snapshot.
        read_begin(6'h0c);
        @(negedge clk);
        rst_n = 1'b0;
        init_done = 1'b0; init_error = 1'b0;
        sensor_overrun = 1'b0; fifo_overflow = 1'b0; drop_count = 0;
        @(negedge clk);
        if (rvalid || bvalid || result_ready) fail("reset did not clear state");
        rst_n = 1'b1;
        check_read(6'h0c, 32'd0, 2'b00);
        check_read(6'h10, 32'd0, 2'b00);
        check_read(6'h14, 32'd0, 2'b00);
        check_read(6'h18, 32'd0, 2'b00);
        check_read(6'h20, 32'd0, 2'b00);
        $display("PASS tb_vibration_axi_lite_slave checks=%0d", checks);
        $finish;
    end
endmodule
