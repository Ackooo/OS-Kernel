//
// Created by os on 8/24/23.
//
#include "../lib/console.h"
#include "../h/riscv.hpp"
#include "../h/_thread.hpp"
#include "../h/_sem.h"
#include "../test/printing.hpp"

void Riscv::popSppSpie() {
        __asm__ volatile("csrw sepc, ra");
        __asm__ volatile("sret");
}

void Riscv::handleSupervisorTrap() {
    uint64 scause = r_scause();

    //sistemski poziv
    if (scause == (0x09) || scause == 0x08)
    {
        // interrupt: no, caouse code: environment call from S-mode (9)
        uint64 volatile sepc = r_sepc();
        uint64 volatile sstatus = r_sstatus();
        uint64 cause = r_a0();
        if (cause == MEM_ALLOC) {
            uint64 size = r_a1();
            void *ret = MemAlloc::getInstance().mem_alloc(size);
            __asm__ volatile ("mv a0, %[addr]" : : [addr]"r"(ret));
        }
        else if (cause == MEM_FREE) {
            uint64 p = r_a1();
            uint ret = MemAlloc::getInstance().mem_free((void *)p);
            w_ret(ret);
        }
        else if(cause == THREAD_CREATE){
            uint64 tempHandle = r_a1();
            _thread** handle=(_thread**)tempHandle;
            uint64 startRoutine = r_a2();
            using Body = void (*)(void*);
            void* arg=(void*)r_a3();
            uint64* stack=(uint64*)MemAlloc::getInstance().mem_alloc((DEFAULT_STACK_SIZE+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
            _thread::createThread((Body)startRoutine, handle, arg, stack);
            if(handle== nullptr){
                w_ret(-1);
            }else{
                w_ret(0);
            }
        }
        else if(cause == THREAD_EXIT){
            if(!_thread::running->isBlocked() && !_thread::running->isFinished()){
                _thread::running->setFinished(true);
                _thread* thread=_thread::running->getThread();
                while(thread!= nullptr){
                    thread->blocked=false;
                    Scheduler::put(thread);
                    thread=_thread::running->getThread();
                }
                _thread::dispatch();
                w_ret(0);
            }else{
                w_ret(-1);
            }
        }
        else if(cause == THREAD_DISPATCH){
            _thread::dispatch();
        }
        else if(cause == THREAD_JOIN){
            uint64 temp = r_a1();
            _thread* handle=(_thread*)temp;
            handle->join(handle);
        }

        else if(cause == THREAD_CREATE_CPP){
            uint64 tempHandle = r_a1();
            _thread** handle=(_thread**)tempHandle;
            uint64 startRoutine = r_a2();
            using Body = void (*)(void*);
            void* arg=(void*)r_a3();
            uint64* stack=(uint64*)MemAlloc::getInstance().mem_alloc((DEFAULT_STACK_SIZE+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
            _thread::createCPPThread((Body)startRoutine, handle, arg, stack);
            if(handle== nullptr){
                w_ret(-1);
            }else{
                w_ret(0);
            }
        }
        else if(cause == SEM_OPEN){
            uint64 temp = r_a1();
            _sem** handle=(_sem**)temp;
            uint64 init = r_a2();
            _sem::openSem(handle,init);
            if(handle== nullptr){
                w_ret(-1);
            }else{
                w_ret(0);
            }
        }
        else if(cause == SEM_CLOSE){
            uint64 temp = r_a1();
            _sem* handle=(_sem*)temp;
            int ret=_sem::closeSem(handle);
            w_ret(ret);
        }
        else if(cause == SEM_WAIT){
            uint64 temp = r_a1();
            _sem* handle=(_sem*)temp;
            int ret=_sem::semWait(handle);
            w_ret(ret);
        }
        else if(cause == SEM_SIGNAL){
            uint64 temp = r_a1();
            _sem* handle=(_sem*)temp;
            int ret=_sem::semSignal(handle);
            w_ret(ret);
        }
        else if(cause == SEM_TRYWAIT){
            uint64 temp = r_a1();
            _sem* handle=(_sem*)temp;
            int ret=_sem::semTryWait(handle);
            w_ret(ret);
        }
            //change to user mode
        else if(cause == USER_MODE){
            w_sstatus(sstatus);
            mc_sstatus(1<<8);
            w_sepc(sepc + 4);
            mc_sip(SIP_SSIP);
            return;
        }
        else if(cause == GETC){
            char c=__getc();
            w_ret(c);
        }
        else if(cause == PUTC){
            uint64 c = r_a1();
            __putc((char)c);
        }
        w_sstatus(sstatus);
        w_sepc(sepc + 4);
        mc_sip(SIP_SSIP);
    }
    else
    {
        // unexpected trap cause
        printString("unexpected trap cause \n");
        printString("scause: ");
        printInt(scause);
        printString("\n sepc:");
        printInt(r_sepc());
        printString("\n stval:");
        printInt(r_stval());
        while (true )printString("");
    }

}

void Riscv::handleTimerTrap(){
    uint64 scause = r_scause();
    if (scause == 0x8000000000000001UL) {
        //interrupt: yes, cause code: supervisor software interupt (timer)
        //9223372036854775809
        uint64 volatile sstatus = r_sstatus();
        uint64 volatile sepc = r_sepc();
        mc_sip(SIP_SSIP);
        w_sstatus(sstatus);
        //w_sepc(sepc + 4);
        w_sepc(sepc);
    }else{
        printString("unexpected trap cause - TIMER handler \n");
        printString("scause: ");
        printInt(scause);
        printString("\n sepc:");
        printInt(r_sepc());
        printString("\n stval:");
        printInt(r_stval());
        while (true )printString("");
    }
}

void Riscv::handleConsoleTrap() {
    uint64 scause = r_scause();
    if (scause== 0x8000000000000009UL)
    {
        //interrupt: yes, cause code: supervisor external interupt (console)
        console_handler();
    }
    else{
        printString("unexpected trap cause - CONSOLE handler \n");
        printString("scause: ");
        printInt(scause);
        printString("\n sepc:");
        printInt(r_sepc());
        printString("\n stval:");
        printInt(r_stval());
        while (true )printString("");
    }
}