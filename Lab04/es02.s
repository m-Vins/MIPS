.data
opa:         .word 2043
opb:         .word 5
res:         .space 4
tabella:     .word lsum,lsub,lmult,ldiv

              .text
              .globl main
              .ent main
main:         li $v0,5
              syscall
              lw $t1,opa
              lw $t2,opb

              #beq $v0,0,lsum
              #beq $v0,1,lsub
              #beq $v0,2,lmult
              #beq $v0,3,ldiv
              #j exit


              sll $t0,$v0,2
              lw $t3, tabella($t0)
              jr $t3

lsum:         add $t1,$t1,$t2
              j exit

lsub:         sub $t1,$t1,$t2
              j exit

lmult:        mul $t1,$t1,$t2
              j exit

ldiv:         div $t1,$t1,$t2
              j exit

exit:         sw $t1,res

              li $v0,10
              syscall
              .end main
