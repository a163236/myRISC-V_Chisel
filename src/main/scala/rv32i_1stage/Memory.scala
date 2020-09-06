package rv32i_1stage

import chisel3._
import chisel3.util._
import common.CommonPackage._
import common._

class MemPortIO(implicit val conf:Configurations) extends Bundle{
  val req = new DecoupledIO(new MemReqIO())         // パス->メモリ output
  val resp = Flipped(new ValidIO(new MemRespIO()))  // メモリ->パス input
}

class MemReqIO(implicit val conf:Configurations) extends Bundle{
  val addr = Output(UInt(conf.xlen.W))
  val wdata = Output(UInt(conf.xlen.W))
  val fcn  = Output(UInt(M_X.getWidth.W)) //  half?byte?
  val typ = Output(UInt(MT_X.getWidth.W)) //  load?store?
}

class MemRespIO(implicit val conf:Configurations) extends Bundle{
  val rdata = Output(UInt(conf.xlen.W))
}

class DataMemoryLEDIO(implicit val conf:Configurations) extends Bundle{
  val out = Output(UInt(conf.xlen.W))
}

class MemInitial extends Bundle{
  val wantInit = Input(Bool())
  val initOK = Output(Bool())
}

class Memory(implicit val conf:Configurations) extends Module {
  val io = IO(new Bundle() {
    val mport = Flipped(new MemPortIO())
    val led = new DataMemoryLEDIO()
  })
  io := DontCare
  val mem_0,mem_1,mem_2,mem_3 = Mem(64*1024, UInt(8.W))
  val addr = io.mport.req.bits.addr
  val typ = io.mport.req.bits.typ

  def store(data:UInt, bytes:Int){ // =================================== store関数
    for (i <- 0 until bytes){
      switch((addr + i.U)(1,0)){
        is(0.U){mem_0.write(((addr+1.U)(31,2)), data(8*(i+1)-1,8*i))}
        is(1.U){mem_1.write(((addr+1.U)(31,2)), data(8*(i+1)-1,8*i))}
        is(2.U){mem_2.write(((addr+1.U)(31,2)), data(8*(i+1)-1,8*i))}
        is(3.U){mem_3.write(((addr+1.U)(31,2)), data(8*(i+1)-1,8*i))}
      }
    }
  }

  def load(): UInt ={     // ===================================== load関数
    val tmpaddr = Wire(Vec(4, UInt(8.W))) // オフセットを求める
    val databank = Wire(Vec(4, UInt(8.W)))// 各インターリーブに入っているオフセット該当データ
    val ret = WireInit(0.U(32.W))         // 返り値

    tmpaddr(0) := Mux((addr)(1,0)===0.U, addr(31,2), addr(31,2)+1.U) // mem_0のアドレス
    tmpaddr(1) := Mux((addr)(1,0)<=1.U, addr(31,2), addr(31,2)+1.U) // mem_1のアドレス
    tmpaddr(2) := Mux((addr)(1,0)<=2.U, addr(31,2), addr(31,2)+1.U) // mem_2のアドレス
    tmpaddr(3) := Mux((addr)(1,0)<=3.U, addr(31,2), addr(31,2)+1.U) // mem_3のアドレス
    databank(0):=mem_0(tmpaddr(0)); databank(1):=mem_1(tmpaddr(1));databank(2):=mem_2(tmpaddr(2));databank(3):=mem_3(tmpaddr(3))

    ret := MuxLookup(io.mport.req.bits.typ, 0.U, Array(
      MT_W -> Cat(databank((addr+3.U)(1,0)),databank((addr+2.U)(1,0)),databank((addr+1.U)(1,0)),databank(addr(1,0))),
      MT_WU-> Cat(databank((addr+3.U)(1,0)),databank((addr+2.U)(1,0)),databank((addr+1.U)(1,0)),databank(addr(1,0))),
      MT_H -> Cat(Fill(16,databank((addr+1.U)(1,0))(7)) ,databank((addr+1.U)(1,0)),databank(addr(1,0))),
      MT_HU-> Cat(Fill(16,0.U), databank((addr+1.U)(1,0)),databank(addr(1,0))),
      MT_B -> Cat(Fill(24, databank(addr(1,0))(7)) ,databank(addr(1,0))),
      MT_BU-> Cat(Fill(24,0.U), databank(addr(1,0))),
    ))
    ret
  }

  when(io.mport.req.bits.fcn===M_XWR){ // ===================== 書き込み
    when(io.mport.req.bits.typ===MT_H){store(io.mport.req.bits.wdata, 2)       // halfword
    }.elsewhen(io.mport.req.bits.typ===MT_B){store(io.mport.req.bits.wdata, 1) // byte
    }.otherwise{store(io.mport.req.bits.wdata, 4)}                             // word
  }
  // ====================== 読み込み
  io.mport.resp.bits.rdata := load()
}

