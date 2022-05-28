# exercise-3.asm
#
# Lisa Lehrman
# March 12, 2022
# CS21 Assignment 3
# Exercise 3 - Fibonacci
 
# Register usage:
# $t0 - previous term (n)
# $t1 - current term (n + 1)
# $t2 - counter 
# $t3 - end of range (98)
# $t4 - temporary 

.text 
.globl main

main:
        ori     $t1,    $zero,  1       # 1 in current 
        ori     $t0,    $zero,  1       # 1 in previous
        ori     $t2,    $zero,  0       # init counter
        ori     $t3,    $zero,  98      # init end of range 

loop:
        add     $t4,    $t0,    $t1     # compute new current term
        move    $t0,    $t1             # move current to previous
        move    $t1,    $t4             # new current from temp 

        addi    $t2,    $t2,    1       # increment counter
        blt     $t2,    $t3,    loop    # condition

        li      $v0,    10              # stop the program
	syscall



