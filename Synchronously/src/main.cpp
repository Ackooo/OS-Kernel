//
// Created by os on 8/6/22.
//
#include "../h/syscall_c.hpp"
#include "../h/riscv.hpp"
#include "../h/_thread.hpp"
#include "../h/MemAllocator.h"
#include "../test/printing.hpp"


// TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)
#include "../test/Threads_C_API_test.hpp"
// TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)
#include "../test/Threads_CPP_API_test.hpp"
// TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)
#include "../test/System_Mode_test.hpp"
// TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)
#include "../test/ConsumerProducer_C_API_test.hpp"
// TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)
#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp"

void userMain(){
    printString("USERMAIN \n");
    //Threads_C_API_test();
    //printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");

    //Threads_CPP_API_test();
    //printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");

    //producerConsumer_C_API();
    //printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");

    //producerConsumer_CPP_Sync_API();
    //printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");

    printString("USERMAIN_ENDED \n");


    System_Mode_test();
    printString("Test se nije uspesno zavrsio\n");
    //printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
};




void main() {
   __asm__ volatile ("csrw stvec, %[vector]" : : [vector] "r"((uint64) (&vector_table) | 0x01));
   Riscv::ms_sstatus(0x02);
    _thread* nit;
    thread_create(&nit, nullptr, nullptr);
    _thread::running=nit;
    goToUserMode();
    userMain();
    while(Scheduler::get())thread_dispatch();
    MemAlloc::getInstance().mem_free(nit);
    printString("MAIN_ENDED \n");
}

