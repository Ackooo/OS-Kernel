#include "thread.h"
#include "pcb.h"
#include "SCHEDULE.H"
#include "locks.h"
#include "kernel.h"
#include "queue.h"
#include <IOSTREAM.H>

Thread::Thread(StackSize stackSize, Time timeSlice) {
	lock();
	myPCB = new PCB(this, stackSize, timeSlice);
	if (myPCB != Kernel::idleThread->getPCBIdle())
		Kernel::allPCB->put(this->myPCB, timeSlice);
	unlock();
}

void Thread::start() {
	lock();
	if (myPCB->status == NEW) {
		myPCB->status = READY;
		Scheduler::put(myPCB);
	}
	unlock();
}

ID Thread::getId() {
	return myPCB->getPCBID();
}
ID Thread::getRunningId() {
	return ((PCB*) Kernel::runningPCB)->getPCBID();
}
Thread* Thread::getThreadById(ID id) {
	PCB* tek = Kernel::allPCB->getID(id);
	if (tek == 0)
		return 0;
	else
		return tek->threadPCB;
}
void Thread::waitToComplete() {
	lock();
	if (this->myPCB == Kernel::runningPCB
			|| this->myPCB == Kernel::idleThread->getPCBIdle()
			|| this->myPCB->status == NEW || this->myPCB->status == FINISHED
			|| myPCB == Kernel::mainThread) {
		unlock();
		return;
	} //nit ne ceka samu sebe; ne cekamo idle||pocetna||zavrsila
	Kernel::runningPCB->status = BLOCKED;
	myPCB->queueMyBlocked->put((PCB*)Kernel::runningPCB);
	dispatch();
	unlock();
}
Thread::~Thread() {
	waitToComplete();
	lock();
	delete myPCB;
	unlock();
}
void dispatch() {
	int_lock();
	Kernel::requestedContextSwitch = 1;	//context switch on demand
	Kernel::Timer();
	int_unlock();
}

