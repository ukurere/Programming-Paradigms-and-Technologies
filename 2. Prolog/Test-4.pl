:- consult('Task-2.pl').
:- initialization(main, main).

main :-
    write('Test 4 (hard): three peaks - four sublists'), nl,
    split_peaks([2,5,1,4,3,6,1], R),
    write('Result:   '), write(R), nl,
    write('Expected: [[2,5],[1,4],[3,6],[1]]'), nl.
