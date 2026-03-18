;syscall 2 for OPEN & 0x241 for flags
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
;int open("file.s", O_WRONLY | O_CREAT | O_TRUNC)