#ifndef _PCB_H_
#define _PCB_H_

#include "thread.h"

#include "kernelS.h"

enum threadStatus {
 NEW, READY, BLOCKED, RUNNING, FINISHED, IDLE
 };

class QueuePCB;	//declaration missing
class KernelSem;
class PCB {
public:
	PCB(Thread* thread, StackSize stackSize, Time timeslice);
	~PCB();

	unsigned sp;
	unsigned ss;
	unsigned bp;
	unsigned* stack;
	threadStatus status;
	int deblockWithSignal;

	StackSize stackSize;
	Time timeSlice;

	Thread* threadPCB;

	QueuePCB* queueMyBlocked;//dodatno

	static ID statID;
	ID id;
	ID getPCBID();

	static void wrapper();
	friend class Thread;

	Time timeRunning;
	Time timeBlocked;
	volatile Time timeBlockedMax;

};

#endif
