	.file	"foo_2.c"
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
	.globl	integral
	.type	integral, @function
integral:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 72
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	QWORD PTR -48[rbp], xmm1
	movsd	QWORD PTR -56[rbp], xmm2
	movsd	QWORD PTR -64[rbp], xmm3
	mov	DWORD PTR -68[rbp], edi
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -64[rbp]
	subsd	xmm0, QWORD PTR -56[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -68[rbp]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -56[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
	jmp	.L4
.L5:
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	xmm2, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR -16[rbp]
	subsd	xmm0, xmm1
	movq	rax, xmm0
	movsd	xmm1, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR -40[rbp]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	f
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -16[rbp]
	addsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
.L4:
	movsd	xmm0, QWORD PTR -64[rbp]
	comisd	xmm0, QWORD PTR -16[rbp]
	jnb	.L5
	movsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	integral, .-integral
	.section	.rodata
.LC2:
	.string	"%lf"
.LC3:
	.string	"%d"
.LC4:
	.string	"%f"
	.text
	.globl	funk
	.type	funk, @function
funk:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	QWORD PTR -64[rbp], rsi
	lea	rdx, -32[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	lea	rdx, -40[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	lea	rdx, -16[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	lea	rdx, -24[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	lea	rdx, -44[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	edx, DWORD PTR -44[rbp]
	movsd	xmm2, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	edi, edx
	movapd	xmm3, xmm2
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	integral
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC4[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	eax, 0
	leave
	ret
	.size	funk, .-funk
	.section	.rodata
	.align 8
.LC1:
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
