`timescale 1ns/1ps

module tb_vibration_window_features;

    localparam integer SAMPLE_WIDTH  = 16;
    localparam integer WINDOW_SIZE = 4;
    localparam integer SUM_WIDTH =
        (2*SAMPLE_WIDTH-1) + $clog2(WINDOW_SIZE);
    localparam integer COUNT_WIDTH = $clog2(WINDOW_SIZE + 1);

    reg clk;
    reg rst_n;
    reg sample_valid;
    wire sample_ready;
    reg signed [SAMPLE_WIDTH-1:0] sample_data;

    wire result_valid;
    reg  result_ready;
    wire [SAMPLE_WIDTH-1:0] result_peak;
    wire [SUM_WIDTH-1:0] result_sum_squares;
    wire [COUNT_WIDTH-1:0] result_sample_count;

    integer accepted_samples;
    integer completed_results;
    integer index;

    reg signed [SAMPLE_WIDTH-1:0] continuous_values [0:7];

    vibration_window_features #(
        .SAMPLE_WIDTH(SAMPLE_WIDTH),
        .WINDOW_SIZE(WINDOW_SIZE)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .sample_valid(sample_valid),
        .sample_ready(sample_ready),
        .sample_data(sample_data),
        .result_valid(result_valid),
        .result_ready(result_ready),
        .result_peak(result_peak),
        .result_sum_squares(result_sum_squares),
        .result_sample_count(result_sample_count)
    );

    always #5 clk = ~clk;

    always @(posedge clk) begin
        if (!rst_n) begin
            accepted_samples  = 0;
            completed_results = 0;
        end else begin
            if (sample_valid && sample_ready) begin
                accepted_samples = accepted_samples + 1;
            end
            if (result_valid && result_ready) begin
                completed_results = completed_results + 1;
            end
        end
    end

    task apply_reset;
        begin
            sample_valid = 1'b0;
            result_ready = 1'b0;
            rst_n = 1'b0;
            #2;
            if (result_valid || !sample_ready ||
                (result_peak !== 0) || (result_sum_squares !== 0) ||
                (result_sample_count !== 0)) begin
                $fatal(1, "Reset did not clear feature module state");
            end
            repeat (2) @(posedge clk);
            @(negedge clk);
            rst_n = 1'b1;
        end
    endtask

    task send_sample;
        input signed [SAMPLE_WIDTH-1:0] value;
        begin
            @(negedge clk);
            sample_valid = 1'b1;
            sample_data  = value;

            while (!sample_ready) begin
                @(negedge clk);
            end

            @(posedge clk);
            @(negedge clk);
            sample_valid = 1'b0;
        end
    endtask

    task check_result;
        input string case_name;
        input [SAMPLE_WIDTH-1:0] expected_peak;
        input [SUM_WIDTH-1:0] expected_sum_squares;
        input [COUNT_WIDTH-1:0] expected_count;
        begin
            wait (result_valid == 1'b1);
            #1;
            if ((result_peak !== expected_peak) ||
                (result_sum_squares !== expected_sum_squares) ||
                (result_sample_count !== expected_count)) begin
                $fatal(1,
                       "Feature mismatch: expected peak=%0d sum=%0d count=%0d, got peak=%0d sum=%0d count=%0d",
                       expected_peak, expected_sum_squares, expected_count,
                       result_peak, result_sum_squares, result_sample_count);
            end
            $display("RESULT %0s peak=%0d sum=%0d count=%0d",
                     case_name, result_peak, result_sum_squares,
                     result_sample_count);

            @(negedge clk);
            result_ready = 1'b1;
            @(posedge clk);
            @(negedge clk);
            result_ready = 1'b0;
            #1;
            if (result_valid) begin
                $fatal(1, "Result valid did not clear after handshake");
            end
        end
    endtask

    initial begin
        clk          = 1'b0;
        rst_n        = 1'b0;
        sample_valid = 1'b0;
        sample_data  = '0;
        result_ready = 1'b0;

        continuous_values[0] = 16'sd1;
        continuous_values[1] = 16'sd2;
        continuous_values[2] = 16'sd3;
        continuous_values[3] = 16'sd4;
        continuous_values[4] = -16'sd5;
        continuous_values[5] = -16'sd6;
        continuous_values[6] = -16'sd7;
        continuous_values[7] = -16'sd8;

        // Python golden: zeros -> peak=0, sum_squares=0, count=4.
        apply_reset();
        send_sample(16'sd0);
        send_sample(16'sd0);
        send_sample(16'sd0);
        send_sample(16'sd0);
        check_result("zeros", 16'd0, SUM_WIDTH'(0), COUNT_WIDTH'(4));

        // Python golden: [3,-4,0,5] -> peak=5, sum_squares=50.
        send_sample(16'sd3);
        send_sample(-16'sd4);
        send_sample(16'sd0);
        send_sample(16'sd5);
        check_result("signed", 16'd5, SUM_WIDTH'(50), COUNT_WIDTH'(4));

        // Most-negative input and stalled result output.
        // Python golden: [-32768,32767,-1,0]
        // peak=32768, sum_squares=2147418114.
        send_sample(16'sh8000);
        send_sample(16'sd32767);
        send_sample(-16'sd1);
        send_sample(16'sd0);
        wait (result_valid == 1'b1);
        repeat (5) begin
            @(posedge clk);
            #1;
            if (!result_valid || sample_ready ||
                (result_peak !== 16'd32768) ||
                (result_sum_squares !== SUM_WIDTH'(2147418114)) ||
                (result_sample_count !== COUNT_WIDTH'(4))) begin
                $fatal(1, "Result changed or input was accepted while output stalled");
            end
        end
        check_result("min_negative", 16'd32768,
                     SUM_WIDTH'(2147418114), COUNT_WIDTH'(4));

        // Four maximum-magnitude values produce 2^32. A 32-bit sum would
        // wrap to zero, so this tests the derived 33-bit accumulator.
        send_sample(16'sh8000);
        send_sample(16'sh8000);
        send_sample(16'sh8000);
        send_sample(16'sh8000);
        check_result("max_square", 16'd32768,
                     33'd4294967296, COUNT_WIDTH'(4));

        // Two consecutive windows. sample_valid remains asserted while the
        // module backpressures at each result boundary.
        fork
            begin : continuous_producer
                @(negedge clk);
                sample_valid = 1'b1;
                index = 0;
                while (index < 8) begin
                    sample_data = continuous_values[index];
                    @(posedge clk);
                    if (sample_ready) begin
                        index = index + 1;
                    end
                    @(negedge clk);
                end
                sample_valid = 1'b0;
            end
            begin : continuous_consumer
                check_result("continuous_a", 16'd4,
                             SUM_WIDTH'(30), COUNT_WIDTH'(4));
                check_result("continuous_b", 16'd8,
                             SUM_WIDTH'(174), COUNT_WIDTH'(4));
            end
        join

        // Reset discards a partial window.
        send_sample(16'sd100);
        send_sample(16'sd200);
        #3;
        rst_n = 1'b0;
        #1;
        if (result_valid || !sample_ready) begin
            $fatal(1, "Partial-window reset did not return to idle");
        end
        repeat (2) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;

        // Python golden after reset: [9,-10,11,-12]
        // peak=12, sum_squares=446.
        send_sample(16'sd9);
        send_sample(-16'sd10);
        send_sample(16'sd11);
        send_sample(-16'sd12);
        check_result("after_reset", 16'd12,
                     SUM_WIDTH'(446), COUNT_WIDTH'(4));

        if ((accepted_samples != 4) || (completed_results != 1)) begin
            $fatal(1,
                   "Post-reset handshake counters incorrect: samples=%0d results=%0d",
                   accepted_samples, completed_results);
        end

        $display("PASS: fixed-window vibration features match Python integer golden results.");
        $display("      windows=7 peak=PASS sum_squares=PASS count=PASS stall=PASS reset=PASS continuous=PASS");
        $finish;
    end

    initial begin
        #200000;
        $fatal(1, "Simulation timeout");
    end

endmodule
