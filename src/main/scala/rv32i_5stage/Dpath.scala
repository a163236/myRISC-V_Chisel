package rv32i_5stage

import chisel3._
import common._
import CommonPackage._

class Dpath(implicit val conf:Configurations) extends Module{
  val io = IO(new Bundle() {

  })

  val memory = new Memory()

}