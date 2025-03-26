//
// Created by os on 9/2/23.
//
#ifndef _syscall_cpp
#define _syscall_cpp
#include "syscall_c.hpp"

void* operator new (size_t);
void operator delete (void*)noexcept;

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    void join();
    static void dispatch ();
protected:
    Thread ();
    virtual void run () {}
private:
    thread_t myHandle;
    static void wrapper(void* thrd);
    //void (*body)(void*); void* arg;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait ();
    int signal ();
    //int timedWait(time_t);
    int tryWait();
private:
    sem_t myHandle;
};

class Console {
public:
    static char getc ();
    static void putc (char);
};

#endif