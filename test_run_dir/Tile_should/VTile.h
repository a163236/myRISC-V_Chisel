// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VTILE_H_
#define _VTILE_H_  // guard

#include "verilated_heavy.h"

//==========

class VTile__Syms;

//----------

VL_MODULE(VTile) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_OUT(io_debug_pc,31,0);
    VL_OUT(io_debug_pc_decode,31,0);
    VL_OUT(io_debug_inst,31,0);
    VL_OUT(io_debug_reg_a0,31,0);
    VL_OUT(io_debug_alu_out,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    CData/*1:0*/ Tile__DOT__core__DOT__dpath__DOT__REG;
    CData/*1:0*/ Tile__DOT__core__DOT__dpath__DOT__REG_1;
    CData/*2:0*/ Tile__DOT__core__DOT__dpath__DOT__REG_2;
    CData/*3:0*/ Tile__DOT__core__DOT__dpath__DOT__REG_3;
    CData/*1:0*/ Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_217;
    CData/*1:0*/ Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_232;
    CData/*1:0*/ Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_268;
    CData/*1:0*/ Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_283;
    CData/*2:0*/ Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_313;
    CData/*2:0*/ Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_328;
    CData/*3:0*/ Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_358;
    CData/*3:0*/ Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_373;
    IData/*31:0*/ Tile__DOT__bram__DOT__syncmemblackbox_rdataI;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__aLU_io_out;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__pc_reg;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__next_pc;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__pc_decode;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__pc_execute;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__inst_execute;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__rs1_execute;
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__rs2_execute;
    IData/*31:0*/ Tile__DOT__bram__DOT__syncmemblackbox__DOT__mem[32769];
    IData/*31:0*/ Tile__DOT__core__DOT__dpath__DOT__regFile__DOT__regfile[32];
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*0:0*/ __Vclklast__TOP__clock;
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VTile__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VTile);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    VTile(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~VTile();
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(VTile__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(VTile__Syms* symsp, bool first);
  private:
    static QData _change_request(VTile__Syms* __restrict vlSymsp);
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(VTile__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(VTile__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(VTile__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__3(VTile__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__2(VTile__Syms* __restrict vlSymsp);
    static void _settle__TOP__1(VTile__Syms* __restrict vlSymsp) VL_ATTR_COLD;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
