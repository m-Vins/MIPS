		# Esercizio 1
# • Siano date le seguenti variabili di tipo byte già
# inizializzate in memoria:
# • n1: .byte 10
# • n2: .byte 0x10
# • n3: .byte '1'
# • Sia inoltre definita la variabile di tipo byte,
# non inizializzata, res
# • Si calcoli la seguente espressione e si verifichi
# il risultato: res = n1 - n2 + n3

				.data
		
		n1: 	.byte 10
		n2: 	.byte 
		n3: 	.byte '1'
		res: 	.byte 0		
		
				.text
				.globl main
				.ent main
			
main:	
			lb $t1,n1($0)
			lb $t2,n2($0)
			lb $t3,n3($0)
			
			sub $t4,$t1,$t2
			add $t4,$t4,$t3
			sb $t4,res
			
			li $v0,10
			syscall
			.end main
			