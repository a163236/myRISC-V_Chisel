package rv32i_5stage

import common.Configurations

object ElaborateVerilog extends App{

  //val dir = new File(args(0)) // args(0)のディレクトリのオブジェクトを作って
  //dir.mkdirs                  // args(0)ディレクトリを作成する

  implicit val conf = Configurations()

  val verilogString = (new chisel3.stage.ChiselStage).emitVerilog(new SyncMem())
  //val verilog = new FileWriter(new File(dir, s"main.v"))
  //verilog write verilogString
  //verilog.close()

  println(verilogString) // verilog のprint

}