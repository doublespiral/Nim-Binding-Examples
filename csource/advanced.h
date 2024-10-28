/* advanced.h */

#ifndef MODULE_H // include guard, 
#define MODULE_H // prevents copies in generated c code

// simple examples //

void hello(void);


// advanced examples //

// the only techinically required data*
struct Rentable
{
    int sqft;
    float rent_monthly;
    char* address; // string of the address
};

void print_rentable(struct Rentable *apartment);

char *concat_strings(char** strings, int string_count);

void dealloc_string(void *string);

#endif //MODULE_H