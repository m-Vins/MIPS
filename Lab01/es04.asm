# • Sia data la seguente variabile di tipo word
# inizializzata in memoria:
# var: .word 0x3FFFFFF0
# • Si memorizzi nel registro $t1 il doppio del
# valore di var e poi lo si stampi a video.
# • Aggiungere a $t1 il valore immediato 40
# (usando un altro registro come destinazione
# per non modificare $t1). Cosa accade? E’
# possibile stampare un risultato numerico?

.data

var: 			.word 0x3FFFFFF0


				.text
				.globl main.
				.ent main
main:

				lw $t1,var
				sll $t1,$t1,1
				
				add $a0,$0,$t1
				li $v0,1
				syscall
				
				#addi $t2,$t1,40   	#in questo modo non riesco a stampare	
				li $t2,40
				addu $a0,$t1,$t2
				li $v0,1
				syscall
				
				li $v0,10
				syscall
				.end main
				
				
				
#continuo ad avere un problema nella stampa
#in quanto il valore viene stampato in ca2 invece che puro