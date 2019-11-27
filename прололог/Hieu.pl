%%%%%%%%%%%%%% �������������� ������� � 1. ������ %%%%%%%%%%%%%%
% ��� ���������� ������ ��������� ��� ������ L1 � L2,
% ��� �������� L1 ��� ��������������� �������� ��������� ������,% � ������� ������ L2 � ������� i ����������,
% ������� ��� ������� ������
% L1 � ����� ������� ����������� � ��������.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ������� �������� ������� �� ������
%
del(_,[],[]).
del(X,[X|Y],Z):- del(X,Y,Z).
del(X,[Y|L],[Y|L1]):- X \= Y, del(X,L,L1).

%��������� �������� ���� �������
%
delete_list([],[]).
delete_list([X|Y],[X|Z]):-del(X,Y,Z1),delete_list(Z1,Z).


% ����� ��������� ���� ��������� ������
count([],_,0).
count([X|T],X,Y):- count(T,X,Z), Y is Z+1.
count([X1|T],X,Z):- X1 \= X,count(T,X,Z).


delall([],_,[]).
delall([X|T],X,R) :- delall(T,X,R).
delall([Y|T],X,[Y|R]) :- X \= Y, delall(T,X,R).

lneed([],_).
lneed([[_,L2|_]|T],[L2|X]):-lneed(T,X).

lcount([],[]).
lcount([H|T],[[H,Z]|R]) :- count([H|T],H,Z), delall(T,H,Q),
      lcount(Q,R).

listLen([], 0):-!.
listLen([_|Y],Z):-listLen(Y,Z1), Z is Z1+1.

% �������� ���������
result(List,L1,L2):-delete_list(List,L1),
      lcount(List,L3), lneed(L3,L2), listLen(L2,_).

%%%%%%%%% �������������� ������� � 2. ���������� ������ %%%%%%%%
% � ����� ����� ����� �� �������, ����������, ��������,
% ���������, ����������� � ������������ ����� ���� ��� ������� �
% �������, �������� � �������.
% ������ �� ��� ���������� ��� ��������.
% ������� � ������� ������������ ����� � ������ �� ����. �������
% �������� ������ ������� ����������. ������� � ����� �������.
% � ����������� ������ ���� �� ���������� � ��������,
% � ������� � � ������� ������������ �����.
% � ����������� �������, ��������� � ������� ����������� ����a
% ���� �� �������. ����� �������� ��������� ������ �������?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% morozov, tokarev, vasilev
% bio, geo, eng, fra, his, mat
%

unique([]):-!.
unique([H|T]):- member(H,T),!,fail.
unique([_|T]):- unique(T).

lesson(bio).
lesson(fra).
lesson(eng).
lesson(his).
lesson(math).
lesson(geo).

teachers(Res):-
Res = [(morozov,XL1,XL2),
       (vasilev,YL1,YL2),
       (tokarev,ZL1,ZL2)],

      lesson(XL1),lesson(XL2),
      lesson(YL1),lesson(YL2),
      lesson(ZL1),lesson(ZL2),
      unique([XL1,XL2,YL1,YL2,ZL1,ZL2]),

      not(member((_,geo,fra),Res)),
      not(member((_,fra,geo),Res)),
      not(member((tokarev,bio;_,fra;_),Res)),
      not(member((tokarev,fra;_,bio;_),Res)),
      not(member((_,bio,fra),Res)),
      not(member((_,fra,bio),Res)),
      not(member((morozov,bio,_),Res)),
      not(member((morozov,_,bio),Res)),
      not(member((_,bio,math),Res)),
      not(member((_,math,bio),Res)),
      not(member((_,eng,math),Res)),
      not(member((_,math,eng),Res)),
      not(member((morozov,_,eng),Res)),
      not(member((morozov,eng,_),Res)),
      not(member((morozov,_,math),Res)),
      not(member((morozov,math,_),Res)),!.

