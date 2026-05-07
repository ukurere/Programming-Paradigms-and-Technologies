:- consult('Task-3.1.pl').
:- initialization(main, main).

main :-
    write('Тест 4 (важкий): три піки — чотири підсписки'), nl,
    split_peaks([2,5,1,4,3,6,1], R),
    write('Результат:   '), write(R), nl,
    write('Очікується:  [[2,5],[1,4],[3,6],[1]]'), nl.
