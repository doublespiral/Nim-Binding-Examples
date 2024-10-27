import os

const cmodule = "examples"/"advanced"/"csource"/"module.o"
{.passL: "-L. -l:" & cmodule.}


#[ simple examples ]#
# no need to nimify as it doesnt take or return anything
proc hello(): void {.importc: "hello".}

# c bindings: 
proc c_add(a, b: cint): cint {.importc: "add".}

# nimified interface:
proc add(a, b: int): int =
    return c_add(cint(a), cint(b))



#[ complex examples ]#
type
    # c equivalent: 
    C_Rentable = object 
        sqft: cint
        rent_monthly: cfloat
        address: cstring

    # nimified interface:
    Rentable = ref object
        sqft: int 
        rent_monthly: float 
        address: string

# c bindings: 
proc c_printRentable(apartment: ptr C_Rentable): void {.importc: "print_rentable".}

# nimified interface:
proc printRentable(apartment: Rentable): void =
    var c_apartment = C_Rentable(
        sqft: cint(apartment.sqft),
        rent_monthly: cfloat(apartment.rent_monthly),
        address: cstring(apartment.address),
    )
    c_printRentable(c_apartment.addr)

# c bindings: 
proc c_concatStrings(strings: cstringArray, string_count: cint): cstring {.importc: "concat_strings".}

proc c_deallocString(string_ptr: pointer): void {.importc: "dealloc_string".}

# nimified interface
proc concatStrings(strings: seq[string]): string =
    let c_string_count = cint( strings.len() )

    let c_strings = allocCStringArray( 
        toOpenArray(strings, 0, strings.high) 
    )
    defer: c_strings.deallocCStringArray()

    let c_concatted = c_concatStrings(c_strings, c_string_count)
    defer: c_concatted.c_deallocString()

    return $c_concatted



# main
proc main(): void =
    # simple examples #
    hello()

    echo '\n', add(35, 34)

    # complex examples #
    let california_apartment = Rentable(
        sqft: 500, 
        rent_monthly: 7_500.50, 
        address: "123 Real Street"
    )

    echo ""
    printRentable(california_apartment)
    echo ""

    echo concatStrings(
        @["Concatted ", "from ", "C!"]
    )

    return

# entry
when is_main_module: main()
