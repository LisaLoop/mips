# exercise-2.asm
#
# Lisa Lehrman
# March 12, 2022
# CS21 Assignment 3
# Exercise 2 - More counting
 
# Register usage:
# t0 = total sum
# t1 = odd values sum
# t2 = even values sum 
# t3 = counter 
# t4 = end range
# t5 = mask
# t6 = temporary 

.text 
.globl main

main:
        ori     $t0,    $zero,  0       # total sum
        ori     $t1,    $zero,  0       # odd values sum
        ori     $t2,    $zero,  0       # even values sum
        ori     $t3,    $zero,  1       # counter
        ori     $t4,    $zero,  101     # end sequence
        ori     $t5,    $zero,  1       # mask to check for even/odd
loop:
                add     $t0,    $t3,    $t0     # total sum + counter

                and     $t6,    $t5,    $t3     # counter even or odd?
                bgtz    $t6     odd             # if >0 odd number  
                        add     $t2,    $t2,    $t3     # add counter to even
                        j       continueloop    
        odd:
                add     $t1,    $t3,    $t1     # add counter to odd

        continueloop:
                addi    $t3,    $t3,    1       # increment counter
blt     $t3,     $t4,   loop    # condition (counter < endOfRange)

        
        li      $v0,    10               # stop the program
	syscall