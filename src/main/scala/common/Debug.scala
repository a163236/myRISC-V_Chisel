package common

import chisel3._


class DebugDPath(implicit val conf:Configurations) extends Bundle{
  // Reg access レジスタにアクセスしてデバッグ
  // resisterの外からみた配線
  val addr = Output(UInt(5.W))          // 読み込み・読み込みアドレス
  val wdata = Output(UInt(conf.xlen.W)) // 書き込みデータ
  val validreq = Output(Bool())         // 書き込み有効
  val rdata = Input(UInt(conf.xlen.W))  // 読み込みデータ
  val resetpc = Output(Bool())
}

class DebugIO(implicit val conf: Configurations) extends Bundle{

 val ddpath = Output(UInt())

}
