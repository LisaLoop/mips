.text

.globl main



main:
                                  # write("enter an int:")
         li     $v0,4             #   print string service
         la     $a0,prompt1       #   address of prompt
         syscall
                                  # read( a )
         li     $v0,5             #   read integer service
         syscall                  #   $v0 gets the integer
                        
                                  # subroutine call
                                  #   1. No T registers to push
         move      $a0, $v0       #   2. Put argument into $a0
         nop
         jal     triangle             #   3. Jump and link to subroutine
         nop
         move   $s1,    $v0
                                  # return from subroutine 
                                  #   1. No T registers to restore
                                  
        
                                  # write("factorial is:")
         li     $v0,4             #   print string service
         la     $a0,prompt2       #   address of prompt
         syscall
                                  
         move   $a0,    $s1    
         li     $v0,1             # print integer service
         syscall                                  

        li      $v0,    10
        syscall

triangle:
                                  # prolog        
         sub     $sp,$sp,4        #   1. Push return address
         sw      $ra,($sp)
         sub     $sp,$sp,4        #   2. Push caller's frame pointer
         sw      $fp,($sp)
         sub     $sp,$sp,4        #   3. Push register $s1
         sw      $s1,($sp)
         sub     $fp,$sp,4        #   4. $fp = $sp - space_for_variables (==1)
         move    $sp,$fp          #   5. $sp = $fp
         
# body of subroutine
         move    $s1,$a0          # save argument in $s1
         li      $t1,1            # get a 1
         bgt     $s1,$t1,recurse  # if ( n<=1)
         nop
         li      $v0,1            #   return 1
         b       epilog
         nop    

recurse:                          # else
                                  #  return n*fact(n-1)
         sub     $a0,$s1,1        #     n-1
                       
                                  # subroutine call
                                  #   1. No T registers to push
                                  #   2. Argument is in $a0 
         jal     triangle         #   3. Jump and link to subroutine
         nop
         addu     $v0,$v0,$s1      # n+triangle(n-1)
                            
epilog:                           # epilog
                                  #   1. Return value is already in $v0        
         addi     $sp,$sp,4        #   2. $sp = $fp + space_for_variables (==1)
         lw      $s1,($sp)        #   3. Pop register $s1
         
         addi     $sp,$sp,4        #          
         lw      $fp,($sp)        #   4. Pop $fp

         addi     $sp,$sp,4                        
         lw      $ra,($sp) 
                                  #   5. Pop $ra
         addi     $sp,$sp,4        #            
         jr      $ra              #   6. return to caller 
         nop
         
.data
prompt1: .asciiz "enter an int:"
prompt2: .asciiz "Triangle : "

