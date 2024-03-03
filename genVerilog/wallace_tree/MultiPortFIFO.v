module MultiPortFIFO(
  input        clock,
  input        reset,
  input        io_enq,
  input        io_deq,
  input  [7:0] io_enqData_0,
  input  [7:0] io_enqData_1,
  input  [7:0] io_enqData_2,
  input  [7:0] io_enqData_3,
  input  [7:0] io_enqData_4,
  input  [7:0] io_enqData_5,
  input  [7:0] io_enqData_6,
  input  [7:0] io_enqData_7,
  output [7:0] io_deqData,
  output       io_full,
  output       io_empty
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
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem_0; // @[MultiPortFIFO.scala 16:20]
  reg [7:0] mem_1; // @[MultiPortFIFO.scala 16:20]
  reg [7:0] mem_2; // @[MultiPortFIFO.scala 16:20]
  reg [7:0] mem_3; // @[MultiPortFIFO.scala 16:20]
  reg [7:0] mem_4; // @[MultiPortFIFO.scala 16:20]
  reg [7:0] mem_5; // @[MultiPortFIFO.scala 16:20]
  reg [7:0] mem_6; // @[MultiPortFIFO.scala 16:20]
  reg [7:0] mem_7; // @[MultiPortFIFO.scala 16:20]
  reg [3:0] readPtr; // @[MultiPortFIFO.scala 18:24]
  reg [3:0] writePtr; // @[MultiPortFIFO.scala 19:25]
  wire  isEmpty = readPtr == writePtr; // @[MultiPortFIFO.scala 25:22]
  wire  _isFull_T_1 = ~writePtr[3]; // @[MultiPortFIFO.scala 26:29]
  wire [3:0] _isFull_T_3 = {_isFull_T_1,writePtr[2:0]}; // @[Cat.scala 33:92]
  wire  isFull = readPtr == _isFull_T_3; // @[MultiPortFIFO.scala 26:21]
  wire [3:0] _writePtr_T_1 = writePtr + 4'h8; // @[MultiPortFIFO.scala 30:26]
  wire [3:0] _readPtr_T_1 = readPtr + 4'h1; // @[MultiPortFIFO.scala 34:24]
  wire [7:0] _GEN_10 = 3'h1 == readPtr[2:0] ? $signed(mem_1) : $signed(mem_0); // @[MultiPortFIFO.scala 35:{13,13}]
  wire [7:0] _GEN_11 = 3'h2 == readPtr[2:0] ? $signed(mem_2) : $signed(_GEN_10); // @[MultiPortFIFO.scala 35:{13,13}]
  wire [7:0] _GEN_12 = 3'h3 == readPtr[2:0] ? $signed(mem_3) : $signed(_GEN_11); // @[MultiPortFIFO.scala 35:{13,13}]
  wire [7:0] _GEN_13 = 3'h4 == readPtr[2:0] ? $signed(mem_4) : $signed(_GEN_12); // @[MultiPortFIFO.scala 35:{13,13}]
  wire [7:0] _GEN_14 = 3'h5 == readPtr[2:0] ? $signed(mem_5) : $signed(_GEN_13); // @[MultiPortFIFO.scala 35:{13,13}]
  wire [7:0] _GEN_15 = 3'h6 == readPtr[2:0] ? $signed(mem_6) : $signed(_GEN_14); // @[MultiPortFIFO.scala 35:{13,13}]
  wire [7:0] _GEN_16 = 3'h7 == readPtr[2:0] ? $signed(mem_7) : $signed(_GEN_15); // @[MultiPortFIFO.scala 35:{13,13}]
  assign io_deqData = io_deq & ~isEmpty ? $signed(_GEN_16) : $signed(8'sh0); // @[MultiPortFIFO.scala 33:28 35:13]
  assign io_full = readPtr == _isFull_T_3; // @[MultiPortFIFO.scala 26:21]
  assign io_empty = readPtr == writePtr; // @[MultiPortFIFO.scala 25:22]
  always @(posedge clock) begin
    if (reset) begin // @[MultiPortFIFO.scala 16:20]
      mem_0 <= 8'sh0; // @[MultiPortFIFO.scala 16:20]
    end else if (io_enq & ~isFull) begin // @[MultiPortFIFO.scala 28:27]
      mem_0 <= io_enqData_0; // @[MultiPortFIFO.scala 29:9]
    end
    if (reset) begin // @[MultiPortFIFO.scala 16:20]
      mem_1 <= 8'sh0; // @[MultiPortFIFO.scala 16:20]
    end else if (io_enq & ~isFull) begin // @[MultiPortFIFO.scala 28:27]
      mem_1 <= io_enqData_1; // @[MultiPortFIFO.scala 29:9]
    end
    if (reset) begin // @[MultiPortFIFO.scala 16:20]
      mem_2 <= 8'sh0; // @[MultiPortFIFO.scala 16:20]
    end else if (io_enq & ~isFull) begin // @[MultiPortFIFO.scala 28:27]
      mem_2 <= io_enqData_2; // @[MultiPortFIFO.scala 29:9]
    end
    if (reset) begin // @[MultiPortFIFO.scala 16:20]
      mem_3 <= 8'sh0; // @[MultiPortFIFO.scala 16:20]
    end else if (io_enq & ~isFull) begin // @[MultiPortFIFO.scala 28:27]
      mem_3 <= io_enqData_3; // @[MultiPortFIFO.scala 29:9]
    end
    if (reset) begin // @[MultiPortFIFO.scala 16:20]
      mem_4 <= 8'sh0; // @[MultiPortFIFO.scala 16:20]
    end else if (io_enq & ~isFull) begin // @[MultiPortFIFO.scala 28:27]
      mem_4 <= io_enqData_4; // @[MultiPortFIFO.scala 29:9]
    end
    if (reset) begin // @[MultiPortFIFO.scala 16:20]
      mem_5 <= 8'sh0; // @[MultiPortFIFO.scala 16:20]
    end else if (io_enq & ~isFull) begin // @[MultiPortFIFO.scala 28:27]
      mem_5 <= io_enqData_5; // @[MultiPortFIFO.scala 29:9]
    end
    if (reset) begin // @[MultiPortFIFO.scala 16:20]
      mem_6 <= 8'sh0; // @[MultiPortFIFO.scala 16:20]
    end else if (io_enq & ~isFull) begin // @[MultiPortFIFO.scala 28:27]
      mem_6 <= io_enqData_6; // @[MultiPortFIFO.scala 29:9]
    end
    if (reset) begin // @[MultiPortFIFO.scala 16:20]
      mem_7 <= 8'sh0; // @[MultiPortFIFO.scala 16:20]
    end else if (io_enq & ~isFull) begin // @[MultiPortFIFO.scala 28:27]
      mem_7 <= io_enqData_7; // @[MultiPortFIFO.scala 29:9]
    end
    if (reset) begin // @[MultiPortFIFO.scala 18:24]
      readPtr <= 4'h0; // @[MultiPortFIFO.scala 18:24]
    end else if (io_deq & ~isEmpty) begin // @[MultiPortFIFO.scala 33:28]
      readPtr <= _readPtr_T_1; // @[MultiPortFIFO.scala 34:13]
    end
    if (reset) begin // @[MultiPortFIFO.scala 19:25]
      writePtr <= 4'h0; // @[MultiPortFIFO.scala 19:25]
    end else if (io_enq & ~isFull) begin // @[MultiPortFIFO.scala 28:27]
      writePtr <= _writePtr_T_1; // @[MultiPortFIFO.scala 30:14]
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
  mem_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  mem_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  mem_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  mem_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  mem_4 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  mem_5 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  mem_6 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  mem_7 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  readPtr = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  writePtr = _RAND_9[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
