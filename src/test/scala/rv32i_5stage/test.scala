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

  "Dpath" should "" in{
    test(new Dpath()){c=>

    }
  }

  "Tile" should "" in{
    test(new Tile()).withAnnotations(Seq(VerilatorBackendAnnotation)){c=>

      println(c.io.debug.pc.peek(), c.io.debug.pc_decode.peek(),
        c.io.debug.inst.peek(), c.io.debug.reg_a0.peek())

      for(i <- 0 to 10){
        c.clock.step(1)
        println(c.io.debug.pc.peek(), c.io.debug.pc_decode.peek(),
          c.io.debug.inst.peek(), c.io.debug.reg_a0.peek())
      }

    }
  }

  "SyncMemScala" should "" in{

    test(new SyncMemScala()).withAnnotations(Seq(VerilatorBackendAnnotation)){c=>

      c.io.datamport.req.fcn.poke(M_XRD)
      c.io.datamport.req.typ.poke(MT_W)
      c.io.datamport.req.addrD.poke(0.U)
      c.clock.step(1)
      println(c.io.datamport.resp.rdata.peek())

      c.io.datamport.req.fcn.poke(M_XWR)
      c.io.datamport.req.typ.poke(MT_H)
      c.io.datamport.req.addrD.poke(1.U)
      c.io.datamport.req.wdataD.poke(0.U)
      c.clock.step(1)
      //println(c.io.datamport.resp.rdata.peek())

      c.io.datamport.req.fcn.poke(M_XRD)
      c.io.datamport.req.typ.poke(MT_W)
      c.io.datamport.req.addrD.poke(0.U)
      c.clock.step(1)
      println(c.io.datamport.resp.rdata.peek())

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


}


