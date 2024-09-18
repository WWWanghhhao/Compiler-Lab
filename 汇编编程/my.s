    .file      "test.c"
    .option    nopic
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .text
    .globl     add
    .type      add, @function
add:
    fadd.s     fa0,fa0,fa1
    ret
	.size	add, .-add
	.section	.rodata.str1.8,"aMS",@progbits,1
.LC0:
    .string    "%f"
.LC1:
    .string "sum of arr is: %f\n"
    .globl     main
    .type      main, @function
main:
    addi       sp,sp,-32
    sd         ra,24(sp)
    sw         zero,12(sp)
    j          .L4
.L5:
    lw         a3,12(sp)
    slli       a2,a3,2
    lui        a3,%hi(arr)
    addi       a3,a3,%lo(arr)
    add        a3,a2,a3
    mv         a1,a3
    lui        a3,%hi(.LC0)
    addi       a0,a3,%lo(.LC0)
    call       __isoc99_scanf
    lw         a3,12(sp)
    addi       a3,a3,1
    sw         a3,12(sp)
.L4:
    lw         a3,12(sp)
    sext.w     a2,a3
    li         a3,3
    ble        a2,a3,.L5
    sw         zero,8(sp)
    j          .L6
.L7:
    lui        a3,%hi(sum)
    flw        fa3,%lo(sum)(a3)
    lui        a3,%hi(arr)
    addi       a2,a3,%lo(arr)
    lw         a3,8(sp)
    slli       a3,a3,2
    add        a3,a2,a3
    flw        fa2,0(a3)
    fmv.s      fa1,fa2
    fmv.s      fa0,fa3
    call       add
    fmv.s      fa3,fa0
    lui        a3,%hi(sum)
    fsw        fa3,%lo(sum)(a3)
    lw         a3,8(sp)
    addi       a3,a3,1
    sw         a3,8(sp)
.L6:
    lw         a3,8(sp)
    sext.w     a2,a3
    li         a3,3
    ble        a2,a3,.L7
    lui        a3,%hi(sum)
    flw        fa3,%lo(sum)(a3)
    fcvt.d.s   fa3,fa3
    fmv.x.d    a1,fa3
    lui        a3,%hi(.LC1)
    addi       a0,a3,%lo(.LC1)
    call       printf
    li         a3,0
    mv         a0,a3
    ld         ra,24(sp)
    addi       sp,sp,32
    jr         ra
    .size      main, .-main
    .globl     sum
    .globl     arr
    .bss
    .type      arr, @object
    .size      arr, 16
arr:
    .zero      16
    .section        .sbss,"aw",@nobits
    .type      sum, @object
    .size      sum, 4
sum:
    .zero      4
    .ident "GCC: () 12.2.0"
    .section   .note.GNU-stack,"",@progbits
