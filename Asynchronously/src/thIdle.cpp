#include "thIDle.h"
#include "locks.h"

ThreadIdle::ThreadIdle(StackSize stackSize, Time timeSlice): Thread(stackSize,/* timeSlice*/1){
	lock();
	myPCB->status=NEW;
	unlock();
}

PCB* ThreadIdle::getPCBIdle(){
	return myPCB;
}
void ThreadIdle::run(){
	while(1){
		//cout<<"idle \n";
	}
}
void ThreadIdle::start(){
	lock();
	myPCB->status=READY;//IDLE
	unlock();
}
