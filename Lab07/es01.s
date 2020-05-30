#NON FUNZIONA



                .text
                .globl main
                .ent main

main:           li $t0,4
                li $t1,2
                li $t2,-5
                li $t3,3

                li $s0,8
                li $s1,4
                li $s2,27
                li $s3,9
                li $s4,64
                li $s6,16

                add $a0,$0,$t0
                add $a0,$a0,$t1
                add $a0,$a0,$t2
                add $a0,$a0,$t3

                mul $t4,$t0,$s0
                add $a1,$0,$t4
                mul $t4,$t1,$s1
                add $a1,$a1,$t4
                li $t4,2
                mul $t4,$t4,$t2
                add $a1,$a1,$t4
                add $a1,$a1,$t3

                mul $t4,$t0,$s2
                add $a2,$0,$t4
                mul $t4,$t1,$s3
                add $a2,$a2,$t4
                li $t4,3
                mul $t4,$t4,$t2
                add $a2,$a2,$t4
                add $a2,$a2,$t3

                mul $t4,$t0,$s4
                add $a3,$0,$t4
                mul $t4,$t1,$s5
                add $a3,$a3,$t4
                li $t4,4
                mul $t4,$t4,$t2
                add $a3,$a3,$t4
                add $a3,$a3,$t3

                add $sp,$sp,-16
                sw $t0,($sp)
                sw $t1,4($sp)
                sw $t2,8($sp)
                sw $t3,12($sp)

                add $sp,$sp,-4
                li $t4,3
                sw $t4,($sp)

                jal polinomio


                add $sp,$sp,4

                lw $t0,($sp)
                lw $t1,4($sp)
                lw $t2,8($sp)
                lw $t3,12($sp)
                addi $sp,$sp,16

                move $a0,$v0
                li $v0,1
                syscall

                li $v0,10
                syscall
                .end main








                .ent polinomio
polinomio:
                add $fp,$sp,$0

                addi $sp,$sp,-12
                sw $s0,($sp)
                sw $s1,4($sp)
                sw $s2,8($sp)

                sub $t0,$a1,$a0
                sub $t1,$a2,$a1
                sub $t2,$a3,$a2

                sub $s0,$t1,$t0
                sub $s1,$t2,$t1
                sub $s2,$s1,$s0

                move $v0,$a3

                li $t3,0
                lw $t4,($fp)
                addi $t4,$t4,-5


ciclo:          add $s1,$s1,$s2
                add $t2,$t2,$s1
                add $v0,$v0,$t2
                addi $t3,$t3,1

                bne $t3,$t4,ciclo

                lw $s0,($sp)
                lw $s1,4($sp)
                lw $s2,8($sp)
                addi $sp,$sp,12

                jr $ra

                .end polinomio
