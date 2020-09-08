package rv32i_5stage

import chisel3._
import chisel3.util._
import common.CommonPackage._
import common._

class MemPortIO(implicit val conf:Configurations) extends Bundle{
  val req = new MemReqIO()         // パス->メモリ output
  val resp = Flipped(new MemRespIO())  // メモリ->パス input
}

class MemReqIO(implicit val conf:Configurations) extends Bundle{
  val raddr = Output(UInt(conf.xlen.W))   // 読み込みアドレス
  val waddr = Output(UInt(conf.xlen.W))   // 書き込みアドレス
  val wdata = Output(UInt(conf.xlen.W))   // 書き込みデータ

  val fcn  = Output(UInt(M_X.getWidth.W)) //  half?byte?
  val typ = Output(UInt(MT_X.getWidth.W)) //  load?store?
}

class MemRespIO(implicit val conf:Configurations) extends Bundle{
  val rdata = Output(UInt(conf.xlen.W))   // 読み込みデータ
}

class MemInitial extends Bundle{
  val wantInit = Input(Bool())
  val initOK = Output(Bool())
}

class Memory(implicit val conf:Configurations) extends Module {
  val io = IO(new Bundle() {
    val mport = Flipped(new MemPortIO())
  })
  io := DontCare
  val mem_0,mem_1,mem_2,mem_3 = SyncReadMem(64*1024, UInt(8.W))
  val raddr = io.mport.req.raddr
  val waddr = io.mport.req.waddr
  val wdata = io.mport.req.wdata
  val typ = io.mport.req.typ

  def store(){ // =================================== store関数
    val tmpaddr = Wire(Vec(4, UInt(24.W)))  // インデックスを求める
    val wmask = Wire(Vec(4, Bool()))        // 書き込みマスク
    tmpaddr(0) := Mux((waddr)(1,0)===0.U, waddr(31,2), waddr(31,2)+1.U) // mem_0のアドレス
    tmpaddr(1) := Mux((waddr)(1,0)<=1.U, waddr(31,2), waddr(31,2)+1.U) // mem_1のアドレス
    tmpaddr(2) := Mux((waddr)(1,0)<=2.U, waddr(31,2), waddr(31,2)+1.U) // mem_2のアドレス
    tmpaddr(3) := Mux((waddr)(1,0)<=3.U, waddr(31,2), waddr(31,2)+1.U) // mem_3のアドレス

    when(typ===MT_W){       wmask(0):=false.B;wmask(1):=false.B;wmask(2):=false.B;wmask(3):=true.B;
    }.elsewhen(typ===MT_H){ wmask(0):=false.B;wmask(1):=false.B;wmask(2):=true.B;wmask(3):=true.B;
    }.otherwise{            wmask(0):=true.B;wmask(1):=true.B;wmask(2):=true.B;wmask(3):=true.B;}

    when(wmask(0.U+waddr(1,0))){mem_0.write(tmpaddr(0),wdata(4.U-waddr(1,0)))}
    when(wmask(1.U+waddr(1,0))){mem_1.write(tmpaddr(1),wdata(4.U-waddr(1,0)))}
    when(wmask(2.U+waddr(1,0))){mem_2.write(tmpaddr(2),wdata(4.U-waddr(1,0)))}
    when(wmask(3.U+waddr(1,0))){mem_3.write(tmpaddr(3),wdata(4.U-waddr(1,0)))}
  }

  def load(): UInt ={     // ===================================== load関数
    val tmpaddr = Wire(Vec(4, UInt(24.W))) // オフセットを求める
    val databank = Wire(Vec(4, UInt(8.W)))// 各インターリーブに入っているオフセット該当データ
    val ret = WireInit(0.U(32.W))         // 返り値

    tmpaddr(0) := Mux((raddr)(1,0)===0.U, raddr(31,2), raddr(31,2)+1.U) // mem_0のアドレス
    tmpaddr(1) := Mux((raddr)(1,0)<=1.U, raddr(31,2), raddr(31,2)+1.U) // mem_1のアドレス
    tmpaddr(2) := Mux((raddr)(1,0)<=2.U, raddr(31,2), raddr(31,2)+1.U) // mem_2のアドレス
    tmpaddr(3) := Mux((raddr)(1,0)<=3.U, raddr(31,2), raddr(31,2)+1.U) // mem_3のアドレス
    databank(0):=mem_0(tmpaddr(0)); databank(1):=mem_1(tmpaddr(1));databank(2):=mem_2(tmpaddr(2));databank(3):=mem_3(tmpaddr(3))

    ret := MuxLookup(io.mport.req.typ, 0.U, Array(
      MT_W -> Cat(databank((raddr+3.U)(1,0)),databank((raddr+2.U)(1,0)),databank((raddr+1.U)(1,0)),databank(raddr(1,0))),
      MT_WU-> Cat(databank((raddr+3.U)(1,0)),databank((raddr+2.U)(1,0)),databank((raddr+1.U)(1,0)),databank(raddr(1,0))),
      MT_H -> Cat(Fill(16,databank((raddr+1.U)(1,0))(7)) ,databank((raddr+1.U)(1,0)),databank(raddr(1,0))),
      MT_HU-> Cat(Fill(16,0.U), databank((raddr+1.U)(1,0)),databank(raddr(1,0))),
      MT_B -> Cat(Fill(24, databank(raddr(1,0))(7)) ,databank(raddr(1,0))),
      MT_BU-> Cat(Fill(24,0.U), databank(raddr(1,0))),
    ))
    ret := Cat(databank((raddr+3.U)(1,0)),databank((raddr+2.U)(1,0)),databank((raddr+1.U)(1,0)),databank(raddr(1,0)))
    ret
  }

  when(io.mport.req.fcn===M_XWR){ // ===================== 書き込み
    store()
  }
  // ====================== 読み込み
  io.mport.resp.rdata := load()

}

