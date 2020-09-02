package rv32i_1stage

import chisel3._
import chiseltest._
import common._
import org.scalatest._

import scala.Console._
import scala.io.Source
import scala.reflect.io._

class riscvtest extends FlatSpec with ChiselScalatestTester with Matchers{
  implicit val conf = Configurations()

  def entrymemory(filename: String): Unit = {
    test(new Tile()) { c =>
      println(BLUE+filename+RESET)
      val fp = Source.fromFile(filename)
      val lines = fp.getLines()
      val memory = lines.toArray.map { c =>
        Integer.parseUnsignedInt(c, 16).toBinaryString
      }
      println()
      for (i <- 0 to memory.length - 1) {
        val binarycode = memory(i)
        c.io.d_mem.req.valid.poke(true.B)
        c.io.d_mem.req.bits.addr.poke((i * 4).asUInt())
        c.io.d_mem.req.bits.wdata.poke(s"b$binarycode".U)
        c.clock.step(1)
      }
      c.io.d_mem.req.valid.poke(false.B)

      for (i <- 1 to 900) {
        c.clock.step(1)
        println()
      }
      c.io.debug.out.expect(1.U) // gpレジスタが1ならパス
    }
  }


  behavior of "rv32ui-"
  val rv32ui_path = "testfolder/hexfile/rv32ui/"
  "add" should "pass" in {entrymemory(rv32ui_path+"rv32ui-p-add.hex")}
  "addi" should "pass" in {entrymemory(rv32ui_path+"rv32ui-p-addi.hex")}
  "and" should "pass" in {entrymemory(rv32ui_path+"rv32ui-p-and.hex")}

  "beq" should "pass" in {entrymemory(rv32ui_path+"rv32ui-p-beq.hex")}
  "sw" should "pass" in{entrymemory(rv32ui_path+"rv32ui-p-sw.hex")}
  "sub" should "pass" in{entrymemory(rv32ui_path+"rv32ui-p-sub.hex")}
  "jal" should "pass" in{entrymemory(rv32ui_path+"rv32ui-p-jal.hex")}
  "lw" should "pass" in{entrymemory(rv32ui_path+"rv32ui-p-lw.hex")}
  "lb" should "pass" in{entrymemory(rv32ui_path+"rv32ui-p-lb.hex")}
  "xor" should "pass" in{entrymemory(rv32ui_path+"rv32ui-p-xor.hex")}
  "xori" should "pass" in{entrymemory(rv32ui_path+"rv32ui-p-xori.hex")}


  behavior of "rv32mi-"
  val rv32mi_path = "testfolder/hexfile/rv32mi/"
  //"csr" should "pass" in {entrymemory(rv32mi_path+"rv32mi-p-csr.hex")}



}
