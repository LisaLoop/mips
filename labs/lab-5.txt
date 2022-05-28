# 
# lab-5.asm
#
# Lisa Lehrman
# CS21 Lab #5
# April 2, 2022
# 

# Exercise 1 
# Register usage
# s0 - s cursor
# s1 - t cursor
# s2 - str length (last char)
        .data
str:    .asciiz "The quick brown fox jumps over a lazy dog"
# str:    .asciiz "abcdefghi"

.text
.globl  main

main:
        ori     $s0,    $zero,  0
        ori     $s1,    $zero,  0

        la      $a0,    str
              
        jal		findEndOfStr	        # jump to findEndOfStr and save position to $ra
        nop
        nop
        move 	$s2,    $v0	        	# move return value (length) to s2
        addiu   $s2,    $t2,    -1              # s2 = t2 - 1 

        or      $a0,    $zero,  $s2             # pass tLength to the subroutine
        jal             reverseStr
        nop
        nop              
        j       die				# jump to die
        nop

die:
        ori     $v0,    $zero,  10
        syscall

# a0 - pointer to base of string
# t0 - character (tValue)
# t1 - t cursor
# t2 - counter
findEndOfStr:
        ori     $t2,    $zero,  0       # counter = 0  
loop:
        lb	$t0,    str($t2)	# load the char
        nop
        addi    $t2,    $t2,    1       # increment t0
        bne	$t0,    $zero, loop	# if  != $t1 then target
        or      $v0,    $zero,  $t0     # return value count in v0
        jr		$ra		# jump to $ra

# t0 - s pointer
# t1 - t pointer 
# t2 - tValue
# t3 - sValue
reverseStr:
        move    $t1,    $a0             # move t pointer arg to t1
        ori     $t0,    $zero,  0       # s pointer = 0
        srl	$t4,    $t1,    1	# find halfway point of str
        addiu	$t1,    $t1,   -1	# $t1--
        
        
reverseLoop: 
        lb      $t2,    str($t1)        # load t char into t2
        nop
        nop
        lb      $t3,    str($t0)        # load s char into t3
        nop
        nop
        sb	$t3,    str($t1)      	 # store character
        sb      $t2,    str($t0)        #
        addiu    $t1,    $t1,   -1
        addi    $t0,    $t0,    1
        blt	$t0,    $t4,    reverseLoop     # if counter < strLen/2 jump to reverseLoop
        jr      $ra
         
        






        
        








