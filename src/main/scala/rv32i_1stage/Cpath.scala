//  コントローラのパス

package rv32i_1stage

import chisel3._
import chisel3.util._

import common._
import common.Instructions._
import CommonPackage._


// データパスへの出力
class CtltoDatIO extends Bundle(){
  val stall   = Output(Bool())
  val pc_sel  = Output(UInt(PC_4.getWidth.W))
  val op1_sel = Output(UInt(OP1_X.getWidth.W))
  val op2_sel = Output(UInt(OP2_X.getWidth.W))
  val imm_sel = Output(UInt(IMM_X.getWidth.W))
  val alu_fun = Output(UInt(ALU_X.getWidth.W))
  val wb_sel  = Output(UInt(WB_X.getWidth.W))
  val rf_wen  = Output(Bool())
  val csr_cmd   = Output(UInt(CSR.SZ))  // csrのWRSIのどれか
  val exception = Output(Bool())
}

// コントローラの全ての入出力
class CpathIO(implicit val conf:Configurations) extends Bundle(){
  val dat = Flipped(new DatToCtlIO())
  val ctl = new CtltoDatIO()  // データパスへの出力
  val meminit = new MemInitial() // メモリ初期化
  val dmem= new MemPortIO()
  val imem= new MemPortIO()
}

class CtlPath() extends Module() {
  val io = IO(new CpathIO())
  io := DontCare


  val csignals =
    ListLookup(io.dat.inst,
      List(N, BR_N, OP1_X, OP2_X, IMM_X, ALU_X, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.N),
      Array(  /* val  |  BR  |  op1   | op2  | imm |  ALU    |  wb  | rf   | mem  | mem  | mask |  csr  */
             /* inst | type |   sel  | sel  |  sel |   fcn   |  sel | wen  |  en  |  wr  | type |  cmd  */
        LW -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_ADD, WB_MEM, REN_1, MEN_1, M_XRD, MT_W, CSR.N),
        LB -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_ADD, WB_MEM, REN_1, MEN_1, M_XRD, MT_B, CSR.N),
        LBU-> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_ADD, WB_MEM, REN_1, MEN_1, M_XRD, MT_BU, CSR.N),
        LH -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_ADD, WB_MEM, REN_1, MEN_1, M_XRD, MT_H, CSR.N),
        LHU-> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_ADD, WB_MEM, REN_1, MEN_1, M_XRD, MT_HU, CSR.N),
        SW -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_S, ALU_ADD, WB_X, REN_0, MEN_1, M_XWR, MT_W, CSR.N),
        SB -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_S, ALU_ADD, WB_X, REN_0, MEN_1, M_XWR, MT_B, CSR.N),
        SH -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_S, ALU_ADD, WB_X, REN_0, MEN_1, M_XWR, MT_H, CSR.N),

        AUIPC-> List(Y, BR_N, OP1_PC, OP2_IMM, IMM_U, ALU_ADD, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        LUI  -> List(Y, BR_N, OP1_X, OP2_IMM, IMM_U, ALU_COPYrs2, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),

        // I形式
        ADDI -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_ADD, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        ANDI -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_AND, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        ORI  -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_OR, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        XORI -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_XOR, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SLTI -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_SLT, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SLTIU-> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_SLTU, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SLLI -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_SLL, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SRAI -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_SRA, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SRLI -> List(Y, BR_N, OP1_RS1, OP2_IMM, IMM_I, ALU_SRL, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),

        // R形式
        SLL -> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_SLL, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        ADD -> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_ADD, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SUB -> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_SUB, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SLT -> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_SLT, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SLTU-> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_SLTU, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        AND -> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_AND, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        OR  -> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_OR, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        XOR -> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_XOR, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SRA -> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_SRA, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),
        SRL -> List(Y, BR_N, OP1_RS1, OP2_RS2, IMM_X, ALU_SRL, WB_ALU, REN_1, MEN_0, M_X, MT_X, CSR.N),

        // J形式
        JAL -> List(Y, BR_J, OP1_PC, OP2_IMM, IMM_J, ALU_ADD, WB_PC4, REN_1, MEN_0, M_X, MT_X, CSR.N),
        JALR-> List(Y, BR_JR, OP1_RS1, OP2_IMM, IMM_J, ALU_ADD, WB_PC4, REN_1, MEN_0, M_X, MT_X, CSR.N),

        // B形式
        BEQ -> List(Y, BR_EQ, OP1_PC, OP2_IMM, IMM_B, ALU_ADD, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.N),
        BNE -> List(Y, BR_NE, OP1_PC, OP2_IMM, IMM_B, ALU_ADD, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.N),
        BGE -> List(Y, BR_GE, OP1_PC, OP2_IMM, IMM_B, ALU_ADD, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.N),
        BGEU-> List(Y, BR_GEU, OP1_PC, OP2_IMM, IMM_B, ALU_ADD, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.N),
        BLT -> List(Y, BR_LT, OP1_PC, OP2_IMM, IMM_B, ALU_ADD, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.N),
        BLTU-> List(Y, BR_LTU, OP1_PC, OP2_IMM, IMM_B, ALU_ADD, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.N),

        // CSR
        CSRRWI -> List(Y, BR_N, OP1_IMZ, OP2_X, IMM_Z, ALU_COPYrs1, WB_CSR, REN_1, MEN_0, M_X, MT_X, CSR.W),
        CSRRSI -> List(Y, BR_N, OP1_IMZ, OP2_X, IMM_Z, ALU_COPYrs1, WB_CSR, REN_1, MEN_0, M_X, MT_X, CSR.S),
        CSRRCI -> List(Y, BR_N, OP1_IMZ, OP2_X, IMM_Z, ALU_COPYrs1, WB_CSR, REN_1, MEN_0, M_X, MT_X, CSR.C),
        CSRRW  -> List(Y, BR_N, OP1_RS1, OP2_X, IMM_X, ALU_COPYrs1, WB_CSR, REN_1, MEN_0, M_X, MT_X, CSR.W),
        CSRRS  -> List(Y, BR_N, OP1_RS1, OP2_X, IMM_X, ALU_COPYrs1, WB_CSR, REN_1, MEN_0, M_X, MT_X, CSR.S),
        CSRRC  -> List(Y, BR_N, OP1_RS1, OP2_X, IMM_X, ALU_COPYrs1, WB_CSR, REN_1, MEN_0, M_X, MT_X, CSR.C),

        ECALL  -> List(Y, BR_N, OP1_X, OP2_X, IMM_X, ALU_X, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.I),
        MRET   -> List(Y, BR_N, OP1_X, OP2_X, IMM_X, ALU_X, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.I),
        //DRET    -> List(Y, BR_N  , OP1_X  , OP2_X  ,  ALU_X    , WB_X  , REN_0, MEN_0, M_X  , MT_X,  CSR.I),
        EBREAK -> List(Y, BR_N, OP1_X, OP2_X, IMM_X, ALU_X, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.I),
        WFI    -> List(Y, BR_N, OP1_X, OP2_X, IMM_X, ALU_X, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.N), // implemented as a NOP

        FENCE_I-> List(Y, BR_N, OP1_X, OP2_X, IMM_X, ALU_X, WB_X, REN_0, MEN_0, M_X, MT_X, CSR.N),
        FENCE  -> List(Y, BR_N, OP1_X, OP2_X, IMM_X, ALU_X, WB_X, REN_0, MEN_1, M_X, MT_X, CSR.N)
        // we are already sequentially consistent, so no need to honor the fence instruction
      ))

  // 上のリストで選ばれたものを変数にぶち込む
  val (cs_val_inst: Bool) :: cs_br_type         :: cs_op1_sel            :: cs_op2_sel            :: cs0 = csignals
  val cs_imm_sel          :: cs_alu_fun         :: cs_wb_sel             :: (cs_rf_wen: Bool)     :: cs1 = cs0
  val (cs_mem_en: Bool)   :: cs_mem_fcn         :: cs_msk_sel            :: cs_csr_cmd            :: Nil = cs1

  // 次のpcを決める　分岐するかどうかは上のリストだけでは決定しないから
  // datapathからbrのデータをもらって判断する
  val ctrl_pc_sel = Mux(io.dat.csr_eret ||io.ctl.exception , PC_CSR,  // 例外発生ならCSR、　それ以外なら下の中から
    (MuxLookup(cs_br_type, PC_CSR, Array(
      BR_N  -> PC_4,
      BR_J  -> PC_ALU,
      BR_NE -> Mux(!io.dat.branComOut.br_eq, PC_ALU, PC_4),
      BR_EQ -> Mux( io.dat.branComOut.br_eq, PC_ALU, PC_4),
      BR_GE -> Mux(!io.dat.branComOut.br_lt, PC_ALU, PC_4),
      BR_GEU-> Mux(!io.dat.branComOut.br_ltu,PC_ALU, PC_4),
      BR_LT -> Mux( io.dat.branComOut.br_lt, PC_ALU, PC_4),
      BR_LTU-> Mux( io.dat.branComOut.br_ltu,PC_ALU, PC_4),
      BR_J  -> PC_ALU,
      BR_JR -> PC_ALU))))

  val stall = io.meminit.wantInit
  io.meminit.initOK := io.meminit.wantInit // メモリ初期化したかったらいいよ

  // コントローラからの信号線の設定
  io.ctl.stall := stall
  io.ctl.op1_sel := cs_op1_sel // csignals(1)にしても同じ
  io.ctl.op2_sel := cs_op2_sel
  io.ctl.imm_sel := cs_imm_sel
  io.ctl.alu_fun := cs_alu_fun
  io.ctl.wb_sel  := cs_wb_sel
  io.ctl.rf_wen  := cs_rf_wen
  io.ctl.pc_sel  := ctrl_pc_sel
  io.ctl.csr_cmd := Mux(stall, CSR.N, cs_csr_cmd)

  // convert CSR instructions with raddr1 == 0 to read-only CSR commands

  // 命令メモリ Requests
  io.imem.req.valid := true.B
  io.imem.req.bits.fcn := M_XRD       // 読み出し
  io.imem.req.bits.typ := MT_WU       // 符号無しword

  // データメモリ Request
  io.dmem.req.valid := cs_mem_en      // メモリ有効信号
  io.dmem.req.bits.fcn := cs_mem_fcn  // 読み書き
  io.dmem.req.bits.typ := cs_msk_sel  // Byte,Word


  // Exception Handling ---------------------
  // We only need to check if the instruction is illegal (or unsupported)
  // or if the CSR file wants us to be interrupted.
  // Other exceptions are detected later in the pipeline by passing the
  // instruction to the CSR File and letting it redirect the PC as it sees
  // fit.
  io.ctl.exception := (!cs_val_inst && io.imem.resp.valid)  // 命令が無効な場合かつ命令メモリからもらっているとき
}