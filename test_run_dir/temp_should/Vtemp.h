// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VTEMP_H_
#define _VTEMP_H_  // guard

#include "verilated_heavy.h"

//==========

class Vtemp__Syms;

//----------

VL_MODULE(Vtemp) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_clk,0,0);
    VL_IN8(io_we,0,0);
    VL_IN8(io_addr,5,0);
    VL_IN(io_di,31,0);
    VL_OUT(io_dout,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    QData/*32:0*/ temp__DOT__verimem__DOT__ram[65537];
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*0:0*/ __Vclklast__TOP__clock;
    QData/*32:0*/ temp__DOT____Vcellout__verimem__dout;
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vtemp__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vtemp);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vtemp(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vtemp();
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vtemp__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vtemp__Syms* symsp, bool first);
  private:
    static QData _change_request(Vtemp__Syms* __restrict vlSymsp);
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(Vtemp__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(Vtemp__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(Vtemp__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__2(Vtemp__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__1(Vtemp__Syms* __restrict vlSymsp);
    static void _settle__TOP__3(Vtemp__Syms* __restrict vlSymsp) VL_ATTR_COLD;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
