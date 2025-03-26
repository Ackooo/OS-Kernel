//
// Created by os on 9/2/23.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_C_HPP
#define PROJECT_BASE_V1_1_SYSCALL_C_HPP
#include "../lib/hw.h"
#include "../lib/console.h"

void* mem_alloc (size_t size);

int mem_free (void* adr);

class _thread;
typedef _thread* thread_t;
int thread_create (
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);

int thread_createCPP (
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);
int thread_exit ();

void thread_dispatch ();

void thread_join(thread_t handle);

//class Sem;
//typedef Sem* sem_t;
class _sem;
typedef _sem* sem_t;
int sem_open (
        sem_t* handle,
        unsigned init
);

int sem_close (sem_t handle);

int sem_wait (sem_t id);

int sem_signal (sem_t id);

int sem_trywait(sem_t id);

char getc();
void putc(char c);

void goToUserMode();

#endif //PROJECT_BASE_V1_1_SYSCALL_C_HPP