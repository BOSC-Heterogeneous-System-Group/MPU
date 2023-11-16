package miniTPU.DataBuffer

import chisel3._
import chisel3.util._

class OutputBuffer(val C_WIDTH: Int, val QUEUE_NUM: Int, val QUEUE_LEN: Int) extends Module {
  val io = IO(new Bundle {
    val ctrl_data_in = Input(Bool())
    val ctrl_data_out = Input(Bool())
    val data_in = Input(Vec(QUEUE_NUM, UInt(C_WIDTH.W)))

    val data_out = Output(Vec(QUEUE_NUM, UInt(C_WIDTH.W)))
    val all_empty  = Output(Bool())
    val data_in_done = Output(Bool())
    val data_out_done = Output(Bool())
  })

  val data_queue = Seq.fill(QUEUE_NUM)(Module(new SyncFIFO(C_WIDTH, QUEUE_LEN)))

  // when state is data_out, deq start to decrease
  val deq_count = Reg(Vec(QUEUE_NUM, UInt(log2Ceil(QUEUE_LEN + 1).W)))

  val idle :: data_in :: data_out :: Nil = Enum(3)
  val state = RegInit(idle)

  val canDeq = WireInit(VecInit(Seq.fill(QUEUE_NUM)(false.B)))
  val data_in_done = WireDefault(false.B)
  val data_out_done = WireDefault(false.B)
  val allFull       = WireDefault(false.B)
  val allEmpty      = WireDefault(false.B)

  io.data_in_done := data_in_done
  io.data_out_done := data_out_done

  for (i <- 0 until QUEUE_NUM) {
    data_queue(i).io.enq := (state === idle && io.ctrl_data_in) || state === data_in
    data_queue(i).io.deq := state === data_out
    data_queue(i).io.enqData := io.data_in(i)
    canDeq(i) := state === data_out
    io.data_out(i) := Mux(canDeq(i), data_queue(i).io.deqData, 0.U)
  }


  allFull := data_queue.tail.foldLeft(data_queue.head.io.full)(_ & _.io.full)
  allEmpty := data_queue.tail.foldLeft(data_queue.head.io.empty)(_ & _.io.empty)
  io.all_empty := allEmpty

  // FSM
  when(state === idle) {

    when(io.ctrl_data_in) {
      state := data_in
    }.elsewhen(io.ctrl_data_out) {
      state := data_out
    }

    for (i <- 0 until QUEUE_NUM) {
      deq_count(i) := QUEUE_LEN.U
    }
  }.elsewhen(state === data_in) {

    when(allFull) {
      data_in_done := true.B
      state := Mux(io.ctrl_data_out, data_out, idle)
    }

  }.otherwise { // state === data_out

    when(allEmpty) {
      data_out_done := true.B
      state := idle
    }

    for (i <- 0 until QUEUE_NUM) {

      when(deq_count(i) =/= 0.U) {
        deq_count(i) := deq_count(i) - 1.U
      }
    }

  }

}
