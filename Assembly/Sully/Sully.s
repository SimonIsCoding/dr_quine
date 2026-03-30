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

default	rel	
global	main

section	.text
main:
	push	rbp
;	open	[filename], 0x241, 644o
	lea		rdi, [buf]
	mov		rsi, 32
	mov		rcx, counter
	lea		rdx, [filename]
	call	snprintf wrt ..plt
	mov		[fd], rax
	write	[fd], [code], 7
	close	[fd]
	xor		rax, rax
	pop		rbp
	ret

section	.data
filename:	db	"Sully_%d.s", 0
code:		db	"myCode", 0
fd:			dq	0
counter		dq	5

section	.bss
buf:		resb	32
file_size:	resb	32