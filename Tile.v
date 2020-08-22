module ALU(
  input  [31:0] io_op1,
  input  [31:0] io_op2,
  input  [3:0]  io_fun,
  output [31:0] io_out
);
  wire [4:0] alu_shamt = io_op2[4:0]; // @[ALU.scala 17:25]
  wire [31:0] _io_out_T_5 = $signed(io_op1) + $signed(io_op2); // @[ALU.scala 20:58]
  wire [31:0] _io_out_T_11 = $signed(io_op1) - $signed(io_op2); // @[ALU.scala 21:58]
  wire [31:0] _io_out_T_12 = io_op1 & io_op2; // @[ALU.scala 22:24]
  wire [31:0] _io_out_T_13 = io_op1 | io_op2; // @[ALU.scala 23:24]
  wire [31:0] _io_out_T_14 = io_op1 ^ io_op2; // @[ALU.scala 24:24]
  wire  _io_out_T_17 = $signed(io_op1) < $signed(io_op2); // @[ALU.scala 25:33]
  wire  _io_out_T_18 = io_op1 < io_op2; // @[ALU.scala 26:24]
  wire [62:0] _GEN_0 = {{31'd0}, io_op1}; // @[ALU.scala 27:25]
  wire [62:0] _io_out_T_19 = _GEN_0 << alu_shamt; // @[ALU.scala 27:25]
  wire [31:0] _io_out_T_23 = $signed(io_op1) >>> alu_shamt; // @[ALU.scala 28:53]
  wire [31:0] _io_out_T_24 = io_op1 >> alu_shamt; // @[ALU.scala 29:24]
  wire  _io_out_T_25 = 4'h1 == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_26 = _io_out_T_25 ? _io_out_T_5 : 32'h0; // @[Mux.scala 80:57]
  wire  _io_out_T_27 = 4'h2 == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_28 = _io_out_T_27 ? _io_out_T_11 : _io_out_T_26; // @[Mux.scala 80:57]
  wire  _io_out_T_29 = 4'h6 == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_30 = _io_out_T_29 ? _io_out_T_12 : _io_out_T_28; // @[Mux.scala 80:57]
  wire  _io_out_T_31 = 4'h7 == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_32 = _io_out_T_31 ? _io_out_T_13 : _io_out_T_30; // @[Mux.scala 80:57]
  wire  _io_out_T_33 = 4'h8 == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_34 = _io_out_T_33 ? _io_out_T_14 : _io_out_T_32; // @[Mux.scala 80:57]
  wire  _io_out_T_35 = 4'h9 == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_36 = _io_out_T_35 ? {{31'd0}, _io_out_T_17} : _io_out_T_34; // @[Mux.scala 80:57]
  wire  _io_out_T_37 = 4'ha == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_38 = _io_out_T_37 ? {{31'd0}, _io_out_T_18} : _io_out_T_36; // @[Mux.scala 80:57]
  wire  _io_out_T_39 = 4'h3 == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_40 = _io_out_T_39 ? _io_out_T_19[31:0] : _io_out_T_38; // @[Mux.scala 80:57]
  wire  _io_out_T_41 = 4'h5 == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_42 = _io_out_T_41 ? _io_out_T_23 : _io_out_T_40; // @[Mux.scala 80:57]
  wire  _io_out_T_43 = 4'h4 == io_fun; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_44 = _io_out_T_43 ? _io_out_T_24 : _io_out_T_42; // @[Mux.scala 80:57]
  wire  _io_out_T_45 = 4'hb == io_fun; // @[Mux.scala 80:60]
  assign io_out = _io_out_T_45 ? io_op1 : _io_out_T_44; // @[Mux.scala 80:57]
endmodule
module ImmGen(
  input  [31:0] io_inst,
  input  [2:0]  io_imm_sel,
  output [31:0] io_out
);
  wire [19:0] right = io_inst[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [11:0] left = io_inst[31:20]; // @[ImmGen.scala 17:49]
  wire [31:0] imm_i = {right,left}; // @[Cat.scala 29:58]
  wire [6:0] right_left = io_inst[31:25]; // @[ImmGen.scala 18:49]
  wire [4:0] left_1 = io_inst[11:7]; // @[ImmGen.scala 18:65]
  wire [31:0] imm_s = {right,right_left,left_1}; // @[Cat.scala 29:58]
  wire [18:0] right_right_right = io_inst[31] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire  right_right_left = io_inst[7]; // @[ImmGen.scala 19:47]
  wire [3:0] left_right = io_inst[11:8]; // @[ImmGen.scala 19:73]
  wire [31:0] imm_b = {right_right_right,right_right_left,right_left,left_right,1'h0}; // @[Cat.scala 29:58]
  wire [19:0] right_3 = io_inst[31:12]; // @[ImmGen.scala 20:26]
  wire [31:0] imm_u = {right_3,12'h0}; // @[Cat.scala 29:58]
  wire [11:0] right_right_right_1 = io_inst[31] ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  wire [7:0] right_right_left_1 = io_inst[19:12]; // @[ImmGen.scala 21:47]
  wire  right_left_2 = io_inst[20]; // @[ImmGen.scala 21:63]
  wire [9:0] left_right_1 = io_inst[30:21]; // @[ImmGen.scala 21:76]
  wire [31:0] imm_j = {right_right_right_1,right_right_left_1,right_left_2,left_right_1,1'h0}; // @[Cat.scala 29:58]
  wire  _io_out_T_2 = 3'h1 == io_imm_sel; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_3 = _io_out_T_2 ? imm_i : 32'h0; // @[Mux.scala 80:57]
  wire  _io_out_T_4 = 3'h2 == io_imm_sel; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_5 = _io_out_T_4 ? imm_s : _io_out_T_3; // @[Mux.scala 80:57]
  wire  _io_out_T_6 = 3'h5 == io_imm_sel; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_7 = _io_out_T_6 ? imm_b : _io_out_T_5; // @[Mux.scala 80:57]
  wire  _io_out_T_8 = 3'h3 == io_imm_sel; // @[Mux.scala 80:60]
  wire [31:0] _io_out_T_9 = _io_out_T_8 ? imm_u : _io_out_T_7; // @[Mux.scala 80:57]
  wire  _io_out_T_10 = 3'h4 == io_imm_sel; // @[Mux.scala 80:60]
  assign io_out = _io_out_T_10 ? imm_j : _io_out_T_9; // @[Mux.scala 80:57]
endmodule
module RegisterFile(
  input         clock,
  input  [4:0]  io_rs1_addr,
  input  [4:0]  io_rs2_addr,
  output [31:0] io_rs1_data,
  output [31:0] io_rs2_data,
  input  [4:0]  io_waddr,
  input  [31:0] io_wdata,
  input         io_wen
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] regfile [0:31]; // @[RegisterFile.scala 18:20]
  wire [31:0] regfile_io_rs1_data_MPORT_data; // @[RegisterFile.scala 18:20]
  wire [4:0] regfile_io_rs1_data_MPORT_addr; // @[RegisterFile.scala 18:20]
  wire [31:0] regfile_io_rs2_data_MPORT_data; // @[RegisterFile.scala 18:20]
  wire [4:0] regfile_io_rs2_data_MPORT_addr; // @[RegisterFile.scala 18:20]
  wire [31:0] regfile_MPORT_data; // @[RegisterFile.scala 18:20]
  wire [4:0] regfile_MPORT_addr; // @[RegisterFile.scala 18:20]
  wire  regfile_MPORT_mask; // @[RegisterFile.scala 18:20]
  wire  regfile_MPORT_en; // @[RegisterFile.scala 18:20]
  wire  _T = io_waddr != 5'h0; // @[RegisterFile.scala 20:27]
  wire  _io_rs1_data_T = io_rs1_addr != 5'h0; // @[RegisterFile.scala 24:35]
  wire  _io_rs2_data_T = io_rs2_addr != 5'h0; // @[RegisterFile.scala 25:35]
  assign regfile_io_rs1_data_MPORT_addr = io_rs1_addr;
  assign regfile_io_rs1_data_MPORT_data = regfile[regfile_io_rs1_data_MPORT_addr]; // @[RegisterFile.scala 18:20]
  assign regfile_io_rs2_data_MPORT_addr = io_rs2_addr;
  assign regfile_io_rs2_data_MPORT_data = regfile[regfile_io_rs2_data_MPORT_addr]; // @[RegisterFile.scala 18:20]
  assign regfile_MPORT_data = io_wdata;
  assign regfile_MPORT_addr = io_waddr;
  assign regfile_MPORT_mask = 1'h1;
  assign regfile_MPORT_en = io_wen & _T;
  assign io_rs1_data = _io_rs1_data_T ? regfile_io_rs1_data_MPORT_data : 32'h0; // @[RegisterFile.scala 24:21]
  assign io_rs2_data = _io_rs2_data_T ? regfile_io_rs2_data_MPORT_data : 32'h0; // @[RegisterFile.scala 25:21]
  always @(posedge clock) begin
    if(regfile_MPORT_en & regfile_MPORT_mask) begin
      regfile[regfile_MPORT_addr] <= regfile_MPORT_data; // @[RegisterFile.scala 18:20]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BranchComp(
  input  [31:0] io_rs1_data,
  input  [31:0] io_rs2_data,
  output        io_branComOut_br_eq,
  output        io_branComOut_br_lt,
  output        io_branComOut_br_ltu
);
  assign io_branComOut_br_eq = io_rs1_data == io_rs2_data; // @[BranchComp.scala 20:40]
  assign io_branComOut_br_lt = $signed(io_rs1_data) < $signed(io_rs2_data); // @[BranchComp.scala 21:49]
  assign io_branComOut_br_ltu = io_rs1_data < io_rs2_data; // @[BranchComp.scala 22:49]
endmodule
module Dpath(
  input         clock,
  input         reset,
  output [31:0] io_imem_req_bits_addr,
  input         io_imem_resp_valid,
  input  [31:0] io_imem_resp_bits_rdata,
  output [31:0] io_dmem_addr,
  output [31:0] io_dmem_wdata,
  input  [31:0] io_dmem_rdata,
  input         io_ctl_stall,
  input  [2:0]  io_ctl_pc_sel,
  input  [1:0]  io_ctl_op1_sel,
  input  [1:0]  io_ctl_op2_sel,
  input  [2:0]  io_ctl_imm_sel,
  input  [3:0]  io_ctl_alu_fun,
  input  [1:0]  io_ctl_wb_sel,
  input         io_ctl_rf_wen,
  output [31:0] io_dat_inst,
  output        io_dat_branComOut_br_eq,
  output        io_dat_branComOut_br_lt,
  output        io_dat_branComOut_br_ltu
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] ALU_io_op1; // @[Dpath.scala 34:23]
  wire [31:0] ALU_io_op2; // @[Dpath.scala 34:23]
  wire [3:0] ALU_io_fun; // @[Dpath.scala 34:23]
  wire [31:0] ALU_io_out; // @[Dpath.scala 34:23]
  wire [31:0] ImmGen_io_inst; // @[Dpath.scala 35:23]
  wire [2:0] ImmGen_io_imm_sel; // @[Dpath.scala 35:23]
  wire [31:0] ImmGen_io_out; // @[Dpath.scala 35:23]
  wire  RegFile_clock; // @[Dpath.scala 36:23]
  wire [4:0] RegFile_io_rs1_addr; // @[Dpath.scala 36:23]
  wire [4:0] RegFile_io_rs2_addr; // @[Dpath.scala 36:23]
  wire [31:0] RegFile_io_rs1_data; // @[Dpath.scala 36:23]
  wire [31:0] RegFile_io_rs2_data; // @[Dpath.scala 36:23]
  wire [4:0] RegFile_io_waddr; // @[Dpath.scala 36:23]
  wire [31:0] RegFile_io_wdata; // @[Dpath.scala 36:23]
  wire  RegFile_io_wen; // @[Dpath.scala 36:23]
  wire [31:0] BranchComp_io_rs1_data; // @[Dpath.scala 37:26]
  wire [31:0] BranchComp_io_rs2_data; // @[Dpath.scala 37:26]
  wire  BranchComp_io_branComOut_br_eq; // @[Dpath.scala 37:26]
  wire  BranchComp_io_branComOut_br_lt; // @[Dpath.scala 37:26]
  wire  BranchComp_io_branComOut_br_ltu; // @[Dpath.scala 37:26]
  reg [31:0] pc_reg; // @[Dpath.scala 33:24]
  wire [31:0] inst = io_imem_resp_valid ? io_imem_resp_bits_rdata : 32'h4033; // @[Dpath.scala 49:17]
  wire  _ALU_io_op1_T = io_ctl_op1_sel == 2'h0; // @[Dpath.scala 66:35]
  wire [31:0] _ALU_io_op2_T_1 = RegFile_io_rs2_data; // @[Mux.scala 80:57]
  wire  _ALU_io_op2_T_2 = 2'h1 == io_ctl_op2_sel; // @[Mux.scala 80:60]
  wire [31:0] _RegFile_io_wdata_T_1 = pc_reg + 32'h4; // @[Dpath.scala 86:23]
  wire [31:0] _RegFile_io_wdata_T_3 = ALU_io_out; // @[Mux.scala 80:57]
  wire  _RegFile_io_wdata_T_4 = 2'h2 == io_ctl_wb_sel; // @[Mux.scala 80:60]
  wire [31:0] _RegFile_io_wdata_T_5 = _RegFile_io_wdata_T_4 ? _RegFile_io_wdata_T_1 : _RegFile_io_wdata_T_3; // @[Mux.scala 80:57]
  wire  _RegFile_io_wdata_T_6 = 2'h1 == io_ctl_wb_sel; // @[Mux.scala 80:60]
  wire  _pc_next_T = 3'h0 == io_ctl_pc_sel; // @[Mux.scala 80:60]
  wire  _pc_next_T_2 = 3'h1 == io_ctl_pc_sel; // @[Mux.scala 80:60]
  wire  _T = ~io_ctl_stall; // @[Dpath.scala 97:8]
  wire  _T_4 = ~reset; // @[Dpath.scala 108:11]
  ALU ALU ( // @[Dpath.scala 34:23]
    .io_op1(ALU_io_op1),
    .io_op2(ALU_io_op2),
    .io_fun(ALU_io_fun),
    .io_out(ALU_io_out)
  );
  ImmGen ImmGen ( // @[Dpath.scala 35:23]
    .io_inst(ImmGen_io_inst),
    .io_imm_sel(ImmGen_io_imm_sel),
    .io_out(ImmGen_io_out)
  );
  RegisterFile RegFile ( // @[Dpath.scala 36:23]
    .clock(RegFile_clock),
    .io_rs1_addr(RegFile_io_rs1_addr),
    .io_rs2_addr(RegFile_io_rs2_addr),
    .io_rs1_data(RegFile_io_rs1_data),
    .io_rs2_data(RegFile_io_rs2_data),
    .io_waddr(RegFile_io_waddr),
    .io_wdata(RegFile_io_wdata),
    .io_wen(RegFile_io_wen)
  );
  BranchComp BranchComp ( // @[Dpath.scala 37:26]
    .io_rs1_data(BranchComp_io_rs1_data),
    .io_rs2_data(BranchComp_io_rs2_data),
    .io_branComOut_br_eq(BranchComp_io_branComOut_br_eq),
    .io_branComOut_br_lt(BranchComp_io_branComOut_br_lt),
    .io_branComOut_br_ltu(BranchComp_io_branComOut_br_ltu)
  );
  assign io_imem_req_bits_addr = pc_reg; // @[Dpath.scala 47:25]
  assign io_dmem_addr = ALU_io_out; // @[Dpath.scala 77:17]
  assign io_dmem_wdata = RegFile_io_rs2_data; // @[Dpath.scala 78:17]
  assign io_dat_inst = io_imem_resp_valid ? io_imem_resp_bits_rdata : 32'h4033; // @[Dpath.scala 49:17]
  assign io_dat_branComOut_br_eq = BranchComp_io_branComOut_br_eq; // @[Dpath.scala 74:21]
  assign io_dat_branComOut_br_lt = BranchComp_io_branComOut_br_lt; // @[Dpath.scala 74:21]
  assign io_dat_branComOut_br_ltu = BranchComp_io_branComOut_br_ltu; // @[Dpath.scala 74:21]
  assign ALU_io_op1 = _ALU_io_op1_T ? RegFile_io_rs1_data : pc_reg; // @[Dpath.scala 66:20]
  assign ALU_io_op2 = _ALU_io_op2_T_2 ? ImmGen_io_out : _ALU_io_op2_T_1; // @[Mux.scala 80:57]
  assign ALU_io_fun = io_ctl_alu_fun; // @[Dpath.scala 65:14]
  assign ImmGen_io_inst = io_imem_resp_valid ? io_imem_resp_bits_rdata : 32'h4033; // @[Dpath.scala 49:17]
  assign ImmGen_io_imm_sel = io_ctl_imm_sel; // @[Dpath.scala 58:21]
  assign RegFile_clock = clock;
  assign RegFile_io_rs1_addr = io_imem_resp_bits_rdata[19:15]; // @[Dpath.scala 53:49]
  assign RegFile_io_rs2_addr = io_imem_resp_bits_rdata[24:20]; // @[Dpath.scala 54:49]
  assign RegFile_io_waddr = inst[11:7]; // @[Dpath.scala 82:28]
  assign RegFile_io_wdata = _RegFile_io_wdata_T_6 ? io_dmem_rdata : _RegFile_io_wdata_T_5; // @[Mux.scala 80:57]
  assign RegFile_io_wen = io_ctl_rf_wen; // @[Dpath.scala 83:21]
  assign BranchComp_io_rs1_data = RegFile_io_rs1_data; // @[Dpath.scala 61:26]
  assign BranchComp_io_rs2_data = RegFile_io_rs2_data; // @[Dpath.scala 62:26]
  always @(posedge clock) begin
    if (reset) begin // @[Dpath.scala 33:24]
      pc_reg <= 32'h0; // @[Dpath.scala 33:24]
    end else if (_T) begin // @[Dpath.scala 97:22]
      if (_pc_next_T_2) begin // @[Mux.scala 80:57]
        pc_reg <= _RegFile_io_wdata_T_3;
      end else if (_pc_next_T) begin // @[Mux.scala 80:57]
        pc_reg <= _RegFile_io_wdata_T_1;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & _T_4) begin
          $fwrite(32'h80000002,"pc=[%d] IMEM=[0x%x] inst=[0x%x] ImmgenOut=[0x%x] rs1=[%d] rs2=[%d] rd=[%d] ALUOUT=[%d] DMEMaddr=[%d] DMEMdataw=[%d] DMEMdatar=[%d] ",pc_reg,io_imem_resp_bits_rdata,inst,ImmGen_io_out,ALU_io_op1,ALU_io_op2,io_imem_resp_bits_rdata[11:7],ALU_io_out,io_dmem_addr,io_dmem_wdata,io_dmem_rdata); // @[Dpath.scala 108:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc_reg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CtlPath(
  input         clock,
  input         reset,
  input  [31:0] io_dat_inst,
  input         io_dat_branComOut_br_eq,
  input         io_dat_branComOut_br_lt,
  input         io_dat_branComOut_br_ltu,
  output        io_ctl_stall,
  output [2:0]  io_ctl_pc_sel,
  output [1:0]  io_ctl_op1_sel,
  output [1:0]  io_ctl_op2_sel,
  output [2:0]  io_ctl_imm_sel,
  output [3:0]  io_ctl_alu_fun,
  output [1:0]  io_ctl_wb_sel,
  output        io_ctl_rf_wen,
  output [1:0]  io_dmem_fcn,
  input         io_imem_resp_valid
);
  wire [31:0] _T = io_dat_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _T_1 = 32'h2003 == _T; // @[Lookup.scala 31:38]
  wire  _T_3 = 32'h3 == _T; // @[Lookup.scala 31:38]
  wire  _T_5 = 32'h4003 == _T; // @[Lookup.scala 31:38]
  wire  _T_7 = 32'h1003 == _T; // @[Lookup.scala 31:38]
  wire  _T_9 = 32'h5003 == _T; // @[Lookup.scala 31:38]
  wire  _T_11 = 32'h2023 == _T; // @[Lookup.scala 31:38]
  wire  _T_13 = 32'h23 == _T; // @[Lookup.scala 31:38]
  wire  _T_15 = 32'h1023 == _T; // @[Lookup.scala 31:38]
  wire [31:0] _T_16 = io_dat_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _T_17 = 32'h17 == _T_16; // @[Lookup.scala 31:38]
  wire  _T_19 = 32'h37 == _T_16; // @[Lookup.scala 31:38]
  wire  _T_21 = 32'h13 == _T; // @[Lookup.scala 31:38]
  wire  _T_23 = 32'h7013 == _T; // @[Lookup.scala 31:38]
  wire  _T_25 = 32'h6013 == _T; // @[Lookup.scala 31:38]
  wire  _T_27 = 32'h4013 == _T; // @[Lookup.scala 31:38]
  wire  _T_29 = 32'h2013 == _T; // @[Lookup.scala 31:38]
  wire  _T_31 = 32'h3013 == _T; // @[Lookup.scala 31:38]
  wire [31:0] _T_32 = io_dat_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _T_33 = 32'h1013 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_35 = 32'h40005013 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_37 = 32'h5013 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_39 = 32'h1033 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_41 = 32'h33 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_43 = 32'h40000033 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_45 = 32'h2033 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_47 = 32'h3033 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_49 = 32'h7033 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_51 = 32'h6033 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_53 = 32'h4033 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_55 = 32'h40005033 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_57 = 32'h5033 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_59 = 32'h6f == _T_16; // @[Lookup.scala 31:38]
  wire  _T_61 = 32'h67 == _T; // @[Lookup.scala 31:38]
  wire  _T_63 = 32'h63 == _T; // @[Lookup.scala 31:38]
  wire  _T_65 = 32'h1063 == _T; // @[Lookup.scala 31:38]
  wire  _T_67 = 32'h5063 == _T; // @[Lookup.scala 31:38]
  wire  _T_69 = 32'h7063 == _T; // @[Lookup.scala 31:38]
  wire  _T_71 = 32'h4063 == _T; // @[Lookup.scala 31:38]
  wire  _T_73 = 32'h6063 == _T; // @[Lookup.scala 31:38]
  wire  _T_75 = 32'h5073 == _T; // @[Lookup.scala 31:38]
  wire  _T_77 = 32'h6073 == _T; // @[Lookup.scala 31:38]
  wire  _T_79 = 32'h7073 == _T; // @[Lookup.scala 31:38]
  wire  _T_81 = 32'h1073 == _T; // @[Lookup.scala 31:38]
  wire  _T_83 = 32'h2073 == _T; // @[Lookup.scala 31:38]
  wire  _T_85 = 32'h3073 == _T; // @[Lookup.scala 31:38]
  wire [3:0] _T_158 = _T_73 ? 4'h6 : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _T_159 = _T_71 ? 4'h5 : _T_158; // @[Lookup.scala 33:37]
  wire [3:0] _T_160 = _T_69 ? 4'h4 : _T_159; // @[Lookup.scala 33:37]
  wire [3:0] _T_161 = _T_67 ? 4'h3 : _T_160; // @[Lookup.scala 33:37]
  wire [3:0] _T_162 = _T_65 ? 4'h1 : _T_161; // @[Lookup.scala 33:37]
  wire [3:0] _T_163 = _T_63 ? 4'h2 : _T_162; // @[Lookup.scala 33:37]
  wire [3:0] _T_164 = _T_61 ? 4'h8 : _T_163; // @[Lookup.scala 33:37]
  wire [3:0] _T_165 = _T_59 ? 4'h7 : _T_164; // @[Lookup.scala 33:37]
  wire [3:0] _T_166 = _T_57 ? 4'h0 : _T_165; // @[Lookup.scala 33:37]
  wire [3:0] _T_167 = _T_55 ? 4'h0 : _T_166; // @[Lookup.scala 33:37]
  wire [3:0] _T_168 = _T_53 ? 4'h0 : _T_167; // @[Lookup.scala 33:37]
  wire [3:0] _T_169 = _T_51 ? 4'h0 : _T_168; // @[Lookup.scala 33:37]
  wire [3:0] _T_170 = _T_49 ? 4'h0 : _T_169; // @[Lookup.scala 33:37]
  wire [3:0] _T_171 = _T_47 ? 4'h0 : _T_170; // @[Lookup.scala 33:37]
  wire [3:0] _T_172 = _T_45 ? 4'h0 : _T_171; // @[Lookup.scala 33:37]
  wire [3:0] _T_173 = _T_43 ? 4'h0 : _T_172; // @[Lookup.scala 33:37]
  wire [3:0] _T_174 = _T_41 ? 4'h0 : _T_173; // @[Lookup.scala 33:37]
  wire [3:0] _T_175 = _T_39 ? 4'h0 : _T_174; // @[Lookup.scala 33:37]
  wire [3:0] _T_176 = _T_37 ? 4'h0 : _T_175; // @[Lookup.scala 33:37]
  wire [3:0] _T_177 = _T_35 ? 4'h0 : _T_176; // @[Lookup.scala 33:37]
  wire [3:0] _T_178 = _T_33 ? 4'h0 : _T_177; // @[Lookup.scala 33:37]
  wire [3:0] _T_179 = _T_31 ? 4'h0 : _T_178; // @[Lookup.scala 33:37]
  wire [3:0] _T_180 = _T_29 ? 4'h0 : _T_179; // @[Lookup.scala 33:37]
  wire [3:0] _T_181 = _T_27 ? 4'h0 : _T_180; // @[Lookup.scala 33:37]
  wire [3:0] _T_182 = _T_25 ? 4'h0 : _T_181; // @[Lookup.scala 33:37]
  wire [3:0] _T_183 = _T_23 ? 4'h0 : _T_182; // @[Lookup.scala 33:37]
  wire [3:0] _T_184 = _T_21 ? 4'h0 : _T_183; // @[Lookup.scala 33:37]
  wire [3:0] _T_185 = _T_19 ? 4'h0 : _T_184; // @[Lookup.scala 33:37]
  wire [3:0] _T_186 = _T_17 ? 4'h0 : _T_185; // @[Lookup.scala 33:37]
  wire [3:0] _T_187 = _T_15 ? 4'h0 : _T_186; // @[Lookup.scala 33:37]
  wire [3:0] _T_188 = _T_13 ? 4'h0 : _T_187; // @[Lookup.scala 33:37]
  wire [3:0] _T_189 = _T_11 ? 4'h0 : _T_188; // @[Lookup.scala 33:37]
  wire [3:0] _T_190 = _T_9 ? 4'h0 : _T_189; // @[Lookup.scala 33:37]
  wire [3:0] _T_191 = _T_7 ? 4'h0 : _T_190; // @[Lookup.scala 33:37]
  wire [3:0] _T_192 = _T_5 ? 4'h0 : _T_191; // @[Lookup.scala 33:37]
  wire [3:0] _T_193 = _T_3 ? 4'h0 : _T_192; // @[Lookup.scala 33:37]
  wire [3:0] cs_br_type = _T_1 ? 4'h0 : _T_193; // @[Lookup.scala 33:37]
  wire [1:0] _T_203 = _T_79 ? 2'h2 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_204 = _T_77 ? 2'h2 : _T_203; // @[Lookup.scala 33:37]
  wire [1:0] _T_205 = _T_75 ? 2'h2 : _T_204; // @[Lookup.scala 33:37]
  wire [1:0] _T_206 = _T_73 ? 2'h1 : _T_205; // @[Lookup.scala 33:37]
  wire [1:0] _T_207 = _T_71 ? 2'h1 : _T_206; // @[Lookup.scala 33:37]
  wire [1:0] _T_208 = _T_69 ? 2'h1 : _T_207; // @[Lookup.scala 33:37]
  wire [1:0] _T_209 = _T_67 ? 2'h1 : _T_208; // @[Lookup.scala 33:37]
  wire [1:0] _T_210 = _T_65 ? 2'h1 : _T_209; // @[Lookup.scala 33:37]
  wire [1:0] _T_211 = _T_63 ? 2'h1 : _T_210; // @[Lookup.scala 33:37]
  wire [1:0] _T_212 = _T_61 ? 2'h0 : _T_211; // @[Lookup.scala 33:37]
  wire [1:0] _T_213 = _T_59 ? 2'h1 : _T_212; // @[Lookup.scala 33:37]
  wire [1:0] _T_214 = _T_57 ? 2'h0 : _T_213; // @[Lookup.scala 33:37]
  wire [1:0] _T_215 = _T_55 ? 2'h0 : _T_214; // @[Lookup.scala 33:37]
  wire [1:0] _T_216 = _T_53 ? 2'h0 : _T_215; // @[Lookup.scala 33:37]
  wire [1:0] _T_217 = _T_51 ? 2'h0 : _T_216; // @[Lookup.scala 33:37]
  wire [1:0] _T_218 = _T_49 ? 2'h0 : _T_217; // @[Lookup.scala 33:37]
  wire [1:0] _T_219 = _T_47 ? 2'h0 : _T_218; // @[Lookup.scala 33:37]
  wire [1:0] _T_220 = _T_45 ? 2'h0 : _T_219; // @[Lookup.scala 33:37]
  wire [1:0] _T_221 = _T_43 ? 2'h0 : _T_220; // @[Lookup.scala 33:37]
  wire [1:0] _T_222 = _T_41 ? 2'h0 : _T_221; // @[Lookup.scala 33:37]
  wire [1:0] _T_223 = _T_39 ? 2'h0 : _T_222; // @[Lookup.scala 33:37]
  wire [1:0] _T_224 = _T_37 ? 2'h0 : _T_223; // @[Lookup.scala 33:37]
  wire [1:0] _T_225 = _T_35 ? 2'h0 : _T_224; // @[Lookup.scala 33:37]
  wire [1:0] _T_226 = _T_33 ? 2'h0 : _T_225; // @[Lookup.scala 33:37]
  wire [1:0] _T_227 = _T_31 ? 2'h0 : _T_226; // @[Lookup.scala 33:37]
  wire [1:0] _T_228 = _T_29 ? 2'h0 : _T_227; // @[Lookup.scala 33:37]
  wire [1:0] _T_229 = _T_27 ? 2'h0 : _T_228; // @[Lookup.scala 33:37]
  wire [1:0] _T_230 = _T_25 ? 2'h0 : _T_229; // @[Lookup.scala 33:37]
  wire [1:0] _T_231 = _T_23 ? 2'h0 : _T_230; // @[Lookup.scala 33:37]
  wire [1:0] _T_232 = _T_21 ? 2'h0 : _T_231; // @[Lookup.scala 33:37]
  wire [1:0] _T_233 = _T_19 ? 2'h0 : _T_232; // @[Lookup.scala 33:37]
  wire [1:0] _T_234 = _T_17 ? 2'h1 : _T_233; // @[Lookup.scala 33:37]
  wire [1:0] _T_235 = _T_15 ? 2'h0 : _T_234; // @[Lookup.scala 33:37]
  wire [1:0] _T_236 = _T_13 ? 2'h0 : _T_235; // @[Lookup.scala 33:37]
  wire [1:0] _T_237 = _T_11 ? 2'h0 : _T_236; // @[Lookup.scala 33:37]
  wire [1:0] _T_238 = _T_9 ? 2'h0 : _T_237; // @[Lookup.scala 33:37]
  wire [1:0] _T_239 = _T_7 ? 2'h0 : _T_238; // @[Lookup.scala 33:37]
  wire [1:0] _T_240 = _T_5 ? 2'h0 : _T_239; // @[Lookup.scala 33:37]
  wire [1:0] _T_241 = _T_3 ? 2'h0 : _T_240; // @[Lookup.scala 33:37]
  wire [1:0] _T_254 = _T_73 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_255 = _T_71 ? 2'h1 : _T_254; // @[Lookup.scala 33:37]
  wire [1:0] _T_256 = _T_69 ? 2'h1 : _T_255; // @[Lookup.scala 33:37]
  wire [1:0] _T_257 = _T_67 ? 2'h1 : _T_256; // @[Lookup.scala 33:37]
  wire [1:0] _T_258 = _T_65 ? 2'h1 : _T_257; // @[Lookup.scala 33:37]
  wire [1:0] _T_259 = _T_63 ? 2'h1 : _T_258; // @[Lookup.scala 33:37]
  wire [1:0] _T_260 = _T_61 ? 2'h1 : _T_259; // @[Lookup.scala 33:37]
  wire [1:0] _T_261 = _T_59 ? 2'h1 : _T_260; // @[Lookup.scala 33:37]
  wire [1:0] _T_262 = _T_57 ? 2'h0 : _T_261; // @[Lookup.scala 33:37]
  wire [1:0] _T_263 = _T_55 ? 2'h0 : _T_262; // @[Lookup.scala 33:37]
  wire [1:0] _T_264 = _T_53 ? 2'h0 : _T_263; // @[Lookup.scala 33:37]
  wire [1:0] _T_265 = _T_51 ? 2'h0 : _T_264; // @[Lookup.scala 33:37]
  wire [1:0] _T_266 = _T_49 ? 2'h0 : _T_265; // @[Lookup.scala 33:37]
  wire [1:0] _T_267 = _T_47 ? 2'h0 : _T_266; // @[Lookup.scala 33:37]
  wire [1:0] _T_268 = _T_45 ? 2'h0 : _T_267; // @[Lookup.scala 33:37]
  wire [1:0] _T_269 = _T_43 ? 2'h0 : _T_268; // @[Lookup.scala 33:37]
  wire [1:0] _T_270 = _T_41 ? 2'h0 : _T_269; // @[Lookup.scala 33:37]
  wire [1:0] _T_271 = _T_39 ? 2'h0 : _T_270; // @[Lookup.scala 33:37]
  wire [1:0] _T_272 = _T_37 ? 2'h1 : _T_271; // @[Lookup.scala 33:37]
  wire [1:0] _T_273 = _T_35 ? 2'h1 : _T_272; // @[Lookup.scala 33:37]
  wire [1:0] _T_274 = _T_33 ? 2'h1 : _T_273; // @[Lookup.scala 33:37]
  wire [1:0] _T_275 = _T_31 ? 2'h1 : _T_274; // @[Lookup.scala 33:37]
  wire [1:0] _T_276 = _T_29 ? 2'h1 : _T_275; // @[Lookup.scala 33:37]
  wire [1:0] _T_277 = _T_27 ? 2'h1 : _T_276; // @[Lookup.scala 33:37]
  wire [1:0] _T_278 = _T_25 ? 2'h1 : _T_277; // @[Lookup.scala 33:37]
  wire [1:0] _T_279 = _T_23 ? 2'h1 : _T_278; // @[Lookup.scala 33:37]
  wire [1:0] _T_280 = _T_21 ? 2'h1 : _T_279; // @[Lookup.scala 33:37]
  wire [1:0] _T_281 = _T_19 ? 2'h1 : _T_280; // @[Lookup.scala 33:37]
  wire [1:0] _T_282 = _T_17 ? 2'h1 : _T_281; // @[Lookup.scala 33:37]
  wire [1:0] _T_283 = _T_15 ? 2'h1 : _T_282; // @[Lookup.scala 33:37]
  wire [1:0] _T_284 = _T_13 ? 2'h1 : _T_283; // @[Lookup.scala 33:37]
  wire [1:0] _T_285 = _T_11 ? 2'h1 : _T_284; // @[Lookup.scala 33:37]
  wire [1:0] _T_286 = _T_9 ? 2'h1 : _T_285; // @[Lookup.scala 33:37]
  wire [1:0] _T_287 = _T_7 ? 2'h1 : _T_286; // @[Lookup.scala 33:37]
  wire [1:0] _T_288 = _T_5 ? 2'h1 : _T_287; // @[Lookup.scala 33:37]
  wire [1:0] _T_289 = _T_3 ? 2'h1 : _T_288; // @[Lookup.scala 33:37]
  wire [2:0] _T_299 = _T_79 ? 3'h6 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _T_300 = _T_77 ? 3'h6 : _T_299; // @[Lookup.scala 33:37]
  wire [2:0] _T_301 = _T_75 ? 3'h6 : _T_300; // @[Lookup.scala 33:37]
  wire [2:0] _T_302 = _T_73 ? 3'h5 : _T_301; // @[Lookup.scala 33:37]
  wire [2:0] _T_303 = _T_71 ? 3'h5 : _T_302; // @[Lookup.scala 33:37]
  wire [2:0] _T_304 = _T_69 ? 3'h5 : _T_303; // @[Lookup.scala 33:37]
  wire [2:0] _T_305 = _T_67 ? 3'h5 : _T_304; // @[Lookup.scala 33:37]
  wire [2:0] _T_306 = _T_65 ? 3'h5 : _T_305; // @[Lookup.scala 33:37]
  wire [2:0] _T_307 = _T_63 ? 3'h5 : _T_306; // @[Lookup.scala 33:37]
  wire [2:0] _T_308 = _T_61 ? 3'h4 : _T_307; // @[Lookup.scala 33:37]
  wire [2:0] _T_309 = _T_59 ? 3'h4 : _T_308; // @[Lookup.scala 33:37]
  wire [2:0] _T_310 = _T_57 ? 3'h0 : _T_309; // @[Lookup.scala 33:37]
  wire [2:0] _T_311 = _T_55 ? 3'h0 : _T_310; // @[Lookup.scala 33:37]
  wire [2:0] _T_312 = _T_53 ? 3'h0 : _T_311; // @[Lookup.scala 33:37]
  wire [2:0] _T_313 = _T_51 ? 3'h0 : _T_312; // @[Lookup.scala 33:37]
  wire [2:0] _T_314 = _T_49 ? 3'h0 : _T_313; // @[Lookup.scala 33:37]
  wire [2:0] _T_315 = _T_47 ? 3'h0 : _T_314; // @[Lookup.scala 33:37]
  wire [2:0] _T_316 = _T_45 ? 3'h0 : _T_315; // @[Lookup.scala 33:37]
  wire [2:0] _T_317 = _T_43 ? 3'h0 : _T_316; // @[Lookup.scala 33:37]
  wire [2:0] _T_318 = _T_41 ? 3'h0 : _T_317; // @[Lookup.scala 33:37]
  wire [2:0] _T_319 = _T_39 ? 3'h0 : _T_318; // @[Lookup.scala 33:37]
  wire [2:0] _T_320 = _T_37 ? 3'h1 : _T_319; // @[Lookup.scala 33:37]
  wire [2:0] _T_321 = _T_35 ? 3'h1 : _T_320; // @[Lookup.scala 33:37]
  wire [2:0] _T_322 = _T_33 ? 3'h1 : _T_321; // @[Lookup.scala 33:37]
  wire [2:0] _T_323 = _T_31 ? 3'h1 : _T_322; // @[Lookup.scala 33:37]
  wire [2:0] _T_324 = _T_29 ? 3'h1 : _T_323; // @[Lookup.scala 33:37]
  wire [2:0] _T_325 = _T_27 ? 3'h1 : _T_324; // @[Lookup.scala 33:37]
  wire [2:0] _T_326 = _T_25 ? 3'h1 : _T_325; // @[Lookup.scala 33:37]
  wire [2:0] _T_327 = _T_23 ? 3'h1 : _T_326; // @[Lookup.scala 33:37]
  wire [2:0] _T_328 = _T_21 ? 3'h1 : _T_327; // @[Lookup.scala 33:37]
  wire [2:0] _T_329 = _T_19 ? 3'h3 : _T_328; // @[Lookup.scala 33:37]
  wire [2:0] _T_330 = _T_17 ? 3'h3 : _T_329; // @[Lookup.scala 33:37]
  wire [2:0] _T_331 = _T_15 ? 3'h2 : _T_330; // @[Lookup.scala 33:37]
  wire [2:0] _T_332 = _T_13 ? 3'h2 : _T_331; // @[Lookup.scala 33:37]
  wire [2:0] _T_333 = _T_11 ? 3'h2 : _T_332; // @[Lookup.scala 33:37]
  wire [2:0] _T_334 = _T_9 ? 3'h1 : _T_333; // @[Lookup.scala 33:37]
  wire [2:0] _T_335 = _T_7 ? 3'h1 : _T_334; // @[Lookup.scala 33:37]
  wire [2:0] _T_336 = _T_5 ? 3'h1 : _T_335; // @[Lookup.scala 33:37]
  wire [2:0] _T_337 = _T_3 ? 3'h1 : _T_336; // @[Lookup.scala 33:37]
  wire [3:0] _T_344 = _T_85 ? 4'hb : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _T_345 = _T_83 ? 4'hb : _T_344; // @[Lookup.scala 33:37]
  wire [3:0] _T_346 = _T_81 ? 4'hb : _T_345; // @[Lookup.scala 33:37]
  wire [3:0] _T_347 = _T_79 ? 4'hb : _T_346; // @[Lookup.scala 33:37]
  wire [3:0] _T_348 = _T_77 ? 4'hb : _T_347; // @[Lookup.scala 33:37]
  wire [3:0] _T_349 = _T_75 ? 4'hb : _T_348; // @[Lookup.scala 33:37]
  wire [3:0] _T_350 = _T_73 ? 4'h1 : _T_349; // @[Lookup.scala 33:37]
  wire [3:0] _T_351 = _T_71 ? 4'h1 : _T_350; // @[Lookup.scala 33:37]
  wire [3:0] _T_352 = _T_69 ? 4'h1 : _T_351; // @[Lookup.scala 33:37]
  wire [3:0] _T_353 = _T_67 ? 4'h1 : _T_352; // @[Lookup.scala 33:37]
  wire [3:0] _T_354 = _T_65 ? 4'h1 : _T_353; // @[Lookup.scala 33:37]
  wire [3:0] _T_355 = _T_63 ? 4'h1 : _T_354; // @[Lookup.scala 33:37]
  wire [3:0] _T_356 = _T_61 ? 4'h1 : _T_355; // @[Lookup.scala 33:37]
  wire [3:0] _T_357 = _T_59 ? 4'h1 : _T_356; // @[Lookup.scala 33:37]
  wire [3:0] _T_358 = _T_57 ? 4'h4 : _T_357; // @[Lookup.scala 33:37]
  wire [3:0] _T_359 = _T_55 ? 4'h5 : _T_358; // @[Lookup.scala 33:37]
  wire [3:0] _T_360 = _T_53 ? 4'h8 : _T_359; // @[Lookup.scala 33:37]
  wire [3:0] _T_361 = _T_51 ? 4'h7 : _T_360; // @[Lookup.scala 33:37]
  wire [3:0] _T_362 = _T_49 ? 4'h6 : _T_361; // @[Lookup.scala 33:37]
  wire [3:0] _T_363 = _T_47 ? 4'ha : _T_362; // @[Lookup.scala 33:37]
  wire [3:0] _T_364 = _T_45 ? 4'h9 : _T_363; // @[Lookup.scala 33:37]
  wire [3:0] _T_365 = _T_43 ? 4'h2 : _T_364; // @[Lookup.scala 33:37]
  wire [3:0] _T_366 = _T_41 ? 4'h1 : _T_365; // @[Lookup.scala 33:37]
  wire [3:0] _T_367 = _T_39 ? 4'h3 : _T_366; // @[Lookup.scala 33:37]
  wire [3:0] _T_368 = _T_37 ? 4'h4 : _T_367; // @[Lookup.scala 33:37]
  wire [3:0] _T_369 = _T_35 ? 4'h5 : _T_368; // @[Lookup.scala 33:37]
  wire [3:0] _T_370 = _T_33 ? 4'h3 : _T_369; // @[Lookup.scala 33:37]
  wire [3:0] _T_371 = _T_31 ? 4'ha : _T_370; // @[Lookup.scala 33:37]
  wire [3:0] _T_372 = _T_29 ? 4'h9 : _T_371; // @[Lookup.scala 33:37]
  wire [3:0] _T_373 = _T_27 ? 4'h8 : _T_372; // @[Lookup.scala 33:37]
  wire [3:0] _T_374 = _T_25 ? 4'h7 : _T_373; // @[Lookup.scala 33:37]
  wire [3:0] _T_375 = _T_23 ? 4'h6 : _T_374; // @[Lookup.scala 33:37]
  wire [3:0] _T_376 = _T_21 ? 4'h1 : _T_375; // @[Lookup.scala 33:37]
  wire [3:0] _T_377 = _T_19 ? 4'hb : _T_376; // @[Lookup.scala 33:37]
  wire [3:0] _T_378 = _T_17 ? 4'h1 : _T_377; // @[Lookup.scala 33:37]
  wire [3:0] _T_379 = _T_15 ? 4'h1 : _T_378; // @[Lookup.scala 33:37]
  wire [3:0] _T_380 = _T_13 ? 4'h1 : _T_379; // @[Lookup.scala 33:37]
  wire [3:0] _T_381 = _T_11 ? 4'h1 : _T_380; // @[Lookup.scala 33:37]
  wire [3:0] _T_382 = _T_9 ? 4'h1 : _T_381; // @[Lookup.scala 33:37]
  wire [3:0] _T_383 = _T_7 ? 4'h1 : _T_382; // @[Lookup.scala 33:37]
  wire [3:0] _T_384 = _T_5 ? 4'h1 : _T_383; // @[Lookup.scala 33:37]
  wire [3:0] _T_385 = _T_3 ? 4'h1 : _T_384; // @[Lookup.scala 33:37]
  wire [1:0] _T_392 = _T_85 ? 2'h3 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_393 = _T_83 ? 2'h3 : _T_392; // @[Lookup.scala 33:37]
  wire [1:0] _T_394 = _T_81 ? 2'h3 : _T_393; // @[Lookup.scala 33:37]
  wire [1:0] _T_395 = _T_79 ? 2'h3 : _T_394; // @[Lookup.scala 33:37]
  wire [1:0] _T_396 = _T_77 ? 2'h3 : _T_395; // @[Lookup.scala 33:37]
  wire [1:0] _T_397 = _T_75 ? 2'h3 : _T_396; // @[Lookup.scala 33:37]
  wire [1:0] _T_398 = _T_73 ? 2'h0 : _T_397; // @[Lookup.scala 33:37]
  wire [1:0] _T_399 = _T_71 ? 2'h0 : _T_398; // @[Lookup.scala 33:37]
  wire [1:0] _T_400 = _T_69 ? 2'h0 : _T_399; // @[Lookup.scala 33:37]
  wire [1:0] _T_401 = _T_67 ? 2'h0 : _T_400; // @[Lookup.scala 33:37]
  wire [1:0] _T_402 = _T_65 ? 2'h0 : _T_401; // @[Lookup.scala 33:37]
  wire [1:0] _T_403 = _T_63 ? 2'h0 : _T_402; // @[Lookup.scala 33:37]
  wire [1:0] _T_404 = _T_61 ? 2'h2 : _T_403; // @[Lookup.scala 33:37]
  wire [1:0] _T_405 = _T_59 ? 2'h2 : _T_404; // @[Lookup.scala 33:37]
  wire [1:0] _T_406 = _T_57 ? 2'h0 : _T_405; // @[Lookup.scala 33:37]
  wire [1:0] _T_407 = _T_55 ? 2'h0 : _T_406; // @[Lookup.scala 33:37]
  wire [1:0] _T_408 = _T_53 ? 2'h0 : _T_407; // @[Lookup.scala 33:37]
  wire [1:0] _T_409 = _T_51 ? 2'h0 : _T_408; // @[Lookup.scala 33:37]
  wire [1:0] _T_410 = _T_49 ? 2'h0 : _T_409; // @[Lookup.scala 33:37]
  wire [1:0] _T_411 = _T_47 ? 2'h0 : _T_410; // @[Lookup.scala 33:37]
  wire [1:0] _T_412 = _T_45 ? 2'h0 : _T_411; // @[Lookup.scala 33:37]
  wire [1:0] _T_413 = _T_43 ? 2'h0 : _T_412; // @[Lookup.scala 33:37]
  wire [1:0] _T_414 = _T_41 ? 2'h0 : _T_413; // @[Lookup.scala 33:37]
  wire [1:0] _T_415 = _T_39 ? 2'h0 : _T_414; // @[Lookup.scala 33:37]
  wire [1:0] _T_416 = _T_37 ? 2'h0 : _T_415; // @[Lookup.scala 33:37]
  wire [1:0] _T_417 = _T_35 ? 2'h0 : _T_416; // @[Lookup.scala 33:37]
  wire [1:0] _T_418 = _T_33 ? 2'h0 : _T_417; // @[Lookup.scala 33:37]
  wire [1:0] _T_419 = _T_31 ? 2'h0 : _T_418; // @[Lookup.scala 33:37]
  wire [1:0] _T_420 = _T_29 ? 2'h0 : _T_419; // @[Lookup.scala 33:37]
  wire [1:0] _T_421 = _T_27 ? 2'h0 : _T_420; // @[Lookup.scala 33:37]
  wire [1:0] _T_422 = _T_25 ? 2'h0 : _T_421; // @[Lookup.scala 33:37]
  wire [1:0] _T_423 = _T_23 ? 2'h0 : _T_422; // @[Lookup.scala 33:37]
  wire [1:0] _T_424 = _T_21 ? 2'h0 : _T_423; // @[Lookup.scala 33:37]
  wire [1:0] _T_425 = _T_19 ? 2'h0 : _T_424; // @[Lookup.scala 33:37]
  wire [1:0] _T_426 = _T_17 ? 2'h0 : _T_425; // @[Lookup.scala 33:37]
  wire [1:0] _T_427 = _T_15 ? 2'h0 : _T_426; // @[Lookup.scala 33:37]
  wire [1:0] _T_428 = _T_13 ? 2'h0 : _T_427; // @[Lookup.scala 33:37]
  wire [1:0] _T_429 = _T_11 ? 2'h0 : _T_428; // @[Lookup.scala 33:37]
  wire [1:0] _T_430 = _T_9 ? 2'h1 : _T_429; // @[Lookup.scala 33:37]
  wire [1:0] _T_431 = _T_7 ? 2'h1 : _T_430; // @[Lookup.scala 33:37]
  wire [1:0] _T_432 = _T_5 ? 2'h1 : _T_431; // @[Lookup.scala 33:37]
  wire [1:0] _T_433 = _T_3 ? 2'h1 : _T_432; // @[Lookup.scala 33:37]
  wire  _T_441 = _T_83 | _T_85; // @[Lookup.scala 33:37]
  wire  _T_442 = _T_81 | _T_441; // @[Lookup.scala 33:37]
  wire  _T_443 = _T_79 | _T_442; // @[Lookup.scala 33:37]
  wire  _T_444 = _T_77 | _T_443; // @[Lookup.scala 33:37]
  wire  _T_445 = _T_75 | _T_444; // @[Lookup.scala 33:37]
  wire  _T_446 = _T_73 ? 1'h0 : _T_445; // @[Lookup.scala 33:37]
  wire  _T_447 = _T_71 ? 1'h0 : _T_446; // @[Lookup.scala 33:37]
  wire  _T_448 = _T_69 ? 1'h0 : _T_447; // @[Lookup.scala 33:37]
  wire  _T_449 = _T_67 ? 1'h0 : _T_448; // @[Lookup.scala 33:37]
  wire  _T_450 = _T_65 ? 1'h0 : _T_449; // @[Lookup.scala 33:37]
  wire  _T_451 = _T_63 ? 1'h0 : _T_450; // @[Lookup.scala 33:37]
  wire  _T_452 = _T_61 | _T_451; // @[Lookup.scala 33:37]
  wire  _T_453 = _T_59 | _T_452; // @[Lookup.scala 33:37]
  wire  _T_454 = _T_57 | _T_453; // @[Lookup.scala 33:37]
  wire  _T_455 = _T_55 | _T_454; // @[Lookup.scala 33:37]
  wire  _T_456 = _T_53 | _T_455; // @[Lookup.scala 33:37]
  wire  _T_457 = _T_51 | _T_456; // @[Lookup.scala 33:37]
  wire  _T_458 = _T_49 | _T_457; // @[Lookup.scala 33:37]
  wire  _T_459 = _T_47 | _T_458; // @[Lookup.scala 33:37]
  wire  _T_460 = _T_45 | _T_459; // @[Lookup.scala 33:37]
  wire  _T_461 = _T_43 | _T_460; // @[Lookup.scala 33:37]
  wire  _T_462 = _T_41 | _T_461; // @[Lookup.scala 33:37]
  wire  _T_463 = _T_39 | _T_462; // @[Lookup.scala 33:37]
  wire  _T_464 = _T_37 | _T_463; // @[Lookup.scala 33:37]
  wire  _T_465 = _T_35 | _T_464; // @[Lookup.scala 33:37]
  wire  _T_466 = _T_33 | _T_465; // @[Lookup.scala 33:37]
  wire  _T_467 = _T_31 | _T_466; // @[Lookup.scala 33:37]
  wire  _T_468 = _T_29 | _T_467; // @[Lookup.scala 33:37]
  wire  _T_469 = _T_27 | _T_468; // @[Lookup.scala 33:37]
  wire  _T_470 = _T_25 | _T_469; // @[Lookup.scala 33:37]
  wire  _T_471 = _T_23 | _T_470; // @[Lookup.scala 33:37]
  wire  _T_472 = _T_21 | _T_471; // @[Lookup.scala 33:37]
  wire  _T_473 = _T_19 | _T_472; // @[Lookup.scala 33:37]
  wire  _T_474 = _T_17 | _T_473; // @[Lookup.scala 33:37]
  wire  _T_475 = _T_15 ? 1'h0 : _T_474; // @[Lookup.scala 33:37]
  wire  _T_476 = _T_13 ? 1'h0 : _T_475; // @[Lookup.scala 33:37]
  wire  _T_477 = _T_11 ? 1'h0 : _T_476; // @[Lookup.scala 33:37]
  wire  _T_478 = _T_9 | _T_477; // @[Lookup.scala 33:37]
  wire  _T_479 = _T_7 | _T_478; // @[Lookup.scala 33:37]
  wire  _T_480 = _T_5 | _T_479; // @[Lookup.scala 33:37]
  wire  _T_481 = _T_3 | _T_480; // @[Lookup.scala 33:37]
  wire  _T_572 = _T_13 | _T_15; // @[Lookup.scala 33:37]
  wire  _T_573 = _T_11 | _T_572; // @[Lookup.scala 33:37]
  wire  _T_574 = _T_9 ? 1'h0 : _T_573; // @[Lookup.scala 33:37]
  wire  _T_575 = _T_7 ? 1'h0 : _T_574; // @[Lookup.scala 33:37]
  wire  _T_576 = _T_5 ? 1'h0 : _T_575; // @[Lookup.scala 33:37]
  wire  _T_577 = _T_3 ? 1'h0 : _T_576; // @[Lookup.scala 33:37]
  wire  cs0_5 = _T_1 ? 1'h0 : _T_577; // @[Lookup.scala 33:37]
  wire  _T_674 = ~io_dat_branComOut_br_eq; // @[Cpath.scala 120:20]
  wire [2:0] _T_675 = _T_674 ? 3'h1 : 3'h0; // @[Cpath.scala 120:19]
  wire [2:0] _T_676 = io_dat_branComOut_br_eq ? 3'h1 : 3'h0; // @[Cpath.scala 121:19]
  wire  _T_677 = ~io_dat_branComOut_br_lt; // @[Cpath.scala 122:20]
  wire [2:0] _T_678 = _T_677 ? 3'h1 : 3'h0; // @[Cpath.scala 122:19]
  wire  _T_679 = ~io_dat_branComOut_br_ltu; // @[Cpath.scala 123:20]
  wire [2:0] _T_680 = _T_679 ? 3'h1 : 3'h0; // @[Cpath.scala 123:19]
  wire [2:0] _T_681 = io_dat_branComOut_br_lt ? 3'h1 : 3'h0; // @[Cpath.scala 124:19]
  wire [2:0] _T_682 = io_dat_branComOut_br_ltu ? 3'h1 : 3'h0; // @[Cpath.scala 125:19]
  wire  _T_683 = 4'h0 == cs_br_type; // @[Mux.scala 80:60]
  wire [2:0] _T_684 = _T_683 ? 3'h0 : 3'h2; // @[Mux.scala 80:57]
  wire  _T_685 = 4'h7 == cs_br_type; // @[Mux.scala 80:60]
  wire [2:0] _T_686 = _T_685 ? 3'h1 : _T_684; // @[Mux.scala 80:57]
  wire  _T_687 = 4'h1 == cs_br_type; // @[Mux.scala 80:60]
  wire [2:0] _T_688 = _T_687 ? _T_675 : _T_686; // @[Mux.scala 80:57]
  wire  _T_689 = 4'h2 == cs_br_type; // @[Mux.scala 80:60]
  wire [2:0] _T_690 = _T_689 ? _T_676 : _T_688; // @[Mux.scala 80:57]
  wire  _T_691 = 4'h3 == cs_br_type; // @[Mux.scala 80:60]
  wire [2:0] _T_692 = _T_691 ? _T_678 : _T_690; // @[Mux.scala 80:57]
  wire  _T_693 = 4'h4 == cs_br_type; // @[Mux.scala 80:60]
  wire [2:0] _T_694 = _T_693 ? _T_680 : _T_692; // @[Mux.scala 80:57]
  wire  _T_695 = 4'h5 == cs_br_type; // @[Mux.scala 80:60]
  wire [2:0] _T_696 = _T_695 ? _T_681 : _T_694; // @[Mux.scala 80:57]
  wire  _T_697 = 4'h6 == cs_br_type; // @[Mux.scala 80:60]
  wire [2:0] _T_698 = _T_697 ? _T_682 : _T_696; // @[Mux.scala 80:57]
  wire [2:0] _T_700 = _T_685 ? 3'h1 : _T_698; // @[Mux.scala 80:57]
  wire  _T_701 = 4'h8 == cs_br_type; // @[Mux.scala 80:60]
  wire  _T_703 = ~reset; // @[Cpath.scala 154:9]
  assign io_ctl_stall = ~io_imem_resp_valid; // @[Cpath.scala 129:15]
  assign io_ctl_pc_sel = _T_701 ? 3'h1 : _T_700; // @[Mux.scala 80:57]
  assign io_ctl_op1_sel = _T_1 ? 2'h0 : _T_241; // @[Lookup.scala 33:37]
  assign io_ctl_op2_sel = _T_1 ? 2'h1 : _T_289; // @[Lookup.scala 33:37]
  assign io_ctl_imm_sel = _T_1 ? 3'h1 : _T_337; // @[Lookup.scala 33:37]
  assign io_ctl_alu_fun = _T_1 ? 4'h1 : _T_385; // @[Lookup.scala 33:37]
  assign io_ctl_wb_sel = _T_1 ? 2'h1 : _T_433; // @[Lookup.scala 33:37]
  assign io_ctl_rf_wen = _T_1 | _T_481; // @[Lookup.scala 33:37]
  assign io_dmem_fcn = {{1'd0}, cs0_5}; // @[Lookup.scala 33:37]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_703) begin
          $fwrite(32'h80000002,"[%d] ",io_dmem_fcn); // @[Cpath.scala 154:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module Core(
  input         clock,
  input         reset,
  output [31:0] io_imem_req_bits_addr,
  input         io_imem_resp_valid,
  input  [31:0] io_imem_resp_bits_rdata,
  output [31:0] io_dmem_dpath_addr,
  output [31:0] io_dmem_dpath_wdata,
  input  [31:0] io_dmem_dpath_rdata,
  output [1:0]  io_dmem_cpath_fcn
);
  wire  Dpath_clock; // @[Core.scala 20:21]
  wire  Dpath_reset; // @[Core.scala 20:21]
  wire [31:0] Dpath_io_imem_req_bits_addr; // @[Core.scala 20:21]
  wire  Dpath_io_imem_resp_valid; // @[Core.scala 20:21]
  wire [31:0] Dpath_io_imem_resp_bits_rdata; // @[Core.scala 20:21]
  wire [31:0] Dpath_io_dmem_addr; // @[Core.scala 20:21]
  wire [31:0] Dpath_io_dmem_wdata; // @[Core.scala 20:21]
  wire [31:0] Dpath_io_dmem_rdata; // @[Core.scala 20:21]
  wire  Dpath_io_ctl_stall; // @[Core.scala 20:21]
  wire [2:0] Dpath_io_ctl_pc_sel; // @[Core.scala 20:21]
  wire [1:0] Dpath_io_ctl_op1_sel; // @[Core.scala 20:21]
  wire [1:0] Dpath_io_ctl_op2_sel; // @[Core.scala 20:21]
  wire [2:0] Dpath_io_ctl_imm_sel; // @[Core.scala 20:21]
  wire [3:0] Dpath_io_ctl_alu_fun; // @[Core.scala 20:21]
  wire [1:0] Dpath_io_ctl_wb_sel; // @[Core.scala 20:21]
  wire  Dpath_io_ctl_rf_wen; // @[Core.scala 20:21]
  wire [31:0] Dpath_io_dat_inst; // @[Core.scala 20:21]
  wire  Dpath_io_dat_branComOut_br_eq; // @[Core.scala 20:21]
  wire  Dpath_io_dat_branComOut_br_lt; // @[Core.scala 20:21]
  wire  Dpath_io_dat_branComOut_br_ltu; // @[Core.scala 20:21]
  wire  Cpath_clock; // @[Core.scala 21:21]
  wire  Cpath_reset; // @[Core.scala 21:21]
  wire [31:0] Cpath_io_dat_inst; // @[Core.scala 21:21]
  wire  Cpath_io_dat_branComOut_br_eq; // @[Core.scala 21:21]
  wire  Cpath_io_dat_branComOut_br_lt; // @[Core.scala 21:21]
  wire  Cpath_io_dat_branComOut_br_ltu; // @[Core.scala 21:21]
  wire  Cpath_io_ctl_stall; // @[Core.scala 21:21]
  wire [2:0] Cpath_io_ctl_pc_sel; // @[Core.scala 21:21]
  wire [1:0] Cpath_io_ctl_op1_sel; // @[Core.scala 21:21]
  wire [1:0] Cpath_io_ctl_op2_sel; // @[Core.scala 21:21]
  wire [2:0] Cpath_io_ctl_imm_sel; // @[Core.scala 21:21]
  wire [3:0] Cpath_io_ctl_alu_fun; // @[Core.scala 21:21]
  wire [1:0] Cpath_io_ctl_wb_sel; // @[Core.scala 21:21]
  wire  Cpath_io_ctl_rf_wen; // @[Core.scala 21:21]
  wire [1:0] Cpath_io_dmem_fcn; // @[Core.scala 21:21]
  wire  Cpath_io_imem_resp_valid; // @[Core.scala 21:21]
  Dpath Dpath ( // @[Core.scala 20:21]
    .clock(Dpath_clock),
    .reset(Dpath_reset),
    .io_imem_req_bits_addr(Dpath_io_imem_req_bits_addr),
    .io_imem_resp_valid(Dpath_io_imem_resp_valid),
    .io_imem_resp_bits_rdata(Dpath_io_imem_resp_bits_rdata),
    .io_dmem_addr(Dpath_io_dmem_addr),
    .io_dmem_wdata(Dpath_io_dmem_wdata),
    .io_dmem_rdata(Dpath_io_dmem_rdata),
    .io_ctl_stall(Dpath_io_ctl_stall),
    .io_ctl_pc_sel(Dpath_io_ctl_pc_sel),
    .io_ctl_op1_sel(Dpath_io_ctl_op1_sel),
    .io_ctl_op2_sel(Dpath_io_ctl_op2_sel),
    .io_ctl_imm_sel(Dpath_io_ctl_imm_sel),
    .io_ctl_alu_fun(Dpath_io_ctl_alu_fun),
    .io_ctl_wb_sel(Dpath_io_ctl_wb_sel),
    .io_ctl_rf_wen(Dpath_io_ctl_rf_wen),
    .io_dat_inst(Dpath_io_dat_inst),
    .io_dat_branComOut_br_eq(Dpath_io_dat_branComOut_br_eq),
    .io_dat_branComOut_br_lt(Dpath_io_dat_branComOut_br_lt),
    .io_dat_branComOut_br_ltu(Dpath_io_dat_branComOut_br_ltu)
  );
  CtlPath Cpath ( // @[Core.scala 21:21]
    .clock(Cpath_clock),
    .reset(Cpath_reset),
    .io_dat_inst(Cpath_io_dat_inst),
    .io_dat_branComOut_br_eq(Cpath_io_dat_branComOut_br_eq),
    .io_dat_branComOut_br_lt(Cpath_io_dat_branComOut_br_lt),
    .io_dat_branComOut_br_ltu(Cpath_io_dat_branComOut_br_ltu),
    .io_ctl_stall(Cpath_io_ctl_stall),
    .io_ctl_pc_sel(Cpath_io_ctl_pc_sel),
    .io_ctl_op1_sel(Cpath_io_ctl_op1_sel),
    .io_ctl_op2_sel(Cpath_io_ctl_op2_sel),
    .io_ctl_imm_sel(Cpath_io_ctl_imm_sel),
    .io_ctl_alu_fun(Cpath_io_ctl_alu_fun),
    .io_ctl_wb_sel(Cpath_io_ctl_wb_sel),
    .io_ctl_rf_wen(Cpath_io_ctl_rf_wen),
    .io_dmem_fcn(Cpath_io_dmem_fcn),
    .io_imem_resp_valid(Cpath_io_imem_resp_valid)
  );
  assign io_imem_req_bits_addr = Dpath_io_imem_req_bits_addr; // @[Core.scala 31:11]
  assign io_dmem_dpath_addr = Dpath_io_dmem_addr; // @[Core.scala 34:17]
  assign io_dmem_dpath_wdata = Dpath_io_dmem_wdata; // @[Core.scala 34:17]
  assign io_dmem_cpath_fcn = Cpath_io_dmem_fcn; // @[Core.scala 28:17]
  assign Dpath_clock = clock;
  assign Dpath_reset = reset;
  assign Dpath_io_imem_resp_valid = io_imem_resp_valid; // @[Core.scala 31:11]
  assign Dpath_io_imem_resp_bits_rdata = io_imem_resp_bits_rdata; // @[Core.scala 31:11]
  assign Dpath_io_dmem_rdata = io_dmem_dpath_rdata; // @[Core.scala 34:17]
  assign Dpath_io_ctl_stall = Cpath_io_ctl_stall; // @[Core.scala 24:16]
  assign Dpath_io_ctl_pc_sel = Cpath_io_ctl_pc_sel; // @[Core.scala 24:16]
  assign Dpath_io_ctl_op1_sel = Cpath_io_ctl_op1_sel; // @[Core.scala 24:16]
  assign Dpath_io_ctl_op2_sel = Cpath_io_ctl_op2_sel; // @[Core.scala 24:16]
  assign Dpath_io_ctl_imm_sel = Cpath_io_ctl_imm_sel; // @[Core.scala 24:16]
  assign Dpath_io_ctl_alu_fun = Cpath_io_ctl_alu_fun; // @[Core.scala 24:16]
  assign Dpath_io_ctl_wb_sel = Cpath_io_ctl_wb_sel; // @[Core.scala 24:16]
  assign Dpath_io_ctl_rf_wen = Cpath_io_ctl_rf_wen; // @[Core.scala 24:16]
  assign Cpath_clock = clock;
  assign Cpath_reset = reset;
  assign Cpath_io_dat_inst = Dpath_io_dat_inst; // @[Core.scala 25:16]
  assign Cpath_io_dat_branComOut_br_eq = Dpath_io_dat_branComOut_br_eq; // @[Core.scala 25:16]
  assign Cpath_io_dat_branComOut_br_lt = Dpath_io_dat_branComOut_br_lt; // @[Core.scala 25:16]
  assign Cpath_io_dat_branComOut_br_ltu = Dpath_io_dat_branComOut_br_ltu; // @[Core.scala 25:16]
  assign Cpath_io_imem_resp_valid = io_imem_resp_valid; // @[Core.scala 30:11]
endmodule
module InstructionMemory(
  input         clock,
  input  [31:0] io_mport_req_bits_addr,
  output        io_mport_resp_valid,
  output [31:0] io_mport_resp_bits_rdata,
  input         io_d_write_req_valid,
  input  [31:0] io_d_write_req_bits_addr,
  input  [31:0] io_d_write_req_bits_wdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:1023]; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_io_mport_resp_bits_rdata_MPORT_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_io_mport_resp_bits_rdata_MPORT_addr; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_1_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_1_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_1_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_1_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_2_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_2_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_2_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_2_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_3_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_3_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_3_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_3_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_4_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_4_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_4_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_4_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_5_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_5_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_5_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_5_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_6_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_6_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_6_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_6_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_7_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_7_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_7_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_7_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_8_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_8_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_8_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_8_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_9_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_9_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_9_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_9_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_10_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_10_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_10_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_10_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_11_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_11_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_11_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_11_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_12_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_12_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_12_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_12_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_13_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_13_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_13_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_13_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_14_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_14_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_14_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_14_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_15_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_15_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_15_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_15_en; // @[InstructionMemory.scala 18:19]
  wire [31:0] memory_MPORT_16_data; // @[InstructionMemory.scala 18:19]
  wire [9:0] memory_MPORT_16_addr; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_16_mask; // @[InstructionMemory.scala 18:19]
  wire  memory_MPORT_16_en; // @[InstructionMemory.scala 18:19]
  wire  _T_1 = ~io_d_write_req_valid; // @[InstructionMemory.scala 48:14]
  assign memory_io_mport_resp_bits_rdata_MPORT_addr = io_mport_req_bits_addr[9:0];
  assign memory_io_mport_resp_bits_rdata_MPORT_data = memory[memory_io_mport_resp_bits_rdata_MPORT_addr]; // @[InstructionMemory.scala 18:19]
  assign memory_MPORT_data = 32'ha00093;
  assign memory_MPORT_addr = 10'h0;
  assign memory_MPORT_mask = 1'h1;
  assign memory_MPORT_en = 1'h1;
  assign memory_MPORT_1_data = 32'h100113;
  assign memory_MPORT_1_addr = 10'h4;
  assign memory_MPORT_1_mask = 1'h1;
  assign memory_MPORT_1_en = 1'h1;
  assign memory_MPORT_2_data = 32'h114663;
  assign memory_MPORT_2_addr = 10'h8;
  assign memory_MPORT_2_mask = 1'h1;
  assign memory_MPORT_2_en = 1'h1;
  assign memory_MPORT_3_data = 32'h8113;
  assign memory_MPORT_3_addr = 10'hc;
  assign memory_MPORT_3_mask = 1'h1;
  assign memory_MPORT_3_en = 1'h1;
  assign memory_MPORT_4_data = 32'h280006f;
  assign memory_MPORT_4_addr = 10'h10;
  assign memory_MPORT_4_mask = 1'h1;
  assign memory_MPORT_4_en = 1'h1;
  assign memory_MPORT_5_data = 32'h100113;
  assign memory_MPORT_5_addr = 10'h14;
  assign memory_MPORT_5_mask = 1'h1;
  assign memory_MPORT_5_en = 1'h1;
  assign memory_MPORT_6_data = 32'h100193;
  assign memory_MPORT_6_addr = 10'h18;
  assign memory_MPORT_6_mask = 1'h1;
  assign memory_MPORT_6_en = 1'h1;
  assign memory_MPORT_7_data = 32'h200213;
  assign memory_MPORT_7_addr = 10'h1c;
  assign memory_MPORT_7_mask = 1'h1;
  assign memory_MPORT_7_en = 1'h1;
  assign memory_MPORT_8_data = 32'h125c63;
  assign memory_MPORT_8_addr = 10'h20;
  assign memory_MPORT_8_mask = 1'h1;
  assign memory_MPORT_8_en = 1'h1;
  assign memory_MPORT_9_data = 32'h10293;
  assign memory_MPORT_9_addr = 10'h24;
  assign memory_MPORT_9_mask = 1'h1;
  assign memory_MPORT_9_en = 1'h1;
  assign memory_MPORT_10_data = 32'h310133;
  assign memory_MPORT_10_addr = 10'h28;
  assign memory_MPORT_10_mask = 1'h1;
  assign memory_MPORT_10_en = 1'h1;
  assign memory_MPORT_11_data = 32'h28193;
  assign memory_MPORT_11_addr = 10'h2c;
  assign memory_MPORT_11_mask = 1'h1;
  assign memory_MPORT_11_en = 1'h1;
  assign memory_MPORT_12_data = 32'h120213;
  assign memory_MPORT_12_addr = 10'h30;
  assign memory_MPORT_12_mask = 1'h1;
  assign memory_MPORT_12_en = 1'h1;
  assign memory_MPORT_13_data = 32'hfedff06f;
  assign memory_MPORT_13_addr = 10'h34;
  assign memory_MPORT_13_mask = 1'h1;
  assign memory_MPORT_13_en = 1'h1;
  assign memory_MPORT_14_data = 32'h10313;
  assign memory_MPORT_14_addr = 10'h38;
  assign memory_MPORT_14_mask = 1'h1;
  assign memory_MPORT_14_en = 1'h1;
  assign memory_MPORT_15_data = 32'h602023;
  assign memory_MPORT_15_addr = 10'h3c;
  assign memory_MPORT_15_mask = 1'h1;
  assign memory_MPORT_15_en = 1'h1;
  assign memory_MPORT_16_data = io_d_write_req_bits_wdata;
  assign memory_MPORT_16_addr = io_d_write_req_bits_addr[9:0];
  assign memory_MPORT_16_mask = 1'h1;
  assign memory_MPORT_16_en = io_d_write_req_valid;
  assign io_mport_resp_valid = io_d_write_req_valid ? 1'h0 : 1'h1; // @[InstructionMemory.scala 43:29 InstructionMemory.scala 45:25]
  assign io_mport_resp_bits_rdata = memory_io_mport_resp_bits_rdata_MPORT_data; // @[InstructionMemory.scala 48:36 InstructionMemory.scala 49:30]
  always @(posedge clock) begin
    if(memory_MPORT_en & memory_MPORT_mask) begin
      memory[memory_MPORT_addr] <= memory_MPORT_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_1_en & memory_MPORT_1_mask) begin
      memory[memory_MPORT_1_addr] <= memory_MPORT_1_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_2_en & memory_MPORT_2_mask) begin
      memory[memory_MPORT_2_addr] <= memory_MPORT_2_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_3_en & memory_MPORT_3_mask) begin
      memory[memory_MPORT_3_addr] <= memory_MPORT_3_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_4_en & memory_MPORT_4_mask) begin
      memory[memory_MPORT_4_addr] <= memory_MPORT_4_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_5_en & memory_MPORT_5_mask) begin
      memory[memory_MPORT_5_addr] <= memory_MPORT_5_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_6_en & memory_MPORT_6_mask) begin
      memory[memory_MPORT_6_addr] <= memory_MPORT_6_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_7_en & memory_MPORT_7_mask) begin
      memory[memory_MPORT_7_addr] <= memory_MPORT_7_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_8_en & memory_MPORT_8_mask) begin
      memory[memory_MPORT_8_addr] <= memory_MPORT_8_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_9_en & memory_MPORT_9_mask) begin
      memory[memory_MPORT_9_addr] <= memory_MPORT_9_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_10_en & memory_MPORT_10_mask) begin
      memory[memory_MPORT_10_addr] <= memory_MPORT_10_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_11_en & memory_MPORT_11_mask) begin
      memory[memory_MPORT_11_addr] <= memory_MPORT_11_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_12_en & memory_MPORT_12_mask) begin
      memory[memory_MPORT_12_addr] <= memory_MPORT_12_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_13_en & memory_MPORT_13_mask) begin
      memory[memory_MPORT_13_addr] <= memory_MPORT_13_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_14_en & memory_MPORT_14_mask) begin
      memory[memory_MPORT_14_addr] <= memory_MPORT_14_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_15_en & memory_MPORT_15_mask) begin
      memory[memory_MPORT_15_addr] <= memory_MPORT_15_data; // @[InstructionMemory.scala 18:19]
    end
    if(memory_MPORT_16_en & memory_MPORT_16_mask) begin
      memory[memory_MPORT_16_addr] <= memory_MPORT_16_data; // @[InstructionMemory.scala 18:19]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DataMemory(
  input         clock,
  input  [31:0] io_dpath_addr,
  input  [31:0] io_dpath_wdata,
  output [31:0] io_dpath_rdata,
  input  [1:0]  io_cpath_fcn,
  output [31:0] io_led_out
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:255]; // @[DataMemory.scala 31:19]
  wire [31:0] memory_io_dpath_rdata_MPORT_data; // @[DataMemory.scala 31:19]
  wire [7:0] memory_io_dpath_rdata_MPORT_addr; // @[DataMemory.scala 31:19]
  wire [31:0] memory_io_led_out_MPORT_data; // @[DataMemory.scala 31:19]
  wire [7:0] memory_io_led_out_MPORT_addr; // @[DataMemory.scala 31:19]
  wire [31:0] memory_MPORT_data; // @[DataMemory.scala 31:19]
  wire [7:0] memory_MPORT_addr; // @[DataMemory.scala 31:19]
  wire  memory_MPORT_mask; // @[DataMemory.scala 31:19]
  wire  memory_MPORT_en; // @[DataMemory.scala 31:19]
  wire  _T = 2'h0 == io_cpath_fcn; // @[Conditional.scala 37:30]
  wire  _T_1 = 2'h1 == io_cpath_fcn; // @[Conditional.scala 37:30]
  assign memory_io_dpath_rdata_MPORT_addr = io_dpath_addr[7:0];
  assign memory_io_dpath_rdata_MPORT_data = memory[memory_io_dpath_rdata_MPORT_addr]; // @[DataMemory.scala 31:19]
  assign memory_io_led_out_MPORT_addr = 8'h0;
  assign memory_io_led_out_MPORT_data = memory[memory_io_led_out_MPORT_addr]; // @[DataMemory.scala 31:19]
  assign memory_MPORT_data = io_dpath_wdata;
  assign memory_MPORT_addr = io_dpath_addr[7:0];
  assign memory_MPORT_mask = 1'h1;
  assign memory_MPORT_en = _T ? 1'h0 : _T_1;
  assign io_dpath_rdata = memory_io_dpath_rdata_MPORT_data; // @[Conditional.scala 40:58 DataMemory.scala 35:22]
  assign io_led_out = memory_io_led_out_MPORT_data; // @[DataMemory.scala 44:14]
  always @(posedge clock) begin
    if(memory_MPORT_en & memory_MPORT_mask) begin
      memory[memory_MPORT_addr] <= memory_MPORT_data; // @[DataMemory.scala 31:19]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Tile(
  input         clock,
  input         reset,
  output [31:0] io_led_out,
  output        io_d_imem_req_ready,
  input         io_d_imem_req_valid,
  input  [31:0] io_d_imem_req_bits_addr,
  input  [31:0] io_d_imem_req_bits_wdata,
  input         io_d_imem_req_bits_fcn,
  input  [2:0]  io_d_imem_req_bits_typ,
  output        io_d_imem_resp_valid,
  output [31:0] io_d_imem_resp_bits_rdata
);
  wire  Core_clock; // @[Tile.scala 17:20]
  wire  Core_reset; // @[Tile.scala 17:20]
  wire [31:0] Core_io_imem_req_bits_addr; // @[Tile.scala 17:20]
  wire  Core_io_imem_resp_valid; // @[Tile.scala 17:20]
  wire [31:0] Core_io_imem_resp_bits_rdata; // @[Tile.scala 17:20]
  wire [31:0] Core_io_dmem_dpath_addr; // @[Tile.scala 17:20]
  wire [31:0] Core_io_dmem_dpath_wdata; // @[Tile.scala 17:20]
  wire [31:0] Core_io_dmem_dpath_rdata; // @[Tile.scala 17:20]
  wire [1:0] Core_io_dmem_cpath_fcn; // @[Tile.scala 17:20]
  wire  InstructionMemory_clock; // @[Tile.scala 18:33]
  wire [31:0] InstructionMemory_io_mport_req_bits_addr; // @[Tile.scala 18:33]
  wire  InstructionMemory_io_mport_resp_valid; // @[Tile.scala 18:33]
  wire [31:0] InstructionMemory_io_mport_resp_bits_rdata; // @[Tile.scala 18:33]
  wire  InstructionMemory_io_d_write_req_valid; // @[Tile.scala 18:33]
  wire [31:0] InstructionMemory_io_d_write_req_bits_addr; // @[Tile.scala 18:33]
  wire [31:0] InstructionMemory_io_d_write_req_bits_wdata; // @[Tile.scala 18:33]
  wire  DataMemory_clock; // @[Tile.scala 19:27]
  wire [31:0] DataMemory_io_dpath_addr; // @[Tile.scala 19:27]
  wire [31:0] DataMemory_io_dpath_wdata; // @[Tile.scala 19:27]
  wire [31:0] DataMemory_io_dpath_rdata; // @[Tile.scala 19:27]
  wire [1:0] DataMemory_io_cpath_fcn; // @[Tile.scala 19:27]
  wire [31:0] DataMemory_io_led_out; // @[Tile.scala 19:27]
  wire  _T_1 = ~reset; // @[Tile.scala 32:9]
  Core Core ( // @[Tile.scala 17:20]
    .clock(Core_clock),
    .reset(Core_reset),
    .io_imem_req_bits_addr(Core_io_imem_req_bits_addr),
    .io_imem_resp_valid(Core_io_imem_resp_valid),
    .io_imem_resp_bits_rdata(Core_io_imem_resp_bits_rdata),
    .io_dmem_dpath_addr(Core_io_dmem_dpath_addr),
    .io_dmem_dpath_wdata(Core_io_dmem_dpath_wdata),
    .io_dmem_dpath_rdata(Core_io_dmem_dpath_rdata),
    .io_dmem_cpath_fcn(Core_io_dmem_cpath_fcn)
  );
  InstructionMemory InstructionMemory ( // @[Tile.scala 18:33]
    .clock(InstructionMemory_clock),
    .io_mport_req_bits_addr(InstructionMemory_io_mport_req_bits_addr),
    .io_mport_resp_valid(InstructionMemory_io_mport_resp_valid),
    .io_mport_resp_bits_rdata(InstructionMemory_io_mport_resp_bits_rdata),
    .io_d_write_req_valid(InstructionMemory_io_d_write_req_valid),
    .io_d_write_req_bits_addr(InstructionMemory_io_d_write_req_bits_addr),
    .io_d_write_req_bits_wdata(InstructionMemory_io_d_write_req_bits_wdata)
  );
  DataMemory DataMemory ( // @[Tile.scala 19:27]
    .clock(DataMemory_clock),
    .io_dpath_addr(DataMemory_io_dpath_addr),
    .io_dpath_wdata(DataMemory_io_dpath_wdata),
    .io_dpath_rdata(DataMemory_io_dpath_rdata),
    .io_cpath_fcn(DataMemory_io_cpath_fcn),
    .io_led_out(DataMemory_io_led_out)
  );
  assign io_led_out = DataMemory_io_led_out; // @[Tile.scala 31:14]
  assign io_d_imem_req_ready = 1'h0; // @[Tile.scala 22:32]
  assign io_d_imem_resp_valid = 1'h0; // @[Tile.scala 22:32]
  assign io_d_imem_resp_bits_rdata = 32'h0; // @[Tile.scala 22:32]
  assign Core_clock = clock;
  assign Core_reset = reset;
  assign Core_io_imem_resp_valid = InstructionMemory_io_mport_resp_valid; // @[Tile.scala 25:16]
  assign Core_io_imem_resp_bits_rdata = InstructionMemory_io_mport_resp_bits_rdata; // @[Tile.scala 25:16]
  assign Core_io_dmem_dpath_rdata = DataMemory_io_dpath_rdata; // @[Tile.scala 27:16]
  assign InstructionMemory_clock = clock;
  assign InstructionMemory_io_mport_req_bits_addr = Core_io_imem_req_bits_addr; // @[Tile.scala 25:16]
  assign InstructionMemory_io_d_write_req_valid = io_d_imem_req_valid; // @[Tile.scala 22:32]
  assign InstructionMemory_io_d_write_req_bits_addr = io_d_imem_req_bits_addr; // @[Tile.scala 22:32]
  assign InstructionMemory_io_d_write_req_bits_wdata = io_d_imem_req_bits_wdata; // @[Tile.scala 22:32]
  assign DataMemory_clock = clock;
  assign DataMemory_io_dpath_addr = Core_io_dmem_dpath_addr; // @[Tile.scala 27:16]
  assign DataMemory_io_dpath_wdata = Core_io_dmem_dpath_wdata; // @[Tile.scala 27:16]
  assign DataMemory_io_cpath_fcn = Core_io_dmem_cpath_fcn; // @[Tile.scala 27:16]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"LED=[%d] ",io_led_out); // @[Tile.scala 32:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
