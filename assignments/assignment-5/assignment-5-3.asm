# 
# assignment-5-3.asm
# 
# CS21 Assignment 5 problem 3
# Lisa Lehrman
# April 24, 2022
# A program that prints the index of
# positions of Fibonacci numbers using the
# Frame based linkage convention

.data
prompt: .asciiz "Please enter an integer \n"

.text
.globl  main

main:

la      $a0,    prompt  # prompt user for value
li      $v0,    4
syscall

li      $v0,    5       # get n from user
syscall

move    $a0,    $v0     # pass fib arg 
jal     fib
nop

move    $a0,    $v0
li      $v0,    1       # print the result
syscall

end:
        li      $v0,    10
        syscall

# a0 / t0 - n 
# t1 - a or b
# t2 - temp stuff
fib:
# prolog
addi    $sp,    $sp,    -4      # push ra onto stack
sw      $ra,    ($sp)
addi    $sp,    $sp,    -4      # push fp onto stack
sw      $fp,    ($sp)
addi    $sp,    $sp,    -12     # space for local vars n,a,b
move    $fp,    $sp             # set fp = sp

# body
sw      $a0,    0($fp)          # push n
move    $t0,    $a0             # move n to t0   

ble     $t0,    1,      fibBaseCase
nop

# recurse case
addi    $t2,    $t0,    -1     # make n-1 in t2
move    $a0,    $t2            # move arg to pass to fib
jal     fib
nop
sw      $v0,    4($fp)          # save  a


lw      $t0,    0($fp)          # get n
nop
addi    $t2,    $t0,    -2      # get n-2 in t2
move    $a0,    $t2             # pass arg n-2
jal     fib
nop    
sw      $v0,    8($fp)          # store b on the stack 


lw      $t1,    8($fp)          # get b
nop
lw      $t2,    4($fp)          # load a 
nop
add     $v0,    $t1,    $t2     # return a + b
j       fibEnd
nop

fibBaseCase:
move    $v0,    $t0             # return n in v0

# epilog
fibEnd:
addi    $sp,    $sp,    12      # remove space for local vars
lw      $fp,    ($sp)
addi    $sp,    $sp,    4       # pop fp
lw      $ra,    ($sp)
addi    $sp,    $sp,    4       # pop ra
jr      $ra
nop