circuit InputBuffer :
  module MultiPortFIFO :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : UInt<1>, flip deq : UInt<1>, flip enqData : SInt<8>[8], deqData : SInt<8>, full : UInt<1>, empty : UInt<1>}

    wire _mem_WIRE : SInt<8>[8] @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[0] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[1] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[2] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[3] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[4] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[5] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[6] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[7] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    reg mem : SInt<8>[8], clock with :
      reset => (reset, _mem_WIRE) @[MultiPortFIFO.scala 16:20]
    reg readPtr : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[MultiPortFIFO.scala 18:24]
    reg writePtr : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[MultiPortFIFO.scala 19:25]
    wire isFull : UInt<1>
    isFull <= UInt<1>("h0")
    wire isEmpty : UInt<1>
    isEmpty <= UInt<1>("h0")
    wire deqData : SInt<8>
    deqData <= asSInt(UInt<8>("h0"))
    node _isEmpty_T = eq(readPtr, writePtr) @[MultiPortFIFO.scala 25:22]
    isEmpty <= _isEmpty_T @[MultiPortFIFO.scala 25:11]
    node _isFull_T = bits(writePtr, 3, 3) @[MultiPortFIFO.scala 26:38]
    node _isFull_T_1 = not(_isFull_T) @[MultiPortFIFO.scala 26:29]
    node _isFull_T_2 = bits(writePtr, 2, 0) @[MultiPortFIFO.scala 26:60]
    node _isFull_T_3 = cat(_isFull_T_1, _isFull_T_2) @[Cat.scala 33:92]
    node _isFull_T_4 = eq(readPtr, _isFull_T_3) @[MultiPortFIFO.scala 26:21]
    isFull <= _isFull_T_4 @[MultiPortFIFO.scala 26:10]
    node _T = eq(isFull, UInt<1>("h0")) @[MultiPortFIFO.scala 28:18]
    node _T_1 = and(io.enq, _T) @[MultiPortFIFO.scala 28:15]
    when _T_1 : @[MultiPortFIFO.scala 28:27]
      mem <= io.enqData @[MultiPortFIFO.scala 29:9]
      node _writePtr_T = add(writePtr, UInt<4>("h8")) @[MultiPortFIFO.scala 30:26]
      node _writePtr_T_1 = tail(_writePtr_T, 1) @[MultiPortFIFO.scala 30:26]
      writePtr <= _writePtr_T_1 @[MultiPortFIFO.scala 30:14]
    node _T_2 = eq(isEmpty, UInt<1>("h0")) @[MultiPortFIFO.scala 33:18]
    node _T_3 = and(io.deq, _T_2) @[MultiPortFIFO.scala 33:15]
    when _T_3 : @[MultiPortFIFO.scala 33:28]
      node _readPtr_T = add(readPtr, UInt<1>("h1")) @[MultiPortFIFO.scala 34:24]
      node _readPtr_T_1 = tail(_readPtr_T, 1) @[MultiPortFIFO.scala 34:24]
      readPtr <= _readPtr_T_1 @[MultiPortFIFO.scala 34:13]
      node _deqData_T = bits(readPtr, 2, 0)
      deqData <= mem[_deqData_T] @[MultiPortFIFO.scala 35:13]
    io.deqData <= deqData @[MultiPortFIFO.scala 38:14]
    io.full <= isFull @[MultiPortFIFO.scala 39:11]
    io.empty <= isEmpty @[MultiPortFIFO.scala 40:12]

  module MultiPortFIFO_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : UInt<1>, flip deq : UInt<1>, flip enqData : SInt<8>[8], deqData : SInt<8>, full : UInt<1>, empty : UInt<1>}

    wire _mem_WIRE : SInt<8>[8] @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[0] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[1] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[2] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[3] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[4] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[5] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[6] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    _mem_WIRE[7] <= asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:28]
    reg mem : SInt<8>[8], clock with :
      reset => (reset, _mem_WIRE) @[MultiPortFIFO.scala 16:20]
    reg readPtr : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[MultiPortFIFO.scala 18:24]
    reg writePtr : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[MultiPortFIFO.scala 19:25]
    wire isFull : UInt<1>
    isFull <= UInt<1>("h0")
    wire isEmpty : UInt<1>
    isEmpty <= UInt<1>("h0")
    wire deqData : SInt<8>
    deqData <= asSInt(UInt<8>("h0"))
    node _isEmpty_T = eq(readPtr, writePtr) @[MultiPortFIFO.scala 25:22]
    isEmpty <= _isEmpty_T @[MultiPortFIFO.scala 25:11]
    node _isFull_T = bits(writePtr, 3, 3) @[MultiPortFIFO.scala 26:38]
    node _isFull_T_1 = not(_isFull_T) @[MultiPortFIFO.scala 26:29]
    node _isFull_T_2 = bits(writePtr, 2, 0) @[MultiPortFIFO.scala 26:60]
    node _isFull_T_3 = cat(_isFull_T_1, _isFull_T_2) @[Cat.scala 33:92]
    node _isFull_T_4 = eq(readPtr, _isFull_T_3) @[MultiPortFIFO.scala 26:21]
    isFull <= _isFull_T_4 @[MultiPortFIFO.scala 26:10]
    node _T = eq(isFull, UInt<1>("h0")) @[MultiPortFIFO.scala 28:18]
    node _T_1 = and(io.enq, _T) @[MultiPortFIFO.scala 28:15]
    when _T_1 : @[MultiPortFIFO.scala 28:27]
      mem <= io.enqData @[MultiPortFIFO.scala 29:9]
      node _writePtr_T = add(writePtr, UInt<4>("h8")) @[MultiPortFIFO.scala 30:26]
      node _writePtr_T_1 = tail(_writePtr_T, 1) @[MultiPortFIFO.scala 30:26]
      writePtr <= _writePtr_T_1 @[MultiPortFIFO.scala 30:14]
    node _T_2 = eq(isEmpty, UInt<1>("h0")) @[MultiPortFIFO.scala 33:18]
    node _T_3 = and(io.deq, _T_2) @[MultiPortFIFO.scala 33:15]
    when _T_3 : @[MultiPortFIFO.scala 33:28]
      node _readPtr_T = add(readPtr, UInt<1>("h1")) @[MultiPortFIFO.scala 34:24]
      node _readPtr_T_1 = tail(_readPtr_T, 1) @[MultiPortFIFO.scala 34:24]
      readPtr <= _readPtr_T_1 @[MultiPortFIFO.scala 34:13]
      node _deqData_T = bits(readPtr, 2, 0)
      deqData <= mem[_deqData_T] @[MultiPortFIFO.scala 35:13]
    io.deqData <= deqData @[MultiPortFIFO.scala 38:14]
    io.full <= isFull @[MultiPortFIFO.scala 39:11]
    io.empty <= isEmpty @[MultiPortFIFO.scala 40:12]

  module InputBuffer :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ctrl_ib_data_out : UInt<1>, flip data_in : { flip ready : UInt<1>, valid : UInt<1>, bits : SInt<8>[8][2]}, data_out : SInt<8>[2], ib_data_in_done : UInt<1>}

    inst data_queue_0 of MultiPortFIFO @[InputBuffer.scala 16:46]
    data_queue_0.clock <= clock
    data_queue_0.reset <= reset
    inst data_queue_1 of MultiPortFIFO_1 @[InputBuffer.scala 16:46]
    data_queue_1.clock <= clock
    data_queue_1.reset <= reset
    reg delay_count : UInt<1>[2], clock with :
      reset => (UInt<1>("h0"), delay_count) @[InputBuffer.scala 19:24]
    wire ib_data_in_done : UInt<1>
    ib_data_in_done <= UInt<1>("h0")
    io.ib_data_in_done <= ib_data_in_done @[InputBuffer.scala 22:22]
    wire allFull : UInt<1>
    allFull <= UInt<1>("h0")
    wire allEmpty : UInt<1>
    allEmpty <= UInt<1>("h0")
    node _allFull_T = and(data_queue_0.io.full, data_queue_1.io.full) @[InputBuffer.scala 26:49]
    allFull <= _allFull_T @[InputBuffer.scala 26:11]
    node _allEmpty_T = and(data_queue_0.io.empty, data_queue_1.io.empty) @[InputBuffer.scala 27:51]
    allEmpty <= _allEmpty_T @[InputBuffer.scala 27:12]
    reg state : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[InputBuffer.scala 30:22]
    node _data_queue_0_io_enq_T = and(io.data_in.ready, io.data_in.valid) @[Decoupled.scala 52:35]
    data_queue_0.io.enq <= _data_queue_0_io_enq_T @[InputBuffer.scala 33:26]
    node _data_queue_0_io_deq_T = eq(state, UInt<1>("h1")) @[InputBuffer.scala 34:35]
    node _data_queue_0_io_deq_T_1 = eq(delay_count[0], UInt<1>("h0")) @[InputBuffer.scala 34:66]
    node _data_queue_0_io_deq_T_2 = and(_data_queue_0_io_deq_T, _data_queue_0_io_deq_T_1) @[InputBuffer.scala 34:48]
    node _data_queue_0_io_deq_T_3 = eq(data_queue_0.io.empty, UInt<1>("h0")) @[InputBuffer.scala 34:77]
    node _data_queue_0_io_deq_T_4 = and(_data_queue_0_io_deq_T_2, _data_queue_0_io_deq_T_3) @[InputBuffer.scala 34:74]
    data_queue_0.io.deq <= _data_queue_0_io_deq_T_4 @[InputBuffer.scala 34:26]
    data_queue_0.io.enqData <= io.data_in.bits[0] @[InputBuffer.scala 35:30]
    io.data_out[0] <= data_queue_0.io.deqData @[InputBuffer.scala 36:20]
    node _data_queue_1_io_enq_T = and(io.data_in.ready, io.data_in.valid) @[Decoupled.scala 52:35]
    data_queue_1.io.enq <= _data_queue_1_io_enq_T @[InputBuffer.scala 33:26]
    node _data_queue_1_io_deq_T = eq(state, UInt<1>("h1")) @[InputBuffer.scala 34:35]
    node _data_queue_1_io_deq_T_1 = eq(delay_count[1], UInt<1>("h0")) @[InputBuffer.scala 34:66]
    node _data_queue_1_io_deq_T_2 = and(_data_queue_1_io_deq_T, _data_queue_1_io_deq_T_1) @[InputBuffer.scala 34:48]
    node _data_queue_1_io_deq_T_3 = eq(data_queue_1.io.empty, UInt<1>("h0")) @[InputBuffer.scala 34:77]
    node _data_queue_1_io_deq_T_4 = and(_data_queue_1_io_deq_T_2, _data_queue_1_io_deq_T_3) @[InputBuffer.scala 34:74]
    data_queue_1.io.deq <= _data_queue_1_io_deq_T_4 @[InputBuffer.scala 34:26]
    data_queue_1.io.enqData <= io.data_in.bits[1] @[InputBuffer.scala 35:30]
    io.data_out[1] <= data_queue_1.io.deqData @[InputBuffer.scala 36:20]
    node _io_data_in_ready_T = eq(state, UInt<1>("h0")) @[InputBuffer.scala 38:29]
    io.data_in.ready <= _io_data_in_ready_T @[InputBuffer.scala 38:20]
    node _T = eq(state, UInt<1>("h0")) @[InputBuffer.scala 40:14]
    when _T : @[InputBuffer.scala 40:27]
      when allFull : @[InputBuffer.scala 41:19]
        ib_data_in_done <= UInt<1>("h1") @[InputBuffer.scala 42:23]
        node _state_T = mux(io.ctrl_ib_data_out, UInt<1>("h1"), UInt<1>("h0")) @[InputBuffer.scala 43:19]
        state <= _state_T @[InputBuffer.scala 43:13]
      delay_count[0] <= UInt<1>("h0") @[InputBuffer.scala 46:22]
      delay_count[1] <= UInt<1>("h1") @[InputBuffer.scala 46:22]
    else :
      node _T_1 = eq(state, UInt<1>("h1")) @[InputBuffer.scala 48:20]
      when _T_1 : @[InputBuffer.scala 48:34]
        when allEmpty : @[InputBuffer.scala 49:20]
          state <= UInt<1>("h0") @[InputBuffer.scala 50:13]
        node _delay_count_0_T = neq(delay_count[0], UInt<1>("h0")) @[InputBuffer.scala 53:44]
        node _delay_count_0_T_1 = sub(delay_count[0], UInt<1>("h1")) @[InputBuffer.scala 53:68]
        node _delay_count_0_T_2 = tail(_delay_count_0_T_1, 1) @[InputBuffer.scala 53:68]
        node _delay_count_0_T_3 = mux(_delay_count_0_T, _delay_count_0_T_2, UInt<1>("h0")) @[InputBuffer.scala 53:28]
        delay_count[0] <= _delay_count_0_T_3 @[InputBuffer.scala 53:22]
        node _delay_count_1_T = neq(delay_count[1], UInt<1>("h0")) @[InputBuffer.scala 53:44]
        node _delay_count_1_T_1 = sub(delay_count[1], UInt<1>("h1")) @[InputBuffer.scala 53:68]
        node _delay_count_1_T_2 = tail(_delay_count_1_T_1, 1) @[InputBuffer.scala 53:68]
        node _delay_count_1_T_3 = mux(_delay_count_1_T, _delay_count_1_T_2, UInt<1>("h0")) @[InputBuffer.scala 53:28]
        delay_count[1] <= _delay_count_1_T_3 @[InputBuffer.scala 53:22]

