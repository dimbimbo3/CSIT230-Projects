	.text		# Informs the assembler that instructions follow
	.globl main	# Declare as global the label main
main:
# Load vector_x memory location into register $s1
	la $s1, vector_x
	
# Load the vector_x values from memory into registers $s2-$s5
	lw $s2, 0($s1)		# $s2 = 1 (vector_x(row 1))
	lw $s3, 4($s1)		# $s3 = 3 (vector_x(row 2))
	lw $s4, 8($s1)		# $s4 = 1 (vector_x(row 3))
	lw $s5, 12($s1)		# $s5 = 2 (vector_x(row 4))
	
# Load 0 to register $t9 (vector_y offset counter)
	li $t9, 0
	
# Load and perform operations for matrix_h(row 1)
	la $s0, matrix_h_r1
	jal loadMatrixRow
	jal multiplyMatrixVector
	jal storeVectorValue

# Load and perform operations for matrix_h(row 2)
	la $s0, matrix_h_r2
	jal loadMatrixRow
	jal multiplyMatrixVector
	jal storeVectorValue

# Load and perform operations for matrix_h(row 3)
	la $s0, matrix_h_r3
	jal loadMatrixRow
	jal multiplyMatrixVector
	jal storeVectorValue

# Load and perform operations for matrix_h(row 4)
	la $s0, matrix_h_r4
	jal loadMatrixRow
	jal multiplyMatrixVector
	jal storeVectorValue

# Load and perform operations for matrix_h(row 5)
	la $s0, matrix_h_r5
	jal loadMatrixRow
	jal multiplyMatrixVector
	jal storeVectorValue

# Load and perform operations for matrix_h(row 6)
	la $s0, matrix_h_r6
	jal loadMatrixRow
	jal multiplyMatrixVector
	jal storeVectorValue

# Print vector_y values
	jal getResult

# Exit program
	li $v0, 10
	syscall

loadMatrixRow:
# Load the matrix_h row values from memory into registers $t0-$t3
	lw $t0, 0($s0)		# $t0 = row(column 1)
	lw $t1, 4($s0)		# $t1 = row(column 2)
	lw $t2, 8($s0)		# $t2 = row(column 3)
	lw $t3, 12($s0)		# $t3 = row(column 4)
	jr $ra
	
multiplyMatrixVector:
# Multiply the values in the columns of the matrix_h row by the values of the vector_x rows
	mul $t4, $t0, $s2	# row(column 1) * vector_x(row 1)
	mul $t5, $t1, $s3	# row(column 2) * vector_x(row 2)
	mul $t6, $t2, $s4	# row(column 3) * vector_x(row 3)
	mul $t7, $t3, $s5	# row(column 4) * vector_x(row 4)
	
# Calculate the sum of the multiplied values
	add $t8, $t4, $t5
	add $t8, $t8, $t6
	add $t8, $t8, $t7
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

	la $a0, newline		# prints newline character to console
	li $v0, 4
	syscall
	
	lw $a0, vector_y+12	
	li $v0, 1		
	syscall	

	la $a0, newline		# prints newline character to console
	li $v0, 4
	syscall
	
	lw $a0, vector_y+16	
	li $v0, 1		
	syscall
	
	la $a0, newline		# prints newline character to console
	li $v0, 4
	syscall
	
	lw $a0, vector_y+20
	li $v0, 1		
	syscall
	jr $ra
	
	.data	# Informs the assembler that data needed within instructions follow
matrix_h_r1: 
	.word 1,0,0,0		# Allocate 4-words (0-12)
matrix_h_r2:
	.word -2,1,0,0		# Allocate 4-words (0-12)
matrix_h_r3:
	.word 1,-2,1,0		# Allocate 4-words (0-12)
matrix_h_r4:
	.word 0,1,-2,1		# Allocate 4-words (0-12)
matrix_h_r5:
	.word 0,0,1,-2		# Allocate 4-words (0-12)
matrix_h_r6:
	.word 0,0,0,1		# Allocate 4-words (0-12)
vector_x: 
	.word 1,3,1,2		# Allocate 4-words (0-12)
vector_y:
	.space 24		# Reserve in memory 24-bytes (6-32 bit words)
newline:
	.asciiz "\n"
