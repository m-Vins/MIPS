#• Si scriva un programma che richieda all’utente
#un intero positivo e quindi dica se il valore
#introdotto è pari oppure dispari
#• Per la determinazione del pari/dispari si
#utilizzi un’operazione di and logico con il
#valore 1
.data
output:       .asciiz "inserire un intero positivo\n"
pari:         .asciiz "pari"
dispari:      .asciiz "dispari"

              .text
              .globl main
              .ent main

main:
              la $a0,output
              li $v0,4
              syscall

              li $v0, 5
              syscall
              add $t0,$v0,$0
              andi $t1,$t0,1
              beq $t1,1,Label_d

              la $a0,pari
              li $v0,4
              syscall

              j finish

Label_d:      la $a0,dispari
              li $v0,4
              syscall
finish:
              li $v0,10
              syscall
              .end main
