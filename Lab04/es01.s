#serie di fibonacci
.data
vettore:        .space 80

                .text
                .globl main
                .ent main

main:             li $t0,0
                  li $t1,1
                  li $t2,0 #contatore
                  li $t3,0 #puntatore array
ciclo:            add $t4,$t0,$t1
                  sw $t4,vettore($t3)
                  addi $t3,$t3,4 #aggiorno il puntatore
                  addi $t2,$t2,1 #aggiorno il contatore
                  add $t0,$t1,$0
                  add $t1,$t4,$0
                  bne $t2,20,ciclo


                  li $v0,10
                  syscall
                  .end main
