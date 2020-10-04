// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTile.h for the primary calling header

#include "VTile.h"
#include "VTile__Syms.h"

//==========

VL_CTOR_IMP(VTile) {
    VTile__Syms* __restrict vlSymsp = __VlSymsp = new VTile__Syms(this, name());
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VTile::__Vconfigure(VTile__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

VTile::~VTile() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void VTile::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VTile::eval\n"); );
    VTile__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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
            VL_FATAL_MT("Tile.v", 253, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VTile::_eval_initial_loop(VTile__Syms* __restrict vlSymsp) {
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
            VL_FATAL_MT("Tile.v", 253, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VTile::_settle__TOP__1(VTile__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_settle__TOP__1\n"); );
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->io_debug_reg_a0 = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__regFile__DOT__regfile
        [0xaU];
    vlTOPp->io_debug_pc_decode = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_decode;
    vlTOPp->io_debug_inst = vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI;
    vlTOPp->io_debug_pc = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__next_pc 
        = ((IData)(4U) + vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg);
}

VL_INLINE_OPT void VTile::_sequent__TOP__2(VTile__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_sequent__TOP__2\n"); );
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_decode 
        = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg;
    vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI 
        = ((0x8000U >= (0xffffU & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg 
                                   >> 2U))) ? vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox__DOT__mem
           [(0xffffU & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg 
                        >> 2U))] : 0U);
    vlTOPp->io_debug_pc_decode = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_decode;
    vlTOPp->io_debug_inst = vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg 
        = ((IData)(vlTOPp->reset) ? 0U : vlTOPp->Tile__DOT__core__DOT__dpath__DOT__next_pc);
    vlTOPp->io_debug_pc = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__next_pc 
        = ((IData)(4U) + vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg);
}

void VTile::_initial__TOP__3(VTile__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_initial__TOP__3\n"); );
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    WData/*319:0*/ __Vtemp1[10];
    // Body
    __Vtemp1[0U] = 0x2e686578U;
    __Vtemp1[1U] = 0x65697461U;
    __Vtemp1[2U] = 0x6d705f6bU;
    __Vtemp1[3U] = 0x692f7465U;
    __Vtemp1[4U] = 0x76333275U;
    __Vtemp1[5U] = 0x6c652f72U;
    __Vtemp1[6U] = 0x65786669U;
    __Vtemp1[7U] = 0x65722f68U;
    __Vtemp1[8U] = 0x666f6c64U;
    __Vtemp1[9U] = 0x74657374U;
    VL_READMEM_N(true, 32, 32769, 0, VL_CVT_PACK_STR_NW(10, __Vtemp1)
                 , vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox__DOT__mem
                 , 0, ~VL_ULL(0));
}

void VTile::_eval(VTile__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_eval\n"); );
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clock) & (~ (IData)(vlTOPp->__Vclklast__TOP__clock)))) {
        vlTOPp->_sequent__TOP__2(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
}

void VTile::_eval_initial(VTile__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_eval_initial\n"); );
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
    vlTOPp->_initial__TOP__3(vlSymsp);
}

void VTile::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::final\n"); );
    // Variables
    VTile__Syms* __restrict vlSymsp = this->__VlSymsp;
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VTile::_eval_settle(VTile__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_eval_settle\n"); );
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__1(vlSymsp);
}

VL_INLINE_OPT QData VTile::_change_request(VTile__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_change_request\n"); );
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VTile::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG

void VTile::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_ctor_var_reset\n"); );
    // Body
    clock = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    io_debug_pc = VL_RAND_RESET_I(32);
    io_debug_reg_a0 = VL_RAND_RESET_I(32);
    io_debug_pc_decode = VL_RAND_RESET_I(32);
    io_debug_inst = VL_RAND_RESET_I(32);
    Tile__DOT__bram__DOT__syncmemblackbox_rdataI = VL_RAND_RESET_I(32);
    { int __Vi0=0; for (; __Vi0<32769; ++__Vi0) {
            Tile__DOT__bram__DOT__syncmemblackbox__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }}
    Tile__DOT__core__DOT__dpath__DOT__pc_reg = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__next_pc = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__pc_decode = VL_RAND_RESET_I(32);
    { int __Vi0=0; for (; __Vi0<32; ++__Vi0) {
            Tile__DOT__core__DOT__dpath__DOT__regFile__DOT__regfile[__Vi0] = VL_RAND_RESET_I(32);
    }}
}
