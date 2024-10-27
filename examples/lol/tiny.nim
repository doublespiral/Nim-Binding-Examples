# /*
#[*/
int add(int a,int b){return a+b;}
# /*]##*/
#ifdef n
{.passL:"-L. -l:examples/lol/module.o".};proc add(a,b:cint):cint{.importc:"add".};echo add(210,210)
#endif