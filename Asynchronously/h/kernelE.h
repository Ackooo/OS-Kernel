#ifndef _KERNELE_H_
#define _KERNELE_H_

#include "event.h"
#include "pcb.h"
#include "semaphor.h"
#include "kernel.h"

class KernelEv{
public:
	KernelEv(IVTNo ivtNo, Event* evnt);
	~KernelEv();

	void wait();
	void signal();

	int value;
	IVTEntry* entry;

	PCB* parentPCB;
	IVTNo brUlaza;
	Event* event;

};


#endif
