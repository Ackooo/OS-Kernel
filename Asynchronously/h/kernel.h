#ifndef _KERNEL_H_
#define _KERNEL_H_

#include "thread.h"
#include "queue.h"
#include "thIdle.h"
#include "ivtE.h"

class Kernel{
public:
	static void kernelON();
	static void kernelOFF();

	static IVTEntry* ivTable[256];

	static QueuePCB* allPCB;
	static QueueSem* allSems;

	static volatile PCB* runningPCB;
	static ThreadIdle* idleThread;
	static Thread* mainThread;

	static volatile int requestedContextSwitch;
	static volatile int timeOut;

	static void interrupt Timer(...);
	static void interrupt (*oldRout)(...);
};
extern void tick();

#endif
