:- consult('Task-3.1.pl').
:- initialization(main, main).

main :-
    write('Тест 2 (легкий): один пік у середині'), nl,
    split_peaks([1,3,2], R),
    write('Результат:   '), write(R), nl,
    write('Очікується:  [[1,3],[2]]'), nl.
