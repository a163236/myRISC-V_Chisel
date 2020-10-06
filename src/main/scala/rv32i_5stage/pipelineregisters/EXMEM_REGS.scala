package rv32i_5stage.pipelineregisters

import chisel3._

class EXMEM_REGS_Input extends Bundle{

}

class EXMEM_REGS_Output extends Bundle{

}

class EXMEM_REGS_IO extends Bundle{

}

class EXMEM_REGS extends Module{
  val io = IO(new EXMEM_REGS_IO)
}
