.text
.globl	main

main:
        # this program prints the numbers from 1 to 10 using MIPS Assembly
        # store the value 10 in $t3
        li      $t3,      10

loop:
        addi    $t0,      $t0,      1        # increment base register
        addi    $v0,      $zero,    4        # print number
        syscall
        beq     $t0,      $t3,     end
        j       loop
end:
        addi    $v0,      $zero,    10        # print newline
        syscall
        jr      $ra
        nop
        .data