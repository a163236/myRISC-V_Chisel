package common

import chisel3._

object PRV {  // 特権モード
  val SZ = 2
  val U = 0
  val S = 1
  val H = 2
  val M = 3   // マシンモード
}

// CSRをなぜクラスに？ -> ビットフィールドでフィールドを分けられているが、それだと分かりにくいから

class MStatus extends Bundle {  // mstatus CSR
  // マシンモードでF,V拡張のない単純なプロセッサではMIEとMPIEだけでよい
  // RISC-V原典 p107
  val mie = Bool()    // グローバル割り込み有効化
  val mpie  = Bool()  // 例外発生後にMIEの古い値を保持する
}

class MIP extends Bundle {  // マシン割り込み処理待ち
  // スーパバイザモードが実装されていない場合、SEIP,STIP,SSIPは0にされる
  // 頭文字mはマシン、sはスーパバイザ
  val meip = Bool()
  val seip = Bool()
  val mtip = Bool()
  val stip = Bool()
  val msip = Bool()
  val ssip = Bool()
}

class MIE extends Bundle {  // マシン割り込み有効化
  // スーパバイザモードが実装されていない場合、SEIE,STIE,SSIE は0にされる
  val meie = Bool()
  val seie = Bool()
  val mtie = Bool()
  val stie = Bool()
  val msie = Bool()
  val ssie = Bool()
}

object CSR {  // CSR関連の定数
  // commands コントローラで使う
  val SZ = 3.W
  val X = 0.asUInt(SZ)
  val N = 0.asUInt(SZ)
  val W = 1.asUInt(SZ)
  val S = 2.asUInt(SZ)
  val C = 3.asUInt(SZ)
  val I = 4.asUInt(SZ)
  val R = 5.asUInt(SZ)
}

class CSRFileIO(implicit val conf: Configurations) extends Bundle{  // CSRモジュールの入出力
  val status = Output(new MStatus())
  val pc = Input(UInt(conf.xprlen.W))

}

class CSRFile(implicit val conf: Configurations) extends Module{  // CSRモジュール
  val io = IO(new CSRFileIO())
  io := DontCare

  // 不可欠なCSR 8つ RISC-V原典p108
  val reg_mstatus = RegInit(false.B.asTypeOf(new MStatus))  // 種々のステータス　// falseで初期化したMStatus変数を入れる
  val reg_mip = RegInit(false.B.asTypeOf(new MIP))  // マシン割り込み処理待ち
  val reg_mie = RegInit(false.B.asTypeOf(new MIE))  // マシン割り込み有効化
  val reg_mcause = Reg(conf.xprlen.W)
  val reg_mtvec = Reg(conf.xprlen.W)
  val reg_mtval = Reg(conf.xprlen.W)
  val reg_mepc = Reg(conf.xprlen.W)
  val reg_mscratch = Reg(conf.xprlen.W)

}


object CSRAddr{
  val mstatus = 0x300
  val misa = 0x301
  val medeleg = 0x302
  val mideleg = 0x303
  val mie = 0x304
  val mtvec = 0x305
  val mscratch = 0x340
  val mcounteren = 0x306
  val mepc = 0x341
  val mcause = 0x342
  val mtval = 0x343
  val mip = 0x344
  val mcycle = 0xb00
  val minstret = 0xb02
  val marchid = 0xf12
  val mimpid = 0xf13
  val mhartid = 0xf14
}