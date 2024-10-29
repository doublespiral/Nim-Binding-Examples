# Package

version       = "0.1.0"
author        = "helix"
description   = "A project that provides several examples for nim bindings for other languages"
license       = "MIT"
srcDir        = "source"
bin           = @["simple", "advanced", "lol"]
binDir        = "built"


# Dependencies

requires "nim >= 2.2.0"

# You might have some issues with installing futhark
# clang is a requirement so if you dont have that on your system youll need to
# get it
#
# because of this its disabled by default, if you wish to enable it simply
# uncomment the lines below

#bin.add("autobind")
#requires "futhark"