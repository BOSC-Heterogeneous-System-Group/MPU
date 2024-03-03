circuit MultiPortFIFO :
  module MultiPortFIFO :
    input clock : Clock
    input reset : UInt<1>
    input io_enq : UInt<1>
    input io_deq : UInt<1>
    input io_enqData_0 : SInt<8>
    input io_enqData_1 : SInt<8>
    input io_enqData_2 : SInt<8>
    input io_enqData_3 : SInt<8>
    input io_enqData_4 : SInt<8>
    input io_enqData_5 : SInt<8>
    input io_enqData_6 : SInt<8>
    input io_enqData_7 : SInt<8>
    output io_deqData : SInt<8>
    output io_full : UInt<1>
    output io_empty : UInt<1>

    reg mem_0 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_0) @[MultiPortFIFO.scala 16:20]
    reg mem_1 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_1) @[MultiPortFIFO.scala 16:20]
    reg mem_2 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_2) @[MultiPortFIFO.scala 16:20]
    reg mem_3 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_3) @[MultiPortFIFO.scala 16:20]
    reg mem_4 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_4) @[MultiPortFIFO.scala 16:20]
    reg mem_5 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_5) @[MultiPortFIFO.scala 16:20]
    reg mem_6 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_6) @[MultiPortFIFO.scala 16:20]
    reg mem_7 : SInt<8>, clock with :
      reset => (UInt<1>("h0"), mem_7) @[MultiPortFIFO.scala 16:20]
    reg readPtr : UInt<4>, clock with :
      reset => (UInt<1>("h0"), readPtr) @[MultiPortFIFO.scala 18:24]
    reg writePtr : UInt<4>, clock with :
      reset => (UInt<1>("h0"), writePtr) @[MultiPortFIFO.scala 19:25]
    node _isEmpty_T = eq(readPtr, writePtr) @[MultiPortFIFO.scala 25:22]
    node _isFull_T = bits(writePtr, 3, 3) @[MultiPortFIFO.scala 26:38]
    node _isFull_T_1 = not(_isFull_T) @[MultiPortFIFO.scala 26:29]
    node _isFull_T_2 = bits(writePtr, 2, 0) @[MultiPortFIFO.scala 26:60]
    node _isFull_T_3 = cat(_isFull_T_1, _isFull_T_2) @[Cat.scala 33:92]
    node _isFull_T_4 = eq(readPtr, _isFull_T_3) @[MultiPortFIFO.scala 26:21]
    node isFull = _isFull_T_4
    node _T = eq(isFull, UInt<1>("h0")) @[MultiPortFIFO.scala 28:18]
    node _T_1 = and(io_enq, _T) @[MultiPortFIFO.scala 28:15]
    node _writePtr_T = add(writePtr, UInt<4>("h8")) @[MultiPortFIFO.scala 30:26]
    node _writePtr_T_1 = tail(_writePtr_T, 1) @[MultiPortFIFO.scala 30:26]
    node _GEN_0 = mux(_T_1, io_enqData_0, mem_0) @[MultiPortFIFO.scala 16:20 28:27 29:9]
    node _GEN_1 = mux(_T_1, io_enqData_1, mem_1) @[MultiPortFIFO.scala 16:20 28:27 29:9]
    node _GEN_2 = mux(_T_1, io_enqData_2, mem_2) @[MultiPortFIFO.scala 16:20 28:27 29:9]
    node _GEN_3 = mux(_T_1, io_enqData_3, mem_3) @[MultiPortFIFO.scala 16:20 28:27 29:9]
    node _GEN_4 = mux(_T_1, io_enqData_4, mem_4) @[MultiPortFIFO.scala 16:20 28:27 29:9]
    node _GEN_5 = mux(_T_1, io_enqData_5, mem_5) @[MultiPortFIFO.scala 16:20 28:27 29:9]
    node _GEN_6 = mux(_T_1, io_enqData_6, mem_6) @[MultiPortFIFO.scala 16:20 28:27 29:9]
    node _GEN_7 = mux(_T_1, io_enqData_7, mem_7) @[MultiPortFIFO.scala 16:20 28:27 29:9]
    node _GEN_8 = mux(_T_1, _writePtr_T_1, writePtr) @[MultiPortFIFO.scala 28:27 30:14 19:25]
    node isEmpty = _isEmpty_T
    node _T_2 = eq(isEmpty, UInt<1>("h0")) @[MultiPortFIFO.scala 33:18]
    node _T_3 = and(io_deq, _T_2) @[MultiPortFIFO.scala 33:15]
    node _readPtr_T = add(readPtr, UInt<1>("h1")) @[MultiPortFIFO.scala 34:24]
    node _readPtr_T_1 = tail(_readPtr_T, 1) @[MultiPortFIFO.scala 34:24]
    node _deqData_T = bits(readPtr, 2, 0)
    node _GEN_9 = validif(eq(UInt<1>("h0"), _deqData_T), mem_0) @[MultiPortFIFO.scala 35:{13,13}]
    node _GEN_10 = mux(eq(UInt<1>("h1"), _deqData_T), mem_1, _GEN_9) @[MultiPortFIFO.scala 35:{13,13}]
    node _GEN_11 = mux(eq(UInt<2>("h2"), _deqData_T), mem_2, _GEN_10) @[MultiPortFIFO.scala 35:{13,13}]
    node _GEN_12 = mux(eq(UInt<2>("h3"), _deqData_T), mem_3, _GEN_11) @[MultiPortFIFO.scala 35:{13,13}]
    node _GEN_13 = mux(eq(UInt<3>("h4"), _deqData_T), mem_4, _GEN_12) @[MultiPortFIFO.scala 35:{13,13}]
    node _GEN_14 = mux(eq(UInt<3>("h5"), _deqData_T), mem_5, _GEN_13) @[MultiPortFIFO.scala 35:{13,13}]
    node _GEN_15 = mux(eq(UInt<3>("h6"), _deqData_T), mem_6, _GEN_14) @[MultiPortFIFO.scala 35:{13,13}]
    node _GEN_16 = mux(eq(UInt<3>("h7"), _deqData_T), mem_7, _GEN_15) @[MultiPortFIFO.scala 35:{13,13}]
    node _GEN_17 = mux(_T_3, _readPtr_T_1, readPtr) @[MultiPortFIFO.scala 33:28 34:13 18:24]
    node _mem_deqData_T = _GEN_16 @[MultiPortFIFO.scala 35:13]
    node _GEN_18 = mux(_T_3, _mem_deqData_T, asSInt(UInt<8>("h0"))) @[MultiPortFIFO.scala 33:28 35:13]
    node _mem_WIRE_0 = asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:{28,28}]
    node _mem_WIRE_1 = asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:{28,28}]
    node _mem_WIRE_2 = asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:{28,28}]
    node _mem_WIRE_3 = asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:{28,28}]
    node _mem_WIRE_4 = asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:{28,28}]
    node _mem_WIRE_5 = asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:{28,28}]
    node _mem_WIRE_6 = asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:{28,28}]
    node _mem_WIRE_7 = asSInt(UInt<8>("h0")) @[MultiPortFIFO.scala 16:{28,28}]
    node deqData = _GEN_18
    io_deqData <= deqData @[MultiPortFIFO.scala 38:14]
    io_full <= isFull @[MultiPortFIFO.scala 39:11]
    io_empty <= isEmpty @[MultiPortFIFO.scala 40:12]
    mem_0 <= mux(reset, _mem_WIRE_0, _GEN_0) @[MultiPortFIFO.scala 16:{20,20}]
    mem_1 <= mux(reset, _mem_WIRE_1, _GEN_1) @[MultiPortFIFO.scala 16:{20,20}]
    mem_2 <= mux(reset, _mem_WIRE_2, _GEN_2) @[MultiPortFIFO.scala 16:{20,20}]
    mem_3 <= mux(reset, _mem_WIRE_3, _GEN_3) @[MultiPortFIFO.scala 16:{20,20}]
    mem_4 <= mux(reset, _mem_WIRE_4, _GEN_4) @[MultiPortFIFO.scala 16:{20,20}]
    mem_5 <= mux(reset, _mem_WIRE_5, _GEN_5) @[MultiPortFIFO.scala 16:{20,20}]
    mem_6 <= mux(reset, _mem_WIRE_6, _GEN_6) @[MultiPortFIFO.scala 16:{20,20}]
    mem_7 <= mux(reset, _mem_WIRE_7, _GEN_7) @[MultiPortFIFO.scala 16:{20,20}]
    readPtr <= mux(reset, UInt<4>("h0"), _GEN_17) @[MultiPortFIFO.scala 18:{24,24}]
    writePtr <= mux(reset, UInt<4>("h0"), _GEN_8) @[MultiPortFIFO.scala 19:{25,25}]
