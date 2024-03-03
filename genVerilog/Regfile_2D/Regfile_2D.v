module Reg_2D(
  input         clock,
  input         reset,
  input         io_wen,
  input  [2:0]  io_wr_offset,
  input         io_valid_in,
  input  [63:0] io_data_in,
  input  [2:0]  io_rd_offset,
  output        io_valid_out,
  output [63:0] io_data_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] data2d_0; // @[2D_Regfile.scala 72:25]
  reg [63:0] data2d_1; // @[2D_Regfile.scala 72:25]
  wire  _flag2d_T = ~io_wen; // @[2D_Regfile.scala 78:46]
  assign io_valid_out = io_valid_in & _flag2d_T; // @[2D_Regfile.scala 79:33]
  assign io_data_out = io_rd_offset[0] ? data2d_1 : data2d_0; // @[2D_Regfile.scala 80:{17,17}]
  always @(posedge clock) begin
    if (reset) begin // @[2D_Regfile.scala 72:25]
      data2d_0 <= 64'h0; // @[2D_Regfile.scala 72:25]
    end else if (io_valid_in & io_wen) begin // @[2D_Regfile.scala 74:34]
      if (~io_wr_offset[0]) begin // @[2D_Regfile.scala 75:28]
        data2d_0 <= io_data_in; // @[2D_Regfile.scala 75:28]
      end
    end
    if (reset) begin // @[2D_Regfile.scala 72:25]
      data2d_1 <= 64'h0; // @[2D_Regfile.scala 72:25]
    end else if (io_valid_in & io_wen) begin // @[2D_Regfile.scala 74:34]
      if (io_wr_offset[0]) begin // @[2D_Regfile.scala 75:28]
        data2d_1 <= io_data_in; // @[2D_Regfile.scala 75:28]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  data2d_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  data2d_1 = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Regfile_2D(
  input         clock,
  input         reset,
  input  [63:0] io_wr_0_data,
  input  [4:0]  io_wr_0_addr,
  input  [2:0]  io_wr_0_offset,
  input         io_wr_0_wen,
  input  [63:0] io_wr_1_data,
  input  [4:0]  io_wr_1_addr,
  input  [2:0]  io_wr_1_offset,
  input         io_wr_1_wen,
  input  [4:0]  io_rd_addr,
  input  [2:0]  io_rd_offset,
  input         io_rd_ren,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits_data
);
  wire  Reg_2D_clock; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_reset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_io_wen; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_io_wr_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_io_valid_in; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_io_data_in; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_io_rd_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_io_valid_out; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_io_data_out; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_1_clock; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_1_reset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_1_io_wen; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_1_io_wr_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_1_io_valid_in; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_1_io_data_in; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_1_io_rd_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_1_io_valid_out; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_1_io_data_out; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_2_clock; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_2_reset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_2_io_wen; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_2_io_wr_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_2_io_valid_in; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_2_io_data_in; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_2_io_rd_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_2_io_valid_out; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_2_io_data_out; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_3_clock; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_3_reset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_3_io_wen; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_3_io_wr_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_3_io_valid_in; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_3_io_data_in; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_3_io_rd_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_3_io_valid_out; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_3_io_data_out; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_4_clock; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_4_reset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_4_io_wen; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_4_io_wr_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_4_io_valid_in; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_4_io_data_in; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_4_io_rd_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_4_io_valid_out; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_4_io_data_out; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_5_clock; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_5_reset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_5_io_wen; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_5_io_wr_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_5_io_valid_in; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_5_io_data_in; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_5_io_rd_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_5_io_valid_out; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_5_io_data_out; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_6_clock; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_6_reset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_6_io_wen; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_6_io_wr_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_6_io_valid_in; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_6_io_data_in; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_6_io_rd_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_6_io_valid_out; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_6_io_data_out; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_7_clock; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_7_reset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_7_io_wen; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_7_io_wr_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_7_io_valid_in; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_7_io_data_in; // @[2D_Regfile.scala 33:54]
  wire [2:0] Reg_2D_7_io_rd_offset; // @[2D_Regfile.scala 33:54]
  wire  Reg_2D_7_io_valid_out; // @[2D_Regfile.scala 33:54]
  wire [63:0] Reg_2D_7_io_data_out; // @[2D_Regfile.scala 33:54]
  wire  _GEN_0 = 3'h0 == io_wr_0_addr[2:0] & io_wr_0_wen; // @[2D_Regfile.scala 36:22 43:{32,32}]
  wire  _GEN_1 = 3'h1 == io_wr_0_addr[2:0] & io_wr_0_wen; // @[2D_Regfile.scala 36:22 43:{32,32}]
  wire  _GEN_2 = 3'h2 == io_wr_0_addr[2:0] & io_wr_0_wen; // @[2D_Regfile.scala 36:22 43:{32,32}]
  wire  _GEN_3 = 3'h3 == io_wr_0_addr[2:0] & io_wr_0_wen; // @[2D_Regfile.scala 36:22 43:{32,32}]
  wire  _GEN_4 = 3'h4 == io_wr_0_addr[2:0] & io_wr_0_wen; // @[2D_Regfile.scala 36:22 43:{32,32}]
  wire  _GEN_5 = 3'h5 == io_wr_0_addr[2:0] & io_wr_0_wen; // @[2D_Regfile.scala 36:22 43:{32,32}]
  wire  _GEN_6 = 3'h6 == io_wr_0_addr[2:0] & io_wr_0_wen; // @[2D_Regfile.scala 36:22 43:{32,32}]
  wire  _GEN_7 = 3'h7 == io_wr_0_addr[2:0] & io_wr_0_wen; // @[2D_Regfile.scala 36:22 43:{32,32}]
  wire [2:0] _GEN_16 = 3'h0 == io_wr_0_addr[2:0] ? io_wr_0_offset : 3'h0; // @[2D_Regfile.scala 38:28 45:{38,38}]
  wire [2:0] _GEN_17 = 3'h1 == io_wr_0_addr[2:0] ? io_wr_0_offset : 3'h0; // @[2D_Regfile.scala 38:28 45:{38,38}]
  wire [2:0] _GEN_18 = 3'h2 == io_wr_0_addr[2:0] ? io_wr_0_offset : 3'h0; // @[2D_Regfile.scala 38:28 45:{38,38}]
  wire [2:0] _GEN_19 = 3'h3 == io_wr_0_addr[2:0] ? io_wr_0_offset : 3'h0; // @[2D_Regfile.scala 38:28 45:{38,38}]
  wire [2:0] _GEN_20 = 3'h4 == io_wr_0_addr[2:0] ? io_wr_0_offset : 3'h0; // @[2D_Regfile.scala 38:28 45:{38,38}]
  wire [2:0] _GEN_21 = 3'h5 == io_wr_0_addr[2:0] ? io_wr_0_offset : 3'h0; // @[2D_Regfile.scala 38:28 45:{38,38}]
  wire [2:0] _GEN_22 = 3'h6 == io_wr_0_addr[2:0] ? io_wr_0_offset : 3'h0; // @[2D_Regfile.scala 38:28 45:{38,38}]
  wire [2:0] _GEN_23 = 3'h7 == io_wr_0_addr[2:0] ? io_wr_0_offset : 3'h0; // @[2D_Regfile.scala 38:28 45:{38,38}]
  wire [63:0] _GEN_24 = 3'h0 == io_wr_0_addr[2:0] ? io_wr_0_data : 64'h0; // @[2D_Regfile.scala 40:26 46:{36,36}]
  wire [63:0] _GEN_25 = 3'h1 == io_wr_0_addr[2:0] ? io_wr_0_data : 64'h0; // @[2D_Regfile.scala 40:26 46:{36,36}]
  wire [63:0] _GEN_26 = 3'h2 == io_wr_0_addr[2:0] ? io_wr_0_data : 64'h0; // @[2D_Regfile.scala 40:26 46:{36,36}]
  wire [63:0] _GEN_27 = 3'h3 == io_wr_0_addr[2:0] ? io_wr_0_data : 64'h0; // @[2D_Regfile.scala 40:26 46:{36,36}]
  wire [63:0] _GEN_28 = 3'h4 == io_wr_0_addr[2:0] ? io_wr_0_data : 64'h0; // @[2D_Regfile.scala 40:26 46:{36,36}]
  wire [63:0] _GEN_29 = 3'h5 == io_wr_0_addr[2:0] ? io_wr_0_data : 64'h0; // @[2D_Regfile.scala 40:26 46:{36,36}]
  wire [63:0] _GEN_30 = 3'h6 == io_wr_0_addr[2:0] ? io_wr_0_data : 64'h0; // @[2D_Regfile.scala 40:26 46:{36,36}]
  wire [63:0] _GEN_31 = 3'h7 == io_wr_0_addr[2:0] ? io_wr_0_data : 64'h0; // @[2D_Regfile.scala 40:26 46:{36,36}]
  wire  regfile2d_0_wen = 3'h0 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_0; // @[2D_Regfile.scala 48:{32,32}]
  wire  regfile2d_1_wen = 3'h1 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_1; // @[2D_Regfile.scala 48:{32,32}]
  wire  regfile2d_2_wen = 3'h2 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_2; // @[2D_Regfile.scala 48:{32,32}]
  wire  regfile2d_3_wen = 3'h3 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_3; // @[2D_Regfile.scala 48:{32,32}]
  wire  regfile2d_4_wen = 3'h4 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_4; // @[2D_Regfile.scala 48:{32,32}]
  wire  regfile2d_5_wen = 3'h5 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_5; // @[2D_Regfile.scala 48:{32,32}]
  wire  regfile2d_6_wen = 3'h6 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_6; // @[2D_Regfile.scala 48:{32,32}]
  wire  regfile2d_7_wen = 3'h7 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_7; // @[2D_Regfile.scala 48:{32,32}]
  wire  regfile2d_0_valid_out = Reg_2D_io_valid_out; // @[2D_Regfile.scala 33:{26,26}]
  wire  regfile2d_1_valid_out = Reg_2D_1_io_valid_out; // @[2D_Regfile.scala 33:{26,26}]
  wire  _GEN_81 = 3'h1 == io_rd_addr[2:0] ? regfile2d_1_valid_out : regfile2d_0_valid_out; // @[2D_Regfile.scala 55:{16,16}]
  wire  regfile2d_2_valid_out = Reg_2D_2_io_valid_out; // @[2D_Regfile.scala 33:{26,26}]
  wire  _GEN_82 = 3'h2 == io_rd_addr[2:0] ? regfile2d_2_valid_out : _GEN_81; // @[2D_Regfile.scala 55:{16,16}]
  wire  regfile2d_3_valid_out = Reg_2D_3_io_valid_out; // @[2D_Regfile.scala 33:{26,26}]
  wire  _GEN_83 = 3'h3 == io_rd_addr[2:0] ? regfile2d_3_valid_out : _GEN_82; // @[2D_Regfile.scala 55:{16,16}]
  wire  regfile2d_4_valid_out = Reg_2D_4_io_valid_out; // @[2D_Regfile.scala 33:{26,26}]
  wire  _GEN_84 = 3'h4 == io_rd_addr[2:0] ? regfile2d_4_valid_out : _GEN_83; // @[2D_Regfile.scala 55:{16,16}]
  wire  regfile2d_5_valid_out = Reg_2D_5_io_valid_out; // @[2D_Regfile.scala 33:{26,26}]
  wire  _GEN_85 = 3'h5 == io_rd_addr[2:0] ? regfile2d_5_valid_out : _GEN_84; // @[2D_Regfile.scala 55:{16,16}]
  wire  regfile2d_6_valid_out = Reg_2D_6_io_valid_out; // @[2D_Regfile.scala 33:{26,26}]
  wire  _GEN_86 = 3'h6 == io_rd_addr[2:0] ? regfile2d_6_valid_out : _GEN_85; // @[2D_Regfile.scala 55:{16,16}]
  wire  regfile2d_7_valid_out = Reg_2D_7_io_valid_out; // @[2D_Regfile.scala 33:{26,26}]
  wire [63:0] regfile2d_0_data_out = Reg_2D_io_data_out; // @[2D_Regfile.scala 33:{26,26}]
  wire [63:0] regfile2d_1_data_out = Reg_2D_1_io_data_out; // @[2D_Regfile.scala 33:{26,26}]
  wire [63:0] _GEN_89 = 3'h1 == io_rd_addr[2:0] ? regfile2d_1_data_out : regfile2d_0_data_out; // @[2D_Regfile.scala 56:{20,20}]
  wire [63:0] regfile2d_2_data_out = Reg_2D_2_io_data_out; // @[2D_Regfile.scala 33:{26,26}]
  wire [63:0] _GEN_90 = 3'h2 == io_rd_addr[2:0] ? regfile2d_2_data_out : _GEN_89; // @[2D_Regfile.scala 56:{20,20}]
  wire [63:0] regfile2d_3_data_out = Reg_2D_3_io_data_out; // @[2D_Regfile.scala 33:{26,26}]
  wire [63:0] _GEN_91 = 3'h3 == io_rd_addr[2:0] ? regfile2d_3_data_out : _GEN_90; // @[2D_Regfile.scala 56:{20,20}]
  wire [63:0] regfile2d_4_data_out = Reg_2D_4_io_data_out; // @[2D_Regfile.scala 33:{26,26}]
  wire [63:0] _GEN_92 = 3'h4 == io_rd_addr[2:0] ? regfile2d_4_data_out : _GEN_91; // @[2D_Regfile.scala 56:{20,20}]
  wire [63:0] regfile2d_5_data_out = Reg_2D_5_io_data_out; // @[2D_Regfile.scala 33:{26,26}]
  wire [63:0] _GEN_93 = 3'h5 == io_rd_addr[2:0] ? regfile2d_5_data_out : _GEN_92; // @[2D_Regfile.scala 56:{20,20}]
  wire [63:0] regfile2d_6_data_out = Reg_2D_6_io_data_out; // @[2D_Regfile.scala 33:{26,26}]
  wire [63:0] _GEN_94 = 3'h6 == io_rd_addr[2:0] ? regfile2d_6_data_out : _GEN_93; // @[2D_Regfile.scala 56:{20,20}]
  wire [63:0] regfile2d_7_data_out = Reg_2D_7_io_data_out; // @[2D_Regfile.scala 33:{26,26}]
  Reg_2D Reg_2D ( // @[2D_Regfile.scala 33:54]
    .clock(Reg_2D_clock),
    .reset(Reg_2D_reset),
    .io_wen(Reg_2D_io_wen),
    .io_wr_offset(Reg_2D_io_wr_offset),
    .io_valid_in(Reg_2D_io_valid_in),
    .io_data_in(Reg_2D_io_data_in),
    .io_rd_offset(Reg_2D_io_rd_offset),
    .io_valid_out(Reg_2D_io_valid_out),
    .io_data_out(Reg_2D_io_data_out)
  );
  Reg_2D Reg_2D_1 ( // @[2D_Regfile.scala 33:54]
    .clock(Reg_2D_1_clock),
    .reset(Reg_2D_1_reset),
    .io_wen(Reg_2D_1_io_wen),
    .io_wr_offset(Reg_2D_1_io_wr_offset),
    .io_valid_in(Reg_2D_1_io_valid_in),
    .io_data_in(Reg_2D_1_io_data_in),
    .io_rd_offset(Reg_2D_1_io_rd_offset),
    .io_valid_out(Reg_2D_1_io_valid_out),
    .io_data_out(Reg_2D_1_io_data_out)
  );
  Reg_2D Reg_2D_2 ( // @[2D_Regfile.scala 33:54]
    .clock(Reg_2D_2_clock),
    .reset(Reg_2D_2_reset),
    .io_wen(Reg_2D_2_io_wen),
    .io_wr_offset(Reg_2D_2_io_wr_offset),
    .io_valid_in(Reg_2D_2_io_valid_in),
    .io_data_in(Reg_2D_2_io_data_in),
    .io_rd_offset(Reg_2D_2_io_rd_offset),
    .io_valid_out(Reg_2D_2_io_valid_out),
    .io_data_out(Reg_2D_2_io_data_out)
  );
  Reg_2D Reg_2D_3 ( // @[2D_Regfile.scala 33:54]
    .clock(Reg_2D_3_clock),
    .reset(Reg_2D_3_reset),
    .io_wen(Reg_2D_3_io_wen),
    .io_wr_offset(Reg_2D_3_io_wr_offset),
    .io_valid_in(Reg_2D_3_io_valid_in),
    .io_data_in(Reg_2D_3_io_data_in),
    .io_rd_offset(Reg_2D_3_io_rd_offset),
    .io_valid_out(Reg_2D_3_io_valid_out),
    .io_data_out(Reg_2D_3_io_data_out)
  );
  Reg_2D Reg_2D_4 ( // @[2D_Regfile.scala 33:54]
    .clock(Reg_2D_4_clock),
    .reset(Reg_2D_4_reset),
    .io_wen(Reg_2D_4_io_wen),
    .io_wr_offset(Reg_2D_4_io_wr_offset),
    .io_valid_in(Reg_2D_4_io_valid_in),
    .io_data_in(Reg_2D_4_io_data_in),
    .io_rd_offset(Reg_2D_4_io_rd_offset),
    .io_valid_out(Reg_2D_4_io_valid_out),
    .io_data_out(Reg_2D_4_io_data_out)
  );
  Reg_2D Reg_2D_5 ( // @[2D_Regfile.scala 33:54]
    .clock(Reg_2D_5_clock),
    .reset(Reg_2D_5_reset),
    .io_wen(Reg_2D_5_io_wen),
    .io_wr_offset(Reg_2D_5_io_wr_offset),
    .io_valid_in(Reg_2D_5_io_valid_in),
    .io_data_in(Reg_2D_5_io_data_in),
    .io_rd_offset(Reg_2D_5_io_rd_offset),
    .io_valid_out(Reg_2D_5_io_valid_out),
    .io_data_out(Reg_2D_5_io_data_out)
  );
  Reg_2D Reg_2D_6 ( // @[2D_Regfile.scala 33:54]
    .clock(Reg_2D_6_clock),
    .reset(Reg_2D_6_reset),
    .io_wen(Reg_2D_6_io_wen),
    .io_wr_offset(Reg_2D_6_io_wr_offset),
    .io_valid_in(Reg_2D_6_io_valid_in),
    .io_data_in(Reg_2D_6_io_data_in),
    .io_rd_offset(Reg_2D_6_io_rd_offset),
    .io_valid_out(Reg_2D_6_io_valid_out),
    .io_data_out(Reg_2D_6_io_data_out)
  );
  Reg_2D Reg_2D_7 ( // @[2D_Regfile.scala 33:54]
    .clock(Reg_2D_7_clock),
    .reset(Reg_2D_7_reset),
    .io_wen(Reg_2D_7_io_wen),
    .io_wr_offset(Reg_2D_7_io_wr_offset),
    .io_valid_in(Reg_2D_7_io_valid_in),
    .io_data_in(Reg_2D_7_io_data_in),
    .io_rd_offset(Reg_2D_7_io_rd_offset),
    .io_valid_out(Reg_2D_7_io_valid_out),
    .io_data_out(Reg_2D_7_io_data_out)
  );
  assign io_out_valid = 3'h7 == io_rd_addr[2:0] ? regfile2d_7_valid_out : _GEN_86; // @[2D_Regfile.scala 55:{16,16}]
  assign io_out_bits_data = 3'h7 == io_rd_addr[2:0] ? regfile2d_7_data_out : _GEN_94; // @[2D_Regfile.scala 56:{20,20}]
  assign Reg_2D_clock = clock;
  assign Reg_2D_reset = reset;
  assign Reg_2D_io_wen = 3'h0 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_0; // @[2D_Regfile.scala 48:{32,32}]
  assign Reg_2D_io_wr_offset = 3'h0 == io_wr_1_addr[2:0] ? io_wr_1_offset : _GEN_16; // @[2D_Regfile.scala 50:{38,38}]
  assign Reg_2D_io_valid_in = 3'h0 == io_rd_addr[2:0] ? io_rd_ren : regfile2d_0_wen; // @[2D_Regfile.scala 53:{34,34}]
  assign Reg_2D_io_data_in = 3'h0 == io_wr_1_addr[2:0] ? io_wr_1_data : _GEN_24; // @[2D_Regfile.scala 51:{36,36}]
  assign Reg_2D_io_rd_offset = 3'h0 == io_rd_addr[2:0] ? io_rd_offset : 3'h0; // @[2D_Regfile.scala 39:28 54:{35,35}]
  assign Reg_2D_1_clock = clock;
  assign Reg_2D_1_reset = reset;
  assign Reg_2D_1_io_wen = 3'h1 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_1; // @[2D_Regfile.scala 48:{32,32}]
  assign Reg_2D_1_io_wr_offset = 3'h1 == io_wr_1_addr[2:0] ? io_wr_1_offset : _GEN_17; // @[2D_Regfile.scala 50:{38,38}]
  assign Reg_2D_1_io_valid_in = 3'h1 == io_rd_addr[2:0] ? io_rd_ren : regfile2d_1_wen; // @[2D_Regfile.scala 53:{34,34}]
  assign Reg_2D_1_io_data_in = 3'h1 == io_wr_1_addr[2:0] ? io_wr_1_data : _GEN_25; // @[2D_Regfile.scala 51:{36,36}]
  assign Reg_2D_1_io_rd_offset = 3'h1 == io_rd_addr[2:0] ? io_rd_offset : 3'h0; // @[2D_Regfile.scala 39:28 54:{35,35}]
  assign Reg_2D_2_clock = clock;
  assign Reg_2D_2_reset = reset;
  assign Reg_2D_2_io_wen = 3'h2 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_2; // @[2D_Regfile.scala 48:{32,32}]
  assign Reg_2D_2_io_wr_offset = 3'h2 == io_wr_1_addr[2:0] ? io_wr_1_offset : _GEN_18; // @[2D_Regfile.scala 50:{38,38}]
  assign Reg_2D_2_io_valid_in = 3'h2 == io_rd_addr[2:0] ? io_rd_ren : regfile2d_2_wen; // @[2D_Regfile.scala 53:{34,34}]
  assign Reg_2D_2_io_data_in = 3'h2 == io_wr_1_addr[2:0] ? io_wr_1_data : _GEN_26; // @[2D_Regfile.scala 51:{36,36}]
  assign Reg_2D_2_io_rd_offset = 3'h2 == io_rd_addr[2:0] ? io_rd_offset : 3'h0; // @[2D_Regfile.scala 39:28 54:{35,35}]
  assign Reg_2D_3_clock = clock;
  assign Reg_2D_3_reset = reset;
  assign Reg_2D_3_io_wen = 3'h3 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_3; // @[2D_Regfile.scala 48:{32,32}]
  assign Reg_2D_3_io_wr_offset = 3'h3 == io_wr_1_addr[2:0] ? io_wr_1_offset : _GEN_19; // @[2D_Regfile.scala 50:{38,38}]
  assign Reg_2D_3_io_valid_in = 3'h3 == io_rd_addr[2:0] ? io_rd_ren : regfile2d_3_wen; // @[2D_Regfile.scala 53:{34,34}]
  assign Reg_2D_3_io_data_in = 3'h3 == io_wr_1_addr[2:0] ? io_wr_1_data : _GEN_27; // @[2D_Regfile.scala 51:{36,36}]
  assign Reg_2D_3_io_rd_offset = 3'h3 == io_rd_addr[2:0] ? io_rd_offset : 3'h0; // @[2D_Regfile.scala 39:28 54:{35,35}]
  assign Reg_2D_4_clock = clock;
  assign Reg_2D_4_reset = reset;
  assign Reg_2D_4_io_wen = 3'h4 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_4; // @[2D_Regfile.scala 48:{32,32}]
  assign Reg_2D_4_io_wr_offset = 3'h4 == io_wr_1_addr[2:0] ? io_wr_1_offset : _GEN_20; // @[2D_Regfile.scala 50:{38,38}]
  assign Reg_2D_4_io_valid_in = 3'h4 == io_rd_addr[2:0] ? io_rd_ren : regfile2d_4_wen; // @[2D_Regfile.scala 53:{34,34}]
  assign Reg_2D_4_io_data_in = 3'h4 == io_wr_1_addr[2:0] ? io_wr_1_data : _GEN_28; // @[2D_Regfile.scala 51:{36,36}]
  assign Reg_2D_4_io_rd_offset = 3'h4 == io_rd_addr[2:0] ? io_rd_offset : 3'h0; // @[2D_Regfile.scala 39:28 54:{35,35}]
  assign Reg_2D_5_clock = clock;
  assign Reg_2D_5_reset = reset;
  assign Reg_2D_5_io_wen = 3'h5 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_5; // @[2D_Regfile.scala 48:{32,32}]
  assign Reg_2D_5_io_wr_offset = 3'h5 == io_wr_1_addr[2:0] ? io_wr_1_offset : _GEN_21; // @[2D_Regfile.scala 50:{38,38}]
  assign Reg_2D_5_io_valid_in = 3'h5 == io_rd_addr[2:0] ? io_rd_ren : regfile2d_5_wen; // @[2D_Regfile.scala 53:{34,34}]
  assign Reg_2D_5_io_data_in = 3'h5 == io_wr_1_addr[2:0] ? io_wr_1_data : _GEN_29; // @[2D_Regfile.scala 51:{36,36}]
  assign Reg_2D_5_io_rd_offset = 3'h5 == io_rd_addr[2:0] ? io_rd_offset : 3'h0; // @[2D_Regfile.scala 39:28 54:{35,35}]
  assign Reg_2D_6_clock = clock;
  assign Reg_2D_6_reset = reset;
  assign Reg_2D_6_io_wen = 3'h6 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_6; // @[2D_Regfile.scala 48:{32,32}]
  assign Reg_2D_6_io_wr_offset = 3'h6 == io_wr_1_addr[2:0] ? io_wr_1_offset : _GEN_22; // @[2D_Regfile.scala 50:{38,38}]
  assign Reg_2D_6_io_valid_in = 3'h6 == io_rd_addr[2:0] ? io_rd_ren : regfile2d_6_wen; // @[2D_Regfile.scala 53:{34,34}]
  assign Reg_2D_6_io_data_in = 3'h6 == io_wr_1_addr[2:0] ? io_wr_1_data : _GEN_30; // @[2D_Regfile.scala 51:{36,36}]
  assign Reg_2D_6_io_rd_offset = 3'h6 == io_rd_addr[2:0] ? io_rd_offset : 3'h0; // @[2D_Regfile.scala 39:28 54:{35,35}]
  assign Reg_2D_7_clock = clock;
  assign Reg_2D_7_reset = reset;
  assign Reg_2D_7_io_wen = 3'h7 == io_wr_1_addr[2:0] ? io_wr_1_wen : _GEN_7; // @[2D_Regfile.scala 48:{32,32}]
  assign Reg_2D_7_io_wr_offset = 3'h7 == io_wr_1_addr[2:0] ? io_wr_1_offset : _GEN_23; // @[2D_Regfile.scala 50:{38,38}]
  assign Reg_2D_7_io_valid_in = 3'h7 == io_rd_addr[2:0] ? io_rd_ren : regfile2d_7_wen; // @[2D_Regfile.scala 53:{34,34}]
  assign Reg_2D_7_io_data_in = 3'h7 == io_wr_1_addr[2:0] ? io_wr_1_data : _GEN_31; // @[2D_Regfile.scala 51:{36,36}]
  assign Reg_2D_7_io_rd_offset = 3'h7 == io_rd_addr[2:0] ? io_rd_offset : 3'h0; // @[2D_Regfile.scala 39:28 54:{35,35}]
endmodule
