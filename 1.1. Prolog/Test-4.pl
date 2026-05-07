:- consult('Task-1.1.pl').
:- initialization(main, main).

main :-
    write('Тест 4 (важкий): елемент тричі у другому — не вилучається'), nl,
    remove_twice([1,2,3,4], [1,1,1,2,2,3,3,3], R),
    write('Результат:  '), write(R), nl,
    write('Очікується: [1,3,4]'), nl.
