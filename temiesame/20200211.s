                        .data
vettore:                .byte 14, 16, 18, 134, 24, 22, 23, 149, 140, 141, 145, 146
vettoreCompresso:       .space 12
INTERVALLO_QUANT = 10
                        .text
                        .globl main
                        .ent main
main:
                        subu $sp, $sp, 4
                        sw $ra, ($sp)
                        la $a0, vettore
                        li $a1, 12
                        la $a2, vettoreCompresso
                        jal comprimi

                        lw $ra, ($sp)
                        addu $sp, $sp, 4
                        jr $ra
                        .end main
quantizza:
                        divu $t0, $a0, INTERVALLO_QUANT
                        mulou $v0, $t0, INTERVALLO_QUANT
                        jr $ra


                      .ent comprimi
comprimi:             li $t0,0  #contatore
                      li $t2,0 #max nuovo vettore
ciclo:                add $t1,$t0,$a0
                      addi $sp,$sp,-12
                      sw $t0,($sp)
                      sw $a0,4($sp)
                      sw $ra,8($sp)
                      lb $a0,($t1)
                      jal quantizza

                      beqz $t2,assente

                      li $t3,0

cicloint:             add $t4,$a2,$t3
                      lb $t4,($t4)
                      beq $t4,$v0,presente
                      addi $t3,$t3,1
                      bne $t3,$t2,cicloint

assente:              add $t4,$a2,$t2
                      sb $v0,($t4)
                      addi $t2,$t2,1

presente:             lw $t0,($sp)
                      lw $a0,4($sp)
                      lw $ra,8($sp)
                      addi $sp,$sp,12
                      addi $t0,$t0,1
                      bne $t0,$a1,ciclo
                      add $v0,$0,$t2
                      jr $ra
                      .end comprimi
