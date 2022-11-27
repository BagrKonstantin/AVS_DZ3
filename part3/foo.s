	.file	"foo.c"
	.intel_syntax noprefix
	.text
	.globl	f
	.type	f, @function
f:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -8[rbp], xmm0             # x
	movsd	QWORD PTR -16[rbp], xmm1            # a
	movsd	QWORD PTR -24[rbp], xmm2            # b
	movsd	xmm0, QWORD PTR -24[rbp]            # b
	mulsd	xmm0, QWORD PTR -8[rbp]             # * x
	mulsd	xmm0, QWORD PTR -8[rbp]             # * x
	mulsd	xmm0, QWORD PTR -8[rbp]             # * x
	addsd	xmm0, QWORD PTR -16[rbp]            # + a
	movq	rax, xmm0
	movq	xmm0, rax                           # return
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
	movsd	QWORD PTR -40[rbp], xmm0           # a
	movsd	QWORD PTR -48[rbp], xmm1           # b
	movsd	QWORD PTR -56[rbp], xmm2           # l
	movsd	QWORD PTR -64[rbp], xmm3           # r
	mov	DWORD PTR -68[rbp], edi                # n
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0            # res = 0.0
	movsd	xmm0, QWORD PTR -64[rbp]           # r
	subsd	xmm0, QWORD PTR -56[rbp]           # r - l
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -68[rbp]
	divsd	xmm0, xmm1                         # (r - l) / n
	movsd	QWORD PTR -24[rbp], xmm0           # h
	movsd	xmm0, QWORD PTR -56[rbp]           # x = l
	movsd	QWORD PTR -16[rbp], xmm0           # x
	jmp	.L4
.L5:
	movsd	xmm0, QWORD PTR -24[rbp]            # h
	movsd	xmm2, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2                          # h / 2
	movsd	xmm0, QWORD PTR -16[rbp]            # x
	subsd	xmm0, xmm1                          # x - (h / 2)
	movq	rax, xmm0
	movsd	xmm1, QWORD PTR -48[rbp]            # b
	movsd	xmm0, QWORD PTR -40[rbp]            # a
	movapd	xmm2, xmm1                          # b
	movapd	xmm1, xmm0                          # a
	movq	xmm0, rax                           # x
	call	f
	movsd	xmm1, QWORD PTR -8[rbp]             # res
	addsd	xmm0, xmm1                          # return + res
	movsd	QWORD PTR -8[rbp], xmm0             # res
	movsd	xmm0, QWORD PTR -16[rbp]            # x
	addsd	xmm0, QWORD PTR -24[rbp]            # x + h
	movsd	QWORD PTR -16[rbp], xmm0            # x
.L4:
	movsd	xmm0, QWORD PTR -64[rbp]        # r
	comisd	xmm0, QWORD PTR -16[rbp]        # x <= r
	jnb	.L5
	movsd	xmm0, QWORD PTR -8[rbp]         # res
	mulsd	xmm0, QWORD PTR -24[rbp]        # res * h
	movsd	QWORD PTR -8[rbp], xmm0         # res = res * h
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax                       # return
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
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	lea	rax, -32[rbp]                       # a
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -40[rbp]                       # b
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -16[rbp]                       # l
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -24[rbp]                       # r
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, -44[rbp]                       # n
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	edx, DWORD PTR -44[rbp]             # n
	movsd	xmm2, QWORD PTR -24[rbp]        # r
	movsd	xmm1, QWORD PTR -16[rbp]        # l
	movsd	xmm0, QWORD PTR -40[rbp]        # b
	mov	rax, QWORD PTR -32[rbp]             # a
	mov	edi, edx                            # n
	movapd	xmm3, xmm2                      # r
	movapd	xmm2, xmm1                      # l
	movapd	xmm1, xmm0                      # b
	movq	xmm0, rax                       # a
	call	integral
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax              # res = integral(a, b, l, r, n)
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
