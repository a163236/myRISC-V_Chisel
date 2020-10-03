// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtemp.h for the primary calling header

#include "Vtemp.h"
#include "Vtemp__Syms.h"

//==========

VL_CTOR_IMP(Vtemp) {
    Vtemp__Syms* __restrict vlSymsp = __VlSymsp = new Vtemp__Syms(this, name());
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vtemp::__Vconfigure(Vtemp__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vtemp::~Vtemp() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void Vtemp::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtemp::eval\n"); );
    Vtemp__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("temp.v", 1, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vtemp::_eval_initial_loop(Vtemp__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("temp.v", 1, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vtemp::_sequent__TOP__1(Vtemp__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::_sequent__TOP__1\n"); );
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    CData/*0:0*/ __Vdlyvset__temp__DOT__verimem__DOT__ram__v0;
    IData/*16:0*/ __Vdlyvdim0__temp__DOT__verimem__DOT__ram__v0;
    QData/*32:0*/ __Vdlyvval__temp__DOT__verimem__DOT__ram__v0;
    // Body
    __Vdlyvset__temp__DOT__verimem__DOT__ram__v0 = 0U;
    if (vlTOPp->io_we) {
        __Vdlyvval__temp__DOT__verimem__DOT__ram__v0 
            = (QData)((IData)(vlTOPp->io_di));
        __Vdlyvset__temp__DOT__verimem__DOT__ram__v0 = 1U;
        __Vdlyvdim0__temp__DOT__verimem__DOT__ram__v0 
            = vlTOPp->io_addr;
    }
    vlTOPp->temp__DOT____Vcellout__verimem__dout = 
        vlTOPp->temp__DOT__verimem__DOT__ram[vlTOPp->io_addr];
    if (__Vdlyvset__temp__DOT__verimem__DOT__ram__v0) {
        vlTOPp->temp__DOT__verimem__DOT__ram[__Vdlyvdim0__temp__DOT__verimem__DOT__ram__v0] 
            = __Vdlyvval__temp__DOT__verimem__DOT__ram__v0;
    }
    vlTOPp->io_dout = (IData)(vlTOPp->temp__DOT____Vcellout__verimem__dout);
}

void Vtemp::_initial__TOP__2(Vtemp__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::_initial__TOP__2\n"); );
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    WData/*351:0*/ __Vtemp1[11];
    // Body
    __Vtemp1[0U] = 0x2e686578U;
    __Vtemp1[1U] = 0x2d616464U;
    __Vtemp1[2U] = 0x75692d70U;
    __Vtemp1[3U] = 0x72763332U;
    __Vtemp1[4U] = 0x3275692fU;
    __Vtemp1[5U] = 0x2f727633U;
    __Vtemp1[6U] = 0x66696c65U;
    __Vtemp1[7U] = 0x2f686578U;
    __Vtemp1[8U] = 0x6c646572U;
    __Vtemp1[9U] = 0x7374666fU;
    __Vtemp1[0xaU] = 0x7465U;
    VL_READMEM_N(true, 33, 65537, 0, VL_CVT_PACK_STR_NW(11, __Vtemp1)
                 , vlTOPp->temp__DOT__verimem__DOT__ram
                 , 0, ~VL_ULL(0));
}

void Vtemp::_settle__TOP__3(Vtemp__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::_settle__TOP__3\n"); );
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->io_dout = (IData)(vlTOPp->temp__DOT____Vcellout__verimem__dout);
}

void Vtemp::_eval(Vtemp__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::_eval\n"); );
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clock) & (~ (IData)(vlTOPp->__Vclklast__TOP__clock)))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
}

void Vtemp::_eval_initial(Vtemp__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::_eval_initial\n"); );
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
    vlTOPp->_initial__TOP__2(vlSymsp);
}

void Vtemp::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::final\n"); );
    // Variables
    Vtemp__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vtemp::_eval_settle(Vtemp__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::_eval_settle\n"); );
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__3(vlSymsp);
}

VL_INLINE_OPT QData Vtemp::_change_request(Vtemp__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::_change_request\n"); );
    Vtemp* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vtemp::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((io_clk & 0xfeU))) {
        Verilated::overWidthError("io_clk");}
    if (VL_UNLIKELY((io_we & 0xfeU))) {
        Verilated::overWidthError("io_we");}
    if (VL_UNLIKELY((io_addr & 0xc0U))) {
        Verilated::overWidthError("io_addr");}
}
#endif  // VL_DEBUG

void Vtemp::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtemp::_ctor_var_reset\n"); );
    // Body
    clock = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    io_clk = VL_RAND_RESET_I(1);
    io_we = VL_RAND_RESET_I(1);
    io_addr = VL_RAND_RESET_I(6);
    io_di = VL_RAND_RESET_I(32);
    io_dout = VL_RAND_RESET_I(32);
    temp__DOT____Vcellout__verimem__dout = VL_RAND_RESET_Q(33);
    { int __Vi0=0; for (; __Vi0<65537; ++__Vi0) {
            temp__DOT__verimem__DOT__ram[__Vi0] = VL_RAND_RESET_Q(33);
    }}
}
