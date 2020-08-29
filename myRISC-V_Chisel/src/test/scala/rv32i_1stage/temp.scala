package rv32i_1stage

import scala.io.Source
import java._

object temp extends App{

  //val PATH = getClass.getResource("..").getPath
  //println(PATH)

  val fp = Source.fromFile("hexfile/rv32ui-p-add.hex")
  val lines = fp.getLines()
  val memory = lines.toArray.map{ c=>
    Integer.parseUnsignedInt(c,16)
  }
  println(memory(0))

}