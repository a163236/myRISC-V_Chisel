package common

import chisel3._

class DebugIO(implicit val conf: Configurations) extends Bundle{
  val pc = Output(UInt(conf.xlen.W))
  val reg_a0 = Output(UInt(conf.xlen.W))
  val pc_decode = Output(UInt(conf.xlen.W))
  val inst = Output(UInt(conf.xlen.W))
}
