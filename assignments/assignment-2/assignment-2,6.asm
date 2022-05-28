# assignment-2,6.asm
#
# Lisa Lehrman
# Feb 17, 2022
# CS21 Assignment 2

.text
.globl	main

# Exercise 6
## Register Use:
##
# $t0 base register, address of x
# $t1 x
# $t2 y
# $t3 constants
# $t4 temporary for calculations 
# $t5 answer (acc)
# 18xy + 12x  - 6y + 12

main:

lui     $t0,    0x1001  # init base register
lw      $t1,    0($t0)  # load x into t1
nop
nop
lw      $t2,    4($t0)  # load y into t2
nop
nop
ori     $t5,    $0,     12      # 12 in acc
ori     $t3,    $0,     6
mult    $t3,    $t2
nop
nop
mflo    $t4     # 6 * y
nop
nop
sub     $t5,    $t5,    $t4   # 6

ori     $t3,    $0,     12      # 12 const in t3
mult    $t3,    $t1             # 12x
mflo    $t4
nop
nop
addu    $t5,    $t5,    $t4     # 12x - 6y + 12 in answer
ori     $t3,    $0,     18
mult    $t3,    $t1             # 18 * x 
nop
nop
mflo    $t4
mult    $t4,    $t2     # 18xy
nop
nop
mflo    $t4
addu    $t5,    $t5,    $t4
sw      $t5,    8($t0)


        .data

x:      .word   2
y:      .word   1
answer: .word   0