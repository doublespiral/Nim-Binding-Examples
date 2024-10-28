#[ simple.nim ]#

# imported for the `/` proc which is used for standardizing file paths accros
# operating systems
import os

# tell nim where to find our c file so it can compile and link for us
# https://nim-lang.org/docs/manual.html#implementation-specific-pragmas-compile-pragma
{.compile: "csource"/"simple.c".}

# match the proc's signature with the c function signature to not segfault :)
#
# the function name in the importc pragma needs to be *exactly the same* as how 
# its defined in the c source, however the proc's name can be anything
proc c_add(a, b: cint): cint {.importc: "add".}

when isMainModule:
    # Finally, we can call our c function from nim!
    echo c_add(9, 10)