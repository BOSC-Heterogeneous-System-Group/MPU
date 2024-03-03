circuit SA_ROB_Wrapper :
  module ldBuffer :
    input clock : Clock
    input reset : UInt<1>
    input io_deqptr_0 : UInt<5>
    input io_deqptr_1 : UInt<5>
    input io_deqptr_2 : UInt<5>
    input io_deqptr_3 : UInt<5>
    input io_deqptr_4 : UInt<5>
    input io_deqptr_5 : UInt<5>
    input io_ldin_data_0 : UInt<64>
    input io_ldin_data_1 : UInt<64>
    input io_ldin_robIdx_0 : UInt<5>
    input io_ldin_robIdx_1 : UInt<5>
    input io_ldin_fuOptype_0 : UInt<3>
    input io_ldin_fuOptype_1 : UInt<3>
    input io_ldin_valid_0 : UInt<1>
    input io_ldin_valid_1 : UInt<1>
    output io_bufout_data_0 : UInt<64>
    output io_bufout_data_1 : UInt<64>
    output io_bufout_data_2 : UInt<64>
    output io_bufout_data_3 : UInt<64>
    output io_bufout_MatchVec_0 : UInt<6>
    output io_bufout_MatchVec_1 : UInt<6>
    output io_bufout_MatchVec_2 : UInt<6>
    output io_bufout_MatchVec_3 : UInt<6>
    output io_bufout_valid_0 : UInt<1>
    output io_bufout_valid_1 : UInt<1>
    output io_bufout_valid_2 : UInt<1>
    output io_bufout_valid_3 : UInt<1>

    reg validReg_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), validReg_0) @[matu.scala 184:25]
    reg deqptrReg_2 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), deqptrReg_2) @[matu.scala 186:22]
    reg robIdxReg_0 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), robIdxReg_0) @[matu.scala 187:22]
    node _MatchVec_0_2_T = eq(deqptrReg_2, robIdxReg_0) @[matu.scala 205:52]
    node _MatchVec_0_2_T_1 = bits(_MatchVec_0_2_T, 0, 0) @[matu.scala 205:70]
    node _MatchVec_0_2_T_2 = and(validReg_0, _MatchVec_0_2_T_1) @[matu.scala 205:35]
    node MatchVec_0_2 = _MatchVec_0_2_T_2 @[matu.scala 182:22 205:20]
    reg deqptrReg_1 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), deqptrReg_1) @[matu.scala 186:22]
    node _MatchVec_0_1_T = eq(deqptrReg_1, robIdxReg_0) @[matu.scala 205:52]
    node _MatchVec_0_1_T_1 = bits(_MatchVec_0_1_T, 0, 0) @[matu.scala 205:70]
    node _MatchVec_0_1_T_2 = and(validReg_0, _MatchVec_0_1_T_1) @[matu.scala 205:35]
    node MatchVec_0_1 = _MatchVec_0_1_T_2 @[matu.scala 182:22 205:20]
    node matchVecUInt_lo_hi = cat(MatchVec_0_2, MatchVec_0_1) @[matu.scala 183:60]
    reg deqptrReg_0 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), deqptrReg_0) @[matu.scala 186:22]
    node _MatchVec_0_0_T = eq(deqptrReg_0, robIdxReg_0) @[matu.scala 205:52]
    node _MatchVec_0_0_T_1 = bits(_MatchVec_0_0_T, 0, 0) @[matu.scala 205:70]
    node _MatchVec_0_0_T_2 = and(validReg_0, _MatchVec_0_0_T_1) @[matu.scala 205:35]
    node MatchVec_0_0 = _MatchVec_0_0_T_2 @[matu.scala 182:22 205:20]
    node matchVecUInt_lo = cat(matchVecUInt_lo_hi, MatchVec_0_0) @[matu.scala 183:60]
    reg deqptrReg_5 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), deqptrReg_5) @[matu.scala 186:22]
    node _MatchVec_0_5_T = eq(deqptrReg_5, robIdxReg_0) @[matu.scala 205:52]
    node _MatchVec_0_5_T_1 = bits(_MatchVec_0_5_T, 0, 0) @[matu.scala 205:70]
    node _MatchVec_0_5_T_2 = and(validReg_0, _MatchVec_0_5_T_1) @[matu.scala 205:35]
    node MatchVec_0_5 = _MatchVec_0_5_T_2 @[matu.scala 182:22 205:20]
    reg deqptrReg_4 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), deqptrReg_4) @[matu.scala 186:22]
    node _MatchVec_0_4_T = eq(deqptrReg_4, robIdxReg_0) @[matu.scala 205:52]
    node _MatchVec_0_4_T_1 = bits(_MatchVec_0_4_T, 0, 0) @[matu.scala 205:70]
    node _MatchVec_0_4_T_2 = and(validReg_0, _MatchVec_0_4_T_1) @[matu.scala 205:35]
    node MatchVec_0_4 = _MatchVec_0_4_T_2 @[matu.scala 182:22 205:20]
    node matchVecUInt_hi_hi = cat(MatchVec_0_5, MatchVec_0_4) @[matu.scala 183:60]
    reg deqptrReg_3 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), deqptrReg_3) @[matu.scala 186:22]
    node _MatchVec_0_3_T = eq(deqptrReg_3, robIdxReg_0) @[matu.scala 205:52]
    node _MatchVec_0_3_T_1 = bits(_MatchVec_0_3_T, 0, 0) @[matu.scala 205:70]
    node _MatchVec_0_3_T_2 = and(validReg_0, _MatchVec_0_3_T_1) @[matu.scala 205:35]
    node MatchVec_0_3 = _MatchVec_0_3_T_2 @[matu.scala 182:22 205:20]
    node matchVecUInt_hi = cat(matchVecUInt_hi_hi, MatchVec_0_3) @[matu.scala 183:60]
    node _matchVecUInt_T = cat(matchVecUInt_hi, matchVecUInt_lo) @[matu.scala 183:60]
    reg validReg_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), validReg_1) @[matu.scala 184:25]
    reg robIdxReg_1 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), robIdxReg_1) @[matu.scala 187:22]
    node _MatchVec_1_2_T = eq(deqptrReg_2, robIdxReg_1) @[matu.scala 206:52]
    node _MatchVec_1_2_T_1 = bits(_MatchVec_1_2_T, 0, 0) @[matu.scala 206:70]
    node _MatchVec_1_2_T_2 = and(validReg_1, _MatchVec_1_2_T_1) @[matu.scala 206:35]
    node MatchVec_1_2 = _MatchVec_1_2_T_2 @[matu.scala 182:22 206:20]
    node _MatchVec_1_1_T = eq(deqptrReg_1, robIdxReg_1) @[matu.scala 206:52]
    node _MatchVec_1_1_T_1 = bits(_MatchVec_1_1_T, 0, 0) @[matu.scala 206:70]
    node _MatchVec_1_1_T_2 = and(validReg_1, _MatchVec_1_1_T_1) @[matu.scala 206:35]
    node MatchVec_1_1 = _MatchVec_1_1_T_2 @[matu.scala 182:22 206:20]
    node matchVecUInt_lo_hi_1 = cat(MatchVec_1_2, MatchVec_1_1) @[matu.scala 183:60]
    node _MatchVec_1_0_T = eq(deqptrReg_0, robIdxReg_1) @[matu.scala 206:52]
    node _MatchVec_1_0_T_1 = bits(_MatchVec_1_0_T, 0, 0) @[matu.scala 206:70]
    node _MatchVec_1_0_T_2 = and(validReg_1, _MatchVec_1_0_T_1) @[matu.scala 206:35]
    node MatchVec_1_0 = _MatchVec_1_0_T_2 @[matu.scala 182:22 206:20]
    node matchVecUInt_lo_1 = cat(matchVecUInt_lo_hi_1, MatchVec_1_0) @[matu.scala 183:60]
    node _MatchVec_1_5_T = eq(deqptrReg_5, robIdxReg_1) @[matu.scala 206:52]
    node _MatchVec_1_5_T_1 = bits(_MatchVec_1_5_T, 0, 0) @[matu.scala 206:70]
    node _MatchVec_1_5_T_2 = and(validReg_1, _MatchVec_1_5_T_1) @[matu.scala 206:35]
    node MatchVec_1_5 = _MatchVec_1_5_T_2 @[matu.scala 182:22 206:20]
    node _MatchVec_1_4_T = eq(deqptrReg_4, robIdxReg_1) @[matu.scala 206:52]
    node _MatchVec_1_4_T_1 = bits(_MatchVec_1_4_T, 0, 0) @[matu.scala 206:70]
    node _MatchVec_1_4_T_2 = and(validReg_1, _MatchVec_1_4_T_1) @[matu.scala 206:35]
    node MatchVec_1_4 = _MatchVec_1_4_T_2 @[matu.scala 182:22 206:20]
    node matchVecUInt_hi_hi_1 = cat(MatchVec_1_5, MatchVec_1_4) @[matu.scala 183:60]
    node _MatchVec_1_3_T = eq(deqptrReg_3, robIdxReg_1) @[matu.scala 206:52]
    node _MatchVec_1_3_T_1 = bits(_MatchVec_1_3_T, 0, 0) @[matu.scala 206:70]
    node _MatchVec_1_3_T_2 = and(validReg_1, _MatchVec_1_3_T_1) @[matu.scala 206:35]
    node MatchVec_1_3 = _MatchVec_1_3_T_2 @[matu.scala 182:22 206:20]
    node matchVecUInt_hi_1 = cat(matchVecUInt_hi_hi_1, MatchVec_1_3) @[matu.scala 183:60]
    node _matchVecUInt_T_1 = cat(matchVecUInt_hi_1, matchVecUInt_lo_1) @[matu.scala 183:60]
    reg validReg_2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), validReg_2) @[matu.scala 184:25]
    reg robIdxReg_2 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), robIdxReg_2) @[matu.scala 187:22]
    node _MatchVec_2_2_T = eq(deqptrReg_2, robIdxReg_2) @[matu.scala 207:52]
    node _MatchVec_2_2_T_1 = bits(_MatchVec_2_2_T, 0, 0) @[matu.scala 207:70]
    node _MatchVec_2_2_T_2 = and(validReg_2, _MatchVec_2_2_T_1) @[matu.scala 207:35]
    node MatchVec_2_2 = _MatchVec_2_2_T_2 @[matu.scala 182:22 207:20]
    node _MatchVec_2_1_T = eq(deqptrReg_1, robIdxReg_2) @[matu.scala 207:52]
    node _MatchVec_2_1_T_1 = bits(_MatchVec_2_1_T, 0, 0) @[matu.scala 207:70]
    node _MatchVec_2_1_T_2 = and(validReg_2, _MatchVec_2_1_T_1) @[matu.scala 207:35]
    node MatchVec_2_1 = _MatchVec_2_1_T_2 @[matu.scala 182:22 207:20]
    node matchVecUInt_lo_hi_2 = cat(MatchVec_2_2, MatchVec_2_1) @[matu.scala 183:60]
    node _MatchVec_2_0_T = eq(deqptrReg_0, robIdxReg_2) @[matu.scala 207:52]
    node _MatchVec_2_0_T_1 = bits(_MatchVec_2_0_T, 0, 0) @[matu.scala 207:70]
    node _MatchVec_2_0_T_2 = and(validReg_2, _MatchVec_2_0_T_1) @[matu.scala 207:35]
    node MatchVec_2_0 = _MatchVec_2_0_T_2 @[matu.scala 182:22 207:20]
    node matchVecUInt_lo_2 = cat(matchVecUInt_lo_hi_2, MatchVec_2_0) @[matu.scala 183:60]
    node _MatchVec_2_5_T = eq(deqptrReg_5, robIdxReg_2) @[matu.scala 207:52]
    node _MatchVec_2_5_T_1 = bits(_MatchVec_2_5_T, 0, 0) @[matu.scala 207:70]
    node _MatchVec_2_5_T_2 = and(validReg_2, _MatchVec_2_5_T_1) @[matu.scala 207:35]
    node MatchVec_2_5 = _MatchVec_2_5_T_2 @[matu.scala 182:22 207:20]
    node _MatchVec_2_4_T = eq(deqptrReg_4, robIdxReg_2) @[matu.scala 207:52]
    node _MatchVec_2_4_T_1 = bits(_MatchVec_2_4_T, 0, 0) @[matu.scala 207:70]
    node _MatchVec_2_4_T_2 = and(validReg_2, _MatchVec_2_4_T_1) @[matu.scala 207:35]
    node MatchVec_2_4 = _MatchVec_2_4_T_2 @[matu.scala 182:22 207:20]
    node matchVecUInt_hi_hi_2 = cat(MatchVec_2_5, MatchVec_2_4) @[matu.scala 183:60]
    node _MatchVec_2_3_T = eq(deqptrReg_3, robIdxReg_2) @[matu.scala 207:52]
    node _MatchVec_2_3_T_1 = bits(_MatchVec_2_3_T, 0, 0) @[matu.scala 207:70]
    node _MatchVec_2_3_T_2 = and(validReg_2, _MatchVec_2_3_T_1) @[matu.scala 207:35]
    node MatchVec_2_3 = _MatchVec_2_3_T_2 @[matu.scala 182:22 207:20]
    node matchVecUInt_hi_2 = cat(matchVecUInt_hi_hi_2, MatchVec_2_3) @[matu.scala 183:60]
    node _matchVecUInt_T_2 = cat(matchVecUInt_hi_2, matchVecUInt_lo_2) @[matu.scala 183:60]
    reg validReg_3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), validReg_3) @[matu.scala 184:25]
    reg robIdxReg_3 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), robIdxReg_3) @[matu.scala 187:22]
    node _MatchVec_3_2_T = eq(deqptrReg_2, robIdxReg_3) @[matu.scala 208:52]
    node _MatchVec_3_2_T_1 = bits(_MatchVec_3_2_T, 0, 0) @[matu.scala 208:70]
    node _MatchVec_3_2_T_2 = and(validReg_3, _MatchVec_3_2_T_1) @[matu.scala 208:35]
    node MatchVec_3_2 = _MatchVec_3_2_T_2 @[matu.scala 182:22 208:20]
    node _MatchVec_3_1_T = eq(deqptrReg_1, robIdxReg_3) @[matu.scala 208:52]
    node _MatchVec_3_1_T_1 = bits(_MatchVec_3_1_T, 0, 0) @[matu.scala 208:70]
    node _MatchVec_3_1_T_2 = and(validReg_3, _MatchVec_3_1_T_1) @[matu.scala 208:35]
    node MatchVec_3_1 = _MatchVec_3_1_T_2 @[matu.scala 182:22 208:20]
    node matchVecUInt_lo_hi_3 = cat(MatchVec_3_2, MatchVec_3_1) @[matu.scala 183:60]
    node _MatchVec_3_0_T = eq(deqptrReg_0, robIdxReg_3) @[matu.scala 208:52]
    node _MatchVec_3_0_T_1 = bits(_MatchVec_3_0_T, 0, 0) @[matu.scala 208:70]
    node _MatchVec_3_0_T_2 = and(validReg_3, _MatchVec_3_0_T_1) @[matu.scala 208:35]
    node MatchVec_3_0 = _MatchVec_3_0_T_2 @[matu.scala 182:22 208:20]
    node matchVecUInt_lo_3 = cat(matchVecUInt_lo_hi_3, MatchVec_3_0) @[matu.scala 183:60]
    node _MatchVec_3_5_T = eq(deqptrReg_5, robIdxReg_3) @[matu.scala 208:52]
    node _MatchVec_3_5_T_1 = bits(_MatchVec_3_5_T, 0, 0) @[matu.scala 208:70]
    node _MatchVec_3_5_T_2 = and(validReg_3, _MatchVec_3_5_T_1) @[matu.scala 208:35]
    node MatchVec_3_5 = _MatchVec_3_5_T_2 @[matu.scala 182:22 208:20]
    node _MatchVec_3_4_T = eq(deqptrReg_4, robIdxReg_3) @[matu.scala 208:52]
    node _MatchVec_3_4_T_1 = bits(_MatchVec_3_4_T, 0, 0) @[matu.scala 208:70]
    node _MatchVec_3_4_T_2 = and(validReg_3, _MatchVec_3_4_T_1) @[matu.scala 208:35]
    node MatchVec_3_4 = _MatchVec_3_4_T_2 @[matu.scala 182:22 208:20]
    node matchVecUInt_hi_hi_3 = cat(MatchVec_3_5, MatchVec_3_4) @[matu.scala 183:60]
    node _MatchVec_3_3_T = eq(deqptrReg_3, robIdxReg_3) @[matu.scala 208:52]
    node _MatchVec_3_3_T_1 = bits(_MatchVec_3_3_T, 0, 0) @[matu.scala 208:70]
    node _MatchVec_3_3_T_2 = and(validReg_3, _MatchVec_3_3_T_1) @[matu.scala 208:35]
    node MatchVec_3_3 = _MatchVec_3_3_T_2 @[matu.scala 182:22 208:20]
    node matchVecUInt_hi_3 = cat(matchVecUInt_hi_hi_3, MatchVec_3_3) @[matu.scala 183:60]
    node _matchVecUInt_T_3 = cat(matchVecUInt_hi_3, matchVecUInt_lo_3) @[matu.scala 183:60]
    reg dataReg_0 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), dataReg_0) @[matu.scala 185:24]
    reg dataReg_1 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), dataReg_1) @[matu.scala 185:24]
    reg dataReg_2 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), dataReg_2) @[matu.scala 185:24]
    reg dataReg_3 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), dataReg_3) @[matu.scala 185:24]
    node _validReg_0_T = eq(io_ldin_fuOptype_0, UInt<3>("h7")) @[matu.scala 190:39]
    node _validReg_0_T_1 = eq(io_ldin_valid_0, UInt<1>("h1")) @[matu.scala 190:69]
    node _validReg_0_T_2 = and(_validReg_0_T, _validReg_0_T_1) @[matu.scala 190:48]
    node _validReg_1_T = eq(io_ldin_fuOptype_1, UInt<3>("h7")) @[matu.scala 191:39]
    node _validReg_1_T_1 = eq(io_ldin_valid_0, UInt<1>("h1")) @[matu.scala 191:69]
    node _validReg_1_T_2 = and(_validReg_1_T, _validReg_1_T_1) @[matu.scala 191:48]
    node validReg_2_lo_hi = cat(MatchVec_0_2, MatchVec_0_1) @[matu.scala 192:40]
    node validReg_2_lo = cat(validReg_2_lo_hi, MatchVec_0_0) @[matu.scala 192:40]
    node validReg_2_hi_hi = cat(MatchVec_0_5, MatchVec_0_4) @[matu.scala 192:40]
    node validReg_2_hi = cat(validReg_2_hi_hi, MatchVec_0_3) @[matu.scala 192:40]
    node _validReg_2_T = cat(validReg_2_hi, validReg_2_lo) @[matu.scala 192:40]
    node _validReg_2_T_1 = orr(_validReg_2_T) @[matu.scala 192:46]
    node _validReg_2_T_2 = mux(_validReg_2_T_1, UInt<1>("h0"), validReg_0) @[matu.scala 192:21]
    node validReg_2_lo_hi_1 = cat(MatchVec_2_2, MatchVec_2_1) @[matu.scala 192:96]
    node validReg_2_lo_1 = cat(validReg_2_lo_hi_1, MatchVec_2_0) @[matu.scala 192:96]
    node validReg_2_hi_hi_1 = cat(MatchVec_2_5, MatchVec_2_4) @[matu.scala 192:96]
    node validReg_2_hi_1 = cat(validReg_2_hi_hi_1, MatchVec_2_3) @[matu.scala 192:96]
    node _validReg_2_T_3 = cat(validReg_2_hi_1, validReg_2_lo_1) @[matu.scala 192:96]
    node _validReg_2_T_4 = orr(_validReg_2_T_3) @[matu.scala 192:102]
    node _validReg_2_T_5 = mux(_validReg_2_T_4, UInt<1>("h0"), validReg_2) @[matu.scala 192:77]
    node _validReg_2_T_6 = or(_validReg_2_T_2, _validReg_2_T_5) @[matu.scala 192:72]
    node validReg_3_lo_hi = cat(MatchVec_1_2, MatchVec_1_1) @[matu.scala 193:40]
    node validReg_3_lo = cat(validReg_3_lo_hi, MatchVec_1_0) @[matu.scala 193:40]
    node validReg_3_hi_hi = cat(MatchVec_1_5, MatchVec_1_4) @[matu.scala 193:40]
    node validReg_3_hi = cat(validReg_3_hi_hi, MatchVec_1_3) @[matu.scala 193:40]
    node _validReg_3_T = cat(validReg_3_hi, validReg_3_lo) @[matu.scala 193:40]
    node _validReg_3_T_1 = orr(_validReg_3_T) @[matu.scala 193:46]
    node _validReg_3_T_2 = mux(_validReg_3_T_1, UInt<1>("h0"), validReg_1) @[matu.scala 193:21]
    node validReg_3_lo_hi_1 = cat(MatchVec_3_2, MatchVec_3_1) @[matu.scala 193:96]
    node validReg_3_lo_1 = cat(validReg_3_lo_hi_1, MatchVec_3_0) @[matu.scala 193:96]
    node validReg_3_hi_hi_1 = cat(MatchVec_3_5, MatchVec_3_4) @[matu.scala 193:96]
    node validReg_3_hi_1 = cat(validReg_3_hi_hi_1, MatchVec_3_3) @[matu.scala 193:96]
    node _validReg_3_T_3 = cat(validReg_3_hi_1, validReg_3_lo_1) @[matu.scala 193:96]
    node _validReg_3_T_4 = orr(_validReg_3_T_3) @[matu.scala 193:102]
    node _validReg_3_T_5 = mux(_validReg_3_T_4, UInt<1>("h0"), validReg_3) @[matu.scala 193:77]
    node _validReg_3_T_6 = or(_validReg_3_T_2, _validReg_3_T_5) @[matu.scala 193:72]
    node _dataReg_0_T = eq(io_ldin_fuOptype_0, UInt<3>("h7")) @[matu.scala 194:61]
    node _dataReg_0_T_1 = and(io_ldin_valid_0, _dataReg_0_T) @[matu.scala 194:38]
    node _dataReg_0_T_2 = mux(_dataReg_0_T_1, io_ldin_data_0, dataReg_0) @[matu.scala 194:20]
    node _dataReg_1_T = eq(io_ldin_fuOptype_1, UInt<3>("h7")) @[matu.scala 195:61]
    node _dataReg_1_T_1 = and(io_ldin_valid_1, _dataReg_1_T) @[matu.scala 195:38]
    node _dataReg_1_T_2 = mux(_dataReg_1_T_1, io_ldin_data_1, dataReg_1) @[matu.scala 195:20]
    node _robIdxReg_0_T = eq(io_ldin_fuOptype_0, UInt<3>("h7")) @[matu.scala 198:63]
    node _robIdxReg_0_T_1 = and(io_ldin_valid_0, _robIdxReg_0_T) @[matu.scala 198:40]
    node _robIdxReg_0_T_2 = mux(_robIdxReg_0_T_1, io_ldin_robIdx_0, robIdxReg_0) @[matu.scala 198:22]
    node _robIdxReg_1_T = eq(io_ldin_fuOptype_1, UInt<3>("h7")) @[matu.scala 199:63]
    node _robIdxReg_1_T_1 = and(io_ldin_valid_1, _robIdxReg_1_T) @[matu.scala 199:40]
    node _robIdxReg_1_T_2 = mux(_robIdxReg_1_T_1, io_ldin_robIdx_1, robIdxReg_1) @[matu.scala 199:22]
    node _matchVecUInt_WIRE_0 = _matchVecUInt_T @[matu.scala 183:{38,38}]
    node _matchVecUInt_WIRE_1 = _matchVecUInt_T_1 @[matu.scala 183:{38,38}]
    node _matchVecUInt_WIRE_2 = _matchVecUInt_T_2 @[matu.scala 183:{38,38}]
    node _matchVecUInt_WIRE_3 = _matchVecUInt_T_3 @[matu.scala 183:{38,38}]
    node matchVecUInt_0 = _matchVecUInt_WIRE_0
    node matchVecUInt_1 = _matchVecUInt_WIRE_1
    node matchVecUInt_2 = _matchVecUInt_WIRE_2
    node matchVecUInt_3 = _matchVecUInt_WIRE_3
    node _validReg_WIRE_0 = UInt<1>("h0") @[matu.scala 184:{33,33}]
    node _validReg_WIRE_1 = UInt<1>("h0") @[matu.scala 184:{33,33}]
    node _validReg_WIRE_2 = UInt<1>("h0") @[matu.scala 184:{33,33}]
    node _validReg_WIRE_3 = UInt<1>("h0") @[matu.scala 184:{33,33}]
    node _dataReg_WIRE_0 = UInt<64>("h0") @[matu.scala 185:{32,32}]
    node _dataReg_WIRE_1 = UInt<64>("h0") @[matu.scala 185:{32,32}]
    node _dataReg_WIRE_2 = UInt<64>("h0") @[matu.scala 185:{32,32}]
    node _dataReg_WIRE_3 = UInt<64>("h0") @[matu.scala 185:{32,32}]
    io_bufout_data_0 <= dataReg_0 @[matu.scala 210:18]
    io_bufout_data_1 <= dataReg_1 @[matu.scala 210:18]
    io_bufout_data_2 <= dataReg_2 @[matu.scala 210:18]
    io_bufout_data_3 <= dataReg_3 @[matu.scala 210:18]
    io_bufout_MatchVec_0 <= matchVecUInt_0 @[matu.scala 212:22]
    io_bufout_MatchVec_1 <= matchVecUInt_1 @[matu.scala 212:22]
    io_bufout_MatchVec_2 <= matchVecUInt_2 @[matu.scala 212:22]
    io_bufout_MatchVec_3 <= matchVecUInt_3 @[matu.scala 212:22]
    io_bufout_valid_0 <= validReg_0 @[matu.scala 211:19]
    io_bufout_valid_1 <= validReg_1 @[matu.scala 211:19]
    io_bufout_valid_2 <= validReg_2 @[matu.scala 211:19]
    io_bufout_valid_3 <= validReg_3 @[matu.scala 211:19]
    validReg_0 <= mux(reset, _validReg_WIRE_0, _validReg_0_T_2) @[matu.scala 184:{25,25} 190:15]
    validReg_1 <= mux(reset, _validReg_WIRE_1, _validReg_1_T_2) @[matu.scala 184:{25,25} 191:15]
    validReg_2 <= mux(reset, _validReg_WIRE_2, _validReg_2_T_6) @[matu.scala 184:{25,25} 192:15]
    validReg_3 <= mux(reset, _validReg_WIRE_3, _validReg_3_T_6) @[matu.scala 184:{25,25} 193:15]
    dataReg_0 <= mux(reset, _dataReg_WIRE_0, _dataReg_0_T_2) @[matu.scala 185:{24,24} 194:14]
    dataReg_1 <= mux(reset, _dataReg_WIRE_1, _dataReg_1_T_2) @[matu.scala 185:{24,24} 195:14]
    dataReg_2 <= mux(reset, _dataReg_WIRE_2, dataReg_0) @[matu.scala 185:{24,24} 196:14]
    dataReg_3 <= mux(reset, _dataReg_WIRE_3, dataReg_1) @[matu.scala 185:{24,24} 197:14]
    deqptrReg_0 <= io_deqptr_0 @[matu.scala 202:13]
    deqptrReg_1 <= io_deqptr_1 @[matu.scala 202:13]
    deqptrReg_2 <= io_deqptr_2 @[matu.scala 202:13]
    deqptrReg_3 <= io_deqptr_3 @[matu.scala 202:13]
    deqptrReg_4 <= io_deqptr_4 @[matu.scala 202:13]
    deqptrReg_5 <= io_deqptr_5 @[matu.scala 202:13]
    robIdxReg_0 <= _robIdxReg_0_T_2 @[matu.scala 198:16]
    robIdxReg_1 <= _robIdxReg_1_T_2 @[matu.scala 199:16]
    robIdxReg_2 <= robIdxReg_0 @[matu.scala 200:16]
    robIdxReg_3 <= robIdxReg_1 @[matu.scala 201:16]

  module SA_ROB :
    input clock : Clock
    input reset : UInt<1>
    input io_MatchVec_0 : UInt<6>
    input io_MatchVec_1 : UInt<6>
    input io_MatchVec_2 : UInt<6>
    input io_MatchVec_3 : UInt<6>
    input io_data_0 : UInt<64>
    input io_data_1 : UInt<64>
    input io_data_2 : UInt<64>
    input io_data_3 : UInt<64>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<64>

    reg mem_0 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), mem_0) @[matu.scala 232:20]
    reg mem_1 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), mem_1) @[matu.scala 232:20]
    reg mem_2 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), mem_2) @[matu.scala 232:20]
    reg mem_3 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), mem_3) @[matu.scala 232:20]
    reg matchVecReg_0 : UInt<6>, clock with :
      reset => (UInt<1>("h0"), matchVecReg_0) @[matu.scala 233:28]
    reg matchVecReg_1 : UInt<6>, clock with :
      reset => (UInt<1>("h0"), matchVecReg_1) @[matu.scala 233:28]
    reg matchVecReg_2 : UInt<6>, clock with :
      reset => (UInt<1>("h0"), matchVecReg_2) @[matu.scala 233:28]
    reg matchVecReg_3 : UInt<6>, clock with :
      reset => (UInt<1>("h0"), matchVecReg_3) @[matu.scala 233:28]
    reg matchVecMask_0 : UInt<6>, clock with :
      reset => (UInt<1>("h0"), matchVecMask_0) @[matu.scala 234:29]
    reg matchVecMask_1 : UInt<6>, clock with :
      reset => (UInt<1>("h0"), matchVecMask_1) @[matu.scala 234:29]
    reg matchVecMask_2 : UInt<6>, clock with :
      reset => (UInt<1>("h0"), matchVecMask_2) @[matu.scala 234:29]
    reg matchVecMask_3 : UInt<6>, clock with :
      reset => (UInt<1>("h0"), matchVecMask_3) @[matu.scala 234:29]
    node _io_out_valid_T = orr(matchVecReg_3) @[matu.scala 242:38]
    node _io_out_valid_T_1 = orr(matchVecReg_2) @[matu.scala 242:58]
    node _io_out_valid_T_2 = orr(matchVecReg_1) @[matu.scala 242:78]
    node _io_out_valid_T_3 = orr(matchVecReg_0) @[matu.scala 242:98]
    node io_out_valid_lo = cat(_io_out_valid_T_2, _io_out_valid_T_3) @[Cat.scala 33:92]
    node io_out_valid_hi = cat(_io_out_valid_T, _io_out_valid_T_1) @[Cat.scala 33:92]
    node _io_out_valid_T_4 = cat(io_out_valid_hi, io_out_valid_lo) @[Cat.scala 33:92]
    node _io_out_valid_T_5 = orr(_io_out_valid_T_4) @[matu.scala 242:103]
    node _T = eq(matchVecReg_0, UInt<1>("h0")) @[matu.scala 245:25]
    node _minMask_0_1_T = gt(matchVecMask_0, matchVecMask_1) @[matu.scala 259:38]
    node _minMask_0_1_T_1 = mux(_minMask_0_1_T, matchVecMask_1, matchVecMask_0) @[matu.scala 259:21]
    node minMask_0_1 = _minMask_0_1_T_1 @[matu.scala 237:25 259:15]
    node _minMask_2_3_T = gt(matchVecMask_2, matchVecMask_3) @[matu.scala 260:38]
    node _minMask_2_3_T_1 = mux(_minMask_2_3_T, matchVecMask_3, matchVecMask_2) @[matu.scala 260:21]
    node minMask_2_3 = _minMask_2_3_T_1 @[matu.scala 238:25 260:15]
    node _minMask_T = gt(minMask_0_1, minMask_2_3) @[matu.scala 261:30]
    node _minMask_T_1 = mux(_minMask_T, minMask_2_3, minMask_0_1) @[matu.scala 261:17]
    node minMask = _minMask_T_1 @[matu.scala 236:21 261:11]
    node _T_31 = eq(minMask, matchVecMask_3) @[matu.scala 263:18]
    node _T_30 = eq(minMask, matchVecMask_2) @[matu.scala 263:18]
    node _T_29 = eq(minMask, matchVecMask_1) @[matu.scala 263:18]
    node _T_28 = eq(minMask, matchVecMask_0) @[matu.scala 263:18]
    node _GEN_16 = mux(_T_28, UInt<1>("h0"), UInt<2>("h0")) @[matu.scala 263:38 264:15]
    node _GEN_17 = mux(_T_29, UInt<1>("h1"), _GEN_16) @[matu.scala 263:38 264:15]
    node _GEN_18 = mux(_T_30, UInt<2>("h2"), _GEN_17) @[matu.scala 263:38 264:15]
    node _GEN_19 = mux(_T_31, UInt<2>("h3"), _GEN_18) @[matu.scala 263:38 264:15]
    node minIndex = _GEN_19
    node _T_1 = eq(minIndex, UInt<1>("h0")) @[matu.scala 245:45]
    node _T_2 = or(_T, _T_1) @[matu.scala 245:33]
    node _GEN_0 = mux(_T_2, io_MatchVec_0, matchVecReg_0) @[matu.scala 245:54 246:22 233:28]
    node _GEN_1 = mux(_T_2, io_data_0, mem_0) @[matu.scala 245:54 247:14 232:20]
    node _T_3 = eq(matchVecReg_1, UInt<1>("h0")) @[matu.scala 245:25]
    node _T_4 = eq(minIndex, UInt<1>("h1")) @[matu.scala 245:45]
    node _T_5 = or(_T_3, _T_4) @[matu.scala 245:33]
    node _GEN_2 = mux(_T_5, io_MatchVec_1, matchVecReg_1) @[matu.scala 245:54 246:22 233:28]
    node _GEN_3 = mux(_T_5, io_data_1, mem_1) @[matu.scala 245:54 247:14 232:20]
    node _T_6 = eq(matchVecReg_2, UInt<1>("h0")) @[matu.scala 245:25]
    node _T_7 = eq(minIndex, UInt<2>("h2")) @[matu.scala 245:45]
    node _T_8 = or(_T_6, _T_7) @[matu.scala 245:33]
    node _GEN_4 = mux(_T_8, io_MatchVec_2, matchVecReg_2) @[matu.scala 245:54 246:22 233:28]
    node _GEN_5 = mux(_T_8, io_data_2, mem_2) @[matu.scala 245:54 247:14 232:20]
    node _T_9 = eq(matchVecReg_3, UInt<1>("h0")) @[matu.scala 245:25]
    node _T_10 = eq(minIndex, UInt<2>("h3")) @[matu.scala 245:45]
    node _T_11 = or(_T_9, _T_10) @[matu.scala 245:33]
    node _GEN_6 = mux(_T_11, io_MatchVec_3, matchVecReg_3) @[matu.scala 245:54 246:22 233:28]
    node _GEN_7 = mux(_T_11, io_data_3, mem_3) @[matu.scala 245:54 247:14 232:20]
    node _T_12 = eq(io_MatchVec_0, UInt<1>("h0")) @[matu.scala 252:25]
    node _T_13 = eq(matchVecReg_0, UInt<1>("h0")) @[matu.scala 252:51]
    node _T_14 = and(_T_12, _T_13) @[matu.scala 252:33]
    node _matchVecMask_0_T = not(io_MatchVec_0) @[matu.scala 253:26]
    node _T_15 = eq(matchVecReg_0, UInt<1>("h0")) @[matu.scala 254:31]
    node _GEN_8 = mux(_T_15, io_MatchVec_0, matchVecMask_0) @[matu.scala 254:40 255:23 234:29]
    node _GEN_9 = mux(_T_14, _matchVecMask_0_T, _GEN_8) @[matu.scala 252:60 253:23]
    node _T_16 = eq(io_MatchVec_1, UInt<1>("h0")) @[matu.scala 252:25]
    node _T_17 = eq(matchVecReg_1, UInt<1>("h0")) @[matu.scala 252:51]
    node _T_18 = and(_T_16, _T_17) @[matu.scala 252:33]
    node _matchVecMask_1_T = not(io_MatchVec_1) @[matu.scala 253:26]
    node _T_19 = eq(matchVecReg_1, UInt<1>("h0")) @[matu.scala 254:31]
    node _GEN_10 = mux(_T_19, io_MatchVec_1, matchVecMask_1) @[matu.scala 254:40 255:23 234:29]
    node _GEN_11 = mux(_T_18, _matchVecMask_1_T, _GEN_10) @[matu.scala 252:60 253:23]
    node _T_20 = eq(io_MatchVec_2, UInt<1>("h0")) @[matu.scala 252:25]
    node _T_21 = eq(matchVecReg_2, UInt<1>("h0")) @[matu.scala 252:51]
    node _T_22 = and(_T_20, _T_21) @[matu.scala 252:33]
    node _matchVecMask_2_T = not(io_MatchVec_2) @[matu.scala 253:26]
    node _T_23 = eq(matchVecReg_2, UInt<1>("h0")) @[matu.scala 254:31]
    node _GEN_12 = mux(_T_23, io_MatchVec_2, matchVecMask_2) @[matu.scala 254:40 255:23 234:29]
    node _GEN_13 = mux(_T_22, _matchVecMask_2_T, _GEN_12) @[matu.scala 252:60 253:23]
    node _T_24 = eq(io_MatchVec_3, UInt<1>("h0")) @[matu.scala 252:25]
    node _T_25 = eq(matchVecReg_3, UInt<1>("h0")) @[matu.scala 252:51]
    node _T_26 = and(_T_24, _T_25) @[matu.scala 252:33]
    node _matchVecMask_3_T = not(io_MatchVec_3) @[matu.scala 253:26]
    node _T_27 = eq(matchVecReg_3, UInt<1>("h0")) @[matu.scala 254:31]
    node _GEN_14 = mux(_T_27, io_MatchVec_3, matchVecMask_3) @[matu.scala 254:40 255:23 234:29]
    node _GEN_15 = mux(_T_26, _matchVecMask_3_T, _GEN_14) @[matu.scala 252:60 253:23]
    node _GEN_20 = validif(eq(UInt<1>("h0"), minIndex), matchVecReg_0) @[matu.scala 268:{31,31}]
    node _GEN_21 = mux(eq(UInt<1>("h1"), minIndex), matchVecReg_1, _GEN_20) @[matu.scala 268:{31,31}]
    node _GEN_22 = mux(eq(UInt<2>("h2"), minIndex), matchVecReg_2, _GEN_21) @[matu.scala 268:{31,31}]
    node _GEN_23 = mux(eq(UInt<2>("h3"), minIndex), matchVecReg_3, _GEN_22) @[matu.scala 268:{31,31}]
    node _matchVecReg_minIndex = _GEN_23 @[matu.scala 268:31]
    node _T_32 = gt(_matchVecReg_minIndex, UInt<1>("h0")) @[matu.scala 268:31]
    node _matchVecReg_minIndex_0 = UInt<6>("h0") @[matu.scala 269:{27,27}]
    node _GEN_24 = mux(eq(UInt<1>("h0"), minIndex), _matchVecReg_minIndex_0, _GEN_0) @[matu.scala 269:{27,27}]
    node _GEN_25 = mux(eq(UInt<1>("h1"), minIndex), _matchVecReg_minIndex_0, _GEN_2) @[matu.scala 269:{27,27}]
    node _GEN_26 = mux(eq(UInt<2>("h2"), minIndex), _matchVecReg_minIndex_0, _GEN_4) @[matu.scala 269:{27,27}]
    node _GEN_27 = mux(eq(UInt<2>("h3"), minIndex), _matchVecReg_minIndex_0, _GEN_6) @[matu.scala 269:{27,27}]
    node _GEN_28 = mux(_T_32, _GEN_24, _GEN_0) @[matu.scala 268:38]
    node _GEN_29 = mux(_T_32, _GEN_25, _GEN_2) @[matu.scala 268:38]
    node _GEN_30 = mux(_T_32, _GEN_26, _GEN_4) @[matu.scala 268:38]
    node _GEN_31 = mux(_T_32, _GEN_27, _GEN_6) @[matu.scala 268:38]
    node _GEN_32 = validif(eq(UInt<1>("h0"), minIndex), matchVecMask_0) @[matu.scala 271:{32,32}]
    node _GEN_33 = mux(eq(UInt<1>("h1"), minIndex), matchVecMask_1, _GEN_32) @[matu.scala 271:{32,32}]
    node _GEN_34 = mux(eq(UInt<2>("h2"), minIndex), matchVecMask_2, _GEN_33) @[matu.scala 271:{32,32}]
    node _GEN_35 = mux(eq(UInt<2>("h3"), minIndex), matchVecMask_3, _GEN_34) @[matu.scala 271:{32,32}]
    node _matchVecMask_minIndex = _GEN_35 @[matu.scala 271:32]
    node _T_33 = lt(_matchVecMask_minIndex, UInt<6>("h3f")) @[matu.scala 271:32]
    node _matchVecMask_minIndex_0 = UInt<6>("h3f") @[matu.scala 272:{28,28}]
    node _GEN_36 = mux(eq(UInt<1>("h0"), minIndex), _matchVecMask_minIndex_0, _GEN_9) @[matu.scala 272:{28,28}]
    node _GEN_37 = mux(eq(UInt<1>("h1"), minIndex), _matchVecMask_minIndex_0, _GEN_11) @[matu.scala 272:{28,28}]
    node _GEN_38 = mux(eq(UInt<2>("h2"), minIndex), _matchVecMask_minIndex_0, _GEN_13) @[matu.scala 272:{28,28}]
    node _GEN_39 = mux(eq(UInt<2>("h3"), minIndex), _matchVecMask_minIndex_0, _GEN_15) @[matu.scala 272:{28,28}]
    node _GEN_40 = mux(_T_33, _GEN_36, _GEN_9) @[matu.scala 271:40]
    node _GEN_41 = mux(_T_33, _GEN_37, _GEN_11) @[matu.scala 271:40]
    node _GEN_42 = mux(_T_33, _GEN_38, _GEN_13) @[matu.scala 271:40]
    node _GEN_43 = mux(_T_33, _GEN_39, _GEN_15) @[matu.scala 271:40]
    node _deq_T = orr(matchVecReg_3) @[matu.scala 275:29]
    node _deq_T_1 = orr(matchVecReg_2) @[matu.scala 275:49]
    node _deq_T_2 = orr(matchVecReg_1) @[matu.scala 275:69]
    node _deq_T_3 = orr(matchVecReg_0) @[matu.scala 275:89]
    node deq_lo = cat(_deq_T_2, _deq_T_3) @[Cat.scala 33:92]
    node deq_hi = cat(_deq_T, _deq_T_1) @[Cat.scala 33:92]
    node _deq_T_4 = cat(deq_hi, deq_lo) @[Cat.scala 33:92]
    node _deq_T_5 = orr(_deq_T_4) @[matu.scala 275:94]
    node _deq_T_6 = and(_deq_T_5, io_out_ready) @[matu.scala 275:98]
    node _GEN_44 = validif(eq(UInt<1>("h0"), minIndex), mem_0) @[matu.scala 278:{13,13}]
    node _GEN_45 = mux(eq(UInt<1>("h1"), minIndex), mem_1, _GEN_44) @[matu.scala 278:{13,13}]
    node _GEN_46 = mux(eq(UInt<2>("h2"), minIndex), mem_2, _GEN_45) @[matu.scala 278:{13,13}]
    node _GEN_47 = mux(eq(UInt<2>("h3"), minIndex), mem_3, _GEN_46) @[matu.scala 278:{13,13}]
    node deq = _deq_T_6
    node _mem_minIndex = _GEN_47 @[matu.scala 278:13]
    node _GEN_48 = mux(deq, _mem_minIndex, UInt<64>("h0")) @[matu.scala 277:13 278:13]
    node isEmpty = UInt<1>("h0")
    node _mem_WIRE_0 = UInt<64>("h0") @[matu.scala 232:{28,28}]
    node _mem_WIRE_1 = UInt<64>("h0") @[matu.scala 232:{28,28}]
    node _mem_WIRE_2 = UInt<64>("h0") @[matu.scala 232:{28,28}]
    node _mem_WIRE_3 = UInt<64>("h0") @[matu.scala 232:{28,28}]
    node _matchVecReg_WIRE_0 = UInt<6>("h0") @[matu.scala 233:{36,36}]
    node _matchVecReg_WIRE_1 = UInt<6>("h0") @[matu.scala 233:{36,36}]
    node _matchVecReg_WIRE_2 = UInt<6>("h0") @[matu.scala 233:{36,36}]
    node _matchVecReg_WIRE_3 = UInt<6>("h0") @[matu.scala 233:{36,36}]
    node _matchVecMask_WIRE_0 = UInt<6>("h3f") @[matu.scala 234:{37,37}]
    node _matchVecMask_WIRE_1 = UInt<6>("h3f") @[matu.scala 234:{37,37}]
    node _matchVecMask_WIRE_2 = UInt<6>("h3f") @[matu.scala 234:{37,37}]
    node _matchVecMask_WIRE_3 = UInt<6>("h3f") @[matu.scala 234:{37,37}]
    node deqData = _GEN_48
    io_out_valid <= _io_out_valid_T_5 @[matu.scala 242:16]
    io_out_bits <= deqData @[matu.scala 241:15]
    mem_0 <= mux(reset, _mem_WIRE_0, _GEN_1) @[matu.scala 232:{20,20}]
    mem_1 <= mux(reset, _mem_WIRE_1, _GEN_3) @[matu.scala 232:{20,20}]
    mem_2 <= mux(reset, _mem_WIRE_2, _GEN_5) @[matu.scala 232:{20,20}]
    mem_3 <= mux(reset, _mem_WIRE_3, _GEN_7) @[matu.scala 232:{20,20}]
    matchVecReg_0 <= mux(reset, _matchVecReg_WIRE_0, _GEN_28) @[matu.scala 233:{28,28}]
    matchVecReg_1 <= mux(reset, _matchVecReg_WIRE_1, _GEN_29) @[matu.scala 233:{28,28}]
    matchVecReg_2 <= mux(reset, _matchVecReg_WIRE_2, _GEN_30) @[matu.scala 233:{28,28}]
    matchVecReg_3 <= mux(reset, _matchVecReg_WIRE_3, _GEN_31) @[matu.scala 233:{28,28}]
    matchVecMask_0 <= mux(reset, _matchVecMask_WIRE_0, _GEN_40) @[matu.scala 234:{29,29}]
    matchVecMask_1 <= mux(reset, _matchVecMask_WIRE_1, _GEN_41) @[matu.scala 234:{29,29}]
    matchVecMask_2 <= mux(reset, _matchVecMask_WIRE_2, _GEN_42) @[matu.scala 234:{29,29}]
    matchVecMask_3 <= mux(reset, _matchVecMask_WIRE_3, _GEN_43) @[matu.scala 234:{29,29}]

  module SA_ROB_Wrapper :
    input clock : Clock
    input reset : UInt<1>
    input io_ldin_data_0 : UInt<64>
    input io_ldin_data_1 : UInt<64>
    input io_ldin_robIdx_0 : UInt<5>
    input io_ldin_robIdx_1 : UInt<5>
    input io_ldin_fuOptype_0 : UInt<3>
    input io_ldin_fuOptype_1 : UInt<3>
    input io_ldin_valid_0 : UInt<1>
    input io_ldin_valid_1 : UInt<1>
    input io_deqptr_0 : UInt<5>
    input io_deqptr_1 : UInt<5>
    input io_deqptr_2 : UInt<5>
    input io_deqptr_3 : UInt<5>
    input io_deqptr_4 : UInt<5>
    input io_deqptr_5 : UInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<64>

    inst ldBuff of ldBuffer @[matu.scala 142:22]
    inst rob of SA_ROB @[matu.scala 143:19]
    io_out_valid <= rob.io_out_valid @[matu.scala 153:16]
    io_out_bits <= rob.io_out_bits @[matu.scala 152:15]
    ldBuff.clock <= clock
    ldBuff.reset <= reset
    ldBuff.io_deqptr_0 <= io_deqptr_0 @[matu.scala 146:20]
    ldBuff.io_deqptr_1 <= io_deqptr_1 @[matu.scala 146:20]
    ldBuff.io_deqptr_2 <= io_deqptr_2 @[matu.scala 146:20]
    ldBuff.io_deqptr_3 <= io_deqptr_3 @[matu.scala 146:20]
    ldBuff.io_deqptr_4 <= io_deqptr_4 @[matu.scala 146:20]
    ldBuff.io_deqptr_5 <= io_deqptr_5 @[matu.scala 146:20]
    ldBuff.io_ldin_data_0 <= io_ldin_data_0 @[matu.scala 145:18]
    ldBuff.io_ldin_data_1 <= io_ldin_data_1 @[matu.scala 145:18]
    ldBuff.io_ldin_robIdx_0 <= io_ldin_robIdx_0 @[matu.scala 145:18]
    ldBuff.io_ldin_robIdx_1 <= io_ldin_robIdx_1 @[matu.scala 145:18]
    ldBuff.io_ldin_fuOptype_0 <= io_ldin_fuOptype_0 @[matu.scala 145:18]
    ldBuff.io_ldin_fuOptype_1 <= io_ldin_fuOptype_1 @[matu.scala 145:18]
    ldBuff.io_ldin_valid_0 <= io_ldin_valid_0 @[matu.scala 145:18]
    ldBuff.io_ldin_valid_1 <= io_ldin_valid_1 @[matu.scala 145:18]
    rob.clock <= clock
    rob.reset <= reset
    rob.io_MatchVec_0 <= ldBuff.io_bufout_MatchVec_0 @[matu.scala 148:19]
    rob.io_MatchVec_1 <= ldBuff.io_bufout_MatchVec_1 @[matu.scala 148:19]
    rob.io_MatchVec_2 <= ldBuff.io_bufout_MatchVec_2 @[matu.scala 148:19]
    rob.io_MatchVec_3 <= ldBuff.io_bufout_MatchVec_3 @[matu.scala 148:19]
    rob.io_data_0 <= ldBuff.io_bufout_data_0 @[matu.scala 149:15]
    rob.io_data_1 <= ldBuff.io_bufout_data_1 @[matu.scala 149:15]
    rob.io_data_2 <= ldBuff.io_bufout_data_2 @[matu.scala 149:15]
    rob.io_data_3 <= ldBuff.io_bufout_data_3 @[matu.scala 149:15]
    rob.io_out_ready <= io_out_ready @[matu.scala 154:20]
