//
// Created by os on 9/3/23.
//

#ifndef PROJECT_BASE_V1_1__SEM_HPP
#define PROJECT_BASE_V1_1__SEM_HPP
#include "_thread.hpp"
/*
struct Blocked{
    _thread* thread;
    Blocked* next=nullptr;
};
*/
class _sem {
    int value;
    //List<_thread> blockedQueue;
    _thread* getThread();
    void putThread(_thread *thread);

    Blocked* head;
    Blocked* tail;


    static _sem* createSem(unsigned init);
public:
    static void openSem(_sem** handle, unsigned init);
    static int closeSem(_sem* handle);
    static int semWait(_sem* handle);
    static int semSignal(_sem* handle);
    static int semTryWait(_sem* handle);

    friend class Riscv;

};

#endif //PROJECT_BASE_V1_1__SEM_HPP