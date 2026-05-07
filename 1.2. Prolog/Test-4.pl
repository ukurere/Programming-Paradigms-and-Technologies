:- consult('Task-2.1.pl').
:- initialization(main, main).

main :-
    write('Тест 4 (важкий): великі степені двійки серед інших чисел'), nl,
    split_pow2([64,100,128,200,256], Pow, NotPow),
    write('Степені 2:   '), write(Pow), nl,
    write('Інші:        '), write(NotPow), nl,
    write('Очікується:  [64,128,256] та [100,200]'), nl.
