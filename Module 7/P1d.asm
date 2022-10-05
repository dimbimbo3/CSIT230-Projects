	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Initializes values
	li $t0, 1 	# loopA counter = 1
	li $t1, 1 	# loopB counter = 1
	li $t2, 1	# loopC counter = 1
	li $t3, 1	# loopD counter = 1
	li $s0, 0 	# total
loopA:
# Resets the loopB counter (loops 2 times)
	beq $t0, 3, endA	# Branches to the label endA when loopA counter = 3
	li $t1, 1		# Resets loopB counter
loopB:
# Resets the loopC counter (loops 2 times)
	beq $t1, 3, endB	# Branches to the label endB when loopB counter = 3
	li $t2, 1		# Resets loopC counter
loopC:
# Resets the values of 2^a, 2^b, and loopD counter (loops 2 times)
	beq $t2, 3, endC	# Branches to the label endB when loopC counter = 3
	li $t3, 1		# Resets loopD counter
	li $t4, 1		# Resets 2^a
	li $t5, 1		# Resets 2^b
	li $t6, 1		# Resets 2^c
	li $t7, 1		# Resets 2^d
loopD:
# Computes the quadruple summation (loops 2 times)
	beq $t3, 3, endD	# Branches to the label endD when loopD counter = 3
	mul $t4, $t4, 2 	# Computes next power of 2^a
	add $s0, $s0, $t4 	# Adds next power of 2^a to total
	mul $t5, $t5, 2 	# Computes next power of 2^b
	add $s0, $s0, $t5 	# Adds next power of 2^b to total
	mul $t6, $t6, 2 	# Computes next power of 2^c
	add $s0, $s0, $t6 	# Adds next power of 2^c to total
	mul $t7, $t7, 2 	# Computes next power of 2^d
	add $s0, $s0, $t7 	# Adds next power of 2^d to total
	addi $t3, $t3, 1 	# Increments loopD counter
	j loopD			# Jumps to the label loopD
endD:
# Increments loopC counter and jumps to label loopC (Executes after loopD finishes)
	addi $t2, $t2, 1
	j loopC
endC:
# Increments loopB counter and jumps to label loopB (Executes after loopC finishes)
	addi $t1, $t1, 1
	j loopB
endB:
# Increments loopA counter and jumps to label loopA (Executes after loopB finishes)
	addi $t0, $t0, 1
	j loopA
endA:
# (Executes after loopA finishes)
# Prints "Total = "
	la $a0, msg		
	li $v0, 4
	syscall	
# Prints the output of the operation ($s0)
	move $a0, $s0
	li $v0, 1
	syscall
# Exit program
	li $v0, 10
	syscall

	.data	# Informs the assembler that data needed within instructions follow
msg:	
	.asciiz "Total = "	

