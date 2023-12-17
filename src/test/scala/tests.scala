package test.scala

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.stage._
import miniTPU._
import miniTPU.SystolicArray.Multiplier.wallaceTree
import miniTPU.SystolicArray.Multiplier._

// this file only holds the test for the top module
// when you pull request, do not add test for other modules
// test modules in your own branch instead of master

class tests extends AnyFreeSpec with ChiselScalatestTester {

  "test_multiplier" in {
    (new ChiselStage).emitVerilog(new Multiplier(4, 8), Array("--target-dir", "./genVerilog/Multiplier"))

    test(new Multiplier(4, 8)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.input.multiplicand.poke(0.S)
      dut.input.multiplier.poke(0.S)

      dut.clock.step()

      dut.input.multiplicand.poke(2.S)
      dut.input.multiplier.poke(-4.S)


      dut.clock.step()

      println("test pass")

    }
  }

  "test_wallace_tree" in {
    (new ChiselStage).emitVerilog(new wallaceTree(16,5), Array("--target-dir", "./genVerilog/wallace_tree"))

    test(new wallaceTree(16, 5)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.data_i(0).poke(0.S)
      dut.io.data_i(1).poke(0.S)
      dut.io.data_i(2).poke(0.S)
      dut.io.data_i(3).poke(0.S)
      dut.io.data_i(4).poke(0.S)

      dut.clock.step()

      dut.io.data_i(0).poke(1.S)
      dut.io.data_i(1).poke(2.S)
      dut.io.data_i(2).poke(3.S)
      dut.io.data_i(3).poke(4.S)
      dut.io.data_i(4).poke(5.S)

      dut.clock.step()

      println("test pass")

    }
  }

  "test_matu" in {
    (new ChiselStage).emitVerilog(new XS_miniTPU_M(), Array("--target-dir", "./genVerilog/ROB_WRAPPER"))

    test(new XS_miniTPU_M()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.xsIO.in(0).bits.ldIn.poke(1.U)
      dut.io.xsIO.in(1).bits.ldIn.poke(2.U)
      dut.io.xsIO.in(0).bits.robIdx.poke(1.U)
      dut.io.xsIO.in(1).bits.robIdx.poke(2.U)
      dut.io.xsIO.in(0).bits.uop.poke(7.U)
      dut.io.xsIO.in(1).bits.uop.poke(7.U)
      dut.io.xsIO.in(0).valid.poke(true.B)
      dut.io.xsIO.in(1).valid.poke(true.B)
      dut.io.xsIO.deqptr(0).poke(3.U)
      dut.io.xsIO.deqptr(1).poke(4.U)
      dut.io.xsIO.deqptr(2).poke(2.U)
      dut.io.xsIO.deqptr(3).poke(1.U)
      dut.io.xsIO.deqptr(4).poke(5.U)
      dut.io.xsIO.deqptr(5).poke(6.U)
      dut.io.xsIO.out.ready.poke(true.B)

      dut.clock.step()
      dut.io.xsIO.in(0).bits.ldIn.poke(3.U)
      dut.io.xsIO.in(1).bits.ldIn.poke(4.U)
      dut.io.xsIO.in(0).bits.robIdx.poke(3.U)
      dut.io.xsIO.in(1).bits.robIdx.poke(4.U)
      dut.io.xsIO.in(0).bits.uop.poke(7.U)
      dut.io.xsIO.in(1).bits.uop.poke(7.U)
      dut.io.xsIO.in(0).valid.poke(true.B)
      dut.io.xsIO.in(1).valid.poke(true.B)
      dut.io.xsIO.deqptr(0).poke(3.U)
      dut.io.xsIO.deqptr(1).poke(1.U)
      dut.io.xsIO.deqptr(2).poke(2.U)
      dut.io.xsIO.deqptr(3).poke(0.U)
      dut.io.xsIO.deqptr(4).poke(0.U)
      dut.io.xsIO.deqptr(5).poke(0.U)


      dut.clock.step()

      dut.io.xsIO.in(0).bits.ldIn.poke(0.U)
      dut.io.xsIO.in(1).bits.ldIn.poke(0.U)
      dut.io.xsIO.in(0).bits.robIdx.poke(0.U)
      dut.io.xsIO.in(1).bits.robIdx.poke(0.U)
      dut.io.xsIO.in(0).bits.uop.poke(0.U)
      dut.io.xsIO.in(1).bits.uop.poke(0.U)
      dut.io.xsIO.in(0).valid.poke(true.B)
      dut.io.xsIO.in(1).valid.poke(true.B)
      dut.io.xsIO.deqptr(0).poke(0.U)
      dut.io.xsIO.deqptr(1).poke(0.U)
      dut.io.xsIO.deqptr(2).poke(0.U)
      dut.io.xsIO.deqptr(3).poke(0.U)
      dut.io.xsIO.deqptr(4).poke(0.U)
      dut.io.xsIO.deqptr(5).poke(0.U)

      dut.clock.step()

      dut.io.xsIO.in(0).bits.ldIn.poke(0.U)
      dut.io.xsIO.in(1).bits.ldIn.poke(5.U)
      dut.io.xsIO.in(0).bits.robIdx.poke(5.U)
      dut.io.xsIO.in(1).bits.robIdx.poke(6.U)
      dut.io.xsIO.in(0).bits.uop.poke(0.U)
      dut.io.xsIO.in(1).bits.uop.poke(0.U)
      dut.io.xsIO.in(0).valid.poke(false.B)
      dut.io.xsIO.in(1).valid.poke(false.B)
      dut.io.xsIO.deqptr(0).poke(4.U)
      dut.io.xsIO.deqptr(1).poke(1.U)
      dut.io.xsIO.deqptr(2).poke(3.U)
      dut.io.xsIO.deqptr(3).poke(0.U)
      dut.io.xsIO.deqptr(4).poke(0.U)
      dut.io.xsIO.deqptr(5).poke(0.U)

      dut.clock.step()

      dut.io.xsIO.in(0).bits.ldIn.poke(0.U)
      dut.io.xsIO.in(1).bits.ldIn.poke(0.U)
      dut.io.xsIO.in(0).bits.robIdx.poke(0.U)
      dut.io.xsIO.in(1).bits.robIdx.poke(0.U)
      dut.io.xsIO.in(0).bits.uop.poke(0.U)
      dut.io.xsIO.in(1).bits.uop.poke(0.U)
      dut.io.xsIO.in(0).valid.poke(true.B)
      dut.io.xsIO.in(1).valid.poke(true.B)
      dut.io.xsIO.deqptr(0).poke(0.U)
      dut.io.xsIO.deqptr(1).poke(0.U)
      dut.io.xsIO.deqptr(2).poke(0.U)
      dut.io.xsIO.deqptr(3).poke(0.U)
      dut.io.xsIO.deqptr(4).poke(0.U)
      dut.io.xsIO.deqptr(5).poke(0.U)

      dut.clock.step()
      dut.clock.step(20)

      println("test pass")

    }
  }

  "ldBuffer" in {
    (new ChiselStage).emitVerilog(new SA_ROB(), Array("--target-dir", "./genVerilog/ldBuffer"))

    test(new SA_ROB()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.ldin.data(0).poke(1.U)
      dut.io.ldin.data(1).poke(2.U)
      dut.io.ldin.robIdx(0).poke(1.U)
      dut.io.ldin.robIdx(1).poke(2.U)
      dut.io.ldin.fuOptype(0).poke(6.U)
      dut.io.ldin.fuOptype(1).poke(7.U)
      dut.io.ldin.valid(0).poke(true.B)
      dut.io.ldin.valid(1).poke(true.B)
      dut.io.deqptr(0).poke(3.U)
      dut.io.deqptr(1).poke(4.U)
      dut.io.deqptr(2).poke(7.U)
      dut.io.deqptr(3).poke(8.U)
      dut.io.deqptr(4).poke(5.U)
      dut.io.deqptr(5).poke(6.U)
      dut.io.out.ready.poke(true.B)

      dut.clock.step()
      dut.io.ldin.data(0).poke(3.U)
      dut.io.ldin.data(1).poke(4.U)
      dut.io.ldin.robIdx(0).poke(3.U)
      dut.io.ldin.robIdx(1).poke(4.U)
      dut.io.ldin.fuOptype(0).poke(6.U)
      dut.io.ldin.fuOptype(1).poke(7.U)
      dut.io.ldin.valid(0).poke(true.B)
      dut.io.ldin.valid(1).poke(true.B)
      dut.io.deqptr(0).poke(4.U)
      dut.io.deqptr(1).poke(1.U)
      dut.io.deqptr(2).poke(2.U)
      dut.io.deqptr(3).poke(0.U)
      dut.io.deqptr(4).poke(0.U)
      dut.io.deqptr(5).poke(0.U)


      dut.clock.step()

      dut.io.ldin.data(0).poke(0.U)
      dut.io.ldin.data(1).poke(5.U)
      dut.io.ldin.robIdx(0).poke(0.U)
      dut.io.ldin.robIdx(1).poke(3.U)
      dut.io.ldin.fuOptype(0).poke(0.U)
      dut.io.ldin.fuOptype(1).poke(7.U)
      dut.io.ldin.valid(0).poke(true.B)
      dut.io.ldin.valid(1).poke(true.B)
      dut.io.deqptr(0).poke(1.U)
      dut.io.deqptr(1).poke(2.U)
      dut.io.deqptr(2).poke(3.U)
      dut.io.deqptr(3).poke(0.U)
      dut.io.deqptr(4).poke(0.U)
      dut.io.deqptr(5).poke(0.U)

      dut.clock.step()

      dut.io.ldin.data(0).poke(0.U)
      dut.io.ldin.data(1).poke(5.U)
      dut.io.ldin.robIdx(0).poke(5.U)
      dut.io.ldin.robIdx(1).poke(6.U)
      dut.io.ldin.fuOptype(0).poke(0.U)
      dut.io.ldin.fuOptype(1).poke(7.U)
      dut.io.ldin.valid(0).poke(true.B)
      dut.io.ldin.valid(1).poke(false.B)
      dut.io.deqptr(0).poke(4.U)
      dut.io.deqptr(1).poke(1.U)
      dut.io.deqptr(2).poke(3.U)
      dut.io.deqptr(3).poke(5.U)
      dut.io.deqptr(4).poke(6.U)
      dut.io.deqptr(5).poke(0.U)

      dut.clock.step()

      dut.io.ldin.data(0).poke(0.U)
      dut.io.ldin.data(1).poke(6.U)
      dut.io.ldin.robIdx(0).poke(0.U)
      dut.io.ldin.robIdx(1).poke(4.U)
      dut.io.ldin.fuOptype(0).poke(0.U)
      dut.io.ldin.fuOptype(1).poke(7.U)
      dut.io.ldin.valid(0).poke(true.B)
      dut.io.ldin.valid(1).poke(true.B)
      dut.io.deqptr(0).poke(0.U)
      dut.io.deqptr(1).poke(4.U)
      dut.io.deqptr(2).poke(0.U)
      dut.io.deqptr(3).poke(0.U)
      dut.io.deqptr(4).poke(0.U)
      dut.io.deqptr(5).poke(0.U)

      dut.clock.step()

      dut.io.ldin.data(0).poke(0.U)
      dut.io.ldin.data(1).poke(0.U)
      dut.io.ldin.robIdx(0).poke(0.U)
      dut.io.ldin.robIdx(1).poke(0.U)
      dut.io.ldin.fuOptype(0).poke(0.U)
      dut.io.ldin.fuOptype(1).poke(0.U)
      dut.io.ldin.valid(0).poke(false.B)
      dut.io.ldin.valid(1).poke(false.B)
      dut.io.deqptr(0).poke(0.U)
      dut.io.deqptr(1).poke(4.U)
      dut.io.deqptr(2).poke(0.U)
      dut.io.deqptr(3).poke(0.U)
      dut.io.deqptr(4).poke(0.U)
      dut.io.deqptr(5).poke(0.U)

      dut.clock.step(10)

      println("test pass")

    }
  }

//  "test_xs_miniTPU" in {
//    (new ChiselStage).emitVerilog(new top(0,4, 16, 2, 2), Array("--target-dir", "./genVerilog/xs_miniTPU"))
//
//    test(new XS_miniTPU_R()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
//      dut.io.xsIO.in.valid.poke(false.B)
//      dut.io.xsIO.out.ready.poke(false.B)
//      dut.io.xsIO.in.bits.src(0).poke(0.U)
//      dut.io.xsIO.in.bits.src(1).poke(0.U)
//      dut.io.xsIO.in.bits.uop.poke(7.U)
//
//      dut.clock.step()
//      dut.io.xsIO.in.valid.poke(true.B)
//      dut.io.xsIO.in.bits.ldIn.poke(49.U)
//      dut.io.xsIO.in.bits.src(0).poke(0.U)
//      dut.io.xsIO.in.bits.src(1).poke(0.U)
//
//      dut.clock.step()
//
//      dut.io.xsIO.in.valid.poke(false.B)
//      dut.io.xsIO.in.bits.ldIn.poke(49.U)
//      dut.io.xsIO.in.bits.src(0).poke(0.U)
//      dut.io.xsIO.in.bits.src(1).poke(0.U)
//
//
//      dut.clock.step()
//
//      dut.io.xsIO.in.valid.poke(true.B)
//      dut.io.xsIO.in.bits.ldIn.poke(66.U)
//      dut.io.xsIO.in.bits.src(0).poke(0.U)
//      dut.io.xsIO.in.bits.src(1).poke(0.U)
//
//
//      dut.clock.step()
//
//
//      dut.io.xsIO.in.valid.poke(false.B)
//      dut.io.xsIO.in.bits.ldIn.poke(66.U)
//      dut.io.xsIO.in.bits.src(0).poke(0.U)
//      dut.io.xsIO.in.bits.src(1).poke(0.U)
//
//
//      dut.clock.step()
//
//
//
//      dut.io.xsIO.in.valid.poke(true.B)
//      dut.io.xsIO.in.bits.ldIn.poke(1.U)
//      dut.io.xsIO.in.bits.src(0).poke(0.U)
//      dut.io.xsIO.in.bits.src(1).poke(0.U)
//
//
//      dut.clock.step()
//
//      dut.io.xsIO.in.valid.poke(false.B)
//      dut.io.xsIO.in.bits.ldIn.poke(66.U)
//      dut.io.xsIO.in.bits.src(0).poke(0.U)
//      dut.io.xsIO.in.bits.src(1).poke(0.U)
//
//
//      dut.clock.step()
//
//      dut.io.xsIO.in.valid.poke(true.B)
//      dut.io.xsIO.in.bits.ldIn.poke(16.U)
//      dut.io.xsIO.in.bits.src(0).poke(0.U)
//      dut.io.xsIO.in.bits.src(1).poke(0.U)
//
//      dut.clock.step()
//
//      dut.io.xsIO.in.valid.poke(false.B)
//      dut.io.xsIO.in.bits.ldIn.poke(0.U)
//      dut.io.xsIO.in.bits.src(0).poke(0.U)
//      dut.io.xsIO.in.bits.src(1).poke(0.U)
//
//
//      dut.clock.step(18)
//
//      dut.io.xsIO.out.ready.poke(true.B)
//
//      dut.clock.step(20)
////
////      dut.io.xsIO.out.ready.poke(false.B)
////      dut.clock.step(20)
//
//
//      println("test pass")
//    }
//  }
//  "test_top_wrapper_2X2" in {
//    (new ChiselStage).emitVerilog(new top_R(1, 4, 16, 2, 2), Array("--target-dir", "./genVerilog/top"))
//
//    test(new top_R(1,4, 16, 2, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
//      dut.io.tpuIO.in.in_a.valid.poke(false.B)
//      dut.io.tpuIO.in.in_b.valid.poke(false.B)
//      dut.io.tpuIO.out.ready.poke(false.B)
//      dut.io.tpuIO.in.in_a.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_a.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_c(0).poke(0.S)
//      dut.io.tpuIO.in.in_c(1).poke(0.S)
//
//      dut.clock.step()
//
//      dut.io.tpuIO.in.in_a.valid.poke(true.B)
//      dut.io.tpuIO.in.in_b.valid.poke(true.B)
//      dut.io.tpuIO.in.in_a.bits(0).poke(1.S)
//      dut.io.tpuIO.in.in_a.bits(1).poke(3.S)
//      dut.io.tpuIO.in.in_b.bits(0).poke(1.S)
//      dut.io.tpuIO.in.in_b.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_c(0).poke(0.S)
//      dut.io.tpuIO.in.in_c(1).poke(0.S)
//
//      dut.clock.step()
//
//
//
//      // test invalid
//      //      dut.io.in.valid.poke(false.B)
//      //      dut.io.in.bits.in_a(0).poke(6.S)
//      //      dut.io.in.bits.in_a(1).poke(6.S)
//      //      dut.io.in.bits.in_b(0).poke(6.S)
//      //      dut.io.in.bits.in_b(1).poke(6.S)
//      //      dut.io.in.bits.in_c(0).poke(0.S)
//      //      dut.io.in.bits.in_c(1).poke(0.S)
//      //
//      //      dut.clock.step()
//
//      dut.io.tpuIO.in.in_a.valid.poke(true.B)
//      dut.io.tpuIO.in.in_b.valid.poke(true.B)
//      dut.io.tpuIO.in.in_a.bits(0).poke(2.S)
//      dut.io.tpuIO.in.in_a.bits(1).poke(4.S)
//      dut.io.tpuIO.in.in_b.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(1).poke(1.S)
//      dut.io.tpuIO.in.in_c(0).poke(0.S)
//      dut.io.tpuIO.in.in_c(1).poke(0.S)
//
//      dut.clock.step()
//      dut.io.tpuIO.in.in_a.valid.poke(false.B)
//      dut.io.tpuIO.in.in_b.valid.poke(false.B)
//      dut.io.tpuIO.in.in_a.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_a.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_c(0).poke(0.S)
//      dut.io.tpuIO.in.in_c(1).poke(0.S)
//
//      dut.clock.step()
//
//
//      dut.io.tpuIO.in.in_a.valid.poke(false.B)
//      dut.io.tpuIO.in.in_b.valid.poke(false.B)
//      dut.io.tpuIO.in.in_a.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_a.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_c(0).poke(0.S)
//      dut.io.tpuIO.in.in_c(1).poke(0.S)
//
//      dut.clock.step(18)
//      dut.clock.step()
//
//
//      dut.io.tpuIO.in.in_a.valid.poke(false.B)
//      dut.io.tpuIO.in.in_b.valid.poke(false.B)
//      dut.io.tpuIO.in.in_a.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_a.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_c(0).poke(0.S)
//      dut.io.tpuIO.in.in_c(1).poke(0.S)
//
//      dut.clock.step()
//
//      dut.io.tpuIO.in.in_a.valid.poke(false.B)
//      dut.io.tpuIO.in.in_b.valid.poke(false.B)
//      dut.io.tpuIO.in.in_a.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_a.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_c(0).poke(0.S)
//      dut.io.tpuIO.in.in_c(1).poke(0.S)
//
//      dut.clock.step()
//
//      dut.io.tpuIO.in.in_a.valid.poke(false.B)
//      dut.io.tpuIO.in.in_b.valid.poke(false.B)
//      dut.io.tpuIO.in.in_a.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_a.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(0).poke(0.S)
//      dut.io.tpuIO.in.in_b.bits(1).poke(0.S)
//      dut.io.tpuIO.in.in_c(0).poke(0.S)
//      dut.io.tpuIO.in.in_c(1).poke(0.S)
//
//      dut.clock.step(10)
//
//      dut.io.tpuIO.out.ready.poke(true.B)
//
//      dut.clock.step()
//
//      dut.io.tpuIO.out.ready.poke(false.B)
//
//      dut.clock.step()
//
//      dut.io.tpuIO.out.ready.poke(true.B)
//
//      dut.clock.step(20)
//
//      println("test pass")
//
//    }
//  }




}





