#include "kernelS.h"
#include "locks.h"
#include "kernel.h"
#include "SCHEDULE.H"
#include <IOSTREAM.H>

KernelSem::KernelSem(int init, Semaphore* s) {
	value = init;
	sem = s;
	blockedThrd= new QueuePCB();
	Kernel::allSems->put(this);
}

KernelSem::~KernelSem() {
	Kernel::allSems->remove(this);
	delete blockedThrd;
	value=0;
}

void KernelSem::signalKn() {
	if(value++ < 0){
		PCB* p = blockedThrd->getFirst();
		p->status=READY;
		p->deblockWithSignal=1;
		Scheduler::put(p);
	}
}

int KernelSem::waitKn(Time maxTimeToWait) {
	if(--value<0){
		Kernel::runningPCB->status=BLOCKED;
		blockedThrd->put((PCB*)Kernel::runningPCB, maxTimeToWait);
		dispatch();
	}
	if(Kernel::runningPCB->deblockWithSignal==1){
		Kernel::runningPCB->deblockWithSignal=0;
		return 1;
	}
	else{
		return 0;
	}
}

int KernelSem::getValue() {
	return value;
}
