	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Load the matrix values into registers $t1 to $t9
	li $t1, 4	# a
	li $t2, 1	# b
	li $t3, 2	# c
	li $t4, 1	# d
	li $t5, 0	# e
	li $t6, 3	# f
	li $t7, 2	# g
	li $t8, 3	# h
	li $t9, 5	# i
	
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

# Exit program
	li $v0, 10
	syscall
