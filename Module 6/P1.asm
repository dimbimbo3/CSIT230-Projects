	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Prints "Please enter the first number:"
	la $a0, msg1		
	li $v0, 4		
	syscall	

# Reads in the integer from the command line and moves it to register $t0
	li $v0, 5		
	syscall			
	move $t0, $v0		
	
# Prints "Please enter the second number:"
	la $a0, msg2		
	li $v0, 4		
	syscall	

# Reads in the integer from the command line and moves it to register $t1
	li $v0, 5		
	syscall			
	move $t1, $v0		

# Prints "Please enter the third number:"
	la $a0, msg3		
	li $v0, 4		
	syscall	

# Reads in the integer from the command line and moves it to register $t2	
	li $v0, 5		
	syscall			
	move $t2, $v0

# Calculate the sum of the three numbers and puts it in $t0
	add $t0, $t0, $t1	
	add $t0, $t0, $t2	
	
# Print "Sum of the three numbers="
	la $a0, msg4		
	li $v0, 4		
	syscall	

# Prints the output of the operation ($t0)		
	move $a0, $t0		
	li $v0, 1		
	syscall			
	
# Exit program
	li $v0,10		
	syscall			


	.data	# Informs the assembler that data needed within instructions follow
msg1:	
	.asciiz "Please enter the first number:"
msg2:	
	.asciiz "Please enter the second number:"
msg3:	
	.asciiz "Please enter the third number:"
msg4:	
	.asciiz "Sum of the three numbers = "
