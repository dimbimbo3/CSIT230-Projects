	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Initializes values
	li $t0, 1 	# loopA counter = 1
	li $t1, 1 	# loopB counter = 1
	li $s0, 0 	# total
loopA:
# Resets the values of 2^a, 2^b, and loopB counter (loops 2 times)
	beq $t0, 3, endA	# Branches to the label endA when loopA counter = 3
	li $t1, 1		# Resets loopB counter
	li $t2, 1		# Resets 2^a
	li $t3, 1		# Resets 2^b
loopB:
# Computes the double summation (loops 2 times)
	beq $t1, 3, endB	# Branches to the label endB when loopB counter = 3
	mul $t2, $t2, 2 	# Computes next power of 2^a
	add $s0, $s0, $t2 	# Adds next power of 2^a to total
	mul $t3, $t3, 2 	# Computes next power of 2^b
	add $s0, $s0, $t3 	# Adds next power of 2^b to total
	addi $t1, $t1, 1 	# Increments loopB counter
	j loopB 		# Jumps to the label loopB
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
