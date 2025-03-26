.extern _ZN5Riscv20handleSupervisorTrapEv
.extern _ZN5Riscv15handleTimerTrapEv

.global vector_table
.type vector_table, @function
.align 4
vector_table:
    j supervisorTrap   # 0
    j timerTrap        # 1
    j supervisorTrap   # 2
    j supervisorTrap   # 3
    j supervisorTrap   # 4
    j supervisorTrap   # 5
    j supervisorTrap   # 6
    j supervisorTrap   # 7
    j supervisorTrap   # 8
    j consoleTrap      # 9


#.global supervisorTrap
#.align 4
.type supervisorTrap, @function
supervisorTrap:
addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv20handleSupervisorTrapEv

    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret


#.global timerTrap
#.align 4
.type timerTrap, @function
timerTrap:
addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv15handleTimerTrapEv

    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret



#.global consoleTrap
#.align 4
.type consoleTrap, @function
consoleTrap:
addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv17handleConsoleTrapEv

    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret