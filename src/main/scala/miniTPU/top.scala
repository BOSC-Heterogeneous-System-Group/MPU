package miniTPU

import chisel3._
import chisel3.stage._
import chisel3.util._
import miniTPU.DataBuffer._
import miniTPU.SystolicArray._

class miniTPUInput(val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Bundle {
  val in_a = Input(Vec(SA_ROWS, SInt(IN_WIDTH.W)))
  val in_b = Input(Vec(SA_COLS, SInt(IN_WIDTH.W)))
  val in_c = Input(Vec(SA_COLS, SInt(C_WIDTH.W)))
}

class miniTPUOutput(val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Bundle {
  val out_c = Output(Vec(SA_COLS, SInt(C_WIDTH.W)))
}

class miniTPUIO (val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Bundle {


  val in = Flipped(DecoupledIO(new miniTPUInput(IN_WIDTH, C_WIDTH, SA_ROWS, SA_COLS)))

  val out = DecoupledIO(new miniTPUOutput(IN_WIDTH, C_WIDTH, SA_ROWS, SA_COLS))
}
class top_wrapper (val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Module {
  val io = IO(new Bundle {
    val tpuIO = new miniTPUIO(IN_WIDTH,C_WIDTH,SA_ROWS,SA_COLS)
  })

  val top = Module(new top(IN_WIDTH,C_WIDTH,SA_ROWS,SA_COLS))

  top.io.in_valid := io.tpuIO.in.valid
  top.io.in_ready := io.tpuIO.out.ready
  top.io.in_a     := io.tpuIO.in.bits.in_a
  top.io.in_b     := io.tpuIO.in.bits.in_b
  top.io.in_c     := io.tpuIO.in.bits.in_c

  io.tpuIO.out.valid      := top.io.out_valid
  io.tpuIO.in.ready       := top.io.out_ready
  io.tpuIO.out.bits.out_c := top.io.out_c

}

class top (val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Module {
  val io = IO(new Bundle {
    val in_valid  = Input(Bool())
    val in_ready  = Input(Bool())
    val in_a      = Input(Vec(SA_ROWS, SInt(IN_WIDTH.W)))
    val in_b      = Input(Vec(SA_COLS, SInt(IN_WIDTH.W)))
    val in_c      = Input(Vec(SA_COLS, SInt(C_WIDTH.W)))

    val out_valid = Output(Bool())                        // TODO: decoupledIO
    val out_ready = Output(Bool())
    val out_c     = Output(Vec(SA_COLS, SInt(C_WIDTH.W)))
  })

  val sa = Module(new SystolicArray(IN_WIDTH,C_WIDTH,SA_ROWS,SA_COLS))
  val controller = Module(new Controller(SA_ROWS, SA_COLS))
  // horizontal and vertical data buffer
  val inBuffer_h   = Module(new InputBuffer(IN_WIDTH, SA_COLS, SA_ROWS))
  val inBuffer_v  = Module(new InputBuffer(IN_WIDTH, SA_COLS, SA_ROWS)) // TODO: add control logic to select data( B or D)
  val outBuffer  = Module(new OutputBuffer(C_WIDTH, SA_COLS, SA_ROWS))

  val ready = RegInit(false.B)

  inBuffer_h.io.data_in := io.in_a
  inBuffer_v.io.data_in := io.in_b

  sa.io.in_a := inBuffer_h.io.data_out
  sa.io.in_b := inBuffer_v.io.data_out
  sa.io.in_c := io.in_c                 // TODO: preload in_c as bias

  ready := io.in_ready


  for (c <- 0 until SA_COLS) {
    sa.io.in_control(c).done := controller.io.ctrl_cal_done
  }
  controller.io.ctrl_cal_start := inBuffer_h.io.cal_start & inBuffer_v.io.cal_start
  controller.io.ctrl_in_done := inBuffer_h.io.data_in_done & inBuffer_v.io.data_in_done
  controller.io.ctrl_ob_empty := outBuffer.io.all_empty
  controller.io.ctrl_ibh_full := inBuffer_h.io.all_full
  controller.io.ctrl_ibv_full := inBuffer_v.io.all_full
  controller.io.ctrl_ibh_empty := inBuffer_h.io.all_empty
  controller.io.ctrl_ibv_empty := inBuffer_v.io.all_empty
  controller.io.ctrl_pre_valid := io.in_valid
  controller.io.ctrl_post_ready := io.in_ready


  inBuffer_h.io.ctrl_data_valid := io.in_valid
  inBuffer_v.io.ctrl_data_valid := io.in_valid
  inBuffer_h.io.ctrl_data_in := controller.io.ctrl_ib_data_in
  inBuffer_h.io.ctrl_data_out := controller.io.ctrl_ib_data_out
  inBuffer_v.io.ctrl_data_in := controller.io.ctrl_ib_data_in
  inBuffer_v.io.ctrl_data_out := controller.io.ctrl_ib_data_out

  outBuffer.io.ctrl_valid := controller.io.ctrl_post_valid
  outBuffer.io.ctrl_ready := controller.io.ctrl_post_ready
  outBuffer.io.ctrl_ob_ready := controller.io.ctrl_ob_ready
  outBuffer.io.data_in := sa.io.out_c

  io.out_valid := controller.io.ctrl_post_valid
  io.out_ready := controller.io.ctrl_pre_ready
  io.out_c := outBuffer.io.data_out
}
