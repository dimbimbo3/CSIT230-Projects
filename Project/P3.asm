	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Initializes values
	li $s0, 6 	# constant of 6
	li $t0, 0 	# loop counter (x) = 0
loop:
# Computes the summation (loops 2 times)
	bgt $t0, 7, end		# Branches to the label end when loop counter > 7
	mul $t1, $t0, $t0 	# Computes next power of x^2
	mul $t2, $s0, $t1 	# Multiply 6 by the next x^2
	mul $t3, $s0, $t0 	# Multiply 6 by the next x
	sub $t4, $t2, $t3 	# Subtract 6x^2 by 6x
	addi $t5, $t4, 1	# Add 1 to the total of 6x^2 - 6x
	jal getResult
	addi $t0, $t0, 1 	# Increments loop counter
	j loop 			# Jumps to the label loop

getResult:
# Prints "The total of (6x^2 - 6x + 1) when "
	la $a0, msg1		
	li $v0, 4
	syscall
# Prints "x is  "
	la $a0, msg2		
	li $v0, 4
	syscall	
# Prints the current value of x
	move $a0, $t0
	li $v0, 1
	syscall
# Prints " = "
	la $a0, msg3	
	li $v0, 4
	syscall
# Prints the output of the operation ($t5)
	move $a0, $t5
	li $v0, 1
	syscall
# Prints newline character
	la $a0, newline
	li $v0, 4
	syscall	
	
	jr $ra
end:
# (Executes after loop finishes)
# Exit program
	li $v0, 10
	syscall


	.data	# Informs the assembler that data needed within instructions follow
msg1:	
	.asciiz "The total of (6x^2 - 6x + 1) when "
msg2:	
	.asciiz "x is "
msg3:
	.asciiz " = "
newline:
	.asciiz "\n"
