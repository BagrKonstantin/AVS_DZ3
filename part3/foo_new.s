	.file	"foo.c"
	.intel_syntax noprefix
	.text
	.globl	f
	.type	f, @function
f:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	xmm4, xmm0                          # x
	movsd	xmm0, xmm6                          # * b
	mulsd	xmm0, xmm4                          # * x
	mulsd	xmm0, xmm4                          # * x
	mulsd	xmm0, xmm4                          # * x
	addsd	xmm0, xmm5                          # + a
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

	pxor	xmm0, xmm0
	movsd	xmm8, xmm0                          # res = 0.0
	movsd	xmm0, xmm3                          # r
	subsd	xmm0, xmm2                          # r - l
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, edi
	divsd	xmm0, xmm1                         # (r - l) / n
	movsd	xmm9, xmm0                         # h
	movsd	xmm0, xmm2                         # x = l
	movsd	xmm7, xmm0                         # x
	jmp	.L4
.L5:
	movsd	xmm0, xmm9                          # h
	movsd	xmm2, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2                          # h / 2
	movsd	xmm0, xmm7                          # x
	subsd	xmm0, xmm1                          # x - (h / 2)
	movq	rax, xmm0
	movq	xmm0, rax                           # x
	call	f
	addsd	xmm8, xmm0                          # return + res
	addsd	xmm7, xmm9                          # x + h
.L4:
	movsd	xmm0, xmm3                          # r
	comisd	xmm0, xmm7                          # x <= r
	jnb	.L5
	movsd	xmm0, xmm8                          # res
	mulsd	xmm0, xmm9                          # res * h
	movsd	xmm8, xmm0                          # res = res * h
	movsd	xmm0, xmm8
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
	movapd	xmm6, xmm0                      # b
	movq	xmm5, rax                       # a
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
