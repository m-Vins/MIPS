.data
message_ok:       .asciiz "l'equazione ha soluzioni reali"
message_notok:    .asciiz "l'equazione non ha soluzioni reali"
vara:             .asciiz "inserire variabile a: "
varb:             .asciiz "inserire variabile b: "
varc:             .asciiz "inserire variabile c: "
var:              .word 0x80000000
                  .text
                  .globl main
                  .ent main

main:             la $a0,vara
                  li $v0,4
                  syscall
                  li $v0,5
                  syscall
                  add $t0,$v0,$0

                  la $a0,varb
                  li $v0,4
                  syscall
                  li $v0,5
                  syscall
                  add $t1,$v0,$0

                  la $a0,varc
                  li $v0,4
                  syscall
                  li $v0,5
                  syscall
                  add $t2,$v0,$0


                  mul $t1,$t1,$t1
                  mul $t0,$t0,$t2
                  addi $t2,$0,4
                  mul $t0,$t0,$t2
                  sub $t0,$t1,$t0
                  lw $t5,var
                  and $t0,$t0,$t5
                  bne $t0,$0,nosol

                  la $a0,message_ok
                  li $v0,4
                  syscall
                  j exit

nosol:
                  la $a0,message_notok
                  li $v0,4
                  syscall
exit:
                  li $v0,10
                  syscall
                  .end main
