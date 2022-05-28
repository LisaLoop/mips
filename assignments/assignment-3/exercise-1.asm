# exercise-1.asm
#
# Lisa Lehrman
# March 12, 2022
# CS21 Assignment 3
# Exercise 1 - A counting loop
 
# Register usage:
# t0 = sum
# t1 = counter (start) 
# t2 = end (of range)

.text 
.globl main

main:
        ori     $t0,    $zero,  0       # sum
        ori     $t1,    $zero,  1       # counter
        ori     $t2,    $zero,  101     # end sequence
loop:
        add     $t0,    $t1,    $t0     # counter + sum
        addi     $t1,    $t1,    1      # increment counter
        blt     $t1,     $t2,     loop  # condition (counter < endOfRange)
        
        li      $v0,    10               # stop the program
	syscall




        
