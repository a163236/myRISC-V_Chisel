// コントローラは内包していない

package rv32i_1stage

import chisel3._
import chisel3.util._
import common._
import CommonPackage._

// メモリ類は外にある

// コントローラへの出力output
class DatToCtlIO(implicit val conf: Configurations) extends Bundle() {
  val inst      = Output(UInt(conf.xlen.W))
  val branComOut= new BranComOut
  val csr_eret  = Output(Bool())

}

// データパスの全てのIO
class DpathIO(implicit val conf: Configurations) extends Bundle() {
  val imem    = new MemPortIO()     // 命令メモリ用IO
  val dmem    = Flipped(new DataMemoryDpathIO())
  val ctl     = Flipped(new CtltoDatIO())   // コントローラからデータへの出力
  val dat     = new DatToCtlIO()            // データパスからコントローラへの入力
  val debug   = new DebugIO()               // デバッグ
}

class Dpath(implicit val conf: Configurations) extends Module{
  val io = IO(new DpathIO())
  io := DontCare

  // まずは使うModule・レジスタ宣言
  val pc_reg  = RegInit(0.U(conf.xlen.W))
  val ALU     = Module(new ALU())
  val ImmGen  = Module(new ImmGen())
  val RegFile = Module(new RegisterFile())
  val BranchComp = Module(new BranchComp())

  // 配線の宣言
  val pc_next  = Wire(UInt(conf.xlen.W))
  val pc_plus4 = Wire(UInt(conf.xlen.W))
  val pc_alu   = Wire(UInt(conf.xlen.W))

  // ここからはモジュール同士を接続してく

  // 命令フェッチ
  io.imem.req.bits.addr := pc_reg
  //printf("[%d] ",io.imem.req.bits.addr)
  val inst = Mux(io.imem.resp.valid, io.imem.resp.bits.rdata, BUBBLE) // メモリがビジーならバブル
  //val inst = Mux(io.imem.resp.valid, BUBBLE, 0.U) // メモリがビジーならバブル

  // レジスタファイル 接続
  RegFile.io.rs1_addr := io.imem.resp.bits.rdata(RS1_MSB, RS1_LSB)
  RegFile.io.rs2_addr := io.imem.resp.bits.rdata(RS2_MSB, RS2_LSB)

  // 即値生成 接続
  ImmGen.io.inst := inst
  ImmGen.io.imm_sel <> io.ctl.imm_sel

  // 分岐モジュール 接続
  BranchComp.io.rs1_data := RegFile.io.rs1_data
  BranchComp.io.rs2_data := RegFile.io.rs2_data

  // ALU 接続
  ALU.io.fun := io.ctl.alu_fun
  ALU.io.op1 := Mux(io.ctl.op1_sel===OP1_RS1, RegFile.io.rs1_data, pc_reg)
  ALU.io.op2 := MuxLookup(io.ctl.op2_sel, RegFile.io.rs2_data, Array(
    OP2_RS2 -> RegFile.io.rs2_data,
    OP2_IMM -> ImmGen.io.out,
  ))

  // データパスからコントロールパスへの出力
  io.dat.inst  := inst
  io.dat.branComOut <> BranchComp.io.branComOut

  // データメモリ 接続
  io.dmem.addr  := ALU.io.out
  io.dmem.wdata := RegFile.io.rs2_data

  // CSR
  val csr = Module(new CSRFile())
  csr.io := DontCare

  // ライトバック
  RegFile.io.waddr  := inst(RD_MSB, RD_LSB)
  RegFile.io.wen    := io.ctl.rf_wen
  RegFile.io.wdata  := MuxLookup(io.ctl.wb_sel, ALU.io.out, Array(
    WB_ALU -> ALU.io.out,
    WB_PC4 -> (pc_reg + 4.U),
    WB_MEM -> io.dmem.rdata
  ))

  // pcの更新
  pc_next := MuxLookup(io.ctl.pc_sel, pc_reg, Array(
    PC_4 -> pc_plus4,
    PC_ALU -> pc_alu
  ))

  when(!io.ctl.stall){
    pc_reg := pc_next
  }
  pc_plus4 := (pc_reg + 4.asUInt(conf.xlen.W))
  pc_alu := ALU.io.out

  io.debug.out := RegFile.io.debug.out

  // debug 表示

  when(!io.ctl.stall) {

    printf("pc=[0x%x] IMEM=[0x%x] inst=[0x%x] ImmgenOut=[0x%x] rs1=[%d] rs2=[%d]" +
      " rd=[%d] reg(gp)=[%d] ALUOUT=[%d] DMEMaddr=[%d] DMEMdataw=[%d] DMEMdatar=[%d] ",
      pc_reg, io.imem.resp.bits.rdata, inst, ImmGen.io.out, ALU.io.op1, ALU.io.op2,
      io.imem.resp.bits.rdata(RD_MSB, RD_LSB), RegFile.io.debug.out, ALU.io.out, io.dmem.addr,
      io.dmem.wdata, io.dmem.rdata)

  }

}