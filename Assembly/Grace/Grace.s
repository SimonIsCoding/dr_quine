;syscall 2 for OPEN & 0x241 for flags
extern	dprintf
%macro open 3
	mov	rax, 2
	lea	rdi, %1
	mov	rsi, %2
	mov	rdx, %3
	syscall
%endmacro

%macro write 3
	mov	rax, 1
	mov	rdi, %1
	lea	rsi, %2
	mov	rdx, %3
	syscall
%endmacro

%macro close 1
	mov	rax, 3
	mov	rdi, %1
	syscall
%endmacro

;en gros tu dois utiliser dprintf, open, write. close ?

default	rel	
global	main

section	.text
main:
	push	rbp

	open	[filename], 0x241, 644o
	mov		[fd], rax
	mov		rdi, [fd]
	lea		rsi, [code]
	lea		rdx, [code]
	mov		rcx, 10
	mov		r8, 34
	xor		rax, rax
	call	dprintf wrt ..plt
	close	[fd]
	xor		rax, rax

	pop		rbp
	ret

section	.data
filename:	db	"Grace_kid.s", 0
code:		db	";syscall 2 for OPEN & 0x241 for flags%2$cextern	dprintf%2$csection	.text%2$cmain:%2$c	push	rbp%2$c%2$c	open	[filename], 0x241, 644o%2$c	mov		[fd], rax%2$c	mov		rdi, [fd]%2$c	lea		rsi, [code]%2$c	lea		rdx, [code]%2$c	mov		rcx, 10%2$c	xor		rax, rax%2$c	call	dprintf wrt ..plt%2$c	close	[fd]%2$c	xor		rax, rax%2$c%2$c	pop		rbp%2$c	ret%2$c%2$csection	.data%2$cfilename:	db	%3$cGrace_kid.s%3$c, 0%2$ccode:		db	%3$c%s%3$c, 0", 0
fd:			dq	0
;int open(file.s, O_WRONLY | O_CREAT | O_TRUNC)
;int write(int fd, char *str, ssize_t buf)
;int close
;int dprintf(int fd, const char *format, ...);