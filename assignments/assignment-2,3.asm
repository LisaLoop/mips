# assignment-2,3.asm
#
# Lisa Lehrman
# Feb 22, 2022
# CS21 Assignment 2
# see notes on P2Ex3.txt

# Exercise 3 - Signed and Unsigned Adding

.text
.globl	main

main:

li      $t1,    0x7000
sll     $t1,    $t1,    16    
or      $t2,    $t1,    $zero
addu    $t1,    $t1,    $t1

add     $t2,    $t2,    $t2

