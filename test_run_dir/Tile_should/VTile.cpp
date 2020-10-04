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
            VL_FATAL_MT("Tile.v", 661, "",
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
            VL_FATAL_MT("Tile.v", 661, "",
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
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
        = ((0U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG))
            ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__rs1_execute
            : vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_execute);
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2 
        = ((0U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_1))
            ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__rs2_execute
            : ((4U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                ? ((((0x80000000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                      ? 0xfffU : 0U) << 0x14U) | ((0xff000U 
                                                   & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute) 
                                                  | ((0x800U 
                                                      & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                         >> 9U)) 
                                                     | (0x7feU 
                                                        & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                           >> 0x14U)))))
                : ((3U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                    ? (0xfffff000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                    : ((5U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                        ? ((((0x80000000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                              ? 0x7ffffU : 0U) << 0xdU) 
                           | ((0x1000U & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                          << 5U)) | 
                              ((0xfe0U & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                          >> 0x14U)) 
                               | (0x1eU & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                           >> 7U)))))
                        : ((2U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                            ? ((((0x80000000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                                  ? 0xfffffU : 0U) 
                                << 0xcU) | ((0xfe0U 
                                             & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                >> 0x14U)) 
                                            | (0x1fU 
                                               & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                  >> 7U))))
                            : ((1U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                                ? ((((0x80000000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                                      ? 0xfffffU : 0U) 
                                    << 0xcU) | (0xfffU 
                                                & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                   >> 0x14U)))
                                : 0U))))));
    vlTOPp->io_debug_pc_decode = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_decode;
    vlTOPp->io_debug_inst = vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_217 
        = ((0x6033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 0U : ((0x4033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 0U : ((0x40005033U == (0xfe00707fU 
                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0U : ((0x5033U == (0xfe00707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 0U : ((0x6fU 
                                                == 
                                                (0x7fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x67U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 0U
                                                    : 
                                                   ((0x63U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x1063U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x5063U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x7063U 
                                                        == 
                                                        (0x707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 1U
                                                        : 
                                                       ((0x4063U 
                                                         == 
                                                         (0x707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 1U
                                                         : 
                                                        ((0x6063U 
                                                          == 
                                                          (0x707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 1U
                                                          : 
                                                         ((0x5073U 
                                                           == 
                                                           (0x707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 2U
                                                           : 
                                                          ((0x6073U 
                                                            == 
                                                            (0x707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 2U
                                                            : 
                                                           ((0x7073U 
                                                             == 
                                                             (0x707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 2U
                                                             : 0U)))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_268 
        = ((0x2033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 0U : ((0x3033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 0U : ((0x7033U == (0xfe00707fU 
                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0U : ((0x6033U == (0xfe00707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 0U : ((0x4033U 
                                                == 
                                                (0xfe00707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 0U
                                                : (
                                                   (0x40005033U 
                                                    == 
                                                    (0xfe00707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 0U
                                                    : 
                                                   ((0x5033U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 0U
                                                     : 
                                                    ((0x6fU 
                                                      == 
                                                      (0x7fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x67U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x63U 
                                                        == 
                                                        (0x707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 1U
                                                        : 
                                                       ((0x1063U 
                                                         == 
                                                         (0x707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 1U
                                                         : 
                                                        ((0x5063U 
                                                          == 
                                                          (0x707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 1U
                                                          : 
                                                         ((0x7063U 
                                                           == 
                                                           (0x707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 1U
                                                           : 
                                                          ((0x4063U 
                                                            == 
                                                            (0x707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 1U
                                                            : 
                                                           ((0x6063U 
                                                             == 
                                                             (0x707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 1U
                                                             : 0U)))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_313 
        = ((0x6033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 0U : ((0x4033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 0U : ((0x40005033U == (0xfe00707fU 
                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0U : ((0x5033U == (0xfe00707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 0U : ((0x6fU 
                                                == 
                                                (0x7fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 4U
                                                : (
                                                   (0x67U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 4U
                                                    : 
                                                   ((0x63U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 5U
                                                     : 
                                                    ((0x1063U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 5U
                                                      : 
                                                     ((0x5063U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 5U
                                                       : 
                                                      ((0x7063U 
                                                        == 
                                                        (0x707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 5U
                                                        : 
                                                       ((0x4063U 
                                                         == 
                                                         (0x707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 5U
                                                         : 
                                                        ((0x6063U 
                                                          == 
                                                          (0x707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 5U
                                                          : 
                                                         ((0x5073U 
                                                           == 
                                                           (0x707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 6U
                                                           : 
                                                          ((0x6073U 
                                                            == 
                                                            (0x707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 6U
                                                            : 
                                                           ((0x7073U 
                                                             == 
                                                             (0x707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 6U
                                                             : 0U)))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_358 
        = ((0x5033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 4U : ((0x6fU == (0x7fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 1U : ((0x67U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 1U : ((0x63U == (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 1U : ((0x1063U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x5063U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 1U
                                                    : 
                                                   ((0x7063U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x4063U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x6063U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x5073U 
                                                        == 
                                                        (0x707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 0xbU
                                                        : 
                                                       ((0x6073U 
                                                         == 
                                                         (0x707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 0xbU
                                                         : 
                                                        ((0x7073U 
                                                          == 
                                                          (0x707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 0xbU
                                                          : 
                                                         ((0x1073U 
                                                           == 
                                                           (0x707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 0xbU
                                                           : 
                                                          ((0x2073U 
                                                            == 
                                                            (0x707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 0xbU
                                                            : 
                                                           ((0x3073U 
                                                             == 
                                                             (0x707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 0xbU
                                                             : 0U)))))))))))))));
    vlTOPp->io_debug_pc = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__next_pc 
        = ((IData)(4U) + vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg);
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_out 
        = ((0xcU == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
            ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2
            : ((0xbU == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1
                : ((4U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                    ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                       >> (0x1fU & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2))
                    : ((5U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                        ? VL_SHIFTRS_III(32,32,5, vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1, 
                                         (0x1fU & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2))
                        : ((3U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                            ? (IData)((VL_ULL(0x7fffffffffffffff) 
                                       & ((QData)((IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1)) 
                                          << (0x1fU 
                                              & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2))))
                            : ((0xaU == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                   < vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                : ((9U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                    ? VL_LTS_III(32,32,32, vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1, vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                    : ((8U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                        ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                           ^ vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                        : ((7U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                            ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                               | vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                            : ((6U 
                                                == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                                ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                                   & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                                : (
                                                   (2U 
                                                    == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                                    ? 
                                                   (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                                    - vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                                     ? 
                                                    (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                                     + vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                                     : 0U))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_232 
        = ((0x13U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 0U : ((0x7013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 0U : ((0x6013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0U : ((0x4013U == (0x707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 0U : ((0x2013U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 0U
                                                : (
                                                   (0x3013U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 0U
                                                    : 
                                                   ((0x1013U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 0U
                                                     : 
                                                    ((0x40005013U 
                                                      == 
                                                      (0xfe00707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 0U
                                                      : 
                                                     ((0x5013U 
                                                       == 
                                                       (0xfe00707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 0U
                                                       : 
                                                      ((0x1033U 
                                                        == 
                                                        (0xfe00707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 0U
                                                        : 
                                                       ((0x33U 
                                                         == 
                                                         (0xfe00707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 0U
                                                         : 
                                                        ((0x40000033U 
                                                          == 
                                                          (0xfe00707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 0U
                                                          : 
                                                         ((0x2033U 
                                                           == 
                                                           (0xfe00707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 0U
                                                           : 
                                                          ((0x3033U 
                                                            == 
                                                            (0xfe00707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 0U
                                                            : 
                                                           ((0x7033U 
                                                             == 
                                                             (0xfe00707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 0U
                                                             : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_217))))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_283 
        = ((0x1023U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 1U : ((0x17U == (0x7fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 1U : ((0x37U == (0x7fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 1U : ((0x13U == (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 1U : ((0x7013U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x6013U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 1U
                                                    : 
                                                   ((0x4013U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x2013U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x3013U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x1013U 
                                                        == 
                                                        (0xfe00707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 1U
                                                        : 
                                                       ((0x40005013U 
                                                         == 
                                                         (0xfe00707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 1U
                                                         : 
                                                        ((0x5013U 
                                                          == 
                                                          (0xfe00707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 1U
                                                          : 
                                                         ((0x1033U 
                                                           == 
                                                           (0xfe00707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 0U
                                                           : 
                                                          ((0x33U 
                                                            == 
                                                            (0xfe00707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 0U
                                                            : 
                                                           ((0x40000033U 
                                                             == 
                                                             (0xfe00707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 0U
                                                             : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_268))))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_328 
        = ((0x13U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 1U : ((0x7013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 1U : ((0x6013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 1U : ((0x4013U == (0x707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 1U : ((0x2013U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x3013U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 1U
                                                    : 
                                                   ((0x1013U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x40005013U 
                                                      == 
                                                      (0xfe00707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x5013U 
                                                       == 
                                                       (0xfe00707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x1033U 
                                                        == 
                                                        (0xfe00707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 0U
                                                        : 
                                                       ((0x33U 
                                                         == 
                                                         (0xfe00707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 0U
                                                         : 
                                                        ((0x40000033U 
                                                          == 
                                                          (0xfe00707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 0U
                                                          : 
                                                         ((0x2033U 
                                                           == 
                                                           (0xfe00707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 0U
                                                           : 
                                                          ((0x3033U 
                                                            == 
                                                            (0xfe00707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 0U
                                                            : 
                                                           ((0x7033U 
                                                             == 
                                                             (0xfe00707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 0U
                                                             : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_313))))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_373 
        = ((0x4013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 8U : ((0x2013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 9U : ((0x3013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0xaU : ((0x1013U == 
                                         (0xfe00707fU 
                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                         ? 3U : ((0x40005013U 
                                                  == 
                                                  (0xfe00707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                  ? 5U
                                                  : 
                                                 ((0x5013U 
                                                   == 
                                                   (0xfe00707fU 
                                                    & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                   ? 4U
                                                   : 
                                                  ((0x1033U 
                                                    == 
                                                    (0xfe00707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 3U
                                                    : 
                                                   ((0x33U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x40000033U 
                                                      == 
                                                      (0xfe00707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 2U
                                                      : 
                                                     ((0x2033U 
                                                       == 
                                                       (0xfe00707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 9U
                                                       : 
                                                      ((0x3033U 
                                                        == 
                                                        (0xfe00707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 0xaU
                                                        : 
                                                       ((0x7033U 
                                                         == 
                                                         (0xfe00707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 6U
                                                         : 
                                                        ((0x6033U 
                                                          == 
                                                          (0xfe00707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 7U
                                                          : 
                                                         ((0x4033U 
                                                           == 
                                                           (0xfe00707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 8U
                                                           : 
                                                          ((0x40005033U 
                                                            == 
                                                            (0xfe00707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 5U
                                                            : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_358))))))))))))))));
    vlTOPp->io_debug_alu_out = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_out;
}

VL_INLINE_OPT void VTile::_sequent__TOP__2(VTile__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_sequent__TOP__2\n"); );
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_execute 
        = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_decode;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3 
        = ((0x2003U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 1U : ((3U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 1U : ((0x4003U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 1U : ((0x1003U == (0x707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 1U : ((0x5003U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x2023U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 1U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x1023U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x37U 
                                                        == 
                                                        (0x7fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 0xcU
                                                        : 
                                                       ((0x13U 
                                                         == 
                                                         (0x707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 1U
                                                         : 
                                                        ((0x7013U 
                                                          == 
                                                          (0x707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 6U
                                                          : 
                                                         ((0x6013U 
                                                           == 
                                                           (0x707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 7U
                                                           : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_373))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__rs1_execute 
        = ((0U != (0x1fU & (vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI 
                            >> 0xfU))) ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__regFile__DOT__regfile
           [(0x1fU & (vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI 
                      >> 0xfU))] : 0U);
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
        = vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__rs2_execute 
        = ((0U != (0x1fU & (vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI 
                            >> 0x14U))) ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__regFile__DOT__regfile
           [(0x1fU & (vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI 
                      >> 0x14U))] : 0U);
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG = 
        ((0x2003U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
          ? 0U : ((3U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                   ? 0U : ((0x4003U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                            ? 0U : ((0x1003U == (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                     ? 0U : ((0x5003U 
                                              == (0x707fU 
                                                  & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                              ? 0U : 
                                             ((0x2023U 
                                               == (0x707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                               ? 0U
                                               : ((0x23U 
                                                   == 
                                                   (0x707fU 
                                                    & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                   ? 0U
                                                   : 
                                                  ((0x1023U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 0U
                                                    : 
                                                   ((0x17U 
                                                     == 
                                                     (0x7fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x37U 
                                                      == 
                                                      (0x7fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 0U
                                                      : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_232)))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_1 
        = ((0x2003U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 1U : ((3U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 1U : ((0x4003U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 1U : ((0x1003U == (0x707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 1U : ((0x5003U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x2023U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 1U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_283))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2 
        = ((0x2003U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 1U : ((3U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 1U : ((0x4003U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 1U : ((0x1003U == (0x707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 1U : ((0x5003U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x2023U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 2U
                                                     : 
                                                    ((0x1023U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 2U
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 3U
                                                       : 
                                                      ((0x37U 
                                                        == 
                                                        (0x7fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 3U
                                                        : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_328)))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_decode 
        = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
        = ((0U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG))
            ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__rs1_execute
            : vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_execute);
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2 
        = ((0U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_1))
            ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__rs2_execute
            : ((4U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                ? ((((0x80000000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                      ? 0xfffU : 0U) << 0x14U) | ((0xff000U 
                                                   & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute) 
                                                  | ((0x800U 
                                                      & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                         >> 9U)) 
                                                     | (0x7feU 
                                                        & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                           >> 0x14U)))))
                : ((3U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                    ? (0xfffff000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                    : ((5U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                        ? ((((0x80000000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                              ? 0x7ffffU : 0U) << 0xdU) 
                           | ((0x1000U & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                          << 5U)) | 
                              ((0xfe0U & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                          >> 0x14U)) 
                               | (0x1eU & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                           >> 7U)))))
                        : ((2U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                            ? ((((0x80000000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                                  ? 0xfffffU : 0U) 
                                << 0xcU) | ((0xfe0U 
                                             & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                >> 0x14U)) 
                                            | (0x1fU 
                                               & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                  >> 7U))))
                            : ((1U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_2))
                                ? ((((0x80000000U & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute)
                                      ? 0xfffffU : 0U) 
                                    << 0xcU) | (0xfffU 
                                                & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__inst_execute 
                                                   >> 0x14U)))
                                : 0U))))));
    vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI 
        = ((0x8000U >= (0xffffU & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg 
                                   >> 2U))) ? vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox__DOT__mem
           [(0xffffU & (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg 
                        >> 2U))] : 0U);
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_out 
        = ((0xcU == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
            ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2
            : ((0xbU == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                ? vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1
                : ((4U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                    ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                       >> (0x1fU & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2))
                    : ((5U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                        ? VL_SHIFTRS_III(32,32,5, vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1, 
                                         (0x1fU & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2))
                        : ((3U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                            ? (IData)((VL_ULL(0x7fffffffffffffff) 
                                       & ((QData)((IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1)) 
                                          << (0x1fU 
                                              & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2))))
                            : ((0xaU == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                   < vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                : ((9U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                    ? VL_LTS_III(32,32,32, vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1, vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                    : ((8U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                        ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                           ^ vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                        : ((7U == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                            ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                               | vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                            : ((6U 
                                                == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                                ? (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                                   & vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                                : (
                                                   (2U 
                                                    == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                                    ? 
                                                   (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                                    - vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__REG_3))
                                                     ? 
                                                    (vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 
                                                     + vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2)
                                                     : 0U))))))))))));
    vlTOPp->io_debug_pc_decode = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_decode;
    vlTOPp->io_debug_alu_out = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__aLU_io_out;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg 
        = ((IData)(vlTOPp->reset) ? 0U : vlTOPp->Tile__DOT__core__DOT__dpath__DOT__next_pc);
    vlTOPp->io_debug_inst = vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_217 
        = ((0x6033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 0U : ((0x4033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 0U : ((0x40005033U == (0xfe00707fU 
                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0U : ((0x5033U == (0xfe00707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 0U : ((0x6fU 
                                                == 
                                                (0x7fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x67U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 0U
                                                    : 
                                                   ((0x63U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x1063U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x5063U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x7063U 
                                                        == 
                                                        (0x707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 1U
                                                        : 
                                                       ((0x4063U 
                                                         == 
                                                         (0x707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 1U
                                                         : 
                                                        ((0x6063U 
                                                          == 
                                                          (0x707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 1U
                                                          : 
                                                         ((0x5073U 
                                                           == 
                                                           (0x707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 2U
                                                           : 
                                                          ((0x6073U 
                                                            == 
                                                            (0x707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 2U
                                                            : 
                                                           ((0x7073U 
                                                             == 
                                                             (0x707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 2U
                                                             : 0U)))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_268 
        = ((0x2033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 0U : ((0x3033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 0U : ((0x7033U == (0xfe00707fU 
                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0U : ((0x6033U == (0xfe00707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 0U : ((0x4033U 
                                                == 
                                                (0xfe00707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 0U
                                                : (
                                                   (0x40005033U 
                                                    == 
                                                    (0xfe00707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 0U
                                                    : 
                                                   ((0x5033U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 0U
                                                     : 
                                                    ((0x6fU 
                                                      == 
                                                      (0x7fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x67U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x63U 
                                                        == 
                                                        (0x707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 1U
                                                        : 
                                                       ((0x1063U 
                                                         == 
                                                         (0x707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 1U
                                                         : 
                                                        ((0x5063U 
                                                          == 
                                                          (0x707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 1U
                                                          : 
                                                         ((0x7063U 
                                                           == 
                                                           (0x707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 1U
                                                           : 
                                                          ((0x4063U 
                                                            == 
                                                            (0x707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 1U
                                                            : 
                                                           ((0x6063U 
                                                             == 
                                                             (0x707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 1U
                                                             : 0U)))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_313 
        = ((0x6033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 0U : ((0x4033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 0U : ((0x40005033U == (0xfe00707fU 
                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0U : ((0x5033U == (0xfe00707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 0U : ((0x6fU 
                                                == 
                                                (0x7fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 4U
                                                : (
                                                   (0x67U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 4U
                                                    : 
                                                   ((0x63U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 5U
                                                     : 
                                                    ((0x1063U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 5U
                                                      : 
                                                     ((0x5063U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 5U
                                                       : 
                                                      ((0x7063U 
                                                        == 
                                                        (0x707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 5U
                                                        : 
                                                       ((0x4063U 
                                                         == 
                                                         (0x707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 5U
                                                         : 
                                                        ((0x6063U 
                                                          == 
                                                          (0x707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 5U
                                                          : 
                                                         ((0x5073U 
                                                           == 
                                                           (0x707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 6U
                                                           : 
                                                          ((0x6073U 
                                                            == 
                                                            (0x707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 6U
                                                            : 
                                                           ((0x7073U 
                                                             == 
                                                             (0x707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 6U
                                                             : 0U)))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_358 
        = ((0x5033U == (0xfe00707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 4U : ((0x6fU == (0x7fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 1U : ((0x67U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 1U : ((0x63U == (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 1U : ((0x1063U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x5063U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 1U
                                                    : 
                                                   ((0x7063U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x4063U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x6063U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x5073U 
                                                        == 
                                                        (0x707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 0xbU
                                                        : 
                                                       ((0x6073U 
                                                         == 
                                                         (0x707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 0xbU
                                                         : 
                                                        ((0x7073U 
                                                          == 
                                                          (0x707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 0xbU
                                                          : 
                                                         ((0x1073U 
                                                           == 
                                                           (0x707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 0xbU
                                                           : 
                                                          ((0x2073U 
                                                            == 
                                                            (0x707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 0xbU
                                                            : 
                                                           ((0x3073U 
                                                             == 
                                                             (0x707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 0xbU
                                                             : 0U)))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_232 
        = ((0x13U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 0U : ((0x7013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 0U : ((0x6013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0U : ((0x4013U == (0x707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 0U : ((0x2013U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 0U
                                                : (
                                                   (0x3013U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 0U
                                                    : 
                                                   ((0x1013U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 0U
                                                     : 
                                                    ((0x40005013U 
                                                      == 
                                                      (0xfe00707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 0U
                                                      : 
                                                     ((0x5013U 
                                                       == 
                                                       (0xfe00707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 0U
                                                       : 
                                                      ((0x1033U 
                                                        == 
                                                        (0xfe00707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 0U
                                                        : 
                                                       ((0x33U 
                                                         == 
                                                         (0xfe00707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 0U
                                                         : 
                                                        ((0x40000033U 
                                                          == 
                                                          (0xfe00707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 0U
                                                          : 
                                                         ((0x2033U 
                                                           == 
                                                           (0xfe00707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 0U
                                                           : 
                                                          ((0x3033U 
                                                            == 
                                                            (0xfe00707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 0U
                                                            : 
                                                           ((0x7033U 
                                                             == 
                                                             (0xfe00707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 0U
                                                             : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_217))))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_283 
        = ((0x1023U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 1U : ((0x17U == (0x7fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 1U : ((0x37U == (0x7fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 1U : ((0x13U == (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 1U : ((0x7013U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x6013U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 1U
                                                    : 
                                                   ((0x4013U 
                                                     == 
                                                     (0x707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x2013U 
                                                      == 
                                                      (0x707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x3013U 
                                                       == 
                                                       (0x707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x1013U 
                                                        == 
                                                        (0xfe00707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 1U
                                                        : 
                                                       ((0x40005013U 
                                                         == 
                                                         (0xfe00707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 1U
                                                         : 
                                                        ((0x5013U 
                                                          == 
                                                          (0xfe00707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 1U
                                                          : 
                                                         ((0x1033U 
                                                           == 
                                                           (0xfe00707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 0U
                                                           : 
                                                          ((0x33U 
                                                            == 
                                                            (0xfe00707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 0U
                                                            : 
                                                           ((0x40000033U 
                                                             == 
                                                             (0xfe00707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 0U
                                                             : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_268))))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_328 
        = ((0x13U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 1U : ((0x7013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 1U : ((0x6013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 1U : ((0x4013U == (0x707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                       ? 1U : ((0x2013U 
                                                == 
                                                (0x707fU 
                                                 & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                ? 1U
                                                : (
                                                   (0x3013U 
                                                    == 
                                                    (0x707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 1U
                                                    : 
                                                   ((0x1013U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x40005013U 
                                                      == 
                                                      (0xfe00707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 1U
                                                      : 
                                                     ((0x5013U 
                                                       == 
                                                       (0xfe00707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 1U
                                                       : 
                                                      ((0x1033U 
                                                        == 
                                                        (0xfe00707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 0U
                                                        : 
                                                       ((0x33U 
                                                         == 
                                                         (0xfe00707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 0U
                                                         : 
                                                        ((0x40000033U 
                                                          == 
                                                          (0xfe00707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 0U
                                                          : 
                                                         ((0x2033U 
                                                           == 
                                                           (0xfe00707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 0U
                                                           : 
                                                          ((0x3033U 
                                                            == 
                                                            (0xfe00707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 0U
                                                            : 
                                                           ((0x7033U 
                                                             == 
                                                             (0xfe00707fU 
                                                              & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                             ? 0U
                                                             : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_313))))))))))))))));
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_373 
        = ((0x4013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
            ? 8U : ((0x2013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                     ? 9U : ((0x3013U == (0x707fU & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                              ? 0xaU : ((0x1013U == 
                                         (0xfe00707fU 
                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                         ? 3U : ((0x40005013U 
                                                  == 
                                                  (0xfe00707fU 
                                                   & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                  ? 5U
                                                  : 
                                                 ((0x5013U 
                                                   == 
                                                   (0xfe00707fU 
                                                    & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                   ? 4U
                                                   : 
                                                  ((0x1033U 
                                                    == 
                                                    (0xfe00707fU 
                                                     & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                    ? 3U
                                                    : 
                                                   ((0x33U 
                                                     == 
                                                     (0xfe00707fU 
                                                      & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                     ? 1U
                                                     : 
                                                    ((0x40000033U 
                                                      == 
                                                      (0xfe00707fU 
                                                       & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                      ? 2U
                                                      : 
                                                     ((0x2033U 
                                                       == 
                                                       (0xfe00707fU 
                                                        & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                       ? 9U
                                                       : 
                                                      ((0x3033U 
                                                        == 
                                                        (0xfe00707fU 
                                                         & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                        ? 0xaU
                                                        : 
                                                       ((0x7033U 
                                                         == 
                                                         (0xfe00707fU 
                                                          & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                         ? 6U
                                                         : 
                                                        ((0x6033U 
                                                          == 
                                                          (0xfe00707fU 
                                                           & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                          ? 7U
                                                          : 
                                                         ((0x4033U 
                                                           == 
                                                           (0xfe00707fU 
                                                            & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                           ? 8U
                                                           : 
                                                          ((0x40005033U 
                                                            == 
                                                            (0xfe00707fU 
                                                             & vlTOPp->Tile__DOT__bram__DOT__syncmemblackbox_rdataI))
                                                            ? 5U
                                                            : (IData)(vlTOPp->Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_358))))))))))))))));
    vlTOPp->io_debug_pc = vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg;
    vlTOPp->Tile__DOT__core__DOT__dpath__DOT__next_pc 
        = ((IData)(4U) + vlTOPp->Tile__DOT__core__DOT__dpath__DOT__pc_reg);
}

void VTile::_initial__TOP__3(VTile__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTile::_initial__TOP__3\n"); );
    VTile* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    WData/*351:0*/ __Vtemp1[11];
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
    __Vtemp1[0xaU] = 0x2e2fU;
    VL_READMEM_N(true, 32, 32769, 0, VL_CVT_PACK_STR_NW(11, __Vtemp1)
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
    io_debug_pc_decode = VL_RAND_RESET_I(32);
    io_debug_inst = VL_RAND_RESET_I(32);
    io_debug_reg_a0 = VL_RAND_RESET_I(32);
    io_debug_alu_out = VL_RAND_RESET_I(32);
    Tile__DOT__bram__DOT__syncmemblackbox_rdataI = VL_RAND_RESET_I(32);
    { int __Vi0=0; for (; __Vi0<32769; ++__Vi0) {
            Tile__DOT__bram__DOT__syncmemblackbox__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }}
    Tile__DOT__core__DOT__dpath__DOT__aLU_io_op1 = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__aLU_io_op2 = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__aLU_io_out = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__pc_reg = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__next_pc = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__pc_decode = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__pc_execute = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__inst_execute = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__rs1_execute = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__rs2_execute = VL_RAND_RESET_I(32);
    Tile__DOT__core__DOT__dpath__DOT__REG = VL_RAND_RESET_I(2);
    Tile__DOT__core__DOT__dpath__DOT__REG_1 = VL_RAND_RESET_I(2);
    Tile__DOT__core__DOT__dpath__DOT__REG_2 = VL_RAND_RESET_I(3);
    Tile__DOT__core__DOT__dpath__DOT__REG_3 = VL_RAND_RESET_I(4);
    Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_217 = VL_RAND_RESET_I(2);
    Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_232 = VL_RAND_RESET_I(2);
    Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_268 = VL_RAND_RESET_I(2);
    Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_283 = VL_RAND_RESET_I(2);
    Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_313 = VL_RAND_RESET_I(3);
    Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_328 = VL_RAND_RESET_I(3);
    Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_358 = VL_RAND_RESET_I(4);
    Tile__DOT__core__DOT__dpath__DOT__ctrlUnit__DOT___T_373 = VL_RAND_RESET_I(4);
    { int __Vi0=0; for (; __Vi0<32; ++__Vi0) {
            Tile__DOT__core__DOT__dpath__DOT__regFile__DOT__regfile[__Vi0] = VL_RAND_RESET_I(32);
    }}
}
