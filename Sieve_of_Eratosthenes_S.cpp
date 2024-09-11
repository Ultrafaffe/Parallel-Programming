#include <stdio.h>
#include <stdbool.h>

int main()
{
    int Max = 10;
    bool numbers[Max + 1]; // true = prime

    for (int i = 0; i <= Max; i++)
    {
        numbers[i] = true;
    }

    numbers[0] = numbers[1] = false;

    for (int k = 2; k * k <= Max; k++)
    {
        if (numbers[k])
        {
            for (int j = k * k; j <= Max; j += k)
            {
                numbers[j] = false;
            }
        }
    }

    for (int i = 0; i <= Max; i++)
    {
        printf("index %d = %d\n", i, numbers[i]);
    }

    return 0;
}
