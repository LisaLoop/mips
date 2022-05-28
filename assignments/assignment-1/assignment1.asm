# assignment1.asm
#
# Lisa Lehrman
# Feb 8, 2022
# CS21 Assignment 1


.text
.globl	main

main:
# Exercise 1 
    ori $t0,    $zero,  0x01    # move '1' bit to register 8
    sll $t2,    $t0,    3       # shift left the value in register 8 3 places

    or  $t3,    $t0,    $t2     # put result of the OR in register 11 
    sll $t4,    $t3,    4       # shift left 4 places, store in R12

    or  $t5,    $t3,    $t4     # OR r11 and r12, store in r13
    sll $t6,    $t5,    8       # shift t3 to t6 eight places

    or  $t7,    $t6,    $t5     # OR t5 and t6, store in t7
    sll $t8,    $t7,    16      # shift t7 16 places and store in t8

    or  $t1,    $t7,    $t8     # OR t7 with t8, store in t1

# Exercise 2 

    xor	$t0,    $t0,    $t0     # clear the registers from the previous exercise
    xor $t1,    $t1,    $t1
    xor $t2,    $t2,    $t2
    xor $t3,    $t3,    $t3
    xor $t4,    $t4,    $t4
    xor $t5,    $t5,    $t5
    xor $t6,    $t6,    $t6
    xor $t7,    $t7,    $t7
    xor $t8,    $t8,    $t8
    
    ori     $t0,    $zero,  0x01    # write 1 bit to $t0
    sll     $t1,    $t0,    3       # shift left 3 bits, store in $t1
    sll     $t2,    $t0,    1
    or      $t3,    $t1,    $t2      

    sll     $t2, $t2, 1
    or      $t4, $t2, $t0
    sll     $t3, $t3, 4
    or      $t5, $t3, $t4   # result in t5

    sll     $t6, $t5, 8
    or      $t7, $t5, $t6

    sll     $t8, $t7, 16
    or      $t1, $t7, $t8

# Exercise 3
    xor $t0,    $t0,    $t0   # clear the registers from the previous exercise
    xor $t1,    $t1,    $t1
    xor $t2,    $t2,    $t2
    xor $t3,    $t3,    $t3
    xor $t4,    $t4,    $t4
    xor $t5,    $t5,    $t5
    xor $t6,    $t6,    $t6
    xor $t7,    $t7,    $t7
    xor $t8,    $t8,    $t8

    ori $t0,    $zero,  0x01    # write 1 bit to $t0         
    sll $t1,    $t0,    1
    or  $t1,    $t0,    $t1     # 0011 in $t1   

    sll $t2,    $t1,    2       # $t2 1100
    or  $t2,    $t1,    $t2     # $t2 1111

    sll $t1,    $t2,    4       # $t1 11110000
    or  $t2,    $t2,    $t1     # $t2 11111111

    sll $t1,    $t2,    8       # $t1 1111111100000000
    or  $t2,    $t1,    $t2     # $t2 1111111111111111

    sll $t1,    $t2,    16      # $t1 1111111111111111 0000000000000000
    or  $t1,    $t1,    $t2     # result! 

                               