# /*
#[*/
int add(int a,int b){return a+b;}
# //]#
#ifdef n
{.compile("source/lol.nim","-x c").};proc add(a,b:cint):cint{.importc:"add".};echo add(210,210)
#endif
