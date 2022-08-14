#include "pcb.h"
#include "locks.h"
#include "queue.h"
#include <dos.h>//FP_OFF
#include "kernel.h"

#include "SCHEDULE.H"

ID PCB::statID=0;

PCB::PCB(Thread* thread, StackSize stackSize, Time timeslice){
	lock();
	if (stackSize > 65534)//65535
			stackSize = 65534;
	stackSize /= sizeof(unsigned);

	this->timeSlice = timeSlice;
	this->stackSize = stackSize;
	this->threadPCB = thread;
	queueMyBlocked = new QueuePCB();

	stack = 0;
	sp = 0;
	ss = 0;
	bp = 0;
	deblockWithSignal = 0;
	status=NEW;
	id= ++statID;

	timeRunning = 0;
	timeBlocked = 0;
	timeBlockedMax = 0;

	stack = new unsigned[stackSize];
#ifndef BCC_BLOCK_IGNORE
	stack[stackSize - 1] = 0x200;	//setovanje I flega u pocetnom PSW-u za nit
	stack[stackSize - 2] = FP_SEG(&PCB::wrapper);//postavljanje adrese funkcije koju ce nit da izvrsava
	stack[stackSize - 3] = FP_OFF(&PCB::wrapper);
	ss= FP_SEG(stack+stackSize-12);//svi sacuvani registri pri ulasku u interrupt rutinu
	sp= FP_OFF(stack+stackSize-12);
#endif
	bp = sp;
	unlock();
}
PCB::~PCB() {
	lock();
	if (stack != 0)
		delete[] stack;
	delete queueMyBlocked;
	Kernel::allPCB->remove(this);
	unlock();

}
void PCB::wrapper() {
	Kernel::runningPCB->threadPCB->run();			//isto def str. 9
	lock();
	PCB* p;
	//signalAll
	while((p=Kernel::runningPCB->queueMyBlocked->getFirst()) !=0){
		p->status=READY;
		Scheduler::put(p);
	}
	Kernel::runningPCB->status=FINISHED;
	dispatch();
	unlock();

}
ID PCB::getPCBID() {
	return this->id;
}




