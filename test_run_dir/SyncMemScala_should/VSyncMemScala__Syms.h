// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef _VSYNCMEMSCALA__SYMS_H_
#define _VSYNCMEMSCALA__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODULE CLASSES
#include "VSyncMemScala.h"

// SYMS CLASS
class VSyncMemScala__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_didInit;
    
    // SUBCELL STATE
    VSyncMemScala*                 TOPp;
    
    // CREATORS
    VSyncMemScala__Syms(VSyncMemScala* topp, const char* namep);
    ~VSyncMemScala__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
