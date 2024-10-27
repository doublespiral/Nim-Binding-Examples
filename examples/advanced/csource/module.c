#include <stdio.h>
#include <stdlib.h>

#include "module.h"


/* simple examples */

void hello()
{
    puts("Hello from C!");
}

int add(int a, int b)
{
    return a + b;
}



/* complex examples */

void print_rentable(Rentable *apartment)
{
    puts("Your rentable:");
    printf("Square feet: %d\n", apartment->sqft);
    printf("Rent per month: %f\n", apartment->rent_monthly);
    printf("Address: %s\n", apartment->address);
}

char* concat_strings(char** strings, int string_count)
{
    char* string = malloc(256*sizeof(char));
    string[255] = '\0';

    int i = 0;

    for (int current = 0; current < string_count; current++)
    {

        for (int j = 0; strings[current][j] != '\0'; j++)
        {
            string[i] = strings[current][j];

            i++;
        }
    }

    return string;
}

void dealloc_string(void* string)
{
    free(string);
}