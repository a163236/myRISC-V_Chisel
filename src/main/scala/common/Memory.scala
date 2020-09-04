package common

import chisel3._
import chisel3.util._
import CommonPackage._

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
  val mem_0,mem_1,mem_2,mem_3 = SyncReadMem(64*1024, UInt(8.W))
  val addr = io.mport.req.bits.addr

  def store(addr:UInt ,data:UInt, bytes:Int){ // ==============store関数
    for (i <- 0 until bytes){
      switch((addr + i.U)(1,0)){
        is(0.U){mem_0.write(((addr+1.U)(31,2)), data(8*(i+1)-1,8*i))}
        is(1.U){mem_1.write(((addr+1.U)(31,2)), data(8*(i+1)-1,8*i))}
        is(2.U){mem_2.write(((addr+1.U)(31,2)), data(8*(i+1)-1,8*i))}
        is(3.U){mem_3.write(((addr+1.U)(31,2)), data(8*(i+1)-1,8*i))}
      }
    }
  }

  when(io.mport.req.bits.fcn===M_XWR){ // ===================== 書き込み
    store(addr, io.mport.req.bits.wdata, 4)

  }.elsewhen(io.mport.req.valid) {
    // 普通のメモリアクセス && ストールではない
    // ===================================読み出し load
    switch(io.mport.req.bits.typ) {
      is(MT_WU) { // lw
        io.mport.resp.bits.rdata := Cat(mem_3(addr(31, 2)), mem_2(addr(31, 2)), mem_1(addr(31, 2)), mem_0(addr(31, 2)))
      }
    }
  }

}
