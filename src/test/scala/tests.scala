package test.scala

import top._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._

class tests extends AnyFreeSpec with ChiselScalatestTester {

  "test_top" in {
    test(new top(8,32,2,2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.in_start.poke(1.U)
      dut.io.in_start.poke(1.U)
      dut.io.in_a(0).poke(0.U)
      dut.io.in_a(1).poke(0.U)
      dut.io.in_b(0).poke(0.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()

      dut.io.in_start.poke(0.U)
      dut.io.in_start.poke(0.U)
      dut.io.in_a(0).poke(1.U)
      dut.io.in_a(1).poke(0.U)
      dut.io.in_b(0).poke(5.U)
      dut.io.in_b(1).poke(0.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()

      dut.io.in_a(0).poke(2.U)
      dut.io.in_a(1).poke(3.U)
      dut.io.in_b(0).poke(7.U)
      dut.io.in_b(1).poke(6.U)
      dut.io.in_c(0).poke(0.U)
      dut.io.in_c(1).poke(0.U)

      dut.clock.step()

      dut.io.in_a(0).poke(0.U)
      dut.io.in_a(1).poke(4.U)
      dut.io.in_b(0).poke(0.U)
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


      for (i <- 0 until 9) {
        dut.clock.step()
      }
      println("pass")


    }
  }
}