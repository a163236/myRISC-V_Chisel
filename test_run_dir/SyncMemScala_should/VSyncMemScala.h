// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VSYNCMEMSCALA_H_
#define _VSYNCMEMSCALA_H_  // guard

#include "verilated_heavy.h"

//==========

class VSyncMemScala__Syms;

//----------

VL_MODULE(VSyncMemScala) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_instmport_req_renI,0,0);
    VL_IN8(io_datamport_req_fcn,0,0);
    VL_IN8(io_datamport_req_typ,2,0);
    VL_IN(io_instmport_req_raddrI,31,0);
    VL_OUT(io_instmport_resp_rdata,31,0);
    VL_IN(io_datamport_req_addrD,31,0);
    VL_IN(io_datamport_req_wdataD,31,0);
    VL_OUT(io_datamport_resp_rdata,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    IData/*31:0*/ SyncMemScala__DOT__syncmemblackbox_rdataI;
    IData/*31:0*/ SyncMemScala__DOT__syncmemblackbox_rdataD;
    IData/*31:0*/ SyncMemScala__DOT___tmpans_T_23;
    IData/*31:0*/ SyncMemScala__DOT___tmpans_T_70;
    QData/*39:0*/ SyncMemScala__DOT___GEN_6;
    QData/*39:0*/ SyncMemScala__DOT___GEN_8;
    IData/*31:0*/ SyncMemScala__DOT__syncmemblackbox__DOT__mem[32769];
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*7:0*/ SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1;
    CData/*0:0*/ __Vclklast__TOP__clock;
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VSyncMemScala__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VSyncMemScala);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    VSyncMemScala(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~VSyncMemScala();
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(VSyncMemScala__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(VSyncMemScala__Syms* symsp, bool first);
  private:
    static QData _change_request(VSyncMemScala__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__4(VSyncMemScala__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(VSyncMemScala__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(VSyncMemScala__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(VSyncMemScala__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__2(VSyncMemScala__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__1(VSyncMemScala__Syms* __restrict vlSymsp);
    static void _settle__TOP__3(VSyncMemScala__Syms* __restrict vlSymsp) VL_ATTR_COLD;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
