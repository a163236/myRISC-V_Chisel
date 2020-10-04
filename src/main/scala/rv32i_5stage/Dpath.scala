package rv32i_5stage

import chisel3._
import chisel3.util._
import common._
import CommonPackage._
import treadle.executable.MuxLongs

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

  // *** 命令フェッチ ステージ **********************************************************************

  val pc_reg  = RegInit(START_ADDR.U(32.W)) // オリジナルpc
  val next_pc = Wire(UInt(32.W))
  next_pc := pc_reg + 4.U
  pc_reg := next_pc

  // 命令フェッチ
  io.imem.req.raddrI := pc_reg
  io.imem.req.renI := true.B
  val inst = Wire(UInt(32.W))       // 命令ワイヤー
  inst := io.imem.resp.rdata        // 命令メモリからのデータ

  // *** デコード ステージ *************************************************************************

  val pc_decode = RegNext(pc_reg)
  ctrlUnit.io.inst := inst  // コントロールユニットに命令を渡す
  regFile.io.rs1_addr := inst(RS1_MSB, RS1_LSB)
  regFile.io.rs2_addr := inst(RS2_MSB, RS2_LSB)

  // *** 実行 ステージ *****************************************************************************

  val pc_execute = RegNext(pc_decode)
  val inst_execute = RegNext(inst)
  val ctrl_execute_executeStage = new ctrl_execute
  val ctrl_mem_executeStage = new ctrl_mem
  val ctrl_wb_executeStage = new ctrl_wb
  // 実行ステージの制御信号のパイプ渡し
  ctrl_execute_executeStage.op1_sel := ctrlUnit.io.ctrlEX.op1_sel
  ctrl_execute_executeStage.op2_sel := ctrlUnit.io.ctrlEX.op2_sel
  ctrl_execute_executeStage.imm_sel := ctrlUnit.io.ctrlEX.imm_sel
  ctrl_execute_executeStage.alu_fun := ctrlUnit.io.ctrlEX.alu_fun
  // メモリステージの制御信号のパイプ渡し
  ctrl_mem_executeStage.dmem_en := ctrlUnit.io.ctrlMEM.dmem_en
  ctrl_mem_executeStage.dmem_wr := ctrlUnit.io.ctrlMEM.dmem_wr
  ctrl_mem_executeStage.dmem_mask := ctrlUnit.io.ctrlMEM.dmem_mask
  // ライトバックステージの制御信号のパイプ渡し
  ctrl_wb_executeStage.rf_wen := ctrlUnit.io.ctrlWB.rf_wen

  immGen.io.inst := inst_execute
  immGen.io.imm_sel := ctrlUnit.io.ctrlEX.imm_sel

  aLU.io.op1 := regFile.io.rs1_data
  aLU.io.op1 := Mux(ctrlUnit.io.ctrlEX.op1_sel===OP1_RS1, regFile.io.rs1_data, pc_execute)
  aLU.io.op2 := Mux(ctrlUnit.io.ctrlEX.op2_sel===OP2_RS2, regFile.io.rs2_data, immGen.io.out)
  aLU.io.fun := ctrlUnit.io.ctrlEX.alu_fun

  // *** Memory Stage *****************************************************************************

  val pc_mem = RegNext(pc_execute)
  val inst_mem = RegNext(inst_execute)
  val ctrl_mem_memStage = new ctrl_mem
  val ctrl_wb_memStage = new ctrl_wb
  // メモリステージのパイプライン渡し
  ctrl_mem_memStage.dmem_en := ctrl_mem_executeStage.dmem_en
  ctrl_mem_memStage.dmem_wr := ctrl_mem_executeStage.dmem_wr
  ctrl_mem_memStage.dmem_mask := ctrl_mem_executeStage.dmem_mask
  // メモリステージの制御信号のパイプ渡し
  ctrl_wb_memStage.rf_wen := ctrl_wb_executeStage.rf_wen

  // *** ライトバック ステージ **********************************************************************

  val ctrl_wb_wbStage = new ctrl_wb
  val inst_wb = RegNext(inst_mem)
  // メモリステージの制御信号のパイプ渡し
  ctrl_wb_wbStage.rf_wen := ctrl_wb_memStage.rf_wen

  regFile.io.waddr := inst(RD_MSB, RD_LSB)
  regFile.io.wdata := aLU.io.out
  regFile.io.wen := ctrlUnit.io.ctrlWB.rf_wen


  // *** DEBUG ************************************************************************************
  io.debug.pc := pc_reg
  io.debug.pc_decode := pc_decode
  io.debug.reg_a0 := regFile.io.reg_a0
  io.debug.inst := inst
  io.debug.alu_out := aLU.io.out
}


// 制御信号のパイプラインのためのレジスタ
class ctrl_execute{
  val op1_sel = Reg(UInt(OP1_X.getWidth.W))
  val op2_sel = Reg(UInt(OP2_X.getWidth.W))
  val imm_sel = Reg(UInt(IMM_X.getWidth.W))
  val alu_fun = Reg(UInt(ALU_X.getWidth.W))
}

class ctrl_mem{
  val dmem_en = Reg(Bool())
  val dmem_wr = Reg(Bool())
  val dmem_mask = Reg(UInt(MT_X.getWidth.W))
}

class ctrl_wb{
  val rf_wen  = Reg(Bool())
}