.data
DIM= 5
#mat:        .word 1,4,5,6,7,4,2,8,6,4,5,8,3,2,9,6,6,2,4,4,7,4,9,4,5
mat:         .word 1 , 0  , 0, 0, 0, 0, 2, 0, 0, 0, 0, 0 ,3 ,0 ,0 , 0 ,0 ,0 ,4 ,0 ,0 ,0 ,0 ,0 ,5
message_nodiag:  .asciiz "la matrice non è diagonale"
message_diag:    .asciiz "la matrice è diagonale"
message_simm:    .asciiz "la matrice è simmetrica"
message_nosimm:  .asciiz "la matrice non è simmetrica"
            .text
            .globl main
            .ent main
main:
            la $t1,mat
            li $t0,0 #contatore diagonale
            li $t2,0 #contatore pos
            li $t4,DIM
            mul $t4,$t4,$t4 #fine

loop:       lw $t5,($t1)
            beq $t2,$t4,diag
            beq $t0,$t2,diag_jump
            bne $t5,$0,nodiag
            addi $t2,$t2,1
            addi $t1,$t1,4
            j loop


diag_jump:  addi $t0,$t0,1
            addi $t0,$t0,DIM
            addi $t2,$t2,1
            addi $t1,$t1,4
            j loop

nodiag:     la $a0,message_nodiag
            li $v0,4
            syscall
            j exit

diag:       la $a0,message_diag
            li $v0,4
            syscall

            #se diagonale controllo che sia simmetrica

            la $t0,mat
            li $t1,0 #contatore
            li $t8,DIM
            li $t6,4 #byte per word

loop2:      div $t1,$t8
            mfhi $t2
            mflo $t3
            mul $t2,$t2,$t6
            add $t2,$t2,$t3
            mul $t2,$t2,$t6
            mul $t7,$t1,$t6
            lw $t6,($t2)
            lw $t7,($t7)
            bne $t6,$t7,nosimm
            addi $t1,$t1,1
            bne $t1,$t4,loop2

            la $a0,message_simm
            li $v0,4
            syscall
            j exit

nosimm:     la $a0,message_nosimm
            li $v0,4
            syscall


exit:       li $v0,10
            syscall
            .end main
