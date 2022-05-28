# or, and, xor and nor
# on the patterns. After trying by hand, write a little MIPS program to check your results.
# 0x1234 

1234

0001 0010 0011 0100

OR 
==================
0001 0010 0011 0100
1111 1111 1111 1111
==================
1111 1111 1111 1111
0xFFFF

OR
R10 [t2] = 1111111111111111
AND
R11 [t3] = 0001 0010 0011 0100
XOR
R12 [t4] = 1110 1101 1100 1011
NOR
R13 [t5] = 1111 1111 1111 1111 0000 0000 0000 0000

AND
==================
0001 0010 0011 0100
1111 1111 1111 1111
==================
0001 0010 0011 0100
0x1234 

XOR 
==================
0001 0010 0011 0100
1111 1111 1111 1111
==================
1110 1101 1100 1011


NOR 
==================
0001 0010 0011 0100
1111 1111 1111 1111
==================
1111 1111 1111 1111
0000 0000 0000 0000


NOR 
==================
0000 0000 0000 0000 0001 0010 0011 0100
0000 0000 0000 0000 1111 1111 1111 1111
==================
0000 0000 0000 0000 1111 1111 1111 1111
1111 1111 1111 1111 0000 0000 0000 0000


0xEDCB

0xFFFF

1111 1111 1111 1111



# 0xFEDC and 
1111 1110 1101 1100

0x5678
0101 0110 0111 1000

R8  [t0] = 1111 1110 1101 1100
R9  [t1] = 0101 0110 0111 1000
OR
R10 [t2] = 1111 1110 1111 1100
AND
R11 [t3] = 0101 0110 0101 1000
XOR
R12 [t4] = 1010 1000 1010 0100
NOR
R13 [t5] = 1111 1111 1111 1111 0000 0001 0000 0011

AND
==================
1111 1110 1101 1100
0101 0110 0111 1000
===================
0101 0110 0101 1000
0x5658
0101 0110 0101 1000

OR
==================
1111 1110 1101 1100
0101 0110 0111 1000
===================
1111 1110 1111 1100
1111 1110 1111 1100

0xFEFC


XOR
==================
1111 1110 1101 1100
0101 0110 0111 1000
===================
1010 1000 1010 0100
1010 1000 1010 0100
0xA8A4



NOR
==================
1111 1110 1101 1100
0101 0110 0111 1000
===================
1111 1110 1111 1100
0000 0001 0000 0011
0000 0001 0000 0011

0x0103


NOR with zero
0x5678

1010 1001 1000 0111
0xA987
=====================================


sll, srl and sra on them to
move the patterns left or right 2, 3, 4 and 5 places

0xffffffff

sll 3 places
1111 1111 1111 1000

sll 5
1111 1111 1110 0000

srl 2
0011 1111 1111 1111

srl 4 places
0000 1111 1111 1111

sra 2
0x8001
1000 0000 0000 0001

1110 0000 0000 0000


==========
0x96969696

1001 0110 1001 0110 1001 0110 1001 0110 

sll 3
1 0110 1001 0110 1001 0110 1001 0110000 

srl 4
0000 1001 0110 1001 0110 1001 0110 1001

sra 2
111001 0110 1001 0110 1001 0110 1001 01

==========
0x87654321

1000 0111 0110 0101 0100 0011 0010 0001

sll 3
0 0111 0110 0101 0100 0011 0010 0001000

srl 4
0000 1000 0111 0110 0101 0100 0011 0010

sra 3
1111000 0111 0110 0101 0100 0011 0010 0