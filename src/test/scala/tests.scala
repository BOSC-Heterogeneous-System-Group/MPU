package test.scala

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.stage._
import miniTPU._
import miniTPU.DataBuffer._
import miniTPU.SystolicArray._
import miniTPU.SystolicArray.Multiplier._


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


  "test_top_2X2" in {
    (new ChiselStage).emitVerilog(new top(8, 32, 2, 2), Array("--target-dir", "./genVerilog/top"))

    test(new top(8, 32, 2, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.step(5)
      dut.io.start.poke(true.B)
      dut.io.tpuIO.in.valid.poke(true.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(1.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(3.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(5.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(6.S)
      dut.io.tpuIO.in.bits.in_c(0).poke(0.S)
      dut.io.tpuIO.in.bits.in_c(1).poke(0.S)
      dut.clock.step()
      dut.io.start.poke(false.B)
      dut.io.tpuIO.in.valid.poke(true.B)
      dut.io.tpuIO.in.bits.in_a(0).poke(2.S)
      dut.io.tpuIO.in.bits.in_a(1).poke(4.S)
      dut.io.tpuIO.in.bits.in_b(0).poke(7.S)
      dut.io.tpuIO.in.bits.in_b(1).poke(8.S)
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
      dut.clock.step(15)
      dut.io.tpuIO.out.ready.poke(true.B)
      dut.clock.step(20)

      println("test pass")

    }
  }


  "test_OutputBuffer" in {

    test(new OutputBuffer(8, 4, 4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      dut.clock.step(10)
      dut.io.ctrl_ob_data_in.poke(true.B)
      dut.io.data_in(0).poke(1.S)
      dut.io.data_in(1).poke(5.S)
      dut.io.data_in(2).poke(9.S)
      dut.io.data_in(3).poke(13.S)
      dut.clock.step()
      dut.io.data_in(0).poke(2.S)
      dut.io.data_in(1).poke(6.S)
      dut.io.data_in(2).poke(10.S)
      dut.io.data_in(3).poke(14.S)
      dut.clock.step()
      dut.io.data_in(0).poke(3.S)
      dut.io.data_in(1).poke(7.S)
      dut.io.data_in(2).poke(11.S)
      dut.io.data_in(3).poke(15.S)
      dut.clock.step()
      dut.io.data_in(0).poke(4.S)
      dut.io.data_in(1).poke(8.S)
      dut.io.data_in(2).poke(12.S)
      dut.io.data_in(3).poke(16.S)
      dut.clock.step()
      dut.io.ctrl_ob_data_in.poke(false.B)
      dut.clock.step(7)
      dut.io.data_out.ready.poke(true.B)
      dut.clock.step()

      dut.clock.step(20)


      println("success")

    }
  }


  "test_SyncFIFO" in {
    (new ChiselStage).emitVerilog(new SyncFIFO(8, 4), Array("--target-dir", "./genVerilog/SyncFIFO"))

    test(new SyncFIFO(8, 4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.step(10)
      dut.io.enq.poke(true.B)
      dut.io.enqData.poke(1.S)
      dut.clock.step()
      dut.io.enqData.poke(2.S)
      dut.clock.step()
      dut.io.enqData.poke(3.S)
      dut.clock.step()
      dut.io.enq.poke(false.B)
      dut.io.deq.poke(true.B)
      dut.clock.step()
      dut.io.enq.poke(true.B)
      dut.io.deq.poke(false.B)
      dut.io.enqData.poke(4.S)
      dut.clock.step()
      dut.io.enqData.poke(5.S)
      dut.clock.step()
      dut.io.enq.poke(false.B)
      dut.io.deq.poke(false.B)
      dut.clock.step()
      dut.io.enq.poke(true.B)
      dut.io.enqData.poke(7.S)
      dut.clock.step()
      dut.io.enqData.poke(8.S)
      dut.clock.step()
      dut.io.enqData.poke(9.S)
      dut.clock.step()
      dut.io.enq.poke(false.B)
      dut.io.deq.poke(true.B)
      dut.clock.step()
      dut.io.deq.poke(true.B)
      dut.clock.step()
      dut.io.deq.poke(true.B)
      dut.clock.step()
      dut.io.deq.poke(true.B)
      dut.clock.step()
      dut.io.deq.poke(false.B)
      dut.clock.step(10)

      println("pass")

    }
  }


  "test_InputBuffer" in {

    test(new InputBuffer(8, 4, 4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      dut.clock.step(10)
      dut.io.ctrl_ib_data_in.poke(true.B)
      dut.io.data_in.valid.poke(true.B)
      dut.io.data_in.bits(0).poke(1.S)
      dut.io.data_in.bits(1).poke(5.S)
      dut.io.data_in.bits(2).poke(9.S)
      dut.io.data_in.bits(3).poke(13.S)
      dut.clock.step()
      dut.io.ctrl_ib_data_in.poke(false.B)
      dut.io.data_in.valid.poke(true.B)
      dut.io.data_in.bits(0).poke(2.S)
      dut.io.data_in.bits(1).poke(6.S)
      dut.io.data_in.bits(2).poke(10.S)
      dut.io.data_in.bits(3).poke(14.S)
      dut.clock.step()
      dut.io.data_in.valid.poke(false.B)
      dut.clock.step(3)
      dut.io.data_in.valid.poke(true.B)
      dut.io.data_in.bits(0).poke(3.S)
      dut.io.data_in.bits(1).poke(7.S)
      dut.io.data_in.bits(2).poke(11.S)
      dut.io.data_in.bits(3).poke(15.S)
      dut.clock.step()
      dut.io.data_in.valid.poke(true.B)
      dut.io.data_in.bits(0).poke(4.S)
      dut.io.data_in.bits(1).poke(8.S)
      dut.io.data_in.bits(2).poke(12.S)
      dut.io.data_in.bits(3).poke(16.S)
      dut.clock.step()
      dut.io.data_in.valid.poke(false.B)
      dut.io.data_in.bits(0).poke(0.S)
      dut.io.data_in.bits(1).poke(0.S)
      dut.io.data_in.bits(2).poke(0.S)
      dut.io.data_in.bits(3).poke(0.S)
      dut.clock.step(7)
      dut.io.ctrl_ib_data_out.poke(true.B)
      dut.clock.step()
      dut.io.ctrl_ib_data_out.poke(false.B)
      dut.clock.step(20)


      println("success")

    }
  }


}





