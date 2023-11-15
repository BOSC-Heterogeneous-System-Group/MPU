package miniTPU.DataBuffer

import chisel3._
import chisel3.util._


class SyncFIFO(width: Int, depth: Int) extends Module {
  val io = IO(new Bundle {
    val enq = Input(Bool())
    val deq = Input(Bool())
    val enqData = Input(UInt(width.W))
    val full    = Output(Bool())
    val empty   = Output(Bool())
    val deqData = Output(UInt(width.W))
  })

  val mem = RegInit(VecInit(Seq.fill(depth)(0.U(width.W))))

  val addr_width = log2Ceil(depth)
  val readPtr = RegInit(0.U((addr_width + 1).W)) // extra bit to indicate full or empty
  val writePtr = RegInit(0.U((addr_width + 1).W))
  //val deqDateReg = RegInit(0.U(width.W))

  val isFull = WireInit(false.B)
  val isEmpty = WireInit(false.B)

  val deqData = WireInit(0.U(width.W))

  isEmpty := readPtr === writePtr
  isFull := readPtr === Cat(~writePtr(addr_width), writePtr(addr_width - 1, 0))
  io.full := isFull
  io.empty := isEmpty

  when(io.enq && !isFull) {
    mem(writePtr) := io.enqData
    writePtr := writePtr + 1.U
  }

  when(io.deq && !isEmpty) {
    deqData := mem(readPtr)
    readPtr := readPtr + 1.U
  }

  io.deqData := deqData

}
