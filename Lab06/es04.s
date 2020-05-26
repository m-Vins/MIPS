                .data
vettore:        .word 70 , 5 , 7 , 2 , 51 , 3 , 60
dim:            .word 7

                .text
                .globl main
                .ent main

main:           la $a0,vettore
                lw $a1,dim

                jal massimo

                add $a0,$v0,$0
                li $v0,1
                syscall

                li $v0,10
                syscall
                .end main




massimo:        lw $v0,($a0)  #minimo
                li $t0,0

loop:           addi $a0,$a0,4
                lw $t1,($a0)
                slt $t2,$v0,$t1
                bne $t2,$0,incr
                addi $t0,$t0,1
                bne $t0,$a1,loop
                jr $ra

incr:           add $v0,$t1,$0
                addi $t0,$t0,1
                bne $t0,$a1,loop
                jr $ra
