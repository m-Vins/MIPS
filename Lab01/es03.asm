# • Siano date le seguenti variabili di tipo byte
# inizializzate in memoria:
# • op1: .byte 150
# • op2: .byte 100
# • Si stampi a video la somma delle due variabili,
# utilizzando la system call 1, e si verifichi che il
# risultato sia corretto.


.data			
op1:			.byte 150 
op2: 			.byte 100
res:			.space 1	

			.text
			.globl main.
			.ent main

main:
			
			lbu $t1,op1			#altrimenti c'è overflow
			lb $t2,op2
			
			add $t0,$t1,$t2
			add $a0,$0,$t0

			li $v0,1
			syscall
			
			li $v0,10
			syscall
			.end main