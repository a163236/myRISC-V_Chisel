package rv32i_1stage

import chisel3._
import common._

class LED7IO(implicit val conf:Configurations)

class Tile(implicit val conf: Configurations) extends Module{
  val io = IO(new Bundle() {
    // debug
    //val keita = new KeitaIO()
    val led = new DataMemoryLEDIO()
    val d_mem = Flipped(new MemPortIO())
    val debug = new DebugIO() // デバッグ
  })
  io := DontCare

  val Core = Module(new Core())
  val InstructionMemory = Module(new InstructionMemory())
  val DataMemory  = Module(new DataMemory())

  // メモリ初期化
  InstructionMemory.io.d_write <> io.d_mem
  DataMemory.io.d_write <> io.d_mem

  // 内部接続
  Core.io := DontCare
  Core.io.imem <> InstructionMemory.io.mport
  Core.io.dmem.cpath <> DataMemory.io.cpath
  Core.io.dmem.dpath <> DataMemory.io.dpath


  // デバッグ
  io.debug.out := Core.io.debug.out

  // 7segLEDの表示
  io.led.out := DataMemory.io.led.out
  //printf("LED=[%x] ",io.led.out)
}
