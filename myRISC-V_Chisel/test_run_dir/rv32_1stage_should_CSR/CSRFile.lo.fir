circuit CSRFile :
  module CSRFile :
    input clock : Clock
    input reset : UInt<1>
    output io_status : UInt<32>
    input io_pc : UInt<32>

    reg MEIP : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MEIP) @[CSR.scala 23:46]
    reg SEIP : UInt<1>, clock with :
      reset => (UInt<1>("h0"), SEIP) @[CSR.scala 23:46]
    reg MTIP : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MTIP) @[CSR.scala 23:46]
    reg STIP : UInt<1>, clock with :
      reset => (UInt<1>("h0"), STIP) @[CSR.scala 23:46]
    reg MSIP : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MSIP) @[CSR.scala 23:46]
    reg SSIP : UInt<1>, clock with :
      reset => (UInt<1>("h0"), SSIP) @[CSR.scala 23:46]
    reg MEIE : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MEIE) @[CSR.scala 27:46]
    reg SEIE : UInt<1>, clock with :
      reset => (UInt<1>("h0"), SEIE) @[CSR.scala 27:46]
    reg MTIE : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MTIE) @[CSR.scala 27:46]
    reg STIE : UInt<1>, clock with :
      reset => (UInt<1>("h0"), STIE) @[CSR.scala 27:46]
    reg MSIE : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MSIE) @[CSR.scala 27:46]
    reg SSIE : UInt<1>, clock with :
      reset => (UInt<1>("h0"), SSIE) @[CSR.scala 27:46]
    reg mstatus : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mstatus) @[CSR.scala 30:20]
    reg mip : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mip) @[CSR.scala 31:16]
    reg mie : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mie) @[CSR.scala 32:16]
    reg mcause : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mcause) @[CSR.scala 33:19]
    reg mtvec : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mtvec) @[CSR.scala 34:18]
    reg mtval : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mtval) @[CSR.scala 35:18]
    reg mepc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mepc) @[CSR.scala 36:17]
    reg mscratch : UInt<32>, clock with :
      reset => (UInt<1>("h0"), mscratch) @[CSR.scala 37:21]
    node mstatus_right_right_right_right_left = mux(UInt<1>("h0"), UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 72:12]
    node mstatus_left_left_left = cat(UInt<1>("h0"), UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_left_left_right_right = cat(UInt<1>("h0"), UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_left_left_right = cat(mstatus_left_left_right_right, UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_left_left = cat(mstatus_left_left_right, mstatus_left_left_left) @[Cat.scala 29:58]
    node mstatus_left_right_left = cat(UInt<1>("h0"), UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_left_right_right_right = cat(UInt<2>("h0"), UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_left_right_right = cat(mstatus_left_right_right_right, UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_left_right = cat(mstatus_left_right_right, mstatus_left_right_left) @[Cat.scala 29:58]
    node mstatus_left = cat(mstatus_left_right, mstatus_left_left) @[Cat.scala 29:58]
    node mstatus_right_left_left = cat(UInt<2>("h0"), UInt<2>("h0")) @[Cat.scala 29:58]
    node mstatus_right_left_right_right = cat(UInt<1>("h0"), UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_right_left_right = cat(mstatus_right_left_right_right, UInt<2>("h0")) @[Cat.scala 29:58]
    node mstatus_right_left = cat(mstatus_right_left_right, mstatus_right_left_left) @[Cat.scala 29:58]
    node mstatus_right_right_left_right = cat(UInt<1>("h0"), UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_right_right_left = cat(mstatus_right_right_left_right, UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_right_right_right_right = cat(UInt<1>("h0"), mstatus_right_right_right_right_left) @[Cat.scala 29:58]
    node mstatus_right_right_right = cat(mstatus_right_right_right_right, UInt<1>("h0")) @[Cat.scala 29:58]
    node mstatus_right_right = cat(mstatus_right_right_right, mstatus_right_right_left) @[Cat.scala 29:58]
    node mstatus_right = cat(mstatus_right_right, mstatus_right_left) @[Cat.scala 29:58]
    node _mstatus_T = cat(mstatus_right, mstatus_left) @[Cat.scala 29:58]
    node mip_right_right_right_right = mux(UInt<1>("h0"), UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node mip_left_left_right = cat(UInt<1>("h0"), SSIP) @[Cat.scala 29:58]
    node mip_left_left = cat(mip_left_left_right, UInt<1>("h0")) @[Cat.scala 29:58]
    node mip_left_right_right = cat(STIP, UInt<1>("h0")) @[Cat.scala 29:58]
    node mip_left_right = cat(mip_left_right_right, MSIP) @[Cat.scala 29:58]
    node mip_left = cat(mip_left_right, mip_left_left) @[Cat.scala 29:58]
    node mip_right_left_right = cat(UInt<1>("h0"), MTIP) @[Cat.scala 29:58]
    node mip_right_left = cat(mip_right_left_right, UInt<1>("h0")) @[Cat.scala 29:58]
    node mip_right_right_left = cat(UInt<1>("h0"), SEIP) @[Cat.scala 29:58]
    node mip_right_right_right = cat(mip_right_right_right_right, MEIP) @[Cat.scala 29:58]
    node mip_right_right = cat(mip_right_right_right, mip_right_right_left) @[Cat.scala 29:58]
    node mip_right = cat(mip_right_right, mip_right_left) @[Cat.scala 29:58]
    node _mip_T = cat(mip_right, mip_left) @[Cat.scala 29:58]
    node mie_right_right_right_right = mux(UInt<1>("h0"), UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node mie_left_left_right = cat(UInt<1>("h0"), SSIE) @[Cat.scala 29:58]
    node mie_left_left = cat(mie_left_left_right, UInt<1>("h0")) @[Cat.scala 29:58]
    node mie_left_right_right = cat(STIE, UInt<1>("h0")) @[Cat.scala 29:58]
    node mie_left_right = cat(mie_left_right_right, MSIE) @[Cat.scala 29:58]
    node mie_left = cat(mie_left_right, mie_left_left) @[Cat.scala 29:58]
    node mie_right_left_right = cat(UInt<1>("h0"), MTIE) @[Cat.scala 29:58]
    node mie_right_left = cat(mie_right_left_right, UInt<1>("h0")) @[Cat.scala 29:58]
    node mie_right_right_left = cat(UInt<1>("h0"), SEIE) @[Cat.scala 29:58]
    node mie_right_right_right = cat(mie_right_right_right_right, MEIE) @[Cat.scala 29:58]
    node mie_right_right = cat(mie_right_right_right, mie_right_right_left) @[Cat.scala 29:58]
    node mie_right = cat(mie_right_right, mie_right_left) @[Cat.scala 29:58]
    node _mie_T = cat(mie_right, mie_left) @[Cat.scala 29:58]
    io_status is invalid
    MEIP <= mux(reset, UInt<1>("h0"), MEIP) @[CSR.scala 23:46 CSR.scala 23:46 CSR.scala 23:46]
    SEIP <= mux(reset, UInt<1>("h0"), SEIP) @[CSR.scala 23:46 CSR.scala 23:46 CSR.scala 23:46]
    MTIP <= mux(reset, UInt<1>("h0"), MTIP) @[CSR.scala 23:46 CSR.scala 23:46 CSR.scala 23:46]
    STIP <= mux(reset, UInt<1>("h0"), STIP) @[CSR.scala 23:46 CSR.scala 23:46 CSR.scala 23:46]
    MSIP <= mux(reset, UInt<1>("h0"), MSIP) @[CSR.scala 23:46 CSR.scala 23:46 CSR.scala 23:46]
    SSIP <= mux(reset, UInt<1>("h0"), SSIP) @[CSR.scala 23:46 CSR.scala 23:46 CSR.scala 23:46]
    MEIE <= mux(reset, UInt<1>("h0"), MEIE) @[CSR.scala 27:46 CSR.scala 27:46 CSR.scala 27:46]
    SEIE <= mux(reset, UInt<1>("h0"), SEIE) @[CSR.scala 27:46 CSR.scala 27:46 CSR.scala 27:46]
    MTIE <= mux(reset, UInt<1>("h0"), MTIE) @[CSR.scala 27:46 CSR.scala 27:46 CSR.scala 27:46]
    STIE <= mux(reset, UInt<1>("h0"), STIE) @[CSR.scala 27:46 CSR.scala 27:46 CSR.scala 27:46]
    MSIE <= mux(reset, UInt<1>("h0"), MSIE) @[CSR.scala 27:46 CSR.scala 27:46 CSR.scala 27:46]
    SSIE <= mux(reset, UInt<1>("h0"), SSIE) @[CSR.scala 27:46 CSR.scala 27:46 CSR.scala 27:46]
    mstatus <= _mstatus_T @[CSR.scala 40:11]
    mip <= _mip_T @[CSR.scala 42:7]
    mie <= _mie_T @[CSR.scala 43:7]
    mcause <= UInt<1>("h0") @[CSR.scala 44:10]
    mtvec <= UInt<1>("h0") @[CSR.scala 45:9]
    mtval <= UInt<1>("h0") @[CSR.scala 46:9]
    mepc <= UInt<1>("h0") @[CSR.scala 47:8]
    mscratch <= UInt<1>("h0") @[CSR.scala 48:12]