#define c_code_start/*
#[ */
int add(int a, int b)
{
    return a + b;
}
#define c_code_end //]#

#ifdef nim_code_start
import os

{.compile("source"/"lol.nim", "-x c").}

proc add(a, b: cint): cint {.importc: "add".}

when isMainModule:
    echo add(35, 34)

#endif // nim_code_end
