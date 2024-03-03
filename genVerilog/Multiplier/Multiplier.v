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
