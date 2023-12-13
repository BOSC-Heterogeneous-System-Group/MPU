package miniTPU

import chisel3._
import chisel3.util._
import miniTPU.DataBuffer._
import miniTPU.SystolicArray._



class xsFUInput_M() extends Bundle {
  val ldIn = Input(UInt(64.W))
  val uop = Input(UInt(3.W))
  val robIdx = Input(UInt(5.W))
}

class xsFUOutput_M() extends Bundle {
  val data = Output(UInt(64.W))
}

class xsFUIO_M () extends Bundle {

  val in = Vec(2, Flipped(ValidIO(new xsFUInput_M())))
  val deqptr = Vec(6, Input(UInt(5.W)))

  val out = DecoupledIO(new xsFUOutput_M())
}

class XS_miniTPU_M() extends Module{
  val io = IO(new Bundle {
    val xsIO = new xsFUIO_M()
  })

  val newReq = Wire(Vec(2, Bool()))
  val uopReg = Reg(Vec(2, UInt(3.W)))

  newReq(0) := io.xsIO.in(0).fire()
  newReq(1) := io.xsIO.in(1).fire()

  uopReg(0) := io.xsIO.in(0).bits.uop
  uopReg(1) := io.xsIO.in(1).bits.uop

  val validReg = RegInit(VecInit(Seq.fill(2)(false.B)))
  val ldInReg = RegInit(VecInit(Seq.fill(2)(0.U(64.W))))
  val deqptrReg = RegInit(VecInit(Seq.fill(6)(0.U(5.W))))
  val robIdxReg = RegInit(VecInit(Seq.fill(2)(0.U(5.W))))

  validReg(0) := io.xsIO.in(0).valid
  ldInReg(0)  := io.xsIO.in(0).bits.ldIn

  validReg(1) := io.xsIO.in(1).valid
  ldInReg(1) := io.xsIO.in(1).bits.ldIn

  robIdxReg(0) := io.xsIO.in(0).bits.robIdx
  robIdxReg(1) := io.xsIO.in(1).bits.robIdx
  deqptrReg := io.xsIO.deqptr

  val mini_tpu  = Module(new top_M(0,4,16,2,2))
  val outBridge = Module(new OutputBridge_M())
  val inBridge_m  = Module(new InputBridge_M())
  val rob = Module(new SA_ROB_Wrapper)

  rob.io.ldin.valid := validReg
  rob.io.ldin.data := ldInReg
  rob.io.ldin.robIdx(0) := robIdxReg(0)
  rob.io.ldin.robIdx(1) := robIdxReg(1)
  rob.io.ldin.fuOptype(0) := uopReg(0)
  rob.io.ldin.fuOptype(1) := uopReg(1)

  rob.io.deqptr := deqptrReg

  inBridge_m.io.in_valid := rob.io.out.valid
  rob.io.out.ready := inBridge_m.io.out_ready
  inBridge_m.io.ldIn := rob.io.out.bits.asSInt

  inBridge_m.io.in_ready := mini_tpu.io.tpuIO.in.in_a.ready | mini_tpu.io.tpuIO.in.in_b.ready
  mini_tpu.io.tpuIO.in.in_a.valid := inBridge_m.io.out_valid_h
  mini_tpu.io.tpuIO.in.in_b.valid := inBridge_m.io.out_valid_v
  mini_tpu.io.tpuIO.in.in_a.bits := inBridge_m.io.in_a
  mini_tpu.io.tpuIO.in.in_b.bits := inBridge_m.io.in_b
  mini_tpu.io.tpuIO.in.in_c := Seq.fill(2)(0.S(16.W))

  outBridge.io.in_valid := mini_tpu.io.tpuIO.out.valid
  mini_tpu.io.tpuIO.out.ready := outBridge.io.out_ready
  outBridge.io.out_c := mini_tpu.io.tpuIO.out.bits.out_c

  outBridge.io.in_ready := io.xsIO.out.ready
  io.xsIO.out.valid := outBridge.io.out_valid
  io.xsIO.out.bits.data := outBridge.io.result.asUInt

}

class OutputBridge_M() extends Module {
  val io = IO(new Bundle {
    val in_valid  = Input(Bool())
    val out_ready = Output(Bool())
    val out_c     = Input(Vec(2, SInt(16.W)))
    val in_ready  = Input(Bool())
    val out_valid = Output(Bool())
    val result    = Output(SInt(64.W))
  })

  val out_ptr      = RegInit(false.B)
  val out_valid_r  = RegInit(false.B)
  val result       = Seq.fill(2, 2)(RegInit(0.S(16.W)))

  val indices = Seq((0, 0), (0, 1), (1, 0), (1, 1))

  when (out_ptr === false.B && io.in_valid) {
    out_ptr         := true.B
    out_valid_r     := false.B
    Seq(indices(2), indices(3)).zip(io.out_c).foreach {case ((i, j), out) => result(i)(j) := out}

  }.elsewhen (out_ptr === true.B && io.in_valid){
    out_ptr         := false.B
    out_valid_r     := io.in_valid
    Seq(indices(0), indices(1)).zip(io.out_c).foreach {case ((i, j), out) => result(i)(j) := out}
  }.elsewhen (io.in_ready) {
    out_ptr         := false.B
    out_valid_r     := io.in_valid
    Seq(indices(0), indices(1), indices(2), indices(3)).foreach {case (i, j) => result(i)(j) := io.out_c(j)}
  }

  io.out_valid := out_valid_r
  io.out_ready := io.in_ready
  io.result    := Cat(indices.map {case (i, j) => result(i)(j)}.reverse).asSInt

}

class ROBIn() extends Bundle{
  val data = Vec(2, Input(UInt(64.W)))
  val robIdx = Vec(2, Input(UInt(5.W)))
  val fuOptype = Vec(2, Input(UInt(3.W)))
  val valid = Vec(2, Input(Bool()))
}

class SA_ROB_Wrapper() extends Module{
  val io = IO(new Bundle() {
    val ldin = new ROBIn()
    val deqptr = Vec(6, Input(UInt(5.W)))
    val out = DecoupledIO(UInt(64.W))
  })
  val ldBuff = Module(new ldBuffer())
  val rob = Module(new SA_ROB())

  ldBuff.io.ldin := io.ldin
  ldBuff.io.deqptr := io.deqptr

  rob.io.MatchVec := ldBuff.io.bufout.MatchVec
  rob.io.data := ldBuff.io.bufout.data


  io.out.bits := rob.io.out.bits
  io.out.valid := rob.io.out.valid
  rob.io.out.ready := io.out.ready



}


class BufIn() extends Bundle {
  val data = Vec(2, Input(UInt(64.W)))
  val robIdx = Vec(2, Input(UInt(5.W)))
  val fuOptype = Vec(2, Input(UInt(3.W)))
  val valid = Vec(2, Input(Bool()))
}

class BufOut() extends Bundle {
  val data = Vec(4, Output(UInt(64.W)))
  val MatchVec = Vec(4, Output(UInt(6.W)))
  val valid = Vec(4, Output(Bool()))
}

class ldBuffer() extends Module {
  val io = IO(new Bundle() {
    val deqptr = Vec(6, Input(UInt(5.W)))
    val ldin = new BufIn()
    val bufout  = new BufOut()
    // val ready = Input(Bool())
  })

  val MatchVec = Wire(Vec(4, Vec(6, Bool())))
  val matchVecUInt = WireInit(VecInit(MatchVec.map(_.asUInt())))
  val validReg = RegInit(VecInit(Seq.fill(4)(false.B)))
  val dataReg = RegInit(VecInit(Seq.fill(4)(0.U(64.W))))
  val deqptrReg = Reg(Vec(6, UInt(5.W)))
  val robIdxReg = Reg(Vec(4, UInt(5.W)))


  validReg(0) := (io.ldin.fuOptype(0) === 7.U) && (io.ldin.valid(0) === true.B)
  validReg(1) := (io.ldin.fuOptype(1) === 7.U) && (io.ldin.valid(0) === true.B)
  validReg(2) := Mux(MatchVec(0).asUInt().orR(), false.B, validReg(0)) | Mux(MatchVec(2).asUInt().orR(), false.B, validReg(2))
  validReg(3) := Mux(MatchVec(1).asUInt().orR(), false.B, validReg(1)) | Mux(MatchVec(3).asUInt().orR(), false.B, validReg(3))
  dataReg(0) := Mux(io.ldin.valid(0) && io.ldin.fuOptype(0) === 7.U, io.ldin.data(0), dataReg(0))
  dataReg(1) := Mux(io.ldin.valid(1) && io.ldin.fuOptype(1) === 7.U, io.ldin.data(1), dataReg(1))
  dataReg(2) := dataReg(0)
  dataReg(3) := dataReg(1)
  robIdxReg(0) := Mux(io.ldin.valid(0) && io.ldin.fuOptype(0) === 7.U, io.ldin.robIdx(0), robIdxReg(0))
  robIdxReg(1) := Mux(io.ldin.valid(1) && io.ldin.fuOptype(1) === 7.U, io.ldin.robIdx(1), robIdxReg(1))
  robIdxReg(2) := robIdxReg(0)
  robIdxReg(3) := robIdxReg(1)
  deqptrReg := io.deqptr

  for (i <- 0 until 6) {
    MatchVec(0)(i) := validReg(0) && (deqptrReg(i) === robIdxReg(0)).asBool
    MatchVec(1)(i) := validReg(1) && (deqptrReg(i) === robIdxReg(1)).asBool
    MatchVec(2)(i) := validReg(2) && (deqptrReg(i) === robIdxReg(2)).asBool
    MatchVec(3)(i) := validReg(3) && (deqptrReg(i) === robIdxReg(3)).asBool
  }
  io.bufout.data := dataReg
  io.bufout.valid := validReg
  io.bufout.MatchVec := matchVecUInt

}

class SA_ROB() extends Module{

  object PriorityEncoder {
    def apply(in: Seq[Bool]): UInt = PriorityMux(in, (0 until in.size).map(_.asUInt))

    def apply(in: Bits): UInt = apply(in.asBools)
  }

  val io = IO(new Bundle(){
    val MatchVec = Vec(4, Input(UInt(6.W)))
    val data = Vec(4, Input(UInt(64.W)))
    val out = DecoupledIO(UInt(64.W))
  })
  val isEmpty = WireInit(false.B)
  val deq = WireInit(false.B)
  val readPtr = RegInit(0.U(3.W))
  val writePtr = RegInit(0.U(3.W))
  val writePtrP1= WireInit(writePtr+1.U(3.W))
  val writePtrP2= WireInit(writePtr+2.U(3.W))
  val writePtrP3= WireInit(writePtr+3.U(3.W))
  val mem = RegInit(VecInit(Seq.fill(4)(0.U(64.W))))
  val matchVecORR = Cat(io.MatchVec(3).orR, io.MatchVec(2).orR, io.MatchVec(1).orR, io.MatchVec(0).orR)

  isEmpty := readPtr === writePtr
  deq := !isEmpty & io.out.ready
  val deqData = WireInit(0.U(64.W))

  val flag = WireInit(false.B)
  flag := (io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) > 0.U) && (io.MatchVec(0) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(3))

  when(deq) {
    readPtr := readPtr + 1.U
    deqData := mem(readPtr)
  }

  io.out.bits := deqData
  io.out.valid := !isEmpty

  writePtr := MuxCase(writePtr,
    Array(
      (PopCount(matchVecORR) === 4.U) -> (writePtr + 4.U),
      (PopCount(matchVecORR) === 3.U) -> (writePtr + 3.U),
      (PopCount(matchVecORR) === 2.U) -> (writePtr + 2.U),
      (PopCount(matchVecORR) === 1.U) -> (writePtr + 1.U),
      (PopCount(matchVecORR) === 0.U) -> (writePtr + 0.U)
    )
  )
  // This code is to express my dissatisfaction with the way the group operates
  when(PopCount(matchVecORR) === 1.U) {
    when(io.MatchVec(0) > 0.U) {
      mem(writePtr) := io.data(0)
    }.elsewhen(io.MatchVec(1)>0.U) {
      mem(writePtr) := io.data(1)
    }.elsewhen(io.MatchVec(2)>0.U) {
      mem(writePtr) := io.data(2)
    }.elsewhen(io.MatchVec(3)>0.U){
      mem(writePtr) := io.data(3)
    }
  }.elsewhen(PopCount(matchVecORR) === 2.U){
    when((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1)> 0.U).asBool && (io.MatchVec(0) < io.MatchVec(1))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(1)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) > 0.U).asBool && (io.MatchVec(0) > io.MatchVec(1))){
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(0)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(2)> 0.U).asBool && (io.MatchVec(0) < io.MatchVec(2))){
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(2)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(2)> 0.U).asBool && (io.MatchVec(0) > io.MatchVec(2))){
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(0)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(3)> 0.U).asBool && (io.MatchVec(0) < io.MatchVec(3))){
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(3)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(3)> 0.U).asBool && (io.MatchVec(0) > io.MatchVec(3))){
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(0)
    }.elsewhen((io.MatchVec(1) > 0.U).asBool && (io.MatchVec(2)> 0.U).asBool && (io.MatchVec(1) < io.MatchVec(2))){
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(2)
    }.elsewhen((io.MatchVec(1) > 0.U).asBool && (io.MatchVec(2)> 0.U).asBool && (io.MatchVec(1) > io.MatchVec(2))){
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(1)
    }.elsewhen((io.MatchVec(1) > 0.U).asBool && (io.MatchVec(3)> 0.U).asBool && (io.MatchVec(1) < io.MatchVec(3))){
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(3)
    }.elsewhen((io.MatchVec(2) > 0.U).asBool && (io.MatchVec(3) > 0.U).asBool && (io.MatchVec(1) > io.MatchVec(3))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(1)
    }.elsewhen((io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) > 0.U).asBool && (io.MatchVec(2) < io.MatchVec(3))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(3)
    }.elsewhen((io.MatchVec(2) > 0.U).asBool && (io.MatchVec(3) > 0.U).asBool && (io.MatchVec(3) < io.MatchVec(2))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(2)
    }
  }.elsewhen(PopCount(matchVecORR) === 3.U) {
    when((io.MatchVec(1) > 0.U).asBool && (io.MatchVec(2) > 0.U).asBool && (io.MatchVec(3) > 0.U).asBool && (io.MatchVec(1) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(3))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(3)
    }.elsewhen((io.MatchVec(1) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(1) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(2))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(2)
    }.elsewhen((io.MatchVec(1) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(2) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(3))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(3)
    }.elsewhen((io.MatchVec(1) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(2) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(1))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(1)
    }.elsewhen((io.MatchVec(1) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(3) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(1))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(1)
    }.elsewhen((io.MatchVec(1) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(3) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(2))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(2)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(0) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(3))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(3)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(0) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(2))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(2)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(2) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(3)))  {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(3)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(2) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(0))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(0)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(3) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(0))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(0)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(3) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(2))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(2)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(0) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(3))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(3)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(0) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(1))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(1)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(1) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(3))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(3)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(1) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(0))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(0)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(3) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(0))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(0)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(3) >0.U).asBool && (io.MatchVec(3) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(1))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(1)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(0) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(2))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(2)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(0) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(1))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(1)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(1) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(2))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(2)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(1) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(0))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(0)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(2) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(0))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(0)
    }.elsewhen((io.MatchVec(0) > 0.U).asBool && (io.MatchVec(1) >0.U).asBool && (io.MatchVec(2) >0.U).asBool && (io.MatchVec(2) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(1))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(1)
    }
  }.elsewhen(PopCount(matchVecORR) === 4.U) {
    when((io.MatchVec(0) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(3))){
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(2)
      mem(writePtrP3) := io.data(3)
    }.elsewhen((io.MatchVec(0) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(2))){
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(3)
      mem(writePtrP3) := io.data(2)
    }.elsewhen((io.MatchVec(0) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(3))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(1)
      mem(writePtrP3) := io.data(3)
    }.elsewhen((io.MatchVec(0) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(1))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(3)
      mem(writePtrP3) := io.data(1)
    }.elsewhen((io.MatchVec(0) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(2))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(1)
      mem(writePtrP3) := io.data(2)
    }.elsewhen((io.MatchVec(0) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(1))) {
      mem(writePtr) := io.data(0)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(2)
      mem(writePtrP3) := io.data(1)
    }.elsewhen((io.MatchVec(1) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(0))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(3)
      mem(writePtrP3) := io.data(0)
    }.elsewhen((io.MatchVec(1) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(3))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(0)
      mem(writePtrP3) := io.data(3)
    }.elsewhen((io.MatchVec(1) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(2))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(0)
      mem(writePtrP3) := io.data(2)
    }.elsewhen((io.MatchVec(1) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(0))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(2)
      mem(writePtrP3) := io.data(0)
    }.elsewhen((io.MatchVec(1) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(3))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(2)
      mem(writePtrP3) := io.data(3)
    }.elsewhen((io.MatchVec(1) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(2))) {
      mem(writePtr) := io.data(1)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(3)
      mem(writePtrP3) := io.data(2)
    }.elsewhen((io.MatchVec(2) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(3))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(1)
      mem(writePtrP3) := io.data(3)
    }.elsewhen((io.MatchVec(2) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(1))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(3)
      mem(writePtrP3) := io.data(1)
    }.elsewhen((io.MatchVec(2) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(3))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(0)
      mem(writePtrP3) := io.data(3)
    }.elsewhen((io.MatchVec(2) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(0))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(3)
      mem(writePtrP3) := io.data(0)
    }.elsewhen((io.MatchVec(2) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(0))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(1)
      mem(writePtrP3) := io.data(0)
    }.elsewhen((io.MatchVec(2) < io.MatchVec(3)) && (io.MatchVec(3) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(1))) {
      mem(writePtr) := io.data(2)
      mem(writePtrP1) := io.data(3)
      mem(writePtrP2) := io.data(0)
      mem(writePtrP3) := io.data(1)
    }.elsewhen((io.MatchVec(3) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(1))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(0)
      mem(writePtrP3) := io.data(1)
    }.elsewhen((io.MatchVec(3) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(0))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(2)
      mem(writePtrP2) := io.data(1)
      mem(writePtrP3) := io.data(0)
    }.elsewhen((io.MatchVec(3) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(0))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(2)
      mem(writePtrP3) := io.data(0)
    }.elsewhen((io.MatchVec(3) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(2))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(1)
      mem(writePtrP2) := io.data(0)
      mem(writePtrP3) := io.data(2)
    }.elsewhen((io.MatchVec(3) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(1)) && (io.MatchVec(1) < io.MatchVec(2))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(1)
      mem(writePtrP3) := io.data(2)
    }.elsewhen((io.MatchVec(3) < io.MatchVec(0)) && (io.MatchVec(0) < io.MatchVec(2)) && (io.MatchVec(2) < io.MatchVec(1))) {
      mem(writePtr) := io.data(3)
      mem(writePtrP1) := io.data(0)
      mem(writePtrP2) := io.data(2)
      mem(writePtrP3) := io.data(1)
    }
  }
}

class InputBridge_M() extends Module {
  val io = IO(new Bundle() {
    val in_valid  = Input(Bool())
    val out_ready = Output(Bool())
    val ldIn      = Input(SInt(64.W))
    val in_ready  = Input(Bool())
    val out_valid_h = Output(Bool())
    val out_valid_v = Output(Bool())
    val in_a      = Output(Vec(2, SInt(4.W)))
    val in_b      = Output(Vec(2, SInt(4.W)))
  })

  val cnt     = RegInit(0.U(2.W))
  val in_ptr  = RegInit(false.B)
  when (in_ptr === false.B && cnt < 1.U && io.in_ready && io.in_valid ) {
    cnt := cnt + 1.U
    io.in_a(0) := io.ldIn(3, 0).asSInt
    io.in_a(1) := io.ldIn(7, 4).asSInt
    io.out_valid_h := io.in_valid
    io.out_valid_v := false.B
    io.in_b(0) := 0.S
    io.in_b(1) := 0.S
  }.elsewhen ( in_ptr === false.B && cnt === 1.U && io.in_ready && io.in_valid ) {
    in_ptr     := true.B
    cnt        := 0.U
    io.out_valid_h := io.in_valid
    io.out_valid_v := false.B
    io.in_a(0) := io.ldIn(3, 0).asSInt
    io.in_a(1) := io.ldIn(7, 4).asSInt
    io.in_b(0) := 0.S
    io.in_b(1) := 0.S
  }.elsewhen ( in_ptr === true.B && cnt < 1.U && io.in_ready && io.in_valid ) {
    cnt := cnt + 1.U
    io.in_a(0) := 0.S
    io.in_a(1) := 0.S
    io.out_valid_h := false.B
    io.out_valid_v := io.in_valid
    io.in_b(0) := io.ldIn(3, 0).asSInt
    io.in_b(1) := io.ldIn(7, 4).asSInt
  }.elsewhen ( in_ptr === true.B && cnt === 1.U && io.in_ready && io.in_valid ) {
    in_ptr     := false.B
    cnt        := 0.U
    io.in_a(0) := 0.S
    io.in_a(1) := 0.S
    io.out_valid_h := false.B
    io.out_valid_v := io.in_valid
    io.in_b(0) := io.ldIn(3, 0).asSInt
    io.in_b(1) := io.ldIn(7, 4).asSInt
  }.otherwise {
    io.out_valid_h := io.in_valid
    io.out_valid_v := io.in_valid
    io.in_a(0) := 0.S
    io.in_a(1) := 0.S
    io.in_b(0) := 0.S
    io.in_b(1) := 0.S
  }
  io.out_ready := io.in_ready
}

class miniTPUInput_M(val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Bundle {
  val in_a = Flipped(DecoupledIO(Vec(SA_ROWS, SInt(IN_WIDTH.W))))
  val in_b = Flipped(DecoupledIO(Vec(SA_COLS, SInt(IN_WIDTH.W))))
  val in_c = Input(Vec(SA_COLS, SInt(C_WIDTH.W)))
}

class miniTPUOutput_M(val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Bundle {
  val out_c = Output(Vec(SA_COLS, SInt(C_WIDTH.W)))
}

class miniTPUIO_M (val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Bundle {
  val in = new miniTPUInput_M(IN_WIDTH, C_WIDTH, SA_ROWS, SA_COLS)
  val out = DecoupledIO(new miniTPUOutput_M(IN_WIDTH, C_WIDTH, SA_ROWS, SA_COLS))
}

/*
   type-0 : pipeline systolic array
   type-1 : algorithm accelerator
   ...
*/
class top_M (val TYPE: Int, val IN_WIDTH: Int, val C_WIDTH: Int, val SA_ROWS: Int, val SA_COLS: Int) extends Module {
  val io = IO(new Bundle {
    val tpuIO = new miniTPUIO_M(IN_WIDTH, C_WIDTH, SA_ROWS, SA_COLS)
  })

  val sa = Module(new SystolicArray(IN_WIDTH,C_WIDTH,SA_ROWS,SA_COLS))
  val controller = Module(new Controller(SA_ROWS, SA_COLS))
  val inBuffer_h   = Module(new InputBuffer(IN_WIDTH, SA_ROWS, SA_COLS))  // horizontal and vertical data buffer
  val inBuffer_v  = Module(new InputBuffer(IN_WIDTH, SA_COLS, SA_ROWS)) // TODO: add control logic to select data( B or D)
  val outBuffer  = Module(new OutputBuffer(TYPE, C_WIDTH, SA_COLS, SA_ROWS))

  inBuffer_h.io.data_in.valid := io.tpuIO.in.in_a.valid
  inBuffer_h.io.data_in.bits := io.tpuIO.in.in_a.bits
  inBuffer_h.io.ctrl_ib_data_out := controller.io.ctrl_ib_data_out

  inBuffer_v.io.data_in.valid := io.tpuIO.in.in_b.valid
  inBuffer_v.io.data_in.bits := io.tpuIO.in.in_b.bits
  inBuffer_v.io.ctrl_ib_data_out := controller.io.ctrl_ib_data_out
  io.tpuIO.in.in_a.ready := inBuffer_h.io.data_in.ready
  io.tpuIO.in.in_b.ready := inBuffer_v.io.data_in.ready

  io.tpuIO.out.valid := outBuffer.io.data_out.valid
  io.tpuIO.out.bits.out_c := outBuffer.io.data_out.bits
  outBuffer.io.data_out.ready := io.tpuIO.out.ready
  outBuffer.io.ctrl_ob_data_in := controller.io.ctrl_ob_data_in

  sa.io.in_a := inBuffer_h.io.data_out
  sa.io.in_b := inBuffer_v.io.data_out
  sa.io.in_c := io.tpuIO.in.in_c  // TODO: preload in_c as bias
  outBuffer.io.data_in := sa.io.out_c
  sa.io.in_control.foreach(_.ctrl_sa_send_data := controller.io.ctrl_sa_send_data)

  controller.io.ibh_data_in_done := inBuffer_h.io.ib_data_in_done
  controller.io.ibv_data_in_done := inBuffer_v.io.ib_data_in_done
  controller.io.ob_empty := outBuffer.io.ob_empty
}
