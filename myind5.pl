% main file

run:- consult('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    retractall(crew/2),retractall(style/2),
    retractall(dancer/4).

% �������� ��������
showDancers:- run, nl, style(A,B), crew(C,D),
    dancer(_, C, A, X),
    write("���: "), writeln(X),
    write("�����: "), writeln(B),
    write("�������: "), writeln(D), nl, fail.

% �������� �����
showStyles:-run, nl, style(_,X),
    write("�����: "), writeln(X),nl, fail.

% �������� ������
showCrews:-run, nl, crew(_,X),
    write("�������� �������: "), writeln(X), nl, fail.

% �������� �����
addStyle:-writeln("���������� �����"),
    write("ID: "), read(X),
    write("��������: "), read(Y),
    assertz(style(X,Y)),
    tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('����� ������� ��������'),nl.

% �������� �������
addCrew:-writeln("���������� �������"),
    write("ID: "), read(X),
    write("��������: "), read(Y),
    assertz(crew(X,Y)),
    tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('������� ������� ���������'),nl.

% �������� �������
addDancer:-writeln("���������� �������"),
   write("ID �������:"), read(X),
   write("ID �������: "), read(Y),
   write("ID �����: "), read(Z),
   write("���: "), read(W),
   assertz(dancer(X,Y,Z,W)),
   tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
   listing(crew), listing(style), listing(dancer),
   told, write('������ ������� ��������'),nl.

% ������� �����
delStyle:-writeln("������� �����"),
    write("ID �����: "),read(X),
    retract(style(X,_)),
    retractall(dancer(_,_,X,_)),
    writeln("����� ������� ������"),
    tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('������� ������ ���������'),nl.

% ������� �������
delCrew:-writeln("������� �������"),
    write("ID �������: "),read(X),
    retract(crew(X,_)),
    retractall(dancer(_,X,_,_)),
    writeln("������� ������� �������"),
    tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('������� ������ ���������'),nl.

% ������� �������
delDancer:-writeln("������� �������"),
    write("ID �������: "),read(X),
    retract(dancer(X,_,_,_)),
    writeln("������ ������� ������"),
    tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('������� �������� ���������'),nl.

% ���������� ����
save:- tell('C:/Users/hieut/OneDrive/���������/Prolog/db.pl'),
    listing(crew),listing(style),listing(dancer),
    told, write('���� ���������'),nl,fail.

