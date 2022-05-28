#
# assignment-5-4.asm
#
# April 25, 2022
# Lisa Lehrman
# CS21 
# A program that returns the sum of all 
# squares from 1 to n
# using the real world linkage convention

.data
prompt: .asciiz "Please enter an int:\n"
sumOf:  .asciiz "Sum of "
is:     .asciiz " is "
.text
.globl  main

# s0 - user input 
main:
la      $a0,    prompt  # show user the prompt
li      $v0,    4
syscall

li      $v0,    5       # collect user input 
syscall                 # and store in s0
move    $s0,    $v0     #  

addi    $sp,    $sp,    -4      # push input on the stack
sw      $s0,    ($sp)

jal     sumOfSquares
nop

move    $s1     $v0     # move return value to s1
la      $a0,    sumOf   # print sum of 
li      $v0,    4
syscall

lw      $a0,    ($sp)   # print n
li      $v0,    1
syscall

la      $a0,    is      # print is 
li      $v0,    4
syscall

move    $a0,    $s1
li      $v0,    1
syscall

end:
li      $v0,    10
syscall

# t0 - n
# t1 - n^2
# t2 - n-1
sumOfSquares:
# prolog
addi    $sp,    $sp,    -4      # push ra and fp onto the stack
sw      $ra,    ($sp)           #
addi    $sp,    $sp,    -4      #
sw      $fp,    ($sp)           #
addi    $sp,    $sp,    -8      # space for 2 local variables
move    $fp,    $sp             # fp = sp 
# body
lw      $t0,    16($fp)          # get n from stack
nop
mult    $t0,    $t0             # t1 = n^2 
mflo    $t1
nop    

sw      $t1,    4($fp)  # push n^2 on stack


ble     $t0,    1,      baseCase
# recurse 
addi    $t2,    $t0,    -1      # t2 = n-1
sw      $t2,    ($fp)           # on the stack

jal     sumOfSquares
nop

lw      $t1,    4($fp)         # load n^2 again          
nop
add    $v0,    $t1,    $v0     # add return value from 
                               # prev call with n^2 
j       sumOfSquaresEnd
nop

baseCase:
li      $v0,    1

sumOfSquaresEnd:
# epilog
move    $sp,    $fp             # sp = fp
addi    $sp,    $sp,    8
lw      $fp,    0($sp)
addi    $sp,    $sp,    4       # pop fp
lw      $ra,    0($sp)          # pop ra
addi    $sp,    $sp,    4
jr      $ra
nop
