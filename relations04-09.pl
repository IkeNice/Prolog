/*********************************/
/*********************************/
/********** 04.09.2019 ***********/
/*********************************/
/*********************************/

parent(tom, ann). % ��������� �������� - �������. ��� �������� ���
parent(tom, mike).
parent(mary, mike).
parent(mike, sue).
parent(mike, john).
parent(mike, nick).
parent(john, jane).
parent(john, jim).
parent(sue, bob).
parent(sue, mark).
man(tom).
man(mike).
man(john).
man(nick).
man(jim).
man(bob).
man(mark).
woman(mary).
woman(ann).
woman(sue).
woman(jane).

maried(kevin, sue).

grandchild(X,Y) :- parent(Z,X), parent(Y,Z).  % ��������� ����/������ - �������/������� X ����/������ Y. Z �������� � � Y �������� Z
hasChild(X) :- parent(X,_). % X ����� �������?
isSister(X,Y):- woman(X), parent(Z,X), parent(Z,Y), dif(X,Y). % X ������ Y?
ancestor(X,Y) :- parent(X,Y). %X ������ Y
% ancestor(X,Y) :- parent(Z,Y), ancestor(X,Z). % �������� �� 2-��
% ����������
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
patriarch(X) :- parent(X,_), not(parent(_,X)).
isCousin(X,Y) :- man(Y),grandchild(X,Z),grandchild(Y,Z), dif(X,Y),parent(R,X), parent(Q,Y), dif(Q,R),parent(Z,Q), parent(Z,R).

% ���������� �������� �������� ��������������? ����� �� �������?

isRelatives(X,Y) :- ancestor(Z,X), ancestor(Z,Y).

mariedOnSister(X,Y) :- isSister(Y,Z), maried(X,Z).



/*********************************/
/*********************************/
/********** 11.09.2019 ***********/
/*********************************/
/*********************************/




% ���������

%fact(1,1) :- !.
%fact(X,Y) :- X1 is X-1, factil(X1,Y1), Y is Y1*X.

/*
facti(X,Y) :- factn(X,Y,1,1).
factn(X,Y,I,P) :- I =< X, !, P1 is P*I, I1 is I+1,factn(X,Y,I1,P1).
factn(_,P,_,P).
*/

facti(X,Y) :- factn(X,Y,1,1).
factn(X,P,X,P) :- !.
factn(X,Y,I,P) :- I1 is I+1, P1 is P*I1, factn(X,Y,I1,P1).


% ���������
/*
fib(1,1) :- !.
fib(2,1) :- !.
fib(X,Y) :- X1 is X-1, fib(X1,Y1), X2 is X-2, fib(X2,Y2), Y is Y1+Y2.
*/

fibi(X,Y) :- fibn(X,Y,1,0,1).
fibn(X,P,X,_,P) :- !.
fibn(X,Y,I,T,P) :- P1 is T+P, I1 is I+1, fibn(X,Y,I1,P,P1).

%
% ���������� ����� ��������
%

nod(A,0,Y) :- Y is A, !.
nod(0,A,Y) :- Y is A, !.
nod(A,B,Y) :- A >= B, !, X is A-B, nod(B,X,Y).
nod(A,B,Y) :- X is B-A, nod(A,X,Y).

%
% ���������� ����� �������
%
%
% ����� min, max, ����� ���������
%

% min
min(A,B,C):- A>B, C is B, !.
min(A,B,C):- A<B, C is A, !.

% max
max(A,B,C):- A>B, C is A, !.
max(_,B,C):- C is B, !.

%
cmn(N,M,X):- fact(N,N1), fact(M,M1), (NM is N-M), fact(NM,NM1), (X is (N1/(M1*NM1))).








/*********************************/
/*********************************/
/********** 18.09.2019  **********/
/*********************************/
/*********************************/



%����� ��������� ������
sum([], 0):-!.
sum([X|Y],Z):-sum(Y,Z1), Z is Z1+X.



% ����� i-�� ��������
find(0,[X|_],X):-!.
find(I,[_|Y],Z):- I1 is I-1, find(I1,Y,Z).



% � �������� ��������� ������
lmember(X,[X|_]).
lmember(X,[_|Y]):-lmember(X,Y).

% ����������� ������� ������
minList(X,[X]):- !.
minList(X,[Y|Z]):- minlist(X1,Z), Y=<X1,!, X is Y.
minList(X,[_|Z]):- minlist(X,Z).


% ����������� ������

myreverse(X,Y):- myreverse(X,[],Y).
myreverse([],Y,Y):-!.
myreverse([X|Y],Z,T):-myreverse(Y,[X|Z],T).


% ������ �������� ������� ������� ������

isBegin([],_):-!.
isBegin([X|Y],[X|Z]):-isBegin(Y,Z).


% ������ �������� ���������� ������� ������

subList(X,Y):-isBegin(X,Y),!.
subList(X,[_|Z]):-subList(X,Z).



% ������� �� ������ ��� �������� ��������

deleteElem([],_,[]):-!.
deleteElem([X|Y],X,Z):-deleteElem(Y,X,Z),!.
deleteElem([X|Y],T,[X|Z]):-deleteElem(Y,T,Z).



% ������� ��� ������

%append([],X,X):-!.
%append([X1|Y1],Z,[X1|Y2]):-append(Y1,Z,Y2).


% 1) �������� ��������, ������� �������, ���� � ������ ��� �������������
% ���������
% 2) ���������� ��� ��������������� ������, � ���� ���������������
% 3) ����� ������





/*********************************/
/*********************************/
/********** 25.09.2019  **********/
/*********************************/
/*********************************/


%
% bubbleSort
%

swap([X,Y|Z],[Y,X|Z]):- X>Y,!.
swap([X|Y],[X|Y1]):- swap(Y,Y1),!.

bubbleSort(Q,W):- swap(Q,X),!,bubbleSort(X,W).
bubbleSort(X,X):-!.

%
% Hoare quick sort
%


/*********************************/
/*********************************/
/********** 02.10.2019  **********/
/*********************************/
/*********************************/

%
% ����� i-�� �������, ������� � 1
%

findElem(1,X,[X|_]):-!.
findElem(I,Z,[_|Y]):- I1 is I-1, findElem(I1,Z,Y).

%
% ��������� �� X ����� �� Y
%
%leftSide(X,Y,[X,Y|_]).
%leftSide(X,Y,[_|T]):- leftSide(X,Y,T).

leftSide(X,Y,T):-append(_,[X,Y|_],T).



% ������ ��������� %

%
% ��������������, �������, ��������, ��������, ����
%

%near(X,Y,T):-leftSide(X,Y,T).
%near(Y,X,T):-leftSide(Y,X,T).

einstain(Houses):- Houses = [_,_,_,_,_],
    findElem(1, [nordwegian,_,_,_,_], Houses),
    findElem(3, [_,milk,_,_,_], Houses),

    leftSide([_,_,_,_,green], [_,_,_,_,white], Houses),

    near([_,_,malboro,_,_], [_,_,_,cat,_], Houses),
    near([_,_,_,horse,_], [_,_,dunHill,_,_], Houses),
    near([nordwegian,_,_,_,_], [_,_,_,_,blue], Houses),
    near([_,_,malboro,_,_], [_,water,_,_,_], Houses),

    lmember([englishman,_,_,_,red], Houses),
    lmember([swedish,_,_,dog,_], Houses),
    lmember([danish,tea,_,_,_], Houses),
    lmember([_,coffee,_,_,green], Houses),
    lmember([_,_,pallMall,bird,_], Houses),
    lmember([_,_,dunHill,_,yellow], Houses),
    lmember([_,bear,winField,_,_], Houses),
    lmember([german,_,rotMans,_,_], Houses).



/****************************************/
/*********** Enstauin *******************/
/****************************************/

%Member (X,List)
%member(X,[]):-false,!.
%lmember(X,[X|_]).
%lmember(X,[_|T]):-lmember(X,T).

%i elem(I,List,res) from 1
%elem(I,Res,[]):-false,!.
findi(1,H,[H|_]):-!.
findi(I,Res,[_|T]):-I1 is I - 1,findi(I1,Res,T).

% X ����� Y
%isLeft(X,Y,List).
%isLeft(X,Y,[X,Y|_]):-!.
%isLeft(X,Y,[Z|T]):-X\=Z,!,isLeft(X,Y,T).
%isLeft(X,Y,[Z,S|T]):-Y\=S,isLeft(X,Y,[S|T]).
isLeft(X,Y,T):-append(_,[X,Y|_],T).

near(X,Y,T):-append(_,[X,Y|_],T).
near(X,Y,T):-append(_,[Y,X|_],T).

%�������� ����� � ������ ��
enstain(Houses):-Houses = [_,_,_,_,_],
    %������� ����� � ������ ����
    findi(1,[nord,_,_,_,_],Houses),
    %����� �� �������� ���� ���� ������
    findi(3,[_,milk,_,_,_],Houses),
    %���������� ����� � ������� ����
    member([eng,_,_,_,red],Houses),
    %���� ������ ������
    member([swid,_,_,dog,_],Houses),
    %�������� ���� ���
    member([dat,tea,_,_,_],Houses),
    %������� ��� ����� ����� ������
    isLeft([_,_,_,_,green],[_,_,_,_,white],Houses),
    %����� �������� ���� ���� ����
    member([_,coffee,_,_,green],Houses),
    %�����, ������� palmal, ������ �����
    member([_,_,palmar,bird,_],Houses),
    %����� �� ������� ���� ����� danhell
    member([_,_,danhell,_,yellow],Houses),
    %��������� malboro ����� ����� ����, ��� ������ �����
    near([_,_,malboro,_,_],[_,_,_,cat,_],Houses),
    %�������, ������� ������ ������, ����� ����� � ����������� danhell
    near([_,_,_,hourse,_],[_,_,danhell,_,_],Houses),
    %��������� winfield ���� ����
    member([_,beer,winfield,_,_],Houses),
    %�������� ����� ����� �������� ����
    near([nord,_,_,_,_],[_,_,_,_,blue],Houses),
    %����� ����� rodmance
    member([ger,_,rodmance,_,_],Houses),
    %��������� malboro ����� �� ������� � ���������, ������� ���� ����
    near([_,_,malboro,_,_],[_,water,_,_,_],Houses).


% ���� ���� �����. ��������������, �������, ��������, ��������, ���� �
% ������ ���� ������. ������ - � ���� �����
%
/****************************************/
/****************************************/
/****************************************/




/*********************************/
/*********************************/
/********** 09.10.2019  **********/
/*********************************/
/*********************************/

%
% ������� ������ 3 ����, � ����� ������
%

pr3(X):-string_concat(X,", ",Z), write(Z), write(Z), write(Z),
    string_length(X,L), write(L).

%
% ������� ������, ��������� � ������� �������
%

firstElem(X) :- sub_string(X, 0, 1, _ ,R),
    write(R).

lastElem(X) :- string_length(X,L), L1 is L-1,
    sub_string(X, L1, 1, _ ,R),
    write(R).

middleElem(X) :- string_length(X,L),
    Y is L mod 2, Y \= 0,
    L1 is L div 2,
    sub_string(X, L1, 1, _, R),
    write(R).

firstLastMiddle(X) :- string_length(X, L),
    Y is L mod 2, Y \= 0,
    firstElem(X), middleElem(X), lastElem(X),!.

firstLastMiddle(X) :-  string_length(X, L),
    Y is L mod 2, Y = 0,
    firstElem(X), lastElem(X),!.

%
% ������� ������� ��������� ���������� ��������
%

posOfLast(X) :-sub_string(X,_,1,0,S),
    sub_string(X, Y, _, _, S),
    Z is Y+1, write(Z).


%
% ������� � ������ ��� ��������� "abc"
%

delABC(X) :- split_string(X,"abc","abc",R),
    atomics_to_string(R,L),
    write(L).

%
% ������� � ������ ��� ������ �������
%

delSpace(X) :- split_string(X," "," ",R),
    atomics_to_string(R," ",L),
    write(L).



/*********************************/
/*********************************/
/********** 23.10.2019  **********/
/*********************************/
/*********************************/

/*
write(x) - ����� � �������/����

writeln(x) - ����� � ����� ������

tab(N) - ����� ������� �� N �������

read(X) - ��������� ������� �� '.'
readln(X) - ��������� ������� �� ����� ������, �������� ������ ���� � ��������� ��������, ����� ������������ ��� ������ ����
get_char(�) - ��������� �� ������ ���� ������
see('NameOfFile') -���������� ���� ��� ������, ������������� ��� ��� ������� ����� �����
seen - ��������� ���� � ����� ������ ���� ����� �������������� � ����������
tell('FileName') - ��������� ���� ��� ������
told - ��������� ��������� �������� ����
*/



%
% FILES
%

run:- see('C:/Users/hieut/OneDrive/���������/prolog/test.txt'),
    readln(X), write(X).

fileToList(F,L):- seen, see(F), readFile([],[],L), seen.
readFile(T,R,L):- get0(X), (X<0, (T=[],L=R; name(T1,T),
    append(R,[T1],L)),!;
    ( X=32; X=10; X=13  ),
    ( T =[],readFile(T,R,L),name(T1,T), append(R,[T1],R1),
    readFile([],R1,L)),!;
    X>0, append(T,[X],T1),readFile(T1,R,L),!).


% � ����� ��� ������ ���� ����������� �������.
% ����� �������� ���� �� ������� ��� ����������.

fileToListS(F,L):- seen, see(F), readFile([],[],L), seen,
    atomics_to_string(L," ",R), writeln(R),
    split_string(R,".","",L1), writeln(L1).




/*********************************/
/*********************************/
/********** 30.10.2019  **********/
/*********************************/
/*********************************/

%
% ���� ������
%

% asserta(X). /*�������� � ������*/
% assertz(X). /*�������� � �����*/

% retract - � trace �������� Enter, ����� ������� ������,
% ������ - ����� ������� ��� ���������

% findall(�������, ����, ������) - ����� ���� ���������
% � ��������� � ������

% ���������
:- dynamic fact/2.

fact(1,1):-!.
fact(X,Y):- X1 is X-1, fact(X1,Y1), asserta(fact(X1,Y1)),
    Y is Y1*X, !.

% ����������
:- dynamic fibon/2.

fibon(1,1) :- !.
fibon(2,1) :- !.
fibon(X,Y) :- X1 is X-1, fibon(X1,Y1),asserta(fibon(X1,Y1)),!,
    X2 is X-2,
    fibon(X2,Y2),asserta(fibon(X2,Y2)),
    Y is Y1+Y2, !.

%
% ���� ������ ���������
%

student("������", "25.04.1990","89501234567").
student("�������", "02.03.1990","89621232567").
student("�������", "05.06.1990","89301234547").
student("������", "25.05.1990","89601234555").

:- dynamic studentd/3.

myassert:-student(X,Y,Z), assertz(studentd(X,Y,Z)), fail.
myassert:-!.






%
% ��
% ������� ������� �� ����
%



/*********************************/
/*********************************/
/********** 06.11.2019  **********/
/*********************************/
/*********************************/

%
% �������
%

create_tree(X, tree(X, empty, empty)).
insert_left(X,tree(A,_,B),tree(A,X,B)).
insert_right(X,tree(A,B,_),tree(A,B,X)).

tr:- create_tree(5,X), create_tree(6, Y), insert_right(Y,X,Z),
    write(Z),tree_member(7,Z).
%
% �������� ������ ������
%
tree_member(X,tree(X,_,_)):-!.
tree_member(X,tree(_,L,_)):-tree_member(X,L),!.
tree_member(X,tree(_,_,R)):-tree_member(X,R),!.

%
% ������� ������
%

tree_height(empty,0):-!.
tree_height(tree(_,L,R),D):-
    tree_height(L,D1),tree_height(R,D2),
    max(D1,D2,M), D is M+1.

tr_h:- create_tree(5,X), create_tree(6, Y), insert_right(Y,X,Z),
    tree_height(Z,A),write(A).

%
% ���������� ��������� ������
%

tree_elem(empty, 0):-!.
tree_elem(tree(_,L,R),D):-
    tree_elem(L,D1), tree_elem(R,D2), D is D1 + D2 + 1.

tr_e:-create_tree(5,X),create_tree(6, Y), insert_right(Y,X,Z),
    tree_elem(Z,A), write(A).

%
% ���������� ������
%

tree_sort(X,Y):- sort_tree(X,Tree),tree_list(Tree,Y).
sort_tree([],empty):-!.
sort_tree([X|Y],Tree):-sort_tree(Y,Tree1),ins(X,Tree1,Tree).
ins(X,empty,tree(X,empty,empty)):-!.
ins(X,tree(Y,L,R),tree(Y,L,R1)):-X>=Y,ins(X,R,R1),!.
ins(X,tree(Y,L,R),tree(Y,L1,R)):-ins(X,L,L1).
tree_list(empty,[]).
tree_list(tree(X,L,R),List):-
    tree_list(L,D1), tree_list(R,D2), append(D1,[X|D2],List).

%
% ��������� ���������� ��������
%

% ��������
%count_list(_,empty,empty,1):-!.
%count_list(X,tree(_,L,R),A):-
%    count_list(L,A1), count_list(R,A2).


/*********************************/
/*********************************/
/********** 13.11.2019  **********/
/*********************************/
/*********************************/

/* ����� */

% ������� ����� ������. ������, ����, ����� �����
p(1,2,1).
p(1,3,2).
p(2,4,1).
p(3,4,2).
p(4,5,3).

% ����� ���� ���� ����� ����� ���������
find_all(X,G,Bag):-post_it(X,G),gather([],Bag).
post_it(X,G):-call(G),asserta(data999(X)),fail.
post_it(_,_).
gather(B,Bag):-data999(X),retract(data999(X)),
    gather([X|B],Bag),!.
gather(B,B).

% ����� ���� � �����. �� ����� �������, � �����, ����
%search(X,Y,[X,Y]):-p(X,Y,_);p(Y,X,_),!.
%search(X,Y,[X|T]):-(p(X,Z,_);p(Z,X,_)),search(Z,Y,T),
%    not(member(X,T)),!.
% search(X,Y,T):-(p(X,Z,_);p(Z,X,_)),search(Z,Y,T).

%
% ����� ������� ����� � ������������ ��������
% (���������� ����� �� ����)
%



/*********************************/
/*********************************/
/********** 27.11.2019  **********/
/*********************************/
/*********************************/

% 961(970)3151

/*
edge(1,2).
edge(1,4).
edge(1,3).
edge(2,4).
edge(3,4).
edge(3,5).
edge(4,5).
edge(5,6).
*/
% ������ ���� �� � � Y
search(X,Y,[X,Y]):-edge(X,Y);edge(Y,X),!.
search(X,Y,[X|T]):-(edge(X,Z);edge(Z,X)),
    search(Z,Y,T), not(member(X,T)),!.
search(X,Y,T):- (edge(X,Z); edge(Z,X)), search(Z,Y,T).

% ��� ���� �� X � Y
path(X,Y,T):-path(X,Y,[],T).
path(X,Y,Seen,[X,Y]):- \+memberchk(X,Seen),
    (edge(X,Y);edge(Y,X)).
path(X,Z,Seen,[X|T]):- \+memberchk(X,Seen),
    (edge(X,Y);edge(Y,X)),path(Y,Z,[X|Seen],T),
    \+memberchk(X,T).


% ������ ���� �������� ���������
children(1,[2,3,4]).
children(2,[1,4]).
children(3,[1,4,5]).
children(4,[2,3,6]).
children(5,[3,4,6]).
children(6,[5]).

%
% ����� ����� ������� ���� � �����,
% ������� ����� �������� ���������
%

path_first(Start, Answer):- path_start([Start],Answer),!.
path_start([X|T],Y):-children(X,C), member(Z,C),
    \+memberchk(Z,[X|T]), path_start([Z,X|T],Y).
path_start(X,Y):-reverse(X,Y).




/*********************************/
/*********************************/
/********** 04.12.2019  **********/
/*********************************/
/*********************************/

% ����� ������

child(1,[2,3]).
child(2,[1,3]).
child(3,[1,2,4]).
child(4,[3,5]).
child(5,[4,6]).
child(6,[8,7]).
child(7,[6,8]).
child(8,[6,7]).

%
%  findall - ������ ����� �/�,
%  ��� � ��� �������,
%  � - ������� �� �
%  � ����� ���������� � �
%  � - ������ ���� ����� �����
%  clear ����� ������� �� � �������, �������� Y
%

findbr(R):-findall(A/B,(child(A,L),
           member(B,L)),X),clear(X,Y),
           candel(Y,R).

%
% candel ������� ���, ��� ����� �������
%

candel([],[]):-!.
candel([A/B|T],P):-candel(T,P1),!,(mydel(A/B),
                   P=[A/B|P1];P=P1).
%
% findall ����� ��� ������ ���� ������ ���������
% ��������������� ������� 2
%
% setof M1 - ������ � ��� ����������
%

mydel(A/B):-
    findall(L,child(L,_),[H|T]),
    findall(G,(member(G,T),pathr(A/B,H,G,[H],_)),M),
    setof(Z,member(Z,M),M1),
    length(T,S1),
    length(M1,S2),
    S1\=S2.


pathr(_,X,X,P,P).
pathr(X/Y,A,B,T,R):-child(A,L),
    member(Z,L),
    not(member(Z,T)),
    A/Z\=X/Y,A/Z\=Y/X,
    pathr(X/Y,Z,B,[Z|T],R).


clear([],[]):-!.
clear([X/Y|T],R):-clear(T,R1),
    ((member(X/Y,R1);member(Y/X,R1)),
    R=R1;
    R=[X/Y|R1]),!.



/*********************************/
/*********************************/
/********** 11.12.2019  **********/
/*********************************/
/*********************************/

edge(1,2).
edge(2,3).
edge(2,4).
edge(3,5).
edge(4,5).
edge(4,6).
edge(5,6).
edge(5,7).

%
% ������� �����
%

diam(N):- findall(V,(edge(V,_);edge(_,V)),T),
    findall(P,(member(A,T),member(B,T),A\=B,
               findminpath(A,B,P)),L),
    maxpath(L,N).
findminpath(A,B,P):-findall(X,findpath(A,B,X),L),minpath(L,P),!.
findpath(A,B,P):-findpath(A,B,[A],P).
findpath(A,A,P,P).
findpath(A,B,T,P):-(edge(A,Z);edge(Z,A)), not(member(Z,T)),
    findpath(Z,B,[Z|T],P).
minpath([A],A):-!.
minpath([H|T],P):-minpath(T,P1),!,length(H,N), length(P1,M),
    (   N<M,P=H;P=P1).
maxpath([A],A):-!.
maxpath([H|T],P):-maxpath(T,P1),!,length(H,N), length(P1,M),
    (   N>M,P=H;P=P1).
