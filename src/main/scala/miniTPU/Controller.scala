package miniTPU

import chisel3._
import chisel3.util._


class GlobalCounter(val maxCount:Int) extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val tick = Output(Bool())
  })

  val count = RegInit(0.U(4.W))
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
    val start     = Input(Bool())
    val ctrl_data_in = Input(Bool())  // parallel with InputBuffer ctrl_data_in
    val in_done   = Input(Bool())  // from InputBuffer data_in_done

    val ctrl_data_out = Output(Bool())  // to InputBuffer ctrl_data_out
    val cal_done  = Output(Bool())
    val cal_valid = Output(Bool())
    val out_done  = Output(Bool())
  })

  // idle：等待指令
  // compute：执行矩阵乘法
  // completed：运算执行结束，将每个PE里的结果流出
  val idle :: compute :: completed :: Nil = Enum(3)
  val state = RegInit(idle)

  // 初始化in_done_r,cal_done_r和out_done_r
  val in_done_r    = RegInit(false.B)
  val isIdle       = RegInit(true.B)

  val ctrl_data_out_w = WireDefault(false.B)
  val delay_ctrl_data_out = RegInit(false.B)
  val ctrl_data_out_edge = WireDefault(false.B)

  val cal_done_r   = RegInit(false.B)
  val out_done_r   = RegInit(false.B)

  val delay_cal_done = RegInit(false.B)
  val cal_done_edge  = WireDefault(false.B)

  when(io.in_done) {
    in_done_r := true.B
  }.elsewhen(io.ctrl_data_out) {
    in_done_r := false.B
  }

  ctrl_data_out_w := in_done_r & isIdle
  delay_ctrl_data_out := ctrl_data_out_w
  ctrl_data_out_edge := !delay_ctrl_data_out & ctrl_data_out_w
  io.ctrl_data_out := ctrl_data_out_edge

  // 例化产生cal_done的全局计数器，标志计算完成，可以开始输出结果
  val cal_gc       = Module(new GlobalCounter(3*SA_ROWS-2)) // todo ROWs和COLs取最大值
  cal_gc.io.start := io.start
  when(cal_gc.io.tick) {
    cal_done_r     := true.B
  }

  delay_cal_done  := cal_done_r

  io.cal_done     := cal_done_r

  cal_done_edge   := !delay_cal_done & cal_done_r
  io.cal_valid    := cal_done_edge

  // 例化产生out_done的全局计数器，标志输出完成，可以开始输出结果
  val out_gc       = Module(new GlobalCounter(SA_COLS-1))
  out_gc.io.start := cal_gc.io.tick
  when(out_gc.io.tick) {
    out_done_r     := true.B
  }
  io.out_done     := out_done_r

  // FSM
  when(state === idle) {
    when(io.start) {
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