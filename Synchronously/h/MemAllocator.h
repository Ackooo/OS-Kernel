//
// Created by os on 7/29/23.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#include "../lib/hw.h"
struct MemoryBlock{
    MemoryBlock* next;
    MemoryBlock* prev;
    size_t size;
};
class MemAlloc {
    void tryToJoin(MemoryBlock* curr);

    MemoryBlock *head=nullptr;
public:
    static MemAlloc& getInstance();

    void *mem_alloc(size_t size);
    int mem_free(void* adr);

};
#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
