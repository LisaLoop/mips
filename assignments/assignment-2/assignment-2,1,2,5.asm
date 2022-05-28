# assignment-2,1,2,5.asm
#
# Lisa Lehrman
# Feb 17, 2022
# CS21 Assignment 2

.text
.globl	main

main:
# Exercise 1

li      $t4,     456            # li is converted to 1 or 2 instructions 
li      $t1,     -229           # depending on whether the number is positive or negative
li      $t2,     325            # if positive the 1 instruction is ori 
li      $t3,     -552           # if negative the 2 instructions are lui and then ori
addu    $t5,     $t4,   $t1     # the top 16 bits are all 1s and the bottom 16 bits 
addu    $t6,     $t2,   $t3     # are whatever the ori is 
addu    $t0,     $t5,   $t6

xor     $t0,    $t0,    $t0
xor     $t1,    $t1,    $t1
xor     $t2,    $t2,    $t2
xor     $t3,    $t3,    $t3
xor     $t4,    $t4,    $t4
xor     $t5,    $t5,    $t5
xor     $t6,    $t6,    $t6

# Exercise 2
      
li      $t0,    0
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000
addiu   $t0,    $t0,    0x1000  # 4096 * 16

li      $t1,    0x1000
sll     $t1,    $t1,    4

li      $t2,    0x1000
addu    $t2,    $t2,    $t2
addu    $t2,    $t2,    $t2
addu    $t2,    $t2,    $t2
addu    $t2,    $t2,    $t2

# Exercise 5
## Register Use:
##
## $t0 base register, address of x
## $t1 x
## $t2 value of the answer (acc)
## $t3, $t4 temporary
#  2x^3 -3x^2 + 5x + 12

xor     $t0,    $t0,    $t0
xor     $t1,    $t1,    $t1
xor     $t2,    $t2,    $t2

lui     $t0,    0x1001          # init base register
lw      $t1,    0($t0)          # load x
ori     $t2,    $0,     12      # init the acc during the load delay slot
ori     $t3,    $0,     5       # move 5 into temp
mult    $t1,    $t3             # 5x

mflo    $t3                     # product of 5x
addu    $t2,    $t2,    $t3     # add what's in acc with 5x

mult    $t1,    $t1             # x^2
nop
nop
nop
mflo    $t3                    # x^2 in t3
nop
nop
nop                               
ori     $t4,    $0,     3         # move constant 3 to temp
mult    $t4,    $t3               # 3 x x^2
nop
nop
mflo    $t4
subu    $t2,    $t2,    $t4     # acc - 3x^2 

ori     $t4,    $0,     2       # load the 2 into temp
mult    $t1,    $t3             
nop
nop
mflo    $t3                     # x^3
nop
nop
mult    $t3,    $t4     # 2 * x^3
mflo    $t3
nop
nop
addu    $t2,    $t2,    $t3 
sw      $t2,    4($t0)


        .data

x:      .word   2
answer: .word   0
