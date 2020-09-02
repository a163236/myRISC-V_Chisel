package common

import chisel3._
import chisel3.util._
import CommonPackage._

class DataMemoryDpathIO(implicit val cof:Configurations) extends Bundle{
  val addr  = Input(UInt(conf.xlen.W))
  val wdata = Input(UInt(conf.xlen.W))
  val rdata = Output(UInt(conf.xlen.W))
}

class DataMemoryCpathIO(implicit val cof:Configurations) extends Bundle{
  val men   = Input(Bool())                 // 書き込み有効
  val fcn   = Input(UInt(MWR_X.getWidth.W)) // 読み書きFenceのどれか
  //val typ   = Input(UInt())
}

class DataMemoryLEDIO(implicit val conf:Configurations) extends Bundle{
  val out = Output(UInt(conf.xlen.W))
}

class DataMemoryIO(implicit val conf:Configurations) extends Bundle{
  val mport = Flipped(new MemPortIO())
  val d_write = Flipped(new MemPortIO()) //データメモリ初期化書き込み用
  val dpath = new DataMemoryDpathIO()
  val cpath = new DataMemoryCpathIO()
  val led = new DataMemoryLEDIO()
}

class DataMemory(implicit val conf: Configurations) extends Module{
  val io = IO(new DataMemoryIO)
  io := DontCare
  val memory = Mem(256*1024, UInt(conf.xlen.W))

  switch(io.cpath.fcn){
    is(M_XRD){
      io.dpath.rdata := memory(io.dpath.addr)
      //printf("readdata=[%d] ", memory(io.dpath.addr))
    }
    is(M_XWR){
      memory.write(io.dpath.addr, io.dpath.wdata)
      //printf("writedata=[%d] ", io.dpath.wdata)
    }
  }

  io.led.out := memory("x800".U) // 0x800番地
  //printf("memory(0.u)=[%d] ",memory(0.U))

}