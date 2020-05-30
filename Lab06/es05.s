            .data
n:          .word 12
k:          .word 2

            .text
            .globl main
            .ent main
main:       lw $a0,n
            lw $a1,k
            jal comb

            add $a0,$v0,$0
            li $v0,1
            syscall

            li $v0,10
            syscall
            .end main





comb:       sw $ra,-4($sp)
            add $t0,$a0,$0
            add $t1,$a1,$0
            sub $t2,$t0,$t1
            jal fact
            add $t0,$v0,$0
            add $a0,$0,$t1
            jal fact
            add $t1,$v0,$0
            add $a0,$t2,$0
            jal fact
            add $t2,$v0,$0
            div $t0,$t0,$t1
            div $t0,$t0,$t2
            add $v0,$t0,$0
            lw $ra,-4($sp)
            jr $ra



fact:       li $v0,1
loop_f:     mul $v0,$v0,$a0
            addi $a0,$a0,-1
            bne $a0,$0,loop_f
            jr $ra
