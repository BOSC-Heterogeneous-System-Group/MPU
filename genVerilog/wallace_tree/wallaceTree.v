module RCA(
  input  [15:0] input_a_in,
  input  [15:0] input_b_in,
  output [15:0] output_S
);
  wire  g_comb_0 = input_a_in[0] & input_b_in[0]; // @[rca.scala 30:39]
  wire  p_comb_0 = input_a_in[0] ^ input_b_in[0]; // @[rca.scala 31:39]
  wire  g_comb_1 = input_a_in[1] & input_b_in[1]; // @[rca.scala 30:39]
  wire  p_comb_1 = input_a_in[1] ^ input_b_in[1]; // @[rca.scala 31:39]
  wire  s_comb_1 = p_comb_1 ^ g_comb_0; // @[rca.scala 32:34]
  wire  c_comb_2 = g_comb_0 & p_comb_1 | g_comb_1; // @[rca.scala 33:46]
  wire  g_comb_2 = input_a_in[2] & input_b_in[2]; // @[rca.scala 30:39]
  wire  p_comb_2 = input_a_in[2] ^ input_b_in[2]; // @[rca.scala 31:39]
  wire  s_comb_2 = p_comb_2 ^ c_comb_2; // @[rca.scala 32:34]
  wire  c_comb_3 = c_comb_2 & p_comb_2 | g_comb_2; // @[rca.scala 33:46]
  wire  g_comb_3 = input_a_in[3] & input_b_in[3]; // @[rca.scala 30:39]
  wire  p_comb_3 = input_a_in[3] ^ input_b_in[3]; // @[rca.scala 31:39]
  wire  s_comb_3 = p_comb_3 ^ c_comb_3; // @[rca.scala 32:34]
  wire  c_comb_4 = c_comb_3 & p_comb_3 | g_comb_3; // @[rca.scala 33:46]
  wire  g_comb_4 = input_a_in[4] & input_b_in[4]; // @[rca.scala 30:39]
  wire  p_comb_4 = input_a_in[4] ^ input_b_in[4]; // @[rca.scala 31:39]
  wire  s_comb_4 = p_comb_4 ^ c_comb_4; // @[rca.scala 32:34]
  wire  c_comb_5 = c_comb_4 & p_comb_4 | g_comb_4; // @[rca.scala 33:46]
  wire  g_comb_5 = input_a_in[5] & input_b_in[5]; // @[rca.scala 30:39]
  wire  p_comb_5 = input_a_in[5] ^ input_b_in[5]; // @[rca.scala 31:39]
  wire  s_comb_5 = p_comb_5 ^ c_comb_5; // @[rca.scala 32:34]
  wire  c_comb_6 = c_comb_5 & p_comb_5 | g_comb_5; // @[rca.scala 33:46]
  wire  g_comb_6 = input_a_in[6] & input_b_in[6]; // @[rca.scala 30:39]
  wire  p_comb_6 = input_a_in[6] ^ input_b_in[6]; // @[rca.scala 31:39]
  wire  s_comb_6 = p_comb_6 ^ c_comb_6; // @[rca.scala 32:34]
  wire  c_comb_7 = c_comb_6 & p_comb_6 | g_comb_6; // @[rca.scala 33:46]
  wire  g_comb_7 = input_a_in[7] & input_b_in[7]; // @[rca.scala 30:39]
  wire  p_comb_7 = input_a_in[7] ^ input_b_in[7]; // @[rca.scala 31:39]
  wire  s_comb_7 = p_comb_7 ^ c_comb_7; // @[rca.scala 32:34]
  wire  c_comb_8 = c_comb_7 & p_comb_7 | g_comb_7; // @[rca.scala 33:46]
  wire  g_comb_8 = input_a_in[8] & input_b_in[8]; // @[rca.scala 30:39]
  wire  p_comb_8 = input_a_in[8] ^ input_b_in[8]; // @[rca.scala 31:39]
  wire  s_comb_8 = p_comb_8 ^ c_comb_8; // @[rca.scala 32:34]
  wire  c_comb_9 = c_comb_8 & p_comb_8 | g_comb_8; // @[rca.scala 33:46]
  wire  g_comb_9 = input_a_in[9] & input_b_in[9]; // @[rca.scala 30:39]
  wire  p_comb_9 = input_a_in[9] ^ input_b_in[9]; // @[rca.scala 31:39]
  wire  s_comb_9 = p_comb_9 ^ c_comb_9; // @[rca.scala 32:34]
  wire  c_comb_10 = c_comb_9 & p_comb_9 | g_comb_9; // @[rca.scala 33:46]
  wire  g_comb_10 = input_a_in[10] & input_b_in[10]; // @[rca.scala 30:39]
  wire  p_comb_10 = input_a_in[10] ^ input_b_in[10]; // @[rca.scala 31:39]
  wire  s_comb_10 = p_comb_10 ^ c_comb_10; // @[rca.scala 32:34]
  wire  c_comb_11 = c_comb_10 & p_comb_10 | g_comb_10; // @[rca.scala 33:46]
  wire  g_comb_11 = input_a_in[11] & input_b_in[11]; // @[rca.scala 30:39]
  wire  p_comb_11 = input_a_in[11] ^ input_b_in[11]; // @[rca.scala 31:39]
  wire  s_comb_11 = p_comb_11 ^ c_comb_11; // @[rca.scala 32:34]
  wire  c_comb_12 = c_comb_11 & p_comb_11 | g_comb_11; // @[rca.scala 33:46]
  wire  g_comb_12 = input_a_in[12] & input_b_in[12]; // @[rca.scala 30:39]
  wire  p_comb_12 = input_a_in[12] ^ input_b_in[12]; // @[rca.scala 31:39]
  wire  s_comb_12 = p_comb_12 ^ c_comb_12; // @[rca.scala 32:34]
  wire  c_comb_13 = c_comb_12 & p_comb_12 | g_comb_12; // @[rca.scala 33:46]
  wire  g_comb_13 = input_a_in[13] & input_b_in[13]; // @[rca.scala 30:39]
  wire  p_comb_13 = input_a_in[13] ^ input_b_in[13]; // @[rca.scala 31:39]
  wire  s_comb_13 = p_comb_13 ^ c_comb_13; // @[rca.scala 32:34]
  wire  c_comb_14 = c_comb_13 & p_comb_13 | g_comb_13; // @[rca.scala 33:46]
  wire  g_comb_14 = input_a_in[14] & input_b_in[14]; // @[rca.scala 30:39]
  wire  p_comb_14 = input_a_in[14] ^ input_b_in[14]; // @[rca.scala 31:39]
  wire  s_comb_14 = p_comb_14 ^ c_comb_14; // @[rca.scala 32:34]
  wire  c_comb_15 = c_comb_14 & p_comb_14 | g_comb_14; // @[rca.scala 33:46]
  wire  p_comb_15 = input_a_in[15] ^ input_b_in[15]; // @[rca.scala 31:39]
  wire  s_comb_15 = p_comb_15 ^ c_comb_15; // @[rca.scala 32:34]
  wire [7:0] output_S_lo = {s_comb_7,s_comb_6,s_comb_5,s_comb_4,s_comb_3,s_comb_2,s_comb_1,p_comb_0}; // @[rca.scala 36:24]
  wire [7:0] output_S_hi = {s_comb_15,s_comb_14,s_comb_13,s_comb_12,s_comb_11,s_comb_10,s_comb_9,s_comb_8}; // @[rca.scala 36:24]
  assign output_S = {output_S_hi,output_S_lo}; // @[rca.scala 36:24]
endmodule
module pp_compressor3_2(
  input  [15:0] input_pp0_in,
  input  [15:0] input_pp1_in,
  input  [15:0] input_pp2_in,
  output [15:0] output_S,
  output [15:0] output_C
);
  wire  g_comb_0 = input_pp0_in[0] & input_pp1_in[0]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_0 = input_pp0_in[0] ^ input_pp1_in[0]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_0 = p_comb_0 ^ input_pp2_in[0]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_0 = input_pp2_in[0] & p_comb_0 | g_comb_0; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_1 = input_pp0_in[1] & input_pp1_in[1]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_1 = input_pp0_in[1] ^ input_pp1_in[1]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_1 = p_comb_1 ^ input_pp2_in[1]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_1 = input_pp2_in[1] & p_comb_1 | g_comb_1; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_2 = input_pp0_in[2] & input_pp1_in[2]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_2 = input_pp0_in[2] ^ input_pp1_in[2]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_2 = p_comb_2 ^ input_pp2_in[2]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_2 = input_pp2_in[2] & p_comb_2 | g_comb_2; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_3 = input_pp0_in[3] & input_pp1_in[3]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_3 = input_pp0_in[3] ^ input_pp1_in[3]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_3 = p_comb_3 ^ input_pp2_in[3]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_3 = input_pp2_in[3] & p_comb_3 | g_comb_3; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_4 = input_pp0_in[4] & input_pp1_in[4]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_4 = input_pp0_in[4] ^ input_pp1_in[4]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_4 = p_comb_4 ^ input_pp2_in[4]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_4 = input_pp2_in[4] & p_comb_4 | g_comb_4; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_5 = input_pp0_in[5] & input_pp1_in[5]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_5 = input_pp0_in[5] ^ input_pp1_in[5]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_5 = p_comb_5 ^ input_pp2_in[5]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_5 = input_pp2_in[5] & p_comb_5 | g_comb_5; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_6 = input_pp0_in[6] & input_pp1_in[6]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_6 = input_pp0_in[6] ^ input_pp1_in[6]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_6 = p_comb_6 ^ input_pp2_in[6]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_6 = input_pp2_in[6] & p_comb_6 | g_comb_6; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_7 = input_pp0_in[7] & input_pp1_in[7]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_7 = input_pp0_in[7] ^ input_pp1_in[7]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_7 = p_comb_7 ^ input_pp2_in[7]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_7 = input_pp2_in[7] & p_comb_7 | g_comb_7; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_8 = input_pp0_in[8] & input_pp1_in[8]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_8 = input_pp0_in[8] ^ input_pp1_in[8]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_8 = p_comb_8 ^ input_pp2_in[8]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_8 = input_pp2_in[8] & p_comb_8 | g_comb_8; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_9 = input_pp0_in[9] & input_pp1_in[9]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_9 = input_pp0_in[9] ^ input_pp1_in[9]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_9 = p_comb_9 ^ input_pp2_in[9]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_9 = input_pp2_in[9] & p_comb_9 | g_comb_9; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_10 = input_pp0_in[10] & input_pp1_in[10]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_10 = input_pp0_in[10] ^ input_pp1_in[10]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_10 = p_comb_10 ^ input_pp2_in[10]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_10 = input_pp2_in[10] & p_comb_10 | g_comb_10; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_11 = input_pp0_in[11] & input_pp1_in[11]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_11 = input_pp0_in[11] ^ input_pp1_in[11]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_11 = p_comb_11 ^ input_pp2_in[11]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_11 = input_pp2_in[11] & p_comb_11 | g_comb_11; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_12 = input_pp0_in[12] & input_pp1_in[12]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_12 = input_pp0_in[12] ^ input_pp1_in[12]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_12 = p_comb_12 ^ input_pp2_in[12]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_12 = input_pp2_in[12] & p_comb_12 | g_comb_12; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_13 = input_pp0_in[13] & input_pp1_in[13]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_13 = input_pp0_in[13] ^ input_pp1_in[13]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_13 = p_comb_13 ^ input_pp2_in[13]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_13 = input_pp2_in[13] & p_comb_13 | g_comb_13; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_14 = input_pp0_in[14] & input_pp1_in[14]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_14 = input_pp0_in[14] ^ input_pp1_in[14]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_14 = p_comb_14 ^ input_pp2_in[14]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_14 = input_pp2_in[14] & p_comb_14 | g_comb_14; // @[pp_compressor3_2.scala 31:57]
  wire  g_comb_15 = input_pp0_in[15] & input_pp1_in[15]; // @[pp_compressor3_2.scala 28:39]
  wire  p_comb_15 = input_pp0_in[15] ^ input_pp1_in[15]; // @[pp_compressor3_2.scala 29:39]
  wire  s_comb_15 = p_comb_15 ^ input_pp2_in[15]; // @[pp_compressor3_2.scala 30:32]
  wire  c_comb_15 = input_pp2_in[15] & p_comb_15 | g_comb_15; // @[pp_compressor3_2.scala 31:57]
  wire [7:0] output_S_lo = {s_comb_7,s_comb_6,s_comb_5,s_comb_4,s_comb_3,s_comb_2,s_comb_1,s_comb_0}; // @[pp_compressor3_2.scala 34:24]
  wire [7:0] output_S_hi = {s_comb_15,s_comb_14,s_comb_13,s_comb_12,s_comb_11,s_comb_10,s_comb_9,s_comb_8}; // @[pp_compressor3_2.scala 34:24]
  wire [7:0] output_C_lo = {c_comb_7,c_comb_6,c_comb_5,c_comb_4,c_comb_3,c_comb_2,c_comb_1,c_comb_0}; // @[pp_compressor3_2.scala 35:29]
  wire [15:0] _output_C_T = {c_comb_15,c_comb_14,c_comb_13,c_comb_12,c_comb_11,c_comb_10,c_comb_9,c_comb_8,output_C_lo}; // @[pp_compressor3_2.scala 35:29]
  assign output_S = {output_S_hi,output_S_lo}; // @[pp_compressor3_2.scala 34:24]
  assign output_C = {_output_C_T[14:0],1'h0}; // @[Cat.scala 33:92]
endmodule
module wallaceTree(
  input         clock,
  input         reset,
  input  [15:0] io_data_i_0,
  input  [15:0] io_data_i_1,
  input  [15:0] io_data_i_2,
  input  [15:0] io_data_i_3,
  input  [15:0] io_data_i_4,
  output [15:0] io_data_o
);
  wire [15:0] rca_input_a_in; // @[wallace_tree.scala 13:19]
  wire [15:0] rca_input_b_in; // @[wallace_tree.scala 13:19]
  wire [15:0] rca_output_S; // @[wallace_tree.scala 13:19]
  wire [15:0] layer1CSA_0_input_pp0_in; // @[wallace_tree.scala 59:44]
  wire [15:0] layer1CSA_0_input_pp1_in; // @[wallace_tree.scala 59:44]
  wire [15:0] layer1CSA_0_input_pp2_in; // @[wallace_tree.scala 59:44]
  wire [15:0] layer1CSA_0_output_S; // @[wallace_tree.scala 59:44]
  wire [15:0] layer1CSA_0_output_C; // @[wallace_tree.scala 59:44]
  wire [15:0] layer2CSA_0_input_pp0_in; // @[wallace_tree.scala 85:46]
  wire [15:0] layer2CSA_0_input_pp1_in; // @[wallace_tree.scala 85:46]
  wire [15:0] layer2CSA_0_input_pp2_in; // @[wallace_tree.scala 85:46]
  wire [15:0] layer2CSA_0_output_S; // @[wallace_tree.scala 85:46]
  wire [15:0] layer2CSA_0_output_C; // @[wallace_tree.scala 85:46]
  wire [15:0] layer3CSA_0_input_pp0_in; // @[wallace_tree.scala 111:48]
  wire [15:0] layer3CSA_0_input_pp1_in; // @[wallace_tree.scala 111:48]
  wire [15:0] layer3CSA_0_input_pp2_in; // @[wallace_tree.scala 111:48]
  wire [15:0] layer3CSA_0_output_S; // @[wallace_tree.scala 111:48]
  wire [15:0] layer3CSA_0_output_C; // @[wallace_tree.scala 111:48]
  RCA rca ( // @[wallace_tree.scala 13:19]
    .input_a_in(rca_input_a_in),
    .input_b_in(rca_input_b_in),
    .output_S(rca_output_S)
  );
  pp_compressor3_2 layer1CSA_0 ( // @[wallace_tree.scala 59:44]
    .input_pp0_in(layer1CSA_0_input_pp0_in),
    .input_pp1_in(layer1CSA_0_input_pp1_in),
    .input_pp2_in(layer1CSA_0_input_pp2_in),
    .output_S(layer1CSA_0_output_S),
    .output_C(layer1CSA_0_output_C)
  );
  pp_compressor3_2 layer2CSA_0 ( // @[wallace_tree.scala 85:46]
    .input_pp0_in(layer2CSA_0_input_pp0_in),
    .input_pp1_in(layer2CSA_0_input_pp1_in),
    .input_pp2_in(layer2CSA_0_input_pp2_in),
    .output_S(layer2CSA_0_output_S),
    .output_C(layer2CSA_0_output_C)
  );
  pp_compressor3_2 layer3CSA_0 ( // @[wallace_tree.scala 111:48]
    .input_pp0_in(layer3CSA_0_input_pp0_in),
    .input_pp1_in(layer3CSA_0_input_pp1_in),
    .input_pp2_in(layer3CSA_0_input_pp2_in),
    .output_S(layer3CSA_0_output_S),
    .output_C(layer3CSA_0_output_C)
  );
  assign io_data_o = rca_output_S; // @[wallace_tree.scala 253:18]
  assign rca_input_a_in = layer3CSA_0_output_S; // @[wallace_tree.scala 250:18]
  assign rca_input_b_in = layer3CSA_0_output_C; // @[wallace_tree.scala 251:18]
  assign layer1CSA_0_input_pp0_in = io_data_i_0; // @[wallace_tree.scala 63:31]
  assign layer1CSA_0_input_pp1_in = io_data_i_1; // @[wallace_tree.scala 64:31]
  assign layer1CSA_0_input_pp2_in = io_data_i_2; // @[wallace_tree.scala 65:31]
  assign layer2CSA_0_input_pp0_in = layer1CSA_0_output_S; // @[wallace_tree.scala 89:33]
  assign layer2CSA_0_input_pp1_in = layer1CSA_0_output_C; // @[wallace_tree.scala 90:33]
  assign layer2CSA_0_input_pp2_in = io_data_i_3; // @[wallace_tree.scala 91:33]
  assign layer3CSA_0_input_pp0_in = layer2CSA_0_output_S; // @[wallace_tree.scala 115:35]
  assign layer3CSA_0_input_pp1_in = layer2CSA_0_output_C; // @[wallace_tree.scala 116:35]
  assign layer3CSA_0_input_pp2_in = io_data_i_4; // @[wallace_tree.scala 117:35]
endmodule
