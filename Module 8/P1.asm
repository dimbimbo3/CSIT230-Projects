	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Specify memory location loaded into register $s0
	la $s0, 0xFFFF0010

# Load immediate integers 1 to 3 into registers $t1 to $t3
	li $t1, 1
	li $t2, 2
	li $t3, 3
	
# Store integers 1 to 3 into memory (offset for integers is 4-bytes)
	sw $t1, 0($s0)		# Store word $t1 into memory location of $s0
	sw $t2, 4($s0)		# Store word $t2 into memory location of $s0+4
	sw $t3, 8($s0)		# Store word $t3 into memory location of $s0+8

# Load integers 1 to 3 from memory into registers $t4 to $t6
	lw $t4, 0($s0)		# Load word from memory location of $s0 into $t4
	lw $t5, 4($s0)		# Load word from memory location of $s0+4 into $t5
	lw $t6, 8($s0)		# Load word from memory location of $s0+8 into $t6
	
# Put the sum of the integers 1 to 3 into register $t7
	add $t7, $t4, $t5
	add $t7, $t7, $t6

# Store the sum into memory
	sw $t7, 12($s0)
	
# Load the sum from memory into register $t8
	lw $t8, 12($s0)

# Exit program
	li $v0, 10
	syscall
