	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Load the matrix_X memory location into register $s7
	la $s7, matrix_X

# Load the matrix values from memory into registers $t1 to $t9
	lw $t1, 0($s7)	# a
	lw $t2, 4($s7)	# b
	lw $t3, 8($s7)	# c
	lw $t4, 12($s7)	# d
	lw $t5, 16($s7)	# e
	lw $t6, 20($s7)	# f
	lw $t7, 24($s7)	# g
	lw $t8, 28($s7)	# h
	lw $t9, 32($s7)	# i
	
# Calculate a * e * i
	mul $t0, $t1, $t5 	# $t1 * $t5 is put in $t0
	mul $s0, $t0, $t9	# $t0 * $t9 is put in $s0
	
# Calculate b * f * g
	mul $t0, $t2, $t6	# $t2 * $t6 is put in $t0
	mul $s1, $t0, $t7	# $t0 * $t7 is put in $s1
	
# Calculate c * d * h
	mul $t0, $t3, $t4	# $t3 * $t4 is put in $t0
	mul $s2, $t0, $t8	# $t0 * $t8 is put in $s2

# Calculate c * e * g
	mul $t0, $t3, $t5	# $t3 * $t5 is put in $t0
	mul $s3, $t0, $t7	# $t0 * $t8 is put in $s3
	
# Calculate b * d * i
	mul $t0, $t2, $t4	# $t2 * $t4 is put in $t0
	mul $s4, $t0, $t9	# $t0 * $t9 is put in $s4
	
# Calculate a * f * h
	mul $t0, $t1, $t6	# $t1 * $t6 is put in $t0
	mul $s5, $t0, $t8	# $t0 * $t8 is put in $s5
	
# Calculate (aei) + (bfg)
	add $t0, $s0, $s1	# $s0 + $s1 is put in $t0

# Calculate ((aei) + (bfg)) + (cdh)
	add $t0, $t0, $s2	# $t0 + $s2 is put in $t0
	
# Calculate ((aei) + (bfg) + (cdh)) - (ceg)
	sub $t0, $t0, $s3	# $t0 - $s3 is put in $t0

# Calculate ((aei) + (bfg) + (cdh) - (ceg)) - (bdi)
	sub $t0, $t0, $s4	# $t0 - $s4 is put in $t0

# Calculate ((aei) + (bfg) + (cdh) - (ceg) - (bdi)) - (afh)
	sub $t0, $t0, $s5	# $t0 - $s5 is put in $t0

# Print the output($t0)
	move $a0, $t0		
	li $v0, 1		
	syscall	

# Exit program
	li $v0, 10
	syscall
	
	.data	# Informs the assembler that data needed within instructions follow
matrix_X: 
	.word 8,1,6,  3,5,7,  4,9,2	# Allocate 9-words (0-32)

