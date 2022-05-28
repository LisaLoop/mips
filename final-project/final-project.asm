#  
# final-project.asm
#
# May 18, 2022
# Lisa Lehrman
# CS21 Final Project
#
# A program that uses an interrupt-driven I/O routine to handle all input and output
# It will perform tasks on a display string that are determined by the user's keyboard input
# 's' - will sort the string in ascending order
# 't' - will toggle the case of alphabetic characters in the string
# 'r' - will reverse the string
# 'a' - will replace the string with the original displayed string
# 'q' - will quit the program

        .data
shouldExit:     .word   0
source:        .asciiz "abcdefghijklmnopqrstuvwxyzABCDEFGH123456789!a\n"
display:       .space  120
        .text
        .globl main
main:
        # push 2 bases
        la      $s0,    source
        addi    $sp,    $sp,    -4
        sw      $s0,    ($sp)
        la      $s0,    display
        addi    $sp,    $sp,    -4
        sw      $s0,    ($sp)
        jal     copy      # replace display with source
        nop
# enabling interrupts
# 
        move    $s0,    $zero    
        ori     $s0,    $s0,    1       # turn on global interrupts
        ori     $s0,    $s0,    1024    # enable interrupts for transmitter
        ori     $s0,    $s0,    2048    # enable interrupts for receiver
        mtc0    $s0,    $12

        li      $s1,    2               # enabling interrupts for
        sw      $s1,    0xffff0000      # receiver

        li      $s1,    2               # enabling interrupts for 
        sw      $s1,    0xffff0008      # the transmitter


loopCondition:
        lw      $t9,    shouldExit
        nop
        bgtz    $t9,    end
        nop
        j       loopCondition
        nop

end:
        li      $v0,    10
        syscall

copy:
# prolog
        # 1 - save $ra
        addi    $sp,    $sp,    -4      # making room
        sw      $ra,    ($sp)           # save $ra on stack
        # 2 - save fp
        addi    $sp,    $sp,    -4      # save fp on stack
        sw      $fp,    ($sp)
        # 3 - save global variables on the stack before overwriting them (s registers) if needed
        # 4 - save local variables to registers 
        addi    $sp,    $sp,    -12     # space for local variables
        # 5 - fp = sp
        move    $fp,    $sp             # frame pointer = stack pointer   
# body
        lw      $t0,    24($sp)         # base1
        lw      $t1,    20($sp)         # base2
        sw      $t0,    0($fp)          # put base 1 on stack at frame pointer
        sw      $t1,    4($fp)          # put base 2 on stack
        li      $t0,    0               # byte = 0
        sw      $t0,    8($fp)          # store the byte on the stack

copyLoopCondition:
        lw      $t0,    8($fp)          # get the byte for the loop predicate
        nop
        beq     $t0,    0x0a, copyLoopEnd # byte === '\n'
copyLoopBody:
        # byte = RAM[base1];
        lw      $t0,    0($fp)          # base1 - (source address)
        nop
        lb      $t1,    ($t0)           # load the character from source 
        nop
        sw      $t1,    8($fp)          # save character
        lw      $t1,    8($fp)  
        nop
        # RAM[base2] = byte;
        lw      $t0,    4($fp)          # load display address
        nop
        sb      $t1,    ($t0)           
        # base1 += 1
        lw      $t0,    0($fp)          # load base1 address
        nop
        addi    $t0,    $t0,    1       
        sw      $t0,    0($fp)
        # base2 += 1
        lw      $t0,    4($fp)          # load base 2 address
        nop
        addi    $t0,    $t0,    1
        sw      $t0,    4($fp)          # store back on stack

        j        copyLoopCondition
        nop 
copyLoopEnd:
# epilog
        addi    $sp,    $sp,    12      # remove space for local vars
        lw      $fp,    ($sp)           # restore frame pointer
        addi    $sp,    $sp,    4
        lw      $ra,    ($sp)           # restore $ra
        addi    $sp,    $sp,    4
        jr      $ra
        nop

# interrupt handler - kernal segment

.ktext  0x80000180      # kernal entry

.set noat               # lock $at to read its value
move $k0, $at
.set at         
                
sw      $k0,    saveat

mfc0    $k0,    $13             # move from cause register
andi    $k1,    $k0,    2048    # get the bit for the receiver (keyboard)
                                # andi with 2048 to mask off the 11th bit
beq     $k1,    2048,   handleKeypress
nop
andi    $k1,    $k0,    1024    # mask off bit for the transmitter (display)
beq     $k1,    1024,   handleDisplayUpdate
nop
j       listenerEnd
nop

handleDisplayUpdate:            
        lw      $k1,    stringIndex
        nop
        lb      $k0,    display($k1)
        nop
        sb      $k0,    0xffff000c                   # store byte in the transmitter data
        addi    $k1,    $k1,    1                    # add 1 to stringIndex
        bne     $k0,    0x0a,   updateStringIndex    # 0x0a is new line ascii code
        li      $k1,    0                            # reset stringIndex
       
updateStringIndex:
        sw      $k1,    stringIndex
        j       listenerEnd
        nop

handleKeypress:
        lw      $k0,    0xffff0004      # get char from receiver data
        nop
       
        beq     $k0,    115,    onSortStringAsc         # s
        beq     $k0,    116,    onToggle                # t
        beq     $k0,    97,     onReplaceDisplay        # a   
        nop     
        beq     $k0,    114,    onReverseString         # r
        nop
        beq     $k0,    113,    onExit                  # q 
        nop
        j       listenerEnd
        nop

# epilog
listenerEnd:
        lw      $k0,    saveat 
        nop
        .set    noat
        move    $at,    $k0     # restore $at 
        .set    at
        eret

onReverseString:
        jal     findEndOfStr
        nop
        move    $a0,    $v0
        jal     reverseString
        nop
        j       listenerEnd
        nop
onSortStringAsc:
        jal     findEndOfStr
        nop
        move    $a0,    $v0
        jal     sortStringAsc
        nop
        j       listenerEnd
        nop
onExit:
        li      $t8,    1
        sw      $t8,    shouldExit    
        j       listenerEnd
        nop

onReplaceDisplay: 
        jal     replaceDisplay
        nop
        j       listenerEnd
        nop

onToggle:
        jal     findEndOfStr
        nop
        move    $a0,    $v0     # move length-2 to arg register
        jal     toggle          # length-2 b/c we want to stop at newline
        nop
        j       listenerEnd
        nop
# t0 - char
# t2 - counter (length)
findEndOfStr:
        li      $t2,    0   # counter = 0  
findEndOfStrloop:
        lb	$t0,    display($t2)	        # load the char
        nop
        addi    $t2,    $t2,    1               # increment counter
        bne	$t0,    10, findEndOfStrloop	# check if we hit newline
        addi    $v0,    $t2,    -2              # return string length in v0
        jr		$ra                     # subtract 2 to get char before \n
# t7 - head pointer 
# t1 - tail pointer
# t2 - tail value
# t3 - head value
reverseString:
        move    $t1,    $a0     # tail
        li      $t7,    0       # head
reverseLoop:
        lb      $t3,    display($t7)
        nop
        lb      $t2,    display($t1)
        nop
        sb      $t3,    display($t1)
        sb      $t2,    display($t7)
        addi    $t7,    $t7,    1
        addi    $t1,    $t1,    -1
        blt     $t7,    $t1,    reverseLoop            
        jr      $ra
        nop

replaceDisplay:
        li      $t0,    0       # counter = 0
        li      $t1,    0       # character
replaceDisplayCondition:
        beq     $t1,    0x0a,   replaceDisplayEnd
        nop
replaceDisplayBody:
        lb      $t1,    source($t0)
        nop
        sb      $t1,    display($t0)
        addi    $t0,    $t0,    1       # increment counter
        j       replaceDisplayCondition
        nop
replaceDisplayEnd:
        jr      $ra
        nop

toggle: 
        li      $t0,    0       # toggleLoopCounter = 0
        li      $t1,    0       # character index
toggleLoopCondition:
        bgt     $t0,    $a0, toggleLoopEnd
        nop
toggleLoopBody:
        lb      $t1,    display($t0)
        nop
        # uppercase range 65 - 90
        bge     $t1,    65,     isUpperCase     # char >= 65 (acsii for A)
        nop
        j       toggleIterationEnd
        nop
isUpperCase:
        bgt     $t1,    90,     isLowerCase      # char > 90 (Z)
        nop
        addi    $t1,    $t1,    0x20    # convert the character to uppercase
        j       toggleIterationEnd
        nop
isLowerCase:
        # lowercase range 97 - 122
        blt     $t1,    97,     toggleIterationEnd
        nop
        bgt     $t1,    122,    toggleIterationEnd
        nop
        addi    $t1,    $t1,    -32     # convert the character to lowercase
toggleIterationEnd:
        sb      $t1,    display($t0)
        addi    $t0,    $t0,    1       # increment counter
        j       toggleLoopCondition
        nop

toggleLoopEnd:
        jr      $ra
        nop

sortStringAsc:
# t0 - i counter
# t1 - i end
# t2 - j counter
# t3 - j end
# t4 - x 
# t5 - y
        li      $t0,    0                
        move    $t3,    $a0              
        addi    $t1,    $t3,    -1 
sortStringOuterLoopCondition:
        bgt     $t0,    $t1,    sortStringOuterLoopEnd
        nop
sortStringOuterLoopBody:
        addi    $t2,    $t0,    1       # j=i+1
sortStringInnerLoopCondition:
        bgt     $t2,    $t3,    sortStringInnerLoopEnd
        nop
sortStringInnerLoopBody:
        lb      $t4,    display($t0)    # load x
        nop
        lb      $t5,    display($t2)    # load y
        nop
        ble     $t4,    $t5,    sortStringInnerIterationEnd
        nop
        sb      $t4,    display($t2)
        sb      $t5,    display($t0)      
sortStringInnerIterationEnd:
        addi    $t2,    $t2,    1       # increment j counter 
        j       sortStringInnerLoopCondition
        nop
sortStringInnerLoopEnd:
        addi    $t0,    $t0,    1       # increment i counter
        j       sortStringOuterLoopCondition
        nop
sortStringOuterLoopEnd:
        jr      $ra
        nop
    
        .kdata
        .align  4
saveat:       .space 4
stringIndex:  .word  0   