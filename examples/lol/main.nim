#define c_code_start/*
#[ */
int add(int a, int b)
{
    return a + b;
}
#define c_code_end /*]# #*/

#ifdef nim_code_start
import os

const cmodule = "examples"/"lol"/"module.o"
{.passL: "-L. -l:" & cmodule.}

proc add(a, b: cint): cint {.importc: "add".}

when is_main_module:
    echo add(210, 210)

#endif // nim_code_end
