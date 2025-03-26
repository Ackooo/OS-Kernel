#ifndef _LOCKS_H_
#define _LOCKS_H_

#define lock() asm pushf;\
	asm cli;
#define unlock() asm popf;

//bez psw na steku
#define int_lock() asm cli;	//zabranjuje prekide
#define int_unlock() asm sti;	//dozvoljava prekide

#endif
