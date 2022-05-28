.data
        intArray:       .space          8

.text
.globl  main

main:
# get the first number 
# put it in the array
# get the second number
# put it in the array
# print the first number
# print the second number

# s0 - int user entered 
# s1 - base address of intArray
# s2 - counter

        li      $s2,    0
readInput:
        li      $v0,    5              # read int from keyboard 
        syscall

        move    $s0,    $v0             # store int in s0
        sw      $s0,    intArray($s2)   # store the int in intArray  
        addi    $s2,    $s2,    4       # counter+=4
        li      $v0,    5               # read 2nd int from keyboard 
        syscall

        move    $s0,    $v0             # store int in s0
        sw      $s0,    intArray($s2)   # store the int in intArray  


print:
        li      $s2,    0       # set counter to 0
        lw      $s0,    intArray($s2)
        nop
        li      $v0,    1       # print an int
        move    $a0,    $s0
        syscall

        addi    $s2,    $s2,    4       # counter += 4
        lw      $s0,    intArray($s2)
        nop
        li      $v0,    1
        move    $a0,    $s0
        syscall