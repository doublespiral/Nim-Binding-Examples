# Nim-Binding-Examples
Example bindings for nim. If you found this repo useful, consider giving it a star!

## Build Instructions:
- To build the futhark example, uncomment the lines in the nimble file
```bash
nimble build
```

### Manual Building:
```bash
gcc -x c -c csource/simple.c -o csource/simple.o
nim --passL:"-L. -l:csource/simple.o" c source/simple.nim

./source/simple

rm source/simple csource/simple.o
```

## C Type Equivalents 
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
