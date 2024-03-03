package miniTPU

import chisel3._
import chisel3.util._

class Scoreboard() extends Module {
  val io = IO(new Bundle {
    //val uop = Input(Vec(8, UInt(64.W)))
    val valid = Input(Vec(8, Bool()))
    val opcode = Input(Vec(8, UInt(7.W)))
    val robIdx = Input(Vec(8, UInt(4.W)))
    val commit_pc = Input(Vec(6, UInt(7.W)))
    val commit_valid = Input(Vec(6, Bool()))
    val wr_en = Input(Vec(3, Bool()))
    val wr_robIdx = Input(Vec(3, UInt(7.W)))
    val robIdx_sort = Output(Vec(8, UInt(4.W)))
    val oopcode_sort = Output(Vec(8, UInt(7.W)))
    val idx_sort = Output(Vec(8, UInt(4.W)))
  })

  val s_idle :: s_wait :: s_commit :: s_ready :: Nil = Enum(4)

  val cmp = Seq.fill(8)(Wire(Vec(7, Bool())))
  val cmp_u = cmp.map(c => dontTouch(c.asUInt))

  val robIdx_order = dontTouch(WireInit(VecInit(Seq.fill(8)(0.U(4.W)))))
  val Idx_order = dontTouch(WireInit(VecInit(Seq.fill(8)(0.U(4.W)))))
  val opcode_order = dontTouch(WireInit(VecInit(Seq.fill(8)(0.U(7.W)))))
  val valid_order = dontTouch(WireInit(VecInit(Seq.fill(8)(false.B))))
  val enq_offset = dontTouch(Wire(Vec(8, UInt(6.W))))

  val opcode_array = dontTouch(Reg(Vec(32, UInt(7.W))))
  val state_array = dontTouch(RegInit(VecInit(Seq.fill(32)(s_idle))))
  val writePtr = RegInit(0.U(6.W))
  val next_writePtr = Wire(UInt(6.W))
  val readPtr = dontTouch(RegInit(0.U(6.W)))

  val commitVec = Seq.tabulate(3)(i =>
    VecInit.tabulate(32)(j =>
      state_array(j) === s_commit && io.wr_en(i) && io.wr_robIdx(i) === opcode_array(j)
    )
  )

  val offset = (0 until 8).map(i => PopCount(valid_order.take(i)))
  enq_offset := offset

  next_writePtr := writePtr + PopCount(valid_order)
  writePtr := next_writePtr

  io.robIdx_sort := robIdx_order
  io.idx_sort := Idx_order
  io.oopcode_sort := opcode_order

  for (i <- 0 until 8) {
    for (j <- 0 until i) {
      cmp(i)(j) := io.robIdx(i) > io.robIdx(j)
    }
    for (j <- i until 7) {
      cmp(i)(j) := io.robIdx(i) > io.robIdx(j + 1)
    }

    robIdx_order(PopCount(cmp_u(i))) := io.robIdx(i)
    Idx_order(PopCount(cmp_u(i))) := i.U
    opcode_order(i) := io.opcode(Idx_order(i))
    valid_order(i) := io.valid(Idx_order(i))
  }

  // enqueue
  for (i <- 0 until 8) {
    when(state_array(i) === s_idle && valid_order(i) === true.B){
      opcode_array(writePtr(4, 0) +enq_offset(i)) := opcode_order(i)
      state_array(writePtr(4, 0) +enq_offset(i)) := s_wait
    }
  }

  // state switch

  for (i <- 0 until 31) {
    val commitConditions = Seq.tabulate(6)(j =>
      state_array(i) === s_wait && io.commit_valid(j) && io.commit_pc(j) === opcode_array(i)
    )
    val commit_flag = commitConditions.reduce(_ || _)
    when(state_array(i) === s_wait) {
      state_array(i) := Mux(commit_flag, s_commit, s_wait)
    }
  }

  /*for (i <- 0 until 31) {
    for (j <- 0 until 6) {
      when (state_array(i) === s_wait && io.commit_valid(j) === true.B && io.commit_pc(j) === opcode_array(i)) {
        state_array(i) := s_commit
      }
    }
  }*/
  for (i <- 0 until 3) {
    when(commitVec(i).asUInt.orR) {
      state_array(PriorityEncoder(commitVec(i))) := s_ready
    }
  }
  /*for (i <- 0 until 31) {
    val writebackConditions = Seq.tabulate(3)(j =>
      state_array(i) === s_commit && io.wr_en(j) && io.wr_robIdx(j) === opcode_array(i)
    )

    val writeback_flag = writebackConditions.reduce(_ || _)
    when(state_array(i) === s_commit) {
      state_array(i) := Mux(writeback_flag, s_ready, s_commit)
    }

  }*/

    // dequeue
  when(state_array(readPtr) === s_ready) {
    state_array(readPtr) := s_idle
    readPtr := readPtr + 1.U
  }

}