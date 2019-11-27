eq([X|_],X).
eq([_|Y],Z):-eq(Y,Z).

teachers(T):-
    (T=[[_,morozov],[_,morozov],
        [_,tokarev],[_,tokarev],
        [_,vasilev],[_,vasilev]]),
    eq(T,[i,_]),eq(T,[a,_]),eq(T,[g,_]),
    eq(T,[f,_]),eq(T,[b,_]),eq(T,[m,_]),
    eq(T,[g,X1]),eq(T,[f,X2]),not(X1=X2),
    eq(T,[m,Y1]),eq(T,[b,Y2]),not(Y1=Y2),
    not(eq(T,[b,morozov])),
    eq(T,[b,Z1]),eq(T,[f,Z2]),not(Z1=Z2),
    not(eq(T,[b,tokarev])),
    not(eq(T,[f,tokarev])),
    not(eq(T,[m,morozov])),
    not(eq(T,[a,morozov])),
    eq(T,[m,X1]),eq(T,[a,X2]),not(X1=X2),!.
