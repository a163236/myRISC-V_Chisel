package rv32i_1stage

import chisel3._
import chisel3.util._
import chiseltest._
import common._
import org.scalatest._

class temp2 extends Module{
  val io = IO(new Bundle() {
    val in = Input(UInt(32.W))
    val out = Output(UInt(32.W))
    val en = Input(Bool())
  })
  io := DontCare

  val mem_0,mem_1,mem_2,mem_3 = Mem(256*1024, UInt(8.W))
  when(io.en){
    mem_0.write(io.in, 1.U)
    mem_1.write(io.in, 1.U)
    mem_2.write(io.in, 1.U)
    mem_3.write(io.in, 1.U)
    mem_0.write(2.U, 1.U)
  }.otherwise{
    io.out := mem_3.read(1.U)
  }
  printf("%d %d", mem_0.read(1.U), io.en)
}


class temp2_test() extends FlatSpec with ChiselScalatestTester with Matchers {
  implicit val conf = Configurations()

  "it" should "" in{
    test(new temp2){c=>

      c.clock.step(1)
      println(c.io.out.peek())

      c.io.in.poke(1.U)
      c.io.en.poke(true.B)
      c.clock.step(1)
      println(c.io.out.peek())

      c.io.en.poke(false.B)
      c.clock.step(1)
      println(c.io.out.peek())

      c.io.en.poke(false.B)
      c.clock.step(1)
      println(c.io.out.peek())
    }
  }

}
