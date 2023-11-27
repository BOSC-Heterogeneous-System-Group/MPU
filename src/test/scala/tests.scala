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

  "test_xs_miniTPU" in {
    (new ChiselStage).emitVerilog(new top(0,4, 16, 2, 2), Array("--target-dir", "./genVerilog/xs_miniTPU"))

    test(new XS_miniTPU()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.xsIO.in.valid.poke(false.B)
      dut.io.xsIO.out.ready.poke(false.B)
      dut.io.xsIO.in.bits.src(0).poke(0.U)
      dut.io.xsIO.in.bits.src(1).poke(0.U)
      dut.io.xsIO.in.bits.uop.poke(false.B)

      dut.clock.step()
      dut.io.xsIO.in.valid.poke(true.B)
      dut.io.xsIO.in.bits.src(0).poke(17185.U)
      dut.io.xsIO.in.bits.src(1).poke(4097.U)
      dut.io.xsIO.in.bits.uop.poke(true.B)

      dut.clock.step()

      dut.io.xsIO.in.valid.poke(false.B)
      dut.io.xsIO.in.bits.src(0).poke(0.U)
      dut.io.xsIO.in.bits.src(1).poke(0.U)
      dut.io.xsIO.in.bits.uop.poke(false.B)

      dut.clock.step(18)

      dut.io.xsIO.out.ready.poke(true.B)

      dut.clock.step(20)
//
//      dut.io.xsIO.out.ready.poke(false.B)
//      dut.clock.step(20)


      println("test pass")
    }
  }
  "test_top_wrapper_2X2" in {
    (new ChiselStage).emitVerilog(new top(1, 4, 16, 2, 2), Array("--target-dir", "./genVerilog/top"))

    test(new top(1,4, 16, 2, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.tpuIO.in.valid.poke(false.B)
      dut.io.tpuIO.out.ready.poke(false.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.S)

      dut.clock.step()

      dut.io.tpuIO.in.valid.poke(true.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(1.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(3.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(1.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.S)

      dut.clock.step()



      // test invalid
      //      dut.io.in.valid.poke(false.B)
      //      dut.io.in.bits.in_a(0).poke(6.S)
      //      dut.io.in.bits.in_a(1).poke(6.S)
      //      dut.io.in.bits.in_b(0).poke(6.S)
      //      dut.io.in.bits.in_b(1).poke(6.S)
      //      dut.io.in.bits.in_c(0).poke(0.S)
      //      dut.io.in.bits.in_c(1).poke(0.S)
      //
      //      dut.clock.step()

      dut.io.tpuIO.in.valid.poke(true.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(2.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(4.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(1.S)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.S)

      dut.clock.step()
      dut.io.tpuIO.in.valid.poke(false.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.S)

      dut.clock.step()



      dut.io.tpuIO.in.bits.in_a(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.S)

      dut.clock.step(18)
      dut.clock.step()


      dut.io.tpuIO.in.valid.poke(true.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(-1.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(-3.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(1.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.S)

      dut.clock.step()

      dut.io.tpuIO.in.valid.poke(true.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(-2.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(-4.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(1.S)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.S)

      dut.clock.step()

      dut.io.tpuIO.in.valid.poke(false.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.S)

      dut.clock.step(10)

      dut.io.tpuIO.out.ready.poke(true.B)

      dut.clock.step()

      dut.io.tpuIO.out.ready.poke(false.B)

      dut.clock.step()

      dut.io.tpuIO.out.ready.poke(true.B)

      dut.clock.step(20)

      println("test pass")

    }
  }




}





