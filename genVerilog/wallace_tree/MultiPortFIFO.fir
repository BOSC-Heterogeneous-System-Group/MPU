circuit MultiPortFIFO :
  module MultiPortFIFO :
    input clock : Clock
    input reset : UInt<1>
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

