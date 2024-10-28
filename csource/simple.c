/* simple.c */

// no main function as this gets compiled to an object file for linking with 
// nim's code

// this is then later called from simple.nim
int add(int a, int b)
{
    return a + b;
}
