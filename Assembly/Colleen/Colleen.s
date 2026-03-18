extern	printf
default rel

global	main

;comment outside the entrypoint

section .text
Colleen:
	lea		rdi, [quine]
	lea		rsi, [quine]
	call	printf wrt ..plt
	ret

main:
;My comment inside the main
	call	Colleen
	xor		rax, rax
	ret

section	.data
quine:		db "extern printf", 10, "default rel", 10, 10, "global main", 10, 10, ";comment outside the entrypoint", 10, 10, "section .text", 10, "Colleen:", 10, "	lea	rdi, [quine]", 10, "	lea	rsi, [quine]", 10, "	call	printf wrt ..plt", 10, "	ret", 10, 10, "main:", 10, ";My comment inside the main", 10, "	call	Colleen", 10, "	xor	rax, rax", 10, "	ret", 10, 10, "section .data", 10, "quine: db ", 34, "%s", 34, 0