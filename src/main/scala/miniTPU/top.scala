package miniTPU

import chisel3._
import chisel3.stage._
import miniTPU.DataBuffer._
import miniTPU.SystolicArray._


class top (val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Module {
  val io = IO(new Bundle {
    val ctrl_data_in = Input(Bool())
    val in_a = Input(Vec(SA_ROWS, UInt(IN_WIDTH.W)))
    val in_b = Input(Vec(SA_COLS, UInt(IN_WIDTH.W)))
    val in_c = Input(Vec(SA_COLS, UInt(C_WIDTH.W)))

    val valid = Output(Bool())                        // todo decoupledIO
    val done  = Output(Bool())
    val out_c = Output(Vec(SA_COLS, UInt(C_WIDTH.W)))
  })

  val sa = Module(new SystolicArray(IN_WIDTH,C_WIDTH,SA_ROWS,SA_COLS))
  val controller = Module(new Controller(SA_ROWS, SA_COLS))
  // horizontal and vertical data buffer
  val inBuffer_h   = Module(new InputBuffer(IN_WIDTH, SA_COLS, SA_ROWS))
  val inBuffer_v  = Module(new InputBuffer(IN_WIDTH, SA_COLS, SA_ROWS)) // TODO: add control logic to select data( B or D)
  val outBuffer  = Module(new OutputBuffer(C_WIDTH, SA_COLS, SA_ROWS))


  inBuffer_h.io.data_in := io.in_a
  inBuffer_v.io.data_in := io.in_b

  sa.io.in_a := inBuffer_h.io.data_out
  sa.io.in_b := inBuffer_v.io.data_out
  sa.io.in_c := io.in_c                 // TODO: preload in_c as bias



  for (c <- 0 until SA_COLS) {
    sa.io.in_control(c).done := controller.io.cal_done
  }
  controller.io.start := inBuffer_h.io.cal_start & inBuffer_v.io.cal_start

  controller.io.ctrl_data_in := io.ctrl_data_in
  controller.io.in_done := inBuffer_h.io.data_in_done & inBuffer_v.io.data_in_done


  inBuffer_h.io.ctrl_data_in := io.ctrl_data_in
  inBuffer_h.io.ctrl_data_out := controller.io.ctrl_data_out
  inBuffer_v.io.ctrl_data_in := io.ctrl_data_in
  inBuffer_v.io.ctrl_data_out := controller.io.ctrl_data_out


  outBuffer.io.ctrl_data_in := controller.io.cal_valid
  outBuffer.io.ctrl_data_out := controller.io.out_done
  outBuffer.io.data_in := sa.io.out_c

  io.valid := outBuffer.io.data_in_done
  io.done  := outBuffer.io.data_out_done
  io.out_c := outBuffer.io.data_out
}
