#• Si scriva un programma che – Acquisisca due interi positivi – Verifichi che gli interi acquisiti siano
#rappresentabili su byte, e in questo caso esegua la
#seguente operazione logica bitwise e scriva sulla
#console il risultato ottenuto (intero):
#C = NOT(A AND (NOT(B))) OR (A XOR B) – Altrimenti, dia un messaggio di errore.
.data
message_err: .asciiz "inserire valore tra -127 e 128\n"

            .text
            .globl main
            .ent main
main:
            li $t0,0xFFFFFF00
            #lettura primo numero
first:      li $v0,5
            syscall
            add $t1,$v0,$0
            and $t3,$t1,$t0
            beq $t3,$0,second

            la $a0,message_err
            li $v0,4
            syscall
            j first
second:
            #lettura secondo numero
            li $v0,5
            syscall
            add $t2,$v0,$0
            and $t3,$t2,$t0
            beq $t3,$0,operation

            la $a0,message_err
            li $v0,4
            syscall
            j second

operation:
            xor $t3,$t1,$t2
            not $t2,$t2
            and $t1,$t1,$t2
            not $t1,$t1
            or $t0,$t1,$t3


            li $t1, 0x000000FF
            and $a0, $t0, $t1
            li $v0, 1
            syscall


            li $v0,10
            syscall
            .end main
