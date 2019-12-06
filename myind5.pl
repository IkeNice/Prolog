% main file

run:- consult('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    retractall(crew/2),retractall(style/2),
    retractall(dancer/4).

% �������� ��������
showDancers:- run, nl, style(A,B), crew(C,D),
    dancer(_, A, C, X),
    write("���: "), writeln(X),
    write("�����: "), writeln(B),
    write("�������: "), writeln(D), nl, fail.

% �������� �����
showStyle:-run, nl, style(_,X),
    write("�����: "), writeln(X),nl, fail.

% �������� ������
showCrew:-run, nl, crew(_,X),
    write("�������� �������: "), writeln(X), nl, fail.

% �������� �����
addStyle:-writeln("���������� �����"),
    write("ID: "), read(X),
    write("��������: "), read(Y),
    assertz(style(X,Y)),
    tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('������� ������ ���������'),nl.

% �������� �������
addCrew:-writeln("���������� �������"),
    write("ID: "), read(X),
    write("��������: "), read(Y),
    assertz(crew(X,Y)).

% �������� �������
addDancer:-writeln("���������� �������"),
   write("ID �������:"), read(X),
   write("ID �������: "), read(Y),
   write("ID �����: "), read(Z),
   write("���: "), read(W),
   assertz(dancer(X,Y,Z,W)).

% ������� �����
delStyle:-writeln("������� �����"),
    write("ID �����: "),read(X),
    retract(style(X,_)),
    retract(dancer(_,_,X,_)),
    writeln("����� ������"),
    tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('������� ������ ���������'),nl.

% ���������� ����
save:- tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    listing(crew),listing(style),listing(dancer),
    told, write('���� ���������'),nl,fail.

