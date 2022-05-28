/**
 * # Declare a string in the data section such as:
# .data
# string: .asciiz "in a hole in the ground there lived a hobbit"
# Notice there are extra spaces in this string. Write a program that capitalizes the first letter of each word,
# so that after running your program the data will look like this:
# .data
# string: .asciiz "In A Hole In The Ground There Lived A Hobbit"
# Easy version (exercise 2): assume that the data comprises only lower case characters and spaces. There
# may, however, be several spaces in a row (as in "the ground" above). Be sure to capitalize only the
# first letter of the words

print ? 

it comes after a space character  - yes
it's the first characater in the string - yes
*/
#include<iostream>

int main()
{
        char inputString[] = "in a hole  in the    ground  there lived a hobbit";

        int count = 0;
        bool shouldCapitalize = true;
        while(inputString[count] != '\0')
        {
                if(inputString[count] == 32)
                {
                        shouldCapitalize = true;
                }
                if(inputString[count] >= 97 && inputString[count] <= 122 && shouldCapitalize)
                {

                        inputString[count] -= 0x20;
                        shouldCapitalize = false;
                }
                count++;

        }
        std::cout << inputString << std::endl;

        return 0;
}