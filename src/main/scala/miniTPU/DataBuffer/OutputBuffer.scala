package miniTPU.DataBuffer

import chisel3._
import chisel3.util._

class OutputBuffer(val C_WIDTH: Int, val QUEUE_NUM: Int, val QUEUE_LEN: Int) extends Module {
  val io = IO(new Bundle {
    val ctrl_data_in = Input(Bool())
    val ctrl_data_out = Input(Bool())
    val data_in = Input(Vec(QUEUE_NUM, UInt(C_WIDTH.W)))

    val data_out = Output(Vec(QUEUE_NUM, UInt(C_WIDTH.W)))
    val data_in_done = Output(Bool())
    val data_out_done = Output(Bool())
  })

  val data_queue = Seq.fill(QUEUE_NUM)(Module(new SyncFIFO(C_WIDTH, QUEUE_LEN)))

  // when state is data_out, deq start to decrease
  val deq_count = Reg(Vec(QUEUE_NUM, UInt(log2Ceil(QUEUE_LEN + 1).W)))

  // count input and output cycles
  val count_in_cycles = RegInit(0.U(log2Ceil(QUEUE_LEN + 1).W))
  val count_out_cycles = RegInit(0.U(log2Ceil(QUEUE_LEN + 1).W))

  val idle :: data_in :: data_out :: Nil = Enum(3)
  val state = RegInit(idle)

  val canDeq = RegInit(VecInit(Seq.fill(QUEUE_NUM)(false.B)))

  for (i <- 0 until QUEUE_NUM) {
    data_queue(i).io.enq := (state === idle && io.ctrl_data_in) || state === data_in
    data_queue(i).io.deq := state === data_out  && deq_count(i) =/= 0.U
    data_queue(i).io.enqData := io.data_in(i)
    canDeq(i) := state === data_out  && deq_count(i) =/= 0.U
    io.data_out(i) := Mux(canDeq(i), data_queue(i).io.deqData, 0.U)
  }

  val data_in_done = WireDefault(false.B)
  val data_out_done = WireDefault(false.B)
  io.data_in_done := data_in_done
  io.data_out_done := data_out_done


  // FSM
  when(state === idle) {

    when(io.ctrl_data_in) {
      count_in_cycles := count_in_cycles + 1.U
      state := data_in
    }.elsewhen(io.ctrl_data_out) {
      state := data_out
    }

    for (i <- 0 until QUEUE_NUM) {
      deq_count(i) := QUEUE_LEN.U
    }
  }.elsewhen(state === data_in) {

    when(count_in_cycles === (QUEUE_LEN - 1).U) {
      count_in_cycles := 0.U
      data_in_done := true.B
      state := idle
    }.otherwise {
      count_in_cycles := count_in_cycles + 1.U
    }

  }.otherwise { // state === data_out

    when(count_out_cycles === (QUEUE_LEN).U) {
      count_out_cycles := 0.U
      data_out_done := true.B
      state := idle
    }.otherwise {
      count_out_cycles := count_out_cycles + 1.U
    }

    for (i <- 0 until QUEUE_NUM) {

      when(deq_count(i) =/= 0.U) {
        deq_count(i) := deq_count(i) - 1.U
      }
    }

  }

}
