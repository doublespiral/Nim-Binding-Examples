import os

const cmodule = "examples"/"simple"/"csource"/"module.o"
{.passL: "-L. -l:" & cmodule.}

proc add(a, b: cint): cint {.importc: "add".}

when is_main_module:
    echo add(210, 210)