package test.scala

import top._
import SA._
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
  "test_InputBuffer" in {

    test(new InputBuffer(8, 4, 4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.step(10)
      dut.io.ctrl_data_in.poke(true.B)
      dut.io.data_in(0).poke(1.U)
      dut.io.data_in(1).poke(5.U)
      dut.io.data_in(2).poke(9.U)
      dut.io.data_in(3).poke(13.U)
      dut.clock.step()
      dut.io.ctrl_data_in.poke(false.B)
      dut.io.data_in(0).poke(2.U)
      dut.io.data_in(1).poke(6.U)
      dut.io.data_in(2).poke(10.U)
      dut.io.data_in(3).poke(14.U)
      dut.clock.step()
      dut.io.data_in(0).poke(3.U)
      dut.io.data_in(1).poke(7.U)
      dut.io.data_in(2).poke(11.U)
      dut.io.data_in(3).poke(15.U)
      dut.clock.step()
      dut.io.data_in(0).poke(4.U)
      dut.io.data_in(1).poke(8.U)
      dut.io.data_in(2).poke(12.U)
      dut.io.data_in(3).poke(16.U)
      dut.clock.step(5)
      dut.io.ctrl_data_out.poke(true.B)
      dut.clock.step()
      dut.io.ctrl_data_out.poke(false.B)
      dut.clock.step(20)

      println("success")

    }
  }

  "test_OutputBuffer" in {

    test(new OutputBuffer(8, 4, 4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.step(10)
      dut.io.ctrl_data_in.poke(true.B)
      dut.io.data_in(0).poke(1.U)
      dut.io.data_in(1).poke(5.U)
      dut.io.data_in(2).poke(9.U)
      dut.io.data_in(3).poke(13.U)
      dut.clock.step()
      dut.io.ctrl_data_in.poke(false.B)
      dut.io.data_in(0).poke(2.U)
      dut.io.data_in(1).poke(6.U)
      dut.io.data_in(2).poke(10.U)
      dut.io.data_in(3).poke(14.U)
      dut.clock.step()
      dut.io.data_in(0).poke(3.U)
      dut.io.data_in(1).poke(7.U)
      dut.io.data_in(2).poke(11.U)
      dut.io.data_in(3).poke(15.U)
      dut.clock.step()
      dut.io.data_in(0).poke(4.U)
      dut.io.data_in(1).poke(8.U)
      dut.io.data_in(2).poke(12.U)
      dut.io.data_in(3).poke(16.U)
      dut.clock.step(5)
      dut.io.ctrl_data_out.poke(true.B)
      dut.clock.step()
      dut.io.ctrl_data_out.poke(false.B)
      dut.clock.step(20)

      println("success")

    }
  }
}