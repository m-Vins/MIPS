.data
DIM = 5
              .text
              .globl main
              .ent main
main:
              add $t0,$0,$0 #contatore
              add $t1,$0,$0 #accumulatore
for:
              beq $t0,DIM,end
              li $v0,5
              syscall
              add $t1,$t1,$v0
              addi $t0,$t0,1
              j for
end:
              div $t1,$t1,DIM
              add $a0,$t1,$0
              li $v0,1
              syscall
              li$v0,10
              syscall
              .end main
