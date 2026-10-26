`timescale 1ns/1ps

module tb_vibration_processing_pipeline;

    localparam integer SAMPLE_WIDTH = 16;
    localparam integer TEST_FIFO_DEPTH = 4;
    localparam integer TEST_WINDOW_SIZE = 4;
    localparam integer TEST_SUM_WIDTH =
        (2*SAMPLE_WIDTH-1) + $clog2(TEST_WINDOW_SIZE);
    localparam integer TEST_COUNT_WIDTH = $clog2(TEST_WINDOW_SIZE+1);

    localparam integer DEFAULT_FIFO_DEPTH = 8;
    localparam integer DEFAULT_WINDOW_SIZE = 16;
    localparam integer DEFAULT_SUM_WIDTH =
        (2*SAMPLE_WIDTH-1) + $clog2(DEFAULT_WINDOW_SIZE);
    localparam integer DEFAULT_COUNT_WIDTH = $clog2(DEFAULT_WINDOW_SIZE+1);

    reg clk;

    reg test_rst_n;
    reg test_sample_valid;
    wire test_sample_ready;
    reg signed [15:0] test_sample_x;
    reg signed [15:0] test_sample_y;
    reg signed [15:0] test_sample_z;
    wire test_result_valid;
    reg test_result_ready;
    wire [15:0] test_result_peak;
    wire [TEST_SUM_WIDTH-1:0] test_result_sum_squares;
    wire [TEST_COUNT_WIDTH-1:0] test_result_sample_count;
    wire test_fifo_full;
    wire test_fifo_empty;
    wire [$clog2(TEST_FIFO_DEPTH+1)-1:0] test_fifo_level;
    wire test_fifo_overflow;
    wire test_frame_valid;
    wire test_frame_ready;
    wire signed [15:0] test_frame_x;
    wire signed [15:0] test_frame_y;
    wire signed [15:0] test_frame_z;

    reg default_rst_n;
    reg default_sample_valid;
    wire default_sample_ready;
    reg signed [15:0] default_sample_x;
    reg signed [15:0] default_sample_y;
    reg signed [15:0] default_sample_z;
    wire default_result_valid;
    reg default_result_ready;
    wire [15:0] default_result_peak;
    wire [DEFAULT_SUM_WIDTH-1:0] default_result_sum_squares;
    wire [DEFAULT_COUNT_WIDTH-1:0] default_result_sample_count;

    reg signed [15:0] stream_x [0:11];
    reg signed [15:0] expected_x [0:17];
    reg signed [15:0] expected_y [0:17];
    reg signed [15:0] expected_z [0:17];

    integer source_index;
    integer expected_pop_index;
    integer accepted_count;
    integer popped_count;
    integer result_count;
    integer default_result_count;
    integer index;

    vibration_processing_pipeline #(
        .SAMPLE_WIDTH(SAMPLE_WIDTH),
        .FIFO_DEPTH(TEST_FIFO_DEPTH),
        .WINDOW_SIZE(TEST_WINDOW_SIZE)
    ) test_dut (
        .clk(clk), .rst_n(test_rst_n),
        .sample_valid(test_sample_valid), .sample_ready(test_sample_ready),
        .sample_x(test_sample_x), .sample_y(test_sample_y), .sample_z(test_sample_z),
        .result_valid(test_result_valid), .result_ready(test_result_ready),
        .result_peak(test_result_peak),
        .result_sum_squares(test_result_sum_squares),
        .result_sample_count(test_result_sample_count),
        .fifo_full(test_fifo_full), .fifo_empty(test_fifo_empty),
        .fifo_level(test_fifo_level), .fifo_overflow(test_fifo_overflow),
        .fifo_frame_valid(test_frame_valid), .fifo_frame_ready(test_frame_ready),
        .fifo_frame_x(test_frame_x), .fifo_frame_y(test_frame_y),
        .fifo_frame_z(test_frame_z)
    );

    // No parameter overrides: verifies the integration module's default 8/16
    // configuration as a separate smoke test.
    vibration_processing_pipeline default_dut (
        .clk(clk), .rst_n(default_rst_n),
        .sample_valid(default_sample_valid), .sample_ready(default_sample_ready),
        .sample_x(default_sample_x), .sample_y(default_sample_y),
        .sample_z(default_sample_z),
        .result_valid(default_result_valid), .result_ready(default_result_ready),
        .result_peak(default_result_peak),
        .result_sum_squares(default_result_sum_squares),
        .result_sample_count(default_result_sample_count),
        .fifo_full(), .fifo_empty(), .fifo_level(), .fifo_overflow(),
        .fifo_frame_valid(), .fifo_frame_ready(), .fifo_frame_x(),
        .fifo_frame_y(), .fifo_frame_z()
    );

    always #5 clk = ~clk;

    // End-to-end XYZ order checker at the actual FIFO-to-feature handshake.
    always @(posedge clk) begin
        if (test_rst_n) begin
            if (test_sample_valid && test_sample_ready)
                accepted_count = accepted_count + 1;

            if (test_frame_valid && test_frame_ready) begin
                if ((test_frame_x !== expected_x[expected_pop_index]) ||
                    (test_frame_y !== expected_y[expected_pop_index]) ||
                    (test_frame_z !== expected_z[expected_pop_index])) begin
                    $fatal(1,
                        "FIFO order mismatch at %0d: got (%0d,%0d,%0d), expected (%0d,%0d,%0d)",
                        expected_pop_index, test_frame_x, test_frame_y, test_frame_z,
                        expected_x[expected_pop_index], expected_y[expected_pop_index],
                        expected_z[expected_pop_index]);
                end
                expected_pop_index = expected_pop_index + 1;
                popped_count = popped_count + 1;
            end

            if (test_result_valid && test_result_ready) begin
                case (result_count)
                    0: begin
                        if (test_result_peak !== 16'd5 ||
                            test_result_sum_squares !== TEST_SUM_WIDTH'(50) ||
                            test_result_sample_count !== TEST_COUNT_WIDTH'(4))
                            $fatal(1, "First integrated window mismatch");
                        $display("RESULT integrated_a peak=%0d sum=%0d count=%0d",
                            test_result_peak, test_result_sum_squares,
                            test_result_sample_count);
                    end
                    1: begin
                        if (test_result_peak !== 16'd32768 ||
                            test_result_sum_squares !== TEST_SUM_WIDTH'(1073742018) ||
                            test_result_sample_count !== TEST_COUNT_WIDTH'(4))
                            $fatal(1, "Second integrated window mismatch");
                        $display("RESULT integrated_b peak=%0d sum=%0d count=%0d",
                            test_result_peak, test_result_sum_squares,
                            test_result_sample_count);
                    end
                    2: begin
                        if (test_result_peak !== 16'd13 ||
                            test_result_sum_squares !== TEST_SUM_WIDTH'(534) ||
                            test_result_sample_count !== TEST_COUNT_WIDTH'(4))
                            $fatal(1, "Third integrated window mismatch");
                        $display("RESULT integrated_c peak=%0d sum=%0d count=%0d",
                            test_result_peak, test_result_sum_squares,
                            test_result_sample_count);
                    end
                    3: begin
                        if (test_result_peak !== 16'd12 ||
                            test_result_sum_squares !== TEST_SUM_WIDTH'(446) ||
                            test_result_sample_count !== TEST_COUNT_WIDTH'(4))
                            $fatal(1, "Post-reset integrated window mismatch");
                        $display("RESULT integrated_after_reset peak=%0d sum=%0d count=%0d",
                            test_result_peak, test_result_sum_squares,
                            test_result_sample_count);
                    end
                    default: $fatal(1, "Unexpected extra test result");
                endcase
                result_count = result_count + 1;
            end
        end
    end

    always @(posedge clk) begin
        if (default_rst_n && default_result_valid && default_result_ready) begin
            if (default_result_peak !== 16'd8 ||
                default_result_sum_squares !== DEFAULT_SUM_WIDTH'(344) ||
                default_result_sample_count !== DEFAULT_COUNT_WIDTH'(16))
                $fatal(1, "Default-parameter window mismatch");
            $display("RESULT default_8_16 peak=%0d sum=%0d count=%0d",
                default_result_peak, default_result_sum_squares,
                default_result_sample_count);
            default_result_count = default_result_count + 1;
        end
    end

    task send_test_frame;
        input signed [15:0] x;
        input signed [15:0] y;
        input signed [15:0] z;
        begin
            @(negedge clk);
            test_sample_valid = 1'b1;
            test_sample_x = x;
            test_sample_y = y;
            test_sample_z = z;
            while (!test_sample_ready)
                @(negedge clk);
            @(posedge clk);
            @(negedge clk);
            test_sample_valid = 1'b0;
        end
    endtask

    task send_default_frame;
        input signed [15:0] x;
        input signed [15:0] y;
        input signed [15:0] z;
        begin
            @(negedge clk);
            default_sample_valid = 1'b1;
            default_sample_x = x;
            default_sample_y = y;
            default_sample_z = z;
            while (!default_sample_ready)
                @(negedge clk);
            @(posedge clk);
            @(negedge clk);
            default_sample_valid = 1'b0;
        end
    endtask

    initial begin
        clk = 1'b0;
        test_rst_n = 1'b0;
        test_sample_valid = 1'b0;
        test_sample_x = '0;
        test_sample_y = '0;
        test_sample_z = '0;
        test_result_ready = 1'b0;
        default_rst_n = 1'b0;
        default_sample_valid = 1'b0;
        default_sample_x = '0;
        default_sample_y = '0;
        default_sample_z = '0;
        default_result_ready = 1'b0;
        source_index = 0;
        expected_pop_index = 0;
        accepted_count = 0;
        popped_count = 0;
        result_count = 0;
        default_result_count = 0;

        stream_x[0]  = 16'sd3;
        stream_x[1]  = -16'sd4;
        stream_x[2]  = 16'sd0;
        stream_x[3]  = 16'sd5;
        stream_x[4]  = 16'sh8000;
        stream_x[5]  = 16'sd7;
        stream_x[6]  = -16'sd8;
        stream_x[7]  = 16'sd9;
        stream_x[8]  = 16'sd10;
        stream_x[9]  = -16'sd11;
        stream_x[10] = 16'sd12;
        stream_x[11] = -16'sd13;

        for (index = 0; index < 12; index = index + 1) begin
            expected_x[index] = stream_x[index];
            expected_y[index] = 16'sd1000 + index;
            expected_z[index] = -16'sd1000 - index;
        end
        expected_x[12] = 16'sd100; expected_y[12] = 16'sd1100; expected_z[12] = -16'sd1100;
        expected_x[13] = 16'sd200; expected_y[13] = 16'sd1200; expected_z[13] = -16'sd1200;
        expected_x[14] = 16'sd9;   expected_y[14] = 16'sd2000; expected_z[14] = -16'sd2000;
        expected_x[15] = -16'sd10; expected_y[15] = 16'sd2001; expected_z[15] = -16'sd2001;
        expected_x[16] = 16'sd11;  expected_y[16] = 16'sd2002; expected_z[16] = -16'sd2002;
        expected_x[17] = -16'sd12; expected_y[17] = 16'sd2003; expected_z[17] = -16'sd2003;

        repeat (3) @(posedge clk);
        @(negedge clk);
        test_rst_n = 1'b1;

        // Continuous producer. While blocked, source_index and all XYZ data
        // remain unchanged until a real input handshake occurs.
        fork
            begin : continuous_source
                @(negedge clk);
                test_sample_valid = 1'b1;
                source_index = 0;
                test_sample_x = stream_x[0];
                test_sample_y = 16'sd1000;
                test_sample_z = -16'sd1000;
                while (source_index < 12) begin
                    @(posedge clk);
                    if (test_sample_ready)
                        source_index = source_index + 1;
                    @(negedge clk);
                    if (source_index < 12) begin
                        test_sample_x = stream_x[source_index];
                        test_sample_y = 16'sd1000 + source_index;
                        test_sample_z = -16'sd1000 - source_index;
                    end
                end
                test_sample_valid = 1'b0;
            end
            begin : backpressure_controller
                reg [15:0] held_peak;
                reg [TEST_SUM_WIDTH-1:0] held_sum;
                reg [TEST_COUNT_WIDTH-1:0] held_count;
                reg signed [15:0] held_source_x;

                wait (test_result_valid == 1'b1);
                held_peak = test_result_peak;
                held_sum = test_result_sum_squares;
                held_count = test_result_sample_count;
                wait (test_fifo_full == 1'b1);
                // fifo_full rises immediately after the final accepted push.
                // That transfer permits the producer to advance once; sample
                // stability is required from the following source-driving
                // edge onward, when ready is already low.
                @(negedge clk);
                #1;
                if (test_frame_ready || test_sample_ready ||
                    !test_sample_valid || test_fifo_level != TEST_FIFO_DEPTH)
                    $fatal(1, "Backpressure did not propagate through feature/FIFO/source");
                held_source_x = test_sample_x;

                repeat (3) begin
                    @(posedge clk);
                    #1;
                    if (!test_result_valid || test_frame_ready ||
                        test_sample_ready || !test_fifo_full ||
                        test_result_peak !== held_peak ||
                        test_result_sum_squares !== held_sum ||
                        test_result_sample_count !== held_count ||
                        test_sample_x !== held_source_x)
                        $fatal(1, "Blocked chain changed data or lost backpressure");
                end
                if (!test_fifo_overflow)
                    $fatal(1, "FIFO pressure flag was not recorded while full");
                $display("CHECK backpressure result_valid=1 frame_ready=0 fifo_full=1 sample_ready=0 level=%0d",
                    test_fifo_level);

                @(negedge clk);
                test_result_ready = 1'b1;
            end
        join

        wait (result_count == 3);
        wait (test_fifo_empty == 1'b1);

        // Put two samples into an incomplete feature window, then prove reset
        // discards that partial state and clears FIFO/result/overflow state.
        send_test_frame(16'sd100, 16'sd1100, -16'sd1100);
        send_test_frame(16'sd200, 16'sd1200, -16'sd1200);
        wait (test_fifo_empty == 1'b1);
        @(negedge clk);
        test_rst_n = 1'b0;
        #1;
        if (test_result_valid || !test_fifo_empty || test_fifo_level != 0 ||
            test_fifo_overflow || !test_sample_ready)
            $fatal(1, "Integrated reset did not clear FIFO/feature state");
        repeat (2) @(posedge clk);
        @(negedge clk);
        test_rst_n = 1'b1;

        send_test_frame(16'sd9,   16'sd2000, -16'sd2000);
        send_test_frame(-16'sd10, 16'sd2001, -16'sd2001);
        send_test_frame(16'sd11,  16'sd2002, -16'sd2002);
        send_test_frame(-16'sd12, 16'sd2003, -16'sd2003);
        wait (result_count == 4);

        if (accepted_count != 18 || popped_count != 18 ||
            expected_pop_index != 18)
            $fatal(1, "Handshake totals mismatch: accepted=%0d popped=%0d checked=%0d",
                accepted_count, popped_count, expected_pop_index);

        // Default parameter combination: FIFO_DEPTH=8, WINDOW_SIZE=16.
        @(negedge clk);
        default_rst_n = 1'b1;
        default_result_ready = 1'b1;
        for (index = -8; index < 8; index = index + 1)
            send_default_frame(index, index + 100, index - 100);
        wait (default_result_count == 1);

        $display("PASS: FIFO-to-window-feature integration matches expected results.");
        $display("      xyz_order=PASS backpressure=PASS fifo_full=PASS result_stall=PASS reset=PASS multiple_windows=PASS defaults_8_16=PASS");
        $finish;
    end

    initial begin
        #500000;
        $fatal(1, "Integration simulation timeout");
    end

endmodule
