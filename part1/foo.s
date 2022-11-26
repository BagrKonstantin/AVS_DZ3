	.file	"foo.c"
	.intel_syntax noprefix
	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movsd	QWORD PTR -8[rbp], xmm0         # x
	movsd	QWORD PTR -16[rbp], xmm1        # a
	movsd	QWORD PTR -24[rbp], xmm2        # b
	movsd	xmm0, QWORD PTR -24[rbp]        # * b
	mulsd	xmm0, QWORD PTR -8[rbp]         # * x
	mulsd	xmm0, QWORD PTR -8[rbp]         # * x
	mulsd	xmm0, QWORD PTR -8[rbp]         # * x
	addsd	xmm0, QWORD PTR -16[rbp]        # + a
	movq	rax, xmm0
	movq	xmm0, rax                       # return
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	f, .-f
	.section	.rodata
.LC1:
	.string	"%lf"
.LC2:
	.string	"%d"
.LC4:
	.string	"%f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	pxor	xmm0, xmm0
	movsd	QWORD PTR -32[rbp], xmm0            # res = 0.0
	lea	rax, -48[rbp]                           # a
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -40[rbp]                           # b
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -64[rbp]                           # l
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -56[rbp]                           # r
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -68[rbp]                           # n
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR -56[rbp]            # r
	movsd	xmm1, QWORD PTR -64[rbp]            # l
	subsd	xmm0, xmm1                          # r - l
	mov	eax, DWORD PTR -68[rbp]                 # n
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1                          # (r - l) / n
	movsd	QWORD PTR -16[rbp], xmm0            # h
	movsd	xmm0, QWORD PTR -64[rbp]
	movsd	QWORD PTR -24[rbp], xmm0            # x = l
	jmp	.L4
.L5:
	movsd	xmm4, QWORD PTR -40[rbp]            # b
	movsd	xmm3, QWORD PTR -48[rbp]            # a
	movsd	xmm0, QWORD PTR -16[rbp]            # h
	movsd	xmm2, QWORD PTR .LC3[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2                          # h / 2
	movsd	xmm0, QWORD PTR -24[rbp]            # x
	subsd	xmm0, xmm1                          # x - h / 2
	movq	rax, xmm0
	movapd	xmm2, xmm4
	movapd	xmm1, xmm3
	movq	xmm0, rax
	call	f
	movsd	xmm1, QWORD PTR -32[rbp]
	addsd	xmm0, xmm1                          # (result) f + res
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	addsd	xmm0, QWORD PTR -16[rbp]            # x + h
	movsd	QWORD PTR -24[rbp], xmm0
.L4:
	movsd	xmm0, QWORD PTR -56[rbp]           # r
	comisd	xmm0, QWORD PTR -24[rbp]           # x <= r
	jnb	.L5
	movsd	xmm0, QWORD PTR -32[rbp]
	mulsd	xmm0, QWORD PTR -16[rbp]           # res * h
	movsd	QWORD PTR -32[rbp], xmm0
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	0
	.long	1073741824
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
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
