#
# assignment-4-2.asm
#
# March 26, 2022
# Lisa Lehrman
# CS21 Assignment 4 Exercise 2
# Register usage:
#  s0 - count
#  s1 - shouldCapitalize
#  s2 - currentCharacter
#  s3 - spaceAscii (32)
#  s4 - lcAlphabetStart (96)
#  s5 - lcAlphabetEnd (122)
.data

inputString:    .asciiz       " in a hole in   the ground there   lived a hobbit\n"

.text

.globl  main


main:

        ori     $s0,    $zero,  0       # count = 0
        ori     $s1,    $zero,  1       # shouldCapitalize = T
        ori     $s3,    $zero,  32      # spaceAscii
        ori     $s4,    $zero,  96      # a ascii code
        ori     $s5,    $zero,  122     # z ascii code

jal     print
nop

loopCondition:
        lb      $s2,    inputString($s0)        # load current character
        nop
        nop
        beq     $s2,    0,  printAndEnd     # current character == '\0'

isSpaceAscii:
        beq     $s2,    $s3, setShouldCapitalizeTrue

inLowercaseLowRange:
        bge		$s2, $s4, inLowercaseHighRange     # if currentchar >= a ascii code branch to inLowercaseHighRange
inLowercaseHighRange:
        ble		$s2, $s5, checkShouldCapitalize	# if $t0 <= $t1 then 
        j       incrementCount
        nop

checkShouldCapitalize:
        beq		$s1, 1, capitalize	# if $s1 == 1 then target
        j       incrementCount
        nop
        nop


capitalize:
        sub	$s2,    $s2,    0x20            # transform char to uppercase
        sb      $s2,    inputString($s0)        # store the byte in the same string
        nop
        nop
        ori     $s1,    $zero,  0       # shouldCapitalize = false
        j       incrementCount
        nop

setShouldCapitalizeTrue:
        ori     $s1,    $zero,  1       # shouldCapitalize = true

incrementCount: 
        addi    $s0,    $s0,    1       # count++
        j       loopCondition
        nop
        nop

print:
        li		$v0,    4		# system call #4 - print string
        la		$a0,    inputString     # 
        nop
        nop
        syscall
        jr      $ra
        nop
        nop

printAndEnd:
        jal		print
        nop
        ori     $v0,    $zero,  10      # end the program
        syscall



        


