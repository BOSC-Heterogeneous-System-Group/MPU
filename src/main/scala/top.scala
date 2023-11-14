package top

import chisel3._
import chisel3.util._
import chisel3.stage._

import SA._


//class top(val IN_WIDTH: Int, val C_WIDTH: Int, val DP_WIDTH:Int, val TPE_WIDTH: Int) extends Module {
//  val io = IO(new Bundle {
//    val in_control = Input(Vec(TPE_WIDTH, new DPcontrolIO))
//    val in_data = Input(Vec(TPE_WIDTH, new DPdataIO(IN_WIDTH, C_WIDTH, DP_WIDTH)))
//
//    val out_control = Output(Vec(TPE_WIDTH, new DPcontrolIO))
//    val out_data = Output(Vec(TPE_WIDTH, new DPdataIO(IN_WIDTH, C_WIDTH, DP_WIDTH)))
//  })
//
//  val tpe = Module(new TPE(IN_WIDTH,C_WIDTH,DP_WIDTH,TPE_WIDTH))
//
//  tpe.io <> io
//
//}

//class top(val IN_WIDTH: Int, val C_WIDTH: Int, val DP_WIDTH: Int) extends Module {
//  val io = IO(new Bundle {
//    val in_control = Input(new DPcontrolIO)
//    val in_data = Input(new DPdataIO(IN_WIDTH, C_WIDTH, DP_WIDTH))
//
//    val out_control = Output(new DPcontrolIO)
//    val out_data = Output(new DPdataIO(IN_WIDTH, C_WIDTH, DP_WIDTH))
//  })
//  val dp = Module(new DP(8,32,2))
//
//  dp.io <> io
//}
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

  val sa = Module(new SA(IN_WIDTH,C_WIDTH,SA_ROWS,SA_COLS))
  val controller = Module(new Controller(SA_ROWS, SA_COLS))
  val inBuffer   = Seq.fill(2)(Module(new InputBuffer(IN_WIDTH, SA_COLS, SA_ROWS)))
  val outBuffer  = Module(new OutputBuffer(C_WIDTH, SA_COLS, SA_ROWS))


  inBuffer(0).io.data_in := io.in_a
  inBuffer(1).io.data_in := io.in_b

  sa.io.in_a := inBuffer(0).io.data_out
  sa.io.in_b := inBuffer(1).io.data_out
  sa.io.in_c := io.in_c                 // to do inputBuffer



  for (c <- 0 until SA_COLS) {
    sa.io.in_control(c).done := controller.io.cal_done
  }
  controller.io.start := inBuffer(0).io.cal_start & inBuffer(1).io.cal_start

  controller.io.ctrl_data_in := io.ctrl_data_in
  controller.io.in_done := inBuffer(0).io.data_in_done & inBuffer(1).io.data_in_done

  for (i <- 0 until 2) {
    inBuffer(i).io.ctrl_data_in := io.ctrl_data_in
    inBuffer(i).io.ctrl_data_out := controller.io.ctrl_data_out
  }

  outBuffer.io.ctrl_data_in := controller.io.cal_valid
  outBuffer.io.ctrl_data_out := controller.io.out_done
  outBuffer.io.data_in := sa.io.out_c

  io.valid := outBuffer.io.data_in_done
  io.done  := outBuffer.io.data_out_done
  io.out_c := outBuffer.io.data_out
}



object topMain extends App {
  (new ChiselStage).emitVerilog(new top(8,32,2,2), args)
}


