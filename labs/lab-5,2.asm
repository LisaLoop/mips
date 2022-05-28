# 
# lab-5,2.asm
#
# Lisa Lehrman
# CS21 Lab #5
# April 2, 2022
# 

# Exercise 2 
        .data
size:   .word 12
array:
        .word 50, 53, 52, 49, 48, 51, 99, 45, 53, 47, 47, 50
result:
        .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text

.globl  main

# Register usage:
# s0 - 0 (j-1)
# s1 - 4 (j)
# s2 - 8 (j+1)
# s3 - (size - 1)
# s4 - arr[s0] (zeroeth element)
# s5 - arr[s3] (last element)

main:
        ori     $s0,    $zero,  0
        ori     $s1,    $zero,  4
        ori     $s2,    $zero,  8
       
        
        lw	$s3,    size	#
        nop
        nop
        addiu   $s3,    $s3,    -1      # array.length - 1. pos of last element.
        mult	$s1,    $s3		# 4 * 11 
        mflo	$s3			# copy Lo to $t2
        move    $a0,    $s0
        jal	copy			# jump tocopy and save position to $ra
        nop
        move    $a0,    $s3             # move size-1 to a0     
        jal	copy			# jump to copy and save position to $ra
        nop
        
        move    $a0,    $s1
        jal     average
        nop

loop:
        blt     $s1,    $s3,   loopBody
        j       loopEnd
        nop

loopBody: 
        move    $a0,    $s1
        jal     average
        nop    
        addi    $s1,    $s1,    4
        j       loop
        nop

loopEnd:          
        j       end
        nop
# Register usage:
# a0 - index position
copy:     
        lw      $t0,    array($a0)
        nop
        nop   
        sw	$t0,    result($a0)		# store 0th el in result arr
        jr      $ra
        nop

# Register usage:
# a0 - index position
# t0, t1, t2 : j-1, j, j+1 (indicies)
# t3, t4, t5 - hold values at index position
# load array[index] for the 3 items in the window
# t6 - the average of those elements
# average - stored in newArray[index]
average:
        addiu   $t0,    $a0,    -4
        addiu   $t1,    $a0,    0
        addiu   $t2,    $a0,    4    
        
        lw      $t3,    array($t0)
        lw      $t4,    array($t1)
        lw      $t5,    array($t2)
        nop
        nop
        addu    $t6,    $t3,    $t4
        addu    $t6,    $t6,    $t5
        ori     $t7,    $zero,  3
        div     $t6,    $t7
        mflo    $t6
        nop

        sw      $t6,    result($t1)
        nop
        nop
        jr      $ra
        nop

end:
        ori     $v0,    $zero,  10
        syscall





        