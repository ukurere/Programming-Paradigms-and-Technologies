:- consult('Task-2.pl').
:- initialization(main, main).

main :-
    write('Test 3 (hard): two peaks - three sublists'), nl,
    split_peaks([1,5,2,4,3], R),
    write('Result:   '), write(R), nl,
    write('Expected: [[1,5],[2,4],[3]]'), nl.
