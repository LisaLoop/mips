# assignment-5-1.asm
#
# April 19, 2022
# Lisa Lehrman
# CS21 assignment 5 problem 1
# 
# Implementation of bubble sort using the simple linkage convention

# subroutines
# - main
# - promptAndStoreInt(addressOfEl)
# - sort(baseOfArray, arrayLength) 
# - printInt(intToPrint)
.data   
intArray:     .space   40
prompt:       .asciiz "Enter an integer value \n"
tabSpace:     .asciiz "\t"
result:       .asciiz "Result is: \n"

.text
.globl  main

main:
# s0 - counter
li      $s0,    0       # counter = 0
promptLoopCondition:
blt     $s0,    40, promptLoopBody      # counter < 10 
nop
j       promptLoopEnd
nop

promptLoopBody:
la      $a0,    intArray($s0)    
jal     promptAndStoreInt
nop
addi    $s0,    $s0,    4       # counter += 4
j       promptLoopCondition
nop

promptLoopEnd: 
la      $a0,    intArray
li      $a1,    10      
jal     oldBubbleSort
nop

li      $s0,    0       # reset counter
la      $a0,    result  # print the result string
li      $v0,    4
syscall

printLoopCondition:
blt     $s0,    40,     printLoopBody
nop
j       printLoopEnd
nop
printLoopBody:
lw      $a0,    intArray($s0)
nop
jal     printInt
nop
addi    $s0,    $s0,    4
j       printLoopCondition
nop
printLoopEnd:
end:
li $v0,    10          # end the program
syscall

promptAndStoreInt:
# t0 - address of intArray[counter] 
# t1 - int
move    $t0,    $a0
la      $a0,    prompt  # print the prompt
li,     $v0,    4
syscall
li,     $v0,    5       # accept the input
syscall
sw      $v0,    ($t0)
jr      $ra
nop

printInt:
li      $v0,    1       # print the int
syscall
li      $v0,    4       # print the tab space
la      $a0,    tabSpace
syscall
jr      $ra
nop

# a0 - base address of intArry
# a1 - array length (10)
# t0 - i counter 
# t1 - i end 
# t2 - j counter
# t3 - j end
# t4 - x (array[i])
# t5 - y (array[j])
# t6 - temp
bubbleSort:
move    $t0,    $a0     # i starts at base address
li      $t6,    4       # 
mult    $a1,    $t6
nop
mflo    $t6             # array.length
add     $t3,    $t0,    $t6     # j end
addi    $t1,    $t3,    -4      # i end

sortOuterCondition:
blt     $t0,    $t1,    sortOuterBody
j       sortOuterEnd
nop
sortOuterBody:
lw      $t4,    ($t0)           # load x
add     $t2,    $t0,    4       # j=i+4
        sortInnerCondition:
        blt     $t2,    $t3,    sortInnerBody
        nop
        j       sortInnerEnd
        nop
        sortInnerBody:
        lw      $t5,    ($t2)   # load y
        nop
        blt     $t5,    $t4,    sortSwap
        nop
        j       sortSwapEnd
        nop
        sortSwap:
                sw      $t4,    ($t2)   # store x
                sw      $t5,    ($t0)    
        sortSwapEnd:
        addi    $t2,    $t2,    4
        j       sortInnerCondition
        nop
        sortInnerEnd:

addi    $t0,    $t0,    4       # i+=4
j       sortOuterCondition
nop
sortOuterEnd:
jr      $ra
nop














# t0 - base address of intArry
# t1 - array length (10)
# - outer loop -
# t2 - outerLoop counter (i)
# t3 - outerLoop array.length-1
# - inner loop -  
# t4 - 4 (for int size)
# t5 - j counter
oldBubbleSort:
move    $t0,    $a0             # move args to t-registers
move    $t1,    $a1    
li      $t4,    4
mult    $t1,    $t4
mflo    $t1                     # change array length to number in bytes

li      $t2,    0               # outerloop counter = 0
sub     $t3,    $t1,    4       # array.length-1
outerLoopCondition:
blt     $t2,    $t3,    outerLoopBody
j       outerLoopEnd
nop

outerLoopBody:
addi    $t5,    $t2,    4       # j = i+1
        innerLoopCondition:
        blt     $t5,    $t1,    innerLoopBody    
        j       innerLoopEnd
        innerLoopBody:
# t7 - array[i] (outer)
# t8 - array[j] (inner)
# t4 - address of outer array
# t6 - address of inner array 
        add     $t4,    $t0,    $t2     # address with offset from base
        lw      $t7,    ($t4)      
        nop
        add     $t6,    $t0,    $t5
        lw      $t8,    ($t6)
        nop
        blt     $t8,    $t7,    swap
        j       swapEnd
        nop
                swap:   
                sw      $t7,    ($t6)
                sw      $t8,    ($t4)     
                swapEnd:
        addi    $t5,    $t5,    4       # j+=4

        j       innerLoopCondition
        nop
        innerLoopEnd:

addi    $t2,    $t2,    4       # (outerloop) i+=4
j       outerLoopCondition
nop

outerLoopEnd:

jr      $ra