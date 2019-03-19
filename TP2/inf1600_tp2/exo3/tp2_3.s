	.file	"tp2_3.c"
	.text
	.comm	a,4,4
	.comm	b,4,4
	.comm	c,4,4
	.comm	d,4,4
	.comm	e,4,4
	.type	func_c, @function
func_c:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L2
.L6:
	movl	d, %edx
	movl	e, %eax
	addl	%eax, %edx
	movl	b, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, a
	movl	b, %eax
	leal	-999(%eax), %edx
	movl	c, %eax
	addl	$500, %eax
	cmpl	%eax, %edx
	jg	.L3
	movl	c, %eax
	subl	$500, %eax
	movl	%eax, c
	movl	b, %edx
	movl	c, %eax
	cmpl	%eax, %edx
	jle	.L5
	movl	b, %eax
	subl	$500, %eax
	movl	%eax, b
	jmp	.L5
.L3:
	movl	b, %edx
	movl	e, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, b
	movl	d, %eax
	addl	$500, %eax
	movl	%eax, d
.L5:
	addl	$1, -4(%ebp)
.L2:
	cmpl	$10, -4(%ebp)
	jle	.L6
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	func_c, .-func_c
	.section	.rodata
	.align 4
.LC0:
	.string	"a = %d    b = %d    c = %d    d = %d    e = %d\n"
	.align 4
.LC1:
	.string	"Le r\303\251sultat devrait \303\252tre le m\303\252me les 3 fois :\n"
.LC2:
	.string	"Version en langage C : %i\n"
.LC3:
	.string	"Version en assembleur : %i\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x6,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$12, %esp
	movl	$0, a
	movl	$5000, b
	movl	$3000, c
	movl	$500, d
	movl	$1000, e
	movl	e, %esi
	movl	d, %ebx
	movl	c, %ecx
	movl	b, %edx
	movl	a, %eax
	subl	$8, %esp
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$32, %esp
	subl	$12, %esp
	pushl	$.LC1
	call	puts
	addl	$16, %esp
	call	func_c
	movl	a, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	movl	$0, a
	movl	$5000, b
	movl	$3000, c
	movl	$500, d
	movl	$1000, e
	movl	a, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC3
	call	printf
	addl	$16, %esp
	movl	$0, a
	movl	$5000, b
	movl	$3000, c
	movl	$500, d
	movl	$1000, e
	call	func_c
	movl	a, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	movl	$0, %eax
	leal	-12(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20181215 (Red Hat 8.2.1-6)"
	.section	.note.GNU-stack,"",@progbits
