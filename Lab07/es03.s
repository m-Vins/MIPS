                .text
                .globl main
                .ent main

main:           li $a0,3
                jal sequColl

                add $a0,$v0,$0
                li $v0,1
                syscall

                li $v0,10
                syscall
                .end main


                .ent sequenzaDiCollatz

sequColl:       addi $sp,$sp,-4
                sw $ra,($sp)

                li $t0,0

                addi $sp,$sp,-4

ciclo:          sw $t0,($sp)
                jal procedura
                add $a0,$v0,$0
                lw $t0,($sp)
                addi $t0,1
                bne $a0,1,ciclo

                add $v0,$t0,$0

                addi $sp,$sp,4
                lw $ra,($sp)
                addi $sp,$sp,4

                jr $ra


                .end sequenzaDiCollatz


                .ent procedura

procedura:      li $t0,2
                div $a0,$t0
                mfhi $t0
                bne $t0,$0,disp
                li $t0,2
                div $v0,$a0,$t0
                jr $ra

disp:           li $t0,3
                mul $v0,$a0,$t0
                addi $v0,$v0,1
                jr $ra


                .end procedura
