package miniTPU.DataBuffer

import chisel3._
import chisel3.util._

class OutputBuffer(val C_WIDTH: Int, val QUEUE_NUM: Int, val QUEUE_LEN: Int) extends Module {
  val io = IO(new Bundle {
    val ctrl_valid    = Input(Bool())
    val ctrl_ready    = Input(Bool())
    val ctrl_ob_ready = Input(Bool())
    val data_in = Input(Vec(QUEUE_NUM, SInt(C_WIDTH.W)))

    val data_out = Output(Vec(QUEUE_NUM, SInt(C_WIDTH.W)))
    val all_empty  = Output(Bool())
  })

  val data_queue = Seq.fill(QUEUE_NUM)(Module(new SyncFIFO(C_WIDTH, QUEUE_LEN)))

  for (i <- 0 until QUEUE_NUM) {
    data_queue(i).io.enq := io.ctrl_ob_ready
    data_queue(i).io.deq := io.ctrl_valid && io.ctrl_ready
    data_queue(i).io.enqData := io.data_in(i)
    io.data_out(i) := data_queue(i).io.deqData
  }

  val allFull = WireInit(false.B)
  val allEmpty = WireInit(false.B)
  allFull := data_queue.map(_.io.full).reduce(_ & _)
  allEmpty := data_queue.map(_.io.empty).reduce(_ & _)

  io.all_empty := allEmpty
}
