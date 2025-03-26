//
// Created by os on 9/3/23.
//

#include "../h/_sem.h"
#include "../h/MemAllocator.h"
#include "../h/syscall_c.hpp"

_sem *_sem::createSem(unsigned int init) {
    _sem* sem=(_sem*)MemAlloc::getInstance().mem_alloc((sizeof(_sem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    sem->value=init;
    sem->head= nullptr;
    sem->tail=nullptr;
    return sem;
}

void _sem::openSem(_sem **handle, unsigned int init) {
    _sem* temp = createSem(init);
    *handle= temp;
}

int _sem::closeSem(_sem *handle) {
    if(!handle)return -1;
    _thread* thread=handle->getThread();
    while(thread!= nullptr){
        thread->blocked=false;
        Scheduler::put(thread);
        thread=handle->getThread();
    }
    MemAlloc::getInstance().mem_free(handle);
    handle= nullptr;
    return 0;
}

int _sem::semWait(_sem *handle) {
    if(!handle)return -1;
    handle->value--;
    if(handle->value <0){
        handle->putThread(_thread::running);
        _thread::running->setBlocked(true);
        thread_dispatch();
    }
    return 0;
}

int _sem::semSignal(_sem *handle) {
    if(!handle)return -1;
    handle->value++;
    if(handle->value <=0){
        _thread* thread=handle->getThread();
        if(thread!= nullptr){
            thread->blocked=false;
            Scheduler::put(thread);
        }
    }
    return 0;
}

int _sem::semTryWait(_sem *handle) {
    if(!handle)return -1;
    handle->value--;
    if(handle->value <0){
        handle->value++;
        return 1;
    }
    return 0;
}


_thread *_sem::getThread() {
    //return blockedQueue.removeFirst();
    if(head== nullptr)return nullptr;
    _thread* ret=head->thread;
    Blocked* old=head;
    head=head->next;
    MemAlloc::getInstance().mem_free(old);
    return ret;
}

void _sem::putThread(_thread *thread) {
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