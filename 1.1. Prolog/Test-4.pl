:- consult('Task-1.1.pl').
:- initialization(main, main).

main :-
    write('Test 4 (hard): element 3 times in second - not removed'), nl,
    remove_twice([1,2,3,4], [1,1,1,2,2,3,3,3], R),
    write('Result:   '), write(R), nl,
    write('Expected: [1,3,4]'), nl.
