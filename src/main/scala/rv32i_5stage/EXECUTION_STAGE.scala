package rv32i_5stage

import chisel3._
import rv32i_5stage.pipelineregisters._
import common.CommonPackage._

class EXECUTION_STAGE_IO extends Bundle{
  val in = new IDEX_REGS_Output

}

class EXECUTION_STAGE extends Module{
  val io = IO(new EXECUTION_STAGE_IO)
  io := DontCare

}
