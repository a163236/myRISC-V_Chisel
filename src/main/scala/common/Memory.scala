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

class Memory(implicit val conf:Configurations) extends Module {
  val io = IO(new Bundle() {
    val mport = Flipped(new MemPortIO())
    val d_write = Flipped(new MemPortIO()) // メモリ書き込み用
    val led = new DataMemoryLEDIO()
  })
  io := DontCare
  val mem_0,mem_1,mem_2,mem_3 = SyncReadMem(64*1024, UInt(8.W))


  when(io.d_write.req.valid){ // =====================memory初期化
    mem_0.write(io.d_write.req.bits.addr(31,2), io.d_write.req.bits.wdata(7,0))
    mem_1.write(io.d_write.req.bits.addr(31,2), io.d_write.req.bits.wdata(15,8))
    mem_2.write(io.d_write.req.bits.addr(31,2), io.d_write.req.bits.wdata(23,16))
    mem_3.write(io.d_write.req.bits.addr(31,2), io.d_write.req.bits.wdata(31,24))
    io.mport.resp.valid := true.B

  }.elsewhen(io.mport.req.valid){
    // 普通のメモリアクセス && ストールではない
    switch(io.mport.req.bits.fcn){
      is(M_XRD){  // ===================================読み出し load

        io.mport.resp.bits.rdata := Cat(
          mem_3.read((io.mport.req.bits.addr >> 2).asUInt()),
          mem_2.read((io.mport.req.bits.addr >> 2).asUInt()),
          mem_1.read((io.mport.req.bits.addr >> 2).asUInt()),
          mem_0.read((io.mport.req.bits.addr >> 2).asUInt()),
        )

        printf("%x ", io.mport.req.bits.addr)
        printf("%x ", io.mport.req.bits.addr(31,2))
        printf("%x ", mem_0("h26".U))
        printf("%x ", mem_0(io.mport.req.bits.addr(31,2)))

        switch(io.mport.req.bits.typ){
        }

      }

      is(M_XWR) { // ===================================書き込み store
        // default
        switch(io.mport.req.bits.typ){

        }

      }
    }
    io.mport.resp.valid := false.B

  }.otherwise{  //
    io.mport.resp.valid := false.B
  }

}