package common {

  import chisel3._

  case class Configurations() {
    val xlen = 32 // bit長
    val nreg = 32 // レジスタ本数
  }

}