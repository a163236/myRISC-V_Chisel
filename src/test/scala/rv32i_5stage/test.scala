package rv32i_5stage

import chisel3._
import chiseltest._
import common._
import CommonPackage._
import org.scalatest._

class test() extends FlatSpec with ChiselScalatestTester with Matchers {
  implicit val conf = Configurations()

  "memory" should "" in{
    test(new Memory()){c=>

      c.io.mport.req.fcn.poke(M_XWR)
      c.io.mport.req.typ.poke(MT_WU)
      c.io.mport.req.raddr.poke(0.U)
      c.io.mport.req.waddr.poke(0.U)
      c.io.mport.req.wdata.poke("b0001_0010_0011_0100".U)
      c.clock.step(1)
      println()

      /*
      c.io.mport.req.fcn.poke(M_XWR)
      c.io.mport.req.typ.poke(MT_WU)
      c.io.mport.req.waddr.poke(4.U)
      c.io.mport.req.wdata.poke(7.U)
      c.clock.step(1)
      println()

       */
      c.io.mport.req.fcn.poke(M_XRD)
      c.io.mport.req.typ.poke(MT_WU)
      c.io.mport.req.raddr.poke(0.U)
      c.clock.step(1)
      println()

      println(c.io.mport.resp.rdata.peek())
      c.io.mport.req.fcn.poke(M_XRD)
      c.io.mport.req.typ.poke(MT_WU)
      c.io.mport.req.raddr.poke(2.U)
      c.clock.step(1)
      println()

      println(c.io.mport.resp.rdata.peek())
      c.clock.step(1)
      println()
    }
  }

}


