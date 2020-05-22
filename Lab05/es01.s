.data
op1:        .word 3141592653


            .text
            .globl main
            .ent main
main:
            lw $t0,op1
            li $t1,10 #lo uso per dividere
            li $t2,0 #lo uso come contatore


division:   divu $t0,$t1
            addi $sp,$sp,-4
            mfhi $t5
            sw $t5, ($sp)
            mflo $t0
            addi $t2,$t2,1
            bne $t0,$0,division

            li $t1,'0'
comp:       lw $t5, ($sp)
            add $a0,$t5,$t1
            addi $sp,$sp,4
            addi $t2,$t2,-1
            li $v0,11
            syscall
            bne $t2,$0,comp

            li $v0,10,
            syscall
            .end main
