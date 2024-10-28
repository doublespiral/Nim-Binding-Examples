# Package

version       = "0.1.0"
author        = "helix"
description   = "A project that provides several examples for nim bindings for other languages"
license       = "MIT"
srcDir        = "source"
bin           = @["simple", "advanced", "lol"]
binDir        = "built"

const csource = "csource"


# Dependencies

requires "nim >= 2.2.0"
