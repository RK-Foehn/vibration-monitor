`timescale 1ns/1ps

module tb_lis3dh_vibration_pipeline;
    localparam integer FIFO_DEPTH = 8;
    localparam integer WINDOW_SIZE = 16;
    reg clk = 1'b0;
    always #10 clk = ~clk; // 50 MHz
    reg rst_n = 1'b0;
    reg lis3dh_miso = 1'b0;
    wire lis3dh_cs_n, lis3dh_sclk, lis3dh_mosi;
    wire signed [15:0] xyz_x, xyz_y, xyz_z;
    wire xyz_valid, sample_ready, sample_accepted, sample_drop;
    wire [31:0] sample_drop_count;
    wire sensor_overrun, init_done, init_error, spi_busy;
    wire [7:0] who_am_i_data;
    wire fifo_full, fifo_empty, fifo_overflow;
    wire [$clog2(FIFO_DEPTH+1)-1:0] fifo_level;
    wire fifo_frame_valid, fifo_frame_ready;
    wire signed [15:0] fifo_frame_x, fifo_frame_y, fifo_frame_z;
    wire result_valid;
    wire [15:0] result_peak;
    wire [34:0] result_sum_squares;
    wire [$clog2(WINDOW_SIZE+1)-1:0] result_sample_count;

    lis3dh_vibration_pipeline #(
        .FIFO_DEPTH(FIFO_DEPTH), .WINDOW_SIZE(WINDOW_SIZE),
        .POWER_UP_DELAY_CYCLES(4), .SETTLE_DELAY_CYCLES(8),
        .POLL_PERIOD_CYCLES(4), .SPI_HALF_PERIOD_CYCLES(1)
    ) dut (
        .clk(clk), .rst_n(rst_n), .lis3dh_cs_n(lis3dh_cs_n),
        .lis3dh_sclk(lis3dh_sclk), .lis3dh_mosi(lis3dh_mosi),
        .lis3dh_miso(lis3dh_miso), .xyz_x(xyz_x), .xyz_y(xyz_y),
        .xyz_z(xyz_z), .xyz_valid(xyz_valid),
        .sample_ready(sample_ready), .sample_accepted(sample_accepted),
        .sample_drop(sample_drop), .sample_drop_count(sample_drop_count),
        .sensor_overrun(sensor_overrun), .who_am_i_data(who_am_i_data),
        .init_done(init_done), .init_error(init_error), .spi_busy(spi_busy),
        .fifo_full(fifo_full), .fifo_empty(fifo_empty),
        .fifo_level(fifo_level), .fifo_overflow(fifo_overflow),
        .fifo_frame_valid(fifo_frame_valid),
        .fifo_frame_ready(fifo_frame_ready),
        .fifo_frame_x(fifo_frame_x), .fifo_frame_y(fifo_frame_y),
        .fifo_frame_z(fifo_frame_z), .result_valid(result_valid),
        .result_peak(result_peak), .result_sum_squares(result_sum_squares),
        .result_sample_count(result_sample_count)
    );

    integer trace_fd;
    integer accepted_count = 0;
    integer popped_count = 0;
    integer drop_events = 0;
    integer result_count = 0;
    integer burst_count = 0;
    integer status_count = 0;
    integer stage = 0;
    integer bit_count = 0;
    reg transaction_active = 1'b0;
    reg [7:0] command = 8'h00;
    reg [7:0] write_byte = 8'h00;
    reg [7:0] model_ctrl1 = 8'h07;
    reg [7:0] model_ctrl4 = 8'h00;
    reg [7:0] response = 8'h00;
    reg signed [15:0] accepted_x [0:1023];
    reg signed [15:0] accepted_y [0:1023];
    reg signed [15:0] accepted_z [0:1023];

    function automatic signed [15:0] sample_at(input integer index,
                                               input integer axis);
        begin
            case (axis)
                0: sample_at = ((index * 37) % 2048) - 1024;
                1: sample_at = ((index * 19) % 1024) - 512;
                default: sample_at = ((index * 23) % 2048) - 1024;
            endcase
        end
    endfunction

    function automatic [7:0] response_byte(input reg [7:0] cmd,
                                           input integer byte_index);
        reg signed [15:0] raw;
        begin
            response_byte = 8'h00;
            case (cmd)
                8'h8F: response_byte = 8'h33;
                // First STATUS after each reset models the legitimate FF case.
                8'hA7: response_byte = (status_count == 0) ? 8'hFF : 8'h08;
                8'hE8: begin
                    raw = sample_at(burst_count, byte_index / 2) <<< 4;
                    response_byte = (byte_index % 2 == 0) ? raw[7:0] : raw[15:8];
                end
                default: response_byte = 8'h00;
            endcase
        end
    endfunction

    // Sensor drives SDO after SCLK falling edges; FPGA samples on rising.
    always @(negedge lis3dh_cs_n) begin
        transaction_active = 1'b1;
        bit_count = 0;
        command = 8'h00;
        write_byte = 8'h00;
        lis3dh_miso = 1'b0;
    end
    always @(negedge lis3dh_sclk) begin
        if (transaction_active && !lis3dh_cs_n) begin
            if (bit_count >= 8 && command[7]) begin
                response = response_byte(command, (bit_count - 8) / 8);
                lis3dh_miso = response[7 - ((bit_count - 8) % 8)];
            end else lis3dh_miso = 1'b0;
        end
    end
    always @(posedge lis3dh_sclk) begin
        if (transaction_active && !lis3dh_cs_n) begin
            if (bit_count < 8) command = {command[6:0], lis3dh_mosi};
            else if (bit_count < 16)
                write_byte = {write_byte[6:0], lis3dh_mosi};
            bit_count = bit_count + 1;
        end
    end
    always @(posedge lis3dh_cs_n) begin
        if (transaction_active) begin
            transaction_active = 1'b0;
            case (stage)
                0: begin
                    if (command !== 8'h8F || bit_count != 16)
                        $fatal(1, "WHO transaction wrong");
                    stage = 1;
                end
                1: begin
                    if (command !== 8'h23 || write_byte !== 8'h88 || bit_count != 16)
                        $fatal(1, "CTRL_REG4 write wrong");
                    model_ctrl4 = write_byte;
                    stage = 2;
                end
                2: begin
                    if (command !== 8'h20 || write_byte !== 8'h57 || bit_count != 16)
                        $fatal(1, "CTRL_REG1 write wrong");
                    model_ctrl1 = write_byte;
                    stage = 3;
                end
                3: begin
                    if (command == 8'hA7 && bit_count == 16)
                        status_count = status_count + 1;
                    else if (command == 8'hE8 && bit_count == 56)
                        burst_count = burst_count + 1;
                    else $fatal(1, "unexpected SPI cmd=%h clocks=%0d", command, bit_count);
                end
                default: $fatal(1, "bad model stage");
            endcase
        end
    end
    always @(negedge rst_n) begin
        stage = 0;
        burst_count = 0;
        status_count = 0;
        model_ctrl1 = 8'h07;
        model_ctrl4 = 8'h00;
        transaction_active = 1'b0;
        lis3dh_miso = 1'b0;
    end

    // Scoreboard keys off *accepted* FIFO input, never raw xyz_valid alone.
    always @(posedge clk) begin
        if (!rst_n) begin
            accepted_count = 0;
            popped_count = 0;
            drop_events = 0;
            result_count = 0;
        end else begin
            if (sample_accepted !== (xyz_valid && sample_ready))
                $fatal(1, "sample_accepted handshake mismatch");
            if (xyz_valid) begin
                if (sample_ready) begin
                    if (accepted_count >= 1024) $fatal(1, "scoreboard full");
                    accepted_x[accepted_count] = xyz_x;
                    accepted_y[accepted_count] = xyz_y;
                    accepted_z[accepted_count] = xyz_z;
                    $fwrite(trace_fd, "A,%0d,%0d,%0d\n", xyz_x, xyz_y, xyz_z);
                    accepted_count = accepted_count + 1;
                end else begin
                    drop_events = drop_events + 1;
                    $fwrite(trace_fd, "D,%0d,%0d,%0d\n", xyz_x, xyz_y, xyz_z);
                end
            end
            if (fifo_frame_valid && fifo_frame_ready) begin
                if (popped_count >= accepted_count ||
                    fifo_frame_x !== accepted_x[popped_count] ||
                    fifo_frame_y !== accepted_y[popped_count] ||
                    fifo_frame_z !== accepted_z[popped_count])
                    $fatal(1, "FIFO reordered/duplicated/missed frame %0d", popped_count);
                popped_count = popped_count + 1;
            end
            if (result_valid) begin
                if (result_sample_count !== WINDOW_SIZE)
                    $fatal(1, "wrong result sample count");
                $fwrite(trace_fd, "R,%0d,%0d,%0d\n",
                        result_peak, result_sum_squares, result_sample_count);
                result_count = result_count + 1;
            end
            if (init_error) $fatal(1, "unexpected acquisition error");
        end
    end

    initial begin
        #2_000_000;
        $fatal(1, "integration simulation timeout");
    end
    initial begin
        trace_fd = $fopen("lis3dh_pipeline_trace.csv", "w");
        if (!trace_fd) $fatal(1, "cannot open trace");
        $fwrite(trace_fd, "RESET\n");
        repeat (5) @(negedge clk);
        rst_n = 1'b1;
        wait (init_done);
        if (who_am_i_data !== 8'h33 || model_ctrl1 !== 8'h57 ||
            model_ctrl4 !== 8'h88 || init_error)
            $fatal(1, "initialization failed");

        // Deliberate downstream stall: fill the 8-frame FIFO and lose pulses.
        force dut.processing.fifo_frame_ready = 1'b0;
        wait (drop_events >= 3);
        @(negedge clk);
        if (!fifo_full || fifo_level != FIFO_DEPTH || !fifo_overflow ||
            sample_drop_count != drop_events || !sensor_overrun)
            $fatal(1, "full FIFO / drop / sensor overrun accounting wrong");
        $display("PASS: FIFO full=%0d, accepted=%0d, dropped=%0d",
                 fifo_level, accepted_count, drop_events);
        release dut.processing.fifo_frame_ready;

        wait (result_count >= 2 && accepted_count >= 37);
        @(negedge clk);
        if (sample_drop_count != drop_events || popped_count > accepted_count)
            $fatal(1, "pre-reset counters wrong");
        $display("PASS: two 16-point windows after backpressure");

        // Reset during a partially filled subsequent window.
        rst_n = 1'b0;
        $fwrite(trace_fd, "RESET\n");
        repeat (4) @(negedge clk);
        if (fifo_level != 0 || result_valid || sample_drop_count != 0 ||
            sensor_overrun || init_done || init_error)
            $fatal(1, "reset did not clear pipeline/sensor state");
        $display("PASS: reset clears FIFO, partial window and diagnostics");
        rst_n = 1'b1;
        wait (init_done);
        wait (result_count >= 2);
        @(negedge clk);
        if (who_am_i_data !== 8'h33 || init_error || sample_drop_count != 0 ||
            accepted_count < 32 || popped_count < 32)
            $fatal(1, "post-reset continuous collection failed");
        $display("PASS: post-reset continuous XYZ and two additional windows");
        $fclose(trace_fd);
        $display("PASS: lis3dh_vibration_pipeline SPI/FIFO/window integration");
        $finish;
    end
endmodule
