#ifndef _IVT_H_
#define _IVT_H_

#include "event.h"
//#include "kernelE.h"

typedef void interrupt (*IntRut)(...);

//class Event;
class KernelEv;

class IVTEntry{
public:

	IVTEntry(IVTNo ivtNo, IntRut newRout); //nova rutina
	~IVTEntry();

	void signalEvent();
	void callOldRout();

	KernelEv* event;

	void addEvent(KernelEv* event);
	KernelEv* getEvent();//geter

	void setNewRout();
	void setOldRout();

	IntRut newRout;
	IntRut oldRout;

	IVTNo brojUlaza;
};

#endif
