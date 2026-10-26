`timescale 1ns/1ps

module tb_vibration_frame_fifo;

    localparam integer SAMPLE_WIDTH = 16;
    localparam integer FIFO_DEPTH   = 4;
    localparam integer MAX_EXPECTED = 64;

    reg clk;
    reg rst_n;

    reg                            sample_valid;
    wire                           sample_ready;
    reg signed [SAMPLE_WIDTH-1:0]  sample_x;
    reg signed [SAMPLE_WIDTH-1:0]  sample_y;
    reg signed [SAMPLE_WIDTH-1:0]  sample_z;

    wire                           frame_valid;
    reg                            frame_ready;
    wire signed [SAMPLE_WIDTH-1:0] frame_x;
    wire signed [SAMPLE_WIDTH-1:0] frame_y;
    wire signed [SAMPLE_WIDTH-1:0] frame_z;

    wire                           fifo_full;
    wire                           fifo_empty;
    wire [$clog2(FIFO_DEPTH+1)-1:0] fifo_level;
    wire                           overflow;

    reg signed [SAMPLE_WIDTH-1:0] expected_x [0:MAX_EXPECTED-1];
    reg signed [SAMPLE_WIDTH-1:0] expected_y [0:MAX_EXPECTED-1];
    reg signed [SAMPLE_WIDTH-1:0] expected_z [0:MAX_EXPECTED-1];
    integer expected_write;
    integer expected_read;
    integer accepted_inputs;
    integer accepted_outputs;
    integer index;

    vibration_frame_fifo #(
        .SAMPLE_WIDTH(SAMPLE_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .sample_valid(sample_valid),
        .sample_ready(sample_ready),
        .sample_x(sample_x),
        .sample_y(sample_y),
        .sample_z(sample_z),
        .frame_valid(frame_valid),
        .frame_ready(frame_ready),
        .frame_x(frame_x),
        .frame_y(frame_y),
        .frame_z(frame_z),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty),
        .fifo_level(fifo_level),
        .overflow(overflow)
    );

    always #5 clk = ~clk;

    // Scoreboard records only completed ready/valid transfers.
    always @(posedge clk) begin
        if (!rst_n) begin
            expected_write  = 0;
            expected_read   = 0;
            accepted_inputs = 0;
            accepted_outputs = 0;
        end else begin
            if (sample_valid && sample_ready) begin
                if (expected_write >= MAX_EXPECTED) begin
                    $fatal(1, "Scoreboard input capacity exceeded");
                end
                expected_x[expected_write] = sample_x;
                expected_y[expected_write] = sample_y;
                expected_z[expected_write] = sample_z;
                expected_write = expected_write + 1;
                accepted_inputs = accepted_inputs + 1;
            end

            if (frame_valid && frame_ready) begin
                if (expected_read >= expected_write) begin
                    $fatal(1, "Output transfer occurred without expected data");
                end
                if ((frame_x !== expected_x[expected_read]) ||
                    (frame_y !== expected_y[expected_read]) ||
                    (frame_z !== expected_z[expected_read])) begin
                    $fatal(1,
                           "Sample order/data mismatch at index %0d: expected (%0d,%0d,%0d), got (%0d,%0d,%0d)",
                           expected_read,
                           expected_x[expected_read],
                           expected_y[expected_read],
                           expected_z[expected_read],
                           frame_x, frame_y, frame_z);
                end
                expected_read = expected_read + 1;
                accepted_outputs = accepted_outputs + 1;
            end
        end
    end

    task apply_reset;
        begin
            sample_valid = 1'b0;
            frame_ready  = 1'b0;
            rst_n        = 1'b0;
            #3;

            if (!fifo_empty || fifo_full || frame_valid ||
                (fifo_level !== 0) || overflow) begin
                $fatal(1, "FIFO state was not cleared by asynchronous reset");
            end

            repeat (2) @(posedge clk);
            @(negedge clk);
            rst_n = 1'b1;
        end
    endtask

    task drive_continuous_samples;
        input integer count;
        input integer base;
        integer item;
        begin
            @(negedge clk);
            sample_valid = 1'b1;
            for (item = 0; item < count; item = item + 1) begin
                sample_x = base + item;
                sample_y = -(base + item);
                sample_z = (base * 2) + item;

                if (!sample_ready) begin
                    $fatal(1, "Continuous producer encountered unexpected backpressure");
                end

                @(posedge clk);
                @(negedge clk);
            end
            sample_valid = 1'b0;
        end
    endtask

    task wait_until_empty;
        integer guard;
        begin
            guard = 0;
            while (!fifo_empty && (guard < 100)) begin
                @(posedge clk);
                guard = guard + 1;
            end
            #1;
            if (!fifo_empty) begin
                $fatal(1, "FIFO did not drain before guard timeout");
            end
        end
    endtask

    initial begin
        clk          = 1'b0;
        rst_n        = 1'b0;
        sample_valid = 1'b0;
        sample_x     = '0;
        sample_y     = '0;
        sample_z     = '0;
        frame_ready  = 1'b0;

        // 1. Continuous one-frame-per-cycle traffic with simultaneous push/pop.
        apply_reset();
        frame_ready = 1'b1;
        drive_continuous_samples(8, 10);
        wait_until_empty();
        if ((accepted_inputs != 8) || (accepted_outputs != 8)) begin
            $fatal(1, "Continuous test counts incorrect: in=%0d out=%0d",
                   accepted_inputs, accepted_outputs);
        end

        // 2. Pause the consumer. The oldest frame must remain valid and stable.
        apply_reset();
        frame_ready = 1'b0;
        drive_continuous_samples(3, 100);
        if (!frame_valid || (fifo_level !== 3)) begin
            $fatal(1, "Paused-read test did not retain three frames");
        end
        repeat (3) begin
            @(posedge clk);
            #1;
            if (!frame_valid || (frame_x !== 16'sd100) ||
                (frame_y !== -16'sd100) || (frame_z !== 16'sd200)) begin
                $fatal(1, "Output frame changed while downstream was stalled");
            end
        end
        @(negedge clk);
        frame_ready = 1'b1;
        wait_until_empty();
        if ((accepted_inputs != 3) || (accepted_outputs != 3)) begin
            $fatal(1, "Paused-read counts incorrect: in=%0d out=%0d",
                   accepted_inputs, accepted_outputs);
        end

        // 3. Fill the FIFO, refuse overwrite, set sticky overflow, then drain.
        apply_reset();
        frame_ready = 1'b0;
        drive_continuous_samples(FIFO_DEPTH, 200);
        #1;
        if (!fifo_full || sample_ready || (fifo_level !== FIFO_DEPTH)) begin
            $fatal(1, "FIFO full state was not asserted correctly");
        end

        @(negedge clk);
        sample_valid = 1'b1;
        sample_x = 16'sd999;
        sample_y = -16'sd999;
        sample_z = 16'sd999;
        @(posedge clk);
        @(negedge clk);
        sample_valid = 1'b0;
        #1;
        if (!overflow || (accepted_inputs != FIFO_DEPTH)) begin
            $fatal(1, "Full FIFO did not reject and report the extra sample");
        end

        frame_ready = 1'b1;
        wait_until_empty();
        if (accepted_outputs != FIFO_DEPTH) begin
            $fatal(1, "Full FIFO drain count incorrect: out=%0d",
                   accepted_outputs);
        end
        if (!overflow) begin
            $fatal(1, "Overflow indication was not sticky");
        end

        // 4. Reset with queued data: discard it and clear level/overflow.
        frame_ready = 1'b0;
        drive_continuous_samples(2, 300);
        if (fifo_level !== 2) begin
            $fatal(1, "Pre-reset fill count incorrect");
        end
        #2;
        rst_n = 1'b0;
        #1;
        if (!fifo_empty || frame_valid || (fifo_level !== 0) || overflow) begin
            $fatal(1, "Mid-stream reset did not clear FIFO state");
        end
        repeat (2) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;

        frame_ready = 1'b1;
        drive_continuous_samples(1, 400);
        wait_until_empty();
        if ((accepted_inputs != 1) || (accepted_outputs != 1)) begin
            $fatal(1, "Post-reset transfer counts incorrect: in=%0d out=%0d",
                   accepted_inputs, accepted_outputs);
        end

        $display("PASS: vibration frame FIFO ready/valid behavior verified.");
        $display("      width=%0d depth=%0d continuous=8 paused=3 full=%0d overflow=1 reset=PASS order=PASS",
                 SAMPLE_WIDTH, FIFO_DEPTH, FIFO_DEPTH);
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "Simulation timeout");
    end

endmodule
