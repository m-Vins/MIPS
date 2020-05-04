#Si scriva un programma che conti il numero di
#bit a 1 nella rappresentazione binaria di una
#variabile di tipo halfword.

.data
op:         .half 509

            .text
            .globl main
            .ent main
main:
            lw    $t1, op
            add $t2,$0,$0 #counter degli 1
            add $t3,$0,$0 #counter dei bit

loop:       and $t0,$t1,1
            srl $t1,$t1,1
            bne $t0,1,zero
            addi $t2,$t2,1
zero:       addi $t3,$t3,1
            bne $t3,16,loop


            li $v0,1
            add $a0,$t2,$0
            syscall

            li $v0,10
            syscall
            .end main
