;syscall 2 for OPEN & 0x241 for flags
%macro open 2
	mov	rax, 2
	lea	rdi, [filename]
	mov	rsi, 0x241
	syscall
%endmacro

%macro write 3
	lea	rdi, [filename]
	lea	rsi, code
	mov	rdx, 7
	syscall
%endmacro

%macro close
	lea	rdi, [filename]
	syscall
%endmacro

default	rel
global	main

section	.text
main:
	mov	rax, 2
	lea	rdi, [filename]
	mov	rsi, 0x241
	syscall
	ret

section	.data
filename:	db	"Grace_kid.s", 0
code:		db	"myCode", 0
;int open("file.s", O_WRONLY | O_CREAT | O_TRUNC)
;int write(int fd, char *str, ssize_t buf)
;int close