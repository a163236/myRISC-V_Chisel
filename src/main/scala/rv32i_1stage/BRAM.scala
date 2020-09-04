package rv32i_1stage

import chisel3._
import chisel3.util._
import chiseltest._
import common._
import org.scalatest._

class BRAM extends Module{
  val io = IO(new Bundle() {
    val wrEna = Input(Bool())
    val addr = Input(UInt(32.W))
    val rdData = Output(UInt(32.W))

  })

  val mem_0,mem_1,mem_2,mem_3 = SyncReadMem(64*1024, UInt(8.W))
  io.rdData := Cat(
    mem_0(io.addr),
    mem_1(io.addr),
    mem_2(io.addr),
    mem_3(io.addr),
  )
  when(io.wrEna) {
    mem_0.write(io.addr,1.U)
    mem_1.write(io.addr,1.U)
    mem_2.write(io.addr,1.U)
    mem_3.write(io.addr,1.U)
  }


}

/*
class BRAM_test() extends FlatSpec with ChiselScalatestTester with Matchers {
  implicit val conf = Configurations()

  "it" should "" in{
    test(new BRAM){c=>

      c.clock.step(1)
      println(c.io.wrData.peek())

      c.io.wrData.poke(1.U)
      c.io.en.poke(true.B)
      c.clock.step(1)
      println(c.io.wrData.peek())

      c.io.en.poke(false.B)
      c.clock.step(1)
      println(c.io.wrData.peek())

      c.io.en.poke(false.B)
      c.clock.step(1)
      println(c.io.wrData.peek())
    }
  }

}


 */