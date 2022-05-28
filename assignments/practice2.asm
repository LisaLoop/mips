.text
.globl  main
# 101
main:
  ori     $t0, $zero, 0x01    # write 1 bit to $t0
         
  sll   $t1, $t0,     1
  or    $t1, $t0, $t1   # 0011 in $t1   n 

  sll    $t2, $t1, 2    # $t2 1100
  or    $t2,  $t1, $t2  # $t2 1111

  sll   $t1, $t2, 4     # $t1 11110000
  or    $t2, $t2, $t1   # $t2 11111111

  sll   $t1, $t2, 8     # $t1 1111111100000000
  or    $t2, $t1, $t2   # $t2 1111111111111111

  sll   $t1, $t2, 16    # $t1 1111111111111111 0000000000000000
  or    $t1, $t1, $t2

