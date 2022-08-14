#include "queue.h"
#include "locks.h"
#include "SCHEDULE.H"
#include <iostream.h>
#include "kernelS.h"//blokiranana
#include "kernel.h"

QueueSem::QueueSem() {
	head = tail = curr = tmp = 0;
}
QueueSem::~QueueSem() {
	curr = head;
	if (!curr) {
		tmp = tail = 0;
	} else {
		while (curr) {
			tmp = curr;
			curr = curr->next;
			delete tmp;
		}
	}
}
void QueueSem::put(KernelSem* novi) {
	ElemSem* n = new ElemSem(novi);
	if (head) {
		tail->next = n;
		tail = n;
	} else {
		head = tail = n;
	}
}
void QueueSem::remove(KernelSem* rem) {
	tmp = 0;
	curr = head;
	while (curr && curr->ksem != rem) {
		tmp = curr;
		curr = curr->next;
	}
	if (!curr)
		return;
	if (curr == head) {
		if (head == 0)
			tail = 0;
		else {
			head = head->next;
			delete tmp;
		}
	} else if (curr == tail) {
		tail = tmp;
		delete curr;
		tail->next = 0;
	} else {
		tmp->next = curr->next;
		delete curr;
	}
}

QueuePCB::QueuePCB() {
	head = tail = curr = tmp = 0;
}
QueuePCB::~QueuePCB() {
	curr = head;
	if (!curr) {
		tmp = tail = 0;
	} else {
		while (curr) {
			tmp = curr;
			curr = curr->next;
			delete tmp;
		}
	}
}
void QueuePCB::put(PCB* novi, Time timemax) {
	ElemPCB* n = new ElemPCB(novi);

	if (timemax == 0) {
		n->timeslice = 65535;
	} //max
	else {
		n->timeslice = timemax;
	}
	if (head) {
		tail->next = n;
		tail = n;
	} else {
		head = tail = n;
	}
}
void QueuePCB::remove(PCB* rem) {
	tmp = 0;
	curr = head;
	while (curr && curr->pcb != rem) {
		tmp = curr;
		curr = curr->next;
	}
	if (!curr)
		return;
	if (curr == head) {
		if (head == 0)
			tail = 0;
		else {
			head = head->next;
			delete tmp;
		}
	} else if (curr == tail) {
		tail = tmp;
		delete curr;
		tail->next = 0;
	} else {
		tmp->next = curr->next;
		delete curr;
	}
}

PCB * QueuePCB::getFirst() {
	if (head == 0)
		return 0;
	else {
		PCB* t = head->pcb;
		tmp = head;
		head = head->next;
		if (head == 0)
			tail = 0;
		delete tmp;
		return t;
	}
}
PCB* QueuePCB::getID(ID pcbID) {
	for (ElemPCB* t = head; t != 0; t = t->next) {
		if (t->pcb->id == pcbID)
			return t->pcb;
	}
	return 0;
}
void QueueSem::signalTime() {
	for (ElemSem* t = head; t != 0; t = t->next) {
		QueuePCB* q = t->ksem->blockedThrd;
		for (ElemPCB* e = q->head; e != 0 && e->timeslice != 65535;) {
			if (--e->timeslice == 0) {
				t->ksem->value++;
				PCB* p = q->getFirst();
				if(p!=0){
						p->status = READY;
				Scheduler::put(p);
				}
				e = q->head;
			} else {
				e = e->next;
			}
		}
	}
}

