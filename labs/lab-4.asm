# lab-4.asm
#
# March 20,2022
# Lisa Lehrman
# Register usage: 
# t0 = a
# t1 = b
# 
#

.text
.globl  main

main:
       # j       example1entry
       # j       example2entry
       # j       example3entry
       # j       example4entry
       j        example5entry
mainExit: 
        ori     $v0,    $zero,  10              # set v0 to 10
        syscall

example1entry:
        ori     $t0,    $zero,  0               # save a to t0
        ori     $t1,    $zero,  0               # save b to t1
        ble     $t0,    $t1,   example1true     # branch if less than to label example1true      
        j       example1exit
example1true: 
        ori     $t1,    $zero,  10              # set b to 10
example1exit:
        j       mainExit

example2entry:
        ori     $t0,    $zero,  0
        ori     $t1,    $zero,  0
        blt     $t0,    $t1,    example2true    # branch if a < b
        ori     $t0,    $zero,  20              # else 
        j       example2exit
example2true:
        ori     $t1,    $zero,  10
example2exit:
        j       mainExit

example3entry:
        ori     $t0,    $zero,  0
        ori     $t1,    $zero,  0
example3condition:
        blt     $t0,    10      example3loop
        j       example3exit
example3loop:
        addu   $t1,    $t1,    $t0
        addi  $t0,     $t0,    1
        j       example3condition

example3exit:
        j       mainExit

example4entry:
        ori     $t0,    $zero,  0
        ori     $t1,    $zero,  0

example4loopbody:
        addu    $t1,    $t1,    $t0
        addi    $t0,    $t0,    1

example4condition: 
        blt     $t0,    10      example4loopbody
example4exit: 
        j       mainExit

example5entry:
        ori     $t1,    $zero,  0       # sets b to 0 
        ori     $t0,    $zero,  0       # sets a to 0
example5condition:
        blt     $t0,    10      example5loop
example5exit:
        j       mainExit
example5loop:
        addu    $t1,    $t1,    $t0     # b+=a
        addi    $t0,    $t0,    1       # a++
        j       example5condition