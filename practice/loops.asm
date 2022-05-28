#
# An app that makes a for loop using while
# the loops counts from 1 to 10
#
# Register usage
# s0 - counter
# s1 - finish value
#  
.text 
.globl  main

main:
        ori     $s0,    $zero,  0               # init counter
        ori     $s1,    $zero,  10              # init finish value
# A loop that counts down from 10 to 0
# Register usage:
#  s2 - decrementCounter
#  s3 - decrementStop 
#
        ori     $s2,    $zero,  10      # counter = 10

incrementCondition: 
        ble     $s0,    $s1,    incrementBody        # counter <= 10
        j       incrementEnd
        nop

incrementBody:
        addi	$s0,    $s0,    1               # increment counter
        j       incrementCondition       
        nop

incrementEnd:     
decrementCondition:
        bgtz    $s2,    decrementBody    # counter > 0
        j       decrementEnd
        nop

decrementBody:
        addiu   $s2,    $s2,    -1      # counter--
        j       decrementCondition
        nop

decrementEnd: 
         ori     $v0,    $zero,  10
        syscall
