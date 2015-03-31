		#include <iregdef.h>
		
		.global	start
		.ent	start
start:	jal		main
		syscall
		.end	start
		
		.globl	main	
		.ent	main
main:	addi	sp,sp,-4		#	allocate 4 bytes for return address
		sw	 	ra,4(sp)		#	push original return address
		lw		ra,loop			#	load return address for loop (not used, just for testing)
		li		t0,1			#	t0 = 1
loop:	sll 	t0,t0,1			#	t0 = t0*2
		slti	t1,t0,10		#	t1 = t0 < 10
		bne		t1,zero,loop	#	if (t1 != 0) branch
		lw		ra,4(sp)		#	pop original return address
		addi	sp,sp,4			#	clean stack
		jr		ra				#	main return
		.end 	main