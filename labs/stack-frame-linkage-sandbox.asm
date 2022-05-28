.text

.globl  main

main:
# body
li      $a0,     1      # args to printN
li      $a1,    10
jal     printN
nop

# epilog
li      $v0,     10      # end
syscall


printN:         # printN(i: int, n: int), print i until i == n-1  
# prolog
addi    $sp,    $sp,    -4      # push ra onto the stack
sw      $ra,    ($sp)

addi    $sp,    $sp,    -4      # push the caller's fp onto the stack
sw      $fp,    ($sp)

sub     $fp,    $sp,    8       # fp = sp - localVariablesInBytes
move    $sp,    $fp             # sp = fp



# body
# t0 - i
# t1 - n
sw      $a0,    0($fp)   # push a0 (i) onto the stack
sw      $a1,    4($fp)   # push a1 (n) onto the stack

lw      $t0,    0($fp)
lw      $t1,    4($fp)
nop      
blt     $t0,    $t1,    printNRecurseCase     # i < n
j       printNBaseCase
nop

printNRecurseCase: 
move    $a0,    $t0     
li      $v0,    1       # print int
syscall

addi    $t0,    $t0,    1       # increment i
# call self
move    $a0,    $t0     # pass i
move    $a1,    $t1     # pass n
jal     printN
nop 

printNBaseCase:

# epilog
addi    $sp,    $fp,    8       # sp = fp + localVars

lw      $fp,    ($sp)   
addi    $sp,    $sp,    4       # pop callers frame pointer to fp

lw      $ra,    ($sp)           # pop $ra from the stack
addi    $sp,    $sp,    4

jr      $ra
nop