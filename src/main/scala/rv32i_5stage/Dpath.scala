package rv32i_5stage

import chisel3._
import chisel3.util._
import common._
import CommonPackage._
import treadle.executable.MuxLongs
import rv32i_5stage.pipelineregisters._

class DpathIO(implicit val conf:Configurations) extends Bundle(){
  val imem = new InstMemPortIO()  // 命令メモリIO
  val dmem = new DataMemPortIO()  // データメモリIO
  val debug = new DebugIO()        // デバッグIO
  val led = new LEDDebugIO()        // LED用
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
  val next_pc = pc_reg + 4.U
  pc_reg := next_pc

  // 命令フェッチ
  io.imem.req.raddrI := pc_reg
  io.imem.req.renI := true.B
  val inst = io.imem.resp.rdata        // 命令メモリからのデータ

  // *** デコード ステージ *************************************************************************

  val pc_decode = RegNext(pc_reg)
  ctrlUnit.io.inst := inst  // コントロールユニットに命令を渡す
  regFile.io.rs1_addr := inst(RS1_MSB, RS1_LSB)
  regFile.io.rs2_addr := inst(RS2_MSB, RS2_LSB)

  // *** 実行 ステージ *****************************************************************************

  val pc_execute = RegNext(pc_decode)
  val inst_execute = RegNext(inst)
  val rs1_execute = Reg(UInt(32.W))
  rs1_execute := regFile.io.rs1_data
  val rs2_execute = Reg(UInt(32.W))
  rs2_execute := regFile.io.rs2_data
  val ctrl_execute_executeStage = new EX_Ctrl_Regs
  val ctrl_mem_executeStage = new MEM_Ctrl_Regs
  val ctrl_wb_executeStage = new WB_Ctrl_Regs
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
  immGen.io.imm_sel := ctrl_execute_executeStage.imm_sel

  aLU.io.op1 := Mux(ctrl_execute_executeStage.op1_sel===OP1_RS1, rs1_execute, pc_execute)
  aLU.io.op2 := Mux(ctrl_execute_executeStage.op2_sel===OP2_RS2, rs2_execute, immGen.io.out)
  aLU.io.fun := ctrl_execute_executeStage.alu_fun

  // *** Memory Stage *****************************************************************************

  val pc_mem = RegNext(pc_execute)
  val inst_mem = RegNext(inst_execute)
  val alu_out_mem = Reg(UInt(32.W))
  alu_out_mem := aLU.io.out
  val rs2_mem = RegNext(rs2_execute)
  val ctrl_mem_memStage = new MEM_Ctrl_Regs
  val ctrl_wb_memStage = new WB_Ctrl_Regs
  // メモリステージのパイプライン渡し
  ctrl_mem_memStage.dmem_en := ctrl_mem_executeStage.dmem_en
  ctrl_mem_memStage.dmem_wr := ctrl_mem_executeStage.dmem_wr
  ctrl_mem_memStage.dmem_mask := ctrl_mem_executeStage.dmem_mask
  // メモリステージの制御信号のパイプ渡し
  ctrl_wb_memStage.rf_wen := ctrl_wb_executeStage.rf_wen

  // *** ライトバック ステージ **********************************************************************

  val ctrl_wb_wbStage = new WB_Ctrl_Regs
  val inst_wb = RegNext(inst_mem)
  val memStage_out = RegNext(alu_out_mem)
  // メモリステージの制御信号のパイプ渡し
  ctrl_wb_wbStage.rf_wen := ctrl_wb_memStage.rf_wen

  regFile.io.waddr := inst_wb(RD_MSB, RD_LSB)
  regFile.io.wdata := memStage_out
  regFile.io.wen := ctrl_wb_wbStage.rf_wen


  // *** DEBUG ************************************************************************************
  io.led.out := regFile.io.reg_a0
  io.debug.pc := pc_reg
  io.debug.pc_decode := pc_decode
  io.debug.reg_a0 := regFile.io.reg_a0
  io.debug.inst := inst
  io.debug.alu_out := aLU.io.out

  printf("pc_reg=[%x], " +
    "pc_decode=[%x], inst=[%x] " +
    "pc_execute=[%x], rs1_execute=[%x] rs2_execute=[%x] inst_execute=[%x] " +
    "pc_mem=[%x], alu_out=[%x], rs2_mem=[%x], inst_mem=[%x] " +
    "memStage_out=[%x], inst_wb=[%x] " +
    "reg_a0=[%x] " +
    "temp=[%x] " +
    "\n"

    , pc_reg
    , pc_decode, inst
    , pc_execute, rs1_execute, rs2_execute, inst_execute
    , pc_mem, alu_out_mem, rs2_mem, inst_mem
    , memStage_out, inst_wb
    , regFile.io.reg_a0
    , ctrlUnit.io.ctrlWB.rf_wen
  )
}
