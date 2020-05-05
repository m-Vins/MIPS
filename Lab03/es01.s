.data
message_err:  .asciiz "\ninserire solo cifre"
.text
.globl main
.ent main
main:
          #li $v0,5
          #syscall
          #add $t0,$v0,$0

          add $t0,$0,$0
          addi $t5,$0,'0'
          addi $t5,$t5,-1
          addi $t6,$0,'9'
          addi $t6,$t6,1


loop:     li $v0,12
          syscall
          beq $v0,'\n',exit
          blt $v0,$t5,error
          bgt $v0,$t6,error
          mul $t0,$t0,10
          sub $t1,$v0,'0'
          add $t0,$t0,$t1
          j loop


exit:     li $v0,1
          add $a0,$t0,$0
          syscall
          
error:    li $v0,4
          la $a0,message_err
          syscall

          li $v0,10
          syscall
          .end main
