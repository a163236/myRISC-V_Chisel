package rv32i_1stage

import chisel3._
import chiseltest._
import common._
import org.scalatest._
import scala.io.Source

class test() extends FlatSpec with ChiselScalatestTester with Matchers {
  implicit val conf = Configurations()

  behavior of "Dpath"
  it should "Dpath" in {
    test(new Dpath()){ c =>

      for (i <- 1 to 10){
        c.io.ctl.stall.poke(true.B)
        c.clock.step(1)
        println()
      }

    }
  }

  behavior of "Core"
  it should "Core" in{
    test(new Core()){ c =>
      for (i <- 1 to 10){
        c.io.imem.resp.valid.poke(false.B)
        c.clock.step(1)
        println()
      }
      c.io.imem.resp.valid.poke(true.B)
      c.clock.step(1)
      println()
      c.io.imem.resp.valid.poke(true.B)
      c.clock.step(1)
      println()

    }
  }

  behavior of "Tile"

  it should "Tileを初期化したとき" in {
    test(new Tile){ c=>
      c.io.init_mem.req.valid.poke(false.B)
      for (i <- 1 to 900) {
        c.clock.step(1)
        println()
      }
    }
  }

  it should "Tile" in {
    test(new Tile()) { c =>

      val fp = Source.fromFile("hexfile/rv32ui-p-add.hex")
      val lines = fp.getLines()
      val memory = lines.toArray.map{ c=>
        Integer.parseUnsignedInt(c,16).toBinaryString
      }

      for (i <- 0 to memory.length-1){
        val binarycode = memory(i)
        c.io.init_mem.req.valid.poke(true.B)
        c.io.init_mem.req.bits.addr.poke((i*4).asUInt())
        c.io.init_mem.req.bits.wdata.poke(s"b$binarycode".U)
        //c.io.d_imem.req.bits.wdata.poke(f"b$binarycode%32s".U)
        c.clock.step(1)
      }
      c.io.init_mem.req.valid.poke(false.B)

      for (i <- 1 to 900) {
        c.clock.step(1)
        println()
      }
      c.io.debug.reg_a0.expect(0.U)  // gpレジスタが1ならパス
    }
  }

}
