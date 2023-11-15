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

  "test_top" in {
    (new ChiselStage).emitVerilog(new top(8, 32, 2, 2), Array("--target-dir", "./genVerilog/top"))

    test(new top(8, 32, 2, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.start.poke(false.B)
      dut.io.in_a(0).poke(0.U)
      dut.io.in_a(1).poke(0.U)
      dut.io.in_b(0).poke(0.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()

      dut.io.start.poke(true.B)
      dut.io.in_a(0).poke(1.U)
      dut.io.in_a(1).poke(3.U)
      dut.io.in_b(0).poke(5.U)
      dut.io.in_b(1).poke(6.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()

      dut.io.start.poke(false.B)
      dut.io.in_a(0).poke(2.U)
      dut.io.in_a(1).poke(4.U)
      dut.io.in_b(0).poke(7.U)
      dut.io.in_b(1).poke(8.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()

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

      println("test pass")

    }
  }



}





