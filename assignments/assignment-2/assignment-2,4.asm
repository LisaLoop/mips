# assignment-2,4.asm
#
# Lisa Lehrman
# Feb 17, 2022
# CS21 Assignment 2

# Register usage
# t0 - x
# t1 - y
# t2 - z
# temp for calculations - t3
# t4 - answer


.text
.globl  main


main: 

ori     $t0,    $zero,  0x186A
ori     $t1,    $zero,  0x1388
ori     $t2,    $zero,  0x61A8
sll     $t0,    $t0,    8
sll     $t1,    $t1,    4
sll     $t2,    $t2,    4
div     $t0,    $t2
sll     $zero,  $zero,   0
sll     $zero,  $zero,   0
mflo    $t3
mult    $t3,    $t1
sll     $zero,  $zero,   0
sll     $zero,  $zero,   0
mflo    $t4





         