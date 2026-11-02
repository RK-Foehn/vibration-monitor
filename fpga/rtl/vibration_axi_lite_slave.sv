`timescale 1ns/1ps

// AXI4-Lite register bridge for axi_register_map_v1.md.
// All result and diagnostic inputs MUST be synchronous to s_axi_aclk.
// One write response and one read response may be outstanding independently.
module vibration_axi_lite_slave (
    input  wire        s_axi_aclk,
    input  wire        s_axi_aresetn,
    input  wire [11:0] s_axi_awaddr,
    input  wire [2:0]  s_axi_awprot,
    input  wire        s_axi_awvalid,
    output wire        s_axi_awready,
    input  wire [31:0] s_axi_wdata,
    input  wire [3:0]  s_axi_wstrb,
    input  wire        s_axi_wvalid,
    output wire        s_axi_wready,
    output reg  [1:0]  s_axi_bresp,
    output reg         s_axi_bvalid,
    input  wire        s_axi_bready,
    input  wire [11:0] s_axi_araddr,
    input  wire [2:0]  s_axi_arprot,
    input  wire        s_axi_arvalid,
    output wire        s_axi_arready,
    output reg  [31:0] s_axi_rdata,
    output reg  [1:0]  s_axi_rresp,
    output reg         s_axi_rvalid,
    input  wire        s_axi_rready,

    input  wire        result_valid,
    output wire        result_ready,
    input  wire [15:0] result_peak,
    input  wire [34:0] result_sum_squares,
    input  wire [4:0]  result_sample_count,
    input  wire        init_done,
    input  wire        init_error,
    input  wire        sensor_overrun,
    input  wire        fifo_overflow,
    input  wire [31:0] sample_drop_count
);
    localparam [1:0] RESP_OKAY   = 2'b00;
    localparam [1:0] RESP_SLVERR = 2'b10;
    localparam [11:0] REG_DEVICE_ID    = 12'h000;
    localparam [11:0] REG_VERSION      = 12'h004;
    localparam [11:0] REG_CONTROL      = 12'h008;
    localparam [11:0] REG_RESULT_SEQ   = 12'h00c;
    localparam [11:0] REG_PEAK         = 12'h010;
    localparam [11:0] REG_SUMSQ_LO     = 12'h014;
    localparam [11:0] REG_SUMSQ_HI     = 12'h018;
    localparam [11:0] REG_SAMPLE_COUNT = 12'h01c;
    localparam [11:0] REG_STATUS       = 12'h020;
    localparam [11:0] REG_DROP_COUNT   = 12'h024;

    reg [31:0] snapshot_seq;
    reg [15:0] snapshot_peak;
    reg [63:0] snapshot_sumsq;
    reg [4:0]  snapshot_count;
    reg        result_available;

    // This v1 bridge never stalls a completed result. One accepted result
    // overwrites the previous snapshot; RESULT_SEQ lets PS detect races.
    assign result_ready = s_axi_aresetn;

    reg       aw_pending;
    reg       w_pending;
    reg [11:0] aw_addr_hold;
    wire aw_fire = s_axi_awvalid && s_axi_awready;
    wire w_fire  = s_axi_wvalid && s_axi_wready;
    wire [11:0] write_addr = aw_pending ? aw_addr_hold : s_axi_awaddr;
    wire write_commit = !s_axi_bvalid &&
                        (aw_pending || aw_fire) && (w_pending || w_fire);

    // AW and W may arrive in either order. WDATA/WSTRB are accepted but
    // intentionally discarded: CONTROL is reserved; every other write errs.
    assign s_axi_awready = s_axi_aresetn && !aw_pending && !s_axi_bvalid;
    assign s_axi_wready  = s_axi_aresetn && !w_pending  && !s_axi_bvalid;
    assign s_axi_arready = s_axi_aresetn && !s_axi_rvalid;

    // PROT is ignored; WDATA/WSTRB have no side effects in v1.

    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            snapshot_seq     <= 32'd0;
            snapshot_peak    <= 16'd0;
            snapshot_sumsq   <= 64'd0;
            snapshot_count   <= 5'd0;
            result_available <= 1'b0;
            aw_pending       <= 1'b0;
            w_pending        <= 1'b0;
            aw_addr_hold     <= 12'd0;
            s_axi_bresp      <= RESP_OKAY;
            s_axi_bvalid     <= 1'b0;
            s_axi_rdata      <= 32'd0;
            s_axi_rresp      <= RESP_OKAY;
            s_axi_rvalid     <= 1'b0;
        end else begin
            if (result_valid && result_ready) begin
                snapshot_peak    <= result_peak;
                snapshot_sumsq   <= {29'd0, result_sum_squares};
                snapshot_count   <= result_sample_count;
                snapshot_seq     <= snapshot_seq + 1'b1;
                result_available <= 1'b1;
            end

            if (aw_fire) begin
                aw_pending   <= 1'b1;
                aw_addr_hold <= s_axi_awaddr;
            end
            if (w_fire)
                w_pending <= 1'b1;
            if (write_commit) begin
                aw_pending   <= 1'b0;
                w_pending    <= 1'b0;
                s_axi_bvalid <= 1'b1;
                s_axi_bresp  <= (write_addr == REG_CONTROL)
                              ? RESP_OKAY : RESP_SLVERR;
            end else if (s_axi_bvalid && s_axi_bready) begin
                s_axi_bvalid <= 1'b0;
            end

            if (s_axi_arvalid && s_axi_arready) begin
                s_axi_rvalid <= 1'b1;
                s_axi_rresp  <= RESP_OKAY;
                // Full byte address decode also rejects misaligned accesses.
                case (s_axi_araddr)
                    REG_DEVICE_ID:    s_axi_rdata <= 32'h5649_4231;
                    REG_VERSION:      s_axi_rdata <= 32'h0001_0000;
                    REG_CONTROL:      s_axi_rdata <= 32'd0;
                    REG_RESULT_SEQ:   s_axi_rdata <= snapshot_seq;
                    REG_PEAK:         s_axi_rdata <= {16'd0, snapshot_peak};
                    REG_SUMSQ_LO:     s_axi_rdata <= snapshot_sumsq[31:0];
                    REG_SUMSQ_HI:     s_axi_rdata <= snapshot_sumsq[63:32];
                    REG_SAMPLE_COUNT: s_axi_rdata <= {27'd0, snapshot_count};
                    REG_STATUS:       s_axi_rdata <= {27'd0, result_available,
                                                      fifo_overflow,
                                                      sensor_overrun,
                                                      init_error, init_done};
                    REG_DROP_COUNT:   s_axi_rdata <= sample_drop_count;
                    default: begin
                        s_axi_rdata <= 32'd0;
                        s_axi_rresp <= RESP_SLVERR;
                    end
                endcase
            end else if (s_axi_rvalid && s_axi_rready) begin
                s_axi_rvalid <= 1'b0;
            end
        end
    end
endmodule
