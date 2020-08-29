package common

import chisel3._

class DebugIO(implicit val conf: Configurations) extends Bundle{
  val out = Output(UInt(conf.xlen.W))
}
