package common

import chisel3._
import chiseltest._
import org.scalatest._

class commonTest() extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "rv32_1stage"

  implicit val conf = Configurations()
/*
  it should "Imem" in{
    test(new Memory()){ c=>
      c.io.mport.req.valid.poke(true.B)
      c.io.d_write.req.bits.addr.poke(4.U)
      c.io.d_write.req.bits.wdata.poke(1.U)
      c.clock.step(1)
      println()

      c.io.d_write.req.valid.poke(false.B)
      c.io.mport.req.valid.poke(true.B)
      c.io.mport.req.bits.addr.poke(4.U)
      c.clock.step(1)
      println()
      println(c.io.mport.resp.bits.rdata.peek())

      c.clock.step(1)
      println()
      c.clock.step(1)
    }
  }

 */

  it should "ALU" in{
    test(new ALU()){ c=>
      c.io.fun.poke(2.U)
      c.io.op1.poke(1.U)
      c.io.op2.poke(1.U)
      c.clock.step(1)
      println(c.io.out.peek())
    }
  }

  it should "ImmGen" in{
    test(new ImmGen()){ c =>
      c.io.inst.poke("b1111111_10001_11111_111_00100_1101111".U)
      c.io.imm_sel.poke(1.U)
      c.clock.step(1)
      println(c.io.out.peek())
    }
  }

  it should "CSR" in {
    test(new CSRFile()){ c =>
      for (i <- 0 to 10){
        c.clock.step(1)
        //println()
      }
    }
  }


}
