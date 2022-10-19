.data
dados: 4, 3, 6
.text
.globl main
main:
	# argumentos da função
	li $a0, 3 #definindo o tamanho do array
	la $a1, dados # definindo o endereço do primeiro elemento
    
  
	jal metodoBolha
end:
	li $v0, 10
	syscall
    
metodoBolha:

    addi $sp, $sp, -40 #guardando na pilha 10 valores
   
    
    sw $ra, 36 ($sp)
    sw $a0, 32 ($sp)
    sw $a1, 28 ($sp)
    sw $t0, 24 ($sp)
    sw $t1, 20 ($sp)
    sw $t2, 16 ($sp)
    sw $t3, 12 ($sp)
    sw $t4, 8 ($sp)
    sw $t5, 4 ($sp)
    sw $t6, 0 ($sp)
    
    li %t0, 1 # troca = 1
    
    while:
    	bne $to, 1, end_while  #condição do laço
        
        li $t0, 0
        
        move $t1, $zero #varivael para a contagem do for
        
        for:
            mul $t2, $t1, 4
            add $t2, $t2, $a1
            lw $t3, 0($t2)
            
            addi $t4, $t1, 1
            
            mul $t4, $t4,  4
            add $t4, $t4, $a1
            lw $t5, 0($t4)
            
            #criterio da troca
            slt $t6, $t3, $t5		
            beq $t6, 1, end_for  	
            beq $t3, $t5, end_for	
            
            #trocando
            li $t0, 1			
            sw $t5, 0($t2)		
            sw $t3, 0($t4) 		
            
            
            #final do for
            end_for:
            addi $t1, $t1, 1 	# incremetando i
            subi $t2, $a0, 1 	# $t2 recebe o tamanho do array - 1
            slt $t2, $t1, $t2	# se i < (tamanhoArray - 1), $t2 recebe 1
            beq $t2, 1, for 	# se $t2 igual a 1, então repita o loop
            
            #final do while
            j while
        end_while:
        
       	lw $t6, 0 ($sp)
        lw $t5, 4 ($sp)
        lw $t4, 8 ($sp)
        lw $t3, 12 ($sp)
        lw $t2, 16 ($sp)
        lw $t1, 20 ($sp)
        lw $t0, 24 ($sp)
        lw $a1, 28 ($sp)
        lw $a0, 32 ($sp)
        lw $ra, 36 ($sp)
        
        addi $sp, $sp, 40
        
        jr $ra
