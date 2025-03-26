
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	eb813103          	ld	sp,-328(sp) # 80009eb8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	111050ef          	jal	ra,8000592c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <vector_table>:

.global vector_table
.type vector_table, @function
.align 4
vector_table:
    j supervisorTrap   # 0
    80001000:	0280006f          	j	80001028 <supervisorTrap>
    j timerTrap        # 1
    80001004:	12c0006f          	j	80001130 <timerTrap>
    j supervisorTrap   # 2
    80001008:	0200006f          	j	80001028 <supervisorTrap>
    j supervisorTrap   # 3
    8000100c:	01c0006f          	j	80001028 <supervisorTrap>
    j supervisorTrap   # 4
    80001010:	0180006f          	j	80001028 <supervisorTrap>
    j supervisorTrap   # 5
    80001014:	0140006f          	j	80001028 <supervisorTrap>
    j supervisorTrap   # 6
    80001018:	0100006f          	j	80001028 <supervisorTrap>
    j supervisorTrap   # 7
    8000101c:	00c0006f          	j	80001028 <supervisorTrap>
    j supervisorTrap   # 8
    80001020:	0080006f          	j	80001028 <supervisorTrap>
    j consoleTrap      # 9
    80001024:	2140006f          	j	80001238 <consoleTrap>

0000000080001028 <supervisorTrap>:

#.global supervisorTrap
#.align 4
.type supervisorTrap, @function
supervisorTrap:
addi sp, sp, -256
    80001028:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000102c:	00013023          	sd	zero,0(sp)
    80001030:	00113423          	sd	ra,8(sp)
    80001034:	00213823          	sd	sp,16(sp)
    80001038:	00313c23          	sd	gp,24(sp)
    8000103c:	02413023          	sd	tp,32(sp)
    80001040:	02513423          	sd	t0,40(sp)
    80001044:	02613823          	sd	t1,48(sp)
    80001048:	02713c23          	sd	t2,56(sp)
    8000104c:	04813023          	sd	s0,64(sp)
    80001050:	04913423          	sd	s1,72(sp)
    80001054:	04b13c23          	sd	a1,88(sp)
    80001058:	06c13023          	sd	a2,96(sp)
    8000105c:	06d13423          	sd	a3,104(sp)
    80001060:	06e13823          	sd	a4,112(sp)
    80001064:	06f13c23          	sd	a5,120(sp)
    80001068:	09013023          	sd	a6,128(sp)
    8000106c:	09113423          	sd	a7,136(sp)
    80001070:	09213823          	sd	s2,144(sp)
    80001074:	09313c23          	sd	s3,152(sp)
    80001078:	0b413023          	sd	s4,160(sp)
    8000107c:	0b513423          	sd	s5,168(sp)
    80001080:	0b613823          	sd	s6,176(sp)
    80001084:	0b713c23          	sd	s7,184(sp)
    80001088:	0d813023          	sd	s8,192(sp)
    8000108c:	0d913423          	sd	s9,200(sp)
    80001090:	0da13823          	sd	s10,208(sp)
    80001094:	0db13c23          	sd	s11,216(sp)
    80001098:	0fc13023          	sd	t3,224(sp)
    8000109c:	0fd13423          	sd	t4,232(sp)
    800010a0:	0fe13823          	sd	t5,240(sp)
    800010a4:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    800010a8:	0cc010ef          	jal	ra,80002174 <_ZN5Riscv20handleSupervisorTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010ac:	00013003          	ld	zero,0(sp)
    800010b0:	00813083          	ld	ra,8(sp)
    800010b4:	01013103          	ld	sp,16(sp)
    800010b8:	01813183          	ld	gp,24(sp)
    800010bc:	02013203          	ld	tp,32(sp)
    800010c0:	02813283          	ld	t0,40(sp)
    800010c4:	03013303          	ld	t1,48(sp)
    800010c8:	03813383          	ld	t2,56(sp)
    800010cc:	04013403          	ld	s0,64(sp)
    800010d0:	04813483          	ld	s1,72(sp)
    800010d4:	05813583          	ld	a1,88(sp)
    800010d8:	06013603          	ld	a2,96(sp)
    800010dc:	06813683          	ld	a3,104(sp)
    800010e0:	07013703          	ld	a4,112(sp)
    800010e4:	07813783          	ld	a5,120(sp)
    800010e8:	08013803          	ld	a6,128(sp)
    800010ec:	08813883          	ld	a7,136(sp)
    800010f0:	09013903          	ld	s2,144(sp)
    800010f4:	09813983          	ld	s3,152(sp)
    800010f8:	0a013a03          	ld	s4,160(sp)
    800010fc:	0a813a83          	ld	s5,168(sp)
    80001100:	0b013b03          	ld	s6,176(sp)
    80001104:	0b813b83          	ld	s7,184(sp)
    80001108:	0c013c03          	ld	s8,192(sp)
    8000110c:	0c813c83          	ld	s9,200(sp)
    80001110:	0d013d03          	ld	s10,208(sp)
    80001114:	0d813d83          	ld	s11,216(sp)
    80001118:	0e013e03          	ld	t3,224(sp)
    8000111c:	0e813e83          	ld	t4,232(sp)
    80001120:	0f013f03          	ld	t5,240(sp)
    80001124:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001128:	10010113          	addi	sp,sp,256
    sret
    8000112c:	10200073          	sret

0000000080001130 <timerTrap>:

#.global timerTrap
#.align 4
.type timerTrap, @function
timerTrap:
addi sp, sp, -256
    80001130:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001134:	00013023          	sd	zero,0(sp)
    80001138:	00113423          	sd	ra,8(sp)
    8000113c:	00213823          	sd	sp,16(sp)
    80001140:	00313c23          	sd	gp,24(sp)
    80001144:	02413023          	sd	tp,32(sp)
    80001148:	02513423          	sd	t0,40(sp)
    8000114c:	02613823          	sd	t1,48(sp)
    80001150:	02713c23          	sd	t2,56(sp)
    80001154:	04813023          	sd	s0,64(sp)
    80001158:	04913423          	sd	s1,72(sp)
    8000115c:	04b13c23          	sd	a1,88(sp)
    80001160:	06c13023          	sd	a2,96(sp)
    80001164:	06d13423          	sd	a3,104(sp)
    80001168:	06e13823          	sd	a4,112(sp)
    8000116c:	06f13c23          	sd	a5,120(sp)
    80001170:	09013023          	sd	a6,128(sp)
    80001174:	09113423          	sd	a7,136(sp)
    80001178:	09213823          	sd	s2,144(sp)
    8000117c:	09313c23          	sd	s3,152(sp)
    80001180:	0b413023          	sd	s4,160(sp)
    80001184:	0b513423          	sd	s5,168(sp)
    80001188:	0b613823          	sd	s6,176(sp)
    8000118c:	0b713c23          	sd	s7,184(sp)
    80001190:	0d813023          	sd	s8,192(sp)
    80001194:	0d913423          	sd	s9,200(sp)
    80001198:	0da13823          	sd	s10,208(sp)
    8000119c:	0db13c23          	sd	s11,216(sp)
    800011a0:	0fc13023          	sd	t3,224(sp)
    800011a4:	0fd13423          	sd	t4,232(sp)
    800011a8:	0fe13823          	sd	t5,240(sp)
    800011ac:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv15handleTimerTrapEv
    800011b0:	448010ef          	jal	ra,800025f8 <_ZN5Riscv15handleTimerTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011b4:	00013003          	ld	zero,0(sp)
    800011b8:	00813083          	ld	ra,8(sp)
    800011bc:	01013103          	ld	sp,16(sp)
    800011c0:	01813183          	ld	gp,24(sp)
    800011c4:	02013203          	ld	tp,32(sp)
    800011c8:	02813283          	ld	t0,40(sp)
    800011cc:	03013303          	ld	t1,48(sp)
    800011d0:	03813383          	ld	t2,56(sp)
    800011d4:	04013403          	ld	s0,64(sp)
    800011d8:	04813483          	ld	s1,72(sp)
    800011dc:	05813583          	ld	a1,88(sp)
    800011e0:	06013603          	ld	a2,96(sp)
    800011e4:	06813683          	ld	a3,104(sp)
    800011e8:	07013703          	ld	a4,112(sp)
    800011ec:	07813783          	ld	a5,120(sp)
    800011f0:	08013803          	ld	a6,128(sp)
    800011f4:	08813883          	ld	a7,136(sp)
    800011f8:	09013903          	ld	s2,144(sp)
    800011fc:	09813983          	ld	s3,152(sp)
    80001200:	0a013a03          	ld	s4,160(sp)
    80001204:	0a813a83          	ld	s5,168(sp)
    80001208:	0b013b03          	ld	s6,176(sp)
    8000120c:	0b813b83          	ld	s7,184(sp)
    80001210:	0c013c03          	ld	s8,192(sp)
    80001214:	0c813c83          	ld	s9,200(sp)
    80001218:	0d013d03          	ld	s10,208(sp)
    8000121c:	0d813d83          	ld	s11,216(sp)
    80001220:	0e013e03          	ld	t3,224(sp)
    80001224:	0e813e83          	ld	t4,232(sp)
    80001228:	0f013f03          	ld	t5,240(sp)
    8000122c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001230:	10010113          	addi	sp,sp,256
    sret
    80001234:	10200073          	sret

0000000080001238 <consoleTrap>:

#.global consoleTrap
#.align 4
.type consoleTrap, @function
consoleTrap:
addi sp, sp, -256
    80001238:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000123c:	00013023          	sd	zero,0(sp)
    80001240:	00113423          	sd	ra,8(sp)
    80001244:	00213823          	sd	sp,16(sp)
    80001248:	00313c23          	sd	gp,24(sp)
    8000124c:	02413023          	sd	tp,32(sp)
    80001250:	02513423          	sd	t0,40(sp)
    80001254:	02613823          	sd	t1,48(sp)
    80001258:	02713c23          	sd	t2,56(sp)
    8000125c:	04813023          	sd	s0,64(sp)
    80001260:	04913423          	sd	s1,72(sp)
    80001264:	04b13c23          	sd	a1,88(sp)
    80001268:	06c13023          	sd	a2,96(sp)
    8000126c:	06d13423          	sd	a3,104(sp)
    80001270:	06e13823          	sd	a4,112(sp)
    80001274:	06f13c23          	sd	a5,120(sp)
    80001278:	09013023          	sd	a6,128(sp)
    8000127c:	09113423          	sd	a7,136(sp)
    80001280:	09213823          	sd	s2,144(sp)
    80001284:	09313c23          	sd	s3,152(sp)
    80001288:	0b413023          	sd	s4,160(sp)
    8000128c:	0b513423          	sd	s5,168(sp)
    80001290:	0b613823          	sd	s6,176(sp)
    80001294:	0b713c23          	sd	s7,184(sp)
    80001298:	0d813023          	sd	s8,192(sp)
    8000129c:	0d913423          	sd	s9,200(sp)
    800012a0:	0da13823          	sd	s10,208(sp)
    800012a4:	0db13c23          	sd	s11,216(sp)
    800012a8:	0fc13023          	sd	t3,224(sp)
    800012ac:	0fd13423          	sd	t4,232(sp)
    800012b0:	0fe13823          	sd	t5,240(sp)
    800012b4:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv17handleConsoleTrapEv
    800012b8:	464010ef          	jal	ra,8000271c <_ZN5Riscv17handleConsoleTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012bc:	00013003          	ld	zero,0(sp)
    800012c0:	00813083          	ld	ra,8(sp)
    800012c4:	01013103          	ld	sp,16(sp)
    800012c8:	01813183          	ld	gp,24(sp)
    800012cc:	02013203          	ld	tp,32(sp)
    800012d0:	02813283          	ld	t0,40(sp)
    800012d4:	03013303          	ld	t1,48(sp)
    800012d8:	03813383          	ld	t2,56(sp)
    800012dc:	04013403          	ld	s0,64(sp)
    800012e0:	04813483          	ld	s1,72(sp)
    800012e4:	05813583          	ld	a1,88(sp)
    800012e8:	06013603          	ld	a2,96(sp)
    800012ec:	06813683          	ld	a3,104(sp)
    800012f0:	07013703          	ld	a4,112(sp)
    800012f4:	07813783          	ld	a5,120(sp)
    800012f8:	08013803          	ld	a6,128(sp)
    800012fc:	08813883          	ld	a7,136(sp)
    80001300:	09013903          	ld	s2,144(sp)
    80001304:	09813983          	ld	s3,152(sp)
    80001308:	0a013a03          	ld	s4,160(sp)
    8000130c:	0a813a83          	ld	s5,168(sp)
    80001310:	0b013b03          	ld	s6,176(sp)
    80001314:	0b813b83          	ld	s7,184(sp)
    80001318:	0c013c03          	ld	s8,192(sp)
    8000131c:	0c813c83          	ld	s9,200(sp)
    80001320:	0d013d03          	ld	s10,208(sp)
    80001324:	0d813d83          	ld	s11,216(sp)
    80001328:	0e013e03          	ld	t3,224(sp)
    8000132c:	0e813e83          	ld	t4,232(sp)
    80001330:	0f013f03          	ld	t5,240(sp)
    80001334:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001338:	10010113          	addi	sp,sp,256
    8000133c:	10200073          	sret
	...

0000000080001348 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>:
.global _ZN7_thread13contextSwitchEPNS_7ContextES1_
.type _ZN7_thread13contextSwitchEPNS_7ContextES1_, @function
_ZN7_thread13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001348:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    8000134c:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001350:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001354:	0085b103          	ld	sp,8(a1)

    80001358:	00008067          	ret

000000008000135c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000135c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001360:	00b29a63          	bne	t0,a1,80001374 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001364:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001368:	fe029ae3          	bnez	t0,8000135c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000136c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001370:	00008067          	ret

0000000080001374 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001374:	00100513          	li	a0,1
    80001378:	00008067          	ret

000000008000137c <_Z9mem_allocm>:
// Created by os on 9/2/23.
//
#include "../h/syscall_c.hpp"
#include "../h/riscv.hpp"

void *mem_alloc(size_t size) {
    8000137c:	fe010113          	addi	sp,sp,-32
    80001380:	00813c23          	sd	s0,24(sp)
    80001384:	02010413          	addi	s0,sp,32
    size_t sz=(size+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    80001388:	03f50513          	addi	a0,a0,63
    8000138c:	00655513          	srli	a0,a0,0x6
}
inline void Riscv::w_a0(uint64 a0) {
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
}
inline void Riscv::w_a1(uint64 a1) {
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    80001390:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    80001394:	00100793          	li	a5,1
    80001398:	00078513          	mv	a0,a5
     * __asm__ volatile ("sd %0, 10*8(fp)" : : "r"(a0));
     * */
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
}
inline void Riscv::ecall() {
    __asm__ volatile ("ecall");
    8000139c:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    800013a0:	00050793          	mv	a5,a0
    800013a4:	fef43423          	sd	a5,-24(s0)
    return a0;
    800013a8:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a1(sz);
    Riscv::w_a0(MEM_ALLOC);
    Riscv::ecall();
    uint64 ret = Riscv::r_a0();
    return (void*) ret;
}
    800013ac:	01813403          	ld	s0,24(sp)
    800013b0:	02010113          	addi	sp,sp,32
    800013b4:	00008067          	ret

00000000800013b8 <_Z8mem_freePv>:

int mem_free(void * adr) {
    800013b8:	fe010113          	addi	sp,sp,-32
    800013bc:	00813c23          	sd	s0,24(sp)
    800013c0:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    800013c4:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    800013c8:	00200793          	li	a5,2
    800013cc:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800013d0:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    800013d4:	00050793          	mv	a5,a0
    800013d8:	fef43423          	sd	a5,-24(s0)
    return a0;
    800013dc:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a1((uint64)adr);
    Riscv::w_a0(MEM_FREE);
    Riscv::ecall();
    uint64 ret = Riscv::r_a0();
    return ret;
}
    800013e0:	0005051b          	sext.w	a0,a0
    800013e4:	01813403          	ld	s0,24(sp)
    800013e8:	02010113          	addi	sp,sp,32
    800013ec:	00008067          	ret

00000000800013f0 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    800013f0:	fe010113          	addi	sp,sp,-32
    800013f4:	00813c23          	sd	s0,24(sp)
    800013f8:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv a3, %0" : : "r"(a3));
    800013fc:	00060693          	mv	a3,a2
    __asm__ volatile ("mv a2, %0" : : "r"(a2));
    80001400:	00058613          	mv	a2,a1
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    80001404:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    80001408:	01100793          	li	a5,17
    8000140c:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001410:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    80001414:	00050793          	mv	a5,a0
    80001418:	fef43423          	sd	a5,-24(s0)
    return a0;
    8000141c:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(THREAD_CREATE);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}
    80001420:	0005051b          	sext.w	a0,a0
    80001424:	01813403          	ld	s0,24(sp)
    80001428:	02010113          	addi	sp,sp,32
    8000142c:	00008067          	ret

0000000080001430 <_Z16thread_createCPPPP7_threadPFvPvES2_>:

int thread_createCPP(thread_t *handle, void (*start_routine)(void *), void *arg) {
    80001430:	fe010113          	addi	sp,sp,-32
    80001434:	00813c23          	sd	s0,24(sp)
    80001438:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv a3, %0" : : "r"(a3));
    8000143c:	00060693          	mv	a3,a2
    __asm__ volatile ("mv a2, %0" : : "r"(a2));
    80001440:	00058613          	mv	a2,a1
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    80001444:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    80001448:	01500793          	li	a5,21
    8000144c:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001450:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    80001454:	00050793          	mv	a5,a0
    80001458:	fef43423          	sd	a5,-24(s0)
    return a0;
    8000145c:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(THREAD_CREATE_CPP);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}
    80001460:	0005051b          	sext.w	a0,a0
    80001464:	01813403          	ld	s0,24(sp)
    80001468:	02010113          	addi	sp,sp,32
    8000146c:	00008067          	ret

0000000080001470 <_Z11thread_exitv>:

int thread_exit() {
    80001470:	fe010113          	addi	sp,sp,-32
    80001474:	00813c23          	sd	s0,24(sp)
    80001478:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    8000147c:	01200793          	li	a5,18
    80001480:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001484:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    80001488:	00050793          	mv	a5,a0
    8000148c:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001490:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a0(THREAD_EXIT);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}
    80001494:	0005051b          	sext.w	a0,a0
    80001498:	01813403          	ld	s0,24(sp)
    8000149c:	02010113          	addi	sp,sp,32
    800014a0:	00008067          	ret

00000000800014a4 <_Z15thread_dispatchv>:

void thread_dispatch() {
    800014a4:	ff010113          	addi	sp,sp,-16
    800014a8:	00813423          	sd	s0,8(sp)
    800014ac:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    800014b0:	01300793          	li	a5,19
    800014b4:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800014b8:	00000073          	ecall
    Riscv::w_a0(THREAD_DISPATCH);
    Riscv::ecall();
    return;
}
    800014bc:	00813403          	ld	s0,8(sp)
    800014c0:	01010113          	addi	sp,sp,16
    800014c4:	00008067          	ret

00000000800014c8 <_Z11thread_joinP7_thread>:

void thread_join(thread_t handle){
    800014c8:	ff010113          	addi	sp,sp,-16
    800014cc:	00813423          	sd	s0,8(sp)
    800014d0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    800014d4:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    800014d8:	01400793          	li	a5,20
    800014dc:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800014e0:	00000073          	ecall
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(THREAD_JOIN);
    Riscv::ecall();
}
    800014e4:	00813403          	ld	s0,8(sp)
    800014e8:	01010113          	addi	sp,sp,16
    800014ec:	00008067          	ret

00000000800014f0 <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned int init) {
    800014f0:	fe010113          	addi	sp,sp,-32
    800014f4:	00813c23          	sd	s0,24(sp)
    800014f8:	02010413          	addi	s0,sp,32
    Riscv::w_a2(init);
    800014fc:	02059593          	slli	a1,a1,0x20
    80001500:	0205d593          	srli	a1,a1,0x20
    __asm__ volatile ("mv a2, %0" : : "r"(a2));
    80001504:	00058613          	mv	a2,a1
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    80001508:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    8000150c:	02100793          	li	a5,33
    80001510:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001514:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    80001518:	00050793          	mv	a5,a0
    8000151c:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001520:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(SEM_OPEN);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}
    80001524:	0005051b          	sext.w	a0,a0
    80001528:	01813403          	ld	s0,24(sp)
    8000152c:	02010113          	addi	sp,sp,32
    80001530:	00008067          	ret

0000000080001534 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80001534:	fe010113          	addi	sp,sp,-32
    80001538:	00813c23          	sd	s0,24(sp)
    8000153c:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    80001540:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    80001544:	02200793          	li	a5,34
    80001548:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    8000154c:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    80001550:	00050793          	mv	a5,a0
    80001554:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001558:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a1((uint64)handle);
    Riscv::w_a0(SEM_CLOSE);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}
    8000155c:	0005051b          	sext.w	a0,a0
    80001560:	01813403          	ld	s0,24(sp)
    80001564:	02010113          	addi	sp,sp,32
    80001568:	00008067          	ret

000000008000156c <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    8000156c:	fe010113          	addi	sp,sp,-32
    80001570:	00813c23          	sd	s0,24(sp)
    80001574:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    80001578:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    8000157c:	02300793          	li	a5,35
    80001580:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001584:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    80001588:	00050793          	mv	a5,a0
    8000158c:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001590:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a1((uint64) id);
    Riscv::w_a0(SEM_WAIT);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}
    80001594:	0005051b          	sext.w	a0,a0
    80001598:	01813403          	ld	s0,24(sp)
    8000159c:	02010113          	addi	sp,sp,32
    800015a0:	00008067          	ret

00000000800015a4 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800015a4:	fe010113          	addi	sp,sp,-32
    800015a8:	00813c23          	sd	s0,24(sp)
    800015ac:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    800015b0:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    800015b4:	02400793          	li	a5,36
    800015b8:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800015bc:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    800015c0:	00050793          	mv	a5,a0
    800015c4:	fef43423          	sd	a5,-24(s0)
    return a0;
    800015c8:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a1((uint64)id);
    Riscv::w_a0(SEM_SIGNAL);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}
    800015cc:	0005051b          	sext.w	a0,a0
    800015d0:	01813403          	ld	s0,24(sp)
    800015d4:	02010113          	addi	sp,sp,32
    800015d8:	00008067          	ret

00000000800015dc <_Z11sem_trywaitP4_sem>:

int sem_trywait(sem_t id){
    800015dc:	fe010113          	addi	sp,sp,-32
    800015e0:	00813c23          	sd	s0,24(sp)
    800015e4:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    800015e8:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    800015ec:	02600793          	li	a5,38
    800015f0:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800015f4:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    800015f8:	00050793          	mv	a5,a0
    800015fc:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001600:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a1((uint64) id);
    Riscv::w_a0(SEM_TRYWAIT);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    return ret;
}
    80001604:	0005051b          	sext.w	a0,a0
    80001608:	01813403          	ld	s0,24(sp)
    8000160c:	02010113          	addi	sp,sp,32
    80001610:	00008067          	ret

0000000080001614 <_Z4getcv>:

char getc()
{
    80001614:	fe010113          	addi	sp,sp,-32
    80001618:	00813c23          	sd	s0,24(sp)
    8000161c:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    80001620:	04100793          	li	a5,65
    80001624:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001628:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    8000162c:	00050793          	mv	a5,a0
    80001630:	fef43423          	sd	a5,-24(s0)
    return a0;
    80001634:	fe843503          	ld	a0,-24(s0)
    Riscv::w_a0(GETC);
    Riscv::ecall();
    int ret = Riscv::r_a0();
    //return ret;
    return (char)ret;
}
    80001638:	0ff57513          	andi	a0,a0,255
    8000163c:	01813403          	ld	s0,24(sp)
    80001640:	02010113          	addi	sp,sp,32
    80001644:	00008067          	ret

0000000080001648 <_Z4putcc>:
void putc(char c)
{
    80001648:	ff010113          	addi	sp,sp,-16
    8000164c:	00813423          	sd	s0,8(sp)
    80001650:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" : : "r"(a1));
    80001654:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    80001658:	04200793          	li	a5,66
    8000165c:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001660:	00000073          	ecall
    Riscv::w_a1((uint64)c);
    Riscv::w_a0(PUTC);
    Riscv::ecall();
}
    80001664:	00813403          	ld	s0,8(sp)
    80001668:	01010113          	addi	sp,sp,16
    8000166c:	00008067          	ret

0000000080001670 <_Z12goToUserModev>:

void goToUserMode() {
    80001670:	ff010113          	addi	sp,sp,-16
    80001674:	00813423          	sd	s0,8(sp)
    80001678:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a0, %0" : : "r"(a0));
    8000167c:	02700793          	li	a5,39
    80001680:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001684:	00000073          	ecall
    Riscv::w_a0(USER_MODE);
    Riscv::ecall();
    return;
}
    80001688:	00813403          	ld	s0,8(sp)
    8000168c:	01010113          	addi	sp,sp,16
    80001690:	00008067          	ret

0000000080001694 <_ZN7_thread8dispatchEv>:
#include "../h/syscall_c.hpp"

_thread* _thread::running=nullptr;

void _thread::dispatch()
{
    80001694:	fe010113          	addi	sp,sp,-32
    80001698:	00113c23          	sd	ra,24(sp)
    8000169c:	00813823          	sd	s0,16(sp)
    800016a0:	00913423          	sd	s1,8(sp)
    800016a4:	02010413          	addi	s0,sp,32
    _thread *old = running;
    800016a8:	00009497          	auipc	s1,0x9
    800016ac:	8784b483          	ld	s1,-1928(s1) # 80009f20 <_ZN7_thread7runningE>
    static _thread *running;

    static void join(_thread* handle);

    //get set
    bool isFinished() const{return finished;};
    800016b0:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished() && !old->blocked) { Scheduler::put(old); }
    800016b4:	00079663          	bnez	a5,800016c0 <_ZN7_thread8dispatchEv+0x2c>
    800016b8:	0294c783          	lbu	a5,41(s1)
    800016bc:	02078c63          	beqz	a5,800016f4 <_ZN7_thread8dispatchEv+0x60>
    running = Scheduler::get();
    800016c0:	00001097          	auipc	ra,0x1
    800016c4:	4a0080e7          	jalr	1184(ra) # 80002b60 <_ZN9Scheduler3getEv>
    800016c8:	00009797          	auipc	a5,0x9
    800016cc:	84a7bc23          	sd	a0,-1960(a5) # 80009f20 <_ZN7_thread7runningE>
    _thread::contextSwitch(&old->context, &running->context);
    800016d0:	01850593          	addi	a1,a0,24
    800016d4:	01848513          	addi	a0,s1,24
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	c70080e7          	jalr	-912(ra) # 80001348 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    800016e0:	01813083          	ld	ra,24(sp)
    800016e4:	01013403          	ld	s0,16(sp)
    800016e8:	00813483          	ld	s1,8(sp)
    800016ec:	02010113          	addi	sp,sp,32
    800016f0:	00008067          	ret
    if (!old->isFinished() && !old->blocked) { Scheduler::put(old); }
    800016f4:	00048513          	mv	a0,s1
    800016f8:	00001097          	auipc	ra,0x1
    800016fc:	4d0080e7          	jalr	1232(ra) # 80002bc8 <_ZN9Scheduler3putEP7_thread>
    80001700:	fc1ff06f          	j	800016c0 <_ZN7_thread8dispatchEv+0x2c>

0000000080001704 <_ZN7_thread18createControlBlockEPFvPvES0_Pm>:
    *handle= ptr;
    return ptr;
}


_thread *_thread::createControlBlock(_thread::Body body, void *arg, uint64 *stack) {
    80001704:	fd010113          	addi	sp,sp,-48
    80001708:	02113423          	sd	ra,40(sp)
    8000170c:	02813023          	sd	s0,32(sp)
    80001710:	00913c23          	sd	s1,24(sp)
    80001714:	01213823          	sd	s2,16(sp)
    80001718:	01313423          	sd	s3,8(sp)
    8000171c:	03010413          	addi	s0,sp,48
    80001720:	00050913          	mv	s2,a0
    80001724:	00058993          	mv	s3,a1
    80001728:	00060493          	mv	s1,a2
    _thread* temp=(_thread*)MemAlloc::getInstance().mem_alloc((sizeof(_thread) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	3f8080e7          	jalr	1016(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80001734:	00100593          	li	a1,1
    80001738:	00000097          	auipc	ra,0x0
    8000173c:	2d0080e7          	jalr	720(ra) # 80001a08 <_ZN8MemAlloc9mem_allocEm>
    temp->body=body;
    80001740:	01253023          	sd	s2,0(a0)
    if(body!= nullptr)temp->stack=stack;
    80001744:	04090a63          	beqz	s2,80001798 <_ZN7_thread18createControlBlockEPFvPvES0_Pm+0x94>
    80001748:	00953823          	sd	s1,16(a0)
    else stack= nullptr;
    temp->context={(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    8000174c:	04048a63          	beqz	s1,800017a0 <_ZN7_thread18createControlBlockEPFvPvES0_Pm+0x9c>
    80001750:	00008637          	lui	a2,0x8
    80001754:	00c484b3          	add	s1,s1,a2
    80001758:	00000797          	auipc	a5,0x0
    8000175c:	15c78793          	addi	a5,a5,348 # 800018b4 <_ZN7_thread13threadWrapperEv>
    80001760:	00f53c23          	sd	a5,24(a0)
    80001764:	02953023          	sd	s1,32(a0)
    temp->fArg=arg;
    80001768:	01353423          	sd	s3,8(a0)
    temp->finished=false;
    8000176c:	02050423          	sb	zero,40(a0)
    temp->blocked=false;
    80001770:	020504a3          	sb	zero,41(a0)

    //
    //temp->blockedQueue=new List<_thread>;

    temp->head=nullptr;
    80001774:	02053823          	sd	zero,48(a0)
    temp->tail=nullptr;
    80001778:	02053c23          	sd	zero,56(a0)

    return temp;
}
    8000177c:	02813083          	ld	ra,40(sp)
    80001780:	02013403          	ld	s0,32(sp)
    80001784:	01813483          	ld	s1,24(sp)
    80001788:	01013903          	ld	s2,16(sp)
    8000178c:	00813983          	ld	s3,8(sp)
    80001790:	03010113          	addi	sp,sp,48
    80001794:	00008067          	ret
    temp->context={(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80001798:	00000493          	li	s1,0
    8000179c:	fbdff06f          	j	80001758 <_ZN7_thread18createControlBlockEPFvPvES0_Pm+0x54>
    800017a0:	00000493          	li	s1,0
    800017a4:	fb5ff06f          	j	80001758 <_ZN7_thread18createControlBlockEPFvPvES0_Pm+0x54>

00000000800017a8 <_ZN7_thread12createThreadEPFvPvEPPS_S0_Pm>:
_thread* _thread::createThread(_thread::Body body, _thread **handle, void *arg, uint64* stack) {
    800017a8:	fd010113          	addi	sp,sp,-48
    800017ac:	02113423          	sd	ra,40(sp)
    800017b0:	02813023          	sd	s0,32(sp)
    800017b4:	00913c23          	sd	s1,24(sp)
    800017b8:	01213823          	sd	s2,16(sp)
    800017bc:	01313423          	sd	s3,8(sp)
    800017c0:	03010413          	addi	s0,sp,48
    800017c4:	00050913          	mv	s2,a0
    800017c8:	00058993          	mv	s3,a1
    800017cc:	00060593          	mv	a1,a2
    _thread* ptr = createControlBlock(body, arg, stack);
    800017d0:	00068613          	mv	a2,a3
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	f30080e7          	jalr	-208(ra) # 80001704 <_ZN7_thread18createControlBlockEPFvPvES0_Pm>
    800017dc:	00050493          	mv	s1,a0
    *handle= ptr;
    800017e0:	00a9b023          	sd	a0,0(s3)
    if (body != nullptr) { Scheduler::put(*handle);}
    800017e4:	00090663          	beqz	s2,800017f0 <_ZN7_thread12createThreadEPFvPvEPPS_S0_Pm+0x48>
    800017e8:	00001097          	auipc	ra,0x1
    800017ec:	3e0080e7          	jalr	992(ra) # 80002bc8 <_ZN9Scheduler3putEP7_thread>
}
    800017f0:	00048513          	mv	a0,s1
    800017f4:	02813083          	ld	ra,40(sp)
    800017f8:	02013403          	ld	s0,32(sp)
    800017fc:	01813483          	ld	s1,24(sp)
    80001800:	01013903          	ld	s2,16(sp)
    80001804:	00813983          	ld	s3,8(sp)
    80001808:	03010113          	addi	sp,sp,48
    8000180c:	00008067          	ret

0000000080001810 <_ZN7_thread15createCPPThreadEPFvPvEPPS_S0_Pm>:
_thread *_thread::createCPPThread(_thread::Body body, _thread **handle, void *arg, uint64 *stack) {
    80001810:	fe010113          	addi	sp,sp,-32
    80001814:	00113c23          	sd	ra,24(sp)
    80001818:	00813823          	sd	s0,16(sp)
    8000181c:	00913423          	sd	s1,8(sp)
    80001820:	02010413          	addi	s0,sp,32
    80001824:	00058493          	mv	s1,a1
    80001828:	00060593          	mv	a1,a2
    _thread* ptr = createControlBlock(body, arg, stack);
    8000182c:	00068613          	mv	a2,a3
    80001830:	00000097          	auipc	ra,0x0
    80001834:	ed4080e7          	jalr	-300(ra) # 80001704 <_ZN7_thread18createControlBlockEPFvPvES0_Pm>
    *handle= ptr;
    80001838:	00a4b023          	sd	a0,0(s1)
}
    8000183c:	01813083          	ld	ra,24(sp)
    80001840:	01013403          	ld	s0,16(sp)
    80001844:	00813483          	ld	s1,8(sp)
    80001848:	02010113          	addi	sp,sp,32
    8000184c:	00008067          	ret

0000000080001850 <_ZN7_thread9getThreadEv>:
    handle->putThread(_thread::running);
    _thread::running->setBlocked(true);
    thread_dispatch();
}

_thread *_thread::getThread() {
    80001850:	fe010113          	addi	sp,sp,-32
    80001854:	00113c23          	sd	ra,24(sp)
    80001858:	00813823          	sd	s0,16(sp)
    8000185c:	00913423          	sd	s1,8(sp)
    80001860:	01213023          	sd	s2,0(sp)
    80001864:	02010413          	addi	s0,sp,32
    //return blockedQueue.removeFirst();
    if(head== nullptr)return nullptr;
    80001868:	03053483          	ld	s1,48(a0)
    8000186c:	04048063          	beqz	s1,800018ac <_ZN7_thread9getThreadEv+0x5c>
    _thread* ret=head->thread;
    80001870:	0004b903          	ld	s2,0(s1)
    Blocked* old=head;
    head=head->next;
    80001874:	0084b783          	ld	a5,8(s1)
    80001878:	02f53823          	sd	a5,48(a0)
    MemAlloc::getInstance().mem_free(old);
    8000187c:	00000097          	auipc	ra,0x0
    80001880:	2a8080e7          	jalr	680(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80001884:	00048593          	mv	a1,s1
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	30c080e7          	jalr	780(ra) # 80001b94 <_ZN8MemAlloc8mem_freeEPv>
    return ret;
}
    80001890:	00090513          	mv	a0,s2
    80001894:	01813083          	ld	ra,24(sp)
    80001898:	01013403          	ld	s0,16(sp)
    8000189c:	00813483          	ld	s1,8(sp)
    800018a0:	00013903          	ld	s2,0(sp)
    800018a4:	02010113          	addi	sp,sp,32
    800018a8:	00008067          	ret
    if(head== nullptr)return nullptr;
    800018ac:	00048913          	mv	s2,s1
    800018b0:	fe1ff06f          	j	80001890 <_ZN7_thread9getThreadEv+0x40>

00000000800018b4 <_ZN7_thread13threadWrapperEv>:
{
    800018b4:	fe010113          	addi	sp,sp,-32
    800018b8:	00113c23          	sd	ra,24(sp)
    800018bc:	00813823          	sd	s0,16(sp)
    800018c0:	00913423          	sd	s1,8(sp)
    800018c4:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    800018c8:	00001097          	auipc	ra,0x1
    800018cc:	88c080e7          	jalr	-1908(ra) # 80002154 <_ZN5Riscv10popSppSpieEv>
    running->body(running->fArg);
    800018d0:	00008497          	auipc	s1,0x8
    800018d4:	65048493          	addi	s1,s1,1616 # 80009f20 <_ZN7_thread7runningE>
    800018d8:	0004b783          	ld	a5,0(s1)
    800018dc:	0007b703          	ld	a4,0(a5)
    800018e0:	0087b503          	ld	a0,8(a5)
    800018e4:	000700e7          	jalr	a4
    running->setFinished(true);
    800018e8:	0004b503          	ld	a0,0(s1)
    void setFinished(bool finished){_thread::finished = finished;};
    800018ec:	00100793          	li	a5,1
    800018f0:	02f50423          	sb	a5,40(a0)
    _thread* thread=running->getThread();
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	f5c080e7          	jalr	-164(ra) # 80001850 <_ZN7_thread9getThreadEv>
    while(thread!= nullptr){
    800018fc:	02050263          	beqz	a0,80001920 <_ZN7_thread13threadWrapperEv+0x6c>
        thread->blocked=false;
    80001900:	020504a3          	sb	zero,41(a0)
        Scheduler::put(thread);
    80001904:	00001097          	auipc	ra,0x1
    80001908:	2c4080e7          	jalr	708(ra) # 80002bc8 <_ZN9Scheduler3putEP7_thread>
        thread=running->getThread();
    8000190c:	00008517          	auipc	a0,0x8
    80001910:	61453503          	ld	a0,1556(a0) # 80009f20 <_ZN7_thread7runningE>
    80001914:	00000097          	auipc	ra,0x0
    80001918:	f3c080e7          	jalr	-196(ra) # 80001850 <_ZN7_thread9getThreadEv>
    while(thread!= nullptr){
    8000191c:	fe1ff06f          	j	800018fc <_ZN7_thread13threadWrapperEv+0x48>
    thread_dispatch();
    80001920:	00000097          	auipc	ra,0x0
    80001924:	b84080e7          	jalr	-1148(ra) # 800014a4 <_Z15thread_dispatchv>
}
    80001928:	01813083          	ld	ra,24(sp)
    8000192c:	01013403          	ld	s0,16(sp)
    80001930:	00813483          	ld	s1,8(sp)
    80001934:	02010113          	addi	sp,sp,32
    80001938:	00008067          	ret

000000008000193c <_ZN7_thread9putThreadEPS_>:

void _thread::putThread(_thread *thread) {
    8000193c:	fe010113          	addi	sp,sp,-32
    80001940:	00113c23          	sd	ra,24(sp)
    80001944:	00813823          	sd	s0,16(sp)
    80001948:	00913423          	sd	s1,8(sp)
    8000194c:	01213023          	sd	s2,0(sp)
    80001950:	02010413          	addi	s0,sp,32
    80001954:	00050493          	mv	s1,a0
    80001958:	00058913          	mv	s2,a1
    //blockedQueue.addLast(thread);
    Blocked* temp=(Blocked*)MemAlloc::getInstance().mem_alloc((sizeof(Blocked) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	1c8080e7          	jalr	456(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80001964:	00100593          	li	a1,1
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	0a0080e7          	jalr	160(ra) # 80001a08 <_ZN8MemAlloc9mem_allocEm>
    temp->thread=thread;
    80001970:	01253023          	sd	s2,0(a0)
    temp->next= nullptr;
    80001974:	00053423          	sd	zero,8(a0)
    if(head==nullptr){
    80001978:	0304b783          	ld	a5,48(s1)
    8000197c:	02078863          	beqz	a5,800019ac <_ZN7_thread9putThreadEPS_+0x70>
        head=tail=temp;
    }
    else {
        tail->next=temp;
    80001980:	0384b783          	ld	a5,56(s1)
    80001984:	00a7b423          	sd	a0,8(a5)
        tail=tail->next;
    80001988:	0384b783          	ld	a5,56(s1)
    8000198c:	0087b783          	ld	a5,8(a5)
    80001990:	02f4bc23          	sd	a5,56(s1)
    }
    80001994:	01813083          	ld	ra,24(sp)
    80001998:	01013403          	ld	s0,16(sp)
    8000199c:	00813483          	ld	s1,8(sp)
    800019a0:	00013903          	ld	s2,0(sp)
    800019a4:	02010113          	addi	sp,sp,32
    800019a8:	00008067          	ret
        head=tail=temp;
    800019ac:	02a4bc23          	sd	a0,56(s1)
    800019b0:	02a4b823          	sd	a0,48(s1)
    800019b4:	fe1ff06f          	j	80001994 <_ZN7_thread9putThreadEPS_+0x58>

00000000800019b8 <_ZN7_thread4joinEPS_>:
void _thread::join(_thread *handle) {
    800019b8:	fe010113          	addi	sp,sp,-32
    800019bc:	00113c23          	sd	ra,24(sp)
    800019c0:	00813823          	sd	s0,16(sp)
    800019c4:	00913423          	sd	s1,8(sp)
    800019c8:	02010413          	addi	s0,sp,32
    handle->putThread(_thread::running);
    800019cc:	00008497          	auipc	s1,0x8
    800019d0:	55448493          	addi	s1,s1,1364 # 80009f20 <_ZN7_thread7runningE>
    800019d4:	0004b583          	ld	a1,0(s1)
    800019d8:	00000097          	auipc	ra,0x0
    800019dc:	f64080e7          	jalr	-156(ra) # 8000193c <_ZN7_thread9putThreadEPS_>
    _thread::running->setBlocked(true);
    800019e0:	0004b783          	ld	a5,0(s1)
    bool isBlocked() const{return blocked;};
    void setBlocked(bool blocked){_thread::blocked = blocked;};
    800019e4:	00100713          	li	a4,1
    800019e8:	02e784a3          	sb	a4,41(a5)
    thread_dispatch();
    800019ec:	00000097          	auipc	ra,0x0
    800019f0:	ab8080e7          	jalr	-1352(ra) # 800014a4 <_Z15thread_dispatchv>
}
    800019f4:	01813083          	ld	ra,24(sp)
    800019f8:	01013403          	ld	s0,16(sp)
    800019fc:	00813483          	ld	s1,8(sp)
    80001a00:	02010113          	addi	sp,sp,32
    80001a04:	00008067          	ret

0000000080001a08 <_ZN8MemAlloc9mem_allocEm>:
//
// Created by os on 7/29/23.
//
#include "../h/MemAllocator.h"

void *MemAlloc::mem_alloc(size_t size) {
    80001a08:	ff010113          	addi	sp,sp,-16
    80001a0c:	00813423          	sd	s0,8(sp)
    80001a10:	01010413          	addi	s0,sp,16
    if(size <= 0) return nullptr;
    80001a14:	10058463          	beqz	a1,80001b1c <_ZN8MemAlloc9mem_allocEm+0x114>
    size_t blocksSize = size * MEM_BLOCK_SIZE;
    static bool instanceExists=false;
    if(!instanceExists){
    80001a18:	00008797          	auipc	a5,0x8
    80001a1c:	5107c783          	lbu	a5,1296(a5) # 80009f28 <_ZZN8MemAlloc9mem_allocEmE14instanceExists>
    80001a20:	04079a63          	bnez	a5,80001a74 <_ZN8MemAlloc9mem_allocEm+0x6c>
        instanceExists=true;
    80001a24:	00100793          	li	a5,1
    80001a28:	00008717          	auipc	a4,0x8
    80001a2c:	50f70023          	sb	a5,1280(a4) # 80009f28 <_ZZN8MemAlloc9mem_allocEmE14instanceExists>
        head=(MemoryBlock*)((uint64 *)HEAP_START_ADDR);
    80001a30:	00008717          	auipc	a4,0x8
    80001a34:	47873703          	ld	a4,1144(a4) # 80009ea8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001a38:	00073783          	ld	a5,0(a4)
    80001a3c:	00f53023          	sd	a5,0(a0)
        head->next=nullptr;
    80001a40:	0007b023          	sd	zero,0(a5)
        head->prev=nullptr;
    80001a44:	00053783          	ld	a5,0(a0)
    80001a48:	0007b423          	sd	zero,8(a5)
        head->size=((uint64)((uint64 *)HEAP_END_ADDR-(uint64 *)HEAP_START_ADDR)-sizeof(MemAlloc))/MEM_BLOCK_SIZE;
    80001a4c:	00008797          	auipc	a5,0x8
    80001a50:	47c7b783          	ld	a5,1148(a5) # 80009ec8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001a54:	0007b783          	ld	a5,0(a5)
    80001a58:	00073703          	ld	a4,0(a4)
    80001a5c:	40e787b3          	sub	a5,a5,a4
    80001a60:	4037d793          	srai	a5,a5,0x3
    80001a64:	ff878793          	addi	a5,a5,-8
    80001a68:	00053703          	ld	a4,0(a0)
    80001a6c:	0067d793          	srli	a5,a5,0x6
    80001a70:	00f73823          	sd	a5,16(a4)
    }
    void* ret= nullptr;
    for(MemoryBlock* curr=head; curr != nullptr; curr=curr->next){
    80001a74:	00053783          	ld	a5,0(a0)
    80001a78:	04078863          	beqz	a5,80001ac8 <_ZN8MemAlloc9mem_allocEm+0xc0>
        if(curr->size < size) continue;
    80001a7c:	0107b703          	ld	a4,16(a5)
    80001a80:	04b76c63          	bltu	a4,a1,80001ad8 <_ZN8MemAlloc9mem_allocEm+0xd0>
        ret=curr;
        if(curr->size == size){
    80001a84:	04b70e63          	beq	a4,a1,80001ae0 <_ZN8MemAlloc9mem_allocEm+0xd8>
            }
            curr->size = size;
            break;
        }
        else{
            MemoryBlock* newFreeBlock = (MemoryBlock*)((uint64 *)curr + blocksSize);
    80001a88:	00959713          	slli	a4,a1,0x9
    80001a8c:	00e78733          	add	a4,a5,a4
            if(curr->prev){
    80001a90:	0087b683          	ld	a3,8(a5)
    80001a94:	08068063          	beqz	a3,80001b14 <_ZN8MemAlloc9mem_allocEm+0x10c>
                curr->prev->next=newFreeBlock;
    80001a98:	00e6b023          	sd	a4,0(a3)
            }
            else{
                head=newFreeBlock;
            }
            if(curr->next){
    80001a9c:	0007b683          	ld	a3,0(a5)
    80001aa0:	00068463          	beqz	a3,80001aa8 <_ZN8MemAlloc9mem_allocEm+0xa0>
                curr->next->prev=newFreeBlock;
    80001aa4:	00e6b423          	sd	a4,8(a3)
            }
            newFreeBlock->prev=curr->prev;
    80001aa8:	0087b683          	ld	a3,8(a5)
    80001aac:	00d73423          	sd	a3,8(a4)
            newFreeBlock->next=curr->next;
    80001ab0:	0007b683          	ld	a3,0(a5)
    80001ab4:	00d73023          	sd	a3,0(a4)
            newFreeBlock->size= curr->size - size;
    80001ab8:	0107b683          	ld	a3,16(a5)
    80001abc:	40b686b3          	sub	a3,a3,a1
    80001ac0:	00d73823          	sd	a3,16(a4)
            curr->size = size;
    80001ac4:	00b7b823          	sd	a1,16(a5)
            break;
        }
    }
    return (uint64 *) ret + sizeof (MemoryBlock);
    80001ac8:	0c078513          	addi	a0,a5,192
}
    80001acc:	00813403          	ld	s0,8(sp)
    80001ad0:	01010113          	addi	sp,sp,16
    80001ad4:	00008067          	ret
    for(MemoryBlock* curr=head; curr != nullptr; curr=curr->next){
    80001ad8:	0007b783          	ld	a5,0(a5)
    80001adc:	f9dff06f          	j	80001a78 <_ZN8MemAlloc9mem_allocEm+0x70>
            if(curr->prev){
    80001ae0:	0087b703          	ld	a4,8(a5)
    80001ae4:	02070263          	beqz	a4,80001b08 <_ZN8MemAlloc9mem_allocEm+0x100>
                curr->prev->next = curr->next;
    80001ae8:	0007b683          	ld	a3,0(a5)
    80001aec:	00d73023          	sd	a3,0(a4)
            if(curr->next){
    80001af0:	0007b703          	ld	a4,0(a5)
    80001af4:	00070663          	beqz	a4,80001b00 <_ZN8MemAlloc9mem_allocEm+0xf8>
                curr->next->prev =curr->prev;
    80001af8:	0087b683          	ld	a3,8(a5)
    80001afc:	00d73423          	sd	a3,8(a4)
            curr->size = size;
    80001b00:	00b7b823          	sd	a1,16(a5)
            break;
    80001b04:	fc5ff06f          	j	80001ac8 <_ZN8MemAlloc9mem_allocEm+0xc0>
                head=curr->next;
    80001b08:	0007b703          	ld	a4,0(a5)
    80001b0c:	00e53023          	sd	a4,0(a0)
    80001b10:	fe1ff06f          	j	80001af0 <_ZN8MemAlloc9mem_allocEm+0xe8>
                head=newFreeBlock;
    80001b14:	00e53023          	sd	a4,0(a0)
    80001b18:	f85ff06f          	j	80001a9c <_ZN8MemAlloc9mem_allocEm+0x94>
    if(size <= 0) return nullptr;
    80001b1c:	00000513          	li	a0,0
    80001b20:	fadff06f          	j	80001acc <_ZN8MemAlloc9mem_allocEm+0xc4>

0000000080001b24 <_ZN8MemAlloc11getInstanceEv>:

MemAlloc& MemAlloc::getInstance() {
    80001b24:	ff010113          	addi	sp,sp,-16
    80001b28:	00813423          	sd	s0,8(sp)
    80001b2c:	01010413          	addi	s0,sp,16
    static MemAlloc instance;
    return instance;
}
    80001b30:	00008517          	auipc	a0,0x8
    80001b34:	40050513          	addi	a0,a0,1024 # 80009f30 <_ZZN8MemAlloc11getInstanceEvE8instance>
    80001b38:	00813403          	ld	s0,8(sp)
    80001b3c:	01010113          	addi	sp,sp,16
    80001b40:	00008067          	ret

0000000080001b44 <_ZN8MemAlloc9tryToJoinEP11MemoryBlock>:

void MemAlloc::tryToJoin(MemoryBlock *curr) {
    80001b44:	ff010113          	addi	sp,sp,-16
    80001b48:	00813423          	sd	s0,8(sp)
    80001b4c:	01010413          	addi	s0,sp,16
    size_t blocksSize = curr->size * MEM_BLOCK_SIZE;
    80001b50:	0105b683          	ld	a3,16(a1)
    if(curr->next && (char*)(curr->next) == ((char*)curr + blocksSize)){
    80001b54:	0005b783          	ld	a5,0(a1)
    80001b58:	00078863          	beqz	a5,80001b68 <_ZN8MemAlloc9tryToJoinEP11MemoryBlock+0x24>
    80001b5c:	00669713          	slli	a4,a3,0x6
    80001b60:	00e58733          	add	a4,a1,a4
    80001b64:	00e78863          	beq	a5,a4,80001b74 <_ZN8MemAlloc9tryToJoinEP11MemoryBlock+0x30>
        if(curr->next){
            curr->next->prev=curr;
        }
    }

}
    80001b68:	00813403          	ld	s0,8(sp)
    80001b6c:	01010113          	addi	sp,sp,16
    80001b70:	00008067          	ret
        curr->size+=curr->next->size;
    80001b74:	0107b703          	ld	a4,16(a5)
    80001b78:	00e686b3          	add	a3,a3,a4
    80001b7c:	00d5b823          	sd	a3,16(a1)
        curr->next=curr->next->next;
    80001b80:	0007b783          	ld	a5,0(a5)
    80001b84:	00f5b023          	sd	a5,0(a1)
        if(curr->next){
    80001b88:	fe0780e3          	beqz	a5,80001b68 <_ZN8MemAlloc9tryToJoinEP11MemoryBlock+0x24>
            curr->next->prev=curr;
    80001b8c:	00b7b423          	sd	a1,8(a5)
}
    80001b90:	fd9ff06f          	j	80001b68 <_ZN8MemAlloc9tryToJoinEP11MemoryBlock+0x24>

0000000080001b94 <_ZN8MemAlloc8mem_freeEPv>:

int MemAlloc::mem_free(void *adr) {
    if(!adr) return -1;
    80001b94:	0e058663          	beqz	a1,80001c80 <_ZN8MemAlloc8mem_freeEPv+0xec>
int MemAlloc::mem_free(void *adr) {
    80001b98:	fe010113          	addi	sp,sp,-32
    80001b9c:	00113c23          	sd	ra,24(sp)
    80001ba0:	00813823          	sd	s0,16(sp)
    80001ba4:	00913423          	sd	s1,8(sp)
    80001ba8:	01213023          	sd	s2,0(sp)
    80001bac:	02010413          	addi	s0,sp,32
    80001bb0:	00050913          	mv	s2,a0
    80001bb4:	00058713          	mv	a4,a1
    if((uint64 *)adr > (uint64*)HEAP_END_ADDR || (uint64 *)adr < (uint64 *)HEAP_START_ADDR)return -1;
    80001bb8:	00008797          	auipc	a5,0x8
    80001bbc:	3107b783          	ld	a5,784(a5) # 80009ec8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001bc0:	0007b783          	ld	a5,0(a5)
    80001bc4:	0cb7e263          	bltu	a5,a1,80001c88 <_ZN8MemAlloc8mem_freeEPv+0xf4>
    80001bc8:	00008797          	auipc	a5,0x8
    80001bcc:	2e07b783          	ld	a5,736(a5) # 80009ea8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001bd0:	0007b783          	ld	a5,0(a5)
    80001bd4:	0af5ee63          	bltu	a1,a5,80001c90 <_ZN8MemAlloc8mem_freeEPv+0xfc>
    MemoryBlock* prev=0;
    if(head==nullptr || (char*)adr < (char*)head) {
    80001bd8:	00053783          	ld	a5,0(a0)
    80001bdc:	00078e63          	beqz	a5,80001bf8 <_ZN8MemAlloc8mem_freeEPv+0x64>
    80001be0:	02f5e063          	bltu	a1,a5,80001c00 <_ZN8MemAlloc8mem_freeEPv+0x6c>
        prev = 0;
    }
    else{
        for(prev = head; prev->next != 0 && (char*)adr > (char*)(prev->next); prev = prev->next);
    80001be4:	00078493          	mv	s1,a5
    80001be8:	0007b783          	ld	a5,0(a5)
    80001bec:	00078c63          	beqz	a5,80001c04 <_ZN8MemAlloc8mem_freeEPv+0x70>
    80001bf0:	fee7eae3          	bltu	a5,a4,80001be4 <_ZN8MemAlloc8mem_freeEPv+0x50>
    80001bf4:	0100006f          	j	80001c04 <_ZN8MemAlloc8mem_freeEPv+0x70>
        prev = 0;
    80001bf8:	00078493          	mv	s1,a5
    80001bfc:	0080006f          	j	80001c04 <_ZN8MemAlloc8mem_freeEPv+0x70>
    80001c00:	00000493          	li	s1,0
    }
    MemoryBlock* seg = (MemoryBlock*) ((uint64*)adr - sizeof(MemoryBlock));
    80001c04:	f4070593          	addi	a1,a4,-192
    seg->prev=prev;
    80001c08:	f4973423          	sd	s1,-184(a4)
    if(prev){
    80001c0c:	06048063          	beqz	s1,80001c6c <_ZN8MemAlloc8mem_freeEPv+0xd8>
        seg->next=prev->next;
    80001c10:	0004b783          	ld	a5,0(s1)
    80001c14:	f4f73023          	sd	a5,-192(a4)
    }
    else {
        seg->next = head;
    }
    if(seg->next){
    80001c18:	f4073783          	ld	a5,-192(a4)
    80001c1c:	00078463          	beqz	a5,80001c24 <_ZN8MemAlloc8mem_freeEPv+0x90>
        seg->next->prev=seg;
    80001c20:	00b7b423          	sd	a1,8(a5)
    }
    if(prev){
    80001c24:	04048a63          	beqz	s1,80001c78 <_ZN8MemAlloc8mem_freeEPv+0xe4>
        prev->next=seg;
    80001c28:	00b4b023          	sd	a1,0(s1)
    }
    else{
        head=seg;
    }
    if(seg!=nullptr){
    80001c2c:	00058863          	beqz	a1,80001c3c <_ZN8MemAlloc8mem_freeEPv+0xa8>
        tryToJoin(seg);
    80001c30:	00090513          	mv	a0,s2
    80001c34:	00000097          	auipc	ra,0x0
    80001c38:	f10080e7          	jalr	-240(ra) # 80001b44 <_ZN8MemAlloc9tryToJoinEP11MemoryBlock>
    }
    if(prev!=nullptr){
    80001c3c:	04048e63          	beqz	s1,80001c98 <_ZN8MemAlloc8mem_freeEPv+0x104>
        tryToJoin(prev);
    80001c40:	00048593          	mv	a1,s1
    80001c44:	00090513          	mv	a0,s2
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	efc080e7          	jalr	-260(ra) # 80001b44 <_ZN8MemAlloc9tryToJoinEP11MemoryBlock>
    }
    return 0;
    80001c50:	00000513          	li	a0,0
}
    80001c54:	01813083          	ld	ra,24(sp)
    80001c58:	01013403          	ld	s0,16(sp)
    80001c5c:	00813483          	ld	s1,8(sp)
    80001c60:	00013903          	ld	s2,0(sp)
    80001c64:	02010113          	addi	sp,sp,32
    80001c68:	00008067          	ret
        seg->next = head;
    80001c6c:	00093783          	ld	a5,0(s2)
    80001c70:	f4f73023          	sd	a5,-192(a4)
    80001c74:	fa5ff06f          	j	80001c18 <_ZN8MemAlloc8mem_freeEPv+0x84>
        head=seg;
    80001c78:	00b93023          	sd	a1,0(s2)
    80001c7c:	fb1ff06f          	j	80001c2c <_ZN8MemAlloc8mem_freeEPv+0x98>
    if(!adr) return -1;
    80001c80:	fff00513          	li	a0,-1
}
    80001c84:	00008067          	ret
    if((uint64 *)adr > (uint64*)HEAP_END_ADDR || (uint64 *)adr < (uint64 *)HEAP_START_ADDR)return -1;
    80001c88:	fff00513          	li	a0,-1
    80001c8c:	fc9ff06f          	j	80001c54 <_ZN8MemAlloc8mem_freeEPv+0xc0>
    80001c90:	fff00513          	li	a0,-1
    80001c94:	fc1ff06f          	j	80001c54 <_ZN8MemAlloc8mem_freeEPv+0xc0>
    return 0;
    80001c98:	00000513          	li	a0,0
    80001c9c:	fb9ff06f          	j	80001c54 <_ZN8MemAlloc8mem_freeEPv+0xc0>

0000000080001ca0 <_Z8userMainv>:
// TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)
#include "../test/ConsumerProducer_C_API_test.hpp"
// TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)
#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp"

void userMain(){
    80001ca0:	ff010113          	addi	sp,sp,-16
    80001ca4:	00113423          	sd	ra,8(sp)
    80001ca8:	00813023          	sd	s0,0(sp)
    80001cac:	01010413          	addi	s0,sp,16
    printString("USERMAIN \n");
    80001cb0:	00006517          	auipc	a0,0x6
    80001cb4:	37050513          	addi	a0,a0,880 # 80008020 <CONSOLE_STATUS+0x10>
    80001cb8:	00003097          	auipc	ra,0x3
    80001cbc:	ca4080e7          	jalr	-860(ra) # 8000495c <_Z11printStringPKc>
    //printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");

    //producerConsumer_CPP_Sync_API();
    //printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");

    printString("USERMAIN_ENDED \n");
    80001cc0:	00006517          	auipc	a0,0x6
    80001cc4:	37050513          	addi	a0,a0,880 # 80008030 <CONSOLE_STATUS+0x20>
    80001cc8:	00003097          	auipc	ra,0x3
    80001ccc:	c94080e7          	jalr	-876(ra) # 8000495c <_Z11printStringPKc>


    System_Mode_test();
    80001cd0:	00004097          	auipc	ra,0x4
    80001cd4:	840080e7          	jalr	-1984(ra) # 80005510 <_Z16System_Mode_testv>
    printString("Test se nije uspesno zavrsio\n");
    80001cd8:	00006517          	auipc	a0,0x6
    80001cdc:	37050513          	addi	a0,a0,880 # 80008048 <CONSOLE_STATUS+0x38>
    80001ce0:	00003097          	auipc	ra,0x3
    80001ce4:	c7c080e7          	jalr	-900(ra) # 8000495c <_Z11printStringPKc>
    //printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
};
    80001ce8:	00813083          	ld	ra,8(sp)
    80001cec:	00013403          	ld	s0,0(sp)
    80001cf0:	01010113          	addi	sp,sp,16
    80001cf4:	00008067          	ret

0000000080001cf8 <main>:




void main() {
    80001cf8:	fe010113          	addi	sp,sp,-32
    80001cfc:	00113c23          	sd	ra,24(sp)
    80001d00:	00813823          	sd	s0,16(sp)
    80001d04:	02010413          	addi	s0,sp,32
   __asm__ volatile ("csrw stvec, %[vector]" : : [vector] "r"((uint64) (&vector_table) | 0x01));
    80001d08:	00008797          	auipc	a5,0x8
    80001d0c:	1b87b783          	ld	a5,440(a5) # 80009ec0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d10:	0017e793          	ori	a5,a5,1
    80001d14:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001d18:	00200793          	li	a5,2
    80001d1c:	1007a073          	csrs	sstatus,a5
   Riscv::ms_sstatus(0x02);
    _thread* nit;
    thread_create(&nit, nullptr, nullptr);
    80001d20:	00000613          	li	a2,0
    80001d24:	00000593          	li	a1,0
    80001d28:	fe840513          	addi	a0,s0,-24
    80001d2c:	fffff097          	auipc	ra,0xfffff
    80001d30:	6c4080e7          	jalr	1732(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::running=nit;
    80001d34:	00008797          	auipc	a5,0x8
    80001d38:	17c7b783          	ld	a5,380(a5) # 80009eb0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001d3c:	fe843703          	ld	a4,-24(s0)
    80001d40:	00e7b023          	sd	a4,0(a5)
    goToUserMode();
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	92c080e7          	jalr	-1748(ra) # 80001670 <_Z12goToUserModev>
    userMain();
    80001d4c:	00000097          	auipc	ra,0x0
    80001d50:	f54080e7          	jalr	-172(ra) # 80001ca0 <_Z8userMainv>
    while(Scheduler::get())thread_dispatch();
    80001d54:	00001097          	auipc	ra,0x1
    80001d58:	e0c080e7          	jalr	-500(ra) # 80002b60 <_ZN9Scheduler3getEv>
    80001d5c:	00050863          	beqz	a0,80001d6c <main+0x74>
    80001d60:	fffff097          	auipc	ra,0xfffff
    80001d64:	744080e7          	jalr	1860(ra) # 800014a4 <_Z15thread_dispatchv>
    80001d68:	fedff06f          	j	80001d54 <main+0x5c>
    MemAlloc::getInstance().mem_free(nit);
    80001d6c:	00000097          	auipc	ra,0x0
    80001d70:	db8080e7          	jalr	-584(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80001d74:	fe843583          	ld	a1,-24(s0)
    80001d78:	00000097          	auipc	ra,0x0
    80001d7c:	e1c080e7          	jalr	-484(ra) # 80001b94 <_ZN8MemAlloc8mem_freeEPv>
    printString("MAIN_ENDED \n");
    80001d80:	00006517          	auipc	a0,0x6
    80001d84:	2e850513          	addi	a0,a0,744 # 80008068 <CONSOLE_STATUS+0x58>
    80001d88:	00003097          	auipc	ra,0x3
    80001d8c:	bd4080e7          	jalr	-1068(ra) # 8000495c <_Z11printStringPKc>
}
    80001d90:	01813083          	ld	ra,24(sp)
    80001d94:	01013403          	ld	s0,16(sp)
    80001d98:	02010113          	addi	sp,sp,32
    80001d9c:	00008067          	ret

0000000080001da0 <_ZN6Thread7wrapperEPv>:

void Thread::dispatch() {
    thread_dispatch();
}

void Thread::wrapper(void *thrd) {
    80001da0:	ff010113          	addi	sp,sp,-16
    80001da4:	00113423          	sd	ra,8(sp)
    80001da8:	00813023          	sd	s0,0(sp)
    80001dac:	01010413          	addi	s0,sp,16
    Thread* temp=(Thread*)thrd;
    temp->run();
    80001db0:	00053783          	ld	a5,0(a0)
    80001db4:	0107b783          	ld	a5,16(a5)
    80001db8:	000780e7          	jalr	a5
}
    80001dbc:	00813083          	ld	ra,8(sp)
    80001dc0:	00013403          	ld	s0,0(sp)
    80001dc4:	01010113          	addi	sp,sp,16
    80001dc8:	00008067          	ret

0000000080001dcc <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore() {
    80001dcc:	ff010113          	addi	sp,sp,-16
    80001dd0:	00113423          	sd	ra,8(sp)
    80001dd4:	00813023          	sd	s0,0(sp)
    80001dd8:	01010413          	addi	s0,sp,16
    80001ddc:	00008797          	auipc	a5,0x8
    80001de0:	f7c78793          	addi	a5,a5,-132 # 80009d58 <_ZTV9Semaphore+0x10>
    80001de4:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001de8:	00853503          	ld	a0,8(a0)
    80001dec:	fffff097          	auipc	ra,0xfffff
    80001df0:	748080e7          	jalr	1864(ra) # 80001534 <_Z9sem_closeP4_sem>
}
    80001df4:	00813083          	ld	ra,8(sp)
    80001df8:	00013403          	ld	s0,0(sp)
    80001dfc:	01010113          	addi	sp,sp,16
    80001e00:	00008067          	ret

0000000080001e04 <_Znwm>:
void *operator new(size_t size) {
    80001e04:	ff010113          	addi	sp,sp,-16
    80001e08:	00113423          	sd	ra,8(sp)
    80001e0c:	00813023          	sd	s0,0(sp)
    80001e10:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001e14:	fffff097          	auipc	ra,0xfffff
    80001e18:	568080e7          	jalr	1384(ra) # 8000137c <_Z9mem_allocm>
}
    80001e1c:	00813083          	ld	ra,8(sp)
    80001e20:	00013403          	ld	s0,0(sp)
    80001e24:	01010113          	addi	sp,sp,16
    80001e28:	00008067          	ret

0000000080001e2c <_ZdlPv>:
void operator delete(void * adr) noexcept{
    80001e2c:	ff010113          	addi	sp,sp,-16
    80001e30:	00113423          	sd	ra,8(sp)
    80001e34:	00813023          	sd	s0,0(sp)
    80001e38:	01010413          	addi	s0,sp,16
mem_free(adr);
    80001e3c:	fffff097          	auipc	ra,0xfffff
    80001e40:	57c080e7          	jalr	1404(ra) # 800013b8 <_Z8mem_freePv>
}
    80001e44:	00813083          	ld	ra,8(sp)
    80001e48:	00013403          	ld	s0,0(sp)
    80001e4c:	01010113          	addi	sp,sp,16
    80001e50:	00008067          	ret

0000000080001e54 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80001e54:	fe010113          	addi	sp,sp,-32
    80001e58:	00113c23          	sd	ra,24(sp)
    80001e5c:	00813823          	sd	s0,16(sp)
    80001e60:	00913423          	sd	s1,8(sp)
    80001e64:	02010413          	addi	s0,sp,32
    80001e68:	00008797          	auipc	a5,0x8
    80001e6c:	ec878793          	addi	a5,a5,-312 # 80009d30 <_ZTV6Thread+0x10>
    80001e70:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80001e74:	00853483          	ld	s1,8(a0)
    80001e78:	02048263          	beqz	s1,80001e9c <_ZN6ThreadD1Ev+0x48>
        MemAlloc::getInstance().mem_free(stack);
    80001e7c:	00000097          	auipc	ra,0x0
    80001e80:	ca8080e7          	jalr	-856(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80001e84:	0104b583          	ld	a1,16(s1)
    80001e88:	00000097          	auipc	ra,0x0
    80001e8c:	d0c080e7          	jalr	-756(ra) # 80001b94 <_ZN8MemAlloc8mem_freeEPv>
    80001e90:	00048513          	mv	a0,s1
    80001e94:	00000097          	auipc	ra,0x0
    80001e98:	f98080e7          	jalr	-104(ra) # 80001e2c <_ZdlPv>
}
    80001e9c:	01813083          	ld	ra,24(sp)
    80001ea0:	01013403          	ld	s0,16(sp)
    80001ea4:	00813483          	ld	s1,8(sp)
    80001ea8:	02010113          	addi	sp,sp,32
    80001eac:	00008067          	ret

0000000080001eb0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001eb0:	fe010113          	addi	sp,sp,-32
    80001eb4:	00113c23          	sd	ra,24(sp)
    80001eb8:	00813823          	sd	s0,16(sp)
    80001ebc:	00913423          	sd	s1,8(sp)
    80001ec0:	02010413          	addi	s0,sp,32
    80001ec4:	00050493          	mv	s1,a0
}
    80001ec8:	00000097          	auipc	ra,0x0
    80001ecc:	f8c080e7          	jalr	-116(ra) # 80001e54 <_ZN6ThreadD1Ev>
    80001ed0:	00048513          	mv	a0,s1
    80001ed4:	00000097          	auipc	ra,0x0
    80001ed8:	f58080e7          	jalr	-168(ra) # 80001e2c <_ZdlPv>
    80001edc:	01813083          	ld	ra,24(sp)
    80001ee0:	01013403          	ld	s0,16(sp)
    80001ee4:	00813483          	ld	s1,8(sp)
    80001ee8:	02010113          	addi	sp,sp,32
    80001eec:	00008067          	ret

0000000080001ef0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001ef0:	fe010113          	addi	sp,sp,-32
    80001ef4:	00113c23          	sd	ra,24(sp)
    80001ef8:	00813823          	sd	s0,16(sp)
    80001efc:	00913423          	sd	s1,8(sp)
    80001f00:	02010413          	addi	s0,sp,32
    80001f04:	00050493          	mv	s1,a0
}
    80001f08:	00000097          	auipc	ra,0x0
    80001f0c:	ec4080e7          	jalr	-316(ra) # 80001dcc <_ZN9SemaphoreD1Ev>
    80001f10:	00048513          	mv	a0,s1
    80001f14:	00000097          	auipc	ra,0x0
    80001f18:	f18080e7          	jalr	-232(ra) # 80001e2c <_ZdlPv>
    80001f1c:	01813083          	ld	ra,24(sp)
    80001f20:	01013403          	ld	s0,16(sp)
    80001f24:	00813483          	ld	s1,8(sp)
    80001f28:	02010113          	addi	sp,sp,32
    80001f2c:	00008067          	ret

0000000080001f30 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg){
    80001f30:	ff010113          	addi	sp,sp,-16
    80001f34:	00113423          	sd	ra,8(sp)
    80001f38:	00813023          	sd	s0,0(sp)
    80001f3c:	01010413          	addi	s0,sp,16
    80001f40:	00008797          	auipc	a5,0x8
    80001f44:	df078793          	addi	a5,a5,-528 # 80009d30 <_ZTV6Thread+0x10>
    80001f48:	00f53023          	sd	a5,0(a0)
    thread_createCPP(&myHandle,body,arg);
    80001f4c:	00850513          	addi	a0,a0,8
    80001f50:	fffff097          	auipc	ra,0xfffff
    80001f54:	4e0080e7          	jalr	1248(ra) # 80001430 <_Z16thread_createCPPPP7_threadPFvPvES2_>
}
    80001f58:	00813083          	ld	ra,8(sp)
    80001f5c:	00013403          	ld	s0,0(sp)
    80001f60:	01010113          	addi	sp,sp,16
    80001f64:	00008067          	ret

0000000080001f68 <_ZN6Thread5startEv>:
int Thread::start() {
    80001f68:	ff010113          	addi	sp,sp,-16
    80001f6c:	00113423          	sd	ra,8(sp)
    80001f70:	00813023          	sd	s0,0(sp)
    80001f74:	01010413          	addi	s0,sp,16
    Scheduler::put(myHandle);
    80001f78:	00853503          	ld	a0,8(a0)
    80001f7c:	00001097          	auipc	ra,0x1
    80001f80:	c4c080e7          	jalr	-948(ra) # 80002bc8 <_ZN9Scheduler3putEP7_thread>
}
    80001f84:	00000513          	li	a0,0
    80001f88:	00813083          	ld	ra,8(sp)
    80001f8c:	00013403          	ld	s0,0(sp)
    80001f90:	01010113          	addi	sp,sp,16
    80001f94:	00008067          	ret

0000000080001f98 <_ZN6Thread4joinEv>:
void Thread::join() {
    80001f98:	ff010113          	addi	sp,sp,-16
    80001f9c:	00113423          	sd	ra,8(sp)
    80001fa0:	00813023          	sd	s0,0(sp)
    80001fa4:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80001fa8:	00853503          	ld	a0,8(a0)
    80001fac:	fffff097          	auipc	ra,0xfffff
    80001fb0:	51c080e7          	jalr	1308(ra) # 800014c8 <_Z11thread_joinP7_thread>
}
    80001fb4:	00813083          	ld	ra,8(sp)
    80001fb8:	00013403          	ld	s0,0(sp)
    80001fbc:	01010113          	addi	sp,sp,16
    80001fc0:	00008067          	ret

0000000080001fc4 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001fc4:	ff010113          	addi	sp,sp,-16
    80001fc8:	00113423          	sd	ra,8(sp)
    80001fcc:	00813023          	sd	s0,0(sp)
    80001fd0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001fd4:	fffff097          	auipc	ra,0xfffff
    80001fd8:	4d0080e7          	jalr	1232(ra) # 800014a4 <_Z15thread_dispatchv>
}
    80001fdc:	00813083          	ld	ra,8(sp)
    80001fe0:	00013403          	ld	s0,0(sp)
    80001fe4:	01010113          	addi	sp,sp,16
    80001fe8:	00008067          	ret

0000000080001fec <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80001fec:	ff010113          	addi	sp,sp,-16
    80001ff0:	00113423          	sd	ra,8(sp)
    80001ff4:	00813023          	sd	s0,0(sp)
    80001ff8:	01010413          	addi	s0,sp,16
    80001ffc:	00008797          	auipc	a5,0x8
    80002000:	d3478793          	addi	a5,a5,-716 # 80009d30 <_ZTV6Thread+0x10>
    80002004:	00f53023          	sd	a5,0(a0)
    thread_createCPP(&myHandle, wrapper, this);
    80002008:	00050613          	mv	a2,a0
    8000200c:	00000597          	auipc	a1,0x0
    80002010:	d9458593          	addi	a1,a1,-620 # 80001da0 <_ZN6Thread7wrapperEPv>
    80002014:	00850513          	addi	a0,a0,8
    80002018:	fffff097          	auipc	ra,0xfffff
    8000201c:	418080e7          	jalr	1048(ra) # 80001430 <_Z16thread_createCPPPP7_threadPFvPvES2_>
}
    80002020:	00813083          	ld	ra,8(sp)
    80002024:	00013403          	ld	s0,0(sp)
    80002028:	01010113          	addi	sp,sp,16
    8000202c:	00008067          	ret

0000000080002030 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002030:	ff010113          	addi	sp,sp,-16
    80002034:	00113423          	sd	ra,8(sp)
    80002038:	00813023          	sd	s0,0(sp)
    8000203c:	01010413          	addi	s0,sp,16
    80002040:	00008797          	auipc	a5,0x8
    80002044:	d1878793          	addi	a5,a5,-744 # 80009d58 <_ZTV9Semaphore+0x10>
    80002048:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle,init);
    8000204c:	00850513          	addi	a0,a0,8
    80002050:	fffff097          	auipc	ra,0xfffff
    80002054:	4a0080e7          	jalr	1184(ra) # 800014f0 <_Z8sem_openPP4_semj>
}
    80002058:	00813083          	ld	ra,8(sp)
    8000205c:	00013403          	ld	s0,0(sp)
    80002060:	01010113          	addi	sp,sp,16
    80002064:	00008067          	ret

0000000080002068 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80002068:	ff010113          	addi	sp,sp,-16
    8000206c:	00113423          	sd	ra,8(sp)
    80002070:	00813023          	sd	s0,0(sp)
    80002074:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002078:	00853503          	ld	a0,8(a0)
    8000207c:	fffff097          	auipc	ra,0xfffff
    80002080:	4f0080e7          	jalr	1264(ra) # 8000156c <_Z8sem_waitP4_sem>
}
    80002084:	00813083          	ld	ra,8(sp)
    80002088:	00013403          	ld	s0,0(sp)
    8000208c:	01010113          	addi	sp,sp,16
    80002090:	00008067          	ret

0000000080002094 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80002094:	ff010113          	addi	sp,sp,-16
    80002098:	00113423          	sd	ra,8(sp)
    8000209c:	00813023          	sd	s0,0(sp)
    800020a0:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800020a4:	00853503          	ld	a0,8(a0)
    800020a8:	fffff097          	auipc	ra,0xfffff
    800020ac:	4fc080e7          	jalr	1276(ra) # 800015a4 <_Z10sem_signalP4_sem>
}
    800020b0:	00813083          	ld	ra,8(sp)
    800020b4:	00013403          	ld	s0,0(sp)
    800020b8:	01010113          	addi	sp,sp,16
    800020bc:	00008067          	ret

00000000800020c0 <_ZN9Semaphore7tryWaitEv>:

int Semaphore::tryWait() {
    800020c0:	ff010113          	addi	sp,sp,-16
    800020c4:	00113423          	sd	ra,8(sp)
    800020c8:	00813023          	sd	s0,0(sp)
    800020cc:	01010413          	addi	s0,sp,16
    return sem_trywait(myHandle);
    800020d0:	00853503          	ld	a0,8(a0)
    800020d4:	fffff097          	auipc	ra,0xfffff
    800020d8:	508080e7          	jalr	1288(ra) # 800015dc <_Z11sem_trywaitP4_sem>
}
    800020dc:	00813083          	ld	ra,8(sp)
    800020e0:	00013403          	ld	s0,0(sp)
    800020e4:	01010113          	addi	sp,sp,16
    800020e8:	00008067          	ret

00000000800020ec <_ZN7Console4getcEv>:

char Console::getc() {
    800020ec:	ff010113          	addi	sp,sp,-16
    800020f0:	00113423          	sd	ra,8(sp)
    800020f4:	00813023          	sd	s0,0(sp)
    800020f8:	01010413          	addi	s0,sp,16
    return ::getc();
    800020fc:	fffff097          	auipc	ra,0xfffff
    80002100:	518080e7          	jalr	1304(ra) # 80001614 <_Z4getcv>
}
    80002104:	00813083          	ld	ra,8(sp)
    80002108:	00013403          	ld	s0,0(sp)
    8000210c:	01010113          	addi	sp,sp,16
    80002110:	00008067          	ret

0000000080002114 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002114:	ff010113          	addi	sp,sp,-16
    80002118:	00113423          	sd	ra,8(sp)
    8000211c:	00813023          	sd	s0,0(sp)
    80002120:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002124:	fffff097          	auipc	ra,0xfffff
    80002128:	524080e7          	jalr	1316(ra) # 80001648 <_Z4putcc>
    8000212c:	00813083          	ld	ra,8(sp)
    80002130:	00013403          	ld	s0,0(sp)
    80002134:	01010113          	addi	sp,sp,16
    80002138:	00008067          	ret

000000008000213c <_ZN6Thread3runEv>:
    int start ();
    void join();
    static void dispatch ();
protected:
    Thread ();
    virtual void run () {}
    8000213c:	ff010113          	addi	sp,sp,-16
    80002140:	00813423          	sd	s0,8(sp)
    80002144:	01010413          	addi	s0,sp,16
    80002148:	00813403          	ld	s0,8(sp)
    8000214c:	01010113          	addi	sp,sp,16
    80002150:	00008067          	ret

0000000080002154 <_ZN5Riscv10popSppSpieEv>:
#include "../h/riscv.hpp"
#include "../h/_thread.hpp"
#include "../h/_sem.h"
#include "../test/printing.hpp"

void Riscv::popSppSpie() {
    80002154:	ff010113          	addi	sp,sp,-16
    80002158:	00813423          	sd	s0,8(sp)
    8000215c:	01010413          	addi	s0,sp,16
        __asm__ volatile("csrw sepc, ra");
    80002160:	14109073          	csrw	sepc,ra
        __asm__ volatile("sret");
    80002164:	10200073          	sret
}
    80002168:	00813403          	ld	s0,8(sp)
    8000216c:	01010113          	addi	sp,sp,16
    80002170:	00008067          	ret

0000000080002174 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002174:	f2010113          	addi	sp,sp,-224
    80002178:	0c113c23          	sd	ra,216(sp)
    8000217c:	0c813823          	sd	s0,208(sp)
    80002180:	0c913423          	sd	s1,200(sp)
    80002184:	0d213023          	sd	s2,192(sp)
    80002188:	0b313c23          	sd	s3,184(sp)
    8000218c:	0e010413          	addi	s0,sp,224
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002190:	142027f3          	csrr	a5,scause
    80002194:	f2f43823          	sd	a5,-208(s0)
    return scause;
    80002198:	f3043483          	ld	s1,-208(s0)
    uint64 scause = r_scause();

    //sistemski poziv
    if (scause == (0x09) || scause == 0x08)
    8000219c:	ff848713          	addi	a4,s1,-8
    800021a0:	00100793          	li	a5,1
    800021a4:	3ae7e663          	bltu	a5,a4,80002550 <_ZN5Riscv20handleSupervisorTrapEv+0x3dc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800021a8:	141027f3          	csrr	a5,sepc
    800021ac:	f4f43423          	sd	a5,-184(s0)
    return sepc;
    800021b0:	f4843783          	ld	a5,-184(s0)
    {
        // interrupt: no, caouse code: environment call from S-mode (9)
        uint64 volatile sepc = r_sepc();
    800021b4:	f2f43023          	sd	a5,-224(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800021b8:	100027f3          	csrr	a5,sstatus
    800021bc:	f4f43023          	sd	a5,-192(s0)
    return sstatus;
    800021c0:	f4043783          	ld	a5,-192(s0)
        uint64 volatile sstatus = r_sstatus();
    800021c4:	f2f43423          	sd	a5,-216(s0)
    __asm__ volatile("mv %0, a0" : "=r" (a0));
    800021c8:	00050793          	mv	a5,a0
    800021cc:	f2f43c23          	sd	a5,-200(s0)
    return a0;
    800021d0:	f3843783          	ld	a5,-200(s0)
        uint64 cause = r_a0();
        if (cause == MEM_ALLOC) {
    800021d4:	00100713          	li	a4,1
    800021d8:	08e78863          	beq	a5,a4,80002268 <_ZN5Riscv20handleSupervisorTrapEv+0xf4>
            uint64 size = r_a1();
            void *ret = MemAlloc::getInstance().mem_alloc(size);
            __asm__ volatile ("mv a0, %[addr]" : : [addr]"r"(ret));
        }
        else if (cause == MEM_FREE) {
    800021dc:	00200713          	li	a4,2
    800021e0:	0ee78263          	beq	a5,a4,800022c4 <_ZN5Riscv20handleSupervisorTrapEv+0x150>
            uint64 p = r_a1();
            uint ret = MemAlloc::getInstance().mem_free((void *)p);
            w_ret(ret);
        }
        else if(cause == THREAD_CREATE){
    800021e4:	01100713          	li	a4,17
    800021e8:	10e78663          	beq	a5,a4,800022f4 <_ZN5Riscv20handleSupervisorTrapEv+0x180>
                w_ret(-1);
            }else{
                w_ret(0);
            }
        }
        else if(cause == THREAD_EXIT){
    800021ec:	01200713          	li	a4,18
    800021f0:	16e78863          	beq	a5,a4,80002360 <_ZN5Riscv20handleSupervisorTrapEv+0x1ec>
                w_ret(0);
            }else{
                w_ret(-1);
            }
        }
        else if(cause == THREAD_DISPATCH){
    800021f4:	01300713          	li	a4,19
    800021f8:	1ce78e63          	beq	a5,a4,800023d4 <_ZN5Riscv20handleSupervisorTrapEv+0x260>
            _thread::dispatch();
        }
        else if(cause == THREAD_JOIN){
    800021fc:	01400713          	li	a4,20
    80002200:	1ee78063          	beq	a5,a4,800023e0 <_ZN5Riscv20handleSupervisorTrapEv+0x26c>
            uint64 temp = r_a1();
            _thread* handle=(_thread*)temp;
            handle->join(handle);
        }

        else if(cause == THREAD_CREATE_CPP){
    80002204:	01500713          	li	a4,21
    80002208:	1ee78863          	beq	a5,a4,800023f8 <_ZN5Riscv20handleSupervisorTrapEv+0x284>
                w_ret(-1);
            }else{
                w_ret(0);
            }
        }
        else if(cause == SEM_OPEN){
    8000220c:	02100713          	li	a4,33
    80002210:	24e78a63          	beq	a5,a4,80002464 <_ZN5Riscv20handleSupervisorTrapEv+0x2f0>
                w_ret(-1);
            }else{
                w_ret(0);
            }
        }
        else if(cause == SEM_CLOSE){
    80002214:	02200713          	li	a4,34
    80002218:	28e78863          	beq	a5,a4,800024a8 <_ZN5Riscv20handleSupervisorTrapEv+0x334>
            uint64 temp = r_a1();
            _sem* handle=(_sem*)temp;
            int ret=_sem::closeSem(handle);
            w_ret(ret);
        }
        else if(cause == SEM_WAIT){
    8000221c:	02300713          	li	a4,35
    80002220:	2ae78263          	beq	a5,a4,800024c4 <_ZN5Riscv20handleSupervisorTrapEv+0x350>
            uint64 temp = r_a1();
            _sem* handle=(_sem*)temp;
            int ret=_sem::semWait(handle);
            w_ret(ret);
        }
        else if(cause == SEM_SIGNAL){
    80002224:	02400713          	li	a4,36
    80002228:	2ae78c63          	beq	a5,a4,800024e0 <_ZN5Riscv20handleSupervisorTrapEv+0x36c>
            uint64 temp = r_a1();
            _sem* handle=(_sem*)temp;
            int ret=_sem::semSignal(handle);
            w_ret(ret);
        }
        else if(cause == SEM_TRYWAIT){
    8000222c:	02600713          	li	a4,38
    80002230:	2ce78663          	beq	a5,a4,800024fc <_ZN5Riscv20handleSupervisorTrapEv+0x388>
            _sem* handle=(_sem*)temp;
            int ret=_sem::semTryWait(handle);
            w_ret(ret);
        }
            //change to user mode
        else if(cause == USER_MODE){
    80002234:	02700713          	li	a4,39
    80002238:	2ee78063          	beq	a5,a4,80002518 <_ZN5Riscv20handleSupervisorTrapEv+0x3a4>
            mc_sstatus(1<<8);
            w_sepc(sepc + 4);
            mc_sip(SIP_SSIP);
            return;
        }
        else if(cause == GETC){
    8000223c:	04100713          	li	a4,65
    80002240:	30e78063          	beq	a5,a4,80002540 <_ZN5Riscv20handleSupervisorTrapEv+0x3cc>
            char c=__getc();
            w_ret(c);
        }
        else if(cause == PUTC){
    80002244:	04200713          	li	a4,66
    80002248:	04e79263          	bne	a5,a4,8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    8000224c:	00058793          	mv	a5,a1
    80002250:	fcf43423          	sd	a5,-56(s0)
    return a1;
    80002254:	fc843503          	ld	a0,-56(s0)
            uint64 c = r_a1();
            __putc((char)c);
    80002258:	0ff57513          	andi	a0,a0,255
    8000225c:	00005097          	auipc	ra,0x5
    80002260:	790080e7          	jalr	1936(ra) # 800079ec <__putc>
    80002264:	0280006f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    80002268:	00058793          	mv	a5,a1
    8000226c:	f4f43823          	sd	a5,-176(s0)
    return a1;
    80002270:	f5043483          	ld	s1,-176(s0)
            void *ret = MemAlloc::getInstance().mem_alloc(size);
    80002274:	00000097          	auipc	ra,0x0
    80002278:	8b0080e7          	jalr	-1872(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    8000227c:	00048593          	mv	a1,s1
    80002280:	fffff097          	auipc	ra,0xfffff
    80002284:	788080e7          	jalr	1928(ra) # 80001a08 <_ZN8MemAlloc9mem_allocEm>
            __asm__ volatile ("mv a0, %[addr]" : : [addr]"r"(ret));
    80002288:	00050513          	mv	a0,a0
        }
        w_sstatus(sstatus);
    8000228c:	f2843783          	ld	a5,-216(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002290:	10079073          	csrw	sstatus,a5
        w_sepc(sepc + 4);
    80002294:	f2043783          	ld	a5,-224(s0)
    80002298:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000229c:	14179073          	csrw	sepc,a5
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800022a0:	00200793          	li	a5,2
    800022a4:	1447b073          	csrc	sip,a5
        printString("\n stval:");
        printInt(r_stval());
        while (true )printString("");
    }

}
    800022a8:	0d813083          	ld	ra,216(sp)
    800022ac:	0d013403          	ld	s0,208(sp)
    800022b0:	0c813483          	ld	s1,200(sp)
    800022b4:	0c013903          	ld	s2,192(sp)
    800022b8:	0b813983          	ld	s3,184(sp)
    800022bc:	0e010113          	addi	sp,sp,224
    800022c0:	00008067          	ret
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    800022c4:	00058793          	mv	a5,a1
    800022c8:	f4f43c23          	sd	a5,-168(s0)
    return a1;
    800022cc:	f5843483          	ld	s1,-168(s0)
            uint ret = MemAlloc::getInstance().mem_free((void *)p);
    800022d0:	00000097          	auipc	ra,0x0
    800022d4:	854080e7          	jalr	-1964(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    800022d8:	00048593          	mv	a1,s1
    800022dc:	00000097          	auipc	ra,0x0
    800022e0:	8b8080e7          	jalr	-1864(ra) # 80001b94 <_ZN8MemAlloc8mem_freeEPv>
            w_ret(ret);
    800022e4:	02051793          	slli	a5,a0,0x20
    800022e8:	0207d793          	srli	a5,a5,0x20
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    800022ec:	00078513          	mv	a0,a5
}
    800022f0:	f9dff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    800022f4:	00058793          	mv	a5,a1
    800022f8:	f6f43823          	sd	a5,-144(s0)
    return a1;
    800022fc:	f7043483          	ld	s1,-144(s0)
    __asm__ volatile("mv %0, a2" : "=r" (a2));
    80002300:	00060793          	mv	a5,a2
    80002304:	f6f43423          	sd	a5,-152(s0)
    return a2;
    80002308:	f6843903          	ld	s2,-152(s0)
    __asm__ volatile("mv %0, a3" : "=r" (a3));
    8000230c:	00068793          	mv	a5,a3
    80002310:	f6f43023          	sd	a5,-160(s0)
    return a3;
    80002314:	f6043983          	ld	s3,-160(s0)
            uint64* stack=(uint64*)MemAlloc::getInstance().mem_alloc((DEFAULT_STACK_SIZE+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80002318:	00000097          	auipc	ra,0x0
    8000231c:	80c080e7          	jalr	-2036(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80002320:	04000593          	li	a1,64
    80002324:	fffff097          	auipc	ra,0xfffff
    80002328:	6e4080e7          	jalr	1764(ra) # 80001a08 <_ZN8MemAlloc9mem_allocEm>
    8000232c:	00050693          	mv	a3,a0
            _thread::createThread((Body)startRoutine, handle, arg, stack);
    80002330:	00098613          	mv	a2,s3
    80002334:	00048593          	mv	a1,s1
    80002338:	00090513          	mv	a0,s2
    8000233c:	fffff097          	auipc	ra,0xfffff
    80002340:	46c080e7          	jalr	1132(ra) # 800017a8 <_ZN7_thread12createThreadEPFvPvEPPS_S0_Pm>
            if(handle== nullptr){
    80002344:	00049863          	bnez	s1,80002354 <_ZN5Riscv20handleSupervisorTrapEv+0x1e0>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    80002348:	fff00793          	li	a5,-1
    8000234c:	00078513          	mv	a0,a5
}
    80002350:	f3dff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    80002354:	00000793          	li	a5,0
    80002358:	00078513          	mv	a0,a5
}
    8000235c:	f31ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            if(!_thread::running->isBlocked() && !_thread::running->isFinished()){
    80002360:	00008797          	auipc	a5,0x8
    80002364:	b507b783          	ld	a5,-1200(a5) # 80009eb0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002368:	0007b503          	ld	a0,0(a5)
    bool isBlocked() const{return blocked;};
    8000236c:	02954783          	lbu	a5,41(a0)
    80002370:	00079663          	bnez	a5,8000237c <_ZN5Riscv20handleSupervisorTrapEv+0x208>
    bool isFinished() const{return finished;};
    80002374:	02854783          	lbu	a5,40(a0)
    80002378:	00078863          	beqz	a5,80002388 <_ZN5Riscv20handleSupervisorTrapEv+0x214>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    8000237c:	fff00793          	li	a5,-1
    80002380:	00078513          	mv	a0,a5
}
    80002384:	f09ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    void setFinished(bool finished){_thread::finished = finished;};
    80002388:	00100793          	li	a5,1
    8000238c:	02f50423          	sb	a5,40(a0)
                _thread* thread=_thread::running->getThread();
    80002390:	fffff097          	auipc	ra,0xfffff
    80002394:	4c0080e7          	jalr	1216(ra) # 80001850 <_ZN7_thread9getThreadEv>
                while(thread!= nullptr){
    80002398:	02050463          	beqz	a0,800023c0 <_ZN5Riscv20handleSupervisorTrapEv+0x24c>
                    thread->blocked=false;
    8000239c:	020504a3          	sb	zero,41(a0)
                    Scheduler::put(thread);
    800023a0:	00001097          	auipc	ra,0x1
    800023a4:	828080e7          	jalr	-2008(ra) # 80002bc8 <_ZN9Scheduler3putEP7_thread>
                    thread=_thread::running->getThread();
    800023a8:	00008797          	auipc	a5,0x8
    800023ac:	b087b783          	ld	a5,-1272(a5) # 80009eb0 <_GLOBAL_OFFSET_TABLE_+0x10>
    800023b0:	0007b503          	ld	a0,0(a5)
    800023b4:	fffff097          	auipc	ra,0xfffff
    800023b8:	49c080e7          	jalr	1180(ra) # 80001850 <_ZN7_thread9getThreadEv>
                while(thread!= nullptr){
    800023bc:	fddff06f          	j	80002398 <_ZN5Riscv20handleSupervisorTrapEv+0x224>
                _thread::dispatch();
    800023c0:	fffff097          	auipc	ra,0xfffff
    800023c4:	2d4080e7          	jalr	724(ra) # 80001694 <_ZN7_thread8dispatchEv>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    800023c8:	00000793          	li	a5,0
    800023cc:	00078513          	mv	a0,a5
}
    800023d0:	ebdff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            _thread::dispatch();
    800023d4:	fffff097          	auipc	ra,0xfffff
    800023d8:	2c0080e7          	jalr	704(ra) # 80001694 <_ZN7_thread8dispatchEv>
    800023dc:	eb1ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    800023e0:	00058793          	mv	a5,a1
    800023e4:	f6f43c23          	sd	a5,-136(s0)
    return a1;
    800023e8:	f7843503          	ld	a0,-136(s0)
            handle->join(handle);
    800023ec:	fffff097          	auipc	ra,0xfffff
    800023f0:	5cc080e7          	jalr	1484(ra) # 800019b8 <_ZN7_thread4joinEPS_>
    800023f4:	e99ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    800023f8:	00058793          	mv	a5,a1
    800023fc:	f8f43823          	sd	a5,-112(s0)
    return a1;
    80002400:	f9043483          	ld	s1,-112(s0)
    __asm__ volatile("mv %0, a2" : "=r" (a2));
    80002404:	00060793          	mv	a5,a2
    80002408:	f8f43423          	sd	a5,-120(s0)
    return a2;
    8000240c:	f8843903          	ld	s2,-120(s0)
    __asm__ volatile("mv %0, a3" : "=r" (a3));
    80002410:	00068793          	mv	a5,a3
    80002414:	f8f43023          	sd	a5,-128(s0)
    return a3;
    80002418:	f8043983          	ld	s3,-128(s0)
            uint64* stack=(uint64*)MemAlloc::getInstance().mem_alloc((DEFAULT_STACK_SIZE+ MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    8000241c:	fffff097          	auipc	ra,0xfffff
    80002420:	708080e7          	jalr	1800(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80002424:	04000593          	li	a1,64
    80002428:	fffff097          	auipc	ra,0xfffff
    8000242c:	5e0080e7          	jalr	1504(ra) # 80001a08 <_ZN8MemAlloc9mem_allocEm>
    80002430:	00050693          	mv	a3,a0
            _thread::createCPPThread((Body)startRoutine, handle, arg, stack);
    80002434:	00098613          	mv	a2,s3
    80002438:	00048593          	mv	a1,s1
    8000243c:	00090513          	mv	a0,s2
    80002440:	fffff097          	auipc	ra,0xfffff
    80002444:	3d0080e7          	jalr	976(ra) # 80001810 <_ZN7_thread15createCPPThreadEPFvPvEPPS_S0_Pm>
            if(handle== nullptr){
    80002448:	00049863          	bnez	s1,80002458 <_ZN5Riscv20handleSupervisorTrapEv+0x2e4>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    8000244c:	fff00793          	li	a5,-1
    80002450:	00078513          	mv	a0,a5
}
    80002454:	e39ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    80002458:	00000793          	li	a5,0
    8000245c:	00078513          	mv	a0,a5
}
    80002460:	e2dff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    80002464:	00058793          	mv	a5,a1
    80002468:	faf43023          	sd	a5,-96(s0)
    return a1;
    8000246c:	fa043483          	ld	s1,-96(s0)
    __asm__ volatile("mv %0, a2" : "=r" (a2));
    80002470:	00060793          	mv	a5,a2
    80002474:	f8f43c23          	sd	a5,-104(s0)
    return a2;
    80002478:	f9843583          	ld	a1,-104(s0)
            _sem::openSem(handle,init);
    8000247c:	0005859b          	sext.w	a1,a1
    80002480:	00048513          	mv	a0,s1
    80002484:	00000097          	auipc	ra,0x0
    80002488:	3d8080e7          	jalr	984(ra) # 8000285c <_ZN4_sem7openSemEPPS_j>
            if(handle== nullptr){
    8000248c:	00049863          	bnez	s1,8000249c <_ZN5Riscv20handleSupervisorTrapEv+0x328>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    80002490:	fff00793          	li	a5,-1
    80002494:	00078513          	mv	a0,a5
}
    80002498:	df5ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    8000249c:	00000793          	li	a5,0
    800024a0:	00078513          	mv	a0,a5
}
    800024a4:	de9ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    800024a8:	00058793          	mv	a5,a1
    800024ac:	faf43423          	sd	a5,-88(s0)
    return a1;
    800024b0:	fa843503          	ld	a0,-88(s0)
            int ret=_sem::closeSem(handle);
    800024b4:	00000097          	auipc	ra,0x0
    800024b8:	490080e7          	jalr	1168(ra) # 80002944 <_ZN4_sem8closeSemEPS_>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    800024bc:	00050513          	mv	a0,a0
}
    800024c0:	dcdff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    800024c4:	00058793          	mv	a5,a1
    800024c8:	faf43823          	sd	a5,-80(s0)
    return a1;
    800024cc:	fb043503          	ld	a0,-80(s0)
            int ret=_sem::semWait(handle);
    800024d0:	00000097          	auipc	ra,0x0
    800024d4:	5d4080e7          	jalr	1492(ra) # 80002aa4 <_ZN4_sem7semWaitEPS_>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    800024d8:	00050513          	mv	a0,a0
}
    800024dc:	db1ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    800024e0:	00058793          	mv	a5,a1
    800024e4:	faf43c23          	sd	a5,-72(s0)
    return a1;
    800024e8:	fb843503          	ld	a0,-72(s0)
            int ret=_sem::semSignal(handle);
    800024ec:	00000097          	auipc	ra,0x0
    800024f0:	4d0080e7          	jalr	1232(ra) # 800029bc <_ZN4_sem9semSignalEPS_>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    800024f4:	00050513          	mv	a0,a0
}
    800024f8:	d95ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile("mv %0, a1" : "=r" (a1));
    800024fc:	00058793          	mv	a5,a1
    80002500:	fcf43023          	sd	a5,-64(s0)
    return a1;
    80002504:	fc043503          	ld	a0,-64(s0)
            int ret=_sem::semTryWait(handle);
    80002508:	00000097          	auipc	ra,0x0
    8000250c:	390080e7          	jalr	912(ra) # 80002898 <_ZN4_sem10semTryWaitEPS_>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    80002510:	00050513          	mv	a0,a0
}
    80002514:	d79ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            w_sstatus(sstatus);
    80002518:	f2843783          	ld	a5,-216(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000251c:	10079073          	csrw	sstatus,a5
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002520:	10000793          	li	a5,256
    80002524:	1007b073          	csrc	sstatus,a5
            w_sepc(sepc + 4);
    80002528:	f2043783          	ld	a5,-224(s0)
    8000252c:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002530:	14179073          	csrw	sepc,a5
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002534:	00200793          	li	a5,2
    80002538:	1447b073          	csrc	sip,a5
            return;
    8000253c:	d6dff06f          	j	800022a8 <_ZN5Riscv20handleSupervisorTrapEv+0x134>
            char c=__getc();
    80002540:	00005097          	auipc	ra,0x5
    80002544:	4e8080e7          	jalr	1256(ra) # 80007a28 <__getc>
    __asm__ volatile ("mv a0, %[rVal]" : : [rVal]"r"(ret));
    80002548:	00050513          	mv	a0,a0
}
    8000254c:	d41ff06f          	j	8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        printString("unexpected trap cause \n");
    80002550:	00006517          	auipc	a0,0x6
    80002554:	b2850513          	addi	a0,a0,-1240 # 80008078 <CONSOLE_STATUS+0x68>
    80002558:	00002097          	auipc	ra,0x2
    8000255c:	404080e7          	jalr	1028(ra) # 8000495c <_Z11printStringPKc>
        printString("scause: ");
    80002560:	00006517          	auipc	a0,0x6
    80002564:	b3050513          	addi	a0,a0,-1232 # 80008090 <CONSOLE_STATUS+0x80>
    80002568:	00002097          	auipc	ra,0x2
    8000256c:	3f4080e7          	jalr	1012(ra) # 8000495c <_Z11printStringPKc>
        printInt(scause);
    80002570:	00000613          	li	a2,0
    80002574:	00a00593          	li	a1,10
    80002578:	0004851b          	sext.w	a0,s1
    8000257c:	00002097          	auipc	ra,0x2
    80002580:	590080e7          	jalr	1424(ra) # 80004b0c <_Z8printIntiii>
        printString("\n sepc:");
    80002584:	00006517          	auipc	a0,0x6
    80002588:	b1c50513          	addi	a0,a0,-1252 # 800080a0 <CONSOLE_STATUS+0x90>
    8000258c:	00002097          	auipc	ra,0x2
    80002590:	3d0080e7          	jalr	976(ra) # 8000495c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002594:	141027f3          	csrr	a5,sepc
    80002598:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    8000259c:	fc843503          	ld	a0,-56(s0)
        printInt(r_sepc());
    800025a0:	00000613          	li	a2,0
    800025a4:	00a00593          	li	a1,10
    800025a8:	0005051b          	sext.w	a0,a0
    800025ac:	00002097          	auipc	ra,0x2
    800025b0:	560080e7          	jalr	1376(ra) # 80004b0c <_Z8printIntiii>
        printString("\n stval:");
    800025b4:	00006517          	auipc	a0,0x6
    800025b8:	af450513          	addi	a0,a0,-1292 # 800080a8 <CONSOLE_STATUS+0x98>
    800025bc:	00002097          	auipc	ra,0x2
    800025c0:	3a0080e7          	jalr	928(ra) # 8000495c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    800025c4:	143027f3          	csrr	a5,stval
    800025c8:	fcf43023          	sd	a5,-64(s0)
    return stval;
    800025cc:	fc043503          	ld	a0,-64(s0)
        printInt(r_stval());
    800025d0:	00000613          	li	a2,0
    800025d4:	00a00593          	li	a1,10
    800025d8:	0005051b          	sext.w	a0,a0
    800025dc:	00002097          	auipc	ra,0x2
    800025e0:	530080e7          	jalr	1328(ra) # 80004b0c <_Z8printIntiii>
        while (true )printString("");
    800025e4:	00006517          	auipc	a0,0x6
    800025e8:	a5c50513          	addi	a0,a0,-1444 # 80008040 <CONSOLE_STATUS+0x30>
    800025ec:	00002097          	auipc	ra,0x2
    800025f0:	370080e7          	jalr	880(ra) # 8000495c <_Z11printStringPKc>
    800025f4:	ff1ff06f          	j	800025e4 <_ZN5Riscv20handleSupervisorTrapEv+0x470>

00000000800025f8 <_ZN5Riscv15handleTimerTrapEv>:

void Riscv::handleTimerTrap(){
    800025f8:	fb010113          	addi	sp,sp,-80
    800025fc:	04113423          	sd	ra,72(sp)
    80002600:	04813023          	sd	s0,64(sp)
    80002604:	02913c23          	sd	s1,56(sp)
    80002608:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    8000260c:	142027f3          	csrr	a5,scause
    80002610:	fcf43423          	sd	a5,-56(s0)
    return scause;
    80002614:	fc843483          	ld	s1,-56(s0)
    uint64 scause = r_scause();
    if (scause == 0x8000000000000001UL) {
    80002618:	fff00793          	li	a5,-1
    8000261c:	03f79793          	slli	a5,a5,0x3f
    80002620:	00178793          	addi	a5,a5,1
    80002624:	04f49863          	bne	s1,a5,80002674 <_ZN5Riscv15handleTimerTrapEv+0x7c>
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002628:	100027f3          	csrr	a5,sstatus
    8000262c:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80002630:	fd843783          	ld	a5,-40(s0)
        //interrupt: yes, cause code: supervisor software interupt (timer)
        //9223372036854775809
        uint64 volatile sstatus = r_sstatus();
    80002634:	faf43c23          	sd	a5,-72(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002638:	141027f3          	csrr	a5,sepc
    8000263c:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80002640:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sepc = r_sepc();
    80002644:	fcf43023          	sd	a5,-64(s0)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002648:	00200793          	li	a5,2
    8000264c:	1447b073          	csrc	sip,a5
        mc_sip(SIP_SSIP);
        w_sstatus(sstatus);
    80002650:	fb843783          	ld	a5,-72(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002654:	10079073          	csrw	sstatus,a5
        //w_sepc(sepc + 4);
        w_sepc(sepc);
    80002658:	fc043783          	ld	a5,-64(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000265c:	14179073          	csrw	sepc,a5
        printInt(r_sepc());
        printString("\n stval:");
        printInt(r_stval());
        while (true )printString("");
    }
}
    80002660:	04813083          	ld	ra,72(sp)
    80002664:	04013403          	ld	s0,64(sp)
    80002668:	03813483          	ld	s1,56(sp)
    8000266c:	05010113          	addi	sp,sp,80
    80002670:	00008067          	ret
        printString("unexpected trap cause - TIMER handler \n");
    80002674:	00006517          	auipc	a0,0x6
    80002678:	a4450513          	addi	a0,a0,-1468 # 800080b8 <CONSOLE_STATUS+0xa8>
    8000267c:	00002097          	auipc	ra,0x2
    80002680:	2e0080e7          	jalr	736(ra) # 8000495c <_Z11printStringPKc>
        printString("scause: ");
    80002684:	00006517          	auipc	a0,0x6
    80002688:	a0c50513          	addi	a0,a0,-1524 # 80008090 <CONSOLE_STATUS+0x80>
    8000268c:	00002097          	auipc	ra,0x2
    80002690:	2d0080e7          	jalr	720(ra) # 8000495c <_Z11printStringPKc>
        printInt(scause);
    80002694:	00000613          	li	a2,0
    80002698:	00a00593          	li	a1,10
    8000269c:	0004851b          	sext.w	a0,s1
    800026a0:	00002097          	auipc	ra,0x2
    800026a4:	46c080e7          	jalr	1132(ra) # 80004b0c <_Z8printIntiii>
        printString("\n sepc:");
    800026a8:	00006517          	auipc	a0,0x6
    800026ac:	9f850513          	addi	a0,a0,-1544 # 800080a0 <CONSOLE_STATUS+0x90>
    800026b0:	00002097          	auipc	ra,0x2
    800026b4:	2ac080e7          	jalr	684(ra) # 8000495c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800026b8:	141027f3          	csrr	a5,sepc
    800026bc:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800026c0:	fd843503          	ld	a0,-40(s0)
        printInt(r_sepc());
    800026c4:	00000613          	li	a2,0
    800026c8:	00a00593          	li	a1,10
    800026cc:	0005051b          	sext.w	a0,a0
    800026d0:	00002097          	auipc	ra,0x2
    800026d4:	43c080e7          	jalr	1084(ra) # 80004b0c <_Z8printIntiii>
        printString("\n stval:");
    800026d8:	00006517          	auipc	a0,0x6
    800026dc:	9d050513          	addi	a0,a0,-1584 # 800080a8 <CONSOLE_STATUS+0x98>
    800026e0:	00002097          	auipc	ra,0x2
    800026e4:	27c080e7          	jalr	636(ra) # 8000495c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    800026e8:	143027f3          	csrr	a5,stval
    800026ec:	fcf43823          	sd	a5,-48(s0)
    return stval;
    800026f0:	fd043503          	ld	a0,-48(s0)
        printInt(r_stval());
    800026f4:	00000613          	li	a2,0
    800026f8:	00a00593          	li	a1,10
    800026fc:	0005051b          	sext.w	a0,a0
    80002700:	00002097          	auipc	ra,0x2
    80002704:	40c080e7          	jalr	1036(ra) # 80004b0c <_Z8printIntiii>
        while (true )printString("");
    80002708:	00006517          	auipc	a0,0x6
    8000270c:	93850513          	addi	a0,a0,-1736 # 80008040 <CONSOLE_STATUS+0x30>
    80002710:	00002097          	auipc	ra,0x2
    80002714:	24c080e7          	jalr	588(ra) # 8000495c <_Z11printStringPKc>
    80002718:	ff1ff06f          	j	80002708 <_ZN5Riscv15handleTimerTrapEv+0x110>

000000008000271c <_ZN5Riscv17handleConsoleTrapEv>:

void Riscv::handleConsoleTrap() {
    8000271c:	fc010113          	addi	sp,sp,-64
    80002720:	02113c23          	sd	ra,56(sp)
    80002724:	02813823          	sd	s0,48(sp)
    80002728:	02913423          	sd	s1,40(sp)
    8000272c:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002730:	142027f3          	csrr	a5,scause
    80002734:	fcf43423          	sd	a5,-56(s0)
    return scause;
    80002738:	fc843483          	ld	s1,-56(s0)
    uint64 scause = r_scause();
    if (scause== 0x8000000000000009UL)
    8000273c:	fff00793          	li	a5,-1
    80002740:	03f79793          	slli	a5,a5,0x3f
    80002744:	00978793          	addi	a5,a5,9
    80002748:	0af48663          	beq	s1,a5,800027f4 <_ZN5Riscv17handleConsoleTrapEv+0xd8>
    {
        //interrupt: yes, cause code: supervisor external interupt (console)
        console_handler();
    }
    else{
        printString("unexpected trap cause - CONSOLE handler \n");
    8000274c:	00006517          	auipc	a0,0x6
    80002750:	99450513          	addi	a0,a0,-1644 # 800080e0 <CONSOLE_STATUS+0xd0>
    80002754:	00002097          	auipc	ra,0x2
    80002758:	208080e7          	jalr	520(ra) # 8000495c <_Z11printStringPKc>
        printString("scause: ");
    8000275c:	00006517          	auipc	a0,0x6
    80002760:	93450513          	addi	a0,a0,-1740 # 80008090 <CONSOLE_STATUS+0x80>
    80002764:	00002097          	auipc	ra,0x2
    80002768:	1f8080e7          	jalr	504(ra) # 8000495c <_Z11printStringPKc>
        printInt(scause);
    8000276c:	00000613          	li	a2,0
    80002770:	00a00593          	li	a1,10
    80002774:	0004851b          	sext.w	a0,s1
    80002778:	00002097          	auipc	ra,0x2
    8000277c:	394080e7          	jalr	916(ra) # 80004b0c <_Z8printIntiii>
        printString("\n sepc:");
    80002780:	00006517          	auipc	a0,0x6
    80002784:	92050513          	addi	a0,a0,-1760 # 800080a0 <CONSOLE_STATUS+0x90>
    80002788:	00002097          	auipc	ra,0x2
    8000278c:	1d4080e7          	jalr	468(ra) # 8000495c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002790:	141027f3          	csrr	a5,sepc
    80002794:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002798:	fd843503          	ld	a0,-40(s0)
        printInt(r_sepc());
    8000279c:	00000613          	li	a2,0
    800027a0:	00a00593          	li	a1,10
    800027a4:	0005051b          	sext.w	a0,a0
    800027a8:	00002097          	auipc	ra,0x2
    800027ac:	364080e7          	jalr	868(ra) # 80004b0c <_Z8printIntiii>
        printString("\n stval:");
    800027b0:	00006517          	auipc	a0,0x6
    800027b4:	8f850513          	addi	a0,a0,-1800 # 800080a8 <CONSOLE_STATUS+0x98>
    800027b8:	00002097          	auipc	ra,0x2
    800027bc:	1a4080e7          	jalr	420(ra) # 8000495c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    800027c0:	143027f3          	csrr	a5,stval
    800027c4:	fcf43823          	sd	a5,-48(s0)
    return stval;
    800027c8:	fd043503          	ld	a0,-48(s0)
        printInt(r_stval());
    800027cc:	00000613          	li	a2,0
    800027d0:	00a00593          	li	a1,10
    800027d4:	0005051b          	sext.w	a0,a0
    800027d8:	00002097          	auipc	ra,0x2
    800027dc:	334080e7          	jalr	820(ra) # 80004b0c <_Z8printIntiii>
        while (true )printString("");
    800027e0:	00006517          	auipc	a0,0x6
    800027e4:	86050513          	addi	a0,a0,-1952 # 80008040 <CONSOLE_STATUS+0x30>
    800027e8:	00002097          	auipc	ra,0x2
    800027ec:	174080e7          	jalr	372(ra) # 8000495c <_Z11printStringPKc>
    800027f0:	ff1ff06f          	j	800027e0 <_ZN5Riscv17handleConsoleTrapEv+0xc4>
        console_handler();
    800027f4:	00005097          	auipc	ra,0x5
    800027f8:	26c080e7          	jalr	620(ra) # 80007a60 <console_handler>
    }
    800027fc:	03813083          	ld	ra,56(sp)
    80002800:	03013403          	ld	s0,48(sp)
    80002804:	02813483          	ld	s1,40(sp)
    80002808:	04010113          	addi	sp,sp,64
    8000280c:	00008067          	ret

0000000080002810 <_ZN4_sem9createSemEj>:

#include "../h/_sem.h"
#include "../h/MemAllocator.h"
#include "../h/syscall_c.hpp"

_sem *_sem::createSem(unsigned int init) {
    80002810:	fe010113          	addi	sp,sp,-32
    80002814:	00113c23          	sd	ra,24(sp)
    80002818:	00813823          	sd	s0,16(sp)
    8000281c:	00913423          	sd	s1,8(sp)
    80002820:	02010413          	addi	s0,sp,32
    80002824:	00050493          	mv	s1,a0
    _sem* sem=(_sem*)MemAlloc::getInstance().mem_alloc((sizeof(_sem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002828:	fffff097          	auipc	ra,0xfffff
    8000282c:	2fc080e7          	jalr	764(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80002830:	00100593          	li	a1,1
    80002834:	fffff097          	auipc	ra,0xfffff
    80002838:	1d4080e7          	jalr	468(ra) # 80001a08 <_ZN8MemAlloc9mem_allocEm>
    sem->value=init;
    8000283c:	00952023          	sw	s1,0(a0)
    sem->head= nullptr;
    80002840:	00053423          	sd	zero,8(a0)
    sem->tail=nullptr;
    80002844:	00053823          	sd	zero,16(a0)
    return sem;
}
    80002848:	01813083          	ld	ra,24(sp)
    8000284c:	01013403          	ld	s0,16(sp)
    80002850:	00813483          	ld	s1,8(sp)
    80002854:	02010113          	addi	sp,sp,32
    80002858:	00008067          	ret

000000008000285c <_ZN4_sem7openSemEPPS_j>:

void _sem::openSem(_sem **handle, unsigned int init) {
    8000285c:	fe010113          	addi	sp,sp,-32
    80002860:	00113c23          	sd	ra,24(sp)
    80002864:	00813823          	sd	s0,16(sp)
    80002868:	00913423          	sd	s1,8(sp)
    8000286c:	02010413          	addi	s0,sp,32
    80002870:	00050493          	mv	s1,a0
    _sem* temp = createSem(init);
    80002874:	00058513          	mv	a0,a1
    80002878:	00000097          	auipc	ra,0x0
    8000287c:	f98080e7          	jalr	-104(ra) # 80002810 <_ZN4_sem9createSemEj>
    *handle= temp;
    80002880:	00a4b023          	sd	a0,0(s1)
}
    80002884:	01813083          	ld	ra,24(sp)
    80002888:	01013403          	ld	s0,16(sp)
    8000288c:	00813483          	ld	s1,8(sp)
    80002890:	02010113          	addi	sp,sp,32
    80002894:	00008067          	ret

0000000080002898 <_ZN4_sem10semTryWaitEPS_>:
        }
    }
    return 0;
}

int _sem::semTryWait(_sem *handle) {
    80002898:	ff010113          	addi	sp,sp,-16
    8000289c:	00813423          	sd	s0,8(sp)
    800028a0:	01010413          	addi	s0,sp,16
    if(!handle)return -1;
    800028a4:	02050a63          	beqz	a0,800028d8 <_ZN4_sem10semTryWaitEPS_+0x40>
    handle->value--;
    800028a8:	00052703          	lw	a4,0(a0)
    800028ac:	fff7079b          	addiw	a5,a4,-1
    800028b0:	00f52023          	sw	a5,0(a0)
    if(handle->value <0){
    800028b4:	02079693          	slli	a3,a5,0x20
    800028b8:	0006ca63          	bltz	a3,800028cc <_ZN4_sem10semTryWaitEPS_+0x34>
        handle->value++;
        return 1;
    }
    return 0;
    800028bc:	00000513          	li	a0,0
}
    800028c0:	00813403          	ld	s0,8(sp)
    800028c4:	01010113          	addi	sp,sp,16
    800028c8:	00008067          	ret
        handle->value++;
    800028cc:	00e52023          	sw	a4,0(a0)
        return 1;
    800028d0:	00100513          	li	a0,1
    800028d4:	fedff06f          	j	800028c0 <_ZN4_sem10semTryWaitEPS_+0x28>
    if(!handle)return -1;
    800028d8:	fff00513          	li	a0,-1
    800028dc:	fe5ff06f          	j	800028c0 <_ZN4_sem10semTryWaitEPS_+0x28>

00000000800028e0 <_ZN4_sem9getThreadEv>:


_thread *_sem::getThread() {
    800028e0:	fe010113          	addi	sp,sp,-32
    800028e4:	00113c23          	sd	ra,24(sp)
    800028e8:	00813823          	sd	s0,16(sp)
    800028ec:	00913423          	sd	s1,8(sp)
    800028f0:	01213023          	sd	s2,0(sp)
    800028f4:	02010413          	addi	s0,sp,32
    //return blockedQueue.removeFirst();
    if(head== nullptr)return nullptr;
    800028f8:	00853483          	ld	s1,8(a0)
    800028fc:	04048063          	beqz	s1,8000293c <_ZN4_sem9getThreadEv+0x5c>
    _thread* ret=head->thread;
    80002900:	0004b903          	ld	s2,0(s1)
    Blocked* old=head;
    head=head->next;
    80002904:	0084b783          	ld	a5,8(s1)
    80002908:	00f53423          	sd	a5,8(a0)
    MemAlloc::getInstance().mem_free(old);
    8000290c:	fffff097          	auipc	ra,0xfffff
    80002910:	218080e7          	jalr	536(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80002914:	00048593          	mv	a1,s1
    80002918:	fffff097          	auipc	ra,0xfffff
    8000291c:	27c080e7          	jalr	636(ra) # 80001b94 <_ZN8MemAlloc8mem_freeEPv>
    return ret;
}
    80002920:	00090513          	mv	a0,s2
    80002924:	01813083          	ld	ra,24(sp)
    80002928:	01013403          	ld	s0,16(sp)
    8000292c:	00813483          	ld	s1,8(sp)
    80002930:	00013903          	ld	s2,0(sp)
    80002934:	02010113          	addi	sp,sp,32
    80002938:	00008067          	ret
    if(head== nullptr)return nullptr;
    8000293c:	00048913          	mv	s2,s1
    80002940:	fe1ff06f          	j	80002920 <_ZN4_sem9getThreadEv+0x40>

0000000080002944 <_ZN4_sem8closeSemEPS_>:
    if(!handle)return -1;
    80002944:	06050863          	beqz	a0,800029b4 <_ZN4_sem8closeSemEPS_+0x70>
int _sem::closeSem(_sem *handle) {
    80002948:	fe010113          	addi	sp,sp,-32
    8000294c:	00113c23          	sd	ra,24(sp)
    80002950:	00813823          	sd	s0,16(sp)
    80002954:	00913423          	sd	s1,8(sp)
    80002958:	02010413          	addi	s0,sp,32
    8000295c:	00050493          	mv	s1,a0
    _thread* thread=handle->getThread();
    80002960:	00000097          	auipc	ra,0x0
    80002964:	f80080e7          	jalr	-128(ra) # 800028e0 <_ZN4_sem9getThreadEv>
    while(thread!= nullptr){
    80002968:	02050063          	beqz	a0,80002988 <_ZN4_sem8closeSemEPS_+0x44>
        thread->blocked=false;
    8000296c:	020504a3          	sb	zero,41(a0)
        Scheduler::put(thread);
    80002970:	00000097          	auipc	ra,0x0
    80002974:	258080e7          	jalr	600(ra) # 80002bc8 <_ZN9Scheduler3putEP7_thread>
        thread=handle->getThread();
    80002978:	00048513          	mv	a0,s1
    8000297c:	00000097          	auipc	ra,0x0
    80002980:	f64080e7          	jalr	-156(ra) # 800028e0 <_ZN4_sem9getThreadEv>
    while(thread!= nullptr){
    80002984:	fe5ff06f          	j	80002968 <_ZN4_sem8closeSemEPS_+0x24>
    MemAlloc::getInstance().mem_free(handle);
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	19c080e7          	jalr	412(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80002990:	00048593          	mv	a1,s1
    80002994:	fffff097          	auipc	ra,0xfffff
    80002998:	200080e7          	jalr	512(ra) # 80001b94 <_ZN8MemAlloc8mem_freeEPv>
    return 0;
    8000299c:	00000513          	li	a0,0
}
    800029a0:	01813083          	ld	ra,24(sp)
    800029a4:	01013403          	ld	s0,16(sp)
    800029a8:	00813483          	ld	s1,8(sp)
    800029ac:	02010113          	addi	sp,sp,32
    800029b0:	00008067          	ret
    if(!handle)return -1;
    800029b4:	fff00513          	li	a0,-1
}
    800029b8:	00008067          	ret

00000000800029bc <_ZN4_sem9semSignalEPS_>:
    if(!handle)return -1;
    800029bc:	04050e63          	beqz	a0,80002a18 <_ZN4_sem9semSignalEPS_+0x5c>
    handle->value++;
    800029c0:	00052783          	lw	a5,0(a0)
    800029c4:	0017879b          	addiw	a5,a5,1
    800029c8:	0007871b          	sext.w	a4,a5
    800029cc:	00f52023          	sw	a5,0(a0)
    if(handle->value <=0){
    800029d0:	00e05663          	blez	a4,800029dc <_ZN4_sem9semSignalEPS_+0x20>
    return 0;
    800029d4:	00000513          	li	a0,0
}
    800029d8:	00008067          	ret
int _sem::semSignal(_sem *handle) {
    800029dc:	ff010113          	addi	sp,sp,-16
    800029e0:	00113423          	sd	ra,8(sp)
    800029e4:	00813023          	sd	s0,0(sp)
    800029e8:	01010413          	addi	s0,sp,16
        _thread* thread=handle->getThread();
    800029ec:	00000097          	auipc	ra,0x0
    800029f0:	ef4080e7          	jalr	-268(ra) # 800028e0 <_ZN4_sem9getThreadEv>
        if(thread!= nullptr){
    800029f4:	02050663          	beqz	a0,80002a20 <_ZN4_sem9semSignalEPS_+0x64>
            thread->blocked=false;
    800029f8:	020504a3          	sb	zero,41(a0)
            Scheduler::put(thread);
    800029fc:	00000097          	auipc	ra,0x0
    80002a00:	1cc080e7          	jalr	460(ra) # 80002bc8 <_ZN9Scheduler3putEP7_thread>
    return 0;
    80002a04:	00000513          	li	a0,0
}
    80002a08:	00813083          	ld	ra,8(sp)
    80002a0c:	00013403          	ld	s0,0(sp)
    80002a10:	01010113          	addi	sp,sp,16
    80002a14:	00008067          	ret
    if(!handle)return -1;
    80002a18:	fff00513          	li	a0,-1
    80002a1c:	00008067          	ret
    return 0;
    80002a20:	00000513          	li	a0,0
    80002a24:	fe5ff06f          	j	80002a08 <_ZN4_sem9semSignalEPS_+0x4c>

0000000080002a28 <_ZN4_sem9putThreadEP7_thread>:

void _sem::putThread(_thread *thread) {
    80002a28:	fe010113          	addi	sp,sp,-32
    80002a2c:	00113c23          	sd	ra,24(sp)
    80002a30:	00813823          	sd	s0,16(sp)
    80002a34:	00913423          	sd	s1,8(sp)
    80002a38:	01213023          	sd	s2,0(sp)
    80002a3c:	02010413          	addi	s0,sp,32
    80002a40:	00050493          	mv	s1,a0
    80002a44:	00058913          	mv	s2,a1
    //blockedQueue.addLast(thread);
    Blocked* temp=(Blocked*)MemAlloc::getInstance().mem_alloc((sizeof(Blocked) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    80002a48:	fffff097          	auipc	ra,0xfffff
    80002a4c:	0dc080e7          	jalr	220(ra) # 80001b24 <_ZN8MemAlloc11getInstanceEv>
    80002a50:	00100593          	li	a1,1
    80002a54:	fffff097          	auipc	ra,0xfffff
    80002a58:	fb4080e7          	jalr	-76(ra) # 80001a08 <_ZN8MemAlloc9mem_allocEm>
    temp->thread=thread;
    80002a5c:	01253023          	sd	s2,0(a0)
    temp->next= nullptr;
    80002a60:	00053423          	sd	zero,8(a0)
    if(head==nullptr){
    80002a64:	0084b783          	ld	a5,8(s1)
    80002a68:	02078863          	beqz	a5,80002a98 <_ZN4_sem9putThreadEP7_thread+0x70>
        head=tail=temp;
    }
    else {
        tail->next=temp;
    80002a6c:	0104b783          	ld	a5,16(s1)
    80002a70:	00a7b423          	sd	a0,8(a5)
        tail=tail->next;
    80002a74:	0104b783          	ld	a5,16(s1)
    80002a78:	0087b783          	ld	a5,8(a5)
    80002a7c:	00f4b823          	sd	a5,16(s1)
    }
    80002a80:	01813083          	ld	ra,24(sp)
    80002a84:	01013403          	ld	s0,16(sp)
    80002a88:	00813483          	ld	s1,8(sp)
    80002a8c:	00013903          	ld	s2,0(sp)
    80002a90:	02010113          	addi	sp,sp,32
    80002a94:	00008067          	ret
        head=tail=temp;
    80002a98:	00a4b823          	sd	a0,16(s1)
    80002a9c:	00a4b423          	sd	a0,8(s1)
    80002aa0:	fe1ff06f          	j	80002a80 <_ZN4_sem9putThreadEP7_thread+0x58>

0000000080002aa4 <_ZN4_sem7semWaitEPS_>:
    if(!handle)return -1;
    80002aa4:	06050a63          	beqz	a0,80002b18 <_ZN4_sem7semWaitEPS_+0x74>
    handle->value--;
    80002aa8:	00052783          	lw	a5,0(a0)
    80002aac:	fff7879b          	addiw	a5,a5,-1
    80002ab0:	00f52023          	sw	a5,0(a0)
    if(handle->value <0){
    80002ab4:	02079713          	slli	a4,a5,0x20
    80002ab8:	00074663          	bltz	a4,80002ac4 <_ZN4_sem7semWaitEPS_+0x20>
    return 0;
    80002abc:	00000513          	li	a0,0
}
    80002ac0:	00008067          	ret
int _sem::semWait(_sem *handle) {
    80002ac4:	fe010113          	addi	sp,sp,-32
    80002ac8:	00113c23          	sd	ra,24(sp)
    80002acc:	00813823          	sd	s0,16(sp)
    80002ad0:	00913423          	sd	s1,8(sp)
    80002ad4:	02010413          	addi	s0,sp,32
        handle->putThread(_thread::running);
    80002ad8:	00007497          	auipc	s1,0x7
    80002adc:	3d84b483          	ld	s1,984(s1) # 80009eb0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002ae0:	0004b583          	ld	a1,0(s1)
    80002ae4:	00000097          	auipc	ra,0x0
    80002ae8:	f44080e7          	jalr	-188(ra) # 80002a28 <_ZN4_sem9putThreadEP7_thread>
        _thread::running->setBlocked(true);
    80002aec:	0004b783          	ld	a5,0(s1)
    void setBlocked(bool blocked){_thread::blocked = blocked;};
    80002af0:	00100713          	li	a4,1
    80002af4:	02e784a3          	sb	a4,41(a5)
        thread_dispatch();
    80002af8:	fffff097          	auipc	ra,0xfffff
    80002afc:	9ac080e7          	jalr	-1620(ra) # 800014a4 <_Z15thread_dispatchv>
    return 0;
    80002b00:	00000513          	li	a0,0
}
    80002b04:	01813083          	ld	ra,24(sp)
    80002b08:	01013403          	ld	s0,16(sp)
    80002b0c:	00813483          	ld	s1,8(sp)
    80002b10:	02010113          	addi	sp,sp,32
    80002b14:	00008067          	ret
    if(!handle)return -1;
    80002b18:	fff00513          	li	a0,-1
    80002b1c:	00008067          	ret

0000000080002b20 <_Z41__static_initialization_and_destruction_0ii>:
    return readyQueue.removeFirst();
}

void Scheduler::put(_thread *thread) {
    readyQueue.addLast(thread);
}
    80002b20:	ff010113          	addi	sp,sp,-16
    80002b24:	00813423          	sd	s0,8(sp)
    80002b28:	01010413          	addi	s0,sp,16
    80002b2c:	00100793          	li	a5,1
    80002b30:	00f50863          	beq	a0,a5,80002b40 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002b34:	00813403          	ld	s0,8(sp)
    80002b38:	01010113          	addi	sp,sp,16
    80002b3c:	00008067          	ret
    80002b40:	000107b7          	lui	a5,0x10
    80002b44:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002b48:	fef596e3          	bne	a1,a5,80002b34 <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80002b4c:	00007797          	auipc	a5,0x7
    80002b50:	3ec78793          	addi	a5,a5,1004 # 80009f38 <_ZN9Scheduler10readyQueueE>
    80002b54:	0007b023          	sd	zero,0(a5)
    80002b58:	0007b423          	sd	zero,8(a5)
    80002b5c:	fd9ff06f          	j	80002b34 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002b60 <_ZN9Scheduler3getEv>:
_thread *Scheduler::get() {
    80002b60:	fe010113          	addi	sp,sp,-32
    80002b64:	00113c23          	sd	ra,24(sp)
    80002b68:	00813823          	sd	s0,16(sp)
    80002b6c:	00913423          	sd	s1,8(sp)
    80002b70:	02010413          	addi	s0,sp,32
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80002b74:	00007517          	auipc	a0,0x7
    80002b78:	3c453503          	ld	a0,964(a0) # 80009f38 <_ZN9Scheduler10readyQueueE>
    80002b7c:	04050263          	beqz	a0,80002bc0 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80002b80:	00853783          	ld	a5,8(a0)
    80002b84:	00007717          	auipc	a4,0x7
    80002b88:	3af73a23          	sd	a5,948(a4) # 80009f38 <_ZN9Scheduler10readyQueueE>
        if (!head) { tail = 0; }
    80002b8c:	02078463          	beqz	a5,80002bb4 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80002b90:	00053483          	ld	s1,0(a0)
        delete elem;
    80002b94:	fffff097          	auipc	ra,0xfffff
    80002b98:	298080e7          	jalr	664(ra) # 80001e2c <_ZdlPv>
}
    80002b9c:	00048513          	mv	a0,s1
    80002ba0:	01813083          	ld	ra,24(sp)
    80002ba4:	01013403          	ld	s0,16(sp)
    80002ba8:	00813483          	ld	s1,8(sp)
    80002bac:	02010113          	addi	sp,sp,32
    80002bb0:	00008067          	ret
        if (!head) { tail = 0; }
    80002bb4:	00007797          	auipc	a5,0x7
    80002bb8:	3807b623          	sd	zero,908(a5) # 80009f40 <_ZN9Scheduler10readyQueueE+0x8>
    80002bbc:	fd5ff06f          	j	80002b90 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    80002bc0:	00050493          	mv	s1,a0
    return readyQueue.removeFirst();
    80002bc4:	fd9ff06f          	j	80002b9c <_ZN9Scheduler3getEv+0x3c>

0000000080002bc8 <_ZN9Scheduler3putEP7_thread>:
void Scheduler::put(_thread *thread) {
    80002bc8:	fe010113          	addi	sp,sp,-32
    80002bcc:	00113c23          	sd	ra,24(sp)
    80002bd0:	00813823          	sd	s0,16(sp)
    80002bd4:	00913423          	sd	s1,8(sp)
    80002bd8:	02010413          	addi	s0,sp,32
    80002bdc:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80002be0:	01000513          	li	a0,16
    80002be4:	fffff097          	auipc	ra,0xfffff
    80002be8:	220080e7          	jalr	544(ra) # 80001e04 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80002bec:	00953023          	sd	s1,0(a0)
    80002bf0:	00053423          	sd	zero,8(a0)
        if (tail)
    80002bf4:	00007797          	auipc	a5,0x7
    80002bf8:	34c7b783          	ld	a5,844(a5) # 80009f40 <_ZN9Scheduler10readyQueueE+0x8>
    80002bfc:	02078263          	beqz	a5,80002c20 <_ZN9Scheduler3putEP7_thread+0x58>
            tail->next = elem;
    80002c00:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002c04:	00007797          	auipc	a5,0x7
    80002c08:	32a7be23          	sd	a0,828(a5) # 80009f40 <_ZN9Scheduler10readyQueueE+0x8>
}
    80002c0c:	01813083          	ld	ra,24(sp)
    80002c10:	01013403          	ld	s0,16(sp)
    80002c14:	00813483          	ld	s1,8(sp)
    80002c18:	02010113          	addi	sp,sp,32
    80002c1c:	00008067          	ret
            head = tail = elem;
    80002c20:	00007797          	auipc	a5,0x7
    80002c24:	31878793          	addi	a5,a5,792 # 80009f38 <_ZN9Scheduler10readyQueueE>
    80002c28:	00a7b423          	sd	a0,8(a5)
    80002c2c:	00a7b023          	sd	a0,0(a5)
    80002c30:	fddff06f          	j	80002c0c <_ZN9Scheduler3putEP7_thread+0x44>

0000000080002c34 <_GLOBAL__sub_I__ZN9Scheduler10readyQueueE>:
    80002c34:	ff010113          	addi	sp,sp,-16
    80002c38:	00113423          	sd	ra,8(sp)
    80002c3c:	00813023          	sd	s0,0(sp)
    80002c40:	01010413          	addi	s0,sp,16
    80002c44:	000105b7          	lui	a1,0x10
    80002c48:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002c4c:	00100513          	li	a0,1
    80002c50:	00000097          	auipc	ra,0x0
    80002c54:	ed0080e7          	jalr	-304(ra) # 80002b20 <_Z41__static_initialization_and_destruction_0ii>
    80002c58:	00813083          	ld	ra,8(sp)
    80002c5c:	00013403          	ld	s0,0(sp)
    80002c60:	01010113          	addi	sp,sp,16
    80002c64:	00008067          	ret

0000000080002c68 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80002c68:	fe010113          	addi	sp,sp,-32
    80002c6c:	00113c23          	sd	ra,24(sp)
    80002c70:	00813823          	sd	s0,16(sp)
    80002c74:	00913423          	sd	s1,8(sp)
    80002c78:	01213023          	sd	s2,0(sp)
    80002c7c:	02010413          	addi	s0,sp,32
    80002c80:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002c84:	00000913          	li	s2,0
    80002c88:	00c0006f          	j	80002c94 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002c8c:	fffff097          	auipc	ra,0xfffff
    80002c90:	818080e7          	jalr	-2024(ra) # 800014a4 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80002c94:	fffff097          	auipc	ra,0xfffff
    80002c98:	980080e7          	jalr	-1664(ra) # 80001614 <_Z4getcv>
    80002c9c:	0005059b          	sext.w	a1,a0
    80002ca0:	01b00793          	li	a5,27
    80002ca4:	02f58a63          	beq	a1,a5,80002cd8 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80002ca8:	0084b503          	ld	a0,8(s1)
    80002cac:	00003097          	auipc	ra,0x3
    80002cb0:	9fc080e7          	jalr	-1540(ra) # 800056a8 <_ZN6Buffer3putEi>
        i++;
    80002cb4:	0019071b          	addiw	a4,s2,1
    80002cb8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002cbc:	0004a683          	lw	a3,0(s1)
    80002cc0:	0026979b          	slliw	a5,a3,0x2
    80002cc4:	00d787bb          	addw	a5,a5,a3
    80002cc8:	0017979b          	slliw	a5,a5,0x1
    80002ccc:	02f767bb          	remw	a5,a4,a5
    80002cd0:	fc0792e3          	bnez	a5,80002c94 <_ZL16producerKeyboardPv+0x2c>
    80002cd4:	fb9ff06f          	j	80002c8c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80002cd8:	00100793          	li	a5,1
    80002cdc:	00007717          	auipc	a4,0x7
    80002ce0:	26f72623          	sw	a5,620(a4) # 80009f48 <_ZL9threadEnd>
    data->buffer->put('!');
    80002ce4:	02100593          	li	a1,33
    80002ce8:	0084b503          	ld	a0,8(s1)
    80002cec:	00003097          	auipc	ra,0x3
    80002cf0:	9bc080e7          	jalr	-1604(ra) # 800056a8 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80002cf4:	0104b503          	ld	a0,16(s1)
    80002cf8:	fffff097          	auipc	ra,0xfffff
    80002cfc:	8ac080e7          	jalr	-1876(ra) # 800015a4 <_Z10sem_signalP4_sem>
}
    80002d00:	01813083          	ld	ra,24(sp)
    80002d04:	01013403          	ld	s0,16(sp)
    80002d08:	00813483          	ld	s1,8(sp)
    80002d0c:	00013903          	ld	s2,0(sp)
    80002d10:	02010113          	addi	sp,sp,32
    80002d14:	00008067          	ret

0000000080002d18 <_ZL8producerPv>:

static void producer(void *arg) {
    80002d18:	fe010113          	addi	sp,sp,-32
    80002d1c:	00113c23          	sd	ra,24(sp)
    80002d20:	00813823          	sd	s0,16(sp)
    80002d24:	00913423          	sd	s1,8(sp)
    80002d28:	01213023          	sd	s2,0(sp)
    80002d2c:	02010413          	addi	s0,sp,32
    80002d30:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002d34:	00000913          	li	s2,0
    80002d38:	00c0006f          	j	80002d44 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002d3c:	ffffe097          	auipc	ra,0xffffe
    80002d40:	768080e7          	jalr	1896(ra) # 800014a4 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80002d44:	00007797          	auipc	a5,0x7
    80002d48:	2047a783          	lw	a5,516(a5) # 80009f48 <_ZL9threadEnd>
    80002d4c:	02079e63          	bnez	a5,80002d88 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80002d50:	0004a583          	lw	a1,0(s1)
    80002d54:	0305859b          	addiw	a1,a1,48
    80002d58:	0084b503          	ld	a0,8(s1)
    80002d5c:	00003097          	auipc	ra,0x3
    80002d60:	94c080e7          	jalr	-1716(ra) # 800056a8 <_ZN6Buffer3putEi>
        i++;
    80002d64:	0019071b          	addiw	a4,s2,1
    80002d68:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002d6c:	0004a683          	lw	a3,0(s1)
    80002d70:	0026979b          	slliw	a5,a3,0x2
    80002d74:	00d787bb          	addw	a5,a5,a3
    80002d78:	0017979b          	slliw	a5,a5,0x1
    80002d7c:	02f767bb          	remw	a5,a4,a5
    80002d80:	fc0792e3          	bnez	a5,80002d44 <_ZL8producerPv+0x2c>
    80002d84:	fb9ff06f          	j	80002d3c <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80002d88:	0104b503          	ld	a0,16(s1)
    80002d8c:	fffff097          	auipc	ra,0xfffff
    80002d90:	818080e7          	jalr	-2024(ra) # 800015a4 <_Z10sem_signalP4_sem>
}
    80002d94:	01813083          	ld	ra,24(sp)
    80002d98:	01013403          	ld	s0,16(sp)
    80002d9c:	00813483          	ld	s1,8(sp)
    80002da0:	00013903          	ld	s2,0(sp)
    80002da4:	02010113          	addi	sp,sp,32
    80002da8:	00008067          	ret

0000000080002dac <_ZL8consumerPv>:

static void consumer(void *arg) {
    80002dac:	fd010113          	addi	sp,sp,-48
    80002db0:	02113423          	sd	ra,40(sp)
    80002db4:	02813023          	sd	s0,32(sp)
    80002db8:	00913c23          	sd	s1,24(sp)
    80002dbc:	01213823          	sd	s2,16(sp)
    80002dc0:	01313423          	sd	s3,8(sp)
    80002dc4:	03010413          	addi	s0,sp,48
    80002dc8:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002dcc:	00000993          	li	s3,0
    80002dd0:	01c0006f          	j	80002dec <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002dd4:	ffffe097          	auipc	ra,0xffffe
    80002dd8:	6d0080e7          	jalr	1744(ra) # 800014a4 <_Z15thread_dispatchv>
    80002ddc:	0500006f          	j	80002e2c <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002de0:	00a00513          	li	a0,10
    80002de4:	fffff097          	auipc	ra,0xfffff
    80002de8:	864080e7          	jalr	-1948(ra) # 80001648 <_Z4putcc>
    while (!threadEnd) {
    80002dec:	00007797          	auipc	a5,0x7
    80002df0:	15c7a783          	lw	a5,348(a5) # 80009f48 <_ZL9threadEnd>
    80002df4:	06079063          	bnez	a5,80002e54 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80002df8:	00893503          	ld	a0,8(s2)
    80002dfc:	00003097          	auipc	ra,0x3
    80002e00:	93c080e7          	jalr	-1732(ra) # 80005738 <_ZN6Buffer3getEv>
        i++;
    80002e04:	0019849b          	addiw	s1,s3,1
    80002e08:	0004899b          	sext.w	s3,s1
        putc(key);
    80002e0c:	0ff57513          	andi	a0,a0,255
    80002e10:	fffff097          	auipc	ra,0xfffff
    80002e14:	838080e7          	jalr	-1992(ra) # 80001648 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80002e18:	00092703          	lw	a4,0(s2)
    80002e1c:	0027179b          	slliw	a5,a4,0x2
    80002e20:	00e787bb          	addw	a5,a5,a4
    80002e24:	02f4e7bb          	remw	a5,s1,a5
    80002e28:	fa0786e3          	beqz	a5,80002dd4 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80002e2c:	05000793          	li	a5,80
    80002e30:	02f4e4bb          	remw	s1,s1,a5
    80002e34:	fa049ce3          	bnez	s1,80002dec <_ZL8consumerPv+0x40>
    80002e38:	fa9ff06f          	j	80002de0 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80002e3c:	00893503          	ld	a0,8(s2)
    80002e40:	00003097          	auipc	ra,0x3
    80002e44:	8f8080e7          	jalr	-1800(ra) # 80005738 <_ZN6Buffer3getEv>
        putc(key);
    80002e48:	0ff57513          	andi	a0,a0,255
    80002e4c:	ffffe097          	auipc	ra,0xffffe
    80002e50:	7fc080e7          	jalr	2044(ra) # 80001648 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80002e54:	00893503          	ld	a0,8(s2)
    80002e58:	00003097          	auipc	ra,0x3
    80002e5c:	96c080e7          	jalr	-1684(ra) # 800057c4 <_ZN6Buffer6getCntEv>
    80002e60:	fca04ee3          	bgtz	a0,80002e3c <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80002e64:	01093503          	ld	a0,16(s2)
    80002e68:	ffffe097          	auipc	ra,0xffffe
    80002e6c:	73c080e7          	jalr	1852(ra) # 800015a4 <_Z10sem_signalP4_sem>
}
    80002e70:	02813083          	ld	ra,40(sp)
    80002e74:	02013403          	ld	s0,32(sp)
    80002e78:	01813483          	ld	s1,24(sp)
    80002e7c:	01013903          	ld	s2,16(sp)
    80002e80:	00813983          	ld	s3,8(sp)
    80002e84:	03010113          	addi	sp,sp,48
    80002e88:	00008067          	ret

0000000080002e8c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80002e8c:	f9010113          	addi	sp,sp,-112
    80002e90:	06113423          	sd	ra,104(sp)
    80002e94:	06813023          	sd	s0,96(sp)
    80002e98:	04913c23          	sd	s1,88(sp)
    80002e9c:	05213823          	sd	s2,80(sp)
    80002ea0:	05313423          	sd	s3,72(sp)
    80002ea4:	05413023          	sd	s4,64(sp)
    80002ea8:	03513c23          	sd	s5,56(sp)
    80002eac:	03613823          	sd	s6,48(sp)
    80002eb0:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002eb4:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002eb8:	00005517          	auipc	a0,0x5
    80002ebc:	25850513          	addi	a0,a0,600 # 80008110 <CONSOLE_STATUS+0x100>
    80002ec0:	00002097          	auipc	ra,0x2
    80002ec4:	a9c080e7          	jalr	-1380(ra) # 8000495c <_Z11printStringPKc>
    getString(input, 30);
    80002ec8:	01e00593          	li	a1,30
    80002ecc:	fa040493          	addi	s1,s0,-96
    80002ed0:	00048513          	mv	a0,s1
    80002ed4:	00002097          	auipc	ra,0x2
    80002ed8:	b10080e7          	jalr	-1264(ra) # 800049e4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80002edc:	00048513          	mv	a0,s1
    80002ee0:	00002097          	auipc	ra,0x2
    80002ee4:	bdc080e7          	jalr	-1060(ra) # 80004abc <_Z11stringToIntPKc>
    80002ee8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80002eec:	00005517          	auipc	a0,0x5
    80002ef0:	24450513          	addi	a0,a0,580 # 80008130 <CONSOLE_STATUS+0x120>
    80002ef4:	00002097          	auipc	ra,0x2
    80002ef8:	a68080e7          	jalr	-1432(ra) # 8000495c <_Z11printStringPKc>
    getString(input, 30);
    80002efc:	01e00593          	li	a1,30
    80002f00:	00048513          	mv	a0,s1
    80002f04:	00002097          	auipc	ra,0x2
    80002f08:	ae0080e7          	jalr	-1312(ra) # 800049e4 <_Z9getStringPci>
    n = stringToInt(input);
    80002f0c:	00048513          	mv	a0,s1
    80002f10:	00002097          	auipc	ra,0x2
    80002f14:	bac080e7          	jalr	-1108(ra) # 80004abc <_Z11stringToIntPKc>
    80002f18:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80002f1c:	00005517          	auipc	a0,0x5
    80002f20:	23450513          	addi	a0,a0,564 # 80008150 <CONSOLE_STATUS+0x140>
    80002f24:	00002097          	auipc	ra,0x2
    80002f28:	a38080e7          	jalr	-1480(ra) # 8000495c <_Z11printStringPKc>
    80002f2c:	00000613          	li	a2,0
    80002f30:	00a00593          	li	a1,10
    80002f34:	00090513          	mv	a0,s2
    80002f38:	00002097          	auipc	ra,0x2
    80002f3c:	bd4080e7          	jalr	-1068(ra) # 80004b0c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002f40:	00005517          	auipc	a0,0x5
    80002f44:	22850513          	addi	a0,a0,552 # 80008168 <CONSOLE_STATUS+0x158>
    80002f48:	00002097          	auipc	ra,0x2
    80002f4c:	a14080e7          	jalr	-1516(ra) # 8000495c <_Z11printStringPKc>
    80002f50:	00000613          	li	a2,0
    80002f54:	00a00593          	li	a1,10
    80002f58:	00048513          	mv	a0,s1
    80002f5c:	00002097          	auipc	ra,0x2
    80002f60:	bb0080e7          	jalr	-1104(ra) # 80004b0c <_Z8printIntiii>
    printString(".\n");
    80002f64:	00005517          	auipc	a0,0x5
    80002f68:	21c50513          	addi	a0,a0,540 # 80008180 <CONSOLE_STATUS+0x170>
    80002f6c:	00002097          	auipc	ra,0x2
    80002f70:	9f0080e7          	jalr	-1552(ra) # 8000495c <_Z11printStringPKc>
    if(threadNum > n) {
    80002f74:	0324c463          	blt	s1,s2,80002f9c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002f78:	03205c63          	blez	s2,80002fb0 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80002f7c:	03800513          	li	a0,56
    80002f80:	fffff097          	auipc	ra,0xfffff
    80002f84:	e84080e7          	jalr	-380(ra) # 80001e04 <_Znwm>
    80002f88:	00050a13          	mv	s4,a0
    80002f8c:	00048593          	mv	a1,s1
    80002f90:	00002097          	auipc	ra,0x2
    80002f94:	67c080e7          	jalr	1660(ra) # 8000560c <_ZN6BufferC1Ei>
    80002f98:	0300006f          	j	80002fc8 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002f9c:	00005517          	auipc	a0,0x5
    80002fa0:	1ec50513          	addi	a0,a0,492 # 80008188 <CONSOLE_STATUS+0x178>
    80002fa4:	00002097          	auipc	ra,0x2
    80002fa8:	9b8080e7          	jalr	-1608(ra) # 8000495c <_Z11printStringPKc>
        return;
    80002fac:	0140006f          	j	80002fc0 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002fb0:	00005517          	auipc	a0,0x5
    80002fb4:	21850513          	addi	a0,a0,536 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80002fb8:	00002097          	auipc	ra,0x2
    80002fbc:	9a4080e7          	jalr	-1628(ra) # 8000495c <_Z11printStringPKc>
        return;
    80002fc0:	000b0113          	mv	sp,s6
    80002fc4:	1500006f          	j	80003114 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002fc8:	00000593          	li	a1,0
    80002fcc:	00007517          	auipc	a0,0x7
    80002fd0:	f8450513          	addi	a0,a0,-124 # 80009f50 <_ZL10waitForAll>
    80002fd4:	ffffe097          	auipc	ra,0xffffe
    80002fd8:	51c080e7          	jalr	1308(ra) # 800014f0 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    80002fdc:	00391793          	slli	a5,s2,0x3
    80002fe0:	00f78793          	addi	a5,a5,15
    80002fe4:	ff07f793          	andi	a5,a5,-16
    80002fe8:	40f10133          	sub	sp,sp,a5
    80002fec:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80002ff0:	0019071b          	addiw	a4,s2,1
    80002ff4:	00171793          	slli	a5,a4,0x1
    80002ff8:	00e787b3          	add	a5,a5,a4
    80002ffc:	00379793          	slli	a5,a5,0x3
    80003000:	00f78793          	addi	a5,a5,15
    80003004:	ff07f793          	andi	a5,a5,-16
    80003008:	40f10133          	sub	sp,sp,a5
    8000300c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003010:	00191613          	slli	a2,s2,0x1
    80003014:	012607b3          	add	a5,a2,s2
    80003018:	00379793          	slli	a5,a5,0x3
    8000301c:	00f987b3          	add	a5,s3,a5
    80003020:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003024:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003028:	00007717          	auipc	a4,0x7
    8000302c:	f2873703          	ld	a4,-216(a4) # 80009f50 <_ZL10waitForAll>
    80003030:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003034:	00078613          	mv	a2,a5
    80003038:	00000597          	auipc	a1,0x0
    8000303c:	d7458593          	addi	a1,a1,-652 # 80002dac <_ZL8consumerPv>
    80003040:	f9840513          	addi	a0,s0,-104
    80003044:	ffffe097          	auipc	ra,0xffffe
    80003048:	3ac080e7          	jalr	940(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000304c:	00000493          	li	s1,0
    80003050:	0280006f          	j	80003078 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003054:	00000597          	auipc	a1,0x0
    80003058:	c1458593          	addi	a1,a1,-1004 # 80002c68 <_ZL16producerKeyboardPv>
                      data + i);
    8000305c:	00179613          	slli	a2,a5,0x1
    80003060:	00f60633          	add	a2,a2,a5
    80003064:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003068:	00c98633          	add	a2,s3,a2
    8000306c:	ffffe097          	auipc	ra,0xffffe
    80003070:	384080e7          	jalr	900(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003074:	0014849b          	addiw	s1,s1,1
    80003078:	0524d263          	bge	s1,s2,800030bc <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    8000307c:	00149793          	slli	a5,s1,0x1
    80003080:	009787b3          	add	a5,a5,s1
    80003084:	00379793          	slli	a5,a5,0x3
    80003088:	00f987b3          	add	a5,s3,a5
    8000308c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003090:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003094:	00007717          	auipc	a4,0x7
    80003098:	ebc73703          	ld	a4,-324(a4) # 80009f50 <_ZL10waitForAll>
    8000309c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800030a0:	00048793          	mv	a5,s1
    800030a4:	00349513          	slli	a0,s1,0x3
    800030a8:	00aa8533          	add	a0,s5,a0
    800030ac:	fa9054e3          	blez	s1,80003054 <_Z22producerConsumer_C_APIv+0x1c8>
    800030b0:	00000597          	auipc	a1,0x0
    800030b4:	c6858593          	addi	a1,a1,-920 # 80002d18 <_ZL8producerPv>
    800030b8:	fa5ff06f          	j	8000305c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800030bc:	ffffe097          	auipc	ra,0xffffe
    800030c0:	3e8080e7          	jalr	1000(ra) # 800014a4 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800030c4:	00000493          	li	s1,0
    800030c8:	00994e63          	blt	s2,s1,800030e4 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800030cc:	00007517          	auipc	a0,0x7
    800030d0:	e8453503          	ld	a0,-380(a0) # 80009f50 <_ZL10waitForAll>
    800030d4:	ffffe097          	auipc	ra,0xffffe
    800030d8:	498080e7          	jalr	1176(ra) # 8000156c <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    800030dc:	0014849b          	addiw	s1,s1,1
    800030e0:	fe9ff06f          	j	800030c8 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800030e4:	00007517          	auipc	a0,0x7
    800030e8:	e6c53503          	ld	a0,-404(a0) # 80009f50 <_ZL10waitForAll>
    800030ec:	ffffe097          	auipc	ra,0xffffe
    800030f0:	448080e7          	jalr	1096(ra) # 80001534 <_Z9sem_closeP4_sem>
    delete buffer;
    800030f4:	000a0e63          	beqz	s4,80003110 <_Z22producerConsumer_C_APIv+0x284>
    800030f8:	000a0513          	mv	a0,s4
    800030fc:	00002097          	auipc	ra,0x2
    80003100:	750080e7          	jalr	1872(ra) # 8000584c <_ZN6BufferD1Ev>
    80003104:	000a0513          	mv	a0,s4
    80003108:	fffff097          	auipc	ra,0xfffff
    8000310c:	d24080e7          	jalr	-732(ra) # 80001e2c <_ZdlPv>
    80003110:	000b0113          	mv	sp,s6

}
    80003114:	f9040113          	addi	sp,s0,-112
    80003118:	06813083          	ld	ra,104(sp)
    8000311c:	06013403          	ld	s0,96(sp)
    80003120:	05813483          	ld	s1,88(sp)
    80003124:	05013903          	ld	s2,80(sp)
    80003128:	04813983          	ld	s3,72(sp)
    8000312c:	04013a03          	ld	s4,64(sp)
    80003130:	03813a83          	ld	s5,56(sp)
    80003134:	03013b03          	ld	s6,48(sp)
    80003138:	07010113          	addi	sp,sp,112
    8000313c:	00008067          	ret
    80003140:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003144:	000a0513          	mv	a0,s4
    80003148:	fffff097          	auipc	ra,0xfffff
    8000314c:	ce4080e7          	jalr	-796(ra) # 80001e2c <_ZdlPv>
    80003150:	00048513          	mv	a0,s1
    80003154:	00008097          	auipc	ra,0x8
    80003158:	ef4080e7          	jalr	-268(ra) # 8000b048 <_Unwind_Resume>

000000008000315c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000315c:	fe010113          	addi	sp,sp,-32
    80003160:	00113c23          	sd	ra,24(sp)
    80003164:	00813823          	sd	s0,16(sp)
    80003168:	00913423          	sd	s1,8(sp)
    8000316c:	01213023          	sd	s2,0(sp)
    80003170:	02010413          	addi	s0,sp,32
    80003174:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003178:	00100793          	li	a5,1
    8000317c:	02a7f863          	bgeu	a5,a0,800031ac <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003180:	00a00793          	li	a5,10
    80003184:	02f577b3          	remu	a5,a0,a5
    80003188:	02078e63          	beqz	a5,800031c4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000318c:	fff48513          	addi	a0,s1,-1
    80003190:	00000097          	auipc	ra,0x0
    80003194:	fcc080e7          	jalr	-52(ra) # 8000315c <_ZL9fibonaccim>
    80003198:	00050913          	mv	s2,a0
    8000319c:	ffe48513          	addi	a0,s1,-2
    800031a0:	00000097          	auipc	ra,0x0
    800031a4:	fbc080e7          	jalr	-68(ra) # 8000315c <_ZL9fibonaccim>
    800031a8:	00a90533          	add	a0,s2,a0
}
    800031ac:	01813083          	ld	ra,24(sp)
    800031b0:	01013403          	ld	s0,16(sp)
    800031b4:	00813483          	ld	s1,8(sp)
    800031b8:	00013903          	ld	s2,0(sp)
    800031bc:	02010113          	addi	sp,sp,32
    800031c0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800031c4:	ffffe097          	auipc	ra,0xffffe
    800031c8:	2e0080e7          	jalr	736(ra) # 800014a4 <_Z15thread_dispatchv>
    800031cc:	fc1ff06f          	j	8000318c <_ZL9fibonaccim+0x30>

00000000800031d0 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800031d0:	fe010113          	addi	sp,sp,-32
    800031d4:	00113c23          	sd	ra,24(sp)
    800031d8:	00813823          	sd	s0,16(sp)
    800031dc:	00913423          	sd	s1,8(sp)
    800031e0:	01213023          	sd	s2,0(sp)
    800031e4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800031e8:	00000913          	li	s2,0
    800031ec:	0380006f          	j	80003224 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800031f0:	ffffe097          	auipc	ra,0xffffe
    800031f4:	2b4080e7          	jalr	692(ra) # 800014a4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800031f8:	00148493          	addi	s1,s1,1
    800031fc:	000027b7          	lui	a5,0x2
    80003200:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003204:	0097ee63          	bltu	a5,s1,80003220 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003208:	00000713          	li	a4,0
    8000320c:	000077b7          	lui	a5,0x7
    80003210:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003214:	fce7eee3          	bltu	a5,a4,800031f0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003218:	00170713          	addi	a4,a4,1
    8000321c:	ff1ff06f          	j	8000320c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003220:	00190913          	addi	s2,s2,1
    80003224:	00900793          	li	a5,9
    80003228:	0527e063          	bltu	a5,s2,80003268 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000322c:	00005517          	auipc	a0,0x5
    80003230:	fcc50513          	addi	a0,a0,-52 # 800081f8 <CONSOLE_STATUS+0x1e8>
    80003234:	00001097          	auipc	ra,0x1
    80003238:	728080e7          	jalr	1832(ra) # 8000495c <_Z11printStringPKc>
    8000323c:	00000613          	li	a2,0
    80003240:	00a00593          	li	a1,10
    80003244:	0009051b          	sext.w	a0,s2
    80003248:	00002097          	auipc	ra,0x2
    8000324c:	8c4080e7          	jalr	-1852(ra) # 80004b0c <_Z8printIntiii>
    80003250:	00005517          	auipc	a0,0x5
    80003254:	eb850513          	addi	a0,a0,-328 # 80008108 <CONSOLE_STATUS+0xf8>
    80003258:	00001097          	auipc	ra,0x1
    8000325c:	704080e7          	jalr	1796(ra) # 8000495c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003260:	00000493          	li	s1,0
    80003264:	f99ff06f          	j	800031fc <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003268:	00005517          	auipc	a0,0x5
    8000326c:	f9850513          	addi	a0,a0,-104 # 80008200 <CONSOLE_STATUS+0x1f0>
    80003270:	00001097          	auipc	ra,0x1
    80003274:	6ec080e7          	jalr	1772(ra) # 8000495c <_Z11printStringPKc>
    finishedA = true;
    80003278:	00100793          	li	a5,1
    8000327c:	00007717          	auipc	a4,0x7
    80003280:	ccf70e23          	sb	a5,-804(a4) # 80009f58 <_ZL9finishedA>
}
    80003284:	01813083          	ld	ra,24(sp)
    80003288:	01013403          	ld	s0,16(sp)
    8000328c:	00813483          	ld	s1,8(sp)
    80003290:	00013903          	ld	s2,0(sp)
    80003294:	02010113          	addi	sp,sp,32
    80003298:	00008067          	ret

000000008000329c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    8000329c:	fe010113          	addi	sp,sp,-32
    800032a0:	00113c23          	sd	ra,24(sp)
    800032a4:	00813823          	sd	s0,16(sp)
    800032a8:	00913423          	sd	s1,8(sp)
    800032ac:	01213023          	sd	s2,0(sp)
    800032b0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800032b4:	00000913          	li	s2,0
    800032b8:	0380006f          	j	800032f0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800032bc:	ffffe097          	auipc	ra,0xffffe
    800032c0:	1e8080e7          	jalr	488(ra) # 800014a4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800032c4:	00148493          	addi	s1,s1,1
    800032c8:	000027b7          	lui	a5,0x2
    800032cc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800032d0:	0097ee63          	bltu	a5,s1,800032ec <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800032d4:	00000713          	li	a4,0
    800032d8:	000077b7          	lui	a5,0x7
    800032dc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800032e0:	fce7eee3          	bltu	a5,a4,800032bc <_ZN7WorkerB11workerBodyBEPv+0x20>
    800032e4:	00170713          	addi	a4,a4,1
    800032e8:	ff1ff06f          	j	800032d8 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800032ec:	00190913          	addi	s2,s2,1
    800032f0:	00f00793          	li	a5,15
    800032f4:	0527e063          	bltu	a5,s2,80003334 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800032f8:	00005517          	auipc	a0,0x5
    800032fc:	f1850513          	addi	a0,a0,-232 # 80008210 <CONSOLE_STATUS+0x200>
    80003300:	00001097          	auipc	ra,0x1
    80003304:	65c080e7          	jalr	1628(ra) # 8000495c <_Z11printStringPKc>
    80003308:	00000613          	li	a2,0
    8000330c:	00a00593          	li	a1,10
    80003310:	0009051b          	sext.w	a0,s2
    80003314:	00001097          	auipc	ra,0x1
    80003318:	7f8080e7          	jalr	2040(ra) # 80004b0c <_Z8printIntiii>
    8000331c:	00005517          	auipc	a0,0x5
    80003320:	dec50513          	addi	a0,a0,-532 # 80008108 <CONSOLE_STATUS+0xf8>
    80003324:	00001097          	auipc	ra,0x1
    80003328:	638080e7          	jalr	1592(ra) # 8000495c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000332c:	00000493          	li	s1,0
    80003330:	f99ff06f          	j	800032c8 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003334:	00005517          	auipc	a0,0x5
    80003338:	ee450513          	addi	a0,a0,-284 # 80008218 <CONSOLE_STATUS+0x208>
    8000333c:	00001097          	auipc	ra,0x1
    80003340:	620080e7          	jalr	1568(ra) # 8000495c <_Z11printStringPKc>
    finishedB = true;
    80003344:	00100793          	li	a5,1
    80003348:	00007717          	auipc	a4,0x7
    8000334c:	c0f708a3          	sb	a5,-1007(a4) # 80009f59 <_ZL9finishedB>
    thread_dispatch();
    80003350:	ffffe097          	auipc	ra,0xffffe
    80003354:	154080e7          	jalr	340(ra) # 800014a4 <_Z15thread_dispatchv>
}
    80003358:	01813083          	ld	ra,24(sp)
    8000335c:	01013403          	ld	s0,16(sp)
    80003360:	00813483          	ld	s1,8(sp)
    80003364:	00013903          	ld	s2,0(sp)
    80003368:	02010113          	addi	sp,sp,32
    8000336c:	00008067          	ret

0000000080003370 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003370:	fe010113          	addi	sp,sp,-32
    80003374:	00113c23          	sd	ra,24(sp)
    80003378:	00813823          	sd	s0,16(sp)
    8000337c:	00913423          	sd	s1,8(sp)
    80003380:	01213023          	sd	s2,0(sp)
    80003384:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003388:	00000493          	li	s1,0
    8000338c:	0400006f          	j	800033cc <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003390:	00005517          	auipc	a0,0x5
    80003394:	e9850513          	addi	a0,a0,-360 # 80008228 <CONSOLE_STATUS+0x218>
    80003398:	00001097          	auipc	ra,0x1
    8000339c:	5c4080e7          	jalr	1476(ra) # 8000495c <_Z11printStringPKc>
    800033a0:	00000613          	li	a2,0
    800033a4:	00a00593          	li	a1,10
    800033a8:	00048513          	mv	a0,s1
    800033ac:	00001097          	auipc	ra,0x1
    800033b0:	760080e7          	jalr	1888(ra) # 80004b0c <_Z8printIntiii>
    800033b4:	00005517          	auipc	a0,0x5
    800033b8:	d5450513          	addi	a0,a0,-684 # 80008108 <CONSOLE_STATUS+0xf8>
    800033bc:	00001097          	auipc	ra,0x1
    800033c0:	5a0080e7          	jalr	1440(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 3; i++) {
    800033c4:	0014849b          	addiw	s1,s1,1
    800033c8:	0ff4f493          	andi	s1,s1,255
    800033cc:	00200793          	li	a5,2
    800033d0:	fc97f0e3          	bgeu	a5,s1,80003390 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800033d4:	00005517          	auipc	a0,0x5
    800033d8:	e5c50513          	addi	a0,a0,-420 # 80008230 <CONSOLE_STATUS+0x220>
    800033dc:	00001097          	auipc	ra,0x1
    800033e0:	580080e7          	jalr	1408(ra) # 8000495c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800033e4:	00700313          	li	t1,7
    thread_dispatch();
    800033e8:	ffffe097          	auipc	ra,0xffffe
    800033ec:	0bc080e7          	jalr	188(ra) # 800014a4 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800033f0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800033f4:	00005517          	auipc	a0,0x5
    800033f8:	e4c50513          	addi	a0,a0,-436 # 80008240 <CONSOLE_STATUS+0x230>
    800033fc:	00001097          	auipc	ra,0x1
    80003400:	560080e7          	jalr	1376(ra) # 8000495c <_Z11printStringPKc>
    80003404:	00000613          	li	a2,0
    80003408:	00a00593          	li	a1,10
    8000340c:	0009051b          	sext.w	a0,s2
    80003410:	00001097          	auipc	ra,0x1
    80003414:	6fc080e7          	jalr	1788(ra) # 80004b0c <_Z8printIntiii>
    80003418:	00005517          	auipc	a0,0x5
    8000341c:	cf050513          	addi	a0,a0,-784 # 80008108 <CONSOLE_STATUS+0xf8>
    80003420:	00001097          	auipc	ra,0x1
    80003424:	53c080e7          	jalr	1340(ra) # 8000495c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003428:	00c00513          	li	a0,12
    8000342c:	00000097          	auipc	ra,0x0
    80003430:	d30080e7          	jalr	-720(ra) # 8000315c <_ZL9fibonaccim>
    80003434:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003438:	00005517          	auipc	a0,0x5
    8000343c:	e1050513          	addi	a0,a0,-496 # 80008248 <CONSOLE_STATUS+0x238>
    80003440:	00001097          	auipc	ra,0x1
    80003444:	51c080e7          	jalr	1308(ra) # 8000495c <_Z11printStringPKc>
    80003448:	00000613          	li	a2,0
    8000344c:	00a00593          	li	a1,10
    80003450:	0009051b          	sext.w	a0,s2
    80003454:	00001097          	auipc	ra,0x1
    80003458:	6b8080e7          	jalr	1720(ra) # 80004b0c <_Z8printIntiii>
    8000345c:	00005517          	auipc	a0,0x5
    80003460:	cac50513          	addi	a0,a0,-852 # 80008108 <CONSOLE_STATUS+0xf8>
    80003464:	00001097          	auipc	ra,0x1
    80003468:	4f8080e7          	jalr	1272(ra) # 8000495c <_Z11printStringPKc>
    8000346c:	0400006f          	j	800034ac <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003470:	00005517          	auipc	a0,0x5
    80003474:	db850513          	addi	a0,a0,-584 # 80008228 <CONSOLE_STATUS+0x218>
    80003478:	00001097          	auipc	ra,0x1
    8000347c:	4e4080e7          	jalr	1252(ra) # 8000495c <_Z11printStringPKc>
    80003480:	00000613          	li	a2,0
    80003484:	00a00593          	li	a1,10
    80003488:	00048513          	mv	a0,s1
    8000348c:	00001097          	auipc	ra,0x1
    80003490:	680080e7          	jalr	1664(ra) # 80004b0c <_Z8printIntiii>
    80003494:	00005517          	auipc	a0,0x5
    80003498:	c7450513          	addi	a0,a0,-908 # 80008108 <CONSOLE_STATUS+0xf8>
    8000349c:	00001097          	auipc	ra,0x1
    800034a0:	4c0080e7          	jalr	1216(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 6; i++) {
    800034a4:	0014849b          	addiw	s1,s1,1
    800034a8:	0ff4f493          	andi	s1,s1,255
    800034ac:	00500793          	li	a5,5
    800034b0:	fc97f0e3          	bgeu	a5,s1,80003470 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    800034b4:	00005517          	auipc	a0,0x5
    800034b8:	d4c50513          	addi	a0,a0,-692 # 80008200 <CONSOLE_STATUS+0x1f0>
    800034bc:	00001097          	auipc	ra,0x1
    800034c0:	4a0080e7          	jalr	1184(ra) # 8000495c <_Z11printStringPKc>
    finishedC = true;
    800034c4:	00100793          	li	a5,1
    800034c8:	00007717          	auipc	a4,0x7
    800034cc:	a8f70923          	sb	a5,-1390(a4) # 80009f5a <_ZL9finishedC>
    thread_dispatch();
    800034d0:	ffffe097          	auipc	ra,0xffffe
    800034d4:	fd4080e7          	jalr	-44(ra) # 800014a4 <_Z15thread_dispatchv>
}
    800034d8:	01813083          	ld	ra,24(sp)
    800034dc:	01013403          	ld	s0,16(sp)
    800034e0:	00813483          	ld	s1,8(sp)
    800034e4:	00013903          	ld	s2,0(sp)
    800034e8:	02010113          	addi	sp,sp,32
    800034ec:	00008067          	ret

00000000800034f0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800034f0:	fe010113          	addi	sp,sp,-32
    800034f4:	00113c23          	sd	ra,24(sp)
    800034f8:	00813823          	sd	s0,16(sp)
    800034fc:	00913423          	sd	s1,8(sp)
    80003500:	01213023          	sd	s2,0(sp)
    80003504:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003508:	00a00493          	li	s1,10
    8000350c:	0400006f          	j	8000354c <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003510:	00005517          	auipc	a0,0x5
    80003514:	d4850513          	addi	a0,a0,-696 # 80008258 <CONSOLE_STATUS+0x248>
    80003518:	00001097          	auipc	ra,0x1
    8000351c:	444080e7          	jalr	1092(ra) # 8000495c <_Z11printStringPKc>
    80003520:	00000613          	li	a2,0
    80003524:	00a00593          	li	a1,10
    80003528:	00048513          	mv	a0,s1
    8000352c:	00001097          	auipc	ra,0x1
    80003530:	5e0080e7          	jalr	1504(ra) # 80004b0c <_Z8printIntiii>
    80003534:	00005517          	auipc	a0,0x5
    80003538:	bd450513          	addi	a0,a0,-1068 # 80008108 <CONSOLE_STATUS+0xf8>
    8000353c:	00001097          	auipc	ra,0x1
    80003540:	420080e7          	jalr	1056(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003544:	0014849b          	addiw	s1,s1,1
    80003548:	0ff4f493          	andi	s1,s1,255
    8000354c:	00c00793          	li	a5,12
    80003550:	fc97f0e3          	bgeu	a5,s1,80003510 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003554:	00005517          	auipc	a0,0x5
    80003558:	d0c50513          	addi	a0,a0,-756 # 80008260 <CONSOLE_STATUS+0x250>
    8000355c:	00001097          	auipc	ra,0x1
    80003560:	400080e7          	jalr	1024(ra) # 8000495c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003564:	00500313          	li	t1,5
    thread_dispatch();
    80003568:	ffffe097          	auipc	ra,0xffffe
    8000356c:	f3c080e7          	jalr	-196(ra) # 800014a4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003570:	01000513          	li	a0,16
    80003574:	00000097          	auipc	ra,0x0
    80003578:	be8080e7          	jalr	-1048(ra) # 8000315c <_ZL9fibonaccim>
    8000357c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003580:	00005517          	auipc	a0,0x5
    80003584:	cf050513          	addi	a0,a0,-784 # 80008270 <CONSOLE_STATUS+0x260>
    80003588:	00001097          	auipc	ra,0x1
    8000358c:	3d4080e7          	jalr	980(ra) # 8000495c <_Z11printStringPKc>
    80003590:	00000613          	li	a2,0
    80003594:	00a00593          	li	a1,10
    80003598:	0009051b          	sext.w	a0,s2
    8000359c:	00001097          	auipc	ra,0x1
    800035a0:	570080e7          	jalr	1392(ra) # 80004b0c <_Z8printIntiii>
    800035a4:	00005517          	auipc	a0,0x5
    800035a8:	b6450513          	addi	a0,a0,-1180 # 80008108 <CONSOLE_STATUS+0xf8>
    800035ac:	00001097          	auipc	ra,0x1
    800035b0:	3b0080e7          	jalr	944(ra) # 8000495c <_Z11printStringPKc>
    800035b4:	0400006f          	j	800035f4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800035b8:	00005517          	auipc	a0,0x5
    800035bc:	ca050513          	addi	a0,a0,-864 # 80008258 <CONSOLE_STATUS+0x248>
    800035c0:	00001097          	auipc	ra,0x1
    800035c4:	39c080e7          	jalr	924(ra) # 8000495c <_Z11printStringPKc>
    800035c8:	00000613          	li	a2,0
    800035cc:	00a00593          	li	a1,10
    800035d0:	00048513          	mv	a0,s1
    800035d4:	00001097          	auipc	ra,0x1
    800035d8:	538080e7          	jalr	1336(ra) # 80004b0c <_Z8printIntiii>
    800035dc:	00005517          	auipc	a0,0x5
    800035e0:	b2c50513          	addi	a0,a0,-1236 # 80008108 <CONSOLE_STATUS+0xf8>
    800035e4:	00001097          	auipc	ra,0x1
    800035e8:	378080e7          	jalr	888(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 16; i++) {
    800035ec:	0014849b          	addiw	s1,s1,1
    800035f0:	0ff4f493          	andi	s1,s1,255
    800035f4:	00f00793          	li	a5,15
    800035f8:	fc97f0e3          	bgeu	a5,s1,800035b8 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800035fc:	00005517          	auipc	a0,0x5
    80003600:	c8450513          	addi	a0,a0,-892 # 80008280 <CONSOLE_STATUS+0x270>
    80003604:	00001097          	auipc	ra,0x1
    80003608:	358080e7          	jalr	856(ra) # 8000495c <_Z11printStringPKc>
    finishedD = true;
    8000360c:	00100793          	li	a5,1
    80003610:	00007717          	auipc	a4,0x7
    80003614:	94f705a3          	sb	a5,-1717(a4) # 80009f5b <_ZL9finishedD>
    thread_dispatch();
    80003618:	ffffe097          	auipc	ra,0xffffe
    8000361c:	e8c080e7          	jalr	-372(ra) # 800014a4 <_Z15thread_dispatchv>
}
    80003620:	01813083          	ld	ra,24(sp)
    80003624:	01013403          	ld	s0,16(sp)
    80003628:	00813483          	ld	s1,8(sp)
    8000362c:	00013903          	ld	s2,0(sp)
    80003630:	02010113          	addi	sp,sp,32
    80003634:	00008067          	ret

0000000080003638 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003638:	fc010113          	addi	sp,sp,-64
    8000363c:	02113c23          	sd	ra,56(sp)
    80003640:	02813823          	sd	s0,48(sp)
    80003644:	02913423          	sd	s1,40(sp)
    80003648:	03213023          	sd	s2,32(sp)
    8000364c:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003650:	01000513          	li	a0,16
    80003654:	ffffe097          	auipc	ra,0xffffe
    80003658:	7b0080e7          	jalr	1968(ra) # 80001e04 <_Znwm>
    8000365c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003660:	fffff097          	auipc	ra,0xfffff
    80003664:	98c080e7          	jalr	-1652(ra) # 80001fec <_ZN6ThreadC1Ev>
    80003668:	00006797          	auipc	a5,0x6
    8000366c:	71878793          	addi	a5,a5,1816 # 80009d80 <_ZTV7WorkerA+0x10>
    80003670:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003674:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003678:	00005517          	auipc	a0,0x5
    8000367c:	c1850513          	addi	a0,a0,-1000 # 80008290 <CONSOLE_STATUS+0x280>
    80003680:	00001097          	auipc	ra,0x1
    80003684:	2dc080e7          	jalr	732(ra) # 8000495c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003688:	01000513          	li	a0,16
    8000368c:	ffffe097          	auipc	ra,0xffffe
    80003690:	778080e7          	jalr	1912(ra) # 80001e04 <_Znwm>
    80003694:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003698:	fffff097          	auipc	ra,0xfffff
    8000369c:	954080e7          	jalr	-1708(ra) # 80001fec <_ZN6ThreadC1Ev>
    800036a0:	00006797          	auipc	a5,0x6
    800036a4:	70878793          	addi	a5,a5,1800 # 80009da8 <_ZTV7WorkerB+0x10>
    800036a8:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800036ac:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800036b0:	00005517          	auipc	a0,0x5
    800036b4:	bf850513          	addi	a0,a0,-1032 # 800082a8 <CONSOLE_STATUS+0x298>
    800036b8:	00001097          	auipc	ra,0x1
    800036bc:	2a4080e7          	jalr	676(ra) # 8000495c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800036c0:	01000513          	li	a0,16
    800036c4:	ffffe097          	auipc	ra,0xffffe
    800036c8:	740080e7          	jalr	1856(ra) # 80001e04 <_Znwm>
    800036cc:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800036d0:	fffff097          	auipc	ra,0xfffff
    800036d4:	91c080e7          	jalr	-1764(ra) # 80001fec <_ZN6ThreadC1Ev>
    800036d8:	00006797          	auipc	a5,0x6
    800036dc:	6f878793          	addi	a5,a5,1784 # 80009dd0 <_ZTV7WorkerC+0x10>
    800036e0:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800036e4:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800036e8:	00005517          	auipc	a0,0x5
    800036ec:	bd850513          	addi	a0,a0,-1064 # 800082c0 <CONSOLE_STATUS+0x2b0>
    800036f0:	00001097          	auipc	ra,0x1
    800036f4:	26c080e7          	jalr	620(ra) # 8000495c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800036f8:	01000513          	li	a0,16
    800036fc:	ffffe097          	auipc	ra,0xffffe
    80003700:	708080e7          	jalr	1800(ra) # 80001e04 <_Znwm>
    80003704:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003708:	fffff097          	auipc	ra,0xfffff
    8000370c:	8e4080e7          	jalr	-1820(ra) # 80001fec <_ZN6ThreadC1Ev>
    80003710:	00006797          	auipc	a5,0x6
    80003714:	6e878793          	addi	a5,a5,1768 # 80009df8 <_ZTV7WorkerD+0x10>
    80003718:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    8000371c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003720:	00005517          	auipc	a0,0x5
    80003724:	bb850513          	addi	a0,a0,-1096 # 800082d8 <CONSOLE_STATUS+0x2c8>
    80003728:	00001097          	auipc	ra,0x1
    8000372c:	234080e7          	jalr	564(ra) # 8000495c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003730:	00000493          	li	s1,0
    80003734:	00300793          	li	a5,3
    80003738:	0297c663          	blt	a5,s1,80003764 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    8000373c:	00349793          	slli	a5,s1,0x3
    80003740:	fe040713          	addi	a4,s0,-32
    80003744:	00f707b3          	add	a5,a4,a5
    80003748:	fe07b503          	ld	a0,-32(a5)
    8000374c:	fffff097          	auipc	ra,0xfffff
    80003750:	81c080e7          	jalr	-2020(ra) # 80001f68 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003754:	0014849b          	addiw	s1,s1,1
    80003758:	fddff06f          	j	80003734 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    8000375c:	fffff097          	auipc	ra,0xfffff
    80003760:	868080e7          	jalr	-1944(ra) # 80001fc4 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003764:	00006797          	auipc	a5,0x6
    80003768:	7f47c783          	lbu	a5,2036(a5) # 80009f58 <_ZL9finishedA>
    8000376c:	fe0788e3          	beqz	a5,8000375c <_Z20Threads_CPP_API_testv+0x124>
    80003770:	00006797          	auipc	a5,0x6
    80003774:	7e97c783          	lbu	a5,2025(a5) # 80009f59 <_ZL9finishedB>
    80003778:	fe0782e3          	beqz	a5,8000375c <_Z20Threads_CPP_API_testv+0x124>
    8000377c:	00006797          	auipc	a5,0x6
    80003780:	7de7c783          	lbu	a5,2014(a5) # 80009f5a <_ZL9finishedC>
    80003784:	fc078ce3          	beqz	a5,8000375c <_Z20Threads_CPP_API_testv+0x124>
    80003788:	00006797          	auipc	a5,0x6
    8000378c:	7d37c783          	lbu	a5,2003(a5) # 80009f5b <_ZL9finishedD>
    80003790:	fc0786e3          	beqz	a5,8000375c <_Z20Threads_CPP_API_testv+0x124>
    80003794:	fc040493          	addi	s1,s0,-64
    80003798:	0080006f          	j	800037a0 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    8000379c:	00848493          	addi	s1,s1,8
    800037a0:	fe040793          	addi	a5,s0,-32
    800037a4:	08f48663          	beq	s1,a5,80003830 <_Z20Threads_CPP_API_testv+0x1f8>
    800037a8:	0004b503          	ld	a0,0(s1)
    800037ac:	fe0508e3          	beqz	a0,8000379c <_Z20Threads_CPP_API_testv+0x164>
    800037b0:	00053783          	ld	a5,0(a0)
    800037b4:	0087b783          	ld	a5,8(a5)
    800037b8:	000780e7          	jalr	a5
    800037bc:	fe1ff06f          	j	8000379c <_Z20Threads_CPP_API_testv+0x164>
    800037c0:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800037c4:	00048513          	mv	a0,s1
    800037c8:	ffffe097          	auipc	ra,0xffffe
    800037cc:	664080e7          	jalr	1636(ra) # 80001e2c <_ZdlPv>
    800037d0:	00090513          	mv	a0,s2
    800037d4:	00008097          	auipc	ra,0x8
    800037d8:	874080e7          	jalr	-1932(ra) # 8000b048 <_Unwind_Resume>
    800037dc:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800037e0:	00048513          	mv	a0,s1
    800037e4:	ffffe097          	auipc	ra,0xffffe
    800037e8:	648080e7          	jalr	1608(ra) # 80001e2c <_ZdlPv>
    800037ec:	00090513          	mv	a0,s2
    800037f0:	00008097          	auipc	ra,0x8
    800037f4:	858080e7          	jalr	-1960(ra) # 8000b048 <_Unwind_Resume>
    800037f8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800037fc:	00048513          	mv	a0,s1
    80003800:	ffffe097          	auipc	ra,0xffffe
    80003804:	62c080e7          	jalr	1580(ra) # 80001e2c <_ZdlPv>
    80003808:	00090513          	mv	a0,s2
    8000380c:	00008097          	auipc	ra,0x8
    80003810:	83c080e7          	jalr	-1988(ra) # 8000b048 <_Unwind_Resume>
    80003814:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003818:	00048513          	mv	a0,s1
    8000381c:	ffffe097          	auipc	ra,0xffffe
    80003820:	610080e7          	jalr	1552(ra) # 80001e2c <_ZdlPv>
    80003824:	00090513          	mv	a0,s2
    80003828:	00008097          	auipc	ra,0x8
    8000382c:	820080e7          	jalr	-2016(ra) # 8000b048 <_Unwind_Resume>
}
    80003830:	03813083          	ld	ra,56(sp)
    80003834:	03013403          	ld	s0,48(sp)
    80003838:	02813483          	ld	s1,40(sp)
    8000383c:	02013903          	ld	s2,32(sp)
    80003840:	04010113          	addi	sp,sp,64
    80003844:	00008067          	ret

0000000080003848 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003848:	ff010113          	addi	sp,sp,-16
    8000384c:	00113423          	sd	ra,8(sp)
    80003850:	00813023          	sd	s0,0(sp)
    80003854:	01010413          	addi	s0,sp,16
    80003858:	00006797          	auipc	a5,0x6
    8000385c:	52878793          	addi	a5,a5,1320 # 80009d80 <_ZTV7WorkerA+0x10>
    80003860:	00f53023          	sd	a5,0(a0)
    80003864:	ffffe097          	auipc	ra,0xffffe
    80003868:	5f0080e7          	jalr	1520(ra) # 80001e54 <_ZN6ThreadD1Ev>
    8000386c:	00813083          	ld	ra,8(sp)
    80003870:	00013403          	ld	s0,0(sp)
    80003874:	01010113          	addi	sp,sp,16
    80003878:	00008067          	ret

000000008000387c <_ZN7WorkerAD0Ev>:
    8000387c:	fe010113          	addi	sp,sp,-32
    80003880:	00113c23          	sd	ra,24(sp)
    80003884:	00813823          	sd	s0,16(sp)
    80003888:	00913423          	sd	s1,8(sp)
    8000388c:	02010413          	addi	s0,sp,32
    80003890:	00050493          	mv	s1,a0
    80003894:	00006797          	auipc	a5,0x6
    80003898:	4ec78793          	addi	a5,a5,1260 # 80009d80 <_ZTV7WorkerA+0x10>
    8000389c:	00f53023          	sd	a5,0(a0)
    800038a0:	ffffe097          	auipc	ra,0xffffe
    800038a4:	5b4080e7          	jalr	1460(ra) # 80001e54 <_ZN6ThreadD1Ev>
    800038a8:	00048513          	mv	a0,s1
    800038ac:	ffffe097          	auipc	ra,0xffffe
    800038b0:	580080e7          	jalr	1408(ra) # 80001e2c <_ZdlPv>
    800038b4:	01813083          	ld	ra,24(sp)
    800038b8:	01013403          	ld	s0,16(sp)
    800038bc:	00813483          	ld	s1,8(sp)
    800038c0:	02010113          	addi	sp,sp,32
    800038c4:	00008067          	ret

00000000800038c8 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800038c8:	ff010113          	addi	sp,sp,-16
    800038cc:	00113423          	sd	ra,8(sp)
    800038d0:	00813023          	sd	s0,0(sp)
    800038d4:	01010413          	addi	s0,sp,16
    800038d8:	00006797          	auipc	a5,0x6
    800038dc:	4d078793          	addi	a5,a5,1232 # 80009da8 <_ZTV7WorkerB+0x10>
    800038e0:	00f53023          	sd	a5,0(a0)
    800038e4:	ffffe097          	auipc	ra,0xffffe
    800038e8:	570080e7          	jalr	1392(ra) # 80001e54 <_ZN6ThreadD1Ev>
    800038ec:	00813083          	ld	ra,8(sp)
    800038f0:	00013403          	ld	s0,0(sp)
    800038f4:	01010113          	addi	sp,sp,16
    800038f8:	00008067          	ret

00000000800038fc <_ZN7WorkerBD0Ev>:
    800038fc:	fe010113          	addi	sp,sp,-32
    80003900:	00113c23          	sd	ra,24(sp)
    80003904:	00813823          	sd	s0,16(sp)
    80003908:	00913423          	sd	s1,8(sp)
    8000390c:	02010413          	addi	s0,sp,32
    80003910:	00050493          	mv	s1,a0
    80003914:	00006797          	auipc	a5,0x6
    80003918:	49478793          	addi	a5,a5,1172 # 80009da8 <_ZTV7WorkerB+0x10>
    8000391c:	00f53023          	sd	a5,0(a0)
    80003920:	ffffe097          	auipc	ra,0xffffe
    80003924:	534080e7          	jalr	1332(ra) # 80001e54 <_ZN6ThreadD1Ev>
    80003928:	00048513          	mv	a0,s1
    8000392c:	ffffe097          	auipc	ra,0xffffe
    80003930:	500080e7          	jalr	1280(ra) # 80001e2c <_ZdlPv>
    80003934:	01813083          	ld	ra,24(sp)
    80003938:	01013403          	ld	s0,16(sp)
    8000393c:	00813483          	ld	s1,8(sp)
    80003940:	02010113          	addi	sp,sp,32
    80003944:	00008067          	ret

0000000080003948 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003948:	ff010113          	addi	sp,sp,-16
    8000394c:	00113423          	sd	ra,8(sp)
    80003950:	00813023          	sd	s0,0(sp)
    80003954:	01010413          	addi	s0,sp,16
    80003958:	00006797          	auipc	a5,0x6
    8000395c:	47878793          	addi	a5,a5,1144 # 80009dd0 <_ZTV7WorkerC+0x10>
    80003960:	00f53023          	sd	a5,0(a0)
    80003964:	ffffe097          	auipc	ra,0xffffe
    80003968:	4f0080e7          	jalr	1264(ra) # 80001e54 <_ZN6ThreadD1Ev>
    8000396c:	00813083          	ld	ra,8(sp)
    80003970:	00013403          	ld	s0,0(sp)
    80003974:	01010113          	addi	sp,sp,16
    80003978:	00008067          	ret

000000008000397c <_ZN7WorkerCD0Ev>:
    8000397c:	fe010113          	addi	sp,sp,-32
    80003980:	00113c23          	sd	ra,24(sp)
    80003984:	00813823          	sd	s0,16(sp)
    80003988:	00913423          	sd	s1,8(sp)
    8000398c:	02010413          	addi	s0,sp,32
    80003990:	00050493          	mv	s1,a0
    80003994:	00006797          	auipc	a5,0x6
    80003998:	43c78793          	addi	a5,a5,1084 # 80009dd0 <_ZTV7WorkerC+0x10>
    8000399c:	00f53023          	sd	a5,0(a0)
    800039a0:	ffffe097          	auipc	ra,0xffffe
    800039a4:	4b4080e7          	jalr	1204(ra) # 80001e54 <_ZN6ThreadD1Ev>
    800039a8:	00048513          	mv	a0,s1
    800039ac:	ffffe097          	auipc	ra,0xffffe
    800039b0:	480080e7          	jalr	1152(ra) # 80001e2c <_ZdlPv>
    800039b4:	01813083          	ld	ra,24(sp)
    800039b8:	01013403          	ld	s0,16(sp)
    800039bc:	00813483          	ld	s1,8(sp)
    800039c0:	02010113          	addi	sp,sp,32
    800039c4:	00008067          	ret

00000000800039c8 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800039c8:	ff010113          	addi	sp,sp,-16
    800039cc:	00113423          	sd	ra,8(sp)
    800039d0:	00813023          	sd	s0,0(sp)
    800039d4:	01010413          	addi	s0,sp,16
    800039d8:	00006797          	auipc	a5,0x6
    800039dc:	42078793          	addi	a5,a5,1056 # 80009df8 <_ZTV7WorkerD+0x10>
    800039e0:	00f53023          	sd	a5,0(a0)
    800039e4:	ffffe097          	auipc	ra,0xffffe
    800039e8:	470080e7          	jalr	1136(ra) # 80001e54 <_ZN6ThreadD1Ev>
    800039ec:	00813083          	ld	ra,8(sp)
    800039f0:	00013403          	ld	s0,0(sp)
    800039f4:	01010113          	addi	sp,sp,16
    800039f8:	00008067          	ret

00000000800039fc <_ZN7WorkerDD0Ev>:
    800039fc:	fe010113          	addi	sp,sp,-32
    80003a00:	00113c23          	sd	ra,24(sp)
    80003a04:	00813823          	sd	s0,16(sp)
    80003a08:	00913423          	sd	s1,8(sp)
    80003a0c:	02010413          	addi	s0,sp,32
    80003a10:	00050493          	mv	s1,a0
    80003a14:	00006797          	auipc	a5,0x6
    80003a18:	3e478793          	addi	a5,a5,996 # 80009df8 <_ZTV7WorkerD+0x10>
    80003a1c:	00f53023          	sd	a5,0(a0)
    80003a20:	ffffe097          	auipc	ra,0xffffe
    80003a24:	434080e7          	jalr	1076(ra) # 80001e54 <_ZN6ThreadD1Ev>
    80003a28:	00048513          	mv	a0,s1
    80003a2c:	ffffe097          	auipc	ra,0xffffe
    80003a30:	400080e7          	jalr	1024(ra) # 80001e2c <_ZdlPv>
    80003a34:	01813083          	ld	ra,24(sp)
    80003a38:	01013403          	ld	s0,16(sp)
    80003a3c:	00813483          	ld	s1,8(sp)
    80003a40:	02010113          	addi	sp,sp,32
    80003a44:	00008067          	ret

0000000080003a48 <_ZN7WorkerA3runEv>:
    void run() override {
    80003a48:	ff010113          	addi	sp,sp,-16
    80003a4c:	00113423          	sd	ra,8(sp)
    80003a50:	00813023          	sd	s0,0(sp)
    80003a54:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003a58:	00000593          	li	a1,0
    80003a5c:	fffff097          	auipc	ra,0xfffff
    80003a60:	774080e7          	jalr	1908(ra) # 800031d0 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003a64:	00813083          	ld	ra,8(sp)
    80003a68:	00013403          	ld	s0,0(sp)
    80003a6c:	01010113          	addi	sp,sp,16
    80003a70:	00008067          	ret

0000000080003a74 <_ZN7WorkerB3runEv>:
    void run() override {
    80003a74:	ff010113          	addi	sp,sp,-16
    80003a78:	00113423          	sd	ra,8(sp)
    80003a7c:	00813023          	sd	s0,0(sp)
    80003a80:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003a84:	00000593          	li	a1,0
    80003a88:	00000097          	auipc	ra,0x0
    80003a8c:	814080e7          	jalr	-2028(ra) # 8000329c <_ZN7WorkerB11workerBodyBEPv>
    }
    80003a90:	00813083          	ld	ra,8(sp)
    80003a94:	00013403          	ld	s0,0(sp)
    80003a98:	01010113          	addi	sp,sp,16
    80003a9c:	00008067          	ret

0000000080003aa0 <_ZN7WorkerC3runEv>:
    void run() override {
    80003aa0:	ff010113          	addi	sp,sp,-16
    80003aa4:	00113423          	sd	ra,8(sp)
    80003aa8:	00813023          	sd	s0,0(sp)
    80003aac:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003ab0:	00000593          	li	a1,0
    80003ab4:	00000097          	auipc	ra,0x0
    80003ab8:	8bc080e7          	jalr	-1860(ra) # 80003370 <_ZN7WorkerC11workerBodyCEPv>
    }
    80003abc:	00813083          	ld	ra,8(sp)
    80003ac0:	00013403          	ld	s0,0(sp)
    80003ac4:	01010113          	addi	sp,sp,16
    80003ac8:	00008067          	ret

0000000080003acc <_ZN7WorkerD3runEv>:
    void run() override {
    80003acc:	ff010113          	addi	sp,sp,-16
    80003ad0:	00113423          	sd	ra,8(sp)
    80003ad4:	00813023          	sd	s0,0(sp)
    80003ad8:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80003adc:	00000593          	li	a1,0
    80003ae0:	00000097          	auipc	ra,0x0
    80003ae4:	a10080e7          	jalr	-1520(ra) # 800034f0 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003ae8:	00813083          	ld	ra,8(sp)
    80003aec:	00013403          	ld	s0,0(sp)
    80003af0:	01010113          	addi	sp,sp,16
    80003af4:	00008067          	ret

0000000080003af8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003af8:	fe010113          	addi	sp,sp,-32
    80003afc:	00113c23          	sd	ra,24(sp)
    80003b00:	00813823          	sd	s0,16(sp)
    80003b04:	00913423          	sd	s1,8(sp)
    80003b08:	01213023          	sd	s2,0(sp)
    80003b0c:	02010413          	addi	s0,sp,32
    80003b10:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003b14:	00100793          	li	a5,1
    80003b18:	02a7f863          	bgeu	a5,a0,80003b48 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003b1c:	00a00793          	li	a5,10
    80003b20:	02f577b3          	remu	a5,a0,a5
    80003b24:	02078e63          	beqz	a5,80003b60 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003b28:	fff48513          	addi	a0,s1,-1
    80003b2c:	00000097          	auipc	ra,0x0
    80003b30:	fcc080e7          	jalr	-52(ra) # 80003af8 <_ZL9fibonaccim>
    80003b34:	00050913          	mv	s2,a0
    80003b38:	ffe48513          	addi	a0,s1,-2
    80003b3c:	00000097          	auipc	ra,0x0
    80003b40:	fbc080e7          	jalr	-68(ra) # 80003af8 <_ZL9fibonaccim>
    80003b44:	00a90533          	add	a0,s2,a0
}
    80003b48:	01813083          	ld	ra,24(sp)
    80003b4c:	01013403          	ld	s0,16(sp)
    80003b50:	00813483          	ld	s1,8(sp)
    80003b54:	00013903          	ld	s2,0(sp)
    80003b58:	02010113          	addi	sp,sp,32
    80003b5c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003b60:	ffffe097          	auipc	ra,0xffffe
    80003b64:	944080e7          	jalr	-1724(ra) # 800014a4 <_Z15thread_dispatchv>
    80003b68:	fc1ff06f          	j	80003b28 <_ZL9fibonaccim+0x30>

0000000080003b6c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80003b6c:	fe010113          	addi	sp,sp,-32
    80003b70:	00113c23          	sd	ra,24(sp)
    80003b74:	00813823          	sd	s0,16(sp)
    80003b78:	00913423          	sd	s1,8(sp)
    80003b7c:	01213023          	sd	s2,0(sp)
    80003b80:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003b84:	00a00493          	li	s1,10
    80003b88:	0400006f          	j	80003bc8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003b8c:	00004517          	auipc	a0,0x4
    80003b90:	6cc50513          	addi	a0,a0,1740 # 80008258 <CONSOLE_STATUS+0x248>
    80003b94:	00001097          	auipc	ra,0x1
    80003b98:	dc8080e7          	jalr	-568(ra) # 8000495c <_Z11printStringPKc>
    80003b9c:	00000613          	li	a2,0
    80003ba0:	00a00593          	li	a1,10
    80003ba4:	00048513          	mv	a0,s1
    80003ba8:	00001097          	auipc	ra,0x1
    80003bac:	f64080e7          	jalr	-156(ra) # 80004b0c <_Z8printIntiii>
    80003bb0:	00004517          	auipc	a0,0x4
    80003bb4:	55850513          	addi	a0,a0,1368 # 80008108 <CONSOLE_STATUS+0xf8>
    80003bb8:	00001097          	auipc	ra,0x1
    80003bbc:	da4080e7          	jalr	-604(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003bc0:	0014849b          	addiw	s1,s1,1
    80003bc4:	0ff4f493          	andi	s1,s1,255
    80003bc8:	00c00793          	li	a5,12
    80003bcc:	fc97f0e3          	bgeu	a5,s1,80003b8c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80003bd0:	00004517          	auipc	a0,0x4
    80003bd4:	69050513          	addi	a0,a0,1680 # 80008260 <CONSOLE_STATUS+0x250>
    80003bd8:	00001097          	auipc	ra,0x1
    80003bdc:	d84080e7          	jalr	-636(ra) # 8000495c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003be0:	00500313          	li	t1,5
    thread_dispatch();
    80003be4:	ffffe097          	auipc	ra,0xffffe
    80003be8:	8c0080e7          	jalr	-1856(ra) # 800014a4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003bec:	01000513          	li	a0,16
    80003bf0:	00000097          	auipc	ra,0x0
    80003bf4:	f08080e7          	jalr	-248(ra) # 80003af8 <_ZL9fibonaccim>
    80003bf8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003bfc:	00004517          	auipc	a0,0x4
    80003c00:	67450513          	addi	a0,a0,1652 # 80008270 <CONSOLE_STATUS+0x260>
    80003c04:	00001097          	auipc	ra,0x1
    80003c08:	d58080e7          	jalr	-680(ra) # 8000495c <_Z11printStringPKc>
    80003c0c:	00000613          	li	a2,0
    80003c10:	00a00593          	li	a1,10
    80003c14:	0009051b          	sext.w	a0,s2
    80003c18:	00001097          	auipc	ra,0x1
    80003c1c:	ef4080e7          	jalr	-268(ra) # 80004b0c <_Z8printIntiii>
    80003c20:	00004517          	auipc	a0,0x4
    80003c24:	4e850513          	addi	a0,a0,1256 # 80008108 <CONSOLE_STATUS+0xf8>
    80003c28:	00001097          	auipc	ra,0x1
    80003c2c:	d34080e7          	jalr	-716(ra) # 8000495c <_Z11printStringPKc>
    80003c30:	0400006f          	j	80003c70 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003c34:	00004517          	auipc	a0,0x4
    80003c38:	62450513          	addi	a0,a0,1572 # 80008258 <CONSOLE_STATUS+0x248>
    80003c3c:	00001097          	auipc	ra,0x1
    80003c40:	d20080e7          	jalr	-736(ra) # 8000495c <_Z11printStringPKc>
    80003c44:	00000613          	li	a2,0
    80003c48:	00a00593          	li	a1,10
    80003c4c:	00048513          	mv	a0,s1
    80003c50:	00001097          	auipc	ra,0x1
    80003c54:	ebc080e7          	jalr	-324(ra) # 80004b0c <_Z8printIntiii>
    80003c58:	00004517          	auipc	a0,0x4
    80003c5c:	4b050513          	addi	a0,a0,1200 # 80008108 <CONSOLE_STATUS+0xf8>
    80003c60:	00001097          	auipc	ra,0x1
    80003c64:	cfc080e7          	jalr	-772(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003c68:	0014849b          	addiw	s1,s1,1
    80003c6c:	0ff4f493          	andi	s1,s1,255
    80003c70:	00f00793          	li	a5,15
    80003c74:	fc97f0e3          	bgeu	a5,s1,80003c34 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80003c78:	00004517          	auipc	a0,0x4
    80003c7c:	60850513          	addi	a0,a0,1544 # 80008280 <CONSOLE_STATUS+0x270>
    80003c80:	00001097          	auipc	ra,0x1
    80003c84:	cdc080e7          	jalr	-804(ra) # 8000495c <_Z11printStringPKc>
    finishedD = true;
    80003c88:	00100793          	li	a5,1
    80003c8c:	00006717          	auipc	a4,0x6
    80003c90:	2cf70823          	sb	a5,720(a4) # 80009f5c <_ZL9finishedD>
    thread_dispatch();
    80003c94:	ffffe097          	auipc	ra,0xffffe
    80003c98:	810080e7          	jalr	-2032(ra) # 800014a4 <_Z15thread_dispatchv>
}
    80003c9c:	01813083          	ld	ra,24(sp)
    80003ca0:	01013403          	ld	s0,16(sp)
    80003ca4:	00813483          	ld	s1,8(sp)
    80003ca8:	00013903          	ld	s2,0(sp)
    80003cac:	02010113          	addi	sp,sp,32
    80003cb0:	00008067          	ret

0000000080003cb4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80003cb4:	fe010113          	addi	sp,sp,-32
    80003cb8:	00113c23          	sd	ra,24(sp)
    80003cbc:	00813823          	sd	s0,16(sp)
    80003cc0:	00913423          	sd	s1,8(sp)
    80003cc4:	01213023          	sd	s2,0(sp)
    80003cc8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003ccc:	00000493          	li	s1,0
    80003cd0:	0400006f          	j	80003d10 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80003cd4:	00004517          	auipc	a0,0x4
    80003cd8:	55450513          	addi	a0,a0,1364 # 80008228 <CONSOLE_STATUS+0x218>
    80003cdc:	00001097          	auipc	ra,0x1
    80003ce0:	c80080e7          	jalr	-896(ra) # 8000495c <_Z11printStringPKc>
    80003ce4:	00000613          	li	a2,0
    80003ce8:	00a00593          	li	a1,10
    80003cec:	00048513          	mv	a0,s1
    80003cf0:	00001097          	auipc	ra,0x1
    80003cf4:	e1c080e7          	jalr	-484(ra) # 80004b0c <_Z8printIntiii>
    80003cf8:	00004517          	auipc	a0,0x4
    80003cfc:	41050513          	addi	a0,a0,1040 # 80008108 <CONSOLE_STATUS+0xf8>
    80003d00:	00001097          	auipc	ra,0x1
    80003d04:	c5c080e7          	jalr	-932(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003d08:	0014849b          	addiw	s1,s1,1
    80003d0c:	0ff4f493          	andi	s1,s1,255
    80003d10:	00200793          	li	a5,2
    80003d14:	fc97f0e3          	bgeu	a5,s1,80003cd4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80003d18:	00004517          	auipc	a0,0x4
    80003d1c:	51850513          	addi	a0,a0,1304 # 80008230 <CONSOLE_STATUS+0x220>
    80003d20:	00001097          	auipc	ra,0x1
    80003d24:	c3c080e7          	jalr	-964(ra) # 8000495c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003d28:	00700313          	li	t1,7
    thread_dispatch();
    80003d2c:	ffffd097          	auipc	ra,0xffffd
    80003d30:	778080e7          	jalr	1912(ra) # 800014a4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003d34:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80003d38:	00004517          	auipc	a0,0x4
    80003d3c:	50850513          	addi	a0,a0,1288 # 80008240 <CONSOLE_STATUS+0x230>
    80003d40:	00001097          	auipc	ra,0x1
    80003d44:	c1c080e7          	jalr	-996(ra) # 8000495c <_Z11printStringPKc>
    80003d48:	00000613          	li	a2,0
    80003d4c:	00a00593          	li	a1,10
    80003d50:	0009051b          	sext.w	a0,s2
    80003d54:	00001097          	auipc	ra,0x1
    80003d58:	db8080e7          	jalr	-584(ra) # 80004b0c <_Z8printIntiii>
    80003d5c:	00004517          	auipc	a0,0x4
    80003d60:	3ac50513          	addi	a0,a0,940 # 80008108 <CONSOLE_STATUS+0xf8>
    80003d64:	00001097          	auipc	ra,0x1
    80003d68:	bf8080e7          	jalr	-1032(ra) # 8000495c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80003d6c:	00c00513          	li	a0,12
    80003d70:	00000097          	auipc	ra,0x0
    80003d74:	d88080e7          	jalr	-632(ra) # 80003af8 <_ZL9fibonaccim>
    80003d78:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003d7c:	00004517          	auipc	a0,0x4
    80003d80:	4cc50513          	addi	a0,a0,1228 # 80008248 <CONSOLE_STATUS+0x238>
    80003d84:	00001097          	auipc	ra,0x1
    80003d88:	bd8080e7          	jalr	-1064(ra) # 8000495c <_Z11printStringPKc>
    80003d8c:	00000613          	li	a2,0
    80003d90:	00a00593          	li	a1,10
    80003d94:	0009051b          	sext.w	a0,s2
    80003d98:	00001097          	auipc	ra,0x1
    80003d9c:	d74080e7          	jalr	-652(ra) # 80004b0c <_Z8printIntiii>
    80003da0:	00004517          	auipc	a0,0x4
    80003da4:	36850513          	addi	a0,a0,872 # 80008108 <CONSOLE_STATUS+0xf8>
    80003da8:	00001097          	auipc	ra,0x1
    80003dac:	bb4080e7          	jalr	-1100(ra) # 8000495c <_Z11printStringPKc>
    80003db0:	0400006f          	j	80003df0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80003db4:	00004517          	auipc	a0,0x4
    80003db8:	47450513          	addi	a0,a0,1140 # 80008228 <CONSOLE_STATUS+0x218>
    80003dbc:	00001097          	auipc	ra,0x1
    80003dc0:	ba0080e7          	jalr	-1120(ra) # 8000495c <_Z11printStringPKc>
    80003dc4:	00000613          	li	a2,0
    80003dc8:	00a00593          	li	a1,10
    80003dcc:	00048513          	mv	a0,s1
    80003dd0:	00001097          	auipc	ra,0x1
    80003dd4:	d3c080e7          	jalr	-708(ra) # 80004b0c <_Z8printIntiii>
    80003dd8:	00004517          	auipc	a0,0x4
    80003ddc:	33050513          	addi	a0,a0,816 # 80008108 <CONSOLE_STATUS+0xf8>
    80003de0:	00001097          	auipc	ra,0x1
    80003de4:	b7c080e7          	jalr	-1156(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003de8:	0014849b          	addiw	s1,s1,1
    80003dec:	0ff4f493          	andi	s1,s1,255
    80003df0:	00500793          	li	a5,5
    80003df4:	fc97f0e3          	bgeu	a5,s1,80003db4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80003df8:	00004517          	auipc	a0,0x4
    80003dfc:	40850513          	addi	a0,a0,1032 # 80008200 <CONSOLE_STATUS+0x1f0>
    80003e00:	00001097          	auipc	ra,0x1
    80003e04:	b5c080e7          	jalr	-1188(ra) # 8000495c <_Z11printStringPKc>
    finishedC = true;
    80003e08:	00100793          	li	a5,1
    80003e0c:	00006717          	auipc	a4,0x6
    80003e10:	14f708a3          	sb	a5,337(a4) # 80009f5d <_ZL9finishedC>
    thread_dispatch();
    80003e14:	ffffd097          	auipc	ra,0xffffd
    80003e18:	690080e7          	jalr	1680(ra) # 800014a4 <_Z15thread_dispatchv>
}
    80003e1c:	01813083          	ld	ra,24(sp)
    80003e20:	01013403          	ld	s0,16(sp)
    80003e24:	00813483          	ld	s1,8(sp)
    80003e28:	00013903          	ld	s2,0(sp)
    80003e2c:	02010113          	addi	sp,sp,32
    80003e30:	00008067          	ret

0000000080003e34 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80003e34:	fe010113          	addi	sp,sp,-32
    80003e38:	00113c23          	sd	ra,24(sp)
    80003e3c:	00813823          	sd	s0,16(sp)
    80003e40:	00913423          	sd	s1,8(sp)
    80003e44:	01213023          	sd	s2,0(sp)
    80003e48:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003e4c:	00000913          	li	s2,0
    80003e50:	0380006f          	j	80003e88 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80003e54:	ffffd097          	auipc	ra,0xffffd
    80003e58:	650080e7          	jalr	1616(ra) # 800014a4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003e5c:	00148493          	addi	s1,s1,1
    80003e60:	000027b7          	lui	a5,0x2
    80003e64:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003e68:	0097ee63          	bltu	a5,s1,80003e84 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003e6c:	00000713          	li	a4,0
    80003e70:	000077b7          	lui	a5,0x7
    80003e74:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003e78:	fce7eee3          	bltu	a5,a4,80003e54 <_ZL11workerBodyBPv+0x20>
    80003e7c:	00170713          	addi	a4,a4,1
    80003e80:	ff1ff06f          	j	80003e70 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003e84:	00190913          	addi	s2,s2,1
    80003e88:	00f00793          	li	a5,15
    80003e8c:	0527e063          	bltu	a5,s2,80003ecc <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003e90:	00004517          	auipc	a0,0x4
    80003e94:	38050513          	addi	a0,a0,896 # 80008210 <CONSOLE_STATUS+0x200>
    80003e98:	00001097          	auipc	ra,0x1
    80003e9c:	ac4080e7          	jalr	-1340(ra) # 8000495c <_Z11printStringPKc>
    80003ea0:	00000613          	li	a2,0
    80003ea4:	00a00593          	li	a1,10
    80003ea8:	0009051b          	sext.w	a0,s2
    80003eac:	00001097          	auipc	ra,0x1
    80003eb0:	c60080e7          	jalr	-928(ra) # 80004b0c <_Z8printIntiii>
    80003eb4:	00004517          	auipc	a0,0x4
    80003eb8:	25450513          	addi	a0,a0,596 # 80008108 <CONSOLE_STATUS+0xf8>
    80003ebc:	00001097          	auipc	ra,0x1
    80003ec0:	aa0080e7          	jalr	-1376(ra) # 8000495c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ec4:	00000493          	li	s1,0
    80003ec8:	f99ff06f          	j	80003e60 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80003ecc:	00004517          	auipc	a0,0x4
    80003ed0:	34c50513          	addi	a0,a0,844 # 80008218 <CONSOLE_STATUS+0x208>
    80003ed4:	00001097          	auipc	ra,0x1
    80003ed8:	a88080e7          	jalr	-1400(ra) # 8000495c <_Z11printStringPKc>
    finishedB = true;
    80003edc:	00100793          	li	a5,1
    80003ee0:	00006717          	auipc	a4,0x6
    80003ee4:	06f70f23          	sb	a5,126(a4) # 80009f5e <_ZL9finishedB>
    thread_dispatch();
    80003ee8:	ffffd097          	auipc	ra,0xffffd
    80003eec:	5bc080e7          	jalr	1468(ra) # 800014a4 <_Z15thread_dispatchv>
}
    80003ef0:	01813083          	ld	ra,24(sp)
    80003ef4:	01013403          	ld	s0,16(sp)
    80003ef8:	00813483          	ld	s1,8(sp)
    80003efc:	00013903          	ld	s2,0(sp)
    80003f00:	02010113          	addi	sp,sp,32
    80003f04:	00008067          	ret

0000000080003f08 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80003f08:	fe010113          	addi	sp,sp,-32
    80003f0c:	00113c23          	sd	ra,24(sp)
    80003f10:	00813823          	sd	s0,16(sp)
    80003f14:	00913423          	sd	s1,8(sp)
    80003f18:	01213023          	sd	s2,0(sp)
    80003f1c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003f20:	00000913          	li	s2,0
    80003f24:	0380006f          	j	80003f5c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80003f28:	ffffd097          	auipc	ra,0xffffd
    80003f2c:	57c080e7          	jalr	1404(ra) # 800014a4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003f30:	00148493          	addi	s1,s1,1
    80003f34:	000027b7          	lui	a5,0x2
    80003f38:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003f3c:	0097ee63          	bltu	a5,s1,80003f58 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003f40:	00000713          	li	a4,0
    80003f44:	000077b7          	lui	a5,0x7
    80003f48:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003f4c:	fce7eee3          	bltu	a5,a4,80003f28 <_ZL11workerBodyAPv+0x20>
    80003f50:	00170713          	addi	a4,a4,1
    80003f54:	ff1ff06f          	j	80003f44 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003f58:	00190913          	addi	s2,s2,1
    80003f5c:	00900793          	li	a5,9
    80003f60:	0527e063          	bltu	a5,s2,80003fa0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003f64:	00004517          	auipc	a0,0x4
    80003f68:	29450513          	addi	a0,a0,660 # 800081f8 <CONSOLE_STATUS+0x1e8>
    80003f6c:	00001097          	auipc	ra,0x1
    80003f70:	9f0080e7          	jalr	-1552(ra) # 8000495c <_Z11printStringPKc>
    80003f74:	00000613          	li	a2,0
    80003f78:	00a00593          	li	a1,10
    80003f7c:	0009051b          	sext.w	a0,s2
    80003f80:	00001097          	auipc	ra,0x1
    80003f84:	b8c080e7          	jalr	-1140(ra) # 80004b0c <_Z8printIntiii>
    80003f88:	00004517          	auipc	a0,0x4
    80003f8c:	18050513          	addi	a0,a0,384 # 80008108 <CONSOLE_STATUS+0xf8>
    80003f90:	00001097          	auipc	ra,0x1
    80003f94:	9cc080e7          	jalr	-1588(ra) # 8000495c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003f98:	00000493          	li	s1,0
    80003f9c:	f99ff06f          	j	80003f34 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80003fa0:	00004517          	auipc	a0,0x4
    80003fa4:	26050513          	addi	a0,a0,608 # 80008200 <CONSOLE_STATUS+0x1f0>
    80003fa8:	00001097          	auipc	ra,0x1
    80003fac:	9b4080e7          	jalr	-1612(ra) # 8000495c <_Z11printStringPKc>
    finishedA = true;
    80003fb0:	00100793          	li	a5,1
    80003fb4:	00006717          	auipc	a4,0x6
    80003fb8:	faf705a3          	sb	a5,-85(a4) # 80009f5f <_ZL9finishedA>
}
    80003fbc:	01813083          	ld	ra,24(sp)
    80003fc0:	01013403          	ld	s0,16(sp)
    80003fc4:	00813483          	ld	s1,8(sp)
    80003fc8:	00013903          	ld	s2,0(sp)
    80003fcc:	02010113          	addi	sp,sp,32
    80003fd0:	00008067          	ret

0000000080003fd4 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80003fd4:	fd010113          	addi	sp,sp,-48
    80003fd8:	02113423          	sd	ra,40(sp)
    80003fdc:	02813023          	sd	s0,32(sp)
    80003fe0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80003fe4:	00000613          	li	a2,0
    80003fe8:	00000597          	auipc	a1,0x0
    80003fec:	f2058593          	addi	a1,a1,-224 # 80003f08 <_ZL11workerBodyAPv>
    80003ff0:	fd040513          	addi	a0,s0,-48
    80003ff4:	ffffd097          	auipc	ra,0xffffd
    80003ff8:	3fc080e7          	jalr	1020(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80003ffc:	00004517          	auipc	a0,0x4
    80004000:	29450513          	addi	a0,a0,660 # 80008290 <CONSOLE_STATUS+0x280>
    80004004:	00001097          	auipc	ra,0x1
    80004008:	958080e7          	jalr	-1704(ra) # 8000495c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000400c:	00000613          	li	a2,0
    80004010:	00000597          	auipc	a1,0x0
    80004014:	e2458593          	addi	a1,a1,-476 # 80003e34 <_ZL11workerBodyBPv>
    80004018:	fd840513          	addi	a0,s0,-40
    8000401c:	ffffd097          	auipc	ra,0xffffd
    80004020:	3d4080e7          	jalr	980(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80004024:	00004517          	auipc	a0,0x4
    80004028:	28450513          	addi	a0,a0,644 # 800082a8 <CONSOLE_STATUS+0x298>
    8000402c:	00001097          	auipc	ra,0x1
    80004030:	930080e7          	jalr	-1744(ra) # 8000495c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004034:	00000613          	li	a2,0
    80004038:	00000597          	auipc	a1,0x0
    8000403c:	c7c58593          	addi	a1,a1,-900 # 80003cb4 <_ZL11workerBodyCPv>
    80004040:	fe040513          	addi	a0,s0,-32
    80004044:	ffffd097          	auipc	ra,0xffffd
    80004048:	3ac080e7          	jalr	940(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    8000404c:	00004517          	auipc	a0,0x4
    80004050:	27450513          	addi	a0,a0,628 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80004054:	00001097          	auipc	ra,0x1
    80004058:	908080e7          	jalr	-1784(ra) # 8000495c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000405c:	00000613          	li	a2,0
    80004060:	00000597          	auipc	a1,0x0
    80004064:	b0c58593          	addi	a1,a1,-1268 # 80003b6c <_ZL11workerBodyDPv>
    80004068:	fe840513          	addi	a0,s0,-24
    8000406c:	ffffd097          	auipc	ra,0xffffd
    80004070:	384080e7          	jalr	900(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80004074:	00004517          	auipc	a0,0x4
    80004078:	26450513          	addi	a0,a0,612 # 800082d8 <CONSOLE_STATUS+0x2c8>
    8000407c:	00001097          	auipc	ra,0x1
    80004080:	8e0080e7          	jalr	-1824(ra) # 8000495c <_Z11printStringPKc>
    80004084:	00c0006f          	j	80004090 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004088:	ffffd097          	auipc	ra,0xffffd
    8000408c:	41c080e7          	jalr	1052(ra) # 800014a4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004090:	00006797          	auipc	a5,0x6
    80004094:	ecf7c783          	lbu	a5,-305(a5) # 80009f5f <_ZL9finishedA>
    80004098:	fe0788e3          	beqz	a5,80004088 <_Z18Threads_C_API_testv+0xb4>
    8000409c:	00006797          	auipc	a5,0x6
    800040a0:	ec27c783          	lbu	a5,-318(a5) # 80009f5e <_ZL9finishedB>
    800040a4:	fe0782e3          	beqz	a5,80004088 <_Z18Threads_C_API_testv+0xb4>
    800040a8:	00006797          	auipc	a5,0x6
    800040ac:	eb57c783          	lbu	a5,-331(a5) # 80009f5d <_ZL9finishedC>
    800040b0:	fc078ce3          	beqz	a5,80004088 <_Z18Threads_C_API_testv+0xb4>
    800040b4:	00006797          	auipc	a5,0x6
    800040b8:	ea87c783          	lbu	a5,-344(a5) # 80009f5c <_ZL9finishedD>
    800040bc:	fc0786e3          	beqz	a5,80004088 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800040c0:	02813083          	ld	ra,40(sp)
    800040c4:	02013403          	ld	s0,32(sp)
    800040c8:	03010113          	addi	sp,sp,48
    800040cc:	00008067          	ret

00000000800040d0 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800040d0:	fd010113          	addi	sp,sp,-48
    800040d4:	02113423          	sd	ra,40(sp)
    800040d8:	02813023          	sd	s0,32(sp)
    800040dc:	00913c23          	sd	s1,24(sp)
    800040e0:	01213823          	sd	s2,16(sp)
    800040e4:	01313423          	sd	s3,8(sp)
    800040e8:	03010413          	addi	s0,sp,48
    800040ec:	00050993          	mv	s3,a0
    800040f0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800040f4:	00000913          	li	s2,0
    800040f8:	00c0006f          	j	80004104 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800040fc:	ffffe097          	auipc	ra,0xffffe
    80004100:	ec8080e7          	jalr	-312(ra) # 80001fc4 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004104:	ffffd097          	auipc	ra,0xffffd
    80004108:	510080e7          	jalr	1296(ra) # 80001614 <_Z4getcv>
    8000410c:	0005059b          	sext.w	a1,a0
    80004110:	01b00793          	li	a5,27
    80004114:	02f58a63          	beq	a1,a5,80004148 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004118:	0084b503          	ld	a0,8(s1)
    8000411c:	00001097          	auipc	ra,0x1
    80004120:	c64080e7          	jalr	-924(ra) # 80004d80 <_ZN9BufferCPP3putEi>
        i++;
    80004124:	0019071b          	addiw	a4,s2,1
    80004128:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000412c:	0004a683          	lw	a3,0(s1)
    80004130:	0026979b          	slliw	a5,a3,0x2
    80004134:	00d787bb          	addw	a5,a5,a3
    80004138:	0017979b          	slliw	a5,a5,0x1
    8000413c:	02f767bb          	remw	a5,a4,a5
    80004140:	fc0792e3          	bnez	a5,80004104 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004144:	fb9ff06f          	j	800040fc <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004148:	00100793          	li	a5,1
    8000414c:	00006717          	auipc	a4,0x6
    80004150:	e0f72a23          	sw	a5,-492(a4) # 80009f60 <_ZL9threadEnd>
    td->buffer->put('!');
    80004154:	0109b783          	ld	a5,16(s3)
    80004158:	02100593          	li	a1,33
    8000415c:	0087b503          	ld	a0,8(a5)
    80004160:	00001097          	auipc	ra,0x1
    80004164:	c20080e7          	jalr	-992(ra) # 80004d80 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80004168:	0104b503          	ld	a0,16(s1)
    8000416c:	ffffe097          	auipc	ra,0xffffe
    80004170:	f28080e7          	jalr	-216(ra) # 80002094 <_ZN9Semaphore6signalEv>
}
    80004174:	02813083          	ld	ra,40(sp)
    80004178:	02013403          	ld	s0,32(sp)
    8000417c:	01813483          	ld	s1,24(sp)
    80004180:	01013903          	ld	s2,16(sp)
    80004184:	00813983          	ld	s3,8(sp)
    80004188:	03010113          	addi	sp,sp,48
    8000418c:	00008067          	ret

0000000080004190 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80004190:	fe010113          	addi	sp,sp,-32
    80004194:	00113c23          	sd	ra,24(sp)
    80004198:	00813823          	sd	s0,16(sp)
    8000419c:	00913423          	sd	s1,8(sp)
    800041a0:	01213023          	sd	s2,0(sp)
    800041a4:	02010413          	addi	s0,sp,32
    800041a8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800041ac:	00000913          	li	s2,0
    800041b0:	00c0006f          	j	800041bc <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800041b4:	ffffe097          	auipc	ra,0xffffe
    800041b8:	e10080e7          	jalr	-496(ra) # 80001fc4 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800041bc:	00006797          	auipc	a5,0x6
    800041c0:	da47a783          	lw	a5,-604(a5) # 80009f60 <_ZL9threadEnd>
    800041c4:	02079e63          	bnez	a5,80004200 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800041c8:	0004a583          	lw	a1,0(s1)
    800041cc:	0305859b          	addiw	a1,a1,48
    800041d0:	0084b503          	ld	a0,8(s1)
    800041d4:	00001097          	auipc	ra,0x1
    800041d8:	bac080e7          	jalr	-1108(ra) # 80004d80 <_ZN9BufferCPP3putEi>
        i++;
    800041dc:	0019071b          	addiw	a4,s2,1
    800041e0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800041e4:	0004a683          	lw	a3,0(s1)
    800041e8:	0026979b          	slliw	a5,a3,0x2
    800041ec:	00d787bb          	addw	a5,a5,a3
    800041f0:	0017979b          	slliw	a5,a5,0x1
    800041f4:	02f767bb          	remw	a5,a4,a5
    800041f8:	fc0792e3          	bnez	a5,800041bc <_ZN12ProducerSync8producerEPv+0x2c>
    800041fc:	fb9ff06f          	j	800041b4 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004200:	0104b503          	ld	a0,16(s1)
    80004204:	ffffe097          	auipc	ra,0xffffe
    80004208:	e90080e7          	jalr	-368(ra) # 80002094 <_ZN9Semaphore6signalEv>
}
    8000420c:	01813083          	ld	ra,24(sp)
    80004210:	01013403          	ld	s0,16(sp)
    80004214:	00813483          	ld	s1,8(sp)
    80004218:	00013903          	ld	s2,0(sp)
    8000421c:	02010113          	addi	sp,sp,32
    80004220:	00008067          	ret

0000000080004224 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80004224:	fd010113          	addi	sp,sp,-48
    80004228:	02113423          	sd	ra,40(sp)
    8000422c:	02813023          	sd	s0,32(sp)
    80004230:	00913c23          	sd	s1,24(sp)
    80004234:	01213823          	sd	s2,16(sp)
    80004238:	01313423          	sd	s3,8(sp)
    8000423c:	01413023          	sd	s4,0(sp)
    80004240:	03010413          	addi	s0,sp,48
    80004244:	00050993          	mv	s3,a0
    80004248:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000424c:	00000a13          	li	s4,0
    80004250:	01c0006f          	j	8000426c <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80004254:	ffffe097          	auipc	ra,0xffffe
    80004258:	d70080e7          	jalr	-656(ra) # 80001fc4 <_ZN6Thread8dispatchEv>
    8000425c:	0500006f          	j	800042ac <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004260:	00a00513          	li	a0,10
    80004264:	ffffd097          	auipc	ra,0xffffd
    80004268:	3e4080e7          	jalr	996(ra) # 80001648 <_Z4putcc>
    while (!threadEnd) {
    8000426c:	00006797          	auipc	a5,0x6
    80004270:	cf47a783          	lw	a5,-780(a5) # 80009f60 <_ZL9threadEnd>
    80004274:	06079263          	bnez	a5,800042d8 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80004278:	00893503          	ld	a0,8(s2)
    8000427c:	00001097          	auipc	ra,0x1
    80004280:	b94080e7          	jalr	-1132(ra) # 80004e10 <_ZN9BufferCPP3getEv>
        i++;
    80004284:	001a049b          	addiw	s1,s4,1
    80004288:	00048a1b          	sext.w	s4,s1
        putc(key);
    8000428c:	0ff57513          	andi	a0,a0,255
    80004290:	ffffd097          	auipc	ra,0xffffd
    80004294:	3b8080e7          	jalr	952(ra) # 80001648 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80004298:	00092703          	lw	a4,0(s2)
    8000429c:	0027179b          	slliw	a5,a4,0x2
    800042a0:	00e787bb          	addw	a5,a5,a4
    800042a4:	02f4e7bb          	remw	a5,s1,a5
    800042a8:	fa0786e3          	beqz	a5,80004254 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800042ac:	05000793          	li	a5,80
    800042b0:	02f4e4bb          	remw	s1,s1,a5
    800042b4:	fa049ce3          	bnez	s1,8000426c <_ZN12ConsumerSync8consumerEPv+0x48>
    800042b8:	fa9ff06f          	j	80004260 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800042bc:	0109b783          	ld	a5,16(s3)
    800042c0:	0087b503          	ld	a0,8(a5)
    800042c4:	00001097          	auipc	ra,0x1
    800042c8:	b4c080e7          	jalr	-1204(ra) # 80004e10 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    800042cc:	0ff57513          	andi	a0,a0,255
    800042d0:	ffffe097          	auipc	ra,0xffffe
    800042d4:	e44080e7          	jalr	-444(ra) # 80002114 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    800042d8:	0109b783          	ld	a5,16(s3)
    800042dc:	0087b503          	ld	a0,8(a5)
    800042e0:	00001097          	auipc	ra,0x1
    800042e4:	bbc080e7          	jalr	-1092(ra) # 80004e9c <_ZN9BufferCPP6getCntEv>
    800042e8:	fca04ae3          	bgtz	a0,800042bc <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    800042ec:	01093503          	ld	a0,16(s2)
    800042f0:	ffffe097          	auipc	ra,0xffffe
    800042f4:	da4080e7          	jalr	-604(ra) # 80002094 <_ZN9Semaphore6signalEv>
}
    800042f8:	02813083          	ld	ra,40(sp)
    800042fc:	02013403          	ld	s0,32(sp)
    80004300:	01813483          	ld	s1,24(sp)
    80004304:	01013903          	ld	s2,16(sp)
    80004308:	00813983          	ld	s3,8(sp)
    8000430c:	00013a03          	ld	s4,0(sp)
    80004310:	03010113          	addi	sp,sp,48
    80004314:	00008067          	ret

0000000080004318 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80004318:	f8010113          	addi	sp,sp,-128
    8000431c:	06113c23          	sd	ra,120(sp)
    80004320:	06813823          	sd	s0,112(sp)
    80004324:	06913423          	sd	s1,104(sp)
    80004328:	07213023          	sd	s2,96(sp)
    8000432c:	05313c23          	sd	s3,88(sp)
    80004330:	05413823          	sd	s4,80(sp)
    80004334:	05513423          	sd	s5,72(sp)
    80004338:	05613023          	sd	s6,64(sp)
    8000433c:	03713c23          	sd	s7,56(sp)
    80004340:	03813823          	sd	s8,48(sp)
    80004344:	03913423          	sd	s9,40(sp)
    80004348:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    8000434c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80004350:	00004517          	auipc	a0,0x4
    80004354:	dc050513          	addi	a0,a0,-576 # 80008110 <CONSOLE_STATUS+0x100>
    80004358:	00000097          	auipc	ra,0x0
    8000435c:	604080e7          	jalr	1540(ra) # 8000495c <_Z11printStringPKc>
    getString(input, 30);
    80004360:	01e00593          	li	a1,30
    80004364:	f8040493          	addi	s1,s0,-128
    80004368:	00048513          	mv	a0,s1
    8000436c:	00000097          	auipc	ra,0x0
    80004370:	678080e7          	jalr	1656(ra) # 800049e4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004374:	00048513          	mv	a0,s1
    80004378:	00000097          	auipc	ra,0x0
    8000437c:	744080e7          	jalr	1860(ra) # 80004abc <_Z11stringToIntPKc>
    80004380:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004384:	00004517          	auipc	a0,0x4
    80004388:	dac50513          	addi	a0,a0,-596 # 80008130 <CONSOLE_STATUS+0x120>
    8000438c:	00000097          	auipc	ra,0x0
    80004390:	5d0080e7          	jalr	1488(ra) # 8000495c <_Z11printStringPKc>
    getString(input, 30);
    80004394:	01e00593          	li	a1,30
    80004398:	00048513          	mv	a0,s1
    8000439c:	00000097          	auipc	ra,0x0
    800043a0:	648080e7          	jalr	1608(ra) # 800049e4 <_Z9getStringPci>
    n = stringToInt(input);
    800043a4:	00048513          	mv	a0,s1
    800043a8:	00000097          	auipc	ra,0x0
    800043ac:	714080e7          	jalr	1812(ra) # 80004abc <_Z11stringToIntPKc>
    800043b0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800043b4:	00004517          	auipc	a0,0x4
    800043b8:	d9c50513          	addi	a0,a0,-612 # 80008150 <CONSOLE_STATUS+0x140>
    800043bc:	00000097          	auipc	ra,0x0
    800043c0:	5a0080e7          	jalr	1440(ra) # 8000495c <_Z11printStringPKc>
    800043c4:	00000613          	li	a2,0
    800043c8:	00a00593          	li	a1,10
    800043cc:	00090513          	mv	a0,s2
    800043d0:	00000097          	auipc	ra,0x0
    800043d4:	73c080e7          	jalr	1852(ra) # 80004b0c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800043d8:	00004517          	auipc	a0,0x4
    800043dc:	d9050513          	addi	a0,a0,-624 # 80008168 <CONSOLE_STATUS+0x158>
    800043e0:	00000097          	auipc	ra,0x0
    800043e4:	57c080e7          	jalr	1404(ra) # 8000495c <_Z11printStringPKc>
    800043e8:	00000613          	li	a2,0
    800043ec:	00a00593          	li	a1,10
    800043f0:	00048513          	mv	a0,s1
    800043f4:	00000097          	auipc	ra,0x0
    800043f8:	718080e7          	jalr	1816(ra) # 80004b0c <_Z8printIntiii>
    printString(".\n");
    800043fc:	00004517          	auipc	a0,0x4
    80004400:	d8450513          	addi	a0,a0,-636 # 80008180 <CONSOLE_STATUS+0x170>
    80004404:	00000097          	auipc	ra,0x0
    80004408:	558080e7          	jalr	1368(ra) # 8000495c <_Z11printStringPKc>
    if(threadNum > n) {
    8000440c:	0324c463          	blt	s1,s2,80004434 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80004410:	03205c63          	blez	s2,80004448 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004414:	03800513          	li	a0,56
    80004418:	ffffe097          	auipc	ra,0xffffe
    8000441c:	9ec080e7          	jalr	-1556(ra) # 80001e04 <_Znwm>
    80004420:	00050a93          	mv	s5,a0
    80004424:	00048593          	mv	a1,s1
    80004428:	00001097          	auipc	ra,0x1
    8000442c:	804080e7          	jalr	-2044(ra) # 80004c2c <_ZN9BufferCPPC1Ei>
    80004430:	0300006f          	j	80004460 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004434:	00004517          	auipc	a0,0x4
    80004438:	d5450513          	addi	a0,a0,-684 # 80008188 <CONSOLE_STATUS+0x178>
    8000443c:	00000097          	auipc	ra,0x0
    80004440:	520080e7          	jalr	1312(ra) # 8000495c <_Z11printStringPKc>
        return;
    80004444:	0140006f          	j	80004458 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004448:	00004517          	auipc	a0,0x4
    8000444c:	d8050513          	addi	a0,a0,-640 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80004450:	00000097          	auipc	ra,0x0
    80004454:	50c080e7          	jalr	1292(ra) # 8000495c <_Z11printStringPKc>
        return;
    80004458:	000b8113          	mv	sp,s7
    8000445c:	2380006f          	j	80004694 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80004460:	01000513          	li	a0,16
    80004464:	ffffe097          	auipc	ra,0xffffe
    80004468:	9a0080e7          	jalr	-1632(ra) # 80001e04 <_Znwm>
    8000446c:	00050493          	mv	s1,a0
    80004470:	00000593          	li	a1,0
    80004474:	ffffe097          	auipc	ra,0xffffe
    80004478:	bbc080e7          	jalr	-1092(ra) # 80002030 <_ZN9SemaphoreC1Ej>
    8000447c:	00006797          	auipc	a5,0x6
    80004480:	ae97b623          	sd	s1,-1300(a5) # 80009f68 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80004484:	00391793          	slli	a5,s2,0x3
    80004488:	00f78793          	addi	a5,a5,15
    8000448c:	ff07f793          	andi	a5,a5,-16
    80004490:	40f10133          	sub	sp,sp,a5
    80004494:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80004498:	0019071b          	addiw	a4,s2,1
    8000449c:	00171793          	slli	a5,a4,0x1
    800044a0:	00e787b3          	add	a5,a5,a4
    800044a4:	00379793          	slli	a5,a5,0x3
    800044a8:	00f78793          	addi	a5,a5,15
    800044ac:	ff07f793          	andi	a5,a5,-16
    800044b0:	40f10133          	sub	sp,sp,a5
    800044b4:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800044b8:	00191c13          	slli	s8,s2,0x1
    800044bc:	012c07b3          	add	a5,s8,s2
    800044c0:	00379793          	slli	a5,a5,0x3
    800044c4:	00fa07b3          	add	a5,s4,a5
    800044c8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800044cc:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800044d0:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800044d4:	01800513          	li	a0,24
    800044d8:	ffffe097          	auipc	ra,0xffffe
    800044dc:	92c080e7          	jalr	-1748(ra) # 80001e04 <_Znwm>
    800044e0:	00050b13          	mv	s6,a0
    800044e4:	012c0c33          	add	s8,s8,s2
    800044e8:	003c1c13          	slli	s8,s8,0x3
    800044ec:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    800044f0:	ffffe097          	auipc	ra,0xffffe
    800044f4:	afc080e7          	jalr	-1284(ra) # 80001fec <_ZN6ThreadC1Ev>
    800044f8:	00006797          	auipc	a5,0x6
    800044fc:	97878793          	addi	a5,a5,-1672 # 80009e70 <_ZTV12ConsumerSync+0x10>
    80004500:	00fb3023          	sd	a5,0(s6)
    80004504:	018b3823          	sd	s8,16(s6)
    consumerThread->start();
    80004508:	000b0513          	mv	a0,s6
    8000450c:	ffffe097          	auipc	ra,0xffffe
    80004510:	a5c080e7          	jalr	-1444(ra) # 80001f68 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004514:	00000493          	li	s1,0
    80004518:	0380006f          	j	80004550 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000451c:	00006797          	auipc	a5,0x6
    80004520:	92c78793          	addi	a5,a5,-1748 # 80009e48 <_ZTV12ProducerSync+0x10>
    80004524:	00fcb023          	sd	a5,0(s9)
    80004528:	018cb823          	sd	s8,16(s9)
            threads[i] = new ProducerSync(data+i);
    8000452c:	00349793          	slli	a5,s1,0x3
    80004530:	00f987b3          	add	a5,s3,a5
    80004534:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80004538:	00349793          	slli	a5,s1,0x3
    8000453c:	00f987b3          	add	a5,s3,a5
    80004540:	0007b503          	ld	a0,0(a5)
    80004544:	ffffe097          	auipc	ra,0xffffe
    80004548:	a24080e7          	jalr	-1500(ra) # 80001f68 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000454c:	0014849b          	addiw	s1,s1,1
    80004550:	0b24d063          	bge	s1,s2,800045f0 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80004554:	00149793          	slli	a5,s1,0x1
    80004558:	009787b3          	add	a5,a5,s1
    8000455c:	00379793          	slli	a5,a5,0x3
    80004560:	00fa07b3          	add	a5,s4,a5
    80004564:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004568:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    8000456c:	00006717          	auipc	a4,0x6
    80004570:	9fc73703          	ld	a4,-1540(a4) # 80009f68 <_ZL10waitForAll>
    80004574:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80004578:	02905863          	blez	s1,800045a8 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    8000457c:	01800513          	li	a0,24
    80004580:	ffffe097          	auipc	ra,0xffffe
    80004584:	884080e7          	jalr	-1916(ra) # 80001e04 <_Znwm>
    80004588:	00050c93          	mv	s9,a0
    8000458c:	00149c13          	slli	s8,s1,0x1
    80004590:	009c0c33          	add	s8,s8,s1
    80004594:	003c1c13          	slli	s8,s8,0x3
    80004598:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000459c:	ffffe097          	auipc	ra,0xffffe
    800045a0:	a50080e7          	jalr	-1456(ra) # 80001fec <_ZN6ThreadC1Ev>
    800045a4:	f79ff06f          	j	8000451c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800045a8:	01800513          	li	a0,24
    800045ac:	ffffe097          	auipc	ra,0xffffe
    800045b0:	858080e7          	jalr	-1960(ra) # 80001e04 <_Znwm>
    800045b4:	00050c93          	mv	s9,a0
    800045b8:	00149c13          	slli	s8,s1,0x1
    800045bc:	009c0c33          	add	s8,s8,s1
    800045c0:	003c1c13          	slli	s8,s8,0x3
    800045c4:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800045c8:	ffffe097          	auipc	ra,0xffffe
    800045cc:	a24080e7          	jalr	-1500(ra) # 80001fec <_ZN6ThreadC1Ev>
    800045d0:	00006797          	auipc	a5,0x6
    800045d4:	85078793          	addi	a5,a5,-1968 # 80009e20 <_ZTV16ProducerKeyboard+0x10>
    800045d8:	00fcb023          	sd	a5,0(s9)
    800045dc:	018cb823          	sd	s8,16(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800045e0:	00349793          	slli	a5,s1,0x3
    800045e4:	00f987b3          	add	a5,s3,a5
    800045e8:	0197b023          	sd	s9,0(a5)
    800045ec:	f4dff06f          	j	80004538 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    800045f0:	ffffe097          	auipc	ra,0xffffe
    800045f4:	9d4080e7          	jalr	-1580(ra) # 80001fc4 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800045f8:	00000493          	li	s1,0
    800045fc:	00994e63          	blt	s2,s1,80004618 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80004600:	00006517          	auipc	a0,0x6
    80004604:	96853503          	ld	a0,-1688(a0) # 80009f68 <_ZL10waitForAll>
    80004608:	ffffe097          	auipc	ra,0xffffe
    8000460c:	a60080e7          	jalr	-1440(ra) # 80002068 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004610:	0014849b          	addiw	s1,s1,1
    80004614:	fe9ff06f          	j	800045fc <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80004618:	00000493          	li	s1,0
    8000461c:	0080006f          	j	80004624 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80004620:	0014849b          	addiw	s1,s1,1
    80004624:	0324d263          	bge	s1,s2,80004648 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80004628:	00349793          	slli	a5,s1,0x3
    8000462c:	00f987b3          	add	a5,s3,a5
    80004630:	0007b503          	ld	a0,0(a5)
    80004634:	fe0506e3          	beqz	a0,80004620 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80004638:	00053783          	ld	a5,0(a0)
    8000463c:	0087b783          	ld	a5,8(a5)
    80004640:	000780e7          	jalr	a5
    80004644:	fddff06f          	j	80004620 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80004648:	000b0a63          	beqz	s6,8000465c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    8000464c:	000b3783          	ld	a5,0(s6)
    80004650:	0087b783          	ld	a5,8(a5)
    80004654:	000b0513          	mv	a0,s6
    80004658:	000780e7          	jalr	a5
    delete waitForAll;
    8000465c:	00006517          	auipc	a0,0x6
    80004660:	90c53503          	ld	a0,-1780(a0) # 80009f68 <_ZL10waitForAll>
    80004664:	00050863          	beqz	a0,80004674 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80004668:	00053783          	ld	a5,0(a0)
    8000466c:	0087b783          	ld	a5,8(a5)
    80004670:	000780e7          	jalr	a5
    delete buffer;
    80004674:	000a8e63          	beqz	s5,80004690 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80004678:	000a8513          	mv	a0,s5
    8000467c:	00001097          	auipc	ra,0x1
    80004680:	8a8080e7          	jalr	-1880(ra) # 80004f24 <_ZN9BufferCPPD1Ev>
    80004684:	000a8513          	mv	a0,s5
    80004688:	ffffd097          	auipc	ra,0xffffd
    8000468c:	7a4080e7          	jalr	1956(ra) # 80001e2c <_ZdlPv>
    80004690:	000b8113          	mv	sp,s7

}
    80004694:	f8040113          	addi	sp,s0,-128
    80004698:	07813083          	ld	ra,120(sp)
    8000469c:	07013403          	ld	s0,112(sp)
    800046a0:	06813483          	ld	s1,104(sp)
    800046a4:	06013903          	ld	s2,96(sp)
    800046a8:	05813983          	ld	s3,88(sp)
    800046ac:	05013a03          	ld	s4,80(sp)
    800046b0:	04813a83          	ld	s5,72(sp)
    800046b4:	04013b03          	ld	s6,64(sp)
    800046b8:	03813b83          	ld	s7,56(sp)
    800046bc:	03013c03          	ld	s8,48(sp)
    800046c0:	02813c83          	ld	s9,40(sp)
    800046c4:	08010113          	addi	sp,sp,128
    800046c8:	00008067          	ret
    800046cc:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800046d0:	000a8513          	mv	a0,s5
    800046d4:	ffffd097          	auipc	ra,0xffffd
    800046d8:	758080e7          	jalr	1880(ra) # 80001e2c <_ZdlPv>
    800046dc:	00048513          	mv	a0,s1
    800046e0:	00007097          	auipc	ra,0x7
    800046e4:	968080e7          	jalr	-1688(ra) # 8000b048 <_Unwind_Resume>
    800046e8:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    800046ec:	00048513          	mv	a0,s1
    800046f0:	ffffd097          	auipc	ra,0xffffd
    800046f4:	73c080e7          	jalr	1852(ra) # 80001e2c <_ZdlPv>
    800046f8:	00090513          	mv	a0,s2
    800046fc:	00007097          	auipc	ra,0x7
    80004700:	94c080e7          	jalr	-1716(ra) # 8000b048 <_Unwind_Resume>
    80004704:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80004708:	000b0513          	mv	a0,s6
    8000470c:	ffffd097          	auipc	ra,0xffffd
    80004710:	720080e7          	jalr	1824(ra) # 80001e2c <_ZdlPv>
    80004714:	00048513          	mv	a0,s1
    80004718:	00007097          	auipc	ra,0x7
    8000471c:	930080e7          	jalr	-1744(ra) # 8000b048 <_Unwind_Resume>
    80004720:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80004724:	000c8513          	mv	a0,s9
    80004728:	ffffd097          	auipc	ra,0xffffd
    8000472c:	704080e7          	jalr	1796(ra) # 80001e2c <_ZdlPv>
    80004730:	00048513          	mv	a0,s1
    80004734:	00007097          	auipc	ra,0x7
    80004738:	914080e7          	jalr	-1772(ra) # 8000b048 <_Unwind_Resume>
    8000473c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80004740:	000c8513          	mv	a0,s9
    80004744:	ffffd097          	auipc	ra,0xffffd
    80004748:	6e8080e7          	jalr	1768(ra) # 80001e2c <_ZdlPv>
    8000474c:	00048513          	mv	a0,s1
    80004750:	00007097          	auipc	ra,0x7
    80004754:	8f8080e7          	jalr	-1800(ra) # 8000b048 <_Unwind_Resume>

0000000080004758 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80004758:	ff010113          	addi	sp,sp,-16
    8000475c:	00113423          	sd	ra,8(sp)
    80004760:	00813023          	sd	s0,0(sp)
    80004764:	01010413          	addi	s0,sp,16
    80004768:	00005797          	auipc	a5,0x5
    8000476c:	70878793          	addi	a5,a5,1800 # 80009e70 <_ZTV12ConsumerSync+0x10>
    80004770:	00f53023          	sd	a5,0(a0)
    80004774:	ffffd097          	auipc	ra,0xffffd
    80004778:	6e0080e7          	jalr	1760(ra) # 80001e54 <_ZN6ThreadD1Ev>
    8000477c:	00813083          	ld	ra,8(sp)
    80004780:	00013403          	ld	s0,0(sp)
    80004784:	01010113          	addi	sp,sp,16
    80004788:	00008067          	ret

000000008000478c <_ZN12ConsumerSyncD0Ev>:
    8000478c:	fe010113          	addi	sp,sp,-32
    80004790:	00113c23          	sd	ra,24(sp)
    80004794:	00813823          	sd	s0,16(sp)
    80004798:	00913423          	sd	s1,8(sp)
    8000479c:	02010413          	addi	s0,sp,32
    800047a0:	00050493          	mv	s1,a0
    800047a4:	00005797          	auipc	a5,0x5
    800047a8:	6cc78793          	addi	a5,a5,1740 # 80009e70 <_ZTV12ConsumerSync+0x10>
    800047ac:	00f53023          	sd	a5,0(a0)
    800047b0:	ffffd097          	auipc	ra,0xffffd
    800047b4:	6a4080e7          	jalr	1700(ra) # 80001e54 <_ZN6ThreadD1Ev>
    800047b8:	00048513          	mv	a0,s1
    800047bc:	ffffd097          	auipc	ra,0xffffd
    800047c0:	670080e7          	jalr	1648(ra) # 80001e2c <_ZdlPv>
    800047c4:	01813083          	ld	ra,24(sp)
    800047c8:	01013403          	ld	s0,16(sp)
    800047cc:	00813483          	ld	s1,8(sp)
    800047d0:	02010113          	addi	sp,sp,32
    800047d4:	00008067          	ret

00000000800047d8 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    800047d8:	ff010113          	addi	sp,sp,-16
    800047dc:	00113423          	sd	ra,8(sp)
    800047e0:	00813023          	sd	s0,0(sp)
    800047e4:	01010413          	addi	s0,sp,16
    800047e8:	00005797          	auipc	a5,0x5
    800047ec:	66078793          	addi	a5,a5,1632 # 80009e48 <_ZTV12ProducerSync+0x10>
    800047f0:	00f53023          	sd	a5,0(a0)
    800047f4:	ffffd097          	auipc	ra,0xffffd
    800047f8:	660080e7          	jalr	1632(ra) # 80001e54 <_ZN6ThreadD1Ev>
    800047fc:	00813083          	ld	ra,8(sp)
    80004800:	00013403          	ld	s0,0(sp)
    80004804:	01010113          	addi	sp,sp,16
    80004808:	00008067          	ret

000000008000480c <_ZN12ProducerSyncD0Ev>:
    8000480c:	fe010113          	addi	sp,sp,-32
    80004810:	00113c23          	sd	ra,24(sp)
    80004814:	00813823          	sd	s0,16(sp)
    80004818:	00913423          	sd	s1,8(sp)
    8000481c:	02010413          	addi	s0,sp,32
    80004820:	00050493          	mv	s1,a0
    80004824:	00005797          	auipc	a5,0x5
    80004828:	62478793          	addi	a5,a5,1572 # 80009e48 <_ZTV12ProducerSync+0x10>
    8000482c:	00f53023          	sd	a5,0(a0)
    80004830:	ffffd097          	auipc	ra,0xffffd
    80004834:	624080e7          	jalr	1572(ra) # 80001e54 <_ZN6ThreadD1Ev>
    80004838:	00048513          	mv	a0,s1
    8000483c:	ffffd097          	auipc	ra,0xffffd
    80004840:	5f0080e7          	jalr	1520(ra) # 80001e2c <_ZdlPv>
    80004844:	01813083          	ld	ra,24(sp)
    80004848:	01013403          	ld	s0,16(sp)
    8000484c:	00813483          	ld	s1,8(sp)
    80004850:	02010113          	addi	sp,sp,32
    80004854:	00008067          	ret

0000000080004858 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80004858:	ff010113          	addi	sp,sp,-16
    8000485c:	00113423          	sd	ra,8(sp)
    80004860:	00813023          	sd	s0,0(sp)
    80004864:	01010413          	addi	s0,sp,16
    80004868:	00005797          	auipc	a5,0x5
    8000486c:	5b878793          	addi	a5,a5,1464 # 80009e20 <_ZTV16ProducerKeyboard+0x10>
    80004870:	00f53023          	sd	a5,0(a0)
    80004874:	ffffd097          	auipc	ra,0xffffd
    80004878:	5e0080e7          	jalr	1504(ra) # 80001e54 <_ZN6ThreadD1Ev>
    8000487c:	00813083          	ld	ra,8(sp)
    80004880:	00013403          	ld	s0,0(sp)
    80004884:	01010113          	addi	sp,sp,16
    80004888:	00008067          	ret

000000008000488c <_ZN16ProducerKeyboardD0Ev>:
    8000488c:	fe010113          	addi	sp,sp,-32
    80004890:	00113c23          	sd	ra,24(sp)
    80004894:	00813823          	sd	s0,16(sp)
    80004898:	00913423          	sd	s1,8(sp)
    8000489c:	02010413          	addi	s0,sp,32
    800048a0:	00050493          	mv	s1,a0
    800048a4:	00005797          	auipc	a5,0x5
    800048a8:	57c78793          	addi	a5,a5,1404 # 80009e20 <_ZTV16ProducerKeyboard+0x10>
    800048ac:	00f53023          	sd	a5,0(a0)
    800048b0:	ffffd097          	auipc	ra,0xffffd
    800048b4:	5a4080e7          	jalr	1444(ra) # 80001e54 <_ZN6ThreadD1Ev>
    800048b8:	00048513          	mv	a0,s1
    800048bc:	ffffd097          	auipc	ra,0xffffd
    800048c0:	570080e7          	jalr	1392(ra) # 80001e2c <_ZdlPv>
    800048c4:	01813083          	ld	ra,24(sp)
    800048c8:	01013403          	ld	s0,16(sp)
    800048cc:	00813483          	ld	s1,8(sp)
    800048d0:	02010113          	addi	sp,sp,32
    800048d4:	00008067          	ret

00000000800048d8 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800048d8:	ff010113          	addi	sp,sp,-16
    800048dc:	00113423          	sd	ra,8(sp)
    800048e0:	00813023          	sd	s0,0(sp)
    800048e4:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    800048e8:	01053583          	ld	a1,16(a0)
    800048ec:	fffff097          	auipc	ra,0xfffff
    800048f0:	7e4080e7          	jalr	2020(ra) # 800040d0 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    800048f4:	00813083          	ld	ra,8(sp)
    800048f8:	00013403          	ld	s0,0(sp)
    800048fc:	01010113          	addi	sp,sp,16
    80004900:	00008067          	ret

0000000080004904 <_ZN12ProducerSync3runEv>:
    void run() override {
    80004904:	ff010113          	addi	sp,sp,-16
    80004908:	00113423          	sd	ra,8(sp)
    8000490c:	00813023          	sd	s0,0(sp)
    80004910:	01010413          	addi	s0,sp,16
        producer(td);
    80004914:	01053583          	ld	a1,16(a0)
    80004918:	00000097          	auipc	ra,0x0
    8000491c:	878080e7          	jalr	-1928(ra) # 80004190 <_ZN12ProducerSync8producerEPv>
    }
    80004920:	00813083          	ld	ra,8(sp)
    80004924:	00013403          	ld	s0,0(sp)
    80004928:	01010113          	addi	sp,sp,16
    8000492c:	00008067          	ret

0000000080004930 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80004930:	ff010113          	addi	sp,sp,-16
    80004934:	00113423          	sd	ra,8(sp)
    80004938:	00813023          	sd	s0,0(sp)
    8000493c:	01010413          	addi	s0,sp,16
        consumer(td);
    80004940:	01053583          	ld	a1,16(a0)
    80004944:	00000097          	auipc	ra,0x0
    80004948:	8e0080e7          	jalr	-1824(ra) # 80004224 <_ZN12ConsumerSync8consumerEPv>
    }
    8000494c:	00813083          	ld	ra,8(sp)
    80004950:	00013403          	ld	s0,0(sp)
    80004954:	01010113          	addi	sp,sp,16
    80004958:	00008067          	ret

000000008000495c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000495c:	fe010113          	addi	sp,sp,-32
    80004960:	00113c23          	sd	ra,24(sp)
    80004964:	00813823          	sd	s0,16(sp)
    80004968:	00913423          	sd	s1,8(sp)
    8000496c:	02010413          	addi	s0,sp,32
    80004970:	00050493          	mv	s1,a0
    LOCK();
    80004974:	00100613          	li	a2,1
    80004978:	00000593          	li	a1,0
    8000497c:	00005517          	auipc	a0,0x5
    80004980:	5f450513          	addi	a0,a0,1524 # 80009f70 <lockPrint>
    80004984:	ffffd097          	auipc	ra,0xffffd
    80004988:	9d8080e7          	jalr	-1576(ra) # 8000135c <copy_and_swap>
    8000498c:	00050863          	beqz	a0,8000499c <_Z11printStringPKc+0x40>
    80004990:	ffffd097          	auipc	ra,0xffffd
    80004994:	b14080e7          	jalr	-1260(ra) # 800014a4 <_Z15thread_dispatchv>
    80004998:	fddff06f          	j	80004974 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000499c:	0004c503          	lbu	a0,0(s1)
    800049a0:	00050a63          	beqz	a0,800049b4 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800049a4:	ffffd097          	auipc	ra,0xffffd
    800049a8:	ca4080e7          	jalr	-860(ra) # 80001648 <_Z4putcc>
        string++;
    800049ac:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800049b0:	fedff06f          	j	8000499c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800049b4:	00000613          	li	a2,0
    800049b8:	00100593          	li	a1,1
    800049bc:	00005517          	auipc	a0,0x5
    800049c0:	5b450513          	addi	a0,a0,1460 # 80009f70 <lockPrint>
    800049c4:	ffffd097          	auipc	ra,0xffffd
    800049c8:	998080e7          	jalr	-1640(ra) # 8000135c <copy_and_swap>
    800049cc:	fe0514e3          	bnez	a0,800049b4 <_Z11printStringPKc+0x58>
}
    800049d0:	01813083          	ld	ra,24(sp)
    800049d4:	01013403          	ld	s0,16(sp)
    800049d8:	00813483          	ld	s1,8(sp)
    800049dc:	02010113          	addi	sp,sp,32
    800049e0:	00008067          	ret

00000000800049e4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800049e4:	fd010113          	addi	sp,sp,-48
    800049e8:	02113423          	sd	ra,40(sp)
    800049ec:	02813023          	sd	s0,32(sp)
    800049f0:	00913c23          	sd	s1,24(sp)
    800049f4:	01213823          	sd	s2,16(sp)
    800049f8:	01313423          	sd	s3,8(sp)
    800049fc:	01413023          	sd	s4,0(sp)
    80004a00:	03010413          	addi	s0,sp,48
    80004a04:	00050993          	mv	s3,a0
    80004a08:	00058a13          	mv	s4,a1
    LOCK();
    80004a0c:	00100613          	li	a2,1
    80004a10:	00000593          	li	a1,0
    80004a14:	00005517          	auipc	a0,0x5
    80004a18:	55c50513          	addi	a0,a0,1372 # 80009f70 <lockPrint>
    80004a1c:	ffffd097          	auipc	ra,0xffffd
    80004a20:	940080e7          	jalr	-1728(ra) # 8000135c <copy_and_swap>
    80004a24:	00050863          	beqz	a0,80004a34 <_Z9getStringPci+0x50>
    80004a28:	ffffd097          	auipc	ra,0xffffd
    80004a2c:	a7c080e7          	jalr	-1412(ra) # 800014a4 <_Z15thread_dispatchv>
    80004a30:	fddff06f          	j	80004a0c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80004a34:	00000913          	li	s2,0
    80004a38:	00090493          	mv	s1,s2
    80004a3c:	0019091b          	addiw	s2,s2,1
    80004a40:	03495a63          	bge	s2,s4,80004a74 <_Z9getStringPci+0x90>
        cc = getc();
    80004a44:	ffffd097          	auipc	ra,0xffffd
    80004a48:	bd0080e7          	jalr	-1072(ra) # 80001614 <_Z4getcv>
        if(cc < 1)
    80004a4c:	02050463          	beqz	a0,80004a74 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80004a50:	009984b3          	add	s1,s3,s1
    80004a54:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80004a58:	00a00793          	li	a5,10
    80004a5c:	00f50a63          	beq	a0,a5,80004a70 <_Z9getStringPci+0x8c>
    80004a60:	00d00793          	li	a5,13
    80004a64:	fcf51ae3          	bne	a0,a5,80004a38 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80004a68:	00090493          	mv	s1,s2
    80004a6c:	0080006f          	j	80004a74 <_Z9getStringPci+0x90>
    80004a70:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004a74:	009984b3          	add	s1,s3,s1
    80004a78:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80004a7c:	00000613          	li	a2,0
    80004a80:	00100593          	li	a1,1
    80004a84:	00005517          	auipc	a0,0x5
    80004a88:	4ec50513          	addi	a0,a0,1260 # 80009f70 <lockPrint>
    80004a8c:	ffffd097          	auipc	ra,0xffffd
    80004a90:	8d0080e7          	jalr	-1840(ra) # 8000135c <copy_and_swap>
    80004a94:	fe0514e3          	bnez	a0,80004a7c <_Z9getStringPci+0x98>
    return buf;
}
    80004a98:	00098513          	mv	a0,s3
    80004a9c:	02813083          	ld	ra,40(sp)
    80004aa0:	02013403          	ld	s0,32(sp)
    80004aa4:	01813483          	ld	s1,24(sp)
    80004aa8:	01013903          	ld	s2,16(sp)
    80004aac:	00813983          	ld	s3,8(sp)
    80004ab0:	00013a03          	ld	s4,0(sp)
    80004ab4:	03010113          	addi	sp,sp,48
    80004ab8:	00008067          	ret

0000000080004abc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004abc:	ff010113          	addi	sp,sp,-16
    80004ac0:	00813423          	sd	s0,8(sp)
    80004ac4:	01010413          	addi	s0,sp,16
    80004ac8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80004acc:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80004ad0:	0006c603          	lbu	a2,0(a3)
    80004ad4:	fd06071b          	addiw	a4,a2,-48
    80004ad8:	0ff77713          	andi	a4,a4,255
    80004adc:	00900793          	li	a5,9
    80004ae0:	02e7e063          	bltu	a5,a4,80004b00 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004ae4:	0025179b          	slliw	a5,a0,0x2
    80004ae8:	00a787bb          	addw	a5,a5,a0
    80004aec:	0017979b          	slliw	a5,a5,0x1
    80004af0:	00168693          	addi	a3,a3,1
    80004af4:	00c787bb          	addw	a5,a5,a2
    80004af8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004afc:	fd5ff06f          	j	80004ad0 <_Z11stringToIntPKc+0x14>
    return n;
}
    80004b00:	00813403          	ld	s0,8(sp)
    80004b04:	01010113          	addi	sp,sp,16
    80004b08:	00008067          	ret

0000000080004b0c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80004b0c:	fc010113          	addi	sp,sp,-64
    80004b10:	02113c23          	sd	ra,56(sp)
    80004b14:	02813823          	sd	s0,48(sp)
    80004b18:	02913423          	sd	s1,40(sp)
    80004b1c:	03213023          	sd	s2,32(sp)
    80004b20:	01313c23          	sd	s3,24(sp)
    80004b24:	04010413          	addi	s0,sp,64
    80004b28:	00050493          	mv	s1,a0
    80004b2c:	00058913          	mv	s2,a1
    80004b30:	00060993          	mv	s3,a2
    LOCK();
    80004b34:	00100613          	li	a2,1
    80004b38:	00000593          	li	a1,0
    80004b3c:	00005517          	auipc	a0,0x5
    80004b40:	43450513          	addi	a0,a0,1076 # 80009f70 <lockPrint>
    80004b44:	ffffd097          	auipc	ra,0xffffd
    80004b48:	818080e7          	jalr	-2024(ra) # 8000135c <copy_and_swap>
    80004b4c:	00050863          	beqz	a0,80004b5c <_Z8printIntiii+0x50>
    80004b50:	ffffd097          	auipc	ra,0xffffd
    80004b54:	954080e7          	jalr	-1708(ra) # 800014a4 <_Z15thread_dispatchv>
    80004b58:	fddff06f          	j	80004b34 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80004b5c:	00098463          	beqz	s3,80004b64 <_Z8printIntiii+0x58>
    80004b60:	0804c463          	bltz	s1,80004be8 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80004b64:	0004851b          	sext.w	a0,s1
    neg = 0;
    80004b68:	00000593          	li	a1,0
    }

    i = 0;
    80004b6c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80004b70:	0009079b          	sext.w	a5,s2
    80004b74:	0325773b          	remuw	a4,a0,s2
    80004b78:	00048613          	mv	a2,s1
    80004b7c:	0014849b          	addiw	s1,s1,1
    80004b80:	02071693          	slli	a3,a4,0x20
    80004b84:	0206d693          	srli	a3,a3,0x20
    80004b88:	00005717          	auipc	a4,0x5
    80004b8c:	30070713          	addi	a4,a4,768 # 80009e88 <digits>
    80004b90:	00d70733          	add	a4,a4,a3
    80004b94:	00074683          	lbu	a3,0(a4)
    80004b98:	fd040713          	addi	a4,s0,-48
    80004b9c:	00c70733          	add	a4,a4,a2
    80004ba0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80004ba4:	0005071b          	sext.w	a4,a0
    80004ba8:	0325553b          	divuw	a0,a0,s2
    80004bac:	fcf772e3          	bgeu	a4,a5,80004b70 <_Z8printIntiii+0x64>
    if(neg)
    80004bb0:	00058c63          	beqz	a1,80004bc8 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80004bb4:	fd040793          	addi	a5,s0,-48
    80004bb8:	009784b3          	add	s1,a5,s1
    80004bbc:	02d00793          	li	a5,45
    80004bc0:	fef48823          	sb	a5,-16(s1)
    80004bc4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004bc8:	fff4849b          	addiw	s1,s1,-1
    80004bcc:	0204c463          	bltz	s1,80004bf4 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80004bd0:	fd040793          	addi	a5,s0,-48
    80004bd4:	009787b3          	add	a5,a5,s1
    80004bd8:	ff07c503          	lbu	a0,-16(a5)
    80004bdc:	ffffd097          	auipc	ra,0xffffd
    80004be0:	a6c080e7          	jalr	-1428(ra) # 80001648 <_Z4putcc>
    80004be4:	fe5ff06f          	j	80004bc8 <_Z8printIntiii+0xbc>
        x = -xx;
    80004be8:	4090053b          	negw	a0,s1
        neg = 1;
    80004bec:	00100593          	li	a1,1
        x = -xx;
    80004bf0:	f7dff06f          	j	80004b6c <_Z8printIntiii+0x60>

    UNLOCK();
    80004bf4:	00000613          	li	a2,0
    80004bf8:	00100593          	li	a1,1
    80004bfc:	00005517          	auipc	a0,0x5
    80004c00:	37450513          	addi	a0,a0,884 # 80009f70 <lockPrint>
    80004c04:	ffffc097          	auipc	ra,0xffffc
    80004c08:	758080e7          	jalr	1880(ra) # 8000135c <copy_and_swap>
    80004c0c:	fe0514e3          	bnez	a0,80004bf4 <_Z8printIntiii+0xe8>
    80004c10:	03813083          	ld	ra,56(sp)
    80004c14:	03013403          	ld	s0,48(sp)
    80004c18:	02813483          	ld	s1,40(sp)
    80004c1c:	02013903          	ld	s2,32(sp)
    80004c20:	01813983          	ld	s3,24(sp)
    80004c24:	04010113          	addi	sp,sp,64
    80004c28:	00008067          	ret

0000000080004c2c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004c2c:	fd010113          	addi	sp,sp,-48
    80004c30:	02113423          	sd	ra,40(sp)
    80004c34:	02813023          	sd	s0,32(sp)
    80004c38:	00913c23          	sd	s1,24(sp)
    80004c3c:	01213823          	sd	s2,16(sp)
    80004c40:	01313423          	sd	s3,8(sp)
    80004c44:	03010413          	addi	s0,sp,48
    80004c48:	00050493          	mv	s1,a0
    80004c4c:	00058913          	mv	s2,a1
    80004c50:	0015879b          	addiw	a5,a1,1
    80004c54:	0007851b          	sext.w	a0,a5
    80004c58:	00f4a023          	sw	a5,0(s1)
    80004c5c:	0004a823          	sw	zero,16(s1)
    80004c60:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004c64:	00251513          	slli	a0,a0,0x2
    80004c68:	ffffc097          	auipc	ra,0xffffc
    80004c6c:	714080e7          	jalr	1812(ra) # 8000137c <_Z9mem_allocm>
    80004c70:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80004c74:	01000513          	li	a0,16
    80004c78:	ffffd097          	auipc	ra,0xffffd
    80004c7c:	18c080e7          	jalr	396(ra) # 80001e04 <_Znwm>
    80004c80:	00050993          	mv	s3,a0
    80004c84:	00000593          	li	a1,0
    80004c88:	ffffd097          	auipc	ra,0xffffd
    80004c8c:	3a8080e7          	jalr	936(ra) # 80002030 <_ZN9SemaphoreC1Ej>
    80004c90:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80004c94:	01000513          	li	a0,16
    80004c98:	ffffd097          	auipc	ra,0xffffd
    80004c9c:	16c080e7          	jalr	364(ra) # 80001e04 <_Znwm>
    80004ca0:	00050993          	mv	s3,a0
    80004ca4:	00090593          	mv	a1,s2
    80004ca8:	ffffd097          	auipc	ra,0xffffd
    80004cac:	388080e7          	jalr	904(ra) # 80002030 <_ZN9SemaphoreC1Ej>
    80004cb0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80004cb4:	01000513          	li	a0,16
    80004cb8:	ffffd097          	auipc	ra,0xffffd
    80004cbc:	14c080e7          	jalr	332(ra) # 80001e04 <_Znwm>
    80004cc0:	00050913          	mv	s2,a0
    80004cc4:	00100593          	li	a1,1
    80004cc8:	ffffd097          	auipc	ra,0xffffd
    80004ccc:	368080e7          	jalr	872(ra) # 80002030 <_ZN9SemaphoreC1Ej>
    80004cd0:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80004cd4:	01000513          	li	a0,16
    80004cd8:	ffffd097          	auipc	ra,0xffffd
    80004cdc:	12c080e7          	jalr	300(ra) # 80001e04 <_Znwm>
    80004ce0:	00050913          	mv	s2,a0
    80004ce4:	00100593          	li	a1,1
    80004ce8:	ffffd097          	auipc	ra,0xffffd
    80004cec:	348080e7          	jalr	840(ra) # 80002030 <_ZN9SemaphoreC1Ej>
    80004cf0:	0324b823          	sd	s2,48(s1)
}
    80004cf4:	02813083          	ld	ra,40(sp)
    80004cf8:	02013403          	ld	s0,32(sp)
    80004cfc:	01813483          	ld	s1,24(sp)
    80004d00:	01013903          	ld	s2,16(sp)
    80004d04:	00813983          	ld	s3,8(sp)
    80004d08:	03010113          	addi	sp,sp,48
    80004d0c:	00008067          	ret
    80004d10:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80004d14:	00098513          	mv	a0,s3
    80004d18:	ffffd097          	auipc	ra,0xffffd
    80004d1c:	114080e7          	jalr	276(ra) # 80001e2c <_ZdlPv>
    80004d20:	00048513          	mv	a0,s1
    80004d24:	00006097          	auipc	ra,0x6
    80004d28:	324080e7          	jalr	804(ra) # 8000b048 <_Unwind_Resume>
    80004d2c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80004d30:	00098513          	mv	a0,s3
    80004d34:	ffffd097          	auipc	ra,0xffffd
    80004d38:	0f8080e7          	jalr	248(ra) # 80001e2c <_ZdlPv>
    80004d3c:	00048513          	mv	a0,s1
    80004d40:	00006097          	auipc	ra,0x6
    80004d44:	308080e7          	jalr	776(ra) # 8000b048 <_Unwind_Resume>
    80004d48:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80004d4c:	00090513          	mv	a0,s2
    80004d50:	ffffd097          	auipc	ra,0xffffd
    80004d54:	0dc080e7          	jalr	220(ra) # 80001e2c <_ZdlPv>
    80004d58:	00048513          	mv	a0,s1
    80004d5c:	00006097          	auipc	ra,0x6
    80004d60:	2ec080e7          	jalr	748(ra) # 8000b048 <_Unwind_Resume>
    80004d64:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80004d68:	00090513          	mv	a0,s2
    80004d6c:	ffffd097          	auipc	ra,0xffffd
    80004d70:	0c0080e7          	jalr	192(ra) # 80001e2c <_ZdlPv>
    80004d74:	00048513          	mv	a0,s1
    80004d78:	00006097          	auipc	ra,0x6
    80004d7c:	2d0080e7          	jalr	720(ra) # 8000b048 <_Unwind_Resume>

0000000080004d80 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80004d80:	fe010113          	addi	sp,sp,-32
    80004d84:	00113c23          	sd	ra,24(sp)
    80004d88:	00813823          	sd	s0,16(sp)
    80004d8c:	00913423          	sd	s1,8(sp)
    80004d90:	01213023          	sd	s2,0(sp)
    80004d94:	02010413          	addi	s0,sp,32
    80004d98:	00050493          	mv	s1,a0
    80004d9c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80004da0:	01853503          	ld	a0,24(a0)
    80004da4:	ffffd097          	auipc	ra,0xffffd
    80004da8:	2c4080e7          	jalr	708(ra) # 80002068 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80004dac:	0304b503          	ld	a0,48(s1)
    80004db0:	ffffd097          	auipc	ra,0xffffd
    80004db4:	2b8080e7          	jalr	696(ra) # 80002068 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80004db8:	0084b783          	ld	a5,8(s1)
    80004dbc:	0144a703          	lw	a4,20(s1)
    80004dc0:	00271713          	slli	a4,a4,0x2
    80004dc4:	00e787b3          	add	a5,a5,a4
    80004dc8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004dcc:	0144a783          	lw	a5,20(s1)
    80004dd0:	0017879b          	addiw	a5,a5,1
    80004dd4:	0004a703          	lw	a4,0(s1)
    80004dd8:	02e7e7bb          	remw	a5,a5,a4
    80004ddc:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80004de0:	0304b503          	ld	a0,48(s1)
    80004de4:	ffffd097          	auipc	ra,0xffffd
    80004de8:	2b0080e7          	jalr	688(ra) # 80002094 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80004dec:	0204b503          	ld	a0,32(s1)
    80004df0:	ffffd097          	auipc	ra,0xffffd
    80004df4:	2a4080e7          	jalr	676(ra) # 80002094 <_ZN9Semaphore6signalEv>

}
    80004df8:	01813083          	ld	ra,24(sp)
    80004dfc:	01013403          	ld	s0,16(sp)
    80004e00:	00813483          	ld	s1,8(sp)
    80004e04:	00013903          	ld	s2,0(sp)
    80004e08:	02010113          	addi	sp,sp,32
    80004e0c:	00008067          	ret

0000000080004e10 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80004e10:	fe010113          	addi	sp,sp,-32
    80004e14:	00113c23          	sd	ra,24(sp)
    80004e18:	00813823          	sd	s0,16(sp)
    80004e1c:	00913423          	sd	s1,8(sp)
    80004e20:	01213023          	sd	s2,0(sp)
    80004e24:	02010413          	addi	s0,sp,32
    80004e28:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80004e2c:	02053503          	ld	a0,32(a0)
    80004e30:	ffffd097          	auipc	ra,0xffffd
    80004e34:	238080e7          	jalr	568(ra) # 80002068 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80004e38:	0284b503          	ld	a0,40(s1)
    80004e3c:	ffffd097          	auipc	ra,0xffffd
    80004e40:	22c080e7          	jalr	556(ra) # 80002068 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80004e44:	0084b703          	ld	a4,8(s1)
    80004e48:	0104a783          	lw	a5,16(s1)
    80004e4c:	00279693          	slli	a3,a5,0x2
    80004e50:	00d70733          	add	a4,a4,a3
    80004e54:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004e58:	0017879b          	addiw	a5,a5,1
    80004e5c:	0004a703          	lw	a4,0(s1)
    80004e60:	02e7e7bb          	remw	a5,a5,a4
    80004e64:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80004e68:	0284b503          	ld	a0,40(s1)
    80004e6c:	ffffd097          	auipc	ra,0xffffd
    80004e70:	228080e7          	jalr	552(ra) # 80002094 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80004e74:	0184b503          	ld	a0,24(s1)
    80004e78:	ffffd097          	auipc	ra,0xffffd
    80004e7c:	21c080e7          	jalr	540(ra) # 80002094 <_ZN9Semaphore6signalEv>

    return ret;
}
    80004e80:	00090513          	mv	a0,s2
    80004e84:	01813083          	ld	ra,24(sp)
    80004e88:	01013403          	ld	s0,16(sp)
    80004e8c:	00813483          	ld	s1,8(sp)
    80004e90:	00013903          	ld	s2,0(sp)
    80004e94:	02010113          	addi	sp,sp,32
    80004e98:	00008067          	ret

0000000080004e9c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80004e9c:	fe010113          	addi	sp,sp,-32
    80004ea0:	00113c23          	sd	ra,24(sp)
    80004ea4:	00813823          	sd	s0,16(sp)
    80004ea8:	00913423          	sd	s1,8(sp)
    80004eac:	01213023          	sd	s2,0(sp)
    80004eb0:	02010413          	addi	s0,sp,32
    80004eb4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004eb8:	02853503          	ld	a0,40(a0)
    80004ebc:	ffffd097          	auipc	ra,0xffffd
    80004ec0:	1ac080e7          	jalr	428(ra) # 80002068 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80004ec4:	0304b503          	ld	a0,48(s1)
    80004ec8:	ffffd097          	auipc	ra,0xffffd
    80004ecc:	1a0080e7          	jalr	416(ra) # 80002068 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80004ed0:	0144a783          	lw	a5,20(s1)
    80004ed4:	0104a903          	lw	s2,16(s1)
    80004ed8:	0327ce63          	blt	a5,s2,80004f14 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80004edc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80004ee0:	0304b503          	ld	a0,48(s1)
    80004ee4:	ffffd097          	auipc	ra,0xffffd
    80004ee8:	1b0080e7          	jalr	432(ra) # 80002094 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80004eec:	0284b503          	ld	a0,40(s1)
    80004ef0:	ffffd097          	auipc	ra,0xffffd
    80004ef4:	1a4080e7          	jalr	420(ra) # 80002094 <_ZN9Semaphore6signalEv>

    return ret;
}
    80004ef8:	00090513          	mv	a0,s2
    80004efc:	01813083          	ld	ra,24(sp)
    80004f00:	01013403          	ld	s0,16(sp)
    80004f04:	00813483          	ld	s1,8(sp)
    80004f08:	00013903          	ld	s2,0(sp)
    80004f0c:	02010113          	addi	sp,sp,32
    80004f10:	00008067          	ret
        ret = cap - head + tail;
    80004f14:	0004a703          	lw	a4,0(s1)
    80004f18:	4127093b          	subw	s2,a4,s2
    80004f1c:	00f9093b          	addw	s2,s2,a5
    80004f20:	fc1ff06f          	j	80004ee0 <_ZN9BufferCPP6getCntEv+0x44>

0000000080004f24 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80004f24:	fe010113          	addi	sp,sp,-32
    80004f28:	00113c23          	sd	ra,24(sp)
    80004f2c:	00813823          	sd	s0,16(sp)
    80004f30:	00913423          	sd	s1,8(sp)
    80004f34:	02010413          	addi	s0,sp,32
    80004f38:	00050493          	mv	s1,a0
    Console::putc('\n');
    80004f3c:	00a00513          	li	a0,10
    80004f40:	ffffd097          	auipc	ra,0xffffd
    80004f44:	1d4080e7          	jalr	468(ra) # 80002114 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80004f48:	00003517          	auipc	a0,0x3
    80004f4c:	3a850513          	addi	a0,a0,936 # 800082f0 <CONSOLE_STATUS+0x2e0>
    80004f50:	00000097          	auipc	ra,0x0
    80004f54:	a0c080e7          	jalr	-1524(ra) # 8000495c <_Z11printStringPKc>
    while (getCnt()) {
    80004f58:	00048513          	mv	a0,s1
    80004f5c:	00000097          	auipc	ra,0x0
    80004f60:	f40080e7          	jalr	-192(ra) # 80004e9c <_ZN9BufferCPP6getCntEv>
    80004f64:	02050c63          	beqz	a0,80004f9c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004f68:	0084b783          	ld	a5,8(s1)
    80004f6c:	0104a703          	lw	a4,16(s1)
    80004f70:	00271713          	slli	a4,a4,0x2
    80004f74:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80004f78:	0007c503          	lbu	a0,0(a5)
    80004f7c:	ffffd097          	auipc	ra,0xffffd
    80004f80:	198080e7          	jalr	408(ra) # 80002114 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80004f84:	0104a783          	lw	a5,16(s1)
    80004f88:	0017879b          	addiw	a5,a5,1
    80004f8c:	0004a703          	lw	a4,0(s1)
    80004f90:	02e7e7bb          	remw	a5,a5,a4
    80004f94:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004f98:	fc1ff06f          	j	80004f58 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80004f9c:	02100513          	li	a0,33
    80004fa0:	ffffd097          	auipc	ra,0xffffd
    80004fa4:	174080e7          	jalr	372(ra) # 80002114 <_ZN7Console4putcEc>
    Console::putc('\n');
    80004fa8:	00a00513          	li	a0,10
    80004fac:	ffffd097          	auipc	ra,0xffffd
    80004fb0:	168080e7          	jalr	360(ra) # 80002114 <_ZN7Console4putcEc>
    mem_free(buffer);
    80004fb4:	0084b503          	ld	a0,8(s1)
    80004fb8:	ffffc097          	auipc	ra,0xffffc
    80004fbc:	400080e7          	jalr	1024(ra) # 800013b8 <_Z8mem_freePv>
    delete itemAvailable;
    80004fc0:	0204b503          	ld	a0,32(s1)
    80004fc4:	00050863          	beqz	a0,80004fd4 <_ZN9BufferCPPD1Ev+0xb0>
    80004fc8:	00053783          	ld	a5,0(a0)
    80004fcc:	0087b783          	ld	a5,8(a5)
    80004fd0:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004fd4:	0184b503          	ld	a0,24(s1)
    80004fd8:	00050863          	beqz	a0,80004fe8 <_ZN9BufferCPPD1Ev+0xc4>
    80004fdc:	00053783          	ld	a5,0(a0)
    80004fe0:	0087b783          	ld	a5,8(a5)
    80004fe4:	000780e7          	jalr	a5
    delete mutexTail;
    80004fe8:	0304b503          	ld	a0,48(s1)
    80004fec:	00050863          	beqz	a0,80004ffc <_ZN9BufferCPPD1Ev+0xd8>
    80004ff0:	00053783          	ld	a5,0(a0)
    80004ff4:	0087b783          	ld	a5,8(a5)
    80004ff8:	000780e7          	jalr	a5
    delete mutexHead;
    80004ffc:	0284b503          	ld	a0,40(s1)
    80005000:	00050863          	beqz	a0,80005010 <_ZN9BufferCPPD1Ev+0xec>
    80005004:	00053783          	ld	a5,0(a0)
    80005008:	0087b783          	ld	a5,8(a5)
    8000500c:	000780e7          	jalr	a5
}
    80005010:	01813083          	ld	ra,24(sp)
    80005014:	01013403          	ld	s0,16(sp)
    80005018:	00813483          	ld	s1,8(sp)
    8000501c:	02010113          	addi	sp,sp,32
    80005020:	00008067          	ret

0000000080005024 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005024:	fe010113          	addi	sp,sp,-32
    80005028:	00113c23          	sd	ra,24(sp)
    8000502c:	00813823          	sd	s0,16(sp)
    80005030:	00913423          	sd	s1,8(sp)
    80005034:	01213023          	sd	s2,0(sp)
    80005038:	02010413          	addi	s0,sp,32
    8000503c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005040:	00100793          	li	a5,1
    80005044:	02a7f863          	bgeu	a5,a0,80005074 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005048:	00a00793          	li	a5,10
    8000504c:	02f577b3          	remu	a5,a0,a5
    80005050:	02078e63          	beqz	a5,8000508c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005054:	fff48513          	addi	a0,s1,-1
    80005058:	00000097          	auipc	ra,0x0
    8000505c:	fcc080e7          	jalr	-52(ra) # 80005024 <_ZL9fibonaccim>
    80005060:	00050913          	mv	s2,a0
    80005064:	ffe48513          	addi	a0,s1,-2
    80005068:	00000097          	auipc	ra,0x0
    8000506c:	fbc080e7          	jalr	-68(ra) # 80005024 <_ZL9fibonaccim>
    80005070:	00a90533          	add	a0,s2,a0
}
    80005074:	01813083          	ld	ra,24(sp)
    80005078:	01013403          	ld	s0,16(sp)
    8000507c:	00813483          	ld	s1,8(sp)
    80005080:	00013903          	ld	s2,0(sp)
    80005084:	02010113          	addi	sp,sp,32
    80005088:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000508c:	ffffc097          	auipc	ra,0xffffc
    80005090:	418080e7          	jalr	1048(ra) # 800014a4 <_Z15thread_dispatchv>
    80005094:	fc1ff06f          	j	80005054 <_ZL9fibonaccim+0x30>

0000000080005098 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005098:	fe010113          	addi	sp,sp,-32
    8000509c:	00113c23          	sd	ra,24(sp)
    800050a0:	00813823          	sd	s0,16(sp)
    800050a4:	00913423          	sd	s1,8(sp)
    800050a8:	01213023          	sd	s2,0(sp)
    800050ac:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800050b0:	00a00493          	li	s1,10
    800050b4:	0400006f          	j	800050f4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800050b8:	00003517          	auipc	a0,0x3
    800050bc:	1a050513          	addi	a0,a0,416 # 80008258 <CONSOLE_STATUS+0x248>
    800050c0:	00000097          	auipc	ra,0x0
    800050c4:	89c080e7          	jalr	-1892(ra) # 8000495c <_Z11printStringPKc>
    800050c8:	00000613          	li	a2,0
    800050cc:	00a00593          	li	a1,10
    800050d0:	00048513          	mv	a0,s1
    800050d4:	00000097          	auipc	ra,0x0
    800050d8:	a38080e7          	jalr	-1480(ra) # 80004b0c <_Z8printIntiii>
    800050dc:	00003517          	auipc	a0,0x3
    800050e0:	02c50513          	addi	a0,a0,44 # 80008108 <CONSOLE_STATUS+0xf8>
    800050e4:	00000097          	auipc	ra,0x0
    800050e8:	878080e7          	jalr	-1928(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800050ec:	0014849b          	addiw	s1,s1,1
    800050f0:	0ff4f493          	andi	s1,s1,255
    800050f4:	00c00793          	li	a5,12
    800050f8:	fc97f0e3          	bgeu	a5,s1,800050b8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800050fc:	00003517          	auipc	a0,0x3
    80005100:	16450513          	addi	a0,a0,356 # 80008260 <CONSOLE_STATUS+0x250>
    80005104:	00000097          	auipc	ra,0x0
    80005108:	858080e7          	jalr	-1960(ra) # 8000495c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000510c:	00500313          	li	t1,5
    thread_dispatch();
    80005110:	ffffc097          	auipc	ra,0xffffc
    80005114:	394080e7          	jalr	916(ra) # 800014a4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005118:	01000513          	li	a0,16
    8000511c:	00000097          	auipc	ra,0x0
    80005120:	f08080e7          	jalr	-248(ra) # 80005024 <_ZL9fibonaccim>
    80005124:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005128:	00003517          	auipc	a0,0x3
    8000512c:	14850513          	addi	a0,a0,328 # 80008270 <CONSOLE_STATUS+0x260>
    80005130:	00000097          	auipc	ra,0x0
    80005134:	82c080e7          	jalr	-2004(ra) # 8000495c <_Z11printStringPKc>
    80005138:	00000613          	li	a2,0
    8000513c:	00a00593          	li	a1,10
    80005140:	0009051b          	sext.w	a0,s2
    80005144:	00000097          	auipc	ra,0x0
    80005148:	9c8080e7          	jalr	-1592(ra) # 80004b0c <_Z8printIntiii>
    8000514c:	00003517          	auipc	a0,0x3
    80005150:	fbc50513          	addi	a0,a0,-68 # 80008108 <CONSOLE_STATUS+0xf8>
    80005154:	00000097          	auipc	ra,0x0
    80005158:	808080e7          	jalr	-2040(ra) # 8000495c <_Z11printStringPKc>
    8000515c:	0400006f          	j	8000519c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005160:	00003517          	auipc	a0,0x3
    80005164:	0f850513          	addi	a0,a0,248 # 80008258 <CONSOLE_STATUS+0x248>
    80005168:	fffff097          	auipc	ra,0xfffff
    8000516c:	7f4080e7          	jalr	2036(ra) # 8000495c <_Z11printStringPKc>
    80005170:	00000613          	li	a2,0
    80005174:	00a00593          	li	a1,10
    80005178:	00048513          	mv	a0,s1
    8000517c:	00000097          	auipc	ra,0x0
    80005180:	990080e7          	jalr	-1648(ra) # 80004b0c <_Z8printIntiii>
    80005184:	00003517          	auipc	a0,0x3
    80005188:	f8450513          	addi	a0,a0,-124 # 80008108 <CONSOLE_STATUS+0xf8>
    8000518c:	fffff097          	auipc	ra,0xfffff
    80005190:	7d0080e7          	jalr	2000(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005194:	0014849b          	addiw	s1,s1,1
    80005198:	0ff4f493          	andi	s1,s1,255
    8000519c:	00f00793          	li	a5,15
    800051a0:	fc97f0e3          	bgeu	a5,s1,80005160 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800051a4:	00003517          	auipc	a0,0x3
    800051a8:	0dc50513          	addi	a0,a0,220 # 80008280 <CONSOLE_STATUS+0x270>
    800051ac:	fffff097          	auipc	ra,0xfffff
    800051b0:	7b0080e7          	jalr	1968(ra) # 8000495c <_Z11printStringPKc>
    finishedD = true;
    800051b4:	00100793          	li	a5,1
    800051b8:	00005717          	auipc	a4,0x5
    800051bc:	dcf70023          	sb	a5,-576(a4) # 80009f78 <_ZL9finishedD>
    thread_dispatch();
    800051c0:	ffffc097          	auipc	ra,0xffffc
    800051c4:	2e4080e7          	jalr	740(ra) # 800014a4 <_Z15thread_dispatchv>
}
    800051c8:	01813083          	ld	ra,24(sp)
    800051cc:	01013403          	ld	s0,16(sp)
    800051d0:	00813483          	ld	s1,8(sp)
    800051d4:	00013903          	ld	s2,0(sp)
    800051d8:	02010113          	addi	sp,sp,32
    800051dc:	00008067          	ret

00000000800051e0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800051e0:	fe010113          	addi	sp,sp,-32
    800051e4:	00113c23          	sd	ra,24(sp)
    800051e8:	00813823          	sd	s0,16(sp)
    800051ec:	00913423          	sd	s1,8(sp)
    800051f0:	01213023          	sd	s2,0(sp)
    800051f4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800051f8:	00000493          	li	s1,0
    800051fc:	0400006f          	j	8000523c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005200:	00003517          	auipc	a0,0x3
    80005204:	02850513          	addi	a0,a0,40 # 80008228 <CONSOLE_STATUS+0x218>
    80005208:	fffff097          	auipc	ra,0xfffff
    8000520c:	754080e7          	jalr	1876(ra) # 8000495c <_Z11printStringPKc>
    80005210:	00000613          	li	a2,0
    80005214:	00a00593          	li	a1,10
    80005218:	00048513          	mv	a0,s1
    8000521c:	00000097          	auipc	ra,0x0
    80005220:	8f0080e7          	jalr	-1808(ra) # 80004b0c <_Z8printIntiii>
    80005224:	00003517          	auipc	a0,0x3
    80005228:	ee450513          	addi	a0,a0,-284 # 80008108 <CONSOLE_STATUS+0xf8>
    8000522c:	fffff097          	auipc	ra,0xfffff
    80005230:	730080e7          	jalr	1840(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005234:	0014849b          	addiw	s1,s1,1
    80005238:	0ff4f493          	andi	s1,s1,255
    8000523c:	00200793          	li	a5,2
    80005240:	fc97f0e3          	bgeu	a5,s1,80005200 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005244:	00003517          	auipc	a0,0x3
    80005248:	fec50513          	addi	a0,a0,-20 # 80008230 <CONSOLE_STATUS+0x220>
    8000524c:	fffff097          	auipc	ra,0xfffff
    80005250:	710080e7          	jalr	1808(ra) # 8000495c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005254:	00700313          	li	t1,7
    thread_dispatch();
    80005258:	ffffc097          	auipc	ra,0xffffc
    8000525c:	24c080e7          	jalr	588(ra) # 800014a4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005260:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005264:	00003517          	auipc	a0,0x3
    80005268:	fdc50513          	addi	a0,a0,-36 # 80008240 <CONSOLE_STATUS+0x230>
    8000526c:	fffff097          	auipc	ra,0xfffff
    80005270:	6f0080e7          	jalr	1776(ra) # 8000495c <_Z11printStringPKc>
    80005274:	00000613          	li	a2,0
    80005278:	00a00593          	li	a1,10
    8000527c:	0009051b          	sext.w	a0,s2
    80005280:	00000097          	auipc	ra,0x0
    80005284:	88c080e7          	jalr	-1908(ra) # 80004b0c <_Z8printIntiii>
    80005288:	00003517          	auipc	a0,0x3
    8000528c:	e8050513          	addi	a0,a0,-384 # 80008108 <CONSOLE_STATUS+0xf8>
    80005290:	fffff097          	auipc	ra,0xfffff
    80005294:	6cc080e7          	jalr	1740(ra) # 8000495c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005298:	00c00513          	li	a0,12
    8000529c:	00000097          	auipc	ra,0x0
    800052a0:	d88080e7          	jalr	-632(ra) # 80005024 <_ZL9fibonaccim>
    800052a4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800052a8:	00003517          	auipc	a0,0x3
    800052ac:	fa050513          	addi	a0,a0,-96 # 80008248 <CONSOLE_STATUS+0x238>
    800052b0:	fffff097          	auipc	ra,0xfffff
    800052b4:	6ac080e7          	jalr	1708(ra) # 8000495c <_Z11printStringPKc>
    800052b8:	00000613          	li	a2,0
    800052bc:	00a00593          	li	a1,10
    800052c0:	0009051b          	sext.w	a0,s2
    800052c4:	00000097          	auipc	ra,0x0
    800052c8:	848080e7          	jalr	-1976(ra) # 80004b0c <_Z8printIntiii>
    800052cc:	00003517          	auipc	a0,0x3
    800052d0:	e3c50513          	addi	a0,a0,-452 # 80008108 <CONSOLE_STATUS+0xf8>
    800052d4:	fffff097          	auipc	ra,0xfffff
    800052d8:	688080e7          	jalr	1672(ra) # 8000495c <_Z11printStringPKc>
    800052dc:	0400006f          	j	8000531c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800052e0:	00003517          	auipc	a0,0x3
    800052e4:	f4850513          	addi	a0,a0,-184 # 80008228 <CONSOLE_STATUS+0x218>
    800052e8:	fffff097          	auipc	ra,0xfffff
    800052ec:	674080e7          	jalr	1652(ra) # 8000495c <_Z11printStringPKc>
    800052f0:	00000613          	li	a2,0
    800052f4:	00a00593          	li	a1,10
    800052f8:	00048513          	mv	a0,s1
    800052fc:	00000097          	auipc	ra,0x0
    80005300:	810080e7          	jalr	-2032(ra) # 80004b0c <_Z8printIntiii>
    80005304:	00003517          	auipc	a0,0x3
    80005308:	e0450513          	addi	a0,a0,-508 # 80008108 <CONSOLE_STATUS+0xf8>
    8000530c:	fffff097          	auipc	ra,0xfffff
    80005310:	650080e7          	jalr	1616(ra) # 8000495c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005314:	0014849b          	addiw	s1,s1,1
    80005318:	0ff4f493          	andi	s1,s1,255
    8000531c:	00500793          	li	a5,5
    80005320:	fc97f0e3          	bgeu	a5,s1,800052e0 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80005324:	00003517          	auipc	a0,0x3
    80005328:	edc50513          	addi	a0,a0,-292 # 80008200 <CONSOLE_STATUS+0x1f0>
    8000532c:	fffff097          	auipc	ra,0xfffff
    80005330:	630080e7          	jalr	1584(ra) # 8000495c <_Z11printStringPKc>
    finishedC = true;
    80005334:	00100793          	li	a5,1
    80005338:	00005717          	auipc	a4,0x5
    8000533c:	c4f700a3          	sb	a5,-959(a4) # 80009f79 <_ZL9finishedC>
    thread_dispatch();
    80005340:	ffffc097          	auipc	ra,0xffffc
    80005344:	164080e7          	jalr	356(ra) # 800014a4 <_Z15thread_dispatchv>
}
    80005348:	01813083          	ld	ra,24(sp)
    8000534c:	01013403          	ld	s0,16(sp)
    80005350:	00813483          	ld	s1,8(sp)
    80005354:	00013903          	ld	s2,0(sp)
    80005358:	02010113          	addi	sp,sp,32
    8000535c:	00008067          	ret

0000000080005360 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005360:	fe010113          	addi	sp,sp,-32
    80005364:	00113c23          	sd	ra,24(sp)
    80005368:	00813823          	sd	s0,16(sp)
    8000536c:	00913423          	sd	s1,8(sp)
    80005370:	01213023          	sd	s2,0(sp)
    80005374:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005378:	00000913          	li	s2,0
    8000537c:	0400006f          	j	800053bc <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80005380:	ffffc097          	auipc	ra,0xffffc
    80005384:	124080e7          	jalr	292(ra) # 800014a4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005388:	00148493          	addi	s1,s1,1
    8000538c:	000027b7          	lui	a5,0x2
    80005390:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005394:	0097ee63          	bltu	a5,s1,800053b0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005398:	00000713          	li	a4,0
    8000539c:	000077b7          	lui	a5,0x7
    800053a0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800053a4:	fce7eee3          	bltu	a5,a4,80005380 <_ZL11workerBodyBPv+0x20>
    800053a8:	00170713          	addi	a4,a4,1
    800053ac:	ff1ff06f          	j	8000539c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800053b0:	00a00793          	li	a5,10
    800053b4:	04f90663          	beq	s2,a5,80005400 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800053b8:	00190913          	addi	s2,s2,1
    800053bc:	00f00793          	li	a5,15
    800053c0:	0527e463          	bltu	a5,s2,80005408 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800053c4:	00003517          	auipc	a0,0x3
    800053c8:	e4c50513          	addi	a0,a0,-436 # 80008210 <CONSOLE_STATUS+0x200>
    800053cc:	fffff097          	auipc	ra,0xfffff
    800053d0:	590080e7          	jalr	1424(ra) # 8000495c <_Z11printStringPKc>
    800053d4:	00000613          	li	a2,0
    800053d8:	00a00593          	li	a1,10
    800053dc:	0009051b          	sext.w	a0,s2
    800053e0:	fffff097          	auipc	ra,0xfffff
    800053e4:	72c080e7          	jalr	1836(ra) # 80004b0c <_Z8printIntiii>
    800053e8:	00003517          	auipc	a0,0x3
    800053ec:	d2050513          	addi	a0,a0,-736 # 80008108 <CONSOLE_STATUS+0xf8>
    800053f0:	fffff097          	auipc	ra,0xfffff
    800053f4:	56c080e7          	jalr	1388(ra) # 8000495c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800053f8:	00000493          	li	s1,0
    800053fc:	f91ff06f          	j	8000538c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80005400:	14102ff3          	csrr	t6,sepc
    80005404:	fb5ff06f          	j	800053b8 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80005408:	00003517          	auipc	a0,0x3
    8000540c:	e1050513          	addi	a0,a0,-496 # 80008218 <CONSOLE_STATUS+0x208>
    80005410:	fffff097          	auipc	ra,0xfffff
    80005414:	54c080e7          	jalr	1356(ra) # 8000495c <_Z11printStringPKc>
    finishedB = true;
    80005418:	00100793          	li	a5,1
    8000541c:	00005717          	auipc	a4,0x5
    80005420:	b4f70f23          	sb	a5,-1186(a4) # 80009f7a <_ZL9finishedB>
    thread_dispatch();
    80005424:	ffffc097          	auipc	ra,0xffffc
    80005428:	080080e7          	jalr	128(ra) # 800014a4 <_Z15thread_dispatchv>
}
    8000542c:	01813083          	ld	ra,24(sp)
    80005430:	01013403          	ld	s0,16(sp)
    80005434:	00813483          	ld	s1,8(sp)
    80005438:	00013903          	ld	s2,0(sp)
    8000543c:	02010113          	addi	sp,sp,32
    80005440:	00008067          	ret

0000000080005444 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005444:	fe010113          	addi	sp,sp,-32
    80005448:	00113c23          	sd	ra,24(sp)
    8000544c:	00813823          	sd	s0,16(sp)
    80005450:	00913423          	sd	s1,8(sp)
    80005454:	01213023          	sd	s2,0(sp)
    80005458:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000545c:	00000913          	li	s2,0
    80005460:	0380006f          	j	80005498 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005464:	ffffc097          	auipc	ra,0xffffc
    80005468:	040080e7          	jalr	64(ra) # 800014a4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000546c:	00148493          	addi	s1,s1,1
    80005470:	000027b7          	lui	a5,0x2
    80005474:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005478:	0097ee63          	bltu	a5,s1,80005494 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000547c:	00000713          	li	a4,0
    80005480:	000077b7          	lui	a5,0x7
    80005484:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005488:	fce7eee3          	bltu	a5,a4,80005464 <_ZL11workerBodyAPv+0x20>
    8000548c:	00170713          	addi	a4,a4,1
    80005490:	ff1ff06f          	j	80005480 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005494:	00190913          	addi	s2,s2,1
    80005498:	00900793          	li	a5,9
    8000549c:	0527e063          	bltu	a5,s2,800054dc <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800054a0:	00003517          	auipc	a0,0x3
    800054a4:	d5850513          	addi	a0,a0,-680 # 800081f8 <CONSOLE_STATUS+0x1e8>
    800054a8:	fffff097          	auipc	ra,0xfffff
    800054ac:	4b4080e7          	jalr	1204(ra) # 8000495c <_Z11printStringPKc>
    800054b0:	00000613          	li	a2,0
    800054b4:	00a00593          	li	a1,10
    800054b8:	0009051b          	sext.w	a0,s2
    800054bc:	fffff097          	auipc	ra,0xfffff
    800054c0:	650080e7          	jalr	1616(ra) # 80004b0c <_Z8printIntiii>
    800054c4:	00003517          	auipc	a0,0x3
    800054c8:	c4450513          	addi	a0,a0,-956 # 80008108 <CONSOLE_STATUS+0xf8>
    800054cc:	fffff097          	auipc	ra,0xfffff
    800054d0:	490080e7          	jalr	1168(ra) # 8000495c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800054d4:	00000493          	li	s1,0
    800054d8:	f99ff06f          	j	80005470 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800054dc:	00003517          	auipc	a0,0x3
    800054e0:	d2450513          	addi	a0,a0,-732 # 80008200 <CONSOLE_STATUS+0x1f0>
    800054e4:	fffff097          	auipc	ra,0xfffff
    800054e8:	478080e7          	jalr	1144(ra) # 8000495c <_Z11printStringPKc>
    finishedA = true;
    800054ec:	00100793          	li	a5,1
    800054f0:	00005717          	auipc	a4,0x5
    800054f4:	a8f705a3          	sb	a5,-1397(a4) # 80009f7b <_ZL9finishedA>
}
    800054f8:	01813083          	ld	ra,24(sp)
    800054fc:	01013403          	ld	s0,16(sp)
    80005500:	00813483          	ld	s1,8(sp)
    80005504:	00013903          	ld	s2,0(sp)
    80005508:	02010113          	addi	sp,sp,32
    8000550c:	00008067          	ret

0000000080005510 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005510:	fd010113          	addi	sp,sp,-48
    80005514:	02113423          	sd	ra,40(sp)
    80005518:	02813023          	sd	s0,32(sp)
    8000551c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005520:	00000613          	li	a2,0
    80005524:	00000597          	auipc	a1,0x0
    80005528:	f2058593          	addi	a1,a1,-224 # 80005444 <_ZL11workerBodyAPv>
    8000552c:	fd040513          	addi	a0,s0,-48
    80005530:	ffffc097          	auipc	ra,0xffffc
    80005534:	ec0080e7          	jalr	-320(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80005538:	00003517          	auipc	a0,0x3
    8000553c:	d5850513          	addi	a0,a0,-680 # 80008290 <CONSOLE_STATUS+0x280>
    80005540:	fffff097          	auipc	ra,0xfffff
    80005544:	41c080e7          	jalr	1052(ra) # 8000495c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005548:	00000613          	li	a2,0
    8000554c:	00000597          	auipc	a1,0x0
    80005550:	e1458593          	addi	a1,a1,-492 # 80005360 <_ZL11workerBodyBPv>
    80005554:	fd840513          	addi	a0,s0,-40
    80005558:	ffffc097          	auipc	ra,0xffffc
    8000555c:	e98080e7          	jalr	-360(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80005560:	00003517          	auipc	a0,0x3
    80005564:	d4850513          	addi	a0,a0,-696 # 800082a8 <CONSOLE_STATUS+0x298>
    80005568:	fffff097          	auipc	ra,0xfffff
    8000556c:	3f4080e7          	jalr	1012(ra) # 8000495c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005570:	00000613          	li	a2,0
    80005574:	00000597          	auipc	a1,0x0
    80005578:	c6c58593          	addi	a1,a1,-916 # 800051e0 <_ZL11workerBodyCPv>
    8000557c:	fe040513          	addi	a0,s0,-32
    80005580:	ffffc097          	auipc	ra,0xffffc
    80005584:	e70080e7          	jalr	-400(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80005588:	00003517          	auipc	a0,0x3
    8000558c:	d3850513          	addi	a0,a0,-712 # 800082c0 <CONSOLE_STATUS+0x2b0>
    80005590:	fffff097          	auipc	ra,0xfffff
    80005594:	3cc080e7          	jalr	972(ra) # 8000495c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005598:	00000613          	li	a2,0
    8000559c:	00000597          	auipc	a1,0x0
    800055a0:	afc58593          	addi	a1,a1,-1284 # 80005098 <_ZL11workerBodyDPv>
    800055a4:	fe840513          	addi	a0,s0,-24
    800055a8:	ffffc097          	auipc	ra,0xffffc
    800055ac:	e48080e7          	jalr	-440(ra) # 800013f0 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    800055b0:	00003517          	auipc	a0,0x3
    800055b4:	d2850513          	addi	a0,a0,-728 # 800082d8 <CONSOLE_STATUS+0x2c8>
    800055b8:	fffff097          	auipc	ra,0xfffff
    800055bc:	3a4080e7          	jalr	932(ra) # 8000495c <_Z11printStringPKc>
    800055c0:	00c0006f          	j	800055cc <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800055c4:	ffffc097          	auipc	ra,0xffffc
    800055c8:	ee0080e7          	jalr	-288(ra) # 800014a4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800055cc:	00005797          	auipc	a5,0x5
    800055d0:	9af7c783          	lbu	a5,-1617(a5) # 80009f7b <_ZL9finishedA>
    800055d4:	fe0788e3          	beqz	a5,800055c4 <_Z16System_Mode_testv+0xb4>
    800055d8:	00005797          	auipc	a5,0x5
    800055dc:	9a27c783          	lbu	a5,-1630(a5) # 80009f7a <_ZL9finishedB>
    800055e0:	fe0782e3          	beqz	a5,800055c4 <_Z16System_Mode_testv+0xb4>
    800055e4:	00005797          	auipc	a5,0x5
    800055e8:	9957c783          	lbu	a5,-1643(a5) # 80009f79 <_ZL9finishedC>
    800055ec:	fc078ce3          	beqz	a5,800055c4 <_Z16System_Mode_testv+0xb4>
    800055f0:	00005797          	auipc	a5,0x5
    800055f4:	9887c783          	lbu	a5,-1656(a5) # 80009f78 <_ZL9finishedD>
    800055f8:	fc0786e3          	beqz	a5,800055c4 <_Z16System_Mode_testv+0xb4>
    }

}
    800055fc:	02813083          	ld	ra,40(sp)
    80005600:	02013403          	ld	s0,32(sp)
    80005604:	03010113          	addi	sp,sp,48
    80005608:	00008067          	ret

000000008000560c <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000560c:	fe010113          	addi	sp,sp,-32
    80005610:	00113c23          	sd	ra,24(sp)
    80005614:	00813823          	sd	s0,16(sp)
    80005618:	00913423          	sd	s1,8(sp)
    8000561c:	01213023          	sd	s2,0(sp)
    80005620:	02010413          	addi	s0,sp,32
    80005624:	00050493          	mv	s1,a0
    80005628:	00058913          	mv	s2,a1
    8000562c:	0015879b          	addiw	a5,a1,1
    80005630:	0007851b          	sext.w	a0,a5
    80005634:	00f4a023          	sw	a5,0(s1)
    80005638:	0004a823          	sw	zero,16(s1)
    8000563c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005640:	00251513          	slli	a0,a0,0x2
    80005644:	ffffc097          	auipc	ra,0xffffc
    80005648:	d38080e7          	jalr	-712(ra) # 8000137c <_Z9mem_allocm>
    8000564c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80005650:	00000593          	li	a1,0
    80005654:	02048513          	addi	a0,s1,32
    80005658:	ffffc097          	auipc	ra,0xffffc
    8000565c:	e98080e7          	jalr	-360(ra) # 800014f0 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80005660:	00090593          	mv	a1,s2
    80005664:	01848513          	addi	a0,s1,24
    80005668:	ffffc097          	auipc	ra,0xffffc
    8000566c:	e88080e7          	jalr	-376(ra) # 800014f0 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80005670:	00100593          	li	a1,1
    80005674:	02848513          	addi	a0,s1,40
    80005678:	ffffc097          	auipc	ra,0xffffc
    8000567c:	e78080e7          	jalr	-392(ra) # 800014f0 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80005680:	00100593          	li	a1,1
    80005684:	03048513          	addi	a0,s1,48
    80005688:	ffffc097          	auipc	ra,0xffffc
    8000568c:	e68080e7          	jalr	-408(ra) # 800014f0 <_Z8sem_openPP4_semj>
}
    80005690:	01813083          	ld	ra,24(sp)
    80005694:	01013403          	ld	s0,16(sp)
    80005698:	00813483          	ld	s1,8(sp)
    8000569c:	00013903          	ld	s2,0(sp)
    800056a0:	02010113          	addi	sp,sp,32
    800056a4:	00008067          	ret

00000000800056a8 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800056a8:	fe010113          	addi	sp,sp,-32
    800056ac:	00113c23          	sd	ra,24(sp)
    800056b0:	00813823          	sd	s0,16(sp)
    800056b4:	00913423          	sd	s1,8(sp)
    800056b8:	01213023          	sd	s2,0(sp)
    800056bc:	02010413          	addi	s0,sp,32
    800056c0:	00050493          	mv	s1,a0
    800056c4:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800056c8:	01853503          	ld	a0,24(a0)
    800056cc:	ffffc097          	auipc	ra,0xffffc
    800056d0:	ea0080e7          	jalr	-352(ra) # 8000156c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    800056d4:	0304b503          	ld	a0,48(s1)
    800056d8:	ffffc097          	auipc	ra,0xffffc
    800056dc:	e94080e7          	jalr	-364(ra) # 8000156c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    800056e0:	0084b783          	ld	a5,8(s1)
    800056e4:	0144a703          	lw	a4,20(s1)
    800056e8:	00271713          	slli	a4,a4,0x2
    800056ec:	00e787b3          	add	a5,a5,a4
    800056f0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800056f4:	0144a783          	lw	a5,20(s1)
    800056f8:	0017879b          	addiw	a5,a5,1
    800056fc:	0004a703          	lw	a4,0(s1)
    80005700:	02e7e7bb          	remw	a5,a5,a4
    80005704:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005708:	0304b503          	ld	a0,48(s1)
    8000570c:	ffffc097          	auipc	ra,0xffffc
    80005710:	e98080e7          	jalr	-360(ra) # 800015a4 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80005714:	0204b503          	ld	a0,32(s1)
    80005718:	ffffc097          	auipc	ra,0xffffc
    8000571c:	e8c080e7          	jalr	-372(ra) # 800015a4 <_Z10sem_signalP4_sem>

}
    80005720:	01813083          	ld	ra,24(sp)
    80005724:	01013403          	ld	s0,16(sp)
    80005728:	00813483          	ld	s1,8(sp)
    8000572c:	00013903          	ld	s2,0(sp)
    80005730:	02010113          	addi	sp,sp,32
    80005734:	00008067          	ret

0000000080005738 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80005738:	fe010113          	addi	sp,sp,-32
    8000573c:	00113c23          	sd	ra,24(sp)
    80005740:	00813823          	sd	s0,16(sp)
    80005744:	00913423          	sd	s1,8(sp)
    80005748:	01213023          	sd	s2,0(sp)
    8000574c:	02010413          	addi	s0,sp,32
    80005750:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80005754:	02053503          	ld	a0,32(a0)
    80005758:	ffffc097          	auipc	ra,0xffffc
    8000575c:	e14080e7          	jalr	-492(ra) # 8000156c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80005760:	0284b503          	ld	a0,40(s1)
    80005764:	ffffc097          	auipc	ra,0xffffc
    80005768:	e08080e7          	jalr	-504(ra) # 8000156c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    8000576c:	0084b703          	ld	a4,8(s1)
    80005770:	0104a783          	lw	a5,16(s1)
    80005774:	00279693          	slli	a3,a5,0x2
    80005778:	00d70733          	add	a4,a4,a3
    8000577c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005780:	0017879b          	addiw	a5,a5,1
    80005784:	0004a703          	lw	a4,0(s1)
    80005788:	02e7e7bb          	remw	a5,a5,a4
    8000578c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005790:	0284b503          	ld	a0,40(s1)
    80005794:	ffffc097          	auipc	ra,0xffffc
    80005798:	e10080e7          	jalr	-496(ra) # 800015a4 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    8000579c:	0184b503          	ld	a0,24(s1)
    800057a0:	ffffc097          	auipc	ra,0xffffc
    800057a4:	e04080e7          	jalr	-508(ra) # 800015a4 <_Z10sem_signalP4_sem>

    return ret;
}
    800057a8:	00090513          	mv	a0,s2
    800057ac:	01813083          	ld	ra,24(sp)
    800057b0:	01013403          	ld	s0,16(sp)
    800057b4:	00813483          	ld	s1,8(sp)
    800057b8:	00013903          	ld	s2,0(sp)
    800057bc:	02010113          	addi	sp,sp,32
    800057c0:	00008067          	ret

00000000800057c4 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800057c4:	fe010113          	addi	sp,sp,-32
    800057c8:	00113c23          	sd	ra,24(sp)
    800057cc:	00813823          	sd	s0,16(sp)
    800057d0:	00913423          	sd	s1,8(sp)
    800057d4:	01213023          	sd	s2,0(sp)
    800057d8:	02010413          	addi	s0,sp,32
    800057dc:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800057e0:	02853503          	ld	a0,40(a0)
    800057e4:	ffffc097          	auipc	ra,0xffffc
    800057e8:	d88080e7          	jalr	-632(ra) # 8000156c <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    800057ec:	0304b503          	ld	a0,48(s1)
    800057f0:	ffffc097          	auipc	ra,0xffffc
    800057f4:	d7c080e7          	jalr	-644(ra) # 8000156c <_Z8sem_waitP4_sem>

    if (tail >= head) {
    800057f8:	0144a783          	lw	a5,20(s1)
    800057fc:	0104a903          	lw	s2,16(s1)
    80005800:	0327ce63          	blt	a5,s2,8000583c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80005804:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80005808:	0304b503          	ld	a0,48(s1)
    8000580c:	ffffc097          	auipc	ra,0xffffc
    80005810:	d98080e7          	jalr	-616(ra) # 800015a4 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80005814:	0284b503          	ld	a0,40(s1)
    80005818:	ffffc097          	auipc	ra,0xffffc
    8000581c:	d8c080e7          	jalr	-628(ra) # 800015a4 <_Z10sem_signalP4_sem>

    return ret;
}
    80005820:	00090513          	mv	a0,s2
    80005824:	01813083          	ld	ra,24(sp)
    80005828:	01013403          	ld	s0,16(sp)
    8000582c:	00813483          	ld	s1,8(sp)
    80005830:	00013903          	ld	s2,0(sp)
    80005834:	02010113          	addi	sp,sp,32
    80005838:	00008067          	ret
        ret = cap - head + tail;
    8000583c:	0004a703          	lw	a4,0(s1)
    80005840:	4127093b          	subw	s2,a4,s2
    80005844:	00f9093b          	addw	s2,s2,a5
    80005848:	fc1ff06f          	j	80005808 <_ZN6Buffer6getCntEv+0x44>

000000008000584c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    8000584c:	fe010113          	addi	sp,sp,-32
    80005850:	00113c23          	sd	ra,24(sp)
    80005854:	00813823          	sd	s0,16(sp)
    80005858:	00913423          	sd	s1,8(sp)
    8000585c:	02010413          	addi	s0,sp,32
    80005860:	00050493          	mv	s1,a0
    putc('\n');
    80005864:	00a00513          	li	a0,10
    80005868:	ffffc097          	auipc	ra,0xffffc
    8000586c:	de0080e7          	jalr	-544(ra) # 80001648 <_Z4putcc>
    printString("Buffer deleted!\n");
    80005870:	00003517          	auipc	a0,0x3
    80005874:	a8050513          	addi	a0,a0,-1408 # 800082f0 <CONSOLE_STATUS+0x2e0>
    80005878:	fffff097          	auipc	ra,0xfffff
    8000587c:	0e4080e7          	jalr	228(ra) # 8000495c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005880:	00048513          	mv	a0,s1
    80005884:	00000097          	auipc	ra,0x0
    80005888:	f40080e7          	jalr	-192(ra) # 800057c4 <_ZN6Buffer6getCntEv>
    8000588c:	02a05c63          	blez	a0,800058c4 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005890:	0084b783          	ld	a5,8(s1)
    80005894:	0104a703          	lw	a4,16(s1)
    80005898:	00271713          	slli	a4,a4,0x2
    8000589c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800058a0:	0007c503          	lbu	a0,0(a5)
    800058a4:	ffffc097          	auipc	ra,0xffffc
    800058a8:	da4080e7          	jalr	-604(ra) # 80001648 <_Z4putcc>
        head = (head + 1) % cap;
    800058ac:	0104a783          	lw	a5,16(s1)
    800058b0:	0017879b          	addiw	a5,a5,1
    800058b4:	0004a703          	lw	a4,0(s1)
    800058b8:	02e7e7bb          	remw	a5,a5,a4
    800058bc:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800058c0:	fc1ff06f          	j	80005880 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800058c4:	02100513          	li	a0,33
    800058c8:	ffffc097          	auipc	ra,0xffffc
    800058cc:	d80080e7          	jalr	-640(ra) # 80001648 <_Z4putcc>
    putc('\n');
    800058d0:	00a00513          	li	a0,10
    800058d4:	ffffc097          	auipc	ra,0xffffc
    800058d8:	d74080e7          	jalr	-652(ra) # 80001648 <_Z4putcc>
    mem_free(buffer);
    800058dc:	0084b503          	ld	a0,8(s1)
    800058e0:	ffffc097          	auipc	ra,0xffffc
    800058e4:	ad8080e7          	jalr	-1320(ra) # 800013b8 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800058e8:	0204b503          	ld	a0,32(s1)
    800058ec:	ffffc097          	auipc	ra,0xffffc
    800058f0:	c48080e7          	jalr	-952(ra) # 80001534 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800058f4:	0184b503          	ld	a0,24(s1)
    800058f8:	ffffc097          	auipc	ra,0xffffc
    800058fc:	c3c080e7          	jalr	-964(ra) # 80001534 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80005900:	0304b503          	ld	a0,48(s1)
    80005904:	ffffc097          	auipc	ra,0xffffc
    80005908:	c30080e7          	jalr	-976(ra) # 80001534 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    8000590c:	0284b503          	ld	a0,40(s1)
    80005910:	ffffc097          	auipc	ra,0xffffc
    80005914:	c24080e7          	jalr	-988(ra) # 80001534 <_Z9sem_closeP4_sem>
}
    80005918:	01813083          	ld	ra,24(sp)
    8000591c:	01013403          	ld	s0,16(sp)
    80005920:	00813483          	ld	s1,8(sp)
    80005924:	02010113          	addi	sp,sp,32
    80005928:	00008067          	ret

000000008000592c <start>:
    8000592c:	ff010113          	addi	sp,sp,-16
    80005930:	00813423          	sd	s0,8(sp)
    80005934:	01010413          	addi	s0,sp,16
    80005938:	300027f3          	csrr	a5,mstatus
    8000593c:	ffffe737          	lui	a4,0xffffe
    80005940:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff361f>
    80005944:	00e7f7b3          	and	a5,a5,a4
    80005948:	00001737          	lui	a4,0x1
    8000594c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80005950:	00e7e7b3          	or	a5,a5,a4
    80005954:	30079073          	csrw	mstatus,a5
    80005958:	00000797          	auipc	a5,0x0
    8000595c:	16078793          	addi	a5,a5,352 # 80005ab8 <system_main>
    80005960:	34179073          	csrw	mepc,a5
    80005964:	00000793          	li	a5,0
    80005968:	18079073          	csrw	satp,a5
    8000596c:	000107b7          	lui	a5,0x10
    80005970:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005974:	30279073          	csrw	medeleg,a5
    80005978:	30379073          	csrw	mideleg,a5
    8000597c:	104027f3          	csrr	a5,sie
    80005980:	2227e793          	ori	a5,a5,546
    80005984:	10479073          	csrw	sie,a5
    80005988:	fff00793          	li	a5,-1
    8000598c:	00a7d793          	srli	a5,a5,0xa
    80005990:	3b079073          	csrw	pmpaddr0,a5
    80005994:	00f00793          	li	a5,15
    80005998:	3a079073          	csrw	pmpcfg0,a5
    8000599c:	f14027f3          	csrr	a5,mhartid
    800059a0:	0200c737          	lui	a4,0x200c
    800059a4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800059a8:	0007869b          	sext.w	a3,a5
    800059ac:	00269713          	slli	a4,a3,0x2
    800059b0:	000f4637          	lui	a2,0xf4
    800059b4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800059b8:	00d70733          	add	a4,a4,a3
    800059bc:	0037979b          	slliw	a5,a5,0x3
    800059c0:	020046b7          	lui	a3,0x2004
    800059c4:	00d787b3          	add	a5,a5,a3
    800059c8:	00c585b3          	add	a1,a1,a2
    800059cc:	00371693          	slli	a3,a4,0x3
    800059d0:	00004717          	auipc	a4,0x4
    800059d4:	5b070713          	addi	a4,a4,1456 # 80009f80 <timer_scratch>
    800059d8:	00b7b023          	sd	a1,0(a5)
    800059dc:	00d70733          	add	a4,a4,a3
    800059e0:	00f73c23          	sd	a5,24(a4)
    800059e4:	02c73023          	sd	a2,32(a4)
    800059e8:	34071073          	csrw	mscratch,a4
    800059ec:	00000797          	auipc	a5,0x0
    800059f0:	6e478793          	addi	a5,a5,1764 # 800060d0 <timervec>
    800059f4:	30579073          	csrw	mtvec,a5
    800059f8:	300027f3          	csrr	a5,mstatus
    800059fc:	0087e793          	ori	a5,a5,8
    80005a00:	30079073          	csrw	mstatus,a5
    80005a04:	304027f3          	csrr	a5,mie
    80005a08:	0807e793          	ori	a5,a5,128
    80005a0c:	30479073          	csrw	mie,a5
    80005a10:	f14027f3          	csrr	a5,mhartid
    80005a14:	0007879b          	sext.w	a5,a5
    80005a18:	00078213          	mv	tp,a5
    80005a1c:	30200073          	mret
    80005a20:	00813403          	ld	s0,8(sp)
    80005a24:	01010113          	addi	sp,sp,16
    80005a28:	00008067          	ret

0000000080005a2c <timerinit>:
    80005a2c:	ff010113          	addi	sp,sp,-16
    80005a30:	00813423          	sd	s0,8(sp)
    80005a34:	01010413          	addi	s0,sp,16
    80005a38:	f14027f3          	csrr	a5,mhartid
    80005a3c:	0200c737          	lui	a4,0x200c
    80005a40:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005a44:	0007869b          	sext.w	a3,a5
    80005a48:	00269713          	slli	a4,a3,0x2
    80005a4c:	000f4637          	lui	a2,0xf4
    80005a50:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005a54:	00d70733          	add	a4,a4,a3
    80005a58:	0037979b          	slliw	a5,a5,0x3
    80005a5c:	020046b7          	lui	a3,0x2004
    80005a60:	00d787b3          	add	a5,a5,a3
    80005a64:	00c585b3          	add	a1,a1,a2
    80005a68:	00371693          	slli	a3,a4,0x3
    80005a6c:	00004717          	auipc	a4,0x4
    80005a70:	51470713          	addi	a4,a4,1300 # 80009f80 <timer_scratch>
    80005a74:	00b7b023          	sd	a1,0(a5)
    80005a78:	00d70733          	add	a4,a4,a3
    80005a7c:	00f73c23          	sd	a5,24(a4)
    80005a80:	02c73023          	sd	a2,32(a4)
    80005a84:	34071073          	csrw	mscratch,a4
    80005a88:	00000797          	auipc	a5,0x0
    80005a8c:	64878793          	addi	a5,a5,1608 # 800060d0 <timervec>
    80005a90:	30579073          	csrw	mtvec,a5
    80005a94:	300027f3          	csrr	a5,mstatus
    80005a98:	0087e793          	ori	a5,a5,8
    80005a9c:	30079073          	csrw	mstatus,a5
    80005aa0:	304027f3          	csrr	a5,mie
    80005aa4:	0807e793          	ori	a5,a5,128
    80005aa8:	30479073          	csrw	mie,a5
    80005aac:	00813403          	ld	s0,8(sp)
    80005ab0:	01010113          	addi	sp,sp,16
    80005ab4:	00008067          	ret

0000000080005ab8 <system_main>:
    80005ab8:	fe010113          	addi	sp,sp,-32
    80005abc:	00813823          	sd	s0,16(sp)
    80005ac0:	00913423          	sd	s1,8(sp)
    80005ac4:	00113c23          	sd	ra,24(sp)
    80005ac8:	02010413          	addi	s0,sp,32
    80005acc:	00000097          	auipc	ra,0x0
    80005ad0:	0c4080e7          	jalr	196(ra) # 80005b90 <cpuid>
    80005ad4:	00004497          	auipc	s1,0x4
    80005ad8:	41c48493          	addi	s1,s1,1052 # 80009ef0 <started>
    80005adc:	02050263          	beqz	a0,80005b00 <system_main+0x48>
    80005ae0:	0004a783          	lw	a5,0(s1)
    80005ae4:	0007879b          	sext.w	a5,a5
    80005ae8:	fe078ce3          	beqz	a5,80005ae0 <system_main+0x28>
    80005aec:	0ff0000f          	fence
    80005af0:	00003517          	auipc	a0,0x3
    80005af4:	84850513          	addi	a0,a0,-1976 # 80008338 <CONSOLE_STATUS+0x328>
    80005af8:	00001097          	auipc	ra,0x1
    80005afc:	a74080e7          	jalr	-1420(ra) # 8000656c <panic>
    80005b00:	00001097          	auipc	ra,0x1
    80005b04:	9c8080e7          	jalr	-1592(ra) # 800064c8 <consoleinit>
    80005b08:	00001097          	auipc	ra,0x1
    80005b0c:	154080e7          	jalr	340(ra) # 80006c5c <printfinit>
    80005b10:	00002517          	auipc	a0,0x2
    80005b14:	5f850513          	addi	a0,a0,1528 # 80008108 <CONSOLE_STATUS+0xf8>
    80005b18:	00001097          	auipc	ra,0x1
    80005b1c:	ab0080e7          	jalr	-1360(ra) # 800065c8 <__printf>
    80005b20:	00002517          	auipc	a0,0x2
    80005b24:	7e850513          	addi	a0,a0,2024 # 80008308 <CONSOLE_STATUS+0x2f8>
    80005b28:	00001097          	auipc	ra,0x1
    80005b2c:	aa0080e7          	jalr	-1376(ra) # 800065c8 <__printf>
    80005b30:	00002517          	auipc	a0,0x2
    80005b34:	5d850513          	addi	a0,a0,1496 # 80008108 <CONSOLE_STATUS+0xf8>
    80005b38:	00001097          	auipc	ra,0x1
    80005b3c:	a90080e7          	jalr	-1392(ra) # 800065c8 <__printf>
    80005b40:	00001097          	auipc	ra,0x1
    80005b44:	4a8080e7          	jalr	1192(ra) # 80006fe8 <kinit>
    80005b48:	00000097          	auipc	ra,0x0
    80005b4c:	148080e7          	jalr	328(ra) # 80005c90 <trapinit>
    80005b50:	00000097          	auipc	ra,0x0
    80005b54:	16c080e7          	jalr	364(ra) # 80005cbc <trapinithart>
    80005b58:	00000097          	auipc	ra,0x0
    80005b5c:	5b8080e7          	jalr	1464(ra) # 80006110 <plicinit>
    80005b60:	00000097          	auipc	ra,0x0
    80005b64:	5d8080e7          	jalr	1496(ra) # 80006138 <plicinithart>
    80005b68:	00000097          	auipc	ra,0x0
    80005b6c:	078080e7          	jalr	120(ra) # 80005be0 <userinit>
    80005b70:	0ff0000f          	fence
    80005b74:	00100793          	li	a5,1
    80005b78:	00002517          	auipc	a0,0x2
    80005b7c:	7a850513          	addi	a0,a0,1960 # 80008320 <CONSOLE_STATUS+0x310>
    80005b80:	00f4a023          	sw	a5,0(s1)
    80005b84:	00001097          	auipc	ra,0x1
    80005b88:	a44080e7          	jalr	-1468(ra) # 800065c8 <__printf>
    80005b8c:	0000006f          	j	80005b8c <system_main+0xd4>

0000000080005b90 <cpuid>:
    80005b90:	ff010113          	addi	sp,sp,-16
    80005b94:	00813423          	sd	s0,8(sp)
    80005b98:	01010413          	addi	s0,sp,16
    80005b9c:	00020513          	mv	a0,tp
    80005ba0:	00813403          	ld	s0,8(sp)
    80005ba4:	0005051b          	sext.w	a0,a0
    80005ba8:	01010113          	addi	sp,sp,16
    80005bac:	00008067          	ret

0000000080005bb0 <mycpu>:
    80005bb0:	ff010113          	addi	sp,sp,-16
    80005bb4:	00813423          	sd	s0,8(sp)
    80005bb8:	01010413          	addi	s0,sp,16
    80005bbc:	00020793          	mv	a5,tp
    80005bc0:	00813403          	ld	s0,8(sp)
    80005bc4:	0007879b          	sext.w	a5,a5
    80005bc8:	00779793          	slli	a5,a5,0x7
    80005bcc:	00005517          	auipc	a0,0x5
    80005bd0:	3e450513          	addi	a0,a0,996 # 8000afb0 <cpus>
    80005bd4:	00f50533          	add	a0,a0,a5
    80005bd8:	01010113          	addi	sp,sp,16
    80005bdc:	00008067          	ret

0000000080005be0 <userinit>:
    80005be0:	ff010113          	addi	sp,sp,-16
    80005be4:	00813423          	sd	s0,8(sp)
    80005be8:	01010413          	addi	s0,sp,16
    80005bec:	00813403          	ld	s0,8(sp)
    80005bf0:	01010113          	addi	sp,sp,16
    80005bf4:	ffffc317          	auipc	t1,0xffffc
    80005bf8:	10430067          	jr	260(t1) # 80001cf8 <main>

0000000080005bfc <either_copyout>:
    80005bfc:	ff010113          	addi	sp,sp,-16
    80005c00:	00813023          	sd	s0,0(sp)
    80005c04:	00113423          	sd	ra,8(sp)
    80005c08:	01010413          	addi	s0,sp,16
    80005c0c:	02051663          	bnez	a0,80005c38 <either_copyout+0x3c>
    80005c10:	00058513          	mv	a0,a1
    80005c14:	00060593          	mv	a1,a2
    80005c18:	0006861b          	sext.w	a2,a3
    80005c1c:	00002097          	auipc	ra,0x2
    80005c20:	c58080e7          	jalr	-936(ra) # 80007874 <__memmove>
    80005c24:	00813083          	ld	ra,8(sp)
    80005c28:	00013403          	ld	s0,0(sp)
    80005c2c:	00000513          	li	a0,0
    80005c30:	01010113          	addi	sp,sp,16
    80005c34:	00008067          	ret
    80005c38:	00002517          	auipc	a0,0x2
    80005c3c:	72850513          	addi	a0,a0,1832 # 80008360 <CONSOLE_STATUS+0x350>
    80005c40:	00001097          	auipc	ra,0x1
    80005c44:	92c080e7          	jalr	-1748(ra) # 8000656c <panic>

0000000080005c48 <either_copyin>:
    80005c48:	ff010113          	addi	sp,sp,-16
    80005c4c:	00813023          	sd	s0,0(sp)
    80005c50:	00113423          	sd	ra,8(sp)
    80005c54:	01010413          	addi	s0,sp,16
    80005c58:	02059463          	bnez	a1,80005c80 <either_copyin+0x38>
    80005c5c:	00060593          	mv	a1,a2
    80005c60:	0006861b          	sext.w	a2,a3
    80005c64:	00002097          	auipc	ra,0x2
    80005c68:	c10080e7          	jalr	-1008(ra) # 80007874 <__memmove>
    80005c6c:	00813083          	ld	ra,8(sp)
    80005c70:	00013403          	ld	s0,0(sp)
    80005c74:	00000513          	li	a0,0
    80005c78:	01010113          	addi	sp,sp,16
    80005c7c:	00008067          	ret
    80005c80:	00002517          	auipc	a0,0x2
    80005c84:	70850513          	addi	a0,a0,1800 # 80008388 <CONSOLE_STATUS+0x378>
    80005c88:	00001097          	auipc	ra,0x1
    80005c8c:	8e4080e7          	jalr	-1820(ra) # 8000656c <panic>

0000000080005c90 <trapinit>:
    80005c90:	ff010113          	addi	sp,sp,-16
    80005c94:	00813423          	sd	s0,8(sp)
    80005c98:	01010413          	addi	s0,sp,16
    80005c9c:	00813403          	ld	s0,8(sp)
    80005ca0:	00002597          	auipc	a1,0x2
    80005ca4:	71058593          	addi	a1,a1,1808 # 800083b0 <CONSOLE_STATUS+0x3a0>
    80005ca8:	00005517          	auipc	a0,0x5
    80005cac:	38850513          	addi	a0,a0,904 # 8000b030 <tickslock>
    80005cb0:	01010113          	addi	sp,sp,16
    80005cb4:	00001317          	auipc	t1,0x1
    80005cb8:	5c430067          	jr	1476(t1) # 80007278 <initlock>

0000000080005cbc <trapinithart>:
    80005cbc:	ff010113          	addi	sp,sp,-16
    80005cc0:	00813423          	sd	s0,8(sp)
    80005cc4:	01010413          	addi	s0,sp,16
    80005cc8:	00000797          	auipc	a5,0x0
    80005ccc:	2f878793          	addi	a5,a5,760 # 80005fc0 <kernelvec>
    80005cd0:	10579073          	csrw	stvec,a5
    80005cd4:	00813403          	ld	s0,8(sp)
    80005cd8:	01010113          	addi	sp,sp,16
    80005cdc:	00008067          	ret

0000000080005ce0 <usertrap>:
    80005ce0:	ff010113          	addi	sp,sp,-16
    80005ce4:	00813423          	sd	s0,8(sp)
    80005ce8:	01010413          	addi	s0,sp,16
    80005cec:	00813403          	ld	s0,8(sp)
    80005cf0:	01010113          	addi	sp,sp,16
    80005cf4:	00008067          	ret

0000000080005cf8 <usertrapret>:
    80005cf8:	ff010113          	addi	sp,sp,-16
    80005cfc:	00813423          	sd	s0,8(sp)
    80005d00:	01010413          	addi	s0,sp,16
    80005d04:	00813403          	ld	s0,8(sp)
    80005d08:	01010113          	addi	sp,sp,16
    80005d0c:	00008067          	ret

0000000080005d10 <kerneltrap>:
    80005d10:	fe010113          	addi	sp,sp,-32
    80005d14:	00813823          	sd	s0,16(sp)
    80005d18:	00113c23          	sd	ra,24(sp)
    80005d1c:	00913423          	sd	s1,8(sp)
    80005d20:	02010413          	addi	s0,sp,32
    80005d24:	142025f3          	csrr	a1,scause
    80005d28:	100027f3          	csrr	a5,sstatus
    80005d2c:	0027f793          	andi	a5,a5,2
    80005d30:	10079c63          	bnez	a5,80005e48 <kerneltrap+0x138>
    80005d34:	142027f3          	csrr	a5,scause
    80005d38:	0207ce63          	bltz	a5,80005d74 <kerneltrap+0x64>
    80005d3c:	00002517          	auipc	a0,0x2
    80005d40:	6bc50513          	addi	a0,a0,1724 # 800083f8 <CONSOLE_STATUS+0x3e8>
    80005d44:	00001097          	auipc	ra,0x1
    80005d48:	884080e7          	jalr	-1916(ra) # 800065c8 <__printf>
    80005d4c:	141025f3          	csrr	a1,sepc
    80005d50:	14302673          	csrr	a2,stval
    80005d54:	00002517          	auipc	a0,0x2
    80005d58:	6b450513          	addi	a0,a0,1716 # 80008408 <CONSOLE_STATUS+0x3f8>
    80005d5c:	00001097          	auipc	ra,0x1
    80005d60:	86c080e7          	jalr	-1940(ra) # 800065c8 <__printf>
    80005d64:	00002517          	auipc	a0,0x2
    80005d68:	6bc50513          	addi	a0,a0,1724 # 80008420 <CONSOLE_STATUS+0x410>
    80005d6c:	00001097          	auipc	ra,0x1
    80005d70:	800080e7          	jalr	-2048(ra) # 8000656c <panic>
    80005d74:	0ff7f713          	andi	a4,a5,255
    80005d78:	00900693          	li	a3,9
    80005d7c:	04d70063          	beq	a4,a3,80005dbc <kerneltrap+0xac>
    80005d80:	fff00713          	li	a4,-1
    80005d84:	03f71713          	slli	a4,a4,0x3f
    80005d88:	00170713          	addi	a4,a4,1
    80005d8c:	fae798e3          	bne	a5,a4,80005d3c <kerneltrap+0x2c>
    80005d90:	00000097          	auipc	ra,0x0
    80005d94:	e00080e7          	jalr	-512(ra) # 80005b90 <cpuid>
    80005d98:	06050663          	beqz	a0,80005e04 <kerneltrap+0xf4>
    80005d9c:	144027f3          	csrr	a5,sip
    80005da0:	ffd7f793          	andi	a5,a5,-3
    80005da4:	14479073          	csrw	sip,a5
    80005da8:	01813083          	ld	ra,24(sp)
    80005dac:	01013403          	ld	s0,16(sp)
    80005db0:	00813483          	ld	s1,8(sp)
    80005db4:	02010113          	addi	sp,sp,32
    80005db8:	00008067          	ret
    80005dbc:	00000097          	auipc	ra,0x0
    80005dc0:	3c8080e7          	jalr	968(ra) # 80006184 <plic_claim>
    80005dc4:	00a00793          	li	a5,10
    80005dc8:	00050493          	mv	s1,a0
    80005dcc:	06f50863          	beq	a0,a5,80005e3c <kerneltrap+0x12c>
    80005dd0:	fc050ce3          	beqz	a0,80005da8 <kerneltrap+0x98>
    80005dd4:	00050593          	mv	a1,a0
    80005dd8:	00002517          	auipc	a0,0x2
    80005ddc:	60050513          	addi	a0,a0,1536 # 800083d8 <CONSOLE_STATUS+0x3c8>
    80005de0:	00000097          	auipc	ra,0x0
    80005de4:	7e8080e7          	jalr	2024(ra) # 800065c8 <__printf>
    80005de8:	01013403          	ld	s0,16(sp)
    80005dec:	01813083          	ld	ra,24(sp)
    80005df0:	00048513          	mv	a0,s1
    80005df4:	00813483          	ld	s1,8(sp)
    80005df8:	02010113          	addi	sp,sp,32
    80005dfc:	00000317          	auipc	t1,0x0
    80005e00:	3c030067          	jr	960(t1) # 800061bc <plic_complete>
    80005e04:	00005517          	auipc	a0,0x5
    80005e08:	22c50513          	addi	a0,a0,556 # 8000b030 <tickslock>
    80005e0c:	00001097          	auipc	ra,0x1
    80005e10:	490080e7          	jalr	1168(ra) # 8000729c <acquire>
    80005e14:	00004717          	auipc	a4,0x4
    80005e18:	0e070713          	addi	a4,a4,224 # 80009ef4 <ticks>
    80005e1c:	00072783          	lw	a5,0(a4)
    80005e20:	00005517          	auipc	a0,0x5
    80005e24:	21050513          	addi	a0,a0,528 # 8000b030 <tickslock>
    80005e28:	0017879b          	addiw	a5,a5,1
    80005e2c:	00f72023          	sw	a5,0(a4)
    80005e30:	00001097          	auipc	ra,0x1
    80005e34:	538080e7          	jalr	1336(ra) # 80007368 <release>
    80005e38:	f65ff06f          	j	80005d9c <kerneltrap+0x8c>
    80005e3c:	00001097          	auipc	ra,0x1
    80005e40:	094080e7          	jalr	148(ra) # 80006ed0 <uartintr>
    80005e44:	fa5ff06f          	j	80005de8 <kerneltrap+0xd8>
    80005e48:	00002517          	auipc	a0,0x2
    80005e4c:	57050513          	addi	a0,a0,1392 # 800083b8 <CONSOLE_STATUS+0x3a8>
    80005e50:	00000097          	auipc	ra,0x0
    80005e54:	71c080e7          	jalr	1820(ra) # 8000656c <panic>

0000000080005e58 <clockintr>:
    80005e58:	fe010113          	addi	sp,sp,-32
    80005e5c:	00813823          	sd	s0,16(sp)
    80005e60:	00913423          	sd	s1,8(sp)
    80005e64:	00113c23          	sd	ra,24(sp)
    80005e68:	02010413          	addi	s0,sp,32
    80005e6c:	00005497          	auipc	s1,0x5
    80005e70:	1c448493          	addi	s1,s1,452 # 8000b030 <tickslock>
    80005e74:	00048513          	mv	a0,s1
    80005e78:	00001097          	auipc	ra,0x1
    80005e7c:	424080e7          	jalr	1060(ra) # 8000729c <acquire>
    80005e80:	00004717          	auipc	a4,0x4
    80005e84:	07470713          	addi	a4,a4,116 # 80009ef4 <ticks>
    80005e88:	00072783          	lw	a5,0(a4)
    80005e8c:	01013403          	ld	s0,16(sp)
    80005e90:	01813083          	ld	ra,24(sp)
    80005e94:	00048513          	mv	a0,s1
    80005e98:	0017879b          	addiw	a5,a5,1
    80005e9c:	00813483          	ld	s1,8(sp)
    80005ea0:	00f72023          	sw	a5,0(a4)
    80005ea4:	02010113          	addi	sp,sp,32
    80005ea8:	00001317          	auipc	t1,0x1
    80005eac:	4c030067          	jr	1216(t1) # 80007368 <release>

0000000080005eb0 <devintr>:
    80005eb0:	142027f3          	csrr	a5,scause
    80005eb4:	00000513          	li	a0,0
    80005eb8:	0007c463          	bltz	a5,80005ec0 <devintr+0x10>
    80005ebc:	00008067          	ret
    80005ec0:	fe010113          	addi	sp,sp,-32
    80005ec4:	00813823          	sd	s0,16(sp)
    80005ec8:	00113c23          	sd	ra,24(sp)
    80005ecc:	00913423          	sd	s1,8(sp)
    80005ed0:	02010413          	addi	s0,sp,32
    80005ed4:	0ff7f713          	andi	a4,a5,255
    80005ed8:	00900693          	li	a3,9
    80005edc:	04d70c63          	beq	a4,a3,80005f34 <devintr+0x84>
    80005ee0:	fff00713          	li	a4,-1
    80005ee4:	03f71713          	slli	a4,a4,0x3f
    80005ee8:	00170713          	addi	a4,a4,1
    80005eec:	00e78c63          	beq	a5,a4,80005f04 <devintr+0x54>
    80005ef0:	01813083          	ld	ra,24(sp)
    80005ef4:	01013403          	ld	s0,16(sp)
    80005ef8:	00813483          	ld	s1,8(sp)
    80005efc:	02010113          	addi	sp,sp,32
    80005f00:	00008067          	ret
    80005f04:	00000097          	auipc	ra,0x0
    80005f08:	c8c080e7          	jalr	-884(ra) # 80005b90 <cpuid>
    80005f0c:	06050663          	beqz	a0,80005f78 <devintr+0xc8>
    80005f10:	144027f3          	csrr	a5,sip
    80005f14:	ffd7f793          	andi	a5,a5,-3
    80005f18:	14479073          	csrw	sip,a5
    80005f1c:	01813083          	ld	ra,24(sp)
    80005f20:	01013403          	ld	s0,16(sp)
    80005f24:	00813483          	ld	s1,8(sp)
    80005f28:	00200513          	li	a0,2
    80005f2c:	02010113          	addi	sp,sp,32
    80005f30:	00008067          	ret
    80005f34:	00000097          	auipc	ra,0x0
    80005f38:	250080e7          	jalr	592(ra) # 80006184 <plic_claim>
    80005f3c:	00a00793          	li	a5,10
    80005f40:	00050493          	mv	s1,a0
    80005f44:	06f50663          	beq	a0,a5,80005fb0 <devintr+0x100>
    80005f48:	00100513          	li	a0,1
    80005f4c:	fa0482e3          	beqz	s1,80005ef0 <devintr+0x40>
    80005f50:	00048593          	mv	a1,s1
    80005f54:	00002517          	auipc	a0,0x2
    80005f58:	48450513          	addi	a0,a0,1156 # 800083d8 <CONSOLE_STATUS+0x3c8>
    80005f5c:	00000097          	auipc	ra,0x0
    80005f60:	66c080e7          	jalr	1644(ra) # 800065c8 <__printf>
    80005f64:	00048513          	mv	a0,s1
    80005f68:	00000097          	auipc	ra,0x0
    80005f6c:	254080e7          	jalr	596(ra) # 800061bc <plic_complete>
    80005f70:	00100513          	li	a0,1
    80005f74:	f7dff06f          	j	80005ef0 <devintr+0x40>
    80005f78:	00005517          	auipc	a0,0x5
    80005f7c:	0b850513          	addi	a0,a0,184 # 8000b030 <tickslock>
    80005f80:	00001097          	auipc	ra,0x1
    80005f84:	31c080e7          	jalr	796(ra) # 8000729c <acquire>
    80005f88:	00004717          	auipc	a4,0x4
    80005f8c:	f6c70713          	addi	a4,a4,-148 # 80009ef4 <ticks>
    80005f90:	00072783          	lw	a5,0(a4)
    80005f94:	00005517          	auipc	a0,0x5
    80005f98:	09c50513          	addi	a0,a0,156 # 8000b030 <tickslock>
    80005f9c:	0017879b          	addiw	a5,a5,1
    80005fa0:	00f72023          	sw	a5,0(a4)
    80005fa4:	00001097          	auipc	ra,0x1
    80005fa8:	3c4080e7          	jalr	964(ra) # 80007368 <release>
    80005fac:	f65ff06f          	j	80005f10 <devintr+0x60>
    80005fb0:	00001097          	auipc	ra,0x1
    80005fb4:	f20080e7          	jalr	-224(ra) # 80006ed0 <uartintr>
    80005fb8:	fadff06f          	j	80005f64 <devintr+0xb4>
    80005fbc:	0000                	unimp
	...

0000000080005fc0 <kernelvec>:
    80005fc0:	f0010113          	addi	sp,sp,-256
    80005fc4:	00113023          	sd	ra,0(sp)
    80005fc8:	00213423          	sd	sp,8(sp)
    80005fcc:	00313823          	sd	gp,16(sp)
    80005fd0:	00413c23          	sd	tp,24(sp)
    80005fd4:	02513023          	sd	t0,32(sp)
    80005fd8:	02613423          	sd	t1,40(sp)
    80005fdc:	02713823          	sd	t2,48(sp)
    80005fe0:	02813c23          	sd	s0,56(sp)
    80005fe4:	04913023          	sd	s1,64(sp)
    80005fe8:	04a13423          	sd	a0,72(sp)
    80005fec:	04b13823          	sd	a1,80(sp)
    80005ff0:	04c13c23          	sd	a2,88(sp)
    80005ff4:	06d13023          	sd	a3,96(sp)
    80005ff8:	06e13423          	sd	a4,104(sp)
    80005ffc:	06f13823          	sd	a5,112(sp)
    80006000:	07013c23          	sd	a6,120(sp)
    80006004:	09113023          	sd	a7,128(sp)
    80006008:	09213423          	sd	s2,136(sp)
    8000600c:	09313823          	sd	s3,144(sp)
    80006010:	09413c23          	sd	s4,152(sp)
    80006014:	0b513023          	sd	s5,160(sp)
    80006018:	0b613423          	sd	s6,168(sp)
    8000601c:	0b713823          	sd	s7,176(sp)
    80006020:	0b813c23          	sd	s8,184(sp)
    80006024:	0d913023          	sd	s9,192(sp)
    80006028:	0da13423          	sd	s10,200(sp)
    8000602c:	0db13823          	sd	s11,208(sp)
    80006030:	0dc13c23          	sd	t3,216(sp)
    80006034:	0fd13023          	sd	t4,224(sp)
    80006038:	0fe13423          	sd	t5,232(sp)
    8000603c:	0ff13823          	sd	t6,240(sp)
    80006040:	cd1ff0ef          	jal	ra,80005d10 <kerneltrap>
    80006044:	00013083          	ld	ra,0(sp)
    80006048:	00813103          	ld	sp,8(sp)
    8000604c:	01013183          	ld	gp,16(sp)
    80006050:	02013283          	ld	t0,32(sp)
    80006054:	02813303          	ld	t1,40(sp)
    80006058:	03013383          	ld	t2,48(sp)
    8000605c:	03813403          	ld	s0,56(sp)
    80006060:	04013483          	ld	s1,64(sp)
    80006064:	04813503          	ld	a0,72(sp)
    80006068:	05013583          	ld	a1,80(sp)
    8000606c:	05813603          	ld	a2,88(sp)
    80006070:	06013683          	ld	a3,96(sp)
    80006074:	06813703          	ld	a4,104(sp)
    80006078:	07013783          	ld	a5,112(sp)
    8000607c:	07813803          	ld	a6,120(sp)
    80006080:	08013883          	ld	a7,128(sp)
    80006084:	08813903          	ld	s2,136(sp)
    80006088:	09013983          	ld	s3,144(sp)
    8000608c:	09813a03          	ld	s4,152(sp)
    80006090:	0a013a83          	ld	s5,160(sp)
    80006094:	0a813b03          	ld	s6,168(sp)
    80006098:	0b013b83          	ld	s7,176(sp)
    8000609c:	0b813c03          	ld	s8,184(sp)
    800060a0:	0c013c83          	ld	s9,192(sp)
    800060a4:	0c813d03          	ld	s10,200(sp)
    800060a8:	0d013d83          	ld	s11,208(sp)
    800060ac:	0d813e03          	ld	t3,216(sp)
    800060b0:	0e013e83          	ld	t4,224(sp)
    800060b4:	0e813f03          	ld	t5,232(sp)
    800060b8:	0f013f83          	ld	t6,240(sp)
    800060bc:	10010113          	addi	sp,sp,256
    800060c0:	10200073          	sret
    800060c4:	00000013          	nop
    800060c8:	00000013          	nop
    800060cc:	00000013          	nop

00000000800060d0 <timervec>:
    800060d0:	34051573          	csrrw	a0,mscratch,a0
    800060d4:	00b53023          	sd	a1,0(a0)
    800060d8:	00c53423          	sd	a2,8(a0)
    800060dc:	00d53823          	sd	a3,16(a0)
    800060e0:	01853583          	ld	a1,24(a0)
    800060e4:	02053603          	ld	a2,32(a0)
    800060e8:	0005b683          	ld	a3,0(a1)
    800060ec:	00c686b3          	add	a3,a3,a2
    800060f0:	00d5b023          	sd	a3,0(a1)
    800060f4:	00200593          	li	a1,2
    800060f8:	14459073          	csrw	sip,a1
    800060fc:	01053683          	ld	a3,16(a0)
    80006100:	00853603          	ld	a2,8(a0)
    80006104:	00053583          	ld	a1,0(a0)
    80006108:	34051573          	csrrw	a0,mscratch,a0
    8000610c:	30200073          	mret

0000000080006110 <plicinit>:
    80006110:	ff010113          	addi	sp,sp,-16
    80006114:	00813423          	sd	s0,8(sp)
    80006118:	01010413          	addi	s0,sp,16
    8000611c:	00813403          	ld	s0,8(sp)
    80006120:	0c0007b7          	lui	a5,0xc000
    80006124:	00100713          	li	a4,1
    80006128:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000612c:	00e7a223          	sw	a4,4(a5)
    80006130:	01010113          	addi	sp,sp,16
    80006134:	00008067          	ret

0000000080006138 <plicinithart>:
    80006138:	ff010113          	addi	sp,sp,-16
    8000613c:	00813023          	sd	s0,0(sp)
    80006140:	00113423          	sd	ra,8(sp)
    80006144:	01010413          	addi	s0,sp,16
    80006148:	00000097          	auipc	ra,0x0
    8000614c:	a48080e7          	jalr	-1464(ra) # 80005b90 <cpuid>
    80006150:	0085171b          	slliw	a4,a0,0x8
    80006154:	0c0027b7          	lui	a5,0xc002
    80006158:	00e787b3          	add	a5,a5,a4
    8000615c:	40200713          	li	a4,1026
    80006160:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006164:	00813083          	ld	ra,8(sp)
    80006168:	00013403          	ld	s0,0(sp)
    8000616c:	00d5151b          	slliw	a0,a0,0xd
    80006170:	0c2017b7          	lui	a5,0xc201
    80006174:	00a78533          	add	a0,a5,a0
    80006178:	00052023          	sw	zero,0(a0)
    8000617c:	01010113          	addi	sp,sp,16
    80006180:	00008067          	ret

0000000080006184 <plic_claim>:
    80006184:	ff010113          	addi	sp,sp,-16
    80006188:	00813023          	sd	s0,0(sp)
    8000618c:	00113423          	sd	ra,8(sp)
    80006190:	01010413          	addi	s0,sp,16
    80006194:	00000097          	auipc	ra,0x0
    80006198:	9fc080e7          	jalr	-1540(ra) # 80005b90 <cpuid>
    8000619c:	00813083          	ld	ra,8(sp)
    800061a0:	00013403          	ld	s0,0(sp)
    800061a4:	00d5151b          	slliw	a0,a0,0xd
    800061a8:	0c2017b7          	lui	a5,0xc201
    800061ac:	00a78533          	add	a0,a5,a0
    800061b0:	00452503          	lw	a0,4(a0)
    800061b4:	01010113          	addi	sp,sp,16
    800061b8:	00008067          	ret

00000000800061bc <plic_complete>:
    800061bc:	fe010113          	addi	sp,sp,-32
    800061c0:	00813823          	sd	s0,16(sp)
    800061c4:	00913423          	sd	s1,8(sp)
    800061c8:	00113c23          	sd	ra,24(sp)
    800061cc:	02010413          	addi	s0,sp,32
    800061d0:	00050493          	mv	s1,a0
    800061d4:	00000097          	auipc	ra,0x0
    800061d8:	9bc080e7          	jalr	-1604(ra) # 80005b90 <cpuid>
    800061dc:	01813083          	ld	ra,24(sp)
    800061e0:	01013403          	ld	s0,16(sp)
    800061e4:	00d5179b          	slliw	a5,a0,0xd
    800061e8:	0c201737          	lui	a4,0xc201
    800061ec:	00f707b3          	add	a5,a4,a5
    800061f0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800061f4:	00813483          	ld	s1,8(sp)
    800061f8:	02010113          	addi	sp,sp,32
    800061fc:	00008067          	ret

0000000080006200 <consolewrite>:
    80006200:	fb010113          	addi	sp,sp,-80
    80006204:	04813023          	sd	s0,64(sp)
    80006208:	04113423          	sd	ra,72(sp)
    8000620c:	02913c23          	sd	s1,56(sp)
    80006210:	03213823          	sd	s2,48(sp)
    80006214:	03313423          	sd	s3,40(sp)
    80006218:	03413023          	sd	s4,32(sp)
    8000621c:	01513c23          	sd	s5,24(sp)
    80006220:	05010413          	addi	s0,sp,80
    80006224:	06c05c63          	blez	a2,8000629c <consolewrite+0x9c>
    80006228:	00060993          	mv	s3,a2
    8000622c:	00050a13          	mv	s4,a0
    80006230:	00058493          	mv	s1,a1
    80006234:	00000913          	li	s2,0
    80006238:	fff00a93          	li	s5,-1
    8000623c:	01c0006f          	j	80006258 <consolewrite+0x58>
    80006240:	fbf44503          	lbu	a0,-65(s0)
    80006244:	0019091b          	addiw	s2,s2,1
    80006248:	00148493          	addi	s1,s1,1
    8000624c:	00001097          	auipc	ra,0x1
    80006250:	a9c080e7          	jalr	-1380(ra) # 80006ce8 <uartputc>
    80006254:	03298063          	beq	s3,s2,80006274 <consolewrite+0x74>
    80006258:	00048613          	mv	a2,s1
    8000625c:	00100693          	li	a3,1
    80006260:	000a0593          	mv	a1,s4
    80006264:	fbf40513          	addi	a0,s0,-65
    80006268:	00000097          	auipc	ra,0x0
    8000626c:	9e0080e7          	jalr	-1568(ra) # 80005c48 <either_copyin>
    80006270:	fd5518e3          	bne	a0,s5,80006240 <consolewrite+0x40>
    80006274:	04813083          	ld	ra,72(sp)
    80006278:	04013403          	ld	s0,64(sp)
    8000627c:	03813483          	ld	s1,56(sp)
    80006280:	02813983          	ld	s3,40(sp)
    80006284:	02013a03          	ld	s4,32(sp)
    80006288:	01813a83          	ld	s5,24(sp)
    8000628c:	00090513          	mv	a0,s2
    80006290:	03013903          	ld	s2,48(sp)
    80006294:	05010113          	addi	sp,sp,80
    80006298:	00008067          	ret
    8000629c:	00000913          	li	s2,0
    800062a0:	fd5ff06f          	j	80006274 <consolewrite+0x74>

00000000800062a4 <consoleread>:
    800062a4:	f9010113          	addi	sp,sp,-112
    800062a8:	06813023          	sd	s0,96(sp)
    800062ac:	04913c23          	sd	s1,88(sp)
    800062b0:	05213823          	sd	s2,80(sp)
    800062b4:	05313423          	sd	s3,72(sp)
    800062b8:	05413023          	sd	s4,64(sp)
    800062bc:	03513c23          	sd	s5,56(sp)
    800062c0:	03613823          	sd	s6,48(sp)
    800062c4:	03713423          	sd	s7,40(sp)
    800062c8:	03813023          	sd	s8,32(sp)
    800062cc:	06113423          	sd	ra,104(sp)
    800062d0:	01913c23          	sd	s9,24(sp)
    800062d4:	07010413          	addi	s0,sp,112
    800062d8:	00060b93          	mv	s7,a2
    800062dc:	00050913          	mv	s2,a0
    800062e0:	00058c13          	mv	s8,a1
    800062e4:	00060b1b          	sext.w	s6,a2
    800062e8:	00005497          	auipc	s1,0x5
    800062ec:	d7048493          	addi	s1,s1,-656 # 8000b058 <cons>
    800062f0:	00400993          	li	s3,4
    800062f4:	fff00a13          	li	s4,-1
    800062f8:	00a00a93          	li	s5,10
    800062fc:	05705e63          	blez	s7,80006358 <consoleread+0xb4>
    80006300:	09c4a703          	lw	a4,156(s1)
    80006304:	0984a783          	lw	a5,152(s1)
    80006308:	0007071b          	sext.w	a4,a4
    8000630c:	08e78463          	beq	a5,a4,80006394 <consoleread+0xf0>
    80006310:	07f7f713          	andi	a4,a5,127
    80006314:	00e48733          	add	a4,s1,a4
    80006318:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000631c:	0017869b          	addiw	a3,a5,1
    80006320:	08d4ac23          	sw	a3,152(s1)
    80006324:	00070c9b          	sext.w	s9,a4
    80006328:	0b370663          	beq	a4,s3,800063d4 <consoleread+0x130>
    8000632c:	00100693          	li	a3,1
    80006330:	f9f40613          	addi	a2,s0,-97
    80006334:	000c0593          	mv	a1,s8
    80006338:	00090513          	mv	a0,s2
    8000633c:	f8e40fa3          	sb	a4,-97(s0)
    80006340:	00000097          	auipc	ra,0x0
    80006344:	8bc080e7          	jalr	-1860(ra) # 80005bfc <either_copyout>
    80006348:	01450863          	beq	a0,s4,80006358 <consoleread+0xb4>
    8000634c:	001c0c13          	addi	s8,s8,1
    80006350:	fffb8b9b          	addiw	s7,s7,-1
    80006354:	fb5c94e3          	bne	s9,s5,800062fc <consoleread+0x58>
    80006358:	000b851b          	sext.w	a0,s7
    8000635c:	06813083          	ld	ra,104(sp)
    80006360:	06013403          	ld	s0,96(sp)
    80006364:	05813483          	ld	s1,88(sp)
    80006368:	05013903          	ld	s2,80(sp)
    8000636c:	04813983          	ld	s3,72(sp)
    80006370:	04013a03          	ld	s4,64(sp)
    80006374:	03813a83          	ld	s5,56(sp)
    80006378:	02813b83          	ld	s7,40(sp)
    8000637c:	02013c03          	ld	s8,32(sp)
    80006380:	01813c83          	ld	s9,24(sp)
    80006384:	40ab053b          	subw	a0,s6,a0
    80006388:	03013b03          	ld	s6,48(sp)
    8000638c:	07010113          	addi	sp,sp,112
    80006390:	00008067          	ret
    80006394:	00001097          	auipc	ra,0x1
    80006398:	1d8080e7          	jalr	472(ra) # 8000756c <push_on>
    8000639c:	0984a703          	lw	a4,152(s1)
    800063a0:	09c4a783          	lw	a5,156(s1)
    800063a4:	0007879b          	sext.w	a5,a5
    800063a8:	fef70ce3          	beq	a4,a5,800063a0 <consoleread+0xfc>
    800063ac:	00001097          	auipc	ra,0x1
    800063b0:	234080e7          	jalr	564(ra) # 800075e0 <pop_on>
    800063b4:	0984a783          	lw	a5,152(s1)
    800063b8:	07f7f713          	andi	a4,a5,127
    800063bc:	00e48733          	add	a4,s1,a4
    800063c0:	01874703          	lbu	a4,24(a4)
    800063c4:	0017869b          	addiw	a3,a5,1
    800063c8:	08d4ac23          	sw	a3,152(s1)
    800063cc:	00070c9b          	sext.w	s9,a4
    800063d0:	f5371ee3          	bne	a4,s3,8000632c <consoleread+0x88>
    800063d4:	000b851b          	sext.w	a0,s7
    800063d8:	f96bf2e3          	bgeu	s7,s6,8000635c <consoleread+0xb8>
    800063dc:	08f4ac23          	sw	a5,152(s1)
    800063e0:	f7dff06f          	j	8000635c <consoleread+0xb8>

00000000800063e4 <consputc>:
    800063e4:	10000793          	li	a5,256
    800063e8:	00f50663          	beq	a0,a5,800063f4 <consputc+0x10>
    800063ec:	00001317          	auipc	t1,0x1
    800063f0:	9f430067          	jr	-1548(t1) # 80006de0 <uartputc_sync>
    800063f4:	ff010113          	addi	sp,sp,-16
    800063f8:	00113423          	sd	ra,8(sp)
    800063fc:	00813023          	sd	s0,0(sp)
    80006400:	01010413          	addi	s0,sp,16
    80006404:	00800513          	li	a0,8
    80006408:	00001097          	auipc	ra,0x1
    8000640c:	9d8080e7          	jalr	-1576(ra) # 80006de0 <uartputc_sync>
    80006410:	02000513          	li	a0,32
    80006414:	00001097          	auipc	ra,0x1
    80006418:	9cc080e7          	jalr	-1588(ra) # 80006de0 <uartputc_sync>
    8000641c:	00013403          	ld	s0,0(sp)
    80006420:	00813083          	ld	ra,8(sp)
    80006424:	00800513          	li	a0,8
    80006428:	01010113          	addi	sp,sp,16
    8000642c:	00001317          	auipc	t1,0x1
    80006430:	9b430067          	jr	-1612(t1) # 80006de0 <uartputc_sync>

0000000080006434 <consoleintr>:
    80006434:	fe010113          	addi	sp,sp,-32
    80006438:	00813823          	sd	s0,16(sp)
    8000643c:	00913423          	sd	s1,8(sp)
    80006440:	01213023          	sd	s2,0(sp)
    80006444:	00113c23          	sd	ra,24(sp)
    80006448:	02010413          	addi	s0,sp,32
    8000644c:	00005917          	auipc	s2,0x5
    80006450:	c0c90913          	addi	s2,s2,-1012 # 8000b058 <cons>
    80006454:	00050493          	mv	s1,a0
    80006458:	00090513          	mv	a0,s2
    8000645c:	00001097          	auipc	ra,0x1
    80006460:	e40080e7          	jalr	-448(ra) # 8000729c <acquire>
    80006464:	02048c63          	beqz	s1,8000649c <consoleintr+0x68>
    80006468:	0a092783          	lw	a5,160(s2)
    8000646c:	09892703          	lw	a4,152(s2)
    80006470:	07f00693          	li	a3,127
    80006474:	40e7873b          	subw	a4,a5,a4
    80006478:	02e6e263          	bltu	a3,a4,8000649c <consoleintr+0x68>
    8000647c:	00d00713          	li	a4,13
    80006480:	04e48063          	beq	s1,a4,800064c0 <consoleintr+0x8c>
    80006484:	07f7f713          	andi	a4,a5,127
    80006488:	00e90733          	add	a4,s2,a4
    8000648c:	0017879b          	addiw	a5,a5,1
    80006490:	0af92023          	sw	a5,160(s2)
    80006494:	00970c23          	sb	s1,24(a4)
    80006498:	08f92e23          	sw	a5,156(s2)
    8000649c:	01013403          	ld	s0,16(sp)
    800064a0:	01813083          	ld	ra,24(sp)
    800064a4:	00813483          	ld	s1,8(sp)
    800064a8:	00013903          	ld	s2,0(sp)
    800064ac:	00005517          	auipc	a0,0x5
    800064b0:	bac50513          	addi	a0,a0,-1108 # 8000b058 <cons>
    800064b4:	02010113          	addi	sp,sp,32
    800064b8:	00001317          	auipc	t1,0x1
    800064bc:	eb030067          	jr	-336(t1) # 80007368 <release>
    800064c0:	00a00493          	li	s1,10
    800064c4:	fc1ff06f          	j	80006484 <consoleintr+0x50>

00000000800064c8 <consoleinit>:
    800064c8:	fe010113          	addi	sp,sp,-32
    800064cc:	00113c23          	sd	ra,24(sp)
    800064d0:	00813823          	sd	s0,16(sp)
    800064d4:	00913423          	sd	s1,8(sp)
    800064d8:	02010413          	addi	s0,sp,32
    800064dc:	00005497          	auipc	s1,0x5
    800064e0:	b7c48493          	addi	s1,s1,-1156 # 8000b058 <cons>
    800064e4:	00048513          	mv	a0,s1
    800064e8:	00002597          	auipc	a1,0x2
    800064ec:	f4858593          	addi	a1,a1,-184 # 80008430 <CONSOLE_STATUS+0x420>
    800064f0:	00001097          	auipc	ra,0x1
    800064f4:	d88080e7          	jalr	-632(ra) # 80007278 <initlock>
    800064f8:	00000097          	auipc	ra,0x0
    800064fc:	7ac080e7          	jalr	1964(ra) # 80006ca4 <uartinit>
    80006500:	01813083          	ld	ra,24(sp)
    80006504:	01013403          	ld	s0,16(sp)
    80006508:	00000797          	auipc	a5,0x0
    8000650c:	d9c78793          	addi	a5,a5,-612 # 800062a4 <consoleread>
    80006510:	0af4bc23          	sd	a5,184(s1)
    80006514:	00000797          	auipc	a5,0x0
    80006518:	cec78793          	addi	a5,a5,-788 # 80006200 <consolewrite>
    8000651c:	0cf4b023          	sd	a5,192(s1)
    80006520:	00813483          	ld	s1,8(sp)
    80006524:	02010113          	addi	sp,sp,32
    80006528:	00008067          	ret

000000008000652c <console_read>:
    8000652c:	ff010113          	addi	sp,sp,-16
    80006530:	00813423          	sd	s0,8(sp)
    80006534:	01010413          	addi	s0,sp,16
    80006538:	00813403          	ld	s0,8(sp)
    8000653c:	00005317          	auipc	t1,0x5
    80006540:	bd433303          	ld	t1,-1068(t1) # 8000b110 <devsw+0x10>
    80006544:	01010113          	addi	sp,sp,16
    80006548:	00030067          	jr	t1

000000008000654c <console_write>:
    8000654c:	ff010113          	addi	sp,sp,-16
    80006550:	00813423          	sd	s0,8(sp)
    80006554:	01010413          	addi	s0,sp,16
    80006558:	00813403          	ld	s0,8(sp)
    8000655c:	00005317          	auipc	t1,0x5
    80006560:	bbc33303          	ld	t1,-1092(t1) # 8000b118 <devsw+0x18>
    80006564:	01010113          	addi	sp,sp,16
    80006568:	00030067          	jr	t1

000000008000656c <panic>:
    8000656c:	fe010113          	addi	sp,sp,-32
    80006570:	00113c23          	sd	ra,24(sp)
    80006574:	00813823          	sd	s0,16(sp)
    80006578:	00913423          	sd	s1,8(sp)
    8000657c:	02010413          	addi	s0,sp,32
    80006580:	00050493          	mv	s1,a0
    80006584:	00002517          	auipc	a0,0x2
    80006588:	eb450513          	addi	a0,a0,-332 # 80008438 <CONSOLE_STATUS+0x428>
    8000658c:	00005797          	auipc	a5,0x5
    80006590:	c207a623          	sw	zero,-980(a5) # 8000b1b8 <pr+0x18>
    80006594:	00000097          	auipc	ra,0x0
    80006598:	034080e7          	jalr	52(ra) # 800065c8 <__printf>
    8000659c:	00048513          	mv	a0,s1
    800065a0:	00000097          	auipc	ra,0x0
    800065a4:	028080e7          	jalr	40(ra) # 800065c8 <__printf>
    800065a8:	00002517          	auipc	a0,0x2
    800065ac:	b6050513          	addi	a0,a0,-1184 # 80008108 <CONSOLE_STATUS+0xf8>
    800065b0:	00000097          	auipc	ra,0x0
    800065b4:	018080e7          	jalr	24(ra) # 800065c8 <__printf>
    800065b8:	00100793          	li	a5,1
    800065bc:	00004717          	auipc	a4,0x4
    800065c0:	92f72e23          	sw	a5,-1732(a4) # 80009ef8 <panicked>
    800065c4:	0000006f          	j	800065c4 <panic+0x58>

00000000800065c8 <__printf>:
    800065c8:	f3010113          	addi	sp,sp,-208
    800065cc:	08813023          	sd	s0,128(sp)
    800065d0:	07313423          	sd	s3,104(sp)
    800065d4:	09010413          	addi	s0,sp,144
    800065d8:	05813023          	sd	s8,64(sp)
    800065dc:	08113423          	sd	ra,136(sp)
    800065e0:	06913c23          	sd	s1,120(sp)
    800065e4:	07213823          	sd	s2,112(sp)
    800065e8:	07413023          	sd	s4,96(sp)
    800065ec:	05513c23          	sd	s5,88(sp)
    800065f0:	05613823          	sd	s6,80(sp)
    800065f4:	05713423          	sd	s7,72(sp)
    800065f8:	03913c23          	sd	s9,56(sp)
    800065fc:	03a13823          	sd	s10,48(sp)
    80006600:	03b13423          	sd	s11,40(sp)
    80006604:	00005317          	auipc	t1,0x5
    80006608:	b9c30313          	addi	t1,t1,-1124 # 8000b1a0 <pr>
    8000660c:	01832c03          	lw	s8,24(t1)
    80006610:	00b43423          	sd	a1,8(s0)
    80006614:	00c43823          	sd	a2,16(s0)
    80006618:	00d43c23          	sd	a3,24(s0)
    8000661c:	02e43023          	sd	a4,32(s0)
    80006620:	02f43423          	sd	a5,40(s0)
    80006624:	03043823          	sd	a6,48(s0)
    80006628:	03143c23          	sd	a7,56(s0)
    8000662c:	00050993          	mv	s3,a0
    80006630:	4a0c1663          	bnez	s8,80006adc <__printf+0x514>
    80006634:	60098c63          	beqz	s3,80006c4c <__printf+0x684>
    80006638:	0009c503          	lbu	a0,0(s3)
    8000663c:	00840793          	addi	a5,s0,8
    80006640:	f6f43c23          	sd	a5,-136(s0)
    80006644:	00000493          	li	s1,0
    80006648:	22050063          	beqz	a0,80006868 <__printf+0x2a0>
    8000664c:	00002a37          	lui	s4,0x2
    80006650:	00018ab7          	lui	s5,0x18
    80006654:	000f4b37          	lui	s6,0xf4
    80006658:	00989bb7          	lui	s7,0x989
    8000665c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006660:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006664:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006668:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000666c:	00148c9b          	addiw	s9,s1,1
    80006670:	02500793          	li	a5,37
    80006674:	01998933          	add	s2,s3,s9
    80006678:	38f51263          	bne	a0,a5,800069fc <__printf+0x434>
    8000667c:	00094783          	lbu	a5,0(s2)
    80006680:	00078c9b          	sext.w	s9,a5
    80006684:	1e078263          	beqz	a5,80006868 <__printf+0x2a0>
    80006688:	0024849b          	addiw	s1,s1,2
    8000668c:	07000713          	li	a4,112
    80006690:	00998933          	add	s2,s3,s1
    80006694:	38e78a63          	beq	a5,a4,80006a28 <__printf+0x460>
    80006698:	20f76863          	bltu	a4,a5,800068a8 <__printf+0x2e0>
    8000669c:	42a78863          	beq	a5,a0,80006acc <__printf+0x504>
    800066a0:	06400713          	li	a4,100
    800066a4:	40e79663          	bne	a5,a4,80006ab0 <__printf+0x4e8>
    800066a8:	f7843783          	ld	a5,-136(s0)
    800066ac:	0007a603          	lw	a2,0(a5)
    800066b0:	00878793          	addi	a5,a5,8
    800066b4:	f6f43c23          	sd	a5,-136(s0)
    800066b8:	42064a63          	bltz	a2,80006aec <__printf+0x524>
    800066bc:	00a00713          	li	a4,10
    800066c0:	02e677bb          	remuw	a5,a2,a4
    800066c4:	00002d97          	auipc	s11,0x2
    800066c8:	d9cd8d93          	addi	s11,s11,-612 # 80008460 <digits>
    800066cc:	00900593          	li	a1,9
    800066d0:	0006051b          	sext.w	a0,a2
    800066d4:	00000c93          	li	s9,0
    800066d8:	02079793          	slli	a5,a5,0x20
    800066dc:	0207d793          	srli	a5,a5,0x20
    800066e0:	00fd87b3          	add	a5,s11,a5
    800066e4:	0007c783          	lbu	a5,0(a5)
    800066e8:	02e656bb          	divuw	a3,a2,a4
    800066ec:	f8f40023          	sb	a5,-128(s0)
    800066f0:	14c5d863          	bge	a1,a2,80006840 <__printf+0x278>
    800066f4:	06300593          	li	a1,99
    800066f8:	00100c93          	li	s9,1
    800066fc:	02e6f7bb          	remuw	a5,a3,a4
    80006700:	02079793          	slli	a5,a5,0x20
    80006704:	0207d793          	srli	a5,a5,0x20
    80006708:	00fd87b3          	add	a5,s11,a5
    8000670c:	0007c783          	lbu	a5,0(a5)
    80006710:	02e6d73b          	divuw	a4,a3,a4
    80006714:	f8f400a3          	sb	a5,-127(s0)
    80006718:	12a5f463          	bgeu	a1,a0,80006840 <__printf+0x278>
    8000671c:	00a00693          	li	a3,10
    80006720:	00900593          	li	a1,9
    80006724:	02d777bb          	remuw	a5,a4,a3
    80006728:	02079793          	slli	a5,a5,0x20
    8000672c:	0207d793          	srli	a5,a5,0x20
    80006730:	00fd87b3          	add	a5,s11,a5
    80006734:	0007c503          	lbu	a0,0(a5)
    80006738:	02d757bb          	divuw	a5,a4,a3
    8000673c:	f8a40123          	sb	a0,-126(s0)
    80006740:	48e5f263          	bgeu	a1,a4,80006bc4 <__printf+0x5fc>
    80006744:	06300513          	li	a0,99
    80006748:	02d7f5bb          	remuw	a1,a5,a3
    8000674c:	02059593          	slli	a1,a1,0x20
    80006750:	0205d593          	srli	a1,a1,0x20
    80006754:	00bd85b3          	add	a1,s11,a1
    80006758:	0005c583          	lbu	a1,0(a1)
    8000675c:	02d7d7bb          	divuw	a5,a5,a3
    80006760:	f8b401a3          	sb	a1,-125(s0)
    80006764:	48e57263          	bgeu	a0,a4,80006be8 <__printf+0x620>
    80006768:	3e700513          	li	a0,999
    8000676c:	02d7f5bb          	remuw	a1,a5,a3
    80006770:	02059593          	slli	a1,a1,0x20
    80006774:	0205d593          	srli	a1,a1,0x20
    80006778:	00bd85b3          	add	a1,s11,a1
    8000677c:	0005c583          	lbu	a1,0(a1)
    80006780:	02d7d7bb          	divuw	a5,a5,a3
    80006784:	f8b40223          	sb	a1,-124(s0)
    80006788:	46e57663          	bgeu	a0,a4,80006bf4 <__printf+0x62c>
    8000678c:	02d7f5bb          	remuw	a1,a5,a3
    80006790:	02059593          	slli	a1,a1,0x20
    80006794:	0205d593          	srli	a1,a1,0x20
    80006798:	00bd85b3          	add	a1,s11,a1
    8000679c:	0005c583          	lbu	a1,0(a1)
    800067a0:	02d7d7bb          	divuw	a5,a5,a3
    800067a4:	f8b402a3          	sb	a1,-123(s0)
    800067a8:	46ea7863          	bgeu	s4,a4,80006c18 <__printf+0x650>
    800067ac:	02d7f5bb          	remuw	a1,a5,a3
    800067b0:	02059593          	slli	a1,a1,0x20
    800067b4:	0205d593          	srli	a1,a1,0x20
    800067b8:	00bd85b3          	add	a1,s11,a1
    800067bc:	0005c583          	lbu	a1,0(a1)
    800067c0:	02d7d7bb          	divuw	a5,a5,a3
    800067c4:	f8b40323          	sb	a1,-122(s0)
    800067c8:	3eeaf863          	bgeu	s5,a4,80006bb8 <__printf+0x5f0>
    800067cc:	02d7f5bb          	remuw	a1,a5,a3
    800067d0:	02059593          	slli	a1,a1,0x20
    800067d4:	0205d593          	srli	a1,a1,0x20
    800067d8:	00bd85b3          	add	a1,s11,a1
    800067dc:	0005c583          	lbu	a1,0(a1)
    800067e0:	02d7d7bb          	divuw	a5,a5,a3
    800067e4:	f8b403a3          	sb	a1,-121(s0)
    800067e8:	42eb7e63          	bgeu	s6,a4,80006c24 <__printf+0x65c>
    800067ec:	02d7f5bb          	remuw	a1,a5,a3
    800067f0:	02059593          	slli	a1,a1,0x20
    800067f4:	0205d593          	srli	a1,a1,0x20
    800067f8:	00bd85b3          	add	a1,s11,a1
    800067fc:	0005c583          	lbu	a1,0(a1)
    80006800:	02d7d7bb          	divuw	a5,a5,a3
    80006804:	f8b40423          	sb	a1,-120(s0)
    80006808:	42ebfc63          	bgeu	s7,a4,80006c40 <__printf+0x678>
    8000680c:	02079793          	slli	a5,a5,0x20
    80006810:	0207d793          	srli	a5,a5,0x20
    80006814:	00fd8db3          	add	s11,s11,a5
    80006818:	000dc703          	lbu	a4,0(s11)
    8000681c:	00a00793          	li	a5,10
    80006820:	00900c93          	li	s9,9
    80006824:	f8e404a3          	sb	a4,-119(s0)
    80006828:	00065c63          	bgez	a2,80006840 <__printf+0x278>
    8000682c:	f9040713          	addi	a4,s0,-112
    80006830:	00f70733          	add	a4,a4,a5
    80006834:	02d00693          	li	a3,45
    80006838:	fed70823          	sb	a3,-16(a4)
    8000683c:	00078c93          	mv	s9,a5
    80006840:	f8040793          	addi	a5,s0,-128
    80006844:	01978cb3          	add	s9,a5,s9
    80006848:	f7f40d13          	addi	s10,s0,-129
    8000684c:	000cc503          	lbu	a0,0(s9)
    80006850:	fffc8c93          	addi	s9,s9,-1
    80006854:	00000097          	auipc	ra,0x0
    80006858:	b90080e7          	jalr	-1136(ra) # 800063e4 <consputc>
    8000685c:	ffac98e3          	bne	s9,s10,8000684c <__printf+0x284>
    80006860:	00094503          	lbu	a0,0(s2)
    80006864:	e00514e3          	bnez	a0,8000666c <__printf+0xa4>
    80006868:	1a0c1663          	bnez	s8,80006a14 <__printf+0x44c>
    8000686c:	08813083          	ld	ra,136(sp)
    80006870:	08013403          	ld	s0,128(sp)
    80006874:	07813483          	ld	s1,120(sp)
    80006878:	07013903          	ld	s2,112(sp)
    8000687c:	06813983          	ld	s3,104(sp)
    80006880:	06013a03          	ld	s4,96(sp)
    80006884:	05813a83          	ld	s5,88(sp)
    80006888:	05013b03          	ld	s6,80(sp)
    8000688c:	04813b83          	ld	s7,72(sp)
    80006890:	04013c03          	ld	s8,64(sp)
    80006894:	03813c83          	ld	s9,56(sp)
    80006898:	03013d03          	ld	s10,48(sp)
    8000689c:	02813d83          	ld	s11,40(sp)
    800068a0:	0d010113          	addi	sp,sp,208
    800068a4:	00008067          	ret
    800068a8:	07300713          	li	a4,115
    800068ac:	1ce78a63          	beq	a5,a4,80006a80 <__printf+0x4b8>
    800068b0:	07800713          	li	a4,120
    800068b4:	1ee79e63          	bne	a5,a4,80006ab0 <__printf+0x4e8>
    800068b8:	f7843783          	ld	a5,-136(s0)
    800068bc:	0007a703          	lw	a4,0(a5)
    800068c0:	00878793          	addi	a5,a5,8
    800068c4:	f6f43c23          	sd	a5,-136(s0)
    800068c8:	28074263          	bltz	a4,80006b4c <__printf+0x584>
    800068cc:	00002d97          	auipc	s11,0x2
    800068d0:	b94d8d93          	addi	s11,s11,-1132 # 80008460 <digits>
    800068d4:	00f77793          	andi	a5,a4,15
    800068d8:	00fd87b3          	add	a5,s11,a5
    800068dc:	0007c683          	lbu	a3,0(a5)
    800068e0:	00f00613          	li	a2,15
    800068e4:	0007079b          	sext.w	a5,a4
    800068e8:	f8d40023          	sb	a3,-128(s0)
    800068ec:	0047559b          	srliw	a1,a4,0x4
    800068f0:	0047569b          	srliw	a3,a4,0x4
    800068f4:	00000c93          	li	s9,0
    800068f8:	0ee65063          	bge	a2,a4,800069d8 <__printf+0x410>
    800068fc:	00f6f693          	andi	a3,a3,15
    80006900:	00dd86b3          	add	a3,s11,a3
    80006904:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006908:	0087d79b          	srliw	a5,a5,0x8
    8000690c:	00100c93          	li	s9,1
    80006910:	f8d400a3          	sb	a3,-127(s0)
    80006914:	0cb67263          	bgeu	a2,a1,800069d8 <__printf+0x410>
    80006918:	00f7f693          	andi	a3,a5,15
    8000691c:	00dd86b3          	add	a3,s11,a3
    80006920:	0006c583          	lbu	a1,0(a3)
    80006924:	00f00613          	li	a2,15
    80006928:	0047d69b          	srliw	a3,a5,0x4
    8000692c:	f8b40123          	sb	a1,-126(s0)
    80006930:	0047d593          	srli	a1,a5,0x4
    80006934:	28f67e63          	bgeu	a2,a5,80006bd0 <__printf+0x608>
    80006938:	00f6f693          	andi	a3,a3,15
    8000693c:	00dd86b3          	add	a3,s11,a3
    80006940:	0006c503          	lbu	a0,0(a3)
    80006944:	0087d813          	srli	a6,a5,0x8
    80006948:	0087d69b          	srliw	a3,a5,0x8
    8000694c:	f8a401a3          	sb	a0,-125(s0)
    80006950:	28b67663          	bgeu	a2,a1,80006bdc <__printf+0x614>
    80006954:	00f6f693          	andi	a3,a3,15
    80006958:	00dd86b3          	add	a3,s11,a3
    8000695c:	0006c583          	lbu	a1,0(a3)
    80006960:	00c7d513          	srli	a0,a5,0xc
    80006964:	00c7d69b          	srliw	a3,a5,0xc
    80006968:	f8b40223          	sb	a1,-124(s0)
    8000696c:	29067a63          	bgeu	a2,a6,80006c00 <__printf+0x638>
    80006970:	00f6f693          	andi	a3,a3,15
    80006974:	00dd86b3          	add	a3,s11,a3
    80006978:	0006c583          	lbu	a1,0(a3)
    8000697c:	0107d813          	srli	a6,a5,0x10
    80006980:	0107d69b          	srliw	a3,a5,0x10
    80006984:	f8b402a3          	sb	a1,-123(s0)
    80006988:	28a67263          	bgeu	a2,a0,80006c0c <__printf+0x644>
    8000698c:	00f6f693          	andi	a3,a3,15
    80006990:	00dd86b3          	add	a3,s11,a3
    80006994:	0006c683          	lbu	a3,0(a3)
    80006998:	0147d79b          	srliw	a5,a5,0x14
    8000699c:	f8d40323          	sb	a3,-122(s0)
    800069a0:	21067663          	bgeu	a2,a6,80006bac <__printf+0x5e4>
    800069a4:	02079793          	slli	a5,a5,0x20
    800069a8:	0207d793          	srli	a5,a5,0x20
    800069ac:	00fd8db3          	add	s11,s11,a5
    800069b0:	000dc683          	lbu	a3,0(s11)
    800069b4:	00800793          	li	a5,8
    800069b8:	00700c93          	li	s9,7
    800069bc:	f8d403a3          	sb	a3,-121(s0)
    800069c0:	00075c63          	bgez	a4,800069d8 <__printf+0x410>
    800069c4:	f9040713          	addi	a4,s0,-112
    800069c8:	00f70733          	add	a4,a4,a5
    800069cc:	02d00693          	li	a3,45
    800069d0:	fed70823          	sb	a3,-16(a4)
    800069d4:	00078c93          	mv	s9,a5
    800069d8:	f8040793          	addi	a5,s0,-128
    800069dc:	01978cb3          	add	s9,a5,s9
    800069e0:	f7f40d13          	addi	s10,s0,-129
    800069e4:	000cc503          	lbu	a0,0(s9)
    800069e8:	fffc8c93          	addi	s9,s9,-1
    800069ec:	00000097          	auipc	ra,0x0
    800069f0:	9f8080e7          	jalr	-1544(ra) # 800063e4 <consputc>
    800069f4:	ff9d18e3          	bne	s10,s9,800069e4 <__printf+0x41c>
    800069f8:	0100006f          	j	80006a08 <__printf+0x440>
    800069fc:	00000097          	auipc	ra,0x0
    80006a00:	9e8080e7          	jalr	-1560(ra) # 800063e4 <consputc>
    80006a04:	000c8493          	mv	s1,s9
    80006a08:	00094503          	lbu	a0,0(s2)
    80006a0c:	c60510e3          	bnez	a0,8000666c <__printf+0xa4>
    80006a10:	e40c0ee3          	beqz	s8,8000686c <__printf+0x2a4>
    80006a14:	00004517          	auipc	a0,0x4
    80006a18:	78c50513          	addi	a0,a0,1932 # 8000b1a0 <pr>
    80006a1c:	00001097          	auipc	ra,0x1
    80006a20:	94c080e7          	jalr	-1716(ra) # 80007368 <release>
    80006a24:	e49ff06f          	j	8000686c <__printf+0x2a4>
    80006a28:	f7843783          	ld	a5,-136(s0)
    80006a2c:	03000513          	li	a0,48
    80006a30:	01000d13          	li	s10,16
    80006a34:	00878713          	addi	a4,a5,8
    80006a38:	0007bc83          	ld	s9,0(a5)
    80006a3c:	f6e43c23          	sd	a4,-136(s0)
    80006a40:	00000097          	auipc	ra,0x0
    80006a44:	9a4080e7          	jalr	-1628(ra) # 800063e4 <consputc>
    80006a48:	07800513          	li	a0,120
    80006a4c:	00000097          	auipc	ra,0x0
    80006a50:	998080e7          	jalr	-1640(ra) # 800063e4 <consputc>
    80006a54:	00002d97          	auipc	s11,0x2
    80006a58:	a0cd8d93          	addi	s11,s11,-1524 # 80008460 <digits>
    80006a5c:	03ccd793          	srli	a5,s9,0x3c
    80006a60:	00fd87b3          	add	a5,s11,a5
    80006a64:	0007c503          	lbu	a0,0(a5)
    80006a68:	fffd0d1b          	addiw	s10,s10,-1
    80006a6c:	004c9c93          	slli	s9,s9,0x4
    80006a70:	00000097          	auipc	ra,0x0
    80006a74:	974080e7          	jalr	-1676(ra) # 800063e4 <consputc>
    80006a78:	fe0d12e3          	bnez	s10,80006a5c <__printf+0x494>
    80006a7c:	f8dff06f          	j	80006a08 <__printf+0x440>
    80006a80:	f7843783          	ld	a5,-136(s0)
    80006a84:	0007bc83          	ld	s9,0(a5)
    80006a88:	00878793          	addi	a5,a5,8
    80006a8c:	f6f43c23          	sd	a5,-136(s0)
    80006a90:	000c9a63          	bnez	s9,80006aa4 <__printf+0x4dc>
    80006a94:	1080006f          	j	80006b9c <__printf+0x5d4>
    80006a98:	001c8c93          	addi	s9,s9,1
    80006a9c:	00000097          	auipc	ra,0x0
    80006aa0:	948080e7          	jalr	-1720(ra) # 800063e4 <consputc>
    80006aa4:	000cc503          	lbu	a0,0(s9)
    80006aa8:	fe0518e3          	bnez	a0,80006a98 <__printf+0x4d0>
    80006aac:	f5dff06f          	j	80006a08 <__printf+0x440>
    80006ab0:	02500513          	li	a0,37
    80006ab4:	00000097          	auipc	ra,0x0
    80006ab8:	930080e7          	jalr	-1744(ra) # 800063e4 <consputc>
    80006abc:	000c8513          	mv	a0,s9
    80006ac0:	00000097          	auipc	ra,0x0
    80006ac4:	924080e7          	jalr	-1756(ra) # 800063e4 <consputc>
    80006ac8:	f41ff06f          	j	80006a08 <__printf+0x440>
    80006acc:	02500513          	li	a0,37
    80006ad0:	00000097          	auipc	ra,0x0
    80006ad4:	914080e7          	jalr	-1772(ra) # 800063e4 <consputc>
    80006ad8:	f31ff06f          	j	80006a08 <__printf+0x440>
    80006adc:	00030513          	mv	a0,t1
    80006ae0:	00000097          	auipc	ra,0x0
    80006ae4:	7bc080e7          	jalr	1980(ra) # 8000729c <acquire>
    80006ae8:	b4dff06f          	j	80006634 <__printf+0x6c>
    80006aec:	40c0053b          	negw	a0,a2
    80006af0:	00a00713          	li	a4,10
    80006af4:	02e576bb          	remuw	a3,a0,a4
    80006af8:	00002d97          	auipc	s11,0x2
    80006afc:	968d8d93          	addi	s11,s11,-1688 # 80008460 <digits>
    80006b00:	ff700593          	li	a1,-9
    80006b04:	02069693          	slli	a3,a3,0x20
    80006b08:	0206d693          	srli	a3,a3,0x20
    80006b0c:	00dd86b3          	add	a3,s11,a3
    80006b10:	0006c683          	lbu	a3,0(a3)
    80006b14:	02e557bb          	divuw	a5,a0,a4
    80006b18:	f8d40023          	sb	a3,-128(s0)
    80006b1c:	10b65e63          	bge	a2,a1,80006c38 <__printf+0x670>
    80006b20:	06300593          	li	a1,99
    80006b24:	02e7f6bb          	remuw	a3,a5,a4
    80006b28:	02069693          	slli	a3,a3,0x20
    80006b2c:	0206d693          	srli	a3,a3,0x20
    80006b30:	00dd86b3          	add	a3,s11,a3
    80006b34:	0006c683          	lbu	a3,0(a3)
    80006b38:	02e7d73b          	divuw	a4,a5,a4
    80006b3c:	00200793          	li	a5,2
    80006b40:	f8d400a3          	sb	a3,-127(s0)
    80006b44:	bca5ece3          	bltu	a1,a0,8000671c <__printf+0x154>
    80006b48:	ce5ff06f          	j	8000682c <__printf+0x264>
    80006b4c:	40e007bb          	negw	a5,a4
    80006b50:	00002d97          	auipc	s11,0x2
    80006b54:	910d8d93          	addi	s11,s11,-1776 # 80008460 <digits>
    80006b58:	00f7f693          	andi	a3,a5,15
    80006b5c:	00dd86b3          	add	a3,s11,a3
    80006b60:	0006c583          	lbu	a1,0(a3)
    80006b64:	ff100613          	li	a2,-15
    80006b68:	0047d69b          	srliw	a3,a5,0x4
    80006b6c:	f8b40023          	sb	a1,-128(s0)
    80006b70:	0047d59b          	srliw	a1,a5,0x4
    80006b74:	0ac75e63          	bge	a4,a2,80006c30 <__printf+0x668>
    80006b78:	00f6f693          	andi	a3,a3,15
    80006b7c:	00dd86b3          	add	a3,s11,a3
    80006b80:	0006c603          	lbu	a2,0(a3)
    80006b84:	00f00693          	li	a3,15
    80006b88:	0087d79b          	srliw	a5,a5,0x8
    80006b8c:	f8c400a3          	sb	a2,-127(s0)
    80006b90:	d8b6e4e3          	bltu	a3,a1,80006918 <__printf+0x350>
    80006b94:	00200793          	li	a5,2
    80006b98:	e2dff06f          	j	800069c4 <__printf+0x3fc>
    80006b9c:	00002c97          	auipc	s9,0x2
    80006ba0:	8a4c8c93          	addi	s9,s9,-1884 # 80008440 <CONSOLE_STATUS+0x430>
    80006ba4:	02800513          	li	a0,40
    80006ba8:	ef1ff06f          	j	80006a98 <__printf+0x4d0>
    80006bac:	00700793          	li	a5,7
    80006bb0:	00600c93          	li	s9,6
    80006bb4:	e0dff06f          	j	800069c0 <__printf+0x3f8>
    80006bb8:	00700793          	li	a5,7
    80006bbc:	00600c93          	li	s9,6
    80006bc0:	c69ff06f          	j	80006828 <__printf+0x260>
    80006bc4:	00300793          	li	a5,3
    80006bc8:	00200c93          	li	s9,2
    80006bcc:	c5dff06f          	j	80006828 <__printf+0x260>
    80006bd0:	00300793          	li	a5,3
    80006bd4:	00200c93          	li	s9,2
    80006bd8:	de9ff06f          	j	800069c0 <__printf+0x3f8>
    80006bdc:	00400793          	li	a5,4
    80006be0:	00300c93          	li	s9,3
    80006be4:	dddff06f          	j	800069c0 <__printf+0x3f8>
    80006be8:	00400793          	li	a5,4
    80006bec:	00300c93          	li	s9,3
    80006bf0:	c39ff06f          	j	80006828 <__printf+0x260>
    80006bf4:	00500793          	li	a5,5
    80006bf8:	00400c93          	li	s9,4
    80006bfc:	c2dff06f          	j	80006828 <__printf+0x260>
    80006c00:	00500793          	li	a5,5
    80006c04:	00400c93          	li	s9,4
    80006c08:	db9ff06f          	j	800069c0 <__printf+0x3f8>
    80006c0c:	00600793          	li	a5,6
    80006c10:	00500c93          	li	s9,5
    80006c14:	dadff06f          	j	800069c0 <__printf+0x3f8>
    80006c18:	00600793          	li	a5,6
    80006c1c:	00500c93          	li	s9,5
    80006c20:	c09ff06f          	j	80006828 <__printf+0x260>
    80006c24:	00800793          	li	a5,8
    80006c28:	00700c93          	li	s9,7
    80006c2c:	bfdff06f          	j	80006828 <__printf+0x260>
    80006c30:	00100793          	li	a5,1
    80006c34:	d91ff06f          	j	800069c4 <__printf+0x3fc>
    80006c38:	00100793          	li	a5,1
    80006c3c:	bf1ff06f          	j	8000682c <__printf+0x264>
    80006c40:	00900793          	li	a5,9
    80006c44:	00800c93          	li	s9,8
    80006c48:	be1ff06f          	j	80006828 <__printf+0x260>
    80006c4c:	00001517          	auipc	a0,0x1
    80006c50:	7fc50513          	addi	a0,a0,2044 # 80008448 <CONSOLE_STATUS+0x438>
    80006c54:	00000097          	auipc	ra,0x0
    80006c58:	918080e7          	jalr	-1768(ra) # 8000656c <panic>

0000000080006c5c <printfinit>:
    80006c5c:	fe010113          	addi	sp,sp,-32
    80006c60:	00813823          	sd	s0,16(sp)
    80006c64:	00913423          	sd	s1,8(sp)
    80006c68:	00113c23          	sd	ra,24(sp)
    80006c6c:	02010413          	addi	s0,sp,32
    80006c70:	00004497          	auipc	s1,0x4
    80006c74:	53048493          	addi	s1,s1,1328 # 8000b1a0 <pr>
    80006c78:	00048513          	mv	a0,s1
    80006c7c:	00001597          	auipc	a1,0x1
    80006c80:	7dc58593          	addi	a1,a1,2012 # 80008458 <CONSOLE_STATUS+0x448>
    80006c84:	00000097          	auipc	ra,0x0
    80006c88:	5f4080e7          	jalr	1524(ra) # 80007278 <initlock>
    80006c8c:	01813083          	ld	ra,24(sp)
    80006c90:	01013403          	ld	s0,16(sp)
    80006c94:	0004ac23          	sw	zero,24(s1)
    80006c98:	00813483          	ld	s1,8(sp)
    80006c9c:	02010113          	addi	sp,sp,32
    80006ca0:	00008067          	ret

0000000080006ca4 <uartinit>:
    80006ca4:	ff010113          	addi	sp,sp,-16
    80006ca8:	00813423          	sd	s0,8(sp)
    80006cac:	01010413          	addi	s0,sp,16
    80006cb0:	100007b7          	lui	a5,0x10000
    80006cb4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006cb8:	f8000713          	li	a4,-128
    80006cbc:	00e781a3          	sb	a4,3(a5)
    80006cc0:	00300713          	li	a4,3
    80006cc4:	00e78023          	sb	a4,0(a5)
    80006cc8:	000780a3          	sb	zero,1(a5)
    80006ccc:	00e781a3          	sb	a4,3(a5)
    80006cd0:	00700693          	li	a3,7
    80006cd4:	00d78123          	sb	a3,2(a5)
    80006cd8:	00e780a3          	sb	a4,1(a5)
    80006cdc:	00813403          	ld	s0,8(sp)
    80006ce0:	01010113          	addi	sp,sp,16
    80006ce4:	00008067          	ret

0000000080006ce8 <uartputc>:
    80006ce8:	00003797          	auipc	a5,0x3
    80006cec:	2107a783          	lw	a5,528(a5) # 80009ef8 <panicked>
    80006cf0:	00078463          	beqz	a5,80006cf8 <uartputc+0x10>
    80006cf4:	0000006f          	j	80006cf4 <uartputc+0xc>
    80006cf8:	fd010113          	addi	sp,sp,-48
    80006cfc:	02813023          	sd	s0,32(sp)
    80006d00:	00913c23          	sd	s1,24(sp)
    80006d04:	01213823          	sd	s2,16(sp)
    80006d08:	01313423          	sd	s3,8(sp)
    80006d0c:	02113423          	sd	ra,40(sp)
    80006d10:	03010413          	addi	s0,sp,48
    80006d14:	00003917          	auipc	s2,0x3
    80006d18:	1ec90913          	addi	s2,s2,492 # 80009f00 <uart_tx_r>
    80006d1c:	00093783          	ld	a5,0(s2)
    80006d20:	00003497          	auipc	s1,0x3
    80006d24:	1e848493          	addi	s1,s1,488 # 80009f08 <uart_tx_w>
    80006d28:	0004b703          	ld	a4,0(s1)
    80006d2c:	02078693          	addi	a3,a5,32
    80006d30:	00050993          	mv	s3,a0
    80006d34:	02e69c63          	bne	a3,a4,80006d6c <uartputc+0x84>
    80006d38:	00001097          	auipc	ra,0x1
    80006d3c:	834080e7          	jalr	-1996(ra) # 8000756c <push_on>
    80006d40:	00093783          	ld	a5,0(s2)
    80006d44:	0004b703          	ld	a4,0(s1)
    80006d48:	02078793          	addi	a5,a5,32
    80006d4c:	00e79463          	bne	a5,a4,80006d54 <uartputc+0x6c>
    80006d50:	0000006f          	j	80006d50 <uartputc+0x68>
    80006d54:	00001097          	auipc	ra,0x1
    80006d58:	88c080e7          	jalr	-1908(ra) # 800075e0 <pop_on>
    80006d5c:	00093783          	ld	a5,0(s2)
    80006d60:	0004b703          	ld	a4,0(s1)
    80006d64:	02078693          	addi	a3,a5,32
    80006d68:	fce688e3          	beq	a3,a4,80006d38 <uartputc+0x50>
    80006d6c:	01f77693          	andi	a3,a4,31
    80006d70:	00004597          	auipc	a1,0x4
    80006d74:	45058593          	addi	a1,a1,1104 # 8000b1c0 <uart_tx_buf>
    80006d78:	00d586b3          	add	a3,a1,a3
    80006d7c:	00170713          	addi	a4,a4,1
    80006d80:	01368023          	sb	s3,0(a3)
    80006d84:	00e4b023          	sd	a4,0(s1)
    80006d88:	10000637          	lui	a2,0x10000
    80006d8c:	02f71063          	bne	a4,a5,80006dac <uartputc+0xc4>
    80006d90:	0340006f          	j	80006dc4 <uartputc+0xdc>
    80006d94:	00074703          	lbu	a4,0(a4)
    80006d98:	00f93023          	sd	a5,0(s2)
    80006d9c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006da0:	00093783          	ld	a5,0(s2)
    80006da4:	0004b703          	ld	a4,0(s1)
    80006da8:	00f70e63          	beq	a4,a5,80006dc4 <uartputc+0xdc>
    80006dac:	00564683          	lbu	a3,5(a2)
    80006db0:	01f7f713          	andi	a4,a5,31
    80006db4:	00e58733          	add	a4,a1,a4
    80006db8:	0206f693          	andi	a3,a3,32
    80006dbc:	00178793          	addi	a5,a5,1
    80006dc0:	fc069ae3          	bnez	a3,80006d94 <uartputc+0xac>
    80006dc4:	02813083          	ld	ra,40(sp)
    80006dc8:	02013403          	ld	s0,32(sp)
    80006dcc:	01813483          	ld	s1,24(sp)
    80006dd0:	01013903          	ld	s2,16(sp)
    80006dd4:	00813983          	ld	s3,8(sp)
    80006dd8:	03010113          	addi	sp,sp,48
    80006ddc:	00008067          	ret

0000000080006de0 <uartputc_sync>:
    80006de0:	ff010113          	addi	sp,sp,-16
    80006de4:	00813423          	sd	s0,8(sp)
    80006de8:	01010413          	addi	s0,sp,16
    80006dec:	00003717          	auipc	a4,0x3
    80006df0:	10c72703          	lw	a4,268(a4) # 80009ef8 <panicked>
    80006df4:	02071663          	bnez	a4,80006e20 <uartputc_sync+0x40>
    80006df8:	00050793          	mv	a5,a0
    80006dfc:	100006b7          	lui	a3,0x10000
    80006e00:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006e04:	02077713          	andi	a4,a4,32
    80006e08:	fe070ce3          	beqz	a4,80006e00 <uartputc_sync+0x20>
    80006e0c:	0ff7f793          	andi	a5,a5,255
    80006e10:	00f68023          	sb	a5,0(a3)
    80006e14:	00813403          	ld	s0,8(sp)
    80006e18:	01010113          	addi	sp,sp,16
    80006e1c:	00008067          	ret
    80006e20:	0000006f          	j	80006e20 <uartputc_sync+0x40>

0000000080006e24 <uartstart>:
    80006e24:	ff010113          	addi	sp,sp,-16
    80006e28:	00813423          	sd	s0,8(sp)
    80006e2c:	01010413          	addi	s0,sp,16
    80006e30:	00003617          	auipc	a2,0x3
    80006e34:	0d060613          	addi	a2,a2,208 # 80009f00 <uart_tx_r>
    80006e38:	00003517          	auipc	a0,0x3
    80006e3c:	0d050513          	addi	a0,a0,208 # 80009f08 <uart_tx_w>
    80006e40:	00063783          	ld	a5,0(a2)
    80006e44:	00053703          	ld	a4,0(a0)
    80006e48:	04f70263          	beq	a4,a5,80006e8c <uartstart+0x68>
    80006e4c:	100005b7          	lui	a1,0x10000
    80006e50:	00004817          	auipc	a6,0x4
    80006e54:	37080813          	addi	a6,a6,880 # 8000b1c0 <uart_tx_buf>
    80006e58:	01c0006f          	j	80006e74 <uartstart+0x50>
    80006e5c:	0006c703          	lbu	a4,0(a3)
    80006e60:	00f63023          	sd	a5,0(a2)
    80006e64:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006e68:	00063783          	ld	a5,0(a2)
    80006e6c:	00053703          	ld	a4,0(a0)
    80006e70:	00f70e63          	beq	a4,a5,80006e8c <uartstart+0x68>
    80006e74:	01f7f713          	andi	a4,a5,31
    80006e78:	00e806b3          	add	a3,a6,a4
    80006e7c:	0055c703          	lbu	a4,5(a1)
    80006e80:	00178793          	addi	a5,a5,1
    80006e84:	02077713          	andi	a4,a4,32
    80006e88:	fc071ae3          	bnez	a4,80006e5c <uartstart+0x38>
    80006e8c:	00813403          	ld	s0,8(sp)
    80006e90:	01010113          	addi	sp,sp,16
    80006e94:	00008067          	ret

0000000080006e98 <uartgetc>:
    80006e98:	ff010113          	addi	sp,sp,-16
    80006e9c:	00813423          	sd	s0,8(sp)
    80006ea0:	01010413          	addi	s0,sp,16
    80006ea4:	10000737          	lui	a4,0x10000
    80006ea8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80006eac:	0017f793          	andi	a5,a5,1
    80006eb0:	00078c63          	beqz	a5,80006ec8 <uartgetc+0x30>
    80006eb4:	00074503          	lbu	a0,0(a4)
    80006eb8:	0ff57513          	andi	a0,a0,255
    80006ebc:	00813403          	ld	s0,8(sp)
    80006ec0:	01010113          	addi	sp,sp,16
    80006ec4:	00008067          	ret
    80006ec8:	fff00513          	li	a0,-1
    80006ecc:	ff1ff06f          	j	80006ebc <uartgetc+0x24>

0000000080006ed0 <uartintr>:
    80006ed0:	100007b7          	lui	a5,0x10000
    80006ed4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006ed8:	0017f793          	andi	a5,a5,1
    80006edc:	0a078463          	beqz	a5,80006f84 <uartintr+0xb4>
    80006ee0:	fe010113          	addi	sp,sp,-32
    80006ee4:	00813823          	sd	s0,16(sp)
    80006ee8:	00913423          	sd	s1,8(sp)
    80006eec:	00113c23          	sd	ra,24(sp)
    80006ef0:	02010413          	addi	s0,sp,32
    80006ef4:	100004b7          	lui	s1,0x10000
    80006ef8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80006efc:	0ff57513          	andi	a0,a0,255
    80006f00:	fffff097          	auipc	ra,0xfffff
    80006f04:	534080e7          	jalr	1332(ra) # 80006434 <consoleintr>
    80006f08:	0054c783          	lbu	a5,5(s1)
    80006f0c:	0017f793          	andi	a5,a5,1
    80006f10:	fe0794e3          	bnez	a5,80006ef8 <uartintr+0x28>
    80006f14:	00003617          	auipc	a2,0x3
    80006f18:	fec60613          	addi	a2,a2,-20 # 80009f00 <uart_tx_r>
    80006f1c:	00003517          	auipc	a0,0x3
    80006f20:	fec50513          	addi	a0,a0,-20 # 80009f08 <uart_tx_w>
    80006f24:	00063783          	ld	a5,0(a2)
    80006f28:	00053703          	ld	a4,0(a0)
    80006f2c:	04f70263          	beq	a4,a5,80006f70 <uartintr+0xa0>
    80006f30:	100005b7          	lui	a1,0x10000
    80006f34:	00004817          	auipc	a6,0x4
    80006f38:	28c80813          	addi	a6,a6,652 # 8000b1c0 <uart_tx_buf>
    80006f3c:	01c0006f          	j	80006f58 <uartintr+0x88>
    80006f40:	0006c703          	lbu	a4,0(a3)
    80006f44:	00f63023          	sd	a5,0(a2)
    80006f48:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006f4c:	00063783          	ld	a5,0(a2)
    80006f50:	00053703          	ld	a4,0(a0)
    80006f54:	00f70e63          	beq	a4,a5,80006f70 <uartintr+0xa0>
    80006f58:	01f7f713          	andi	a4,a5,31
    80006f5c:	00e806b3          	add	a3,a6,a4
    80006f60:	0055c703          	lbu	a4,5(a1)
    80006f64:	00178793          	addi	a5,a5,1
    80006f68:	02077713          	andi	a4,a4,32
    80006f6c:	fc071ae3          	bnez	a4,80006f40 <uartintr+0x70>
    80006f70:	01813083          	ld	ra,24(sp)
    80006f74:	01013403          	ld	s0,16(sp)
    80006f78:	00813483          	ld	s1,8(sp)
    80006f7c:	02010113          	addi	sp,sp,32
    80006f80:	00008067          	ret
    80006f84:	00003617          	auipc	a2,0x3
    80006f88:	f7c60613          	addi	a2,a2,-132 # 80009f00 <uart_tx_r>
    80006f8c:	00003517          	auipc	a0,0x3
    80006f90:	f7c50513          	addi	a0,a0,-132 # 80009f08 <uart_tx_w>
    80006f94:	00063783          	ld	a5,0(a2)
    80006f98:	00053703          	ld	a4,0(a0)
    80006f9c:	04f70263          	beq	a4,a5,80006fe0 <uartintr+0x110>
    80006fa0:	100005b7          	lui	a1,0x10000
    80006fa4:	00004817          	auipc	a6,0x4
    80006fa8:	21c80813          	addi	a6,a6,540 # 8000b1c0 <uart_tx_buf>
    80006fac:	01c0006f          	j	80006fc8 <uartintr+0xf8>
    80006fb0:	0006c703          	lbu	a4,0(a3)
    80006fb4:	00f63023          	sd	a5,0(a2)
    80006fb8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006fbc:	00063783          	ld	a5,0(a2)
    80006fc0:	00053703          	ld	a4,0(a0)
    80006fc4:	02f70063          	beq	a4,a5,80006fe4 <uartintr+0x114>
    80006fc8:	01f7f713          	andi	a4,a5,31
    80006fcc:	00e806b3          	add	a3,a6,a4
    80006fd0:	0055c703          	lbu	a4,5(a1)
    80006fd4:	00178793          	addi	a5,a5,1
    80006fd8:	02077713          	andi	a4,a4,32
    80006fdc:	fc071ae3          	bnez	a4,80006fb0 <uartintr+0xe0>
    80006fe0:	00008067          	ret
    80006fe4:	00008067          	ret

0000000080006fe8 <kinit>:
    80006fe8:	fc010113          	addi	sp,sp,-64
    80006fec:	02913423          	sd	s1,40(sp)
    80006ff0:	fffff7b7          	lui	a5,0xfffff
    80006ff4:	00005497          	auipc	s1,0x5
    80006ff8:	1eb48493          	addi	s1,s1,491 # 8000c1df <end+0xfff>
    80006ffc:	02813823          	sd	s0,48(sp)
    80007000:	01313c23          	sd	s3,24(sp)
    80007004:	00f4f4b3          	and	s1,s1,a5
    80007008:	02113c23          	sd	ra,56(sp)
    8000700c:	03213023          	sd	s2,32(sp)
    80007010:	01413823          	sd	s4,16(sp)
    80007014:	01513423          	sd	s5,8(sp)
    80007018:	04010413          	addi	s0,sp,64
    8000701c:	000017b7          	lui	a5,0x1
    80007020:	01100993          	li	s3,17
    80007024:	00f487b3          	add	a5,s1,a5
    80007028:	01b99993          	slli	s3,s3,0x1b
    8000702c:	06f9e063          	bltu	s3,a5,8000708c <kinit+0xa4>
    80007030:	00004a97          	auipc	s5,0x4
    80007034:	1b0a8a93          	addi	s5,s5,432 # 8000b1e0 <end>
    80007038:	0754ec63          	bltu	s1,s5,800070b0 <kinit+0xc8>
    8000703c:	0734fa63          	bgeu	s1,s3,800070b0 <kinit+0xc8>
    80007040:	00088a37          	lui	s4,0x88
    80007044:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007048:	00003917          	auipc	s2,0x3
    8000704c:	ec890913          	addi	s2,s2,-312 # 80009f10 <kmem>
    80007050:	00ca1a13          	slli	s4,s4,0xc
    80007054:	0140006f          	j	80007068 <kinit+0x80>
    80007058:	000017b7          	lui	a5,0x1
    8000705c:	00f484b3          	add	s1,s1,a5
    80007060:	0554e863          	bltu	s1,s5,800070b0 <kinit+0xc8>
    80007064:	0534f663          	bgeu	s1,s3,800070b0 <kinit+0xc8>
    80007068:	00001637          	lui	a2,0x1
    8000706c:	00100593          	li	a1,1
    80007070:	00048513          	mv	a0,s1
    80007074:	00000097          	auipc	ra,0x0
    80007078:	5e4080e7          	jalr	1508(ra) # 80007658 <__memset>
    8000707c:	00093783          	ld	a5,0(s2)
    80007080:	00f4b023          	sd	a5,0(s1)
    80007084:	00993023          	sd	s1,0(s2)
    80007088:	fd4498e3          	bne	s1,s4,80007058 <kinit+0x70>
    8000708c:	03813083          	ld	ra,56(sp)
    80007090:	03013403          	ld	s0,48(sp)
    80007094:	02813483          	ld	s1,40(sp)
    80007098:	02013903          	ld	s2,32(sp)
    8000709c:	01813983          	ld	s3,24(sp)
    800070a0:	01013a03          	ld	s4,16(sp)
    800070a4:	00813a83          	ld	s5,8(sp)
    800070a8:	04010113          	addi	sp,sp,64
    800070ac:	00008067          	ret
    800070b0:	00001517          	auipc	a0,0x1
    800070b4:	3c850513          	addi	a0,a0,968 # 80008478 <digits+0x18>
    800070b8:	fffff097          	auipc	ra,0xfffff
    800070bc:	4b4080e7          	jalr	1204(ra) # 8000656c <panic>

00000000800070c0 <freerange>:
    800070c0:	fc010113          	addi	sp,sp,-64
    800070c4:	000017b7          	lui	a5,0x1
    800070c8:	02913423          	sd	s1,40(sp)
    800070cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800070d0:	009504b3          	add	s1,a0,s1
    800070d4:	fffff537          	lui	a0,0xfffff
    800070d8:	02813823          	sd	s0,48(sp)
    800070dc:	02113c23          	sd	ra,56(sp)
    800070e0:	03213023          	sd	s2,32(sp)
    800070e4:	01313c23          	sd	s3,24(sp)
    800070e8:	01413823          	sd	s4,16(sp)
    800070ec:	01513423          	sd	s5,8(sp)
    800070f0:	01613023          	sd	s6,0(sp)
    800070f4:	04010413          	addi	s0,sp,64
    800070f8:	00a4f4b3          	and	s1,s1,a0
    800070fc:	00f487b3          	add	a5,s1,a5
    80007100:	06f5e463          	bltu	a1,a5,80007168 <freerange+0xa8>
    80007104:	00004a97          	auipc	s5,0x4
    80007108:	0dca8a93          	addi	s5,s5,220 # 8000b1e0 <end>
    8000710c:	0954e263          	bltu	s1,s5,80007190 <freerange+0xd0>
    80007110:	01100993          	li	s3,17
    80007114:	01b99993          	slli	s3,s3,0x1b
    80007118:	0734fc63          	bgeu	s1,s3,80007190 <freerange+0xd0>
    8000711c:	00058a13          	mv	s4,a1
    80007120:	00003917          	auipc	s2,0x3
    80007124:	df090913          	addi	s2,s2,-528 # 80009f10 <kmem>
    80007128:	00002b37          	lui	s6,0x2
    8000712c:	0140006f          	j	80007140 <freerange+0x80>
    80007130:	000017b7          	lui	a5,0x1
    80007134:	00f484b3          	add	s1,s1,a5
    80007138:	0554ec63          	bltu	s1,s5,80007190 <freerange+0xd0>
    8000713c:	0534fa63          	bgeu	s1,s3,80007190 <freerange+0xd0>
    80007140:	00001637          	lui	a2,0x1
    80007144:	00100593          	li	a1,1
    80007148:	00048513          	mv	a0,s1
    8000714c:	00000097          	auipc	ra,0x0
    80007150:	50c080e7          	jalr	1292(ra) # 80007658 <__memset>
    80007154:	00093703          	ld	a4,0(s2)
    80007158:	016487b3          	add	a5,s1,s6
    8000715c:	00e4b023          	sd	a4,0(s1)
    80007160:	00993023          	sd	s1,0(s2)
    80007164:	fcfa76e3          	bgeu	s4,a5,80007130 <freerange+0x70>
    80007168:	03813083          	ld	ra,56(sp)
    8000716c:	03013403          	ld	s0,48(sp)
    80007170:	02813483          	ld	s1,40(sp)
    80007174:	02013903          	ld	s2,32(sp)
    80007178:	01813983          	ld	s3,24(sp)
    8000717c:	01013a03          	ld	s4,16(sp)
    80007180:	00813a83          	ld	s5,8(sp)
    80007184:	00013b03          	ld	s6,0(sp)
    80007188:	04010113          	addi	sp,sp,64
    8000718c:	00008067          	ret
    80007190:	00001517          	auipc	a0,0x1
    80007194:	2e850513          	addi	a0,a0,744 # 80008478 <digits+0x18>
    80007198:	fffff097          	auipc	ra,0xfffff
    8000719c:	3d4080e7          	jalr	980(ra) # 8000656c <panic>

00000000800071a0 <kfree>:
    800071a0:	fe010113          	addi	sp,sp,-32
    800071a4:	00813823          	sd	s0,16(sp)
    800071a8:	00113c23          	sd	ra,24(sp)
    800071ac:	00913423          	sd	s1,8(sp)
    800071b0:	02010413          	addi	s0,sp,32
    800071b4:	03451793          	slli	a5,a0,0x34
    800071b8:	04079c63          	bnez	a5,80007210 <kfree+0x70>
    800071bc:	00004797          	auipc	a5,0x4
    800071c0:	02478793          	addi	a5,a5,36 # 8000b1e0 <end>
    800071c4:	00050493          	mv	s1,a0
    800071c8:	04f56463          	bltu	a0,a5,80007210 <kfree+0x70>
    800071cc:	01100793          	li	a5,17
    800071d0:	01b79793          	slli	a5,a5,0x1b
    800071d4:	02f57e63          	bgeu	a0,a5,80007210 <kfree+0x70>
    800071d8:	00001637          	lui	a2,0x1
    800071dc:	00100593          	li	a1,1
    800071e0:	00000097          	auipc	ra,0x0
    800071e4:	478080e7          	jalr	1144(ra) # 80007658 <__memset>
    800071e8:	00003797          	auipc	a5,0x3
    800071ec:	d2878793          	addi	a5,a5,-728 # 80009f10 <kmem>
    800071f0:	0007b703          	ld	a4,0(a5)
    800071f4:	01813083          	ld	ra,24(sp)
    800071f8:	01013403          	ld	s0,16(sp)
    800071fc:	00e4b023          	sd	a4,0(s1)
    80007200:	0097b023          	sd	s1,0(a5)
    80007204:	00813483          	ld	s1,8(sp)
    80007208:	02010113          	addi	sp,sp,32
    8000720c:	00008067          	ret
    80007210:	00001517          	auipc	a0,0x1
    80007214:	26850513          	addi	a0,a0,616 # 80008478 <digits+0x18>
    80007218:	fffff097          	auipc	ra,0xfffff
    8000721c:	354080e7          	jalr	852(ra) # 8000656c <panic>

0000000080007220 <kalloc>:
    80007220:	fe010113          	addi	sp,sp,-32
    80007224:	00813823          	sd	s0,16(sp)
    80007228:	00913423          	sd	s1,8(sp)
    8000722c:	00113c23          	sd	ra,24(sp)
    80007230:	02010413          	addi	s0,sp,32
    80007234:	00003797          	auipc	a5,0x3
    80007238:	cdc78793          	addi	a5,a5,-804 # 80009f10 <kmem>
    8000723c:	0007b483          	ld	s1,0(a5)
    80007240:	02048063          	beqz	s1,80007260 <kalloc+0x40>
    80007244:	0004b703          	ld	a4,0(s1)
    80007248:	00001637          	lui	a2,0x1
    8000724c:	00500593          	li	a1,5
    80007250:	00048513          	mv	a0,s1
    80007254:	00e7b023          	sd	a4,0(a5)
    80007258:	00000097          	auipc	ra,0x0
    8000725c:	400080e7          	jalr	1024(ra) # 80007658 <__memset>
    80007260:	01813083          	ld	ra,24(sp)
    80007264:	01013403          	ld	s0,16(sp)
    80007268:	00048513          	mv	a0,s1
    8000726c:	00813483          	ld	s1,8(sp)
    80007270:	02010113          	addi	sp,sp,32
    80007274:	00008067          	ret

0000000080007278 <initlock>:
    80007278:	ff010113          	addi	sp,sp,-16
    8000727c:	00813423          	sd	s0,8(sp)
    80007280:	01010413          	addi	s0,sp,16
    80007284:	00813403          	ld	s0,8(sp)
    80007288:	00b53423          	sd	a1,8(a0)
    8000728c:	00052023          	sw	zero,0(a0)
    80007290:	00053823          	sd	zero,16(a0)
    80007294:	01010113          	addi	sp,sp,16
    80007298:	00008067          	ret

000000008000729c <acquire>:
    8000729c:	fe010113          	addi	sp,sp,-32
    800072a0:	00813823          	sd	s0,16(sp)
    800072a4:	00913423          	sd	s1,8(sp)
    800072a8:	00113c23          	sd	ra,24(sp)
    800072ac:	01213023          	sd	s2,0(sp)
    800072b0:	02010413          	addi	s0,sp,32
    800072b4:	00050493          	mv	s1,a0
    800072b8:	10002973          	csrr	s2,sstatus
    800072bc:	100027f3          	csrr	a5,sstatus
    800072c0:	ffd7f793          	andi	a5,a5,-3
    800072c4:	10079073          	csrw	sstatus,a5
    800072c8:	fffff097          	auipc	ra,0xfffff
    800072cc:	8e8080e7          	jalr	-1816(ra) # 80005bb0 <mycpu>
    800072d0:	07852783          	lw	a5,120(a0)
    800072d4:	06078e63          	beqz	a5,80007350 <acquire+0xb4>
    800072d8:	fffff097          	auipc	ra,0xfffff
    800072dc:	8d8080e7          	jalr	-1832(ra) # 80005bb0 <mycpu>
    800072e0:	07852783          	lw	a5,120(a0)
    800072e4:	0004a703          	lw	a4,0(s1)
    800072e8:	0017879b          	addiw	a5,a5,1
    800072ec:	06f52c23          	sw	a5,120(a0)
    800072f0:	04071063          	bnez	a4,80007330 <acquire+0x94>
    800072f4:	00100713          	li	a4,1
    800072f8:	00070793          	mv	a5,a4
    800072fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80007300:	0007879b          	sext.w	a5,a5
    80007304:	fe079ae3          	bnez	a5,800072f8 <acquire+0x5c>
    80007308:	0ff0000f          	fence
    8000730c:	fffff097          	auipc	ra,0xfffff
    80007310:	8a4080e7          	jalr	-1884(ra) # 80005bb0 <mycpu>
    80007314:	01813083          	ld	ra,24(sp)
    80007318:	01013403          	ld	s0,16(sp)
    8000731c:	00a4b823          	sd	a0,16(s1)
    80007320:	00013903          	ld	s2,0(sp)
    80007324:	00813483          	ld	s1,8(sp)
    80007328:	02010113          	addi	sp,sp,32
    8000732c:	00008067          	ret
    80007330:	0104b903          	ld	s2,16(s1)
    80007334:	fffff097          	auipc	ra,0xfffff
    80007338:	87c080e7          	jalr	-1924(ra) # 80005bb0 <mycpu>
    8000733c:	faa91ce3          	bne	s2,a0,800072f4 <acquire+0x58>
    80007340:	00001517          	auipc	a0,0x1
    80007344:	14050513          	addi	a0,a0,320 # 80008480 <digits+0x20>
    80007348:	fffff097          	auipc	ra,0xfffff
    8000734c:	224080e7          	jalr	548(ra) # 8000656c <panic>
    80007350:	00195913          	srli	s2,s2,0x1
    80007354:	fffff097          	auipc	ra,0xfffff
    80007358:	85c080e7          	jalr	-1956(ra) # 80005bb0 <mycpu>
    8000735c:	00197913          	andi	s2,s2,1
    80007360:	07252e23          	sw	s2,124(a0)
    80007364:	f75ff06f          	j	800072d8 <acquire+0x3c>

0000000080007368 <release>:
    80007368:	fe010113          	addi	sp,sp,-32
    8000736c:	00813823          	sd	s0,16(sp)
    80007370:	00113c23          	sd	ra,24(sp)
    80007374:	00913423          	sd	s1,8(sp)
    80007378:	01213023          	sd	s2,0(sp)
    8000737c:	02010413          	addi	s0,sp,32
    80007380:	00052783          	lw	a5,0(a0)
    80007384:	00079a63          	bnez	a5,80007398 <release+0x30>
    80007388:	00001517          	auipc	a0,0x1
    8000738c:	10050513          	addi	a0,a0,256 # 80008488 <digits+0x28>
    80007390:	fffff097          	auipc	ra,0xfffff
    80007394:	1dc080e7          	jalr	476(ra) # 8000656c <panic>
    80007398:	01053903          	ld	s2,16(a0)
    8000739c:	00050493          	mv	s1,a0
    800073a0:	fffff097          	auipc	ra,0xfffff
    800073a4:	810080e7          	jalr	-2032(ra) # 80005bb0 <mycpu>
    800073a8:	fea910e3          	bne	s2,a0,80007388 <release+0x20>
    800073ac:	0004b823          	sd	zero,16(s1)
    800073b0:	0ff0000f          	fence
    800073b4:	0f50000f          	fence	iorw,ow
    800073b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800073bc:	ffffe097          	auipc	ra,0xffffe
    800073c0:	7f4080e7          	jalr	2036(ra) # 80005bb0 <mycpu>
    800073c4:	100027f3          	csrr	a5,sstatus
    800073c8:	0027f793          	andi	a5,a5,2
    800073cc:	04079a63          	bnez	a5,80007420 <release+0xb8>
    800073d0:	07852783          	lw	a5,120(a0)
    800073d4:	02f05e63          	blez	a5,80007410 <release+0xa8>
    800073d8:	fff7871b          	addiw	a4,a5,-1
    800073dc:	06e52c23          	sw	a4,120(a0)
    800073e0:	00071c63          	bnez	a4,800073f8 <release+0x90>
    800073e4:	07c52783          	lw	a5,124(a0)
    800073e8:	00078863          	beqz	a5,800073f8 <release+0x90>
    800073ec:	100027f3          	csrr	a5,sstatus
    800073f0:	0027e793          	ori	a5,a5,2
    800073f4:	10079073          	csrw	sstatus,a5
    800073f8:	01813083          	ld	ra,24(sp)
    800073fc:	01013403          	ld	s0,16(sp)
    80007400:	00813483          	ld	s1,8(sp)
    80007404:	00013903          	ld	s2,0(sp)
    80007408:	02010113          	addi	sp,sp,32
    8000740c:	00008067          	ret
    80007410:	00001517          	auipc	a0,0x1
    80007414:	09850513          	addi	a0,a0,152 # 800084a8 <digits+0x48>
    80007418:	fffff097          	auipc	ra,0xfffff
    8000741c:	154080e7          	jalr	340(ra) # 8000656c <panic>
    80007420:	00001517          	auipc	a0,0x1
    80007424:	07050513          	addi	a0,a0,112 # 80008490 <digits+0x30>
    80007428:	fffff097          	auipc	ra,0xfffff
    8000742c:	144080e7          	jalr	324(ra) # 8000656c <panic>

0000000080007430 <holding>:
    80007430:	00052783          	lw	a5,0(a0)
    80007434:	00079663          	bnez	a5,80007440 <holding+0x10>
    80007438:	00000513          	li	a0,0
    8000743c:	00008067          	ret
    80007440:	fe010113          	addi	sp,sp,-32
    80007444:	00813823          	sd	s0,16(sp)
    80007448:	00913423          	sd	s1,8(sp)
    8000744c:	00113c23          	sd	ra,24(sp)
    80007450:	02010413          	addi	s0,sp,32
    80007454:	01053483          	ld	s1,16(a0)
    80007458:	ffffe097          	auipc	ra,0xffffe
    8000745c:	758080e7          	jalr	1880(ra) # 80005bb0 <mycpu>
    80007460:	01813083          	ld	ra,24(sp)
    80007464:	01013403          	ld	s0,16(sp)
    80007468:	40a48533          	sub	a0,s1,a0
    8000746c:	00153513          	seqz	a0,a0
    80007470:	00813483          	ld	s1,8(sp)
    80007474:	02010113          	addi	sp,sp,32
    80007478:	00008067          	ret

000000008000747c <push_off>:
    8000747c:	fe010113          	addi	sp,sp,-32
    80007480:	00813823          	sd	s0,16(sp)
    80007484:	00113c23          	sd	ra,24(sp)
    80007488:	00913423          	sd	s1,8(sp)
    8000748c:	02010413          	addi	s0,sp,32
    80007490:	100024f3          	csrr	s1,sstatus
    80007494:	100027f3          	csrr	a5,sstatus
    80007498:	ffd7f793          	andi	a5,a5,-3
    8000749c:	10079073          	csrw	sstatus,a5
    800074a0:	ffffe097          	auipc	ra,0xffffe
    800074a4:	710080e7          	jalr	1808(ra) # 80005bb0 <mycpu>
    800074a8:	07852783          	lw	a5,120(a0)
    800074ac:	02078663          	beqz	a5,800074d8 <push_off+0x5c>
    800074b0:	ffffe097          	auipc	ra,0xffffe
    800074b4:	700080e7          	jalr	1792(ra) # 80005bb0 <mycpu>
    800074b8:	07852783          	lw	a5,120(a0)
    800074bc:	01813083          	ld	ra,24(sp)
    800074c0:	01013403          	ld	s0,16(sp)
    800074c4:	0017879b          	addiw	a5,a5,1
    800074c8:	06f52c23          	sw	a5,120(a0)
    800074cc:	00813483          	ld	s1,8(sp)
    800074d0:	02010113          	addi	sp,sp,32
    800074d4:	00008067          	ret
    800074d8:	0014d493          	srli	s1,s1,0x1
    800074dc:	ffffe097          	auipc	ra,0xffffe
    800074e0:	6d4080e7          	jalr	1748(ra) # 80005bb0 <mycpu>
    800074e4:	0014f493          	andi	s1,s1,1
    800074e8:	06952e23          	sw	s1,124(a0)
    800074ec:	fc5ff06f          	j	800074b0 <push_off+0x34>

00000000800074f0 <pop_off>:
    800074f0:	ff010113          	addi	sp,sp,-16
    800074f4:	00813023          	sd	s0,0(sp)
    800074f8:	00113423          	sd	ra,8(sp)
    800074fc:	01010413          	addi	s0,sp,16
    80007500:	ffffe097          	auipc	ra,0xffffe
    80007504:	6b0080e7          	jalr	1712(ra) # 80005bb0 <mycpu>
    80007508:	100027f3          	csrr	a5,sstatus
    8000750c:	0027f793          	andi	a5,a5,2
    80007510:	04079663          	bnez	a5,8000755c <pop_off+0x6c>
    80007514:	07852783          	lw	a5,120(a0)
    80007518:	02f05a63          	blez	a5,8000754c <pop_off+0x5c>
    8000751c:	fff7871b          	addiw	a4,a5,-1
    80007520:	06e52c23          	sw	a4,120(a0)
    80007524:	00071c63          	bnez	a4,8000753c <pop_off+0x4c>
    80007528:	07c52783          	lw	a5,124(a0)
    8000752c:	00078863          	beqz	a5,8000753c <pop_off+0x4c>
    80007530:	100027f3          	csrr	a5,sstatus
    80007534:	0027e793          	ori	a5,a5,2
    80007538:	10079073          	csrw	sstatus,a5
    8000753c:	00813083          	ld	ra,8(sp)
    80007540:	00013403          	ld	s0,0(sp)
    80007544:	01010113          	addi	sp,sp,16
    80007548:	00008067          	ret
    8000754c:	00001517          	auipc	a0,0x1
    80007550:	f5c50513          	addi	a0,a0,-164 # 800084a8 <digits+0x48>
    80007554:	fffff097          	auipc	ra,0xfffff
    80007558:	018080e7          	jalr	24(ra) # 8000656c <panic>
    8000755c:	00001517          	auipc	a0,0x1
    80007560:	f3450513          	addi	a0,a0,-204 # 80008490 <digits+0x30>
    80007564:	fffff097          	auipc	ra,0xfffff
    80007568:	008080e7          	jalr	8(ra) # 8000656c <panic>

000000008000756c <push_on>:
    8000756c:	fe010113          	addi	sp,sp,-32
    80007570:	00813823          	sd	s0,16(sp)
    80007574:	00113c23          	sd	ra,24(sp)
    80007578:	00913423          	sd	s1,8(sp)
    8000757c:	02010413          	addi	s0,sp,32
    80007580:	100024f3          	csrr	s1,sstatus
    80007584:	100027f3          	csrr	a5,sstatus
    80007588:	0027e793          	ori	a5,a5,2
    8000758c:	10079073          	csrw	sstatus,a5
    80007590:	ffffe097          	auipc	ra,0xffffe
    80007594:	620080e7          	jalr	1568(ra) # 80005bb0 <mycpu>
    80007598:	07852783          	lw	a5,120(a0)
    8000759c:	02078663          	beqz	a5,800075c8 <push_on+0x5c>
    800075a0:	ffffe097          	auipc	ra,0xffffe
    800075a4:	610080e7          	jalr	1552(ra) # 80005bb0 <mycpu>
    800075a8:	07852783          	lw	a5,120(a0)
    800075ac:	01813083          	ld	ra,24(sp)
    800075b0:	01013403          	ld	s0,16(sp)
    800075b4:	0017879b          	addiw	a5,a5,1
    800075b8:	06f52c23          	sw	a5,120(a0)
    800075bc:	00813483          	ld	s1,8(sp)
    800075c0:	02010113          	addi	sp,sp,32
    800075c4:	00008067          	ret
    800075c8:	0014d493          	srli	s1,s1,0x1
    800075cc:	ffffe097          	auipc	ra,0xffffe
    800075d0:	5e4080e7          	jalr	1508(ra) # 80005bb0 <mycpu>
    800075d4:	0014f493          	andi	s1,s1,1
    800075d8:	06952e23          	sw	s1,124(a0)
    800075dc:	fc5ff06f          	j	800075a0 <push_on+0x34>

00000000800075e0 <pop_on>:
    800075e0:	ff010113          	addi	sp,sp,-16
    800075e4:	00813023          	sd	s0,0(sp)
    800075e8:	00113423          	sd	ra,8(sp)
    800075ec:	01010413          	addi	s0,sp,16
    800075f0:	ffffe097          	auipc	ra,0xffffe
    800075f4:	5c0080e7          	jalr	1472(ra) # 80005bb0 <mycpu>
    800075f8:	100027f3          	csrr	a5,sstatus
    800075fc:	0027f793          	andi	a5,a5,2
    80007600:	04078463          	beqz	a5,80007648 <pop_on+0x68>
    80007604:	07852783          	lw	a5,120(a0)
    80007608:	02f05863          	blez	a5,80007638 <pop_on+0x58>
    8000760c:	fff7879b          	addiw	a5,a5,-1
    80007610:	06f52c23          	sw	a5,120(a0)
    80007614:	07853783          	ld	a5,120(a0)
    80007618:	00079863          	bnez	a5,80007628 <pop_on+0x48>
    8000761c:	100027f3          	csrr	a5,sstatus
    80007620:	ffd7f793          	andi	a5,a5,-3
    80007624:	10079073          	csrw	sstatus,a5
    80007628:	00813083          	ld	ra,8(sp)
    8000762c:	00013403          	ld	s0,0(sp)
    80007630:	01010113          	addi	sp,sp,16
    80007634:	00008067          	ret
    80007638:	00001517          	auipc	a0,0x1
    8000763c:	e9850513          	addi	a0,a0,-360 # 800084d0 <digits+0x70>
    80007640:	fffff097          	auipc	ra,0xfffff
    80007644:	f2c080e7          	jalr	-212(ra) # 8000656c <panic>
    80007648:	00001517          	auipc	a0,0x1
    8000764c:	e6850513          	addi	a0,a0,-408 # 800084b0 <digits+0x50>
    80007650:	fffff097          	auipc	ra,0xfffff
    80007654:	f1c080e7          	jalr	-228(ra) # 8000656c <panic>

0000000080007658 <__memset>:
    80007658:	ff010113          	addi	sp,sp,-16
    8000765c:	00813423          	sd	s0,8(sp)
    80007660:	01010413          	addi	s0,sp,16
    80007664:	1a060e63          	beqz	a2,80007820 <__memset+0x1c8>
    80007668:	40a007b3          	neg	a5,a0
    8000766c:	0077f793          	andi	a5,a5,7
    80007670:	00778693          	addi	a3,a5,7
    80007674:	00b00813          	li	a6,11
    80007678:	0ff5f593          	andi	a1,a1,255
    8000767c:	fff6071b          	addiw	a4,a2,-1
    80007680:	1b06e663          	bltu	a3,a6,8000782c <__memset+0x1d4>
    80007684:	1cd76463          	bltu	a4,a3,8000784c <__memset+0x1f4>
    80007688:	1a078e63          	beqz	a5,80007844 <__memset+0x1ec>
    8000768c:	00b50023          	sb	a1,0(a0)
    80007690:	00100713          	li	a4,1
    80007694:	1ae78463          	beq	a5,a4,8000783c <__memset+0x1e4>
    80007698:	00b500a3          	sb	a1,1(a0)
    8000769c:	00200713          	li	a4,2
    800076a0:	1ae78a63          	beq	a5,a4,80007854 <__memset+0x1fc>
    800076a4:	00b50123          	sb	a1,2(a0)
    800076a8:	00300713          	li	a4,3
    800076ac:	18e78463          	beq	a5,a4,80007834 <__memset+0x1dc>
    800076b0:	00b501a3          	sb	a1,3(a0)
    800076b4:	00400713          	li	a4,4
    800076b8:	1ae78263          	beq	a5,a4,8000785c <__memset+0x204>
    800076bc:	00b50223          	sb	a1,4(a0)
    800076c0:	00500713          	li	a4,5
    800076c4:	1ae78063          	beq	a5,a4,80007864 <__memset+0x20c>
    800076c8:	00b502a3          	sb	a1,5(a0)
    800076cc:	00700713          	li	a4,7
    800076d0:	18e79e63          	bne	a5,a4,8000786c <__memset+0x214>
    800076d4:	00b50323          	sb	a1,6(a0)
    800076d8:	00700e93          	li	t4,7
    800076dc:	00859713          	slli	a4,a1,0x8
    800076e0:	00e5e733          	or	a4,a1,a4
    800076e4:	01059e13          	slli	t3,a1,0x10
    800076e8:	01c76e33          	or	t3,a4,t3
    800076ec:	01859313          	slli	t1,a1,0x18
    800076f0:	006e6333          	or	t1,t3,t1
    800076f4:	02059893          	slli	a7,a1,0x20
    800076f8:	40f60e3b          	subw	t3,a2,a5
    800076fc:	011368b3          	or	a7,t1,a7
    80007700:	02859813          	slli	a6,a1,0x28
    80007704:	0108e833          	or	a6,a7,a6
    80007708:	03059693          	slli	a3,a1,0x30
    8000770c:	003e589b          	srliw	a7,t3,0x3
    80007710:	00d866b3          	or	a3,a6,a3
    80007714:	03859713          	slli	a4,a1,0x38
    80007718:	00389813          	slli	a6,a7,0x3
    8000771c:	00f507b3          	add	a5,a0,a5
    80007720:	00e6e733          	or	a4,a3,a4
    80007724:	000e089b          	sext.w	a7,t3
    80007728:	00f806b3          	add	a3,a6,a5
    8000772c:	00e7b023          	sd	a4,0(a5)
    80007730:	00878793          	addi	a5,a5,8
    80007734:	fed79ce3          	bne	a5,a3,8000772c <__memset+0xd4>
    80007738:	ff8e7793          	andi	a5,t3,-8
    8000773c:	0007871b          	sext.w	a4,a5
    80007740:	01d787bb          	addw	a5,a5,t4
    80007744:	0ce88e63          	beq	a7,a4,80007820 <__memset+0x1c8>
    80007748:	00f50733          	add	a4,a0,a5
    8000774c:	00b70023          	sb	a1,0(a4)
    80007750:	0017871b          	addiw	a4,a5,1
    80007754:	0cc77663          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    80007758:	00e50733          	add	a4,a0,a4
    8000775c:	00b70023          	sb	a1,0(a4)
    80007760:	0027871b          	addiw	a4,a5,2
    80007764:	0ac77e63          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    80007768:	00e50733          	add	a4,a0,a4
    8000776c:	00b70023          	sb	a1,0(a4)
    80007770:	0037871b          	addiw	a4,a5,3
    80007774:	0ac77663          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    80007778:	00e50733          	add	a4,a0,a4
    8000777c:	00b70023          	sb	a1,0(a4)
    80007780:	0047871b          	addiw	a4,a5,4
    80007784:	08c77e63          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    80007788:	00e50733          	add	a4,a0,a4
    8000778c:	00b70023          	sb	a1,0(a4)
    80007790:	0057871b          	addiw	a4,a5,5
    80007794:	08c77663          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    80007798:	00e50733          	add	a4,a0,a4
    8000779c:	00b70023          	sb	a1,0(a4)
    800077a0:	0067871b          	addiw	a4,a5,6
    800077a4:	06c77e63          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    800077a8:	00e50733          	add	a4,a0,a4
    800077ac:	00b70023          	sb	a1,0(a4)
    800077b0:	0077871b          	addiw	a4,a5,7
    800077b4:	06c77663          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    800077b8:	00e50733          	add	a4,a0,a4
    800077bc:	00b70023          	sb	a1,0(a4)
    800077c0:	0087871b          	addiw	a4,a5,8
    800077c4:	04c77e63          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    800077c8:	00e50733          	add	a4,a0,a4
    800077cc:	00b70023          	sb	a1,0(a4)
    800077d0:	0097871b          	addiw	a4,a5,9
    800077d4:	04c77663          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    800077d8:	00e50733          	add	a4,a0,a4
    800077dc:	00b70023          	sb	a1,0(a4)
    800077e0:	00a7871b          	addiw	a4,a5,10
    800077e4:	02c77e63          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    800077e8:	00e50733          	add	a4,a0,a4
    800077ec:	00b70023          	sb	a1,0(a4)
    800077f0:	00b7871b          	addiw	a4,a5,11
    800077f4:	02c77663          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    800077f8:	00e50733          	add	a4,a0,a4
    800077fc:	00b70023          	sb	a1,0(a4)
    80007800:	00c7871b          	addiw	a4,a5,12
    80007804:	00c77e63          	bgeu	a4,a2,80007820 <__memset+0x1c8>
    80007808:	00e50733          	add	a4,a0,a4
    8000780c:	00b70023          	sb	a1,0(a4)
    80007810:	00d7879b          	addiw	a5,a5,13
    80007814:	00c7f663          	bgeu	a5,a2,80007820 <__memset+0x1c8>
    80007818:	00f507b3          	add	a5,a0,a5
    8000781c:	00b78023          	sb	a1,0(a5)
    80007820:	00813403          	ld	s0,8(sp)
    80007824:	01010113          	addi	sp,sp,16
    80007828:	00008067          	ret
    8000782c:	00b00693          	li	a3,11
    80007830:	e55ff06f          	j	80007684 <__memset+0x2c>
    80007834:	00300e93          	li	t4,3
    80007838:	ea5ff06f          	j	800076dc <__memset+0x84>
    8000783c:	00100e93          	li	t4,1
    80007840:	e9dff06f          	j	800076dc <__memset+0x84>
    80007844:	00000e93          	li	t4,0
    80007848:	e95ff06f          	j	800076dc <__memset+0x84>
    8000784c:	00000793          	li	a5,0
    80007850:	ef9ff06f          	j	80007748 <__memset+0xf0>
    80007854:	00200e93          	li	t4,2
    80007858:	e85ff06f          	j	800076dc <__memset+0x84>
    8000785c:	00400e93          	li	t4,4
    80007860:	e7dff06f          	j	800076dc <__memset+0x84>
    80007864:	00500e93          	li	t4,5
    80007868:	e75ff06f          	j	800076dc <__memset+0x84>
    8000786c:	00600e93          	li	t4,6
    80007870:	e6dff06f          	j	800076dc <__memset+0x84>

0000000080007874 <__memmove>:
    80007874:	ff010113          	addi	sp,sp,-16
    80007878:	00813423          	sd	s0,8(sp)
    8000787c:	01010413          	addi	s0,sp,16
    80007880:	0e060863          	beqz	a2,80007970 <__memmove+0xfc>
    80007884:	fff6069b          	addiw	a3,a2,-1
    80007888:	0006881b          	sext.w	a6,a3
    8000788c:	0ea5e863          	bltu	a1,a0,8000797c <__memmove+0x108>
    80007890:	00758713          	addi	a4,a1,7
    80007894:	00a5e7b3          	or	a5,a1,a0
    80007898:	40a70733          	sub	a4,a4,a0
    8000789c:	0077f793          	andi	a5,a5,7
    800078a0:	00f73713          	sltiu	a4,a4,15
    800078a4:	00174713          	xori	a4,a4,1
    800078a8:	0017b793          	seqz	a5,a5
    800078ac:	00e7f7b3          	and	a5,a5,a4
    800078b0:	10078863          	beqz	a5,800079c0 <__memmove+0x14c>
    800078b4:	00900793          	li	a5,9
    800078b8:	1107f463          	bgeu	a5,a6,800079c0 <__memmove+0x14c>
    800078bc:	0036581b          	srliw	a6,a2,0x3
    800078c0:	fff8081b          	addiw	a6,a6,-1
    800078c4:	02081813          	slli	a6,a6,0x20
    800078c8:	01d85893          	srli	a7,a6,0x1d
    800078cc:	00858813          	addi	a6,a1,8
    800078d0:	00058793          	mv	a5,a1
    800078d4:	00050713          	mv	a4,a0
    800078d8:	01088833          	add	a6,a7,a6
    800078dc:	0007b883          	ld	a7,0(a5)
    800078e0:	00878793          	addi	a5,a5,8
    800078e4:	00870713          	addi	a4,a4,8
    800078e8:	ff173c23          	sd	a7,-8(a4)
    800078ec:	ff0798e3          	bne	a5,a6,800078dc <__memmove+0x68>
    800078f0:	ff867713          	andi	a4,a2,-8
    800078f4:	02071793          	slli	a5,a4,0x20
    800078f8:	0207d793          	srli	a5,a5,0x20
    800078fc:	00f585b3          	add	a1,a1,a5
    80007900:	40e686bb          	subw	a3,a3,a4
    80007904:	00f507b3          	add	a5,a0,a5
    80007908:	06e60463          	beq	a2,a4,80007970 <__memmove+0xfc>
    8000790c:	0005c703          	lbu	a4,0(a1)
    80007910:	00e78023          	sb	a4,0(a5)
    80007914:	04068e63          	beqz	a3,80007970 <__memmove+0xfc>
    80007918:	0015c603          	lbu	a2,1(a1)
    8000791c:	00100713          	li	a4,1
    80007920:	00c780a3          	sb	a2,1(a5)
    80007924:	04e68663          	beq	a3,a4,80007970 <__memmove+0xfc>
    80007928:	0025c603          	lbu	a2,2(a1)
    8000792c:	00200713          	li	a4,2
    80007930:	00c78123          	sb	a2,2(a5)
    80007934:	02e68e63          	beq	a3,a4,80007970 <__memmove+0xfc>
    80007938:	0035c603          	lbu	a2,3(a1)
    8000793c:	00300713          	li	a4,3
    80007940:	00c781a3          	sb	a2,3(a5)
    80007944:	02e68663          	beq	a3,a4,80007970 <__memmove+0xfc>
    80007948:	0045c603          	lbu	a2,4(a1)
    8000794c:	00400713          	li	a4,4
    80007950:	00c78223          	sb	a2,4(a5)
    80007954:	00e68e63          	beq	a3,a4,80007970 <__memmove+0xfc>
    80007958:	0055c603          	lbu	a2,5(a1)
    8000795c:	00500713          	li	a4,5
    80007960:	00c782a3          	sb	a2,5(a5)
    80007964:	00e68663          	beq	a3,a4,80007970 <__memmove+0xfc>
    80007968:	0065c703          	lbu	a4,6(a1)
    8000796c:	00e78323          	sb	a4,6(a5)
    80007970:	00813403          	ld	s0,8(sp)
    80007974:	01010113          	addi	sp,sp,16
    80007978:	00008067          	ret
    8000797c:	02061713          	slli	a4,a2,0x20
    80007980:	02075713          	srli	a4,a4,0x20
    80007984:	00e587b3          	add	a5,a1,a4
    80007988:	f0f574e3          	bgeu	a0,a5,80007890 <__memmove+0x1c>
    8000798c:	02069613          	slli	a2,a3,0x20
    80007990:	02065613          	srli	a2,a2,0x20
    80007994:	fff64613          	not	a2,a2
    80007998:	00e50733          	add	a4,a0,a4
    8000799c:	00c78633          	add	a2,a5,a2
    800079a0:	fff7c683          	lbu	a3,-1(a5)
    800079a4:	fff78793          	addi	a5,a5,-1
    800079a8:	fff70713          	addi	a4,a4,-1
    800079ac:	00d70023          	sb	a3,0(a4)
    800079b0:	fec798e3          	bne	a5,a2,800079a0 <__memmove+0x12c>
    800079b4:	00813403          	ld	s0,8(sp)
    800079b8:	01010113          	addi	sp,sp,16
    800079bc:	00008067          	ret
    800079c0:	02069713          	slli	a4,a3,0x20
    800079c4:	02075713          	srli	a4,a4,0x20
    800079c8:	00170713          	addi	a4,a4,1
    800079cc:	00e50733          	add	a4,a0,a4
    800079d0:	00050793          	mv	a5,a0
    800079d4:	0005c683          	lbu	a3,0(a1)
    800079d8:	00178793          	addi	a5,a5,1
    800079dc:	00158593          	addi	a1,a1,1
    800079e0:	fed78fa3          	sb	a3,-1(a5)
    800079e4:	fee798e3          	bne	a5,a4,800079d4 <__memmove+0x160>
    800079e8:	f89ff06f          	j	80007970 <__memmove+0xfc>

00000000800079ec <__putc>:
    800079ec:	fe010113          	addi	sp,sp,-32
    800079f0:	00813823          	sd	s0,16(sp)
    800079f4:	00113c23          	sd	ra,24(sp)
    800079f8:	02010413          	addi	s0,sp,32
    800079fc:	00050793          	mv	a5,a0
    80007a00:	fef40593          	addi	a1,s0,-17
    80007a04:	00100613          	li	a2,1
    80007a08:	00000513          	li	a0,0
    80007a0c:	fef407a3          	sb	a5,-17(s0)
    80007a10:	fffff097          	auipc	ra,0xfffff
    80007a14:	b3c080e7          	jalr	-1220(ra) # 8000654c <console_write>
    80007a18:	01813083          	ld	ra,24(sp)
    80007a1c:	01013403          	ld	s0,16(sp)
    80007a20:	02010113          	addi	sp,sp,32
    80007a24:	00008067          	ret

0000000080007a28 <__getc>:
    80007a28:	fe010113          	addi	sp,sp,-32
    80007a2c:	00813823          	sd	s0,16(sp)
    80007a30:	00113c23          	sd	ra,24(sp)
    80007a34:	02010413          	addi	s0,sp,32
    80007a38:	fe840593          	addi	a1,s0,-24
    80007a3c:	00100613          	li	a2,1
    80007a40:	00000513          	li	a0,0
    80007a44:	fffff097          	auipc	ra,0xfffff
    80007a48:	ae8080e7          	jalr	-1304(ra) # 8000652c <console_read>
    80007a4c:	fe844503          	lbu	a0,-24(s0)
    80007a50:	01813083          	ld	ra,24(sp)
    80007a54:	01013403          	ld	s0,16(sp)
    80007a58:	02010113          	addi	sp,sp,32
    80007a5c:	00008067          	ret

0000000080007a60 <console_handler>:
    80007a60:	fe010113          	addi	sp,sp,-32
    80007a64:	00813823          	sd	s0,16(sp)
    80007a68:	00113c23          	sd	ra,24(sp)
    80007a6c:	00913423          	sd	s1,8(sp)
    80007a70:	02010413          	addi	s0,sp,32
    80007a74:	14202773          	csrr	a4,scause
    80007a78:	100027f3          	csrr	a5,sstatus
    80007a7c:	0027f793          	andi	a5,a5,2
    80007a80:	06079e63          	bnez	a5,80007afc <console_handler+0x9c>
    80007a84:	00074c63          	bltz	a4,80007a9c <console_handler+0x3c>
    80007a88:	01813083          	ld	ra,24(sp)
    80007a8c:	01013403          	ld	s0,16(sp)
    80007a90:	00813483          	ld	s1,8(sp)
    80007a94:	02010113          	addi	sp,sp,32
    80007a98:	00008067          	ret
    80007a9c:	0ff77713          	andi	a4,a4,255
    80007aa0:	00900793          	li	a5,9
    80007aa4:	fef712e3          	bne	a4,a5,80007a88 <console_handler+0x28>
    80007aa8:	ffffe097          	auipc	ra,0xffffe
    80007aac:	6dc080e7          	jalr	1756(ra) # 80006184 <plic_claim>
    80007ab0:	00a00793          	li	a5,10
    80007ab4:	00050493          	mv	s1,a0
    80007ab8:	02f50c63          	beq	a0,a5,80007af0 <console_handler+0x90>
    80007abc:	fc0506e3          	beqz	a0,80007a88 <console_handler+0x28>
    80007ac0:	00050593          	mv	a1,a0
    80007ac4:	00001517          	auipc	a0,0x1
    80007ac8:	91450513          	addi	a0,a0,-1772 # 800083d8 <CONSOLE_STATUS+0x3c8>
    80007acc:	fffff097          	auipc	ra,0xfffff
    80007ad0:	afc080e7          	jalr	-1284(ra) # 800065c8 <__printf>
    80007ad4:	01013403          	ld	s0,16(sp)
    80007ad8:	01813083          	ld	ra,24(sp)
    80007adc:	00048513          	mv	a0,s1
    80007ae0:	00813483          	ld	s1,8(sp)
    80007ae4:	02010113          	addi	sp,sp,32
    80007ae8:	ffffe317          	auipc	t1,0xffffe
    80007aec:	6d430067          	jr	1748(t1) # 800061bc <plic_complete>
    80007af0:	fffff097          	auipc	ra,0xfffff
    80007af4:	3e0080e7          	jalr	992(ra) # 80006ed0 <uartintr>
    80007af8:	fddff06f          	j	80007ad4 <console_handler+0x74>
    80007afc:	00001517          	auipc	a0,0x1
    80007b00:	9dc50513          	addi	a0,a0,-1572 # 800084d8 <digits+0x78>
    80007b04:	fffff097          	auipc	ra,0xfffff
    80007b08:	a68080e7          	jalr	-1432(ra) # 8000656c <panic>
	...
