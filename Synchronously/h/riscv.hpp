//
// Created by os on 8/24/23.
//

#ifndef PROJECT_BASE_V1_1_RISCV_HPP
#define PROJECT_BASE_V1_1_RISCV_HPP

#include "../lib/hw.h"

constexpr uint64 MEM_ALLOC = 0x01;
constexpr uint64 MEM_FREE = 0x02;
constexpr uint64 THREAD_CREATE = 0x11;
constexpr uint64 THREAD_EXIT = 0x12;
constexpr uint64 THREAD_DISPATCH = 0x13;
constexpr uint64 THREAD_JOIN = 0x14;
constexpr uint64 THREAD_CREATE_CPP = 0x15;
constexpr uint64 SEM_OPEN = 0x21;
constexpr uint64 SEM_CLOSE = 0x22;
constexpr uint64 SEM_WAIT = 0x23;
constexpr uint64 SEM_SIGNAL = 0x24;
constexpr uint64 SEM_TIMEDWAIT = 0x25;
constexpr uint64 SEM_TRYWAIT = 0x26;
constexpr uint64 USER_MODE = 0x27;
constexpr uint64 GETC = 0x41;
constexpr uint64 PUTC = 0x42;

extern "C" void vector_table();
//extern uint32 vector_table;

class Riscv
{
public:
    static void popSppSpie();
    static void pushRegisters();
    static void popRegisters();

    static uint64 r_scause();
    static void w_scause(uint64 scause);
    static uint64 r_sepc();
    static void w_sepc(uint64 sepc);
    static uint64 r_stvec();
    static void w_stvec(uint64 stvec);
    static uint64 r_stval();
    static void w_stval(uint64 stval);

    enum BitMaskSip{
        SIP_SSIP = (1 << 1),
        SIP_STIP = (1 << 5),
        SIP_SEIP = (1 << 9)
    };

    static void ms_sip(uint64 mask);
    static void mc_sip(uint64 mask);
    static uint64 r_sip();
    static void w_sip(uint64 sip);

    enum BitMaskSstatus{
        SSTATUS_SIE = (1 << 1),
        SSTATUS_SPIE = (1 << 5),
        SSTATUS_SPP = (1 << 8)
    };

    static void ms_sstatus(uint64 mask);
    static void mc_sstatus(uint64 mask);
    static uint64 r_sstatus();
    static void w_sstatus(uint64 sstatus);

    static uint64 r_a0();
    static uint64 r_a1();
    static uint64 r_a2();
    static uint64 r_a3();
    static uint64 r_ret();
    static void w_a0(uint64 a0);
    static void w_a1(uint64 a1);
    static void w_a2(uint64 a2);
    static void w_a3(uint64 a3);
    static void w_ret(uint64 a0);
    static void ecall();

private:
    // supervisor trap handler
    static void handleSupervisorTrap();
    static void handleTimerTrap();
    static void handleConsoleTrap();
};

inline uint64 Riscv::r_scause(){
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    return scause;
}
inline void Riscv::w_scause(uint64 scause){
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}
inline uint64 Riscv::r_sepc(){
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    return sepc;
}
inline void Riscv::w_sepc(uint64 sepc){
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
}
inline uint64 Riscv::r_stvec(){
    uint64 volatile stvec;
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}
inline void Riscv::w_stvec(uint64 stvec){
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
}
inline uint64 Riscv::r_stval(){
    uint64 volatile stval;
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    return stval;
}
inline void Riscv::w_stval(uint64 stval){
    __asm__ volatile  ("csrw stval, %[stval]" : : [stval] "r"(stval));
}
inline void Riscv::ms_sip(uint64 mask){
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"(mask));
}
inline void Riscv::mc_sip(uint64 mask){
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
}
inline uint64 Riscv::r_sip(){
    uint64 volatile sip;
    __asm__ volatile ("csrr %[sip], sip" : [sip] "=r"(sip));
    return sip;
}
inline void Riscv::w_sip(uint64 sip){
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}
inline void Riscv::ms_sstatus(uint64 mask){
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
}
inline void Riscv::mc_sstatus(uint64 mask){
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
};
inline uint64 Riscv::r_sstatus(){
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    return sstatus;
};
inline void Riscv::w_sstatus(uint64 sstatus){
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
};
inline uint64 Riscv::r_a0() {
    /*uint64 volatile a0;
    __asm__ volatile ("ld %0, 10*8(fp)" : "=r"(a0));
    return a0;*/
    uint64 volatile a0;
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    return a0;
}
inline uint64 Riscv::r_a1() {
    /*uint64 volatile a1;
    __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(a1));
    return a1;*/
    uint64 volatile a1;
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    return a1;
}

inline uint64 Riscv::r_a2() {
    uint64 volatile a2;
    __asm__ volatile("mv %0, a2" : "=r" (a2));
    return a2;
}

inline uint64 Riscv::r_a3() {
    uint64 volatile a3;
    __asm__ volatile("mv %0, a3" : "=r" (a3));
    return a3;
}
inline void Riscv::w_a0(uint64 a0) {
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
}
inline void Riscv::w_a1(uint64 a1) {
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
}
inline void Riscv::w_a2(uint64 a2) {
    __asm__ volatile ("mv a2, %0" : : "r"(a2));
}
inline void Riscv::w_a3(uint64 a3) {
    __asm__ volatile ("mv a3, %0" : : "r"(a3));
}
//a0 stack
inline uint64 Riscv::r_ret(){
    uint64 volatile a0;
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    return a0;
}
inline void Riscv::w_ret(uint64 ret) {
    /*
     * __asm__ volatile ("sd %0, 10*8(fp)" : : "r"(a0));
     * */
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
}
inline void Riscv::ecall() {
    __asm__ volatile ("ecall");
}

#endif //PROJECT_BASE_V1_1_RISCV_HPP
