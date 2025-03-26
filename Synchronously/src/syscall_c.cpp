//
// Created by os on 9/2/23.
//
#include "../h/syscall_c.hpp"
#include "../h/riscv.hpp"

void *mem_alloc(size_t size) {
    size_t sz=(size+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    Riscv::w_a1(sz);
    Riscv::w_a0(MEM_ALLOC);
    Riscv::ecall();
    uint64 ret = Riscv::r_a0();
    return (void*) ret;
}

int mem_free(void * adr) {
    Riscv::w_a1((uint64)adr);
    Riscv::w_a0(MEM_FREE);
    Riscv::ecall();
    uint64 ret = Riscv::r_a0();
    return ret;
}

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    Riscv::w_a3((uint64)arg);
    Riscv::w_a2((uint64)start_routine);
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(THREAD_CREATE);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}

int thread_createCPP(thread_t *handle, void (*start_routine)(void *), void *arg) {
    Riscv::w_a3((uint64)arg);
    Riscv::w_a2((uint64)start_routine);
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(THREAD_CREATE_CPP);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}

int thread_exit() {
    Riscv::w_a0(THREAD_EXIT);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}

void thread_dispatch() {
    Riscv::w_a0(THREAD_DISPATCH);
    Riscv::ecall();
    return;
}

void thread_join(thread_t handle){
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(THREAD_JOIN);
    Riscv::ecall();
}

int sem_open(sem_t *handle, unsigned int init) {
    Riscv::w_a2(init);
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(SEM_OPEN);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}

int sem_close(sem_t handle) {
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(SEM_CLOSE);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}

int sem_wait(sem_t id) {
    Riscv::w_a1((uint64) id);
    Riscv::w_a0(SEM_WAIT);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}

int sem_signal(sem_t id) {
    Riscv::w_a1((uint64)id);
    Riscv::w_a0(SEM_SIGNAL);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}

int sem_trywait(sem_t id){
    Riscv::w_a1((uint64) id);
    Riscv::w_a0(SEM_TRYWAIT);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}

char getc()
{
    Riscv::w_a0(GETC);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    //return ret;
    return (char)ret;
}
void putc(char c)
{
    Riscv::w_a1((uint64)c);
    Riscv::w_a0(PUTC);
    Riscv::ecall();
}

void goToUserMode() {
    Riscv::w_a0(USER_MODE);
    Riscv::ecall();
    return;
}
