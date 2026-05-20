:- consult('Task-1.2.pl').
:- initialization(main, main).

main :-
    write('Test 2 (easy): empty list'), nl,
    split_pow2([], Pow, NotPow),
    write('Powers of 2: '), write(Pow), nl,
    write('Others:      '), write(NotPow), nl,
    write('Expected:    [] and []'), nl.
