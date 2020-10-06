package rv32i_5stage.PipelineStages

import chisel3._
import rv32i_5stage.PipelineRegisters._

class IF_STAGE_IO extends Bundle{
  val out = new IFID_REGS_Output
}

class IF_STAGE extends Module{
  val io = IO(new IF_STAGE_IO)

  io := DontCare
}
