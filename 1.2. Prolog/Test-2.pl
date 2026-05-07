:- consult('Task-2.1.pl').
:- initialization(main, main).

main :-
    write('Тест 2 (легкий): порожній список'), nl,
    split_pow2([], Pow, NotPow),
    write('Степені 2:   '), write(Pow), nl,
    write('Інші:        '), write(NotPow), nl,
    write('Очікується:  [] та []'), nl.
