LUNG = 6
                .data
anni:           .word 1945, 2008, 1800, 2006, 1748, 1600
ris:            .space LUNG
                .text
                .globl main
                .ent main
                main: sub $sp, 4
                sw $ra, ($sp)
                la $a0, anni
                la $a1, ris
                li $a2, LUNG
                jal bisestile
                li $t1, LUNG
                la $t2, ris
                ciclo_stampa: li $v0, 1
                lbu $a0, ($t2)
                syscall
                addiu $t2, $t2, 1
                subu $t1, $t1, 1
                bnez $t1, ciclo_stampa
                lw $ra, ($sp)
                jr $ra
                .end main

bisestile:
                li $t0,0
loop:           mul $t1,$t0,4
                add $t1,$t1,$a0
                lw $t1,($t1)

                addi $sp,$sp,-12
                sw $t0,($sp)
                sw $a0,4($sp)
                sw $ra,8($sp)

                add $a0,$t1,$0
                jal check

                lw $t0,($sp)
                lw $a0,4($sp)
                lw $ra,8($sp)
                addi $sp,$sp,12


                add $t1,$t0,$a1
                sb $v0,($t1)

                addi $t0,$t0,1
                bne $t0,$a2,loop
                jr $ra



check:          li $t0,100
                div $a0,$t0
                mfhi $t0
                bnez $t0,boh

                li $t0,400
                div $a0,$t0
                mfhi $t0
                bnez $t0,false
                li $v0,1
                jr $ra

boh:            li $t0,4
                div $a0,$t0
                mfhi $t0
                bnez $t0,false
                li $v0,1
                jr $ra


false:          li $v0,0
                jr $ra
