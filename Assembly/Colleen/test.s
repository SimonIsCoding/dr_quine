extern	printf
default rel
global	main

section .text
Colleen:
	lea		rdi, [test]
	call	printf wrt ..plt
	ret

main:
	call	Colleen
	xor		rax, rax
	ret

section	.data
test:	db "is it printing?", 10, 0