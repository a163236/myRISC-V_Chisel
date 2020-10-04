// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VSyncMemScala.h for the primary calling header

#include "VSyncMemScala.h"
#include "VSyncMemScala__Syms.h"

//==========

VL_CTOR_IMP(VSyncMemScala) {
    VSyncMemScala__Syms* __restrict vlSymsp = __VlSymsp = new VSyncMemScala__Syms(this, name());
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VSyncMemScala::__Vconfigure(VSyncMemScala__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

VSyncMemScala::~VSyncMemScala() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void VSyncMemScala::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VSyncMemScala::eval\n"); );
    VSyncMemScala__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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
            VL_FATAL_MT("SyncMemScala.v", 1, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VSyncMemScala::_eval_initial_loop(VSyncMemScala__Syms* __restrict vlSymsp) {
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
            VL_FATAL_MT("SyncMemScala.v", 1, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void VSyncMemScala::_sequent__TOP__1(VSyncMemScala__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_sequent__TOP__1\n"); );
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    CData/*4:0*/ __Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0;
    CData/*7:0*/ __Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0;
    CData/*0:0*/ __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0;
    CData/*4:0*/ __Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1;
    CData/*7:0*/ __Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1;
    CData/*0:0*/ __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1;
    CData/*4:0*/ __Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2;
    CData/*7:0*/ __Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2;
    CData/*0:0*/ __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2;
    CData/*4:0*/ __Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3;
    CData/*7:0*/ __Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3;
    CData/*0:0*/ __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3;
    SData/*15:0*/ __Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0;
    SData/*15:0*/ __Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1;
    SData/*15:0*/ __Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2;
    SData/*15:0*/ __Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3;
    // Body
    if ((1U & (~ (IData)(vlTOPp->reset)))) {
        if (VL_UNLIKELY(((1U == (IData)(vlTOPp->io_datamport_req_typ)) 
                         & (~ (IData)(vlTOPp->reset))))) {
            VL_FWRITEF(0x80000002U,"%x ",4,(0xfU & 
                                            ((1U == (IData)(vlTOPp->io_datamport_req_typ))
                                              ? (0xfU 
                                                 & ((IData)(1U) 
                                                    << 
                                                    (3U 
                                                     & vlTOPp->io_datamport_req_addrD)))
                                              : ((2U 
                                                  == (IData)(vlTOPp->io_datamport_req_typ))
                                                  ? 
                                                 (0x1fU 
                                                  & ((IData)(3U) 
                                                     << 
                                                     (3U 
                                                      & vlTOPp->io_datamport_req_addrD)))
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlTOPp->io_datamport_req_typ))
                                                   ? 
                                                  ((IData)(7U) 
                                                   << 
                                                   (3U 
                                                    & vlTOPp->io_datamport_req_addrD))
                                                   : 0U)))));
        }
    }
    __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0 = 0U;
    __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1 = 0U;
    __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2 = 0U;
    __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3 = 0U;
    if (vlTOPp->io_instmport_req_renI) {
        vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataI 
            = ((0x8000U >= (0xffffU & (vlTOPp->io_instmport_req_raddrI 
                                       >> 2U))) ? vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem
               [(0xffffU & (vlTOPp->io_instmport_req_raddrI 
                            >> 2U))] : 0U);
    }
    if ((1U & (~ (IData)(vlTOPp->io_datamport_req_fcn)))) {
        vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
            = ((0x8000U >= (0xffffU & (vlTOPp->io_datamport_req_addrD 
                                       >> 2U))) ? vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem
               [(0xffffU & (vlTOPp->io_datamport_req_addrD 
                            >> 2U))] : 0U);
    }
    if (vlTOPp->io_datamport_req_fcn) {
        if ((1U & ((1U == (IData)(vlTOPp->io_datamport_req_typ))
                    ? (0xfU & ((IData)(1U) << (3U & vlTOPp->io_datamport_req_addrD)))
                    : ((2U == (IData)(vlTOPp->io_datamport_req_typ))
                        ? (0x1fU & ((IData)(3U) << 
                                    (3U & vlTOPp->io_datamport_req_addrD)))
                        : ((3U == (IData)(vlTOPp->io_datamport_req_typ))
                            ? ((IData)(7U) << (3U & vlTOPp->io_datamport_req_addrD))
                            : 0U))))) {
            vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1 
                = (0xffU & vlTOPp->io_datamport_req_wdataD);
            if ((0x8000U >= (0xffffU & (vlTOPp->io_datamport_req_addrD 
                                        >> 2U)))) {
                __Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0 
                    = vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1;
                __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0 = 1U;
                __Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0 = 0U;
                __Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0 
                    = (0xffffU & (vlTOPp->io_datamport_req_addrD 
                                  >> 2U));
            }
        }
        if ((2U & ((1U == (IData)(vlTOPp->io_datamport_req_typ))
                    ? (0xfU & ((IData)(1U) << (3U & vlTOPp->io_datamport_req_addrD)))
                    : ((2U == (IData)(vlTOPp->io_datamport_req_typ))
                        ? (0x1fU & ((IData)(3U) << 
                                    (3U & vlTOPp->io_datamport_req_addrD)))
                        : ((3U == (IData)(vlTOPp->io_datamport_req_typ))
                            ? ((IData)(7U) << (3U & vlTOPp->io_datamport_req_addrD))
                            : 0U))))) {
            vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1 
                = (0xffU & (vlTOPp->io_datamport_req_wdataD 
                            >> 8U));
            if ((0x8000U >= (0xffffU & (vlTOPp->io_datamport_req_addrD 
                                        >> 2U)))) {
                __Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1 
                    = vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1;
                __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1 = 1U;
                __Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1 = 8U;
                __Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1 
                    = (0xffffU & (vlTOPp->io_datamport_req_addrD 
                                  >> 2U));
            }
        }
        if ((4U & ((1U == (IData)(vlTOPp->io_datamport_req_typ))
                    ? (0xfU & ((IData)(1U) << (3U & vlTOPp->io_datamport_req_addrD)))
                    : ((2U == (IData)(vlTOPp->io_datamport_req_typ))
                        ? (0x1fU & ((IData)(3U) << 
                                    (3U & vlTOPp->io_datamport_req_addrD)))
                        : ((3U == (IData)(vlTOPp->io_datamport_req_typ))
                            ? ((IData)(7U) << (3U & vlTOPp->io_datamport_req_addrD))
                            : 0U))))) {
            vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1 
                = (0xffU & (vlTOPp->io_datamport_req_wdataD 
                            >> 0x10U));
            if ((0x8000U >= (0xffffU & (vlTOPp->io_datamport_req_addrD 
                                        >> 2U)))) {
                __Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2 
                    = vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1;
                __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2 = 1U;
                __Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2 = 0x10U;
                __Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2 
                    = (0xffffU & (vlTOPp->io_datamport_req_addrD 
                                  >> 2U));
            }
        }
        if ((8U & ((1U == (IData)(vlTOPp->io_datamport_req_typ))
                    ? (0xfU & ((IData)(1U) << (3U & vlTOPp->io_datamport_req_addrD)))
                    : ((2U == (IData)(vlTOPp->io_datamport_req_typ))
                        ? (0x1fU & ((IData)(3U) << 
                                    (3U & vlTOPp->io_datamport_req_addrD)))
                        : ((3U == (IData)(vlTOPp->io_datamport_req_typ))
                            ? ((IData)(7U) << (3U & vlTOPp->io_datamport_req_addrD))
                            : 0U))))) {
            vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1 
                = (0xffU & (vlTOPp->io_datamport_req_wdataD 
                            >> 0x18U));
            if ((0x8000U >= (0xffffU & (vlTOPp->io_datamport_req_addrD 
                                        >> 2U)))) {
                __Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3 
                    = vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1;
                __Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3 = 1U;
                __Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3 = 0x18U;
                __Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3 
                    = (0xffffU & (vlTOPp->io_datamport_req_addrD 
                                  >> 2U));
            }
        }
    }
    if (__Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0) {
        vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem[__Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0] 
            = (((~ ((IData)(0xffU) << (IData)(__Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0))) 
                & vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem
                [__Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0]) 
               | ((IData)(__Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0) 
                  << (IData)(__Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v0)));
    }
    if (__Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1) {
        vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem[__Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1] 
            = (((~ ((IData)(0xffU) << (IData)(__Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1))) 
                & vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem
                [__Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1]) 
               | ((IData)(__Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1) 
                  << (IData)(__Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v1)));
    }
    if (__Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2) {
        vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem[__Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2] 
            = (((~ ((IData)(0xffU) << (IData)(__Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2))) 
                & vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem
                [__Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2]) 
               | ((IData)(__Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2) 
                  << (IData)(__Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v2)));
    }
    if (__Vdlyvset__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3) {
        vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem[__Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3] 
            = (((~ ((IData)(0xffU) << (IData)(__Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3))) 
                & vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem
                [__Vdlyvdim0__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3]) 
               | ((IData)(__Vdlyvval__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3) 
                  << (IData)(__Vdlyvlsb__SyncMemScala__DOT__syncmemblackbox__DOT__mem__v3)));
    }
    vlTOPp->io_instmport_resp_rdata = vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataI;
    vlTOPp->SyncMemScala__DOT___tmpans_T_23 = ((((0x80000000U 
                                                  & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                  ? 0xffffffU
                                                  : 0U) 
                                                << 8U) 
                                               | (0xffU 
                                                  & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                     >> 0x18U)));
}

void VSyncMemScala::_initial__TOP__2(VSyncMemScala__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_initial__TOP__2\n"); );
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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
    VL_READMEM_N(true, 32, 32769, 0, VL_CVT_PACK_STR_NW(11, __Vtemp1)
                 , vlTOPp->SyncMemScala__DOT__syncmemblackbox__DOT__mem
                 , 0, ~VL_ULL(0));
}

void VSyncMemScala::_settle__TOP__3(VSyncMemScala__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_settle__TOP__3\n"); );
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->io_instmport_resp_rdata = vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataI;
    vlTOPp->SyncMemScala__DOT___tmpans_T_70 = ((3U 
                                                == 
                                                (3U 
                                                 & vlTOPp->io_datamport_req_addrD))
                                                ? (0xffU 
                                                   & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                      >> 0x18U))
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & vlTOPp->io_datamport_req_addrD))
                                                    ? 
                                                   (0xffffU 
                                                    & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                       >> 0x10U))
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (3U 
                                                      & vlTOPp->io_datamport_req_addrD))
                                                     ? 
                                                    (0xffffffU 
                                                     & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                        >> 8U))
                                                     : vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)));
    vlTOPp->SyncMemScala__DOT___tmpans_T_23 = ((((0x80000000U 
                                                  & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                  ? 0xffffffU
                                                  : 0U) 
                                                << 8U) 
                                               | (0xffU 
                                                  & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                     >> 0x18U)));
    vlTOPp->SyncMemScala__DOT___GEN_6 = ((2U == (IData)(vlTOPp->io_datamport_req_typ))
                                          ? (QData)((IData)(
                                                            (0xffffU 
                                                             & ((3U 
                                                                 == 
                                                                 (3U 
                                                                  & vlTOPp->io_datamport_req_addrD))
                                                                 ? 
                                                                (0xffU 
                                                                 & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                    >> 0x18U))
                                                                 : 
                                                                ((2U 
                                                                  == 
                                                                  (3U 
                                                                   & vlTOPp->io_datamport_req_addrD))
                                                                  ? 
                                                                 (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                  >> 0x10U)
                                                                  : 
                                                                 ((1U 
                                                                   == 
                                                                   (3U 
                                                                    & vlTOPp->io_datamport_req_addrD))
                                                                   ? 
                                                                  (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                   >> 8U)
                                                                   : vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD))))))
                                          : ((6U == (IData)(vlTOPp->io_datamport_req_typ))
                                              ? ((3U 
                                                  == 
                                                  (3U 
                                                   & vlTOPp->io_datamport_req_addrD))
                                                  ? (QData)((IData)(vlTOPp->SyncMemScala__DOT___tmpans_T_23))
                                                  : 
                                                 ((2U 
                                                   == 
                                                   (3U 
                                                    & vlTOPp->io_datamport_req_addrD))
                                                   ? 
                                                  (((QData)((IData)(
                                                                    ((0x80000000U 
                                                                      & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                      ? 0xffffffU
                                                                      : 0U))) 
                                                    << 0x10U) 
                                                   | (QData)((IData)(
                                                                     (0xffffU 
                                                                      & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                         >> 0x10U)))))
                                                   : 
                                                  ((1U 
                                                    == 
                                                    (3U 
                                                     & vlTOPp->io_datamport_req_addrD))
                                                    ? 
                                                   (((QData)((IData)(
                                                                     ((0x800000U 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                       ? 0xffffffU
                                                                       : 0U))) 
                                                     << 0x10U) 
                                                    | (QData)((IData)(
                                                                      (0xffffU 
                                                                       & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                          >> 8U)))))
                                                    : 
                                                   (((QData)((IData)(
                                                                     ((0x8000U 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                       ? 0xffffffU
                                                                       : 0U))) 
                                                     << 0x10U) 
                                                    | (QData)((IData)(
                                                                      (0xffffU 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)))))))
                                              : (QData)((IData)(
                                                                ((3U 
                                                                  == (IData)(vlTOPp->io_datamport_req_typ))
                                                                  ? vlTOPp->SyncMemScala__DOT___tmpans_T_70
                                                                  : 
                                                                 ((7U 
                                                                   == (IData)(vlTOPp->io_datamport_req_typ))
                                                                   ? vlTOPp->SyncMemScala__DOT___tmpans_T_70
                                                                   : 0U))))));
    vlTOPp->SyncMemScala__DOT___GEN_8 = ((1U == (IData)(vlTOPp->io_datamport_req_typ))
                                          ? (QData)((IData)(
                                                            (0xffU 
                                                             & ((3U 
                                                                 == 
                                                                 (3U 
                                                                  & vlTOPp->io_datamport_req_addrD))
                                                                 ? 
                                                                (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                 >> 0x18U)
                                                                 : 
                                                                ((2U 
                                                                  == 
                                                                  (3U 
                                                                   & vlTOPp->io_datamport_req_addrD))
                                                                  ? 
                                                                 (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                  >> 0x10U)
                                                                  : 
                                                                 ((1U 
                                                                   == 
                                                                   (3U 
                                                                    & vlTOPp->io_datamport_req_addrD))
                                                                   ? 
                                                                  (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                   >> 8U)
                                                                   : vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD))))))
                                          : ((5U == (IData)(vlTOPp->io_datamport_req_typ))
                                              ? (QData)((IData)(
                                                                ((3U 
                                                                  == 
                                                                  (3U 
                                                                   & vlTOPp->io_datamport_req_addrD))
                                                                  ? vlTOPp->SyncMemScala__DOT___tmpans_T_23
                                                                  : 
                                                                 ((2U 
                                                                   == 
                                                                   (3U 
                                                                    & vlTOPp->io_datamport_req_addrD))
                                                                   ? 
                                                                  ((((0x800000U 
                                                                      & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                      ? 0xffffffU
                                                                      : 0U) 
                                                                    << 8U) 
                                                                   | (0xffU 
                                                                      & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                         >> 0x10U)))
                                                                   : 
                                                                  ((1U 
                                                                    == 
                                                                    (3U 
                                                                     & vlTOPp->io_datamport_req_addrD))
                                                                    ? 
                                                                   ((((0x8000U 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                       ? 0xffffffU
                                                                       : 0U) 
                                                                     << 8U) 
                                                                    | (0xffU 
                                                                       & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                          >> 8U)))
                                                                    : 
                                                                   ((((0x80U 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                       ? 0xffffffU
                                                                       : 0U) 
                                                                     << 8U) 
                                                                    | (0xffU 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)))))))
                                              : vlTOPp->SyncMemScala__DOT___GEN_6));
    vlTOPp->io_datamport_resp_rdata = (IData)(vlTOPp->SyncMemScala__DOT___GEN_8);
}

VL_INLINE_OPT void VSyncMemScala::_combo__TOP__4(VSyncMemScala__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_combo__TOP__4\n"); );
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->SyncMemScala__DOT___tmpans_T_70 = ((3U 
                                                == 
                                                (3U 
                                                 & vlTOPp->io_datamport_req_addrD))
                                                ? (0xffU 
                                                   & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                      >> 0x18U))
                                                : (
                                                   (2U 
                                                    == 
                                                    (3U 
                                                     & vlTOPp->io_datamport_req_addrD))
                                                    ? 
                                                   (0xffffU 
                                                    & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                       >> 0x10U))
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (3U 
                                                      & vlTOPp->io_datamport_req_addrD))
                                                     ? 
                                                    (0xffffffU 
                                                     & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                        >> 8U))
                                                     : vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)));
    vlTOPp->SyncMemScala__DOT___GEN_6 = ((2U == (IData)(vlTOPp->io_datamport_req_typ))
                                          ? (QData)((IData)(
                                                            (0xffffU 
                                                             & ((3U 
                                                                 == 
                                                                 (3U 
                                                                  & vlTOPp->io_datamport_req_addrD))
                                                                 ? 
                                                                (0xffU 
                                                                 & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                    >> 0x18U))
                                                                 : 
                                                                ((2U 
                                                                  == 
                                                                  (3U 
                                                                   & vlTOPp->io_datamport_req_addrD))
                                                                  ? 
                                                                 (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                  >> 0x10U)
                                                                  : 
                                                                 ((1U 
                                                                   == 
                                                                   (3U 
                                                                    & vlTOPp->io_datamport_req_addrD))
                                                                   ? 
                                                                  (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                   >> 8U)
                                                                   : vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD))))))
                                          : ((6U == (IData)(vlTOPp->io_datamport_req_typ))
                                              ? ((3U 
                                                  == 
                                                  (3U 
                                                   & vlTOPp->io_datamport_req_addrD))
                                                  ? (QData)((IData)(vlTOPp->SyncMemScala__DOT___tmpans_T_23))
                                                  : 
                                                 ((2U 
                                                   == 
                                                   (3U 
                                                    & vlTOPp->io_datamport_req_addrD))
                                                   ? 
                                                  (((QData)((IData)(
                                                                    ((0x80000000U 
                                                                      & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                      ? 0xffffffU
                                                                      : 0U))) 
                                                    << 0x10U) 
                                                   | (QData)((IData)(
                                                                     (0xffffU 
                                                                      & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                         >> 0x10U)))))
                                                   : 
                                                  ((1U 
                                                    == 
                                                    (3U 
                                                     & vlTOPp->io_datamport_req_addrD))
                                                    ? 
                                                   (((QData)((IData)(
                                                                     ((0x800000U 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                       ? 0xffffffU
                                                                       : 0U))) 
                                                     << 0x10U) 
                                                    | (QData)((IData)(
                                                                      (0xffffU 
                                                                       & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                          >> 8U)))))
                                                    : 
                                                   (((QData)((IData)(
                                                                     ((0x8000U 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                       ? 0xffffffU
                                                                       : 0U))) 
                                                     << 0x10U) 
                                                    | (QData)((IData)(
                                                                      (0xffffU 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)))))))
                                              : (QData)((IData)(
                                                                ((3U 
                                                                  == (IData)(vlTOPp->io_datamport_req_typ))
                                                                  ? vlTOPp->SyncMemScala__DOT___tmpans_T_70
                                                                  : 
                                                                 ((7U 
                                                                   == (IData)(vlTOPp->io_datamport_req_typ))
                                                                   ? vlTOPp->SyncMemScala__DOT___tmpans_T_70
                                                                   : 0U))))));
    vlTOPp->SyncMemScala__DOT___GEN_8 = ((1U == (IData)(vlTOPp->io_datamport_req_typ))
                                          ? (QData)((IData)(
                                                            (0xffU 
                                                             & ((3U 
                                                                 == 
                                                                 (3U 
                                                                  & vlTOPp->io_datamport_req_addrD))
                                                                 ? 
                                                                (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                 >> 0x18U)
                                                                 : 
                                                                ((2U 
                                                                  == 
                                                                  (3U 
                                                                   & vlTOPp->io_datamport_req_addrD))
                                                                  ? 
                                                                 (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                  >> 0x10U)
                                                                  : 
                                                                 ((1U 
                                                                   == 
                                                                   (3U 
                                                                    & vlTOPp->io_datamport_req_addrD))
                                                                   ? 
                                                                  (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                   >> 8U)
                                                                   : vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD))))))
                                          : ((5U == (IData)(vlTOPp->io_datamport_req_typ))
                                              ? (QData)((IData)(
                                                                ((3U 
                                                                  == 
                                                                  (3U 
                                                                   & vlTOPp->io_datamport_req_addrD))
                                                                  ? vlTOPp->SyncMemScala__DOT___tmpans_T_23
                                                                  : 
                                                                 ((2U 
                                                                   == 
                                                                   (3U 
                                                                    & vlTOPp->io_datamport_req_addrD))
                                                                   ? 
                                                                  ((((0x800000U 
                                                                      & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                      ? 0xffffffU
                                                                      : 0U) 
                                                                    << 8U) 
                                                                   | (0xffU 
                                                                      & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                         >> 0x10U)))
                                                                   : 
                                                                  ((1U 
                                                                    == 
                                                                    (3U 
                                                                     & vlTOPp->io_datamport_req_addrD))
                                                                    ? 
                                                                   ((((0x8000U 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                       ? 0xffffffU
                                                                       : 0U) 
                                                                     << 8U) 
                                                                    | (0xffU 
                                                                       & (vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD 
                                                                          >> 8U)))
                                                                    : 
                                                                   ((((0x80U 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)
                                                                       ? 0xffffffU
                                                                       : 0U) 
                                                                     << 8U) 
                                                                    | (0xffU 
                                                                       & vlTOPp->SyncMemScala__DOT__syncmemblackbox_rdataD)))))))
                                              : vlTOPp->SyncMemScala__DOT___GEN_6));
    vlTOPp->io_datamport_resp_rdata = (IData)(vlTOPp->SyncMemScala__DOT___GEN_8);
}

void VSyncMemScala::_eval(VSyncMemScala__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_eval\n"); );
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clock) & (~ (IData)(vlTOPp->__Vclklast__TOP__clock)))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
    }
    vlTOPp->_combo__TOP__4(vlSymsp);
    // Final
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
}

void VSyncMemScala::_eval_initial(VSyncMemScala__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_eval_initial\n"); );
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
    vlTOPp->_initial__TOP__2(vlSymsp);
}

void VSyncMemScala::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::final\n"); );
    // Variables
    VSyncMemScala__Syms* __restrict vlSymsp = this->__VlSymsp;
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VSyncMemScala::_eval_settle(VSyncMemScala__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_eval_settle\n"); );
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__3(vlSymsp);
}

VL_INLINE_OPT QData VSyncMemScala::_change_request(VSyncMemScala__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_change_request\n"); );
    VSyncMemScala* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VSyncMemScala::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((io_instmport_req_renI & 0xfeU))) {
        Verilated::overWidthError("io_instmport_req_renI");}
    if (VL_UNLIKELY((io_datamport_req_fcn & 0xfeU))) {
        Verilated::overWidthError("io_datamport_req_fcn");}
    if (VL_UNLIKELY((io_datamport_req_typ & 0xf8U))) {
        Verilated::overWidthError("io_datamport_req_typ");}
}
#endif  // VL_DEBUG

void VSyncMemScala::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSyncMemScala::_ctor_var_reset\n"); );
    // Body
    clock = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    io_instmport_req_renI = VL_RAND_RESET_I(1);
    io_instmport_req_raddrI = VL_RAND_RESET_I(32);
    io_instmport_resp_rdata = VL_RAND_RESET_I(32);
    io_datamport_req_addrD = VL_RAND_RESET_I(32);
    io_datamport_req_wdataD = VL_RAND_RESET_I(32);
    io_datamport_req_fcn = VL_RAND_RESET_I(1);
    io_datamport_req_typ = VL_RAND_RESET_I(3);
    io_datamport_resp_rdata = VL_RAND_RESET_I(32);
    SyncMemScala__DOT__syncmemblackbox_rdataI = VL_RAND_RESET_I(32);
    SyncMemScala__DOT__syncmemblackbox_rdataD = VL_RAND_RESET_I(32);
    SyncMemScala__DOT___tmpans_T_23 = VL_RAND_RESET_I(32);
    SyncMemScala__DOT___tmpans_T_70 = VL_RAND_RESET_I(32);
    SyncMemScala__DOT___GEN_6 = VL_RAND_RESET_Q(40);
    SyncMemScala__DOT___GEN_8 = VL_RAND_RESET_Q(40);
    { int __Vi0=0; for (; __Vi0<32769; ++__Vi0) {
            SyncMemScala__DOT__syncmemblackbox__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }}
    SyncMemScala__DOT__syncmemblackbox__DOT____Vlvbound1 = VL_RAND_RESET_I(8);
}
