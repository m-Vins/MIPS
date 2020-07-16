                            .data
espressione:                .word 18, 25, 10, 7, -2, -3, -1, 13, -2
tabella:                    .word somma, sottrazione, moltiplicazione, divisione
                            .text
                            .globl main
                            .ent main
main:                       subu $sp, $sp, 4
                            sw $ra, ($sp)
                            la $a0, espressione
                            li $a1, 9
                            jal calcolaPolaccaInversa

                            move $t0,$v0

                            li $v0,10
                            syscall
                            .end main




                          .ent calcolaPolaccaInversa
calcolaPolaccaInversa:    li $t0,0 #contatore
                          move $t9,$a0
                          move $t7,$a1
                          li $t8,0x80000000
ciclo:                    mul $t1,$t0,4
                          add $t1,$t9,$t1
                          lw $t1,($t1)
                          and $t2,$t1,$t8
                          bnez $t2,calcola
                          addi $sp,$sp,-4
                          sw $t1,($sp)
                          addi $t0,$t0,1
                          j ciclo

calcola:                  move   $a0, $t1
                          addi $sp,$sp,8
                          lw $a1,-4($sp)
                          lw $a2,-8($sp)
                          addi $sp,$sp,-8
                          sw $ra,($sp)
                          sw $t0,4($sp)
                          jal eseguiOperazione
                          lw $ra,($sp)
                          lw $t0,4($sp)
                          addi $sp,$sp,8
                          addi $sp,$sp,-4
                          sw $v0,($sp)
                          addi $t0,$t0,1
                          bne $t0,$t7,ciclo

                          jr $ra


                          eseguiOperazione:
                          subu $t0, $zero, $a0
                          subu $t0, $t0, 1
                          sll $t0, $t0, 2
                          lw $t1, tabella($t0)
                          jr $t1
                          somma: addu $v0, $a1, $a2
                          b fine
                          sottrazione: subu $v0, $a1, $a2
                          b fine
                          moltiplicazione: mulou $v0, $a1, $a2
                          b fine
                          divisione: divu $v0, $a1, $a2
                          b fine
                          fine: jr $ra
