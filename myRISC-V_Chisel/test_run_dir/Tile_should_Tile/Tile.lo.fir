circuit Tile :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_op1 : UInt<32>
    input io_op2 : UInt<32>
    input io_fun : UInt<4>
    output io_out : UInt<32>

    node alu_shamt = bits(io_op2, 4, 0) @[ALU.scala 17:25]
    node _io_out_T = asSInt(io_op1) @[ALU.scala 20:30]
    node _io_out_T_1 = asSInt(io_op2) @[ALU.scala 20:48]
    node _io_out_T_2 = add(_io_out_T, _io_out_T_1) @[ALU.scala 20:33]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[ALU.scala 20:33]
    node _io_out_T_4 = asSInt(_io_out_T_3) @[ALU.scala 20:33]
    node _io_out_T_5 = asUInt(_io_out_T_4) @[ALU.scala 20:58]
    node _io_out_T_6 = asSInt(io_op1) @[ALU.scala 21:30]
    node _io_out_T_7 = asSInt(io_op2) @[ALU.scala 21:48]
    node _io_out_T_8 = sub(_io_out_T_6, _io_out_T_7) @[ALU.scala 21:33]
    node _io_out_T_9 = tail(_io_out_T_8, 1) @[ALU.scala 21:33]
    node _io_out_T_10 = asSInt(_io_out_T_9) @[ALU.scala 21:33]
    node _io_out_T_11 = asUInt(_io_out_T_10) @[ALU.scala 21:58]
    node _io_out_T_12 = and(io_op1, io_op2) @[ALU.scala 22:24]
    node _io_out_T_13 = or(io_op1, io_op2) @[ALU.scala 23:24]
    node _io_out_T_14 = xor(io_op1, io_op2) @[ALU.scala 24:24]
    node _io_out_T_15 = asSInt(io_op1) @[ALU.scala 25:30]
    node _io_out_T_16 = asSInt(io_op2) @[ALU.scala 25:48]
    node _io_out_T_17 = lt(_io_out_T_15, _io_out_T_16) @[ALU.scala 25:33]
    node _io_out_T_18 = lt(io_op1, io_op2) @[ALU.scala 26:24]
    node _io_out_T_19 = dshl(io_op1, alu_shamt) @[ALU.scala 27:25]
    node _io_out_T_20 = bits(_io_out_T_19, 31, 0) @[ALU.scala 27:38]
    node _io_out_T_21 = asSInt(io_op1) @[ALU.scala 28:30]
    node _io_out_T_22 = dshr(_io_out_T_21, alu_shamt) @[ALU.scala 28:33]
    node _io_out_T_23 = asUInt(_io_out_T_22) @[ALU.scala 28:53]
    node _io_out_T_24 = dshr(io_op1, alu_shamt) @[ALU.scala 29:24]
    node _io_out_T_25 = eq(UInt<4>("h1"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_26 = mux(_io_out_T_25, _io_out_T_5, UInt<1>("h0")) @[Mux.scala 80:57]
    node _io_out_T_27 = eq(UInt<4>("h2"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_28 = mux(_io_out_T_27, _io_out_T_11, _io_out_T_26) @[Mux.scala 80:57]
    node _io_out_T_29 = eq(UInt<4>("h6"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_30 = mux(_io_out_T_29, _io_out_T_12, _io_out_T_28) @[Mux.scala 80:57]
    node _io_out_T_31 = eq(UInt<4>("h7"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_32 = mux(_io_out_T_31, _io_out_T_13, _io_out_T_30) @[Mux.scala 80:57]
    node _io_out_T_33 = eq(UInt<4>("h8"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_34 = mux(_io_out_T_33, _io_out_T_14, _io_out_T_32) @[Mux.scala 80:57]
    node _io_out_T_35 = eq(UInt<4>("h9"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_36 = mux(_io_out_T_35, _io_out_T_17, _io_out_T_34) @[Mux.scala 80:57]
    node _io_out_T_37 = eq(UInt<4>("ha"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_38 = mux(_io_out_T_37, _io_out_T_18, _io_out_T_36) @[Mux.scala 80:57]
    node _io_out_T_39 = eq(UInt<4>("h3"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_40 = mux(_io_out_T_39, _io_out_T_20, _io_out_T_38) @[Mux.scala 80:57]
    node _io_out_T_41 = eq(UInt<4>("h5"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_42 = mux(_io_out_T_41, _io_out_T_23, _io_out_T_40) @[Mux.scala 80:57]
    node _io_out_T_43 = eq(UInt<4>("h4"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_44 = mux(_io_out_T_43, _io_out_T_24, _io_out_T_42) @[Mux.scala 80:57]
    node _io_out_T_45 = eq(UInt<4>("hb"), io_fun) @[Mux.scala 80:60]
    node _io_out_T_46 = mux(_io_out_T_45, io_op1, _io_out_T_44) @[Mux.scala 80:57]
    io_out <= _io_out_T_46 @[ALU.scala 19:10]

  module ImmGen :
    input clock : Clock
    input reset : UInt<1>
    input io_inst : UInt<32>
    input io_imm_sel : UInt<3>
    output io_out : UInt<32>

    node _T = bits(io_inst, 31, 31) @[ImmGen.scala 17:35]
    node _T_1 = bits(_T, 0, 0) @[Bitwise.scala 72:15]
    node right = mux(_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node left = bits(io_inst, 31, 20) @[ImmGen.scala 17:49]
    node imm_i = cat(right, left) @[Cat.scala 29:58]
    node _T_2 = bits(io_inst, 31, 31) @[ImmGen.scala 18:35]
    node _T_3 = bits(_T_2, 0, 0) @[Bitwise.scala 72:15]
    node right_right = mux(_T_3, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node right_left = bits(io_inst, 31, 25) @[ImmGen.scala 18:49]
    node left_1 = bits(io_inst, 11, 7) @[ImmGen.scala 18:65]
    node right_1 = cat(right_right, right_left) @[Cat.scala 29:58]
    node imm_s = cat(right_1, left_1) @[Cat.scala 29:58]
    node _T_4 = bits(io_inst, 31, 31) @[ImmGen.scala 19:34]
    node _T_5 = bits(_T_4, 0, 0) @[Bitwise.scala 72:15]
    node right_right_right = mux(_T_5, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node right_right_left = bits(io_inst, 7, 7) @[ImmGen.scala 19:47]
    node right_left_1 = bits(io_inst, 31, 25) @[ImmGen.scala 19:58]
    node left_right = bits(io_inst, 11, 8) @[ImmGen.scala 19:73]
    node left_2 = cat(left_right, UInt<1>("h0")) @[Cat.scala 29:58]
    node right_right_1 = cat(right_right_right, right_right_left) @[Cat.scala 29:58]
    node right_2 = cat(right_right_1, right_left_1) @[Cat.scala 29:58]
    node imm_b = cat(right_2, left_2) @[Cat.scala 29:58]
    node right_3 = bits(io_inst, 31, 12) @[ImmGen.scala 20:26]
    node left_3 = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node imm_u = cat(right_3, left_3) @[Cat.scala 29:58]
    node _T_6 = bits(io_inst, 31, 31) @[ImmGen.scala 21:34]
    node _T_7 = bits(_T_6, 0, 0) @[Bitwise.scala 72:15]
    node right_right_right_1 = mux(_T_7, UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node right_right_left_1 = bits(io_inst, 19, 12) @[ImmGen.scala 21:47]
    node right_left_2 = bits(io_inst, 20, 20) @[ImmGen.scala 21:63]
    node left_right_1 = bits(io_inst, 30, 21) @[ImmGen.scala 21:76]
    node left_4 = cat(left_right_1, UInt<1>("h0")) @[Cat.scala 29:58]
    node right_right_2 = cat(right_right_right_1, right_right_left_1) @[Cat.scala 29:58]
    node right_4 = cat(right_right_2, right_left_2) @[Cat.scala 29:58]
    node imm_j = cat(right_4, left_4) @[Cat.scala 29:58]
    node _io_out_T = eq(UInt<3>("h0"), io_imm_sel) @[Mux.scala 80:60]
    node _io_out_T_1 = mux(_io_out_T, UInt<32>("h0"), UInt<32>("h0")) @[Mux.scala 80:57]
    node _io_out_T_2 = eq(UInt<3>("h1"), io_imm_sel) @[Mux.scala 80:60]
    node _io_out_T_3 = mux(_io_out_T_2, imm_i, _io_out_T_1) @[Mux.scala 80:57]
    node _io_out_T_4 = eq(UInt<3>("h2"), io_imm_sel) @[Mux.scala 80:60]
    node _io_out_T_5 = mux(_io_out_T_4, imm_s, _io_out_T_3) @[Mux.scala 80:57]
    node _io_out_T_6 = eq(UInt<3>("h5"), io_imm_sel) @[Mux.scala 80:60]
    node _io_out_T_7 = mux(_io_out_T_6, imm_b, _io_out_T_5) @[Mux.scala 80:57]
    node _io_out_T_8 = eq(UInt<3>("h3"), io_imm_sel) @[Mux.scala 80:60]
    node _io_out_T_9 = mux(_io_out_T_8, imm_u, _io_out_T_7) @[Mux.scala 80:57]
    node _io_out_T_10 = eq(UInt<3>("h4"), io_imm_sel) @[Mux.scala 80:60]
    node _io_out_T_11 = mux(_io_out_T_10, imm_j, _io_out_T_9) @[Mux.scala 80:57]
    io_out <= _io_out_T_11 @[ImmGen.scala 23:10]

  module RegisterFile :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1_addr : UInt<5>
    input io_rs2_addr : UInt<5>
    output io_rs1_data : UInt<32>
    output io_rs2_data : UInt<32>
    input io_waddr : UInt<5>
    input io_wdata : UInt<32>
    input io_wen : UInt<1>
    output io_debug_out : UInt<32>

    mem regfile : @[RegisterFile.scala 19:20]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => io_rs1_data_MPORT
      reader => io_rs2_data_MPORT
      reader => io_debug_out_MPORT
      writer => MPORT
      read-under-write => undefined
    node _T = neq(io_waddr, UInt<1>("h0")) @[RegisterFile.scala 21:27]
    node _T_1 = and(io_wen, _T) @[RegisterFile.scala 21:15]
    node _GEN_0 = validif(_T_1, io_waddr) @[RegisterFile.scala 21:35 RegisterFile.scala 22:12]
    node _GEN_1 = validif(_T_1, clock) @[RegisterFile.scala 21:35 RegisterFile.scala 22:12]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[RegisterFile.scala 21:35 RegisterFile.scala 22:12 RegisterFile.scala 19:20]
    node _GEN_3 = validif(_T_1, UInt<1>("h1")) @[RegisterFile.scala 21:35 RegisterFile.scala 22:23]
    node _GEN_4 = validif(_T_1, io_wdata) @[RegisterFile.scala 21:35 RegisterFile.scala 22:23]
    node _io_rs1_data_T = neq(io_rs1_addr, UInt<1>("h0")) @[RegisterFile.scala 25:35]
    node _io_rs1_data_T_1 = mux(_io_rs1_data_T, regfile.io_rs1_data_MPORT.data, UInt<1>("h0")) @[RegisterFile.scala 25:21]
    node _io_rs2_data_T = neq(io_rs2_addr, UInt<1>("h0")) @[RegisterFile.scala 26:35]
    node _io_rs2_data_T_1 = mux(_io_rs2_data_T, regfile.io_rs2_data_MPORT.data, UInt<1>("h0")) @[RegisterFile.scala 26:21]
    io_rs1_data <= _io_rs1_data_T_1 @[RegisterFile.scala 25:15]
    io_rs2_data <= _io_rs2_data_T_1 @[RegisterFile.scala 26:15]
    io_debug_out <= regfile.io_debug_out_MPORT.data @[RegisterFile.scala 28:16]
    regfile.io_rs1_data_MPORT.addr <= io_rs1_addr @[RegisterFile.scala 25:52]
    regfile.io_rs1_data_MPORT.en <= UInt<1>("h1") @[RegisterFile.scala 25:52]
    regfile.io_rs1_data_MPORT.clk <= clock @[RegisterFile.scala 25:52]
    regfile.io_rs2_data_MPORT.addr <= io_rs2_addr @[RegisterFile.scala 26:52]
    regfile.io_rs2_data_MPORT.en <= UInt<1>("h1") @[RegisterFile.scala 26:52]
    regfile.io_rs2_data_MPORT.clk <= clock @[RegisterFile.scala 26:52]
    regfile.io_debug_out_MPORT.addr <= UInt<2>("h3") @[RegisterFile.scala 28:26]
    regfile.io_debug_out_MPORT.en <= UInt<1>("h1") @[RegisterFile.scala 28:26]
    regfile.io_debug_out_MPORT.clk <= clock @[RegisterFile.scala 28:26]
    regfile.MPORT.addr <= _GEN_0
    regfile.MPORT.en <= _GEN_2
    regfile.MPORT.clk <= _GEN_1
    regfile.MPORT.data <= _GEN_4
    regfile.MPORT.mask <= _GEN_3

  module BranchComp :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1_data : UInt<32>
    input io_rs2_data : UInt<32>
    output io_branComOut_br_eq : UInt<1>
    output io_branComOut_br_lt : UInt<1>
    output io_branComOut_br_ltu : UInt<1>

    node _io_branComOut_br_eq_T = eq(io_rs1_data, io_rs2_data) @[BranchComp.scala 20:40]
    node _io_branComOut_br_lt_T = asSInt(io_rs1_data) @[BranchComp.scala 21:46]
    node _io_branComOut_br_lt_T_1 = asSInt(io_rs2_data) @[BranchComp.scala 21:69]
    node _io_branComOut_br_lt_T_2 = lt(_io_branComOut_br_lt_T, _io_branComOut_br_lt_T_1) @[BranchComp.scala 21:49]
    node _io_branComOut_br_ltu_T = lt(io_rs1_data, io_rs2_data) @[BranchComp.scala 22:49]
    io_branComOut_br_eq <= _io_branComOut_br_eq_T @[BranchComp.scala 20:24]
    io_branComOut_br_lt <= _io_branComOut_br_lt_T_2 @[BranchComp.scala 21:24]
    io_branComOut_br_ltu <= _io_branComOut_br_ltu_T @[BranchComp.scala 22:24]

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

  module Dpath :
    input clock : Clock
    input reset : UInt<1>
    input io_imem_req_ready : UInt<1>
    output io_imem_req_valid : UInt<1>
    output io_imem_req_bits_addr : UInt<32>
    output io_imem_req_bits_wdata : UInt<32>
    output io_imem_req_bits_fcn : UInt<1>
    output io_imem_req_bits_typ : UInt<3>
    input io_imem_resp_valid : UInt<1>
    input io_imem_resp_bits_rdata : UInt<32>
    output io_dmem_addr : UInt<32>
    output io_dmem_wdata : UInt<32>
    input io_dmem_rdata : UInt<32>
    input io_ctl_stall : UInt<1>
    input io_ctl_pc_sel : UInt<3>
    input io_ctl_op1_sel : UInt<2>
    input io_ctl_op2_sel : UInt<2>
    input io_ctl_imm_sel : UInt<3>
    input io_ctl_alu_fun : UInt<4>
    input io_ctl_wb_sel : UInt<2>
    input io_ctl_rf_wen : UInt<1>
    output io_dat_inst : UInt<32>
    output io_dat_branComOut_br_eq : UInt<1>
    output io_dat_branComOut_br_lt : UInt<1>
    output io_dat_branComOut_br_ltu : UInt<1>
    output io_dat_csr_eret : UInt<1>
    output io_debug_out : UInt<32>

    inst ALU of ALU @[Dpath.scala 35:23]
    inst ImmGen of ImmGen @[Dpath.scala 36:23]
    inst RegFile of RegisterFile @[Dpath.scala 37:23]
    inst BranchComp of BranchComp @[Dpath.scala 38:26]
    inst csr of CSRFile @[Dpath.scala 82:19]
    reg pc_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_reg) @[Dpath.scala 34:24]
    node inst = mux(io_imem_resp_valid, io_imem_resp_bits_rdata, UInt<32>("h4033")) @[Dpath.scala 50:17]
    node _RegFile_io_rs1_addr_T = bits(io_imem_resp_bits_rdata, 19, 15) @[Dpath.scala 54:49]
    node _RegFile_io_rs2_addr_T = bits(io_imem_resp_bits_rdata, 24, 20) @[Dpath.scala 55:49]
    node _ALU_io_op1_T = eq(io_ctl_op1_sel, UInt<2>("h0")) @[Dpath.scala 67:35]
    node _ALU_io_op1_T_1 = mux(_ALU_io_op1_T, RegFile.io_rs1_data, pc_reg) @[Dpath.scala 67:20]
    node _ALU_io_op2_T = eq(UInt<2>("h0"), io_ctl_op2_sel) @[Mux.scala 80:60]
    node _ALU_io_op2_T_1 = mux(_ALU_io_op2_T, RegFile.io_rs2_data, RegFile.io_rs2_data) @[Mux.scala 80:57]
    node _ALU_io_op2_T_2 = eq(UInt<2>("h1"), io_ctl_op2_sel) @[Mux.scala 80:60]
    node _ALU_io_op2_T_3 = mux(_ALU_io_op2_T_2, ImmGen.io_out, _ALU_io_op2_T_1) @[Mux.scala 80:57]
    node _RegFile_io_waddr_T = bits(inst, 11, 7) @[Dpath.scala 86:28]
    node _RegFile_io_wdata_T = add(pc_reg, UInt<3>("h4")) @[Dpath.scala 90:23]
    node _RegFile_io_wdata_T_1 = tail(_RegFile_io_wdata_T, 1) @[Dpath.scala 90:23]
    node _RegFile_io_wdata_T_2 = eq(UInt<2>("h0"), io_ctl_wb_sel) @[Mux.scala 80:60]
    node _RegFile_io_wdata_T_3 = mux(_RegFile_io_wdata_T_2, ALU.io_out, ALU.io_out) @[Mux.scala 80:57]
    node _RegFile_io_wdata_T_4 = eq(UInt<2>("h2"), io_ctl_wb_sel) @[Mux.scala 80:60]
    node _RegFile_io_wdata_T_5 = mux(_RegFile_io_wdata_T_4, _RegFile_io_wdata_T_1, _RegFile_io_wdata_T_3) @[Mux.scala 80:57]
    node _RegFile_io_wdata_T_6 = eq(UInt<2>("h1"), io_ctl_wb_sel) @[Mux.scala 80:60]
    node _RegFile_io_wdata_T_7 = mux(_RegFile_io_wdata_T_6, io_dmem_rdata, _RegFile_io_wdata_T_5) @[Mux.scala 80:57]
    node _pc_next_T = eq(UInt<3>("h0"), io_ctl_pc_sel) @[Mux.scala 80:60]
    node _pc_plus4_T = add(pc_reg, UInt<32>("h4")) @[Dpath.scala 103:23]
    node _pc_plus4_T_1 = tail(_pc_plus4_T, 1) @[Dpath.scala 103:23]
    node pc_plus4 = _pc_plus4_T_1 @[Dpath.scala 42:22 Dpath.scala 103:12]
    node _pc_next_T_1 = mux(_pc_next_T, pc_plus4, pc_reg) @[Mux.scala 80:57]
    node _pc_next_T_2 = eq(UInt<3>("h1"), io_ctl_pc_sel) @[Mux.scala 80:60]
    node pc_alu = ALU.io_out @[Dpath.scala 43:22 Dpath.scala 104:10]
    node _pc_next_T_3 = mux(_pc_next_T_2, pc_alu, _pc_next_T_1) @[Mux.scala 80:57]
    node _T = eq(io_ctl_stall, UInt<1>("h0")) @[Dpath.scala 100:8]
    node pc_next = _pc_next_T_3 @[Dpath.scala 41:22 Dpath.scala 95:11]
    node _GEN_0 = mux(_T, pc_next, pc_reg) @[Dpath.scala 100:22 Dpath.scala 101:12 Dpath.scala 34:24]
    node _T_1 = eq(io_ctl_stall, UInt<1>("h0")) @[Dpath.scala 110:8]
    node _T_2 = bits(io_imem_resp_bits_rdata, 11, 7) @[Dpath.scala 115:30]
    node _T_3 = asUInt(reset) @[Dpath.scala 112:11]
    node _T_4 = eq(_T_3, UInt<1>("h0")) @[Dpath.scala 112:11]
    io_imem_req_valid is invalid
    io_imem_req_bits_addr <= pc_reg @[Dpath.scala 48:25]
    io_imem_req_bits_wdata is invalid
    io_imem_req_bits_fcn is invalid
    io_imem_req_bits_typ is invalid
    io_dmem_addr <= ALU.io_out @[Dpath.scala 78:17]
    io_dmem_wdata <= RegFile.io_rs2_data @[Dpath.scala 79:17]
    io_dat_inst <= inst @[Dpath.scala 74:16]
    io_dat_branComOut_br_eq <= BranchComp.io_branComOut_br_eq @[Dpath.scala 75:21]
    io_dat_branComOut_br_lt <= BranchComp.io_branComOut_br_lt @[Dpath.scala 75:21]
    io_dat_branComOut_br_ltu <= BranchComp.io_branComOut_br_ltu @[Dpath.scala 75:21]
    io_dat_csr_eret is invalid
    io_debug_out <= RegFile.io_debug_out @[Dpath.scala 106:16]
    pc_reg <= mux(reset, UInt<32>("h0"), _GEN_0) @[Dpath.scala 34:24 Dpath.scala 34:24]
    ALU.clock <= clock
    ALU.reset <= reset
    ALU.io_op1 <= _ALU_io_op1_T_1 @[Dpath.scala 67:14]
    ALU.io_op2 <= _ALU_io_op2_T_3 @[Dpath.scala 68:14]
    ALU.io_fun <= io_ctl_alu_fun @[Dpath.scala 66:14]
    ImmGen.clock <= clock
    ImmGen.reset <= reset
    ImmGen.io_inst <= inst @[Dpath.scala 58:18]
    ImmGen.io_imm_sel <= io_ctl_imm_sel @[Dpath.scala 59:21]
    RegFile.clock <= clock
    RegFile.reset <= reset
    RegFile.io_rs1_addr <= _RegFile_io_rs1_addr_T @[Dpath.scala 54:23]
    RegFile.io_rs2_addr <= _RegFile_io_rs2_addr_T @[Dpath.scala 55:23]
    RegFile.io_waddr <= _RegFile_io_waddr_T @[Dpath.scala 86:21]
    RegFile.io_wdata <= _RegFile_io_wdata_T_7 @[Dpath.scala 88:21]
    RegFile.io_wen <= io_ctl_rf_wen @[Dpath.scala 87:21]
    BranchComp.clock <= clock
    BranchComp.reset <= reset
    BranchComp.io_rs1_data <= RegFile.io_rs1_data @[Dpath.scala 62:26]
    BranchComp.io_rs2_data <= RegFile.io_rs2_data @[Dpath.scala 63:26]
    csr.clock <= clock
    csr.reset <= reset
    csr.io_pc is invalid
    printf(clock, and(and(and(UInt<1>("h1"), _T_1), _T_4), UInt<1>("h1")), "pc=[0x%x] IMEM=[0x%x] inst=[0x%x] ImmgenOut=[0x%x] rs1=[%d] rs2=[%d] rd=[%d] reg(gp)=[%d] ALUOUT=[%d] DMEMaddr=[%d] DMEMdataw=[%d] DMEMdatar=[%d] ", pc_reg, io_imem_resp_bits_rdata, inst, ImmGen.io_out, ALU.io_op1, ALU.io_op2, _T_2, RegFile.io_debug_out, ALU.io_out, io_dmem_addr, io_dmem_wdata, io_dmem_rdata) @[Dpath.scala 112:11]

  module CtlPath :
    input clock : Clock
    input reset : UInt<1>
    input io_dat_inst : UInt<32>
    input io_dat_branComOut_br_eq : UInt<1>
    input io_dat_branComOut_br_lt : UInt<1>
    input io_dat_branComOut_br_ltu : UInt<1>
    input io_dat_csr_eret : UInt<1>
    output io_ctl_stall : UInt<1>
    output io_ctl_pc_sel : UInt<3>
    output io_ctl_op1_sel : UInt<2>
    output io_ctl_op2_sel : UInt<2>
    output io_ctl_imm_sel : UInt<3>
    output io_ctl_alu_fun : UInt<4>
    output io_ctl_wb_sel : UInt<2>
    output io_ctl_rf_wen : UInt<1>
    output io_dmem_men : UInt<1>
    output io_dmem_fcn : UInt<2>
    input io_imem_req_ready : UInt<1>
    output io_imem_req_valid : UInt<1>
    output io_imem_req_bits_addr : UInt<32>
    output io_imem_req_bits_wdata : UInt<32>
    output io_imem_req_bits_fcn : UInt<1>
    output io_imem_req_bits_typ : UInt<3>
    input io_imem_resp_valid : UInt<1>
    input io_imem_resp_bits_rdata : UInt<32>

    node _T = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_1 = eq(UInt<14>("h2003"), _T) @[Lookup.scala 31:38]
    node _T_2 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_3 = eq(UInt<2>("h3"), _T_2) @[Lookup.scala 31:38]
    node _T_4 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_5 = eq(UInt<15>("h4003"), _T_4) @[Lookup.scala 31:38]
    node _T_6 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_7 = eq(UInt<13>("h1003"), _T_6) @[Lookup.scala 31:38]
    node _T_8 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_9 = eq(UInt<15>("h5003"), _T_8) @[Lookup.scala 31:38]
    node _T_10 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_11 = eq(UInt<14>("h2023"), _T_10) @[Lookup.scala 31:38]
    node _T_12 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_13 = eq(UInt<6>("h23"), _T_12) @[Lookup.scala 31:38]
    node _T_14 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_15 = eq(UInt<13>("h1023"), _T_14) @[Lookup.scala 31:38]
    node _T_16 = and(io_dat_inst, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_17 = eq(UInt<5>("h17"), _T_16) @[Lookup.scala 31:38]
    node _T_18 = and(io_dat_inst, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_19 = eq(UInt<6>("h37"), _T_18) @[Lookup.scala 31:38]
    node _T_20 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_21 = eq(UInt<5>("h13"), _T_20) @[Lookup.scala 31:38]
    node _T_22 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_23 = eq(UInt<15>("h7013"), _T_22) @[Lookup.scala 31:38]
    node _T_24 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_25 = eq(UInt<15>("h6013"), _T_24) @[Lookup.scala 31:38]
    node _T_26 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_27 = eq(UInt<15>("h4013"), _T_26) @[Lookup.scala 31:38]
    node _T_28 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_29 = eq(UInt<14>("h2013"), _T_28) @[Lookup.scala 31:38]
    node _T_30 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_31 = eq(UInt<14>("h3013"), _T_30) @[Lookup.scala 31:38]
    node _T_32 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_33 = eq(UInt<13>("h1013"), _T_32) @[Lookup.scala 31:38]
    node _T_34 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_35 = eq(UInt<31>("h40005013"), _T_34) @[Lookup.scala 31:38]
    node _T_36 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_37 = eq(UInt<15>("h5013"), _T_36) @[Lookup.scala 31:38]
    node _T_38 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_39 = eq(UInt<13>("h1033"), _T_38) @[Lookup.scala 31:38]
    node _T_40 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_41 = eq(UInt<6>("h33"), _T_40) @[Lookup.scala 31:38]
    node _T_42 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_43 = eq(UInt<31>("h40000033"), _T_42) @[Lookup.scala 31:38]
    node _T_44 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_45 = eq(UInt<14>("h2033"), _T_44) @[Lookup.scala 31:38]
    node _T_46 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_47 = eq(UInt<14>("h3033"), _T_46) @[Lookup.scala 31:38]
    node _T_48 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_49 = eq(UInt<15>("h7033"), _T_48) @[Lookup.scala 31:38]
    node _T_50 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_51 = eq(UInt<15>("h6033"), _T_50) @[Lookup.scala 31:38]
    node _T_52 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_53 = eq(UInt<15>("h4033"), _T_52) @[Lookup.scala 31:38]
    node _T_54 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_55 = eq(UInt<31>("h40005033"), _T_54) @[Lookup.scala 31:38]
    node _T_56 = and(io_dat_inst, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _T_57 = eq(UInt<15>("h5033"), _T_56) @[Lookup.scala 31:38]
    node _T_58 = and(io_dat_inst, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_59 = eq(UInt<7>("h6f"), _T_58) @[Lookup.scala 31:38]
    node _T_60 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_61 = eq(UInt<7>("h67"), _T_60) @[Lookup.scala 31:38]
    node _T_62 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_63 = eq(UInt<7>("h63"), _T_62) @[Lookup.scala 31:38]
    node _T_64 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_65 = eq(UInt<13>("h1063"), _T_64) @[Lookup.scala 31:38]
    node _T_66 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_67 = eq(UInt<15>("h5063"), _T_66) @[Lookup.scala 31:38]
    node _T_68 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_69 = eq(UInt<15>("h7063"), _T_68) @[Lookup.scala 31:38]
    node _T_70 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_71 = eq(UInt<15>("h4063"), _T_70) @[Lookup.scala 31:38]
    node _T_72 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_73 = eq(UInt<15>("h6063"), _T_72) @[Lookup.scala 31:38]
    node _T_74 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_75 = eq(UInt<15>("h5073"), _T_74) @[Lookup.scala 31:38]
    node _T_76 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_77 = eq(UInt<15>("h6073"), _T_76) @[Lookup.scala 31:38]
    node _T_78 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_79 = eq(UInt<15>("h7073"), _T_78) @[Lookup.scala 31:38]
    node _T_80 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_81 = eq(UInt<13>("h1073"), _T_80) @[Lookup.scala 31:38]
    node _T_82 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_83 = eq(UInt<14>("h2073"), _T_82) @[Lookup.scala 31:38]
    node _T_84 = and(io_dat_inst, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _T_85 = eq(UInt<14>("h3073"), _T_84) @[Lookup.scala 31:38]
    node _T_86 = and(io_dat_inst, UInt<32>("hffffffff")) @[Lookup.scala 31:38]
    node _T_87 = eq(UInt<7>("h73"), _T_86) @[Lookup.scala 31:38]
    node _T_88 = and(io_dat_inst, UInt<32>("hffffffff")) @[Lookup.scala 31:38]
    node _T_89 = eq(UInt<30>("h30200073"), _T_88) @[Lookup.scala 31:38]
    node _T_90 = and(io_dat_inst, UInt<32>("hffffffff")) @[Lookup.scala 31:38]
    node _T_91 = eq(UInt<21>("h100073"), _T_90) @[Lookup.scala 31:38]
    node _T_92 = and(io_dat_inst, UInt<32>("hffffffff")) @[Lookup.scala 31:38]
    node _T_93 = eq(UInt<29>("h10200073"), _T_92) @[Lookup.scala 31:38]
    node _T_94 = and(io_dat_inst, UInt<32>("hffffffff")) @[Lookup.scala 31:38]
    node _T_95 = eq(UInt<13>("h100f"), _T_94) @[Lookup.scala 31:38]
    node _T_96 = and(io_dat_inst, UInt<32>("hf00fffff")) @[Lookup.scala 31:38]
    node _T_97 = eq(UInt<4>("hf"), _T_96) @[Lookup.scala 31:38]
    node _T_98 = mux(_T_97, UInt<1>("h1"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_99 = mux(_T_95, UInt<1>("h1"), _T_98) @[Lookup.scala 33:37]
    node _T_100 = mux(_T_93, UInt<1>("h1"), _T_99) @[Lookup.scala 33:37]
    node _T_101 = mux(_T_91, UInt<1>("h1"), _T_100) @[Lookup.scala 33:37]
    node _T_102 = mux(_T_89, UInt<1>("h1"), _T_101) @[Lookup.scala 33:37]
    node _T_103 = mux(_T_87, UInt<1>("h1"), _T_102) @[Lookup.scala 33:37]
    node _T_104 = mux(_T_85, UInt<1>("h1"), _T_103) @[Lookup.scala 33:37]
    node _T_105 = mux(_T_83, UInt<1>("h1"), _T_104) @[Lookup.scala 33:37]
    node _T_106 = mux(_T_81, UInt<1>("h1"), _T_105) @[Lookup.scala 33:37]
    node _T_107 = mux(_T_79, UInt<1>("h1"), _T_106) @[Lookup.scala 33:37]
    node _T_108 = mux(_T_77, UInt<1>("h1"), _T_107) @[Lookup.scala 33:37]
    node _T_109 = mux(_T_75, UInt<1>("h1"), _T_108) @[Lookup.scala 33:37]
    node _T_110 = mux(_T_73, UInt<1>("h1"), _T_109) @[Lookup.scala 33:37]
    node _T_111 = mux(_T_71, UInt<1>("h1"), _T_110) @[Lookup.scala 33:37]
    node _T_112 = mux(_T_69, UInt<1>("h1"), _T_111) @[Lookup.scala 33:37]
    node _T_113 = mux(_T_67, UInt<1>("h1"), _T_112) @[Lookup.scala 33:37]
    node _T_114 = mux(_T_65, UInt<1>("h1"), _T_113) @[Lookup.scala 33:37]
    node _T_115 = mux(_T_63, UInt<1>("h1"), _T_114) @[Lookup.scala 33:37]
    node _T_116 = mux(_T_61, UInt<1>("h1"), _T_115) @[Lookup.scala 33:37]
    node _T_117 = mux(_T_59, UInt<1>("h1"), _T_116) @[Lookup.scala 33:37]
    node _T_118 = mux(_T_57, UInt<1>("h1"), _T_117) @[Lookup.scala 33:37]
    node _T_119 = mux(_T_55, UInt<1>("h1"), _T_118) @[Lookup.scala 33:37]
    node _T_120 = mux(_T_53, UInt<1>("h1"), _T_119) @[Lookup.scala 33:37]
    node _T_121 = mux(_T_51, UInt<1>("h1"), _T_120) @[Lookup.scala 33:37]
    node _T_122 = mux(_T_49, UInt<1>("h1"), _T_121) @[Lookup.scala 33:37]
    node _T_123 = mux(_T_47, UInt<1>("h1"), _T_122) @[Lookup.scala 33:37]
    node _T_124 = mux(_T_45, UInt<1>("h1"), _T_123) @[Lookup.scala 33:37]
    node _T_125 = mux(_T_43, UInt<1>("h1"), _T_124) @[Lookup.scala 33:37]
    node _T_126 = mux(_T_41, UInt<1>("h1"), _T_125) @[Lookup.scala 33:37]
    node _T_127 = mux(_T_39, UInt<1>("h1"), _T_126) @[Lookup.scala 33:37]
    node _T_128 = mux(_T_37, UInt<1>("h1"), _T_127) @[Lookup.scala 33:37]
    node _T_129 = mux(_T_35, UInt<1>("h1"), _T_128) @[Lookup.scala 33:37]
    node _T_130 = mux(_T_33, UInt<1>("h1"), _T_129) @[Lookup.scala 33:37]
    node _T_131 = mux(_T_31, UInt<1>("h1"), _T_130) @[Lookup.scala 33:37]
    node _T_132 = mux(_T_29, UInt<1>("h1"), _T_131) @[Lookup.scala 33:37]
    node _T_133 = mux(_T_27, UInt<1>("h1"), _T_132) @[Lookup.scala 33:37]
    node _T_134 = mux(_T_25, UInt<1>("h1"), _T_133) @[Lookup.scala 33:37]
    node _T_135 = mux(_T_23, UInt<1>("h1"), _T_134) @[Lookup.scala 33:37]
    node _T_136 = mux(_T_21, UInt<1>("h1"), _T_135) @[Lookup.scala 33:37]
    node _T_137 = mux(_T_19, UInt<1>("h1"), _T_136) @[Lookup.scala 33:37]
    node _T_138 = mux(_T_17, UInt<1>("h1"), _T_137) @[Lookup.scala 33:37]
    node _T_139 = mux(_T_15, UInt<1>("h1"), _T_138) @[Lookup.scala 33:37]
    node _T_140 = mux(_T_13, UInt<1>("h1"), _T_139) @[Lookup.scala 33:37]
    node _T_141 = mux(_T_11, UInt<1>("h1"), _T_140) @[Lookup.scala 33:37]
    node _T_142 = mux(_T_9, UInt<1>("h1"), _T_141) @[Lookup.scala 33:37]
    node _T_143 = mux(_T_7, UInt<1>("h1"), _T_142) @[Lookup.scala 33:37]
    node _T_144 = mux(_T_5, UInt<1>("h1"), _T_143) @[Lookup.scala 33:37]
    node _T_145 = mux(_T_3, UInt<1>("h1"), _T_144) @[Lookup.scala 33:37]
    node cs_val_inst = mux(_T_1, UInt<1>("h1"), _T_145) @[Lookup.scala 33:37]
    node _T_146 = mux(_T_97, UInt<4>("h0"), UInt<4>("h0")) @[Lookup.scala 33:37]
    node _T_147 = mux(_T_95, UInt<4>("h0"), _T_146) @[Lookup.scala 33:37]
    node _T_148 = mux(_T_93, UInt<4>("h0"), _T_147) @[Lookup.scala 33:37]
    node _T_149 = mux(_T_91, UInt<4>("h0"), _T_148) @[Lookup.scala 33:37]
    node _T_150 = mux(_T_89, UInt<4>("h0"), _T_149) @[Lookup.scala 33:37]
    node _T_151 = mux(_T_87, UInt<4>("h0"), _T_150) @[Lookup.scala 33:37]
    node _T_152 = mux(_T_85, UInt<4>("h0"), _T_151) @[Lookup.scala 33:37]
    node _T_153 = mux(_T_83, UInt<4>("h0"), _T_152) @[Lookup.scala 33:37]
    node _T_154 = mux(_T_81, UInt<4>("h0"), _T_153) @[Lookup.scala 33:37]
    node _T_155 = mux(_T_79, UInt<4>("h0"), _T_154) @[Lookup.scala 33:37]
    node _T_156 = mux(_T_77, UInt<4>("h0"), _T_155) @[Lookup.scala 33:37]
    node _T_157 = mux(_T_75, UInt<4>("h0"), _T_156) @[Lookup.scala 33:37]
    node _T_158 = mux(_T_73, UInt<4>("h6"), _T_157) @[Lookup.scala 33:37]
    node _T_159 = mux(_T_71, UInt<4>("h5"), _T_158) @[Lookup.scala 33:37]
    node _T_160 = mux(_T_69, UInt<4>("h4"), _T_159) @[Lookup.scala 33:37]
    node _T_161 = mux(_T_67, UInt<4>("h3"), _T_160) @[Lookup.scala 33:37]
    node _T_162 = mux(_T_65, UInt<4>("h1"), _T_161) @[Lookup.scala 33:37]
    node _T_163 = mux(_T_63, UInt<4>("h2"), _T_162) @[Lookup.scala 33:37]
    node _T_164 = mux(_T_61, UInt<4>("h8"), _T_163) @[Lookup.scala 33:37]
    node _T_165 = mux(_T_59, UInt<4>("h7"), _T_164) @[Lookup.scala 33:37]
    node _T_166 = mux(_T_57, UInt<4>("h0"), _T_165) @[Lookup.scala 33:37]
    node _T_167 = mux(_T_55, UInt<4>("h0"), _T_166) @[Lookup.scala 33:37]
    node _T_168 = mux(_T_53, UInt<4>("h0"), _T_167) @[Lookup.scala 33:37]
    node _T_169 = mux(_T_51, UInt<4>("h0"), _T_168) @[Lookup.scala 33:37]
    node _T_170 = mux(_T_49, UInt<4>("h0"), _T_169) @[Lookup.scala 33:37]
    node _T_171 = mux(_T_47, UInt<4>("h0"), _T_170) @[Lookup.scala 33:37]
    node _T_172 = mux(_T_45, UInt<4>("h0"), _T_171) @[Lookup.scala 33:37]
    node _T_173 = mux(_T_43, UInt<4>("h0"), _T_172) @[Lookup.scala 33:37]
    node _T_174 = mux(_T_41, UInt<4>("h0"), _T_173) @[Lookup.scala 33:37]
    node _T_175 = mux(_T_39, UInt<4>("h0"), _T_174) @[Lookup.scala 33:37]
    node _T_176 = mux(_T_37, UInt<4>("h0"), _T_175) @[Lookup.scala 33:37]
    node _T_177 = mux(_T_35, UInt<4>("h0"), _T_176) @[Lookup.scala 33:37]
    node _T_178 = mux(_T_33, UInt<4>("h0"), _T_177) @[Lookup.scala 33:37]
    node _T_179 = mux(_T_31, UInt<4>("h0"), _T_178) @[Lookup.scala 33:37]
    node _T_180 = mux(_T_29, UInt<4>("h0"), _T_179) @[Lookup.scala 33:37]
    node _T_181 = mux(_T_27, UInt<4>("h0"), _T_180) @[Lookup.scala 33:37]
    node _T_182 = mux(_T_25, UInt<4>("h0"), _T_181) @[Lookup.scala 33:37]
    node _T_183 = mux(_T_23, UInt<4>("h0"), _T_182) @[Lookup.scala 33:37]
    node _T_184 = mux(_T_21, UInt<4>("h0"), _T_183) @[Lookup.scala 33:37]
    node _T_185 = mux(_T_19, UInt<4>("h0"), _T_184) @[Lookup.scala 33:37]
    node _T_186 = mux(_T_17, UInt<4>("h0"), _T_185) @[Lookup.scala 33:37]
    node _T_187 = mux(_T_15, UInt<4>("h0"), _T_186) @[Lookup.scala 33:37]
    node _T_188 = mux(_T_13, UInt<4>("h0"), _T_187) @[Lookup.scala 33:37]
    node _T_189 = mux(_T_11, UInt<4>("h0"), _T_188) @[Lookup.scala 33:37]
    node _T_190 = mux(_T_9, UInt<4>("h0"), _T_189) @[Lookup.scala 33:37]
    node _T_191 = mux(_T_7, UInt<4>("h0"), _T_190) @[Lookup.scala 33:37]
    node _T_192 = mux(_T_5, UInt<4>("h0"), _T_191) @[Lookup.scala 33:37]
    node _T_193 = mux(_T_3, UInt<4>("h0"), _T_192) @[Lookup.scala 33:37]
    node cs_br_type = mux(_T_1, UInt<4>("h0"), _T_193) @[Lookup.scala 33:37]
    node _T_194 = mux(_T_97, UInt<2>("h0"), UInt<2>("h0")) @[Lookup.scala 33:37]
    node _T_195 = mux(_T_95, UInt<2>("h0"), _T_194) @[Lookup.scala 33:37]
    node _T_196 = mux(_T_93, UInt<2>("h0"), _T_195) @[Lookup.scala 33:37]
    node _T_197 = mux(_T_91, UInt<2>("h0"), _T_196) @[Lookup.scala 33:37]
    node _T_198 = mux(_T_89, UInt<2>("h0"), _T_197) @[Lookup.scala 33:37]
    node _T_199 = mux(_T_87, UInt<2>("h0"), _T_198) @[Lookup.scala 33:37]
    node _T_200 = mux(_T_85, UInt<2>("h0"), _T_199) @[Lookup.scala 33:37]
    node _T_201 = mux(_T_83, UInt<2>("h0"), _T_200) @[Lookup.scala 33:37]
    node _T_202 = mux(_T_81, UInt<2>("h0"), _T_201) @[Lookup.scala 33:37]
    node _T_203 = mux(_T_79, UInt<2>("h2"), _T_202) @[Lookup.scala 33:37]
    node _T_204 = mux(_T_77, UInt<2>("h2"), _T_203) @[Lookup.scala 33:37]
    node _T_205 = mux(_T_75, UInt<2>("h2"), _T_204) @[Lookup.scala 33:37]
    node _T_206 = mux(_T_73, UInt<2>("h1"), _T_205) @[Lookup.scala 33:37]
    node _T_207 = mux(_T_71, UInt<2>("h1"), _T_206) @[Lookup.scala 33:37]
    node _T_208 = mux(_T_69, UInt<2>("h1"), _T_207) @[Lookup.scala 33:37]
    node _T_209 = mux(_T_67, UInt<2>("h1"), _T_208) @[Lookup.scala 33:37]
    node _T_210 = mux(_T_65, UInt<2>("h1"), _T_209) @[Lookup.scala 33:37]
    node _T_211 = mux(_T_63, UInt<2>("h1"), _T_210) @[Lookup.scala 33:37]
    node _T_212 = mux(_T_61, UInt<2>("h0"), _T_211) @[Lookup.scala 33:37]
    node _T_213 = mux(_T_59, UInt<2>("h1"), _T_212) @[Lookup.scala 33:37]
    node _T_214 = mux(_T_57, UInt<2>("h0"), _T_213) @[Lookup.scala 33:37]
    node _T_215 = mux(_T_55, UInt<2>("h0"), _T_214) @[Lookup.scala 33:37]
    node _T_216 = mux(_T_53, UInt<2>("h0"), _T_215) @[Lookup.scala 33:37]
    node _T_217 = mux(_T_51, UInt<2>("h0"), _T_216) @[Lookup.scala 33:37]
    node _T_218 = mux(_T_49, UInt<2>("h0"), _T_217) @[Lookup.scala 33:37]
    node _T_219 = mux(_T_47, UInt<2>("h0"), _T_218) @[Lookup.scala 33:37]
    node _T_220 = mux(_T_45, UInt<2>("h0"), _T_219) @[Lookup.scala 33:37]
    node _T_221 = mux(_T_43, UInt<2>("h0"), _T_220) @[Lookup.scala 33:37]
    node _T_222 = mux(_T_41, UInt<2>("h0"), _T_221) @[Lookup.scala 33:37]
    node _T_223 = mux(_T_39, UInt<2>("h0"), _T_222) @[Lookup.scala 33:37]
    node _T_224 = mux(_T_37, UInt<2>("h0"), _T_223) @[Lookup.scala 33:37]
    node _T_225 = mux(_T_35, UInt<2>("h0"), _T_224) @[Lookup.scala 33:37]
    node _T_226 = mux(_T_33, UInt<2>("h0"), _T_225) @[Lookup.scala 33:37]
    node _T_227 = mux(_T_31, UInt<2>("h0"), _T_226) @[Lookup.scala 33:37]
    node _T_228 = mux(_T_29, UInt<2>("h0"), _T_227) @[Lookup.scala 33:37]
    node _T_229 = mux(_T_27, UInt<2>("h0"), _T_228) @[Lookup.scala 33:37]
    node _T_230 = mux(_T_25, UInt<2>("h0"), _T_229) @[Lookup.scala 33:37]
    node _T_231 = mux(_T_23, UInt<2>("h0"), _T_230) @[Lookup.scala 33:37]
    node _T_232 = mux(_T_21, UInt<2>("h0"), _T_231) @[Lookup.scala 33:37]
    node _T_233 = mux(_T_19, UInt<2>("h0"), _T_232) @[Lookup.scala 33:37]
    node _T_234 = mux(_T_17, UInt<2>("h1"), _T_233) @[Lookup.scala 33:37]
    node _T_235 = mux(_T_15, UInt<2>("h0"), _T_234) @[Lookup.scala 33:37]
    node _T_236 = mux(_T_13, UInt<2>("h0"), _T_235) @[Lookup.scala 33:37]
    node _T_237 = mux(_T_11, UInt<2>("h0"), _T_236) @[Lookup.scala 33:37]
    node _T_238 = mux(_T_9, UInt<2>("h0"), _T_237) @[Lookup.scala 33:37]
    node _T_239 = mux(_T_7, UInt<2>("h0"), _T_238) @[Lookup.scala 33:37]
    node _T_240 = mux(_T_5, UInt<2>("h0"), _T_239) @[Lookup.scala 33:37]
    node _T_241 = mux(_T_3, UInt<2>("h0"), _T_240) @[Lookup.scala 33:37]
    node cs_op1_sel = mux(_T_1, UInt<2>("h0"), _T_241) @[Lookup.scala 33:37]
    node _T_242 = mux(_T_97, UInt<2>("h0"), UInt<2>("h0")) @[Lookup.scala 33:37]
    node _T_243 = mux(_T_95, UInt<2>("h0"), _T_242) @[Lookup.scala 33:37]
    node _T_244 = mux(_T_93, UInt<2>("h0"), _T_243) @[Lookup.scala 33:37]
    node _T_245 = mux(_T_91, UInt<2>("h0"), _T_244) @[Lookup.scala 33:37]
    node _T_246 = mux(_T_89, UInt<2>("h0"), _T_245) @[Lookup.scala 33:37]
    node _T_247 = mux(_T_87, UInt<2>("h0"), _T_246) @[Lookup.scala 33:37]
    node _T_248 = mux(_T_85, UInt<2>("h0"), _T_247) @[Lookup.scala 33:37]
    node _T_249 = mux(_T_83, UInt<2>("h0"), _T_248) @[Lookup.scala 33:37]
    node _T_250 = mux(_T_81, UInt<2>("h0"), _T_249) @[Lookup.scala 33:37]
    node _T_251 = mux(_T_79, UInt<2>("h0"), _T_250) @[Lookup.scala 33:37]
    node _T_252 = mux(_T_77, UInt<2>("h0"), _T_251) @[Lookup.scala 33:37]
    node _T_253 = mux(_T_75, UInt<2>("h0"), _T_252) @[Lookup.scala 33:37]
    node _T_254 = mux(_T_73, UInt<2>("h1"), _T_253) @[Lookup.scala 33:37]
    node _T_255 = mux(_T_71, UInt<2>("h1"), _T_254) @[Lookup.scala 33:37]
    node _T_256 = mux(_T_69, UInt<2>("h1"), _T_255) @[Lookup.scala 33:37]
    node _T_257 = mux(_T_67, UInt<2>("h1"), _T_256) @[Lookup.scala 33:37]
    node _T_258 = mux(_T_65, UInt<2>("h1"), _T_257) @[Lookup.scala 33:37]
    node _T_259 = mux(_T_63, UInt<2>("h1"), _T_258) @[Lookup.scala 33:37]
    node _T_260 = mux(_T_61, UInt<2>("h1"), _T_259) @[Lookup.scala 33:37]
    node _T_261 = mux(_T_59, UInt<2>("h1"), _T_260) @[Lookup.scala 33:37]
    node _T_262 = mux(_T_57, UInt<2>("h0"), _T_261) @[Lookup.scala 33:37]
    node _T_263 = mux(_T_55, UInt<2>("h0"), _T_262) @[Lookup.scala 33:37]
    node _T_264 = mux(_T_53, UInt<2>("h0"), _T_263) @[Lookup.scala 33:37]
    node _T_265 = mux(_T_51, UInt<2>("h0"), _T_264) @[Lookup.scala 33:37]
    node _T_266 = mux(_T_49, UInt<2>("h0"), _T_265) @[Lookup.scala 33:37]
    node _T_267 = mux(_T_47, UInt<2>("h0"), _T_266) @[Lookup.scala 33:37]
    node _T_268 = mux(_T_45, UInt<2>("h0"), _T_267) @[Lookup.scala 33:37]
    node _T_269 = mux(_T_43, UInt<2>("h0"), _T_268) @[Lookup.scala 33:37]
    node _T_270 = mux(_T_41, UInt<2>("h0"), _T_269) @[Lookup.scala 33:37]
    node _T_271 = mux(_T_39, UInt<2>("h0"), _T_270) @[Lookup.scala 33:37]
    node _T_272 = mux(_T_37, UInt<2>("h1"), _T_271) @[Lookup.scala 33:37]
    node _T_273 = mux(_T_35, UInt<2>("h1"), _T_272) @[Lookup.scala 33:37]
    node _T_274 = mux(_T_33, UInt<2>("h1"), _T_273) @[Lookup.scala 33:37]
    node _T_275 = mux(_T_31, UInt<2>("h1"), _T_274) @[Lookup.scala 33:37]
    node _T_276 = mux(_T_29, UInt<2>("h1"), _T_275) @[Lookup.scala 33:37]
    node _T_277 = mux(_T_27, UInt<2>("h1"), _T_276) @[Lookup.scala 33:37]
    node _T_278 = mux(_T_25, UInt<2>("h1"), _T_277) @[Lookup.scala 33:37]
    node _T_279 = mux(_T_23, UInt<2>("h1"), _T_278) @[Lookup.scala 33:37]
    node _T_280 = mux(_T_21, UInt<2>("h1"), _T_279) @[Lookup.scala 33:37]
    node _T_281 = mux(_T_19, UInt<2>("h1"), _T_280) @[Lookup.scala 33:37]
    node _T_282 = mux(_T_17, UInt<2>("h1"), _T_281) @[Lookup.scala 33:37]
    node _T_283 = mux(_T_15, UInt<2>("h1"), _T_282) @[Lookup.scala 33:37]
    node _T_284 = mux(_T_13, UInt<2>("h1"), _T_283) @[Lookup.scala 33:37]
    node _T_285 = mux(_T_11, UInt<2>("h1"), _T_284) @[Lookup.scala 33:37]
    node _T_286 = mux(_T_9, UInt<2>("h1"), _T_285) @[Lookup.scala 33:37]
    node _T_287 = mux(_T_7, UInt<2>("h1"), _T_286) @[Lookup.scala 33:37]
    node _T_288 = mux(_T_5, UInt<2>("h1"), _T_287) @[Lookup.scala 33:37]
    node _T_289 = mux(_T_3, UInt<2>("h1"), _T_288) @[Lookup.scala 33:37]
    node cs_op2_sel = mux(_T_1, UInt<2>("h1"), _T_289) @[Lookup.scala 33:37]
    node _T_290 = mux(_T_97, UInt<3>("h0"), UInt<3>("h0")) @[Lookup.scala 33:37]
    node _T_291 = mux(_T_95, UInt<3>("h0"), _T_290) @[Lookup.scala 33:37]
    node _T_292 = mux(_T_93, UInt<3>("h0"), _T_291) @[Lookup.scala 33:37]
    node _T_293 = mux(_T_91, UInt<3>("h0"), _T_292) @[Lookup.scala 33:37]
    node _T_294 = mux(_T_89, UInt<3>("h0"), _T_293) @[Lookup.scala 33:37]
    node _T_295 = mux(_T_87, UInt<3>("h0"), _T_294) @[Lookup.scala 33:37]
    node _T_296 = mux(_T_85, UInt<3>("h0"), _T_295) @[Lookup.scala 33:37]
    node _T_297 = mux(_T_83, UInt<3>("h0"), _T_296) @[Lookup.scala 33:37]
    node _T_298 = mux(_T_81, UInt<3>("h0"), _T_297) @[Lookup.scala 33:37]
    node _T_299 = mux(_T_79, UInt<3>("h6"), _T_298) @[Lookup.scala 33:37]
    node _T_300 = mux(_T_77, UInt<3>("h6"), _T_299) @[Lookup.scala 33:37]
    node _T_301 = mux(_T_75, UInt<3>("h6"), _T_300) @[Lookup.scala 33:37]
    node _T_302 = mux(_T_73, UInt<3>("h5"), _T_301) @[Lookup.scala 33:37]
    node _T_303 = mux(_T_71, UInt<3>("h5"), _T_302) @[Lookup.scala 33:37]
    node _T_304 = mux(_T_69, UInt<3>("h5"), _T_303) @[Lookup.scala 33:37]
    node _T_305 = mux(_T_67, UInt<3>("h5"), _T_304) @[Lookup.scala 33:37]
    node _T_306 = mux(_T_65, UInt<3>("h5"), _T_305) @[Lookup.scala 33:37]
    node _T_307 = mux(_T_63, UInt<3>("h5"), _T_306) @[Lookup.scala 33:37]
    node _T_308 = mux(_T_61, UInt<3>("h4"), _T_307) @[Lookup.scala 33:37]
    node _T_309 = mux(_T_59, UInt<3>("h4"), _T_308) @[Lookup.scala 33:37]
    node _T_310 = mux(_T_57, UInt<3>("h0"), _T_309) @[Lookup.scala 33:37]
    node _T_311 = mux(_T_55, UInt<3>("h0"), _T_310) @[Lookup.scala 33:37]
    node _T_312 = mux(_T_53, UInt<3>("h0"), _T_311) @[Lookup.scala 33:37]
    node _T_313 = mux(_T_51, UInt<3>("h0"), _T_312) @[Lookup.scala 33:37]
    node _T_314 = mux(_T_49, UInt<3>("h0"), _T_313) @[Lookup.scala 33:37]
    node _T_315 = mux(_T_47, UInt<3>("h0"), _T_314) @[Lookup.scala 33:37]
    node _T_316 = mux(_T_45, UInt<3>("h0"), _T_315) @[Lookup.scala 33:37]
    node _T_317 = mux(_T_43, UInt<3>("h0"), _T_316) @[Lookup.scala 33:37]
    node _T_318 = mux(_T_41, UInt<3>("h0"), _T_317) @[Lookup.scala 33:37]
    node _T_319 = mux(_T_39, UInt<3>("h0"), _T_318) @[Lookup.scala 33:37]
    node _T_320 = mux(_T_37, UInt<3>("h1"), _T_319) @[Lookup.scala 33:37]
    node _T_321 = mux(_T_35, UInt<3>("h1"), _T_320) @[Lookup.scala 33:37]
    node _T_322 = mux(_T_33, UInt<3>("h1"), _T_321) @[Lookup.scala 33:37]
    node _T_323 = mux(_T_31, UInt<3>("h1"), _T_322) @[Lookup.scala 33:37]
    node _T_324 = mux(_T_29, UInt<3>("h1"), _T_323) @[Lookup.scala 33:37]
    node _T_325 = mux(_T_27, UInt<3>("h1"), _T_324) @[Lookup.scala 33:37]
    node _T_326 = mux(_T_25, UInt<3>("h1"), _T_325) @[Lookup.scala 33:37]
    node _T_327 = mux(_T_23, UInt<3>("h1"), _T_326) @[Lookup.scala 33:37]
    node _T_328 = mux(_T_21, UInt<3>("h1"), _T_327) @[Lookup.scala 33:37]
    node _T_329 = mux(_T_19, UInt<3>("h3"), _T_328) @[Lookup.scala 33:37]
    node _T_330 = mux(_T_17, UInt<3>("h3"), _T_329) @[Lookup.scala 33:37]
    node _T_331 = mux(_T_15, UInt<3>("h2"), _T_330) @[Lookup.scala 33:37]
    node _T_332 = mux(_T_13, UInt<3>("h2"), _T_331) @[Lookup.scala 33:37]
    node _T_333 = mux(_T_11, UInt<3>("h2"), _T_332) @[Lookup.scala 33:37]
    node _T_334 = mux(_T_9, UInt<3>("h1"), _T_333) @[Lookup.scala 33:37]
    node _T_335 = mux(_T_7, UInt<3>("h1"), _T_334) @[Lookup.scala 33:37]
    node _T_336 = mux(_T_5, UInt<3>("h1"), _T_335) @[Lookup.scala 33:37]
    node _T_337 = mux(_T_3, UInt<3>("h1"), _T_336) @[Lookup.scala 33:37]
    node cs0_0 = mux(_T_1, UInt<3>("h1"), _T_337) @[Lookup.scala 33:37]
    node _T_338 = mux(_T_97, UInt<4>("h0"), UInt<4>("h0")) @[Lookup.scala 33:37]
    node _T_339 = mux(_T_95, UInt<4>("h0"), _T_338) @[Lookup.scala 33:37]
    node _T_340 = mux(_T_93, UInt<4>("h0"), _T_339) @[Lookup.scala 33:37]
    node _T_341 = mux(_T_91, UInt<4>("h0"), _T_340) @[Lookup.scala 33:37]
    node _T_342 = mux(_T_89, UInt<4>("h0"), _T_341) @[Lookup.scala 33:37]
    node _T_343 = mux(_T_87, UInt<4>("h0"), _T_342) @[Lookup.scala 33:37]
    node _T_344 = mux(_T_85, UInt<4>("hb"), _T_343) @[Lookup.scala 33:37]
    node _T_345 = mux(_T_83, UInt<4>("hb"), _T_344) @[Lookup.scala 33:37]
    node _T_346 = mux(_T_81, UInt<4>("hb"), _T_345) @[Lookup.scala 33:37]
    node _T_347 = mux(_T_79, UInt<4>("hb"), _T_346) @[Lookup.scala 33:37]
    node _T_348 = mux(_T_77, UInt<4>("hb"), _T_347) @[Lookup.scala 33:37]
    node _T_349 = mux(_T_75, UInt<4>("hb"), _T_348) @[Lookup.scala 33:37]
    node _T_350 = mux(_T_73, UInt<4>("h1"), _T_349) @[Lookup.scala 33:37]
    node _T_351 = mux(_T_71, UInt<4>("h1"), _T_350) @[Lookup.scala 33:37]
    node _T_352 = mux(_T_69, UInt<4>("h1"), _T_351) @[Lookup.scala 33:37]
    node _T_353 = mux(_T_67, UInt<4>("h1"), _T_352) @[Lookup.scala 33:37]
    node _T_354 = mux(_T_65, UInt<4>("h1"), _T_353) @[Lookup.scala 33:37]
    node _T_355 = mux(_T_63, UInt<4>("h1"), _T_354) @[Lookup.scala 33:37]
    node _T_356 = mux(_T_61, UInt<4>("h1"), _T_355) @[Lookup.scala 33:37]
    node _T_357 = mux(_T_59, UInt<4>("h1"), _T_356) @[Lookup.scala 33:37]
    node _T_358 = mux(_T_57, UInt<4>("h4"), _T_357) @[Lookup.scala 33:37]
    node _T_359 = mux(_T_55, UInt<4>("h5"), _T_358) @[Lookup.scala 33:37]
    node _T_360 = mux(_T_53, UInt<4>("h8"), _T_359) @[Lookup.scala 33:37]
    node _T_361 = mux(_T_51, UInt<4>("h7"), _T_360) @[Lookup.scala 33:37]
    node _T_362 = mux(_T_49, UInt<4>("h6"), _T_361) @[Lookup.scala 33:37]
    node _T_363 = mux(_T_47, UInt<4>("ha"), _T_362) @[Lookup.scala 33:37]
    node _T_364 = mux(_T_45, UInt<4>("h9"), _T_363) @[Lookup.scala 33:37]
    node _T_365 = mux(_T_43, UInt<4>("h2"), _T_364) @[Lookup.scala 33:37]
    node _T_366 = mux(_T_41, UInt<4>("h1"), _T_365) @[Lookup.scala 33:37]
    node _T_367 = mux(_T_39, UInt<4>("h3"), _T_366) @[Lookup.scala 33:37]
    node _T_368 = mux(_T_37, UInt<4>("h4"), _T_367) @[Lookup.scala 33:37]
    node _T_369 = mux(_T_35, UInt<4>("h5"), _T_368) @[Lookup.scala 33:37]
    node _T_370 = mux(_T_33, UInt<4>("h3"), _T_369) @[Lookup.scala 33:37]
    node _T_371 = mux(_T_31, UInt<4>("ha"), _T_370) @[Lookup.scala 33:37]
    node _T_372 = mux(_T_29, UInt<4>("h9"), _T_371) @[Lookup.scala 33:37]
    node _T_373 = mux(_T_27, UInt<4>("h8"), _T_372) @[Lookup.scala 33:37]
    node _T_374 = mux(_T_25, UInt<4>("h7"), _T_373) @[Lookup.scala 33:37]
    node _T_375 = mux(_T_23, UInt<4>("h6"), _T_374) @[Lookup.scala 33:37]
    node _T_376 = mux(_T_21, UInt<4>("h1"), _T_375) @[Lookup.scala 33:37]
    node _T_377 = mux(_T_19, UInt<4>("hb"), _T_376) @[Lookup.scala 33:37]
    node _T_378 = mux(_T_17, UInt<4>("h1"), _T_377) @[Lookup.scala 33:37]
    node _T_379 = mux(_T_15, UInt<4>("h1"), _T_378) @[Lookup.scala 33:37]
    node _T_380 = mux(_T_13, UInt<4>("h1"), _T_379) @[Lookup.scala 33:37]
    node _T_381 = mux(_T_11, UInt<4>("h1"), _T_380) @[Lookup.scala 33:37]
    node _T_382 = mux(_T_9, UInt<4>("h1"), _T_381) @[Lookup.scala 33:37]
    node _T_383 = mux(_T_7, UInt<4>("h1"), _T_382) @[Lookup.scala 33:37]
    node _T_384 = mux(_T_5, UInt<4>("h1"), _T_383) @[Lookup.scala 33:37]
    node _T_385 = mux(_T_3, UInt<4>("h1"), _T_384) @[Lookup.scala 33:37]
    node cs0_1 = mux(_T_1, UInt<4>("h1"), _T_385) @[Lookup.scala 33:37]
    node _T_386 = mux(_T_97, UInt<2>("h0"), UInt<2>("h0")) @[Lookup.scala 33:37]
    node _T_387 = mux(_T_95, UInt<2>("h0"), _T_386) @[Lookup.scala 33:37]
    node _T_388 = mux(_T_93, UInt<2>("h0"), _T_387) @[Lookup.scala 33:37]
    node _T_389 = mux(_T_91, UInt<2>("h0"), _T_388) @[Lookup.scala 33:37]
    node _T_390 = mux(_T_89, UInt<2>("h0"), _T_389) @[Lookup.scala 33:37]
    node _T_391 = mux(_T_87, UInt<2>("h0"), _T_390) @[Lookup.scala 33:37]
    node _T_392 = mux(_T_85, UInt<2>("h3"), _T_391) @[Lookup.scala 33:37]
    node _T_393 = mux(_T_83, UInt<2>("h3"), _T_392) @[Lookup.scala 33:37]
    node _T_394 = mux(_T_81, UInt<2>("h3"), _T_393) @[Lookup.scala 33:37]
    node _T_395 = mux(_T_79, UInt<2>("h3"), _T_394) @[Lookup.scala 33:37]
    node _T_396 = mux(_T_77, UInt<2>("h3"), _T_395) @[Lookup.scala 33:37]
    node _T_397 = mux(_T_75, UInt<2>("h3"), _T_396) @[Lookup.scala 33:37]
    node _T_398 = mux(_T_73, UInt<2>("h0"), _T_397) @[Lookup.scala 33:37]
    node _T_399 = mux(_T_71, UInt<2>("h0"), _T_398) @[Lookup.scala 33:37]
    node _T_400 = mux(_T_69, UInt<2>("h0"), _T_399) @[Lookup.scala 33:37]
    node _T_401 = mux(_T_67, UInt<2>("h0"), _T_400) @[Lookup.scala 33:37]
    node _T_402 = mux(_T_65, UInt<2>("h0"), _T_401) @[Lookup.scala 33:37]
    node _T_403 = mux(_T_63, UInt<2>("h0"), _T_402) @[Lookup.scala 33:37]
    node _T_404 = mux(_T_61, UInt<2>("h2"), _T_403) @[Lookup.scala 33:37]
    node _T_405 = mux(_T_59, UInt<2>("h2"), _T_404) @[Lookup.scala 33:37]
    node _T_406 = mux(_T_57, UInt<2>("h0"), _T_405) @[Lookup.scala 33:37]
    node _T_407 = mux(_T_55, UInt<2>("h0"), _T_406) @[Lookup.scala 33:37]
    node _T_408 = mux(_T_53, UInt<2>("h0"), _T_407) @[Lookup.scala 33:37]
    node _T_409 = mux(_T_51, UInt<2>("h0"), _T_408) @[Lookup.scala 33:37]
    node _T_410 = mux(_T_49, UInt<2>("h0"), _T_409) @[Lookup.scala 33:37]
    node _T_411 = mux(_T_47, UInt<2>("h0"), _T_410) @[Lookup.scala 33:37]
    node _T_412 = mux(_T_45, UInt<2>("h0"), _T_411) @[Lookup.scala 33:37]
    node _T_413 = mux(_T_43, UInt<2>("h0"), _T_412) @[Lookup.scala 33:37]
    node _T_414 = mux(_T_41, UInt<2>("h0"), _T_413) @[Lookup.scala 33:37]
    node _T_415 = mux(_T_39, UInt<2>("h0"), _T_414) @[Lookup.scala 33:37]
    node _T_416 = mux(_T_37, UInt<2>("h0"), _T_415) @[Lookup.scala 33:37]
    node _T_417 = mux(_T_35, UInt<2>("h0"), _T_416) @[Lookup.scala 33:37]
    node _T_418 = mux(_T_33, UInt<2>("h0"), _T_417) @[Lookup.scala 33:37]
    node _T_419 = mux(_T_31, UInt<2>("h0"), _T_418) @[Lookup.scala 33:37]
    node _T_420 = mux(_T_29, UInt<2>("h0"), _T_419) @[Lookup.scala 33:37]
    node _T_421 = mux(_T_27, UInt<2>("h0"), _T_420) @[Lookup.scala 33:37]
    node _T_422 = mux(_T_25, UInt<2>("h0"), _T_421) @[Lookup.scala 33:37]
    node _T_423 = mux(_T_23, UInt<2>("h0"), _T_422) @[Lookup.scala 33:37]
    node _T_424 = mux(_T_21, UInt<2>("h0"), _T_423) @[Lookup.scala 33:37]
    node _T_425 = mux(_T_19, UInt<2>("h0"), _T_424) @[Lookup.scala 33:37]
    node _T_426 = mux(_T_17, UInt<2>("h0"), _T_425) @[Lookup.scala 33:37]
    node _T_427 = mux(_T_15, UInt<2>("h0"), _T_426) @[Lookup.scala 33:37]
    node _T_428 = mux(_T_13, UInt<2>("h0"), _T_427) @[Lookup.scala 33:37]
    node _T_429 = mux(_T_11, UInt<2>("h0"), _T_428) @[Lookup.scala 33:37]
    node _T_430 = mux(_T_9, UInt<2>("h1"), _T_429) @[Lookup.scala 33:37]
    node _T_431 = mux(_T_7, UInt<2>("h1"), _T_430) @[Lookup.scala 33:37]
    node _T_432 = mux(_T_5, UInt<2>("h1"), _T_431) @[Lookup.scala 33:37]
    node _T_433 = mux(_T_3, UInt<2>("h1"), _T_432) @[Lookup.scala 33:37]
    node cs0_2 = mux(_T_1, UInt<2>("h1"), _T_433) @[Lookup.scala 33:37]
    node _T_434 = mux(_T_97, UInt<1>("h0"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_435 = mux(_T_95, UInt<1>("h0"), _T_434) @[Lookup.scala 33:37]
    node _T_436 = mux(_T_93, UInt<1>("h0"), _T_435) @[Lookup.scala 33:37]
    node _T_437 = mux(_T_91, UInt<1>("h0"), _T_436) @[Lookup.scala 33:37]
    node _T_438 = mux(_T_89, UInt<1>("h0"), _T_437) @[Lookup.scala 33:37]
    node _T_439 = mux(_T_87, UInt<1>("h0"), _T_438) @[Lookup.scala 33:37]
    node _T_440 = mux(_T_85, UInt<1>("h1"), _T_439) @[Lookup.scala 33:37]
    node _T_441 = mux(_T_83, UInt<1>("h1"), _T_440) @[Lookup.scala 33:37]
    node _T_442 = mux(_T_81, UInt<1>("h1"), _T_441) @[Lookup.scala 33:37]
    node _T_443 = mux(_T_79, UInt<1>("h1"), _T_442) @[Lookup.scala 33:37]
    node _T_444 = mux(_T_77, UInt<1>("h1"), _T_443) @[Lookup.scala 33:37]
    node _T_445 = mux(_T_75, UInt<1>("h1"), _T_444) @[Lookup.scala 33:37]
    node _T_446 = mux(_T_73, UInt<1>("h0"), _T_445) @[Lookup.scala 33:37]
    node _T_447 = mux(_T_71, UInt<1>("h0"), _T_446) @[Lookup.scala 33:37]
    node _T_448 = mux(_T_69, UInt<1>("h0"), _T_447) @[Lookup.scala 33:37]
    node _T_449 = mux(_T_67, UInt<1>("h0"), _T_448) @[Lookup.scala 33:37]
    node _T_450 = mux(_T_65, UInt<1>("h0"), _T_449) @[Lookup.scala 33:37]
    node _T_451 = mux(_T_63, UInt<1>("h0"), _T_450) @[Lookup.scala 33:37]
    node _T_452 = mux(_T_61, UInt<1>("h1"), _T_451) @[Lookup.scala 33:37]
    node _T_453 = mux(_T_59, UInt<1>("h1"), _T_452) @[Lookup.scala 33:37]
    node _T_454 = mux(_T_57, UInt<1>("h1"), _T_453) @[Lookup.scala 33:37]
    node _T_455 = mux(_T_55, UInt<1>("h1"), _T_454) @[Lookup.scala 33:37]
    node _T_456 = mux(_T_53, UInt<1>("h1"), _T_455) @[Lookup.scala 33:37]
    node _T_457 = mux(_T_51, UInt<1>("h1"), _T_456) @[Lookup.scala 33:37]
    node _T_458 = mux(_T_49, UInt<1>("h1"), _T_457) @[Lookup.scala 33:37]
    node _T_459 = mux(_T_47, UInt<1>("h1"), _T_458) @[Lookup.scala 33:37]
    node _T_460 = mux(_T_45, UInt<1>("h1"), _T_459) @[Lookup.scala 33:37]
    node _T_461 = mux(_T_43, UInt<1>("h1"), _T_460) @[Lookup.scala 33:37]
    node _T_462 = mux(_T_41, UInt<1>("h1"), _T_461) @[Lookup.scala 33:37]
    node _T_463 = mux(_T_39, UInt<1>("h1"), _T_462) @[Lookup.scala 33:37]
    node _T_464 = mux(_T_37, UInt<1>("h1"), _T_463) @[Lookup.scala 33:37]
    node _T_465 = mux(_T_35, UInt<1>("h1"), _T_464) @[Lookup.scala 33:37]
    node _T_466 = mux(_T_33, UInt<1>("h1"), _T_465) @[Lookup.scala 33:37]
    node _T_467 = mux(_T_31, UInt<1>("h1"), _T_466) @[Lookup.scala 33:37]
    node _T_468 = mux(_T_29, UInt<1>("h1"), _T_467) @[Lookup.scala 33:37]
    node _T_469 = mux(_T_27, UInt<1>("h1"), _T_468) @[Lookup.scala 33:37]
    node _T_470 = mux(_T_25, UInt<1>("h1"), _T_469) @[Lookup.scala 33:37]
    node _T_471 = mux(_T_23, UInt<1>("h1"), _T_470) @[Lookup.scala 33:37]
    node _T_472 = mux(_T_21, UInt<1>("h1"), _T_471) @[Lookup.scala 33:37]
    node _T_473 = mux(_T_19, UInt<1>("h1"), _T_472) @[Lookup.scala 33:37]
    node _T_474 = mux(_T_17, UInt<1>("h1"), _T_473) @[Lookup.scala 33:37]
    node _T_475 = mux(_T_15, UInt<1>("h0"), _T_474) @[Lookup.scala 33:37]
    node _T_476 = mux(_T_13, UInt<1>("h0"), _T_475) @[Lookup.scala 33:37]
    node _T_477 = mux(_T_11, UInt<1>("h0"), _T_476) @[Lookup.scala 33:37]
    node _T_478 = mux(_T_9, UInt<1>("h1"), _T_477) @[Lookup.scala 33:37]
    node _T_479 = mux(_T_7, UInt<1>("h1"), _T_478) @[Lookup.scala 33:37]
    node _T_480 = mux(_T_5, UInt<1>("h1"), _T_479) @[Lookup.scala 33:37]
    node _T_481 = mux(_T_3, UInt<1>("h1"), _T_480) @[Lookup.scala 33:37]
    node cs0_3 = mux(_T_1, UInt<1>("h1"), _T_481) @[Lookup.scala 33:37]
    node _T_482 = mux(_T_97, UInt<1>("h1"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_483 = mux(_T_95, UInt<1>("h0"), _T_482) @[Lookup.scala 33:37]
    node _T_484 = mux(_T_93, UInt<1>("h0"), _T_483) @[Lookup.scala 33:37]
    node _T_485 = mux(_T_91, UInt<1>("h0"), _T_484) @[Lookup.scala 33:37]
    node _T_486 = mux(_T_89, UInt<1>("h0"), _T_485) @[Lookup.scala 33:37]
    node _T_487 = mux(_T_87, UInt<1>("h0"), _T_486) @[Lookup.scala 33:37]
    node _T_488 = mux(_T_85, UInt<1>("h0"), _T_487) @[Lookup.scala 33:37]
    node _T_489 = mux(_T_83, UInt<1>("h0"), _T_488) @[Lookup.scala 33:37]
    node _T_490 = mux(_T_81, UInt<1>("h0"), _T_489) @[Lookup.scala 33:37]
    node _T_491 = mux(_T_79, UInt<1>("h0"), _T_490) @[Lookup.scala 33:37]
    node _T_492 = mux(_T_77, UInt<1>("h0"), _T_491) @[Lookup.scala 33:37]
    node _T_493 = mux(_T_75, UInt<1>("h0"), _T_492) @[Lookup.scala 33:37]
    node _T_494 = mux(_T_73, UInt<1>("h0"), _T_493) @[Lookup.scala 33:37]
    node _T_495 = mux(_T_71, UInt<1>("h0"), _T_494) @[Lookup.scala 33:37]
    node _T_496 = mux(_T_69, UInt<1>("h0"), _T_495) @[Lookup.scala 33:37]
    node _T_497 = mux(_T_67, UInt<1>("h0"), _T_496) @[Lookup.scala 33:37]
    node _T_498 = mux(_T_65, UInt<1>("h0"), _T_497) @[Lookup.scala 33:37]
    node _T_499 = mux(_T_63, UInt<1>("h0"), _T_498) @[Lookup.scala 33:37]
    node _T_500 = mux(_T_61, UInt<1>("h0"), _T_499) @[Lookup.scala 33:37]
    node _T_501 = mux(_T_59, UInt<1>("h0"), _T_500) @[Lookup.scala 33:37]
    node _T_502 = mux(_T_57, UInt<1>("h0"), _T_501) @[Lookup.scala 33:37]
    node _T_503 = mux(_T_55, UInt<1>("h0"), _T_502) @[Lookup.scala 33:37]
    node _T_504 = mux(_T_53, UInt<1>("h0"), _T_503) @[Lookup.scala 33:37]
    node _T_505 = mux(_T_51, UInt<1>("h0"), _T_504) @[Lookup.scala 33:37]
    node _T_506 = mux(_T_49, UInt<1>("h0"), _T_505) @[Lookup.scala 33:37]
    node _T_507 = mux(_T_47, UInt<1>("h0"), _T_506) @[Lookup.scala 33:37]
    node _T_508 = mux(_T_45, UInt<1>("h0"), _T_507) @[Lookup.scala 33:37]
    node _T_509 = mux(_T_43, UInt<1>("h0"), _T_508) @[Lookup.scala 33:37]
    node _T_510 = mux(_T_41, UInt<1>("h0"), _T_509) @[Lookup.scala 33:37]
    node _T_511 = mux(_T_39, UInt<1>("h0"), _T_510) @[Lookup.scala 33:37]
    node _T_512 = mux(_T_37, UInt<1>("h0"), _T_511) @[Lookup.scala 33:37]
    node _T_513 = mux(_T_35, UInt<1>("h0"), _T_512) @[Lookup.scala 33:37]
    node _T_514 = mux(_T_33, UInt<1>("h0"), _T_513) @[Lookup.scala 33:37]
    node _T_515 = mux(_T_31, UInt<1>("h0"), _T_514) @[Lookup.scala 33:37]
    node _T_516 = mux(_T_29, UInt<1>("h0"), _T_515) @[Lookup.scala 33:37]
    node _T_517 = mux(_T_27, UInt<1>("h0"), _T_516) @[Lookup.scala 33:37]
    node _T_518 = mux(_T_25, UInt<1>("h0"), _T_517) @[Lookup.scala 33:37]
    node _T_519 = mux(_T_23, UInt<1>("h0"), _T_518) @[Lookup.scala 33:37]
    node _T_520 = mux(_T_21, UInt<1>("h0"), _T_519) @[Lookup.scala 33:37]
    node _T_521 = mux(_T_19, UInt<1>("h0"), _T_520) @[Lookup.scala 33:37]
    node _T_522 = mux(_T_17, UInt<1>("h0"), _T_521) @[Lookup.scala 33:37]
    node _T_523 = mux(_T_15, UInt<1>("h1"), _T_522) @[Lookup.scala 33:37]
    node _T_524 = mux(_T_13, UInt<1>("h1"), _T_523) @[Lookup.scala 33:37]
    node _T_525 = mux(_T_11, UInt<1>("h1"), _T_524) @[Lookup.scala 33:37]
    node _T_526 = mux(_T_9, UInt<1>("h1"), _T_525) @[Lookup.scala 33:37]
    node _T_527 = mux(_T_7, UInt<1>("h1"), _T_526) @[Lookup.scala 33:37]
    node _T_528 = mux(_T_5, UInt<1>("h1"), _T_527) @[Lookup.scala 33:37]
    node _T_529 = mux(_T_3, UInt<1>("h1"), _T_528) @[Lookup.scala 33:37]
    node cs0_4 = mux(_T_1, UInt<1>("h1"), _T_529) @[Lookup.scala 33:37]
    node _T_530 = mux(_T_97, UInt<1>("h0"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_531 = mux(_T_95, UInt<1>("h0"), _T_530) @[Lookup.scala 33:37]
    node _T_532 = mux(_T_93, UInt<1>("h0"), _T_531) @[Lookup.scala 33:37]
    node _T_533 = mux(_T_91, UInt<1>("h0"), _T_532) @[Lookup.scala 33:37]
    node _T_534 = mux(_T_89, UInt<1>("h0"), _T_533) @[Lookup.scala 33:37]
    node _T_535 = mux(_T_87, UInt<1>("h0"), _T_534) @[Lookup.scala 33:37]
    node _T_536 = mux(_T_85, UInt<1>("h0"), _T_535) @[Lookup.scala 33:37]
    node _T_537 = mux(_T_83, UInt<1>("h0"), _T_536) @[Lookup.scala 33:37]
    node _T_538 = mux(_T_81, UInt<1>("h0"), _T_537) @[Lookup.scala 33:37]
    node _T_539 = mux(_T_79, UInt<1>("h0"), _T_538) @[Lookup.scala 33:37]
    node _T_540 = mux(_T_77, UInt<1>("h0"), _T_539) @[Lookup.scala 33:37]
    node _T_541 = mux(_T_75, UInt<1>("h0"), _T_540) @[Lookup.scala 33:37]
    node _T_542 = mux(_T_73, UInt<1>("h0"), _T_541) @[Lookup.scala 33:37]
    node _T_543 = mux(_T_71, UInt<1>("h0"), _T_542) @[Lookup.scala 33:37]
    node _T_544 = mux(_T_69, UInt<1>("h0"), _T_543) @[Lookup.scala 33:37]
    node _T_545 = mux(_T_67, UInt<1>("h0"), _T_544) @[Lookup.scala 33:37]
    node _T_546 = mux(_T_65, UInt<1>("h0"), _T_545) @[Lookup.scala 33:37]
    node _T_547 = mux(_T_63, UInt<1>("h0"), _T_546) @[Lookup.scala 33:37]
    node _T_548 = mux(_T_61, UInt<1>("h0"), _T_547) @[Lookup.scala 33:37]
    node _T_549 = mux(_T_59, UInt<1>("h0"), _T_548) @[Lookup.scala 33:37]
    node _T_550 = mux(_T_57, UInt<1>("h0"), _T_549) @[Lookup.scala 33:37]
    node _T_551 = mux(_T_55, UInt<1>("h0"), _T_550) @[Lookup.scala 33:37]
    node _T_552 = mux(_T_53, UInt<1>("h0"), _T_551) @[Lookup.scala 33:37]
    node _T_553 = mux(_T_51, UInt<1>("h0"), _T_552) @[Lookup.scala 33:37]
    node _T_554 = mux(_T_49, UInt<1>("h0"), _T_553) @[Lookup.scala 33:37]
    node _T_555 = mux(_T_47, UInt<1>("h0"), _T_554) @[Lookup.scala 33:37]
    node _T_556 = mux(_T_45, UInt<1>("h0"), _T_555) @[Lookup.scala 33:37]
    node _T_557 = mux(_T_43, UInt<1>("h0"), _T_556) @[Lookup.scala 33:37]
    node _T_558 = mux(_T_41, UInt<1>("h0"), _T_557) @[Lookup.scala 33:37]
    node _T_559 = mux(_T_39, UInt<1>("h0"), _T_558) @[Lookup.scala 33:37]
    node _T_560 = mux(_T_37, UInt<1>("h0"), _T_559) @[Lookup.scala 33:37]
    node _T_561 = mux(_T_35, UInt<1>("h0"), _T_560) @[Lookup.scala 33:37]
    node _T_562 = mux(_T_33, UInt<1>("h0"), _T_561) @[Lookup.scala 33:37]
    node _T_563 = mux(_T_31, UInt<1>("h0"), _T_562) @[Lookup.scala 33:37]
    node _T_564 = mux(_T_29, UInt<1>("h0"), _T_563) @[Lookup.scala 33:37]
    node _T_565 = mux(_T_27, UInt<1>("h0"), _T_564) @[Lookup.scala 33:37]
    node _T_566 = mux(_T_25, UInt<1>("h0"), _T_565) @[Lookup.scala 33:37]
    node _T_567 = mux(_T_23, UInt<1>("h0"), _T_566) @[Lookup.scala 33:37]
    node _T_568 = mux(_T_21, UInt<1>("h0"), _T_567) @[Lookup.scala 33:37]
    node _T_569 = mux(_T_19, UInt<1>("h0"), _T_568) @[Lookup.scala 33:37]
    node _T_570 = mux(_T_17, UInt<1>("h0"), _T_569) @[Lookup.scala 33:37]
    node _T_571 = mux(_T_15, UInt<1>("h1"), _T_570) @[Lookup.scala 33:37]
    node _T_572 = mux(_T_13, UInt<1>("h1"), _T_571) @[Lookup.scala 33:37]
    node _T_573 = mux(_T_11, UInt<1>("h1"), _T_572) @[Lookup.scala 33:37]
    node _T_574 = mux(_T_9, UInt<1>("h0"), _T_573) @[Lookup.scala 33:37]
    node _T_575 = mux(_T_7, UInt<1>("h0"), _T_574) @[Lookup.scala 33:37]
    node _T_576 = mux(_T_5, UInt<1>("h0"), _T_575) @[Lookup.scala 33:37]
    node _T_577 = mux(_T_3, UInt<1>("h0"), _T_576) @[Lookup.scala 33:37]
    node cs0_5 = mux(_T_1, UInt<1>("h0"), _T_577) @[Lookup.scala 33:37]
    node _T_578 = mux(_T_97, UInt<3>("h0"), UInt<3>("h0")) @[Lookup.scala 33:37]
    node _T_579 = mux(_T_95, UInt<3>("h0"), _T_578) @[Lookup.scala 33:37]
    node _T_580 = mux(_T_93, UInt<3>("h0"), _T_579) @[Lookup.scala 33:37]
    node _T_581 = mux(_T_91, UInt<3>("h0"), _T_580) @[Lookup.scala 33:37]
    node _T_582 = mux(_T_89, UInt<3>("h0"), _T_581) @[Lookup.scala 33:37]
    node _T_583 = mux(_T_87, UInt<3>("h0"), _T_582) @[Lookup.scala 33:37]
    node _T_584 = mux(_T_85, UInt<3>("h0"), _T_583) @[Lookup.scala 33:37]
    node _T_585 = mux(_T_83, UInt<3>("h0"), _T_584) @[Lookup.scala 33:37]
    node _T_586 = mux(_T_81, UInt<3>("h0"), _T_585) @[Lookup.scala 33:37]
    node _T_587 = mux(_T_79, UInt<3>("h0"), _T_586) @[Lookup.scala 33:37]
    node _T_588 = mux(_T_77, UInt<3>("h0"), _T_587) @[Lookup.scala 33:37]
    node _T_589 = mux(_T_75, UInt<3>("h0"), _T_588) @[Lookup.scala 33:37]
    node _T_590 = mux(_T_73, UInt<3>("h0"), _T_589) @[Lookup.scala 33:37]
    node _T_591 = mux(_T_71, UInt<3>("h0"), _T_590) @[Lookup.scala 33:37]
    node _T_592 = mux(_T_69, UInt<3>("h0"), _T_591) @[Lookup.scala 33:37]
    node _T_593 = mux(_T_67, UInt<3>("h0"), _T_592) @[Lookup.scala 33:37]
    node _T_594 = mux(_T_65, UInt<3>("h0"), _T_593) @[Lookup.scala 33:37]
    node _T_595 = mux(_T_63, UInt<3>("h0"), _T_594) @[Lookup.scala 33:37]
    node _T_596 = mux(_T_61, UInt<3>("h0"), _T_595) @[Lookup.scala 33:37]
    node _T_597 = mux(_T_59, UInt<3>("h0"), _T_596) @[Lookup.scala 33:37]
    node _T_598 = mux(_T_57, UInt<3>("h0"), _T_597) @[Lookup.scala 33:37]
    node _T_599 = mux(_T_55, UInt<3>("h0"), _T_598) @[Lookup.scala 33:37]
    node _T_600 = mux(_T_53, UInt<3>("h0"), _T_599) @[Lookup.scala 33:37]
    node _T_601 = mux(_T_51, UInt<3>("h0"), _T_600) @[Lookup.scala 33:37]
    node _T_602 = mux(_T_49, UInt<3>("h0"), _T_601) @[Lookup.scala 33:37]
    node _T_603 = mux(_T_47, UInt<3>("h0"), _T_602) @[Lookup.scala 33:37]
    node _T_604 = mux(_T_45, UInt<3>("h0"), _T_603) @[Lookup.scala 33:37]
    node _T_605 = mux(_T_43, UInt<3>("h0"), _T_604) @[Lookup.scala 33:37]
    node _T_606 = mux(_T_41, UInt<3>("h0"), _T_605) @[Lookup.scala 33:37]
    node _T_607 = mux(_T_39, UInt<3>("h0"), _T_606) @[Lookup.scala 33:37]
    node _T_608 = mux(_T_37, UInt<3>("h0"), _T_607) @[Lookup.scala 33:37]
    node _T_609 = mux(_T_35, UInt<3>("h0"), _T_608) @[Lookup.scala 33:37]
    node _T_610 = mux(_T_33, UInt<3>("h0"), _T_609) @[Lookup.scala 33:37]
    node _T_611 = mux(_T_31, UInt<3>("h0"), _T_610) @[Lookup.scala 33:37]
    node _T_612 = mux(_T_29, UInt<3>("h0"), _T_611) @[Lookup.scala 33:37]
    node _T_613 = mux(_T_27, UInt<3>("h0"), _T_612) @[Lookup.scala 33:37]
    node _T_614 = mux(_T_25, UInt<3>("h0"), _T_613) @[Lookup.scala 33:37]
    node _T_615 = mux(_T_23, UInt<3>("h0"), _T_614) @[Lookup.scala 33:37]
    node _T_616 = mux(_T_21, UInt<3>("h0"), _T_615) @[Lookup.scala 33:37]
    node _T_617 = mux(_T_19, UInt<3>("h0"), _T_616) @[Lookup.scala 33:37]
    node _T_618 = mux(_T_17, UInt<3>("h0"), _T_617) @[Lookup.scala 33:37]
    node _T_619 = mux(_T_15, UInt<3>("h2"), _T_618) @[Lookup.scala 33:37]
    node _T_620 = mux(_T_13, UInt<3>("h1"), _T_619) @[Lookup.scala 33:37]
    node _T_621 = mux(_T_11, UInt<3>("h3"), _T_620) @[Lookup.scala 33:37]
    node _T_622 = mux(_T_9, UInt<3>("h6"), _T_621) @[Lookup.scala 33:37]
    node _T_623 = mux(_T_7, UInt<3>("h2"), _T_622) @[Lookup.scala 33:37]
    node _T_624 = mux(_T_5, UInt<3>("h5"), _T_623) @[Lookup.scala 33:37]
    node _T_625 = mux(_T_3, UInt<3>("h1"), _T_624) @[Lookup.scala 33:37]
    node cs0_6 = mux(_T_1, UInt<3>("h3"), _T_625) @[Lookup.scala 33:37]
    node _T_626 = mux(_T_97, UInt<3>("h0"), UInt<3>("h0")) @[Lookup.scala 33:37]
    node _T_627 = mux(_T_95, UInt<3>("h0"), _T_626) @[Lookup.scala 33:37]
    node _T_628 = mux(_T_93, UInt<3>("h0"), _T_627) @[Lookup.scala 33:37]
    node _T_629 = mux(_T_91, UInt<3>("h4"), _T_628) @[Lookup.scala 33:37]
    node _T_630 = mux(_T_89, UInt<3>("h4"), _T_629) @[Lookup.scala 33:37]
    node _T_631 = mux(_T_87, UInt<3>("h4"), _T_630) @[Lookup.scala 33:37]
    node _T_632 = mux(_T_85, UInt<3>("h3"), _T_631) @[Lookup.scala 33:37]
    node _T_633 = mux(_T_83, UInt<3>("h2"), _T_632) @[Lookup.scala 33:37]
    node _T_634 = mux(_T_81, UInt<3>("h1"), _T_633) @[Lookup.scala 33:37]
    node _T_635 = mux(_T_79, UInt<3>("h3"), _T_634) @[Lookup.scala 33:37]
    node _T_636 = mux(_T_77, UInt<3>("h2"), _T_635) @[Lookup.scala 33:37]
    node _T_637 = mux(_T_75, UInt<3>("h1"), _T_636) @[Lookup.scala 33:37]
    node _T_638 = mux(_T_73, UInt<3>("h0"), _T_637) @[Lookup.scala 33:37]
    node _T_639 = mux(_T_71, UInt<3>("h0"), _T_638) @[Lookup.scala 33:37]
    node _T_640 = mux(_T_69, UInt<3>("h0"), _T_639) @[Lookup.scala 33:37]
    node _T_641 = mux(_T_67, UInt<3>("h0"), _T_640) @[Lookup.scala 33:37]
    node _T_642 = mux(_T_65, UInt<3>("h0"), _T_641) @[Lookup.scala 33:37]
    node _T_643 = mux(_T_63, UInt<3>("h0"), _T_642) @[Lookup.scala 33:37]
    node _T_644 = mux(_T_61, UInt<3>("h0"), _T_643) @[Lookup.scala 33:37]
    node _T_645 = mux(_T_59, UInt<3>("h0"), _T_644) @[Lookup.scala 33:37]
    node _T_646 = mux(_T_57, UInt<3>("h0"), _T_645) @[Lookup.scala 33:37]
    node _T_647 = mux(_T_55, UInt<3>("h0"), _T_646) @[Lookup.scala 33:37]
    node _T_648 = mux(_T_53, UInt<3>("h0"), _T_647) @[Lookup.scala 33:37]
    node _T_649 = mux(_T_51, UInt<3>("h0"), _T_648) @[Lookup.scala 33:37]
    node _T_650 = mux(_T_49, UInt<3>("h0"), _T_649) @[Lookup.scala 33:37]
    node _T_651 = mux(_T_47, UInt<3>("h0"), _T_650) @[Lookup.scala 33:37]
    node _T_652 = mux(_T_45, UInt<3>("h0"), _T_651) @[Lookup.scala 33:37]
    node _T_653 = mux(_T_43, UInt<3>("h0"), _T_652) @[Lookup.scala 33:37]
    node _T_654 = mux(_T_41, UInt<3>("h0"), _T_653) @[Lookup.scala 33:37]
    node _T_655 = mux(_T_39, UInt<3>("h0"), _T_654) @[Lookup.scala 33:37]
    node _T_656 = mux(_T_37, UInt<3>("h0"), _T_655) @[Lookup.scala 33:37]
    node _T_657 = mux(_T_35, UInt<3>("h0"), _T_656) @[Lookup.scala 33:37]
    node _T_658 = mux(_T_33, UInt<3>("h0"), _T_657) @[Lookup.scala 33:37]
    node _T_659 = mux(_T_31, UInt<3>("h0"), _T_658) @[Lookup.scala 33:37]
    node _T_660 = mux(_T_29, UInt<3>("h0"), _T_659) @[Lookup.scala 33:37]
    node _T_661 = mux(_T_27, UInt<3>("h0"), _T_660) @[Lookup.scala 33:37]
    node _T_662 = mux(_T_25, UInt<3>("h0"), _T_661) @[Lookup.scala 33:37]
    node _T_663 = mux(_T_23, UInt<3>("h0"), _T_662) @[Lookup.scala 33:37]
    node _T_664 = mux(_T_21, UInt<3>("h0"), _T_663) @[Lookup.scala 33:37]
    node _T_665 = mux(_T_19, UInt<3>("h0"), _T_664) @[Lookup.scala 33:37]
    node _T_666 = mux(_T_17, UInt<3>("h0"), _T_665) @[Lookup.scala 33:37]
    node _T_667 = mux(_T_15, UInt<3>("h0"), _T_666) @[Lookup.scala 33:37]
    node _T_668 = mux(_T_13, UInt<3>("h0"), _T_667) @[Lookup.scala 33:37]
    node _T_669 = mux(_T_11, UInt<3>("h0"), _T_668) @[Lookup.scala 33:37]
    node _T_670 = mux(_T_9, UInt<3>("h0"), _T_669) @[Lookup.scala 33:37]
    node _T_671 = mux(_T_7, UInt<3>("h0"), _T_670) @[Lookup.scala 33:37]
    node _T_672 = mux(_T_5, UInt<3>("h0"), _T_671) @[Lookup.scala 33:37]
    node _T_673 = mux(_T_3, UInt<3>("h0"), _T_672) @[Lookup.scala 33:37]
    node cs0_7 = mux(_T_1, UInt<3>("h0"), _T_673) @[Lookup.scala 33:37]
    node _T_674 = eq(io_dat_branComOut_br_eq, UInt<1>("h0")) @[Cpath.scala 120:20]
    node _T_675 = mux(_T_674, UInt<3>("h1"), UInt<3>("h0")) @[Cpath.scala 120:19]
    node _T_676 = mux(io_dat_branComOut_br_eq, UInt<3>("h1"), UInt<3>("h0")) @[Cpath.scala 121:19]
    node _T_677 = eq(io_dat_branComOut_br_lt, UInt<1>("h0")) @[Cpath.scala 122:20]
    node _T_678 = mux(_T_677, UInt<3>("h1"), UInt<3>("h0")) @[Cpath.scala 122:19]
    node _T_679 = eq(io_dat_branComOut_br_ltu, UInt<1>("h0")) @[Cpath.scala 123:20]
    node _T_680 = mux(_T_679, UInt<3>("h1"), UInt<3>("h0")) @[Cpath.scala 123:19]
    node _T_681 = mux(io_dat_branComOut_br_lt, UInt<3>("h1"), UInt<3>("h0")) @[Cpath.scala 124:19]
    node _T_682 = mux(io_dat_branComOut_br_ltu, UInt<3>("h1"), UInt<3>("h0")) @[Cpath.scala 125:19]
    node _T_683 = eq(UInt<4>("h0"), cs_br_type) @[Mux.scala 80:60]
    node _T_684 = mux(_T_683, UInt<3>("h0"), UInt<3>("h2")) @[Mux.scala 80:57]
    node _T_685 = eq(UInt<4>("h7"), cs_br_type) @[Mux.scala 80:60]
    node _T_686 = mux(_T_685, UInt<3>("h1"), _T_684) @[Mux.scala 80:57]
    node _T_687 = eq(UInt<4>("h1"), cs_br_type) @[Mux.scala 80:60]
    node _T_688 = mux(_T_687, _T_675, _T_686) @[Mux.scala 80:57]
    node _T_689 = eq(UInt<4>("h2"), cs_br_type) @[Mux.scala 80:60]
    node _T_690 = mux(_T_689, _T_676, _T_688) @[Mux.scala 80:57]
    node _T_691 = eq(UInt<4>("h3"), cs_br_type) @[Mux.scala 80:60]
    node _T_692 = mux(_T_691, _T_678, _T_690) @[Mux.scala 80:57]
    node _T_693 = eq(UInt<4>("h4"), cs_br_type) @[Mux.scala 80:60]
    node _T_694 = mux(_T_693, _T_680, _T_692) @[Mux.scala 80:57]
    node _T_695 = eq(UInt<4>("h5"), cs_br_type) @[Mux.scala 80:60]
    node _T_696 = mux(_T_695, _T_681, _T_694) @[Mux.scala 80:57]
    node _T_697 = eq(UInt<4>("h6"), cs_br_type) @[Mux.scala 80:60]
    node _T_698 = mux(_T_697, _T_682, _T_696) @[Mux.scala 80:57]
    node _T_699 = eq(UInt<4>("h7"), cs_br_type) @[Mux.scala 80:60]
    node _T_700 = mux(_T_699, UInt<3>("h1"), _T_698) @[Mux.scala 80:57]
    node _T_701 = eq(UInt<4>("h8"), cs_br_type) @[Mux.scala 80:60]
    node ctrl_pc_sel = mux(_T_701, UInt<3>("h1"), _T_700) @[Mux.scala 80:57]
    node stall = eq(io_imem_resp_valid, UInt<1>("h0")) @[Cpath.scala 129:15]
    io_ctl_stall <= stall @[Cpath.scala 132:16]
    io_ctl_pc_sel <= ctrl_pc_sel @[Cpath.scala 139:18]
    io_ctl_op1_sel <= cs_op1_sel @[Cpath.scala 133:18]
    io_ctl_op2_sel <= cs_op2_sel @[Cpath.scala 134:18]
    io_ctl_imm_sel <= cs0_0 @[Cpath.scala 135:18]
    io_ctl_alu_fun <= cs0_1 @[Cpath.scala 136:18]
    io_ctl_wb_sel <= cs0_2 @[Cpath.scala 137:18]
    io_ctl_rf_wen <= cs0_3 @[Cpath.scala 138:18]
    io_dmem_men <= cs0_4 @[Cpath.scala 151:15]
    io_dmem_fcn <= cs0_5 @[Cpath.scala 152:15]
    io_imem_req_valid <= UInt<1>("h1") @[Cpath.scala 145:21]
    io_imem_req_bits_addr is invalid
    io_imem_req_bits_wdata is invalid
    io_imem_req_bits_fcn <= UInt<1>("h0") @[Cpath.scala 146:24]
    io_imem_req_bits_typ <= UInt<3>("h7") @[Cpath.scala 147:24]

  module Core :
    input clock : Clock
    input reset : UInt<1>
    input io_imem_req_ready : UInt<1>
    output io_imem_req_valid : UInt<1>
    output io_imem_req_bits_addr : UInt<32>
    output io_imem_req_bits_wdata : UInt<32>
    output io_imem_req_bits_fcn : UInt<1>
    output io_imem_req_bits_typ : UInt<3>
    input io_imem_resp_valid : UInt<1>
    input io_imem_resp_bits_rdata : UInt<32>
    output io_dmem_dpath_addr : UInt<32>
    output io_dmem_dpath_wdata : UInt<32>
    input io_dmem_dpath_rdata : UInt<32>
    output io_dmem_cpath_men : UInt<1>
    output io_dmem_cpath_fcn : UInt<2>
    input io_dmem_led_out : UInt<32>
    output io_debug_out : UInt<32>

    inst Dpath of Dpath @[Core.scala 21:21]
    inst Cpath of CtlPath @[Core.scala 22:21]
    io_imem_req_valid <= Dpath.io_imem_req_valid @[Core.scala 35:11]
    io_imem_req_bits_addr <= Dpath.io_imem_req_bits_addr @[Core.scala 35:11]
    io_imem_req_bits_wdata <= Dpath.io_imem_req_bits_wdata @[Core.scala 35:11]
    io_imem_req_bits_fcn <= Dpath.io_imem_req_bits_fcn @[Core.scala 35:11]
    io_imem_req_bits_typ <= Dpath.io_imem_req_bits_typ @[Core.scala 35:11]
    io_dmem_dpath_addr <= Dpath.io_dmem_addr @[Core.scala 38:17]
    io_dmem_dpath_wdata <= Dpath.io_dmem_wdata @[Core.scala 38:17]
    io_dmem_cpath_men <= Cpath.io_dmem_men @[Core.scala 32:17]
    io_dmem_cpath_fcn <= Cpath.io_dmem_fcn @[Core.scala 32:17]
    io_debug_out <= Dpath.io_debug_out @[Core.scala 25:16]
    Dpath.clock <= clock
    Dpath.reset <= reset
    Dpath.io_imem_req_ready <= io_imem_req_ready @[Core.scala 35:11]
    Dpath.io_imem_resp_valid <= io_imem_resp_valid @[Core.scala 35:11]
    Dpath.io_imem_resp_bits_rdata <= io_imem_resp_bits_rdata @[Core.scala 35:11]
    Dpath.io_dmem_rdata <= io_dmem_dpath_rdata @[Core.scala 38:17]
    Dpath.io_ctl_stall <= Cpath.io_ctl_stall @[Core.scala 28:16]
    Dpath.io_ctl_pc_sel <= Cpath.io_ctl_pc_sel @[Core.scala 28:16]
    Dpath.io_ctl_op1_sel <= Cpath.io_ctl_op1_sel @[Core.scala 28:16]
    Dpath.io_ctl_op2_sel <= Cpath.io_ctl_op2_sel @[Core.scala 28:16]
    Dpath.io_ctl_imm_sel <= Cpath.io_ctl_imm_sel @[Core.scala 28:16]
    Dpath.io_ctl_alu_fun <= Cpath.io_ctl_alu_fun @[Core.scala 28:16]
    Dpath.io_ctl_wb_sel <= Cpath.io_ctl_wb_sel @[Core.scala 28:16]
    Dpath.io_ctl_rf_wen <= Cpath.io_ctl_rf_wen @[Core.scala 28:16]
    Cpath.clock <= clock
    Cpath.reset <= reset
    Cpath.io_dat_inst <= Dpath.io_dat_inst @[Core.scala 29:16]
    Cpath.io_dat_branComOut_br_eq <= Dpath.io_dat_branComOut_br_eq @[Core.scala 29:16]
    Cpath.io_dat_branComOut_br_lt <= Dpath.io_dat_branComOut_br_lt @[Core.scala 29:16]
    Cpath.io_dat_branComOut_br_ltu <= Dpath.io_dat_branComOut_br_ltu @[Core.scala 29:16]
    Cpath.io_dat_csr_eret <= Dpath.io_dat_csr_eret @[Core.scala 29:16]
    Cpath.io_imem_req_ready <= io_imem_req_ready @[Core.scala 34:11]
    Cpath.io_imem_resp_valid <= io_imem_resp_valid @[Core.scala 34:11]
    Cpath.io_imem_resp_bits_rdata <= io_imem_resp_bits_rdata @[Core.scala 34:11]

  module InstructionMemory :
    input clock : Clock
    input reset : UInt<1>
    output io_mport_req_ready : UInt<1>
    input io_mport_req_valid : UInt<1>
    input io_mport_req_bits_addr : UInt<32>
    input io_mport_req_bits_wdata : UInt<32>
    input io_mport_req_bits_fcn : UInt<1>
    input io_mport_req_bits_typ : UInt<3>
    output io_mport_resp_valid : UInt<1>
    output io_mport_resp_bits_rdata : UInt<32>
    output io_d_write_req_ready : UInt<1>
    input io_d_write_req_valid : UInt<1>
    input io_d_write_req_bits_addr : UInt<32>
    input io_d_write_req_bits_wdata : UInt<32>
    input io_d_write_req_bits_fcn : UInt<1>
    input io_d_write_req_bits_typ : UInt<3>
    output io_d_write_resp_valid : UInt<1>
    output io_d_write_resp_bits_rdata : UInt<32>

    mem memory : @[InstructionMemory.scala 18:19]
      data-type => UInt<32>
      depth => 9000
      read-latency => 0
      write-latency => 1
      reader => io_mport_resp_bits_rdata_MPORT
      writer => MPORT
      read-under-write => undefined
    node _T = bits(io_d_write_req_bits_addr, 13, 0)
    node _T_1 = eq(io_d_write_req_valid, UInt<1>("h0")) @[InstructionMemory.scala 35:14]
    node _io_mport_resp_bits_rdata_T = bits(io_mport_req_bits_addr, 13, 0) @[InstructionMemory.scala 36:39]
    node _GEN_0 = validif(_T_1, _io_mport_resp_bits_rdata_T) @[InstructionMemory.scala 35:36 InstructionMemory.scala 36:39]
    node _GEN_1 = validif(_T_1, clock) @[InstructionMemory.scala 35:36 InstructionMemory.scala 36:39]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[InstructionMemory.scala 35:36 InstructionMemory.scala 36:39 InstructionMemory.scala 18:19]
    node _GEN_3 = validif(_T_1, memory.io_mport_resp_bits_rdata_MPORT.data) @[InstructionMemory.scala 35:36 InstructionMemory.scala 36:30]
    node _GEN_4 = validif(_T_1, UInt<1>("h1")) @[InstructionMemory.scala 35:36 InstructionMemory.scala 37:25]
    node _GEN_5 = mux(_T_1, UInt<1>("h0"), UInt<1>("h1")) @[InstructionMemory.scala 35:36 InstructionMemory.scala 38:24 InstructionMemory.scala 41:24]
    node _GEN_6 = validif(io_d_write_req_valid, _T) @[InstructionMemory.scala 30:29]
    node _GEN_7 = validif(io_d_write_req_valid, clock) @[InstructionMemory.scala 30:29]
    node _GEN_8 = mux(io_d_write_req_valid, UInt<1>("h1"), UInt<1>("h0")) @[InstructionMemory.scala 30:29 InstructionMemory.scala 18:19]
    node _GEN_9 = validif(io_d_write_req_valid, UInt<1>("h1")) @[InstructionMemory.scala 30:29]
    node _GEN_10 = validif(io_d_write_req_valid, io_d_write_req_bits_wdata) @[InstructionMemory.scala 30:29]
    node _GEN_11 = mux(io_d_write_req_valid, UInt<1>("h0"), _GEN_4) @[InstructionMemory.scala 30:29 InstructionMemory.scala 32:25]
    node _GEN_12 = mux(io_d_write_req_valid, UInt<1>("h0"), _GEN_5) @[InstructionMemory.scala 30:29 InstructionMemory.scala 33:24]
    node _GEN_13 = validif(eq(io_d_write_req_valid, UInt<1>("h0")), _GEN_0) @[InstructionMemory.scala 30:29]
    node _GEN_14 = validif(eq(io_d_write_req_valid, UInt<1>("h0")), _GEN_1) @[InstructionMemory.scala 30:29]
    node _GEN_15 = mux(io_d_write_req_valid, UInt<1>("h0"), _GEN_2) @[InstructionMemory.scala 30:29 InstructionMemory.scala 18:19]
    node _GEN_16 = validif(eq(io_d_write_req_valid, UInt<1>("h0")), _GEN_3) @[InstructionMemory.scala 30:29]
    io_mport_req_ready <= _GEN_12
    io_mport_resp_valid <= _GEN_11
    io_mport_resp_bits_rdata <= _GEN_16
    io_d_write_req_ready is invalid
    io_d_write_resp_valid is invalid
    io_d_write_resp_bits_rdata is invalid
    memory.io_mport_resp_bits_rdata_MPORT.addr <= _GEN_13
    memory.io_mport_resp_bits_rdata_MPORT.en <= _GEN_15
    memory.io_mport_resp_bits_rdata_MPORT.clk <= _GEN_14
    memory.MPORT.addr <= _GEN_6
    memory.MPORT.en <= _GEN_8
    memory.MPORT.clk <= _GEN_7
    memory.MPORT.data <= _GEN_10
    memory.MPORT.mask <= _GEN_9

  module DataMemory :
    input clock : Clock
    input reset : UInt<1>
    input io_dpath_addr : UInt<32>
    input io_dpath_wdata : UInt<32>
    output io_dpath_rdata : UInt<32>
    input io_cpath_men : UInt<1>
    input io_cpath_fcn : UInt<2>
    output io_led_out : UInt<32>

    mem memory : @[DataMemory.scala 32:19]
      data-type => UInt<32>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_dpath_rdata_MPORT
      reader => io_led_out_MPORT
      writer => MPORT
      read-under-write => undefined
    node _T = eq(UInt<1>("h0"), io_cpath_fcn) @[Conditional.scala 37:30]
    node _io_dpath_rdata_T = bits(io_dpath_addr, 7, 0) @[DataMemory.scala 36:31]
    node _T_1 = eq(UInt<1>("h1"), io_cpath_fcn) @[Conditional.scala 37:30]
    node _T_2 = bits(io_dpath_addr, 7, 0)
    node _GEN_0 = validif(_T_1, _T_2) @[Conditional.scala 39:67]
    node _GEN_1 = validif(_T_1, clock) @[Conditional.scala 39:67]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 DataMemory.scala 32:19]
    node _GEN_3 = validif(_T_1, UInt<1>("h1")) @[Conditional.scala 39:67]
    node _GEN_4 = validif(_T_1, io_dpath_wdata) @[Conditional.scala 39:67]
    node _GEN_5 = validif(_T, _io_dpath_rdata_T) @[Conditional.scala 40:58 DataMemory.scala 36:31]
    node _GEN_6 = validif(_T, clock) @[Conditional.scala 40:58 DataMemory.scala 36:31]
    node _GEN_7 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 DataMemory.scala 36:31 DataMemory.scala 32:19]
    node _GEN_8 = validif(_T, memory.io_dpath_rdata_MPORT.data) @[Conditional.scala 40:58 DataMemory.scala 36:22]
    node _GEN_9 = validif(eq(_T, UInt<1>("h0")), _GEN_0) @[Conditional.scala 40:58]
    node _GEN_10 = validif(eq(_T, UInt<1>("h0")), _GEN_1) @[Conditional.scala 40:58]
    node _GEN_11 = mux(_T, UInt<1>("h0"), _GEN_2) @[Conditional.scala 40:58 DataMemory.scala 32:19]
    node _GEN_12 = validif(eq(_T, UInt<1>("h0")), _GEN_3) @[Conditional.scala 40:58]
    node _GEN_13 = validif(eq(_T, UInt<1>("h0")), _GEN_4) @[Conditional.scala 40:58]
    io_dpath_rdata <= _GEN_8
    io_led_out <= memory.io_led_out_MPORT.data @[DataMemory.scala 45:14]
    memory.io_dpath_rdata_MPORT.addr <= _GEN_5
    memory.io_dpath_rdata_MPORT.en <= _GEN_7
    memory.io_dpath_rdata_MPORT.clk <= _GEN_6
    memory.io_led_out_MPORT.addr <= UInt<8>("h0") @[DataMemory.scala 45:23]
    memory.io_led_out_MPORT.en <= UInt<1>("h1") @[DataMemory.scala 45:23]
    memory.io_led_out_MPORT.clk <= clock @[DataMemory.scala 45:23]
    memory.MPORT.addr <= _GEN_9
    memory.MPORT.en <= _GEN_11
    memory.MPORT.clk <= _GEN_10
    memory.MPORT.data <= _GEN_13
    memory.MPORT.mask <= _GEN_12

  module Tile :
    input clock : Clock
    input reset : UInt<1>
    output io_led_out : UInt<32>
    output io_d_imem_req_ready : UInt<1>
    input io_d_imem_req_valid : UInt<1>
    input io_d_imem_req_bits_addr : UInt<32>
    input io_d_imem_req_bits_wdata : UInt<32>
    input io_d_imem_req_bits_fcn : UInt<1>
    input io_d_imem_req_bits_typ : UInt<3>
    output io_d_imem_resp_valid : UInt<1>
    output io_d_imem_resp_bits_rdata : UInt<32>
    output io_debug_out : UInt<32>

    inst Core of Core @[Tile.scala 18:20]
    inst InstructionMemory of InstructionMemory @[Tile.scala 19:33]
    inst DataMemory of DataMemory @[Tile.scala 20:27]
    io_led_out <= DataMemory.io_led_out @[Tile.scala 34:14]
    io_d_imem_req_ready <= InstructionMemory.io_d_write_req_ready @[Tile.scala 23:32]
    io_d_imem_resp_valid <= InstructionMemory.io_d_write_resp_valid @[Tile.scala 23:32]
    io_d_imem_resp_bits_rdata <= InstructionMemory.io_d_write_resp_bits_rdata @[Tile.scala 23:32]
    io_debug_out <= Core.io_debug_out @[Tile.scala 31:16]
    Core.clock <= clock
    Core.reset <= reset
    Core.io_imem_req_ready <= InstructionMemory.io_mport_req_ready @[Tile.scala 26:16]
    Core.io_imem_resp_valid <= InstructionMemory.io_mport_resp_valid @[Tile.scala 26:16]
    Core.io_imem_resp_bits_rdata <= InstructionMemory.io_mport_resp_bits_rdata @[Tile.scala 26:16]
    Core.io_dmem_dpath_rdata <= DataMemory.io_dpath_rdata @[Tile.scala 28:16]
    Core.io_dmem_led_out <= DataMemory.io_led_out @[Tile.scala 28:16]
    InstructionMemory.clock <= clock
    InstructionMemory.reset <= reset
    InstructionMemory.io_mport_req_valid <= Core.io_imem_req_valid @[Tile.scala 26:16]
    InstructionMemory.io_mport_req_bits_addr <= Core.io_imem_req_bits_addr @[Tile.scala 26:16]
    InstructionMemory.io_mport_req_bits_wdata <= Core.io_imem_req_bits_wdata @[Tile.scala 26:16]
    InstructionMemory.io_mport_req_bits_fcn <= Core.io_imem_req_bits_fcn @[Tile.scala 26:16]
    InstructionMemory.io_mport_req_bits_typ <= Core.io_imem_req_bits_typ @[Tile.scala 26:16]
    InstructionMemory.io_d_write_req_valid <= io_d_imem_req_valid @[Tile.scala 23:32]
    InstructionMemory.io_d_write_req_bits_addr <= io_d_imem_req_bits_addr @[Tile.scala 23:32]
    InstructionMemory.io_d_write_req_bits_wdata <= io_d_imem_req_bits_wdata @[Tile.scala 23:32]
    InstructionMemory.io_d_write_req_bits_fcn <= io_d_imem_req_bits_fcn @[Tile.scala 23:32]
    InstructionMemory.io_d_write_req_bits_typ <= io_d_imem_req_bits_typ @[Tile.scala 23:32]
    DataMemory.clock <= clock
    DataMemory.reset <= reset
    DataMemory.io_dpath_addr <= Core.io_dmem_dpath_addr @[Tile.scala 28:16]
    DataMemory.io_dpath_wdata <= Core.io_dmem_dpath_wdata @[Tile.scala 28:16]
    DataMemory.io_cpath_men <= Core.io_dmem_cpath_men @[Tile.scala 28:16]
    DataMemory.io_cpath_fcn <= Core.io_dmem_cpath_fcn @[Tile.scala 28:16]