                .ent procedura

                procedura:      li $t0,2
                div $a0,$t0
                mfhi $t0
                bne $t0,$0,disp
                li $t0,2
                div $v0,$a0,$t0
                jr $ra

                disp:           li $t0,3
                mul $v0,$a0,$t0
                addi $v0,$v0,1
                jr $ra


                .end procedura
