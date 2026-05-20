:- consult('Task-1.2.pl').
:- initialization(main, main).

main :-
    write('Test 3 (hard): zeros and negative numbers'), nl,
    split_pow2([0,-4,1,2,16,15], Pow, NotPow),
    write('Powers of 2: '), write(Pow), nl,
    write('Others:      '), write(NotPow), nl,
    write('Expected:    [1,2,16] and [0,-4,15]'), nl.
