circuit top :
  module booth2Encoder :
    input clock : Clock
    input reset : UInt<1>
    input input_multiplier : SInt<4>
    output output_X2 : UInt<2>
    output output_inv : UInt<2>
    output output_set0 : UInt<2>

    node multiplier2_hi = asUInt(input_multiplier) @[Cat.scala 33:92]
    node _multiplier2_T = cat(multiplier2_hi, UInt<1>("h0")) @[Cat.scala 33:92]
    node multiplier2 = _multiplier2_T @[booth2_encoder.scala 22:27 29:17]
    node _bits_0_T = bits(multiplier2, 2, 0) @[booth2_encoder.scala 32:31]
    node _bits_1_T = bits(multiplier2, 4, 2) @[booth2_encoder.scala 32:31]
    node bits_0 = _bits_0_T @[booth2_encoder.scala 23:27 32:17]
    node _X2Bools_0_T = bits(bits_0, 0, 0) @[booth2_encoder.scala 36:35]
    node _X2Bools_0_T_1 = bits(bits_0, 1, 1) @[booth2_encoder.scala 36:46]
    node _X2Bools_0_T_2 = xor(_X2Bools_0_T, _X2Bools_0_T_1) @[booth2_encoder.scala 36:38]
    node _X2Bools_0_T_3 = not(_X2Bools_0_T_2) @[booth2_encoder.scala 36:26]
    node _X2Bools_0_T_4 = bits(_X2Bools_0_T_3, 0, 0) @[booth2_encoder.scala 36:52]
    node _invBools_0_T = bits(bits_0, 2, 2) @[booth2_encoder.scala 37:32]
    node _invBools_0_T_1 = bits(_invBools_0_T, 0, 0) @[booth2_encoder.scala 37:36]
    node _set0Bools_0_T = andr(bits_0) @[booth2_encoder.scala 38:33]
    node _set0Bools_0_T_1 = not(bits_0) @[booth2_encoder.scala 38:48]
    node _set0Bools_0_T_2 = andr(_set0Bools_0_T_1) @[booth2_encoder.scala 38:58]
    node _set0Bools_0_T_3 = bits(_set0Bools_0_T_2, 0, 0) @[booth2_encoder.scala 38:63]
    node _set0Bools_0_T_4 = or(_set0Bools_0_T, _set0Bools_0_T_3) @[booth2_encoder.scala 38:45]
    node bits_1 = _bits_1_T @[booth2_encoder.scala 23:27 32:17]
    node _X2Bools_1_T = bits(bits_1, 0, 0) @[booth2_encoder.scala 36:35]
    node _X2Bools_1_T_1 = bits(bits_1, 1, 1) @[booth2_encoder.scala 36:46]
    node _X2Bools_1_T_2 = xor(_X2Bools_1_T, _X2Bools_1_T_1) @[booth2_encoder.scala 36:38]
    node _X2Bools_1_T_3 = not(_X2Bools_1_T_2) @[booth2_encoder.scala 36:26]
    node _X2Bools_1_T_4 = bits(_X2Bools_1_T_3, 0, 0) @[booth2_encoder.scala 36:52]
    node _invBools_1_T = bits(bits_1, 2, 2) @[booth2_encoder.scala 37:32]
    node _invBools_1_T_1 = bits(_invBools_1_T, 0, 0) @[booth2_encoder.scala 37:36]
    node _set0Bools_1_T = andr(bits_1) @[booth2_encoder.scala 38:33]
    node _set0Bools_1_T_1 = not(bits_1) @[booth2_encoder.scala 38:48]
    node _set0Bools_1_T_2 = andr(_set0Bools_1_T_1) @[booth2_encoder.scala 38:58]
    node _set0Bools_1_T_3 = bits(_set0Bools_1_T_2, 0, 0) @[booth2_encoder.scala 38:63]
    node _set0Bools_1_T_4 = or(_set0Bools_1_T, _set0Bools_1_T_3) @[booth2_encoder.scala 38:45]
    node X2Bools_1 = _X2Bools_1_T_4 @[booth2_encoder.scala 25:30 36:22]
    node X2Bools_0 = _X2Bools_0_T_4 @[booth2_encoder.scala 25:30 36:22]
    node _output_X2_T = cat(X2Bools_1, X2Bools_0) @[booth2_encoder.scala 42:28]
    node invBools_1 = _invBools_1_T_1 @[booth2_encoder.scala 26:30 37:22]
    node invBools_0 = _invBools_0_T_1 @[booth2_encoder.scala 26:30 37:22]
    node _output_inv_T = cat(invBools_1, invBools_0) @[booth2_encoder.scala 43:29]
    node set0Bools_1 = _set0Bools_1_T_4 @[booth2_encoder.scala 27:30 38:22]
    node set0Bools_0 = _set0Bools_0_T_4 @[booth2_encoder.scala 27:30 38:22]
    node _output_set0_T = cat(set0Bools_1, set0Bools_0) @[booth2_encoder.scala 44:30]
    output_X2 <= _output_X2_T @[booth2_encoder.scala 42:17]
    output_inv <= _output_inv_T @[booth2_encoder.scala 43:17]
    output_set0 <= _output_set0_T @[booth2_encoder.scala 44:17]

  module ppGenerator :
    input clock : Clock
    input reset : UInt<1>
    input inputData_multiplicand : SInt<4>
    input inputCtrl_X2 : UInt<2>
    input inputCtrl_inv : UInt<2>
    input inputCtrl_Set0 : UInt<2>
    output outputData_pp_out_0 : SInt<8>
    output outputData_pp_out_1 : SInt<8>
    output outputData_sig_out : SInt<8>

    reg pp_0 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), pp_0) @[pp_generator.scala 36:29]
    reg pp_1 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), pp_1) @[pp_generator.scala 36:29]
    reg sign_com : SInt<8>, clock with :
      reset => (UInt<1>("h0"), sign_com) @[pp_generator.scala 37:29]
    node _pp_X2_0_T = bits(inputCtrl_X2, 0, 0) @[pp_generator.scala 40:38]
    node _pp_X2_0_T_1 = bits(_pp_X2_0_T, 0, 0) @[pp_generator.scala 40:42]
    node pp_X2_0_lo = asUInt(asSInt(UInt<1>("h0"))) @[Cat.scala 33:92]
    node pp_X2_0_hi = asUInt(inputData_multiplicand) @[Cat.scala 33:92]
    node _pp_X2_0_T_2 = cat(pp_X2_0_hi, pp_X2_0_lo) @[Cat.scala 33:92]
    node _pp_X2_0_T_3 = bits(inputData_multiplicand, 3, 3) @[pp_generator.scala 41:51]
    node pp_X2_0_lo_1 = asUInt(inputData_multiplicand) @[Cat.scala 33:92]
    node _pp_X2_0_T_4 = cat(_pp_X2_0_T_3, pp_X2_0_lo_1) @[Cat.scala 33:92]
    node _pp_X2_0_T_5 = mux(_pp_X2_0_T_1, _pp_X2_0_T_2, _pp_X2_0_T_4) @[pp_generator.scala 40:25]
    node _pp_X2_0_T_6 = asSInt(_pp_X2_0_T_5) @[pp_generator.scala 41:90]
    node _pp_set_0_T = bits(inputCtrl_Set0, 0, 0) @[pp_generator.scala 42:40]
    node _pp_set_0_T_1 = bits(_pp_set_0_T, 0, 0) @[pp_generator.scala 42:44]
    node pp_X2_0 = _pp_X2_0_T_6 @[pp_generator.scala 31:26 40:19]
    node _pp_set_0_T_2 = mux(_pp_set_0_T_1, asSInt(UInt<5>("h0")), pp_X2_0) @[pp_generator.scala 42:25]
    node _pp_inv_0_T = bits(inputCtrl_inv, 0, 0) @[pp_generator.scala 43:39]
    node _pp_inv_0_T_1 = bits(_pp_inv_0_T, 0, 0) @[pp_generator.scala 43:43]
    node pp_set_0 = _pp_set_0_T_2 @[pp_generator.scala 32:26 42:19]
    node _pp_inv_0_T_2 = not(pp_set_0) @[pp_generator.scala 43:51]
    node _pp_inv_0_T_3 = asSInt(_pp_inv_0_T_2) @[pp_generator.scala 43:51]
    node _pp_inv_0_T_4 = mux(_pp_inv_0_T_1, _pp_inv_0_T_3, pp_set_0) @[pp_generator.scala 43:25]
    node _E_inv_0_T = bits(inputCtrl_Set0, 0, 0) @[pp_generator.scala 44:40]
    node _E_inv_0_T_1 = bits(_E_inv_0_T, 0, 0) @[pp_generator.scala 44:44]
    node _E_inv_0_T_2 = bits(inputCtrl_inv, 0, 0) @[pp_generator.scala 44:65]
    node _E_inv_0_T_3 = bits(_E_inv_0_T_2, 0, 0) @[pp_generator.scala 44:69]
    node _E_inv_0_T_4 = bits(inputCtrl_inv, 0, 0) @[pp_generator.scala 44:91]
    node _E_inv_0_T_5 = bits(inputData_multiplicand, 3, 3) @[pp_generator.scala 44:117]
    node _E_inv_0_T_6 = xor(_E_inv_0_T_4, _E_inv_0_T_5) @[pp_generator.scala 44:94]
    node _E_inv_0_T_7 = bits(_E_inv_0_T_6, 0, 0) @[pp_generator.scala 44:131]
    node _E_inv_0_T_8 = mux(_E_inv_0_T_1, _E_inv_0_T_3, _E_inv_0_T_7) @[pp_generator.scala 44:25]
    node E_inv_0 = _E_inv_0_T_8 @[pp_generator.scala 29:26 44:19]
    node _E_0_T = not(E_inv_0) @[pp_generator.scala 45:22]
    node pp_inv_0 = _pp_inv_0_T_4 @[pp_generator.scala 33:26 43:19]
    node pp_temp_0_lo_lo = asUInt(pp_inv_0) @[Cat.scala 33:92]
    node pp_temp_0_lo = cat(E_inv_0, pp_temp_0_lo_lo) @[Cat.scala 33:92]
    node E_0 = _E_0_T @[pp_generator.scala 28:26 45:19]
    node pp_temp_0_hi = cat(E_0, E_inv_0) @[Cat.scala 33:92]
    node _pp_temp_0_T = cat(pp_temp_0_hi, pp_temp_0_lo) @[Cat.scala 33:92]
    node _pp_temp_0_T_1 = asSInt(_pp_temp_0_T) @[pp_generator.scala 49:86]
    node _pp_X2_1_T = bits(inputCtrl_X2, 1, 1) @[pp_generator.scala 40:38]
    node _pp_X2_1_T_1 = bits(_pp_X2_1_T, 0, 0) @[pp_generator.scala 40:42]
    node pp_X2_1_lo = asUInt(asSInt(UInt<1>("h0"))) @[Cat.scala 33:92]
    node pp_X2_1_hi = asUInt(inputData_multiplicand) @[Cat.scala 33:92]
    node _pp_X2_1_T_2 = cat(pp_X2_1_hi, pp_X2_1_lo) @[Cat.scala 33:92]
    node _pp_X2_1_T_3 = bits(inputData_multiplicand, 3, 3) @[pp_generator.scala 41:51]
    node pp_X2_1_lo_1 = asUInt(inputData_multiplicand) @[Cat.scala 33:92]
    node _pp_X2_1_T_4 = cat(_pp_X2_1_T_3, pp_X2_1_lo_1) @[Cat.scala 33:92]
    node _pp_X2_1_T_5 = mux(_pp_X2_1_T_1, _pp_X2_1_T_2, _pp_X2_1_T_4) @[pp_generator.scala 40:25]
    node _pp_X2_1_T_6 = asSInt(_pp_X2_1_T_5) @[pp_generator.scala 41:90]
    node _pp_set_1_T = bits(inputCtrl_Set0, 1, 1) @[pp_generator.scala 42:40]
    node _pp_set_1_T_1 = bits(_pp_set_1_T, 0, 0) @[pp_generator.scala 42:44]
    node pp_X2_1 = _pp_X2_1_T_6 @[pp_generator.scala 31:26 40:19]
    node _pp_set_1_T_2 = mux(_pp_set_1_T_1, asSInt(UInt<5>("h0")), pp_X2_1) @[pp_generator.scala 42:25]
    node _pp_inv_1_T = bits(inputCtrl_inv, 1, 1) @[pp_generator.scala 43:39]
    node _pp_inv_1_T_1 = bits(_pp_inv_1_T, 0, 0) @[pp_generator.scala 43:43]
    node pp_set_1 = _pp_set_1_T_2 @[pp_generator.scala 32:26 42:19]
    node _pp_inv_1_T_2 = not(pp_set_1) @[pp_generator.scala 43:51]
    node _pp_inv_1_T_3 = asSInt(_pp_inv_1_T_2) @[pp_generator.scala 43:51]
    node _pp_inv_1_T_4 = mux(_pp_inv_1_T_1, _pp_inv_1_T_3, pp_set_1) @[pp_generator.scala 43:25]
    node _E_inv_1_T = bits(inputCtrl_Set0, 1, 1) @[pp_generator.scala 44:40]
    node _E_inv_1_T_1 = bits(_E_inv_1_T, 0, 0) @[pp_generator.scala 44:44]
    node _E_inv_1_T_2 = bits(inputCtrl_inv, 1, 1) @[pp_generator.scala 44:65]
    node _E_inv_1_T_3 = bits(_E_inv_1_T_2, 0, 0) @[pp_generator.scala 44:69]
    node _E_inv_1_T_4 = bits(inputCtrl_inv, 1, 1) @[pp_generator.scala 44:91]
    node _E_inv_1_T_5 = bits(inputData_multiplicand, 3, 3) @[pp_generator.scala 44:117]
    node _E_inv_1_T_6 = xor(_E_inv_1_T_4, _E_inv_1_T_5) @[pp_generator.scala 44:94]
    node _E_inv_1_T_7 = bits(_E_inv_1_T_6, 0, 0) @[pp_generator.scala 44:131]
    node _E_inv_1_T_8 = mux(_E_inv_1_T_1, _E_inv_1_T_3, _E_inv_1_T_7) @[pp_generator.scala 44:25]
    node E_inv_1 = _E_inv_1_T_8 @[pp_generator.scala 29:26 44:19]
    node _E_1_T = not(E_inv_1) @[pp_generator.scala 45:22]
    node pp_inv_1 = _pp_inv_1_T_4 @[pp_generator.scala 33:26 43:19]
    node pp_temp_1_lo_lo = asUInt(pp_inv_1) @[Cat.scala 33:92]
    node E_1 = _E_1_T @[pp_generator.scala 28:26 45:19]
    node pp_temp_1_lo = cat(E_1, pp_temp_1_lo_lo) @[Cat.scala 33:92]
    node pp_temp_1_hi = cat(UInt<1>("h0"), UInt<1>("h1")) @[Cat.scala 33:92]
    node _pp_temp_1_T = cat(pp_temp_1_hi, pp_temp_1_lo) @[Cat.scala 33:92]
    node _pp_temp_1_T_1 = asSInt(_pp_temp_1_T) @[pp_generator.scala 55:94]
    node pp_temp_1 = _pp_temp_1_T_1 @[pp_generator.scala 34:26 55:24]
    node _pp_1_T = bits(pp_temp_1, 5, 0) @[pp_generator.scala 63:36]
    node _pp_1_T_1 = bits(inputCtrl_inv, 0, 0) @[pp_generator.scala 63:78]
    node pp_1_hi = cat(_pp_1_T, UInt<1>("h0")) @[Cat.scala 33:92]
    node _pp_1_T_2 = cat(pp_1_hi, _pp_1_T_1) @[Cat.scala 33:92]
    node _pp_1_T_3 = asSInt(_pp_1_T_2) @[pp_generator.scala 63:85]
    node _sign_com_T = bits(inputCtrl_inv, 1, 1) @[pp_generator.scala 68:54]
    node sign_com_hi = cat(UInt<1>("h0"), _sign_com_T) @[Cat.scala 33:92]
    node _sign_com_T_1 = cat(sign_com_hi, UInt<2>("h0")) @[Cat.scala 33:92]
    node _sign_com_T_2 = asSInt(_sign_com_T_1) @[pp_generator.scala 68:97]
    node pp_temp_0 = _pp_temp_0_T_1 @[pp_generator.scala 34:26 49:28]
    node _pp_WIRE_0 = asSInt(UInt<8>("h0")) @[pp_generator.scala 36:{37,37}]
    node _pp_WIRE_1 = asSInt(UInt<8>("h0")) @[pp_generator.scala 36:{37,37}]
    outputData_pp_out_0 <= pp_0 @[pp_generator.scala 70:25]
    outputData_pp_out_1 <= pp_1 @[pp_generator.scala 70:25]
    outputData_sig_out <= sign_com @[pp_generator.scala 71:25]
    pp_0 <= mux(reset, _pp_WIRE_0, pp_temp_0) @[pp_generator.scala 36:{29,29} 61:19]
    pp_1 <= mux(reset, _pp_WIRE_1, _pp_1_T_3) @[pp_generator.scala 36:{29,29} 63:19]
    sign_com <= mux(reset, asSInt(UInt<8>("h0")), _sign_com_T_2) @[pp_generator.scala 37:{29,29} 68:14]

  module RCA :
    input clock : Clock
    input reset : UInt<1>
    input input_a_in : SInt<8>
    input input_b_in : SInt<8>
    input input_c_in : SInt<1>
    output output_S : SInt<8>
    output output_C : SInt<8>

    node _c_comb_0_T = bits(input_c_in, 0, 0) @[rca.scala 27:29]
    node _g_comb_0_T = bits(input_a_in, 0, 0) @[rca.scala 30:35]
    node _g_comb_0_T_1 = bits(input_b_in, 0, 0) @[rca.scala 30:51]
    node _g_comb_0_T_2 = and(_g_comb_0_T, _g_comb_0_T_1) @[rca.scala 30:39]
    node _g_comb_0_T_3 = bits(_g_comb_0_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_0_T = bits(input_a_in, 0, 0) @[rca.scala 31:35]
    node _p_comb_0_T_1 = bits(input_b_in, 0, 0) @[rca.scala 31:51]
    node _p_comb_0_T_2 = xor(_p_comb_0_T, _p_comb_0_T_1) @[rca.scala 31:39]
    node _p_comb_0_T_3 = bits(_p_comb_0_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_0 = _p_comb_0_T_3 @[rca.scala 23:22 31:21]
    node c_comb_0 = _c_comb_0_T @[rca.scala 25:22 27:15]
    node _s_comb_0_T = xor(p_comb_0, c_comb_0) @[rca.scala 32:34]
    node _c_comb_1_T = and(c_comb_0, p_comb_0) @[rca.scala 33:34]
    node g_comb_0 = _g_comb_0_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_1_T_1 = or(_c_comb_1_T, g_comb_0) @[rca.scala 33:46]
    node _g_comb_1_T = bits(input_a_in, 1, 1) @[rca.scala 30:35]
    node _g_comb_1_T_1 = bits(input_b_in, 1, 1) @[rca.scala 30:51]
    node _g_comb_1_T_2 = and(_g_comb_1_T, _g_comb_1_T_1) @[rca.scala 30:39]
    node _g_comb_1_T_3 = bits(_g_comb_1_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_1_T = bits(input_a_in, 1, 1) @[rca.scala 31:35]
    node _p_comb_1_T_1 = bits(input_b_in, 1, 1) @[rca.scala 31:51]
    node _p_comb_1_T_2 = xor(_p_comb_1_T, _p_comb_1_T_1) @[rca.scala 31:39]
    node _p_comb_1_T_3 = bits(_p_comb_1_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_1 = _p_comb_1_T_3 @[rca.scala 23:22 31:21]
    node c_comb_1 = _c_comb_1_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_1_T = xor(p_comb_1, c_comb_1) @[rca.scala 32:34]
    node _c_comb_2_T = and(c_comb_1, p_comb_1) @[rca.scala 33:34]
    node g_comb_1 = _g_comb_1_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_2_T_1 = or(_c_comb_2_T, g_comb_1) @[rca.scala 33:46]
    node _g_comb_2_T = bits(input_a_in, 2, 2) @[rca.scala 30:35]
    node _g_comb_2_T_1 = bits(input_b_in, 2, 2) @[rca.scala 30:51]
    node _g_comb_2_T_2 = and(_g_comb_2_T, _g_comb_2_T_1) @[rca.scala 30:39]
    node _g_comb_2_T_3 = bits(_g_comb_2_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_2_T = bits(input_a_in, 2, 2) @[rca.scala 31:35]
    node _p_comb_2_T_1 = bits(input_b_in, 2, 2) @[rca.scala 31:51]
    node _p_comb_2_T_2 = xor(_p_comb_2_T, _p_comb_2_T_1) @[rca.scala 31:39]
    node _p_comb_2_T_3 = bits(_p_comb_2_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_2 = _p_comb_2_T_3 @[rca.scala 23:22 31:21]
    node c_comb_2 = _c_comb_2_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_2_T = xor(p_comb_2, c_comb_2) @[rca.scala 32:34]
    node _c_comb_3_T = and(c_comb_2, p_comb_2) @[rca.scala 33:34]
    node g_comb_2 = _g_comb_2_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_3_T_1 = or(_c_comb_3_T, g_comb_2) @[rca.scala 33:46]
    node _g_comb_3_T = bits(input_a_in, 3, 3) @[rca.scala 30:35]
    node _g_comb_3_T_1 = bits(input_b_in, 3, 3) @[rca.scala 30:51]
    node _g_comb_3_T_2 = and(_g_comb_3_T, _g_comb_3_T_1) @[rca.scala 30:39]
    node _g_comb_3_T_3 = bits(_g_comb_3_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_3_T = bits(input_a_in, 3, 3) @[rca.scala 31:35]
    node _p_comb_3_T_1 = bits(input_b_in, 3, 3) @[rca.scala 31:51]
    node _p_comb_3_T_2 = xor(_p_comb_3_T, _p_comb_3_T_1) @[rca.scala 31:39]
    node _p_comb_3_T_3 = bits(_p_comb_3_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_3 = _p_comb_3_T_3 @[rca.scala 23:22 31:21]
    node c_comb_3 = _c_comb_3_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_3_T = xor(p_comb_3, c_comb_3) @[rca.scala 32:34]
    node _c_comb_4_T = and(c_comb_3, p_comb_3) @[rca.scala 33:34]
    node g_comb_3 = _g_comb_3_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_4_T_1 = or(_c_comb_4_T, g_comb_3) @[rca.scala 33:46]
    node _g_comb_4_T = bits(input_a_in, 4, 4) @[rca.scala 30:35]
    node _g_comb_4_T_1 = bits(input_b_in, 4, 4) @[rca.scala 30:51]
    node _g_comb_4_T_2 = and(_g_comb_4_T, _g_comb_4_T_1) @[rca.scala 30:39]
    node _g_comb_4_T_3 = bits(_g_comb_4_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_4_T = bits(input_a_in, 4, 4) @[rca.scala 31:35]
    node _p_comb_4_T_1 = bits(input_b_in, 4, 4) @[rca.scala 31:51]
    node _p_comb_4_T_2 = xor(_p_comb_4_T, _p_comb_4_T_1) @[rca.scala 31:39]
    node _p_comb_4_T_3 = bits(_p_comb_4_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_4 = _p_comb_4_T_3 @[rca.scala 23:22 31:21]
    node c_comb_4 = _c_comb_4_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_4_T = xor(p_comb_4, c_comb_4) @[rca.scala 32:34]
    node _c_comb_5_T = and(c_comb_4, p_comb_4) @[rca.scala 33:34]
    node g_comb_4 = _g_comb_4_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_5_T_1 = or(_c_comb_5_T, g_comb_4) @[rca.scala 33:46]
    node _g_comb_5_T = bits(input_a_in, 5, 5) @[rca.scala 30:35]
    node _g_comb_5_T_1 = bits(input_b_in, 5, 5) @[rca.scala 30:51]
    node _g_comb_5_T_2 = and(_g_comb_5_T, _g_comb_5_T_1) @[rca.scala 30:39]
    node _g_comb_5_T_3 = bits(_g_comb_5_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_5_T = bits(input_a_in, 5, 5) @[rca.scala 31:35]
    node _p_comb_5_T_1 = bits(input_b_in, 5, 5) @[rca.scala 31:51]
    node _p_comb_5_T_2 = xor(_p_comb_5_T, _p_comb_5_T_1) @[rca.scala 31:39]
    node _p_comb_5_T_3 = bits(_p_comb_5_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_5 = _p_comb_5_T_3 @[rca.scala 23:22 31:21]
    node c_comb_5 = _c_comb_5_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_5_T = xor(p_comb_5, c_comb_5) @[rca.scala 32:34]
    node _c_comb_6_T = and(c_comb_5, p_comb_5) @[rca.scala 33:34]
    node g_comb_5 = _g_comb_5_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_6_T_1 = or(_c_comb_6_T, g_comb_5) @[rca.scala 33:46]
    node _g_comb_6_T = bits(input_a_in, 6, 6) @[rca.scala 30:35]
    node _g_comb_6_T_1 = bits(input_b_in, 6, 6) @[rca.scala 30:51]
    node _g_comb_6_T_2 = and(_g_comb_6_T, _g_comb_6_T_1) @[rca.scala 30:39]
    node _g_comb_6_T_3 = bits(_g_comb_6_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_6_T = bits(input_a_in, 6, 6) @[rca.scala 31:35]
    node _p_comb_6_T_1 = bits(input_b_in, 6, 6) @[rca.scala 31:51]
    node _p_comb_6_T_2 = xor(_p_comb_6_T, _p_comb_6_T_1) @[rca.scala 31:39]
    node _p_comb_6_T_3 = bits(_p_comb_6_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_6 = _p_comb_6_T_3 @[rca.scala 23:22 31:21]
    node c_comb_6 = _c_comb_6_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_6_T = xor(p_comb_6, c_comb_6) @[rca.scala 32:34]
    node _c_comb_7_T = and(c_comb_6, p_comb_6) @[rca.scala 33:34]
    node g_comb_6 = _g_comb_6_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_7_T_1 = or(_c_comb_7_T, g_comb_6) @[rca.scala 33:46]
    node _g_comb_7_T = bits(input_a_in, 7, 7) @[rca.scala 30:35]
    node _g_comb_7_T_1 = bits(input_b_in, 7, 7) @[rca.scala 30:51]
    node _g_comb_7_T_2 = and(_g_comb_7_T, _g_comb_7_T_1) @[rca.scala 30:39]
    node _g_comb_7_T_3 = bits(_g_comb_7_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_7_T = bits(input_a_in, 7, 7) @[rca.scala 31:35]
    node _p_comb_7_T_1 = bits(input_b_in, 7, 7) @[rca.scala 31:51]
    node _p_comb_7_T_2 = xor(_p_comb_7_T, _p_comb_7_T_1) @[rca.scala 31:39]
    node _p_comb_7_T_3 = bits(_p_comb_7_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_7 = _p_comb_7_T_3 @[rca.scala 23:22 31:21]
    node c_comb_7 = _c_comb_7_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_7_T = xor(p_comb_7, c_comb_7) @[rca.scala 32:34]
    node _c_comb_8_T = and(c_comb_7, p_comb_7) @[rca.scala 33:34]
    node g_comb_7 = _g_comb_7_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_8_T_1 = or(_c_comb_8_T, g_comb_7) @[rca.scala 33:46]
    node s_comb_1 = _s_comb_1_T @[rca.scala 24:22 32:21]
    node s_comb_0 = _s_comb_0_T @[rca.scala 24:22 32:21]
    node output_S_lo_lo = cat(s_comb_1, s_comb_0) @[rca.scala 36:24]
    node s_comb_3 = _s_comb_3_T @[rca.scala 24:22 32:21]
    node s_comb_2 = _s_comb_2_T @[rca.scala 24:22 32:21]
    node output_S_lo_hi = cat(s_comb_3, s_comb_2) @[rca.scala 36:24]
    node output_S_lo = cat(output_S_lo_hi, output_S_lo_lo) @[rca.scala 36:24]
    node s_comb_5 = _s_comb_5_T @[rca.scala 24:22 32:21]
    node s_comb_4 = _s_comb_4_T @[rca.scala 24:22 32:21]
    node output_S_hi_lo = cat(s_comb_5, s_comb_4) @[rca.scala 36:24]
    node s_comb_7 = _s_comb_7_T @[rca.scala 24:22 32:21]
    node s_comb_6 = _s_comb_6_T @[rca.scala 24:22 32:21]
    node output_S_hi_hi = cat(s_comb_7, s_comb_6) @[rca.scala 36:24]
    node output_S_hi = cat(output_S_hi_hi, output_S_hi_lo) @[rca.scala 36:24]
    node _output_S_T = cat(output_S_hi, output_S_lo) @[rca.scala 36:24]
    node _output_S_T_1 = asSInt(_output_S_T) @[rca.scala 36:31]
    node c_comb_8 = _c_comb_8_T_1 @[rca.scala 25:22 33:21]
    node _output_C_T = asSInt(c_comb_8) @[rca.scala 37:40]
    output_S <= _output_S_T_1 @[rca.scala 36:14]
    output_C <= pad(_output_C_T, 8) @[rca.scala 37:14]

  module pp_compressor3_2 :
    input clock : Clock
    input reset : UInt<1>
    input input_pp0_in : SInt<8>
    input input_pp1_in : SInt<8>
    input input_pp2_in : SInt<8>
    output output_S : SInt<8>
    output output_C : SInt<8>

    node _g_comb_0_T = bits(input_pp0_in, 0, 0) @[pp_compressor3_2.scala 28:35]
    node _g_comb_0_T_1 = bits(input_pp1_in, 0, 0) @[pp_compressor3_2.scala 28:53]
    node _g_comb_0_T_2 = and(_g_comb_0_T, _g_comb_0_T_1) @[pp_compressor3_2.scala 28:39]
    node _g_comb_0_T_3 = bits(_g_comb_0_T_2, 0, 0) @[pp_compressor3_2.scala 28:58]
    node _p_comb_0_T = bits(input_pp0_in, 0, 0) @[pp_compressor3_2.scala 29:35]
    node _p_comb_0_T_1 = bits(input_pp1_in, 0, 0) @[pp_compressor3_2.scala 29:53]
    node _p_comb_0_T_2 = xor(_p_comb_0_T, _p_comb_0_T_1) @[pp_compressor3_2.scala 29:39]
    node _p_comb_0_T_3 = bits(_p_comb_0_T_2, 0, 0) @[pp_compressor3_2.scala 29:58]
    node _s_comb_0_T = bits(input_pp2_in, 0, 0) @[pp_compressor3_2.scala 30:46]
    node _s_comb_0_T_1 = bits(_s_comb_0_T, 0, 0) @[pp_compressor3_2.scala 30:50]
    node p_comb_0 = _p_comb_0_T_3 @[pp_compressor3_2.scala 23:22 29:19]
    node _s_comb_0_T_2 = xor(p_comb_0, _s_comb_0_T_1) @[pp_compressor3_2.scala 30:32]
    node _c_comb_0_T = bits(input_pp2_in, 0, 0) @[pp_compressor3_2.scala 31:34]
    node _c_comb_0_T_1 = bits(_c_comb_0_T, 0, 0) @[pp_compressor3_2.scala 31:38]
    node _c_comb_0_T_2 = and(_c_comb_0_T_1, p_comb_0) @[pp_compressor3_2.scala 31:45]
    node g_comb_0 = _g_comb_0_T_3 @[pp_compressor3_2.scala 22:22 28:19]
    node _c_comb_0_T_3 = or(_c_comb_0_T_2, g_comb_0) @[pp_compressor3_2.scala 31:57]
    node _g_comb_1_T = bits(input_pp0_in, 1, 1) @[pp_compressor3_2.scala 28:35]
    node _g_comb_1_T_1 = bits(input_pp1_in, 1, 1) @[pp_compressor3_2.scala 28:53]
    node _g_comb_1_T_2 = and(_g_comb_1_T, _g_comb_1_T_1) @[pp_compressor3_2.scala 28:39]
    node _g_comb_1_T_3 = bits(_g_comb_1_T_2, 0, 0) @[pp_compressor3_2.scala 28:58]
    node _p_comb_1_T = bits(input_pp0_in, 1, 1) @[pp_compressor3_2.scala 29:35]
    node _p_comb_1_T_1 = bits(input_pp1_in, 1, 1) @[pp_compressor3_2.scala 29:53]
    node _p_comb_1_T_2 = xor(_p_comb_1_T, _p_comb_1_T_1) @[pp_compressor3_2.scala 29:39]
    node _p_comb_1_T_3 = bits(_p_comb_1_T_2, 0, 0) @[pp_compressor3_2.scala 29:58]
    node _s_comb_1_T = bits(input_pp2_in, 1, 1) @[pp_compressor3_2.scala 30:46]
    node _s_comb_1_T_1 = bits(_s_comb_1_T, 0, 0) @[pp_compressor3_2.scala 30:50]
    node p_comb_1 = _p_comb_1_T_3 @[pp_compressor3_2.scala 23:22 29:19]
    node _s_comb_1_T_2 = xor(p_comb_1, _s_comb_1_T_1) @[pp_compressor3_2.scala 30:32]
    node _c_comb_1_T = bits(input_pp2_in, 1, 1) @[pp_compressor3_2.scala 31:34]
    node _c_comb_1_T_1 = bits(_c_comb_1_T, 0, 0) @[pp_compressor3_2.scala 31:38]
    node _c_comb_1_T_2 = and(_c_comb_1_T_1, p_comb_1) @[pp_compressor3_2.scala 31:45]
    node g_comb_1 = _g_comb_1_T_3 @[pp_compressor3_2.scala 22:22 28:19]
    node _c_comb_1_T_3 = or(_c_comb_1_T_2, g_comb_1) @[pp_compressor3_2.scala 31:57]
    node _g_comb_2_T = bits(input_pp0_in, 2, 2) @[pp_compressor3_2.scala 28:35]
    node _g_comb_2_T_1 = bits(input_pp1_in, 2, 2) @[pp_compressor3_2.scala 28:53]
    node _g_comb_2_T_2 = and(_g_comb_2_T, _g_comb_2_T_1) @[pp_compressor3_2.scala 28:39]
    node _g_comb_2_T_3 = bits(_g_comb_2_T_2, 0, 0) @[pp_compressor3_2.scala 28:58]
    node _p_comb_2_T = bits(input_pp0_in, 2, 2) @[pp_compressor3_2.scala 29:35]
    node _p_comb_2_T_1 = bits(input_pp1_in, 2, 2) @[pp_compressor3_2.scala 29:53]
    node _p_comb_2_T_2 = xor(_p_comb_2_T, _p_comb_2_T_1) @[pp_compressor3_2.scala 29:39]
    node _p_comb_2_T_3 = bits(_p_comb_2_T_2, 0, 0) @[pp_compressor3_2.scala 29:58]
    node _s_comb_2_T = bits(input_pp2_in, 2, 2) @[pp_compressor3_2.scala 30:46]
    node _s_comb_2_T_1 = bits(_s_comb_2_T, 0, 0) @[pp_compressor3_2.scala 30:50]
    node p_comb_2 = _p_comb_2_T_3 @[pp_compressor3_2.scala 23:22 29:19]
    node _s_comb_2_T_2 = xor(p_comb_2, _s_comb_2_T_1) @[pp_compressor3_2.scala 30:32]
    node _c_comb_2_T = bits(input_pp2_in, 2, 2) @[pp_compressor3_2.scala 31:34]
    node _c_comb_2_T_1 = bits(_c_comb_2_T, 0, 0) @[pp_compressor3_2.scala 31:38]
    node _c_comb_2_T_2 = and(_c_comb_2_T_1, p_comb_2) @[pp_compressor3_2.scala 31:45]
    node g_comb_2 = _g_comb_2_T_3 @[pp_compressor3_2.scala 22:22 28:19]
    node _c_comb_2_T_3 = or(_c_comb_2_T_2, g_comb_2) @[pp_compressor3_2.scala 31:57]
    node _g_comb_3_T = bits(input_pp0_in, 3, 3) @[pp_compressor3_2.scala 28:35]
    node _g_comb_3_T_1 = bits(input_pp1_in, 3, 3) @[pp_compressor3_2.scala 28:53]
    node _g_comb_3_T_2 = and(_g_comb_3_T, _g_comb_3_T_1) @[pp_compressor3_2.scala 28:39]
    node _g_comb_3_T_3 = bits(_g_comb_3_T_2, 0, 0) @[pp_compressor3_2.scala 28:58]
    node _p_comb_3_T = bits(input_pp0_in, 3, 3) @[pp_compressor3_2.scala 29:35]
    node _p_comb_3_T_1 = bits(input_pp1_in, 3, 3) @[pp_compressor3_2.scala 29:53]
    node _p_comb_3_T_2 = xor(_p_comb_3_T, _p_comb_3_T_1) @[pp_compressor3_2.scala 29:39]
    node _p_comb_3_T_3 = bits(_p_comb_3_T_2, 0, 0) @[pp_compressor3_2.scala 29:58]
    node _s_comb_3_T = bits(input_pp2_in, 3, 3) @[pp_compressor3_2.scala 30:46]
    node _s_comb_3_T_1 = bits(_s_comb_3_T, 0, 0) @[pp_compressor3_2.scala 30:50]
    node p_comb_3 = _p_comb_3_T_3 @[pp_compressor3_2.scala 23:22 29:19]
    node _s_comb_3_T_2 = xor(p_comb_3, _s_comb_3_T_1) @[pp_compressor3_2.scala 30:32]
    node _c_comb_3_T = bits(input_pp2_in, 3, 3) @[pp_compressor3_2.scala 31:34]
    node _c_comb_3_T_1 = bits(_c_comb_3_T, 0, 0) @[pp_compressor3_2.scala 31:38]
    node _c_comb_3_T_2 = and(_c_comb_3_T_1, p_comb_3) @[pp_compressor3_2.scala 31:45]
    node g_comb_3 = _g_comb_3_T_3 @[pp_compressor3_2.scala 22:22 28:19]
    node _c_comb_3_T_3 = or(_c_comb_3_T_2, g_comb_3) @[pp_compressor3_2.scala 31:57]
    node _g_comb_4_T = bits(input_pp0_in, 4, 4) @[pp_compressor3_2.scala 28:35]
    node _g_comb_4_T_1 = bits(input_pp1_in, 4, 4) @[pp_compressor3_2.scala 28:53]
    node _g_comb_4_T_2 = and(_g_comb_4_T, _g_comb_4_T_1) @[pp_compressor3_2.scala 28:39]
    node _g_comb_4_T_3 = bits(_g_comb_4_T_2, 0, 0) @[pp_compressor3_2.scala 28:58]
    node _p_comb_4_T = bits(input_pp0_in, 4, 4) @[pp_compressor3_2.scala 29:35]
    node _p_comb_4_T_1 = bits(input_pp1_in, 4, 4) @[pp_compressor3_2.scala 29:53]
    node _p_comb_4_T_2 = xor(_p_comb_4_T, _p_comb_4_T_1) @[pp_compressor3_2.scala 29:39]
    node _p_comb_4_T_3 = bits(_p_comb_4_T_2, 0, 0) @[pp_compressor3_2.scala 29:58]
    node _s_comb_4_T = bits(input_pp2_in, 4, 4) @[pp_compressor3_2.scala 30:46]
    node _s_comb_4_T_1 = bits(_s_comb_4_T, 0, 0) @[pp_compressor3_2.scala 30:50]
    node p_comb_4 = _p_comb_4_T_3 @[pp_compressor3_2.scala 23:22 29:19]
    node _s_comb_4_T_2 = xor(p_comb_4, _s_comb_4_T_1) @[pp_compressor3_2.scala 30:32]
    node _c_comb_4_T = bits(input_pp2_in, 4, 4) @[pp_compressor3_2.scala 31:34]
    node _c_comb_4_T_1 = bits(_c_comb_4_T, 0, 0) @[pp_compressor3_2.scala 31:38]
    node _c_comb_4_T_2 = and(_c_comb_4_T_1, p_comb_4) @[pp_compressor3_2.scala 31:45]
    node g_comb_4 = _g_comb_4_T_3 @[pp_compressor3_2.scala 22:22 28:19]
    node _c_comb_4_T_3 = or(_c_comb_4_T_2, g_comb_4) @[pp_compressor3_2.scala 31:57]
    node _g_comb_5_T = bits(input_pp0_in, 5, 5) @[pp_compressor3_2.scala 28:35]
    node _g_comb_5_T_1 = bits(input_pp1_in, 5, 5) @[pp_compressor3_2.scala 28:53]
    node _g_comb_5_T_2 = and(_g_comb_5_T, _g_comb_5_T_1) @[pp_compressor3_2.scala 28:39]
    node _g_comb_5_T_3 = bits(_g_comb_5_T_2, 0, 0) @[pp_compressor3_2.scala 28:58]
    node _p_comb_5_T = bits(input_pp0_in, 5, 5) @[pp_compressor3_2.scala 29:35]
    node _p_comb_5_T_1 = bits(input_pp1_in, 5, 5) @[pp_compressor3_2.scala 29:53]
    node _p_comb_5_T_2 = xor(_p_comb_5_T, _p_comb_5_T_1) @[pp_compressor3_2.scala 29:39]
    node _p_comb_5_T_3 = bits(_p_comb_5_T_2, 0, 0) @[pp_compressor3_2.scala 29:58]
    node _s_comb_5_T = bits(input_pp2_in, 5, 5) @[pp_compressor3_2.scala 30:46]
    node _s_comb_5_T_1 = bits(_s_comb_5_T, 0, 0) @[pp_compressor3_2.scala 30:50]
    node p_comb_5 = _p_comb_5_T_3 @[pp_compressor3_2.scala 23:22 29:19]
    node _s_comb_5_T_2 = xor(p_comb_5, _s_comb_5_T_1) @[pp_compressor3_2.scala 30:32]
    node _c_comb_5_T = bits(input_pp2_in, 5, 5) @[pp_compressor3_2.scala 31:34]
    node _c_comb_5_T_1 = bits(_c_comb_5_T, 0, 0) @[pp_compressor3_2.scala 31:38]
    node _c_comb_5_T_2 = and(_c_comb_5_T_1, p_comb_5) @[pp_compressor3_2.scala 31:45]
    node g_comb_5 = _g_comb_5_T_3 @[pp_compressor3_2.scala 22:22 28:19]
    node _c_comb_5_T_3 = or(_c_comb_5_T_2, g_comb_5) @[pp_compressor3_2.scala 31:57]
    node _g_comb_6_T = bits(input_pp0_in, 6, 6) @[pp_compressor3_2.scala 28:35]
    node _g_comb_6_T_1 = bits(input_pp1_in, 6, 6) @[pp_compressor3_2.scala 28:53]
    node _g_comb_6_T_2 = and(_g_comb_6_T, _g_comb_6_T_1) @[pp_compressor3_2.scala 28:39]
    node _g_comb_6_T_3 = bits(_g_comb_6_T_2, 0, 0) @[pp_compressor3_2.scala 28:58]
    node _p_comb_6_T = bits(input_pp0_in, 6, 6) @[pp_compressor3_2.scala 29:35]
    node _p_comb_6_T_1 = bits(input_pp1_in, 6, 6) @[pp_compressor3_2.scala 29:53]
    node _p_comb_6_T_2 = xor(_p_comb_6_T, _p_comb_6_T_1) @[pp_compressor3_2.scala 29:39]
    node _p_comb_6_T_3 = bits(_p_comb_6_T_2, 0, 0) @[pp_compressor3_2.scala 29:58]
    node _s_comb_6_T = bits(input_pp2_in, 6, 6) @[pp_compressor3_2.scala 30:46]
    node _s_comb_6_T_1 = bits(_s_comb_6_T, 0, 0) @[pp_compressor3_2.scala 30:50]
    node p_comb_6 = _p_comb_6_T_3 @[pp_compressor3_2.scala 23:22 29:19]
    node _s_comb_6_T_2 = xor(p_comb_6, _s_comb_6_T_1) @[pp_compressor3_2.scala 30:32]
    node _c_comb_6_T = bits(input_pp2_in, 6, 6) @[pp_compressor3_2.scala 31:34]
    node _c_comb_6_T_1 = bits(_c_comb_6_T, 0, 0) @[pp_compressor3_2.scala 31:38]
    node _c_comb_6_T_2 = and(_c_comb_6_T_1, p_comb_6) @[pp_compressor3_2.scala 31:45]
    node g_comb_6 = _g_comb_6_T_3 @[pp_compressor3_2.scala 22:22 28:19]
    node _c_comb_6_T_3 = or(_c_comb_6_T_2, g_comb_6) @[pp_compressor3_2.scala 31:57]
    node _g_comb_7_T = bits(input_pp0_in, 7, 7) @[pp_compressor3_2.scala 28:35]
    node _g_comb_7_T_1 = bits(input_pp1_in, 7, 7) @[pp_compressor3_2.scala 28:53]
    node _g_comb_7_T_2 = and(_g_comb_7_T, _g_comb_7_T_1) @[pp_compressor3_2.scala 28:39]
    node _g_comb_7_T_3 = bits(_g_comb_7_T_2, 0, 0) @[pp_compressor3_2.scala 28:58]
    node _p_comb_7_T = bits(input_pp0_in, 7, 7) @[pp_compressor3_2.scala 29:35]
    node _p_comb_7_T_1 = bits(input_pp1_in, 7, 7) @[pp_compressor3_2.scala 29:53]
    node _p_comb_7_T_2 = xor(_p_comb_7_T, _p_comb_7_T_1) @[pp_compressor3_2.scala 29:39]
    node _p_comb_7_T_3 = bits(_p_comb_7_T_2, 0, 0) @[pp_compressor3_2.scala 29:58]
    node _s_comb_7_T = bits(input_pp2_in, 7, 7) @[pp_compressor3_2.scala 30:46]
    node _s_comb_7_T_1 = bits(_s_comb_7_T, 0, 0) @[pp_compressor3_2.scala 30:50]
    node p_comb_7 = _p_comb_7_T_3 @[pp_compressor3_2.scala 23:22 29:19]
    node _s_comb_7_T_2 = xor(p_comb_7, _s_comb_7_T_1) @[pp_compressor3_2.scala 30:32]
    node _c_comb_7_T = bits(input_pp2_in, 7, 7) @[pp_compressor3_2.scala 31:34]
    node _c_comb_7_T_1 = bits(_c_comb_7_T, 0, 0) @[pp_compressor3_2.scala 31:38]
    node _c_comb_7_T_2 = and(_c_comb_7_T_1, p_comb_7) @[pp_compressor3_2.scala 31:45]
    node g_comb_7 = _g_comb_7_T_3 @[pp_compressor3_2.scala 22:22 28:19]
    node _c_comb_7_T_3 = or(_c_comb_7_T_2, g_comb_7) @[pp_compressor3_2.scala 31:57]
    node s_comb_1 = _s_comb_1_T_2 @[pp_compressor3_2.scala 24:22 30:19]
    node s_comb_0 = _s_comb_0_T_2 @[pp_compressor3_2.scala 24:22 30:19]
    node output_S_lo_lo = cat(s_comb_1, s_comb_0) @[pp_compressor3_2.scala 34:24]
    node s_comb_3 = _s_comb_3_T_2 @[pp_compressor3_2.scala 24:22 30:19]
    node s_comb_2 = _s_comb_2_T_2 @[pp_compressor3_2.scala 24:22 30:19]
    node output_S_lo_hi = cat(s_comb_3, s_comb_2) @[pp_compressor3_2.scala 34:24]
    node output_S_lo = cat(output_S_lo_hi, output_S_lo_lo) @[pp_compressor3_2.scala 34:24]
    node s_comb_5 = _s_comb_5_T_2 @[pp_compressor3_2.scala 24:22 30:19]
    node s_comb_4 = _s_comb_4_T_2 @[pp_compressor3_2.scala 24:22 30:19]
    node output_S_hi_lo = cat(s_comb_5, s_comb_4) @[pp_compressor3_2.scala 34:24]
    node s_comb_7 = _s_comb_7_T_2 @[pp_compressor3_2.scala 24:22 30:19]
    node s_comb_6 = _s_comb_6_T_2 @[pp_compressor3_2.scala 24:22 30:19]
    node output_S_hi_hi = cat(s_comb_7, s_comb_6) @[pp_compressor3_2.scala 34:24]
    node output_S_hi = cat(output_S_hi_hi, output_S_hi_lo) @[pp_compressor3_2.scala 34:24]
    node _output_S_T = cat(output_S_hi, output_S_lo) @[pp_compressor3_2.scala 34:24]
    node _output_S_T_1 = asSInt(_output_S_T) @[pp_compressor3_2.scala 34:31]
    node c_comb_1 = _c_comb_1_T_3 @[pp_compressor3_2.scala 25:22 31:19]
    node c_comb_0 = _c_comb_0_T_3 @[pp_compressor3_2.scala 25:22 31:19]
    node output_C_lo_lo = cat(c_comb_1, c_comb_0) @[pp_compressor3_2.scala 35:29]
    node c_comb_3 = _c_comb_3_T_3 @[pp_compressor3_2.scala 25:22 31:19]
    node c_comb_2 = _c_comb_2_T_3 @[pp_compressor3_2.scala 25:22 31:19]
    node output_C_lo_hi = cat(c_comb_3, c_comb_2) @[pp_compressor3_2.scala 35:29]
    node output_C_lo = cat(output_C_lo_hi, output_C_lo_lo) @[pp_compressor3_2.scala 35:29]
    node c_comb_5 = _c_comb_5_T_3 @[pp_compressor3_2.scala 25:22 31:19]
    node c_comb_4 = _c_comb_4_T_3 @[pp_compressor3_2.scala 25:22 31:19]
    node output_C_hi_lo = cat(c_comb_5, c_comb_4) @[pp_compressor3_2.scala 35:29]
    node c_comb_7 = _c_comb_7_T_3 @[pp_compressor3_2.scala 25:22 31:19]
    node c_comb_6 = _c_comb_6_T_3 @[pp_compressor3_2.scala 25:22 31:19]
    node output_C_hi_hi = cat(c_comb_7, c_comb_6) @[pp_compressor3_2.scala 35:29]
    node output_C_hi = cat(output_C_hi_hi, output_C_hi_lo) @[pp_compressor3_2.scala 35:29]
    node _output_C_T = cat(output_C_hi, output_C_lo) @[pp_compressor3_2.scala 35:29]
    node _output_C_T_1 = bits(_output_C_T, 6, 0) @[pp_compressor3_2.scala 35:36]
    node _output_C_T_2 = cat(_output_C_T_1, UInt<1>("h0")) @[Cat.scala 33:92]
    node _output_C_T_3 = asSInt(_output_C_T_2) @[pp_compressor3_2.scala 35:61]
    output_S <= _output_S_T_1 @[pp_compressor3_2.scala 34:14]
    output_C <= _output_C_T_3 @[pp_compressor3_2.scala 35:14]

  module wallaceTree :
    input clock : Clock
    input reset : UInt<1>
    input io_data_i_0 : SInt<8>
    input io_data_i_1 : SInt<8>
    input io_data_i_2 : SInt<8>
    output io_data_o : SInt<8>

    inst rca of RCA @[wallace_tree.scala 13:19]
    inst layer1CSA_0 of pp_compressor3_2 @[wallace_tree.scala 59:44]
    node _rca_in_WIRE_0 = asSInt(UInt<8>("h0")) @[wallace_tree.scala 52:{32,32}]
    node _rca_in_WIRE_1 = asSInt(UInt<8>("h0")) @[wallace_tree.scala 52:{32,32}]
    node l1_csa_os_0 = layer1CSA_0.output_S
    node l1_csa_out_0 = l1_csa_os_0
    node rca_in_0 = l1_csa_out_0
    node l1_csa_oc_0 = layer1CSA_0.output_C
    node l1_csa_out_1 = l1_csa_oc_0
    node rca_in_1 = l1_csa_out_1
    node _l1_csa_in_WIRE_0 = asSInt(UInt<8>("h0")) @[wallace_tree.scala 55:{36,36}]
    node _l1_csa_in_WIRE_1 = asSInt(UInt<8>("h0")) @[wallace_tree.scala 55:{36,36}]
    node _l1_csa_in_WIRE_2 = asSInt(UInt<8>("h0")) @[wallace_tree.scala 55:{36,36}]
    node l1_csa_in_0 = io_data_i_0
    node l1_csa_in_1 = io_data_i_1
    node l1_csa_in_2 = io_data_i_2
    node _l1_csa_os_WIRE_0 = asSInt(UInt<8>("h0")) @[wallace_tree.scala 56:{36,36}]
    node _l1_csa_oc_WIRE_0 = asSInt(UInt<8>("h0")) @[wallace_tree.scala 57:{36,36}]
    node _l1_csa_out_WIRE_0 = asSInt(UInt<8>("h0")) @[wallace_tree.scala 58:{36,36}]
    node _l1_csa_out_WIRE_1 = asSInt(UInt<8>("h0")) @[wallace_tree.scala 58:{36,36}]
    io_data_o <= rca.output_S @[wallace_tree.scala 253:18]
    rca.clock <= clock
    rca.reset <= reset
    rca.input_a_in <= rca_in_0 @[wallace_tree.scala 250:18]
    rca.input_b_in <= rca_in_1 @[wallace_tree.scala 251:18]
    rca.input_c_in <= asSInt(UInt<1>("h0")) @[wallace_tree.scala 252:18]
    layer1CSA_0.clock <= clock
    layer1CSA_0.reset <= reset
    layer1CSA_0.input_pp0_in <= l1_csa_in_0 @[wallace_tree.scala 63:31]
    layer1CSA_0.input_pp1_in <= l1_csa_in_1 @[wallace_tree.scala 64:31]
    layer1CSA_0.input_pp2_in <= l1_csa_in_2 @[wallace_tree.scala 65:31]

  module Multiplier :
    input clock : Clock
    input reset : UInt<1>
    input input_multiplicand : SInt<4>
    input input_multiplier : SInt<4>
    output output_product : SInt<8>

    inst booth2_encoder of booth2Encoder @[multiplier.scala 21:34]
    inst pp_generator of ppGenerator @[multiplier.scala 22:34]
    inst wallace_tree of wallaceTree @[multiplier.scala 23:34]
    output_product <= wallace_tree.io_data_o @[multiplier.scala 37:41]
    booth2_encoder.clock <= clock
    booth2_encoder.reset <= reset
    booth2_encoder.input_multiplier <= input_multiplier @[multiplier.scala 25:37]
    pp_generator.clock <= clock
    pp_generator.reset <= reset
    pp_generator.inputData_multiplicand <= input_multiplicand @[multiplier.scala 27:41]
    pp_generator.inputCtrl_X2 <= booth2_encoder.output_X2 @[multiplier.scala 28:41]
    pp_generator.inputCtrl_inv <= booth2_encoder.output_inv @[multiplier.scala 29:41]
    pp_generator.inputCtrl_Set0 <= booth2_encoder.output_set0 @[multiplier.scala 30:41]
    wallace_tree.clock <= clock
    wallace_tree.reset <= reset
    wallace_tree.io_data_i_0 <= pp_generator.outputData_pp_out_0 @[multiplier.scala 33:35]
    wallace_tree.io_data_i_1 <= pp_generator.outputData_pp_out_1 @[multiplier.scala 33:35]
    wallace_tree.io_data_i_2 <= pp_generator.outputData_sig_out @[multiplier.scala 35:40]

  module RCA_1 :
    input clock : Clock
    input reset : UInt<1>
    input input_a_in : SInt<16>
    input input_b_in : SInt<16>
    input input_c_in : SInt<1>
    output output_S : SInt<16>
    output output_C : SInt<16>

    node _c_comb_0_T = bits(input_c_in, 0, 0) @[rca.scala 27:29]
    node _g_comb_0_T = bits(input_a_in, 0, 0) @[rca.scala 30:35]
    node _g_comb_0_T_1 = bits(input_b_in, 0, 0) @[rca.scala 30:51]
    node _g_comb_0_T_2 = and(_g_comb_0_T, _g_comb_0_T_1) @[rca.scala 30:39]
    node _g_comb_0_T_3 = bits(_g_comb_0_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_0_T = bits(input_a_in, 0, 0) @[rca.scala 31:35]
    node _p_comb_0_T_1 = bits(input_b_in, 0, 0) @[rca.scala 31:51]
    node _p_comb_0_T_2 = xor(_p_comb_0_T, _p_comb_0_T_1) @[rca.scala 31:39]
    node _p_comb_0_T_3 = bits(_p_comb_0_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_0 = _p_comb_0_T_3 @[rca.scala 23:22 31:21]
    node c_comb_0 = _c_comb_0_T @[rca.scala 25:22 27:15]
    node _s_comb_0_T = xor(p_comb_0, c_comb_0) @[rca.scala 32:34]
    node _c_comb_1_T = and(c_comb_0, p_comb_0) @[rca.scala 33:34]
    node g_comb_0 = _g_comb_0_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_1_T_1 = or(_c_comb_1_T, g_comb_0) @[rca.scala 33:46]
    node _g_comb_1_T = bits(input_a_in, 1, 1) @[rca.scala 30:35]
    node _g_comb_1_T_1 = bits(input_b_in, 1, 1) @[rca.scala 30:51]
    node _g_comb_1_T_2 = and(_g_comb_1_T, _g_comb_1_T_1) @[rca.scala 30:39]
    node _g_comb_1_T_3 = bits(_g_comb_1_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_1_T = bits(input_a_in, 1, 1) @[rca.scala 31:35]
    node _p_comb_1_T_1 = bits(input_b_in, 1, 1) @[rca.scala 31:51]
    node _p_comb_1_T_2 = xor(_p_comb_1_T, _p_comb_1_T_1) @[rca.scala 31:39]
    node _p_comb_1_T_3 = bits(_p_comb_1_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_1 = _p_comb_1_T_3 @[rca.scala 23:22 31:21]
    node c_comb_1 = _c_comb_1_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_1_T = xor(p_comb_1, c_comb_1) @[rca.scala 32:34]
    node _c_comb_2_T = and(c_comb_1, p_comb_1) @[rca.scala 33:34]
    node g_comb_1 = _g_comb_1_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_2_T_1 = or(_c_comb_2_T, g_comb_1) @[rca.scala 33:46]
    node _g_comb_2_T = bits(input_a_in, 2, 2) @[rca.scala 30:35]
    node _g_comb_2_T_1 = bits(input_b_in, 2, 2) @[rca.scala 30:51]
    node _g_comb_2_T_2 = and(_g_comb_2_T, _g_comb_2_T_1) @[rca.scala 30:39]
    node _g_comb_2_T_3 = bits(_g_comb_2_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_2_T = bits(input_a_in, 2, 2) @[rca.scala 31:35]
    node _p_comb_2_T_1 = bits(input_b_in, 2, 2) @[rca.scala 31:51]
    node _p_comb_2_T_2 = xor(_p_comb_2_T, _p_comb_2_T_1) @[rca.scala 31:39]
    node _p_comb_2_T_3 = bits(_p_comb_2_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_2 = _p_comb_2_T_3 @[rca.scala 23:22 31:21]
    node c_comb_2 = _c_comb_2_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_2_T = xor(p_comb_2, c_comb_2) @[rca.scala 32:34]
    node _c_comb_3_T = and(c_comb_2, p_comb_2) @[rca.scala 33:34]
    node g_comb_2 = _g_comb_2_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_3_T_1 = or(_c_comb_3_T, g_comb_2) @[rca.scala 33:46]
    node _g_comb_3_T = bits(input_a_in, 3, 3) @[rca.scala 30:35]
    node _g_comb_3_T_1 = bits(input_b_in, 3, 3) @[rca.scala 30:51]
    node _g_comb_3_T_2 = and(_g_comb_3_T, _g_comb_3_T_1) @[rca.scala 30:39]
    node _g_comb_3_T_3 = bits(_g_comb_3_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_3_T = bits(input_a_in, 3, 3) @[rca.scala 31:35]
    node _p_comb_3_T_1 = bits(input_b_in, 3, 3) @[rca.scala 31:51]
    node _p_comb_3_T_2 = xor(_p_comb_3_T, _p_comb_3_T_1) @[rca.scala 31:39]
    node _p_comb_3_T_3 = bits(_p_comb_3_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_3 = _p_comb_3_T_3 @[rca.scala 23:22 31:21]
    node c_comb_3 = _c_comb_3_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_3_T = xor(p_comb_3, c_comb_3) @[rca.scala 32:34]
    node _c_comb_4_T = and(c_comb_3, p_comb_3) @[rca.scala 33:34]
    node g_comb_3 = _g_comb_3_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_4_T_1 = or(_c_comb_4_T, g_comb_3) @[rca.scala 33:46]
    node _g_comb_4_T = bits(input_a_in, 4, 4) @[rca.scala 30:35]
    node _g_comb_4_T_1 = bits(input_b_in, 4, 4) @[rca.scala 30:51]
    node _g_comb_4_T_2 = and(_g_comb_4_T, _g_comb_4_T_1) @[rca.scala 30:39]
    node _g_comb_4_T_3 = bits(_g_comb_4_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_4_T = bits(input_a_in, 4, 4) @[rca.scala 31:35]
    node _p_comb_4_T_1 = bits(input_b_in, 4, 4) @[rca.scala 31:51]
    node _p_comb_4_T_2 = xor(_p_comb_4_T, _p_comb_4_T_1) @[rca.scala 31:39]
    node _p_comb_4_T_3 = bits(_p_comb_4_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_4 = _p_comb_4_T_3 @[rca.scala 23:22 31:21]
    node c_comb_4 = _c_comb_4_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_4_T = xor(p_comb_4, c_comb_4) @[rca.scala 32:34]
    node _c_comb_5_T = and(c_comb_4, p_comb_4) @[rca.scala 33:34]
    node g_comb_4 = _g_comb_4_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_5_T_1 = or(_c_comb_5_T, g_comb_4) @[rca.scala 33:46]
    node _g_comb_5_T = bits(input_a_in, 5, 5) @[rca.scala 30:35]
    node _g_comb_5_T_1 = bits(input_b_in, 5, 5) @[rca.scala 30:51]
    node _g_comb_5_T_2 = and(_g_comb_5_T, _g_comb_5_T_1) @[rca.scala 30:39]
    node _g_comb_5_T_3 = bits(_g_comb_5_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_5_T = bits(input_a_in, 5, 5) @[rca.scala 31:35]
    node _p_comb_5_T_1 = bits(input_b_in, 5, 5) @[rca.scala 31:51]
    node _p_comb_5_T_2 = xor(_p_comb_5_T, _p_comb_5_T_1) @[rca.scala 31:39]
    node _p_comb_5_T_3 = bits(_p_comb_5_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_5 = _p_comb_5_T_3 @[rca.scala 23:22 31:21]
    node c_comb_5 = _c_comb_5_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_5_T = xor(p_comb_5, c_comb_5) @[rca.scala 32:34]
    node _c_comb_6_T = and(c_comb_5, p_comb_5) @[rca.scala 33:34]
    node g_comb_5 = _g_comb_5_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_6_T_1 = or(_c_comb_6_T, g_comb_5) @[rca.scala 33:46]
    node _g_comb_6_T = bits(input_a_in, 6, 6) @[rca.scala 30:35]
    node _g_comb_6_T_1 = bits(input_b_in, 6, 6) @[rca.scala 30:51]
    node _g_comb_6_T_2 = and(_g_comb_6_T, _g_comb_6_T_1) @[rca.scala 30:39]
    node _g_comb_6_T_3 = bits(_g_comb_6_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_6_T = bits(input_a_in, 6, 6) @[rca.scala 31:35]
    node _p_comb_6_T_1 = bits(input_b_in, 6, 6) @[rca.scala 31:51]
    node _p_comb_6_T_2 = xor(_p_comb_6_T, _p_comb_6_T_1) @[rca.scala 31:39]
    node _p_comb_6_T_3 = bits(_p_comb_6_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_6 = _p_comb_6_T_3 @[rca.scala 23:22 31:21]
    node c_comb_6 = _c_comb_6_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_6_T = xor(p_comb_6, c_comb_6) @[rca.scala 32:34]
    node _c_comb_7_T = and(c_comb_6, p_comb_6) @[rca.scala 33:34]
    node g_comb_6 = _g_comb_6_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_7_T_1 = or(_c_comb_7_T, g_comb_6) @[rca.scala 33:46]
    node _g_comb_7_T = bits(input_a_in, 7, 7) @[rca.scala 30:35]
    node _g_comb_7_T_1 = bits(input_b_in, 7, 7) @[rca.scala 30:51]
    node _g_comb_7_T_2 = and(_g_comb_7_T, _g_comb_7_T_1) @[rca.scala 30:39]
    node _g_comb_7_T_3 = bits(_g_comb_7_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_7_T = bits(input_a_in, 7, 7) @[rca.scala 31:35]
    node _p_comb_7_T_1 = bits(input_b_in, 7, 7) @[rca.scala 31:51]
    node _p_comb_7_T_2 = xor(_p_comb_7_T, _p_comb_7_T_1) @[rca.scala 31:39]
    node _p_comb_7_T_3 = bits(_p_comb_7_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_7 = _p_comb_7_T_3 @[rca.scala 23:22 31:21]
    node c_comb_7 = _c_comb_7_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_7_T = xor(p_comb_7, c_comb_7) @[rca.scala 32:34]
    node _c_comb_8_T = and(c_comb_7, p_comb_7) @[rca.scala 33:34]
    node g_comb_7 = _g_comb_7_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_8_T_1 = or(_c_comb_8_T, g_comb_7) @[rca.scala 33:46]
    node _g_comb_8_T = bits(input_a_in, 8, 8) @[rca.scala 30:35]
    node _g_comb_8_T_1 = bits(input_b_in, 8, 8) @[rca.scala 30:51]
    node _g_comb_8_T_2 = and(_g_comb_8_T, _g_comb_8_T_1) @[rca.scala 30:39]
    node _g_comb_8_T_3 = bits(_g_comb_8_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_8_T = bits(input_a_in, 8, 8) @[rca.scala 31:35]
    node _p_comb_8_T_1 = bits(input_b_in, 8, 8) @[rca.scala 31:51]
    node _p_comb_8_T_2 = xor(_p_comb_8_T, _p_comb_8_T_1) @[rca.scala 31:39]
    node _p_comb_8_T_3 = bits(_p_comb_8_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_8 = _p_comb_8_T_3 @[rca.scala 23:22 31:21]
    node c_comb_8 = _c_comb_8_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_8_T = xor(p_comb_8, c_comb_8) @[rca.scala 32:34]
    node _c_comb_9_T = and(c_comb_8, p_comb_8) @[rca.scala 33:34]
    node g_comb_8 = _g_comb_8_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_9_T_1 = or(_c_comb_9_T, g_comb_8) @[rca.scala 33:46]
    node _g_comb_9_T = bits(input_a_in, 9, 9) @[rca.scala 30:35]
    node _g_comb_9_T_1 = bits(input_b_in, 9, 9) @[rca.scala 30:51]
    node _g_comb_9_T_2 = and(_g_comb_9_T, _g_comb_9_T_1) @[rca.scala 30:39]
    node _g_comb_9_T_3 = bits(_g_comb_9_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_9_T = bits(input_a_in, 9, 9) @[rca.scala 31:35]
    node _p_comb_9_T_1 = bits(input_b_in, 9, 9) @[rca.scala 31:51]
    node _p_comb_9_T_2 = xor(_p_comb_9_T, _p_comb_9_T_1) @[rca.scala 31:39]
    node _p_comb_9_T_3 = bits(_p_comb_9_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_9 = _p_comb_9_T_3 @[rca.scala 23:22 31:21]
    node c_comb_9 = _c_comb_9_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_9_T = xor(p_comb_9, c_comb_9) @[rca.scala 32:34]
    node _c_comb_10_T = and(c_comb_9, p_comb_9) @[rca.scala 33:34]
    node g_comb_9 = _g_comb_9_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_10_T_1 = or(_c_comb_10_T, g_comb_9) @[rca.scala 33:46]
    node _g_comb_10_T = bits(input_a_in, 10, 10) @[rca.scala 30:35]
    node _g_comb_10_T_1 = bits(input_b_in, 10, 10) @[rca.scala 30:51]
    node _g_comb_10_T_2 = and(_g_comb_10_T, _g_comb_10_T_1) @[rca.scala 30:39]
    node _g_comb_10_T_3 = bits(_g_comb_10_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_10_T = bits(input_a_in, 10, 10) @[rca.scala 31:35]
    node _p_comb_10_T_1 = bits(input_b_in, 10, 10) @[rca.scala 31:51]
    node _p_comb_10_T_2 = xor(_p_comb_10_T, _p_comb_10_T_1) @[rca.scala 31:39]
    node _p_comb_10_T_3 = bits(_p_comb_10_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_10 = _p_comb_10_T_3 @[rca.scala 23:22 31:21]
    node c_comb_10 = _c_comb_10_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_10_T = xor(p_comb_10, c_comb_10) @[rca.scala 32:34]
    node _c_comb_11_T = and(c_comb_10, p_comb_10) @[rca.scala 33:34]
    node g_comb_10 = _g_comb_10_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_11_T_1 = or(_c_comb_11_T, g_comb_10) @[rca.scala 33:46]
    node _g_comb_11_T = bits(input_a_in, 11, 11) @[rca.scala 30:35]
    node _g_comb_11_T_1 = bits(input_b_in, 11, 11) @[rca.scala 30:51]
    node _g_comb_11_T_2 = and(_g_comb_11_T, _g_comb_11_T_1) @[rca.scala 30:39]
    node _g_comb_11_T_3 = bits(_g_comb_11_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_11_T = bits(input_a_in, 11, 11) @[rca.scala 31:35]
    node _p_comb_11_T_1 = bits(input_b_in, 11, 11) @[rca.scala 31:51]
    node _p_comb_11_T_2 = xor(_p_comb_11_T, _p_comb_11_T_1) @[rca.scala 31:39]
    node _p_comb_11_T_3 = bits(_p_comb_11_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_11 = _p_comb_11_T_3 @[rca.scala 23:22 31:21]
    node c_comb_11 = _c_comb_11_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_11_T = xor(p_comb_11, c_comb_11) @[rca.scala 32:34]
    node _c_comb_12_T = and(c_comb_11, p_comb_11) @[rca.scala 33:34]
    node g_comb_11 = _g_comb_11_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_12_T_1 = or(_c_comb_12_T, g_comb_11) @[rca.scala 33:46]
    node _g_comb_12_T = bits(input_a_in, 12, 12) @[rca.scala 30:35]
    node _g_comb_12_T_1 = bits(input_b_in, 12, 12) @[rca.scala 30:51]
    node _g_comb_12_T_2 = and(_g_comb_12_T, _g_comb_12_T_1) @[rca.scala 30:39]
    node _g_comb_12_T_3 = bits(_g_comb_12_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_12_T = bits(input_a_in, 12, 12) @[rca.scala 31:35]
    node _p_comb_12_T_1 = bits(input_b_in, 12, 12) @[rca.scala 31:51]
    node _p_comb_12_T_2 = xor(_p_comb_12_T, _p_comb_12_T_1) @[rca.scala 31:39]
    node _p_comb_12_T_3 = bits(_p_comb_12_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_12 = _p_comb_12_T_3 @[rca.scala 23:22 31:21]
    node c_comb_12 = _c_comb_12_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_12_T = xor(p_comb_12, c_comb_12) @[rca.scala 32:34]
    node _c_comb_13_T = and(c_comb_12, p_comb_12) @[rca.scala 33:34]
    node g_comb_12 = _g_comb_12_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_13_T_1 = or(_c_comb_13_T, g_comb_12) @[rca.scala 33:46]
    node _g_comb_13_T = bits(input_a_in, 13, 13) @[rca.scala 30:35]
    node _g_comb_13_T_1 = bits(input_b_in, 13, 13) @[rca.scala 30:51]
    node _g_comb_13_T_2 = and(_g_comb_13_T, _g_comb_13_T_1) @[rca.scala 30:39]
    node _g_comb_13_T_3 = bits(_g_comb_13_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_13_T = bits(input_a_in, 13, 13) @[rca.scala 31:35]
    node _p_comb_13_T_1 = bits(input_b_in, 13, 13) @[rca.scala 31:51]
    node _p_comb_13_T_2 = xor(_p_comb_13_T, _p_comb_13_T_1) @[rca.scala 31:39]
    node _p_comb_13_T_3 = bits(_p_comb_13_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_13 = _p_comb_13_T_3 @[rca.scala 23:22 31:21]
    node c_comb_13 = _c_comb_13_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_13_T = xor(p_comb_13, c_comb_13) @[rca.scala 32:34]
    node _c_comb_14_T = and(c_comb_13, p_comb_13) @[rca.scala 33:34]
    node g_comb_13 = _g_comb_13_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_14_T_1 = or(_c_comb_14_T, g_comb_13) @[rca.scala 33:46]
    node _g_comb_14_T = bits(input_a_in, 14, 14) @[rca.scala 30:35]
    node _g_comb_14_T_1 = bits(input_b_in, 14, 14) @[rca.scala 30:51]
    node _g_comb_14_T_2 = and(_g_comb_14_T, _g_comb_14_T_1) @[rca.scala 30:39]
    node _g_comb_14_T_3 = bits(_g_comb_14_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_14_T = bits(input_a_in, 14, 14) @[rca.scala 31:35]
    node _p_comb_14_T_1 = bits(input_b_in, 14, 14) @[rca.scala 31:51]
    node _p_comb_14_T_2 = xor(_p_comb_14_T, _p_comb_14_T_1) @[rca.scala 31:39]
    node _p_comb_14_T_3 = bits(_p_comb_14_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_14 = _p_comb_14_T_3 @[rca.scala 23:22 31:21]
    node c_comb_14 = _c_comb_14_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_14_T = xor(p_comb_14, c_comb_14) @[rca.scala 32:34]
    node _c_comb_15_T = and(c_comb_14, p_comb_14) @[rca.scala 33:34]
    node g_comb_14 = _g_comb_14_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_15_T_1 = or(_c_comb_15_T, g_comb_14) @[rca.scala 33:46]
    node _g_comb_15_T = bits(input_a_in, 15, 15) @[rca.scala 30:35]
    node _g_comb_15_T_1 = bits(input_b_in, 15, 15) @[rca.scala 30:51]
    node _g_comb_15_T_2 = and(_g_comb_15_T, _g_comb_15_T_1) @[rca.scala 30:39]
    node _g_comb_15_T_3 = bits(_g_comb_15_T_2, 0, 0) @[rca.scala 30:56]
    node _p_comb_15_T = bits(input_a_in, 15, 15) @[rca.scala 31:35]
    node _p_comb_15_T_1 = bits(input_b_in, 15, 15) @[rca.scala 31:51]
    node _p_comb_15_T_2 = xor(_p_comb_15_T, _p_comb_15_T_1) @[rca.scala 31:39]
    node _p_comb_15_T_3 = bits(_p_comb_15_T_2, 0, 0) @[rca.scala 31:56]
    node p_comb_15 = _p_comb_15_T_3 @[rca.scala 23:22 31:21]
    node c_comb_15 = _c_comb_15_T_1 @[rca.scala 25:22 33:21]
    node _s_comb_15_T = xor(p_comb_15, c_comb_15) @[rca.scala 32:34]
    node _c_comb_16_T = and(c_comb_15, p_comb_15) @[rca.scala 33:34]
    node g_comb_15 = _g_comb_15_T_3 @[rca.scala 22:22 30:21]
    node _c_comb_16_T_1 = or(_c_comb_16_T, g_comb_15) @[rca.scala 33:46]
    node s_comb_1 = _s_comb_1_T @[rca.scala 24:22 32:21]
    node s_comb_0 = _s_comb_0_T @[rca.scala 24:22 32:21]
    node output_S_lo_lo_lo = cat(s_comb_1, s_comb_0) @[rca.scala 36:24]
    node s_comb_3 = _s_comb_3_T @[rca.scala 24:22 32:21]
    node s_comb_2 = _s_comb_2_T @[rca.scala 24:22 32:21]
    node output_S_lo_lo_hi = cat(s_comb_3, s_comb_2) @[rca.scala 36:24]
    node output_S_lo_lo = cat(output_S_lo_lo_hi, output_S_lo_lo_lo) @[rca.scala 36:24]
    node s_comb_5 = _s_comb_5_T @[rca.scala 24:22 32:21]
    node s_comb_4 = _s_comb_4_T @[rca.scala 24:22 32:21]
    node output_S_lo_hi_lo = cat(s_comb_5, s_comb_4) @[rca.scala 36:24]
    node s_comb_7 = _s_comb_7_T @[rca.scala 24:22 32:21]
    node s_comb_6 = _s_comb_6_T @[rca.scala 24:22 32:21]
    node output_S_lo_hi_hi = cat(s_comb_7, s_comb_6) @[rca.scala 36:24]
    node output_S_lo_hi = cat(output_S_lo_hi_hi, output_S_lo_hi_lo) @[rca.scala 36:24]
    node output_S_lo = cat(output_S_lo_hi, output_S_lo_lo) @[rca.scala 36:24]
    node s_comb_9 = _s_comb_9_T @[rca.scala 24:22 32:21]
    node s_comb_8 = _s_comb_8_T @[rca.scala 24:22 32:21]
    node output_S_hi_lo_lo = cat(s_comb_9, s_comb_8) @[rca.scala 36:24]
    node s_comb_11 = _s_comb_11_T @[rca.scala 24:22 32:21]
    node s_comb_10 = _s_comb_10_T @[rca.scala 24:22 32:21]
    node output_S_hi_lo_hi = cat(s_comb_11, s_comb_10) @[rca.scala 36:24]
    node output_S_hi_lo = cat(output_S_hi_lo_hi, output_S_hi_lo_lo) @[rca.scala 36:24]
    node s_comb_13 = _s_comb_13_T @[rca.scala 24:22 32:21]
    node s_comb_12 = _s_comb_12_T @[rca.scala 24:22 32:21]
    node output_S_hi_hi_lo = cat(s_comb_13, s_comb_12) @[rca.scala 36:24]
    node s_comb_15 = _s_comb_15_T @[rca.scala 24:22 32:21]
    node s_comb_14 = _s_comb_14_T @[rca.scala 24:22 32:21]
    node output_S_hi_hi_hi = cat(s_comb_15, s_comb_14) @[rca.scala 36:24]
    node output_S_hi_hi = cat(output_S_hi_hi_hi, output_S_hi_hi_lo) @[rca.scala 36:24]
    node output_S_hi = cat(output_S_hi_hi, output_S_hi_lo) @[rca.scala 36:24]
    node _output_S_T = cat(output_S_hi, output_S_lo) @[rca.scala 36:24]
    node _output_S_T_1 = asSInt(_output_S_T) @[rca.scala 36:31]
    node c_comb_16 = _c_comb_16_T_1 @[rca.scala 25:22 33:21]
    node _output_C_T = asSInt(c_comb_16) @[rca.scala 37:40]
    output_S <= _output_S_T_1 @[rca.scala 36:14]
    output_C <= pad(_output_C_T, 16) @[rca.scala 37:14]

  module MacUnit :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : SInt<4>
    input io_in_b : SInt<4>
    input io_in_c : SInt<16>
    output io_out_c : SInt<16>

    inst mul of Multiplier @[MacUnit.scala 15:19]
    inst rca of RCA_1 @[MacUnit.scala 16:19]
    node _rca_input_a_in_T = bits(mul.output_product, 7, 7) @[MacUnit.scala 21:71]
    node _rca_input_a_in_T_1 = bits(_rca_input_a_in_T, 0, 0) @[Bitwise.scala 77:15]
    node _rca_input_a_in_T_2 = mux(_rca_input_a_in_T_1, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 77:12]
    node rca_input_a_in_lo = asUInt(mul.output_product) @[Cat.scala 33:92]
    node _rca_input_a_in_T_3 = cat(_rca_input_a_in_T_2, rca_input_a_in_lo) @[Cat.scala 33:92]
    node _rca_input_a_in_T_4 = asSInt(_rca_input_a_in_T_3) @[MacUnit.scala 21:108]
    io_out_c <= rca.output_S @[MacUnit.scala 24:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.input_multiplicand <= io_in_a @[MacUnit.scala 18:26]
    mul.input_multiplier <= io_in_b @[MacUnit.scala 19:26]
    rca.clock <= clock
    rca.reset <= reset
    rca.input_a_in <= _rca_input_a_in_T_4 @[MacUnit.scala 21:19]
    rca.input_b_in <= io_in_c @[MacUnit.scala 22:19]
    rca.input_c_in <= asSInt(bits(asSInt(UInt<16>("h0")), 0, 0)) @[MacUnit.scala 23:19]

  module PE :
    input clock : Clock
    input reset : UInt<1>
    input io_in_control_ctrl_sa_send_data : UInt<1>
    input io_in_a : SInt<4>
    input io_in_b : SInt<4>
    input io_in_c : SInt<16>
    output io_out_control_ctrl_sa_send_data : UInt<1>
    output io_out_a : SInt<4>
    output io_out_b : SInt<4>
    output io_out_c : SInt<16>

    inst mac of MacUnit @[PE.scala 28:19]
    reg a_reg : SInt<4>, clock with :
      reset => (UInt<1>("h0"), a_reg) @[PE.scala 24:22]
    reg b_reg : SInt<4>, clock with :
      reset => (UInt<1>("h0"), b_reg) @[PE.scala 25:22]
    reg c_reg : SInt<16>, clock with :
      reset => (UInt<1>("h0"), c_reg) @[PE.scala 26:22]
    node _c_reg_T = mux(io_in_control_ctrl_sa_send_data, io_in_c, mac.io_out_c) @[PE.scala 36:15]
    io_out_control_ctrl_sa_send_data <= io_in_control_ctrl_sa_send_data @[PE.scala 42:18]
    io_out_a <= a_reg @[PE.scala 38:12]
    io_out_b <= b_reg @[PE.scala 39:12]
    io_out_c <= c_reg @[PE.scala 40:12]
    a_reg <= mux(reset, asSInt(UInt<4>("h0")), io_in_a) @[PE.scala 24:{22,22} 33:9]
    b_reg <= mux(reset, asSInt(UInt<4>("h0")), io_in_b) @[PE.scala 25:{22,22} 34:9]
    c_reg <= mux(reset, asSInt(UInt<16>("h0")), _c_reg_T) @[PE.scala 26:{22,22} 36:9]
    mac.clock <= clock
    mac.reset <= reset
    mac.io_in_a <= io_in_a @[PE.scala 29:15]
    mac.io_in_b <= io_in_b @[PE.scala 30:15]
    mac.io_in_c <= c_reg @[PE.scala 31:15]

  module PE_2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_control_ctrl_sa_send_data : UInt<1>
    input io_in_a : SInt<4>
    input io_in_b : SInt<4>
    input io_in_c : SInt<16>
    output io_out_control_ctrl_sa_send_data : UInt<1>
    output io_out_a : SInt<4>
    output io_out_b : SInt<4>
    output io_out_c : SInt<16>

    inst mac of MacUnit @[PE.scala 28:19]
    reg a_reg : SInt<4>, clock with :
      reset => (UInt<1>("h0"), a_reg) @[PE.scala 24:22]
    reg b_reg : SInt<4>, clock with :
      reset => (UInt<1>("h0"), b_reg) @[PE.scala 25:22]
    reg c_reg : SInt<16>, clock with :
      reset => (UInt<1>("h0"), c_reg) @[PE.scala 26:22]
    node _c_reg_T = mux(io_in_control_ctrl_sa_send_data, io_in_c, mac.io_out_c) @[PE.scala 36:15]
    io_out_control_ctrl_sa_send_data <= io_in_control_ctrl_sa_send_data @[PE.scala 42:18]
    io_out_a <= a_reg @[PE.scala 38:12]
    io_out_b <= b_reg @[PE.scala 39:12]
    io_out_c <= c_reg @[PE.scala 40:12]
    a_reg <= mux(reset, asSInt(UInt<4>("h0")), io_in_a) @[PE.scala 24:{22,22} 33:9]
    b_reg <= mux(reset, asSInt(UInt<4>("h0")), io_in_b) @[PE.scala 25:{22,22} 34:9]
    c_reg <= mux(reset, asSInt(UInt<16>("h0")), _c_reg_T) @[PE.scala 26:{22,22} 36:9]
    mac.clock <= clock
    mac.reset <= reset
    mac.io_in_a <= io_in_a @[PE.scala 29:15]
    mac.io_in_b <= io_in_b @[PE.scala 30:15]
    mac.io_in_c <= c_reg @[PE.scala 31:15]

  module SystolicArray :
    input clock : Clock
    input reset : UInt<1>
    input io_in_control_0_ctrl_sa_send_data : UInt<1>
    input io_in_control_1_ctrl_sa_send_data : UInt<1>
    input io_in_a_0 : SInt<4>
    input io_in_a_1 : SInt<4>
    input io_in_b_0 : SInt<4>
    input io_in_b_1 : SInt<4>
    input io_in_c_0 : SInt<16>
    input io_in_c_1 : SInt<16>
    output io_out_control_0_ctrl_sa_send_data : UInt<1>
    output io_out_control_1_ctrl_sa_send_data : UInt<1>
    output io_out_a_0 : SInt<4>
    output io_out_a_1 : SInt<4>
    output io_out_b_0 : SInt<4>
    output io_out_b_1 : SInt<4>
    output io_out_c_0 : SInt<16>
    output io_out_c_1 : SInt<16>

    inst sa_0_0 of PE @[SystolicArray.scala 22:45]
    inst sa_0_1 of PE @[SystolicArray.scala 22:45]
    inst sa_1_0 of PE_2 @[SystolicArray.scala 22:45]
    inst sa_1_1 of PE_2 @[SystolicArray.scala 22:45]
    io_out_control_0_ctrl_sa_send_data <= sa_1_0.io_out_control_ctrl_sa_send_data @[SystolicArray.scala 61:23]
    io_out_control_1_ctrl_sa_send_data <= sa_1_1.io_out_control_ctrl_sa_send_data @[SystolicArray.scala 61:23]
    io_out_a_0 <= sa_0_1.io_out_a @[SystolicArray.scala 65:17]
    io_out_a_1 <= sa_1_1.io_out_a @[SystolicArray.scala 65:17]
    io_out_b_0 <= sa_1_0.io_out_b @[SystolicArray.scala 59:17]
    io_out_b_1 <= sa_1_1.io_out_b @[SystolicArray.scala 59:17]
    io_out_c_0 <= sa_1_0.io_out_c @[SystolicArray.scala 60:17]
    io_out_c_1 <= sa_1_1.io_out_c @[SystolicArray.scala 60:17]
    sa_0_0.clock <= clock
    sa_0_0.reset <= reset
    sa_0_0.io_in_control_ctrl_sa_send_data <= io_in_control_0_ctrl_sa_send_data @[SystolicArray.scala 53:26]
    sa_0_0.io_in_a <= io_in_a_0 @[SystolicArray.scala 28:20]
    sa_0_0.io_in_b <= io_in_b_0 @[SystolicArray.scala 36:20]
    sa_0_0.io_in_c <= io_in_c_0 @[SystolicArray.scala 44:20]
    sa_0_1.clock <= clock
    sa_0_1.reset <= reset
    sa_0_1.io_in_control_ctrl_sa_send_data <= io_in_control_1_ctrl_sa_send_data @[SystolicArray.scala 53:26]
    sa_0_1.io_in_a <= sa_0_0.io_out_a @[SystolicArray.scala 28:20]
    sa_0_1.io_in_b <= io_in_b_1 @[SystolicArray.scala 36:20]
    sa_0_1.io_in_c <= io_in_c_1 @[SystolicArray.scala 44:20]
    sa_1_0.clock <= clock
    sa_1_0.reset <= reset
    sa_1_0.io_in_control_ctrl_sa_send_data <= sa_0_0.io_out_control_ctrl_sa_send_data @[SystolicArray.scala 53:26]
    sa_1_0.io_in_a <= io_in_a_1 @[SystolicArray.scala 28:20]
    sa_1_0.io_in_b <= sa_0_0.io_out_b @[SystolicArray.scala 36:20]
    sa_1_0.io_in_c <= sa_0_0.io_out_c @[SystolicArray.scala 44:20]
    sa_1_1.clock <= clock
    sa_1_1.reset <= reset
    sa_1_1.io_in_control_ctrl_sa_send_data <= sa_0_1.io_out_control_ctrl_sa_send_data @[SystolicArray.scala 53:26]
    sa_1_1.io_in_a <= sa_1_0.io_out_a @[SystolicArray.scala 28:20]
    sa_1_1.io_in_b <= sa_0_1.io_out_b @[SystolicArray.scala 36:20]
    sa_1_1.io_in_c <= sa_0_1.io_out_c @[SystolicArray.scala 44:20]

  module GlobalCounter :
    input clock : Clock
    input reset : UInt<1>
    input io_start : UInt<1>
    output io_tick : UInt<1>

    reg count : UInt<3>, clock with :
      reset => (UInt<1>("h0"), count) @[Controller.scala 13:22]
    node tick = eq(count, UInt<3>("h4")) @[Controller.scala 14:20]
    reg enable : UInt<1>, clock with :
      reset => (UInt<1>("h0"), enable) @[Controller.scala 16:23]
    node _GEN_0 = mux(tick, UInt<1>("h0"), enable) @[Controller.scala 19:20 20:12 16:23]
    node _GEN_1 = mux(io_start, UInt<1>("h1"), _GEN_0) @[Controller.scala 17:18 18:12]
    node _T = neq(count, UInt<3>("h4")) @[Controller.scala 24:16]
    node _count_T = add(count, UInt<1>("h1")) @[Controller.scala 25:22]
    node _count_T_1 = tail(_count_T, 1) @[Controller.scala 25:22]
    node _GEN_2 = mux(_T, _count_T_1, UInt<1>("h0")) @[Controller.scala 24:37 25:13 27:13]
    node _GEN_3 = mux(enable, _GEN_2, count) @[Controller.scala 23:16 13:22]
    io_tick <= tick @[Controller.scala 31:11]
    count <= mux(reset, UInt<3>("h0"), _GEN_3) @[Controller.scala 13:{22,22}]
    enable <= mux(reset, UInt<1>("h0"), _GEN_1) @[Controller.scala 16:{23,23}]

  module GlobalCounter_1 :
    input clock : Clock
    input reset : UInt<1>
    input io_start : UInt<1>
    output io_tick : UInt<1>

    reg count : UInt<1>, clock with :
      reset => (UInt<1>("h0"), count) @[Controller.scala 13:22]
    node tick = eq(count, UInt<1>("h1")) @[Controller.scala 14:20]
    reg enable : UInt<1>, clock with :
      reset => (UInt<1>("h0"), enable) @[Controller.scala 16:23]
    node _GEN_0 = mux(tick, UInt<1>("h0"), enable) @[Controller.scala 19:20 20:12 16:23]
    node _GEN_1 = mux(io_start, UInt<1>("h1"), _GEN_0) @[Controller.scala 17:18 18:12]
    node _T = neq(count, UInt<1>("h1")) @[Controller.scala 24:16]
    node _count_T = add(count, UInt<1>("h1")) @[Controller.scala 25:22]
    node _count_T_1 = tail(_count_T, 1) @[Controller.scala 25:22]
    node _GEN_2 = mux(_T, _count_T_1, UInt<1>("h0")) @[Controller.scala 24:37 25:13 27:13]
    node _GEN_3 = mux(enable, _GEN_2, count) @[Controller.scala 23:16 13:22]
    io_tick <= tick @[Controller.scala 31:11]
    count <= mux(reset, UInt<1>("h0"), _GEN_3) @[Controller.scala 13:{22,22}]
    enable <= mux(reset, UInt<1>("h0"), _GEN_1) @[Controller.scala 16:{23,23}]

  module Controller :
    input clock : Clock
    input reset : UInt<1>
    input io_ibh_data_in_done : UInt<1>
    input io_ibv_data_in_done : UInt<1>
    input io_ob_empty : UInt<1>
    output io_ctrl_ib_data_out : UInt<1>
    output io_ctrl_ob_data_in : UInt<1>
    output io_ctrl_sa_send_data : UInt<1>

    inst cal_gc of GlobalCounter @[Controller.scala 60:28]
    inst out_gc of GlobalCounter_1 @[Controller.scala 67:28]
    reg delay_ctrl_ib_data_out : UInt<1>, clock with :
      reset => (UInt<1>("h0"), delay_ctrl_ib_data_out) @[Controller.scala 47:39]
    node _ctrl_ib_data_out_edge_T = eq(delay_ctrl_ib_data_out, UInt<1>("h0")) @[Controller.scala 50:28]
    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[Controller.scala 82:22]
    node _T = eq(state, UInt<2>("h0")) @[Controller.scala 84:14]
    node _T_1 = and(io_ibh_data_in_done, io_ibv_data_in_done) @[Controller.scala 85:30]
    reg isStall : UInt<1>, clock with :
      reset => (UInt<1>("h0"), isStall) @[Controller.scala 57:24]
    node _T_2 = eq(isStall, UInt<1>("h0")) @[Controller.scala 85:56]
    node _T_3 = and(_T_1, _T_2) @[Controller.scala 85:53]
    node _GEN_4 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Controller.scala 85:66 88:24]
    node _GEN_27 = mux(_T, _GEN_4, UInt<1>("h0")) @[Controller.scala 84:24]
    node ctrl_ib_data_out = _GEN_27
    node _ctrl_ib_data_out_edge_T_1 = and(_ctrl_ib_data_out_edge_T, ctrl_ib_data_out) @[Controller.scala 50:52]
    reg cal_done : UInt<1>, clock with :
      reset => (UInt<1>("h0"), cal_done) @[Controller.scala 53:25]
    reg out_done : UInt<1>, clock with :
      reset => (UInt<1>("h0"), out_done) @[Controller.scala 54:25]
    node _GEN_0 = mux(cal_gc.io_tick, UInt<1>("h1"), cal_done) @[Controller.scala 62:24 63:14 53:25]
    node _out_gc_io_start_T = and(cal_gc.io_tick, io_ob_empty) @[Controller.scala 68:37]
    node _out_gc_io_start_T_1 = and(isStall, io_ob_empty) @[Controller.scala 68:61]
    node _out_gc_io_start_T_2 = or(_out_gc_io_start_T, _out_gc_io_start_T_1) @[Controller.scala 68:51]
    node _GEN_1 = mux(out_gc.io_tick, UInt<1>("h1"), out_done) @[Controller.scala 69:24 70:14 54:25]
    node _io_ctrl_ob_data_in_T = eq(out_done, UInt<1>("h0")) @[Controller.scala 73:36]
    node _io_ctrl_ob_data_in_T_1 = and(cal_done, _io_ctrl_ob_data_in_T) @[Controller.scala 73:34]
    node _io_ctrl_ob_data_in_T_2 = eq(isStall, UInt<1>("h0")) @[Controller.scala 73:48]
    node _io_ctrl_ob_data_in_T_3 = and(_io_ctrl_ob_data_in_T_1, _io_ctrl_ob_data_in_T_2) @[Controller.scala 73:46]
    node _io_ctrl_sa_send_data_T = eq(out_done, UInt<1>("h0")) @[Controller.scala 74:38]
    node _io_ctrl_sa_send_data_T_1 = and(cal_done, _io_ctrl_sa_send_data_T) @[Controller.scala 74:36]
    node _io_ctrl_sa_send_data_T_2 = eq(isStall, UInt<1>("h0")) @[Controller.scala 74:50]
    node _io_ctrl_sa_send_data_T_3 = and(_io_ctrl_sa_send_data_T_1, _io_ctrl_sa_send_data_T_2) @[Controller.scala 74:48]
    node _GEN_2 = mux(_T_3, UInt<2>("h1"), state) @[Controller.scala 85:66 86:13 82:22]
    node _GEN_3 = mux(_T_3, UInt<1>("h0"), isStall) @[Controller.scala 85:66 87:15 57:24]
    node _T_4 = eq(state, UInt<2>("h1")) @[Controller.scala 91:20]
    node _T_5 = and(cal_done, io_ob_empty) @[Controller.scala 92:19]
    node _T_6 = eq(io_ob_empty, UInt<1>("h0")) @[Controller.scala 94:34]
    node _T_7 = and(cal_gc.io_tick, _T_6) @[Controller.scala 94:31]
    node _GEN_5 = mux(_T_7, UInt<2>("h2"), state) @[Controller.scala 94:48 95:13 82:22]
    node _GEN_6 = mux(_T_7, UInt<1>("h1"), isStall) @[Controller.scala 94:48 96:15 57:24]
    node _GEN_7 = mux(_T_5, UInt<2>("h3"), _GEN_5) @[Controller.scala 92:35 93:13]
    node _GEN_8 = mux(_T_5, isStall, _GEN_6) @[Controller.scala 57:24 92:35]
    node _T_8 = eq(state, UInt<2>("h2")) @[Controller.scala 98:20]
    node _GEN_9 = mux(io_ob_empty, UInt<2>("h3"), state) @[Controller.scala 100:13 82:22 99:23]
    node _GEN_10 = mux(io_ob_empty, UInt<1>("h0"), isStall) @[Controller.scala 101:15 99:23 57:24]
    node _T_9 = eq(state, UInt<2>("h3")) @[Controller.scala 103:20]
    node _GEN_11 = mux(out_done, UInt<2>("h0"), state) @[Controller.scala 104:20 105:13 82:22]
    node _GEN_12 = mux(out_done, UInt<1>("h0"), _GEN_0) @[Controller.scala 104:20 106:16]
    node _GEN_13 = mux(out_done, UInt<1>("h0"), _GEN_1) @[Controller.scala 104:20 107:16]
    node _GEN_14 = mux(_T_9, _GEN_11, state) @[Controller.scala 103:32 82:22]
    node _GEN_15 = mux(_T_9, _GEN_12, _GEN_0) @[Controller.scala 103:32]
    node _GEN_16 = mux(_T_9, _GEN_13, _GEN_1) @[Controller.scala 103:32]
    node _GEN_17 = mux(_T_8, _GEN_9, _GEN_14) @[Controller.scala 98:31]
    node _GEN_18 = mux(_T_8, _GEN_10, isStall) @[Controller.scala 57:24 98:31]
    node _GEN_19 = mux(_T_8, _GEN_0, _GEN_15) @[Controller.scala 98:31]
    node _GEN_20 = mux(_T_8, _GEN_1, _GEN_16) @[Controller.scala 98:31]
    node _GEN_21 = mux(_T_4, _GEN_7, _GEN_17) @[Controller.scala 91:33]
    node _GEN_22 = mux(_T_4, _GEN_8, _GEN_18) @[Controller.scala 91:33]
    node _GEN_23 = mux(_T_4, _GEN_0, _GEN_19) @[Controller.scala 91:33]
    node _GEN_24 = mux(_T_4, _GEN_1, _GEN_20) @[Controller.scala 91:33]
    node _GEN_25 = mux(_T, _GEN_2, _GEN_21) @[Controller.scala 84:24]
    node _GEN_26 = mux(_T, _GEN_3, _GEN_22) @[Controller.scala 84:24]
    node _GEN_28 = mux(_T, _GEN_0, _GEN_23) @[Controller.scala 84:24]
    node _GEN_29 = mux(_T, _GEN_1, _GEN_24) @[Controller.scala 84:24]
    node ctrl_ib_data_out_edge = _ctrl_ib_data_out_edge_T_1
    node cal_gc_start = _GEN_27
    io_ctrl_ib_data_out <= ctrl_ib_data_out_edge @[Controller.scala 51:23]
    io_ctrl_ob_data_in <= _io_ctrl_ob_data_in_T_3 @[Controller.scala 73:22]
    io_ctrl_sa_send_data <= _io_ctrl_sa_send_data_T_3 @[Controller.scala 74:24]
    delay_ctrl_ib_data_out <= mux(reset, UInt<1>("h0"), ctrl_ib_data_out) @[Controller.scala 47:{39,39} 49:26]
    cal_done <= mux(reset, UInt<1>("h0"), _GEN_28) @[Controller.scala 53:{25,25}]
    out_done <= mux(reset, UInt<1>("h0"), _GEN_29) @[Controller.scala 54:{25,25}]
    isStall <= mux(reset, UInt<1>("h0"), _GEN_26) @[Controller.scala 57:{24,24}]
    cal_gc.clock <= clock
    cal_gc.reset <= reset
    cal_gc.io_start <= cal_gc_start @[Controller.scala 61:19]
    out_gc.clock <= clock
    out_gc.reset <= reset
    out_gc.io_start <= _out_gc_io_start_T_2 @[Controller.scala 68:19]
    state <= mux(reset, UInt<2>("h0"), _GEN_25) @[Controller.scala 82:{22,22}]

  module SyncFIFO :
    input clock : Clock
    input reset : UInt<1>
    input io_enq : UInt<1>
    input io_deq : UInt<1>
    input io_enqData : SInt<4>
    output io_deqData : SInt<4>
    output io_full : UInt<1>
    output io_empty : UInt<1>

    reg mem_0 : SInt<4>, clock with :
      reset => (UInt<1>("h0"), mem_0) @[SyncFIFO.scala 17:20]
    reg mem_1 : SInt<4>, clock with :
      reset => (UInt<1>("h0"), mem_1) @[SyncFIFO.scala 17:20]
    reg readPtr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), readPtr) @[SyncFIFO.scala 20:24]
    reg writePtr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), writePtr) @[SyncFIFO.scala 21:25]
    node _isEmpty_T = eq(readPtr, writePtr) @[SyncFIFO.scala 27:22]
    node _isFull_T = bits(writePtr, 1, 1) @[SyncFIFO.scala 28:38]
    node _isFull_T_1 = not(_isFull_T) @[SyncFIFO.scala 28:29]
    node _isFull_T_2 = bits(writePtr, 0, 0) @[SyncFIFO.scala 28:60]
    node _isFull_T_3 = cat(_isFull_T_1, _isFull_T_2) @[Cat.scala 33:92]
    node _isFull_T_4 = eq(readPtr, _isFull_T_3) @[SyncFIFO.scala 28:21]
    node isFull = _isFull_T_4
    node _T = eq(isFull, UInt<1>("h0")) @[SyncFIFO.scala 30:18]
    node _T_1 = and(io_enq, _T) @[SyncFIFO.scala 30:15]
    node _T_2 = bits(writePtr, 0, 0)
    node _mem_T_2 = io_enqData @[SyncFIFO.scala 31:{19,19}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), _T_2), _mem_T_2, mem_0) @[SyncFIFO.scala 31:{19,19} 17:20]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_2), _mem_T_2, mem_1) @[SyncFIFO.scala 31:{19,19} 17:20]
    node _writePtr_T = add(writePtr, UInt<1>("h1")) @[SyncFIFO.scala 32:26]
    node _writePtr_T_1 = tail(_writePtr_T, 1) @[SyncFIFO.scala 32:26]
    node _GEN_2 = mux(_T_1, _GEN_0, mem_0) @[SyncFIFO.scala 17:20 30:27]
    node _GEN_3 = mux(_T_1, _GEN_1, mem_1) @[SyncFIFO.scala 17:20 30:27]
    node _GEN_4 = mux(_T_1, _writePtr_T_1, writePtr) @[SyncFIFO.scala 30:27 32:14 21:25]
    node isEmpty = _isEmpty_T
    node _T_3 = eq(isEmpty, UInt<1>("h0")) @[SyncFIFO.scala 35:18]
    node _T_4 = and(io_deq, _T_3) @[SyncFIFO.scala 35:15]
    node _readPtr_T = add(readPtr, UInt<1>("h1")) @[SyncFIFO.scala 36:24]
    node _readPtr_T_1 = tail(_readPtr_T, 1) @[SyncFIFO.scala 36:24]
    node _deqData_T = bits(readPtr, 0, 0)
    node _GEN_5 = validif(eq(UInt<1>("h0"), _deqData_T), mem_0) @[SyncFIFO.scala 37:{13,13}]
    node _GEN_6 = mux(eq(UInt<1>("h1"), _deqData_T), mem_1, _GEN_5) @[SyncFIFO.scala 37:{13,13}]
    node _GEN_7 = mux(_T_4, _readPtr_T_1, readPtr) @[SyncFIFO.scala 35:28 36:13 20:24]
    node _mem_deqData_T = _GEN_6 @[SyncFIFO.scala 37:13]
    node _GEN_8 = mux(_T_4, _mem_deqData_T, asSInt(UInt<4>("h0"))) @[SyncFIFO.scala 35:28 37:13]
    node _mem_WIRE_0 = asSInt(UInt<4>("h0")) @[SyncFIFO.scala 17:{28,28}]
    node _mem_WIRE_1 = asSInt(UInt<4>("h0")) @[SyncFIFO.scala 17:{28,28}]
    node deqData = _GEN_8
    io_deqData <= deqData @[SyncFIFO.scala 40:14]
    io_full <= isFull @[SyncFIFO.scala 41:11]
    io_empty <= isEmpty @[SyncFIFO.scala 42:12]
    mem_0 <= mux(reset, _mem_WIRE_0, _GEN_2) @[SyncFIFO.scala 17:{20,20}]
    mem_1 <= mux(reset, _mem_WIRE_1, _GEN_3) @[SyncFIFO.scala 17:{20,20}]
    readPtr <= mux(reset, UInt<2>("h0"), _GEN_7) @[SyncFIFO.scala 20:{24,24}]
    writePtr <= mux(reset, UInt<2>("h0"), _GEN_4) @[SyncFIFO.scala 21:{25,25}]

  module InputBuffer :
    input clock : Clock
    input reset : UInt<1>
    input io_ctrl_ib_data_out : UInt<1>
    output io_data_in_ready : UInt<1>
    input io_data_in_valid : UInt<1>
    input io_data_in_bits_0 : SInt<4>
    input io_data_in_bits_1 : SInt<4>
    output io_data_out_0 : SInt<4>
    output io_data_out_1 : SInt<4>
    output io_ib_data_in_done : UInt<1>

    inst data_queue_0 of SyncFIFO @[InputBuffer.scala 16:46]
    inst data_queue_1 of SyncFIFO @[InputBuffer.scala 16:46]
    reg delay_count_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), delay_count_0) @[InputBuffer.scala 19:24]
    reg delay_count_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), delay_count_1) @[InputBuffer.scala 19:24]
    node _allFull_T = and(data_queue_0.io_full, data_queue_1.io_full) @[InputBuffer.scala 26:49]
    node _allEmpty_T = and(data_queue_0.io_empty, data_queue_1.io_empty) @[InputBuffer.scala 27:51]
    reg state : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state) @[InputBuffer.scala 30:22]
    node _data_queue_0_io_enq_T = and(io_data_in_ready, io_data_in_valid) @[Decoupled.scala 52:35]
    node _data_queue_0_io_deq_T = eq(state, UInt<1>("h1")) @[InputBuffer.scala 34:35]
    node _data_queue_0_io_deq_T_1 = eq(delay_count_0, UInt<1>("h0")) @[InputBuffer.scala 34:66]
    node _data_queue_0_io_deq_T_2 = and(_data_queue_0_io_deq_T, _data_queue_0_io_deq_T_1) @[InputBuffer.scala 34:48]
    node _data_queue_0_io_deq_T_3 = eq(data_queue_0.io_empty, UInt<1>("h0")) @[InputBuffer.scala 34:77]
    node _data_queue_0_io_deq_T_4 = and(_data_queue_0_io_deq_T_2, _data_queue_0_io_deq_T_3) @[InputBuffer.scala 34:74]
    node _data_queue_1_io_enq_T = and(io_data_in_ready, io_data_in_valid) @[Decoupled.scala 52:35]
    node _data_queue_1_io_deq_T = eq(state, UInt<1>("h1")) @[InputBuffer.scala 34:35]
    node _data_queue_1_io_deq_T_1 = eq(delay_count_1, UInt<1>("h0")) @[InputBuffer.scala 34:66]
    node _data_queue_1_io_deq_T_2 = and(_data_queue_1_io_deq_T, _data_queue_1_io_deq_T_1) @[InputBuffer.scala 34:48]
    node _data_queue_1_io_deq_T_3 = eq(data_queue_1.io_empty, UInt<1>("h0")) @[InputBuffer.scala 34:77]
    node _data_queue_1_io_deq_T_4 = and(_data_queue_1_io_deq_T_2, _data_queue_1_io_deq_T_3) @[InputBuffer.scala 34:74]
    node _io_data_in_ready_T = eq(state, UInt<1>("h0")) @[InputBuffer.scala 38:29]
    node _T = eq(state, UInt<1>("h0")) @[InputBuffer.scala 40:14]
    node _state_T = mux(io_ctrl_ib_data_out, UInt<1>("h1"), UInt<1>("h0")) @[InputBuffer.scala 43:19]
    node allFull = _allFull_T
    node _GEN_0 = mux(allFull, UInt<1>("h1"), UInt<1>("h0")) @[InputBuffer.scala 41:19 42:23]
    node _GEN_1 = mux(allFull, _state_T, state) @[InputBuffer.scala 41:19 43:13 30:22]
    node _T_1 = eq(state, UInt<1>("h1")) @[InputBuffer.scala 48:20]
    node allEmpty = _allEmpty_T
    node _GEN_2 = mux(allEmpty, UInt<1>("h0"), state) @[InputBuffer.scala 49:20 50:13 30:22]
    node _delay_count_0_T = neq(delay_count_0, UInt<1>("h0")) @[InputBuffer.scala 53:44]
    node _delay_count_0_T_1 = sub(delay_count_0, UInt<1>("h1")) @[InputBuffer.scala 53:68]
    node _delay_count_0_T_2 = tail(_delay_count_0_T_1, 1) @[InputBuffer.scala 53:68]
    node _delay_count_0_T_3 = mux(_delay_count_0_T, _delay_count_0_T_2, UInt<1>("h0")) @[InputBuffer.scala 53:28]
    node _delay_count_1_T = neq(delay_count_1, UInt<1>("h0")) @[InputBuffer.scala 53:44]
    node _delay_count_1_T_1 = sub(delay_count_1, UInt<1>("h1")) @[InputBuffer.scala 53:68]
    node _delay_count_1_T_2 = tail(_delay_count_1_T_1, 1) @[InputBuffer.scala 53:68]
    node _delay_count_1_T_3 = mux(_delay_count_1_T, _delay_count_1_T_2, UInt<1>("h0")) @[InputBuffer.scala 53:28]
    node _GEN_3 = mux(_T_1, _GEN_2, state) @[InputBuffer.scala 30:22 48:34]
    node _GEN_4 = mux(_T_1, _delay_count_0_T_3, delay_count_0) @[InputBuffer.scala 48:34 53:22 19:24]
    node _GEN_5 = mux(_T_1, _delay_count_1_T_3, delay_count_1) @[InputBuffer.scala 48:34 53:22 19:24]
    node _GEN_6 = mux(_T, _GEN_0, UInt<1>("h0")) @[InputBuffer.scala 40:27]
    node _GEN_7 = mux(_T, _GEN_1, _GEN_3) @[InputBuffer.scala 40:27]
    node _GEN_8 = mux(_T, UInt<1>("h0"), _GEN_4) @[InputBuffer.scala 40:27 46:22]
    node _GEN_9 = mux(_T, UInt<1>("h1"), _GEN_5) @[InputBuffer.scala 40:27 46:22]
    node ib_data_in_done = _GEN_6
    io_data_in_ready <= _io_data_in_ready_T @[InputBuffer.scala 38:20]
    io_data_out_0 <= data_queue_0.io_deqData @[InputBuffer.scala 36:20]
    io_data_out_1 <= data_queue_1.io_deqData @[InputBuffer.scala 36:20]
    io_ib_data_in_done <= ib_data_in_done @[InputBuffer.scala 22:22]
    data_queue_0.clock <= clock
    data_queue_0.reset <= reset
    data_queue_0.io_enq <= _data_queue_0_io_enq_T @[InputBuffer.scala 33:26]
    data_queue_0.io_deq <= _data_queue_0_io_deq_T_4 @[InputBuffer.scala 34:26]
    data_queue_0.io_enqData <= io_data_in_bits_0 @[InputBuffer.scala 35:30]
    data_queue_1.clock <= clock
    data_queue_1.reset <= reset
    data_queue_1.io_enq <= _data_queue_1_io_enq_T @[InputBuffer.scala 33:26]
    data_queue_1.io_deq <= _data_queue_1_io_deq_T_4 @[InputBuffer.scala 34:26]
    data_queue_1.io_enqData <= io_data_in_bits_1 @[InputBuffer.scala 35:30]
    delay_count_0 <= _GEN_8
    delay_count_1 <= _GEN_9
    state <= mux(reset, UInt<1>("h0"), _GEN_7) @[InputBuffer.scala 30:{22,22}]

  module SyncFIFO_4 :
    input clock : Clock
    input reset : UInt<1>
    input io_enq : UInt<1>
    input io_deq : UInt<1>
    input io_enqData : SInt<16>
    output io_deqData : SInt<16>
    output io_full : UInt<1>
    output io_empty : UInt<1>

    reg mem_0 : SInt<16>, clock with :
      reset => (UInt<1>("h0"), mem_0) @[SyncFIFO.scala 17:20]
    reg mem_1 : SInt<16>, clock with :
      reset => (UInt<1>("h0"), mem_1) @[SyncFIFO.scala 17:20]
    reg readPtr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), readPtr) @[SyncFIFO.scala 20:24]
    reg writePtr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), writePtr) @[SyncFIFO.scala 21:25]
    node _isEmpty_T = eq(readPtr, writePtr) @[SyncFIFO.scala 27:22]
    node _isFull_T = bits(writePtr, 1, 1) @[SyncFIFO.scala 28:38]
    node _isFull_T_1 = not(_isFull_T) @[SyncFIFO.scala 28:29]
    node _isFull_T_2 = bits(writePtr, 0, 0) @[SyncFIFO.scala 28:60]
    node _isFull_T_3 = cat(_isFull_T_1, _isFull_T_2) @[Cat.scala 33:92]
    node _isFull_T_4 = eq(readPtr, _isFull_T_3) @[SyncFIFO.scala 28:21]
    node isFull = _isFull_T_4
    node _T = eq(isFull, UInt<1>("h0")) @[SyncFIFO.scala 30:18]
    node _T_1 = and(io_enq, _T) @[SyncFIFO.scala 30:15]
    node _T_2 = bits(writePtr, 0, 0)
    node _mem_T_2 = io_enqData @[SyncFIFO.scala 31:{19,19}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), _T_2), _mem_T_2, mem_0) @[SyncFIFO.scala 31:{19,19} 17:20]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_2), _mem_T_2, mem_1) @[SyncFIFO.scala 31:{19,19} 17:20]
    node _writePtr_T = add(writePtr, UInt<1>("h1")) @[SyncFIFO.scala 32:26]
    node _writePtr_T_1 = tail(_writePtr_T, 1) @[SyncFIFO.scala 32:26]
    node _GEN_2 = mux(_T_1, _GEN_0, mem_0) @[SyncFIFO.scala 17:20 30:27]
    node _GEN_3 = mux(_T_1, _GEN_1, mem_1) @[SyncFIFO.scala 17:20 30:27]
    node _GEN_4 = mux(_T_1, _writePtr_T_1, writePtr) @[SyncFIFO.scala 30:27 32:14 21:25]
    node isEmpty = _isEmpty_T
    node _T_3 = eq(isEmpty, UInt<1>("h0")) @[SyncFIFO.scala 35:18]
    node _T_4 = and(io_deq, _T_3) @[SyncFIFO.scala 35:15]
    node _readPtr_T = add(readPtr, UInt<1>("h1")) @[SyncFIFO.scala 36:24]
    node _readPtr_T_1 = tail(_readPtr_T, 1) @[SyncFIFO.scala 36:24]
    node _deqData_T = bits(readPtr, 0, 0)
    node _GEN_5 = validif(eq(UInt<1>("h0"), _deqData_T), mem_0) @[SyncFIFO.scala 37:{13,13}]
    node _GEN_6 = mux(eq(UInt<1>("h1"), _deqData_T), mem_1, _GEN_5) @[SyncFIFO.scala 37:{13,13}]
    node _GEN_7 = mux(_T_4, _readPtr_T_1, readPtr) @[SyncFIFO.scala 35:28 36:13 20:24]
    node _mem_deqData_T = _GEN_6 @[SyncFIFO.scala 37:13]
    node _GEN_8 = mux(_T_4, _mem_deqData_T, asSInt(UInt<16>("h0"))) @[SyncFIFO.scala 35:28 37:13]
    node _mem_WIRE_0 = asSInt(UInt<16>("h0")) @[SyncFIFO.scala 17:{28,28}]
    node _mem_WIRE_1 = asSInt(UInt<16>("h0")) @[SyncFIFO.scala 17:{28,28}]
    node deqData = _GEN_8
    io_deqData <= deqData @[SyncFIFO.scala 40:14]
    io_full <= isFull @[SyncFIFO.scala 41:11]
    io_empty <= isEmpty @[SyncFIFO.scala 42:12]
    mem_0 <= mux(reset, _mem_WIRE_0, _GEN_2) @[SyncFIFO.scala 17:{20,20}]
    mem_1 <= mux(reset, _mem_WIRE_1, _GEN_3) @[SyncFIFO.scala 17:{20,20}]
    readPtr <= mux(reset, UInt<2>("h0"), _GEN_7) @[SyncFIFO.scala 20:{24,24}]
    writePtr <= mux(reset, UInt<2>("h0"), _GEN_4) @[SyncFIFO.scala 21:{25,25}]

  module OutputBuffer :
    input clock : Clock
    input reset : UInt<1>
    input io_ctrl_ob_data_in : UInt<1>
    input io_data_in_0 : SInt<16>
    input io_data_in_1 : SInt<16>
    input io_data_out_ready : UInt<1>
    output io_data_out_valid : UInt<1>
    output io_data_out_bits_0 : SInt<16>
    output io_data_out_bits_1 : SInt<16>
    output io_ob_empty : UInt<1>

    inst data_queue_0 of SyncFIFO_4 @[OutputBuffer.scala 16:46]
    inst data_queue_1 of SyncFIFO_4 @[OutputBuffer.scala 16:46]
    node _allEmpty_T = and(data_queue_0.io_empty, data_queue_1.io_empty) @[OutputBuffer.scala 19:51]
    node _data_queue_0_io_deq_T = and(io_data_out_ready, io_data_out_valid) @[Decoupled.scala 52:35]
    node _data_queue_1_io_deq_T = and(io_data_out_ready, io_data_out_valid) @[Decoupled.scala 52:35]
    node allEmpty = _allEmpty_T
    node _io_data_out_valid_T = eq(allEmpty, UInt<1>("h0")) @[OutputBuffer.scala 33:24]
    io_data_out_valid <= _io_data_out_valid_T @[OutputBuffer.scala 33:21]
    io_data_out_bits_0 <= data_queue_0.io_deqData @[OutputBuffer.scala 30:25]
    io_data_out_bits_1 <= data_queue_1.io_deqData @[OutputBuffer.scala 30:25]
    io_ob_empty <= allEmpty @[OutputBuffer.scala 34:15]
    data_queue_0.clock <= clock
    data_queue_0.reset <= reset
    data_queue_0.io_enq <= io_ctrl_ob_data_in @[OutputBuffer.scala 22:26]
    data_queue_0.io_deq <= _data_queue_0_io_deq_T @[OutputBuffer.scala 27:28]
    data_queue_0.io_enqData <= io_data_in_0 @[OutputBuffer.scala 29:30]
    data_queue_1.clock <= clock
    data_queue_1.reset <= reset
    data_queue_1.io_enq <= io_ctrl_ob_data_in @[OutputBuffer.scala 22:26]
    data_queue_1.io_deq <= _data_queue_1_io_deq_T @[OutputBuffer.scala 27:28]
    data_queue_1.io_enqData <= io_data_in_1 @[OutputBuffer.scala 29:30]

  module top :
    input clock : Clock
    input reset : UInt<1>
    output io_tpuIO_in_ready : UInt<1>
    input io_tpuIO_in_valid : UInt<1>
    input io_tpuIO_in_bits_in_a_0 : SInt<4>
    input io_tpuIO_in_bits_in_a_1 : SInt<4>
    input io_tpuIO_in_bits_in_b_0 : SInt<4>
    input io_tpuIO_in_bits_in_b_1 : SInt<4>
    input io_tpuIO_in_bits_in_c_0 : SInt<16>
    input io_tpuIO_in_bits_in_c_1 : SInt<16>
    input io_tpuIO_out_ready : UInt<1>
    output io_tpuIO_out_valid : UInt<1>
    output io_tpuIO_out_bits_out_c_0 : SInt<16>
    output io_tpuIO_out_bits_out_c_1 : SInt<16>

    inst sa of SystolicArray @[top.scala 178:18]
    inst controller of Controller @[top.scala 179:26]
    inst inBuffer_h of InputBuffer @[top.scala 180:28]
    inst inBuffer_v of InputBuffer @[top.scala 181:27]
    inst outBuffer of OutputBuffer @[top.scala 182:26]
    node _io_tpuIO_in_ready_T = and(inBuffer_h.io_data_in_ready, inBuffer_v.io_data_in_ready) @[top.scala 191:52]
    io_tpuIO_in_ready <= _io_tpuIO_in_ready_T @[top.scala 191:21]
    io_tpuIO_out_valid <= outBuffer.io_data_out_valid @[top.scala 193:22]
    io_tpuIO_out_bits_out_c_0 <= outBuffer.io_data_out_bits_0 @[top.scala 194:27]
    io_tpuIO_out_bits_out_c_1 <= outBuffer.io_data_out_bits_1 @[top.scala 194:27]
    sa.clock <= clock
    sa.reset <= reset
    sa.io_in_control_0_ctrl_sa_send_data <= controller.io_ctrl_sa_send_data @[top.scala 202:48]
    sa.io_in_control_1_ctrl_sa_send_data <= controller.io_ctrl_sa_send_data @[top.scala 202:48]
    sa.io_in_a_0 <= inBuffer_h.io_data_out_0 @[top.scala 198:14]
    sa.io_in_a_1 <= inBuffer_h.io_data_out_1 @[top.scala 198:14]
    sa.io_in_b_0 <= inBuffer_v.io_data_out_0 @[top.scala 199:14]
    sa.io_in_b_1 <= inBuffer_v.io_data_out_1 @[top.scala 199:14]
    sa.io_in_c_0 <= io_tpuIO_in_bits_in_c_0 @[top.scala 200:14]
    sa.io_in_c_1 <= io_tpuIO_in_bits_in_c_1 @[top.scala 200:14]
    controller.clock <= clock
    controller.reset <= reset
    controller.io_ibh_data_in_done <= inBuffer_h.io_ib_data_in_done @[top.scala 204:34]
    controller.io_ibv_data_in_done <= inBuffer_v.io_ib_data_in_done @[top.scala 205:34]
    controller.io_ob_empty <= outBuffer.io_ob_empty @[top.scala 206:26]
    inBuffer_h.clock <= clock
    inBuffer_h.reset <= reset
    inBuffer_h.io_ctrl_ib_data_out <= controller.io_ctrl_ib_data_out @[top.scala 186:34]
    inBuffer_h.io_data_in_valid <= io_tpuIO_in_valid @[top.scala 184:31]
    inBuffer_h.io_data_in_bits_0 <= io_tpuIO_in_bits_in_a_0 @[top.scala 185:30]
    inBuffer_h.io_data_in_bits_1 <= io_tpuIO_in_bits_in_a_1 @[top.scala 185:30]
    inBuffer_v.clock <= clock
    inBuffer_v.reset <= reset
    inBuffer_v.io_ctrl_ib_data_out <= controller.io_ctrl_ib_data_out @[top.scala 190:34]
    inBuffer_v.io_data_in_valid <= io_tpuIO_in_valid @[top.scala 188:31]
    inBuffer_v.io_data_in_bits_0 <= io_tpuIO_in_bits_in_b_0 @[top.scala 189:30]
    inBuffer_v.io_data_in_bits_1 <= io_tpuIO_in_bits_in_b_1 @[top.scala 189:30]
    outBuffer.clock <= clock
    outBuffer.reset <= reset
    outBuffer.io_ctrl_ob_data_in <= controller.io_ctrl_ob_data_in @[top.scala 196:32]
    outBuffer.io_data_in_0 <= sa.io_out_c_0 @[top.scala 201:24]
    outBuffer.io_data_in_1 <= sa.io_out_c_1 @[top.scala 201:24]
    outBuffer.io_data_out_ready <= io_tpuIO_out_ready @[top.scala 195:31]
