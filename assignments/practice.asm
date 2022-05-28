# 4x^3 + 15x^2 -12x + 7
# 7 + -12x + 15x^2 + 4x^3
# 7 + x(-12 + x(15 + x(4)))
3 * 69 = 207 = 214
# =================================================
# t0 = base register
# t1  = x
# t2  = acc (answer)
# t3 = coefficients
# t4, t5 = temp 


.text
.globl	main

main:
        lui     $t0,      0x1001        # init base register
        lw      $t1,      0($t0)        # load x into working memory
        nop
        nop
        ori     $t3,       $zero,  4       # load 4 into reg t3
        nop
        multu   $t3,    $t1                # x * 4
        nop
        nop
        mflo    $t2                        # x * 4 in $t2

        ori     $t3,    $zero,  15        # load 15 in $t3
        addu    $t2,    $t2,    $t3       # 15 + x(4)

        multu   $t1,    $t2               # x(15 + x(4))
        nop
        nop
        mflo    $t2
        
        ori     $t3,    $zero,  12      # load 12 into t3
        nor     $t3,    $t3,    $t3     # flip all the bits to get the complement
        addiu   $t3,    $t3,    1       # add 1 to get -12  

        addu    $t2,    $t2,    $t3     # (-12 + x(15 + x(4))

        multu   $t1,    $t2             # x(-12 + x(15 + x(4)))
        nop
        nop
        mflo    $t2

        ori     $t3,    $zero,  7       # 7 in t3
        addu    $t2,    $t3,    $t2     # 7 + x(-12 + x(15 + x(4)))

.data 
        x:      .word    3






