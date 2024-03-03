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
module InputBuffer(
  input        clock,
  input        reset,
  input        io_ctrl_ib_data_out,
  output       io_data_in_ready,
  input        io_data_in_valid,
  input  [7:0] io_data_in_bits_0_0,
  input  [7:0] io_data_in_bits_0_1,
  input  [7:0] io_data_in_bits_0_2,
  input  [7:0] io_data_in_bits_0_3,
  input  [7:0] io_data_in_bits_0_4,
  input  [7:0] io_data_in_bits_0_5,
  input  [7:0] io_data_in_bits_0_6,
  input  [7:0] io_data_in_bits_0_7,
  input  [7:0] io_data_in_bits_1_0,
  input  [7:0] io_data_in_bits_1_1,
  input  [7:0] io_data_in_bits_1_2,
  input  [7:0] io_data_in_bits_1_3,
  input  [7:0] io_data_in_bits_1_4,
  input  [7:0] io_data_in_bits_1_5,
  input  [7:0] io_data_in_bits_1_6,
  input  [7:0] io_data_in_bits_1_7,
  output [7:0] io_data_out_0,
  output [7:0] io_data_out_1,
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
  wire [7:0] data_queue_0_io_enqData_0; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_0_io_enqData_1; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_0_io_enqData_2; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_0_io_enqData_3; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_0_io_enqData_4; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_0_io_enqData_5; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_0_io_enqData_6; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_0_io_enqData_7; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_0_io_deqData; // @[InputBuffer.scala 16:46]
  wire  data_queue_0_io_full; // @[InputBuffer.scala 16:46]
  wire  data_queue_0_io_empty; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_clock; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_reset; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_io_enq; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_io_deq; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_1_io_enqData_0; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_1_io_enqData_1; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_1_io_enqData_2; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_1_io_enqData_3; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_1_io_enqData_4; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_1_io_enqData_5; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_1_io_enqData_6; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_1_io_enqData_7; // @[InputBuffer.scala 16:46]
  wire [7:0] data_queue_1_io_deqData; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_io_full; // @[InputBuffer.scala 16:46]
  wire  data_queue_1_io_empty; // @[InputBuffer.scala 16:46]
  reg  delay_count_1; // @[InputBuffer.scala 19:24]
  wire  allFull = data_queue_0_io_full & data_queue_1_io_full; // @[InputBuffer.scala 26:49]
  wire  allEmpty = data_queue_0_io_empty & data_queue_1_io_empty; // @[InputBuffer.scala 27:51]
  reg  state; // @[InputBuffer.scala 30:22]
  wire  _io_data_in_ready_T = ~state; // @[InputBuffer.scala 38:29]
  wire  _GEN_5 = state ? delay_count_1 & delay_count_1 - 1'h1 : delay_count_1; // @[InputBuffer.scala 48:34 53:22 19:24]
  MultiPortFIFO data_queue_0 ( // @[InputBuffer.scala 16:46]
    .clock(data_queue_0_clock),
    .reset(data_queue_0_reset),
    .io_enq(data_queue_0_io_enq),
    .io_deq(data_queue_0_io_deq),
    .io_enqData_0(data_queue_0_io_enqData_0),
    .io_enqData_1(data_queue_0_io_enqData_1),
    .io_enqData_2(data_queue_0_io_enqData_2),
    .io_enqData_3(data_queue_0_io_enqData_3),
    .io_enqData_4(data_queue_0_io_enqData_4),
    .io_enqData_5(data_queue_0_io_enqData_5),
    .io_enqData_6(data_queue_0_io_enqData_6),
    .io_enqData_7(data_queue_0_io_enqData_7),
    .io_deqData(data_queue_0_io_deqData),
    .io_full(data_queue_0_io_full),
    .io_empty(data_queue_0_io_empty)
  );
  MultiPortFIFO data_queue_1 ( // @[InputBuffer.scala 16:46]
    .clock(data_queue_1_clock),
    .reset(data_queue_1_reset),
    .io_enq(data_queue_1_io_enq),
    .io_deq(data_queue_1_io_deq),
    .io_enqData_0(data_queue_1_io_enqData_0),
    .io_enqData_1(data_queue_1_io_enqData_1),
    .io_enqData_2(data_queue_1_io_enqData_2),
    .io_enqData_3(data_queue_1_io_enqData_3),
    .io_enqData_4(data_queue_1_io_enqData_4),
    .io_enqData_5(data_queue_1_io_enqData_5),
    .io_enqData_6(data_queue_1_io_enqData_6),
    .io_enqData_7(data_queue_1_io_enqData_7),
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
  assign data_queue_0_io_enqData_0 = io_data_in_bits_0_0; // @[InputBuffer.scala 35:30]
  assign data_queue_0_io_enqData_1 = io_data_in_bits_0_1; // @[InputBuffer.scala 35:30]
  assign data_queue_0_io_enqData_2 = io_data_in_bits_0_2; // @[InputBuffer.scala 35:30]
  assign data_queue_0_io_enqData_3 = io_data_in_bits_0_3; // @[InputBuffer.scala 35:30]
  assign data_queue_0_io_enqData_4 = io_data_in_bits_0_4; // @[InputBuffer.scala 35:30]
  assign data_queue_0_io_enqData_5 = io_data_in_bits_0_5; // @[InputBuffer.scala 35:30]
  assign data_queue_0_io_enqData_6 = io_data_in_bits_0_6; // @[InputBuffer.scala 35:30]
  assign data_queue_0_io_enqData_7 = io_data_in_bits_0_7; // @[InputBuffer.scala 35:30]
  assign data_queue_1_clock = clock;
  assign data_queue_1_reset = reset;
  assign data_queue_1_io_enq = io_data_in_ready & io_data_in_valid; // @[Decoupled.scala 52:35]
  assign data_queue_1_io_deq = state & ~delay_count_1 & ~data_queue_1_io_empty; // @[InputBuffer.scala 34:74]
  assign data_queue_1_io_enqData_0 = io_data_in_bits_1_0; // @[InputBuffer.scala 35:30]
  assign data_queue_1_io_enqData_1 = io_data_in_bits_1_1; // @[InputBuffer.scala 35:30]
  assign data_queue_1_io_enqData_2 = io_data_in_bits_1_2; // @[InputBuffer.scala 35:30]
  assign data_queue_1_io_enqData_3 = io_data_in_bits_1_3; // @[InputBuffer.scala 35:30]
  assign data_queue_1_io_enqData_4 = io_data_in_bits_1_4; // @[InputBuffer.scala 35:30]
  assign data_queue_1_io_enqData_5 = io_data_in_bits_1_5; // @[InputBuffer.scala 35:30]
  assign data_queue_1_io_enqData_6 = io_data_in_bits_1_6; // @[InputBuffer.scala 35:30]
  assign data_queue_1_io_enqData_7 = io_data_in_bits_1_7; // @[InputBuffer.scala 35:30]
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
