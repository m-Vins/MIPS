DIM = 4
                      .data
matrice:              .word 126, -988, 65, 52
                      .word 7, 0, 2, 643
                      .word 66, 532, 43, 9254
                      .word 5, -51, 4352, -452
                      .text
                      .globl main
                      .ent main
main:                 subu $sp, $sp, 4
                      sw $ra, ($sp)
                      la $a0, matrice
                      li $a1, DIM
                      jal calcolaTrasp
                      lw $ra, ($sp)
                      addiu $sp, $sp, 4
                      jr   $ra



                      .ent calcolaTrasp
calcolaTrasp:         li $t0,0  #contatore
                      mul $t8,$a1,$a1 #max

ciclo:                div $t0,$a1
                      addi $t0,$t0,1
                      mflo $t1
                      mfhi $t2
                      bgt $t1,$t2,ok
                      bne $t0,$t8,ciclo
                      jr $ra

ok:                   mul $t3,$t1,4
                      add $t3,$t2,$t3
                      mul $t3,$t3,4
                      add $t3,$t3,$a0
                      mul $t4,$t2,4
                      add $t4,$t1,$t4
                      mul $t4,$t4,4
                      add $t4,$t4,$a0
                      lw $t5,($t4)
                      lw $t6,($t3)
                      sw $t6,($t4)
                      sw $t5,($t3)
                      bne $t0,$t8,ciclo
                      jr $ra

                      .end calcolaTrasp
