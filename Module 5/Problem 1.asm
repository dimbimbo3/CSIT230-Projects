	.text			# Informs the assembler that instructions follow
	.globl main		# Declare as global the label main

main:
	li $t7,1		# $t7 = 1
	li $t6,2		# $t6 = 2
	li $t5,3		# $t5 = 3
	li $t4,4		# $t4 = 4
	add $t3,$t6,$t7		# $t3 = $t6 + $t7
	add $t2,$t4,$t5		# $t2 = $t4 + $t5
	add $t1,$t2,$t3		# $t1 = $t2 + $t3
	li $t3,5		# $t3 = 5
	li $t2,6		# $t2 = 6
	add $t0,$t2,$t3		# $t0 = $t1 + $t0
	add $t1,$t1,$t0		# $t1 = $t1 + $t0
	
	li $v0,10		# System call for exit (load code 10)
	syscall			# Call operating system to perform operation (exit)
