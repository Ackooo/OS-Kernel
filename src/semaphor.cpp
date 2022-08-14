#include "semaphor.h"
#include "locks.h"
#include "kernelS.h"


Semaphore::Semaphore(int init) {
	lock();
	myImpl = new KernelSem(init, this);
	unlock();
}

Semaphore::~Semaphore() {
	lock();
	if (myImpl != 0)
		delete myImpl;
	unlock();

}

int Semaphore::wait(Time maxTimeToWait) {
	lock();
	int i = myImpl->waitKn(maxTimeToWait);
	unlock();
	return i;
}

void Semaphore::signal() {
	lock();
	myImpl->signalKn();
	unlock();
}

int Semaphore::val() const {
	return myImpl->getValue();
}

