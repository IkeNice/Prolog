% main file

run:- consult('C:/Users/hieut/OneDrive/Документы/Prolog/db.pl'),
    retractall(crew/2),retractall(style/2),
    retractall(dancer/4).

% показать танцоров
showDancers:- run, nl, style(A,B), crew(C,D),
    dancer(_, C, A, X),
    write("Имя: "), writeln(X),
    write("Стиль: "), writeln(B),
    write("Команда: "), writeln(D), nl, fail.

% показать стили
showStyles:-run, nl, style(_,X),
    write("Стиль: "), writeln(X),nl, fail.

% показать комады
showCrews:-run, nl, crew(_,X),
    write("Название команды: "), writeln(X), nl, fail.

% добавить стиль
addStyle:-writeln("Добавление стиля"),
    write("ID: "), read(X),
    write("Название: "), read(Y),
    assertz(style(X,Y)),
    tell('C:/Users/hieut/OneDrive/Документы/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('Стиль успешно добавлен'),nl.

% добавить команду
addCrew:-writeln("Добавление команды"),
    write("ID: "), read(X),
    write("Название: "), read(Y),
    assertz(crew(X,Y)),
    tell('C:/Users/hieut/OneDrive/Документы/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('Команда успешно добавлена'),nl.

% добавить танцора
addDancer:-writeln("Добавление танцора"),
   write("ID танцора:"), read(X),
   write("ID команды: "), read(Y),
   write("ID стиля: "), read(Z),
   write("Имя: "), read(W),
   assertz(dancer(X,Y,Z,W)),
   tell('C:/Users/hieut/OneDrive/Документы/Prolog/db.pl'),
   listing(crew), listing(style), listing(dancer),
   told, write('Танцор успешно добавлен'),nl.

% удалить стиль
delStyle:-writeln("Удалить стиль"),
    write("ID стиля: "),read(X),
    retract(style(X,_)),
    retractall(dancer(_,_,X,_)),
    writeln("Стиль успешно удален"),
    tell('C:/Users/hieut/OneDrive/Документы/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('Таблица стилей обновлена'),nl.

% удалить команду
delCrew:-writeln("Удалить команду"),
    write("ID команды: "),read(X),
    retract(crew(X,_)),
    retractall(dancer(_,X,_,_)),
    writeln("Команда успешно удалена"),
    tell('C:/Users/hieut/OneDrive/Документы/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('Таблица команд обновлена'),nl.

% удалить танцора
delDancer:-writeln("Удалить танцора"),
    write("ID танцора: "),read(X),
    retract(dancer(X,_,_,_)),
    writeln("Танцор успешно удален"),
    tell('C:/Users/hieut/OneDrive/Документы/Prolog/db.pl'),
    listing(crew), listing(style), listing(dancer),
    told, write('Таблица танцоров обновлена'),nl.

% сохранение базы
save:- tell('C:/Users/hieut/OneDrive/Документы/Prolog/db.pl'),
    listing(crew),listing(style),listing(dancer),
    told, write('База сохранена'),nl,fail.

