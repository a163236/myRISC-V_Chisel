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
  val memory = Mem(1024, UInt(conf.xlen.W))

  // $1===1, $2===1, $3===1
  //                 funct7   rs2  rs1  funct3 rd    op
  memory.write(0.U, "b00000000110001010000010110010011".U(32.W))
  memory.write(4.U, "b00000000000101010000011000010011".U(32.W))
  memory.write(8.U, "b00000110010001010000011100010011".U(32.W))
  memory.write(12.U, "b00000000110001011000010110110011".U(32.W))
  memory.write(16.U, "b10000000101100000010000000100011".U(32.W))



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

  //printf("realMEM=[0x%x] ", io.mport.resp.bits.rdata)
}




/*
// $1===1, $2===1, $3===1
//                 funct7   rs2  rs1  funct3 rd    op
memory.write(0.U, "b00000000101000000000000110010011".U(32.W))
memory.write(4.U, "b00000000000100000000001000010011".U(32.W))
memory.write(8.U, "b00000000001100100100011001100011".U(32.W))
memory.write(12.U, "b00000000000000011000001000010011".U(32.W))
memory.write(16.U, "b00000000010000000000000001101111".U(32.W))
memory.write(20.U, "b00000000000100000000001000010011".U(32.W))
memory.write(24.U, "b00000000000100000000001010010011".U(32.W))
memory.write(28.U, "b00000000001000000000001110010011".U(32.W))
memory.write(32.U, "b00000000001100111101110001100011".U(32.W))
memory.write(36.U, "b00000000000000100000001100010011".U(32.W))
memory.write(40.U, "b00000000010100100000001000110011".U(32.W))
memory.write(44.U, "b00000000000000110000001010010011".U(32.W))
memory.write(48.U, "b00000000000100111000001110010011".U(32.W))
memory.write(52.U, "b11111110110111111111000001101111".U(32.W))
memory.write(56.U, "b00000000000000100000010100010011".U(32.W))
*/

