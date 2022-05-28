#
# assignment-5-2.asm
#
# Lisa Lehrman
# CS21 Assignment 5 problem 2
# April 24th, 2022
# Recursive function that finds n! using
# the Stack-based Linkage convention 

.data
prompt: .asciiz "Please enter an integer: \n"
result: .asciiz "Result: \n"

.text
.globl  main

main:
        la      $a0,    prompt  
        li      $v0,    4
        syscall                         # print the prompt

        li      $v0,    5
        syscall                         # collect input       

        move    $a0,    $v0             # pass n into fact

        jal     fact                    
        nop

        move    $a0,    $v0
        li      $v0,    1
        syscall

        end:
        li      $v0,    10
        syscall

# a0 - n
# v0 - n!
# t0 - 1
# t1 - n-1
# t2 - n
fact:
# prolog
addi    $sp,    $sp,    -4      # push $ra on stack
sw      $ra,    ($sp)
# body 
move    $t2,    $a0
li      $t0,    1
ble     $t2,    $t0,    baseCase        # n <= 1

# recursive case 
addi    $t1,    $t2,    -1      # t1 = n-1
addi    $sp,    $sp,    -4      # push n on the stack
sw      $t2,    ($sp)    

move    $a0,    $t1             # n-1 into arg reg
jal     fact
nop

lw      $t2,    ($sp)
addi    $sp,    $sp,    4       # pop n into t2

mult    $t2,    $v0     # n * fact(n-1)
mflo    $v0
j       factEpilog
nop

baseCase:
li      $v0,    1               # return 1
j       factEpilog
nop

factEpilog:
lw      $ra,    ($sp)   # pop $ra off stack
addi    $sp,    $sp,    4
jr      $ra

       