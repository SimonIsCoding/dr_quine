extern	dprintf
extern	snprintf
extern	system

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

	mov		rax, [counter]
	cmp		rax, 0
	je		.end
	xor		rax, rax

	mov		rax, [counter]
	dec		rax
	mov		[counter], rax

	lea 	rdi, [fileName]
	mov		rsi, 32
	lea		rdx, [name]
	mov		rcx, [counter]
	call	snprintf wrt ..plt

	lea 	rdi, [objectName]
	mov		rsi, 32
	lea		rdx, [object]
	mov		rcx, [counter]
	call	snprintf wrt ..plt

	lea 	rdi, [execName]
	mov		rsi, 32
	lea		rdx, [executable]
	mov		rcx, [counter]
	call	snprintf wrt ..plt

	open	[fileName], 0x241, 644o

	mov		[fd], rax
	mov		rdi, [fd]
	lea		rsi, [code]
	lea		rdx, 10
	mov		rcx, 34
	mov		r8, [counter]
	lea		r9, [code]
	xor		rax, rax
	call	dprintf wrt ..plt

	mov		rdi, execution1
	mov		rsi, 64
	lea		rdx, [nasm]
	lea		rcx, [fileName]
	lea		r8, [objectName]
	call	snprintf wrt ..plt

	mov		rdi, execution1
	call	system wrt ..plt

	mov		rdi, execution2
	mov		rsi, 64
	lea		rdx, [gcc]
	lea		rcx, [objectName]
	lea		r8, [execName]
	call	snprintf wrt ..plt

	mov		rdi, execution2
	call	system wrt ..plt

	mov		rdi, binary
	mov		rsi, 32
	lea		rdx, [final_exec]
	lea		rcx, [execName]
	call	snprintf wrt ..plt

	mov		rdi, binary
	call	system wrt ..plt

	close	[fd]

.end:
	pop		rbp
	ret

section .bss
fileName:	resb	32
objectName:	resb	32
execName:	resb	32
binary:		resb	32
fd:			resb	32
execution1:	resb	64
execution2:	resb	64

section	.data
counter:	dq	5
name:		db	"Sully_%d.s", 0
object:		db	"Sully_%d.o", 0
executable:	db	"Sully_%d", 0
nasm:		db	"nasm -f elf64 %s -o %s", 0
gcc:		db	"gcc -g %s -o %s", 0
final_exec:	db	"./%s", 0
code:		db	"extern	dprintf%1$cextern	snprintf%1$cextern	system%1$c%1$c%%macro open 3%1$c	mov	rax, 2%1$c	lea	rdi, %%1%1$c	mov	rsi, %%2%1$c	mov	rdx, %%3%1$c	syscall%1$c%%endmacro%1$c%1$c%%macro close 1%1$c	mov	rax, 3%1$c	mov	rdi, %%1%1$c	syscall%1$c%%endmacro%1$c%1$cglobal main%1$c%1$csection	.text%1$cmain:%1$c	push	rbp%1$c	xor		rax, rax%1$c%1$c	mov		rax, [counter]%1$c	cmp		rax, 0%1$c	je		.end%1$c	xor		rax, rax%1$c%1$c	mov		rax, [counter]%1$c	dec		rax%1$c	mov		[counter], rax%1$c%1$c	lea 	rdi, [fileName]%1$c	mov		rsi, 32%1$c	lea		rdx, [name]%1$c	mov		rcx, [counter]%1$c	call	snprintf wrt ..plt%1$c%1$c	lea 	rdi, [objectName]%1$c	mov		rsi, 32%1$c	lea		rdx, [object]%1$c	mov		rcx, [counter]%1$c	call	snprintf wrt ..plt%1$c%1$c	lea 	rdi, [execName]%1$c	mov		rsi, 32%1$c	lea		rdx, [executable]%1$c	mov		rcx, [counter]%1$c	call	snprintf wrt ..plt%1$c%1$c	open	[fileName], 0x241, 644o%1$c%1$c	mov		[fd], rax%1$c	mov		rdi, [fd]%1$c	lea		rsi, [code]%1$c	lea		rdx, 10%1$c	mov		rcx, 34%1$c	mov		r8, [counter]%1$c	lea		r9, [code]%1$c	xor		rax, rax%1$c	call	dprintf wrt ..plt%1$c%1$c	mov		rdi, execution1%1$c	mov		rsi, 64%1$c	lea		rdx, [nasm]%1$c	lea		rcx, [fileName]%1$c	lea		r8, [objectName]%1$c	call	snprintf wrt ..plt%1$c%1$c	mov		rdi, execution1%1$c	call	system wrt ..plt%1$c%1$c	mov		rdi, execution2%1$c	mov		rsi, 64%1$c	lea		rdx, [gcc]%1$c	lea		rcx, [objectName]%1$c	lea		r8, [execName]%1$c	call	snprintf wrt ..plt%1$c%1$c	mov		rdi, execution2%1$c	call	system wrt ..plt%1$c%1$c	mov		rdi, binary%1$c	mov		rsi, 32%1$c	lea		rdx, [final_exec]%1$c	lea		rcx, [execName]%1$c	call	snprintf wrt ..plt%1$c%1$c	mov		rdi, binary%1$c	call	system wrt ..plt%1$c%1$c	close	[fd]%1$c%1$c.end:%1$c	pop		rbp%1$c	ret%1$c%1$csection .bss%1$cfileName:	resb	32%1$cobjectName:	resb	32%1$cexecName:	resb	32%1$cbinary:		resb	32%1$cfd:			resb	32%1$cexecution1:	resb	64%1$cexecution2:	resb	64%1$c%1$csection	.data%1$ccounter:	dq	%3$d%1$cname:		db	%2$cSully_%%d.s%2$c, 0%1$cobject:		db	%2$cSully_%%d.o%2$c, 0%1$cexecutable:	db	%2$cSully_%%d%2$c, 0%1$cnasm:		db	%2$cnasm -f elf64 %%s -o %%s%2$c, 0%1$cgcc:		db	%2$cgcc -g %%s -o %%s%2$c, 0%1$cfinal_exec:	db	%2$c./%%s%2$c, 0%1$ccode:		db	%2$c%4$s%2$c, 0", 0