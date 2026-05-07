:- consult('Task-2.1.pl').
:- initialization(main, main).

main :-
    write('Тест 3 (важкий): нулі та від''ємні числа'), nl,
    split_pow2([0,-4,1,2,16,15], Pow, NotPow),
    write('Степені 2:   '), write(Pow), nl,
    write('Інші:        '), write(NotPow), nl,
    write('Очікується:  [1,2,16] та [0,-4,15]'), nl.
