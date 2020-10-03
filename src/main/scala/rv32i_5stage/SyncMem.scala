package rv32i_5stage

import chisel3._
import chisel3.util._
import common._
import common.CommonPackage._

class InstMemPortIO(implicit val conf:Configurations) extends Bundle{
  val req = new InstMemReqIO()         // パス->メモリ output
  val resp = Flipped(new MemRespIO())  // メモリ->パス input
}

class DataMemPortIO(implicit val conf:Configurations) extends Bundle{
  val req = new DataMemReqIO()         // パス->メモリ output
  val resp = Flipped(new MemRespIO())  // メモリ->パス input
}

class InstMemReqIO(implicit val conf:Configurations) extends Bundle{
  val renI = Output(Bool())   // 読み込み有効
  val raddrI = Output(UInt(conf.xlen.W))   // アドレス
}

class DataMemReqIO(implicit val conf:Configurations) extends Bundle{
  val addrD = Output(UInt(conf.xlen.W))   // アドレス
  val wdataD = Output(UInt(conf.xlen.W))   // 書き込みデータ

  val fcn  = Output(UInt(M_X.getWidth.W)) //  half?byte?
  val typ = Output(UInt(MT_X.getWidth.W)) //  書き込みか読み込みか
}

class MemRespIO(implicit val conf:Configurations) extends Bundle{
  val rdata = Output(UInt(conf.xlen.W))   // 読み込みデータ
}

class SyncMemBlackBoxIO extends Bundle{
  val clk = Input(Clock())
  // 命令メモリ
  val raddrI = Input(UInt(32.W))
  val renI = Input(Bool())
  val rdataI = Output(UInt(32.W))

  val addrD = Input(UInt(32.W))
  // データメモリ 読み込み
  val renD = Input(Bool())
  val rdataD = Output(UInt(32.W))
  // データメモリ 書き込み
  val wenD = Input(Bool())
  val wdataD = Input(UInt(32.W))
  val wMaskD = Input(UInt(4.W))
}

class SyncMemBlackBox extends BlackBox with HasBlackBoxResource {
  val io = IO(new SyncMemBlackBoxIO)
  addResource("/vsrc/SyncMem.v")
}

class SyncMem extends Module {
  val io = IO(new Bundle() {
    val instmport = new InstMemPortIO()
    val datamport = new DataMemPortIO()
  })

  val syncmemblackbox = Module(new SyncMemBlackBox)
  syncmemblackbox.io.clk := clock
  // 命令メモリ接続
  syncmemblackbox.io.raddrI := io.instmport.req.raddrI
  syncmemblackbox.io.renI := io.instmport.req.renI
  io.instmport.resp.rdata := syncmemblackbox.io.rdataI
  // データメモリ接続
  syncmemblackbox.io.addrD := io.datamport.req.addrD

  io.datamport.resp.rdata := syncmemblackbox.io.rdataD


}