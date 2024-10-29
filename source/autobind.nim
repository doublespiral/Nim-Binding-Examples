#[ autobind.nim ]#

import os
import strutils

import futhark
# https://github.com/PMunch/futhark
#
# used to automatically generate bindings for our nim program
# NOTE: You may run into some issues with futhark using an out-of-date output 
#       via cache, be sure to pay attention to the `Hint`s in the build log!

{.compile: ".."/"csource"/"autobind.c".}

# c bindings...

# remove `prefixed_` and replace it with `c_`. c libs will typically use the 
# name of the lib as a prefix to avoid collisions
# nim handles these cases better though
proc renameCb(symbol_name, symbol_kind: string, partof = ""): string = 
    return symbol_name.replace("prefixed_", "c_")


# the main macro futhark uses to generate our bindings
importc:
    # you can define any necessary compile time variables here
    # see csource/autobind.h for more
    define DEFINED_WITH_FUTHARK 

    # pass in a rename callback proc, in this case we use it to remove an
    # example prefix_
    renameCallback renameCb

    # the outputPath argument is used to export the bindindings to a different
    # file during compile time. This can be used for debugging and such but you
    # shouldnt really edit it. If you want to nimify the bindings just import
    # it to a different file and do it there
    #
    # in this case we dont do this and just have futhark output to this file so
    # we can later call the bindings without importing
    #outputPath "autobind_bindings.nim"

    # path to where futhark should be looking for headers
    path ".."/"csource" 

    # the header(s) we want futhark to generate bindings for
    "autobind.h" 


# NOTE: everything above is handled during compile time, this is why we can call
#       the bindings later on


# calling from nim...
when isMainModule:
    # the binded c function with the removed prefix
    #
    # NOTE: the LSP will NOT find this and throw an error. When compiled it will
    #       work just fine
    c_message()

    # as seen in the advanced.nim example, c structs are simply objects 
    #
    # futhark puts the type in front of certain symbols
    # https://github.com/PMunch/futhark?tab=readme-ov-file#hard-names-and-overrides
    var example_struct = struct_c_ExampleStruct(prop: 1)
    echo "Accessing the property: ", example_struct.prop
    
    example_struct.prop += 1

    echo example_struct.prop