/**
 * Exercise 1 – Conversion to lower case
Declare a string in the data section, for example:
.data
string: .asciiz "ABCDEFG"
Write a program that prints the string, converts the string
to all lower case characters and then prints the
string again. Do this conversion by adding 0x20 to each
character in the string. (See Appendix B to
figure out why this works.) Declare an .asciiz string holding "\n" and
print it after the strings to get to the next line.
Assume that the data comprises only uppercase alphabetical characters, with no spaces or punctuation.
*/
#include <stdio.h>
#include <string.h>
#include <iostream>

using namespace std;
//  std::cout << " " << inputString[i] << endl;
int main()
{
        char inputString[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', '\0'};
        int count = 0;
        std::cout << " " << inputString << endl;
        while (inputString[count] != '\0')
        {
                inputString[count] += 0x20;
                count++;
        }
        std::cout << " " << inputString << endl;

        return 0;
}

// char*›