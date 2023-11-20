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
    val ctrl_cal_start   = Input(Bool())
    val ctrl_in_done     = Input(Bool())  // from InputBuffer: data_in_done
    val ctrl_ibh_full    = Input(Bool())  // from InputBuffer: all full
    val ctrl_ibv_full    = Input(Bool())  // from InputBuffer: all full
    val ctrl_ibh_empty   = Input(Bool())  // from InputBuffer: all empty
    val ctrl_ibv_empty   = Input(Bool())  // from InputBuffer: all empty
    val ctrl_pre_valid   = Input(Bool())  // from top: last stage valid
    val ctrl_post_ready  = Input(Bool())  // from top: next stage ready
    val ctrl_ob_empty    = Input(Bool())  // from OutputBuffer: all empty

    val ctrl_pre_ready   = Output(Bool())
    val ctrl_post_valid  = Output(Bool())
    val ctrl_ib_data_in  = Output(Bool()) // to InputBuffer: ctrl_data_in
    val ctrl_ib_data_out = Output(Bool()) // to InputBuffer: ctrl_data_out
    val ctrl_cal_done    = Output(Bool())
    val ctrl_out_done    = Output(Bool())
    val ctrl_ob_ready    = Output(Bool())
  })

  // idle：wait for instruction
  // compute：execute matrix multiplication
  // completed：calculation done, output the results from every PE
  val idle :: compute :: completed :: Nil = Enum(3)
  val state = RegInit(idle)

  // initialize ctrl registers
  val in_done_r    = RegInit(false.B)
  val isIdle       = RegInit(true.B)

  val ctrl_ib_data_in_w = WireDefault(false.B)
  val delay_ctrl_ib_data_in = RegInit(false.B)
  val ctrl_ib_data_in_edge = WireDefault(false.B)

  val ctrl_ib_data_out_w = WireDefault(false.B)
  val delay_ctrl_ib_data_out = RegInit(false.B)
  val ctrl_ib_data_out_edge = WireDefault(false.B)

  val cal_done_r   = RegInit(false.B)
  val out_done_r   = RegInit(false.B)


  // when input buffer is full, not ready
  io.ctrl_pre_ready := !io.ctrl_ibh_full & !io.ctrl_ibv_full & isIdle
  io.ctrl_post_valid := !io.ctrl_ob_empty

  // generate ctrl_ib_data_in, meaning that data start to input input buffer
  ctrl_ib_data_in_w := io.ctrl_ibh_empty & io.ctrl_ibv_empty & io.ctrl_pre_valid
  delay_ctrl_ib_data_in := ctrl_ib_data_in_w
  ctrl_ib_data_in_edge := !delay_ctrl_ib_data_in & ctrl_ib_data_in_w
  io.ctrl_ib_data_in := ctrl_ib_data_in_edge

  // generate ctrl_ib_data_out, meaning that data start to input SA
  // when data finish filling in input buffer and SA is idle, data can output to SA from input buffer
  when(io.ctrl_in_done) {
    in_done_r := true.B
  }.elsewhen(io.ctrl_ib_data_out) {
    in_done_r := false.B
  }
  ctrl_ib_data_out_w := in_done_r & isIdle & io.ctrl_ob_empty
  delay_ctrl_ib_data_out := ctrl_ib_data_out_w
  ctrl_ib_data_out_edge := !delay_ctrl_ib_data_out & ctrl_ib_data_out_w
  io.ctrl_ib_data_out := ctrl_ib_data_out_edge

  // generate cal_done, meaning that calculation is done
  val cal_gc       = Module(new GlobalCounter(3*SA_ROWS-2)) // todo ROWs和COLs取最大值
  cal_gc.io.start := io.ctrl_cal_start
  when(cal_gc.io.tick) {
    cal_done_r     := true.B
  }
  io.ctrl_cal_done     := cal_done_r

  // generate out_done, meaning that output is done
  val out_gc       = Module(new GlobalCounter(SA_COLS-1))
  out_gc.io.start := cal_gc.io.tick
  when(out_gc.io.tick) {
    out_done_r     := true.B
  }
  io.ctrl_out_done     := out_done_r

  // generate ob_ready, meaning that enq is set
  io.ctrl_ob_ready := cal_done_r & !out_done_r

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
      when(io.ctrl_post_ready) {
        state := idle
        isIdle := true.B
        cal_done_r := false.B
        out_done_r := false.B
      }
    }
  }
}