:- consult('Task-1.1.pl').
:- initialization(main, main).

main :-
    write('Test 2 (easy): empty first list'), nl,
    remove_twice([], [1,1,2,2,3], R),
    write('Result:   '), write(R), nl,
    write('Expected: []'), nl.
