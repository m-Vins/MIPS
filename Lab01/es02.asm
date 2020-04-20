# Siano date cinque variabili di tipo byte:
# var1 = ‘m’, var2 = ‘i’, var3 = ‘p’, var4 = ‘s’, var5 = 0
# • Si scriva un programma che converta in
# maiuscolo le prime 4 variabili.
# • Successivamente, stampare una stringa
# utilizzando la system call 4 e copiando in $a0
# l’indirizzo di var1.

			.data
var1:		.byte 'm'
var2:		.byte 'i'
var3: 		.byte 'p'
var4:		.byte 's'
var5:		.byte 0

			.text
			.globl main.
			.ent main

main:
			lb $t1,var1
			lb $t2,var2
			lb $t3,var3
			lb $t4,var4
			lb $t5,var5
			
			addi $t1, $t1, -32
			addi $t2, $t2, -32
			addi $t3, $t3, -32
			addi $t4, $t4, -32
			sb $t1,var1
			sb $t2,var2
			sb $t3,var3
			sb $t4,var4
			
			la $a0,var1
			li $v0,4
			syscall
			
			li $v0,10
			syscall
			.end main
			