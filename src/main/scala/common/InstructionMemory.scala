package common

import chisel3._
import chisel3.util._
import chisel3.experimental._

import CommonPackage._

class InstructionMemory(implicit val conf:Configurations) extends Module{
  val io = IO(new Bundle() {
    val mport = Flipped(new MemPortIO())
    val d_write = Flipped(new MemPortIO())  // メモリ書き込み用
  })
  io := DontCare

  // input = memreq
  // output = memresp
  val memory = Mem(256*1024, UInt(conf.xlen.W))

  // $1===1, $2===1, $3===1
  //                 funct7   rs2  rs1  funct3 rd    op
/*
  memory.write(0.U, "b00000000110001010000010110010011".U(32.W))
  memory.write(4.U, "b00000110010001010000011100010011".U(32.W))
  memory.write(8.U, "b00000000111001011000010110110011".U(32.W))
  memory.write(12.U, "b10000000101100000010000000100011".U(32.W))
*/


  when(io.d_write.req.valid){ // memory初期化
    memory.write(io.d_write.req.bits.addr, io.d_write.req.bits.wdata)
    io.mport.resp.valid := false.B
    io.mport.req.ready := false.B

  }.elsewhen(!io.d_write.req.valid){ // 普通のメモリフェッチ ストールではない
    io.mport.resp.bits.rdata := memory(io.mport.req.bits.addr)
    io.mport.resp.valid := true.B
    io.mport.req.ready := false.B

  }.otherwise{
    io.mport.req.ready := true.B
  }

}