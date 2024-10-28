/* advanced.c */

#include <stdio.h>
#include <stdlib.h>

// this header contains our `Rentable` struct, exists as nim needs this info too
#include "advanced.h"

// simple examples //

void hello()
{
    puts("Hello from C!");
}


// advanced examples //

void print_rentable(struct Rentable *apartment)
{
    puts("Your rentable:");
    printf("Square feet: %d\n", apartment->sqft);
    printf("Rent per month: %.2f\n", apartment->rent_monthly);
    printf("Address: %s\n", apartment->address);
}


char *concat_strings(char **strings, int string_count)
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

void dealloc_string(void *string)
{
    free(string);
}