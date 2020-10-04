package rv32i_5stage

import chisel3._
import common._

class Tile(implicit val conf: Configurations) extends Module{
  val io = IO(new Bundle() {
  })
  io := DontCare

  val bram = Module(new SyncMemScala) // 命令データ共有BRAM
  bram.io := DontCare
  val core = Module(new Core())

  bram.io.instmport <> core.io.imem
  bram.io.datamport <> core.io.dmem
}
