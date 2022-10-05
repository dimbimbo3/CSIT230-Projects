	.text			# Informs the assembler that instructions follow
	.globl main		# Declare as global the label main

main:
	li $s0,1		# $s0 = 1
	li $s1,2		# $s1 = 2
	li $s2,3		# $s2 = 3
	li $s3,4		# $s3 = 4
	li $s4,5		# $s4 = 5
	li $s5,6		# $s5 = 6
	li $s6,7		# $s6 = 7
	li $s7,8		# $s7 = 8
	li $t1,9		# $t1 = 9
	add $t0,$t0,$s0		# $t0 = $t0 + $s0
	add $t0,$t0,$s1		# $t0 = $t0 + $s1
	add $t0,$t0,$s2		# $t0 = $t0 + $s2
	add $t0,$t0,$s3		# $t0 = $t0 + $s3
	add $t0,$t0,$s4		# $t0 = $t0 + $s4
	add $t0,$t0,$s5		# $t0 = $t0 + $s5
	add $t0,$t0,$s6		# $t0 = $t0 + $s6
	add $t0,$t0,$s7		# $t0 = $t0 + $s7
	add $t0,$t0,$t1		# $t0 = $t0 + $t1
	
	li $v0,10		# System call for exit (load code 10)
	syscall			# Call operating system to perform operation (exit)
