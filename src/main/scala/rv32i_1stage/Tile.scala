package rv32i_1stage

import chisel3._
import common._

class LED7IO(implicit val conf:Configurations)

class Tile(implicit val conf: Configurations) extends Module{
  val io = IO(new Bundle() {
    // debug
    //val keita = new KeitaIO()
    val led = new DataMemoryLEDIO()
    val init_mem = Flipped(new MemPortIO())
    val debug = new DebugIO() // デバッグ
  })
  io := DontCare

  val Core = Module(new Core())
  val InstructionMemory = Module(new Memory())
  val DataMemory  = Module(new Memory())

  // 内部接続
  Core.io := DontCare
  Core.io.imem <> InstructionMemory.io.mport
  Core.io.dmem <> DataMemory.io.mport

  // メモリ初期化
  Core.io.meminit.wantInit := io.init_mem.req.valid // メモリ初期化要求信号
  when(Core.io.meminit.initOK){ // メモリ初期化がOKされたとき
    InstructionMemory.io.mport <> io.init_mem
    DataMemory.io.mport <> io.init_mem
  }

  // デバッグ
  io.debug.out := Core.io.debug.out

  // 7segLEDの表示
  io.led.out := DataMemory.io.led.out
}
