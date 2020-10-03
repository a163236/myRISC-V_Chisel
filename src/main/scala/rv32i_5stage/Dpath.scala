package rv32i_5stage

import chisel3._
import common._
import CommonPackage._
/*
class DpathIO(implicit val conf:Configurations) extends Bundle(){
  val imem = new MemPortIO()  // 命令メモリIO

}

class Dpath(implicit val conf:Configurations) extends Module{
  val io = IO(new DpathIO())
  io := DontCare

  // *** 命令フェッチ ステージ ******************************
  // 出力: pc,inst
  // レジスタ宣言
  val if_pc_reg = RegInit(START_ADDR.U(conf.xlen.W))

  // 配線の宣言
  val pc_next = Wire(UInt(conf.xlen.W))

  pc_next := if_pc_reg + 4.U

  // pcの更新
  if_pc_reg := pc_next

  // 命令フェッチ
  val inst = WireInit(UInt(conf.xlen.W))  // 命令ワイヤー
  io.imem.req.raddr := if_pc_reg          // 命令メモリにpcアドレスの命令を要求
  inst := io.imem.resp.rdata              // 命令メモリから命令データの受け取り

  // *** Decode Stage ******************************

  val regfile = Module(new RegisterFile())


  // *** Execute Stage Stage ******************************

  // *** Memory Stage ******************************

  // *** WriteBack Stage ******************************

}

 */