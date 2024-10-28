#[ advanced.nim ]#

import os

{.compile: "csource"/"advanced.c".}

# c bindings...

# simple examples #

# in this case, we're passing nothing and returning nothing so there is no need 
# to nimify the interface
proc hello(): void {.importc: "hello".}


# advanced examples #

# here we dont *need* to assign it proper variables as the struct is being 
# imported from c, however we do as we access them later for our nim interface
type C_Rentable {.importc: "struct Rentable", header: ".."/"csource"/"advanced.h".} = object
        sqft: cint 
        rent_monthly: cfloat 
        address: cstring

proc c_printRentable(apartment: ptr C_Rentable): void {.importc: "print_rentable".}

# to be clear these examples are only used to show off the char** and void* types
proc c_concatStrings(strings: cstringArray, string_count: cint): cstring {.importc: "concat_strings".}
proc c_deallocString(string_ptr: pointer): void {.importc: "dealloc_string".}


# nim interface...
# this is not required but it is nice to interact with our nim code in a nim way

type Rentable = ref object 
        sqft: int 
        rent_monthly: float 
        address: string

proc printRentable(apartment: Rentable): void =
    # convert our nim Rentable into our c equivalent 
    var c_apartment = C_Rentable(
        sqft: cint(apartment.sqft),
        rent_monthly: cfloat(apartment.rent_monthly),
        address: cstring(apartment.address),
    )
    # call our c function
    c_printRentable(c_apartment.addr)

# this is so janky lol
proc concatStrings(strings: seq[string]): string =
    # get the string count and convert it to a cint
    let c_string_count = cint( strings.len() )

    # get our char** of our seq[string]
    let c_strings = allocCStringArray( 
        toOpenArray(strings, 0, strings.high) 
    )

    let c_concatted = c_concatStrings(c_strings, c_string_count)

    # convert our cstring into a string and set it to implicit result variable
    result = $c_concatted

    # remember to dealloc both our char* and our char** as to not cause a memory
    # leak
    deallocCStringArray( c_strings )
    c_deallocString( c_concatted )

    return result


# calling from nim...
when isMainModule:
    # simple examples #
    hello()

    echo "" # just for the new line :)

    # advanced examples
    let california_apartment = Rentable(
        sqft: 500, 
        rent_monthly: 7_500.50, 
        address: "123 Real Street"
    )

    printRentable(california_apartment)

    echo ""

    echo concatStrings(
        @["Concatted ", "from ", "C!"]
    )
    # btw you can just do this with "the" & "operator" 