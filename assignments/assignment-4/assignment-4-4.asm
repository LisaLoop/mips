#
# assignment-4-4.asm
#
# April 6, 2022
# Lisa Lehrman
# CS21 Assignment 4 Exercise 4
# Register usage:
# s0 - counter
# s1 - character
.data

message:        .asciiz         "Please input a string of characters.\n"
inputString:    .asciiz         "                                      "

.text
.globl  main

main:
        li      $v0,    4               # Code to print a string
        la      $a0,    message
        syscall
        li      $v0,    8               # read a string from keyboard 
        li      $a1,    128    
        la      $a0,    inputString
        syscall
       
        li      $s0,    0               # counter = 0
        

loadChar:
        lb      $s1,    inputString($s0)        # load the char
        nop

loopCondition:
        bne     $s1,    $zero,  isInUCLowRange       # char != '\0'
        j       end
        nop

isInUCLowRange:
        ble     $s1,    90,     isInUCHighRange         # char <= 90   &&
        j		isInLCHighRange		        # jump to target
        nop

isInUCHighRange:
        bge     $s1,    65,     makeLowercase           #  char >= 65

isInLCHighRange:
        ble     $s1,    122,     isInLCLowRange   # char <= 122 && char >= 96
        j		incrementCounter	  # jump to target
        nop
        
isInLCLowRange:
        bge     $s1,    96       makeUppercase
        j       incrementCounter
        nop

makeLowercase:
        addi    $s1,    $s1,    0x20    # convert ascii to lowercase
        sb      $s1,    inputString($s0)   
        j       incrementCounter
        nop

makeUppercase:
        addiu    $s1,    $s1,    -32	# convert ascii char to uppercase
        sb      $s1,    inputString($s0)
        j       incrementCounter
        nop
end:
        li      $v0,    4       
        la      $a0,    inputString
        syscall
        li      $v0,    10
        syscall

incrementCounter:
        addi    $s0,    $s0,    1       # counter+=1
        j       loadChar
        nop
        






        
        


