:- consult('Task-1.1.pl').
:- initialization(main, main).

main :-
    write('Test 1 (easy): basic case'), nl,
    remove_twice([1,2,3,4,5], [1,1,2,3,3,4], R),
    write('Result:   '), write(R), nl,
    write('Expected: [2,4,5]'), nl.
