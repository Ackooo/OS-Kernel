#include "kernelE.h"
#include "locks.h"
#include "SCHEDULE.H"

KernelEv::KernelEv(IVTNo ivtNo, Event* evnt) {
	brUlaza = ivtNo;
	parentPCB = (PCB*) Kernel::runningPCB;
	value=1;
	event = evnt;
	//Kernel::ivTable[brUlaza]->addEvent(event->myImpl);//isto dole
	entry = Kernel::ivTable[brUlaza];
	entry->addEvent(this);
	entry->setNewRout();
}

void KernelEv::wait() {
	 if (Kernel::runningPCB == parentPCB && value == 1) {
	 value = 0;
	 Kernel::runningPCB->status = BLOCKED;
	 dispatch();
	 }
}

void KernelEv::signal() {
	 if (value == 0) {
	 value = 1;
	 parentPCB->status = READY;
	 Scheduler::put((PCB*) parentPCB);
	 dispatch();
	 }
}

KernelEv::~KernelEv() {
	KernelEv::signal();
	entry->setOldRout();
}
