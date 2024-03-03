module booth2Encoder(
  input  [3:0] input_multiplier,
  output [1:0] output_X2,
  output [1:0] output_inv,
  output [1:0] output_set0
);
  wire [4:0] multiplier2 = {input_multiplier,1'h0}; // @[Cat.scala 33:92]
  wire [2:0] bits_0 = multiplier2[2:0]; // @[booth2_encoder.scala 32:31]
  wire [2:0] bits_1 = multiplier2[4:2]; // @[booth2_encoder.scala 32:31]
  wire  X2Bools_0 = ~(bits_0[0] ^ bits_0[1]); // @[booth2_encoder.scala 36:26]
  wire  invBools_0 = bits_0[2]; // @[booth2_encoder.scala 37:32]
  wire [2:0] _set0Bools_0_T_1 = ~bits_0; // @[booth2_encoder.scala 38:48]
  wire  set0Bools_0 = &bits_0 | &_set0Bools_0_T_1; // @[booth2_encoder.scala 38:45]
  wire  X2Bools_1 = ~(bits_1[0] ^ bits_1[1]); // @[booth2_encoder.scala 36:26]
  wire  invBools_1 = bits_1[2]; // @[booth2_encoder.scala 37:32]
  wire [2:0] _set0Bools_1_T_1 = ~bits_1; // @[booth2_encoder.scala 38:48]
  wire  set0Bools_1 = &bits_1 | &_set0Bools_1_T_1; // @[booth2_encoder.scala 38:45]
  assign output_X2 = {X2Bools_1,X2Bools_0}; // @[booth2_encoder.scala 42:28]
  assign output_inv = {invBools_1,invBools_0}; // @[booth2_encoder.scala 43:29]
  assign output_set0 = {set0Bools_1,set0Bools_0}; // @[booth2_encoder.scala 44:30]
endmodule
module ppGenerator(
  input        clock,
  input        reset,
  input  [3:0] inputData_multiplicand,
  input  [1:0] inputCtrl_X2,
  input  [1:0] inputCtrl_inv,
  input  [1:0] inputCtrl_Set0,
  output [7:0] outputData_pp_out_0,
  output [7:0] outputData_pp_out_1,
  output [7:0] outputData_sig_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] pp_0; // @[pp_generator.scala 36:29]
  reg [7:0] pp_1; // @[pp_generator.scala 36:29]
  reg [7:0] sign_com; // @[pp_generator.scala 37:29]
  wire [4:0] _pp_X2_0_T_2 = {inputData_multiplicand,1'h0}; // @[Cat.scala 33:92]
  wire [4:0] _pp_X2_0_T_4 = {inputData_multiplicand[3],inputData_multiplicand}; // @[Cat.scala 33:92]
  wire [4:0] pp_X2_0 = inputCtrl_X2[0] ? _pp_X2_0_T_2 : _pp_X2_0_T_4; // @[pp_generator.scala 41:90]
  wire [4:0] pp_set_0 = inputCtrl_Set0[0] ? $signed(5'sh0) : $signed(pp_X2_0); // @[pp_generator.scala 42:25]
  wire [4:0] _pp_inv_0_T_3 = ~pp_set_0; // @[pp_generator.scala 43:51]
  wire  E_inv_0 = inputCtrl_Set0[0] ? inputCtrl_inv[0] : inputCtrl_inv[0] ^ inputData_multiplicand[3]; // @[pp_generator.scala 44:25]
  wire  E_0 = ~E_inv_0; // @[pp_generator.scala 45:22]
  wire [4:0] pp_temp_0_lo_lo = inputCtrl_inv[0] ? $signed(_pp_inv_0_T_3) : $signed(pp_set_0); // @[Cat.scala 33:92]
  wire [7:0] pp_temp_0 = {E_0,E_inv_0,E_inv_0,pp_temp_0_lo_lo}; // @[pp_generator.scala 49:86]
  wire [4:0] pp_X2_1 = inputCtrl_X2[1] ? _pp_X2_0_T_2 : _pp_X2_0_T_4; // @[pp_generator.scala 41:90]
  wire [4:0] pp_set_1 = inputCtrl_Set0[1] ? $signed(5'sh0) : $signed(pp_X2_1); // @[pp_generator.scala 42:25]
  wire [4:0] _pp_inv_1_T_3 = ~pp_set_1; // @[pp_generator.scala 43:51]
  wire  E_inv_1 = inputCtrl_Set0[1] ? inputCtrl_inv[1] : inputCtrl_inv[1] ^ inputData_multiplicand[3]; // @[pp_generator.scala 44:25]
  wire  E_1 = ~E_inv_1; // @[pp_generator.scala 45:22]
  wire [4:0] pp_temp_1_lo_lo = inputCtrl_inv[1] ? $signed(_pp_inv_1_T_3) : $signed(pp_set_1); // @[Cat.scala 33:92]
  wire [7:0] pp_temp_1 = {2'h1,E_1,pp_temp_1_lo_lo}; // @[pp_generator.scala 55:94]
  wire [7:0] _pp_1_T_3 = {pp_temp_1[5:0],1'h0,inputCtrl_inv[0]}; // @[pp_generator.scala 63:85]
  wire [3:0] _sign_com_T_2 = {1'h0,inputCtrl_inv[1],2'h0}; // @[pp_generator.scala 68:97]
  assign outputData_pp_out_0 = pp_0; // @[pp_generator.scala 70:25]
  assign outputData_pp_out_1 = pp_1; // @[pp_generator.scala 70:25]
  assign outputData_sig_out = sign_com; // @[pp_generator.scala 71:25]
  always @(posedge clock) begin
    if (reset) begin // @[pp_generator.scala 36:29]
      pp_0 <= 8'sh0; // @[pp_generator.scala 36:29]
    end else begin
      pp_0 <= pp_temp_0; // @[pp_generator.scala 61:19]
    end
    if (reset) begin // @[pp_generator.scala 36:29]
      pp_1 <= 8'sh0; // @[pp_generator.scala 36:29]
    end else begin
      pp_1 <= _pp_1_T_3; // @[pp_generator.scala 63:19]
    end
    if (reset) begin // @[pp_generator.scala 37:29]
      sign_com <= 8'sh0; // @[pp_generator.scala 37:29]
    end else begin
      sign_com <= {{4{_sign_com_T_2[3]}},_sign_com_T_2}; // @[pp_generator.scala 68:14]
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
  pp_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  pp_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  sign_com = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RCA(
  input  [7:0] input_a_in,
  input  [7:0] input_b_in,
  output [7:0] output_S
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
  wire  p_comb_7 = input_a_in[7] ^ input_b_in[7]; // @[rca.scala 31:39]
  wire  s_comb_7 = p_comb_7 ^ c_comb_7; // @[rca.scala 32:34]
  assign output_S = {s_comb_7,s_comb_6,s_comb_5,s_comb_4,s_comb_3,s_comb_2,s_comb_1,p_comb_0}; // @[rca.scala 36:31]
endmodule
module pp_compressor3_2(
  input  [7:0] input_pp0_in,
  input  [7:0] input_pp1_in,
  input  [7:0] input_pp2_in,
  output [7:0] output_S,
  output [7:0] output_C
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
  wire [7:0] _output_C_T = {c_comb_7,c_comb_6,c_comb_5,c_comb_4,c_comb_3,c_comb_2,c_comb_1,c_comb_0}; // @[pp_compressor3_2.scala 35:29]
  assign output_S = {s_comb_7,s_comb_6,s_comb_5,s_comb_4,s_comb_3,s_comb_2,s_comb_1,s_comb_0}; // @[pp_compressor3_2.scala 34:31]
  assign output_C = {_output_C_T[6:0],1'h0}; // @[pp_compressor3_2.scala 35:61]
endmodule
module wallaceTree(
  input  [7:0] io_data_i_0,
  input  [7:0] io_data_i_1,
  input  [7:0] io_data_i_2,
  output [7:0] io_data_o
);
  wire [7:0] rca_input_a_in; // @[wallace_tree.scala 13:19]
  wire [7:0] rca_input_b_in; // @[wallace_tree.scala 13:19]
  wire [7:0] rca_output_S; // @[wallace_tree.scala 13:19]
  wire [7:0] layer1CSA_0_input_pp0_in; // @[wallace_tree.scala 59:44]
  wire [7:0] layer1CSA_0_input_pp1_in; // @[wallace_tree.scala 59:44]
  wire [7:0] layer1CSA_0_input_pp2_in; // @[wallace_tree.scala 59:44]
  wire [7:0] layer1CSA_0_output_S; // @[wallace_tree.scala 59:44]
  wire [7:0] layer1CSA_0_output_C; // @[wallace_tree.scala 59:44]
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
  assign io_data_o = rca_output_S; // @[wallace_tree.scala 253:18]
  assign rca_input_a_in = layer1CSA_0_output_S; // @[wallace_tree.scala 250:18]
  assign rca_input_b_in = layer1CSA_0_output_C; // @[wallace_tree.scala 251:18]
  assign layer1CSA_0_input_pp0_in = io_data_i_0; // @[wallace_tree.scala 63:31]
  assign layer1CSA_0_input_pp1_in = io_data_i_1; // @[wallace_tree.scala 64:31]
  assign layer1CSA_0_input_pp2_in = io_data_i_2; // @[wallace_tree.scala 65:31]
endmodule
module Multiplier(
  input        clock,
  input        reset,
  input  [3:0] input_multiplicand,
  input  [3:0] input_multiplier,
  output [7:0] output_product
);
  wire [3:0] booth2_encoder_input_multiplier; // @[multiplier.scala 21:34]
  wire [1:0] booth2_encoder_output_X2; // @[multiplier.scala 21:34]
  wire [1:0] booth2_encoder_output_inv; // @[multiplier.scala 21:34]
  wire [1:0] booth2_encoder_output_set0; // @[multiplier.scala 21:34]
  wire  pp_generator_clock; // @[multiplier.scala 22:34]
  wire  pp_generator_reset; // @[multiplier.scala 22:34]
  wire [3:0] pp_generator_inputData_multiplicand; // @[multiplier.scala 22:34]
  wire [1:0] pp_generator_inputCtrl_X2; // @[multiplier.scala 22:34]
  wire [1:0] pp_generator_inputCtrl_inv; // @[multiplier.scala 22:34]
  wire [1:0] pp_generator_inputCtrl_Set0; // @[multiplier.scala 22:34]
  wire [7:0] pp_generator_outputData_pp_out_0; // @[multiplier.scala 22:34]
  wire [7:0] pp_generator_outputData_pp_out_1; // @[multiplier.scala 22:34]
  wire [7:0] pp_generator_outputData_sig_out; // @[multiplier.scala 22:34]
  wire [7:0] wallace_tree_io_data_i_0; // @[multiplier.scala 23:34]
  wire [7:0] wallace_tree_io_data_i_1; // @[multiplier.scala 23:34]
  wire [7:0] wallace_tree_io_data_i_2; // @[multiplier.scala 23:34]
  wire [7:0] wallace_tree_io_data_o; // @[multiplier.scala 23:34]
  booth2Encoder booth2_encoder ( // @[multiplier.scala 21:34]
    .input_multiplier(booth2_encoder_input_multiplier),
    .output_X2(booth2_encoder_output_X2),
    .output_inv(booth2_encoder_output_inv),
    .output_set0(booth2_encoder_output_set0)
  );
  ppGenerator pp_generator ( // @[multiplier.scala 22:34]
    .clock(pp_generator_clock),
    .reset(pp_generator_reset),
    .inputData_multiplicand(pp_generator_inputData_multiplicand),
    .inputCtrl_X2(pp_generator_inputCtrl_X2),
    .inputCtrl_inv(pp_generator_inputCtrl_inv),
    .inputCtrl_Set0(pp_generator_inputCtrl_Set0),
    .outputData_pp_out_0(pp_generator_outputData_pp_out_0),
    .outputData_pp_out_1(pp_generator_outputData_pp_out_1),
    .outputData_sig_out(pp_generator_outputData_sig_out)
  );
  wallaceTree wallace_tree ( // @[multiplier.scala 23:34]
    .io_data_i_0(wallace_tree_io_data_i_0),
    .io_data_i_1(wallace_tree_io_data_i_1),
    .io_data_i_2(wallace_tree_io_data_i_2),
    .io_data_o(wallace_tree_io_data_o)
  );
  assign output_product = wallace_tree_io_data_o; // @[multiplier.scala 37:41]
  assign booth2_encoder_input_multiplier = input_multiplier; // @[multiplier.scala 25:37]
  assign pp_generator_clock = clock;
  assign pp_generator_reset = reset;
  assign pp_generator_inputData_multiplicand = input_multiplicand; // @[multiplier.scala 27:41]
  assign pp_generator_inputCtrl_X2 = booth2_encoder_output_X2; // @[multiplier.scala 28:41]
  assign pp_generator_inputCtrl_inv = booth2_encoder_output_inv; // @[multiplier.scala 29:41]
  assign pp_generator_inputCtrl_Set0 = booth2_encoder_output_set0; // @[multiplier.scala 30:41]
  assign wallace_tree_io_data_i_0 = pp_generator_outputData_pp_out_0; // @[multiplier.scala 33:35]
  assign wallace_tree_io_data_i_1 = pp_generator_outputData_pp_out_1; // @[multiplier.scala 33:35]
  assign wallace_tree_io_data_i_2 = pp_generator_outputData_sig_out; // @[multiplier.scala 35:40]
endmodule
module RCA_1(
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
  assign output_S = {s_comb_15,s_comb_14,s_comb_13,s_comb_12,s_comb_11,s_comb_10,s_comb_9,s_comb_8,output_S_lo}; // @[rca.scala 36:31]
endmodule
module MacUnit(
  input         clock,
  input         reset,
  input  [3:0]  io_in_a,
  input  [3:0]  io_in_b,
  input  [15:0] io_in_c,
  output [15:0] io_out_c
);
  wire  mul_clock; // @[MacUnit.scala 15:19]
  wire  mul_reset; // @[MacUnit.scala 15:19]
  wire [3:0] mul_input_multiplicand; // @[MacUnit.scala 15:19]
  wire [3:0] mul_input_multiplier; // @[MacUnit.scala 15:19]
  wire [7:0] mul_output_product; // @[MacUnit.scala 15:19]
  wire [15:0] rca_input_a_in; // @[MacUnit.scala 16:19]
  wire [15:0] rca_input_b_in; // @[MacUnit.scala 16:19]
  wire [15:0] rca_output_S; // @[MacUnit.scala 16:19]
  wire [7:0] _rca_input_a_in_T_2 = mul_output_product[7] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  Multiplier mul ( // @[MacUnit.scala 15:19]
    .clock(mul_clock),
    .reset(mul_reset),
    .input_multiplicand(mul_input_multiplicand),
    .input_multiplier(mul_input_multiplier),
    .output_product(mul_output_product)
  );
  RCA_1 rca ( // @[MacUnit.scala 16:19]
    .input_a_in(rca_input_a_in),
    .input_b_in(rca_input_b_in),
    .output_S(rca_output_S)
  );
  assign io_out_c = rca_output_S; // @[MacUnit.scala 24:19]
  assign mul_clock = clock;
  assign mul_reset = reset;
  assign mul_input_multiplicand = io_in_a; // @[MacUnit.scala 18:26]
  assign mul_input_multiplier = io_in_b; // @[MacUnit.scala 19:26]
  assign rca_input_a_in = {_rca_input_a_in_T_2,mul_output_product}; // @[MacUnit.scala 21:108]
  assign rca_input_b_in = io_in_c; // @[MacUnit.scala 22:19]
endmodule
module PE(
  input         clock,
  input         reset,
  input         io_in_control_ctrl_sa_send_data,
  input  [3:0]  io_in_a,
  input  [3:0]  io_in_b,
  input  [15:0] io_in_c,
  output        io_out_control_ctrl_sa_send_data,
  output [3:0]  io_out_a,
  output [3:0]  io_out_b,
  output [15:0] io_out_c
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  mac_clock; // @[PE.scala 28:19]
  wire  mac_reset; // @[PE.scala 28:19]
  wire [3:0] mac_io_in_a; // @[PE.scala 28:19]
  wire [3:0] mac_io_in_b; // @[PE.scala 28:19]
  wire [15:0] mac_io_in_c; // @[PE.scala 28:19]
  wire [15:0] mac_io_out_c; // @[PE.scala 28:19]
  reg [3:0] a_reg; // @[PE.scala 24:22]
  reg [3:0] b_reg; // @[PE.scala 25:22]
  reg [15:0] c_reg; // @[PE.scala 26:22]
  MacUnit mac ( // @[PE.scala 28:19]
    .clock(mac_clock),
    .reset(mac_reset),
    .io_in_a(mac_io_in_a),
    .io_in_b(mac_io_in_b),
    .io_in_c(mac_io_in_c),
    .io_out_c(mac_io_out_c)
  );
  assign io_out_control_ctrl_sa_send_data = io_in_control_ctrl_sa_send_data; // @[PE.scala 42:18]
  assign io_out_a = a_reg; // @[PE.scala 38:12]
  assign io_out_b = b_reg; // @[PE.scala 39:12]
  assign io_out_c = c_reg; // @[PE.scala 40:12]
  assign mac_clock = clock;
  assign mac_reset = reset;
  assign mac_io_in_a = io_in_a; // @[PE.scala 29:15]
  assign mac_io_in_b = io_in_b; // @[PE.scala 30:15]
  assign mac_io_in_c = c_reg; // @[PE.scala 31:15]
  always @(posedge clock) begin
    if (reset) begin // @[PE.scala 24:22]
      a_reg <= 4'sh0; // @[PE.scala 24:22]
    end else begin
      a_reg <= io_in_a; // @[PE.scala 33:9]
    end
    if (reset) begin // @[PE.scala 25:22]
      b_reg <= 4'sh0; // @[PE.scala 25:22]
    end else begin
      b_reg <= io_in_b; // @[PE.scala 34:9]
    end
    if (reset) begin // @[PE.scala 26:22]
      c_reg <= 16'sh0; // @[PE.scala 26:22]
    end else if (io_in_control_ctrl_sa_send_data) begin // @[PE.scala 36:15]
      c_reg <= io_in_c;
    end else begin
      c_reg <= mac_io_out_c;
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
  a_reg = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  b_reg = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  c_reg = _RAND_2[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_2(
  input         clock,
  input         reset,
  input         io_in_control_ctrl_sa_send_data,
  input  [3:0]  io_in_a,
  input  [3:0]  io_in_b,
  input  [15:0] io_in_c,
  output [3:0]  io_out_a,
  output [15:0] io_out_c
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  mac_clock; // @[PE.scala 28:19]
  wire  mac_reset; // @[PE.scala 28:19]
  wire [3:0] mac_io_in_a; // @[PE.scala 28:19]
  wire [3:0] mac_io_in_b; // @[PE.scala 28:19]
  wire [15:0] mac_io_in_c; // @[PE.scala 28:19]
  wire [15:0] mac_io_out_c; // @[PE.scala 28:19]
  reg [3:0] a_reg; // @[PE.scala 24:22]
  reg [15:0] c_reg; // @[PE.scala 26:22]
  MacUnit mac ( // @[PE.scala 28:19]
    .clock(mac_clock),
    .reset(mac_reset),
    .io_in_a(mac_io_in_a),
    .io_in_b(mac_io_in_b),
    .io_in_c(mac_io_in_c),
    .io_out_c(mac_io_out_c)
  );
  assign io_out_a = a_reg; // @[PE.scala 38:12]
  assign io_out_c = c_reg; // @[PE.scala 40:12]
  assign mac_clock = clock;
  assign mac_reset = reset;
  assign mac_io_in_a = io_in_a; // @[PE.scala 29:15]
  assign mac_io_in_b = io_in_b; // @[PE.scala 30:15]
  assign mac_io_in_c = c_reg; // @[PE.scala 31:15]
  always @(posedge clock) begin
    if (reset) begin // @[PE.scala 24:22]
      a_reg <= 4'sh0; // @[PE.scala 24:22]
    end else begin
      a_reg <= io_in_a; // @[PE.scala 33:9]
    end
    if (reset) begin // @[PE.scala 26:22]
      c_reg <= 16'sh0; // @[PE.scala 26:22]
    end else if (io_in_control_ctrl_sa_send_data) begin // @[PE.scala 36:15]
      c_reg <= io_in_c;
    end else begin
      c_reg <= mac_io_out_c;
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
  a_reg = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  c_reg = _RAND_1[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SystolicArray(
  input         clock,
  input         reset,
  input         io_in_control_0_ctrl_sa_send_data,
  input         io_in_control_1_ctrl_sa_send_data,
  input  [3:0]  io_in_a_0,
  input  [3:0]  io_in_a_1,
  input  [3:0]  io_in_b_0,
  input  [3:0]  io_in_b_1,
  input  [15:0] io_in_c_0,
  input  [15:0] io_in_c_1,
  output [15:0] io_out_c_0,
  output [15:0] io_out_c_1
);
  wire  sa_0_0_clock; // @[SystolicArray.scala 22:45]
  wire  sa_0_0_reset; // @[SystolicArray.scala 22:45]
  wire  sa_0_0_io_in_control_ctrl_sa_send_data; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_0_0_io_in_a; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_0_0_io_in_b; // @[SystolicArray.scala 22:45]
  wire [15:0] sa_0_0_io_in_c; // @[SystolicArray.scala 22:45]
  wire  sa_0_0_io_out_control_ctrl_sa_send_data; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_0_0_io_out_a; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_0_0_io_out_b; // @[SystolicArray.scala 22:45]
  wire [15:0] sa_0_0_io_out_c; // @[SystolicArray.scala 22:45]
  wire  sa_0_1_clock; // @[SystolicArray.scala 22:45]
  wire  sa_0_1_reset; // @[SystolicArray.scala 22:45]
  wire  sa_0_1_io_in_control_ctrl_sa_send_data; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_0_1_io_in_a; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_0_1_io_in_b; // @[SystolicArray.scala 22:45]
  wire [15:0] sa_0_1_io_in_c; // @[SystolicArray.scala 22:45]
  wire  sa_0_1_io_out_control_ctrl_sa_send_data; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_0_1_io_out_a; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_0_1_io_out_b; // @[SystolicArray.scala 22:45]
  wire [15:0] sa_0_1_io_out_c; // @[SystolicArray.scala 22:45]
  wire  sa_1_0_clock; // @[SystolicArray.scala 22:45]
  wire  sa_1_0_reset; // @[SystolicArray.scala 22:45]
  wire  sa_1_0_io_in_control_ctrl_sa_send_data; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_1_0_io_in_a; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_1_0_io_in_b; // @[SystolicArray.scala 22:45]
  wire [15:0] sa_1_0_io_in_c; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_1_0_io_out_a; // @[SystolicArray.scala 22:45]
  wire [15:0] sa_1_0_io_out_c; // @[SystolicArray.scala 22:45]
  wire  sa_1_1_clock; // @[SystolicArray.scala 22:45]
  wire  sa_1_1_reset; // @[SystolicArray.scala 22:45]
  wire  sa_1_1_io_in_control_ctrl_sa_send_data; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_1_1_io_in_a; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_1_1_io_in_b; // @[SystolicArray.scala 22:45]
  wire [15:0] sa_1_1_io_in_c; // @[SystolicArray.scala 22:45]
  wire [3:0] sa_1_1_io_out_a; // @[SystolicArray.scala 22:45]
  wire [15:0] sa_1_1_io_out_c; // @[SystolicArray.scala 22:45]
  PE sa_0_0 ( // @[SystolicArray.scala 22:45]
    .clock(sa_0_0_clock),
    .reset(sa_0_0_reset),
    .io_in_control_ctrl_sa_send_data(sa_0_0_io_in_control_ctrl_sa_send_data),
    .io_in_a(sa_0_0_io_in_a),
    .io_in_b(sa_0_0_io_in_b),
    .io_in_c(sa_0_0_io_in_c),
    .io_out_control_ctrl_sa_send_data(sa_0_0_io_out_control_ctrl_sa_send_data),
    .io_out_a(sa_0_0_io_out_a),
    .io_out_b(sa_0_0_io_out_b),
    .io_out_c(sa_0_0_io_out_c)
  );
  PE sa_0_1 ( // @[SystolicArray.scala 22:45]
    .clock(sa_0_1_clock),
    .reset(sa_0_1_reset),
    .io_in_control_ctrl_sa_send_data(sa_0_1_io_in_control_ctrl_sa_send_data),
    .io_in_a(sa_0_1_io_in_a),
    .io_in_b(sa_0_1_io_in_b),
    .io_in_c(sa_0_1_io_in_c),
    .io_out_control_ctrl_sa_send_data(sa_0_1_io_out_control_ctrl_sa_send_data),
    .io_out_a(sa_0_1_io_out_a),
    .io_out_b(sa_0_1_io_out_b),
    .io_out_c(sa_0_1_io_out_c)
  );
  PE_2 sa_1_0 ( // @[SystolicArray.scala 22:45]
    .clock(sa_1_0_clock),
    .reset(sa_1_0_reset),
    .io_in_control_ctrl_sa_send_data(sa_1_0_io_in_control_ctrl_sa_send_data),
    .io_in_a(sa_1_0_io_in_a),
    .io_in_b(sa_1_0_io_in_b),
    .io_in_c(sa_1_0_io_in_c),
    .io_out_a(sa_1_0_io_out_a),
    .io_out_c(sa_1_0_io_out_c)
  );
  PE_2 sa_1_1 ( // @[SystolicArray.scala 22:45]
    .clock(sa_1_1_clock),
    .reset(sa_1_1_reset),
    .io_in_control_ctrl_sa_send_data(sa_1_1_io_in_control_ctrl_sa_send_data),
    .io_in_a(sa_1_1_io_in_a),
    .io_in_b(sa_1_1_io_in_b),
    .io_in_c(sa_1_1_io_in_c),
    .io_out_a(sa_1_1_io_out_a),
    .io_out_c(sa_1_1_io_out_c)
  );
  assign io_out_c_0 = sa_1_0_io_out_c; // @[SystolicArray.scala 60:17]
  assign io_out_c_1 = sa_1_1_io_out_c; // @[SystolicArray.scala 60:17]
  assign sa_0_0_clock = clock;
  assign sa_0_0_reset = reset;
  assign sa_0_0_io_in_control_ctrl_sa_send_data = io_in_control_0_ctrl_sa_send_data; // @[SystolicArray.scala 53:26]
  assign sa_0_0_io_in_a = io_in_a_0; // @[SystolicArray.scala 28:20]
  assign sa_0_0_io_in_b = io_in_b_0; // @[SystolicArray.scala 36:20]
  assign sa_0_0_io_in_c = io_in_c_0; // @[SystolicArray.scala 44:20]
  assign sa_0_1_clock = clock;
  assign sa_0_1_reset = reset;
  assign sa_0_1_io_in_control_ctrl_sa_send_data = io_in_control_1_ctrl_sa_send_data; // @[SystolicArray.scala 53:26]
  assign sa_0_1_io_in_a = sa_0_0_io_out_a; // @[SystolicArray.scala 28:20]
  assign sa_0_1_io_in_b = io_in_b_1; // @[SystolicArray.scala 36:20]
  assign sa_0_1_io_in_c = io_in_c_1; // @[SystolicArray.scala 44:20]
  assign sa_1_0_clock = clock;
  assign sa_1_0_reset = reset;
  assign sa_1_0_io_in_control_ctrl_sa_send_data = sa_0_0_io_out_control_ctrl_sa_send_data; // @[SystolicArray.scala 53:26]
  assign sa_1_0_io_in_a = io_in_a_1; // @[SystolicArray.scala 28:20]
  assign sa_1_0_io_in_b = sa_0_0_io_out_b; // @[SystolicArray.scala 36:20]
  assign sa_1_0_io_in_c = sa_0_0_io_out_c; // @[SystolicArray.scala 44:20]
  assign sa_1_1_clock = clock;
  assign sa_1_1_reset = reset;
  assign sa_1_1_io_in_control_ctrl_sa_send_data = sa_0_1_io_out_control_ctrl_sa_send_data; // @[SystolicArray.scala 53:26]
  assign sa_1_1_io_in_a = sa_1_0_io_out_a; // @[SystolicArray.scala 28:20]
  assign sa_1_1_io_in_b = sa_0_1_io_out_b; // @[SystolicArray.scala 36:20]
  assign sa_1_1_io_in_c = sa_0_1_io_out_c; // @[SystolicArray.scala 44:20]
endmodule
module GlobalCounter(
  input   clock,
  input   reset,
  input   io_start,
  output  io_tick
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] count; // @[Controller.scala 13:22]
  wire  tick = count == 3'h4; // @[Controller.scala 14:20]
  reg  enable; // @[Controller.scala 16:23]
  wire  _GEN_0 = tick ? 1'h0 : enable; // @[Controller.scala 19:20 20:12 16:23]
  wire  _GEN_1 = io_start | _GEN_0; // @[Controller.scala 17:18 18:12]
  wire [2:0] _count_T_1 = count + 3'h1; // @[Controller.scala 25:22]
  assign io_tick = count == 3'h4; // @[Controller.scala 14:20]
  always @(posedge clock) begin
    if (reset) begin // @[Controller.scala 13:22]
      count <= 3'h0; // @[Controller.scala 13:22]
    end else if (enable) begin // @[Controller.scala 23:16]
      if (count != 3'h4) begin // @[Controller.scala 24:37]
        count <= _count_T_1; // @[Controller.scala 25:13]
      end else begin
        count <= 3'h0; // @[Controller.scala 27:13]
      end
    end
    if (reset) begin // @[Controller.scala 16:23]
      enable <= 1'h0; // @[Controller.scala 16:23]
    end else begin
      enable <= _GEN_1;
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
  count = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  enable = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module GlobalCounter_1(
  input   clock,
  input   reset,
  input   io_start,
  output  io_tick
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  count; // @[Controller.scala 13:22]
  reg  enable; // @[Controller.scala 16:23]
  wire  _GEN_0 = count ? 1'h0 : enable; // @[Controller.scala 19:20 20:12 16:23]
  wire  _GEN_1 = io_start | _GEN_0; // @[Controller.scala 17:18 18:12]
  wire  _GEN_2 = ~count & count + 1'h1; // @[Controller.scala 24:37 25:13 27:13]
  assign io_tick = count; // @[Controller.scala 14:20]
  always @(posedge clock) begin
    if (reset) begin // @[Controller.scala 13:22]
      count <= 1'h0; // @[Controller.scala 13:22]
    end else if (enable) begin // @[Controller.scala 23:16]
      count <= _GEN_2;
    end
    if (reset) begin // @[Controller.scala 16:23]
      enable <= 1'h0; // @[Controller.scala 16:23]
    end else begin
      enable <= _GEN_1;
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
  count = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  enable = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Controller(
  input   clock,
  input   reset,
  input   io_ibh_data_in_done,
  input   io_ibv_data_in_done,
  input   io_ob_empty,
  output  io_ctrl_ib_data_out,
  output  io_ctrl_ob_data_in,
  output  io_ctrl_sa_send_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  cal_gc_clock; // @[Controller.scala 60:28]
  wire  cal_gc_reset; // @[Controller.scala 60:28]
  wire  cal_gc_io_start; // @[Controller.scala 60:28]
  wire  cal_gc_io_tick; // @[Controller.scala 60:28]
  wire  out_gc_clock; // @[Controller.scala 67:28]
  wire  out_gc_reset; // @[Controller.scala 67:28]
  wire  out_gc_io_start; // @[Controller.scala 67:28]
  wire  out_gc_io_tick; // @[Controller.scala 67:28]
  reg  delay_ctrl_ib_data_out; // @[Controller.scala 47:39]
  reg [1:0] state; // @[Controller.scala 82:22]
  reg  isStall; // @[Controller.scala 57:24]
  wire  _T_2 = ~isStall; // @[Controller.scala 85:56]
  wire  _T_3 = io_ibh_data_in_done & io_ibv_data_in_done & ~isStall; // @[Controller.scala 85:53]
  wire  ctrl_ib_data_out = state == 2'h0 & _T_3; // @[Controller.scala 84:24]
  reg  cal_done; // @[Controller.scala 53:25]
  reg  out_done; // @[Controller.scala 54:25]
  wire  _GEN_0 = cal_gc_io_tick | cal_done; // @[Controller.scala 62:24 63:14 53:25]
  wire  _GEN_1 = out_gc_io_tick | out_done; // @[Controller.scala 69:24 70:14 54:25]
  wire  _io_ctrl_ob_data_in_T_1 = cal_done & ~out_done; // @[Controller.scala 73:34]
  wire [1:0] _GEN_5 = cal_gc_io_tick & ~io_ob_empty ? 2'h2 : state; // @[Controller.scala 94:48 95:13 82:22]
  wire  _GEN_6 = cal_gc_io_tick & ~io_ob_empty | isStall; // @[Controller.scala 94:48 96:15 57:24]
  wire [1:0] _GEN_9 = io_ob_empty ? 2'h3 : state; // @[Controller.scala 100:13 82:22 99:23]
  wire  _GEN_10 = io_ob_empty ? 1'h0 : isStall; // @[Controller.scala 101:15 99:23 57:24]
  wire [1:0] _GEN_11 = out_done ? 2'h0 : state; // @[Controller.scala 104:20 105:13 82:22]
  wire  _GEN_12 = out_done ? 1'h0 : _GEN_0; // @[Controller.scala 104:20 106:16]
  wire  _GEN_13 = out_done ? 1'h0 : _GEN_1; // @[Controller.scala 104:20 107:16]
  wire [1:0] _GEN_14 = state == 2'h3 ? _GEN_11 : state; // @[Controller.scala 103:32 82:22]
  wire  _GEN_15 = state == 2'h3 ? _GEN_12 : _GEN_0; // @[Controller.scala 103:32]
  wire  _GEN_16 = state == 2'h3 ? _GEN_13 : _GEN_1; // @[Controller.scala 103:32]
  GlobalCounter cal_gc ( // @[Controller.scala 60:28]
    .clock(cal_gc_clock),
    .reset(cal_gc_reset),
    .io_start(cal_gc_io_start),
    .io_tick(cal_gc_io_tick)
  );
  GlobalCounter_1 out_gc ( // @[Controller.scala 67:28]
    .clock(out_gc_clock),
    .reset(out_gc_reset),
    .io_start(out_gc_io_start),
    .io_tick(out_gc_io_tick)
  );
  assign io_ctrl_ib_data_out = ~delay_ctrl_ib_data_out & ctrl_ib_data_out; // @[Controller.scala 50:52]
  assign io_ctrl_ob_data_in = cal_done & ~out_done & _T_2; // @[Controller.scala 73:46]
  assign io_ctrl_sa_send_data = _io_ctrl_ob_data_in_T_1 & _T_2; // @[Controller.scala 74:48]
  assign cal_gc_clock = clock;
  assign cal_gc_reset = reset;
  assign cal_gc_io_start = state == 2'h0 & _T_3; // @[Controller.scala 84:24]
  assign out_gc_clock = clock;
  assign out_gc_reset = reset;
  assign out_gc_io_start = cal_gc_io_tick & io_ob_empty | isStall & io_ob_empty; // @[Controller.scala 68:51]
  always @(posedge clock) begin
    if (reset) begin // @[Controller.scala 47:39]
      delay_ctrl_ib_data_out <= 1'h0; // @[Controller.scala 47:39]
    end else begin
      delay_ctrl_ib_data_out <= ctrl_ib_data_out; // @[Controller.scala 49:26]
    end
    if (reset) begin // @[Controller.scala 82:22]
      state <= 2'h0; // @[Controller.scala 82:22]
    end else if (state == 2'h0) begin // @[Controller.scala 84:24]
      if (io_ibh_data_in_done & io_ibv_data_in_done & ~isStall) begin // @[Controller.scala 85:66]
        state <= 2'h1; // @[Controller.scala 86:13]
      end
    end else if (state == 2'h1) begin // @[Controller.scala 91:33]
      if (cal_done & io_ob_empty) begin // @[Controller.scala 92:35]
        state <= 2'h3; // @[Controller.scala 93:13]
      end else begin
        state <= _GEN_5;
      end
    end else if (state == 2'h2) begin // @[Controller.scala 98:31]
      state <= _GEN_9;
    end else begin
      state <= _GEN_14;
    end
    if (reset) begin // @[Controller.scala 57:24]
      isStall <= 1'h0; // @[Controller.scala 57:24]
    end else if (state == 2'h0) begin // @[Controller.scala 84:24]
      if (io_ibh_data_in_done & io_ibv_data_in_done & ~isStall) begin // @[Controller.scala 85:66]
        isStall <= 1'h0; // @[Controller.scala 87:15]
      end
    end else if (state == 2'h1) begin // @[Controller.scala 91:33]
      if (!(cal_done & io_ob_empty)) begin // @[Controller.scala 92:35]
        isStall <= _GEN_6;
      end
    end else if (state == 2'h2) begin // @[Controller.scala 98:31]
      isStall <= _GEN_10;
    end
    if (reset) begin // @[Controller.scala 53:25]
      cal_done <= 1'h0; // @[Controller.scala 53:25]
    end else if (state == 2'h0) begin // @[Controller.scala 84:24]
      cal_done <= _GEN_0;
    end else if (state == 2'h1) begin // @[Controller.scala 91:33]
      cal_done <= _GEN_0;
    end else if (state == 2'h2) begin // @[Controller.scala 98:31]
      cal_done <= _GEN_0;
    end else begin
      cal_done <= _GEN_15;
    end
    if (reset) begin // @[Controller.scala 54:25]
      out_done <= 1'h0; // @[Controller.scala 54:25]
    end else if (state == 2'h0) begin // @[Controller.scala 84:24]
      out_done <= _GEN_1;
    end else if (state == 2'h1) begin // @[Controller.scala 91:33]
      out_done <= _GEN_1;
    end else if (state == 2'h2) begin // @[Controller.scala 98:31]
      out_done <= _GEN_1;
    end else begin
      out_done <= _GEN_16;
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
  delay_ctrl_ib_data_out = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  isStall = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cal_done = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  out_done = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SyncFIFO(
  input        clock,
  input        reset,
  input        io_enq,
  input        io_deq,
  input  [3:0] io_enqData,
  output [3:0] io_deqData,
  output       io_full,
  output       io_empty
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] mem_0; // @[SyncFIFO.scala 17:20]
  reg [3:0] mem_1; // @[SyncFIFO.scala 17:20]
  reg [1:0] readPtr; // @[SyncFIFO.scala 20:24]
  reg [1:0] writePtr; // @[SyncFIFO.scala 21:25]
  wire  isEmpty = readPtr == writePtr; // @[SyncFIFO.scala 27:22]
  wire  _isFull_T_1 = ~writePtr[1]; // @[SyncFIFO.scala 28:29]
  wire [1:0] _isFull_T_3 = {_isFull_T_1,writePtr[0]}; // @[Cat.scala 33:92]
  wire  isFull = readPtr == _isFull_T_3; // @[SyncFIFO.scala 28:21]
  wire [1:0] _writePtr_T_1 = writePtr + 2'h1; // @[SyncFIFO.scala 32:26]
  wire [1:0] _readPtr_T_1 = readPtr + 2'h1; // @[SyncFIFO.scala 36:24]
  wire [3:0] _GEN_6 = readPtr[0] ? $signed(mem_1) : $signed(mem_0); // @[SyncFIFO.scala 37:{13,13}]
  assign io_deqData = io_deq & ~isEmpty ? $signed(_GEN_6) : $signed(4'sh0); // @[SyncFIFO.scala 35:28 37:13]
  assign io_full = readPtr == _isFull_T_3; // @[SyncFIFO.scala 28:21]
  assign io_empty = readPtr == writePtr; // @[SyncFIFO.scala 27:22]
  always @(posedge clock) begin
    if (reset) begin // @[SyncFIFO.scala 17:20]
      mem_0 <= 4'sh0; // @[SyncFIFO.scala 17:20]
    end else if (io_enq & ~isFull) begin // @[SyncFIFO.scala 30:27]
      if (~writePtr[0]) begin // @[SyncFIFO.scala 31:19]
        mem_0 <= io_enqData; // @[SyncFIFO.scala 31:19]
      end
    end
    if (reset) begin // @[SyncFIFO.scala 17:20]
      mem_1 <= 4'sh0; // @[SyncFIFO.scala 17:20]
    end else if (io_enq & ~isFull) begin // @[SyncFIFO.scala 30:27]
      if (writePtr[0]) begin // @[SyncFIFO.scala 31:19]
        mem_1 <= io_enqData; // @[SyncFIFO.scala 31:19]
      end
    end
    if (reset) begin // @[SyncFIFO.scala 20:24]
      readPtr <= 2'h0; // @[SyncFIFO.scala 20:24]
    end else if (io_deq & ~isEmpty) begin // @[SyncFIFO.scala 35:28]
      readPtr <= _readPtr_T_1; // @[SyncFIFO.scala 36:13]
    end
    if (reset) begin // @[SyncFIFO.scala 21:25]
      writePtr <= 2'h0; // @[SyncFIFO.scala 21:25]
    end else if (io_enq & ~isFull) begin // @[SyncFIFO.scala 30:27]
      writePtr <= _writePtr_T_1; // @[SyncFIFO.scala 32:14]
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
  mem_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  mem_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  readPtr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  writePtr = _RAND_3[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module InputBuffer(
  input        clock,
  input        reset,
  input        io_ctrl_ib_data_out,
  output       io_data_in_ready,
  input        io_data_in_valid,
  input  [3:0] io_data_in_bits_0,
  input  [3:0] io_data_in_bits_1,
  output [3:0] io_data_out_0,
  output [3:0] io_data_out_1,
  output       io_ib_data_in_done
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  data_queue_0_clock; // @[InputBuffer.scala 16:46]
  wire  data_queue_0_reset; // @[InputBuffer.scala 16:46]
  wire  data_queue_0_io_enq; // @[InputBuffer.scala 16:46]
  wire  data_queue_0_io_deq; // @[InputBuffer.scala 16:46]
  wire [3:0] data_queue_0_io_enqData; // @[InputBuffer.scala 16:46]
  wire [3:0] data_queue_0_io_deqData; // @[InputBuffer.scala 16:46]
  wire  data_queue_0_io_full; // @[InputBuffer.scala 16:46]
  wire  data_queue_0_io_empty; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_clock; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_reset; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_io_enq; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_io_deq; // @[InputBuffer.scala 16:46]
  wire [3:0] data_queue_1_io_enqData; // @[InputBuffer.scala 16:46]
  wire [3:0] data_queue_1_io_deqData; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_io_full; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_io_empty; // @[InputBuffer.scala 16:46]
  reg  delay_count_1; // @[InputBuffer.scala 19:24]
  wire  allFull = data_queue_0_io_full & data_queue_1_io_full; // @[InputBuffer.scala 26:49]
  wire  allEmpty = data_queue_0_io_empty & data_queue_1_io_empty; // @[InputBuffer.scala 27:51]
  reg  state; // @[InputBuffer.scala 30:22]
  wire  _io_data_in_ready_T = ~state; // @[InputBuffer.scala 38:29]
  wire  _GEN_5 = state ? delay_count_1 & delay_count_1 - 1'h1 : delay_count_1; // @[InputBuffer.scala 48:34 53:22 19:24]
  SyncFIFO data_queue_0 ( // @[InputBuffer.scala 16:46]
    .clock(data_queue_0_clock),
    .reset(data_queue_0_reset),
    .io_enq(data_queue_0_io_enq),
    .io_deq(data_queue_0_io_deq),
    .io_enqData(data_queue_0_io_enqData),
    .io_deqData(data_queue_0_io_deqData),
    .io_full(data_queue_0_io_full),
    .io_empty(data_queue_0_io_empty)
  );
  SyncFIFO data_queue_1 ( // @[InputBuffer.scala 16:46]
    .clock(data_queue_1_clock),
    .reset(data_queue_1_reset),
    .io_enq(data_queue_1_io_enq),
    .io_deq(data_queue_1_io_deq),
    .io_enqData(data_queue_1_io_enqData),
    .io_deqData(data_queue_1_io_deqData),
    .io_full(data_queue_1_io_full),
    .io_empty(data_queue_1_io_empty)
  );
  assign io_data_in_ready = ~state; // @[InputBuffer.scala 38:29]
  assign io_data_out_0 = data_queue_0_io_deqData; // @[InputBuffer.scala 36:20]
  assign io_data_out_1 = data_queue_1_io_deqData; // @[InputBuffer.scala 36:20]
  assign io_ib_data_in_done = _io_data_in_ready_T & allFull; // @[InputBuffer.scala 40:27]
  assign data_queue_0_clock = clock;
  assign data_queue_0_reset = reset;
  assign data_queue_0_io_enq = io_data_in_ready & io_data_in_valid; // @[Decoupled.scala 52:35]
  assign data_queue_0_io_deq = state & ~data_queue_0_io_empty; // @[InputBuffer.scala 34:74]
  assign data_queue_0_io_enqData = io_data_in_bits_0; // @[InputBuffer.scala 35:30]
  assign data_queue_1_clock = clock;
  assign data_queue_1_reset = reset;
  assign data_queue_1_io_enq = io_data_in_ready & io_data_in_valid; // @[Decoupled.scala 52:35]
  assign data_queue_1_io_deq = state & ~delay_count_1 & ~data_queue_1_io_empty; // @[InputBuffer.scala 34:74]
  assign data_queue_1_io_enqData = io_data_in_bits_1; // @[InputBuffer.scala 35:30]
  always @(posedge clock) begin
    delay_count_1 <= _io_data_in_ready_T | _GEN_5; // @[InputBuffer.scala 40:27 46:22]
    if (reset) begin // @[InputBuffer.scala 30:22]
      state <= 1'h0; // @[InputBuffer.scala 30:22]
    end else if (_io_data_in_ready_T) begin // @[InputBuffer.scala 40:27]
      if (allFull) begin // @[InputBuffer.scala 41:19]
        state <= io_ctrl_ib_data_out; // @[InputBuffer.scala 43:13]
      end
    end else if (state) begin // @[InputBuffer.scala 48:34]
      if (allEmpty) begin // @[InputBuffer.scala 49:20]
        state <= 1'h0; // @[InputBuffer.scala 50:13]
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
  _RAND_0 = {1{`RANDOM}};
  delay_count_1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SyncFIFO_4(
  input         clock,
  input         reset,
  input         io_enq,
  input         io_deq,
  input  [15:0] io_enqData,
  output [15:0] io_deqData,
  output        io_empty
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] mem_0; // @[SyncFIFO.scala 17:20]
  reg [15:0] mem_1; // @[SyncFIFO.scala 17:20]
  reg [1:0] readPtr; // @[SyncFIFO.scala 20:24]
  reg [1:0] writePtr; // @[SyncFIFO.scala 21:25]
  wire  isEmpty = readPtr == writePtr; // @[SyncFIFO.scala 27:22]
  wire  _isFull_T_1 = ~writePtr[1]; // @[SyncFIFO.scala 28:29]
  wire [1:0] _isFull_T_3 = {_isFull_T_1,writePtr[0]}; // @[Cat.scala 33:92]
  wire  isFull = readPtr == _isFull_T_3; // @[SyncFIFO.scala 28:21]
  wire [1:0] _writePtr_T_1 = writePtr + 2'h1; // @[SyncFIFO.scala 32:26]
  wire [1:0] _readPtr_T_1 = readPtr + 2'h1; // @[SyncFIFO.scala 36:24]
  wire [15:0] _GEN_6 = readPtr[0] ? $signed(mem_1) : $signed(mem_0); // @[SyncFIFO.scala 37:{13,13}]
  assign io_deqData = io_deq & ~isEmpty ? $signed(_GEN_6) : $signed(16'sh0); // @[SyncFIFO.scala 35:28 37:13]
  assign io_empty = readPtr == writePtr; // @[SyncFIFO.scala 27:22]
  always @(posedge clock) begin
    if (reset) begin // @[SyncFIFO.scala 17:20]
      mem_0 <= 16'sh0; // @[SyncFIFO.scala 17:20]
    end else if (io_enq & ~isFull) begin // @[SyncFIFO.scala 30:27]
      if (~writePtr[0]) begin // @[SyncFIFO.scala 31:19]
        mem_0 <= io_enqData; // @[SyncFIFO.scala 31:19]
      end
    end
    if (reset) begin // @[SyncFIFO.scala 17:20]
      mem_1 <= 16'sh0; // @[SyncFIFO.scala 17:20]
    end else if (io_enq & ~isFull) begin // @[SyncFIFO.scala 30:27]
      if (writePtr[0]) begin // @[SyncFIFO.scala 31:19]
        mem_1 <= io_enqData; // @[SyncFIFO.scala 31:19]
      end
    end
    if (reset) begin // @[SyncFIFO.scala 20:24]
      readPtr <= 2'h0; // @[SyncFIFO.scala 20:24]
    end else if (io_deq & ~isEmpty) begin // @[SyncFIFO.scala 35:28]
      readPtr <= _readPtr_T_1; // @[SyncFIFO.scala 36:13]
    end
    if (reset) begin // @[SyncFIFO.scala 21:25]
      writePtr <= 2'h0; // @[SyncFIFO.scala 21:25]
    end else if (io_enq & ~isFull) begin // @[SyncFIFO.scala 30:27]
      writePtr <= _writePtr_T_1; // @[SyncFIFO.scala 32:14]
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
  mem_0 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  mem_1 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  readPtr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  writePtr = _RAND_3[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module OutputBuffer(
  input         clock,
  input         reset,
  input         io_ctrl_ob_data_in,
  input  [15:0] io_data_in_0,
  input  [15:0] io_data_in_1,
  input         io_data_out_ready,
  output        io_data_out_valid,
  output [15:0] io_data_out_bits_0,
  output [15:0] io_data_out_bits_1,
  output        io_ob_empty
);
  wire  data_queue_0_clock; // @[OutputBuffer.scala 16:46]
  wire  data_queue_0_reset; // @[OutputBuffer.scala 16:46]
  wire  data_queue_0_io_enq; // @[OutputBuffer.scala 16:46]
  wire  data_queue_0_io_deq; // @[OutputBuffer.scala 16:46]
  wire [15:0] data_queue_0_io_enqData; // @[OutputBuffer.scala 16:46]
  wire [15:0] data_queue_0_io_deqData; // @[OutputBuffer.scala 16:46]
  wire  data_queue_0_io_empty; // @[OutputBuffer.scala 16:46]
  wire  data_queue_1_clock; // @[OutputBuffer.scala 16:46]
  wire  data_queue_1_reset; // @[OutputBuffer.scala 16:46]
  wire  data_queue_1_io_enq; // @[OutputBuffer.scala 16:46]
  wire  data_queue_1_io_deq; // @[OutputBuffer.scala 16:46]
  wire [15:0] data_queue_1_io_enqData; // @[OutputBuffer.scala 16:46]
  wire [15:0] data_queue_1_io_deqData; // @[OutputBuffer.scala 16:46]
  wire  data_queue_1_io_empty; // @[OutputBuffer.scala 16:46]
  wire  allEmpty = data_queue_0_io_empty & data_queue_1_io_empty; // @[OutputBuffer.scala 19:51]
  SyncFIFO_4 data_queue_0 ( // @[OutputBuffer.scala 16:46]
    .clock(data_queue_0_clock),
    .reset(data_queue_0_reset),
    .io_enq(data_queue_0_io_enq),
    .io_deq(data_queue_0_io_deq),
    .io_enqData(data_queue_0_io_enqData),
    .io_deqData(data_queue_0_io_deqData),
    .io_empty(data_queue_0_io_empty)
  );
  SyncFIFO_4 data_queue_1 ( // @[OutputBuffer.scala 16:46]
    .clock(data_queue_1_clock),
    .reset(data_queue_1_reset),
    .io_enq(data_queue_1_io_enq),
    .io_deq(data_queue_1_io_deq),
    .io_enqData(data_queue_1_io_enqData),
    .io_deqData(data_queue_1_io_deqData),
    .io_empty(data_queue_1_io_empty)
  );
  assign io_data_out_valid = ~allEmpty; // @[OutputBuffer.scala 33:24]
  assign io_data_out_bits_0 = data_queue_0_io_deqData; // @[OutputBuffer.scala 30:25]
  assign io_data_out_bits_1 = data_queue_1_io_deqData; // @[OutputBuffer.scala 30:25]
  assign io_ob_empty = data_queue_0_io_empty & data_queue_1_io_empty; // @[OutputBuffer.scala 19:51]
  assign data_queue_0_clock = clock;
  assign data_queue_0_reset = reset;
  assign data_queue_0_io_enq = io_ctrl_ob_data_in; // @[OutputBuffer.scala 22:26]
  assign data_queue_0_io_deq = io_data_out_ready & io_data_out_valid; // @[Decoupled.scala 52:35]
  assign data_queue_0_io_enqData = io_data_in_0; // @[OutputBuffer.scala 29:30]
  assign data_queue_1_clock = clock;
  assign data_queue_1_reset = reset;
  assign data_queue_1_io_enq = io_ctrl_ob_data_in; // @[OutputBuffer.scala 22:26]
  assign data_queue_1_io_deq = io_data_out_ready & io_data_out_valid; // @[Decoupled.scala 52:35]
  assign data_queue_1_io_enqData = io_data_in_1; // @[OutputBuffer.scala 29:30]
endmodule
module top(
  input         clock,
  input         reset,
  output        io_tpuIO_in_ready,
  input         io_tpuIO_in_valid,
  input  [3:0]  io_tpuIO_in_bits_in_a_0,
  input  [3:0]  io_tpuIO_in_bits_in_a_1,
  input  [3:0]  io_tpuIO_in_bits_in_b_0,
  input  [3:0]  io_tpuIO_in_bits_in_b_1,
  input  [15:0] io_tpuIO_in_bits_in_c_0,
  input  [15:0] io_tpuIO_in_bits_in_c_1,
  input         io_tpuIO_out_ready,
  output        io_tpuIO_out_valid,
  output [15:0] io_tpuIO_out_bits_out_c_0,
  output [15:0] io_tpuIO_out_bits_out_c_1
);
  wire  sa_clock; // @[top.scala 178:18]
  wire  sa_reset; // @[top.scala 178:18]
  wire  sa_io_in_control_0_ctrl_sa_send_data; // @[top.scala 178:18]
  wire  sa_io_in_control_1_ctrl_sa_send_data; // @[top.scala 178:18]
  wire [3:0] sa_io_in_a_0; // @[top.scala 178:18]
  wire [3:0] sa_io_in_a_1; // @[top.scala 178:18]
  wire [3:0] sa_io_in_b_0; // @[top.scala 178:18]
  wire [3:0] sa_io_in_b_1; // @[top.scala 178:18]
  wire [15:0] sa_io_in_c_0; // @[top.scala 178:18]
  wire [15:0] sa_io_in_c_1; // @[top.scala 178:18]
  wire [15:0] sa_io_out_c_0; // @[top.scala 178:18]
  wire [15:0] sa_io_out_c_1; // @[top.scala 178:18]
  wire  controller_clock; // @[top.scala 179:26]
  wire  controller_reset; // @[top.scala 179:26]
  wire  controller_io_ibh_data_in_done; // @[top.scala 179:26]
  wire  controller_io_ibv_data_in_done; // @[top.scala 179:26]
  wire  controller_io_ob_empty; // @[top.scala 179:26]
  wire  controller_io_ctrl_ib_data_out; // @[top.scala 179:26]
  wire  controller_io_ctrl_ob_data_in; // @[top.scala 179:26]
  wire  controller_io_ctrl_sa_send_data; // @[top.scala 179:26]
  wire  inBuffer_h_clock; // @[top.scala 180:28]
  wire  inBuffer_h_reset; // @[top.scala 180:28]
  wire  inBuffer_h_io_ctrl_ib_data_out; // @[top.scala 180:28]
  wire  inBuffer_h_io_data_in_ready; // @[top.scala 180:28]
  wire  inBuffer_h_io_data_in_valid; // @[top.scala 180:28]
  wire [3:0] inBuffer_h_io_data_in_bits_0; // @[top.scala 180:28]
  wire [3:0] inBuffer_h_io_data_in_bits_1; // @[top.scala 180:28]
  wire [3:0] inBuffer_h_io_data_out_0; // @[top.scala 180:28]
  wire [3:0] inBuffer_h_io_data_out_1; // @[top.scala 180:28]
  wire  inBuffer_h_io_ib_data_in_done; // @[top.scala 180:28]
  wire  inBuffer_v_clock; // @[top.scala 181:27]
  wire  inBuffer_v_reset; // @[top.scala 181:27]
  wire  inBuffer_v_io_ctrl_ib_data_out; // @[top.scala 181:27]
  wire  inBuffer_v_io_data_in_ready; // @[top.scala 181:27]
  wire  inBuffer_v_io_data_in_valid; // @[top.scala 181:27]
  wire [3:0] inBuffer_v_io_data_in_bits_0; // @[top.scala 181:27]
  wire [3:0] inBuffer_v_io_data_in_bits_1; // @[top.scala 181:27]
  wire [3:0] inBuffer_v_io_data_out_0; // @[top.scala 181:27]
  wire [3:0] inBuffer_v_io_data_out_1; // @[top.scala 181:27]
  wire  inBuffer_v_io_ib_data_in_done; // @[top.scala 181:27]
  wire  outBuffer_clock; // @[top.scala 182:26]
  wire  outBuffer_reset; // @[top.scala 182:26]
  wire  outBuffer_io_ctrl_ob_data_in; // @[top.scala 182:26]
  wire [15:0] outBuffer_io_data_in_0; // @[top.scala 182:26]
  wire [15:0] outBuffer_io_data_in_1; // @[top.scala 182:26]
  wire  outBuffer_io_data_out_ready; // @[top.scala 182:26]
  wire  outBuffer_io_data_out_valid; // @[top.scala 182:26]
  wire [15:0] outBuffer_io_data_out_bits_0; // @[top.scala 182:26]
  wire [15:0] outBuffer_io_data_out_bits_1; // @[top.scala 182:26]
  wire  outBuffer_io_ob_empty; // @[top.scala 182:26]
  SystolicArray sa ( // @[top.scala 178:18]
    .clock(sa_clock),
    .reset(sa_reset),
    .io_in_control_0_ctrl_sa_send_data(sa_io_in_control_0_ctrl_sa_send_data),
    .io_in_control_1_ctrl_sa_send_data(sa_io_in_control_1_ctrl_sa_send_data),
    .io_in_a_0(sa_io_in_a_0),
    .io_in_a_1(sa_io_in_a_1),
    .io_in_b_0(sa_io_in_b_0),
    .io_in_b_1(sa_io_in_b_1),
    .io_in_c_0(sa_io_in_c_0),
    .io_in_c_1(sa_io_in_c_1),
    .io_out_c_0(sa_io_out_c_0),
    .io_out_c_1(sa_io_out_c_1)
  );
  Controller controller ( // @[top.scala 179:26]
    .clock(controller_clock),
    .reset(controller_reset),
    .io_ibh_data_in_done(controller_io_ibh_data_in_done),
    .io_ibv_data_in_done(controller_io_ibv_data_in_done),
    .io_ob_empty(controller_io_ob_empty),
    .io_ctrl_ib_data_out(controller_io_ctrl_ib_data_out),
    .io_ctrl_ob_data_in(controller_io_ctrl_ob_data_in),
    .io_ctrl_sa_send_data(controller_io_ctrl_sa_send_data)
  );
  InputBuffer inBuffer_h ( // @[top.scala 180:28]
    .clock(inBuffer_h_clock),
    .reset(inBuffer_h_reset),
    .io_ctrl_ib_data_out(inBuffer_h_io_ctrl_ib_data_out),
    .io_data_in_ready(inBuffer_h_io_data_in_ready),
    .io_data_in_valid(inBuffer_h_io_data_in_valid),
    .io_data_in_bits_0(inBuffer_h_io_data_in_bits_0),
    .io_data_in_bits_1(inBuffer_h_io_data_in_bits_1),
    .io_data_out_0(inBuffer_h_io_data_out_0),
    .io_data_out_1(inBuffer_h_io_data_out_1),
    .io_ib_data_in_done(inBuffer_h_io_ib_data_in_done)
  );
  InputBuffer inBuffer_v ( // @[top.scala 181:27]
    .clock(inBuffer_v_clock),
    .reset(inBuffer_v_reset),
    .io_ctrl_ib_data_out(inBuffer_v_io_ctrl_ib_data_out),
    .io_data_in_ready(inBuffer_v_io_data_in_ready),
    .io_data_in_valid(inBuffer_v_io_data_in_valid),
    .io_data_in_bits_0(inBuffer_v_io_data_in_bits_0),
    .io_data_in_bits_1(inBuffer_v_io_data_in_bits_1),
    .io_data_out_0(inBuffer_v_io_data_out_0),
    .io_data_out_1(inBuffer_v_io_data_out_1),
    .io_ib_data_in_done(inBuffer_v_io_ib_data_in_done)
  );
  OutputBuffer outBuffer ( // @[top.scala 182:26]
    .clock(outBuffer_clock),
    .reset(outBuffer_reset),
    .io_ctrl_ob_data_in(outBuffer_io_ctrl_ob_data_in),
    .io_data_in_0(outBuffer_io_data_in_0),
    .io_data_in_1(outBuffer_io_data_in_1),
    .io_data_out_ready(outBuffer_io_data_out_ready),
    .io_data_out_valid(outBuffer_io_data_out_valid),
    .io_data_out_bits_0(outBuffer_io_data_out_bits_0),
    .io_data_out_bits_1(outBuffer_io_data_out_bits_1),
    .io_ob_empty(outBuffer_io_ob_empty)
  );
  assign io_tpuIO_in_ready = inBuffer_h_io_data_in_ready & inBuffer_v_io_data_in_ready; // @[top.scala 191:52]
  assign io_tpuIO_out_valid = outBuffer_io_data_out_valid; // @[top.scala 193:22]
  assign io_tpuIO_out_bits_out_c_0 = outBuffer_io_data_out_bits_0; // @[top.scala 194:27]
  assign io_tpuIO_out_bits_out_c_1 = outBuffer_io_data_out_bits_1; // @[top.scala 194:27]
  assign sa_clock = clock;
  assign sa_reset = reset;
  assign sa_io_in_control_0_ctrl_sa_send_data = controller_io_ctrl_sa_send_data; // @[top.scala 202:48]
  assign sa_io_in_control_1_ctrl_sa_send_data = controller_io_ctrl_sa_send_data; // @[top.scala 202:48]
  assign sa_io_in_a_0 = inBuffer_h_io_data_out_0; // @[top.scala 198:14]
  assign sa_io_in_a_1 = inBuffer_h_io_data_out_1; // @[top.scala 198:14]
  assign sa_io_in_b_0 = inBuffer_v_io_data_out_0; // @[top.scala 199:14]
  assign sa_io_in_b_1 = inBuffer_v_io_data_out_1; // @[top.scala 199:14]
  assign sa_io_in_c_0 = io_tpuIO_in_bits_in_c_0; // @[top.scala 200:14]
  assign sa_io_in_c_1 = io_tpuIO_in_bits_in_c_1; // @[top.scala 200:14]
  assign controller_clock = clock;
  assign controller_reset = reset;
  assign controller_io_ibh_data_in_done = inBuffer_h_io_ib_data_in_done; // @[top.scala 204:34]
  assign controller_io_ibv_data_in_done = inBuffer_v_io_ib_data_in_done; // @[top.scala 205:34]
  assign controller_io_ob_empty = outBuffer_io_ob_empty; // @[top.scala 206:26]
  assign inBuffer_h_clock = clock;
  assign inBuffer_h_reset = reset;
  assign inBuffer_h_io_ctrl_ib_data_out = controller_io_ctrl_ib_data_out; // @[top.scala 186:34]
  assign inBuffer_h_io_data_in_valid = io_tpuIO_in_valid; // @[top.scala 184:31]
  assign inBuffer_h_io_data_in_bits_0 = io_tpuIO_in_bits_in_a_0; // @[top.scala 185:30]
  assign inBuffer_h_io_data_in_bits_1 = io_tpuIO_in_bits_in_a_1; // @[top.scala 185:30]
  assign inBuffer_v_clock = clock;
  assign inBuffer_v_reset = reset;
  assign inBuffer_v_io_ctrl_ib_data_out = controller_io_ctrl_ib_data_out; // @[top.scala 190:34]
  assign inBuffer_v_io_data_in_valid = io_tpuIO_in_valid; // @[top.scala 188:31]
  assign inBuffer_v_io_data_in_bits_0 = io_tpuIO_in_bits_in_b_0; // @[top.scala 189:30]
  assign inBuffer_v_io_data_in_bits_1 = io_tpuIO_in_bits_in_b_1; // @[top.scala 189:30]
  assign outBuffer_clock = clock;
  assign outBuffer_reset = reset;
  assign outBuffer_io_ctrl_ob_data_in = controller_io_ctrl_ob_data_in; // @[top.scala 196:32]
  assign outBuffer_io_data_in_0 = sa_io_out_c_0; // @[top.scala 201:24]
  assign outBuffer_io_data_in_1 = sa_io_out_c_1; // @[top.scala 201:24]
  assign outBuffer_io_data_out_ready = io_tpuIO_out_ready; // @[top.scala 195:31]
endmodule
