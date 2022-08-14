#ifndef _event_h_
#define _event_h_

typedef unsigned char IVTNo;

#include "ivtE.h"

//gen def podataka i f-ja za jedan ulaz ivt
//priprema ulaz iv tabele i definise prek rutinu koju treba pozvati umesto podrazumevane(implicitni poziv konstruktora)
#define PREPAREENTRY(brojUlaza, oldRout)\
	void interrupt newRout##brojUlaza(...);\
	IVTEntry ivtEntry##brojUlaza(brojUlaza, newRout##brojUlaza);\
	void interrupt newRout##brojUlaza(...){\
		ivtEntry##brojUlaza.signalEvent();\
		if(oldRout) ivtEntry##brojUlaza.callOldRout();\
 }\

//class KernelEv;
class Event {

public:
	Event(IVTNo ivtNo);
	~Event();
	void wait();
protected:
	friend class KernelEv;
	friend class IVTEntry; //dodato zbog signal()
	void signal(); // can call KernelEv
private:
	KernelEv* myImpl;

};
#endif
