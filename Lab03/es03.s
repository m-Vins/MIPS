.data
var1:         .byte 1
var2:         .byte 5
var3:         .byte 48
message_err:   .asciiz "ERRORE"

              .text
              .globl main
              .ent main
main:
              lb $t0,var3
              lb $t1,var2
              lb $t2,var1

              addi $t5,$0,60
              addi $t6,$0,1440


              multu  $t1, $t5
              mflo $t1
              mfhi $t7
              bne $t7,$0,error

              multu $t2,$t6
              mflo $t2
              mfhi $t7
              bne $t7,$0,error

              addu $t0,$t0,$t1
              addu $t0,$t0,$t2

              li $v0,1
              add $a0,$t0,$0
              syscall
              j end

error:        li $v0,4
              la $a0,message_err
              syscall

end:          li $v0,10
              syscall
              .end main
