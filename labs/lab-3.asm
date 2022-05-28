# lab-3
#
# Lisa Lehrman
# Feb 27, 2022
# CS21 Lab 3 part 2 


# 4x^3 + 2x^2 -5x + 3
# 3 -5x + 2x^2 + 4x^3 
# Register use
# t0 - base register
# t1 - x 
# t2 - coefficient
# t3 - accumulator 
# t4 - temp
# v0/a0 - to print
# 3 + x(-5 + x(2 + x(4))) <- Horner's method

	.data
result:	.asciiz	"Result is "
x:	.word	1
y:	.word	0
.text
.globl  main

main:
	lw	$t1, x	# load x to $t0
	lw	$t3, y	# load y to $t5
	

	ori     $t2,    $zero,  4
	mult    $t1,    $t2             # x(4)
	nop
	nop
	mflo    $t3                     # x(4)

	addiu   $t3,    $t3,    2       # 2 + x(4)
	mult    $t3,    $t1             # x(2 + x(4))
	nop
	nop
	mflo    $t3                     # x(2 + x(4))
	ori     $t2,    $zero,  5
	sub     $t3,    $t3,    $t2     # -5 + x(2 + x(4))
	mult    $t1,    $t3             # x(-5 + x(2 + x(4)))
	nop
	nop
	mflo    $t3                     # x(-5 + x(2 + x(4)))
	ori     $t2,    $zero,  3
	add     $t3,    $t2,    $t3    
	sw      $t3,    y               # store answer in y

	li      $v0,    4               # print string 
	la      $a0,    result                     
	syscall

	nop
	nop      
	li      $v0,    1               # print int 
	move	$a0,    $t3
	syscall