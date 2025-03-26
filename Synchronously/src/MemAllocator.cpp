//
// Created by os on 7/29/23.
//
#include "../h/MemAllocator.h"

void *MemAlloc::mem_alloc(size_t size) {
    if(size <= 0) return nullptr;
    size_t blocksSize = size * MEM_BLOCK_SIZE;
    static bool instanceExists=false;
    if(!instanceExists){
        instanceExists=true;
        head=(MemoryBlock*)((uint64 *)HEAP_START_ADDR);
        head->next=nullptr;
        head->prev=nullptr;
        head->size=((uint64)((uint64 *)HEAP_END_ADDR-(uint64 *)HEAP_START_ADDR)-sizeof(MemAlloc))/MEM_BLOCK_SIZE;
    }
    void* ret= nullptr;
    for(MemoryBlock* curr=head; curr != nullptr; curr=curr->next){
        if(curr->size < size) continue;
        ret=curr;
        if(curr->size == size){
            if(curr->prev){
                curr->prev->next = curr->next;
            }
            else{
                head=curr->next;
            }
            if(curr->next){
                curr->next->prev =curr->prev;
            }
            curr->size = size;
            break;
        }
        else{
            MemoryBlock* newFreeBlock = (MemoryBlock*)((uint64 *)curr + blocksSize);
            if(curr->prev){
                curr->prev->next=newFreeBlock;
            }
            else{
                head=newFreeBlock;
            }
            if(curr->next){
                curr->next->prev=newFreeBlock;
            }
            newFreeBlock->prev=curr->prev;
            newFreeBlock->next=curr->next;
            newFreeBlock->size= curr->size - size;
            curr->size = size;
            break;
        }
    }
    return (uint64 *) ret + sizeof (MemoryBlock);
}

MemAlloc& MemAlloc::getInstance() {
    static MemAlloc instance;
    return instance;
}

void MemAlloc::tryToJoin(MemoryBlock *curr) {
    size_t blocksSize = curr->size * MEM_BLOCK_SIZE;
    if(curr->next && (char*)(curr->next) == ((char*)curr + blocksSize)){
        curr->size+=curr->next->size;
        curr->next=curr->next->next;
        if(curr->next){
            curr->next->prev=curr;
        }
    }

}

int MemAlloc::mem_free(void *adr) {
    if(!adr) return -1;
    if((uint64 *)adr > (uint64*)HEAP_END_ADDR || (uint64 *)adr < (uint64 *)HEAP_START_ADDR)return -1;
    MemoryBlock* prev=0;
    if(head==nullptr || (char*)adr < (char*)head) {
        prev = 0;
    }
    else{
        for(prev = head; prev->next != 0 && (char*)adr > (char*)(prev->next); prev = prev->next);
    }
    MemoryBlock* seg = (MemoryBlock*) ((uint64*)adr - sizeof(MemoryBlock));
    seg->prev=prev;
    if(prev){
        seg->next=prev->next;
    }
    else {
        seg->next = head;
    }
    if(seg->next){
        seg->next->prev=seg;
    }
    if(prev){
        prev->next=seg;
    }
    else{
        head=seg;
    }
    if(seg!=nullptr){
        tryToJoin(seg);
    }
    if(prev!=nullptr){
        tryToJoin(prev);
    }
    return 0;
}

