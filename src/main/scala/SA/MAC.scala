package SA

import chisel3._
import chisel3.util.Fill
import chisel3.util.Cat
import MUL._

class MACUnit(val IN_WIDTH: Int, val C_WIDTH: Int) extends Module {
  val io = IO(new Bundle {
    val in_a = Input(UInt(IN_WIDTH.W))
    val in_b = Input(UInt(IN_WIDTH.W))
    val in_c = Input(UInt(C_WIDTH.W))
    val out_c = Output(UInt(C_WIDTH.W))
  })

  val mul = Module(new Mul(IN_WIDTH, 2*IN_WIDTH))
  val rca = Module(new RCA(C_WIDTH))

  mul.input.multiplicand := io.in_a
  mul.input.multiplier   := io.in_b

  rca.input.a_in  := Cat(Fill((C_WIDTH-2*IN_WIDTH), mul.output.product(2*IN_WIDTH-1)), mul.output.product)
  rca.input.b_in  := io.in_c
  rca.input.c_in  := 0.U(C_WIDTH.W)
  io.out_c        := rca.output.S

}