/*
 * hello.cpp
 *
 *  Created on: Apr 1, 2015
 *      Author: OS1
 */

#include <iostream.h>
#include "kernel.h"
#include "locks.h"

#include "pcb.h"
#include "thread.h"
#include "queue.h"

int userMain(int argc, char* argv[]);
void main(int argc, char* argv[]) {
	Kernel::kernelON();
	int value = userMain(argc, argv);
	Kernel::kernelOFF();


}
