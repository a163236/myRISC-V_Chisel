package common

import chisel3._

object PRV {  // 特権モード
  val SZ = 2
  val U = 0
  val S = 1
  val H = 2
  val M = 3   // マシンモード
}

object CSR {
  // commands
  val SZ = 3.W
  val X = 0.asUInt(SZ)
  val N = 0.asUInt(SZ)
  val W = 1.asUInt(SZ)
  val S = 2.asUInt(SZ)
  val C = 3.asUInt(SZ)
  val I = 4.asUInt(SZ)
  val R = 5.asUInt(SZ)
}

class CSRFileIO(implicit val conf: Configurations) extends Bundle{

}

class CSRFile(implicit val conf: Configurations) extends Module{
  val io = IO(new CSRFileIO())


}