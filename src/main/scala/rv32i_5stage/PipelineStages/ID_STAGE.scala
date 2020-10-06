package rv32i_5stage.PipelineStages

import chisel3._
import rv32i_5stage.PipelineRegisters._

class ID_STAGE_IO extends Bundle {
  val in = Flipped(new IFID_REGS_Output)
  val out = new IDEX_REGS_Output
}

class ID_STAGE extends Module{
  val io = IO(new ID_STAGE_IO)
  io := DontCare
}
