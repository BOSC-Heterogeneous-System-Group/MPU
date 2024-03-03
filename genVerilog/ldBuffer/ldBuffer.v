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
  output [5:0]  io_bufout_MatchVec_3,
  output        io_bufout_valid_0,
  output        io_bufout_valid_1,
  output        io_bufout_valid_2,
  output        io_bufout_valid_3,
  input         io_bufout_out_ready,
  output        io_bufout_out_valid,
  output [63:0] io_bufout_out_bits,
  output [5:0]  io_maxMatch
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] data_queue_0_0; // @[matu.scala 184:27]
  reg [63:0] data_queue_0_1; // @[matu.scala 184:27]
  reg [63:0] data_queue_0_2; // @[matu.scala 184:27]
  reg [63:0] data_queue_0_3; // @[matu.scala 184:27]
  reg [63:0] data_queue_1_0; // @[matu.scala 184:27]
  reg [63:0] data_queue_1_1; // @[matu.scala 184:27]
  reg [63:0] data_queue_1_2; // @[matu.scala 184:27]
  reg [63:0] data_queue_1_3; // @[matu.scala 184:27]
  reg [1:0] data_writePtr_0; // @[matu.scala 185:30]
  reg [1:0] data_writePtr_1; // @[matu.scala 185:30]
  reg [4:0] robIdx_queue_0_0; // @[matu.scala 187:41]
  reg [4:0] robIdx_queue_0_1; // @[matu.scala 187:41]
  reg [4:0] robIdx_queue_0_2; // @[matu.scala 187:41]
  reg [4:0] robIdx_queue_0_3; // @[matu.scala 187:41]
  reg [4:0] robIdx_queue_1_0; // @[matu.scala 187:41]
  reg [4:0] robIdx_queue_1_1; // @[matu.scala 187:41]
  reg [4:0] robIdx_queue_1_2; // @[matu.scala 187:41]
  reg [4:0] robIdx_queue_1_3; // @[matu.scala 187:41]
  reg [1:0] robIdx_writePtr_0; // @[matu.scala 188:32]
  reg [1:0] robIdx_writePtr_1; // @[matu.scala 188:32]
  reg  valid_queue_0_0; // @[matu.scala 190:40]
  reg  valid_queue_0_1; // @[matu.scala 190:40]
  reg  valid_queue_0_2; // @[matu.scala 190:40]
  reg  valid_queue_0_3; // @[matu.scala 190:40]
  reg  valid_queue_1_0; // @[matu.scala 190:40]
  reg  valid_queue_1_1; // @[matu.scala 190:40]
  reg  valid_queue_1_2; // @[matu.scala 190:40]
  reg  valid_queue_1_3; // @[matu.scala 190:40]
  reg [1:0] valid_writePtr_0; // @[matu.scala 191:31]
  reg [1:0] valid_writePtr_1; // @[matu.scala 191:31]
  reg [4:0] deqptrReg_0; // @[matu.scala 193:26]
  reg [4:0] deqptrReg_1; // @[matu.scala 193:26]
  reg [4:0] deqptrReg_2; // @[matu.scala 193:26]
  reg [4:0] deqptrReg_3; // @[matu.scala 193:26]
  reg [4:0] deqptrReg_4; // @[matu.scala 193:26]
  reg [4:0] deqptrReg_5; // @[matu.scala 193:26]
  reg [5:0] MatchVec_lastCycle_0_0; // @[matu.scala 196:35]
  reg [5:0] MatchVec_lastCycle_0_1; // @[matu.scala 196:35]
  reg [5:0] MatchVec_lastCycle_0_2; // @[matu.scala 196:35]
  reg [5:0] MatchVec_lastCycle_0_3; // @[matu.scala 196:35]
  reg [5:0] MatchVec_lastCycle_1_0; // @[matu.scala 196:35]
  reg [5:0] MatchVec_lastCycle_1_1; // @[matu.scala 196:35]
  reg [5:0] MatchVec_lastCycle_1_2; // @[matu.scala 196:35]
  reg [5:0] MatchVec_lastCycle_1_3; // @[matu.scala 196:35]
  reg [11:0] MatchVecUInt_0_0; // @[matu.scala 197:29]
  reg [11:0] MatchVecUInt_0_1; // @[matu.scala 197:29]
  reg [11:0] MatchVecUInt_0_2; // @[matu.scala 197:29]
  reg [11:0] MatchVecUInt_0_3; // @[matu.scala 197:29]
  reg [11:0] MatchVecUInt_1_0; // @[matu.scala 197:29]
  reg [11:0] MatchVecUInt_1_1; // @[matu.scala 197:29]
  reg [11:0] MatchVecUInt_1_2; // @[matu.scala 197:29]
  reg [11:0] MatchVecUInt_1_3; // @[matu.scala 197:29]
  wire [1:0] _data_writePtr_0_T_1 = data_writePtr_0 + 2'h1; // @[matu.scala 208:44]
  wire [1:0] _robIdx_writePtr_0_T_1 = robIdx_writePtr_0 + 2'h1; // @[matu.scala 211:48]
  wire [1:0] _valid_writePtr_0_T_1 = valid_writePtr_0 + 2'h1; // @[matu.scala 214:46]
  wire [1:0] _data_writePtr_1_T_1 = data_writePtr_1 + 2'h1; // @[matu.scala 208:44]
  wire [1:0] _robIdx_writePtr_1_T_1 = robIdx_writePtr_1 + 2'h1; // @[matu.scala 211:48]
  wire [1:0] _valid_writePtr_1_T_1 = valid_writePtr_1 + 2'h1; // @[matu.scala 214:46]
  wire  MatchVec_0_0_0 = valid_queue_0_0 & robIdx_queue_0_0 == deqptrReg_0; // @[matu.scala 222:33]
  wire  MatchVec_0_0_1 = valid_queue_0_0 & robIdx_queue_0_0 == deqptrReg_1; // @[matu.scala 222:33]
  wire  MatchVec_0_0_2 = valid_queue_0_0 & robIdx_queue_0_0 == deqptrReg_2; // @[matu.scala 222:33]
  wire  MatchVec_0_0_3 = valid_queue_0_0 & robIdx_queue_0_0 == deqptrReg_3; // @[matu.scala 222:33]
  wire  MatchVec_0_0_4 = valid_queue_0_0 & robIdx_queue_0_0 == deqptrReg_4; // @[matu.scala 222:33]
  wire  MatchVec_0_0_5 = valid_queue_0_0 & robIdx_queue_0_0 == deqptrReg_5; // @[matu.scala 222:33]
  wire  MatchVec_0_1_0 = valid_queue_0_1 & robIdx_queue_0_1 == deqptrReg_0; // @[matu.scala 222:33]
  wire  MatchVec_0_1_1 = valid_queue_0_1 & robIdx_queue_0_1 == deqptrReg_1; // @[matu.scala 222:33]
  wire  MatchVec_0_1_2 = valid_queue_0_1 & robIdx_queue_0_1 == deqptrReg_2; // @[matu.scala 222:33]
  wire  MatchVec_0_1_3 = valid_queue_0_1 & robIdx_queue_0_1 == deqptrReg_3; // @[matu.scala 222:33]
  wire  MatchVec_0_1_4 = valid_queue_0_1 & robIdx_queue_0_1 == deqptrReg_4; // @[matu.scala 222:33]
  wire  MatchVec_0_1_5 = valid_queue_0_1 & robIdx_queue_0_1 == deqptrReg_5; // @[matu.scala 222:33]
  wire  MatchVec_0_2_0 = valid_queue_0_2 & robIdx_queue_0_2 == deqptrReg_0; // @[matu.scala 222:33]
  wire  MatchVec_0_2_1 = valid_queue_0_2 & robIdx_queue_0_2 == deqptrReg_1; // @[matu.scala 222:33]
  wire  MatchVec_0_2_2 = valid_queue_0_2 & robIdx_queue_0_2 == deqptrReg_2; // @[matu.scala 222:33]
  wire  MatchVec_0_2_3 = valid_queue_0_2 & robIdx_queue_0_2 == deqptrReg_3; // @[matu.scala 222:33]
  wire  MatchVec_0_2_4 = valid_queue_0_2 & robIdx_queue_0_2 == deqptrReg_4; // @[matu.scala 222:33]
  wire  MatchVec_0_2_5 = valid_queue_0_2 & robIdx_queue_0_2 == deqptrReg_5; // @[matu.scala 222:33]
  wire  MatchVec_0_3_0 = valid_queue_0_3 & robIdx_queue_0_3 == deqptrReg_0; // @[matu.scala 222:33]
  wire  MatchVec_0_3_1 = valid_queue_0_3 & robIdx_queue_0_3 == deqptrReg_1; // @[matu.scala 222:33]
  wire  MatchVec_0_3_2 = valid_queue_0_3 & robIdx_queue_0_3 == deqptrReg_2; // @[matu.scala 222:33]
  wire  MatchVec_0_3_3 = valid_queue_0_3 & robIdx_queue_0_3 == deqptrReg_3; // @[matu.scala 222:33]
  wire  MatchVec_0_3_4 = valid_queue_0_3 & robIdx_queue_0_3 == deqptrReg_4; // @[matu.scala 222:33]
  wire  MatchVec_0_3_5 = valid_queue_0_3 & robIdx_queue_0_3 == deqptrReg_5; // @[matu.scala 222:33]
  wire  MatchVec_1_0_0 = valid_queue_1_0 & robIdx_queue_1_0 == deqptrReg_0; // @[matu.scala 222:33]
  wire  MatchVec_1_0_1 = valid_queue_1_0 & robIdx_queue_1_0 == deqptrReg_1; // @[matu.scala 222:33]
  wire  MatchVec_1_0_2 = valid_queue_1_0 & robIdx_queue_1_0 == deqptrReg_2; // @[matu.scala 222:33]
  wire  MatchVec_1_0_3 = valid_queue_1_0 & robIdx_queue_1_0 == deqptrReg_3; // @[matu.scala 222:33]
  wire  MatchVec_1_0_4 = valid_queue_1_0 & robIdx_queue_1_0 == deqptrReg_4; // @[matu.scala 222:33]
  wire  MatchVec_1_0_5 = valid_queue_1_0 & robIdx_queue_1_0 == deqptrReg_5; // @[matu.scala 222:33]
  wire  MatchVec_1_1_0 = valid_queue_1_1 & robIdx_queue_1_1 == deqptrReg_0; // @[matu.scala 222:33]
  wire  MatchVec_1_1_1 = valid_queue_1_1 & robIdx_queue_1_1 == deqptrReg_1; // @[matu.scala 222:33]
  wire  MatchVec_1_1_2 = valid_queue_1_1 & robIdx_queue_1_1 == deqptrReg_2; // @[matu.scala 222:33]
  wire  MatchVec_1_1_3 = valid_queue_1_1 & robIdx_queue_1_1 == deqptrReg_3; // @[matu.scala 222:33]
  wire  MatchVec_1_1_4 = valid_queue_1_1 & robIdx_queue_1_1 == deqptrReg_4; // @[matu.scala 222:33]
  wire  MatchVec_1_1_5 = valid_queue_1_1 & robIdx_queue_1_1 == deqptrReg_5; // @[matu.scala 222:33]
  wire  MatchVec_1_2_0 = valid_queue_1_2 & robIdx_queue_1_2 == deqptrReg_0; // @[matu.scala 222:33]
  wire  MatchVec_1_2_1 = valid_queue_1_2 & robIdx_queue_1_2 == deqptrReg_1; // @[matu.scala 222:33]
  wire  MatchVec_1_2_2 = valid_queue_1_2 & robIdx_queue_1_2 == deqptrReg_2; // @[matu.scala 222:33]
  wire  MatchVec_1_2_3 = valid_queue_1_2 & robIdx_queue_1_2 == deqptrReg_3; // @[matu.scala 222:33]
  wire  MatchVec_1_2_4 = valid_queue_1_2 & robIdx_queue_1_2 == deqptrReg_4; // @[matu.scala 222:33]
  wire  MatchVec_1_2_5 = valid_queue_1_2 & robIdx_queue_1_2 == deqptrReg_5; // @[matu.scala 222:33]
  wire  MatchVec_1_3_0 = valid_queue_1_3 & robIdx_queue_1_3 == deqptrReg_0; // @[matu.scala 222:33]
  wire  MatchVec_1_3_1 = valid_queue_1_3 & robIdx_queue_1_3 == deqptrReg_1; // @[matu.scala 222:33]
  wire  MatchVec_1_3_2 = valid_queue_1_3 & robIdx_queue_1_3 == deqptrReg_2; // @[matu.scala 222:33]
  wire  MatchVec_1_3_3 = valid_queue_1_3 & robIdx_queue_1_3 == deqptrReg_3; // @[matu.scala 222:33]
  wire  MatchVec_1_3_4 = valid_queue_1_3 & robIdx_queue_1_3 == deqptrReg_4; // @[matu.scala 222:33]
  wire  MatchVec_1_3_5 = valid_queue_1_3 & robIdx_queue_1_3 == deqptrReg_5; // @[matu.scala 222:33]
  reg [11:0] maxMatch; // @[matu.scala 239:25]
  wire [11:0] _MatchVecMask_0_0_T = ~MatchVecUInt_0_0; // @[matu.scala 281:31]
  wire [11:0] MatchVecMask_0_0 = MatchVecUInt_0_0 == 12'h0 ? _MatchVecMask_0_0_T : MatchVecUInt_0_0; // @[matu.scala 280:40 281:28 283:28]
  wire [11:0] _MatchVecMask_0_1_T = ~MatchVecUInt_0_1; // @[matu.scala 281:31]
  wire [11:0] MatchVecMask_0_1 = MatchVecUInt_0_1 == 12'h0 ? _MatchVecMask_0_1_T : MatchVecUInt_0_1; // @[matu.scala 280:40 281:28 283:28]
  wire [11:0] minMask_0_0_1 = MatchVecMask_0_0 > MatchVecMask_0_1 ? MatchVecMask_0_1 : MatchVecMask_0_0; // @[matu.scala 247:23]
  wire [11:0] _MatchVecMask_0_2_T = ~MatchVecUInt_0_2; // @[matu.scala 281:31]
  wire [11:0] MatchVecMask_0_2 = MatchVecUInt_0_2 == 12'h0 ? _MatchVecMask_0_2_T : MatchVecUInt_0_2; // @[matu.scala 280:40 281:28 283:28]
  wire [11:0] _MatchVecMask_0_3_T = ~MatchVecUInt_0_3; // @[matu.scala 281:31]
  wire [11:0] MatchVecMask_0_3 = MatchVecUInt_0_3 == 12'h0 ? _MatchVecMask_0_3_T : MatchVecUInt_0_3; // @[matu.scala 280:40 281:28 283:28]
  wire [11:0] minMask_0_2_3 = MatchVecMask_0_2 > MatchVecMask_0_3 ? MatchVecMask_0_3 : MatchVecMask_0_2; // @[matu.scala 248:23]
  wire [11:0] minMask_0 = minMask_0_0_1 > minMask_0_2_3 ? minMask_0_2_3 : minMask_0_0_1; // @[matu.scala 249:19]
  wire [11:0] _MatchVecMask_1_0_T = ~MatchVecUInt_1_0; // @[matu.scala 281:31]
  wire [11:0] MatchVecMask_1_0 = MatchVecUInt_1_0 == 12'h0 ? _MatchVecMask_1_0_T : MatchVecUInt_1_0; // @[matu.scala 280:40 281:28 283:28]
  wire [11:0] _MatchVecMask_1_1_T = ~MatchVecUInt_1_1; // @[matu.scala 281:31]
  wire [11:0] MatchVecMask_1_1 = MatchVecUInt_1_1 == 12'h0 ? _MatchVecMask_1_1_T : MatchVecUInt_1_1; // @[matu.scala 280:40 281:28 283:28]
  wire [11:0] minMask_1_0_1 = MatchVecMask_1_0 > MatchVecMask_1_1 ? MatchVecMask_1_1 : MatchVecMask_1_0; // @[matu.scala 251:23]
  wire [11:0] _MatchVecMask_1_2_T = ~MatchVecUInt_1_2; // @[matu.scala 281:31]
  wire [11:0] MatchVecMask_1_2 = MatchVecUInt_1_2 == 12'h0 ? _MatchVecMask_1_2_T : MatchVecUInt_1_2; // @[matu.scala 280:40 281:28 283:28]
  wire [11:0] _MatchVecMask_1_3_T = ~MatchVecUInt_1_3; // @[matu.scala 281:31]
  wire [11:0] MatchVecMask_1_3 = MatchVecUInt_1_3 == 12'h0 ? _MatchVecMask_1_3_T : MatchVecUInt_1_3; // @[matu.scala 280:40 281:28 283:28]
  wire [11:0] minMask_1_2_3 = MatchVecMask_1_2 > MatchVecMask_1_3 ? MatchVecMask_1_3 : MatchVecMask_1_2; // @[matu.scala 252:23]
  wire [11:0] minMask_1 = minMask_1_0_1 > minMask_1_2_3 ? minMask_1_2_3 : minMask_1_0_1; // @[matu.scala 253:19]
  wire [11:0] minMask = minMask_0 > minMask_1 ? minMask_1 : minMask_0; // @[matu.scala 255:17]
  wire [11:0] maxMatch_0_0_1 = MatchVecUInt_0_0 < MatchVecUInt_0_1 ? MatchVecUInt_0_1 : MatchVecUInt_0_0; // @[matu.scala 257:24]
  wire [11:0] maxMatch_0_2_3 = MatchVecUInt_0_2 < MatchVecUInt_0_3 ? MatchVecUInt_0_3 : MatchVecUInt_0_2; // @[matu.scala 258:24]
  wire [11:0] maxMatch_0 = maxMatch_0_0_1 < maxMatch_0_2_3 ? maxMatch_0_2_3 : maxMatch_0_0_1; // @[matu.scala 259:20]
  wire [11:0] maxMatch_1_0_1 = MatchVecUInt_1_0 < MatchVecUInt_1_1 ? MatchVecUInt_1_1 : MatchVecUInt_1_0; // @[matu.scala 261:24]
  wire [11:0] maxMatch_1_2_3 = MatchVecUInt_1_2 < MatchVecUInt_1_3 ? MatchVecUInt_1_3 : MatchVecUInt_1_2; // @[matu.scala 262:24]
  wire [11:0] maxMatch_1 = maxMatch_1_0_1 < maxMatch_1_2_3 ? maxMatch_1_2_3 : maxMatch_1_0_1; // @[matu.scala 263:20]
  wire [5:0] _T_102 = {MatchVec_0_0_5,MatchVec_0_0_4,MatchVec_0_0_3,MatchVec_0_0_2,MatchVec_0_0_1,MatchVec_0_0_0}; // @[matu.scala 270:27]
  wire  _T_103 = _T_102 > 6'h0; // @[matu.scala 270:34]
  wire [11:0] _GEN_174 = {{6'd0}, _T_102}; // @[matu.scala 271:53]
  wire [11:0] _MatchVecUInt_0_0_T_2 = _GEN_174 + maxMatch; // @[matu.scala 271:53]
  wire [5:0] _T_108 = {MatchVec_0_1_5,MatchVec_0_1_4,MatchVec_0_1_3,MatchVec_0_1_2,MatchVec_0_1_1,MatchVec_0_1_0}; // @[matu.scala 270:27]
  wire  _T_109 = _T_108 > 6'h0; // @[matu.scala 270:34]
  wire [11:0] _GEN_175 = {{6'd0}, _T_108}; // @[matu.scala 271:53]
  wire [11:0] _MatchVecUInt_0_1_T_2 = _GEN_175 + maxMatch; // @[matu.scala 271:53]
  wire [5:0] _T_114 = {MatchVec_0_2_5,MatchVec_0_2_4,MatchVec_0_2_3,MatchVec_0_2_2,MatchVec_0_2_1,MatchVec_0_2_0}; // @[matu.scala 270:27]
  wire  _T_115 = _T_114 > 6'h0; // @[matu.scala 270:34]
  wire [11:0] _GEN_176 = {{6'd0}, _T_114}; // @[matu.scala 271:53]
  wire [11:0] _MatchVecUInt_0_2_T_2 = _GEN_176 + maxMatch; // @[matu.scala 271:53]
  wire [5:0] _T_120 = {MatchVec_0_3_5,MatchVec_0_3_4,MatchVec_0_3_3,MatchVec_0_3_2,MatchVec_0_3_1,MatchVec_0_3_0}; // @[matu.scala 270:27]
  wire  _T_121 = _T_120 > 6'h0; // @[matu.scala 270:34]
  wire [11:0] _GEN_177 = {{6'd0}, _T_120}; // @[matu.scala 271:53]
  wire [11:0] _MatchVecUInt_0_3_T_2 = _GEN_177 + maxMatch; // @[matu.scala 271:53]
  wire [5:0] _T_126 = {MatchVec_1_0_5,MatchVec_1_0_4,MatchVec_1_0_3,MatchVec_1_0_2,MatchVec_1_0_1,MatchVec_1_0_0}; // @[matu.scala 270:27]
  wire  _T_127 = _T_126 > 6'h0; // @[matu.scala 270:34]
  wire [11:0] _GEN_178 = {{6'd0}, _T_126}; // @[matu.scala 271:53]
  wire [11:0] _MatchVecUInt_1_0_T_2 = _GEN_178 + maxMatch; // @[matu.scala 271:53]
  wire [5:0] _T_132 = {MatchVec_1_1_5,MatchVec_1_1_4,MatchVec_1_1_3,MatchVec_1_1_2,MatchVec_1_1_1,MatchVec_1_1_0}; // @[matu.scala 270:27]
  wire  _T_133 = _T_132 > 6'h0; // @[matu.scala 270:34]
  wire [11:0] _GEN_179 = {{6'd0}, _T_132}; // @[matu.scala 271:53]
  wire [11:0] _MatchVecUInt_1_1_T_2 = _GEN_179 + maxMatch; // @[matu.scala 271:53]
  wire [5:0] _T_138 = {MatchVec_1_2_5,MatchVec_1_2_4,MatchVec_1_2_3,MatchVec_1_2_2,MatchVec_1_2_1,MatchVec_1_2_0}; // @[matu.scala 270:27]
  wire  _T_139 = _T_138 > 6'h0; // @[matu.scala 270:34]
  wire [11:0] _GEN_180 = {{6'd0}, _T_138}; // @[matu.scala 271:53]
  wire [11:0] _MatchVecUInt_1_2_T_2 = _GEN_180 + maxMatch; // @[matu.scala 271:53]
  wire [5:0] _T_144 = {MatchVec_1_3_5,MatchVec_1_3_4,MatchVec_1_3_3,MatchVec_1_3_2,MatchVec_1_3_1,MatchVec_1_3_0}; // @[matu.scala 270:27]
  wire  _T_145 = _T_144 > 6'h0; // @[matu.scala 270:34]
  wire [11:0] _GEN_181 = {{6'd0}, _T_144}; // @[matu.scala 271:53]
  wire [11:0] _MatchVecUInt_1_3_T_2 = _GEN_181 + maxMatch; // @[matu.scala 271:53]
  wire  minIndex_i = minMask == MatchVecMask_1_3 & MatchVecMask_1_3 < 12'hfff | (minMask == MatchVecMask_1_2 &
    MatchVecMask_1_2 < 12'hfff | (minMask == MatchVecMask_1_1 & MatchVecMask_1_1 < 12'hfff | minMask == MatchVecMask_1_0
     & MatchVecMask_1_0 < 12'hfff)); // @[matu.scala 290:77 291:20]
  wire [1:0] _GEN_140 = minMask == MatchVecMask_0_1 & MatchVecMask_0_1 < 12'hfff ? 2'h1 : 2'h0; // @[matu.scala 290:77 292:20]
  wire [1:0] _GEN_145 = minMask == MatchVecMask_0_2 & MatchVecMask_0_2 < 12'hfff ? 2'h2 : _GEN_140; // @[matu.scala 290:77 292:20]
  wire [1:0] _GEN_150 = minMask == MatchVecMask_0_3 & MatchVecMask_0_3 < 12'hfff ? 2'h3 : _GEN_145; // @[matu.scala 290:77 292:20]
  wire [1:0] _GEN_155 = minMask == MatchVecMask_1_0 & MatchVecMask_1_0 < 12'hfff ? 2'h0 : _GEN_150; // @[matu.scala 290:77 292:20]
  wire [1:0] _GEN_160 = minMask == MatchVecMask_1_1 & MatchVecMask_1_1 < 12'hfff ? 2'h1 : _GEN_155; // @[matu.scala 290:77 292:20]
  wire [1:0] _GEN_165 = minMask == MatchVecMask_1_2 & MatchVecMask_1_2 < 12'hfff ? 2'h2 : _GEN_160; // @[matu.scala 290:77 292:20]
  wire [1:0] minIndex_j = minMask == MatchVecMask_1_3 & MatchVecMask_1_3 < 12'hfff ? 2'h3 : _GEN_165; // @[matu.scala 290:77 292:20]
  wire [63:0] _GEN_127 = ~minIndex_i & 2'h1 == minIndex_j ? data_queue_0_1 : data_queue_0_0; // @[matu.scala 295:{17,17}]
  wire [63:0] _GEN_128 = ~minIndex_i & 2'h2 == minIndex_j ? data_queue_0_2 : _GEN_127; // @[matu.scala 295:{17,17}]
  wire [63:0] _GEN_129 = ~minIndex_i & 2'h3 == minIndex_j ? data_queue_0_3 : _GEN_128; // @[matu.scala 295:{17,17}]
  wire [63:0] _GEN_130 = minIndex_i & 2'h0 == minIndex_j ? data_queue_1_0 : _GEN_129; // @[matu.scala 295:{17,17}]
  wire [63:0] _GEN_131 = minIndex_i & 2'h1 == minIndex_j ? data_queue_1_1 : _GEN_130; // @[matu.scala 295:{17,17}]
  wire [63:0] _GEN_132 = minIndex_i & 2'h2 == minIndex_j ? data_queue_1_2 : _GEN_131; // @[matu.scala 295:{17,17}]
  wire [63:0] _GEN_133 = minIndex_i & 2'h3 == minIndex_j ? data_queue_1_3 : _GEN_132; // @[matu.scala 295:{17,17}]
  wire [63:0] _GEN_138 = minMask == MatchVecMask_0_0 & MatchVecMask_0_0 < 12'hfff ? _GEN_133 : 64'h0; // @[matu.scala 290:77 295:17]
  wire [63:0] _GEN_143 = minMask == MatchVecMask_0_1 & MatchVecMask_0_1 < 12'hfff ? _GEN_133 : _GEN_138; // @[matu.scala 290:77 295:17]
  wire [63:0] _GEN_148 = minMask == MatchVecMask_0_2 & MatchVecMask_0_2 < 12'hfff ? _GEN_133 : _GEN_143; // @[matu.scala 290:77 295:17]
  wire [63:0] _GEN_153 = minMask == MatchVecMask_0_3 & MatchVecMask_0_3 < 12'hfff ? _GEN_133 : _GEN_148; // @[matu.scala 290:77 295:17]
  wire [63:0] _GEN_158 = minMask == MatchVecMask_1_0 & MatchVecMask_1_0 < 12'hfff ? _GEN_133 : _GEN_153; // @[matu.scala 290:77 295:17]
  wire [63:0] _GEN_163 = minMask == MatchVecMask_1_1 & MatchVecMask_1_1 < 12'hfff ? _GEN_133 : _GEN_158; // @[matu.scala 290:77 295:17]
  wire [63:0] _GEN_168 = minMask == MatchVecMask_1_2 & MatchVecMask_1_2 < 12'hfff ? _GEN_133 : _GEN_163; // @[matu.scala 290:77 295:17]
  wire [11:0] _GEN_192 = reset ? 12'h0 : MatchVecUInt_0_0; // @[matu.scala 196:{35,35} 203:22]
  wire [11:0] _GEN_193 = reset ? 12'h0 : MatchVecUInt_0_1; // @[matu.scala 196:{35,35} 203:22]
  wire [11:0] _GEN_194 = reset ? 12'h0 : MatchVecUInt_0_2; // @[matu.scala 196:{35,35} 203:22]
  wire [11:0] _GEN_195 = reset ? 12'h0 : MatchVecUInt_0_3; // @[matu.scala 196:{35,35} 203:22]
  wire [11:0] _GEN_196 = reset ? 12'h0 : MatchVecUInt_1_0; // @[matu.scala 196:{35,35} 203:22]
  wire [11:0] _GEN_197 = reset ? 12'h0 : MatchVecUInt_1_1; // @[matu.scala 196:{35,35} 203:22]
  wire [11:0] _GEN_198 = reset ? 12'h0 : MatchVecUInt_1_2; // @[matu.scala 196:{35,35} 203:22]
  wire [11:0] _GEN_199 = reset ? 12'h0 : MatchVecUInt_1_3; // @[matu.scala 196:{35,35} 203:22]
  assign io_bufout_data_0 = 64'h0; // @[matu.scala 303:23]
  assign io_bufout_data_1 = 64'h0; // @[matu.scala 303:23]
  assign io_bufout_data_2 = 64'h0; // @[matu.scala 303:23]
  assign io_bufout_data_3 = 64'h0; // @[matu.scala 303:23]
  assign io_bufout_MatchVec_0 = 6'h0; // @[matu.scala 304:27]
  assign io_bufout_MatchVec_1 = 6'h0; // @[matu.scala 304:27]
  assign io_bufout_MatchVec_2 = 6'h0; // @[matu.scala 304:27]
  assign io_bufout_MatchVec_3 = 6'h0; // @[matu.scala 304:27]
  assign io_bufout_valid_0 = 1'h1; // @[matu.scala 302:24]
  assign io_bufout_valid_1 = 1'h1; // @[matu.scala 302:24]
  assign io_bufout_valid_2 = 1'h1; // @[matu.scala 302:24]
  assign io_bufout_valid_3 = 1'h1; // @[matu.scala 302:24]
  assign io_bufout_out_valid = minMask < 12'hfff; // @[matu.scala 300:34]
  assign io_bufout_out_bits = minMask == MatchVecMask_1_3 & MatchVecMask_1_3 < 12'hfff ? _GEN_133 : _GEN_168; // @[matu.scala 290:77 295:17]
  assign io_maxMatch = maxMatch[5:0]; // @[matu.scala 266:15]
  always @(posedge clock) begin
    if (reset) begin // @[matu.scala 184:27]
      data_queue_0_0 <= 64'h0; // @[matu.scala 184:27]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h0 == data_writePtr_0) begin // @[matu.scala 209:38]
        data_queue_0_0 <= io_ldin_data_0; // @[matu.scala 209:38]
      end
    end
    if (reset) begin // @[matu.scala 184:27]
      data_queue_0_1 <= 64'h0; // @[matu.scala 184:27]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h1 == data_writePtr_0) begin // @[matu.scala 209:38]
        data_queue_0_1 <= io_ldin_data_0; // @[matu.scala 209:38]
      end
    end
    if (reset) begin // @[matu.scala 184:27]
      data_queue_0_2 <= 64'h0; // @[matu.scala 184:27]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h2 == data_writePtr_0) begin // @[matu.scala 209:38]
        data_queue_0_2 <= io_ldin_data_0; // @[matu.scala 209:38]
      end
    end
    if (reset) begin // @[matu.scala 184:27]
      data_queue_0_3 <= 64'h0; // @[matu.scala 184:27]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h3 == data_writePtr_0) begin // @[matu.scala 209:38]
        data_queue_0_3 <= io_ldin_data_0; // @[matu.scala 209:38]
      end
    end
    if (reset) begin // @[matu.scala 184:27]
      data_queue_1_0 <= 64'h0; // @[matu.scala 184:27]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h0 == data_writePtr_1) begin // @[matu.scala 209:38]
        data_queue_1_0 <= io_ldin_data_1; // @[matu.scala 209:38]
      end
    end
    if (reset) begin // @[matu.scala 184:27]
      data_queue_1_1 <= 64'h0; // @[matu.scala 184:27]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h1 == data_writePtr_1) begin // @[matu.scala 209:38]
        data_queue_1_1 <= io_ldin_data_1; // @[matu.scala 209:38]
      end
    end
    if (reset) begin // @[matu.scala 184:27]
      data_queue_1_2 <= 64'h0; // @[matu.scala 184:27]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h2 == data_writePtr_1) begin // @[matu.scala 209:38]
        data_queue_1_2 <= io_ldin_data_1; // @[matu.scala 209:38]
      end
    end
    if (reset) begin // @[matu.scala 184:27]
      data_queue_1_3 <= 64'h0; // @[matu.scala 184:27]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h3 == data_writePtr_1) begin // @[matu.scala 209:38]
        data_queue_1_3 <= io_ldin_data_1; // @[matu.scala 209:38]
      end
    end
    if (reset) begin // @[matu.scala 185:30]
      data_writePtr_0 <= 2'h0; // @[matu.scala 185:30]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      data_writePtr_0 <= _data_writePtr_0_T_1; // @[matu.scala 208:24]
    end
    if (reset) begin // @[matu.scala 185:30]
      data_writePtr_1 <= 2'h0; // @[matu.scala 185:30]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      data_writePtr_1 <= _data_writePtr_1_T_1; // @[matu.scala 208:24]
    end
    if (reset) begin // @[matu.scala 187:41]
      robIdx_queue_0_0 <= 5'h0; // @[matu.scala 187:41]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h0 == robIdx_writePtr_0) begin // @[matu.scala 212:43]
        robIdx_queue_0_0 <= io_ldin_robIdx_0; // @[matu.scala 212:43]
      end
    end
    if (reset) begin // @[matu.scala 187:41]
      robIdx_queue_0_1 <= 5'h0; // @[matu.scala 187:41]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h1 == robIdx_writePtr_0) begin // @[matu.scala 212:43]
        robIdx_queue_0_1 <= io_ldin_robIdx_0; // @[matu.scala 212:43]
      end
    end
    if (reset) begin // @[matu.scala 187:41]
      robIdx_queue_0_2 <= 5'h0; // @[matu.scala 187:41]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h2 == robIdx_writePtr_0) begin // @[matu.scala 212:43]
        robIdx_queue_0_2 <= io_ldin_robIdx_0; // @[matu.scala 212:43]
      end
    end
    if (reset) begin // @[matu.scala 187:41]
      robIdx_queue_0_3 <= 5'h0; // @[matu.scala 187:41]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h3 == robIdx_writePtr_0) begin // @[matu.scala 212:43]
        robIdx_queue_0_3 <= io_ldin_robIdx_0; // @[matu.scala 212:43]
      end
    end
    if (reset) begin // @[matu.scala 187:41]
      robIdx_queue_1_0 <= 5'h0; // @[matu.scala 187:41]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h0 == robIdx_writePtr_1) begin // @[matu.scala 212:43]
        robIdx_queue_1_0 <= io_ldin_robIdx_1; // @[matu.scala 212:43]
      end
    end
    if (reset) begin // @[matu.scala 187:41]
      robIdx_queue_1_1 <= 5'h0; // @[matu.scala 187:41]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h1 == robIdx_writePtr_1) begin // @[matu.scala 212:43]
        robIdx_queue_1_1 <= io_ldin_robIdx_1; // @[matu.scala 212:43]
      end
    end
    if (reset) begin // @[matu.scala 187:41]
      robIdx_queue_1_2 <= 5'h0; // @[matu.scala 187:41]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h2 == robIdx_writePtr_1) begin // @[matu.scala 212:43]
        robIdx_queue_1_2 <= io_ldin_robIdx_1; // @[matu.scala 212:43]
      end
    end
    if (reset) begin // @[matu.scala 187:41]
      robIdx_queue_1_3 <= 5'h0; // @[matu.scala 187:41]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h3 == robIdx_writePtr_1) begin // @[matu.scala 212:43]
        robIdx_queue_1_3 <= io_ldin_robIdx_1; // @[matu.scala 212:43]
      end
    end
    if (reset) begin // @[matu.scala 188:32]
      robIdx_writePtr_0 <= 2'h0; // @[matu.scala 188:32]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      robIdx_writePtr_0 <= _robIdx_writePtr_0_T_1; // @[matu.scala 211:26]
    end
    if (reset) begin // @[matu.scala 188:32]
      robIdx_writePtr_1 <= 2'h0; // @[matu.scala 188:32]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      robIdx_writePtr_1 <= _robIdx_writePtr_1_T_1; // @[matu.scala 211:26]
    end
    if (reset) begin // @[matu.scala 190:40]
      valid_queue_0_0 <= 1'h0; // @[matu.scala 190:40]
    end else if (minMask == MatchVecMask_0_0 & MatchVecMask_0_0 < 12'hfff) begin // @[matu.scala 290:77]
      valid_queue_0_0 <= 1'h0; // @[matu.scala 293:27]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h0 == valid_writePtr_0) begin // @[matu.scala 215:41]
        valid_queue_0_0 <= io_ldin_valid_0; // @[matu.scala 215:41]
      end
    end
    if (reset) begin // @[matu.scala 190:40]
      valid_queue_0_1 <= 1'h0; // @[matu.scala 190:40]
    end else if (minMask == MatchVecMask_0_1 & MatchVecMask_0_1 < 12'hfff) begin // @[matu.scala 290:77]
      valid_queue_0_1 <= 1'h0; // @[matu.scala 293:27]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h1 == valid_writePtr_0) begin // @[matu.scala 215:41]
        valid_queue_0_1 <= io_ldin_valid_0; // @[matu.scala 215:41]
      end
    end
    if (reset) begin // @[matu.scala 190:40]
      valid_queue_0_2 <= 1'h0; // @[matu.scala 190:40]
    end else if (minMask == MatchVecMask_0_2 & MatchVecMask_0_2 < 12'hfff) begin // @[matu.scala 290:77]
      valid_queue_0_2 <= 1'h0; // @[matu.scala 293:27]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h2 == valid_writePtr_0) begin // @[matu.scala 215:41]
        valid_queue_0_2 <= io_ldin_valid_0; // @[matu.scala 215:41]
      end
    end
    if (reset) begin // @[matu.scala 190:40]
      valid_queue_0_3 <= 1'h0; // @[matu.scala 190:40]
    end else if (minMask == MatchVecMask_0_3 & MatchVecMask_0_3 < 12'hfff) begin // @[matu.scala 290:77]
      valid_queue_0_3 <= 1'h0; // @[matu.scala 293:27]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      if (2'h3 == valid_writePtr_0) begin // @[matu.scala 215:41]
        valid_queue_0_3 <= io_ldin_valid_0; // @[matu.scala 215:41]
      end
    end
    if (reset) begin // @[matu.scala 190:40]
      valid_queue_1_0 <= 1'h0; // @[matu.scala 190:40]
    end else if (minMask == MatchVecMask_1_0 & MatchVecMask_1_0 < 12'hfff) begin // @[matu.scala 290:77]
      valid_queue_1_0 <= 1'h0; // @[matu.scala 293:27]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h0 == valid_writePtr_1) begin // @[matu.scala 215:41]
        valid_queue_1_0 <= io_ldin_valid_1; // @[matu.scala 215:41]
      end
    end
    if (reset) begin // @[matu.scala 190:40]
      valid_queue_1_1 <= 1'h0; // @[matu.scala 190:40]
    end else if (minMask == MatchVecMask_1_1 & MatchVecMask_1_1 < 12'hfff) begin // @[matu.scala 290:77]
      valid_queue_1_1 <= 1'h0; // @[matu.scala 293:27]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h1 == valid_writePtr_1) begin // @[matu.scala 215:41]
        valid_queue_1_1 <= io_ldin_valid_1; // @[matu.scala 215:41]
      end
    end
    if (reset) begin // @[matu.scala 190:40]
      valid_queue_1_2 <= 1'h0; // @[matu.scala 190:40]
    end else if (minMask == MatchVecMask_1_2 & MatchVecMask_1_2 < 12'hfff) begin // @[matu.scala 290:77]
      valid_queue_1_2 <= 1'h0; // @[matu.scala 293:27]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h2 == valid_writePtr_1) begin // @[matu.scala 215:41]
        valid_queue_1_2 <= io_ldin_valid_1; // @[matu.scala 215:41]
      end
    end
    if (reset) begin // @[matu.scala 190:40]
      valid_queue_1_3 <= 1'h0; // @[matu.scala 190:40]
    end else if (minMask == MatchVecMask_1_3 & MatchVecMask_1_3 < 12'hfff) begin // @[matu.scala 290:77]
      valid_queue_1_3 <= 1'h0; // @[matu.scala 293:27]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      if (2'h3 == valid_writePtr_1) begin // @[matu.scala 215:41]
        valid_queue_1_3 <= io_ldin_valid_1; // @[matu.scala 215:41]
      end
    end
    if (reset) begin // @[matu.scala 191:31]
      valid_writePtr_0 <= 2'h0; // @[matu.scala 191:31]
    end else if (io_ldin_fuOptype_0 == 3'h7 & io_ldin_valid_0) begin // @[matu.scala 207:73]
      valid_writePtr_0 <= _valid_writePtr_0_T_1; // @[matu.scala 214:25]
    end
    if (reset) begin // @[matu.scala 191:31]
      valid_writePtr_1 <= 2'h0; // @[matu.scala 191:31]
    end else if (io_ldin_fuOptype_1 == 3'h7 & io_ldin_valid_1) begin // @[matu.scala 207:73]
      valid_writePtr_1 <= _valid_writePtr_1_T_1; // @[matu.scala 214:25]
    end
    if (reset) begin // @[matu.scala 193:26]
      deqptrReg_0 <= 5'h0; // @[matu.scala 193:26]
    end else begin
      deqptrReg_0 <= io_deqptr_0; // @[matu.scala 202:13]
    end
    if (reset) begin // @[matu.scala 193:26]
      deqptrReg_1 <= 5'h0; // @[matu.scala 193:26]
    end else begin
      deqptrReg_1 <= io_deqptr_1; // @[matu.scala 202:13]
    end
    if (reset) begin // @[matu.scala 193:26]
      deqptrReg_2 <= 5'h0; // @[matu.scala 193:26]
    end else begin
      deqptrReg_2 <= io_deqptr_2; // @[matu.scala 202:13]
    end
    if (reset) begin // @[matu.scala 193:26]
      deqptrReg_3 <= 5'h0; // @[matu.scala 193:26]
    end else begin
      deqptrReg_3 <= io_deqptr_3; // @[matu.scala 202:13]
    end
    if (reset) begin // @[matu.scala 193:26]
      deqptrReg_4 <= 5'h0; // @[matu.scala 193:26]
    end else begin
      deqptrReg_4 <= io_deqptr_4; // @[matu.scala 202:13]
    end
    if (reset) begin // @[matu.scala 193:26]
      deqptrReg_5 <= 5'h0; // @[matu.scala 193:26]
    end else begin
      deqptrReg_5 <= io_deqptr_5; // @[matu.scala 202:13]
    end
    MatchVec_lastCycle_0_0 <= _GEN_192[5:0]; // @[matu.scala 196:{35,35} 203:22]
    MatchVec_lastCycle_0_1 <= _GEN_193[5:0]; // @[matu.scala 196:{35,35} 203:22]
    MatchVec_lastCycle_0_2 <= _GEN_194[5:0]; // @[matu.scala 196:{35,35} 203:22]
    MatchVec_lastCycle_0_3 <= _GEN_195[5:0]; // @[matu.scala 196:{35,35} 203:22]
    MatchVec_lastCycle_1_0 <= _GEN_196[5:0]; // @[matu.scala 196:{35,35} 203:22]
    MatchVec_lastCycle_1_1 <= _GEN_197[5:0]; // @[matu.scala 196:{35,35} 203:22]
    MatchVec_lastCycle_1_2 <= _GEN_198[5:0]; // @[matu.scala 196:{35,35} 203:22]
    MatchVec_lastCycle_1_3 <= _GEN_199[5:0]; // @[matu.scala 196:{35,35} 203:22]
    if (reset) begin // @[matu.scala 197:29]
      MatchVecUInt_0_0 <= 12'h0; // @[matu.scala 197:29]
    end else if (minMask == MatchVecMask_0_0 & MatchVecMask_0_0 < 12'hfff) begin // @[matu.scala 290:77]
      MatchVecUInt_0_0 <= 12'h0; // @[matu.scala 294:28]
    end else if (_T_102 > 6'h0 & MatchVec_lastCycle_0_0 == 6'h0) begin // @[matu.scala 270:77]
      MatchVecUInt_0_0 <= _MatchVecUInt_0_0_T_2; // @[matu.scala 271:28]
    end else if (_T_103) begin // @[matu.scala 272:47]
      MatchVecUInt_0_0 <= {{6'd0}, _T_102}; // @[matu.scala 273:28]
    end
    if (reset) begin // @[matu.scala 197:29]
      MatchVecUInt_0_1 <= 12'h0; // @[matu.scala 197:29]
    end else if (minMask == MatchVecMask_0_1 & MatchVecMask_0_1 < 12'hfff) begin // @[matu.scala 290:77]
      MatchVecUInt_0_1 <= 12'h0; // @[matu.scala 294:28]
    end else if (_T_108 > 6'h0 & MatchVec_lastCycle_0_1 == 6'h0) begin // @[matu.scala 270:77]
      MatchVecUInt_0_1 <= _MatchVecUInt_0_1_T_2; // @[matu.scala 271:28]
    end else if (_T_109) begin // @[matu.scala 272:47]
      MatchVecUInt_0_1 <= {{6'd0}, _T_108}; // @[matu.scala 273:28]
    end
    if (reset) begin // @[matu.scala 197:29]
      MatchVecUInt_0_2 <= 12'h0; // @[matu.scala 197:29]
    end else if (minMask == MatchVecMask_0_2 & MatchVecMask_0_2 < 12'hfff) begin // @[matu.scala 290:77]
      MatchVecUInt_0_2 <= 12'h0; // @[matu.scala 294:28]
    end else if (_T_114 > 6'h0 & MatchVec_lastCycle_0_2 == 6'h0) begin // @[matu.scala 270:77]
      MatchVecUInt_0_2 <= _MatchVecUInt_0_2_T_2; // @[matu.scala 271:28]
    end else if (_T_115) begin // @[matu.scala 272:47]
      MatchVecUInt_0_2 <= {{6'd0}, _T_114}; // @[matu.scala 273:28]
    end
    if (reset) begin // @[matu.scala 197:29]
      MatchVecUInt_0_3 <= 12'h0; // @[matu.scala 197:29]
    end else if (minMask == MatchVecMask_0_3 & MatchVecMask_0_3 < 12'hfff) begin // @[matu.scala 290:77]
      MatchVecUInt_0_3 <= 12'h0; // @[matu.scala 294:28]
    end else if (_T_120 > 6'h0 & MatchVec_lastCycle_0_3 == 6'h0) begin // @[matu.scala 270:77]
      MatchVecUInt_0_3 <= _MatchVecUInt_0_3_T_2; // @[matu.scala 271:28]
    end else if (_T_121) begin // @[matu.scala 272:47]
      MatchVecUInt_0_3 <= {{6'd0}, _T_120}; // @[matu.scala 273:28]
    end
    if (reset) begin // @[matu.scala 197:29]
      MatchVecUInt_1_0 <= 12'h0; // @[matu.scala 197:29]
    end else if (minMask == MatchVecMask_1_0 & MatchVecMask_1_0 < 12'hfff) begin // @[matu.scala 290:77]
      MatchVecUInt_1_0 <= 12'h0; // @[matu.scala 294:28]
    end else if (_T_126 > 6'h0 & MatchVec_lastCycle_1_0 == 6'h0) begin // @[matu.scala 270:77]
      MatchVecUInt_1_0 <= _MatchVecUInt_1_0_T_2; // @[matu.scala 271:28]
    end else if (_T_127) begin // @[matu.scala 272:47]
      MatchVecUInt_1_0 <= {{6'd0}, _T_126}; // @[matu.scala 273:28]
    end
    if (reset) begin // @[matu.scala 197:29]
      MatchVecUInt_1_1 <= 12'h0; // @[matu.scala 197:29]
    end else if (minMask == MatchVecMask_1_1 & MatchVecMask_1_1 < 12'hfff) begin // @[matu.scala 290:77]
      MatchVecUInt_1_1 <= 12'h0; // @[matu.scala 294:28]
    end else if (_T_132 > 6'h0 & MatchVec_lastCycle_1_1 == 6'h0) begin // @[matu.scala 270:77]
      MatchVecUInt_1_1 <= _MatchVecUInt_1_1_T_2; // @[matu.scala 271:28]
    end else if (_T_133) begin // @[matu.scala 272:47]
      MatchVecUInt_1_1 <= {{6'd0}, _T_132}; // @[matu.scala 273:28]
    end
    if (reset) begin // @[matu.scala 197:29]
      MatchVecUInt_1_2 <= 12'h0; // @[matu.scala 197:29]
    end else if (minMask == MatchVecMask_1_2 & MatchVecMask_1_2 < 12'hfff) begin // @[matu.scala 290:77]
      MatchVecUInt_1_2 <= 12'h0; // @[matu.scala 294:28]
    end else if (_T_138 > 6'h0 & MatchVec_lastCycle_1_2 == 6'h0) begin // @[matu.scala 270:77]
      MatchVecUInt_1_2 <= _MatchVecUInt_1_2_T_2; // @[matu.scala 271:28]
    end else if (_T_139) begin // @[matu.scala 272:47]
      MatchVecUInt_1_2 <= {{6'd0}, _T_138}; // @[matu.scala 273:28]
    end
    if (reset) begin // @[matu.scala 197:29]
      MatchVecUInt_1_3 <= 12'h0; // @[matu.scala 197:29]
    end else if (minMask == MatchVecMask_1_3 & MatchVecMask_1_3 < 12'hfff) begin // @[matu.scala 290:77]
      MatchVecUInt_1_3 <= 12'h0; // @[matu.scala 294:28]
    end else if (_T_144 > 6'h0 & MatchVec_lastCycle_1_3 == 6'h0) begin // @[matu.scala 270:77]
      MatchVecUInt_1_3 <= _MatchVecUInt_1_3_T_2; // @[matu.scala 271:28]
    end else if (_T_145) begin // @[matu.scala 272:47]
      MatchVecUInt_1_3 <= {{6'd0}, _T_144}; // @[matu.scala 273:28]
    end
    if (reset) begin // @[matu.scala 239:25]
      maxMatch <= 12'h0; // @[matu.scala 239:25]
    end else if (maxMatch_0 < maxMatch_1) begin // @[matu.scala 265:18]
      if (maxMatch_1_0_1 < maxMatch_1_2_3) begin // @[matu.scala 263:20]
        if (MatchVecUInt_1_2 < MatchVecUInt_1_3) begin // @[matu.scala 262:24]
          maxMatch <= MatchVecUInt_1_3;
        end else begin
          maxMatch <= MatchVecUInt_1_2;
        end
      end else if (MatchVecUInt_1_0 < MatchVecUInt_1_1) begin // @[matu.scala 261:24]
        maxMatch <= MatchVecUInt_1_1;
      end else begin
        maxMatch <= MatchVecUInt_1_0;
      end
    end else if (maxMatch_0_0_1 < maxMatch_0_2_3) begin // @[matu.scala 259:20]
      if (MatchVecUInt_0_2 < MatchVecUInt_0_3) begin // @[matu.scala 258:24]
        maxMatch <= MatchVecUInt_0_3;
      end else begin
        maxMatch <= MatchVecUInt_0_2;
      end
    end else if (MatchVecUInt_0_0 < MatchVecUInt_0_1) begin // @[matu.scala 257:24]
      maxMatch <= MatchVecUInt_0_1;
    end else begin
      maxMatch <= MatchVecUInt_0_0;
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
  data_queue_0_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  data_queue_0_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  data_queue_0_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  data_queue_0_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  data_queue_1_0 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  data_queue_1_1 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  data_queue_1_2 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  data_queue_1_3 = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  data_writePtr_0 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  data_writePtr_1 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  robIdx_queue_0_0 = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  robIdx_queue_0_1 = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  robIdx_queue_0_2 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  robIdx_queue_0_3 = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  robIdx_queue_1_0 = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  robIdx_queue_1_1 = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  robIdx_queue_1_2 = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  robIdx_queue_1_3 = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  robIdx_writePtr_0 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  robIdx_writePtr_1 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  valid_queue_0_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  valid_queue_0_1 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  valid_queue_0_2 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  valid_queue_0_3 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  valid_queue_1_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  valid_queue_1_1 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  valid_queue_1_2 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  valid_queue_1_3 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  valid_writePtr_0 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  valid_writePtr_1 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  deqptrReg_0 = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  deqptrReg_1 = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  deqptrReg_2 = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  deqptrReg_3 = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  deqptrReg_4 = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  deqptrReg_5 = _RAND_35[4:0];
  _RAND_36 = {1{`RANDOM}};
  MatchVec_lastCycle_0_0 = _RAND_36[5:0];
  _RAND_37 = {1{`RANDOM}};
  MatchVec_lastCycle_0_1 = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  MatchVec_lastCycle_0_2 = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  MatchVec_lastCycle_0_3 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  MatchVec_lastCycle_1_0 = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  MatchVec_lastCycle_1_1 = _RAND_41[5:0];
  _RAND_42 = {1{`RANDOM}};
  MatchVec_lastCycle_1_2 = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  MatchVec_lastCycle_1_3 = _RAND_43[5:0];
  _RAND_44 = {1{`RANDOM}};
  MatchVecUInt_0_0 = _RAND_44[11:0];
  _RAND_45 = {1{`RANDOM}};
  MatchVecUInt_0_1 = _RAND_45[11:0];
  _RAND_46 = {1{`RANDOM}};
  MatchVecUInt_0_2 = _RAND_46[11:0];
  _RAND_47 = {1{`RANDOM}};
  MatchVecUInt_0_3 = _RAND_47[11:0];
  _RAND_48 = {1{`RANDOM}};
  MatchVecUInt_1_0 = _RAND_48[11:0];
  _RAND_49 = {1{`RANDOM}};
  MatchVecUInt_1_1 = _RAND_49[11:0];
  _RAND_50 = {1{`RANDOM}};
  MatchVecUInt_1_2 = _RAND_50[11:0];
  _RAND_51 = {1{`RANDOM}};
  MatchVecUInt_1_3 = _RAND_51[11:0];
  _RAND_52 = {1{`RANDOM}};
  maxMatch = _RAND_52[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
