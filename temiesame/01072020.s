DIM = 11
                      .data
veta:                 .word 2, 14, 8, 54, 0, 42, 9, 24, 0, 91, 23
vetb:                 .byte 4*DIM
                      .text
                      .globl main
                      .ent main
main:
                      la $a0, veta
                      la $a1, vetb
                      li $a2, DIM
                      jal media

                      .end main

                        .ent media
media:
                        li $t0,2 #contatore
                        lw $t1,($a0)
                        sw $t1,($a1)
                        lw $t2,4($a0)
                        sw $t2,4($a1)
                        addi $a2,$a2,-1
                        mul $t4,$t0,4
                        add $t4,$a0,$t4

ciclo:
                        lw $t5,4($t4)
                        lw $t4,($t4)
                        add $t4,$t4,$t5
                        add $t4,$t4,$t1
                        add $t4,$t4,$t2
                        div $t4,$t4,4
                        mul $t5,$t0,4
                        add $t5,$a1,$t5
                        sw $t4,($t5)
                        addi $t0,$t0,1
                        beq $t0,$a2,finish
                        mul $t4,$t0,4
                        add $t4,$a0,$t4
                        lw $t1,-4($t4)
                        lw $t2,-8($t4)
                        j ciclo
finish:                 mul $t4,$t0,4
                        add $t5,$t4,$a0
                        lw $t5,($t5)
                        add $t4,$t4,$a1
                        sw $t5,($t4)
                        j $ra
