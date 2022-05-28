# add 31,942 - 758 and print the sum  
#
# Register usage
# t0 - 31,942
# t1 - -758
# t3 - temporary
# t4 - sum

.text
.globl  main

main:
        ori     $t0,    $zero,  31942
        ori     $t1     $zero,  758     # will get the negative with two's comp

        not     $t1,    $t1             # flip all bits to get complement of 758
        addiu   $t1,    $t1,    1       # add 1 to get the -758

        addu    $t4,    $t0,    $t1     # add t0 with t1, store sum in t4

        li      $v0,    1               # print int 
	move	$a0,    $t4
	syscall
