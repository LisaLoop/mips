        .data
array:  
        .word   50, 53, 52, 49, 48, 51

.text

.globl  main

# s0 - number
# s1 - counter (J)
main:
        ori     $s1,    $zero,  0     
        lb      $s0,    array($s1)
        nop
        nop
