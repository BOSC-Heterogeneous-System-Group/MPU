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
    val in_start   = Input(Bool())
    val in_a = Input(Vec(SA_ROWS, UInt(IN_WIDTH.W)))
    val in_b = Input(Vec(SA_COLS, UInt(IN_WIDTH.W)))
    val in_c = Input(Vec(SA_COLS, UInt(C_WIDTH.W)))


    val out_a = Output(Vec(SA_ROWS, UInt(IN_WIDTH.W)))
    val out_b = Output(Vec(SA_COLS, UInt(IN_WIDTH.W)))
    val out_c = Output(Vec(SA_COLS, UInt(C_WIDTH.W)))
  })

  val sa = Module(new SA(IN_WIDTH,C_WIDTH,SA_ROWS,SA_COLS))
  val controller = Module(new Controller(SA_ROWS, SA_COLS))


  sa.io.in_a := io.in_a
  sa.io.in_b := io.in_b
  sa.io.in_c := io.in_c

  for (c <- 0 until 2) {
    sa.io.in_control(c).done := controller.io.cal_done
  }
  controller.io.start := io.in_start

  io.out_a := sa.io.out_a
  io.out_b := sa.io.out_b
  io.out_c := sa.io.out_c
}



object topMain extends App {
  (new ChiselStage).emitVerilog(new top(8,32,2,2), args)
}


