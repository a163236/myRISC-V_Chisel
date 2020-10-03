package rv32i_5stage

import chisel3._
import chisel3.util._

class blackio extends Bundle {
  val clk = Input(Clock())
  val we = Input(Bool())
  val addr = Input(UInt(6.W))
  val di = Input(UInt(32.W))
  val dout = Output(UInt(32.W))
}

class verimem extends BlackBox with HasBlackBoxResource {
  val io = IO(new blackio)
  addResource("/verimem.v")
}

class temp extends Module {
  val io = IO(new blackio)
  val verimem = Module(new verimem)
  io <> verimem.io
  verimem.io.clk := clock
}