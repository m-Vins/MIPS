# • Utilizzando la system call 5, leggere un intero
# introdotto tramite tastiera e salvarlo in $t1.
# • Leggere un altro intero e salvarlo in $t2.
# • Senza utilizzare altri registri, scambiare il
# valore di $t1 e $t2.
# • Suggerimento: utilizzare istruzioni di somma e
# sottrazione.

			.text
			.globl main.
			.ent main
main:
			#leggo il primo valore e memorizzo in t1
			li $v0,5
			syscall
			add $t1,$0,$v0
			#leggo il secondo valore e memorizzo in t2
			li $v0,5
			syscall
			add $t2,$0,$v0
			
			#scambio i valori
			add $t1,$t1,$t2
			sub $t2,$t1,$t2
			sub $t1,$t1,$t2

			
			addu $a0,$0,$t1
			li $v0,1
			syscall
				
			addu $a0,$0,$t2
			li $v0,1
			syscall
			
			li $v0,10
			syscall
			.end main
						