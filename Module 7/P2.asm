	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Initializes values
	li $t0, 2 	# loopA counter = 2 (a)
	li $t1, 1 	# loopB counter = 1 (b)
	li $s0, 0 	# total
loopA:
# Resets the loopB counter (loops 2 times)
	beq $t0, 5, endA	# Branches to the label endA when loopA counter = 5
	li $t1, 1		# Resets loopB counter
loopB:
# Computes the double summation (loops 2 times)
	beq $t1, 4, endB	# Branches to the label endB when loopB counter = 4
	add $s0, $s0, $t0 	# Adds next a to total
	add $s0, $s0, $t1 	# Adds next b to total
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
