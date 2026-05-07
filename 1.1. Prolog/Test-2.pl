:- consult('Task-1.1.pl').
:- initialization(main, main).

main :-
    write('Тест 2 (легкий): порожній перший список'), nl,
    remove_twice([], [1,1,2,2,3], R),
    write('Результат:  '), write(R), nl,
    write('Очікується: []'), nl.
