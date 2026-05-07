:- consult('Task-2.1.pl').
:- initialization(main, main).

main :-
    write('Тест 1 (легкий): базовий випадок'), nl,
    split_pow2([1,2,3,4,5,6,7,8], Pow, NotPow),
    write('Степені 2:   '), write(Pow), nl,
    write('Інші:        '), write(NotPow), nl,
    write('Очікується:  [1,2,4,8] та [3,5,6,7]'), nl.
