          .data
message_err: .asciiz "ERRORE"
message_ok:  .asciiz "OK"

          .text
          .globl main
          .ent main

main:     addi $t1,$0,'\n'
          addi $t7,$sp,-4 #salvo il valore dello stack pointer all'inizio

ciclo1:   li $v0,12
          syscall
          beq $v0,$t1,ciclo2
          addi $sp,$sp,-4
          sw $v0,($sp)
          j ciclo1


ciclo2:   lw $t1,($sp)
          lw $t2,($t7)
          addi $sp,$sp,4
          addi $t7,$t7,-4
          bne $t2,$t1,error
          beq $sp,$t7,ok
          addi $t1,$t7,4
          beq $sp,$t1,ok
          j ciclo2

error:    la $a0,message_err
          li $v0,4
          syscall
          j exit

ok:       la $a0,message_ok
          li $v0,4
          syscall
          j exit

exit:     li $v0,10
          syscall
          .end main
