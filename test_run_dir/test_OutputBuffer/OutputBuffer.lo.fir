circuit OutputBuffer :
  module SyncFIFO :
    input clock : Clock
    input reset : UInt<1>
    input io_enq : UInt<1>
    input io_deq : UInt<1>
    input io_enqData : UInt<32>
    output io_deqData : UInt<32>

    reg mem_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mem_0) @[SyncFIFO.scala 15:20]
    reg mem_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mem_1) @[SyncFIFO.scala 15:20]
    reg mem_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mem_2) @[SyncFIFO.scala 15:20]
    reg mem_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mem_3) @[SyncFIFO.scala 15:20]
    reg readPtr : UInt<3>, clock with :
      reset => (UInt<1>("h0"), readPtr) @[SyncFIFO.scala 18:24]
    reg writePtr : UInt<3>, clock with :
      reset => (UInt<1>("h0"), writePtr) @[SyncFIFO.scala 19:25]
    reg deqDateReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), deqDateReg) @[SyncFIFO.scala 20:27]
    reg isFull : UInt<1>, clock with :
      reset => (UInt<1>("h0"), isFull) @[SyncFIFO.scala 22:23]
    reg isEmpty : UInt<1>, clock with :
      reset => (UInt<1>("h0"), isEmpty) @[SyncFIFO.scala 23:24]
    node _isEmpty_T = eq(readPtr, writePtr) @[SyncFIFO.scala 25:22]
    node _isFull_T = bits(writePtr, 2, 2) @[SyncFIFO.scala 26:38]
    node _isFull_T_1 = not(_isFull_T) @[SyncFIFO.scala 26:29]
    node _isFull_T_2 = bits(writePtr, 1, 0) @[SyncFIFO.scala 26:60]
    node _isFull_T_3 = cat(_isFull_T_1, _isFull_T_2) @[Cat.scala 33:92]
    node _isFull_T_4 = eq(readPtr, _isFull_T_3) @[SyncFIFO.scala 26:21]
    node _T = eq(isFull, UInt<1>("h0")) @[SyncFIFO.scala 28:18]
    node _T_1 = and(io_enq, _T) @[SyncFIFO.scala 28:15]
    node _T_2 = bits(writePtr, 1, 0)
    node _mem_T_2 = io_enqData @[SyncFIFO.scala 29:{19,19}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), _T_2), _mem_T_2, mem_0) @[SyncFIFO.scala 29:{19,19} 15:20]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_2), _mem_T_2, mem_1) @[SyncFIFO.scala 29:{19,19} 15:20]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _T_2), _mem_T_2, mem_2) @[SyncFIFO.scala 29:{19,19} 15:20]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _T_2), _mem_T_2, mem_3) @[SyncFIFO.scala 29:{19,19} 15:20]
    node _writePtr_T = add(writePtr, UInt<1>("h1")) @[SyncFIFO.scala 30:26]
    node _writePtr_T_1 = tail(_writePtr_T, 1) @[SyncFIFO.scala 30:26]
    node _GEN_4 = mux(_T_1, _GEN_0, mem_0) @[SyncFIFO.scala 15:20 28:27]
    node _GEN_5 = mux(_T_1, _GEN_1, mem_1) @[SyncFIFO.scala 15:20 28:27]
    node _GEN_6 = mux(_T_1, _GEN_2, mem_2) @[SyncFIFO.scala 15:20 28:27]
    node _GEN_7 = mux(_T_1, _GEN_3, mem_3) @[SyncFIFO.scala 15:20 28:27]
    node _GEN_8 = mux(_T_1, _writePtr_T_1, writePtr) @[SyncFIFO.scala 28:27 30:14 19:25]
    node _T_3 = eq(isEmpty, UInt<1>("h0")) @[SyncFIFO.scala 33:18]
    node _T_4 = and(io_deq, _T_3) @[SyncFIFO.scala 33:15]
    node _deqDateReg_T = bits(readPtr, 1, 0)
    node _GEN_9 = validif(eq(UInt<1>("h0"), _deqDateReg_T), mem_0) @[SyncFIFO.scala 34:{16,16}]
    node _GEN_10 = mux(eq(UInt<1>("h1"), _deqDateReg_T), mem_1, _GEN_9) @[SyncFIFO.scala 34:{16,16}]
    node _GEN_11 = mux(eq(UInt<2>("h2"), _deqDateReg_T), mem_2, _GEN_10) @[SyncFIFO.scala 34:{16,16}]
    node _GEN_12 = mux(eq(UInt<2>("h3"), _deqDateReg_T), mem_3, _GEN_11) @[SyncFIFO.scala 34:{16,16}]
    node _readPtr_T = add(readPtr, UInt<1>("h1")) @[SyncFIFO.scala 35:24]
    node _readPtr_T_1 = tail(_readPtr_T, 1) @[SyncFIFO.scala 35:24]
    node _mem_deqDateReg_T = _GEN_12 @[SyncFIFO.scala 34:16]
    node _GEN_13 = mux(_T_4, _mem_deqDateReg_T, deqDateReg) @[SyncFIFO.scala 33:28 34:16 20:27]
    node _GEN_14 = mux(_T_4, _readPtr_T_1, readPtr) @[SyncFIFO.scala 33:28 35:13 18:24]
    node _mem_WIRE_0 = UInt<32>("h0") @[SyncFIFO.scala 15:{28,28}]
    node _mem_WIRE_1 = UInt<32>("h0") @[SyncFIFO.scala 15:{28,28}]
    node _mem_WIRE_2 = UInt<32>("h0") @[SyncFIFO.scala 15:{28,28}]
    node _mem_WIRE_3 = UInt<32>("h0") @[SyncFIFO.scala 15:{28,28}]
    io_deqData <= deqDateReg @[SyncFIFO.scala 38:14]
    mem_0 <= mux(reset, _mem_WIRE_0, _GEN_4) @[SyncFIFO.scala 15:{20,20}]
    mem_1 <= mux(reset, _mem_WIRE_1, _GEN_5) @[SyncFIFO.scala 15:{20,20}]
    mem_2 <= mux(reset, _mem_WIRE_2, _GEN_6) @[SyncFIFO.scala 15:{20,20}]
    mem_3 <= mux(reset, _mem_WIRE_3, _GEN_7) @[SyncFIFO.scala 15:{20,20}]
    readPtr <= mux(reset, UInt<3>("h0"), _GEN_14) @[SyncFIFO.scala 18:{24,24}]
    writePtr <= mux(reset, UInt<3>("h0"), _GEN_8) @[SyncFIFO.scala 19:{25,25}]
    deqDateReg <= mux(reset, UInt<32>("h0"), _GEN_13) @[SyncFIFO.scala 20:{27,27}]
    isFull <= mux(reset, UInt<1>("h0"), _isFull_T_4) @[SyncFIFO.scala 22:{23,23} 26:10]
    isEmpty <= mux(reset, UInt<1>("h0"), _isEmpty_T) @[SyncFIFO.scala 23:{24,24} 25:11]

  module OutputBuffer :
    input clock : Clock
    input reset : UInt<1>
    input io_ctrl_data_in : UInt<1>
    input io_ctrl_data_out : UInt<1>
    input io_data_in_0 : UInt<8>
    input io_data_in_1 : UInt<8>
    input io_data_in_2 : UInt<8>
    input io_data_in_3 : UInt<8>
    output io_data_out_0 : UInt<8>
    output io_data_out_1 : UInt<8>
    output io_data_out_2 : UInt<8>
    output io_data_out_3 : UInt<8>
    output io_data_in_done : UInt<1>
    output io_data_out_done : UInt<1>

    inst data_queue_0 of SyncFIFO @[OutputBuffer.scala 17:46]
    inst data_queue_1 of SyncFIFO @[OutputBuffer.scala 17:46]
    inst data_queue_2 of SyncFIFO @[OutputBuffer.scala 17:46]
    inst data_queue_3 of SyncFIFO @[OutputBuffer.scala 17:46]
    reg deq_count_0 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), deq_count_0) @[OutputBuffer.scala 20:22]
    reg deq_count_1 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), deq_count_1) @[OutputBuffer.scala 20:22]
    reg deq_count_2 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), deq_count_2) @[OutputBuffer.scala 20:22]
    reg deq_count_3 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), deq_count_3) @[OutputBuffer.scala 20:22]
    reg count_in_cycles : UInt<3>, clock with :
      reset => (UInt<1>("h0"), count_in_cycles) @[OutputBuffer.scala 23:32]
    reg count_out_cycles : UInt<3>, clock with :
      reset => (UInt<1>("h0"), count_out_cycles) @[OutputBuffer.scala 24:33]
    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[OutputBuffer.scala 27:22]
    node _data_queue_0_io_enq_T = eq(state, UInt<2>("h0")) @[OutputBuffer.scala 30:36]
    node _data_queue_0_io_enq_T_1 = and(_data_queue_0_io_enq_T, io_ctrl_data_in) @[OutputBuffer.scala 30:45]
    node _data_queue_0_io_enq_T_2 = eq(state, UInt<2>("h1")) @[OutputBuffer.scala 30:74]
    node _data_queue_0_io_enq_T_3 = or(_data_queue_0_io_enq_T_1, _data_queue_0_io_enq_T_2) @[OutputBuffer.scala 30:65]
    node _data_queue_0_io_deq_T = eq(state, UInt<2>("h2")) @[OutputBuffer.scala 31:35]
    node _data_queue_0_io_deq_T_1 = neq(deq_count_0, UInt<1>("h0")) @[OutputBuffer.scala 31:65]
    node _data_queue_0_io_deq_T_2 = and(_data_queue_0_io_deq_T, _data_queue_0_io_deq_T_1) @[OutputBuffer.scala 31:49]
    node _data_queue_1_io_enq_T = eq(state, UInt<2>("h0")) @[OutputBuffer.scala 30:36]
    node _data_queue_1_io_enq_T_1 = and(_data_queue_1_io_enq_T, io_ctrl_data_in) @[OutputBuffer.scala 30:45]
    node _data_queue_1_io_enq_T_2 = eq(state, UInt<2>("h1")) @[OutputBuffer.scala 30:74]
    node _data_queue_1_io_enq_T_3 = or(_data_queue_1_io_enq_T_1, _data_queue_1_io_enq_T_2) @[OutputBuffer.scala 30:65]
    node _data_queue_1_io_deq_T = eq(state, UInt<2>("h2")) @[OutputBuffer.scala 31:35]
    node _data_queue_1_io_deq_T_1 = neq(deq_count_1, UInt<1>("h0")) @[OutputBuffer.scala 31:65]
    node _data_queue_1_io_deq_T_2 = and(_data_queue_1_io_deq_T, _data_queue_1_io_deq_T_1) @[OutputBuffer.scala 31:49]
    node _data_queue_2_io_enq_T = eq(state, UInt<2>("h0")) @[OutputBuffer.scala 30:36]
    node _data_queue_2_io_enq_T_1 = and(_data_queue_2_io_enq_T, io_ctrl_data_in) @[OutputBuffer.scala 30:45]
    node _data_queue_2_io_enq_T_2 = eq(state, UInt<2>("h1")) @[OutputBuffer.scala 30:74]
    node _data_queue_2_io_enq_T_3 = or(_data_queue_2_io_enq_T_1, _data_queue_2_io_enq_T_2) @[OutputBuffer.scala 30:65]
    node _data_queue_2_io_deq_T = eq(state, UInt<2>("h2")) @[OutputBuffer.scala 31:35]
    node _data_queue_2_io_deq_T_1 = neq(deq_count_2, UInt<1>("h0")) @[OutputBuffer.scala 31:65]
    node _data_queue_2_io_deq_T_2 = and(_data_queue_2_io_deq_T, _data_queue_2_io_deq_T_1) @[OutputBuffer.scala 31:49]
    node _data_queue_3_io_enq_T = eq(state, UInt<2>("h0")) @[OutputBuffer.scala 30:36]
    node _data_queue_3_io_enq_T_1 = and(_data_queue_3_io_enq_T, io_ctrl_data_in) @[OutputBuffer.scala 30:45]
    node _data_queue_3_io_enq_T_2 = eq(state, UInt<2>("h1")) @[OutputBuffer.scala 30:74]
    node _data_queue_3_io_enq_T_3 = or(_data_queue_3_io_enq_T_1, _data_queue_3_io_enq_T_2) @[OutputBuffer.scala 30:65]
    node _data_queue_3_io_deq_T = eq(state, UInt<2>("h2")) @[OutputBuffer.scala 31:35]
    node _data_queue_3_io_deq_T_1 = neq(deq_count_3, UInt<1>("h0")) @[OutputBuffer.scala 31:65]
    node _data_queue_3_io_deq_T_2 = and(_data_queue_3_io_deq_T, _data_queue_3_io_deq_T_1) @[OutputBuffer.scala 31:49]
    node _T = eq(state, UInt<2>("h0")) @[OutputBuffer.scala 40:14]
    node _count_in_cycles_T = add(count_in_cycles, UInt<1>("h1")) @[OutputBuffer.scala 43:42]
    node _count_in_cycles_T_1 = tail(_count_in_cycles_T, 1) @[OutputBuffer.scala 43:42]
    node _GEN_0 = mux(io_ctrl_data_out, UInt<2>("h2"), state) @[OutputBuffer.scala 45:34 46:13 27:22]
    node _GEN_1 = mux(io_ctrl_data_in, _count_in_cycles_T_1, count_in_cycles) @[OutputBuffer.scala 42:27 43:23 23:32]
    node _GEN_2 = mux(io_ctrl_data_in, UInt<2>("h1"), _GEN_0) @[OutputBuffer.scala 42:27 44:13]
    node _T_1 = eq(state, UInt<2>("h1")) @[OutputBuffer.scala 52:20]
    node _T_2 = eq(count_in_cycles, UInt<2>("h3")) @[OutputBuffer.scala 54:26]
    node _count_in_cycles_T_2 = add(count_in_cycles, UInt<1>("h1")) @[OutputBuffer.scala 59:42]
    node _count_in_cycles_T_3 = tail(_count_in_cycles_T_2, 1) @[OutputBuffer.scala 59:42]
    node _GEN_3 = mux(_T_2, UInt<1>("h0"), _count_in_cycles_T_3) @[OutputBuffer.scala 54:49 55:23 59:23]
    node _GEN_4 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[OutputBuffer.scala 54:49 56:20]
    node _GEN_5 = mux(_T_2, UInt<2>("h0"), state) @[OutputBuffer.scala 54:49 57:13 27:22]
    node _T_3 = eq(count_out_cycles, UInt<3>("h4")) @[OutputBuffer.scala 64:27]
    node _count_out_cycles_T = add(count_out_cycles, UInt<1>("h1")) @[OutputBuffer.scala 69:44]
    node _count_out_cycles_T_1 = tail(_count_out_cycles_T, 1) @[OutputBuffer.scala 69:44]
    node _GEN_6 = mux(_T_3, UInt<1>("h0"), _count_out_cycles_T_1) @[OutputBuffer.scala 64:46 65:24 69:24]
    node _GEN_7 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[OutputBuffer.scala 64:46 66:21]
    node _GEN_8 = mux(_T_3, UInt<2>("h0"), state) @[OutputBuffer.scala 64:46 67:13 27:22]
    node _T_4 = neq(deq_count_0, UInt<1>("h0")) @[OutputBuffer.scala 74:25]
    node _deq_count_0_T = sub(deq_count_0, UInt<1>("h1")) @[OutputBuffer.scala 75:38]
    node _deq_count_0_T_1 = tail(_deq_count_0_T, 1) @[OutputBuffer.scala 75:38]
    node _GEN_9 = mux(_T_4, _deq_count_0_T_1, deq_count_0) @[OutputBuffer.scala 20:22 74:34 75:22]
    node _T_5 = neq(deq_count_1, UInt<1>("h0")) @[OutputBuffer.scala 74:25]
    node _deq_count_1_T = sub(deq_count_1, UInt<1>("h1")) @[OutputBuffer.scala 75:38]
    node _deq_count_1_T_1 = tail(_deq_count_1_T, 1) @[OutputBuffer.scala 75:38]
    node _GEN_10 = mux(_T_5, _deq_count_1_T_1, deq_count_1) @[OutputBuffer.scala 20:22 74:34 75:22]
    node _T_6 = neq(deq_count_2, UInt<1>("h0")) @[OutputBuffer.scala 74:25]
    node _deq_count_2_T = sub(deq_count_2, UInt<1>("h1")) @[OutputBuffer.scala 75:38]
    node _deq_count_2_T_1 = tail(_deq_count_2_T, 1) @[OutputBuffer.scala 75:38]
    node _GEN_11 = mux(_T_6, _deq_count_2_T_1, deq_count_2) @[OutputBuffer.scala 20:22 74:34 75:22]
    node _T_7 = neq(deq_count_3, UInt<1>("h0")) @[OutputBuffer.scala 74:25]
    node _deq_count_3_T = sub(deq_count_3, UInt<1>("h1")) @[OutputBuffer.scala 75:38]
    node _deq_count_3_T_1 = tail(_deq_count_3_T, 1) @[OutputBuffer.scala 75:38]
    node _GEN_12 = mux(_T_7, _deq_count_3_T_1, deq_count_3) @[OutputBuffer.scala 20:22 74:34 75:22]
    node _GEN_13 = mux(_T_1, _GEN_3, count_in_cycles) @[OutputBuffer.scala 23:32 52:33]
    node _GEN_14 = mux(_T_1, _GEN_4, UInt<1>("h0")) @[OutputBuffer.scala 52:33]
    node _GEN_15 = mux(_T_1, _GEN_5, _GEN_8) @[OutputBuffer.scala 52:33]
    node _GEN_16 = mux(_T_1, count_out_cycles, _GEN_6) @[OutputBuffer.scala 24:33 52:33]
    node _GEN_17 = mux(_T_1, UInt<1>("h0"), _GEN_7) @[OutputBuffer.scala 52:33]
    node _GEN_18 = mux(_T_1, deq_count_0, _GEN_9) @[OutputBuffer.scala 20:22 52:33]
    node _GEN_19 = mux(_T_1, deq_count_1, _GEN_10) @[OutputBuffer.scala 20:22 52:33]
    node _GEN_20 = mux(_T_1, deq_count_2, _GEN_11) @[OutputBuffer.scala 20:22 52:33]
    node _GEN_21 = mux(_T_1, deq_count_3, _GEN_12) @[OutputBuffer.scala 20:22 52:33]
    node _GEN_22 = mux(_T, _GEN_1, _GEN_13) @[OutputBuffer.scala 40:24]
    node _GEN_23 = mux(_T, _GEN_2, _GEN_15) @[OutputBuffer.scala 40:24]
    node _GEN_24 = mux(_T, UInt<3>("h4"), _GEN_18) @[OutputBuffer.scala 40:24 50:20]
    node _GEN_25 = mux(_T, UInt<3>("h4"), _GEN_19) @[OutputBuffer.scala 40:24 50:20]
    node _GEN_26 = mux(_T, UInt<3>("h4"), _GEN_20) @[OutputBuffer.scala 40:24 50:20]
    node _GEN_27 = mux(_T, UInt<3>("h4"), _GEN_21) @[OutputBuffer.scala 40:24 50:20]
    node _GEN_28 = mux(_T, UInt<1>("h0"), _GEN_14) @[OutputBuffer.scala 40:24]
    node _GEN_29 = mux(_T, count_out_cycles, _GEN_16) @[OutputBuffer.scala 40:24 24:33]
    node _GEN_30 = mux(_T, UInt<1>("h0"), _GEN_17) @[OutputBuffer.scala 40:24]
    node data_in_done = _GEN_28
    node data_out_done = _GEN_30
    io_data_out_0 <= bits(data_queue_0.io_deqData, 7, 0) @[OutputBuffer.scala 33:20]
    io_data_out_1 <= bits(data_queue_1.io_deqData, 7, 0) @[OutputBuffer.scala 33:20]
    io_data_out_2 <= bits(data_queue_2.io_deqData, 7, 0) @[OutputBuffer.scala 33:20]
    io_data_out_3 <= bits(data_queue_3.io_deqData, 7, 0) @[OutputBuffer.scala 33:20]
    io_data_in_done <= data_in_done @[OutputBuffer.scala 81:19]
    io_data_out_done <= data_out_done @[OutputBuffer.scala 82:20]
    data_queue_0.clock <= clock
    data_queue_0.reset <= reset
    data_queue_0.io_enq <= _data_queue_0_io_enq_T_3 @[OutputBuffer.scala 30:26]
    data_queue_0.io_deq <= _data_queue_0_io_deq_T_2 @[OutputBuffer.scala 31:26]
    data_queue_0.io_enqData <= pad(io_data_in_0, 32) @[OutputBuffer.scala 32:30]
    data_queue_1.clock <= clock
    data_queue_1.reset <= reset
    data_queue_1.io_enq <= _data_queue_1_io_enq_T_3 @[OutputBuffer.scala 30:26]
    data_queue_1.io_deq <= _data_queue_1_io_deq_T_2 @[OutputBuffer.scala 31:26]
    data_queue_1.io_enqData <= pad(io_data_in_1, 32) @[OutputBuffer.scala 32:30]
    data_queue_2.clock <= clock
    data_queue_2.reset <= reset
    data_queue_2.io_enq <= _data_queue_2_io_enq_T_3 @[OutputBuffer.scala 30:26]
    data_queue_2.io_deq <= _data_queue_2_io_deq_T_2 @[OutputBuffer.scala 31:26]
    data_queue_2.io_enqData <= pad(io_data_in_2, 32) @[OutputBuffer.scala 32:30]
    data_queue_3.clock <= clock
    data_queue_3.reset <= reset
    data_queue_3.io_enq <= _data_queue_3_io_enq_T_3 @[OutputBuffer.scala 30:26]
    data_queue_3.io_deq <= _data_queue_3_io_deq_T_2 @[OutputBuffer.scala 31:26]
    data_queue_3.io_enqData <= pad(io_data_in_3, 32) @[OutputBuffer.scala 32:30]
    deq_count_0 <= _GEN_24
    deq_count_1 <= _GEN_25
    deq_count_2 <= _GEN_26
    deq_count_3 <= _GEN_27
    count_in_cycles <= mux(reset, UInt<3>("h0"), _GEN_22) @[OutputBuffer.scala 23:{32,32}]
    count_out_cycles <= mux(reset, UInt<3>("h0"), _GEN_29) @[OutputBuffer.scala 24:{33,33}]
    state <= mux(reset, UInt<2>("h0"), _GEN_23) @[OutputBuffer.scala 27:{22,22}]
