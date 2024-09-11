	.file	"test.c"
	.text
	.globl	r
	.data
	.align 8
	.type	r, @object
	.size	r, 8
r:
	.long	0
	.long	1074921472
	.text
	.globl	calculate_area
	.type	calculate_area, @function
calculate_area:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	movsd	.LC0(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	calculate_area, .-calculate_area
	.section	.rodata
.LC1:
	.string	"%lf"
.LC2:
	.string	"area is %lf\n"
	.align 8
.LC5:
	.string	"10 squared is %d and its square root is %f\n"
.LC6:
	.string	"wrong answer"
.LC7:
	.string	"correct answer"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	r(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	r(%rip), %rax
	movq	%rax, %xmm0
	call	calculate_area
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movsd	r(%rip), %xmm1
	movsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, r(%rip)
	movl	$0, -16(%rbp)
	movl	$1, -12(%rbp)
	jmp	.L4
.L5:
	movl	-12(%rbp), %eax
	addl	%eax, -16(%rbp)
	addl	$1, -12(%rbp)
.L4:
	cmpl	$100, -12(%rbp)
	jle	.L5
	movq	.LC4(%rip), %rax
	movq	%rax, %xmm0
	movl	$100, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	cmpl	$5000, -16(%rbp)
	je	.L6
	cmpl	$5050, -16(%rbp)
	je	.L7
	jmp	.L8
.L6:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L8
.L7:
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
.L8:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	1413754136
	.long	1074340347
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	987388755
	.long	1074351192
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
