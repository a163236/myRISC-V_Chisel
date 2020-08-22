// コア - データパスとコントローラが内包されている

package rv32i_1stage

import chisel3._
import common._


class CoreIO(implicit val conf: Configurations) extends Bundle {
  val imem = new MemPortIO()  // 外部メモリとの接続
  val dmem = Flipped(new DataMemoryIO())
}


class Core(implicit val conf: Configurations) extends Module{

  val io = IO(new CoreIO())
  io := DontCare

  val Dpath = Module(new Dpath())
  val Cpath = Module(new CtlPath())

  // 内部接続
  Dpath.io.ctl <> Cpath.io.ctl        // データパス <> コントローラ
  Dpath.io.dat <> Cpath.io.dat

  // 外部メモリとの接続
  Cpath.io.dmem <> io.dmem.cpath   // コントローラ

  io.imem <> Cpath.io.imem
  io.imem <> Dpath.io.imem
  //io.imem.req.bits.addr := Dpath.io.imem.req.bits.addr          // データパスと命令メモリの接続

  io.dmem.dpath <> Dpath.io.dmem    // データパスとデータメモリの接続

}
