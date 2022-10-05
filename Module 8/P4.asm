	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Load vector_x memory location into register $s1
	la $s1, vector_x
	
# Load the vector_x values from memory into registers $s2-$s4
	lw $s2, 0($s1)		# $s2 = 1 (vector_x(row 1))
	lw $s3, 4($s1)		# $s3 = 3 (vector_x(row 2))
	lw $s4, 8($s1)		# $s4 = 1 (vector_x(row 3))
	
# Load 0 to register $t9 (vector_y offset counter)
	li $t9, 0
	
# Load and perform operations for matrix_a(row 1)
	la $s0, matrix_a_r1
	jal loadMatrixRow
	jal multiplyMatrixVector
	jal storeVectorValue

# Load and perform operations for matrix_a(row 2)
	la $s0, matrix_a_r2
	jal loadMatrixRow
	jal multiplyMatrixVector
	jal storeVectorValue

# Load and perform operations for matrix_a(row 3)
	la $s0, matrix_a_r3
	jal loadMatrixRow
	jal multiplyMatrixVector
	jal storeVectorValue

# Print vector_y values
	jal getResult

# Exit program
	li $v0, 10
	syscall

loadMatrixRow:
# Load the matrix_a row values from memory into registers $t0-$t2
	lw $t0, 0($s0)		# $t0 = row(column 1)
	lw $t1, 4($s0)		# $t1 = row(column 2)
	lw $t2, 8($s0)		# $t2 = row(column 3)
	jr $ra
	
multiplyMatrixVector:
# Multiply the values in the columns of the matrix_a row by the values of the vector_x rows
	mul $t4, $t0, $s2	# row(column 1) * vector_x(row 1)
	mul $t5, $t1, $s3	# row(column 2) * vector_x(row 2)
	mul $t6, $t2, $s4	# row(column 3) * vector_x(row 3)
	
# Calculate the sum of the multiplied values
	add $t8, $t4, $t5
	add $t8, $t8, $t6
	jr $ra

storeVectorValue:
# Stores the value for the next vector_y row in memory
	sw $t8, vector_y($t9)
	
# Increments the vector_y offset counter by 4
	addi $t9, $t9, 4
	jr $ra

getResult:
# Print all vector_y values to the console
	lw $a0, vector_y
	li $v0, 1		
	syscall
	
	la $a0, newline		# prints newline character to console
	li $v0, 4
	syscall
	
	lw $a0, vector_y+4	
	li $v0, 1		
	syscall
	
	la $a0, newline		# prints newline character to console
	li $v0, 4
	syscall
	
	lw $a0, vector_y+8	
	li $v0, 1		
	syscall
	jr $ra
	
	.data	# Informs the assembler that data needed within instructions follow
matrix_a_r1: 
	.word 5,3,4		# Allocate 3-words (0-8)
matrix_a_r2:
	.word 1,5,3		# Allocate 3-words (0-8)
matrix_a_r3:
	.word 2,1,5		# Allocate 3-words (0-8)
vector_x: 
	.word 1,2,3		# Allocate 3-words (0-8)
vector_y:
	.space 12		# Reserve in memory 12-bytes (3-32 bit words)
newline:
	.asciiz "\n"
