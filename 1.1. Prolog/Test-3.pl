:- consult('Task-1.1.pl').
:- initialization(main, main).

main :-
    write('Test 3 (hard): duplicates in first list'), nl,
    remove_twice([1,1,2,3,3], [1,1,3,3], R),
    write('Result:   '), write(R), nl,
    write('Expected: [2]'), nl.
