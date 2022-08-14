#ifndef _KERNELS_H_
#define _KERNELS_H_

#include "queue.h"
class QueuePCB;
class QueueSem; // declaration missing
//class Semaphore;
#include "semaphor.h"

class KernelSem {
public:
	KernelSem(int init, Semaphore* s);
	~KernelSem();

	int waitKn(Time maxTimeToWait);
	void signalKn();

	int getValue();
	Semaphore* sem;
	int value;

	QueuePCB* blockedThrd;
	static void timerInform();

private:
	static QueueSem* allSems;

};

#endif
