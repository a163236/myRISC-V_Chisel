package common

import chisel3._

class RegisterFileIO(implicit val conf: Configurations) extends Bundle{
  val rs1_addr, rs2_addr = Input(UInt(5.W))
  val rs1_data, rs2_data = Output(UInt(conf.xlen.W))

  val waddr = Input(UInt(5.W))          // 書き込みアドレス
  val wdata = Input(UInt(conf.xlen.W))  // 書き込みデータ
  val wen   = Input(Bool())             // 書き込み有効

  val debug = new DebugIO() // debug用 gpレジスタの値
}

class RegisterFile(implicit val conf: Configurations) extends Module{
  val io = IO(new RegisterFileIO)

  val regfile = Mem(conf.xprlen, UInt(conf.xlen.W))

  when(io.wen && (io.waddr=/=0.U)){ // 書き込み有効かつ0レジスタ以外なら
    regfile(io.waddr) := io.wdata
  }

  io.rs1_data := Mux((io.rs1_addr =/= 0.U), regfile(io.rs1_addr), 0.U)
  io.rs2_data := Mux((io.rs2_addr =/= 0.U), regfile(io.rs2_addr), 0.U)

  io.debug.out := regfile(3)

}
