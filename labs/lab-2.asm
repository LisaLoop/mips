# lab-2.asm
#
# Lisa Lehrman
# Feb 15, 2022
# CS21 lab 2

.text
.globl  main

main:

ori     $t0,    $zero,  0x1234
ori     $t1,    $zero,  0xFFFF

or      $t2,    $t0,    $t1
and     $t3,    $t0,    $t1
xor     $t4,    $t0,    $t1
nor     $t5,    $t0,    $t1

xor     $t0,    $t0,    $t0
xor     $t1,    $t1,    $t1
xor     $t2,    $t2,    $t2
xor     $t3,    $t3,    $t3
xor     $t4,    $t4,    $t4
xor     $t5,    $t5,    $t5

ori     $t0,    $zero,  0xFEDC
ori     $t1,    $zero,  0x5678

or      $t2,    $t0,    $t1
and     $t3,    $t0,    $t1
xor     $t4,    $t0,    $t1
nor     $t5,    $t0,    $t1

xor     $t0,    $t0,    $t0
xor     $t1,    $t1,    $t1
xor     $t2,    $t2,    $t2
xor     $t3,    $t3,    $t3
xor     $t4,    $t4,    $t4
xor     $t5,    $t5,    $t5

ori     $t1,    $zero,  0x5678
nor     $t2,    $t1,    $zero

ori     $t3,    $zero,  0x0000
nor     $t4,    $t3,    $zero

ori     $t5,    $zero,  0x3333
nor     $t6,    $t5,    $zero

xor     $t0,    $t0,    $t0
xor     $t1,    $t1,    $t1
xor     $t2,    $t2,    $t2
xor     $t3,    $t3,    $t3
xor     $t4,    $t4,    $t4
xor     $t5,    $t5,    $t5
xor     $t6,    $t6,    $t6

lui     $t0,    0xffff
ori     $t1,    0xffff
or      $t2,    $t0,    $t1

sll     $t3,    $t2,    3
srl     $t4,    $t2,    2
sra     $t5,    $t2,    2

xor     $t0,    $t0,    $t0
xor     $t1,    $t1,    $t1
xor     $t2,    $t2,    $t2
xor     $t3,    $t3,    $t3
xor     $t4,    $t4,    $t4
xor     $t5,    $t5,    $t5

lui     $t0,    0x9696
ori     $t1,    0x9696
or      $t2,    $t0,    $t1

sll     $t3,    $t2,    4
srl     $t4,    $t2,    3
sra     $t5,    $t2,    2

xor     $t0,    $t0,    $t0
xor     $t1,    $t1,    $t1
xor     $t2,    $t2,    $t2
xor     $t3,    $t3,    $t3
xor     $t4,    $t4,    $t4
xor     $t5,    $t5,    $t5

lui     $t0,    0x8765
ori     $t1,    0x4321
or      $t2,    $t0,    $t1

sll     $t3,    $t2,    4
srl     $t4,    $t2,    3
sra     $t5,    $t2,    2







