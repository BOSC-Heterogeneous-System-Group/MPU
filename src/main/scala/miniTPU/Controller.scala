package miniTPU

import chisel3._
import chisel3.util._


class GlobalCounter(val maxCount:Int) extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val tick = Output(Bool())
  })

  val count = RegInit(0.U(log2Ceil(maxCount+1).W))
  val tick = count === maxCount.asUInt

  val enable = RegInit(false.B)
  when(io.start) {
    enable := true.B
  }.elsewhen(tick) {
    enable := false.B
  }

  when(enable) {
    when(count =/= maxCount.asUInt) {
      count := count + 1.U
    }.otherwise {
      count := 0.U
    }
  }

  io.tick := tick
}

class Controller(val SA_ROWS: Int, val SA_COLS: Int) extends Module {
  val io = IO(new Bundle {
    val ctrl_cal_start = Input(Bool())
    val ctrl_in_done   = Input(Bool())  // from InputBuffer: data_in_done

    val ctrl_data_out  = Output(Bool()) // to InputBuffer: ctrl_data_out
    val ctrl_cal_done  = Output(Bool())
    val ctrl_cal_valid = Output(Bool())
    val ctrl_out_done  = Output(Bool())
  })

  // idle：wait for instruction
  // compute：execute matrix multiplication
  // completed：calculation done, output the results from every PE
  val idle :: compute :: completed :: Nil = Enum(3)
  val state = RegInit(idle)

  // initialize ctrl registers
  val in_done_r    = RegInit(false.B)
  val isIdle       = RegInit(true.B)

  val ctrl_data_out_w = WireDefault(false.B)
  val delay_ctrl_data_out = RegInit(false.B)
  val ctrl_data_out_edge = WireDefault(false.B)

  val cal_done_r   = RegInit(false.B)
  val out_done_r   = RegInit(false.B)

  val delay_cal_done = RegInit(false.B)
  val cal_done_edge  = WireDefault(false.B)

  // generate ctrl_data_out, meaning that data start to input SA
  // when data finish filling in input buffer and SA is idle, data can output to SA from input buffer
  when(io.ctrl_in_done) {
    in_done_r := true.B
  }.elsewhen(io.ctrl_data_out) {
    in_done_r := false.B
  }
  ctrl_data_out_w := in_done_r & isIdle
  delay_ctrl_data_out := ctrl_data_out_w
  ctrl_data_out_edge := !delay_ctrl_data_out & ctrl_data_out_w
  io.ctrl_data_out := ctrl_data_out_edge

  // generate cal_done, meaning that calculation is done
  val cal_gc       = Module(new GlobalCounter(3*SA_ROWS-2)) // todo ROWs和COLs取最大值
  cal_gc.io.start := io.ctrl_cal_start
  when(cal_gc.io.tick) {
    cal_done_r     := true.B
  }

  // generate cal_valid, meaning that results can start to fill in the output buffer
  // generate when cal_done is set, the output process begin when calculation finish
  delay_cal_done  := cal_done_r
  io.ctrl_cal_done     := cal_done_r
  cal_done_edge   := !delay_cal_done & cal_done_r
  io.ctrl_cal_valid    := cal_done_edge

  // generate out_done, meaning that output is done
  val out_gc       = Module(new GlobalCounter(SA_COLS-1))
  out_gc.io.start := cal_gc.io.tick
  when(out_gc.io.tick) {
    out_done_r     := true.B
  }
  io.ctrl_out_done     := out_done_r

  // FSM
  when(state === idle) {
    when(io.ctrl_cal_start) {
      state := compute
      isIdle := false.B
    }
  }.elsewhen(state === compute) {
    when(cal_done_r) {
      state := completed
    }
  }.elsewhen(state === completed) {
    when(out_done_r) {
      state := idle
      isIdle := true.B
      cal_done_r := false.B
      out_done_r := false.B
    }
  }
}