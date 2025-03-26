//
// Created by os on 9/2/23.
//
#include "../h/syscall_cpp.hpp"
#include "../h/_thread.hpp"

void *operator new(size_t size) {
    return mem_alloc(size);
}

void operator delete(void * adr) noexcept{
mem_free(adr);
}

Thread::Thread(void (*body)(void *), void *arg){
    thread_createCPP(&myHandle,body,arg);
}

Thread::~Thread() {
    delete myHandle;
}

int Thread::start() {
    Scheduler::put(myHandle);
    return 0;
}

void Thread::join() {
    thread_join(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

void Thread::wrapper(void *thrd) {
    Thread* temp=(Thread*)thrd;
    temp->run();
}

Thread::Thread() {
    thread_createCPP(&myHandle, wrapper, this);
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

int Semaphore::tryWait() {
    return sem_trywait(myHandle);
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}