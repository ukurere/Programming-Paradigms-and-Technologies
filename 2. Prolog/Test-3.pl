:- consult('Task-3.1.pl').
:- initialization(main, main).

main :-
    write('Тест 3 (важкий): два піки — три підсписки'), nl,
    split_peaks([1,5,2,4,3], R),
    write('Результат:   '), write(R), nl,
    write('Очікується:  [[1,5],[2,4],[3]]'), nl.
