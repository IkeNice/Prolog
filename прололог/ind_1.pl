has([X|_],X).
has([_|Y],Z):-has(Y,Z).

kol(X,Y,T):-kols(X,Y,T,0).
kols([],_,T,T):-!.
kols([X|Y],X,R,T):-!,(T1 is T+1),kols(Y,X,R,T1).
kols([_|Y],X,R,T):-kols(Y,X,R,T).

dele(X,L1,L2):-del(X,L1,L2,[],[]).

del([],L1,L2,L1,L2):-!.
del([X|Y],LL1,LL2,L1,L2):-
    not(has(L1,X)),!,
    kol([X|Y],X,T),del(Y,LL1,LL2,[X|L1],[T|L2]).
del([_|Y],LL1,LL2,L1,L2):-del(Y,LL1,LL2,L1,L2).

reverse(X,Y):-reverse(X,[],Y).
reverse([],Y,Y):-!.
reverse([X|Y],Z,T):-reverse(Y,[X|Z],T).
