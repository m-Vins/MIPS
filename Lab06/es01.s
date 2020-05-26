DIM = 8;
            .text
            .globl main
            .ent main

main:       jal tri
            jal quad

            li $v0,10
            syscall
            .end main




            .ent tri

tri:        li $t0,0 #contatore
            li $t2,DIM

loope_t:    li $t1,0

loopi_t:    li $v0,11
            li $a0,'*'
            syscall
            addi $t1,$t1,1
            bne $t1,$t0,loopi_t

            li $a0,'\n'
            li $v0,11
            syscall
            addi $t0,$t0,1
            bne $t0,$t2,loope_t
            jr    $ra          # jump to $ar

            .end tri




            .ent quad

quad:       li $t0,0
            li $t2,DIM
            mul $t2,$t2,$t2

loop:       div $t0,$t2
            mfhi $t1
            bne $t1,$0,myjump
            li $v0,11
            li $a0,'\n'
            syscall
            addi $t0,$t0,1
            beq $t2,$t0,exit_p
myjump:     li $v0,11
            li $a0,'*'
            syscall
            addi $t0,$t0,1
            j loop

exit_p:     jr $ra

            .end quad
