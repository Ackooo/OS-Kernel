#ifndef _THREAD_IDLE_H_
#define _THREAD_IDLE_H_

#include "thread.h"
#include "pcb.h"

class ThreadIdle:public Thread{
public:
	ThreadIdle(StackSize stackSize, Time timeSlice);
	void start();
	virtual void run();
	PCB* getPCBIdle();
};
#endif
