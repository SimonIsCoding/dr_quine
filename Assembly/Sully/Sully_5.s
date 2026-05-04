extern	dprintf
extern	snprintf

%macro open 3
	mov	rax, 2
	lea	rdi, %1
	mov	rsi, %2
	mov	rdx, %3
	syscall
%endmacro

%macro close 1
	mov	rax, 3
	mov	rdi, %1
	syscall
%endmacro

global main

section	.text
main:
	push	rbp
	xor		rax, rax

	lea 	rdi, [fileName]
	mov		rsi, 32
	lea		rdx, [name]
	mov		rcx, [counter]
	call	snprintf wrt ..plt

	mov		rax, [counter]
	dec		rax
	mov		[counter], rax

	open	[fileName], 0x241, 644o

	mov		[fd], rax
	mov		rdi, [fd]
	lea		rsi, [code]
	lea		rdx, 10
	mov		rcx, 34
	mov		r8, []
	mov		r9, [code]
	xor		rax, rax
	call	dprintf wrt ..plt

	close	[fd]

	pop		rbp
	ret

section .bss
fileName:	resb	32
fd:			resb	32

section	.data
counter:	dq	
name:		db	"Sully_%d.s", 0
