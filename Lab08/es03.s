NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 1
                        .data
prezzi:                 .word 39, 1880, 2394, 1000, 1590
scontati:               .space DIM
totSconto:              .space 4
                        .text
                        .globl main
                        .ent main
main:                   subu $sp, $sp, 4
                        sw $ra, ($sp)
                        la $a0, prezzi
                        la $a1, scontati
                        li $a2, NUM
                        li $a3, SCONTO
                        li $t0, ARROTONDA
                        subu $sp, 4
                        sw $t0, ($sp)
                        jal calcola_sconto
                        sw $v0, totSconto
                        lw $ra, 4($sp)
                        addu $sp, $sp, 8
                        jr $ra
                        .end main


                        .ent calcola_sconto
calcola_sconto:
                        li $t0,100
                        sub $a3,$t0,$a3
                        li $t1,0 #contatore
                        lw $t2, ($sp) #arrotonda
                        li $v0,0
ciclo:                  mul $t3,$t1,4
                        add $t3,$t3,$a0
                        lw $t6,($t3)
                        mul $t3,$t6,$a3
                        div $t3,$t0
                        mflo $t5
                        beqz $t2,noarrotonda
                        mfhi $t4
                        blt $t4,50,noarrotonda
                        addi $t5,$t5,1
noarrotonda:            mul $t3,$t1,4
                        add $t3,$t3,$a1
                        sw $t5,($t3)
                        sub $t6,$t6,$t5
                        add $v0,$v0,$t6
                        addi $t1,$t1,1
                        bne $t1,$a2,ciclo
                        jr $ra
                        .end calcola_sconto
