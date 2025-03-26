//
// Created by os on 8/26/23.
//

#ifndef PROJECT_BASE_V1_1__THREAD_HPP
#define PROJECT_BASE_V1_1__THREAD_HPP

#include "../lib/hw.h"
#include "scheduler.hpp"
#include "MemAllocator.h"

struct Blocked{
    _thread* thread;
    Blocked* next=nullptr;
};

class _thread
{
public:
    ~_thread() {
        MemAlloc::getInstance().mem_free(stack);
    }
    using Body = void (*)(void*);

    static _thread *createThread(Body body, _thread** handle, void* arg, uint64* stack);
    static _thread *createCPPThread(Body body, _thread** handle, void* arg, uint64* stack);

    static _thread *running;

    static void join(_thread* handle);

    //get set
    bool isFinished() const{return finished;};
    void setFinished(bool finished){_thread::finished = finished;};
    bool isBlocked() const{return blocked;};
    void setBlocked(bool blocked){_thread::blocked = blocked;};

private:
    friend class _sem;
    friend class Riscv;

    static _thread* createControlBlock(Body body, void* arg, uint64* stack);
    struct Context
    {
        uint64 ra;// mesto gde se vracamo
        uint64 sp;// SPointer gde je
    };

    Body body;
    void* fArg;
    uint64 *stack;//pocetak, ide ka visim a stek kao struktura pocinje sa najvise i smanjuje se, kako se stvari stavljaju na njega
    Context context;
    bool finished;
    bool blocked;

    //List<_thread> blockedQueue;
    Blocked* head;
    Blocked* tail;
    _thread* getThread();
    void putThread(_thread *thread);

    static void threadWrapper();
    static void contextSwitch(Context *oldContext, Context *runningContext);
    static void dispatch();
};


#endif //PROJECT_BASE_V1_1__THREAD_HPP
