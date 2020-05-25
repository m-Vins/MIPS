.data
DIM= 5
mat:        .word 1,4,5,6,7,4,2,8,6,4,5,8,3,2,9,6,6,2,4,4,7,4,9,4,5

            .text
            .globl main
            .ent main
main:
            lw $t1,mat
            li $t0,0 #contatore righe
            
loop:       bne $t1,$0,error




      
