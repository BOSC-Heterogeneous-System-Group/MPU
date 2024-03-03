module Scoreboard(
  input        clock,
  input        reset,
  input        io_valid_0,
  input        io_valid_1,
  input        io_valid_2,
  input        io_valid_3,
  input        io_valid_4,
  input        io_valid_5,
  input        io_valid_6,
  input        io_valid_7,
  input  [6:0] io_opcode_0,
  input  [6:0] io_opcode_1,
  input  [6:0] io_opcode_2,
  input  [6:0] io_opcode_3,
  input  [6:0] io_opcode_4,
  input  [6:0] io_opcode_5,
  input  [6:0] io_opcode_6,
  input  [6:0] io_opcode_7,
  input  [3:0] io_robIdx_0,
  input  [3:0] io_robIdx_1,
  input  [3:0] io_robIdx_2,
  input  [3:0] io_robIdx_3,
  input  [3:0] io_robIdx_4,
  input  [3:0] io_robIdx_5,
  input  [3:0] io_robIdx_6,
  input  [3:0] io_robIdx_7,
  input  [6:0] io_commit_pc_0,
  input  [6:0] io_commit_pc_1,
  input  [6:0] io_commit_pc_2,
  input  [6:0] io_commit_pc_3,
  input  [6:0] io_commit_pc_4,
  input  [6:0] io_commit_pc_5,
  input        io_commit_valid_0,
  input        io_commit_valid_1,
  input        io_commit_valid_2,
  input        io_commit_valid_3,
  input        io_commit_valid_4,
  input        io_commit_valid_5,
  input        io_wr_en_0,
  input        io_wr_en_1,
  input        io_wr_en_2,
  input  [6:0] io_wr_robIdx_0,
  input  [6:0] io_wr_robIdx_1,
  input  [6:0] io_wr_robIdx_2,
  output [3:0] io_robIdx_sort_0,
  output [3:0] io_robIdx_sort_1,
  output [3:0] io_robIdx_sort_2,
  output [3:0] io_robIdx_sort_3,
  output [3:0] io_robIdx_sort_4,
  output [3:0] io_robIdx_sort_5,
  output [3:0] io_robIdx_sort_6,
  output [3:0] io_robIdx_sort_7,
  output [6:0] io_oopcode_sort_0,
  output [6:0] io_oopcode_sort_1,
  output [6:0] io_oopcode_sort_2,
  output [6:0] io_oopcode_sort_3,
  output [6:0] io_oopcode_sort_4,
  output [6:0] io_oopcode_sort_5,
  output [6:0] io_oopcode_sort_6,
  output [6:0] io_oopcode_sort_7,
  output [3:0] io_idx_sort_0,
  output [3:0] io_idx_sort_1,
  output [3:0] io_idx_sort_2,
  output [3:0] io_idx_sort_3,
  output [3:0] io_idx_sort_4,
  output [3:0] io_idx_sort_5,
  output [3:0] io_idx_sort_6,
  output [3:0] io_idx_sort_7
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
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
`endif // RANDOMIZE_REG_INIT
  wire  cmp_0_2 = io_robIdx_0 > io_robIdx_3; // @[Scoreboard.scala 59:33]
  wire  cmp_0_1 = io_robIdx_0 > io_robIdx_2; // @[Scoreboard.scala 59:33]
  wire  cmp_0_0 = io_robIdx_0 > io_robIdx_1; // @[Scoreboard.scala 59:33]
  wire  cmp_0_4 = io_robIdx_0 > io_robIdx_5; // @[Scoreboard.scala 59:33]
  wire  cmp_0_3 = io_robIdx_0 > io_robIdx_4; // @[Scoreboard.scala 59:33]
  wire  cmp_0_6 = io_robIdx_0 > io_robIdx_7; // @[Scoreboard.scala 59:33]
  wire  cmp_0_5 = io_robIdx_0 > io_robIdx_6; // @[Scoreboard.scala 59:33]
  wire [6:0] cmp_u_0 = {cmp_0_6,cmp_0_5,cmp_0_4,cmp_0_3,cmp_0_2,cmp_0_1,cmp_0_0}; // @[Scoreboard.scala 24:40]
  wire  cmp_1_2 = io_robIdx_1 > io_robIdx_3; // @[Scoreboard.scala 59:33]
  wire  cmp_1_1 = io_robIdx_1 > io_robIdx_2; // @[Scoreboard.scala 59:33]
  wire  cmp_1_0 = io_robIdx_1 > io_robIdx_0; // @[Scoreboard.scala 56:33]
  wire  cmp_1_4 = io_robIdx_1 > io_robIdx_5; // @[Scoreboard.scala 59:33]
  wire  cmp_1_3 = io_robIdx_1 > io_robIdx_4; // @[Scoreboard.scala 59:33]
  wire  cmp_1_6 = io_robIdx_1 > io_robIdx_7; // @[Scoreboard.scala 59:33]
  wire  cmp_1_5 = io_robIdx_1 > io_robIdx_6; // @[Scoreboard.scala 59:33]
  wire [6:0] cmp_u_1 = {cmp_1_6,cmp_1_5,cmp_1_4,cmp_1_3,cmp_1_2,cmp_1_1,cmp_1_0}; // @[Scoreboard.scala 24:40]
  wire  cmp_2_2 = io_robIdx_2 > io_robIdx_3; // @[Scoreboard.scala 59:33]
  wire  cmp_2_1 = io_robIdx_2 > io_robIdx_1; // @[Scoreboard.scala 56:33]
  wire  cmp_2_0 = io_robIdx_2 > io_robIdx_0; // @[Scoreboard.scala 56:33]
  wire  cmp_2_4 = io_robIdx_2 > io_robIdx_5; // @[Scoreboard.scala 59:33]
  wire  cmp_2_3 = io_robIdx_2 > io_robIdx_4; // @[Scoreboard.scala 59:33]
  wire  cmp_2_6 = io_robIdx_2 > io_robIdx_7; // @[Scoreboard.scala 59:33]
  wire  cmp_2_5 = io_robIdx_2 > io_robIdx_6; // @[Scoreboard.scala 59:33]
  wire [6:0] cmp_u_2 = {cmp_2_6,cmp_2_5,cmp_2_4,cmp_2_3,cmp_2_2,cmp_2_1,cmp_2_0}; // @[Scoreboard.scala 24:40]
  wire  cmp_3_2 = io_robIdx_3 > io_robIdx_2; // @[Scoreboard.scala 56:33]
  wire  cmp_3_1 = io_robIdx_3 > io_robIdx_1; // @[Scoreboard.scala 56:33]
  wire  cmp_3_0 = io_robIdx_3 > io_robIdx_0; // @[Scoreboard.scala 56:33]
  wire  cmp_3_4 = io_robIdx_3 > io_robIdx_5; // @[Scoreboard.scala 59:33]
  wire  cmp_3_3 = io_robIdx_3 > io_robIdx_4; // @[Scoreboard.scala 59:33]
  wire  cmp_3_6 = io_robIdx_3 > io_robIdx_7; // @[Scoreboard.scala 59:33]
  wire  cmp_3_5 = io_robIdx_3 > io_robIdx_6; // @[Scoreboard.scala 59:33]
  wire [6:0] cmp_u_3 = {cmp_3_6,cmp_3_5,cmp_3_4,cmp_3_3,cmp_3_2,cmp_3_1,cmp_3_0}; // @[Scoreboard.scala 24:40]
  wire  cmp_4_2 = io_robIdx_4 > io_robIdx_2; // @[Scoreboard.scala 56:33]
  wire  cmp_4_1 = io_robIdx_4 > io_robIdx_1; // @[Scoreboard.scala 56:33]
  wire  cmp_4_0 = io_robIdx_4 > io_robIdx_0; // @[Scoreboard.scala 56:33]
  wire  cmp_4_4 = io_robIdx_4 > io_robIdx_5; // @[Scoreboard.scala 59:33]
  wire  cmp_4_3 = io_robIdx_4 > io_robIdx_3; // @[Scoreboard.scala 56:33]
  wire  cmp_4_6 = io_robIdx_4 > io_robIdx_7; // @[Scoreboard.scala 59:33]
  wire  cmp_4_5 = io_robIdx_4 > io_robIdx_6; // @[Scoreboard.scala 59:33]
  wire [6:0] cmp_u_4 = {cmp_4_6,cmp_4_5,cmp_4_4,cmp_4_3,cmp_4_2,cmp_4_1,cmp_4_0}; // @[Scoreboard.scala 24:40]
  wire  cmp_5_2 = io_robIdx_5 > io_robIdx_2; // @[Scoreboard.scala 56:33]
  wire  cmp_5_1 = io_robIdx_5 > io_robIdx_1; // @[Scoreboard.scala 56:33]
  wire  cmp_5_0 = io_robIdx_5 > io_robIdx_0; // @[Scoreboard.scala 56:33]
  wire  cmp_5_4 = io_robIdx_5 > io_robIdx_4; // @[Scoreboard.scala 56:33]
  wire  cmp_5_3 = io_robIdx_5 > io_robIdx_3; // @[Scoreboard.scala 56:33]
  wire  cmp_5_6 = io_robIdx_5 > io_robIdx_7; // @[Scoreboard.scala 59:33]
  wire  cmp_5_5 = io_robIdx_5 > io_robIdx_6; // @[Scoreboard.scala 59:33]
  wire [6:0] cmp_u_5 = {cmp_5_6,cmp_5_5,cmp_5_4,cmp_5_3,cmp_5_2,cmp_5_1,cmp_5_0}; // @[Scoreboard.scala 24:40]
  wire  cmp_6_2 = io_robIdx_6 > io_robIdx_2; // @[Scoreboard.scala 56:33]
  wire  cmp_6_1 = io_robIdx_6 > io_robIdx_1; // @[Scoreboard.scala 56:33]
  wire  cmp_6_0 = io_robIdx_6 > io_robIdx_0; // @[Scoreboard.scala 56:33]
  wire  cmp_6_4 = io_robIdx_6 > io_robIdx_4; // @[Scoreboard.scala 56:33]
  wire  cmp_6_3 = io_robIdx_6 > io_robIdx_3; // @[Scoreboard.scala 56:33]
  wire  cmp_6_6 = io_robIdx_6 > io_robIdx_7; // @[Scoreboard.scala 59:33]
  wire  cmp_6_5 = io_robIdx_6 > io_robIdx_5; // @[Scoreboard.scala 56:33]
  wire [6:0] cmp_u_6 = {cmp_6_6,cmp_6_5,cmp_6_4,cmp_6_3,cmp_6_2,cmp_6_1,cmp_6_0}; // @[Scoreboard.scala 24:40]
  wire  cmp_7_2 = io_robIdx_7 > io_robIdx_2; // @[Scoreboard.scala 56:33]
  wire  cmp_7_1 = io_robIdx_7 > io_robIdx_1; // @[Scoreboard.scala 56:33]
  wire  cmp_7_0 = io_robIdx_7 > io_robIdx_0; // @[Scoreboard.scala 56:33]
  wire  cmp_7_4 = io_robIdx_7 > io_robIdx_4; // @[Scoreboard.scala 56:33]
  wire  cmp_7_3 = io_robIdx_7 > io_robIdx_3; // @[Scoreboard.scala 56:33]
  wire  cmp_7_6 = io_robIdx_7 > io_robIdx_6; // @[Scoreboard.scala 56:33]
  wire  cmp_7_5 = io_robIdx_7 > io_robIdx_5; // @[Scoreboard.scala 56:33]
  wire [6:0] cmp_u_7 = {cmp_7_6,cmp_7_5,cmp_7_4,cmp_7_3,cmp_7_2,cmp_7_1,cmp_7_0}; // @[Scoreboard.scala 24:40]
  reg [6:0] opcode_array_0; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_1; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_2; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_3; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_4; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_5; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_6; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_7; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_8; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_9; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_10; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_11; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_12; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_13; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_14; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_15; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_16; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_17; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_18; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_19; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_20; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_21; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_22; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_23; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_24; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_25; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_26; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_27; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_28; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_29; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_30; // @[Scoreboard.scala 32:35]
  reg [6:0] opcode_array_31; // @[Scoreboard.scala 32:35]
  reg [1:0] state_array_0; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_1; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_2; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_3; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_4; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_5; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_6; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_7; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_8; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_9; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_10; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_11; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_12; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_13; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_14; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_15; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_16; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_17; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_18; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_19; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_20; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_21; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_22; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_23; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_24; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_25; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_26; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_27; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_28; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_29; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_30; // @[Scoreboard.scala 33:38]
  reg [1:0] state_array_31; // @[Scoreboard.scala 33:38]
  reg [5:0] writePtr; // @[Scoreboard.scala 34:25]
  reg [5:0] readPtr; // @[Scoreboard.scala 36:34]
  wire  commitVec_0_0 = state_array_0 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_0; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_1 = state_array_1 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_1; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_2 = state_array_2 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_2; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_3 = state_array_3 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_3; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_4 = state_array_4 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_4; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_5 = state_array_5 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_5; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_6 = state_array_6 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_6; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_7 = state_array_7 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_7; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_8 = state_array_8 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_8; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_9 = state_array_9 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_9; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_10 = state_array_10 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_10; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_11 = state_array_11 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_11; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_12 = state_array_12 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_12; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_13 = state_array_13 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_13; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_14 = state_array_14 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_14; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_15 = state_array_15 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_15; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_16 = state_array_16 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_16; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_17 = state_array_17 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_17; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_18 = state_array_18 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_18; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_19 = state_array_19 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_19; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_20 = state_array_20 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_20; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_21 = state_array_21 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_21; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_22 = state_array_22 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_22; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_23 = state_array_23 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_23; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_24 = state_array_24 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_24; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_25 = state_array_25 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_25; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_26 = state_array_26 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_26; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_27 = state_array_27 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_27; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_28 = state_array_28 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_28; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_29 = state_array_29 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_29; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_30 = state_array_30 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_30; // @[Scoreboard.scala 40:50]
  wire  commitVec_0_31 = state_array_31 == 2'h2 & io_wr_en_0 & io_wr_robIdx_0 == opcode_array_31; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_0 = state_array_0 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_0; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_1 = state_array_1 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_1; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_2 = state_array_2 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_2; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_3 = state_array_3 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_3; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_4 = state_array_4 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_4; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_5 = state_array_5 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_5; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_6 = state_array_6 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_6; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_7 = state_array_7 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_7; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_8 = state_array_8 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_8; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_9 = state_array_9 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_9; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_10 = state_array_10 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_10; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_11 = state_array_11 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_11; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_12 = state_array_12 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_12; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_13 = state_array_13 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_13; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_14 = state_array_14 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_14; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_15 = state_array_15 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_15; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_16 = state_array_16 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_16; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_17 = state_array_17 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_17; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_18 = state_array_18 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_18; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_19 = state_array_19 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_19; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_20 = state_array_20 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_20; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_21 = state_array_21 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_21; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_22 = state_array_22 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_22; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_23 = state_array_23 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_23; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_24 = state_array_24 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_24; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_25 = state_array_25 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_25; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_26 = state_array_26 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_26; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_27 = state_array_27 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_27; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_28 = state_array_28 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_28; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_29 = state_array_29 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_29; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_30 = state_array_30 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_30; // @[Scoreboard.scala 40:50]
  wire  commitVec_1_31 = state_array_31 == 2'h2 & io_wr_en_1 & io_wr_robIdx_1 == opcode_array_31; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_0 = state_array_0 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_0; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_1 = state_array_1 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_1; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_2 = state_array_2 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_2; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_3 = state_array_3 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_3; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_4 = state_array_4 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_4; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_5 = state_array_5 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_5; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_6 = state_array_6 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_6; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_7 = state_array_7 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_7; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_8 = state_array_8 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_8; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_9 = state_array_9 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_9; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_10 = state_array_10 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_10; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_11 = state_array_11 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_11; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_12 = state_array_12 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_12; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_13 = state_array_13 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_13; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_14 = state_array_14 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_14; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_15 = state_array_15 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_15; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_16 = state_array_16 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_16; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_17 = state_array_17 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_17; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_18 = state_array_18 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_18; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_19 = state_array_19 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_19; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_20 = state_array_20 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_20; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_21 = state_array_21 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_21; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_22 = state_array_22 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_22; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_23 = state_array_23 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_23; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_24 = state_array_24 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_24; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_25 = state_array_25 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_25; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_26 = state_array_26 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_26; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_27 = state_array_27 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_27; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_28 = state_array_28 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_28; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_29 = state_array_29 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_29; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_30 = state_array_30 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_30; // @[Scoreboard.scala 40:50]
  wire  commitVec_2_31 = state_array_31 == 2'h2 & io_wr_en_2 & io_wr_robIdx_2 == opcode_array_31; // @[Scoreboard.scala 40:50]
  wire [1:0] _T_292 = cmp_u_7[1] + cmp_u_7[2]; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1600 = {{1'd0}, cmp_u_7[0]}; // @[Bitwise.scala 51:90]
  wire [2:0] _T_294 = _GEN_1600 + _T_292; // @[Bitwise.scala 51:90]
  wire [1:0] _T_296 = cmp_u_7[3] + cmp_u_7[4]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_298 = cmp_u_7[5] + cmp_u_7[6]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_300 = _T_296 + _T_298; // @[Bitwise.scala 51:90]
  wire [2:0] _GEN_1601 = {{1'd0}, _T_294[1:0]}; // @[Bitwise.scala 51:90]
  wire [3:0] _T_302 = _GEN_1601 + _T_300; // @[Bitwise.scala 51:90]
  wire [1:0] _T_254 = cmp_u_6[1] + cmp_u_6[2]; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1602 = {{1'd0}, cmp_u_6[0]}; // @[Bitwise.scala 51:90]
  wire [2:0] _T_256 = _GEN_1602 + _T_254; // @[Bitwise.scala 51:90]
  wire [1:0] _T_258 = cmp_u_6[3] + cmp_u_6[4]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_260 = cmp_u_6[5] + cmp_u_6[6]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_262 = _T_258 + _T_260; // @[Bitwise.scala 51:90]
  wire [2:0] _GEN_1603 = {{1'd0}, _T_256[1:0]}; // @[Bitwise.scala 51:90]
  wire [3:0] _T_264 = _GEN_1603 + _T_262; // @[Bitwise.scala 51:90]
  wire [1:0] _T_216 = cmp_u_5[1] + cmp_u_5[2]; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1604 = {{1'd0}, cmp_u_5[0]}; // @[Bitwise.scala 51:90]
  wire [2:0] _T_218 = _GEN_1604 + _T_216; // @[Bitwise.scala 51:90]
  wire [1:0] _T_220 = cmp_u_5[3] + cmp_u_5[4]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_222 = cmp_u_5[5] + cmp_u_5[6]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_224 = _T_220 + _T_222; // @[Bitwise.scala 51:90]
  wire [2:0] _GEN_1605 = {{1'd0}, _T_218[1:0]}; // @[Bitwise.scala 51:90]
  wire [3:0] _T_226 = _GEN_1605 + _T_224; // @[Bitwise.scala 51:90]
  wire [1:0] _T_178 = cmp_u_4[1] + cmp_u_4[2]; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1606 = {{1'd0}, cmp_u_4[0]}; // @[Bitwise.scala 51:90]
  wire [2:0] _T_180 = _GEN_1606 + _T_178; // @[Bitwise.scala 51:90]
  wire [1:0] _T_182 = cmp_u_4[3] + cmp_u_4[4]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_184 = cmp_u_4[5] + cmp_u_4[6]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_186 = _T_182 + _T_184; // @[Bitwise.scala 51:90]
  wire [2:0] _GEN_1607 = {{1'd0}, _T_180[1:0]}; // @[Bitwise.scala 51:90]
  wire [3:0] _T_188 = _GEN_1607 + _T_186; // @[Bitwise.scala 51:90]
  wire [1:0] _T_140 = cmp_u_3[1] + cmp_u_3[2]; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1608 = {{1'd0}, cmp_u_3[0]}; // @[Bitwise.scala 51:90]
  wire [2:0] _T_142 = _GEN_1608 + _T_140; // @[Bitwise.scala 51:90]
  wire [1:0] _T_144 = cmp_u_3[3] + cmp_u_3[4]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_146 = cmp_u_3[5] + cmp_u_3[6]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_148 = _T_144 + _T_146; // @[Bitwise.scala 51:90]
  wire [2:0] _GEN_1609 = {{1'd0}, _T_142[1:0]}; // @[Bitwise.scala 51:90]
  wire [3:0] _T_150 = _GEN_1609 + _T_148; // @[Bitwise.scala 51:90]
  wire [1:0] _T_102 = cmp_u_2[1] + cmp_u_2[2]; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1610 = {{1'd0}, cmp_u_2[0]}; // @[Bitwise.scala 51:90]
  wire [2:0] _T_104 = _GEN_1610 + _T_102; // @[Bitwise.scala 51:90]
  wire [1:0] _T_106 = cmp_u_2[3] + cmp_u_2[4]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_108 = cmp_u_2[5] + cmp_u_2[6]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_110 = _T_106 + _T_108; // @[Bitwise.scala 51:90]
  wire [2:0] _GEN_1611 = {{1'd0}, _T_104[1:0]}; // @[Bitwise.scala 51:90]
  wire [3:0] _T_112 = _GEN_1611 + _T_110; // @[Bitwise.scala 51:90]
  wire [1:0] _T_64 = cmp_u_1[1] + cmp_u_1[2]; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1612 = {{1'd0}, cmp_u_1[0]}; // @[Bitwise.scala 51:90]
  wire [2:0] _T_66 = _GEN_1612 + _T_64; // @[Bitwise.scala 51:90]
  wire [1:0] _T_68 = cmp_u_1[3] + cmp_u_1[4]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_70 = cmp_u_1[5] + cmp_u_1[6]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_72 = _T_68 + _T_70; // @[Bitwise.scala 51:90]
  wire [2:0] _GEN_1613 = {{1'd0}, _T_66[1:0]}; // @[Bitwise.scala 51:90]
  wire [3:0] _T_74 = _GEN_1613 + _T_72; // @[Bitwise.scala 51:90]
  wire [1:0] _T_26 = cmp_u_0[1] + cmp_u_0[2]; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1614 = {{1'd0}, cmp_u_0[0]}; // @[Bitwise.scala 51:90]
  wire [2:0] _T_28 = _GEN_1614 + _T_26; // @[Bitwise.scala 51:90]
  wire [1:0] _T_30 = cmp_u_0[3] + cmp_u_0[4]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_32 = cmp_u_0[5] + cmp_u_0[6]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_34 = _T_30 + _T_32; // @[Bitwise.scala 51:90]
  wire [2:0] _GEN_1615 = {{1'd0}, _T_28[1:0]}; // @[Bitwise.scala 51:90]
  wire [3:0] _T_36 = _GEN_1615 + _T_34; // @[Bitwise.scala 51:90]
  wire [3:0] _GEN_40 = 3'h0 == _T_74[2:0] ? 4'h1 : 4'h0; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_72 = 3'h0 == _T_112[2:0] ? 4'h2 : _GEN_40; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_104 = 3'h0 == _T_150[2:0] ? 4'h3 : _GEN_72; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_136 = 3'h0 == _T_188[2:0] ? 4'h4 : _GEN_104; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_168 = 3'h0 == _T_226[2:0] ? 4'h5 : _GEN_136; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_200 = 3'h0 == _T_264[2:0] ? 4'h6 : _GEN_168; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] Idx_order_0 = 3'h0 == _T_302[2:0] ? 4'h7 : _GEN_200; // @[Scoreboard.scala 63:{35,35}]
  wire  _GEN_25 = 3'h1 == Idx_order_0[2:0] ? io_valid_1 : io_valid_0; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_26 = 3'h2 == Idx_order_0[2:0] ? io_valid_2 : _GEN_25; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_27 = 3'h3 == Idx_order_0[2:0] ? io_valid_3 : _GEN_26; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_28 = 3'h4 == Idx_order_0[2:0] ? io_valid_4 : _GEN_27; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_29 = 3'h5 == Idx_order_0[2:0] ? io_valid_5 : _GEN_28; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_30 = 3'h6 == Idx_order_0[2:0] ? io_valid_6 : _GEN_29; // @[Scoreboard.scala 65:{20,20}]
  wire  _io_valid_valid_order_0_T = 3'h7 == Idx_order_0[2:0] ? io_valid_7 : _GEN_30; // @[Scoreboard.scala 65:{20,20}]
  wire  valid_order_0 = 3'h7 == Idx_order_0[2:0] ? io_valid_7 : _GEN_30; // @[Scoreboard.scala 65:{20,20}]
  wire [3:0] _GEN_41 = 3'h1 == _T_74[2:0] ? 4'h1 : 4'h0; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_73 = 3'h1 == _T_112[2:0] ? 4'h2 : _GEN_41; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_105 = 3'h1 == _T_150[2:0] ? 4'h3 : _GEN_73; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_137 = 3'h1 == _T_188[2:0] ? 4'h4 : _GEN_105; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_169 = 3'h1 == _T_226[2:0] ? 4'h5 : _GEN_137; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_201 = 3'h1 == _T_264[2:0] ? 4'h6 : _GEN_169; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] Idx_order_1 = 3'h1 == _T_302[2:0] ? 4'h7 : _GEN_201; // @[Scoreboard.scala 63:{35,35}]
  wire  _GEN_57 = 3'h1 == Idx_order_1[2:0] ? io_valid_1 : io_valid_0; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_58 = 3'h2 == Idx_order_1[2:0] ? io_valid_2 : _GEN_57; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_59 = 3'h3 == Idx_order_1[2:0] ? io_valid_3 : _GEN_58; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_60 = 3'h4 == Idx_order_1[2:0] ? io_valid_4 : _GEN_59; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_61 = 3'h5 == Idx_order_1[2:0] ? io_valid_5 : _GEN_60; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_62 = 3'h6 == Idx_order_1[2:0] ? io_valid_6 : _GEN_61; // @[Scoreboard.scala 65:{20,20}]
  wire  _io_valid_valid_order_1_T = 3'h7 == Idx_order_1[2:0] ? io_valid_7 : _GEN_62; // @[Scoreboard.scala 65:{20,20}]
  wire  valid_order_1 = 3'h7 == Idx_order_1[2:0] ? io_valid_7 : _GEN_62; // @[Scoreboard.scala 65:{20,20}]
  wire [1:0] offset_2 = _io_valid_valid_order_0_T + _io_valid_valid_order_1_T; // @[Bitwise.scala 51:90]
  wire [3:0] _GEN_42 = 3'h2 == _T_74[2:0] ? 4'h1 : 4'h0; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_74 = 3'h2 == _T_112[2:0] ? 4'h2 : _GEN_42; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_106 = 3'h2 == _T_150[2:0] ? 4'h3 : _GEN_74; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_138 = 3'h2 == _T_188[2:0] ? 4'h4 : _GEN_106; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_170 = 3'h2 == _T_226[2:0] ? 4'h5 : _GEN_138; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_202 = 3'h2 == _T_264[2:0] ? 4'h6 : _GEN_170; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] Idx_order_2 = 3'h2 == _T_302[2:0] ? 4'h7 : _GEN_202; // @[Scoreboard.scala 63:{35,35}]
  wire  _GEN_89 = 3'h1 == Idx_order_2[2:0] ? io_valid_1 : io_valid_0; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_90 = 3'h2 == Idx_order_2[2:0] ? io_valid_2 : _GEN_89; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_91 = 3'h3 == Idx_order_2[2:0] ? io_valid_3 : _GEN_90; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_92 = 3'h4 == Idx_order_2[2:0] ? io_valid_4 : _GEN_91; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_93 = 3'h5 == Idx_order_2[2:0] ? io_valid_5 : _GEN_92; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_94 = 3'h6 == Idx_order_2[2:0] ? io_valid_6 : _GEN_93; // @[Scoreboard.scala 65:{20,20}]
  wire  _io_valid_valid_order_2_T = 3'h7 == Idx_order_2[2:0] ? io_valid_7 : _GEN_94; // @[Scoreboard.scala 65:{20,20}]
  wire  valid_order_2 = 3'h7 == Idx_order_2[2:0] ? io_valid_7 : _GEN_94; // @[Scoreboard.scala 65:{20,20}]
  wire [1:0] _offset_T_1 = _io_valid_valid_order_1_T + _io_valid_valid_order_2_T; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1616 = {{1'd0}, _io_valid_valid_order_0_T}; // @[Bitwise.scala 51:90]
  wire [2:0] _offset_T_3 = _GEN_1616 + _offset_T_1; // @[Bitwise.scala 51:90]
  wire [1:0] offset_3 = _offset_T_3[1:0]; // @[Bitwise.scala 51:90]
  wire [3:0] _GEN_43 = 3'h3 == _T_74[2:0] ? 4'h1 : 4'h0; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_75 = 3'h3 == _T_112[2:0] ? 4'h2 : _GEN_43; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_107 = 3'h3 == _T_150[2:0] ? 4'h3 : _GEN_75; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_139 = 3'h3 == _T_188[2:0] ? 4'h4 : _GEN_107; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_171 = 3'h3 == _T_226[2:0] ? 4'h5 : _GEN_139; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_203 = 3'h3 == _T_264[2:0] ? 4'h6 : _GEN_171; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] Idx_order_3 = 3'h3 == _T_302[2:0] ? 4'h7 : _GEN_203; // @[Scoreboard.scala 63:{35,35}]
  wire  _GEN_121 = 3'h1 == Idx_order_3[2:0] ? io_valid_1 : io_valid_0; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_122 = 3'h2 == Idx_order_3[2:0] ? io_valid_2 : _GEN_121; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_123 = 3'h3 == Idx_order_3[2:0] ? io_valid_3 : _GEN_122; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_124 = 3'h4 == Idx_order_3[2:0] ? io_valid_4 : _GEN_123; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_125 = 3'h5 == Idx_order_3[2:0] ? io_valid_5 : _GEN_124; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_126 = 3'h6 == Idx_order_3[2:0] ? io_valid_6 : _GEN_125; // @[Scoreboard.scala 65:{20,20}]
  wire  _io_valid_valid_order_3_T = 3'h7 == Idx_order_3[2:0] ? io_valid_7 : _GEN_126; // @[Scoreboard.scala 65:{20,20}]
  wire  valid_order_3 = 3'h7 == Idx_order_3[2:0] ? io_valid_7 : _GEN_126; // @[Scoreboard.scala 65:{20,20}]
  wire [1:0] _offset_T_6 = _io_valid_valid_order_2_T + _io_valid_valid_order_3_T; // @[Bitwise.scala 51:90]
  wire [2:0] offset_4 = offset_2 + _offset_T_6; // @[Bitwise.scala 51:90]
  wire [3:0] _GEN_44 = 3'h4 == _T_74[2:0] ? 4'h1 : 4'h0; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_76 = 3'h4 == _T_112[2:0] ? 4'h2 : _GEN_44; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_108 = 3'h4 == _T_150[2:0] ? 4'h3 : _GEN_76; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_140 = 3'h4 == _T_188[2:0] ? 4'h4 : _GEN_108; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_172 = 3'h4 == _T_226[2:0] ? 4'h5 : _GEN_140; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_204 = 3'h4 == _T_264[2:0] ? 4'h6 : _GEN_172; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] Idx_order_4 = 3'h4 == _T_302[2:0] ? 4'h7 : _GEN_204; // @[Scoreboard.scala 63:{35,35}]
  wire  _GEN_153 = 3'h1 == Idx_order_4[2:0] ? io_valid_1 : io_valid_0; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_154 = 3'h2 == Idx_order_4[2:0] ? io_valid_2 : _GEN_153; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_155 = 3'h3 == Idx_order_4[2:0] ? io_valid_3 : _GEN_154; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_156 = 3'h4 == Idx_order_4[2:0] ? io_valid_4 : _GEN_155; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_157 = 3'h5 == Idx_order_4[2:0] ? io_valid_5 : _GEN_156; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_158 = 3'h6 == Idx_order_4[2:0] ? io_valid_6 : _GEN_157; // @[Scoreboard.scala 65:{20,20}]
  wire  _io_valid_valid_order_4_T = 3'h7 == Idx_order_4[2:0] ? io_valid_7 : _GEN_158; // @[Scoreboard.scala 65:{20,20}]
  wire  valid_order_4 = 3'h7 == Idx_order_4[2:0] ? io_valid_7 : _GEN_158; // @[Scoreboard.scala 65:{20,20}]
  wire [1:0] _offset_T_11 = _io_valid_valid_order_3_T + _io_valid_valid_order_4_T; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1617 = {{1'd0}, _io_valid_valid_order_2_T}; // @[Bitwise.scala 51:90]
  wire [2:0] _offset_T_13 = _GEN_1617 + _offset_T_11; // @[Bitwise.scala 51:90]
  wire [2:0] offset_5 = offset_2 + _offset_T_13[1:0]; // @[Bitwise.scala 51:90]
  wire [3:0] _GEN_45 = 3'h5 == _T_74[2:0] ? 4'h1 : 4'h0; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_77 = 3'h5 == _T_112[2:0] ? 4'h2 : _GEN_45; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_109 = 3'h5 == _T_150[2:0] ? 4'h3 : _GEN_77; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_141 = 3'h5 == _T_188[2:0] ? 4'h4 : _GEN_109; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_173 = 3'h5 == _T_226[2:0] ? 4'h5 : _GEN_141; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_205 = 3'h5 == _T_264[2:0] ? 4'h6 : _GEN_173; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] Idx_order_5 = 3'h5 == _T_302[2:0] ? 4'h7 : _GEN_205; // @[Scoreboard.scala 63:{35,35}]
  wire  _GEN_185 = 3'h1 == Idx_order_5[2:0] ? io_valid_1 : io_valid_0; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_186 = 3'h2 == Idx_order_5[2:0] ? io_valid_2 : _GEN_185; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_187 = 3'h3 == Idx_order_5[2:0] ? io_valid_3 : _GEN_186; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_188 = 3'h4 == Idx_order_5[2:0] ? io_valid_4 : _GEN_187; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_189 = 3'h5 == Idx_order_5[2:0] ? io_valid_5 : _GEN_188; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_190 = 3'h6 == Idx_order_5[2:0] ? io_valid_6 : _GEN_189; // @[Scoreboard.scala 65:{20,20}]
  wire  _io_valid_valid_order_5_T = 3'h7 == Idx_order_5[2:0] ? io_valid_7 : _GEN_190; // @[Scoreboard.scala 65:{20,20}]
  wire  valid_order_5 = 3'h7 == Idx_order_5[2:0] ? io_valid_7 : _GEN_190; // @[Scoreboard.scala 65:{20,20}]
  wire [1:0] _offset_T_20 = _io_valid_valid_order_4_T + _io_valid_valid_order_5_T; // @[Bitwise.scala 51:90]
  wire [1:0] _GEN_1619 = {{1'd0}, _io_valid_valid_order_3_T}; // @[Bitwise.scala 51:90]
  wire [2:0] _offset_T_22 = _GEN_1619 + _offset_T_20; // @[Bitwise.scala 51:90]
  wire [2:0] offset_6 = offset_3 + _offset_T_22[1:0]; // @[Bitwise.scala 51:90]
  wire [3:0] _GEN_46 = 3'h6 == _T_74[2:0] ? 4'h1 : 4'h0; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_78 = 3'h6 == _T_112[2:0] ? 4'h2 : _GEN_46; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_110 = 3'h6 == _T_150[2:0] ? 4'h3 : _GEN_78; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_142 = 3'h6 == _T_188[2:0] ? 4'h4 : _GEN_110; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_174 = 3'h6 == _T_226[2:0] ? 4'h5 : _GEN_142; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_206 = 3'h6 == _T_264[2:0] ? 4'h6 : _GEN_174; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] Idx_order_6 = 3'h6 == _T_302[2:0] ? 4'h7 : _GEN_206; // @[Scoreboard.scala 63:{35,35}]
  wire  _GEN_217 = 3'h1 == Idx_order_6[2:0] ? io_valid_1 : io_valid_0; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_218 = 3'h2 == Idx_order_6[2:0] ? io_valid_2 : _GEN_217; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_219 = 3'h3 == Idx_order_6[2:0] ? io_valid_3 : _GEN_218; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_220 = 3'h4 == Idx_order_6[2:0] ? io_valid_4 : _GEN_219; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_221 = 3'h5 == Idx_order_6[2:0] ? io_valid_5 : _GEN_220; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_222 = 3'h6 == Idx_order_6[2:0] ? io_valid_6 : _GEN_221; // @[Scoreboard.scala 65:{20,20}]
  wire  _io_valid_valid_order_6_T = 3'h7 == Idx_order_6[2:0] ? io_valid_7 : _GEN_222; // @[Scoreboard.scala 65:{20,20}]
  wire  valid_order_6 = 3'h7 == Idx_order_6[2:0] ? io_valid_7 : _GEN_222; // @[Scoreboard.scala 65:{20,20}]
  wire [1:0] _offset_T_31 = _io_valid_valid_order_5_T + _io_valid_valid_order_6_T; // @[Bitwise.scala 51:90]
  wire [2:0] _offset_T_33 = _offset_T_11 + _offset_T_31; // @[Bitwise.scala 51:90]
  wire [2:0] _GEN_1621 = {{1'd0}, offset_3}; // @[Bitwise.scala 51:90]
  wire [3:0] _offset_T_35 = _GEN_1621 + _offset_T_33; // @[Bitwise.scala 51:90]
  wire [2:0] offset_7 = _offset_T_35[2:0]; // @[Bitwise.scala 51:90]
  wire [3:0] _GEN_47 = 3'h7 == _T_74[2:0] ? 4'h1 : 4'h0; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_79 = 3'h7 == _T_112[2:0] ? 4'h2 : _GEN_47; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_111 = 3'h7 == _T_150[2:0] ? 4'h3 : _GEN_79; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_143 = 3'h7 == _T_188[2:0] ? 4'h4 : _GEN_111; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_175 = 3'h7 == _T_226[2:0] ? 4'h5 : _GEN_143; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] _GEN_207 = 3'h7 == _T_264[2:0] ? 4'h6 : _GEN_175; // @[Scoreboard.scala 63:{35,35}]
  wire [3:0] Idx_order_7 = 3'h7 == _T_302[2:0] ? 4'h7 : _GEN_207; // @[Scoreboard.scala 63:{35,35}]
  wire  _GEN_249 = 3'h1 == Idx_order_7[2:0] ? io_valid_1 : io_valid_0; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_250 = 3'h2 == Idx_order_7[2:0] ? io_valid_2 : _GEN_249; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_251 = 3'h3 == Idx_order_7[2:0] ? io_valid_3 : _GEN_250; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_252 = 3'h4 == Idx_order_7[2:0] ? io_valid_4 : _GEN_251; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_253 = 3'h5 == Idx_order_7[2:0] ? io_valid_5 : _GEN_252; // @[Scoreboard.scala 65:{20,20}]
  wire  _GEN_254 = 3'h6 == Idx_order_7[2:0] ? io_valid_6 : _GEN_253; // @[Scoreboard.scala 65:{20,20}]
  wire  _io_valid_valid_order_7_T = 3'h7 == Idx_order_7[2:0] ? io_valid_7 : _GEN_254; // @[Scoreboard.scala 65:{20,20}]
  wire  valid_order_7 = 3'h7 == Idx_order_7[2:0] ? io_valid_7 : _GEN_254; // @[Scoreboard.scala 65:{20,20}]
  wire [1:0] _next_writePtr_T_8 = _io_valid_valid_order_6_T + _io_valid_valid_order_7_T; // @[Bitwise.scala 51:90]
  wire [2:0] _next_writePtr_T_10 = _offset_T_20 + _next_writePtr_T_8; // @[Bitwise.scala 51:90]
  wire [3:0] _next_writePtr_T_12 = offset_4 + _next_writePtr_T_10; // @[Bitwise.scala 51:90]
  wire [5:0] _GEN_1622 = {{2'd0}, _next_writePtr_T_12}; // @[Scoreboard.scala 47:29]
  wire [5:0] next_writePtr = writePtr + _GEN_1622; // @[Scoreboard.scala 47:29]
  wire [3:0] _GEN_0 = 3'h0 == _T_36[2:0] ? io_robIdx_0 : 4'h0; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_1 = 3'h1 == _T_36[2:0] ? io_robIdx_0 : 4'h0; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_2 = 3'h2 == _T_36[2:0] ? io_robIdx_0 : 4'h0; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_3 = 3'h3 == _T_36[2:0] ? io_robIdx_0 : 4'h0; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_4 = 3'h4 == _T_36[2:0] ? io_robIdx_0 : 4'h0; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_5 = 3'h5 == _T_36[2:0] ? io_robIdx_0 : 4'h0; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_6 = 3'h6 == _T_36[2:0] ? io_robIdx_0 : 4'h0; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_7 = 3'h7 == _T_36[2:0] ? io_robIdx_0 : 4'h0; // @[Scoreboard.scala 62:{38,38}]
  wire [6:0] _GEN_17 = 3'h1 == Idx_order_0[2:0] ? io_opcode_1 : io_opcode_0; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_18 = 3'h2 == Idx_order_0[2:0] ? io_opcode_2 : _GEN_17; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_19 = 3'h3 == Idx_order_0[2:0] ? io_opcode_3 : _GEN_18; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_20 = 3'h4 == Idx_order_0[2:0] ? io_opcode_4 : _GEN_19; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_21 = 3'h5 == Idx_order_0[2:0] ? io_opcode_5 : _GEN_20; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_22 = 3'h6 == Idx_order_0[2:0] ? io_opcode_6 : _GEN_21; // @[Scoreboard.scala 64:{21,21}]
  wire [3:0] _GEN_32 = 3'h0 == _T_74[2:0] ? io_robIdx_1 : _GEN_0; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_33 = 3'h1 == _T_74[2:0] ? io_robIdx_1 : _GEN_1; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_34 = 3'h2 == _T_74[2:0] ? io_robIdx_1 : _GEN_2; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_35 = 3'h3 == _T_74[2:0] ? io_robIdx_1 : _GEN_3; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_36 = 3'h4 == _T_74[2:0] ? io_robIdx_1 : _GEN_4; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_37 = 3'h5 == _T_74[2:0] ? io_robIdx_1 : _GEN_5; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_38 = 3'h6 == _T_74[2:0] ? io_robIdx_1 : _GEN_6; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_39 = 3'h7 == _T_74[2:0] ? io_robIdx_1 : _GEN_7; // @[Scoreboard.scala 62:{38,38}]
  wire [6:0] _GEN_49 = 3'h1 == Idx_order_1[2:0] ? io_opcode_1 : io_opcode_0; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_50 = 3'h2 == Idx_order_1[2:0] ? io_opcode_2 : _GEN_49; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_51 = 3'h3 == Idx_order_1[2:0] ? io_opcode_3 : _GEN_50; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_52 = 3'h4 == Idx_order_1[2:0] ? io_opcode_4 : _GEN_51; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_53 = 3'h5 == Idx_order_1[2:0] ? io_opcode_5 : _GEN_52; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_54 = 3'h6 == Idx_order_1[2:0] ? io_opcode_6 : _GEN_53; // @[Scoreboard.scala 64:{21,21}]
  wire [3:0] _GEN_64 = 3'h0 == _T_112[2:0] ? io_robIdx_2 : _GEN_32; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_65 = 3'h1 == _T_112[2:0] ? io_robIdx_2 : _GEN_33; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_66 = 3'h2 == _T_112[2:0] ? io_robIdx_2 : _GEN_34; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_67 = 3'h3 == _T_112[2:0] ? io_robIdx_2 : _GEN_35; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_68 = 3'h4 == _T_112[2:0] ? io_robIdx_2 : _GEN_36; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_69 = 3'h5 == _T_112[2:0] ? io_robIdx_2 : _GEN_37; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_70 = 3'h6 == _T_112[2:0] ? io_robIdx_2 : _GEN_38; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_71 = 3'h7 == _T_112[2:0] ? io_robIdx_2 : _GEN_39; // @[Scoreboard.scala 62:{38,38}]
  wire [6:0] _GEN_81 = 3'h1 == Idx_order_2[2:0] ? io_opcode_1 : io_opcode_0; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_82 = 3'h2 == Idx_order_2[2:0] ? io_opcode_2 : _GEN_81; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_83 = 3'h3 == Idx_order_2[2:0] ? io_opcode_3 : _GEN_82; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_84 = 3'h4 == Idx_order_2[2:0] ? io_opcode_4 : _GEN_83; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_85 = 3'h5 == Idx_order_2[2:0] ? io_opcode_5 : _GEN_84; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_86 = 3'h6 == Idx_order_2[2:0] ? io_opcode_6 : _GEN_85; // @[Scoreboard.scala 64:{21,21}]
  wire [3:0] _GEN_96 = 3'h0 == _T_150[2:0] ? io_robIdx_3 : _GEN_64; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_97 = 3'h1 == _T_150[2:0] ? io_robIdx_3 : _GEN_65; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_98 = 3'h2 == _T_150[2:0] ? io_robIdx_3 : _GEN_66; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_99 = 3'h3 == _T_150[2:0] ? io_robIdx_3 : _GEN_67; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_100 = 3'h4 == _T_150[2:0] ? io_robIdx_3 : _GEN_68; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_101 = 3'h5 == _T_150[2:0] ? io_robIdx_3 : _GEN_69; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_102 = 3'h6 == _T_150[2:0] ? io_robIdx_3 : _GEN_70; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_103 = 3'h7 == _T_150[2:0] ? io_robIdx_3 : _GEN_71; // @[Scoreboard.scala 62:{38,38}]
  wire [6:0] _GEN_113 = 3'h1 == Idx_order_3[2:0] ? io_opcode_1 : io_opcode_0; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_114 = 3'h2 == Idx_order_3[2:0] ? io_opcode_2 : _GEN_113; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_115 = 3'h3 == Idx_order_3[2:0] ? io_opcode_3 : _GEN_114; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_116 = 3'h4 == Idx_order_3[2:0] ? io_opcode_4 : _GEN_115; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_117 = 3'h5 == Idx_order_3[2:0] ? io_opcode_5 : _GEN_116; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_118 = 3'h6 == Idx_order_3[2:0] ? io_opcode_6 : _GEN_117; // @[Scoreboard.scala 64:{21,21}]
  wire [3:0] _GEN_128 = 3'h0 == _T_188[2:0] ? io_robIdx_4 : _GEN_96; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_129 = 3'h1 == _T_188[2:0] ? io_robIdx_4 : _GEN_97; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_130 = 3'h2 == _T_188[2:0] ? io_robIdx_4 : _GEN_98; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_131 = 3'h3 == _T_188[2:0] ? io_robIdx_4 : _GEN_99; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_132 = 3'h4 == _T_188[2:0] ? io_robIdx_4 : _GEN_100; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_133 = 3'h5 == _T_188[2:0] ? io_robIdx_4 : _GEN_101; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_134 = 3'h6 == _T_188[2:0] ? io_robIdx_4 : _GEN_102; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_135 = 3'h7 == _T_188[2:0] ? io_robIdx_4 : _GEN_103; // @[Scoreboard.scala 62:{38,38}]
  wire [6:0] _GEN_145 = 3'h1 == Idx_order_4[2:0] ? io_opcode_1 : io_opcode_0; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_146 = 3'h2 == Idx_order_4[2:0] ? io_opcode_2 : _GEN_145; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_147 = 3'h3 == Idx_order_4[2:0] ? io_opcode_3 : _GEN_146; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_148 = 3'h4 == Idx_order_4[2:0] ? io_opcode_4 : _GEN_147; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_149 = 3'h5 == Idx_order_4[2:0] ? io_opcode_5 : _GEN_148; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_150 = 3'h6 == Idx_order_4[2:0] ? io_opcode_6 : _GEN_149; // @[Scoreboard.scala 64:{21,21}]
  wire [3:0] _GEN_160 = 3'h0 == _T_226[2:0] ? io_robIdx_5 : _GEN_128; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_161 = 3'h1 == _T_226[2:0] ? io_robIdx_5 : _GEN_129; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_162 = 3'h2 == _T_226[2:0] ? io_robIdx_5 : _GEN_130; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_163 = 3'h3 == _T_226[2:0] ? io_robIdx_5 : _GEN_131; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_164 = 3'h4 == _T_226[2:0] ? io_robIdx_5 : _GEN_132; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_165 = 3'h5 == _T_226[2:0] ? io_robIdx_5 : _GEN_133; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_166 = 3'h6 == _T_226[2:0] ? io_robIdx_5 : _GEN_134; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_167 = 3'h7 == _T_226[2:0] ? io_robIdx_5 : _GEN_135; // @[Scoreboard.scala 62:{38,38}]
  wire [6:0] _GEN_177 = 3'h1 == Idx_order_5[2:0] ? io_opcode_1 : io_opcode_0; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_178 = 3'h2 == Idx_order_5[2:0] ? io_opcode_2 : _GEN_177; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_179 = 3'h3 == Idx_order_5[2:0] ? io_opcode_3 : _GEN_178; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_180 = 3'h4 == Idx_order_5[2:0] ? io_opcode_4 : _GEN_179; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_181 = 3'h5 == Idx_order_5[2:0] ? io_opcode_5 : _GEN_180; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_182 = 3'h6 == Idx_order_5[2:0] ? io_opcode_6 : _GEN_181; // @[Scoreboard.scala 64:{21,21}]
  wire [3:0] _GEN_192 = 3'h0 == _T_264[2:0] ? io_robIdx_6 : _GEN_160; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_193 = 3'h1 == _T_264[2:0] ? io_robIdx_6 : _GEN_161; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_194 = 3'h2 == _T_264[2:0] ? io_robIdx_6 : _GEN_162; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_195 = 3'h3 == _T_264[2:0] ? io_robIdx_6 : _GEN_163; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_196 = 3'h4 == _T_264[2:0] ? io_robIdx_6 : _GEN_164; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_197 = 3'h5 == _T_264[2:0] ? io_robIdx_6 : _GEN_165; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_198 = 3'h6 == _T_264[2:0] ? io_robIdx_6 : _GEN_166; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] _GEN_199 = 3'h7 == _T_264[2:0] ? io_robIdx_6 : _GEN_167; // @[Scoreboard.scala 62:{38,38}]
  wire [6:0] _GEN_209 = 3'h1 == Idx_order_6[2:0] ? io_opcode_1 : io_opcode_0; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_210 = 3'h2 == Idx_order_6[2:0] ? io_opcode_2 : _GEN_209; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_211 = 3'h3 == Idx_order_6[2:0] ? io_opcode_3 : _GEN_210; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_212 = 3'h4 == Idx_order_6[2:0] ? io_opcode_4 : _GEN_211; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_213 = 3'h5 == Idx_order_6[2:0] ? io_opcode_5 : _GEN_212; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_214 = 3'h6 == Idx_order_6[2:0] ? io_opcode_6 : _GEN_213; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_241 = 3'h1 == Idx_order_7[2:0] ? io_opcode_1 : io_opcode_0; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_242 = 3'h2 == Idx_order_7[2:0] ? io_opcode_2 : _GEN_241; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_243 = 3'h3 == Idx_order_7[2:0] ? io_opcode_3 : _GEN_242; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_244 = 3'h4 == Idx_order_7[2:0] ? io_opcode_4 : _GEN_243; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_245 = 3'h5 == Idx_order_7[2:0] ? io_opcode_5 : _GEN_244; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_246 = 3'h6 == Idx_order_7[2:0] ? io_opcode_6 : _GEN_245; // @[Scoreboard.scala 64:{21,21}]
  wire [5:0] enq_offset_0 = 6'h0; // @[Scoreboard.scala 30:34 45:14]
  wire [5:0] _GEN_1639 = {{1'd0}, writePtr[4:0]}; // @[Scoreboard.scala 71:35]
  wire [5:0] _T_309 = _GEN_1639 + enq_offset_0; // @[Scoreboard.scala 71:35]
  wire [6:0] _io_opcode_opcode_order_0_T = 3'h7 == Idx_order_0[2:0] ? io_opcode_7 : _GEN_22; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] opcode_order_0 = 3'h7 == Idx_order_0[2:0] ? io_opcode_7 : _GEN_22; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_256 = 5'h0 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_0; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_257 = 5'h1 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_1; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_258 = 5'h2 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_2; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_259 = 5'h3 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_3; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_260 = 5'h4 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_4; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_261 = 5'h5 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_5; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_262 = 5'h6 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_6; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_263 = 5'h7 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_7; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_264 = 5'h8 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_8; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_265 = 5'h9 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_9; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_266 = 5'ha == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_10; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_267 = 5'hb == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_11; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_268 = 5'hc == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_12; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_269 = 5'hd == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_13; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_270 = 5'he == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_14; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_271 = 5'hf == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_15; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_272 = 5'h10 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_16; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_273 = 5'h11 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_17; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_274 = 5'h12 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_18; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_275 = 5'h13 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_19; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_276 = 5'h14 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_20; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_277 = 5'h15 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_21; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_278 = 5'h16 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_22; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_279 = 5'h17 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_23; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_280 = 5'h18 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_24; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_281 = 5'h19 == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_25; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_282 = 5'h1a == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_26; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_283 = 5'h1b == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_27; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_284 = 5'h1c == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_28; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_285 = 5'h1d == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_29; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_286 = 5'h1e == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_30; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [6:0] _GEN_287 = 5'h1f == _T_309[4:0] ? _io_opcode_opcode_order_0_T : opcode_array_31; // @[Scoreboard.scala 32:35 71:{51,51}]
  wire [1:0] _GEN_288 = 5'h0 == _T_309[4:0] ? 2'h1 : state_array_0; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_289 = 5'h1 == _T_309[4:0] ? 2'h1 : state_array_1; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_290 = 5'h2 == _T_309[4:0] ? 2'h1 : state_array_2; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_291 = 5'h3 == _T_309[4:0] ? 2'h1 : state_array_3; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_292 = 5'h4 == _T_309[4:0] ? 2'h1 : state_array_4; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_293 = 5'h5 == _T_309[4:0] ? 2'h1 : state_array_5; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_294 = 5'h6 == _T_309[4:0] ? 2'h1 : state_array_6; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_295 = 5'h7 == _T_309[4:0] ? 2'h1 : state_array_7; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_296 = 5'h8 == _T_309[4:0] ? 2'h1 : state_array_8; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_297 = 5'h9 == _T_309[4:0] ? 2'h1 : state_array_9; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_298 = 5'ha == _T_309[4:0] ? 2'h1 : state_array_10; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_299 = 5'hb == _T_309[4:0] ? 2'h1 : state_array_11; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_300 = 5'hc == _T_309[4:0] ? 2'h1 : state_array_12; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_301 = 5'hd == _T_309[4:0] ? 2'h1 : state_array_13; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_302 = 5'he == _T_309[4:0] ? 2'h1 : state_array_14; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_303 = 5'hf == _T_309[4:0] ? 2'h1 : state_array_15; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_304 = 5'h10 == _T_309[4:0] ? 2'h1 : state_array_16; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_305 = 5'h11 == _T_309[4:0] ? 2'h1 : state_array_17; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_306 = 5'h12 == _T_309[4:0] ? 2'h1 : state_array_18; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_307 = 5'h13 == _T_309[4:0] ? 2'h1 : state_array_19; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_308 = 5'h14 == _T_309[4:0] ? 2'h1 : state_array_20; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_309 = 5'h15 == _T_309[4:0] ? 2'h1 : state_array_21; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_310 = 5'h16 == _T_309[4:0] ? 2'h1 : state_array_22; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_311 = 5'h17 == _T_309[4:0] ? 2'h1 : state_array_23; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_312 = 5'h18 == _T_309[4:0] ? 2'h1 : state_array_24; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_313 = 5'h19 == _T_309[4:0] ? 2'h1 : state_array_25; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_314 = 5'h1a == _T_309[4:0] ? 2'h1 : state_array_26; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_315 = 5'h1b == _T_309[4:0] ? 2'h1 : state_array_27; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_316 = 5'h1c == _T_309[4:0] ? 2'h1 : state_array_28; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_317 = 5'h1d == _T_309[4:0] ? 2'h1 : state_array_29; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_318 = 5'h1e == _T_309[4:0] ? 2'h1 : state_array_30; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [1:0] _GEN_319 = 5'h1f == _T_309[4:0] ? 2'h1 : state_array_31; // @[Scoreboard.scala 33:38 72:{50,50}]
  wire [6:0] _GEN_320 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_256 : opcode_array_0; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_321 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_257 : opcode_array_1; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_322 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_258 : opcode_array_2; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_323 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_259 : opcode_array_3; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_324 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_260 : opcode_array_4; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_325 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_261 : opcode_array_5; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_326 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_262 : opcode_array_6; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_327 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_263 : opcode_array_7; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_328 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_264 : opcode_array_8; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_329 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_265 : opcode_array_9; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_330 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_266 : opcode_array_10; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_331 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_267 : opcode_array_11; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_332 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_268 : opcode_array_12; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_333 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_269 : opcode_array_13; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_334 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_270 : opcode_array_14; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_335 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_271 : opcode_array_15; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_336 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_272 : opcode_array_16; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_337 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_273 : opcode_array_17; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_338 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_274 : opcode_array_18; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_339 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_275 : opcode_array_19; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_340 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_276 : opcode_array_20; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_341 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_277 : opcode_array_21; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_342 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_278 : opcode_array_22; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_343 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_279 : opcode_array_23; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_344 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_280 : opcode_array_24; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_345 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_281 : opcode_array_25; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_346 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_282 : opcode_array_26; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_347 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_283 : opcode_array_27; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_348 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_284 : opcode_array_28; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_349 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_285 : opcode_array_29; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_350 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_286 : opcode_array_30; // @[Scoreboard.scala 32:35 70:65]
  wire [6:0] _GEN_351 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_287 : opcode_array_31; // @[Scoreboard.scala 32:35 70:65]
  wire [1:0] _GEN_352 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_288 : state_array_0; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_353 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_289 : state_array_1; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_354 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_290 : state_array_2; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_355 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_291 : state_array_3; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_356 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_292 : state_array_4; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_357 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_293 : state_array_5; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_358 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_294 : state_array_6; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_359 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_295 : state_array_7; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_360 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_296 : state_array_8; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_361 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_297 : state_array_9; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_362 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_298 : state_array_10; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_363 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_299 : state_array_11; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_364 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_300 : state_array_12; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_365 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_301 : state_array_13; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_366 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_302 : state_array_14; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_367 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_303 : state_array_15; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_368 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_304 : state_array_16; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_369 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_305 : state_array_17; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_370 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_306 : state_array_18; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_371 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_307 : state_array_19; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_372 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_308 : state_array_20; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_373 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_309 : state_array_21; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_374 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_310 : state_array_22; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_375 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_311 : state_array_23; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_376 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_312 : state_array_24; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_377 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_313 : state_array_25; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_378 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_314 : state_array_26; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_379 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_315 : state_array_27; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_380 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_316 : state_array_28; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_381 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_317 : state_array_29; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_382 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_318 : state_array_30; // @[Scoreboard.scala 33:38 70:65]
  wire [1:0] _GEN_383 = state_array_0 == 2'h0 & _io_valid_valid_order_0_T ? _GEN_319 : state_array_31; // @[Scoreboard.scala 33:38 70:65]
  wire [5:0] enq_offset_1 = {{5'd0}, _io_valid_valid_order_0_T}; // @[Scoreboard.scala 30:34 45:14]
  wire [5:0] _T_320 = _GEN_1639 + enq_offset_1; // @[Scoreboard.scala 71:35]
  wire [6:0] _io_opcode_opcode_order_1_T = 3'h7 == Idx_order_1[2:0] ? io_opcode_7 : _GEN_54; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] opcode_order_1 = 3'h7 == Idx_order_1[2:0] ? io_opcode_7 : _GEN_54; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_384 = 5'h0 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_320; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_385 = 5'h1 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_321; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_386 = 5'h2 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_322; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_387 = 5'h3 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_323; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_388 = 5'h4 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_324; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_389 = 5'h5 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_325; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_390 = 5'h6 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_326; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_391 = 5'h7 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_327; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_392 = 5'h8 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_328; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_393 = 5'h9 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_329; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_394 = 5'ha == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_330; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_395 = 5'hb == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_331; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_396 = 5'hc == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_332; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_397 = 5'hd == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_333; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_398 = 5'he == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_334; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_399 = 5'hf == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_335; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_400 = 5'h10 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_336; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_401 = 5'h11 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_337; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_402 = 5'h12 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_338; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_403 = 5'h13 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_339; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_404 = 5'h14 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_340; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_405 = 5'h15 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_341; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_406 = 5'h16 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_342; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_407 = 5'h17 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_343; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_408 = 5'h18 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_344; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_409 = 5'h19 == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_345; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_410 = 5'h1a == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_346; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_411 = 5'h1b == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_347; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_412 = 5'h1c == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_348; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_413 = 5'h1d == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_349; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_414 = 5'h1e == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_350; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_415 = 5'h1f == _T_320[4:0] ? _io_opcode_opcode_order_1_T : _GEN_351; // @[Scoreboard.scala 71:{51,51}]
  wire [1:0] _GEN_416 = 5'h0 == _T_320[4:0] ? 2'h1 : _GEN_352; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_417 = 5'h1 == _T_320[4:0] ? 2'h1 : _GEN_353; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_418 = 5'h2 == _T_320[4:0] ? 2'h1 : _GEN_354; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_419 = 5'h3 == _T_320[4:0] ? 2'h1 : _GEN_355; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_420 = 5'h4 == _T_320[4:0] ? 2'h1 : _GEN_356; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_421 = 5'h5 == _T_320[4:0] ? 2'h1 : _GEN_357; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_422 = 5'h6 == _T_320[4:0] ? 2'h1 : _GEN_358; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_423 = 5'h7 == _T_320[4:0] ? 2'h1 : _GEN_359; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_424 = 5'h8 == _T_320[4:0] ? 2'h1 : _GEN_360; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_425 = 5'h9 == _T_320[4:0] ? 2'h1 : _GEN_361; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_426 = 5'ha == _T_320[4:0] ? 2'h1 : _GEN_362; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_427 = 5'hb == _T_320[4:0] ? 2'h1 : _GEN_363; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_428 = 5'hc == _T_320[4:0] ? 2'h1 : _GEN_364; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_429 = 5'hd == _T_320[4:0] ? 2'h1 : _GEN_365; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_430 = 5'he == _T_320[4:0] ? 2'h1 : _GEN_366; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_431 = 5'hf == _T_320[4:0] ? 2'h1 : _GEN_367; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_432 = 5'h10 == _T_320[4:0] ? 2'h1 : _GEN_368; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_433 = 5'h11 == _T_320[4:0] ? 2'h1 : _GEN_369; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_434 = 5'h12 == _T_320[4:0] ? 2'h1 : _GEN_370; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_435 = 5'h13 == _T_320[4:0] ? 2'h1 : _GEN_371; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_436 = 5'h14 == _T_320[4:0] ? 2'h1 : _GEN_372; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_437 = 5'h15 == _T_320[4:0] ? 2'h1 : _GEN_373; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_438 = 5'h16 == _T_320[4:0] ? 2'h1 : _GEN_374; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_439 = 5'h17 == _T_320[4:0] ? 2'h1 : _GEN_375; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_440 = 5'h18 == _T_320[4:0] ? 2'h1 : _GEN_376; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_441 = 5'h19 == _T_320[4:0] ? 2'h1 : _GEN_377; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_442 = 5'h1a == _T_320[4:0] ? 2'h1 : _GEN_378; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_443 = 5'h1b == _T_320[4:0] ? 2'h1 : _GEN_379; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_444 = 5'h1c == _T_320[4:0] ? 2'h1 : _GEN_380; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_445 = 5'h1d == _T_320[4:0] ? 2'h1 : _GEN_381; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_446 = 5'h1e == _T_320[4:0] ? 2'h1 : _GEN_382; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_447 = 5'h1f == _T_320[4:0] ? 2'h1 : _GEN_383; // @[Scoreboard.scala 72:{50,50}]
  wire [6:0] _GEN_448 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_384 : _GEN_320; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_449 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_385 : _GEN_321; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_450 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_386 : _GEN_322; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_451 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_387 : _GEN_323; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_452 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_388 : _GEN_324; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_453 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_389 : _GEN_325; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_454 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_390 : _GEN_326; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_455 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_391 : _GEN_327; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_456 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_392 : _GEN_328; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_457 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_393 : _GEN_329; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_458 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_394 : _GEN_330; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_459 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_395 : _GEN_331; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_460 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_396 : _GEN_332; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_461 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_397 : _GEN_333; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_462 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_398 : _GEN_334; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_463 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_399 : _GEN_335; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_464 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_400 : _GEN_336; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_465 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_401 : _GEN_337; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_466 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_402 : _GEN_338; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_467 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_403 : _GEN_339; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_468 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_404 : _GEN_340; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_469 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_405 : _GEN_341; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_470 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_406 : _GEN_342; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_471 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_407 : _GEN_343; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_472 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_408 : _GEN_344; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_473 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_409 : _GEN_345; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_474 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_410 : _GEN_346; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_475 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_411 : _GEN_347; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_476 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_412 : _GEN_348; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_477 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_413 : _GEN_349; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_478 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_414 : _GEN_350; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_479 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_415 : _GEN_351; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_480 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_416 : _GEN_352; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_481 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_417 : _GEN_353; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_482 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_418 : _GEN_354; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_483 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_419 : _GEN_355; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_484 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_420 : _GEN_356; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_485 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_421 : _GEN_357; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_486 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_422 : _GEN_358; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_487 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_423 : _GEN_359; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_488 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_424 : _GEN_360; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_489 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_425 : _GEN_361; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_490 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_426 : _GEN_362; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_491 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_427 : _GEN_363; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_492 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_428 : _GEN_364; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_493 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_429 : _GEN_365; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_494 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_430 : _GEN_366; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_495 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_431 : _GEN_367; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_496 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_432 : _GEN_368; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_497 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_433 : _GEN_369; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_498 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_434 : _GEN_370; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_499 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_435 : _GEN_371; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_500 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_436 : _GEN_372; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_501 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_437 : _GEN_373; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_502 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_438 : _GEN_374; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_503 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_439 : _GEN_375; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_504 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_440 : _GEN_376; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_505 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_441 : _GEN_377; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_506 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_442 : _GEN_378; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_507 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_443 : _GEN_379; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_508 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_444 : _GEN_380; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_509 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_445 : _GEN_381; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_510 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_446 : _GEN_382; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_511 = state_array_1 == 2'h0 & _io_valid_valid_order_1_T ? _GEN_447 : _GEN_383; // @[Scoreboard.scala 70:65]
  wire [5:0] enq_offset_2 = {{4'd0}, offset_2}; // @[Scoreboard.scala 30:34 45:14]
  wire [5:0] _T_331 = _GEN_1639 + enq_offset_2; // @[Scoreboard.scala 71:35]
  wire [6:0] _io_opcode_opcode_order_2_T = 3'h7 == Idx_order_2[2:0] ? io_opcode_7 : _GEN_86; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] opcode_order_2 = 3'h7 == Idx_order_2[2:0] ? io_opcode_7 : _GEN_86; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_512 = 5'h0 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_448; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_513 = 5'h1 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_449; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_514 = 5'h2 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_450; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_515 = 5'h3 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_451; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_516 = 5'h4 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_452; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_517 = 5'h5 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_453; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_518 = 5'h6 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_454; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_519 = 5'h7 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_455; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_520 = 5'h8 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_456; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_521 = 5'h9 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_457; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_522 = 5'ha == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_458; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_523 = 5'hb == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_459; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_524 = 5'hc == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_460; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_525 = 5'hd == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_461; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_526 = 5'he == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_462; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_527 = 5'hf == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_463; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_528 = 5'h10 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_464; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_529 = 5'h11 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_465; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_530 = 5'h12 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_466; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_531 = 5'h13 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_467; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_532 = 5'h14 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_468; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_533 = 5'h15 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_469; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_534 = 5'h16 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_470; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_535 = 5'h17 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_471; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_536 = 5'h18 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_472; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_537 = 5'h19 == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_473; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_538 = 5'h1a == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_474; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_539 = 5'h1b == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_475; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_540 = 5'h1c == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_476; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_541 = 5'h1d == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_477; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_542 = 5'h1e == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_478; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_543 = 5'h1f == _T_331[4:0] ? _io_opcode_opcode_order_2_T : _GEN_479; // @[Scoreboard.scala 71:{51,51}]
  wire [1:0] _GEN_544 = 5'h0 == _T_331[4:0] ? 2'h1 : _GEN_480; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_545 = 5'h1 == _T_331[4:0] ? 2'h1 : _GEN_481; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_546 = 5'h2 == _T_331[4:0] ? 2'h1 : _GEN_482; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_547 = 5'h3 == _T_331[4:0] ? 2'h1 : _GEN_483; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_548 = 5'h4 == _T_331[4:0] ? 2'h1 : _GEN_484; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_549 = 5'h5 == _T_331[4:0] ? 2'h1 : _GEN_485; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_550 = 5'h6 == _T_331[4:0] ? 2'h1 : _GEN_486; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_551 = 5'h7 == _T_331[4:0] ? 2'h1 : _GEN_487; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_552 = 5'h8 == _T_331[4:0] ? 2'h1 : _GEN_488; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_553 = 5'h9 == _T_331[4:0] ? 2'h1 : _GEN_489; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_554 = 5'ha == _T_331[4:0] ? 2'h1 : _GEN_490; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_555 = 5'hb == _T_331[4:0] ? 2'h1 : _GEN_491; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_556 = 5'hc == _T_331[4:0] ? 2'h1 : _GEN_492; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_557 = 5'hd == _T_331[4:0] ? 2'h1 : _GEN_493; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_558 = 5'he == _T_331[4:0] ? 2'h1 : _GEN_494; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_559 = 5'hf == _T_331[4:0] ? 2'h1 : _GEN_495; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_560 = 5'h10 == _T_331[4:0] ? 2'h1 : _GEN_496; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_561 = 5'h11 == _T_331[4:0] ? 2'h1 : _GEN_497; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_562 = 5'h12 == _T_331[4:0] ? 2'h1 : _GEN_498; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_563 = 5'h13 == _T_331[4:0] ? 2'h1 : _GEN_499; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_564 = 5'h14 == _T_331[4:0] ? 2'h1 : _GEN_500; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_565 = 5'h15 == _T_331[4:0] ? 2'h1 : _GEN_501; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_566 = 5'h16 == _T_331[4:0] ? 2'h1 : _GEN_502; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_567 = 5'h17 == _T_331[4:0] ? 2'h1 : _GEN_503; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_568 = 5'h18 == _T_331[4:0] ? 2'h1 : _GEN_504; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_569 = 5'h19 == _T_331[4:0] ? 2'h1 : _GEN_505; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_570 = 5'h1a == _T_331[4:0] ? 2'h1 : _GEN_506; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_571 = 5'h1b == _T_331[4:0] ? 2'h1 : _GEN_507; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_572 = 5'h1c == _T_331[4:0] ? 2'h1 : _GEN_508; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_573 = 5'h1d == _T_331[4:0] ? 2'h1 : _GEN_509; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_574 = 5'h1e == _T_331[4:0] ? 2'h1 : _GEN_510; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_575 = 5'h1f == _T_331[4:0] ? 2'h1 : _GEN_511; // @[Scoreboard.scala 72:{50,50}]
  wire [6:0] _GEN_576 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_512 : _GEN_448; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_577 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_513 : _GEN_449; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_578 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_514 : _GEN_450; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_579 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_515 : _GEN_451; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_580 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_516 : _GEN_452; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_581 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_517 : _GEN_453; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_582 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_518 : _GEN_454; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_583 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_519 : _GEN_455; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_584 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_520 : _GEN_456; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_585 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_521 : _GEN_457; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_586 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_522 : _GEN_458; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_587 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_523 : _GEN_459; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_588 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_524 : _GEN_460; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_589 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_525 : _GEN_461; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_590 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_526 : _GEN_462; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_591 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_527 : _GEN_463; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_592 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_528 : _GEN_464; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_593 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_529 : _GEN_465; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_594 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_530 : _GEN_466; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_595 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_531 : _GEN_467; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_596 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_532 : _GEN_468; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_597 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_533 : _GEN_469; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_598 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_534 : _GEN_470; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_599 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_535 : _GEN_471; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_600 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_536 : _GEN_472; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_601 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_537 : _GEN_473; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_602 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_538 : _GEN_474; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_603 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_539 : _GEN_475; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_604 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_540 : _GEN_476; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_605 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_541 : _GEN_477; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_606 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_542 : _GEN_478; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_607 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_543 : _GEN_479; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_608 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_544 : _GEN_480; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_609 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_545 : _GEN_481; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_610 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_546 : _GEN_482; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_611 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_547 : _GEN_483; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_612 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_548 : _GEN_484; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_613 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_549 : _GEN_485; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_614 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_550 : _GEN_486; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_615 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_551 : _GEN_487; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_616 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_552 : _GEN_488; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_617 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_553 : _GEN_489; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_618 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_554 : _GEN_490; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_619 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_555 : _GEN_491; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_620 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_556 : _GEN_492; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_621 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_557 : _GEN_493; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_622 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_558 : _GEN_494; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_623 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_559 : _GEN_495; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_624 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_560 : _GEN_496; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_625 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_561 : _GEN_497; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_626 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_562 : _GEN_498; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_627 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_563 : _GEN_499; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_628 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_564 : _GEN_500; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_629 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_565 : _GEN_501; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_630 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_566 : _GEN_502; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_631 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_567 : _GEN_503; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_632 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_568 : _GEN_504; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_633 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_569 : _GEN_505; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_634 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_570 : _GEN_506; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_635 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_571 : _GEN_507; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_636 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_572 : _GEN_508; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_637 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_573 : _GEN_509; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_638 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_574 : _GEN_510; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_639 = state_array_2 == 2'h0 & _io_valid_valid_order_2_T ? _GEN_575 : _GEN_511; // @[Scoreboard.scala 70:65]
  wire [5:0] enq_offset_3 = {{4'd0}, offset_3}; // @[Scoreboard.scala 30:34 45:14]
  wire [5:0] _T_342 = _GEN_1639 + enq_offset_3; // @[Scoreboard.scala 71:35]
  wire [6:0] _io_opcode_opcode_order_3_T = 3'h7 == Idx_order_3[2:0] ? io_opcode_7 : _GEN_118; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] opcode_order_3 = 3'h7 == Idx_order_3[2:0] ? io_opcode_7 : _GEN_118; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_640 = 5'h0 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_576; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_641 = 5'h1 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_577; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_642 = 5'h2 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_578; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_643 = 5'h3 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_579; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_644 = 5'h4 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_580; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_645 = 5'h5 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_581; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_646 = 5'h6 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_582; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_647 = 5'h7 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_583; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_648 = 5'h8 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_584; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_649 = 5'h9 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_585; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_650 = 5'ha == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_586; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_651 = 5'hb == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_587; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_652 = 5'hc == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_588; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_653 = 5'hd == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_589; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_654 = 5'he == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_590; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_655 = 5'hf == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_591; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_656 = 5'h10 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_592; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_657 = 5'h11 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_593; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_658 = 5'h12 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_594; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_659 = 5'h13 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_595; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_660 = 5'h14 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_596; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_661 = 5'h15 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_597; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_662 = 5'h16 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_598; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_663 = 5'h17 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_599; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_664 = 5'h18 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_600; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_665 = 5'h19 == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_601; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_666 = 5'h1a == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_602; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_667 = 5'h1b == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_603; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_668 = 5'h1c == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_604; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_669 = 5'h1d == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_605; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_670 = 5'h1e == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_606; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_671 = 5'h1f == _T_342[4:0] ? _io_opcode_opcode_order_3_T : _GEN_607; // @[Scoreboard.scala 71:{51,51}]
  wire [1:0] _GEN_672 = 5'h0 == _T_342[4:0] ? 2'h1 : _GEN_608; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_673 = 5'h1 == _T_342[4:0] ? 2'h1 : _GEN_609; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_674 = 5'h2 == _T_342[4:0] ? 2'h1 : _GEN_610; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_675 = 5'h3 == _T_342[4:0] ? 2'h1 : _GEN_611; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_676 = 5'h4 == _T_342[4:0] ? 2'h1 : _GEN_612; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_677 = 5'h5 == _T_342[4:0] ? 2'h1 : _GEN_613; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_678 = 5'h6 == _T_342[4:0] ? 2'h1 : _GEN_614; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_679 = 5'h7 == _T_342[4:0] ? 2'h1 : _GEN_615; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_680 = 5'h8 == _T_342[4:0] ? 2'h1 : _GEN_616; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_681 = 5'h9 == _T_342[4:0] ? 2'h1 : _GEN_617; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_682 = 5'ha == _T_342[4:0] ? 2'h1 : _GEN_618; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_683 = 5'hb == _T_342[4:0] ? 2'h1 : _GEN_619; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_684 = 5'hc == _T_342[4:0] ? 2'h1 : _GEN_620; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_685 = 5'hd == _T_342[4:0] ? 2'h1 : _GEN_621; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_686 = 5'he == _T_342[4:0] ? 2'h1 : _GEN_622; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_687 = 5'hf == _T_342[4:0] ? 2'h1 : _GEN_623; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_688 = 5'h10 == _T_342[4:0] ? 2'h1 : _GEN_624; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_689 = 5'h11 == _T_342[4:0] ? 2'h1 : _GEN_625; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_690 = 5'h12 == _T_342[4:0] ? 2'h1 : _GEN_626; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_691 = 5'h13 == _T_342[4:0] ? 2'h1 : _GEN_627; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_692 = 5'h14 == _T_342[4:0] ? 2'h1 : _GEN_628; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_693 = 5'h15 == _T_342[4:0] ? 2'h1 : _GEN_629; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_694 = 5'h16 == _T_342[4:0] ? 2'h1 : _GEN_630; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_695 = 5'h17 == _T_342[4:0] ? 2'h1 : _GEN_631; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_696 = 5'h18 == _T_342[4:0] ? 2'h1 : _GEN_632; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_697 = 5'h19 == _T_342[4:0] ? 2'h1 : _GEN_633; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_698 = 5'h1a == _T_342[4:0] ? 2'h1 : _GEN_634; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_699 = 5'h1b == _T_342[4:0] ? 2'h1 : _GEN_635; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_700 = 5'h1c == _T_342[4:0] ? 2'h1 : _GEN_636; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_701 = 5'h1d == _T_342[4:0] ? 2'h1 : _GEN_637; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_702 = 5'h1e == _T_342[4:0] ? 2'h1 : _GEN_638; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_703 = 5'h1f == _T_342[4:0] ? 2'h1 : _GEN_639; // @[Scoreboard.scala 72:{50,50}]
  wire [6:0] _GEN_704 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_640 : _GEN_576; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_705 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_641 : _GEN_577; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_706 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_642 : _GEN_578; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_707 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_643 : _GEN_579; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_708 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_644 : _GEN_580; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_709 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_645 : _GEN_581; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_710 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_646 : _GEN_582; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_711 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_647 : _GEN_583; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_712 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_648 : _GEN_584; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_713 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_649 : _GEN_585; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_714 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_650 : _GEN_586; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_715 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_651 : _GEN_587; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_716 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_652 : _GEN_588; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_717 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_653 : _GEN_589; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_718 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_654 : _GEN_590; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_719 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_655 : _GEN_591; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_720 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_656 : _GEN_592; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_721 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_657 : _GEN_593; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_722 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_658 : _GEN_594; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_723 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_659 : _GEN_595; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_724 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_660 : _GEN_596; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_725 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_661 : _GEN_597; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_726 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_662 : _GEN_598; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_727 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_663 : _GEN_599; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_728 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_664 : _GEN_600; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_729 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_665 : _GEN_601; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_730 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_666 : _GEN_602; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_731 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_667 : _GEN_603; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_732 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_668 : _GEN_604; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_733 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_669 : _GEN_605; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_734 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_670 : _GEN_606; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_735 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_671 : _GEN_607; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_736 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_672 : _GEN_608; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_737 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_673 : _GEN_609; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_738 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_674 : _GEN_610; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_739 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_675 : _GEN_611; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_740 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_676 : _GEN_612; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_741 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_677 : _GEN_613; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_742 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_678 : _GEN_614; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_743 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_679 : _GEN_615; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_744 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_680 : _GEN_616; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_745 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_681 : _GEN_617; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_746 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_682 : _GEN_618; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_747 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_683 : _GEN_619; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_748 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_684 : _GEN_620; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_749 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_685 : _GEN_621; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_750 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_686 : _GEN_622; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_751 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_687 : _GEN_623; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_752 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_688 : _GEN_624; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_753 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_689 : _GEN_625; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_754 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_690 : _GEN_626; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_755 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_691 : _GEN_627; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_756 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_692 : _GEN_628; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_757 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_693 : _GEN_629; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_758 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_694 : _GEN_630; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_759 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_695 : _GEN_631; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_760 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_696 : _GEN_632; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_761 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_697 : _GEN_633; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_762 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_698 : _GEN_634; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_763 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_699 : _GEN_635; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_764 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_700 : _GEN_636; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_765 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_701 : _GEN_637; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_766 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_702 : _GEN_638; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_767 = state_array_3 == 2'h0 & _io_valid_valid_order_3_T ? _GEN_703 : _GEN_639; // @[Scoreboard.scala 70:65]
  wire [5:0] enq_offset_4 = {{3'd0}, offset_4}; // @[Scoreboard.scala 30:34 45:14]
  wire [5:0] _T_353 = _GEN_1639 + enq_offset_4; // @[Scoreboard.scala 71:35]
  wire [6:0] _io_opcode_opcode_order_4_T = 3'h7 == Idx_order_4[2:0] ? io_opcode_7 : _GEN_150; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] opcode_order_4 = 3'h7 == Idx_order_4[2:0] ? io_opcode_7 : _GEN_150; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_768 = 5'h0 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_704; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_769 = 5'h1 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_705; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_770 = 5'h2 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_706; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_771 = 5'h3 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_707; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_772 = 5'h4 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_708; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_773 = 5'h5 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_709; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_774 = 5'h6 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_710; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_775 = 5'h7 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_711; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_776 = 5'h8 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_712; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_777 = 5'h9 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_713; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_778 = 5'ha == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_714; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_779 = 5'hb == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_715; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_780 = 5'hc == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_716; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_781 = 5'hd == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_717; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_782 = 5'he == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_718; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_783 = 5'hf == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_719; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_784 = 5'h10 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_720; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_785 = 5'h11 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_721; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_786 = 5'h12 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_722; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_787 = 5'h13 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_723; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_788 = 5'h14 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_724; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_789 = 5'h15 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_725; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_790 = 5'h16 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_726; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_791 = 5'h17 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_727; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_792 = 5'h18 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_728; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_793 = 5'h19 == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_729; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_794 = 5'h1a == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_730; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_795 = 5'h1b == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_731; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_796 = 5'h1c == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_732; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_797 = 5'h1d == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_733; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_798 = 5'h1e == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_734; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_799 = 5'h1f == _T_353[4:0] ? _io_opcode_opcode_order_4_T : _GEN_735; // @[Scoreboard.scala 71:{51,51}]
  wire [1:0] _GEN_800 = 5'h0 == _T_353[4:0] ? 2'h1 : _GEN_736; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_801 = 5'h1 == _T_353[4:0] ? 2'h1 : _GEN_737; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_802 = 5'h2 == _T_353[4:0] ? 2'h1 : _GEN_738; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_803 = 5'h3 == _T_353[4:0] ? 2'h1 : _GEN_739; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_804 = 5'h4 == _T_353[4:0] ? 2'h1 : _GEN_740; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_805 = 5'h5 == _T_353[4:0] ? 2'h1 : _GEN_741; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_806 = 5'h6 == _T_353[4:0] ? 2'h1 : _GEN_742; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_807 = 5'h7 == _T_353[4:0] ? 2'h1 : _GEN_743; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_808 = 5'h8 == _T_353[4:0] ? 2'h1 : _GEN_744; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_809 = 5'h9 == _T_353[4:0] ? 2'h1 : _GEN_745; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_810 = 5'ha == _T_353[4:0] ? 2'h1 : _GEN_746; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_811 = 5'hb == _T_353[4:0] ? 2'h1 : _GEN_747; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_812 = 5'hc == _T_353[4:0] ? 2'h1 : _GEN_748; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_813 = 5'hd == _T_353[4:0] ? 2'h1 : _GEN_749; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_814 = 5'he == _T_353[4:0] ? 2'h1 : _GEN_750; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_815 = 5'hf == _T_353[4:0] ? 2'h1 : _GEN_751; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_816 = 5'h10 == _T_353[4:0] ? 2'h1 : _GEN_752; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_817 = 5'h11 == _T_353[4:0] ? 2'h1 : _GEN_753; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_818 = 5'h12 == _T_353[4:0] ? 2'h1 : _GEN_754; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_819 = 5'h13 == _T_353[4:0] ? 2'h1 : _GEN_755; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_820 = 5'h14 == _T_353[4:0] ? 2'h1 : _GEN_756; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_821 = 5'h15 == _T_353[4:0] ? 2'h1 : _GEN_757; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_822 = 5'h16 == _T_353[4:0] ? 2'h1 : _GEN_758; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_823 = 5'h17 == _T_353[4:0] ? 2'h1 : _GEN_759; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_824 = 5'h18 == _T_353[4:0] ? 2'h1 : _GEN_760; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_825 = 5'h19 == _T_353[4:0] ? 2'h1 : _GEN_761; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_826 = 5'h1a == _T_353[4:0] ? 2'h1 : _GEN_762; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_827 = 5'h1b == _T_353[4:0] ? 2'h1 : _GEN_763; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_828 = 5'h1c == _T_353[4:0] ? 2'h1 : _GEN_764; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_829 = 5'h1d == _T_353[4:0] ? 2'h1 : _GEN_765; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_830 = 5'h1e == _T_353[4:0] ? 2'h1 : _GEN_766; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_831 = 5'h1f == _T_353[4:0] ? 2'h1 : _GEN_767; // @[Scoreboard.scala 72:{50,50}]
  wire [6:0] _GEN_832 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_768 : _GEN_704; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_833 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_769 : _GEN_705; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_834 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_770 : _GEN_706; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_835 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_771 : _GEN_707; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_836 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_772 : _GEN_708; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_837 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_773 : _GEN_709; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_838 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_774 : _GEN_710; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_839 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_775 : _GEN_711; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_840 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_776 : _GEN_712; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_841 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_777 : _GEN_713; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_842 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_778 : _GEN_714; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_843 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_779 : _GEN_715; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_844 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_780 : _GEN_716; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_845 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_781 : _GEN_717; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_846 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_782 : _GEN_718; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_847 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_783 : _GEN_719; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_848 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_784 : _GEN_720; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_849 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_785 : _GEN_721; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_850 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_786 : _GEN_722; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_851 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_787 : _GEN_723; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_852 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_788 : _GEN_724; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_853 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_789 : _GEN_725; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_854 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_790 : _GEN_726; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_855 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_791 : _GEN_727; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_856 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_792 : _GEN_728; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_857 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_793 : _GEN_729; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_858 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_794 : _GEN_730; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_859 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_795 : _GEN_731; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_860 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_796 : _GEN_732; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_861 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_797 : _GEN_733; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_862 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_798 : _GEN_734; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_863 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_799 : _GEN_735; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_864 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_800 : _GEN_736; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_865 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_801 : _GEN_737; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_866 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_802 : _GEN_738; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_867 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_803 : _GEN_739; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_868 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_804 : _GEN_740; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_869 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_805 : _GEN_741; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_870 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_806 : _GEN_742; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_871 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_807 : _GEN_743; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_872 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_808 : _GEN_744; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_873 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_809 : _GEN_745; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_874 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_810 : _GEN_746; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_875 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_811 : _GEN_747; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_876 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_812 : _GEN_748; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_877 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_813 : _GEN_749; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_878 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_814 : _GEN_750; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_879 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_815 : _GEN_751; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_880 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_816 : _GEN_752; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_881 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_817 : _GEN_753; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_882 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_818 : _GEN_754; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_883 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_819 : _GEN_755; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_884 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_820 : _GEN_756; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_885 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_821 : _GEN_757; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_886 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_822 : _GEN_758; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_887 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_823 : _GEN_759; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_888 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_824 : _GEN_760; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_889 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_825 : _GEN_761; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_890 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_826 : _GEN_762; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_891 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_827 : _GEN_763; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_892 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_828 : _GEN_764; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_893 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_829 : _GEN_765; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_894 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_830 : _GEN_766; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_895 = state_array_4 == 2'h0 & _io_valid_valid_order_4_T ? _GEN_831 : _GEN_767; // @[Scoreboard.scala 70:65]
  wire [5:0] enq_offset_5 = {{3'd0}, offset_5}; // @[Scoreboard.scala 30:34 45:14]
  wire [5:0] _T_364 = _GEN_1639 + enq_offset_5; // @[Scoreboard.scala 71:35]
  wire [6:0] _io_opcode_opcode_order_5_T = 3'h7 == Idx_order_5[2:0] ? io_opcode_7 : _GEN_182; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] opcode_order_5 = 3'h7 == Idx_order_5[2:0] ? io_opcode_7 : _GEN_182; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_896 = 5'h0 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_832; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_897 = 5'h1 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_833; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_898 = 5'h2 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_834; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_899 = 5'h3 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_835; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_900 = 5'h4 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_836; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_901 = 5'h5 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_837; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_902 = 5'h6 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_838; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_903 = 5'h7 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_839; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_904 = 5'h8 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_840; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_905 = 5'h9 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_841; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_906 = 5'ha == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_842; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_907 = 5'hb == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_843; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_908 = 5'hc == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_844; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_909 = 5'hd == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_845; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_910 = 5'he == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_846; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_911 = 5'hf == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_847; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_912 = 5'h10 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_848; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_913 = 5'h11 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_849; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_914 = 5'h12 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_850; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_915 = 5'h13 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_851; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_916 = 5'h14 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_852; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_917 = 5'h15 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_853; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_918 = 5'h16 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_854; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_919 = 5'h17 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_855; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_920 = 5'h18 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_856; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_921 = 5'h19 == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_857; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_922 = 5'h1a == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_858; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_923 = 5'h1b == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_859; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_924 = 5'h1c == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_860; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_925 = 5'h1d == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_861; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_926 = 5'h1e == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_862; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_927 = 5'h1f == _T_364[4:0] ? _io_opcode_opcode_order_5_T : _GEN_863; // @[Scoreboard.scala 71:{51,51}]
  wire [1:0] _GEN_928 = 5'h0 == _T_364[4:0] ? 2'h1 : _GEN_864; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_929 = 5'h1 == _T_364[4:0] ? 2'h1 : _GEN_865; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_930 = 5'h2 == _T_364[4:0] ? 2'h1 : _GEN_866; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_931 = 5'h3 == _T_364[4:0] ? 2'h1 : _GEN_867; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_932 = 5'h4 == _T_364[4:0] ? 2'h1 : _GEN_868; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_933 = 5'h5 == _T_364[4:0] ? 2'h1 : _GEN_869; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_934 = 5'h6 == _T_364[4:0] ? 2'h1 : _GEN_870; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_935 = 5'h7 == _T_364[4:0] ? 2'h1 : _GEN_871; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_936 = 5'h8 == _T_364[4:0] ? 2'h1 : _GEN_872; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_937 = 5'h9 == _T_364[4:0] ? 2'h1 : _GEN_873; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_938 = 5'ha == _T_364[4:0] ? 2'h1 : _GEN_874; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_939 = 5'hb == _T_364[4:0] ? 2'h1 : _GEN_875; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_940 = 5'hc == _T_364[4:0] ? 2'h1 : _GEN_876; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_941 = 5'hd == _T_364[4:0] ? 2'h1 : _GEN_877; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_942 = 5'he == _T_364[4:0] ? 2'h1 : _GEN_878; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_943 = 5'hf == _T_364[4:0] ? 2'h1 : _GEN_879; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_944 = 5'h10 == _T_364[4:0] ? 2'h1 : _GEN_880; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_945 = 5'h11 == _T_364[4:0] ? 2'h1 : _GEN_881; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_946 = 5'h12 == _T_364[4:0] ? 2'h1 : _GEN_882; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_947 = 5'h13 == _T_364[4:0] ? 2'h1 : _GEN_883; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_948 = 5'h14 == _T_364[4:0] ? 2'h1 : _GEN_884; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_949 = 5'h15 == _T_364[4:0] ? 2'h1 : _GEN_885; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_950 = 5'h16 == _T_364[4:0] ? 2'h1 : _GEN_886; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_951 = 5'h17 == _T_364[4:0] ? 2'h1 : _GEN_887; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_952 = 5'h18 == _T_364[4:0] ? 2'h1 : _GEN_888; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_953 = 5'h19 == _T_364[4:0] ? 2'h1 : _GEN_889; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_954 = 5'h1a == _T_364[4:0] ? 2'h1 : _GEN_890; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_955 = 5'h1b == _T_364[4:0] ? 2'h1 : _GEN_891; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_956 = 5'h1c == _T_364[4:0] ? 2'h1 : _GEN_892; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_957 = 5'h1d == _T_364[4:0] ? 2'h1 : _GEN_893; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_958 = 5'h1e == _T_364[4:0] ? 2'h1 : _GEN_894; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_959 = 5'h1f == _T_364[4:0] ? 2'h1 : _GEN_895; // @[Scoreboard.scala 72:{50,50}]
  wire [6:0] _GEN_960 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_896 : _GEN_832; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_961 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_897 : _GEN_833; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_962 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_898 : _GEN_834; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_963 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_899 : _GEN_835; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_964 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_900 : _GEN_836; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_965 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_901 : _GEN_837; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_966 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_902 : _GEN_838; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_967 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_903 : _GEN_839; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_968 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_904 : _GEN_840; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_969 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_905 : _GEN_841; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_970 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_906 : _GEN_842; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_971 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_907 : _GEN_843; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_972 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_908 : _GEN_844; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_973 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_909 : _GEN_845; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_974 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_910 : _GEN_846; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_975 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_911 : _GEN_847; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_976 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_912 : _GEN_848; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_977 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_913 : _GEN_849; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_978 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_914 : _GEN_850; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_979 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_915 : _GEN_851; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_980 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_916 : _GEN_852; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_981 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_917 : _GEN_853; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_982 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_918 : _GEN_854; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_983 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_919 : _GEN_855; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_984 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_920 : _GEN_856; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_985 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_921 : _GEN_857; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_986 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_922 : _GEN_858; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_987 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_923 : _GEN_859; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_988 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_924 : _GEN_860; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_989 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_925 : _GEN_861; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_990 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_926 : _GEN_862; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_991 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_927 : _GEN_863; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_992 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_928 : _GEN_864; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_993 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_929 : _GEN_865; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_994 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_930 : _GEN_866; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_995 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_931 : _GEN_867; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_996 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_932 : _GEN_868; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_997 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_933 : _GEN_869; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_998 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_934 : _GEN_870; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_999 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_935 : _GEN_871; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1000 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_936 : _GEN_872; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1001 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_937 : _GEN_873; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1002 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_938 : _GEN_874; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1003 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_939 : _GEN_875; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1004 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_940 : _GEN_876; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1005 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_941 : _GEN_877; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1006 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_942 : _GEN_878; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1007 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_943 : _GEN_879; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1008 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_944 : _GEN_880; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1009 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_945 : _GEN_881; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1010 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_946 : _GEN_882; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1011 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_947 : _GEN_883; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1012 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_948 : _GEN_884; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1013 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_949 : _GEN_885; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1014 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_950 : _GEN_886; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1015 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_951 : _GEN_887; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1016 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_952 : _GEN_888; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1017 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_953 : _GEN_889; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1018 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_954 : _GEN_890; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1019 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_955 : _GEN_891; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1020 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_956 : _GEN_892; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1021 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_957 : _GEN_893; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1022 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_958 : _GEN_894; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1023 = state_array_5 == 2'h0 & _io_valid_valid_order_5_T ? _GEN_959 : _GEN_895; // @[Scoreboard.scala 70:65]
  wire [5:0] enq_offset_6 = {{3'd0}, offset_6}; // @[Scoreboard.scala 30:34 45:14]
  wire [5:0] _T_375 = _GEN_1639 + enq_offset_6; // @[Scoreboard.scala 71:35]
  wire [6:0] _io_opcode_opcode_order_6_T = 3'h7 == Idx_order_6[2:0] ? io_opcode_7 : _GEN_214; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] opcode_order_6 = 3'h7 == Idx_order_6[2:0] ? io_opcode_7 : _GEN_214; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] _GEN_1024 = 5'h0 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_960; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1025 = 5'h1 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_961; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1026 = 5'h2 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_962; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1027 = 5'h3 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_963; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1028 = 5'h4 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_964; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1029 = 5'h5 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_965; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1030 = 5'h6 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_966; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1031 = 5'h7 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_967; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1032 = 5'h8 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_968; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1033 = 5'h9 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_969; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1034 = 5'ha == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_970; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1035 = 5'hb == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_971; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1036 = 5'hc == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_972; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1037 = 5'hd == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_973; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1038 = 5'he == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_974; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1039 = 5'hf == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_975; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1040 = 5'h10 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_976; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1041 = 5'h11 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_977; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1042 = 5'h12 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_978; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1043 = 5'h13 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_979; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1044 = 5'h14 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_980; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1045 = 5'h15 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_981; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1046 = 5'h16 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_982; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1047 = 5'h17 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_983; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1048 = 5'h18 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_984; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1049 = 5'h19 == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_985; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1050 = 5'h1a == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_986; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1051 = 5'h1b == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_987; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1052 = 5'h1c == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_988; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1053 = 5'h1d == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_989; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1054 = 5'h1e == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_990; // @[Scoreboard.scala 71:{51,51}]
  wire [6:0] _GEN_1055 = 5'h1f == _T_375[4:0] ? _io_opcode_opcode_order_6_T : _GEN_991; // @[Scoreboard.scala 71:{51,51}]
  wire [1:0] _GEN_1056 = 5'h0 == _T_375[4:0] ? 2'h1 : _GEN_992; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1057 = 5'h1 == _T_375[4:0] ? 2'h1 : _GEN_993; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1058 = 5'h2 == _T_375[4:0] ? 2'h1 : _GEN_994; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1059 = 5'h3 == _T_375[4:0] ? 2'h1 : _GEN_995; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1060 = 5'h4 == _T_375[4:0] ? 2'h1 : _GEN_996; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1061 = 5'h5 == _T_375[4:0] ? 2'h1 : _GEN_997; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1062 = 5'h6 == _T_375[4:0] ? 2'h1 : _GEN_998; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1063 = 5'h7 == _T_375[4:0] ? 2'h1 : _GEN_999; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1064 = 5'h8 == _T_375[4:0] ? 2'h1 : _GEN_1000; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1065 = 5'h9 == _T_375[4:0] ? 2'h1 : _GEN_1001; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1066 = 5'ha == _T_375[4:0] ? 2'h1 : _GEN_1002; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1067 = 5'hb == _T_375[4:0] ? 2'h1 : _GEN_1003; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1068 = 5'hc == _T_375[4:0] ? 2'h1 : _GEN_1004; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1069 = 5'hd == _T_375[4:0] ? 2'h1 : _GEN_1005; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1070 = 5'he == _T_375[4:0] ? 2'h1 : _GEN_1006; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1071 = 5'hf == _T_375[4:0] ? 2'h1 : _GEN_1007; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1072 = 5'h10 == _T_375[4:0] ? 2'h1 : _GEN_1008; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1073 = 5'h11 == _T_375[4:0] ? 2'h1 : _GEN_1009; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1074 = 5'h12 == _T_375[4:0] ? 2'h1 : _GEN_1010; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1075 = 5'h13 == _T_375[4:0] ? 2'h1 : _GEN_1011; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1076 = 5'h14 == _T_375[4:0] ? 2'h1 : _GEN_1012; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1077 = 5'h15 == _T_375[4:0] ? 2'h1 : _GEN_1013; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1078 = 5'h16 == _T_375[4:0] ? 2'h1 : _GEN_1014; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1079 = 5'h17 == _T_375[4:0] ? 2'h1 : _GEN_1015; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1080 = 5'h18 == _T_375[4:0] ? 2'h1 : _GEN_1016; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1081 = 5'h19 == _T_375[4:0] ? 2'h1 : _GEN_1017; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1082 = 5'h1a == _T_375[4:0] ? 2'h1 : _GEN_1018; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1083 = 5'h1b == _T_375[4:0] ? 2'h1 : _GEN_1019; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1084 = 5'h1c == _T_375[4:0] ? 2'h1 : _GEN_1020; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1085 = 5'h1d == _T_375[4:0] ? 2'h1 : _GEN_1021; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1086 = 5'h1e == _T_375[4:0] ? 2'h1 : _GEN_1022; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1087 = 5'h1f == _T_375[4:0] ? 2'h1 : _GEN_1023; // @[Scoreboard.scala 72:{50,50}]
  wire [6:0] _GEN_1088 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1024 : _GEN_960; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1089 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1025 : _GEN_961; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1090 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1026 : _GEN_962; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1091 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1027 : _GEN_963; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1092 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1028 : _GEN_964; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1093 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1029 : _GEN_965; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1094 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1030 : _GEN_966; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1095 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1031 : _GEN_967; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1096 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1032 : _GEN_968; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1097 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1033 : _GEN_969; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1098 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1034 : _GEN_970; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1099 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1035 : _GEN_971; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1100 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1036 : _GEN_972; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1101 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1037 : _GEN_973; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1102 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1038 : _GEN_974; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1103 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1039 : _GEN_975; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1104 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1040 : _GEN_976; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1105 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1041 : _GEN_977; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1106 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1042 : _GEN_978; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1107 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1043 : _GEN_979; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1108 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1044 : _GEN_980; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1109 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1045 : _GEN_981; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1110 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1046 : _GEN_982; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1111 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1047 : _GEN_983; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1112 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1048 : _GEN_984; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1113 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1049 : _GEN_985; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1114 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1050 : _GEN_986; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1115 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1051 : _GEN_987; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1116 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1052 : _GEN_988; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1117 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1053 : _GEN_989; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1118 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1054 : _GEN_990; // @[Scoreboard.scala 70:65]
  wire [6:0] _GEN_1119 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1055 : _GEN_991; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1120 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1056 : _GEN_992; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1121 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1057 : _GEN_993; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1122 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1058 : _GEN_994; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1123 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1059 : _GEN_995; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1124 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1060 : _GEN_996; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1125 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1061 : _GEN_997; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1126 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1062 : _GEN_998; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1127 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1063 : _GEN_999; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1128 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1064 : _GEN_1000; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1129 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1065 : _GEN_1001; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1130 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1066 : _GEN_1002; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1131 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1067 : _GEN_1003; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1132 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1068 : _GEN_1004; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1133 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1069 : _GEN_1005; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1134 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1070 : _GEN_1006; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1135 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1071 : _GEN_1007; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1136 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1072 : _GEN_1008; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1137 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1073 : _GEN_1009; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1138 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1074 : _GEN_1010; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1139 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1075 : _GEN_1011; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1140 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1076 : _GEN_1012; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1141 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1077 : _GEN_1013; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1142 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1078 : _GEN_1014; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1143 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1079 : _GEN_1015; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1144 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1080 : _GEN_1016; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1145 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1081 : _GEN_1017; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1146 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1082 : _GEN_1018; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1147 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1083 : _GEN_1019; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1148 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1084 : _GEN_1020; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1149 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1085 : _GEN_1021; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1150 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1086 : _GEN_1022; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1151 = state_array_6 == 2'h0 & _io_valid_valid_order_6_T ? _GEN_1087 : _GEN_1023; // @[Scoreboard.scala 70:65]
  wire [5:0] enq_offset_7 = {{3'd0}, offset_7}; // @[Scoreboard.scala 30:34 45:14]
  wire [5:0] _T_386 = _GEN_1639 + enq_offset_7; // @[Scoreboard.scala 71:35]
  wire [6:0] _io_opcode_opcode_order_7_T = 3'h7 == Idx_order_7[2:0] ? io_opcode_7 : _GEN_246; // @[Scoreboard.scala 64:{21,21}]
  wire [6:0] opcode_order_7 = 3'h7 == Idx_order_7[2:0] ? io_opcode_7 : _GEN_246; // @[Scoreboard.scala 64:{21,21}]
  wire [1:0] _GEN_1184 = 5'h0 == _T_386[4:0] ? 2'h1 : _GEN_1120; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1185 = 5'h1 == _T_386[4:0] ? 2'h1 : _GEN_1121; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1186 = 5'h2 == _T_386[4:0] ? 2'h1 : _GEN_1122; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1187 = 5'h3 == _T_386[4:0] ? 2'h1 : _GEN_1123; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1188 = 5'h4 == _T_386[4:0] ? 2'h1 : _GEN_1124; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1189 = 5'h5 == _T_386[4:0] ? 2'h1 : _GEN_1125; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1190 = 5'h6 == _T_386[4:0] ? 2'h1 : _GEN_1126; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1191 = 5'h7 == _T_386[4:0] ? 2'h1 : _GEN_1127; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1192 = 5'h8 == _T_386[4:0] ? 2'h1 : _GEN_1128; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1193 = 5'h9 == _T_386[4:0] ? 2'h1 : _GEN_1129; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1194 = 5'ha == _T_386[4:0] ? 2'h1 : _GEN_1130; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1195 = 5'hb == _T_386[4:0] ? 2'h1 : _GEN_1131; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1196 = 5'hc == _T_386[4:0] ? 2'h1 : _GEN_1132; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1197 = 5'hd == _T_386[4:0] ? 2'h1 : _GEN_1133; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1198 = 5'he == _T_386[4:0] ? 2'h1 : _GEN_1134; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1199 = 5'hf == _T_386[4:0] ? 2'h1 : _GEN_1135; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1200 = 5'h10 == _T_386[4:0] ? 2'h1 : _GEN_1136; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1201 = 5'h11 == _T_386[4:0] ? 2'h1 : _GEN_1137; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1202 = 5'h12 == _T_386[4:0] ? 2'h1 : _GEN_1138; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1203 = 5'h13 == _T_386[4:0] ? 2'h1 : _GEN_1139; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1204 = 5'h14 == _T_386[4:0] ? 2'h1 : _GEN_1140; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1205 = 5'h15 == _T_386[4:0] ? 2'h1 : _GEN_1141; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1206 = 5'h16 == _T_386[4:0] ? 2'h1 : _GEN_1142; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1207 = 5'h17 == _T_386[4:0] ? 2'h1 : _GEN_1143; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1208 = 5'h18 == _T_386[4:0] ? 2'h1 : _GEN_1144; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1209 = 5'h19 == _T_386[4:0] ? 2'h1 : _GEN_1145; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1210 = 5'h1a == _T_386[4:0] ? 2'h1 : _GEN_1146; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1211 = 5'h1b == _T_386[4:0] ? 2'h1 : _GEN_1147; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1212 = 5'h1c == _T_386[4:0] ? 2'h1 : _GEN_1148; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1213 = 5'h1d == _T_386[4:0] ? 2'h1 : _GEN_1149; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1214 = 5'h1e == _T_386[4:0] ? 2'h1 : _GEN_1150; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1215 = 5'h1f == _T_386[4:0] ? 2'h1 : _GEN_1151; // @[Scoreboard.scala 72:{50,50}]
  wire [1:0] _GEN_1248 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1184 : _GEN_1120; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1249 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1185 : _GEN_1121; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1250 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1186 : _GEN_1122; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1251 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1187 : _GEN_1123; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1252 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1188 : _GEN_1124; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1253 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1189 : _GEN_1125; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1254 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1190 : _GEN_1126; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1255 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1191 : _GEN_1127; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1256 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1192 : _GEN_1128; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1257 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1193 : _GEN_1129; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1258 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1194 : _GEN_1130; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1259 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1195 : _GEN_1131; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1260 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1196 : _GEN_1132; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1261 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1197 : _GEN_1133; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1262 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1198 : _GEN_1134; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1263 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1199 : _GEN_1135; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1264 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1200 : _GEN_1136; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1265 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1201 : _GEN_1137; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1266 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1202 : _GEN_1138; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1267 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1203 : _GEN_1139; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1268 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1204 : _GEN_1140; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1269 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1205 : _GEN_1141; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1270 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1206 : _GEN_1142; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1271 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1207 : _GEN_1143; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1272 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1208 : _GEN_1144; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1273 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1209 : _GEN_1145; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1274 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1210 : _GEN_1146; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1275 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1211 : _GEN_1147; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1276 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1212 : _GEN_1148; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1277 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1213 : _GEN_1149; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1278 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1214 : _GEN_1150; // @[Scoreboard.scala 70:65]
  wire [1:0] _GEN_1279 = state_array_7 == 2'h0 & _io_valid_valid_order_7_T ? _GEN_1215 : _GEN_1151; // @[Scoreboard.scala 70:65]
  wire  _commitConditions_T = state_array_0 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0 = state_array_0 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_0; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1 = state_array_0 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_0; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2 = state_array_0 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_0; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3 = state_array_0 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_0; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4 = state_array_0 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_0; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5 = state_array_0 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_0; // @[Scoreboard.scala 80:55]
  wire  commit_flag = commitConditions_0 | commitConditions_1 | commitConditions_2 | commitConditions_3 |
    commitConditions_4 | commitConditions_5; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_0_T = commit_flag ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1280 = _commitConditions_T ? _state_array_0_T : _GEN_1248; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_18 = state_array_1 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_1 = state_array_1 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_1; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_1 = state_array_1 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_1; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_1 = state_array_1 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_1; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_1 = state_array_1 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_1; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_1 = state_array_1 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_1; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_1 = state_array_1 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_1; // @[Scoreboard.scala 80:55]
  wire  commit_flag_1 = commitConditions_0_1 | commitConditions_1_1 | commitConditions_2_1 | commitConditions_3_1 |
    commitConditions_4_1 | commitConditions_5_1; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_1_T = commit_flag_1 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1281 = _commitConditions_T_18 ? _state_array_1_T : _GEN_1249; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_36 = state_array_2 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_2 = state_array_2 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_2; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_2 = state_array_2 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_2; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_2 = state_array_2 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_2; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_2 = state_array_2 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_2; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_2 = state_array_2 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_2; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_2 = state_array_2 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_2; // @[Scoreboard.scala 80:55]
  wire  commit_flag_2 = commitConditions_0_2 | commitConditions_1_2 | commitConditions_2_2 | commitConditions_3_2 |
    commitConditions_4_2 | commitConditions_5_2; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_2_T = commit_flag_2 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1282 = _commitConditions_T_36 ? _state_array_2_T : _GEN_1250; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_54 = state_array_3 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_3 = state_array_3 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_3; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_3 = state_array_3 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_3; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_3 = state_array_3 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_3; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_3 = state_array_3 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_3; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_3 = state_array_3 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_3; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_3 = state_array_3 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_3; // @[Scoreboard.scala 80:55]
  wire  commit_flag_3 = commitConditions_0_3 | commitConditions_1_3 | commitConditions_2_3 | commitConditions_3_3 |
    commitConditions_4_3 | commitConditions_5_3; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_3_T = commit_flag_3 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1283 = _commitConditions_T_54 ? _state_array_3_T : _GEN_1251; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_72 = state_array_4 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_4 = state_array_4 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_4; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_4 = state_array_4 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_4; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_4 = state_array_4 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_4; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_4 = state_array_4 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_4; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_4 = state_array_4 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_4; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_4 = state_array_4 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_4; // @[Scoreboard.scala 80:55]
  wire  commit_flag_4 = commitConditions_0_4 | commitConditions_1_4 | commitConditions_2_4 | commitConditions_3_4 |
    commitConditions_4_4 | commitConditions_5_4; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_4_T = commit_flag_4 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1284 = _commitConditions_T_72 ? _state_array_4_T : _GEN_1252; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_90 = state_array_5 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_5 = state_array_5 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_5; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_5 = state_array_5 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_5; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_5 = state_array_5 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_5; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_5 = state_array_5 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_5; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_5 = state_array_5 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_5; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_5 = state_array_5 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_5; // @[Scoreboard.scala 80:55]
  wire  commit_flag_5 = commitConditions_0_5 | commitConditions_1_5 | commitConditions_2_5 | commitConditions_3_5 |
    commitConditions_4_5 | commitConditions_5_5; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_5_T = commit_flag_5 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1285 = _commitConditions_T_90 ? _state_array_5_T : _GEN_1253; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_108 = state_array_6 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_6 = state_array_6 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_6; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_6 = state_array_6 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_6; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_6 = state_array_6 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_6; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_6 = state_array_6 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_6; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_6 = state_array_6 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_6; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_6 = state_array_6 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_6; // @[Scoreboard.scala 80:55]
  wire  commit_flag_6 = commitConditions_0_6 | commitConditions_1_6 | commitConditions_2_6 | commitConditions_3_6 |
    commitConditions_4_6 | commitConditions_5_6; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_6_T = commit_flag_6 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1286 = _commitConditions_T_108 ? _state_array_6_T : _GEN_1254; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_126 = state_array_7 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_7 = state_array_7 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_7; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_7 = state_array_7 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_7; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_7 = state_array_7 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_7; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_7 = state_array_7 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_7; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_7 = state_array_7 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_7; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_7 = state_array_7 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_7; // @[Scoreboard.scala 80:55]
  wire  commit_flag_7 = commitConditions_0_7 | commitConditions_1_7 | commitConditions_2_7 | commitConditions_3_7 |
    commitConditions_4_7 | commitConditions_5_7; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_7_T = commit_flag_7 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1287 = _commitConditions_T_126 ? _state_array_7_T : _GEN_1255; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_144 = state_array_8 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_8 = state_array_8 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_8; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_8 = state_array_8 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_8; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_8 = state_array_8 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_8; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_8 = state_array_8 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_8; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_8 = state_array_8 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_8; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_8 = state_array_8 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_8; // @[Scoreboard.scala 80:55]
  wire  commit_flag_8 = commitConditions_0_8 | commitConditions_1_8 | commitConditions_2_8 | commitConditions_3_8 |
    commitConditions_4_8 | commitConditions_5_8; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_8_T = commit_flag_8 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1288 = _commitConditions_T_144 ? _state_array_8_T : _GEN_1256; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_162 = state_array_9 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_9 = state_array_9 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_9; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_9 = state_array_9 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_9; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_9 = state_array_9 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_9; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_9 = state_array_9 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_9; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_9 = state_array_9 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_9; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_9 = state_array_9 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_9; // @[Scoreboard.scala 80:55]
  wire  commit_flag_9 = commitConditions_0_9 | commitConditions_1_9 | commitConditions_2_9 | commitConditions_3_9 |
    commitConditions_4_9 | commitConditions_5_9; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_9_T = commit_flag_9 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1289 = _commitConditions_T_162 ? _state_array_9_T : _GEN_1257; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_180 = state_array_10 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_10 = state_array_10 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_10; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_10 = state_array_10 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_10; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_10 = state_array_10 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_10; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_10 = state_array_10 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_10; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_10 = state_array_10 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_10; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_10 = state_array_10 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_10; // @[Scoreboard.scala 80:55]
  wire  commit_flag_10 = commitConditions_0_10 | commitConditions_1_10 | commitConditions_2_10 | commitConditions_3_10
     | commitConditions_4_10 | commitConditions_5_10; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_10_T = commit_flag_10 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1290 = _commitConditions_T_180 ? _state_array_10_T : _GEN_1258; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_198 = state_array_11 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_11 = state_array_11 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_11; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_11 = state_array_11 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_11; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_11 = state_array_11 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_11; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_11 = state_array_11 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_11; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_11 = state_array_11 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_11; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_11 = state_array_11 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_11; // @[Scoreboard.scala 80:55]
  wire  commit_flag_11 = commitConditions_0_11 | commitConditions_1_11 | commitConditions_2_11 | commitConditions_3_11
     | commitConditions_4_11 | commitConditions_5_11; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_11_T = commit_flag_11 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1291 = _commitConditions_T_198 ? _state_array_11_T : _GEN_1259; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_216 = state_array_12 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_12 = state_array_12 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_12; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_12 = state_array_12 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_12; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_12 = state_array_12 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_12; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_12 = state_array_12 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_12; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_12 = state_array_12 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_12; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_12 = state_array_12 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_12; // @[Scoreboard.scala 80:55]
  wire  commit_flag_12 = commitConditions_0_12 | commitConditions_1_12 | commitConditions_2_12 | commitConditions_3_12
     | commitConditions_4_12 | commitConditions_5_12; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_12_T = commit_flag_12 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1292 = _commitConditions_T_216 ? _state_array_12_T : _GEN_1260; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_234 = state_array_13 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_13 = state_array_13 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_13; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_13 = state_array_13 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_13; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_13 = state_array_13 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_13; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_13 = state_array_13 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_13; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_13 = state_array_13 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_13; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_13 = state_array_13 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_13; // @[Scoreboard.scala 80:55]
  wire  commit_flag_13 = commitConditions_0_13 | commitConditions_1_13 | commitConditions_2_13 | commitConditions_3_13
     | commitConditions_4_13 | commitConditions_5_13; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_13_T = commit_flag_13 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1293 = _commitConditions_T_234 ? _state_array_13_T : _GEN_1261; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_252 = state_array_14 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_14 = state_array_14 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_14; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_14 = state_array_14 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_14; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_14 = state_array_14 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_14; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_14 = state_array_14 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_14; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_14 = state_array_14 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_14; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_14 = state_array_14 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_14; // @[Scoreboard.scala 80:55]
  wire  commit_flag_14 = commitConditions_0_14 | commitConditions_1_14 | commitConditions_2_14 | commitConditions_3_14
     | commitConditions_4_14 | commitConditions_5_14; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_14_T = commit_flag_14 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1294 = _commitConditions_T_252 ? _state_array_14_T : _GEN_1262; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_270 = state_array_15 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_15 = state_array_15 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_15; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_15 = state_array_15 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_15; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_15 = state_array_15 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_15; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_15 = state_array_15 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_15; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_15 = state_array_15 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_15; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_15 = state_array_15 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_15; // @[Scoreboard.scala 80:55]
  wire  commit_flag_15 = commitConditions_0_15 | commitConditions_1_15 | commitConditions_2_15 | commitConditions_3_15
     | commitConditions_4_15 | commitConditions_5_15; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_15_T = commit_flag_15 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1295 = _commitConditions_T_270 ? _state_array_15_T : _GEN_1263; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_288 = state_array_16 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_16 = state_array_16 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_16; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_16 = state_array_16 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_16; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_16 = state_array_16 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_16; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_16 = state_array_16 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_16; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_16 = state_array_16 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_16; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_16 = state_array_16 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_16; // @[Scoreboard.scala 80:55]
  wire  commit_flag_16 = commitConditions_0_16 | commitConditions_1_16 | commitConditions_2_16 | commitConditions_3_16
     | commitConditions_4_16 | commitConditions_5_16; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_16_T = commit_flag_16 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1296 = _commitConditions_T_288 ? _state_array_16_T : _GEN_1264; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_306 = state_array_17 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_17 = state_array_17 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_17; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_17 = state_array_17 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_17; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_17 = state_array_17 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_17; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_17 = state_array_17 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_17; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_17 = state_array_17 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_17; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_17 = state_array_17 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_17; // @[Scoreboard.scala 80:55]
  wire  commit_flag_17 = commitConditions_0_17 | commitConditions_1_17 | commitConditions_2_17 | commitConditions_3_17
     | commitConditions_4_17 | commitConditions_5_17; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_17_T = commit_flag_17 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1297 = _commitConditions_T_306 ? _state_array_17_T : _GEN_1265; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_324 = state_array_18 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_18 = state_array_18 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_18; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_18 = state_array_18 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_18; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_18 = state_array_18 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_18; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_18 = state_array_18 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_18; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_18 = state_array_18 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_18; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_18 = state_array_18 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_18; // @[Scoreboard.scala 80:55]
  wire  commit_flag_18 = commitConditions_0_18 | commitConditions_1_18 | commitConditions_2_18 | commitConditions_3_18
     | commitConditions_4_18 | commitConditions_5_18; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_18_T = commit_flag_18 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1298 = _commitConditions_T_324 ? _state_array_18_T : _GEN_1266; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_342 = state_array_19 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_19 = state_array_19 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_19; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_19 = state_array_19 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_19; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_19 = state_array_19 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_19; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_19 = state_array_19 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_19; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_19 = state_array_19 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_19; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_19 = state_array_19 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_19; // @[Scoreboard.scala 80:55]
  wire  commit_flag_19 = commitConditions_0_19 | commitConditions_1_19 | commitConditions_2_19 | commitConditions_3_19
     | commitConditions_4_19 | commitConditions_5_19; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_19_T = commit_flag_19 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1299 = _commitConditions_T_342 ? _state_array_19_T : _GEN_1267; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_360 = state_array_20 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_20 = state_array_20 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_20; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_20 = state_array_20 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_20; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_20 = state_array_20 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_20; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_20 = state_array_20 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_20; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_20 = state_array_20 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_20; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_20 = state_array_20 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_20; // @[Scoreboard.scala 80:55]
  wire  commit_flag_20 = commitConditions_0_20 | commitConditions_1_20 | commitConditions_2_20 | commitConditions_3_20
     | commitConditions_4_20 | commitConditions_5_20; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_20_T = commit_flag_20 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1300 = _commitConditions_T_360 ? _state_array_20_T : _GEN_1268; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_378 = state_array_21 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_21 = state_array_21 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_21; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_21 = state_array_21 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_21; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_21 = state_array_21 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_21; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_21 = state_array_21 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_21; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_21 = state_array_21 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_21; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_21 = state_array_21 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_21; // @[Scoreboard.scala 80:55]
  wire  commit_flag_21 = commitConditions_0_21 | commitConditions_1_21 | commitConditions_2_21 | commitConditions_3_21
     | commitConditions_4_21 | commitConditions_5_21; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_21_T = commit_flag_21 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1301 = _commitConditions_T_378 ? _state_array_21_T : _GEN_1269; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_396 = state_array_22 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_22 = state_array_22 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_22; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_22 = state_array_22 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_22; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_22 = state_array_22 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_22; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_22 = state_array_22 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_22; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_22 = state_array_22 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_22; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_22 = state_array_22 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_22; // @[Scoreboard.scala 80:55]
  wire  commit_flag_22 = commitConditions_0_22 | commitConditions_1_22 | commitConditions_2_22 | commitConditions_3_22
     | commitConditions_4_22 | commitConditions_5_22; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_22_T = commit_flag_22 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1302 = _commitConditions_T_396 ? _state_array_22_T : _GEN_1270; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_414 = state_array_23 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_23 = state_array_23 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_23; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_23 = state_array_23 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_23; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_23 = state_array_23 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_23; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_23 = state_array_23 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_23; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_23 = state_array_23 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_23; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_23 = state_array_23 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_23; // @[Scoreboard.scala 80:55]
  wire  commit_flag_23 = commitConditions_0_23 | commitConditions_1_23 | commitConditions_2_23 | commitConditions_3_23
     | commitConditions_4_23 | commitConditions_5_23; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_23_T = commit_flag_23 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1303 = _commitConditions_T_414 ? _state_array_23_T : _GEN_1271; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_432 = state_array_24 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_24 = state_array_24 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_24; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_24 = state_array_24 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_24; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_24 = state_array_24 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_24; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_24 = state_array_24 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_24; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_24 = state_array_24 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_24; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_24 = state_array_24 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_24; // @[Scoreboard.scala 80:55]
  wire  commit_flag_24 = commitConditions_0_24 | commitConditions_1_24 | commitConditions_2_24 | commitConditions_3_24
     | commitConditions_4_24 | commitConditions_5_24; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_24_T = commit_flag_24 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1304 = _commitConditions_T_432 ? _state_array_24_T : _GEN_1272; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_450 = state_array_25 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_25 = state_array_25 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_25; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_25 = state_array_25 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_25; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_25 = state_array_25 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_25; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_25 = state_array_25 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_25; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_25 = state_array_25 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_25; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_25 = state_array_25 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_25; // @[Scoreboard.scala 80:55]
  wire  commit_flag_25 = commitConditions_0_25 | commitConditions_1_25 | commitConditions_2_25 | commitConditions_3_25
     | commitConditions_4_25 | commitConditions_5_25; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_25_T = commit_flag_25 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1305 = _commitConditions_T_450 ? _state_array_25_T : _GEN_1273; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_468 = state_array_26 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_26 = state_array_26 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_26; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_26 = state_array_26 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_26; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_26 = state_array_26 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_26; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_26 = state_array_26 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_26; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_26 = state_array_26 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_26; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_26 = state_array_26 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_26; // @[Scoreboard.scala 80:55]
  wire  commit_flag_26 = commitConditions_0_26 | commitConditions_1_26 | commitConditions_2_26 | commitConditions_3_26
     | commitConditions_4_26 | commitConditions_5_26; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_26_T = commit_flag_26 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1306 = _commitConditions_T_468 ? _state_array_26_T : _GEN_1274; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_486 = state_array_27 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_27 = state_array_27 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_27; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_27 = state_array_27 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_27; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_27 = state_array_27 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_27; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_27 = state_array_27 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_27; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_27 = state_array_27 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_27; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_27 = state_array_27 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_27; // @[Scoreboard.scala 80:55]
  wire  commit_flag_27 = commitConditions_0_27 | commitConditions_1_27 | commitConditions_2_27 | commitConditions_3_27
     | commitConditions_4_27 | commitConditions_5_27; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_27_T = commit_flag_27 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1307 = _commitConditions_T_486 ? _state_array_27_T : _GEN_1275; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_504 = state_array_28 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_28 = state_array_28 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_28; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_28 = state_array_28 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_28; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_28 = state_array_28 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_28; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_28 = state_array_28 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_28; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_28 = state_array_28 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_28; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_28 = state_array_28 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_28; // @[Scoreboard.scala 80:55]
  wire  commit_flag_28 = commitConditions_0_28 | commitConditions_1_28 | commitConditions_2_28 | commitConditions_3_28
     | commitConditions_4_28 | commitConditions_5_28; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_28_T = commit_flag_28 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1308 = _commitConditions_T_504 ? _state_array_28_T : _GEN_1276; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_522 = state_array_29 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_29 = state_array_29 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_29; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_29 = state_array_29 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_29; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_29 = state_array_29 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_29; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_29 = state_array_29 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_29; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_29 = state_array_29 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_29; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_29 = state_array_29 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_29; // @[Scoreboard.scala 80:55]
  wire  commit_flag_29 = commitConditions_0_29 | commitConditions_1_29 | commitConditions_2_29 | commitConditions_3_29
     | commitConditions_4_29 | commitConditions_5_29; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_29_T = commit_flag_29 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1309 = _commitConditions_T_522 ? _state_array_29_T : _GEN_1277; // @[Scoreboard.scala 83:37 84:22]
  wire  _commitConditions_T_540 = state_array_30 == 2'h1; // @[Scoreboard.scala 80:22]
  wire  commitConditions_0_30 = state_array_30 == 2'h1 & io_commit_valid_0 & io_commit_pc_0 == opcode_array_30; // @[Scoreboard.scala 80:55]
  wire  commitConditions_1_30 = state_array_30 == 2'h1 & io_commit_valid_1 & io_commit_pc_1 == opcode_array_30; // @[Scoreboard.scala 80:55]
  wire  commitConditions_2_30 = state_array_30 == 2'h1 & io_commit_valid_2 & io_commit_pc_2 == opcode_array_30; // @[Scoreboard.scala 80:55]
  wire  commitConditions_3_30 = state_array_30 == 2'h1 & io_commit_valid_3 & io_commit_pc_3 == opcode_array_30; // @[Scoreboard.scala 80:55]
  wire  commitConditions_4_30 = state_array_30 == 2'h1 & io_commit_valid_4 & io_commit_pc_4 == opcode_array_30; // @[Scoreboard.scala 80:55]
  wire  commitConditions_5_30 = state_array_30 == 2'h1 & io_commit_valid_5 & io_commit_pc_5 == opcode_array_30; // @[Scoreboard.scala 80:55]
  wire  commit_flag_30 = commitConditions_0_30 | commitConditions_1_30 | commitConditions_2_30 | commitConditions_3_30
     | commitConditions_4_30 | commitConditions_5_30; // @[Scoreboard.scala 82:49]
  wire [1:0] _state_array_30_T = commit_flag_30 ? 2'h2 : 2'h1; // @[Scoreboard.scala 84:28]
  wire [1:0] _GEN_1310 = _commitConditions_T_540 ? _state_array_30_T : _GEN_1278; // @[Scoreboard.scala 83:37 84:22]
  wire [7:0] lo_lo = {commitVec_0_7,commitVec_0_6,commitVec_0_5,commitVec_0_4,commitVec_0_3,commitVec_0_2,commitVec_0_1,
    commitVec_0_0}; // @[Scoreboard.scala 96:23]
  wire [15:0] lo = {commitVec_0_15,commitVec_0_14,commitVec_0_13,commitVec_0_12,commitVec_0_11,commitVec_0_10,
    commitVec_0_9,commitVec_0_8,lo_lo}; // @[Scoreboard.scala 96:23]
  wire [7:0] hi_lo = {commitVec_0_23,commitVec_0_22,commitVec_0_21,commitVec_0_20,commitVec_0_19,commitVec_0_18,
    commitVec_0_17,commitVec_0_16}; // @[Scoreboard.scala 96:23]
  wire [31:0] _T_423 = {commitVec_0_31,commitVec_0_30,commitVec_0_29,commitVec_0_28,commitVec_0_27,commitVec_0_26,
    commitVec_0_25,commitVec_0_24,hi_lo,lo}; // @[Scoreboard.scala 96:23]
  wire [4:0] _T_425 = commitVec_0_30 ? 5'h1e : 5'h1f; // @[Mux.scala 47:70]
  wire [4:0] _T_426 = commitVec_0_29 ? 5'h1d : _T_425; // @[Mux.scala 47:70]
  wire [4:0] _T_427 = commitVec_0_28 ? 5'h1c : _T_426; // @[Mux.scala 47:70]
  wire [4:0] _T_428 = commitVec_0_27 ? 5'h1b : _T_427; // @[Mux.scala 47:70]
  wire [4:0] _T_429 = commitVec_0_26 ? 5'h1a : _T_428; // @[Mux.scala 47:70]
  wire [4:0] _T_430 = commitVec_0_25 ? 5'h19 : _T_429; // @[Mux.scala 47:70]
  wire [4:0] _T_431 = commitVec_0_24 ? 5'h18 : _T_430; // @[Mux.scala 47:70]
  wire [4:0] _T_432 = commitVec_0_23 ? 5'h17 : _T_431; // @[Mux.scala 47:70]
  wire [4:0] _T_433 = commitVec_0_22 ? 5'h16 : _T_432; // @[Mux.scala 47:70]
  wire [4:0] _T_434 = commitVec_0_21 ? 5'h15 : _T_433; // @[Mux.scala 47:70]
  wire [4:0] _T_435 = commitVec_0_20 ? 5'h14 : _T_434; // @[Mux.scala 47:70]
  wire [4:0] _T_436 = commitVec_0_19 ? 5'h13 : _T_435; // @[Mux.scala 47:70]
  wire [4:0] _T_437 = commitVec_0_18 ? 5'h12 : _T_436; // @[Mux.scala 47:70]
  wire [4:0] _T_438 = commitVec_0_17 ? 5'h11 : _T_437; // @[Mux.scala 47:70]
  wire [4:0] _T_439 = commitVec_0_16 ? 5'h10 : _T_438; // @[Mux.scala 47:70]
  wire [4:0] _T_440 = commitVec_0_15 ? 5'hf : _T_439; // @[Mux.scala 47:70]
  wire [4:0] _T_441 = commitVec_0_14 ? 5'he : _T_440; // @[Mux.scala 47:70]
  wire [4:0] _T_442 = commitVec_0_13 ? 5'hd : _T_441; // @[Mux.scala 47:70]
  wire [4:0] _T_443 = commitVec_0_12 ? 5'hc : _T_442; // @[Mux.scala 47:70]
  wire [4:0] _T_444 = commitVec_0_11 ? 5'hb : _T_443; // @[Mux.scala 47:70]
  wire [4:0] _T_445 = commitVec_0_10 ? 5'ha : _T_444; // @[Mux.scala 47:70]
  wire [4:0] _T_446 = commitVec_0_9 ? 5'h9 : _T_445; // @[Mux.scala 47:70]
  wire [4:0] _T_447 = commitVec_0_8 ? 5'h8 : _T_446; // @[Mux.scala 47:70]
  wire [4:0] _T_448 = commitVec_0_7 ? 5'h7 : _T_447; // @[Mux.scala 47:70]
  wire [4:0] _T_449 = commitVec_0_6 ? 5'h6 : _T_448; // @[Mux.scala 47:70]
  wire [4:0] _T_450 = commitVec_0_5 ? 5'h5 : _T_449; // @[Mux.scala 47:70]
  wire [4:0] _T_451 = commitVec_0_4 ? 5'h4 : _T_450; // @[Mux.scala 47:70]
  wire [4:0] _T_452 = commitVec_0_3 ? 5'h3 : _T_451; // @[Mux.scala 47:70]
  wire [4:0] _T_453 = commitVec_0_2 ? 5'h2 : _T_452; // @[Mux.scala 47:70]
  wire [4:0] _T_454 = commitVec_0_1 ? 5'h1 : _T_453; // @[Mux.scala 47:70]
  wire [4:0] _T_455 = commitVec_0_0 ? 5'h0 : _T_454; // @[Mux.scala 47:70]
  wire [1:0] _GEN_1311 = 5'h0 == _T_455 ? 2'h3 : _GEN_1280; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1312 = 5'h1 == _T_455 ? 2'h3 : _GEN_1281; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1313 = 5'h2 == _T_455 ? 2'h3 : _GEN_1282; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1314 = 5'h3 == _T_455 ? 2'h3 : _GEN_1283; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1315 = 5'h4 == _T_455 ? 2'h3 : _GEN_1284; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1316 = 5'h5 == _T_455 ? 2'h3 : _GEN_1285; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1317 = 5'h6 == _T_455 ? 2'h3 : _GEN_1286; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1318 = 5'h7 == _T_455 ? 2'h3 : _GEN_1287; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1319 = 5'h8 == _T_455 ? 2'h3 : _GEN_1288; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1320 = 5'h9 == _T_455 ? 2'h3 : _GEN_1289; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1321 = 5'ha == _T_455 ? 2'h3 : _GEN_1290; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1322 = 5'hb == _T_455 ? 2'h3 : _GEN_1291; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1323 = 5'hc == _T_455 ? 2'h3 : _GEN_1292; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1324 = 5'hd == _T_455 ? 2'h3 : _GEN_1293; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1325 = 5'he == _T_455 ? 2'h3 : _GEN_1294; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1326 = 5'hf == _T_455 ? 2'h3 : _GEN_1295; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1327 = 5'h10 == _T_455 ? 2'h3 : _GEN_1296; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1328 = 5'h11 == _T_455 ? 2'h3 : _GEN_1297; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1329 = 5'h12 == _T_455 ? 2'h3 : _GEN_1298; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1330 = 5'h13 == _T_455 ? 2'h3 : _GEN_1299; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1331 = 5'h14 == _T_455 ? 2'h3 : _GEN_1300; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1332 = 5'h15 == _T_455 ? 2'h3 : _GEN_1301; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1333 = 5'h16 == _T_455 ? 2'h3 : _GEN_1302; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1334 = 5'h17 == _T_455 ? 2'h3 : _GEN_1303; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1335 = 5'h18 == _T_455 ? 2'h3 : _GEN_1304; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1336 = 5'h19 == _T_455 ? 2'h3 : _GEN_1305; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1337 = 5'h1a == _T_455 ? 2'h3 : _GEN_1306; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1338 = 5'h1b == _T_455 ? 2'h3 : _GEN_1307; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1339 = 5'h1c == _T_455 ? 2'h3 : _GEN_1308; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1340 = 5'h1d == _T_455 ? 2'h3 : _GEN_1309; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1341 = 5'h1e == _T_455 ? 2'h3 : _GEN_1310; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1342 = 5'h1f == _T_455 ? 2'h3 : _GEN_1279; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1343 = |_T_423 ? _GEN_1311 : _GEN_1280; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1344 = |_T_423 ? _GEN_1312 : _GEN_1281; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1345 = |_T_423 ? _GEN_1313 : _GEN_1282; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1346 = |_T_423 ? _GEN_1314 : _GEN_1283; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1347 = |_T_423 ? _GEN_1315 : _GEN_1284; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1348 = |_T_423 ? _GEN_1316 : _GEN_1285; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1349 = |_T_423 ? _GEN_1317 : _GEN_1286; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1350 = |_T_423 ? _GEN_1318 : _GEN_1287; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1351 = |_T_423 ? _GEN_1319 : _GEN_1288; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1352 = |_T_423 ? _GEN_1320 : _GEN_1289; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1353 = |_T_423 ? _GEN_1321 : _GEN_1290; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1354 = |_T_423 ? _GEN_1322 : _GEN_1291; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1355 = |_T_423 ? _GEN_1323 : _GEN_1292; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1356 = |_T_423 ? _GEN_1324 : _GEN_1293; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1357 = |_T_423 ? _GEN_1325 : _GEN_1294; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1358 = |_T_423 ? _GEN_1326 : _GEN_1295; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1359 = |_T_423 ? _GEN_1327 : _GEN_1296; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1360 = |_T_423 ? _GEN_1328 : _GEN_1297; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1361 = |_T_423 ? _GEN_1329 : _GEN_1298; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1362 = |_T_423 ? _GEN_1330 : _GEN_1299; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1363 = |_T_423 ? _GEN_1331 : _GEN_1300; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1364 = |_T_423 ? _GEN_1332 : _GEN_1301; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1365 = |_T_423 ? _GEN_1333 : _GEN_1302; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1366 = |_T_423 ? _GEN_1334 : _GEN_1303; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1367 = |_T_423 ? _GEN_1335 : _GEN_1304; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1368 = |_T_423 ? _GEN_1336 : _GEN_1305; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1369 = |_T_423 ? _GEN_1337 : _GEN_1306; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1370 = |_T_423 ? _GEN_1338 : _GEN_1307; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1371 = |_T_423 ? _GEN_1339 : _GEN_1308; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1372 = |_T_423 ? _GEN_1340 : _GEN_1309; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1373 = |_T_423 ? _GEN_1341 : _GEN_1310; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1374 = |_T_423 ? _GEN_1342 : _GEN_1279; // @[Scoreboard.scala 96:35]
  wire [7:0] lo_lo_1 = {commitVec_1_7,commitVec_1_6,commitVec_1_5,commitVec_1_4,commitVec_1_3,commitVec_1_2,
    commitVec_1_1,commitVec_1_0}; // @[Scoreboard.scala 96:23]
  wire [15:0] lo_1 = {commitVec_1_15,commitVec_1_14,commitVec_1_13,commitVec_1_12,commitVec_1_11,commitVec_1_10,
    commitVec_1_9,commitVec_1_8,lo_lo_1}; // @[Scoreboard.scala 96:23]
  wire [7:0] hi_lo_1 = {commitVec_1_23,commitVec_1_22,commitVec_1_21,commitVec_1_20,commitVec_1_19,commitVec_1_18,
    commitVec_1_17,commitVec_1_16}; // @[Scoreboard.scala 96:23]
  wire [31:0] _T_456 = {commitVec_1_31,commitVec_1_30,commitVec_1_29,commitVec_1_28,commitVec_1_27,commitVec_1_26,
    commitVec_1_25,commitVec_1_24,hi_lo_1,lo_1}; // @[Scoreboard.scala 96:23]
  wire [4:0] _T_458 = commitVec_1_30 ? 5'h1e : 5'h1f; // @[Mux.scala 47:70]
  wire [4:0] _T_459 = commitVec_1_29 ? 5'h1d : _T_458; // @[Mux.scala 47:70]
  wire [4:0] _T_460 = commitVec_1_28 ? 5'h1c : _T_459; // @[Mux.scala 47:70]
  wire [4:0] _T_461 = commitVec_1_27 ? 5'h1b : _T_460; // @[Mux.scala 47:70]
  wire [4:0] _T_462 = commitVec_1_26 ? 5'h1a : _T_461; // @[Mux.scala 47:70]
  wire [4:0] _T_463 = commitVec_1_25 ? 5'h19 : _T_462; // @[Mux.scala 47:70]
  wire [4:0] _T_464 = commitVec_1_24 ? 5'h18 : _T_463; // @[Mux.scala 47:70]
  wire [4:0] _T_465 = commitVec_1_23 ? 5'h17 : _T_464; // @[Mux.scala 47:70]
  wire [4:0] _T_466 = commitVec_1_22 ? 5'h16 : _T_465; // @[Mux.scala 47:70]
  wire [4:0] _T_467 = commitVec_1_21 ? 5'h15 : _T_466; // @[Mux.scala 47:70]
  wire [4:0] _T_468 = commitVec_1_20 ? 5'h14 : _T_467; // @[Mux.scala 47:70]
  wire [4:0] _T_469 = commitVec_1_19 ? 5'h13 : _T_468; // @[Mux.scala 47:70]
  wire [4:0] _T_470 = commitVec_1_18 ? 5'h12 : _T_469; // @[Mux.scala 47:70]
  wire [4:0] _T_471 = commitVec_1_17 ? 5'h11 : _T_470; // @[Mux.scala 47:70]
  wire [4:0] _T_472 = commitVec_1_16 ? 5'h10 : _T_471; // @[Mux.scala 47:70]
  wire [4:0] _T_473 = commitVec_1_15 ? 5'hf : _T_472; // @[Mux.scala 47:70]
  wire [4:0] _T_474 = commitVec_1_14 ? 5'he : _T_473; // @[Mux.scala 47:70]
  wire [4:0] _T_475 = commitVec_1_13 ? 5'hd : _T_474; // @[Mux.scala 47:70]
  wire [4:0] _T_476 = commitVec_1_12 ? 5'hc : _T_475; // @[Mux.scala 47:70]
  wire [4:0] _T_477 = commitVec_1_11 ? 5'hb : _T_476; // @[Mux.scala 47:70]
  wire [4:0] _T_478 = commitVec_1_10 ? 5'ha : _T_477; // @[Mux.scala 47:70]
  wire [4:0] _T_479 = commitVec_1_9 ? 5'h9 : _T_478; // @[Mux.scala 47:70]
  wire [4:0] _T_480 = commitVec_1_8 ? 5'h8 : _T_479; // @[Mux.scala 47:70]
  wire [4:0] _T_481 = commitVec_1_7 ? 5'h7 : _T_480; // @[Mux.scala 47:70]
  wire [4:0] _T_482 = commitVec_1_6 ? 5'h6 : _T_481; // @[Mux.scala 47:70]
  wire [4:0] _T_483 = commitVec_1_5 ? 5'h5 : _T_482; // @[Mux.scala 47:70]
  wire [4:0] _T_484 = commitVec_1_4 ? 5'h4 : _T_483; // @[Mux.scala 47:70]
  wire [4:0] _T_485 = commitVec_1_3 ? 5'h3 : _T_484; // @[Mux.scala 47:70]
  wire [4:0] _T_486 = commitVec_1_2 ? 5'h2 : _T_485; // @[Mux.scala 47:70]
  wire [4:0] _T_487 = commitVec_1_1 ? 5'h1 : _T_486; // @[Mux.scala 47:70]
  wire [4:0] _T_488 = commitVec_1_0 ? 5'h0 : _T_487; // @[Mux.scala 47:70]
  wire [1:0] _GEN_1375 = 5'h0 == _T_488 ? 2'h3 : _GEN_1343; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1376 = 5'h1 == _T_488 ? 2'h3 : _GEN_1344; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1377 = 5'h2 == _T_488 ? 2'h3 : _GEN_1345; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1378 = 5'h3 == _T_488 ? 2'h3 : _GEN_1346; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1379 = 5'h4 == _T_488 ? 2'h3 : _GEN_1347; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1380 = 5'h5 == _T_488 ? 2'h3 : _GEN_1348; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1381 = 5'h6 == _T_488 ? 2'h3 : _GEN_1349; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1382 = 5'h7 == _T_488 ? 2'h3 : _GEN_1350; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1383 = 5'h8 == _T_488 ? 2'h3 : _GEN_1351; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1384 = 5'h9 == _T_488 ? 2'h3 : _GEN_1352; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1385 = 5'ha == _T_488 ? 2'h3 : _GEN_1353; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1386 = 5'hb == _T_488 ? 2'h3 : _GEN_1354; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1387 = 5'hc == _T_488 ? 2'h3 : _GEN_1355; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1388 = 5'hd == _T_488 ? 2'h3 : _GEN_1356; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1389 = 5'he == _T_488 ? 2'h3 : _GEN_1357; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1390 = 5'hf == _T_488 ? 2'h3 : _GEN_1358; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1391 = 5'h10 == _T_488 ? 2'h3 : _GEN_1359; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1392 = 5'h11 == _T_488 ? 2'h3 : _GEN_1360; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1393 = 5'h12 == _T_488 ? 2'h3 : _GEN_1361; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1394 = 5'h13 == _T_488 ? 2'h3 : _GEN_1362; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1395 = 5'h14 == _T_488 ? 2'h3 : _GEN_1363; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1396 = 5'h15 == _T_488 ? 2'h3 : _GEN_1364; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1397 = 5'h16 == _T_488 ? 2'h3 : _GEN_1365; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1398 = 5'h17 == _T_488 ? 2'h3 : _GEN_1366; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1399 = 5'h18 == _T_488 ? 2'h3 : _GEN_1367; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1400 = 5'h19 == _T_488 ? 2'h3 : _GEN_1368; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1401 = 5'h1a == _T_488 ? 2'h3 : _GEN_1369; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1402 = 5'h1b == _T_488 ? 2'h3 : _GEN_1370; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1403 = 5'h1c == _T_488 ? 2'h3 : _GEN_1371; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1404 = 5'h1d == _T_488 ? 2'h3 : _GEN_1372; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1405 = 5'h1e == _T_488 ? 2'h3 : _GEN_1373; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1406 = 5'h1f == _T_488 ? 2'h3 : _GEN_1374; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1407 = |_T_456 ? _GEN_1375 : _GEN_1343; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1408 = |_T_456 ? _GEN_1376 : _GEN_1344; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1409 = |_T_456 ? _GEN_1377 : _GEN_1345; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1410 = |_T_456 ? _GEN_1378 : _GEN_1346; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1411 = |_T_456 ? _GEN_1379 : _GEN_1347; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1412 = |_T_456 ? _GEN_1380 : _GEN_1348; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1413 = |_T_456 ? _GEN_1381 : _GEN_1349; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1414 = |_T_456 ? _GEN_1382 : _GEN_1350; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1415 = |_T_456 ? _GEN_1383 : _GEN_1351; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1416 = |_T_456 ? _GEN_1384 : _GEN_1352; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1417 = |_T_456 ? _GEN_1385 : _GEN_1353; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1418 = |_T_456 ? _GEN_1386 : _GEN_1354; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1419 = |_T_456 ? _GEN_1387 : _GEN_1355; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1420 = |_T_456 ? _GEN_1388 : _GEN_1356; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1421 = |_T_456 ? _GEN_1389 : _GEN_1357; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1422 = |_T_456 ? _GEN_1390 : _GEN_1358; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1423 = |_T_456 ? _GEN_1391 : _GEN_1359; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1424 = |_T_456 ? _GEN_1392 : _GEN_1360; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1425 = |_T_456 ? _GEN_1393 : _GEN_1361; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1426 = |_T_456 ? _GEN_1394 : _GEN_1362; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1427 = |_T_456 ? _GEN_1395 : _GEN_1363; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1428 = |_T_456 ? _GEN_1396 : _GEN_1364; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1429 = |_T_456 ? _GEN_1397 : _GEN_1365; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1430 = |_T_456 ? _GEN_1398 : _GEN_1366; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1431 = |_T_456 ? _GEN_1399 : _GEN_1367; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1432 = |_T_456 ? _GEN_1400 : _GEN_1368; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1433 = |_T_456 ? _GEN_1401 : _GEN_1369; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1434 = |_T_456 ? _GEN_1402 : _GEN_1370; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1435 = |_T_456 ? _GEN_1403 : _GEN_1371; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1436 = |_T_456 ? _GEN_1404 : _GEN_1372; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1437 = |_T_456 ? _GEN_1405 : _GEN_1373; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1438 = |_T_456 ? _GEN_1406 : _GEN_1374; // @[Scoreboard.scala 96:35]
  wire [7:0] lo_lo_2 = {commitVec_2_7,commitVec_2_6,commitVec_2_5,commitVec_2_4,commitVec_2_3,commitVec_2_2,
    commitVec_2_1,commitVec_2_0}; // @[Scoreboard.scala 96:23]
  wire [15:0] lo_2 = {commitVec_2_15,commitVec_2_14,commitVec_2_13,commitVec_2_12,commitVec_2_11,commitVec_2_10,
    commitVec_2_9,commitVec_2_8,lo_lo_2}; // @[Scoreboard.scala 96:23]
  wire [7:0] hi_lo_2 = {commitVec_2_23,commitVec_2_22,commitVec_2_21,commitVec_2_20,commitVec_2_19,commitVec_2_18,
    commitVec_2_17,commitVec_2_16}; // @[Scoreboard.scala 96:23]
  wire [31:0] _T_489 = {commitVec_2_31,commitVec_2_30,commitVec_2_29,commitVec_2_28,commitVec_2_27,commitVec_2_26,
    commitVec_2_25,commitVec_2_24,hi_lo_2,lo_2}; // @[Scoreboard.scala 96:23]
  wire [4:0] _T_491 = commitVec_2_30 ? 5'h1e : 5'h1f; // @[Mux.scala 47:70]
  wire [4:0] _T_492 = commitVec_2_29 ? 5'h1d : _T_491; // @[Mux.scala 47:70]
  wire [4:0] _T_493 = commitVec_2_28 ? 5'h1c : _T_492; // @[Mux.scala 47:70]
  wire [4:0] _T_494 = commitVec_2_27 ? 5'h1b : _T_493; // @[Mux.scala 47:70]
  wire [4:0] _T_495 = commitVec_2_26 ? 5'h1a : _T_494; // @[Mux.scala 47:70]
  wire [4:0] _T_496 = commitVec_2_25 ? 5'h19 : _T_495; // @[Mux.scala 47:70]
  wire [4:0] _T_497 = commitVec_2_24 ? 5'h18 : _T_496; // @[Mux.scala 47:70]
  wire [4:0] _T_498 = commitVec_2_23 ? 5'h17 : _T_497; // @[Mux.scala 47:70]
  wire [4:0] _T_499 = commitVec_2_22 ? 5'h16 : _T_498; // @[Mux.scala 47:70]
  wire [4:0] _T_500 = commitVec_2_21 ? 5'h15 : _T_499; // @[Mux.scala 47:70]
  wire [4:0] _T_501 = commitVec_2_20 ? 5'h14 : _T_500; // @[Mux.scala 47:70]
  wire [4:0] _T_502 = commitVec_2_19 ? 5'h13 : _T_501; // @[Mux.scala 47:70]
  wire [4:0] _T_503 = commitVec_2_18 ? 5'h12 : _T_502; // @[Mux.scala 47:70]
  wire [4:0] _T_504 = commitVec_2_17 ? 5'h11 : _T_503; // @[Mux.scala 47:70]
  wire [4:0] _T_505 = commitVec_2_16 ? 5'h10 : _T_504; // @[Mux.scala 47:70]
  wire [4:0] _T_506 = commitVec_2_15 ? 5'hf : _T_505; // @[Mux.scala 47:70]
  wire [4:0] _T_507 = commitVec_2_14 ? 5'he : _T_506; // @[Mux.scala 47:70]
  wire [4:0] _T_508 = commitVec_2_13 ? 5'hd : _T_507; // @[Mux.scala 47:70]
  wire [4:0] _T_509 = commitVec_2_12 ? 5'hc : _T_508; // @[Mux.scala 47:70]
  wire [4:0] _T_510 = commitVec_2_11 ? 5'hb : _T_509; // @[Mux.scala 47:70]
  wire [4:0] _T_511 = commitVec_2_10 ? 5'ha : _T_510; // @[Mux.scala 47:70]
  wire [4:0] _T_512 = commitVec_2_9 ? 5'h9 : _T_511; // @[Mux.scala 47:70]
  wire [4:0] _T_513 = commitVec_2_8 ? 5'h8 : _T_512; // @[Mux.scala 47:70]
  wire [4:0] _T_514 = commitVec_2_7 ? 5'h7 : _T_513; // @[Mux.scala 47:70]
  wire [4:0] _T_515 = commitVec_2_6 ? 5'h6 : _T_514; // @[Mux.scala 47:70]
  wire [4:0] _T_516 = commitVec_2_5 ? 5'h5 : _T_515; // @[Mux.scala 47:70]
  wire [4:0] _T_517 = commitVec_2_4 ? 5'h4 : _T_516; // @[Mux.scala 47:70]
  wire [4:0] _T_518 = commitVec_2_3 ? 5'h3 : _T_517; // @[Mux.scala 47:70]
  wire [4:0] _T_519 = commitVec_2_2 ? 5'h2 : _T_518; // @[Mux.scala 47:70]
  wire [4:0] _T_520 = commitVec_2_1 ? 5'h1 : _T_519; // @[Mux.scala 47:70]
  wire [4:0] _T_521 = commitVec_2_0 ? 5'h0 : _T_520; // @[Mux.scala 47:70]
  wire [1:0] _GEN_1439 = 5'h0 == _T_521 ? 2'h3 : _GEN_1407; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1440 = 5'h1 == _T_521 ? 2'h3 : _GEN_1408; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1441 = 5'h2 == _T_521 ? 2'h3 : _GEN_1409; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1442 = 5'h3 == _T_521 ? 2'h3 : _GEN_1410; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1443 = 5'h4 == _T_521 ? 2'h3 : _GEN_1411; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1444 = 5'h5 == _T_521 ? 2'h3 : _GEN_1412; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1445 = 5'h6 == _T_521 ? 2'h3 : _GEN_1413; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1446 = 5'h7 == _T_521 ? 2'h3 : _GEN_1414; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1447 = 5'h8 == _T_521 ? 2'h3 : _GEN_1415; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1448 = 5'h9 == _T_521 ? 2'h3 : _GEN_1416; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1449 = 5'ha == _T_521 ? 2'h3 : _GEN_1417; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1450 = 5'hb == _T_521 ? 2'h3 : _GEN_1418; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1451 = 5'hc == _T_521 ? 2'h3 : _GEN_1419; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1452 = 5'hd == _T_521 ? 2'h3 : _GEN_1420; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1453 = 5'he == _T_521 ? 2'h3 : _GEN_1421; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1454 = 5'hf == _T_521 ? 2'h3 : _GEN_1422; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1455 = 5'h10 == _T_521 ? 2'h3 : _GEN_1423; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1456 = 5'h11 == _T_521 ? 2'h3 : _GEN_1424; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1457 = 5'h12 == _T_521 ? 2'h3 : _GEN_1425; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1458 = 5'h13 == _T_521 ? 2'h3 : _GEN_1426; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1459 = 5'h14 == _T_521 ? 2'h3 : _GEN_1427; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1460 = 5'h15 == _T_521 ? 2'h3 : _GEN_1428; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1461 = 5'h16 == _T_521 ? 2'h3 : _GEN_1429; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1462 = 5'h17 == _T_521 ? 2'h3 : _GEN_1430; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1463 = 5'h18 == _T_521 ? 2'h3 : _GEN_1431; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1464 = 5'h19 == _T_521 ? 2'h3 : _GEN_1432; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1465 = 5'h1a == _T_521 ? 2'h3 : _GEN_1433; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1466 = 5'h1b == _T_521 ? 2'h3 : _GEN_1434; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1467 = 5'h1c == _T_521 ? 2'h3 : _GEN_1435; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1468 = 5'h1d == _T_521 ? 2'h3 : _GEN_1436; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1469 = 5'h1e == _T_521 ? 2'h3 : _GEN_1437; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1470 = 5'h1f == _T_521 ? 2'h3 : _GEN_1438; // @[Scoreboard.scala 97:{50,50}]
  wire [1:0] _GEN_1471 = |_T_489 ? _GEN_1439 : _GEN_1407; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1472 = |_T_489 ? _GEN_1440 : _GEN_1408; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1473 = |_T_489 ? _GEN_1441 : _GEN_1409; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1474 = |_T_489 ? _GEN_1442 : _GEN_1410; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1475 = |_T_489 ? _GEN_1443 : _GEN_1411; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1476 = |_T_489 ? _GEN_1444 : _GEN_1412; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1477 = |_T_489 ? _GEN_1445 : _GEN_1413; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1478 = |_T_489 ? _GEN_1446 : _GEN_1414; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1479 = |_T_489 ? _GEN_1447 : _GEN_1415; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1480 = |_T_489 ? _GEN_1448 : _GEN_1416; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1481 = |_T_489 ? _GEN_1449 : _GEN_1417; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1482 = |_T_489 ? _GEN_1450 : _GEN_1418; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1483 = |_T_489 ? _GEN_1451 : _GEN_1419; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1484 = |_T_489 ? _GEN_1452 : _GEN_1420; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1485 = |_T_489 ? _GEN_1453 : _GEN_1421; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1486 = |_T_489 ? _GEN_1454 : _GEN_1422; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1487 = |_T_489 ? _GEN_1455 : _GEN_1423; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1488 = |_T_489 ? _GEN_1456 : _GEN_1424; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1489 = |_T_489 ? _GEN_1457 : _GEN_1425; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1490 = |_T_489 ? _GEN_1458 : _GEN_1426; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1491 = |_T_489 ? _GEN_1459 : _GEN_1427; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1492 = |_T_489 ? _GEN_1460 : _GEN_1428; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1493 = |_T_489 ? _GEN_1461 : _GEN_1429; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1494 = |_T_489 ? _GEN_1462 : _GEN_1430; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1495 = |_T_489 ? _GEN_1463 : _GEN_1431; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1496 = |_T_489 ? _GEN_1464 : _GEN_1432; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1497 = |_T_489 ? _GEN_1465 : _GEN_1433; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1498 = |_T_489 ? _GEN_1466 : _GEN_1434; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1499 = |_T_489 ? _GEN_1467 : _GEN_1435; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1500 = |_T_489 ? _GEN_1468 : _GEN_1436; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1501 = |_T_489 ? _GEN_1469 : _GEN_1437; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1502 = |_T_489 ? _GEN_1470 : _GEN_1438; // @[Scoreboard.scala 96:35]
  wire [1:0] _GEN_1504 = 5'h1 == readPtr[4:0] ? state_array_1 : state_array_0; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1505 = 5'h2 == readPtr[4:0] ? state_array_2 : _GEN_1504; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1506 = 5'h3 == readPtr[4:0] ? state_array_3 : _GEN_1505; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1507 = 5'h4 == readPtr[4:0] ? state_array_4 : _GEN_1506; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1508 = 5'h5 == readPtr[4:0] ? state_array_5 : _GEN_1507; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1509 = 5'h6 == readPtr[4:0] ? state_array_6 : _GEN_1508; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1510 = 5'h7 == readPtr[4:0] ? state_array_7 : _GEN_1509; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1511 = 5'h8 == readPtr[4:0] ? state_array_8 : _GEN_1510; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1512 = 5'h9 == readPtr[4:0] ? state_array_9 : _GEN_1511; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1513 = 5'ha == readPtr[4:0] ? state_array_10 : _GEN_1512; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1514 = 5'hb == readPtr[4:0] ? state_array_11 : _GEN_1513; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1515 = 5'hc == readPtr[4:0] ? state_array_12 : _GEN_1514; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1516 = 5'hd == readPtr[4:0] ? state_array_13 : _GEN_1515; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1517 = 5'he == readPtr[4:0] ? state_array_14 : _GEN_1516; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1518 = 5'hf == readPtr[4:0] ? state_array_15 : _GEN_1517; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1519 = 5'h10 == readPtr[4:0] ? state_array_16 : _GEN_1518; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1520 = 5'h11 == readPtr[4:0] ? state_array_17 : _GEN_1519; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1521 = 5'h12 == readPtr[4:0] ? state_array_18 : _GEN_1520; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1522 = 5'h13 == readPtr[4:0] ? state_array_19 : _GEN_1521; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1523 = 5'h14 == readPtr[4:0] ? state_array_20 : _GEN_1522; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1524 = 5'h15 == readPtr[4:0] ? state_array_21 : _GEN_1523; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1525 = 5'h16 == readPtr[4:0] ? state_array_22 : _GEN_1524; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1526 = 5'h17 == readPtr[4:0] ? state_array_23 : _GEN_1525; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1527 = 5'h18 == readPtr[4:0] ? state_array_24 : _GEN_1526; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1528 = 5'h19 == readPtr[4:0] ? state_array_25 : _GEN_1527; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1529 = 5'h1a == readPtr[4:0] ? state_array_26 : _GEN_1528; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1530 = 5'h1b == readPtr[4:0] ? state_array_27 : _GEN_1529; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1531 = 5'h1c == readPtr[4:0] ? state_array_28 : _GEN_1530; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1532 = 5'h1d == readPtr[4:0] ? state_array_29 : _GEN_1531; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1533 = 5'h1e == readPtr[4:0] ? state_array_30 : _GEN_1532; // @[Scoreboard.scala 113:{29,29}]
  wire [1:0] _GEN_1534 = 5'h1f == readPtr[4:0] ? state_array_31 : _GEN_1533; // @[Scoreboard.scala 113:{29,29}]
  wire [5:0] _readPtr_T_1 = readPtr + 6'h1; // @[Scoreboard.scala 115:24]
  wire [3:0] robIdx_order_0 = 3'h0 == _T_302[2:0] ? io_robIdx_7 : _GEN_192; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] robIdx_order_1 = 3'h1 == _T_302[2:0] ? io_robIdx_7 : _GEN_193; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] robIdx_order_2 = 3'h2 == _T_302[2:0] ? io_robIdx_7 : _GEN_194; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] robIdx_order_3 = 3'h3 == _T_302[2:0] ? io_robIdx_7 : _GEN_195; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] robIdx_order_4 = 3'h4 == _T_302[2:0] ? io_robIdx_7 : _GEN_196; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] robIdx_order_5 = 3'h5 == _T_302[2:0] ? io_robIdx_7 : _GEN_197; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] robIdx_order_6 = 3'h6 == _T_302[2:0] ? io_robIdx_7 : _GEN_198; // @[Scoreboard.scala 62:{38,38}]
  wire [3:0] robIdx_order_7 = 3'h7 == _T_302[2:0] ? io_robIdx_7 : _GEN_199; // @[Scoreboard.scala 62:{38,38}]
  assign io_robIdx_sort_0 = robIdx_order_0; // @[Scoreboard.scala 50:18]
  assign io_robIdx_sort_1 = robIdx_order_1; // @[Scoreboard.scala 50:18]
  assign io_robIdx_sort_2 = robIdx_order_2; // @[Scoreboard.scala 50:18]
  assign io_robIdx_sort_3 = robIdx_order_3; // @[Scoreboard.scala 50:18]
  assign io_robIdx_sort_4 = robIdx_order_4; // @[Scoreboard.scala 50:18]
  assign io_robIdx_sort_5 = robIdx_order_5; // @[Scoreboard.scala 50:18]
  assign io_robIdx_sort_6 = robIdx_order_6; // @[Scoreboard.scala 50:18]
  assign io_robIdx_sort_7 = robIdx_order_7; // @[Scoreboard.scala 50:18]
  assign io_oopcode_sort_0 = _io_opcode_opcode_order_0_T; // @[Scoreboard.scala 52:19]
  assign io_oopcode_sort_1 = _io_opcode_opcode_order_1_T; // @[Scoreboard.scala 52:19]
  assign io_oopcode_sort_2 = _io_opcode_opcode_order_2_T; // @[Scoreboard.scala 52:19]
  assign io_oopcode_sort_3 = _io_opcode_opcode_order_3_T; // @[Scoreboard.scala 52:19]
  assign io_oopcode_sort_4 = _io_opcode_opcode_order_4_T; // @[Scoreboard.scala 52:19]
  assign io_oopcode_sort_5 = _io_opcode_opcode_order_5_T; // @[Scoreboard.scala 52:19]
  assign io_oopcode_sort_6 = _io_opcode_opcode_order_6_T; // @[Scoreboard.scala 52:19]
  assign io_oopcode_sort_7 = _io_opcode_opcode_order_7_T; // @[Scoreboard.scala 52:19]
  assign io_idx_sort_0 = Idx_order_0; // @[Scoreboard.scala 51:15]
  assign io_idx_sort_1 = Idx_order_1; // @[Scoreboard.scala 51:15]
  assign io_idx_sort_2 = Idx_order_2; // @[Scoreboard.scala 51:15]
  assign io_idx_sort_3 = Idx_order_3; // @[Scoreboard.scala 51:15]
  assign io_idx_sort_4 = Idx_order_4; // @[Scoreboard.scala 51:15]
  assign io_idx_sort_5 = Idx_order_5; // @[Scoreboard.scala 51:15]
  assign io_idx_sort_6 = Idx_order_6; // @[Scoreboard.scala 51:15]
  assign io_idx_sort_7 = Idx_order_7; // @[Scoreboard.scala 51:15]
  always @(posedge clock) begin
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h0 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_0 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_0 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_0 <= _GEN_245;
        end
      end else begin
        opcode_array_0 <= _GEN_1088;
      end
    end else begin
      opcode_array_0 <= _GEN_1088;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h1 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_1 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_1 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_1 <= _GEN_245;
        end
      end else begin
        opcode_array_1 <= _GEN_1089;
      end
    end else begin
      opcode_array_1 <= _GEN_1089;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h2 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_2 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_2 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_2 <= _GEN_245;
        end
      end else begin
        opcode_array_2 <= _GEN_1090;
      end
    end else begin
      opcode_array_2 <= _GEN_1090;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h3 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_3 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_3 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_3 <= _GEN_245;
        end
      end else begin
        opcode_array_3 <= _GEN_1091;
      end
    end else begin
      opcode_array_3 <= _GEN_1091;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h4 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_4 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_4 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_4 <= _GEN_245;
        end
      end else begin
        opcode_array_4 <= _GEN_1092;
      end
    end else begin
      opcode_array_4 <= _GEN_1092;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h5 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_5 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_5 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_5 <= _GEN_245;
        end
      end else begin
        opcode_array_5 <= _GEN_1093;
      end
    end else begin
      opcode_array_5 <= _GEN_1093;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h6 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_6 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_6 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_6 <= _GEN_245;
        end
      end else begin
        opcode_array_6 <= _GEN_1094;
      end
    end else begin
      opcode_array_6 <= _GEN_1094;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h7 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_7 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_7 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_7 <= _GEN_245;
        end
      end else begin
        opcode_array_7 <= _GEN_1095;
      end
    end else begin
      opcode_array_7 <= _GEN_1095;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h8 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_8 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_8 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_8 <= _GEN_245;
        end
      end else begin
        opcode_array_8 <= _GEN_1096;
      end
    end else begin
      opcode_array_8 <= _GEN_1096;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h9 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_9 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_9 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_9 <= _GEN_245;
        end
      end else begin
        opcode_array_9 <= _GEN_1097;
      end
    end else begin
      opcode_array_9 <= _GEN_1097;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'ha == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_10 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_10 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_10 <= _GEN_245;
        end
      end else begin
        opcode_array_10 <= _GEN_1098;
      end
    end else begin
      opcode_array_10 <= _GEN_1098;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'hb == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_11 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_11 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_11 <= _GEN_245;
        end
      end else begin
        opcode_array_11 <= _GEN_1099;
      end
    end else begin
      opcode_array_11 <= _GEN_1099;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'hc == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_12 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_12 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_12 <= _GEN_245;
        end
      end else begin
        opcode_array_12 <= _GEN_1100;
      end
    end else begin
      opcode_array_12 <= _GEN_1100;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'hd == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_13 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_13 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_13 <= _GEN_245;
        end
      end else begin
        opcode_array_13 <= _GEN_1101;
      end
    end else begin
      opcode_array_13 <= _GEN_1101;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'he == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_14 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_14 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_14 <= _GEN_245;
        end
      end else begin
        opcode_array_14 <= _GEN_1102;
      end
    end else begin
      opcode_array_14 <= _GEN_1102;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'hf == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_15 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_15 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_15 <= _GEN_245;
        end
      end else begin
        opcode_array_15 <= _GEN_1103;
      end
    end else begin
      opcode_array_15 <= _GEN_1103;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h10 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_16 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_16 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_16 <= _GEN_245;
        end
      end else begin
        opcode_array_16 <= _GEN_1104;
      end
    end else begin
      opcode_array_16 <= _GEN_1104;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h11 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_17 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_17 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_17 <= _GEN_245;
        end
      end else begin
        opcode_array_17 <= _GEN_1105;
      end
    end else begin
      opcode_array_17 <= _GEN_1105;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h12 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_18 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_18 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_18 <= _GEN_245;
        end
      end else begin
        opcode_array_18 <= _GEN_1106;
      end
    end else begin
      opcode_array_18 <= _GEN_1106;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h13 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_19 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_19 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_19 <= _GEN_245;
        end
      end else begin
        opcode_array_19 <= _GEN_1107;
      end
    end else begin
      opcode_array_19 <= _GEN_1107;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h14 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_20 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_20 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_20 <= _GEN_245;
        end
      end else begin
        opcode_array_20 <= _GEN_1108;
      end
    end else begin
      opcode_array_20 <= _GEN_1108;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h15 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_21 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_21 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_21 <= _GEN_245;
        end
      end else begin
        opcode_array_21 <= _GEN_1109;
      end
    end else begin
      opcode_array_21 <= _GEN_1109;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h16 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_22 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_22 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_22 <= _GEN_245;
        end
      end else begin
        opcode_array_22 <= _GEN_1110;
      end
    end else begin
      opcode_array_22 <= _GEN_1110;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h17 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_23 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_23 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_23 <= _GEN_245;
        end
      end else begin
        opcode_array_23 <= _GEN_1111;
      end
    end else begin
      opcode_array_23 <= _GEN_1111;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h18 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_24 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_24 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_24 <= _GEN_245;
        end
      end else begin
        opcode_array_24 <= _GEN_1112;
      end
    end else begin
      opcode_array_24 <= _GEN_1112;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h19 == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_25 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_25 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_25 <= _GEN_245;
        end
      end else begin
        opcode_array_25 <= _GEN_1113;
      end
    end else begin
      opcode_array_25 <= _GEN_1113;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h1a == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_26 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_26 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_26 <= _GEN_245;
        end
      end else begin
        opcode_array_26 <= _GEN_1114;
      end
    end else begin
      opcode_array_26 <= _GEN_1114;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h1b == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_27 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_27 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_27 <= _GEN_245;
        end
      end else begin
        opcode_array_27 <= _GEN_1115;
      end
    end else begin
      opcode_array_27 <= _GEN_1115;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h1c == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_28 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_28 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_28 <= _GEN_245;
        end
      end else begin
        opcode_array_28 <= _GEN_1116;
      end
    end else begin
      opcode_array_28 <= _GEN_1116;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h1d == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_29 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_29 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_29 <= _GEN_245;
        end
      end else begin
        opcode_array_29 <= _GEN_1117;
      end
    end else begin
      opcode_array_29 <= _GEN_1117;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h1e == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_30 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_30 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_30 <= _GEN_245;
        end
      end else begin
        opcode_array_30 <= _GEN_1118;
      end
    end else begin
      opcode_array_30 <= _GEN_1118;
    end
    if (state_array_7 == 2'h0 & _io_valid_valid_order_7_T) begin // @[Scoreboard.scala 70:65]
      if (5'h1f == _T_386[4:0]) begin // @[Scoreboard.scala 71:51]
        if (3'h7 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_31 <= io_opcode_7; // @[Scoreboard.scala 64:21]
        end else if (3'h6 == Idx_order_7[2:0]) begin // @[Scoreboard.scala 64:21]
          opcode_array_31 <= io_opcode_6; // @[Scoreboard.scala 64:21]
        end else begin
          opcode_array_31 <= _GEN_245;
        end
      end else begin
        opcode_array_31 <= _GEN_1119;
      end
    end else begin
      opcode_array_31 <= _GEN_1119;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_0 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h0 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_0 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_0 <= _GEN_1471;
      end
    end else begin
      state_array_0 <= _GEN_1471;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_1 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h1 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_1 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_1 <= _GEN_1472;
      end
    end else begin
      state_array_1 <= _GEN_1472;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_2 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h2 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_2 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_2 <= _GEN_1473;
      end
    end else begin
      state_array_2 <= _GEN_1473;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_3 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h3 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_3 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_3 <= _GEN_1474;
      end
    end else begin
      state_array_3 <= _GEN_1474;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_4 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h4 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_4 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_4 <= _GEN_1475;
      end
    end else begin
      state_array_4 <= _GEN_1475;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_5 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h5 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_5 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_5 <= _GEN_1476;
      end
    end else begin
      state_array_5 <= _GEN_1476;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_6 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h6 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_6 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_6 <= _GEN_1477;
      end
    end else begin
      state_array_6 <= _GEN_1477;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_7 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h7 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_7 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_7 <= _GEN_1478;
      end
    end else begin
      state_array_7 <= _GEN_1478;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_8 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h8 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_8 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_8 <= _GEN_1479;
      end
    end else begin
      state_array_8 <= _GEN_1479;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_9 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h9 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_9 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_9 <= _GEN_1480;
      end
    end else begin
      state_array_9 <= _GEN_1480;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_10 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'ha == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_10 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_10 <= _GEN_1481;
      end
    end else begin
      state_array_10 <= _GEN_1481;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_11 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'hb == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_11 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_11 <= _GEN_1482;
      end
    end else begin
      state_array_11 <= _GEN_1482;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_12 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'hc == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_12 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_12 <= _GEN_1483;
      end
    end else begin
      state_array_12 <= _GEN_1483;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_13 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'hd == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_13 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_13 <= _GEN_1484;
      end
    end else begin
      state_array_13 <= _GEN_1484;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_14 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'he == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_14 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_14 <= _GEN_1485;
      end
    end else begin
      state_array_14 <= _GEN_1485;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_15 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'hf == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_15 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_15 <= _GEN_1486;
      end
    end else begin
      state_array_15 <= _GEN_1486;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_16 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h10 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_16 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_16 <= _GEN_1487;
      end
    end else begin
      state_array_16 <= _GEN_1487;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_17 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h11 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_17 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_17 <= _GEN_1488;
      end
    end else begin
      state_array_17 <= _GEN_1488;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_18 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h12 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_18 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_18 <= _GEN_1489;
      end
    end else begin
      state_array_18 <= _GEN_1489;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_19 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h13 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_19 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_19 <= _GEN_1490;
      end
    end else begin
      state_array_19 <= _GEN_1490;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_20 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h14 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_20 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_20 <= _GEN_1491;
      end
    end else begin
      state_array_20 <= _GEN_1491;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_21 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h15 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_21 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_21 <= _GEN_1492;
      end
    end else begin
      state_array_21 <= _GEN_1492;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_22 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h16 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_22 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_22 <= _GEN_1493;
      end
    end else begin
      state_array_22 <= _GEN_1493;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_23 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h17 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_23 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_23 <= _GEN_1494;
      end
    end else begin
      state_array_23 <= _GEN_1494;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_24 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h18 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_24 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_24 <= _GEN_1495;
      end
    end else begin
      state_array_24 <= _GEN_1495;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_25 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h19 == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_25 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_25 <= _GEN_1496;
      end
    end else begin
      state_array_25 <= _GEN_1496;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_26 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h1a == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_26 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_26 <= _GEN_1497;
      end
    end else begin
      state_array_26 <= _GEN_1497;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_27 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h1b == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_27 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_27 <= _GEN_1498;
      end
    end else begin
      state_array_27 <= _GEN_1498;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_28 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h1c == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_28 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_28 <= _GEN_1499;
      end
    end else begin
      state_array_28 <= _GEN_1499;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_29 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h1d == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_29 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_29 <= _GEN_1500;
      end
    end else begin
      state_array_29 <= _GEN_1500;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_30 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h1e == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_30 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_30 <= _GEN_1501;
      end
    end else begin
      state_array_30 <= _GEN_1501;
    end
    if (reset) begin // @[Scoreboard.scala 33:38]
      state_array_31 <= 2'h0; // @[Scoreboard.scala 33:38]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      if (5'h1f == readPtr[4:0]) begin // @[Scoreboard.scala 114:26]
        state_array_31 <= 2'h0; // @[Scoreboard.scala 114:26]
      end else begin
        state_array_31 <= _GEN_1502;
      end
    end else begin
      state_array_31 <= _GEN_1502;
    end
    if (reset) begin // @[Scoreboard.scala 34:25]
      writePtr <= 6'h0; // @[Scoreboard.scala 34:25]
    end else begin
      writePtr <= next_writePtr; // @[Scoreboard.scala 48:12]
    end
    if (reset) begin // @[Scoreboard.scala 36:34]
      readPtr <= 6'h0; // @[Scoreboard.scala 36:34]
    end else if (_GEN_1534 == 2'h3) begin // @[Scoreboard.scala 113:42]
      readPtr <= _readPtr_T_1; // @[Scoreboard.scala 115:13]
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
  opcode_array_0 = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  opcode_array_1 = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  opcode_array_2 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  opcode_array_3 = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  opcode_array_4 = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  opcode_array_5 = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  opcode_array_6 = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  opcode_array_7 = _RAND_7[6:0];
  _RAND_8 = {1{`RANDOM}};
  opcode_array_8 = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  opcode_array_9 = _RAND_9[6:0];
  _RAND_10 = {1{`RANDOM}};
  opcode_array_10 = _RAND_10[6:0];
  _RAND_11 = {1{`RANDOM}};
  opcode_array_11 = _RAND_11[6:0];
  _RAND_12 = {1{`RANDOM}};
  opcode_array_12 = _RAND_12[6:0];
  _RAND_13 = {1{`RANDOM}};
  opcode_array_13 = _RAND_13[6:0];
  _RAND_14 = {1{`RANDOM}};
  opcode_array_14 = _RAND_14[6:0];
  _RAND_15 = {1{`RANDOM}};
  opcode_array_15 = _RAND_15[6:0];
  _RAND_16 = {1{`RANDOM}};
  opcode_array_16 = _RAND_16[6:0];
  _RAND_17 = {1{`RANDOM}};
  opcode_array_17 = _RAND_17[6:0];
  _RAND_18 = {1{`RANDOM}};
  opcode_array_18 = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  opcode_array_19 = _RAND_19[6:0];
  _RAND_20 = {1{`RANDOM}};
  opcode_array_20 = _RAND_20[6:0];
  _RAND_21 = {1{`RANDOM}};
  opcode_array_21 = _RAND_21[6:0];
  _RAND_22 = {1{`RANDOM}};
  opcode_array_22 = _RAND_22[6:0];
  _RAND_23 = {1{`RANDOM}};
  opcode_array_23 = _RAND_23[6:0];
  _RAND_24 = {1{`RANDOM}};
  opcode_array_24 = _RAND_24[6:0];
  _RAND_25 = {1{`RANDOM}};
  opcode_array_25 = _RAND_25[6:0];
  _RAND_26 = {1{`RANDOM}};
  opcode_array_26 = _RAND_26[6:0];
  _RAND_27 = {1{`RANDOM}};
  opcode_array_27 = _RAND_27[6:0];
  _RAND_28 = {1{`RANDOM}};
  opcode_array_28 = _RAND_28[6:0];
  _RAND_29 = {1{`RANDOM}};
  opcode_array_29 = _RAND_29[6:0];
  _RAND_30 = {1{`RANDOM}};
  opcode_array_30 = _RAND_30[6:0];
  _RAND_31 = {1{`RANDOM}};
  opcode_array_31 = _RAND_31[6:0];
  _RAND_32 = {1{`RANDOM}};
  state_array_0 = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  state_array_1 = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  state_array_2 = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  state_array_3 = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  state_array_4 = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  state_array_5 = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  state_array_6 = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  state_array_7 = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  state_array_8 = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  state_array_9 = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  state_array_10 = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  state_array_11 = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  state_array_12 = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  state_array_13 = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  state_array_14 = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  state_array_15 = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  state_array_16 = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  state_array_17 = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  state_array_18 = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  state_array_19 = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  state_array_20 = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  state_array_21 = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  state_array_22 = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  state_array_23 = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  state_array_24 = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  state_array_25 = _RAND_57[1:0];
  _RAND_58 = {1{`RANDOM}};
  state_array_26 = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  state_array_27 = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  state_array_28 = _RAND_60[1:0];
  _RAND_61 = {1{`RANDOM}};
  state_array_29 = _RAND_61[1:0];
  _RAND_62 = {1{`RANDOM}};
  state_array_30 = _RAND_62[1:0];
  _RAND_63 = {1{`RANDOM}};
  state_array_31 = _RAND_63[1:0];
  _RAND_64 = {1{`RANDOM}};
  writePtr = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  readPtr = _RAND_65[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
