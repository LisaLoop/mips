#
# assignment-4-5.asm
#
# April 10, 2022
# Lisa Lehrman
# CS21 Assignment 4 Exercise 5
# Register usage:
# counter - s0
# s1 - int we're looking at
# s2 - smallest
# s3 - largest
.data
        intArray:       .space          40
        prompt:         .asciiz         "Enter a number: \n"
        smallest:       .asciiz         "Smallest: "
        largest:        .asciiz         "Largest: "
        newLine:        .asciiz         "\n"
.text
        .globl          main

main:

li      $s0,    0       # counter = 0
promptLoopCondition:
        blt     $s0,    40,     promptLoopBody
        j       promptLoopExit
        nop

promptLoopBody:
       jal      getInputFromUser
       nop
       sw       $v0,    intArray($s0)
       addi     $s0,    $s0,    4       # counter += 4  
       j        promptLoopCondition
       nop

promptLoopExit:
        li      $s0,    0       # set counter to 0 
        lw      $s1,    intArray($s0)      
        nop
        move    $s2,    $s1     # init smallest to intArray[0]
        move    $s3,    $s1     # init largest to intArray[0]
        j       searchingLoopCondition
        nop


searchingLoopCondition:
        blt     $s0,    40,     searchingLoopBody
        j       searchingLoopExit
        nop

searchingLoopBody:
        lw      $s1,    intArray($s0)      
        nop
        blt     $s1,    $s2,    setSmallest
        bgt     $s1,    $s3,    setLargest
        
incrementCounter:
        addi    $s0,    $s0,    4       # counter += 4      
        j       searchingLoopCondition
        nop

setSmallest:
        move    $s2,    $s1
        j       incrementCounter
        nop

setLargest:
        move    $s3,    $s1
        j       incrementCounter
        nop

searchingLoopExit:
        la      $a0,    smallest
        move    $a1,    $s2     # move smallest to print it
        jal     printResult
        nop
        la      $a0,    largest
        move    $a1,    $s3
        jal     printResult
        nop
        j       end
        nop

printResult:
        move    $t0,    $a0     # address to some string     
        move    $t1,    $a1     # some integer

        move    $a0,    $t0     
        li      $v0,    4       # print string
        syscall

        li      $v0,    1       # print int
        move    $a0,    $t1
        syscall

        li      $v0,    4       # print string
        la      $a0,    newLine
        syscall

        jr      $ra
        nop

getInputFromUser:
        li      $v0,    4       # print the string
        la      $a0,    prompt  # load address of prompt      
        syscall

        li      $v0,    5 # system call code for Read Integer
        syscall           # reads the value of N into $v0 
        jr      $ra
        nop



end:
        li      $v0,    10
        syscall               # end the program