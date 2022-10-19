.data
vetor: 4, 3, 6
.text
.globl main
main:

	li $a0, 3 
	la $a1, vetor 
	
	jal insertionSort 
end:
	li $v0, 10
	syscall
	
insertionSort:
	addi $sp, $sp, -40 
	sw $ra, 36($sp) 
	sw $a0, 32($sp)
	sw $a1, 28($sp)
	sw $t0, 24($sp)
	sw $t1, 20($sp)
	sw $t2, 16($sp)
	sw $t3, 12($sp)
	sw $t4, 8($sp)
	sw $t5, 4($sp)
	sw $t6, 0($sp)
	
	move $t0, $zero 
	
	for:
		add $t1, $t0, $zero 
		
		while:
			slt $t2, $t1, $zero 
			beq $t2, 1, end_while 
			beq $t1, $zero, end_while
			
			mul $t2, $t1, 4 
			add $t2, $t2, $a1 
			lw $t3, 0($t2) 
			
			subi $t4, $t1, 1 
			mul $t4, $t4, 4 
			add $t4, $t4, $a1 
			lw $t5, 0($t4) 
			
			slt $t6, $t3, $t5 
			beq $t6, 0, end_while 
			
			sw $t5, 0($t2) 
			sw $t3, 0($t4) 
			
			sub $t1, $t1, 1 
			
			j while
			
		end_while:
			addi $t0, $t0, 1 
			slt $t2, $t0, $a0 
			beq $t2, 1, for
			
		lw $t6, 0($sp) 
		lw $t5, 4($sp)
		lw $t4, 8($sp)
		lw $t3, 12($sp)
		lw $t2, 16($sp)
		lw $t1, 20($sp)
		lw $t0, 24($sp)
		lw $a1, 28($sp)
		lw $a0, 32($sp)
		lw $ra, 36($sp)
		addi $sp, $sp, 40 
		
		jr $ra
