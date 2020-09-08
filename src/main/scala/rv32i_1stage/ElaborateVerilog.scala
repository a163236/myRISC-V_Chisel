package rv32i_1stage

import java.io.{File, FileWriter}

import common.Configurations

object ElaborateVerilog extends App{

  //val dir = new File(args(0)) // args(0)のディレクトリのオブジェクトを作って
  //dir.mkdirs                  // args(0)ディレクトリを作成する

  implicit val conf = Configurations()

  val verilogString = (new chisel3.stage.ChiselStage).emitVerilog(new Tile())
  //val verilog = new FileWriter(new File(dir, s"main.v"))
  //verilog write verilogString
  //verilog.close()

  println(verilogString) // verilog のprint

}