.data
vett1:      .word 5 , 65 , 47 , 25
vett2:      .word 1 , 5, 48 , 6
matr:       .space 64

            .text
            .globl main
            .ent main
main:       li $t0,0 #indice vett1
            li $t2,0 #indice matrice
            li $t3,0 #contatore

cicloext:   li $t1,0 #azzero indice vett2

cicloint:   lw $t4,vett1($t0)
            lw $t5,vett2($t1)
            mul $t5,$t5,$t4
            sw $t5,matr($t2)
            addi $t1,$t1,4
            addi $t2,$t2,4
            addi $t3,$t3,1
            li $t4,4
            div $t3, $t4
            mfhi $t5
            bne $t5,0,cicloint

            addi $t0,$t0,4
            bne $t3,16,cicloext


            li $v0,12
            syscall
            .end main
