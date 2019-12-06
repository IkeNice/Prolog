%читаем факты из файла
filetolist(F,L):-seen,see(F), readfile([],[],L),seen.
readfile(T,R,L):-get0(X),(X<0,(T=[],L=R;
 name(T1,T),append(R,[T1],L)),!;
                         (X=32; X=10; X=13),
                         (T=[], readfile(T,R,L);name(T1,T),
                         append(R,[T1],R1),
                          readfile([],R1,L)),!;
                         X>0, append(T,[X],T1),readfile(T1,R,L),!).
%запись фактов в базу.
wrt([]).
wrt([L1|L]):-assert(L1),wrt(L).
full(F):-see(F),filetolist(F,L),seen, write(L), wrt(L).

% ------------------------------------------------------------------------
:-dynamic workerb/4.
:-dynamic deptb/2.
:-dynamic taskb/3.
%ТАБЛИЦА "РАБОТНИКИ"(id, Имя, возраст, id отдела)(зависимая)
worker(1,'Ivan',23,2).
worker(2,'Petr',30,1).
worker(3,'Sergey',35,1).
worker(4,'Oleg',22,3).
worker(5,'Evgeny',20,3).
worker(6,'Fedor',25,2).
%ТАБЛИЦА "ОТДЕЛЫ"(id, Наименование).(независимая)
dept(1,'Administration').
dept(2,'Accounting').
dept(3,'Manufactory').
%ТАБЛИЦА "ЗАДАЧИ"(id, id работника, Описание) (зависимая)
task(1,5,'Unloading goods').
task(2,3,'Accept a new employee').
task(3,6,'Make report').
%запись в базу.
workers:- worker(X,Y,Z,T),
    assert(workerb(X,Y,Z,T)), fail.
depts:- dept(X,Y),
    assert(deptb(X,Y)), fail.
tasks:- task(X,Y,Z),
    assert(taskb(X,Y,Z)), fail.
%красивый вывод таблиц.
show_worker:-write('ID:   '), write('NAME:   '), write('AGE:   '),
    write('DEPT:   '), write('\n'),prnt_worker.
prnt_worker:-workerb(X,Y,Z,T),
             write(X),write('   '),
             write(Y),write('   '),
             write(Z),write('   '),
             deptb(T,K), write(K), write('\n'),fail.

show_dept:-write('ID:   '), write('NAME:   '), write('\n'),prnt_dept.
prnt_dept:-deptb(X,Y),
             write(X),write('   '),
             write(Y),write('   '),
             write('\n'),fail.
show_task:-write('ID:   '), write('WORKER:   '), write('DESCRIPTION:'),
    write('\n'),prnt_task.
prnt_task:-taskb(X,Y,Z),
             write(X),write('   '),
             workerb(Y,N,_,_), write(N),write('   '),
             write(Z),write('   '),
             write('\n'),fail.
%процедуры добавления записей
add_worker(X,Y,Z,T):- assert(workerb(X,Y,Z,T)).
add_dept(X,Y):- assert(deptb(X,Y)).
add_task(X,Y,Z):- assert(taskb(X,Y,Z)).
% процедуры изменения записей (ничего умнее, чем удалять факты, а потом
% перезаписывать я не придумала).
change_worker(X,Y,Z,T):-retract(workerb(X,_,_,_)),assert(workerb(X,Y,Z,T)).
change_dept(X,Y):-retract(deptb(X,_)),assert(deptb(X,Y)).
change_task(X,Y,Z):-retract(taskb(X,_,_)),assert(taskb(X,Y,Z)).
% процедуры удалиения записей (можно удалять по чему угодно, не только
% по ID.
del_worker(X,Y,Z,T):-retract(workerb(X,Y,Z,T)).
del_dept(X,Y):-retract(deptb(X,Y)).
del_task(X,Y,Z):-retract(taskb(X,Y,Z)).
%запрос первый select ID,NAME,AGE from worker where AGE>X;
select_worker(F):-write('ID:   '), write('NAME:   '), write('AGE:   '),
                  write('\n'),
                  slct_worker(F).
slct_worker(F):-workerb(X,Y,Z,_), Z>F,
             write(X),write('   '),
             write(Y),write('   '),
             write(Z),write('   '), write('\n'),fail.
% вывести список задач, с указанием работника, его возраста и отдела, в
% котором работает работник
select_task:-write('NAME:   '), write('AGE:   '),write('DEPT:   '),
             write('TASK:    '), write('\n'),select_task(1).
select_task(X):-taskb(X,R,T),worker(R,N,A,I),deptb(I,D),
             write(N), write('   '),
             write(A), write('   '),
             write(D), write('   '),
             write(T), write('   '), write('\n'),
             X1 is X+1, select_task(X1).

%вывести все отделы, с чётным Id
select_dept:-write('ID:   '), write('NAME:   '), write('\n'),slct_dept.
slct_dept:-deptb(X,Y),X1 is X mod 2, X1=0,
           write(X), write('   '), write(Y), write('   '),write('\n'),fail.



%пишет таблицу в файл, первый список L1 - шапки, L2 - строки таблицы
file_writer(L1,L2,File):-tell(File),length(L1,L),line(L1,L),
            body_writer(L2,L),told.
%записывает в строку список через пробельчики, L - длина списка
line(L1,L):-line(L1,L,0).
line(_,X,X):-write('\n').
line([E|E1],L,X):-write(E),write('   '),X1 is X+1,line(E1,L,X1).


% добавляет в таблицу записи, хранимые в отдельном списке, L - длина
body_writer([],_).
body_writer(L2,L):-body_writer(L2,L,[],0).
body_writer(F,X,R,X):-reverse(R,RES),line(RES,X),body_writer(F,X).
body_writer([E|E1],L,X,Y):-Y1 is Y+1,body_writer(E1,L,[E|X],Y1).
revers(List, ReverseList):-reverse(List, [], ReverseList).
revers([], Buffer, Buffer):-!.
revers([Head|Tail], Buffer, ReverseList):-reverse(Tail, [Head|Buffer], ReverseList).
