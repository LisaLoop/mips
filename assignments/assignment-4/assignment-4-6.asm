#
# assignment-4-6.asm
#
# April 12, 2022
# Lisa Lehrman
# CS21 Assignment 4 Exercise 6
# Register usage:
#
# s0 - counter
# 

.data
intArray:       .space  40
prompt:         .asciiz "Please enter an integer:\n"
tabSpace:       .asciiz "\t"

.text
.globl  main

main:

li      $s0,    0       # init counter = 0

promptLoopCondition:
        blt     $s0,    40,      promptLoopBody
        j       promptLoopExit
        nop
promptLoopBody:
        jal     getInputFromUser
        nop
        sw      $v0,    intArray($s0)       
        addi    $s0,    $s0,    4       # increment counter
        j       promptLoopCondition
        nop
promptLoopExit:

        jal     printIntArray
        nop
        jal     reverseArray
        nop
        jal     printIntArray
        nop
        j       end
        nop

getInputFromUser:
        li      $v0,    4       # print the prompt
        la      $a0,    prompt  
        syscall

        li      $v0,    5       # collect input
        syscall
        jr      $ra
        nop

        end:
        li      $v0,    10      # end the program
        syscall
# Register usage:
# t0 - counter
# t1 - int or tab space
printIntArray:
        li      $t0,    0       # counter
printIntArrayLoopCondition:
        blt     $t0,    40,     printIntArrayLoopBody
        j       printIntArrayLoopExit
        nop
printIntArrayLoopBody:
        lw      $t1,    intArray($t0)
        li      $v0,    1       # code to print int
        move    $a0,    $t1
        syscall

        li      $v0,    4       # print string
        la      $a0,    tabSpace      
        syscall
        
        addi    $t0,    $t0,    4       # counter += 4       
        j       printIntArrayLoopCondition
        nop

printIntArrayLoopExit: 
        jr      $ra
        nop

reverseArray:
# Register usage:
# t0 - headCursor
# t1 - tailCursor
# t2 - headElement
# t3 - tailElement
        li      $t0,    0       # headCursor = 0
        li      $t1,    36      # tailCursor = arrLength - 4 bytes
reverseLoopCondition:
        blt     $t0,    20,     reverseLoopBody      
        j       reverseLoopExit
        nop
reverseLoopBody:
        lw      $t2,    intArray($t0)   # load head element     
        lw      $t3,    intArray($t1)   # load tail element
        nop
        sw      $t3,    intArray($t0)      # store tailEl in head
        sw      $t2,    intArray($t1)      # store headEl in tail
        addi    $t0,    $t0,    4          # move head cursor forward
        addiu    $t1,    $t1,   -4          # decrement tail cursor          
        j       reverseLoopCondition
        nop
reverseLoopExit:
        jr      $ra
        nop
