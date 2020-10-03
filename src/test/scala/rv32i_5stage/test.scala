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


  "SyncMemScala" should "" in{

    test(new SyncMemScala()).withAnnotations(Seq(VerilatorBackendAnnotation)){c=>

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


