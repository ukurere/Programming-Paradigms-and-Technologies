:- consult('Task-1.2.pl').
:- initialization(main, main).

main :-
    write('Test 1 (easy): basic case'), nl,
    split_pow2([1,2,3,4,5,6,7,8], Pow, NotPow),
    write('Powers of 2: '), write(Pow), nl,
    write('Others:      '), write(NotPow), nl,
    write('Expected:    [1,2,4,8] and [3,5,6,7]'), nl.
