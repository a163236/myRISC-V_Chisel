package rv32i_5stage

import chisel3._
import common._
import CommonPackage._

class DpathIO(implicit val conf:Configurations) extends Bundle(){
  val imem = new InstMemPortIO()  // 命令メモリIO
  val dmem = new DataMemPortIO()  // データメモリIO
  val debug = new DebugIO()        // デバッグIO

}

class Dpath(implicit val conf:Configurations) extends Module{
  val io = IO(new DpathIO())
  io := DontCare
  // https://inst.eecs.berkeley.edu/~cs61c/resources/su18_lec/Lecture13.pdf
  // まずは使うModule宣言
  val ctrlUnit = Module(new ControlUnit())
  val aLU     = Module(new ALU())
  val immGen  = Module(new ImmGen())
  val regFile = Module(new RegisterFile())
  val branchComp = Module(new BranchComp())
  // 初期化
  ctrlUnit.io:=DontCare; aLU.io:=DontCare; immGen.io:=DontCare;
  regFile.io:=DontCare; branchComp.io:=DontCare

  // *** 命令フェッチ ステージ ************************************************
  // 出力: pc,inst
  val pc_reg  = RegInit(START_ADDR.U(32.W)) // オリジナルpc
  val next_pc = Wire(UInt(32.W))
  next_pc := pc_reg + 4.U
  pc_reg := next_pc

  // 命令フェッチ
  io.imem.req.raddrI := pc_reg
  io.imem.req.renI := true.B
  val inst = Wire(UInt(32.W))       // 命令ワイヤー
  inst := io.imem.resp.rdata        // 命令メモリからのデータ
  // *** デコード ステージ ************************************************
  val pc_decode = RegNext(pc_reg)
  ctrlUnit.io.inst := inst  // コントロールユニットに命令を渡す
  regFile.io.rs1_addr := inst(RS1_MSB, RS1_LSB)
  regFile.io.rs2_addr := inst(RS2_MSB, RS2_LSB)

  // *** 実行 ステージ ************************************************
  // ALU
  aLU.io.op1 := regFile.io.rs1_data
  aLU.io.op2 := regFile.io.rs2_data

  // *** Memory Stage ******************************

  // *** ライトバック ステージ ******************************

  regFile.io.waddr := inst(RD_MSB, RD_LSB)
  regFile.io.wdata := aLU.io.out
  regFile.io.wen := ctrlUnit.io.ctrlWB.rf_wen


  // *** DEBUG ************************************
  io.debug.pc := pc_reg
  io.debug.pc_decode := pc_decode
  io.debug.reg_a0 := regFile.io.reg_a0
  io.debug.inst := inst


}

