:- consult('Task-1.1.pl').
:- initialization(main, main).

main :-
    write('Тест 1 (легкий): базовий випадок'), nl,
    remove_twice([1,2,3,4,5], [1,1,2,3,3,4], R),
    write('Результат:  '), write(R), nl,
    write('Очікується: [2,4,5]'), nl.
