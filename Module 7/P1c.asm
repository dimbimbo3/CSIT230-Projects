	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Initializes values
	li $t0, 1 	# loopA counter = 1
	li $t1, 1 	# loopB counter = 1
	li $t2, 1	# loopC counter = 1
	li $s0, 0 	# total
loopA:
# Resets the loopB counter (loops 2 times)
	beq $t0, 3, endA	# Branches to the label endA when loopA counter = 3
	li $t1, 1		# Resets loopB counter
loopB:
# Resets the values of 2^a, 2^b, and loopC counter (loops 2 times)
	beq $t1, 3, endB	# Branches to the label endB when loopA counter = 3
	li $t2, 1		# Resets loopC counter
	li $t3, 1		# Resets 2^a
	li $t4, 1		# Resets 2^b
	li $t5, 1		# Resets 2^c
loopC:
# Computes the triple summation (loops 2 times)
	beq $t2, 3, endC	# Branches to the label endC when loopC counter = 3
	mul $t3, $t3, 2 	# Computes next power of 2^a
	add $s0, $s0, $t3 	# Adds next power of 2^a to total
	mul $t4, $t4, 2 	# Computes next power of 2^b
	add $s0, $s0, $t4 	# Adds next power of 2^b to total
	mul $t5, $t5, 2 	# Computes next power of 2^c
	add $s0, $s0, $t5 	# Adds next power of 2^c to total
	addi $t2, $t2, 1 	# Increments loopC counter
	j loopC 		# Jumps to the label loopC
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
