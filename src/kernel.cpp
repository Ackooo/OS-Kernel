#include "kernel.h"
#include <dos.h> //setvect
#include "locks.h"
#include "pcb.h"
#include "SCHEDULE.H"
#include <IOSTREAM.H>

IVTEntry* Kernel::ivTable[] = { 0 };
QueuePCB* Kernel::allPCB = 0;
volatile PCB* Kernel::runningPCB = 0;
ThreadIdle* Kernel::idleThread = 0;
Thread* Kernel::mainThread=0;
volatile int Kernel::requestedContextSwitch=0;
void interrupt (*Kernel::oldRout)(...)=0;
//pamtimo staru rutinu; prilikom varacanja u main() da se zna gde se vraca; nema argumente pa samo ime
volatile unsigned timerSS, timerSP, timerBP;
volatile Time counter = defaultTimeSlice;
QueueSem* Kernel::allSems = new QueueSem();
extern void tick();//tick

void Kernel::kernelON(){

	lock();
	//set timer;
#ifndef BCC_BLOCK_IGNORE
	oldRout=getvect(0x08);
	setvect(0x60, oldRout);
	setvect(0x08, Timer);
#endif
//0x08 broj ulaza u IVT, sistem timer, 18.2 prekida u sekundi = 55ms jedan prekid

	mainThread = new Thread(defaultStackSize, defaultTimeSlice);
	mainThread->myPCB->status=READY;
	runningPCB = mainThread->myPCB;//volatile
	allPCB = new QueuePCB();
	idleThread = new ThreadIdle(defaultStackSize, defaultTimeSlice);
	idleThread->start();
	unlock();
}
void Kernel::kernelOFF(){
	lock();
	if(runningPCB==mainThread->myPCB){
		//restore timer
	#ifndef BCC_BLOCK_IGNORE
		oldRout=getvect(0x60); //dodato
		setvect(0x08, oldRout);
	#endif
		delete idleThread;
		delete mainThread;
		delete Kernel::allPCB;
	}
	unlock();
}
void interrupt Kernel::Timer(...){
	int_lock();
	if(requestedContextSwitch ==0){ // not context switch by request
		//oldRout();
		asm int 60h; // calls old rout
		Kernel::allSems->signalTime();
		tick();
	}

	if(((runningPCB->timeSlice!=0)&&(requestedContextSwitch==0))||((runningPCB==idleThread->getPCBIdle())&&(requestedContextSwitch==0)))    {
		if(counter!=0)counter--;
	}

	if(requestedContextSwitch || counter==0){

		asm mov timerSS, ss;
		asm mov timerSP, sp;	//cuva sp
		asm mov timerBP, bp;
		runningPCB->ss = timerSS;
		runningPCB->sp = timerSP;
		runningPCB->bp = timerBP;

		if ((runningPCB->status == READY)
				&& (runningPCB != idleThread->myPCB)) {
			Scheduler::put((PCB*) runningPCB);
		}
		runningPCB = Scheduler::get();
		if (runningPCB == 0)
			runningPCB = idleThread->getPCBIdle();

		timerSS = runningPCB->ss;
		timerSP = runningPCB->sp;
		timerBP = runningPCB->bp;
		asm mov ss, timerSS;	//eclipse nema pojma sta se ovde desilo
		asm mov sp, timerSP;//restaurira sp
		asm mov bp, timerBP;

		counter=runningPCB->timeSlice;
		if(runningPCB==idleThread->getPCBIdle()){
			counter= idleThread->getPCBIdle()->timeSlice;
		}
	}
	requestedContextSwitch = 0;
	int_unlock();
}



