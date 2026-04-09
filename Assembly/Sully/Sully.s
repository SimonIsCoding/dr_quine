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

extern	snprintf
extern	dprintf

default	rel	
global	main

section	.text
main:
	push	rbp

.loop:
	lea		rdi, [fd]
	mov		rsi, 32
	lea		rdx, [filename]
	mov		rcx, [counter]
	xor		rax, rax
	call	snprintf wrt ..plt

	lea		rdi, [fd]
	mov		rsi, 32
	lea		rdx, [executable]
	mov		rcx, [counter]
	xor		rax, rax
	call	snprintf wrt ..plt

	open	[fd], 0x241, 644o
	mov		rdi, rax
	lea		rsi, [code]
	call	dprintf wrt ..plt
	close	[fd]

	mov		rax, [counter]
	dec		rax
	mov		[counter], rax

	xor		rax, rax
	pop		rbp
	ret

section	.data
filename:	db	"Sully_%d.s", 0
executable:	db	"Sully_%d", 0
code:		db	"myCode", 0
counter:	dq	5
command:	db	"gcc %s -o %s && ./%s", 0

section	.bss
fd:			resb	32
file_size:	resb	32