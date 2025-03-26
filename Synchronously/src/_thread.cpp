//
// Created by os on 8/26/23.
//

#include "../h/_thread.hpp"
#include "../h/riscv.hpp"
#include "../h/MemAllocator.h"
#include "../h/syscall_c.hpp"

_thread* _thread::running=nullptr;

void _thread::dispatch()
{
    _thread *old = running;
    if (!old->isFinished() && !old->blocked) { Scheduler::put(old); }
    running = Scheduler::get();
    _thread::contextSwitch(&old->context, &running->context);
}

_thread* _thread::createThread(_thread::Body body, _thread **handle, void *arg, uint64* stack) {
    _thread* ptr = createControlBlock(body, arg, stack);
    *handle= ptr;
    if (body != nullptr) { Scheduler::put(*handle);}
    return ptr;
}

_thread *_thread::createCPPThread(_thread::Body body, _thread **handle, void *arg, uint64 *stack) {
    _thread* ptr = createControlBlock(body, arg, stack);
    *handle= ptr;
    return ptr;
}


_thread *_thread::createControlBlock(_thread::Body body, void *arg, uint64 *stack) {
    _thread* temp=(_thread*)MemAlloc::getInstance().mem_alloc((sizeof(_thread) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    temp->body=body;
    if(body!= nullptr)temp->stack=stack;
    else stack= nullptr;
    temp->context={(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    temp->fArg=arg;
    temp->finished=false;
    temp->blocked=false;

    //
    //temp->blockedQueue=new List<_thread>;

    temp->head=nullptr;
    temp->tail=nullptr;

    return temp;
}

void _thread::threadWrapper()
{
    Riscv::popSppSpie();
    running->body(running->fArg);
    running->setFinished(true);
    //
    _thread* thread=running->getThread();
    while(thread!= nullptr){
        thread->blocked=false;
        Scheduler::put(thread);
        thread=running->getThread();
    }
    //
    thread_dispatch();
}

void _thread::join(_thread *handle) {
    handle->putThread(_thread::running);
    _thread::running->setBlocked(true);
    thread_dispatch();
}

_thread *_thread::getThread() {
    //return blockedQueue.removeFirst();
    if(head== nullptr)return nullptr;
    _thread* ret=head->thread;
    Blocked* old=head;
    head=head->next;
    MemAlloc::getInstance().mem_free(old);
    return ret;
}

void _thread::putThread(_thread *thread) {
    //blockedQueue.addLast(thread);
    Blocked* temp=(Blocked*)MemAlloc::getInstance().mem_alloc((sizeof(Blocked) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    temp->thread=thread;
    temp->next= nullptr;
    if(head==nullptr){
        head=tail=temp;
    }
    else {
        tail->next=temp;
        tail=tail->next;
    }
}