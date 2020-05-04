#Date tre variabili word inizializzate in
#memoria, si scriva un programma che le
#stampi a video in ordine crescente

.data
op1:      .word 11
op2:      .word 165
op3:      .word -20


          .text
          .globl main
          .ent main

main:
          lw $t0,op1
          lw $t1,op2
          lw $t2,op3

          blt $t0, $t1, first
          move $t3, $t0
          move $t0, $t1
          move $t1, $t3
first:    blt $t0, $t2, second
          move $t3, $t0
          move $t0, $t2
          move $t2, $t3
second:   blt $t1, $t2, third
          move $t3, $t1
          move $t1, $t2
          move $t2, $t3
third:
          move $a0, $t0
          li $v0, 1
          syscall
          li $a0, '\n'
          li $v0, 11
          syscall
          move $a0, $t1
          li $v0, 1
          syscall
          li $a0, '\n'
          li $v0, 11
          syscall
          move $a0, $t2
          li $v0, 1
          syscall
          li $a0, '\n'
          li $v0, 11
          syscall
          li $v0, 10
          syscall
          .end main



#inutile
#swap: add $a3,$a1,$0
#      add $a1,$a2,$0
#      add $a2,$a3,$0
#      jr $ra
