#include "ivtE.h"
#include "locks.h"
#include "kernel.h"
#include <dos.h> //getvect
#include "kernelE.h"

IVTEntry::IVTEntry(IVTNo ivtNo, IntRut newRout) {
	this->newRout = newRout;
	oldRout = 0;
	brojUlaza = ivtNo;
	setNewRout();
	event = 0;
	Kernel::ivTable[brojUlaza] = this;
}
IVTEntry::~IVTEntry() {
	setOldRout();
	if (event != 0)
		event = 0;
	Kernel::ivTable[brojUlaza] = 0;
}
void IVTEntry::callOldRout() {
		(*oldRout)();
}
void IVTEntry::addEvent(KernelEv* ev) {
	event = ev;
}
void IVTEntry::signalEvent() {
	if (event != 0)
		event->signal();
}
KernelEv* IVTEntry::getEvent() {
	return event;
}
void IVTEntry::setNewRout() {
#ifndef BCC_BLOCK_IGNORE
	oldRout=getvect(brojUlaza);
	setvect(brojUlaza, newRout);
#endif
}

void IVTEntry::setOldRout() {
	lock();
#ifndef BCC_BLOCK_IGNORE
	setvect(brojUlaza, oldRout);
#endif
	oldRout=0;
	unlock();
}

