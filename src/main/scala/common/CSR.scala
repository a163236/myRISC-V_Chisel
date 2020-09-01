package common

import chisel3._
import chisel3.util._

class CSRFileIO(implicit val conf: Configurations) extends Bundle{  // CSRモジュールの入出力
  val inPC = Input(UInt(conf.xlen.W))    // データパスからの入力pc
  val csr_cmd = Input(UInt(CSR.SZ))       // コントローラからのcsrコマンド

  val outPC = Output(UInt(conf.xlen.W))  // 出力pc
  val eret = Output(Bool())
}

class CSRFile(implicit val conf: Configurations) extends Module{  // CSRモジュール
  val io = IO(new CSRFileIO())
  io := DontCare

  // mstatus
  val SD,TSR,TW,TVM,MXR,SUM,MPRV,
    SPP,MPIE,SPIE,MIE,SIE = 0.U(1.W)
  val XS,FS,MPP = 0.U(2.W)

  // mip レジスタのビット
  // スーパバイザモードが実装されていない場合、SEIP,STIP,SSIPは0にされる
  // 頭文字mはマシン、sはスーパバイザ
  val MEIP,SEIP,MTIP,STIP,MSIP,SSIP = RegInit(0.U(1.W))

  // マシン割り込み有効化 mieレジスタのビット
  // スーパバイザモードが実装されていない場合、SEIE,STIE,SSIE は0にされる
  val MEIE,SEIE,MTIE,STIE,MSIE,SSIE = RegInit(0.U(1.W))

  // 不可欠なCSR 8つ RISC-V原典p108 レジスタ=========================================
  val mstatus = Reg(UInt(conf.xlen.W))  // 種々のステータス　// falseで初期化したMStatus変数を入れる
  val mip = Reg(UInt(conf.xlen.W))
  val mie = Reg(UInt(conf.xlen.W))  // マシン割り込み有効化
  val mcause = Reg(UInt(conf.xlen.W))
  val mtvec = Reg(UInt(conf.xlen.W))
  val mtval = Reg(UInt(conf.xlen.W))
  val mepc = Reg(UInt(conf.xlen.W))
  val mscratch = Reg(UInt(conf.xlen.W))

  mstatus := Cat(SD,Fill(conf.xlen-24, 0.U),TSR,TW,TVM,MXR,SUM,MPRV,
    XS,FS,MPP,0.U(2.W),SPP,MPIE,0.U,SPIE,0.U,MIE,0.U,SIE,0.U)
  mip := Cat(Fill(20,0.U),MEIP,0.U,SEIP,0.U,MTIP,0.U,STIP,0.U,MSIP,0.U,SSIP,0.U)
  mie := Cat(Fill(20,0.U),MEIE,0.U,SEIE,0.U,MTIE,0.U,STIE,0.U,MSIE,0.U,SSIE,0.U)
  mcause := Cat(0.U)  // 例外原因
  mtvec := Cat(0.U)   // 例外が起こったときにジャンプする先のアドレス
  mtval := Cat(0.U)   // アドレス例外のアドレスか不正命令の命令を入れる、その他のとき0
  mepc := Cat(0.U)    // 例外を示した命令を指し示す
  mscratch := Cat(0.U)

  //==================================================
  // ecall のとき
  when(io.csr_cmd===CSR.I){ // ecallかebreakのとき
    
  }

}

object CSR {  // CSR関連の定数
  // commands コントローラで使う
  val SZ = 3.W
  val X = 0.asUInt(SZ)
  val N = 0.asUInt(SZ)
  val W = 1.asUInt(SZ)  // write
  val S = 2.asUInt(SZ)  // set
  val C = 3.asUInt(SZ)  // clear
  val I = 4.asUInt(SZ)  // illegal ecall,ebreak
}

object PRV {  // 特権モード
  val SZ = 2
  val U = 0
  val S = 1
  val H = 2
  val M = 3   // マシンモード
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

object cause {

}