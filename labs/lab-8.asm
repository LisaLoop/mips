#
#
#

.data
        source: .asciiz "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\n"
        display:.space  256
.text   
.globl  main

# s0 - shouldExit flag
# s1 - base address of receiver 
# s2 - base address of transmitter
# s3 - value at offset of receiver
# s4 - character
# s5 - value at offset of transmitter
# s6 - return value from read subroutine
main:
        la      $a0,    source
        la      $a1,    display
        jal     copy
        nop
        li      $s0,    0               # set shouldExit flag
        li      $s1,    0xffff0000      # base of receiver control
        li      $s2,    0xffff0008      # base of transmitter control
pollingLoopCondition:
        beqz    $s0,    pollingLoopBody
        nop
        j       pollingLoopEnd
        nop
pollingLoopBody:
# receiver part
        move    $a0,    $s1     # pass address of receiver as arg 
        jal     read
        nop
        move    $s6,      $v0   # move return from read 

        li      $s7,    113     # load ascii code for 'q'
        beq     $s6,    $s7,    pollingLoopEnd
        nop
# transmitter part

        la      $a0,    display         # reset address to base of display      
        move    $a1,    $s2
        jal     print
        nop
        j       pollingLoopCondition
        nop

pollingLoopEnd:
        li      $v0,    10      # end program
        syscall

read:
        lw      $t0,    ($a0)   # load address of receiver
        andi    $t0,    $t0,    1       # mask off ready bit
        beqz    $t0,    readMiss
        nop
        lb      $v0,    4($a0)  # load byte from receiver
        nop
        j       readEnd
        nop
readMiss:
        li      $v0,    0       # return 0
readEnd:
        jr      $ra
        nop

print:
printLoopBody:
        lw      $t1,    ($a1)   # load transmitter  
        andi    $t1,    $t1,    1    # mask off ready bit
        beqz    $t1,    printLoopBody
        nop
        lb      $t0,    ($a0)   # load a byte from display
        nop
        beqz    $t0,    printLoopEnd
        nop
        sb      $t0,    4($a1)
        addiu   $a0,    $a0,    1       # increment address of string
        j       printLoopBody
        nop
printLoopEnd:
        jr      $ra
        nop

# t0 - character
# t2 - address of source
# t3 - address of display
# a0 - base of source
# a1 - base of display 
copy:
        move    $t2,    $a0     
        move    $t3,    $a1
        lb      $t0,    ($t2)        # load char from source
        nop
copyLoopCondition:        
        beqz    $t0,    copyLoopEnd
copyLoop:
        sb      $t0,    ($t3)
        addi    $t2,    $t2,    1       # increment addresses to 
        addi    $t3,    $t3,    1       # get next char
        lb      $t0,    ($t2)
        j       copyLoopCondition
        nop
copyLoopEnd:
        nop
        jr      $ra
        nop





        