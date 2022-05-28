.text
.globl bob

bob:
        ori     $s0,    $zero,  0       # sum
        ori     $s1,    $zero,  1       # x
        ori     $s2,    $zero,  2       # y

        or	$a0,    $zero,  $s1     # pass args to doug
        or      $a1,    $zero,  $s2     # x and y
        
        jal     doug
        nop
        move 	$s0, $v0	        # update sum with value returned from doug        
        j	die		        # jump to die
        nop

doug:
        or      $t0,    $zero,  $a0     # x
        or      $t1,    $zero,  $a1     # y
        addu    $v0,    $t0,    $t1     # return = x + y
        jr		$ra		# jump to $ra
        nop
        

die:
        ori     $v0,    $zero,  10      # end program
        syscall
