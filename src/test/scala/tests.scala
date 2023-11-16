package test.scala

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.stage._
import miniTPU._

// this file only holds the test for the top module
// when you pull request, do not add test for other modules
// test modules in your own branch instead of master

class tests extends AnyFreeSpec with ChiselScalatestTester {

  "test_top_2X2" in {
    (new ChiselStage).emitVerilog(new top(8, 32, 2, 2), Array("--target-dir", "./genVerilog/top"))

    test(new top(8, 32, 2, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.in_start.poke(false.B)
      dut.io.in_valid.poke(false.B)
      dut.io.in_ready.poke(false.B)
      dut.io.in_a(0).poke(0.U)
      dut.io.in_a(1).poke(0.U)
      dut.io.in_b(0).poke(0.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()

      dut.io.in_start.poke(true.B)
      dut.io.in_valid.poke(true.B)
      dut.io.in_a(0).poke(1.U)
      dut.io.in_a(1).poke(3.U)
      dut.io.in_b(0).poke(5.U)
      dut.io.in_b(1).poke(6.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()

      // test invalid
//      dut.io.in_start.poke(false.B)
//      dut.io.in_valid.poke(false.B)
//      dut.io.in_a(0).poke(6.U)
//      dut.io.in_a(1).poke(6.U)
//      dut.io.in_b(0).poke(6.U)
//      dut.io.in_b(1).poke(6.U)
//      dut.io.in_c(0).poke(0.U)
//      dut.io.in_c(1).poke(0.U)
//
//      dut.clock.step()

      dut.io.in_start.poke(false.B)
      dut.io.in_valid.poke(true.B)
      dut.io.in_a(0).poke(2.U)
      dut.io.in_a(1).poke(4.U)
      dut.io.in_b(0).poke(7.U)
      dut.io.in_b(1).poke(8.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()
      dut.io.in_valid.poke(false.B)
      dut.io.in_a(0).poke(0.U)
      dut.io.in_a(1).poke(0.U)
      dut.io.in_b(0).poke(0.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()

      dut.io.in_a(0).poke(0.U)
      dut.io.in_a(1).poke(0.U)
      dut.io.in_b(0).poke(0.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step(20)

      dut.io.in_ready.poke(true.B)

      dut.clock.step(3)

      dut.io.in_ready.poke(false.B)

      dut.clock.step(20)

      println("test pass")

    }
  }

  "test_top_wrapper_2X2" in {
    (new ChiselStage).emitVerilog(new top(8, 32, 2, 2), Array("--target-dir", "./genVerilog/top"))

    test(new top_wrapper(8, 32, 2, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.start.poke(false.B)
      dut.io.tpuIO.in.valid.poke(false.B)
      dut.io.tpuIO.out.ready.poke(false.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_a(1).poke(0.U)
      dut.io.tpuIO.in.bits.in_b(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_b(1).poke(0.U)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.U)

      dut.clock.step()

      dut.io.start.poke(true.B)
      dut.io.tpuIO.in.valid.poke(true.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(1.U)
      dut.io.tpuIO.in.bits.in_a(1).poke(3.U)
      dut.io.tpuIO.in.bits.in_b(0).poke(5.U)
      dut.io.tpuIO.in.bits.in_b(1).poke(6.U)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.U)

      dut.clock.step()

      // test invalid
      //      dut.io.start.poke(false.B)
      //      dut.io.in.valid.poke(false.B)
      //      dut.io.in.bits.in_a(0).poke(6.U)
      //      dut.io.in.bits.in_a(1).poke(6.U)
      //      dut.io.in.bits.in_b(0).poke(6.U)
      //      dut.io.in.bits.in_b(1).poke(6.U)
      //      dut.io.in.bits.in_c(0).poke(0.U)
      //      dut.io.in.bits.in_c(1).poke(0.U)
      //
      //      dut.clock.step()

      dut.io.start.poke(false.B)
      dut.io.tpuIO.in.valid.poke(true.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(2.U)
      dut.io.tpuIO.in.bits.in_a(1).poke(4.U)
      dut.io.tpuIO.in.bits.in_b(0).poke(7.U)
      dut.io.tpuIO.in.bits.in_b(1).poke(8.U)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.U)

      dut.clock.step()
      dut.io.tpuIO.in.valid.poke(false.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_a(1).poke(0.U)
      dut.io.tpuIO.in.bits.in_b(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_b(1).poke(0.U)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.U)

      dut.clock.step()

      dut.io.tpuIO.in.bits.in_a(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_a(1).poke(0.U)
      dut.io.tpuIO.in.bits.in_b(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_b(1).poke(0.U)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.U)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.U)

      dut.clock.step(20)

      dut.io.tpuIO.out.ready.poke(true.B)

      dut.clock.step(3)

      dut.io.tpuIO.out.ready.poke(false.B)

      dut.clock.step(20)

      println("test pass")

    }
  }


  "test_top_4X4" in {
    (new ChiselStage).emitVerilog(new top(8, 32, 4, 4), Array("--target-dir", "./genVerilog/top"))

    test(new top(8, 32, 4, 4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.in_start.poke(false.B)
      dut.io.in_a(0).poke(0.U)
      dut.io.in_a(1).poke(0.U)
      dut.io.in_a(2).poke(0.U)
      dut.io.in_a(3).poke(0.U)
      dut.io.in_b(0).poke(0.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_b(2).poke(0.U)
      dut.io.in_b(3).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)
      dut.io.in_c(2).poke(0.U)
      dut.io.in_c(3).poke(0.U)

      dut.clock.step()

      dut.io.in_start.poke(true.B)
      dut.io.in_a(0).poke(1.U)
      dut.io.in_a(1).poke(5.U)
      dut.io.in_a(2).poke(9.U)
      dut.io.in_a(3).poke(13.U)
      dut.io.in_b(0).poke(1.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_b(2).poke(0.U)
      dut.io.in_b(3).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)
      dut.io.in_c(2).poke(0.U)
      dut.io.in_c(3).poke(0.U)

      dut.clock.step()

      dut.io.in_start.poke(false.B)
      dut.io.in_a(0).poke(2.U)
      dut.io.in_a(1).poke(6.U)
      dut.io.in_a(2).poke(10.U)
      dut.io.in_a(3).poke(14.U)
      dut.io.in_b(0).poke(0.U)
      dut.io.in_b(1).poke(1.U)
      dut.io.in_b(2).poke(0.U)
      dut.io.in_b(3).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)
      dut.io.in_c(2).poke(0.U)
      dut.io.in_c(3).poke(0.U)

      dut.clock.step()

      dut.io.in_a(0).poke(3.U)
      dut.io.in_a(1).poke(7.U)
      dut.io.in_a(2).poke(11.U)
      dut.io.in_a(3).poke(15.U)
      dut.io.in_b(0).poke(0.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_b(2).poke(1.U)
      dut.io.in_b(3).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)
      dut.io.in_c(2).poke(0.U)
      dut.io.in_c(3).poke(0.U)

      dut.clock.step()

      dut.io.in_a(0).poke(4.U)
      dut.io.in_a(1).poke(8.U)
      dut.io.in_a(2).poke(12.U)
      dut.io.in_a(3).poke(16.U)
      dut.io.in_b(0).poke(0.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_b(2).poke(0.U)
      dut.io.in_b(3).poke(1.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)
      dut.io.in_c(2).poke(0.U)
      dut.io.in_c(3).poke(0.U)

      dut.clock.step(40)

      println("test pass")

    }
  }



}





