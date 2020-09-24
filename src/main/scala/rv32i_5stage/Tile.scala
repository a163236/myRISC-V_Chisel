package rv32i_5stage

import chisel3._
import common._

class LED7IO(implicit val conf:Configurations)

class Tile(implicit val conf: Configurations) extends Module{
  val io = IO(new Bundle() {
    // debug
    val init_mem = Flipped(new MemPortIO())
    val debug = new DebugIO() // デバッグ
  })
  io := DontCare

  val InstructionMemory = Module(new Memory())
  InstructionMemory.io := DontCare

  // 出力
  io.debug.out := InstructionMemory.io.resp.rdata

}
