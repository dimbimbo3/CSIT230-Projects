	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Load the array memory locations into registers $s0 to $s2
	la $s0, array_A
	la $s1, array_B
	la $s2, array_C
	
# Load the array_A & array_B values from memory into registers $t0-$t1 & $t2-$t3
	lw $t0, 0($s0)		# $t0 = 2
	lw $t1, 4($s0)		# $t1 = 3
	lw $t2, 0($s1)		# $t2 = 4
	lw $t3, 4($s1)		# $t3 = 5
	
# Add the array_A & array_B values
	add $t4, $t0, $t2	# 2 + 4 = 6 is put into $t4
	add $t5, $t1, $t3	# 3 + 4 = 7 is put into $t5
	
# Resulting sums are stored in memory of array_C
	sw $t4, 0($s2)
	sw $t5, 4($s2)

# Print array_C values
	lw $a0, array_C	
	li $v0, 1		
	syscall
	
	la $a0, newline		# prints newline character to console
	li $v0, 4
	syscall
	
	lw $a0, array_C+4	
	li $v0, 1		
	syscall		

# Exit program
	li $v0, 10
	syscall
	
	.data	# Informs the assembler that data needed within instructions follow
array_A: 
	.word 2, 3	# Allocate 2-words (0 and 4)
array_B: 
	.word 4, 5	# Allocate 2-words (0 and 4)
array_C:
	.space 8	# Reserve in memory 8-bytes (2-32 bit words)
newline:
	.asciiz "\n"
