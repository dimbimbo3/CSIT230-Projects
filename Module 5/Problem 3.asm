	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
	li $t6,1		# 1 is loaded into $t6
	addi $t5,$t6,2		# $t6 + 2 is put into $t5
	addi $t4,$t5,3		# $t5 + 3 is put into $t4
	addi $t3,$t4,4		# $t4 + 4 is put into $t3
	addi $t2,$t3,5		# $t3 + 5 is put into $t2
	addi $t1,$t2,6		# $t2 + 6 is put into $t1
	
	li $v0,10	# System call for exit (load code 10)
	syscall		# Call operating system to perform operation (exit)
