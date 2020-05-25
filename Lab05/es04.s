.data
DIM= 5
#mat:        .word 1,4,5,6,7,4,2,8,6,4,5,8,3,2,9,6,6,2,4,4,7,4,9,4,5
mat:         .word 1,0,0,0,0,0,2,0,0,0,0,0,3,0,0,0,0,0,4,0,0,0,0,0,5
message_nodiag  .asciiz "la matrice non è diagonale"
message_diag    .asciiz "la matrice è diagonale"

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

exit:       li $v0,10
            syscall
            .end main
