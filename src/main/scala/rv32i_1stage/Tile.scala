package rv32i_1stage

import chisel3._
import common._

class LED7IO(implicit val conf:Configurations)

class Tile(implicit val conf: Configurations) extends Module{
  val io = IO(new Bundle() {
    // debug
    //val keita = new KeitaIO()
    val led = new DataMemoryLEDIO()
    val d_imem = Flipped(new MemPortIO())
  })
  io := DontCare

  val Core = Module(new Core())
  val InstructionMemory = Module(new InstructionMemory())
  val DataMemory  = Module(new DataMemory())

  // メモリ初期化
  InstructionMemory.io.d_write <> io.d_imem

  // 内部接続
  Core.io.imem <> InstructionMemory.io.mport
  //printf(" [%d]", Core.io.imem.req.bits.addr)
  Core.io.dmem <> DataMemory.io


  // 7segLEDの表示
  io.led.out := DataMemory.io.led.out
  printf("LED=[%x] ",io.led.out)
}
