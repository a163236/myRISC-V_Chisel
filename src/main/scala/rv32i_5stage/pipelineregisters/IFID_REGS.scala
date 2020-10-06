package rv32i_5stage.pipelineregisters

import chisel3._

class IFID_REGS_Input extends Bundle{
  val pc = Input(UInt(32.W))
  val inst = Input(UInt(32.W))
}

class IFID_REGS_Output extends Bundle{
  val pc = Output(UInt(32.W))
  val inst = Output(UInt(32.W))
}

class IFID_REGS_IO extends Bundle{
  val in = new IFID_REGS_Input
  val out = new IFID_REGS_Output
}

class IFID_REGS extends Module{
  val io = IO(new IFID_REGS_IO)

  val pc = Reg(UInt(32.W))
  val inst = Reg(UInt(32.W))

  // 入力
  pc := io.in.pc
  inst := io.in.inst

  //出力
  io.out.pc := pc
  io.out.inst := inst

}
