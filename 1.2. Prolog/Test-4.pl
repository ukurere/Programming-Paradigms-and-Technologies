:- consult('Task-1.2.pl').
:- initialization(main, main).

main :-
    write('Test 4 (hard): large powers of 2 among other numbers'), nl,
    split_pow2([64,100,128,200,256], Pow, NotPow),
    write('Powers of 2: '), write(Pow), nl,
    write('Others:      '), write(NotPow), nl,
    write('Expected:    [64,128,256] and [100,200]'), nl.
