/*
lab-4.cpp

March 20, 2022
Lisa Lehrman
CS21 Lab #4

*/

void exercise1()
{
        int a = 0;
        int b = 0;
        if (a <= b)
        {
                b = 10;
        }
}

void exercise2()
{
        int a = 0;
        int b = 0;
        if (a < b)
        {
                b = 10;
        }
        else
        {
                a = 20;
        }
}

void exercise3()
{
        int a, b;
        a = 0;
        b = 0;
        while (a < 10)
        {
                b += a;
                a++;
        }
}

void exercise4()
{
        int a = 0;
        int b = 0;
        do
        {
                b += a;
                a++;
        } while (a < 10);
}

void exercise5()
{
        int b = 0;
        for (int a = 0; a < 10; a++)
        {
                b += a;
        }
}

int main()
{
        exercise1();
        exercise2();
        exercise3();
        exercise4();
        exercise5();

        return 0;
}