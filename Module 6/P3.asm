	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Load the values for x, y, n into registers $t0, $t1, $t2
	li $t1, 3
	li $t3, 2
	li $t5, 1
	
# Calculate x^3
	mul $t2, $t1, $t1 	# $t1 * $t1 is put into $t2
	mul $t2, $t2, $t1	# $t2 * $t1 is put into $t2
	
# Calculate y^3
	mul $t4, $t3, $t3	# $t3 * $t3 is put into $t4
	mul $t4, $t4, $t3	# $t4 * $t3 is put into $t4
	
# Calculate z^3
	mul $t6, $t5, $t5	# $t5 * $t5 is put into $t6
	mul $t6, $t6, $t5	# $t6 * $t5 is put into $t6
	
# Calculate (x^3) + (y^3)
	add $t7, $t2, $t4	# $t2 + $t4 is put into $t7

# Calculate ((x^3) + (y^3)) + (z^3)
	add $t0, $t7, $t6	# $t7 + $t6 is put into $t0

# Exit program
	li $v0, 10
	syscall