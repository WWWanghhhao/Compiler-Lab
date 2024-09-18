	.file	"test.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	add
	.type	add, @function
add:
	fadd.s	fa0,fa0,fa1
	ret
	.size	add, .-add
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%f"
	.align	3
.LC1:
	.string	"sum of arr is: %f\n"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	s0,32(sp)
	lui	s0,%hi(.LANCHOR0)
	sd	s1,24(sp)
	addi	s1,s0,%lo(.LANCHOR0)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	ra,40(sp)
	addi	s0,s0,%lo(.LANCHOR0)
	addi	s3,s1,16
	lui	s2,%hi(.LC0)
.L4:
	mv	a1,s0
	addi	a0,s2,%lo(.LC0)
	addi	s0,s0,4
	call	__isoc99_scanf
	bne	s0,s3,.L4
	lui	a5,%hi(sum)
	flw	fa4,0(s1)
	flw	fa5,%lo(sum)(a5)
	flw	fa2,4(s1)
	flw	fa3,8(s1)
	fadd.s	fa5,fa5,fa4
	flw	fa4,12(s1)
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	fadd.s	fa5,fa5,fa2
	fadd.s	fa5,fa5,fa3
	fadd.s	fa5,fa5,fa4
	fcvt.d.s	fa4,fa5
	fsw	fa5,%lo(sum)(a5)
	fmv.x.d	a1,fa4
	call	printf
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	li	a0,0
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.globl	sum
	.globl	arr
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	arr, @object
	.size	arr, 16
arr:
	.zero	16
	.section	.sbss,"aw",@nobits
	.align	2
	.type	sum, @object
	.size	sum, 4
sum:
	.zero	4
	.ident	"GCC: () 12.2.0"
	.section	.note.GNU-stack,"",@progbits
