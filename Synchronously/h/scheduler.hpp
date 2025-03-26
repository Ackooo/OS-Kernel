//
// Created by os on 8/25/23.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP

#include "../h/list.hpp"

class _thread;
class Scheduler {
private:
    static List<_thread> readyQueue;
public:
    static _thread *get();
    static void put(_thread *thread);
};


#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP