#ifndef MODULE_H // include guard, 
#define MODULE_H // prevents copies in generated c code

/* simple examples */

// prints "Hello from C!\n"
void hello(void);

// adds integers a and b
int add(int a, int b);



/* complex examples */

struct RentableStruct
{
    int sqft;
    float rent_monthly;
    char* address;
};

typedef struct RentableStruct Rentable;

// prints the properties of a Rentable
void print_rentable(Rentable* apartment);

// concats an array of strings into one
char* concat_strings(char** strings, int string_count);

// frees the concatted string
void dealloc_string(void* string);

#endif //MODULE_H