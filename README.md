# Nim-Binding-Examples
Example bindings for nim

# Build Instructions:
- To change which example gets built, see .nimble file
```bash
nimble build
./built/main
```

# C Type Equivalents 
```nim
# number types #
bits |     c types | nim proper equivalents
-----+-------------+-----
   8 |     uint8_t | cchar
   8 |      int8_t | cschar

  16 |    uint16_t | cushort
  16 |     int16_t | cshort

  32 |    uint32_t | cuint, culong
  32 |     int32_t | cint, clong

  64 |    uint64_t | culonglong
  64 |     int64_t | clonglong

  32 |       float | cfloat
  64 |      double | cdouble
  64 | long double | clongdouble

# misc types #
char *  | cstring
char ** | cstringArray

void *  | pointer

struct  | object
```
