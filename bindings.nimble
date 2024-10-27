# Package

version       = "0.1.0"
author        = "helix"
description   = "An example project for binding C libraries"
license       = "MIT"
binDir        = "built"
bin           = @["main"]


import os

# to see different examples change this to the directory of choice
const desired_example = "simple"

const source = "examples" / desired_example

srcDir = source


# Dependencies

requires "nim >= 2.2.0"


proc get_c_files(): (string, string) =
    if (desired_example == "lol"):
        let csource_path = source
        return(
            csource_path / "main.nim",
            csource_path / "module.o",
        )

    else:
        let csource_path = source / "csource"
        return(
            csource_path / "module.c",
            csource_path / "module.o",
        )

before build:
    echo "Compiling the C library..."

    const (csource, cout) = get_c_files()

    exec "cc -x c -c " & csource & " -o " & cout

    # to see the command to compile c manually uncomment:
    #echo "cc -x c -c " & csource & " -o " & cout

    echo "Finished. Building the nimble package..."


task clean_binaries, "Removes all the binaries":
    when not defined(unix):
        echo "This task doesnt support your OS (L Windows)"
        exit

    if fileExists("examples/simple/csource/module.o"):
        exec "rm examples/simple/csource/module.o"

    if fileExists("examples/advanced/csource/module.o"):
        exec "rm examples/advanced/csource/module.o"

    if fileExists("examples/lol/module.o"):
        exec "rm examples/lol/module.o"

    echo "Finished cleaning binaries"