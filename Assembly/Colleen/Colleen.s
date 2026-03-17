extern	printf
default rel

global	main

;comment outside the entrypoint

section .text
Colleen:
	lea		rdi, [quine]
;	lea		rsi, [quine_ptr]
	call	printf wrt ..plt
	ret

main:
;My comment inside the main
	call	Colleen
	xor		rax, rax
	ret

section	.data
quine:		db "extern printf", 10, "default rel", 10, 10, ";comment outside the entrypoint", 10, 10, "section .text", 10, "Colleen:", 10, "main:", 10, ";My comment inside the main", 10, "section .data", 10, "quine: db ", 34, quine_ptr, 34, 10, 0	
quine_ptr:  dq quine


;Il te faut deux commentaires
;un a lexterieur du main et un a l'interieur du main
;c'est le commentaire a l'interieur du main qui va imprimer tout le code et tu devras appeler
;un a l'exterieur pour faire beau

;Architecture
;tu dois avoir une fonction externe que tu appelleras avec main
;Je pense que cette fonction externe doit avoir un printf dedans pour imprimer le code
;ton main doit aussi imprimer un printf avec le code du fichier dedans + des variables dynamiques qui imprimeront le code de la fonction externe