package rv32i_1stage

import chisel3._
import chisel3.util._
import common.CommonPackage._
import common.Configurations

/*
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

class Memory(implicit val conf:Configurations) extends Module{
  val io = IO(new Bundle() {
    val mport = Flipped(new MemPortIO())
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

  val rdata_0 = memory(io.mport.req.bits.addr)
  val rdata_1 = memory(io.mport.req.bits.addr+1.U)
  val rdata_2 = memory(io.mport.req.bits.addr+2.U)
  val rdata_3 = memory(io.mport.req.bits.addr+3.U)

  val wdata_0 = io.mport.req.bits.wdata(7,0)
  val wdata_1 = io.mport.req.bits.wdata(15,8)
  val wdata_2 = io.mport.req.bits.wdata(23,16)
  val wdata_3 = io.mport.req.bits.wdata(31,24)


  def store(addr:UInt ,data:UInt, bytes:Int){ // ==============store関数
    for (i <- 0 until bytes){
      memory.write((addr+i.U), data(8*(i+1)-1,8*i));
    }
  }


  when(io.mport.req.bits.fcn===M_XWR){
    // default
    val wdata = WireInit(0.U)

    switch(io.mport.req.bits.typ){
      is(MT_B){wdata:=Cat(Fill(24,wdata_0(7)), wdata_0); store(io.mport.req.bits.addr,wdata,1)}
      is(MT_H){wdata:=Cat(Fill(16,wdata_1(7)), wdata_1, wdata_0); store(io.mport.req.bits.addr,wdata,2)}
      is(MT_W){wdata:=Cat(wdata_3, wdata_2, wdata_1, wdata_0); store(io.mport.req.bits.addr,wdata, 4)}
      is(MT_WU){wdata:=Cat(wdata_3, wdata_2, wdata_1, wdata_0); store(io.mport.req.bits.addr,wdata, 4)}
    }
  }

  io.mport.resp.bits.rdata := MuxLookup(io.mport.req.bits.typ, Cat(rdata_3, rdata_2, rdata_1, rdata_0), Array(
    MT_B -> Cat(Fill(24,rdata_0(7)), rdata_0),
    MT_BU -> Cat(Fill(24,0.U), rdata_0),
    MT_H -> Cat(Fill(16,rdata_1(7)), rdata_1, rdata_0),
    MT_HU -> Cat(Fill(16,0.U), rdata_1, rdata_0),
  ))

}


 */