	.file	"foo.c"
	.intel_syntax noprefix
	.text
	.globl	f
	.type	f, @function
f:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	QWORD PTR -16[rbp], xmm1
	movsd	QWORD PTR -24[rbp], xmm2
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -16[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
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
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	lea	rax, -48[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -56[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -32[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -40[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -60[rbp]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR -32[rbp]
	subsd	xmm0, xmm1
	mov	eax, DWORD PTR -60[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	divsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
	jmp	.L4
.L5:
	movsd	xmm4, QWORD PTR -56[rbp]
	movsd	xmm3, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	xmm2, QWORD PTR .LC3[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR -16[rbp]
	subsd	xmm0, xmm1
	movq	rax, xmm0
	movapd	xmm2, xmm4
	movapd	xmm1, xmm3
	movq	xmm0, rax
	call	f
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -16[rbp]
	addsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
.L4:
	movsd	xmm0, QWORD PTR -40[rbp]
	comisd	xmm0, QWORD PTR -16[rbp]
	jnb	.L5
	movsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	leave
	ret
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
