`timescale 1ns/1ps

module tb_lis3dh_xyz_acquisition;
    reg clk = 1'b0;
    always #10 clk = ~clk; // 50 MHz

    reg rst_n = 1'b0;
    reg xyz_ready = 1'b0;
    wire signed [15:0] xyz_x, xyz_y, xyz_z;
    wire xyz_valid, sample_drop;
    wire [31:0] sample_drop_count;
    wire sensor_overrun;
    wire [7:0] who_am_i_data;
    wire init_done, error, spi_busy;
    wire lis3dh_cs_n, lis3dh_sclk, lis3dh_mosi;
    reg lis3dh_miso = 1'b0;

    lis3dh_xyz_acquisition #(
        .POWER_UP_DELAY_CYCLES(6),
        .SETTLE_DELAY_CYCLES(20),
        .POLL_PERIOD_CYCLES(18),
        .SPI_HALF_PERIOD_CYCLES(2)
    ) dut (
        .clk(clk), .rst_n(rst_n), .xyz_ready(xyz_ready),
        .xyz_x(xyz_x), .xyz_y(xyz_y), .xyz_z(xyz_z),
        .xyz_valid(xyz_valid), .sample_drop(sample_drop),
        .sample_drop_count(sample_drop_count),
        .sensor_overrun(sensor_overrun),
        .who_am_i_data(who_am_i_data), .init_done(init_done),
        .error(error), .spi_busy(spi_busy),
        .lis3dh_cs_n(lis3dh_cs_n), .lis3dh_sclk(lis3dh_sclk),
        .lis3dh_mosi(lis3dh_mosi), .lis3dh_miso(lis3dh_miso)
    );

    reg [7:0] model_who = 8'h33;
    // Drive exact STATUS_REG bytes, including the valid all-ones case.
    reg [7:0] model_status = 8'h00;
    reg [7:0] model_ctrl1 = 8'h07;
    reg [7:0] model_ctrl4 = 8'h00;
    reg [7:0] command = 8'h00;
    reg [7:0] write_byte = 8'h00;
    reg [7:0] selected_response = 8'h00;
    reg transaction_active = 1'b0;
    integer bit_count = 0;
    integer sequence_stage = 0;
    integer burst_count = 0;
    integer status_count = 0;
    integer xyz_seen = 0;
    integer last_burst_cycle = 0;
    integer cycle_count = 0;
    reg previous_xyz_valid = 1'b0;
    reg previous_sample_drop = 1'b0;

    function automatic signed [15:0] sample_at(input integer index, input integer axis);
        begin
            case (index)
                0: case (axis)
                    0: sample_at = -16'sd1;
                    1: sample_at = 16'sd5;
                    default: sample_at = -16'sd2048;
                endcase
                1: case (axis)
                    0: sample_at = 16'sd123;
                    1: sample_at = -16'sd456;
                    default: sample_at = 16'sd2047;
                endcase
                2: case (axis)
                    0: sample_at = 16'sd0;
                    1: sample_at = -16'sd17;
                    default: sample_at = 16'sd18;
                endcase
                3: case (axis)
                    0: sample_at = 16'sd42;
                    1: sample_at = -16'sd8;
                    default: sample_at = 16'sd7;
                endcase
                default: sample_at = 16'sd0;
            endcase
        end
    endfunction

    function automatic [7:0] response_byte(input reg [7:0] cmd,
                                            input integer byte_index);
        reg signed [15:0] raw;
        begin
            response_byte = 8'h00;
            case (cmd)
                8'h8F: response_byte = model_who;
                8'hA7: response_byte = model_status;
                8'hE8: begin
                    raw = sample_at(burst_count, byte_index / 2) <<< 4;
                    response_byte = (byte_index % 2 == 0) ? raw[7:0] : raw[15:8];
                end
                default: response_byte = 8'h00;
            endcase
        end
    endfunction

    // Sensor drives SDO on falling SCLK edges; master samples on rising edges.
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
                selected_response = response_byte(command, (bit_count - 8) / 8);
                lis3dh_miso = selected_response[7 - ((bit_count - 8) % 8)];
            end else lis3dh_miso = 1'b0;
        end
    end

    always @(posedge lis3dh_sclk) begin
        if (transaction_active && !lis3dh_cs_n) begin
            if (bit_count < 8)
                command = {command[6:0], lis3dh_mosi};
            else if (bit_count < 16)
                write_byte = {write_byte[6:0], lis3dh_mosi};
            bit_count = bit_count + 1;
        end
    end

    always @(posedge lis3dh_cs_n) begin
        if (transaction_active) begin
            transaction_active = 1'b0;
            case (sequence_stage)
                0: begin
                    if (command !== 8'h8F || bit_count != 16)
                        $fatal(1, "WHO transaction: cmd=%h clocks=%0d", command, bit_count);
                    sequence_stage = 1;
                end
                1: begin
                    if (command !== 8'h23 || bit_count != 16 || write_byte !== 8'h88)
                        $fatal(1, "CTRL_REG4 write: cmd=%h data=%h clocks=%0d",
                               command, write_byte, bit_count);
                    model_ctrl4 = write_byte;
                    sequence_stage = 2;
                end
                2: begin
                    if (command !== 8'h20 || bit_count != 16 || write_byte !== 8'h57)
                        $fatal(1, "CTRL_REG1 write: cmd=%h data=%h clocks=%0d",
                               command, write_byte, bit_count);
                    model_ctrl1 = write_byte;
                    sequence_stage = 3;
                end
                3: begin
                    if (command == 8'hA7 && bit_count == 16)
                        status_count = status_count + 1;
                    else if (command == 8'hE8 && bit_count == 56) begin
                        if (!model_status[3])
                            $fatal(1, "burst without fresh sensor sample");
                        if (burst_count > 0 && cycle_count <= last_burst_cycle + 18)
                            $fatal(1, "bursts were not periodic");
                        last_burst_cycle = cycle_count;
                        burst_count = burst_count + 1;
                    end else
                        $fatal(1, "unexpected transaction: cmd=%h clocks=%0d", command, bit_count);
                end
                default: $fatal(1, "invalid model sequence stage");
            endcase
        end
    end

    always @(negedge rst_n) begin
        sequence_stage = 0;
        model_ctrl1 = 8'h07;
        model_ctrl4 = 8'h00;
        model_status = 8'h00;
        transaction_active = 1'b0;
        lis3dh_miso = 1'b0;
    end

    always @(posedge clk) begin
        cycle_count = cycle_count + 1;
        if (!rst_n) begin
            previous_xyz_valid = 1'b0;
            previous_sample_drop = 1'b0;
        end else begin
            if (xyz_valid && previous_xyz_valid)
                $fatal(1, "xyz_valid remained asserted for more than one clock");
            if (sample_drop && previous_sample_drop)
                $fatal(1, "sample_drop remained asserted for more than one clock");
            previous_xyz_valid = xyz_valid;
            previous_sample_drop = sample_drop;
        end
        if (rst_n && xyz_valid) begin
            case (xyz_seen)
                0: if (xyz_x !== -16'sd1 || xyz_y !== 16'sd5 ||
                       xyz_z !== -16'sd2048)
                       $fatal(1, "sample 0 mismatch: %0d %0d %0d", xyz_x, xyz_y, xyz_z);
                1: if (xyz_x !== 16'sd123 || xyz_y !== -16'sd456 ||
                       xyz_z !== 16'sd2047)
                       $fatal(1, "sample 1 mismatch: %0d %0d %0d", xyz_x, xyz_y, xyz_z);
                2: if (xyz_x !== 16'sd0 || xyz_y !== -16'sd17 ||
                       xyz_z !== 16'sd18)
                       $fatal(1, "sample 2 mismatch: %0d %0d %0d", xyz_x, xyz_y, xyz_z);
                3: if (xyz_x !== 16'sd42 || xyz_y !== -16'sd8 ||
                       xyz_z !== 16'sd7)
                       $fatal(1, "sample 3 mismatch: %0d %0d %0d", xyz_x, xyz_y, xyz_z);
                default: $fatal(1, "unexpected extra xyz_valid pulse");
            endcase
            xyz_seen = xyz_seen + 1;
        end
    end

    initial begin
        #1_000_000;
        $fatal(1, "FAIL: LIS3DH XYZ simulation timeout");
    end

    initial begin
        repeat (5) @(negedge clk);
        rst_n = 1'b1;
        wait (init_done);
        if (who_am_i_data !== 8'h33 || model_ctrl4 !== 8'h88 ||
            model_ctrl1 !== 8'h57 || error)
            $fatal(1, "initialization mismatch");

        wait (status_count >= 2); // no fresh data: must keep polling
        if (xyz_seen != 0 || error || sensor_overrun)
            $fatal(1, "STATUS=00: unexpected sample/error/overrun");
        $display("PASS: STATUS=00 keeps polling without XYZ or error");
        model_status = 8'h08; // ZYXDA=1, no overrun
        wait (xyz_seen == 1);
        model_status = 8'h00;
        repeat (2) @(negedge clk);
        if (sample_drop_count !== 32'd1 || sensor_overrun || error)
            $fatal(1, "STATUS=08: drop/overrun/error mismatch");
        $display("PASS: STATUS=08 reads XYZ without overrun");

        xyz_ready = 1'b1;
        model_status = 8'h88; // ZYXOR=1 and ZYXDA=1
        wait (xyz_seen == 2);
        model_status = 8'h00;
        repeat (2) @(negedge clk);
        if (sample_drop_count !== 32'd1 || !sensor_overrun || error)
            $fatal(1, "STATUS=88: overrun/drop/error mismatch");
        $display("PASS: STATUS=88 reads XYZ and latches overrun");

        model_status = 8'hFF; // All bits are defined; must still read XYZ.
        wait (xyz_seen == 3);
        model_status = 8'h00;
        repeat (2) @(negedge clk);
        if (burst_count != 3 || !sensor_overrun || error)
            $fatal(1, "STATUS=FF incorrectly blocked XYZ or raised error");
        $display("PASS: STATUS=FF reads XYZ without entering FATAL");

        model_status = 8'h08;
        wait (xyz_seen == 4);
        model_status = 8'h00;
        repeat (2) @(negedge clk);
        if (burst_count != 4 || status_count < 6 || error)
            $fatal(1, "continuous sampling after STATUS=FF failed");
        $display("PASS: continuous XYZ sampling resumes after STATUS=FF");

        // A wrong WHO_AM_I response must block all configuration writes.
        model_who = 8'h00;
        rst_n = 1'b0;
        repeat (3) @(negedge clk);
        if (init_done || xyz_valid || sample_drop_count != 0 || sensor_overrun)
            $fatal(1, "reset did not clear acquisition state");
        rst_n = 1'b1;
        wait (error);
        if (who_am_i_data !== 8'h00 || init_done || sequence_stage != 1)
            $fatal(1, "bad WHO_AM_I was not rejected");
        repeat (100) @(negedge clk);
        if (sequence_stage != 1 || burst_count != 4)
            $fatal(1, "transactions continued after fatal error");
        $display("PASS: wrong WHO_AM_I enters FATAL and blocks configuration");

        // A subsequent PL reset must allow a fresh successful bring-up.
        model_who = 8'h33;
        rst_n = 1'b0;
        repeat (3) @(negedge clk);
        rst_n = 1'b1;
        wait (init_done);
        if (error || who_am_i_data !== 8'h33 || sequence_stage != 3)
            $fatal(1, "recovery after reset failed");
        $display("PASS: reset clears error and allows successful re-initialization");

        $display("PASS: WHO=33, CTRL4=88, CTRL1=57, STATUS=00/08/88/FF, E8/56-clock XYZ bursts");
        $display("PASS: 4 signed XYZ samples, STATUS=FF continues, one-cycle valid, drop count, overrun, reset, bad WHO recovery");
        $finish;
    end
endmodule
