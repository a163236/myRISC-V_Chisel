package rv32i_5stage

import chisel3._
import chiseltest._
import common._
import CommonPackage._
import org.scalatest._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.VerilatorBackendAnnotation
import firrtl.stage.RunFirrtlTransformAnnotation

class test() extends FlatSpec with ChiselScalatestTester with Matchers {
  implicit val conf = Configurations()


  "temp" should "" in{
    test(new temp()).withAnnotations(Seq(VerilatorBackendAnnotation)){c=>
      c.io.addr.poke(0.U)
      println(c.io.dout.peek())

      c.clock.step(1)
      println(c.io.dout.peek())
      c.clock.step(1)
      println(c.io.dout.peek())
    }
  }

  "InstMemory" should "" in{
    test(new InstMemory()){c=>
      c.io.raddr.poke(5.U)
      c.io.fcn.poke(M_XRD)
      c.io.typ.poke(MT_B)
      c.clock.step(1)

      c.clock.step(1)
      //println(c.io.rdata.peek())

    }
  }

  "Cache" should "" in{
    test(new Cache()){c=>

      c.io.req.fcn.poke(M_XRD)
      c.io.req.typ.poke(MT_WU)
      c.io.req.raddr.poke(0.U)
      c.clock.step(1)
      println()

      c.io.req.fcn.poke(M_XRD)
      c.io.req.typ.poke(MT_WU)
      c.io.req.raddr.poke(4.U)
      c.clock.step(1)
      println()

      c.io.req.fcn.poke(M_XRD)
      c.io.req.typ.poke(MT_WU)
      c.io.req.raddr.poke(8.U)
      c.clock.step(1)
      println()


    }
  }

  "memory" should "" in{
    test(new Memory()){c=>

      c.io.req.fcn.poke(M_XWR)
      c.io.req.typ.poke(MT_WU)
      c.io.req.raddr.poke(0.U)
      c.io.req.waddr.poke(0.U)
      c.io.req.wdata.poke("h12345678".U)
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

      c.io.req.fcn.poke(M_XRD)
      c.io.req.typ.poke(MT_WU)
      c.io.req.raddr.poke(2.U)
      c.clock.step(1)
      println()

      c.io.resp.rdata.expect("h1234".U)
      println(c.io.resp.rdata.peek())
      c.io.req.fcn.poke(M_XRD)
      c.io.req.typ.poke(MT_WU)
      c.io.req.raddr.poke(2.U)
      c.clock.step(1)
      println()

      println(c.io.resp.rdata.peek())
      c.clock.step(1)
      println()
    }
  }

}


