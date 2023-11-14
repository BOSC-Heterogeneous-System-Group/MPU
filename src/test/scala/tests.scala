package test.scala



import top._
import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.stage._



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


  "test_DP" in {
    (new ChiselStage).emitVerilog(new DP(8, 32, 2), Array("--target-dir", "./genVerilog/DP"))

    test(new DP(8, 32, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.in_data.a(0).poke(1.S)
      dut.io.in_data.a(1).poke(2.S)
      dut.io.in_data.b(0).poke(3.S)
      dut.io.in_data.b(1).poke(4.S)
      dut.io.in_control.done.poke(false.B)
      dut.clock.step()
      println("pass")

    }
  }

  "test_TPE" in {
    (new ChiselStage).emitVerilog(new TPE(8, 32, 2,2), Array("--target-dir", "./genVerilog/TPE"))

    test(new TPE(8, 32, 2,2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.in_data(0).a(0).poke(0.S)
      dut.io.in_data(0).a(1).poke(1.S)
      dut.io.in_data(1).a(0).poke(2.S)
      dut.io.in_data(1).a(1).poke(3.S)
      dut.io.in_data(0).b(0).poke(0.S)
      dut.io.in_data(0).b(1).poke(2.S)
      dut.io.in_data(0).b(0).poke(1.S)
      dut.io.in_data(0).b(1).poke(3.S)
      dut.clock.step()
      println("pass")

    }
  }


  "test_SyncFIFO" in {
    (new ChiselStage).emitVerilog(new SyncFIFO(8,4), Array("--target-dir", "./genVerilog/SyncFIFO"))

    test(new SyncFIFO(8,4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.step(10)
      dut.io.enq.poke(true.B)
      dut.io.enqData.poke(1.U)
      dut.clock.step()
      dut.io.enqData.poke(2.U)
      dut.clock.step()
      dut.io.enqData.poke(3.U)
      dut.clock.step()
      dut.io.enq.poke(false.B)
      dut.io.deq.poke(true.B)
      dut.clock.step()
      dut.io.enq.poke(true.B)
      dut.io.deq.poke(false.B)
      dut.io.enqData.poke(4.U)
      dut.clock.step()
      dut.io.enqData.poke(5.U)
      dut.clock.step()
      dut.io.enq.poke(false.B)
      dut.io.deq.poke(false.B)
      dut.clock.step()
      dut.io.enq.poke(true.B)
      dut.io.enqData.poke(7.U)
      dut.clock.step()
      dut.io.enqData.poke(8.U)
      dut.clock.step()
      dut.io.enqData.poke(9.U)
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

    test(new InputBuffer(8,4,4)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
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