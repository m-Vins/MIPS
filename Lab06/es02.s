            .data
request:     .asciiz "inserire grandezza lato\n"
            .text
            .globl main
            .ent main

main:       la $a0,request
            li $v0,4
            syscall
            li $v0,5
            syscall
            add $a0,$v0,$0
            add $t8,$v0,$0
            jal tri
            add $a0,$a0,$0
            jal quad

            li $v0,10
            syscall
            .end main




            .ent tri

tri:        li $t0,1 #contatore
            add $t2,$a0,$0

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

quad:       li $t0,1
            add $t2,$a0,$0
            mul $t3,$t2,$t2

loop:       div $t0,$t2
            mfhi $t1
            bne $t1,$0,myjump
            li $v0,11
            li $a0,'\n'
            syscall
            addi $t0,$t0,1
            beq $t3,$t0,exit_p
myjump:     li $v0,11
            li $a0,'*'
            syscall
            addi $t0,$t0,1
            beq $t3,$t0,exit_p
            j loop

exit_p:     jr $ra

            .end quad
