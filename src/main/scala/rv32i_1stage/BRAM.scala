package rv32i_1stage

import chisel3._
import chisel3.util._
import chiseltest._
import common._
import org.scalatest._


class BRAM extends Module{
  val io = IO(new Bundle() {
    val wrEna = Input(Bool())
    val wraddr = Input(UInt(32.W))
    val rdaddr = Input(UInt(32.W))
    val rdData = Output(UInt(32.W))

  })
  io := DontCare

  val membank = SyncReadMem(1024, Vec(4, UInt(8.W)))
  when(io.wrEna){
    val datain = Wire(Vec(4, UInt(8.W)))
    datain(0) := 0.U
    datain(1) := 1.U
    datain(2) := 2.U
    datain(3) := 3.U
    val mask = Wire(Vec(4, Bool()))
    mask := "b1111".U.asBools()
    membank.write(io.wraddr, datain, mask)

  }
  io.rdData := Cat(membank.read(0.U)(2),membank.read(0.U)(3),membank.read(1.U)(0))

  printf("%x ", Cat(membank.read(0.U)(3),membank.read(1.U)(1)))    // (インデックス)(オフセット)
}


class BRAM_test() extends FlatSpec with ChiselScalatestTester with Matchers {
  implicit val conf = Configurations()

  "it" should "" in{
    test(new BRAM){c=>

      c.io.wrEna.poke(true.B)
      c.io.wraddr.poke(3.U)
      c.clock.step(1)
      println()

      c.io.rdaddr.poke(2.U)
      c.io.wrEna.poke(false.B)
      c.clock.step(1)
      println()


    }
  }

}


