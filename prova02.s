			#ricerca del  carattere minimo
		
			.data
		
wVett: 		.space 5
wRes:		.space 1
message_in:	.asciiz "inserire caratteri\n"
message_out: .asciiz "\nvalore minimo : "

			.text
			.globl main
			.ent main
			
main:		
			la $t0, wVett		#load address->puntatore inizio del vettore
			li $t1,0			#contatore

			la $a0,message_in 	#indirizzo della stringa
			li $v0,4			#system call per stampare la stringa
			syscall
			
			#legge il vettore di 5 elementi, ciascuno da 1 byte
			
ciclo1: 	li $v0,12			#legge 1 char
			syscall				#system call-> risultato in $v0
			sb $v0,($t0)		#sposta nel registro $t0, i byte bassi di $v0
			add $t1,$t1,1
			add $t0,$t0,1
			bne $t1,5,ciclo1	#itera 5 volte
			
			la $t0,wVett
			li $t1,0
			lb $t2,($t0)		#carica il byte minimo
			
ciclo2:		lb $t3,($t0)
			bgt $t3,$t2,salta	#salta se non deve aggiornare il minimo
			lb $t2,($t0)		#aggiorna min
salta:		add $t1,$t1,1
			add $t0,$t0,1
			bne $t1,5,ciclo2
			
			
			la $a0,message_out
			li $v0,4
			syscall
			
			li $v0,11			#stampa 1 char
			move $a0,$t2
			syscall
			 
			li $v0,10
			syscall
			.end main
			
			