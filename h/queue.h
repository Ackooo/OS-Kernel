#ifndef _QUEUE_H_
#define _QUEUE_H_

#include "pcb.h"
#include "kernelS.h"
#include "semaphor.h"

class PCB;

struct ElemSem{
public:
	KernelSem* ksem;
	ElemSem* next;
	ElemSem(KernelSem* novi){
		ksem=novi;
		next=0;
	}
};

class QueueSem{
public:
	ElemSem* head;
	ElemSem* tail;
	ElemSem* curr;
	ElemSem* tmp;

	QueueSem();
	virtual ~QueueSem();
	void put(KernelSem* novi);
	void remove(KernelSem* rem);

	void signalTime();
};

struct ElemPCB{
public:
	PCB* pcb;
	Time timeslice;//dodatno
	ElemPCB* next;
	ElemPCB(PCB* novi){
	pcb=novi;
	next=0;
	timeslice=65535;
	}
};

class QueuePCB{
public:
	ElemPCB* head;
	ElemPCB* tail;
	ElemPCB* curr;
	ElemPCB* tmp;

	QueuePCB();
	virtual ~QueuePCB();
	void put(PCB* novi, Time timemax=0);
	void remove(PCB* rem);
	PCB* getFirst();
	PCB* getID(ID pcbID);
};

#endif
