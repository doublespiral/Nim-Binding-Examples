/* autobind.h */
#ifndef AUTOBIND_H // include guard
#define AUTOBIND_H

// if this isnt defined, your c compiler would ignore this
//
// this is just to give an example of what you can do with the define option in
// the importc macro provided by futhark
#ifdef DEFINED_WITH_FUTHARK

void prefixed_message(void);

struct prefixed_ExampleStruct
{
    int prop;
};


#endif // DEFINED_WITH_FUTHARK

#endif // AUTOBIND_H