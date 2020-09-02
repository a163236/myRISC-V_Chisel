// コア - データパスとコントローラが内包されている

package rv32i_1stage

import chisel3._
import common._


class CoreIO(implicit val conf: Configurations) extends Bundle {
  val imem = new MemPortIO()  // 外部メモリとの接続
  val dmem = new MemPortIO()
  val debug= new DebugIO()    // デバッグ
}


class Core(implicit val conf: Configurations) extends Module{

  val io = IO(new CoreIO())
  io := DontCare

  val Dpath = Module(new Dpath())
  Dpath.io := DontCare

  val Cpath = Module(new CtlPath())
  Cpath.io := DontCare
  // 初期書き込み


  // デバッグ
  io.debug.out := Dpath.io.debug.out

  // 内部接続
  Dpath.io.ctl <> Cpath.io.ctl        // データパス <> コントローラ
  Dpath.io.dat <> Cpath.io.dat

  // 外部メモリへの送信
  io.dmem.req.valid    := Cpath.io.dmem.req.valid     // 有効信号
  io.dmem.req.bits.typ := Cpath.io.dmem.req.bits.typ  // マスク word byte
  io.dmem.req.bits.fcn := Cpath.io.dmem.req.bits.fcn  // 読み書き
  io.dmem.req.bits.addr:= Dpath.io.dmem.req.bits.addr // アドレス

  io.imem.req.valid    := Cpath.io.imem.req.valid
  io.dmem.req.bits.typ := Cpath.io.imem.req.bits.typ
  io.dmem.req.bits.fcn  := Cpath.io.imem.req.bits.fcn
  io.dmem.req.bits.addr := Dpath.io.imem.req.bits.addr

  // 外部メモリからの受信
  Cpath.io.dmem.resp.valid := io.dmem.resp.valid
  Cpath.io.dmem.resp.bits.rdata := io.dmem.resp.bits.rdata

  Dpath.io.imem.resp.valid := io.imem.resp.valid
  Dpath.io.imem.resp.bits.rdata := io.imem.resp.bits.rdata

}
