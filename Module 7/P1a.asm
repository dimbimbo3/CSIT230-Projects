	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Initializes values
	li $t0, 1 	# loop counter = 1
	li $t1, 1 	# 2^a
	li $s0, 0 	# total
loop:
# Computes the summation (loops 2 times)
	beq $t0, 3, end		# Branches to the label end when loop counter = 3
	mul $t1, $t1, 2 	# Computes next power of 2^a
	add $s0, $s0, $t1 	# Adds next power of 2^a to total
	addi $t0, $t0, 1 	# Increments loop counter
	j loop 			# Jumps to the label loop
end:
# (Executes after loop finishes)
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
