not (A or B) = (not A) and (not B)
not (A and B) = (not A) or (not B),


const A = false;
const B = false;

!(A || B) == !A && !B

!(A && B) == !A || !B


882 // 
01001010
×
00010101


000000110111 0010
       ^^
       512
       256



## newMult.asm
## 
## Program to calculate 5*x - 74
##
## Register Use:
##  $8   x
##  $9   result

        .text
        .globl  main

main:
        ori      $8,   $0, 12           # put x into $8
        
        ori      $
$7
, $0,  5       # put 5 into $
$7

        
        mult     $
$7
, 
$8
      #  $
$7
 = 5x
        
        mflo     $
$7
               # $
$7
 = 5x
        
        addiu    $
$9
, $
$7
,-74   # $
-9
 = 5x - 74

## End of file





