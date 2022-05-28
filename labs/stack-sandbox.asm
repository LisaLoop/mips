.data

intArray:       .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
.globl  main

main:

  jal   reverseArray
  nop

end:
li      $v0,     10
syscall


# Register usage:
# t0 - head cursor
# t1 - tail cursor
reverseArray:
# prolog 
addi    $sp,    $sp,    -4
sw      $ra,    ($sp)  

# body
li      $t0,    0       # head cursor
li      $t1,    36      # tail cursor

reverseLoopCondition:
blt     $t0,    20,     reverseLoopBody
j       reverseLoopEnd
nop

reverseLoopBody:
move    $a0,    $t0     # args 
move    $a1,    $t1     #

addi    $sp,    $sp,    -4      # push cursors onto stack
sw      $t1,    ($sp)
addi    $sp,    $sp,    -4
sw      $t0,    ($sp)

jal     swap    
nop


lw      $t0,    ($sp)   # pop 
nop
addi    $sp,    $sp,    4

lw      $t1,    ($sp)
nop
addi    $sp,    $sp,    4

addi    $t0,    $t0,    4       # increment head, decrement tail
addi    $t1,    $t1,   -4

                                
j       reverseLoopCondition
nop

reverseLoopEnd:

# epilog
lw      $ra,    ($sp)
nop
addi    $sp,    $sp,    4

jr      $ra
nop

# Register usage:
# t0 - head element
# t1 - tail element
# t2 - head cursor
# t3 - tail cursor 
swap:
# subroutine prolog
addi    $sp,    $sp,    -4
sw      $ra,    ($sp)

# body 
move    $t2,    $a0     # move head and tail cursors to t registers
move    $t3,    $a1     #

lw      $t0,    intArray($t2)   # head element
nop
lw      $t1,    intArray($t3)   # tail element
nop
sw      $t0,    intArray($t3)
sw      $t1,    intArray($t2)
# epilog
lw      $ra,    ($sp)
nop
addi    $sp,    $sp,    4
jr      $ra
nop




