	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Load the values for x, y, n into registers $t0, $t1, $t2
	li $t0, 3
	li $t1, 2
	li $t2, 1
	
# Calculate x^2
	mul $t0, $t0, $t0 	# $t0 * $t0 is put into $t0
	
# Calculate y^2
	mul $t1, $t1, $t1	# $t1 * $t1 is put into $t1
	
# Calculate n * (y^2)
	mul $t3, $t2, $t1	# $t2 * $t1 is put into $t3
	
# Calculate (x^2) - (n * y^2)
	sub $t4, $t0, $t3	# $t0 - $t3 is put into $t4
	
# Prints "x^2 - n * y^2 = "
	la $a0, msg		
	li $v0, 4		
	syscall
	
# Prints the output of the operation ($t4)
	move $a0, $t4		
	li $v0, 1		
	syscall			
	
# Exit program
	li $v0, 10
	syscall


	.data	# Informs the assembler that data needed within instructions follow
msg:	
	.asciiz "x^2 - n * y^2 = "		
