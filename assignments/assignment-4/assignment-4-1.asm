
#  * Exercise 1 – Conversion to lower case
# Declare a string in the data section, for example:
# .data
# string: .asciiz "ABCDEFG"
# Write a program that prints the string, converts the string
# to all lower case characters and then prints the
# string again. Do this conversion by adding 0x20 to each
# character in the string. (See Appendix B to
# figure out why this works.) Declare an .asciiz string holding "\n" and
# print it after the strings to get to the next line.
# Assume that the data comprises only uppercase alphabetical characters,
# with no spaces or punctuation.
#

# using namespace std;
# $s0 -- count
# $s1 -- address of inputString
.data
newLine: .asciiz "\n"
inputString: .asciiz "ABC"

.text

.globl .main

main:

        ori     $s0,    $0,     0       # int count = 0
                                        # std::cout << " " << inputString << endl
        li	$v0, 	4
        la	$a0,	inputString	# inputString load address of message into $a0 
        nop
        nop
        syscall

        li	$v0, 	4
        la	$a0,	newLine	# newLine load address of message into $a0 
        nop
        nop
        syscall


loop:                                           # do { <-------------------------------\
                                                # x = inputString[count]               |
        lb      $s1,    inputString($s0)        # load inputString[count] into $t0
        nop
        nop
        nop
        addi    $s1,    $s1,     0x20           # add 0x20 to $s1                       |
        sb      $s1,    inputString($s0)        # store $s1 into inputString[count]     |
        addi    $s0,    $s0,    1               # c++                                   |
        lb      $s1,    inputString($s0)        #  sb $t, i($s) MEM [$s + i]:1 = LB ($t)
        nop
        nop
        nop                                     
        bgtz    $s1,    loop                    # } while (inputString[count] != '\0')-/ 

        li	$v0, 	4                       # print string
        la	$a0,	inputString	
        nop
        nop
        syscall

        li	$v0, 	4
        la	$a0,	newLine	# inputString load address of message into $a0 
        nop
        nop
        syscall
        nop
        nop
        li	$v0, 	10

        syscall