#include "event.h"
#include "kernelE.h"
//
#include "kernel.h"
#include "locks.h"

Event::Event(IVTNo ivtNo) {
	lock();
	myImpl = new KernelEv(ivtNo, this);
	unlock();
}

void Event::wait() {
	lock();
	myImpl->wait();
	unlock();
}

void Event::signal() {
	myImpl->signal();
}

Event::~Event() {
	lock();
	delete myImpl;
	unlock();
}
