:- consult('Task-1.1.pl').
:- initialization(main, main).

main :-
    write('Тест 3 (важкий): елемент двічі у першому і двічі у другому'), nl,
    remove_twice([1,1,2,3,3], [1,1,3,3], R),
    write('Результат:  '), write(R), nl,
    write('Очікується: [2]'), nl.
