package miniTPU

import chisel3._
import chisel3.util._
import miniTPU.DataBuffer._
import miniTPU.SystolicArray._

class miniTPUInput_R(val IN_WIDTH: Int, val C_WIDTH: Int, val INA_ROWS: Int, val INA_COLS: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Bundle {
  val in_a = Input(Vec(INA_ROWS, Vec(INA_COLS, SInt(IN_WIDTH.W))))
  val in_b = Input(Vec(INA_ROWS, Vec(INA_COLS, SInt(IN_WIDTH.W))))
  val in_c = Input(Vec(SA_COLS, SInt(C_WIDTH.W)))
}

class miniTPUOutput_R(val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Bundle {
  val out_c = Output(Vec(SA_COLS, Vec(SA_ROWS, SInt(C_WIDTH.W))))
}

class miniTPUIO_R (val IN_WIDTH: Int, val C_WIDTH: Int, val INA_ROWS: Int, val INA_COLS: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Bundle {
  val in = Flipped(DecoupledIO(new miniTPUInput_R(IN_WIDTH, C_WIDTH, INA_ROWS, INA_COLS, SA_ROWS, SA_COLS)))
  val out = DecoupledIO(new miniTPUOutput_R(IN_WIDTH, C_WIDTH, SA_ROWS, SA_COLS))
}


/*
   type-0 : pipeline systolic array
   type-1 : algorithm accelerator
   ...
*/
class top_R (val TYPE: Int, val IN_WIDTH: Int, val C_WIDTH: Int, val INA_ROWS: Int, val INA_COLS:Int, val SA_ROWS: Int, val SA_COLS: Int) extends Module {
  val io = IO(new Bundle {
    val tpuIO = new miniTPUIO_R(IN_WIDTH, C_WIDTH, INA_ROWS, INA_COLS, SA_ROWS, SA_COLS)
  })

  val sa = Module(new SystolicArray(IN_WIDTH,C_WIDTH,SA_ROWS,SA_COLS))
  val controller = Module(new Controller(SA_ROWS, SA_COLS))
  val inBuffer_h   = Module(new InputBuffer(IN_WIDTH, INA_ROWS, INA_COLS))  // horizontal and vertical data buffer
  val inBuffer_v  = Module(new InputBuffer(IN_WIDTH, INA_ROWS, INA_COLS)) // TODO: add control logic to select data( B or D)
  val outBuffer  = Module(new OutputBuffer(TYPE, C_WIDTH, SA_COLS, SA_ROWS))

  inBuffer_h.io.data_in.valid := io.tpuIO.in.valid
  inBuffer_h.io.data_in.bits <> io.tpuIO.in.bits.in_a
  inBuffer_h.io.ctrl_ib_data_out := controller.io.ctrl_ib_data_out

  inBuffer_v.io.data_in.valid := io.tpuIO.in.valid
  inBuffer_v.io.data_in.bits <> io.tpuIO.in.bits.in_b
  inBuffer_v.io.ctrl_ib_data_out := controller.io.ctrl_ib_data_out
  io.tpuIO.in.ready := inBuffer_h.io.data_in.ready && inBuffer_v.io.data_in.ready && outBuffer.io.ob_empty && controller.io.ctrl_sa_isIdle

  io.tpuIO.out.valid := outBuffer.io.data_out.valid
  io.tpuIO.out.bits.out_c <> outBuffer.io.data_out.bits
  outBuffer.io.data_out.ready := io.tpuIO.out.ready
  outBuffer.io.ctrl_ob_data_in := controller.io.ctrl_ob_data_in

  sa.io.in_a := inBuffer_h.io.data_out
  sa.io.in_b := inBuffer_v.io.data_out
  sa.io.in_c := io.tpuIO.in.bits.in_c  // TODO: preload in_c as bias
  outBuffer.io.data_in := sa.io.out_c
  sa.io.in_control.foreach(_.ctrl_sa_send_data := controller.io.ctrl_sa_send_data)

  controller.io.ibh_data_in_done := inBuffer_h.io.ib_data_in_done
  controller.io.ibv_data_in_done := inBuffer_v.io.ib_data_in_done
  controller.io.ob_empty := outBuffer.io.ob_empty
}