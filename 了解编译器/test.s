	.text
	.file	"test.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function calculate_area
.LCPI0_0:
	.quad	0x400921fb54442d18              # double 3.1415926535897931
	.text
	.globl	calculate_area
	.p2align	4, 0x90
	.type	calculate_area,@function
calculate_area:                         # @calculate_area
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm1                 # xmm1 = mem[0],zero
	mulsd	-8(%rbp), %xmm1
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	calculate_area, .Lfunc_end0-calculate_area
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI1_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI1_1:
	.quad	0x4024000000000000              # double 10
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -20(%rbp)
	movabsq	$.L.str, %rdi
	movabsq	$r, %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movsd	r, %xmm0                        # xmm0 = mem[0],zero
	callq	calculate_area
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	movabsq	$.L.str.1, %rdi
	movb	$1, %al
	callq	printf@PLT
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	r, %xmm0
	movsd	%xmm0, r
	movl	$0, -8(%rbp)
	movl	$1, -4(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$100, -4(%rbp)
	jg	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	movsd	.LCPI1_1(%rip), %xmm0           # xmm0 = mem[0],zero
	callq	sqrt@PLT
	movl	$.L.str.2, %edi
	movl	$100, %esi
	movb	$1, %al
	callq	printf@PLT
	movl	-8(%rbp), %eax
	movl	%eax, %ecx
	subl	$5000, %ecx                     # imm = 0x1388
	je	.LBB1_6
	jmp	.LBB1_5
.LBB1_5:
	subl	$5050, %eax                     # imm = 0x13BA
	je	.LBB1_7
	jmp	.LBB1_8
.LBB1_6:
	movabsq	$.L.str.3, %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB1_8
.LBB1_7:
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB1_8:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	r,@object                       # @r
	.data
	.globl	r
	.p2align	3
r:
	.quad	0x4012000000000000              # double 4.5
	.size	r, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lf"
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"area is %lf\n"
	.size	.L.str.1, 13

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"10 squared is %d and its square root is %f\n"
	.size	.L.str.2, 44

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"wrong answer\n"
	.size	.L.str.3, 14

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"correct answer\n"
	.size	.L.str.4, 16

	.ident	"Ubuntu clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
