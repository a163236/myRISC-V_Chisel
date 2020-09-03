package common

import chisel3._
import chisel3.util._
import chisel3.experimental._

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


class Memory(implicit val conf:Configurations) extends Module{
  val io = IO(new Bundle() {
    val mport = Flipped(new MemPortIO())
    val d_write = Flipped(new MemPortIO())  // メモリ書き込み用
    val led = new DataMemoryLEDIO()
  })
  io := DontCare

  // input = memreq
  // output = memresp
  val memory = Mem(256*1024, UInt(8.W))

  // $1===1, $2===1, $3===1
  //                 funct7   rs2  rs1  funct3 rd    op
  /*
  memory.write(0.U, "b00000000110001010000010110010011".U(32.W))
  memory.write(4.U, "b00000110010001010000011100010011".U(32.W))
  memory.write(8.U, "b00000000111001011000010110110011".U(32.W))
  memory.write(12.U, "b10000000101100000010000000100011".U(32.W))
  */
  // typ　word byte
  // fcn 読み書き

  when(io.d_write.req.valid){ // =====================memory初期化
    for (i <- 0 to 3){
      memory.write((io.d_write.req.bits.addr+i.U), io.d_write.req.bits.wdata(8*(i+1)-1,8*i))
    }
    io.mport.resp.valid := false.B

  }.elsewhen(io.mport.req.valid){
    // 普通のメモリアクセス && ストールではない
    switch(io.mport.req.bits.fcn){
      is(M_XRD){  // ===================================読み出し

        val rdata_0 = memory(io.mport.req.bits.addr)
        val rdata_1 = memory(io.mport.req.bits.addr+1.U)
        val rdata_2 = memory(io.mport.req.bits.addr+2.U)
        val rdata_3 = memory(io.mport.req.bits.addr+3.U)

        io.mport.resp.bits.rdata := MuxLookup(io.mport.req.bits.typ, 0.U, Array(
          MT_B -> Cat(Fill(24,rdata_0(7)), rdata_0),
          MT_H -> Cat(Fill(15,rdata_1(7)), rdata_1, rdata_0),
          MT_W -> Cat(rdata_3, rdata_2, rdata_1, rdata_0),
          MT_WU-> Cat(rdata_3, rdata_2, rdata_1, rdata_0),
        ))

      }

      is(M_XWR){  // ===================================書き込み
        val tmpdata = io.mport.req.bits.wdata
        val wdata = MuxLookup(io.mport.req.bits.typ, tmpdata, Array(
          MT_X -> tmpdata,
          MT_B -> Cat(Fill(24,tmpdata(7)), tmpdata(7,0)),
          MT_H -> Cat(Fill(12,tmpdata(11)), tmpdata(11,0)),
          MT_W -> tmpdata,
          MT_WU-> tmpdata,
        ))
        memory.write(io.mport.req.bits.addr, wdata)
      }
    }
    io.mport.resp.valid := true.B

  }.otherwise{  //
    io.mport.resp.valid := true.B
  }

  io.led.out := memory("x800".U) // 0x800番地
}