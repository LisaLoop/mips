.text
.globl  main

main:

# ori     $t1,    $zero,  01111111111100000000000001010000

ori     $t0,    $zero,  00000000000100000000000001010000
sll     $t1,    $t0,    22
srl     $t1,    $t1,    26   


# read the string
# li $v0, 8
# la $a0, string
# syscall

# loop:
#         lb      $s0,    ($a0)
#         nop
#         beqz    $s0,    print
#         nop
# checkRange: # lower case range is 97 - 122
#         blt     $s0,    97,     nextChar
#         nop
#         bgt     $s0,    122,    nextChar
#         nop
#         # if we made it this far we're in range -- convert
#         addi    $s0,    $s0,    -32
#         sb      $s0,    ($a0)
# nextChar:
#         addi    $a0,    $a0,    1       # 
#         j       loop
#         nop
# print:
#         li      $v0,    4
#         la      $a0,    string
#         syscall

end:
        li      $v0,    10
        syscall
        
