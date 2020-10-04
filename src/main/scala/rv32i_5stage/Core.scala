package rv32i_5stage


import chisel3._
import common._


class CoreIO(implicit val conf: Configurations) extends Bundle {
  val imem = new InstMemPortIO()  // 外部メモリとの接続
  val dmem = new DataMemPortIO()
}

class Core(implicit val conf:Configurations) extends Module{
  val io = IO(new CoreIO())
  io := DontCare



}