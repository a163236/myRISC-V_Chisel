package rv32i_5stage

import chisel3._
import common._
import CommonPackage._

class Dpath(implicit val conf:Configurations) extends Module{
  val io = IO(new Bundle() {
  })
  io := DontCare

  // レジスタ宣言
  val pc_reg = RegInit(START_ADDR.U(conf.xlen.W))


  // 配線の宣言
  val pc_next = Wire(UInt(conf.xlen.W))





}