package miniTPU

import chisel3._
import chisel3.util._
import miniTPU.DataBuffer._
import miniTPU.SystolicArray._

class ldIn() extends Bundle {
  val data = Input(UInt(64.W))
  val addr = Input(UInt(5.W))
  val offset = Input(UInt(3.W))
  val wen = Input(Bool())
}

class RsIn() extends Bundle {
  val addr = Input(UInt(5.W))
  val offset = Input(UInt(3.W))
  val ren = Input(Bool())
}


class RegOut() extends Bundle {
  val data = Output(UInt(64.W))
}

class Regfile_2D() extends Module {
  val io = IO(new Bundle {
    val wr = Vec(2, new ldIn())
    val rd = new RsIn()
    val out = ValidIO(new RegOut())
  })

  val regfile2d = VecInit(Seq.tabulate(8)(_ => Module(new Reg_2D).io))

  for (i <- 0 until 8){
    regfile2d(i).wen := false.B
    regfile2d(i).valid_in := false.B
    regfile2d(i).wr_offset := 0.U
    regfile2d(i).rd_offset := 0.U
    regfile2d(i).data_in := 0.U
  }

  regfile2d(io.wr(0).addr).wen := io.wr(0).wen
  regfile2d(io.wr(0).addr).valid_in := io.wr(0).wen
  regfile2d(io.wr(0).addr).wr_offset := io.wr(0).offset
  regfile2d(io.wr(0).addr).data_in := io.wr(0).data

  regfile2d(io.wr(1).addr).wen := io.wr(1).wen
  regfile2d(io.wr(1).addr).valid_in := io.wr(1).wen
  regfile2d(io.wr(1).addr).wr_offset := io.wr(1).offset
  regfile2d(io.wr(1).addr).data_in := io.wr(1).data

  regfile2d(io.rd.addr).valid_in := io.rd.ren
  regfile2d(io.rd.addr).rd_offset := io.rd.offset
  io.out.valid := regfile2d(io.rd.addr).valid_out
  io.out.bits.data := regfile2d(io.rd.addr).data_out


}

class Reg_2D() extends Module {
  val io = IO(new Bundle {
    val wen = Input(Bool())
    val wr_offset = Input(UInt(3.W))
    val valid_in = Input(Bool())
    val data_in = Input(UInt(64.W))
    val rd_offset = Input(UInt(3.W))
    val valid_out = Output(Bool())
    val data_out = Output(UInt(64.W))
  })

    val data2d = RegInit(VecInit(Seq.fill(2)(0.U(64.W))))
    val flag2d = RegInit(VecInit(Seq.fill(2)(false.B)))
    when (io.valid_in && io.wen) {
      data2d(io.wr_offset) := io.data_in
      flag2d(io.wr_offset) := true.B
    }
    flag2d(io.rd_offset) := !(io.valid_in && !io.wen)
    io.valid_out := io.valid_in && !io.wen
    io.data_out := data2d(io.rd_offset)

}