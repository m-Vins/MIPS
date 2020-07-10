
.data
ora_in:   .byte 12, 47
ora_out:  .byte 18, 14
X:        .byte 1
Y:        .byte 40

          .text
          .globl main
          .ent main

main:     sub $sp, 4
          sw $ra, ($sp)
          la $a0, ora_in # indirizzo di ora_in
          la $a1, ora_out # indirizzo di ora_out
          lbu $a2, X
          lbu $a3, Y
          jal costoParcheggio
          lw $ra, ($sp)
          jr $ra
          .end main


          .ent costoParcheggio
costoParcheggio:
          lb $t0,($a0) #ora inizio
          lb $t1,1($a0) #minuti inizio
          lb $t2,($a1) #ora inizio
          lb $t3,1($a1) #minuti inizio
          li $t4,60
          mul $t0,$t0,$t4
          mul $t2,$t2,$t4
          add $t0,$t0,$t1
          add $t2,$t2,$t3
          sub $t0,$t2,$t0
          div $t0,$a3
          mflo $v0
          mfhi $t0
          beq $t0,$0,ok
          addi $v0,$v0,1
ok:       mul $v0,$v0,$a2
          jr $ra
          .end costoparcheggio
