//
// Created by os on 8/25/23.
//

#include "../h/scheduler.hpp"

List<_thread> Scheduler::readyQueue;
_thread *Scheduler::get() {
    return readyQueue.removeFirst();
}

void Scheduler::put(_thread *thread) {
    readyQueue.addLast(thread);
}

