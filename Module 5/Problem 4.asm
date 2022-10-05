	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
	li $t0,1		# 1 is loaded into $t0
	addi $t0,$t0,2		# $t0 + 2 is put into $t0
	addi $t0,$t0,3		# $t0 + 3 is put into $t0
	addi $t0,$t0,4		# $t0 + 4 is put into $t0
	addi $t0,$t0,5		# $t0 + 5 is put into $t0
	addi $t0,$t0,6		# $t0 + 6 is put into $t0
	
	li $v0,10	# System call for exit (load code 10)
	syscall		# Call operating system to perform operation (exit)
