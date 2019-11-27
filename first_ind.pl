% есть заданный список, нужно во второй список добавить все
% элементы из первого списка без повторений
%

unique([],[]).
unique([H|T],L):- member(H,T), unique(T,L),!.
unique([H|T],[H|L]):-unique(T,L).

count([],_,0).
count([X|T],X,Y):- count(T,X,Z), Y is Z+1.
count([X1|T],X,Z):- X1 \= X,count(T,X,Z).

countAll(List,C):-
    unique(List,L1),
    member(X,L1),
    count(List,X,C).

howMuch([],[],0).
howMuch([X|Y],L2,X):-howMuch(Y,L2,X).

result(List,L1,L2):-unique(List,L1).
