:- consult('Task-3.1.pl').
:- initialization(main, main).

main :-
    write('Тест 1 (легкий): приклад з умови задачі'), nl,
    split_peaks([5,4,2,8,3,1,2,6,9,5], R),
    write('Результат:   '), write(R), nl,
    write('Очікується:  [[5],[4,2,8],[3,1,2,6,9],[5]]'), nl.
