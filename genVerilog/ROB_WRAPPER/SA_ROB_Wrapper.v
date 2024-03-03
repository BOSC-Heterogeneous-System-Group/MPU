module ldBuffer(
  input         clock,
  input         reset,
  input  [4:0]  io_deqptr_0,
  input  [4:0]  io_deqptr_1,
  input  [4:0]  io_deqptr_2,
  input  [4:0]  io_deqptr_3,
  input  [4:0]  io_deqptr_4,
  input  [4:0]  io_deqptr_5,
  input  [63:0] io_ldin_data_0,
  input  [63:0] io_ldin_data_1,
  input  [4:0]  io_ldin_robIdx_0,
  input  [4:0]  io_ldin_robIdx_1,
  input  [2:0]  io_ldin_fuOptype_0,
  input  [2:0]  io_ldin_fuOptype_1,
  input         io_ldin_valid_0,
  input         io_ldin_valid_1,
  output [63:0] io_bufout_data_0,
  output [63:0] io_bufout_data_1,
  output [63:0] io_bufout_data_2,
  output [63:0] io_bufout_data_3,
  output [5:0]  io_bufout_MatchVec_0,
  output [5:0]  io_bufout_MatchVec_1,
  output [5:0]  io_bufout_MatchVec_2,
  output [5:0]  io_bufout_MatchVec_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  reg  validReg_0; // @[matu.scala 184:25]
  reg [4:0] deqptrReg_2; // @[matu.scala 186:22]
  reg [4:0] robIdxReg_0; // @[matu.scala 187:22]
  wire  MatchVec_0_2 = validReg_0 & deqptrReg_2 == robIdxReg_0; // @[matu.scala 205:35]
  reg [4:0] deqptrReg_1; // @[matu.scala 186:22]
  wire  MatchVec_0_1 = validReg_0 & deqptrReg_1 == robIdxReg_0; // @[matu.scala 205:35]
  reg [4:0] deqptrReg_0; // @[matu.scala 186:22]
  wire  MatchVec_0_0 = validReg_0 & deqptrReg_0 == robIdxReg_0; // @[matu.scala 205:35]
  wire [2:0] matchVecUInt_lo = {MatchVec_0_2,MatchVec_0_1,MatchVec_0_0}; // @[matu.scala 183:60]
  reg [4:0] deqptrReg_5; // @[matu.scala 186:22]
  wire  MatchVec_0_5 = validReg_0 & deqptrReg_5 == robIdxReg_0; // @[matu.scala 205:35]
  reg [4:0] deqptrReg_4; // @[matu.scala 186:22]
  wire  MatchVec_0_4 = validReg_0 & deqptrReg_4 == robIdxReg_0; // @[matu.scala 205:35]
  reg [4:0] deqptrReg_3; // @[matu.scala 186:22]
  wire  MatchVec_0_3 = validReg_0 & deqptrReg_3 == robIdxReg_0; // @[matu.scala 205:35]
  wire [2:0] matchVecUInt_hi = {MatchVec_0_5,MatchVec_0_4,MatchVec_0_3}; // @[matu.scala 183:60]
  wire [5:0] matchVecUInt_0 = {MatchVec_0_5,MatchVec_0_4,MatchVec_0_3,MatchVec_0_2,MatchVec_0_1,MatchVec_0_0}; // @[matu.scala 183:60]
  reg  validReg_1; // @[matu.scala 184:25]
  reg [4:0] robIdxReg_1; // @[matu.scala 187:22]
  wire  MatchVec_1_2 = validReg_1 & deqptrReg_2 == robIdxReg_1; // @[matu.scala 206:35]
  wire  MatchVec_1_1 = validReg_1 & deqptrReg_1 == robIdxReg_1; // @[matu.scala 206:35]
  wire  MatchVec_1_0 = validReg_1 & deqptrReg_0 == robIdxReg_1; // @[matu.scala 206:35]
  wire [2:0] matchVecUInt_lo_1 = {MatchVec_1_2,MatchVec_1_1,MatchVec_1_0}; // @[matu.scala 183:60]
  wire  MatchVec_1_5 = validReg_1 & deqptrReg_5 == robIdxReg_1; // @[matu.scala 206:35]
  wire  MatchVec_1_4 = validReg_1 & deqptrReg_4 == robIdxReg_1; // @[matu.scala 206:35]
  wire  MatchVec_1_3 = validReg_1 & deqptrReg_3 == robIdxReg_1; // @[matu.scala 206:35]
  wire [2:0] matchVecUInt_hi_1 = {MatchVec_1_5,MatchVec_1_4,MatchVec_1_3}; // @[matu.scala 183:60]
  wire [5:0] matchVecUInt_1 = {MatchVec_1_5,MatchVec_1_4,MatchVec_1_3,MatchVec_1_2,MatchVec_1_1,MatchVec_1_0}; // @[matu.scala 183:60]
  reg  validReg_2; // @[matu.scala 184:25]
  reg [4:0] robIdxReg_2; // @[matu.scala 187:22]
  wire  MatchVec_2_2 = validReg_2 & deqptrReg_2 == robIdxReg_2; // @[matu.scala 207:35]
  wire  MatchVec_2_1 = validReg_2 & deqptrReg_1 == robIdxReg_2; // @[matu.scala 207:35]
  wire  MatchVec_2_0 = validReg_2 & deqptrReg_0 == robIdxReg_2; // @[matu.scala 207:35]
  wire [2:0] matchVecUInt_lo_2 = {MatchVec_2_2,MatchVec_2_1,MatchVec_2_0}; // @[matu.scala 183:60]
  wire  MatchVec_2_5 = validReg_2 & deqptrReg_5 == robIdxReg_2; // @[matu.scala 207:35]
  wire  MatchVec_2_4 = validReg_2 & deqptrReg_4 == robIdxReg_2; // @[matu.scala 207:35]
  wire  MatchVec_2_3 = validReg_2 & deqptrReg_3 == robIdxReg_2; // @[matu.scala 207:35]
  wire [2:0] matchVecUInt_hi_2 = {MatchVec_2_5,MatchVec_2_4,MatchVec_2_3}; // @[matu.scala 183:60]
  wire [5:0] matchVecUInt_2 = {MatchVec_2_5,MatchVec_2_4,MatchVec_2_3,MatchVec_2_2,MatchVec_2_1,MatchVec_2_0}; // @[matu.scala 183:60]
  reg  validReg_3; // @[matu.scala 184:25]
  reg [4:0] robIdxReg_3; // @[matu.scala 187:22]
  wire  MatchVec_3_2 = validReg_3 & deqptrReg_2 == robIdxReg_3; // @[matu.scala 208:35]
  wire  MatchVec_3_1 = validReg_3 & deqptrReg_1 == robIdxReg_3; // @[matu.scala 208:35]
  wire  MatchVec_3_0 = validReg_3 & deqptrReg_0 == robIdxReg_3; // @[matu.scala 208:35]
  wire [2:0] matchVecUInt_lo_3 = {MatchVec_3_2,MatchVec_3_1,MatchVec_3_0}; // @[matu.scala 183:60]
  wire  MatchVec_3_5 = validReg_3 & deqptrReg_5 == robIdxReg_3; // @[matu.scala 208:35]
  wire  MatchVec_3_4 = validReg_3 & deqptrReg_4 == robIdxReg_3; // @[matu.scala 208:35]
  wire  MatchVec_3_3 = validReg_3 & deqptrReg_3 == robIdxReg_3; // @[matu.scala 208:35]
  wire [2:0] matchVecUInt_hi_3 = {MatchVec_3_5,MatchVec_3_4,MatchVec_3_3}; // @[matu.scala 183:60]
  wire [5:0] matchVecUInt_3 = {MatchVec_3_5,MatchVec_3_4,MatchVec_3_3,MatchVec_3_2,MatchVec_3_1,MatchVec_3_0}; // @[matu.scala 183:60]
  reg [63:0] dataReg_0; // @[matu.scala 185:24]
  reg [63:0] dataReg_1; // @[matu.scala 185:24]
  reg [63:0] dataReg_2; // @[matu.scala 185:24]
  reg [63:0] dataReg_3; // @[matu.scala 185:24]
  wire  _validReg_0_T = io_ldin_fuOptype_0 == 3'h7; // @[matu.scala 190:39]
  wire  _validReg_1_T = io_ldin_fuOptype_1 == 3'h7; // @[matu.scala 191:39]
  wire  _validReg_2_T_2 = |matchVecUInt_0 ? 1'h0 : validReg_0; // @[matu.scala 192:21]
  wire  _validReg_2_T_5 = |matchVecUInt_2 ? 1'h0 : validReg_2; // @[matu.scala 192:77]
  wire  _validReg_3_T_2 = |matchVecUInt_1 ? 1'h0 : validReg_1; // @[matu.scala 193:21]
  wire  _validReg_3_T_5 = |matchVecUInt_3 ? 1'h0 : validReg_3; // @[matu.scala 193:77]
  wire  _dataReg_0_T_1 = io_ldin_valid_0 & _validReg_0_T; // @[matu.scala 194:38]
  wire  _dataReg_1_T_1 = io_ldin_valid_1 & _validReg_1_T; // @[matu.scala 195:38]
  assign io_bufout_data_0 = dataReg_0; // @[matu.scala 210:18]
  assign io_bufout_data_1 = dataReg_1; // @[matu.scala 210:18]
  assign io_bufout_data_2 = dataReg_2; // @[matu.scala 210:18]
  assign io_bufout_data_3 = dataReg_3; // @[matu.scala 210:18]
  assign io_bufout_MatchVec_0 = {matchVecUInt_hi,matchVecUInt_lo}; // @[matu.scala 183:60]
  assign io_bufout_MatchVec_1 = {matchVecUInt_hi_1,matchVecUInt_lo_1}; // @[matu.scala 183:60]
  assign io_bufout_MatchVec_2 = {matchVecUInt_hi_2,matchVecUInt_lo_2}; // @[matu.scala 183:60]
  assign io_bufout_MatchVec_3 = {matchVecUInt_hi_3,matchVecUInt_lo_3}; // @[matu.scala 183:60]
  always @(posedge clock) begin
    if (reset) begin // @[matu.scala 184:25]
      validReg_0 <= 1'h0; // @[matu.scala 184:25]
    end else begin
      validReg_0 <= io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0; // @[matu.scala 190:15]
    end
    deqptrReg_2 <= io_deqptr_2; // @[matu.scala 202:13]
    if (_dataReg_0_T_1) begin // @[matu.scala 198:22]
      robIdxReg_0 <= io_ldin_robIdx_0;
    end
    deqptrReg_1 <= io_deqptr_1; // @[matu.scala 202:13]
    deqptrReg_0 <= io_deqptr_0; // @[matu.scala 202:13]
    deqptrReg_5 <= io_deqptr_5; // @[matu.scala 202:13]
    deqptrReg_4 <= io_deqptr_4; // @[matu.scala 202:13]
    deqptrReg_3 <= io_deqptr_3; // @[matu.scala 202:13]
    if (reset) begin // @[matu.scala 184:25]
      validReg_1 <= 1'h0; // @[matu.scala 184:25]
    end else begin
      validReg_1 <= io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_0; // @[matu.scala 191:15]
    end
    if (_dataReg_1_T_1) begin // @[matu.scala 199:22]
      robIdxReg_1 <= io_ldin_robIdx_1;
    end
    if (reset) begin // @[matu.scala 184:25]
      validReg_2 <= 1'h0; // @[matu.scala 184:25]
    end else begin
      validReg_2 <= _validReg_2_T_2 | _validReg_2_T_5; // @[matu.scala 192:15]
    end
    robIdxReg_2 <= robIdxReg_0; // @[matu.scala 200:16]
    if (reset) begin // @[matu.scala 184:25]
      validReg_3 <= 1'h0; // @[matu.scala 184:25]
    end else begin
      validReg_3 <= _validReg_3_T_2 | _validReg_3_T_5; // @[matu.scala 193:15]
    end
    robIdxReg_3 <= robIdxReg_1; // @[matu.scala 201:16]
    if (reset) begin // @[matu.scala 185:24]
      dataReg_0 <= 64'h0; // @[matu.scala 185:24]
    end else if (io_ldin_valid_0 & _validReg_0_T) begin // @[matu.scala 194:20]
      dataReg_0 <= io_ldin_data_0;
    end
    if (reset) begin // @[matu.scala 185:24]
      dataReg_1 <= 64'h0; // @[matu.scala 185:24]
    end else if (io_ldin_valid_1 & _validReg_1_T) begin // @[matu.scala 195:20]
      dataReg_1 <= io_ldin_data_1;
    end
    if (reset) begin // @[matu.scala 185:24]
      dataReg_2 <= 64'h0; // @[matu.scala 185:24]
    end else begin
      dataReg_2 <= dataReg_0; // @[matu.scala 196:14]
    end
    if (reset) begin // @[matu.scala 185:24]
      dataReg_3 <= 64'h0; // @[matu.scala 185:24]
    end else begin
      dataReg_3 <= dataReg_1; // @[matu.scala 197:14]
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
  _RAND_0 = {1{`RANDOM}};
  validReg_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  deqptrReg_2 = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  robIdxReg_0 = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  deqptrReg_1 = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  deqptrReg_0 = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  deqptrReg_5 = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  deqptrReg_4 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  deqptrReg_3 = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  validReg_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  robIdxReg_1 = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  validReg_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  robIdxReg_2 = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  validReg_3 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  robIdxReg_3 = _RAND_13[4:0];
  _RAND_14 = {2{`RANDOM}};
  dataReg_0 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  dataReg_1 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  dataReg_2 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  dataReg_3 = _RAND_17[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SA_ROB(
  input         clock,
  input         reset,
  input  [5:0]  io_MatchVec_0,
  input  [5:0]  io_MatchVec_1,
  input  [5:0]  io_MatchVec_2,
  input  [5:0]  io_MatchVec_3,
  input  [63:0] io_data_0,
  input  [63:0] io_data_1,
  input  [63:0] io_data_2,
  input  [63:0] io_data_3,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mem_0; // @[matu.scala 232:20]
  reg [63:0] mem_1; // @[matu.scala 232:20]
  reg [63:0] mem_2; // @[matu.scala 232:20]
  reg [63:0] mem_3; // @[matu.scala 232:20]
  reg [5:0] matchVecReg_0; // @[matu.scala 233:28]
  reg [5:0] matchVecReg_1; // @[matu.scala 233:28]
  reg [5:0] matchVecReg_2; // @[matu.scala 233:28]
  reg [5:0] matchVecReg_3; // @[matu.scala 233:28]
  reg [5:0] matchVecMask_0; // @[matu.scala 234:29]
  reg [5:0] matchVecMask_1; // @[matu.scala 234:29]
  reg [5:0] matchVecMask_2; // @[matu.scala 234:29]
  reg [5:0] matchVecMask_3; // @[matu.scala 234:29]
  wire  _io_out_valid_T = |matchVecReg_3; // @[matu.scala 242:38]
  wire  _io_out_valid_T_1 = |matchVecReg_2; // @[matu.scala 242:58]
  wire  _io_out_valid_T_2 = |matchVecReg_1; // @[matu.scala 242:78]
  wire  _io_out_valid_T_3 = |matchVecReg_0; // @[matu.scala 242:98]
  wire [3:0] _io_out_valid_T_4 = {_io_out_valid_T,_io_out_valid_T_1,_io_out_valid_T_2,_io_out_valid_T_3}; // @[Cat.scala 33:92]
  wire  _io_out_valid_T_5 = |_io_out_valid_T_4; // @[matu.scala 242:103]
  wire  _T = matchVecReg_0 == 6'h0; // @[matu.scala 245:25]
  wire [5:0] minMask_0_1 = matchVecMask_0 > matchVecMask_1 ? matchVecMask_1 : matchVecMask_0; // @[matu.scala 259:21]
  wire [5:0] minMask_2_3 = matchVecMask_2 > matchVecMask_3 ? matchVecMask_3 : matchVecMask_2; // @[matu.scala 260:21]
  wire [5:0] minMask = minMask_0_1 > minMask_2_3 ? minMask_2_3 : minMask_0_1; // @[matu.scala 261:17]
  wire [1:0] _GEN_17 = minMask == matchVecMask_1 ? 2'h1 : 2'h0; // @[matu.scala 263:38 264:15]
  wire [1:0] _GEN_18 = minMask == matchVecMask_2 ? 2'h2 : _GEN_17; // @[matu.scala 263:38 264:15]
  wire [1:0] minIndex = minMask == matchVecMask_3 ? 2'h3 : _GEN_18; // @[matu.scala 263:38 264:15]
  wire [5:0] _GEN_0 = matchVecReg_0 == 6'h0 | minIndex == 2'h0 ? io_MatchVec_0 : matchVecReg_0; // @[matu.scala 245:54 246:22 233:28]
  wire  _T_3 = matchVecReg_1 == 6'h0; // @[matu.scala 245:25]
  wire [5:0] _GEN_2 = matchVecReg_1 == 6'h0 | minIndex == 2'h1 ? io_MatchVec_1 : matchVecReg_1; // @[matu.scala 245:54 246:22 233:28]
  wire  _T_6 = matchVecReg_2 == 6'h0; // @[matu.scala 245:25]
  wire [5:0] _GEN_4 = matchVecReg_2 == 6'h0 | minIndex == 2'h2 ? io_MatchVec_2 : matchVecReg_2; // @[matu.scala 245:54 246:22 233:28]
  wire  _T_9 = matchVecReg_3 == 6'h0; // @[matu.scala 245:25]
  wire [5:0] _GEN_6 = matchVecReg_3 == 6'h0 | minIndex == 2'h3 ? io_MatchVec_3 : matchVecReg_3; // @[matu.scala 245:54 246:22 233:28]
  wire [5:0] _matchVecMask_0_T = ~io_MatchVec_0; // @[matu.scala 253:26]
  wire [5:0] _GEN_8 = _T ? io_MatchVec_0 : matchVecMask_0; // @[matu.scala 254:40 255:23 234:29]
  wire [5:0] _GEN_9 = io_MatchVec_0 == 6'h0 & _T ? _matchVecMask_0_T : _GEN_8; // @[matu.scala 252:60 253:23]
  wire [5:0] _matchVecMask_1_T = ~io_MatchVec_1; // @[matu.scala 253:26]
  wire [5:0] _GEN_10 = _T_3 ? io_MatchVec_1 : matchVecMask_1; // @[matu.scala 254:40 255:23 234:29]
  wire [5:0] _GEN_11 = io_MatchVec_1 == 6'h0 & _T_3 ? _matchVecMask_1_T : _GEN_10; // @[matu.scala 252:60 253:23]
  wire [5:0] _matchVecMask_2_T = ~io_MatchVec_2; // @[matu.scala 253:26]
  wire [5:0] _GEN_12 = _T_6 ? io_MatchVec_2 : matchVecMask_2; // @[matu.scala 254:40 255:23 234:29]
  wire [5:0] _GEN_13 = io_MatchVec_2 == 6'h0 & _T_6 ? _matchVecMask_2_T : _GEN_12; // @[matu.scala 252:60 253:23]
  wire [5:0] _matchVecMask_3_T = ~io_MatchVec_3; // @[matu.scala 253:26]
  wire [5:0] _GEN_14 = _T_9 ? io_MatchVec_3 : matchVecMask_3; // @[matu.scala 254:40 255:23 234:29]
  wire [5:0] _GEN_15 = io_MatchVec_3 == 6'h0 & _T_9 ? _matchVecMask_3_T : _GEN_14; // @[matu.scala 252:60 253:23]
  wire [5:0] _GEN_21 = 2'h1 == minIndex ? matchVecReg_1 : matchVecReg_0; // @[matu.scala 268:{31,31}]
  wire [5:0] _GEN_22 = 2'h2 == minIndex ? matchVecReg_2 : _GEN_21; // @[matu.scala 268:{31,31}]
  wire [5:0] _GEN_23 = 2'h3 == minIndex ? matchVecReg_3 : _GEN_22; // @[matu.scala 268:{31,31}]
  wire [5:0] _GEN_33 = 2'h1 == minIndex ? matchVecMask_1 : matchVecMask_0; // @[matu.scala 271:{32,32}]
  wire [5:0] _GEN_34 = 2'h2 == minIndex ? matchVecMask_2 : _GEN_33; // @[matu.scala 271:{32,32}]
  wire [5:0] _GEN_35 = 2'h3 == minIndex ? matchVecMask_3 : _GEN_34; // @[matu.scala 271:{32,32}]
  wire  deq = _io_out_valid_T_5 & io_out_ready; // @[matu.scala 275:98]
  wire [63:0] _GEN_45 = 2'h1 == minIndex ? mem_1 : mem_0; // @[matu.scala 278:{13,13}]
  wire [63:0] _GEN_46 = 2'h2 == minIndex ? mem_2 : _GEN_45; // @[matu.scala 278:{13,13}]
  wire [63:0] _GEN_47 = 2'h3 == minIndex ? mem_3 : _GEN_46; // @[matu.scala 278:{13,13}]
  assign io_out_valid = |_io_out_valid_T_4; // @[matu.scala 242:103]
  assign io_out_bits = deq ? _GEN_47 : 64'h0; // @[matu.scala 277:13 278:13]
  always @(posedge clock) begin
    if (reset) begin // @[matu.scala 232:20]
      mem_0 <= 64'h0; // @[matu.scala 232:20]
    end else if (matchVecReg_0 == 6'h0 | minIndex == 2'h0) begin // @[matu.scala 245:54]
      mem_0 <= io_data_0; // @[matu.scala 247:14]
    end
    if (reset) begin // @[matu.scala 232:20]
      mem_1 <= 64'h0; // @[matu.scala 232:20]
    end else if (matchVecReg_1 == 6'h0 | minIndex == 2'h1) begin // @[matu.scala 245:54]
      mem_1 <= io_data_1; // @[matu.scala 247:14]
    end
    if (reset) begin // @[matu.scala 232:20]
      mem_2 <= 64'h0; // @[matu.scala 232:20]
    end else if (matchVecReg_2 == 6'h0 | minIndex == 2'h2) begin // @[matu.scala 245:54]
      mem_2 <= io_data_2; // @[matu.scala 247:14]
    end
    if (reset) begin // @[matu.scala 232:20]
      mem_3 <= 64'h0; // @[matu.scala 232:20]
    end else if (matchVecReg_3 == 6'h0 | minIndex == 2'h3) begin // @[matu.scala 245:54]
      mem_3 <= io_data_3; // @[matu.scala 247:14]
    end
    if (reset) begin // @[matu.scala 233:28]
      matchVecReg_0 <= 6'h0; // @[matu.scala 233:28]
    end else if (_GEN_23 > 6'h0) begin // @[matu.scala 268:38]
      if (2'h0 == minIndex) begin // @[matu.scala 269:27]
        matchVecReg_0 <= 6'h0; // @[matu.scala 269:27]
      end else begin
        matchVecReg_0 <= _GEN_0;
      end
    end else begin
      matchVecReg_0 <= _GEN_0;
    end
    if (reset) begin // @[matu.scala 233:28]
      matchVecReg_1 <= 6'h0; // @[matu.scala 233:28]
    end else if (_GEN_23 > 6'h0) begin // @[matu.scala 268:38]
      if (2'h1 == minIndex) begin // @[matu.scala 269:27]
        matchVecReg_1 <= 6'h0; // @[matu.scala 269:27]
      end else begin
        matchVecReg_1 <= _GEN_2;
      end
    end else begin
      matchVecReg_1 <= _GEN_2;
    end
    if (reset) begin // @[matu.scala 233:28]
      matchVecReg_2 <= 6'h0; // @[matu.scala 233:28]
    end else if (_GEN_23 > 6'h0) begin // @[matu.scala 268:38]
      if (2'h2 == minIndex) begin // @[matu.scala 269:27]
        matchVecReg_2 <= 6'h0; // @[matu.scala 269:27]
      end else begin
        matchVecReg_2 <= _GEN_4;
      end
    end else begin
      matchVecReg_2 <= _GEN_4;
    end
    if (reset) begin // @[matu.scala 233:28]
      matchVecReg_3 <= 6'h0; // @[matu.scala 233:28]
    end else if (_GEN_23 > 6'h0) begin // @[matu.scala 268:38]
      if (2'h3 == minIndex) begin // @[matu.scala 269:27]
        matchVecReg_3 <= 6'h0; // @[matu.scala 269:27]
      end else begin
        matchVecReg_3 <= _GEN_6;
      end
    end else begin
      matchVecReg_3 <= _GEN_6;
    end
    if (reset) begin // @[matu.scala 234:29]
      matchVecMask_0 <= 6'h3f; // @[matu.scala 234:29]
    end else if (_GEN_35 < 6'h3f) begin // @[matu.scala 271:40]
      if (2'h0 == minIndex) begin // @[matu.scala 272:28]
        matchVecMask_0 <= 6'h3f; // @[matu.scala 272:28]
      end else begin
        matchVecMask_0 <= _GEN_9;
      end
    end else begin
      matchVecMask_0 <= _GEN_9;
    end
    if (reset) begin // @[matu.scala 234:29]
      matchVecMask_1 <= 6'h3f; // @[matu.scala 234:29]
    end else if (_GEN_35 < 6'h3f) begin // @[matu.scala 271:40]
      if (2'h1 == minIndex) begin // @[matu.scala 272:28]
        matchVecMask_1 <= 6'h3f; // @[matu.scala 272:28]
      end else begin
        matchVecMask_1 <= _GEN_11;
      end
    end else begin
      matchVecMask_1 <= _GEN_11;
    end
    if (reset) begin // @[matu.scala 234:29]
      matchVecMask_2 <= 6'h3f; // @[matu.scala 234:29]
    end else if (_GEN_35 < 6'h3f) begin // @[matu.scala 271:40]
      if (2'h2 == minIndex) begin // @[matu.scala 272:28]
        matchVecMask_2 <= 6'h3f; // @[matu.scala 272:28]
      end else begin
        matchVecMask_2 <= _GEN_13;
      end
    end else begin
      matchVecMask_2 <= _GEN_13;
    end
    if (reset) begin // @[matu.scala 234:29]
      matchVecMask_3 <= 6'h3f; // @[matu.scala 234:29]
    end else if (_GEN_35 < 6'h3f) begin // @[matu.scala 271:40]
      if (2'h3 == minIndex) begin // @[matu.scala 272:28]
        matchVecMask_3 <= 6'h3f; // @[matu.scala 272:28]
      end else begin
        matchVecMask_3 <= _GEN_15;
      end
    end else begin
      matchVecMask_3 <= _GEN_15;
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
  mem_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mem_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mem_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  mem_3 = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  matchVecReg_0 = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  matchVecReg_1 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  matchVecReg_2 = _RAND_6[5:0];
  _RAND_7 = {1{`RANDOM}};
  matchVecReg_3 = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  matchVecMask_0 = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  matchVecMask_1 = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  matchVecMask_2 = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  matchVecMask_3 = _RAND_11[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SA_ROB_Wrapper(
  input         clock,
  input         reset,
  input  [63:0] io_ldin_data_0,
  input  [63:0] io_ldin_data_1,
  input  [4:0]  io_ldin_robIdx_0,
  input  [4:0]  io_ldin_robIdx_1,
  input  [2:0]  io_ldin_fuOptype_0,
  input  [2:0]  io_ldin_fuOptype_1,
  input         io_ldin_valid_0,
  input         io_ldin_valid_1,
  input  [4:0]  io_deqptr_0,
  input  [4:0]  io_deqptr_1,
  input  [4:0]  io_deqptr_2,
  input  [4:0]  io_deqptr_3,
  input  [4:0]  io_deqptr_4,
  input  [4:0]  io_deqptr_5,
  input         io_out_ready,
  output        io_out_valid,
  output [63:0] io_out_bits
);
  wire  ldBuff_clock; // @[matu.scala 142:22]
  wire  ldBuff_reset; // @[matu.scala 142:22]
  wire [4:0] ldBuff_io_deqptr_0; // @[matu.scala 142:22]
  wire [4:0] ldBuff_io_deqptr_1; // @[matu.scala 142:22]
  wire [4:0] ldBuff_io_deqptr_2; // @[matu.scala 142:22]
  wire [4:0] ldBuff_io_deqptr_3; // @[matu.scala 142:22]
  wire [4:0] ldBuff_io_deqptr_4; // @[matu.scala 142:22]
  wire [4:0] ldBuff_io_deqptr_5; // @[matu.scala 142:22]
  wire [63:0] ldBuff_io_ldin_data_0; // @[matu.scala 142:22]
  wire [63:0] ldBuff_io_ldin_data_1; // @[matu.scala 142:22]
  wire [4:0] ldBuff_io_ldin_robIdx_0; // @[matu.scala 142:22]
  wire [4:0] ldBuff_io_ldin_robIdx_1; // @[matu.scala 142:22]
  wire [2:0] ldBuff_io_ldin_fuOptype_0; // @[matu.scala 142:22]
  wire [2:0] ldBuff_io_ldin_fuOptype_1; // @[matu.scala 142:22]
  wire  ldBuff_io_ldin_valid_0; // @[matu.scala 142:22]
  wire  ldBuff_io_ldin_valid_1; // @[matu.scala 142:22]
  wire [63:0] ldBuff_io_bufout_data_0; // @[matu.scala 142:22]
  wire [63:0] ldBuff_io_bufout_data_1; // @[matu.scala 142:22]
  wire [63:0] ldBuff_io_bufout_data_2; // @[matu.scala 142:22]
  wire [63:0] ldBuff_io_bufout_data_3; // @[matu.scala 142:22]
  wire [5:0] ldBuff_io_bufout_MatchVec_0; // @[matu.scala 142:22]
  wire [5:0] ldBuff_io_bufout_MatchVec_1; // @[matu.scala 142:22]
  wire [5:0] ldBuff_io_bufout_MatchVec_2; // @[matu.scala 142:22]
  wire [5:0] ldBuff_io_bufout_MatchVec_3; // @[matu.scala 142:22]
  wire  rob_clock; // @[matu.scala 143:19]
  wire  rob_reset; // @[matu.scala 143:19]
  wire [5:0] rob_io_MatchVec_0; // @[matu.scala 143:19]
  wire [5:0] rob_io_MatchVec_1; // @[matu.scala 143:19]
  wire [5:0] rob_io_MatchVec_2; // @[matu.scala 143:19]
  wire [5:0] rob_io_MatchVec_3; // @[matu.scala 143:19]
  wire [63:0] rob_io_data_0; // @[matu.scala 143:19]
  wire [63:0] rob_io_data_1; // @[matu.scala 143:19]
  wire [63:0] rob_io_data_2; // @[matu.scala 143:19]
  wire [63:0] rob_io_data_3; // @[matu.scala 143:19]
  wire  rob_io_out_ready; // @[matu.scala 143:19]
  wire  rob_io_out_valid; // @[matu.scala 143:19]
  wire [63:0] rob_io_out_bits; // @[matu.scala 143:19]
  ldBuffer ldBuff ( // @[matu.scala 142:22]
    .clock(ldBuff_clock),
    .reset(ldBuff_reset),
    .io_deqptr_0(ldBuff_io_deqptr_0),
    .io_deqptr_1(ldBuff_io_deqptr_1),
    .io_deqptr_2(ldBuff_io_deqptr_2),
    .io_deqptr_3(ldBuff_io_deqptr_3),
    .io_deqptr_4(ldBuff_io_deqptr_4),
    .io_deqptr_5(ldBuff_io_deqptr_5),
    .io_ldin_data_0(ldBuff_io_ldin_data_0),
    .io_ldin_data_1(ldBuff_io_ldin_data_1),
    .io_ldin_robIdx_0(ldBuff_io_ldin_robIdx_0),
    .io_ldin_robIdx_1(ldBuff_io_ldin_robIdx_1),
    .io_ldin_fuOptype_0(ldBuff_io_ldin_fuOptype_0),
    .io_ldin_fuOptype_1(ldBuff_io_ldin_fuOptype_1),
    .io_ldin_valid_0(ldBuff_io_ldin_valid_0),
    .io_ldin_valid_1(ldBuff_io_ldin_valid_1),
    .io_bufout_data_0(ldBuff_io_bufout_data_0),
    .io_bufout_data_1(ldBuff_io_bufout_data_1),
    .io_bufout_data_2(ldBuff_io_bufout_data_2),
    .io_bufout_data_3(ldBuff_io_bufout_data_3),
    .io_bufout_MatchVec_0(ldBuff_io_bufout_MatchVec_0),
    .io_bufout_MatchVec_1(ldBuff_io_bufout_MatchVec_1),
    .io_bufout_MatchVec_2(ldBuff_io_bufout_MatchVec_2),
    .io_bufout_MatchVec_3(ldBuff_io_bufout_MatchVec_3)
  );
  SA_ROB rob ( // @[matu.scala 143:19]
    .clock(rob_clock),
    .reset(rob_reset),
    .io_MatchVec_0(rob_io_MatchVec_0),
    .io_MatchVec_1(rob_io_MatchVec_1),
    .io_MatchVec_2(rob_io_MatchVec_2),
    .io_MatchVec_3(rob_io_MatchVec_3),
    .io_data_0(rob_io_data_0),
    .io_data_1(rob_io_data_1),
    .io_data_2(rob_io_data_2),
    .io_data_3(rob_io_data_3),
    .io_out_ready(rob_io_out_ready),
    .io_out_valid(rob_io_out_valid),
    .io_out_bits(rob_io_out_bits)
  );
  assign io_out_valid = rob_io_out_valid; // @[matu.scala 153:16]
  assign io_out_bits = rob_io_out_bits; // @[matu.scala 152:15]
  assign ldBuff_clock = clock;
  assign ldBuff_reset = reset;
  assign ldBuff_io_deqptr_0 = io_deqptr_0; // @[matu.scala 146:20]
  assign ldBuff_io_deqptr_1 = io_deqptr_1; // @[matu.scala 146:20]
  assign ldBuff_io_deqptr_2 = io_deqptr_2; // @[matu.scala 146:20]
  assign ldBuff_io_deqptr_3 = io_deqptr_3; // @[matu.scala 146:20]
  assign ldBuff_io_deqptr_4 = io_deqptr_4; // @[matu.scala 146:20]
  assign ldBuff_io_deqptr_5 = io_deqptr_5; // @[matu.scala 146:20]
  assign ldBuff_io_ldin_data_0 = io_ldin_data_0; // @[matu.scala 145:18]
  assign ldBuff_io_ldin_data_1 = io_ldin_data_1; // @[matu.scala 145:18]
  assign ldBuff_io_ldin_robIdx_0 = io_ldin_robIdx_0; // @[matu.scala 145:18]
  assign ldBuff_io_ldin_robIdx_1 = io_ldin_robIdx_1; // @[matu.scala 145:18]
  assign ldBuff_io_ldin_fuOptype_0 = io_ldin_fuOptype_0; // @[matu.scala 145:18]
  assign ldBuff_io_ldin_fuOptype_1 = io_ldin_fuOptype_1; // @[matu.scala 145:18]
  assign ldBuff_io_ldin_valid_0 = io_ldin_valid_0; // @[matu.scala 145:18]
  assign ldBuff_io_ldin_valid_1 = io_ldin_valid_1; // @[matu.scala 145:18]
  assign rob_clock = clock;
  assign rob_reset = reset;
  assign rob_io_MatchVec_0 = ldBuff_io_bufout_MatchVec_0; // @[matu.scala 148:19]
  assign rob_io_MatchVec_1 = ldBuff_io_bufout_MatchVec_1; // @[matu.scala 148:19]
  assign rob_io_MatchVec_2 = ldBuff_io_bufout_MatchVec_2; // @[matu.scala 148:19]
  assign rob_io_MatchVec_3 = ldBuff_io_bufout_MatchVec_3; // @[matu.scala 148:19]
  assign rob_io_data_0 = ldBuff_io_bufout_data_0; // @[matu.scala 149:15]
  assign rob_io_data_1 = ldBuff_io_bufout_data_1; // @[matu.scala 149:15]
  assign rob_io_data_2 = ldBuff_io_bufout_data_2; // @[matu.scala 149:15]
  assign rob_io_data_3 = ldBuff_io_bufout_data_3; // @[matu.scala 149:15]
  assign rob_io_out_ready = io_out_ready; // @[matu.scala 154:20]
endmodule
