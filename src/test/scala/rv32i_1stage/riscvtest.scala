package rv32i_1stage

import chisel3._
import chiseltest._
import common._
import org.scalatest._
import scala.io.Source

class riscvtest extends FlatSpec with ChiselScalatestTester with Matchers{
  implicit val conf = Configurations()

  def entrymemory(filename: String): Unit = {
    test(new Tile()) { c =>

      val fp = Source.fromFile("hexfile/rv32ui-p-add.hex")
      val lines = fp.getLines()
      val memory = lines.toArray.map { c =>
        Integer.parseUnsignedInt(c, 16).toBinaryString
      }

      for (i <- 0 to memory.length - 1) {
        val binarycode = memory(i)
        c.io.d_imem.req.valid.poke(true.B)
        c.io.d_imem.req.bits.addr.poke((i * 4).asUInt())
        c.io.d_imem.req.bits.wdata.poke(s"b$binarycode".U)
        //c.io.d_imem.req.bits.wdata.poke(f"b$binarycode%32s".U)
        c.clock.step(1)
      }
      c.io.d_imem.req.valid.poke(false.B)

      for (i <- 1 to 900) {
        c.clock.step(1)
        println()
      }
      c.io.debug.out.expect(0.U) // gpレジスタが1ならパス
    }
  }

  behavior of "rv32ui-"
  /*
  it+"add" should "pass" in {entrymemory("hexfile/rv32ui-p-add.hex")}
  it+"sub" should "pass" in{entrymemory("hexfile/rv32ui-p-sub.hex")}
  it+"jal" should "pass" in{entrymemory("hexfile/rv32ui-p-jal.hex")}
  it+"lw" should "pass" in{entrymemory("hexfile/rv32ui-p-lw.hex")}
  */
  it+"lb" should "pass" in{entrymemory("hexfile/rv32ui-p-lb.hex")}


  /*
  behavior of "rv32mi-"
  it+"csr" should "pass" in {entrymemory("hexfile/rv32mi-p-csr.hex\"")}

   */

}
