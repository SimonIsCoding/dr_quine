	;syscall 2 for OPEN & 0x241 for flags
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

	default	rel	
	global	main

	section	.text
	main:
		open	[filename], 0x241, 644o
		mov		[fd], rax
		write	[fd], [code], 7
		close	[fd]
		xor		rax, rax
		ret

	section	.data
	filename:	db	"Grace_kid.s", 0
	code:		db	"myCode", 0
	fd:			dq	0
	;int open("file.s", O_WRONLY | O_CREAT | O_TRUNC)
	;int write(int fd, char *str, ssize_t buf)
	;int close